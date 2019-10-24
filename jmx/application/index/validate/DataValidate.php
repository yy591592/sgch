<?php

/**
 * 自定义验证器类
 */

namespace app\index\validate;

use think\Validate;
use think\Db;

class DataValidate extends Validate
{

    protected $rule = [
        'tel' => 'require|mobile',
        'code' => 'require|checkCode',
        'sex' => 'require',
        'birthday' => 'require',
        'height' => 'require',
        'weight' => 'require',
        'content' => 'require',
    ];  //验证规则
    protected $message = [
        'tel.require' => '手机号码不能为空',
        'tel.mobile' => '手机号码格式错误',
        'code.require' => '短信验证码不能为空',
        'sex.require' => '请选择性别',
        'birthday.require' => '请选择生日',
        'height.require' => '请选择身高',
        'weight.require' => '请选择体重',
        'content.require' => '评价内容不能为空'
    ];  //验证提示
    protected $scene = [
        'code' => ['tel'],
        'tel' => ['tel'],
        'user_info' => ['sex', 'birthday', 'height', 'weight'],
        'evaluate' => ['content']
    ];  //验证场景

    /**
     * 自定义手机短信验证码验证
     */
    public function checkCode($value)
    {
        $tel = request()->param('tel');
        $sms_code = Db::table('gym_sms_code')->where(['tel' => $tel])->order('id DESC')->find();
        if (!empty($sms_code) && $sms_code['code'] == $value) {
            if ($sms_code['expire_time'] > time()) {
                return true;
            } else {
                return '短信验证码已过期';
            }
        } else {
            return '短信验证码错误';
        }
    }

    /**
     * 自定义邮箱验证码验证
     */
    public function checkEmailCode($value)
    {
        $email = request()->param('email');
        $sms_code = db('sms_code')->where(['tel' => $email, 'type' => 'email'])->order('id DESC')->find();
        if (!empty($sms_code) && $sms_code['code'] == $value) {
            if ($sms_code['expire_time'] > time()) {
                return true;
            } else {
                return '邮箱验证码已过期';
            }
        } else {
            return '邮箱验证码错误';
        }
    }

    /**
     * 银行卡验证
     * @param type $s
     * @return type
     */
    public function luhm($value)
    {
        $value = str_replace(' ', '', $value);
        $n = 0;
        $ns = strrev($value); // 倒序
        for ($i = 0; $i < strlen($value); $i++) {
            if ($i % 2 == 0) {
                $n += $ns[$i]; // 偶数位，包含校验码
            } else {
                $t = $ns[$i] * 2;
                if ($t >= 10) {
                    $t = $t - 9;
                }
                $n += $t;
            }
        }
        return ($n % 10) == 0;
    }

    /**
     * 字符串验证
     * @param $value
     */
    public function checkStr($value)
    {
        if (!preg_match("/^[\x{4e00}-\x{9fa5}A-Za-z，,。.！!？?、《》]+$/u", $value)) {
            return false;
        } else {
            return true;
        }
    }
}
