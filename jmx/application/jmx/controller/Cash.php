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
class Cash extends Common
{
    public $table = "jmxCash";
    public $title = "提现申请管理";

    /**
     * @return array|void
     * 数据列表查询条件
     */
    public function map()
    {
        $map = [];
        $params = $this->request->param();

        if (!empty($params["name"])) {
            $res = Db::table("jmx_user")->field("id")->where(["nickname" => $params['name']])->find();
            $map[] = ["uid", "=",$res['id']];
        }

        return $map;
    }




    public function switchs()
    {
        $param = $this->request->param();
        $map["id"] = $param["id"];
        $data["status"] = $param["valid"];
        $result = $this->model->edit($data, $map);
        if ($result["code"] == 0) {
            return json(["status" => "success", "msg" => "操作成功", "data" => $result["data"]]);
        } else {
            return json(["status" => "fail", "msg" => "操作失败", "error" => $result["error"]]);
        }

    }


}