<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/20
 * Time: 16:42
 */

namespace app\common\model;


class Course extends Common
{
    protected $table = "gym_course";

    public $method_name = "coach";

    /**
     * @return Common
     * 定义模型关联的方法
     */
    public function coach()
    {
        return $this->belongsTo("Coach");
    }

    /**
     * @param $value
     * 获取教练名称
     */
    public function getCoachIdAttr($value)
    {
        $action = request()->action();
        switch ($action) {
            case "getlist":
                $map["id"] = $value;
                $value = model("coach")->getOneData($map, "name")["name"];
                break;
        }
        return $value;
    }

    /**
     * @param $value
     * 格式化课程日期
     */
    public function getWeekAttr($value)
    {
        $action = request()->action();
        $week = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"];
        switch ($action) {
            case "getlist":
                $value = $week[$value];
                break;
        }
        return $value;
    }

    /**
     * 启用预留字段进行数据运算
     */
    public function getReserveFieldAttr($value, $data)
    {
        $action = request()->action();
        switch ($action) {
            case "index":
                break;
            case "detail":
                break;
        }
//        $quota = $data["quota"];    //课程可预约名额
//        $order_quota = $data["order_quota"];    //课程已预约名额
//        $status = 1;    //课程状态，1为可以预约
//        if ($quota - $order_quota < 8) {   //如果剩余名额不足10，那么提示名额紧张
//            $status = 2;    //2为课程紧张
//        }
//        if ($quota == $order_quota) { //课程所有名额已全部被预定
//            $status = 3;    //3为课程已满员
//        }
//        $end_status = 0;
//        if ($data["endtime"] < time()) {  //课程已结束
//            $end_status = 1;    //课程已结束
//            $status = 0;    //课程状态为 不可预约
//        }
//        return ["status" => $status, "end_status" => $end_status];
    }
}