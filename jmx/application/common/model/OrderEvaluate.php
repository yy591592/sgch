<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/27
 * Time: 15:38
 */

namespace app\common\model;
/**
 * Class CourseEvaluate
 * @package app\common\model
 * 定义评价模型
 */

use think\Db;

class OrderEvaluate extends Common
{
    public $table = "jmx_order_evaluate";


    public function GetUidAttr($value)          //获取 用户名
    {
        $action = request()->action();
        switch ($action) {
            case "getlist":
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

    public function GetStatusAttr($value)
    {
        $status = [0 => '',1 => '满意', 2 => '不满意'];
        return $status[$value];

    }

    public function GetStarAttr($value)
    {
        $status = [0 => '', 1 => '一颗星', 2 => '二颗星', 3 => '三颗星', 4 => '四颗星', 5 => '五颗星'];
        return $status[$value];

    }


//
//    public function GetCourseIdAttr($value)     //获取 课程名
//    {
//        $data = Db::name("gym_course")->where(['id' => $value])->select();
//        foreach ($data as $k => $v) {
//            $value = $v['title'];
//
//            return $value;
//        }
//    }
//

}