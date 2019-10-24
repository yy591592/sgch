<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/26
 * Time: 17:46
 */

namespace app\index\controller;
/**
 * Class Category
 * @package app\index\controller
 * 定义类型控制器
 */
use think\Db;

class Category extends Common
{
    protected $middleware = ["Auth"];

    /**
     * @return array|void
     * 列表查询条件
     */
    public function map()
    {
        $map = [];
        $params = $this->request->param();
        if (!empty($params["pid"])) {
            $map["pid"] = $params["pid"];
        }
        return $map;
    }

    /**
     * @return array|void
     * 时段选择
     */
    public function timeslot()
    {
//        dump(123);die;
        $params = $this->request->param();
        $result = Db::table("gym_category_timeslot")->where("id" >0)->select();
        return json(["status" => "success",  "data" => $result]);
    }


}