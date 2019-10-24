<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/21
 * Time: 14:26
 */

namespace app\jmx\controller;
/**
 * Class OrderBuy
 * @package app\jmx\controller
 * 定义帮代购订单管理
 */
class Order extends Common
{
    public $table = "JmxOrder";
    public $title = "订单管理";

    /**
     * @return array|void
     * 数据列表查询条件
     */
    public function map()
    {

        $map = [];
        $params = $this->request->param();
        if (!empty($params["order_number"])) {
            $map[] = ["order_number", "=", $params["order_number"]];
        }
        if (!empty($params["type"])) {
            $map[] = ["type", "=", $params["type"]];
        }

        return $map;
    }

    /**
     * 执行添加入库
     * @auth true
     */
    public function edit()
    {
        $id = $this->request->param("id");
        $data = $this->request->except($this->except);
        if (isset($data['status']) == 'on') {
            $data['status'] = 1;
        } else {
            $data['status'] = 0;
        }
        if (empty($id)) {
            $result = $this->model->add($data);
            if ($result["code"] == 0) {
                return json(["status" => "success", "msg" => "添加成功", "data" => $result["data"]]);
            } else {
                return json(["status" => "fail", "msg" => "添加失败", "error" => $result["error"]]);
            }
        } else {
            $map["id"] = $id;
            $result = $this->model->edit($data, $map);
            if ($result["code"] == 0) {
                return json(["status" => "success", "msg" => "编辑成功", "data" => $result["data"]]);
            } else {
                return json(["status" => "fail", "msg" => "编辑失败", "error" => $result["error"]]);
            }
        }
    }


}