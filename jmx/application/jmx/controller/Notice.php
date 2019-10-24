<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/21
 * Time: 14:26
 */

namespace app\jmx\controller;
/**
 * Class Coach
 * @package app\jmx\controller
 * 定义通知公告控制器
 */
class Notice extends Common
{
    public $table = "JmxNotice";
    public $title = "通知公告管理";

    /**
     * @return array|void
     * 数据列表查询条件
     */
    public function map()
    {
        $map = [];
        $params = $this->request->param();
        if (!empty($params["name"])) {
            $map[] = ["name", "like", "%" . $params["name"] . "%"];
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
        $data['createtime']=date('Y-m-d',time());
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