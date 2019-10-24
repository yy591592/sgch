<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/21
 * Time: 15:58
 */

namespace app\jmx\controller;
/**
 * Class CourseOrder
 * @package app\jmx\controller
 * 定义预约订单控制器
 */
class CourseOrder extends Common
{
    public $table = "jmxCourseOrder";
    public $title = "预约订单管理";

    /**
     * @return array|void
     * 列表数据查询条件
     */
    public function map()
    {
        $map = [];
        $params = $this->request->param();
        if (!empty($params["order_number"])) {
            $map["order_number"] = $params["order_number"];
        }

        return $map;
    }


}