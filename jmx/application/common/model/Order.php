<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/20
 * Time: 16:42
 */

namespace app\common\model;
use think\Db;
class Order extends Common
{
    protected $table = "jmx_order";


    public function GetTypeAttr($value)
    {
        $status = [0=>'',1=>'帮代购',2=>'帮取送',3=>'帮排队',4=>'万能跑腿'];
        return $status[$value];
    }

    public function GetProcessAttr($value)
    {
        $status = [0=>'待支付',1=>'待接单',2=>'进行中',3=>'已完成',4=>'已退款'];
        return $status[$value];
    }



    public function GetUidAttr($value)      //获取用户名
    {
        $action = request()->action();
        switch ($action) {
            case "getlist":
                $map["id"] = $value;
                $nickname = model("user")->getOneData($map, "nickname")['nickname'];
                return $nickname;
                break;
            case "add":
                $map["id"] = $value;
                $nickname = model("user")->getOneData($map, "nickname")['nickname'];
                return $nickname;
                break;
            case "index":
                $map["id"] = $value;
                $user = model("user")->getOneData($map, "nickname,avartar");
                return ["uid" => $value, "nickname" => $user["nickname"], "avartar" => $user["avartar"]];
                break;
        }
    }

}