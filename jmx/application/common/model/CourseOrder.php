<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/26
 * Time: 17:48
 */

namespace app\common\model;
use think\Db;

/**
 * Class CourseOrder
 * @package app\common\model
 * 定义用户预约课程模型
 */
class CourseOrder extends Common
{
    public $table = "gym_course_order";

    public function GetPayStatusAttr($value)
    {
        $status = [0=>'未支付',1=>'已支付'];
        return $status[$value];
    }


    public function GetUidAttr($value)      //获取用户名
    {
        $data = Db::name("gym_user")->where(['id' => $value])->select();
        foreach ($data as $k => $v) {
            $value = $v['nickname'];
            return $value;
        }
    }


    public function GetCourseIdAttr($value)    //获取课程名
    {
        $data = Db::name("gym_course")->where(['id' => $value])->select();
        foreach ($data as $k => $v) {
            $value = $v['title'];
            return $value;
        }
    }

    public function GetVouchersIdAttr($value)   //获取代金券名
    {
        $data = Db::name("gym_vouchers")->where(['id' => $value])->select();
        foreach ($data as $k => $v) {
            $value = $v['title'];
            return $value;
        }
    }



}