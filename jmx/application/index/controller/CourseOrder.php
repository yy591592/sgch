<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/26
 * Time: 17:40
 */

namespace app\index\controller;
class CourseOrder extends Common
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
        return $map;
    }
}