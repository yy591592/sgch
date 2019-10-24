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
class Address extends Common
{
    public $table = "JmxAddress";
    public $title = "发单地址管理";



    public function add()
    {
        $id = $this->request->param("id");
        $this->applyCsrfToken();
        $map["id"] = $id;
        $data = $this->model->getOneData($map);
        $user = model("user")->getList();

        $this->assign("user", $user["list"]);
        $this->assign("data", $data);
        $this->_form($this->table, 'form');
    }

}