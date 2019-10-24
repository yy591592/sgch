<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/26
 * Time: 17:37
 */

namespace app\index\controller;
/**
 * Class UserVouchers
 * @package app\index\controller
 * 定义用户代金券控制器
 */
class UserVouchers extends Common
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
        $map["uid"] = $params["uid"];
        if (!empty($params['is_use']) == 0) {      //未使用的优惠券列表
            $map["is_use"] = 0;
        }
        if (!empty($params['is_use']) == 1) {      //已使用的优惠券列表
            $map["is_use"] = 1;
        }
        return $map;
    }

    public function index()
    {
        $params = $this->request->param();

        $result = $this->model->getList($this->map(), $this->page, $this->limit, $this->field, $this->order);
        $data = [];


        if (empty($params['is_use'])) {    //is_use 为空  是已过期优惠券列表
            foreach ($result["list"] as $k => $v) {
                $endtime = strtotime($v['endtime']);
                $nowtime = time();
                if ($nowtime > $endtime) {
                    $data[] = $v;
                }
            }
            return json(["status" => "success", "count" => $result["count"], "data" => $data, "pages" => $result["pages"]]);
        } else {                //未过期优惠券列表

            foreach ($result["list"] as $k => $v) {
                $endtime = strtotime($v['endtime']);
                $nowtime = time();
                if ($nowtime < $endtime) {
                    $data[] = $v;
                }
            }
            return json(["status" => "success", "count" => $result["count"], "data" => $data, "pages" => $result["pages"]]);
        }


    }


}