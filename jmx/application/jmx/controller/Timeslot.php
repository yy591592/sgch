<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/20
 * Time: 12:02
 */

namespace app\jmx\controller;

use think\Db;

class Timeslot extends Common
{
    public $table = "jmxCategoryTimeslot";
    public $title = "课程时段";

    /**
     * @return array|void
     * 数据列表查询条件
     */


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
