<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/20
 * Time: 12:02
 */

namespace app\jmx\controller;

use think\Db;

class Category extends Common
{
    public $table = "jmxCategory";
    public $title = "课程类型";

    /**
     * 添加系统权限
     * @auth true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function add()
    {
        $id = $this->request->param("id");
        $this->applyCsrfToken();
        $map["id"] = $id;
        $data = Db::name("jmx_category")->where($map)->find();
        if ($data["pid"] != 0) {
            $data["parentName"] = Db::name("jmx_category")->where(["id" => $data["pid"]])->value("typename");
        }
        $this->assign("data", $data);
        $this->_form($this->table, 'form');
    }

    /**
     * 获取分类树状列表
     * @auth true
     */
    public function getCategoryTreeList()
    {
        $pid = $this->request->param('pid');
        $result = $this->model->GetCategoryTreeList($pid);
        return json(["code" => 0, "data" => $result]);
    }

    /**
     * 获取分类列表
     * @auth true
     */
    public function getCategoryList()
    {
        $result = $this->model->getCategoryList();
        return json(["code" => 0, "data" => $result]);
    }


}
