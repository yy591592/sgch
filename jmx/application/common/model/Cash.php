<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/23
 * Time: 10:51
 */

namespace app\common\model;
/**
 * Class User
 * @package app\common\model
 * 定义用户模型
 */

use think\Db;

class Cash extends Common
{
    public $table = "jmx_cash";


    public function GetStatusAttr($value)
    {
        $status = [0=>"未提现",1 => '已提现'];
        return $status[$value];

    }

    public function getUidAttr($value)
    {
        $action = request()->action();
        switch ($action) {
            case "getlist":
                $map["id"] = $value;
                $value = model("user")->getOneData($map, "nickname")['nickname'];
                break;
        }
        return $value;
    }




}