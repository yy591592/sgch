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
 * 定义教练控制器
 */
class Guess extends Common
{
    public $table = "jmxGuess";
    public $title = "店铺管理";

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
        $data = $this->request->except(["_csrf_", "title", "id", "file"]);
        if (empty($id)) {
            if (empty($data["images"])) {
                return json(["status" => "fail", "msg" => "图集不能为空"]);
                die;
            }
            $data["images"] = json_encode($data["images"]);
            $result = $this->model->add($data);
            if ($result["code"] == 0) {
                return json(["status" => "success", "msg" => "添加成功", "data" => $result["data"]]);
            } else {
                return json(["status" => "fail", "msg" => "添加失败", "error" => $result["error"]]);
            }
        } else {

            $map["id"] = $id;
            if (empty($data["images"])) {
                return json(["status" => "fail", "msg" => "图集不能为空"]);
                die;
            }
            $data["images"] = json_encode($data["images"]);
            $result = $this->model->edit($data, $map);
            if ($result["code"] == 0) {
                return json(["status" => "success", "msg" => "编辑成功", "data" => $result["data"]]);
            } else {
                return json(["status" => "fail", "msg" => "编辑失败", "error" => $result["error"]]);
            }
        }
    }

    /**
     * 获取教练图集
     */
    public function getImages()
    {
        $id = $this->request->param('id');
        $map['id'] = $id;
        $result = $this->model->getOneData($map);
        $images = json_decode($result['images'], true);
        $data = [];
        $res = [];
        foreach ($images as $key => $value) {
            $picture = [];
            $picture['alt'] = '';
            $picture['pid'] = $key + 1;
            $picture['src'] = $value;
            $picture['thumb'] = $value;
            $res[] = $picture;
        }
        $data['data'] = $res;
        $data['title'] = '观点图集';
        $data['id'] = 1;
        $data['start'] = 0;
        return json($data);
    }

}