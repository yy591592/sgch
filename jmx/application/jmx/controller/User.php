<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/21
 * Time: 14:26
 */

namespace app\jmx\controller;

use think\Db;

/**
 * Class Coach
 * @package app\jmx\controller
 * 定义会员控制器
 */
class User extends Common
{
    public $table = "jmxUser";
    public $title = "用户管理";

    /**
     * @return array|void
     * 数据列表查询条件
     */
    public function map()
    {
        $map = [];
        $params = $this->request->param();

        if (!empty($params["name"])) {
            $map[] = ["nickname", "like", "%" . $params["name"] . "%"];
        }

        return $map;
    }

    public function add()
    {

        $id = $this->request->param("id");

        $this->applyCsrfToken();
        $map["id"] = $id;
        $data = $this->model->getOneData($map);
        $maps = [];
        $maps[] = ['min', '<=', $data['integral']];
        $maps[] = ['max', '>=', $data['integral']];
        $achievement = Db::table('jmx_achievement')->where($maps)->find();

        $data['achievement'] = $achievement['classname'];

        $this->assign("data", $data);
        $this->_form($this->table, 'form');
    }

    public function edit()
    {
        $id = $this->request->param("id");
        $data = $this->request->except($this->except);
        $data['createtime'] = time();
        if (isset($data['is_run']) == 'on') {
            $data['is_run'] = 1;
        } else {
            $data['is_run'] = 0;
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


    public function authentication()    //跑腿员认证
    {
        $this->fetch();
    }


    public function auth_list()   //跑腿员认证列表
    {

        $params = $this->request->param();
        if (!empty($params["name"])) {
            $map[] = ["nickname", "=", $params["name"]];
        }
        $map[] = ["is_apply", "=", 1];
        $result = $this->model->getList($map, $this->page, $this->limit, $this->field, $this->order);

        return json(["code" => 0, "count" => $result["count"], "data" => $result["list"], "pages" => $result["pages"]]);
    }

    public function switchs()
    {
        $param = $this->request->param();
        $map["id"] = $param["id"];
        $data["is_run"] = $param["valid"];
        $result = $this->model->edit($data, $map);
        if ($result["code"] == 0) {
            return json(["status" => "success", "msg" => "操作成功", "data" => $result["data"]]);
        } else {
            return json(["status" => "fail", "msg" => "操作失败", "error" => $result["error"]]);
        }

    }


}