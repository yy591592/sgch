<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/23
 * Time: 11:47
 */

namespace app\index\controller;

use think\Db;

/**
 * Class Course
 * @package app\index\controller
 * 通知公告控制器
 */
class Notice extends Common
{
    protected $middleware = ["Auth"];

    /**
     *  列表
     */
    public function map()
    {
        $map = [];
        $params = $this->request->param();  //获取参数
        if (!empty($params["type"])) {
            $map[] = ["type", "=", $params["type"]];
        }

        return $map;
    }



}