<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/25
 * Time: 11:12
 */

namespace app\common\model;

use think\Db;

/**
 * Class RechargeAmount
 * @package app\gym\controller
 * 用户代金券模型
 */
class UserVouchers extends Common
{
    protected $table = "jmx_user_vouchers";

    public function GetIsUseAttr($value)    //代金券使用状态
    {
        $status = [0=>'未使用',1=>'已使用'];
        return $status[$value];
    }

    public function GetUidAttr($value)      //获取用户名
    {
        $data = Db::name("jmx_user")->where(['id' => $value])->select();
        foreach ($data as $k => $v) {
            $value = $v['nickname'];
            return $value;
        }
    }



}