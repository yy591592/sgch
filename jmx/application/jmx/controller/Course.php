<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/21
 * Time: 15:58
 */

namespace app\jmx\controller;
/**
 * Class Course
 * @package app\jmx\controller
 * 定义课程控制器
 */
class Course extends Common
{
    public $table = "jmxCourse";
    public $title = "课程管理";

    /**
     * @return array|void
     * 列表数据查询条件
     */
    public function map()
    {
        $map = [];
        $params = $this->request->param();
        if (!empty($params["modeid"])) {
            $map["modeid"] = $params["modeid"];
        }
        if (!empty($params["cateid"])) {
            $map["cateid"] = $params["cateid"];
        }
        return $map;
    }

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
        $data = $this->model->getOneData($map);
        $coach = model("coach")->getList();
        $times = model("timeslot")->getList();

        if (!empty($data["images"])) {
            $data["images"] = json_decode($data["images"], true);
        }

        $this->assign("coach", $coach["list"]);
        $this->assign("times", $times["list"]);
        $this->assign("data", $data);
        $this->_form($this->table, 'form');
    }

    /**
     * 执行添加入库
     * @auth true
     */
    public function edit()
    {

        $id = $this->request->param("id");
        $time = $this->request->param("time");
        $data = $this->request->except(["_csrf_", "id", "file", "time"]);
        $time_arr = explode(" - ", $time);
        $data["starttime"] = $time_arr[0];
        $data["endtime"] = $time_arr[1];
        if (isset($data['is_price']) == 'on') {
            $data['is_price'] = 0;
        }else{
            $data['is_price'] = 1;
        }



        if (empty($data["people_number"])) {
            $data["discount_price"] = $data["price"];
        }
        if (empty($data["images"])) {
            return json(["status" => "fail", "msg" => "图集不能为空"]);
            die;
        }
        $data["images"] = json_encode($data["images"]);
        if (empty($id)) {
            $data["time"] = time();
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