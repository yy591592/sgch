<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/20
 * Time: 16:42
 */

namespace app\common\model;
class Address extends Common
{
    protected $table = "jmx_address";


    public function GetTypeAttr($value)
    {
        $status = [1=>'家',2=>'公司',3=>'常用地址'];
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