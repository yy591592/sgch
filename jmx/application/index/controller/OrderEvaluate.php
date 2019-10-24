<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/27
 * Time: 15:38
 */

namespace app\index\controller;
/**
 * Class CourseEvaluate
 * @package app\index\controller
 * 定义评价控制器
 */

use think\Db;

class OrderEvaluate extends Common
{

    protected $middleware = ["Auth"];

    /**
     * @return array|void
     * 列表查询条件
     */
    public function map()
    {
        $map = [];
        $params = $this->request->param();
        if (!empty($params["order_id"])) {
            $map["order_id"] = $params["order_id"];
        }
        return $map;

    }


    /**
     * 添加评价
     */
    public function add()
    {
        $params = $this->request->param();
        if (!empty($params['content'])) {
            $params["content"] = strip_tags($params["content"]);    //去掉内容中有可能存在的html代码
        }

        $params["time"] = time();

        if (!empty($params['status'])) {
            if ($params['status'] == 1) {       //好评跑腿员加五分
                Db::table('jmx_user')->where('id', $params['run_id'])->inc('integral', 5)->update();
            }
            if ($params['status'] == 2) {       //好评跑腿员减五分
                Db::table('jmx_user')->where('id', $params['run_id'])->dec('integral', 5)->update();
            }
        }
        $res = $this->model->add($params);
        if ($res["code"] == 0) {
            return json(["status" => "1", "msg" => "评价成功"]);
        } else {
            return json(["status" => "0", "msg" => '评价失败', "error" => $res["error"]]);
        }
    }


}