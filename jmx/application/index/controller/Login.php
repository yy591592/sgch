<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/22
 * Time: 9:13
 */

namespace app\index\controller;

use think\Controller;
use think\Db;
use think\session;

class Login extends Common
{

    /**
     * 执行登录
     */

    public function login()
    {
        $code = $this->request->param("code");

        if (!empty($code)) {
            $url = "https://api.weixin.qq.com/sns/jscode2session?appid=" . self::APPID . "&secret=" . self::APPSECRET . "&js_code=" . $code . "&grant_type=authorization_code";
            $result = json_decode(http_curl($url), true);
//            dump($result);die();
            $session_key = $result["session_key"] ?? '';
            $openid = $result["openid"];
            $user = Db::table("jmx_user")->where(["openid" => $openid])->find();   //通过openid获取用户信息

            if (empty($user)) {   //如果用户信息不不存在，那么进行首次注册并登陆
                $data["session_key"] = $session_key;
                $data["openid"] = $openid;
                $data["createtime"] = time();
                $id = Db::table("jmx_user")->insertGetId($data); //注册用户
                //首次注册赠送代金券
                $user_vouchers = [];
                $user_vouchers["uid"] = $id;
                $user_vouchers["name"] = '通用券';
                $user_vouchers["createtime"] = date('Y-m-d', time());
                $user_vouchers["endtime"] = date("Y-m-d", strtotime("+1 month") + 86400);  //设置一个月后个过期
                $user_vouchers["address"] = '郑州市';  //设置一个月后个过期
                $user_vouchers["price"] = 10;

                Db::table("jmx_user_vouchers")->insert($user_vouchers); //用户获得代金券
            } else {
                $data["session_key"] = $session_key;
                $id = $user["id"];
                Db::table("jmx_user")->where(["id" => $id])->update($data);    //更新session_key
            }
            $token_data["rand"] = rand();
            $token_data["session_key"] = $session_key;
            $token_data["openid"] = $openid;
            $token_data["uid"] = $id;
            $token = encryption($token_data);   //用一个随机数、session_key、openid和用户ID进行jwt加密
            Db::table("jmx_user")->where(["id" => $id])->update(["login_token" => $token]);  //更新用户登录凭证
            return json(["status" => "success", "token" => $token]);
        }
    }

    /**
     * 获取短信验证码
     */
    public function getCodeMessage()
    {
        $data = $this->request->param();
        $result = $this->check($data, "code");   //进行数据验证
        if ($result) {
            return $result;
        }
        $tel = $data["tel"];
        $sms_code = db('jmx_sms_code')->where(['tel' => $tel])->order('id DESC')->find(); //获取当前手机号最后获取到的验证码
        if (!empty($sms_code) && $sms_code['expire_time'] > time()) {
            //如果当前手机号码已经获取过验证码，并且尚未过期，那么不准再次获取当前类型的验证码
            return json(["status" => "fail", "errmsg" => "请勿重复获取验证码！"]);
            die;
        }
        $code = rand_string(4, 1);
        $res = $this->smsVerify($tel, $code, 'SMS_174165173');

        if ($res['status'] == 1) {
            $data = [];
            $data['tel'] = $tel;
            $data['code'] = $code;
            $data['send_time'] = time();
            $data['expire_time'] = time() + 300;  //定义验证码过期时间
            Db::name('jmx_sms_code')->insert($data);  //记录获取到的验证码
            return json(["status" => "success", 'msg' => "短信已发送至你的手机，请注意查收"]);
        } else {
            return json(["status" => "fail", "errmsg" => "短信发送失败！"]);
        }

    }
}