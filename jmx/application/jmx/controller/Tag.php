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
class Tag extends Common
{
    public $table = "JmxTag";
    public $title = "标签管理";

    public function add()
    {
        $id = $this->request->param("id");
        $this->applyCsrfToken();
        $map["id"] = $id;
        $data = $this->model->getOneData($map);
        $type = model("tag_type")->getList();
        $this->assign("type", $type["list"]);
        $this->assign("data", $data);
        $this->_form($this->table, 'form');
    }


}