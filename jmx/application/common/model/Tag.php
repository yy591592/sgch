<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/20
 * Time: 16:42
 */

namespace app\common\model;
class Tag extends Common
{
    protected $table = "jmx_tag";


    public function GetTypeAttr($value)
    {
        $status = [1=>'帮代购',2=>'帮取送',3=>'帮排队',4=>'万能跑腿'];
        return $status[$value];
    }

    public function getCidAttr($value)
    {
        $action = request()->action();
        switch ($action) {
            case "getlist":
                $map["id"] = $value;
                $value = model("tag_type")->getOneData($map, "name")["name"];
                break;
        }
        return $value;
    }


}