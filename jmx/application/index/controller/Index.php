<?php

// +----------------------------------------------------------------------
// | ThinkAdmin
// +----------------------------------------------------------------------
// | 版权所有 2014~2019 广州楚才信息科技有限公司 [ http://www.cuci.cc ]
// +----------------------------------------------------------------------
// | 官方网站: http://demo.thinkadmin.top
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// +----------------------------------------------------------------------
// | gitee 代码仓库：https://gitee.com/zoujingli/ThinkAdmin
// | github 代码仓库：https://github.com/zoujingli/ThinkAdmin
// +----------------------------------------------------------------------

namespace app\index\controller;

use think\Request;
use think\Db;
use think\cache\driver\Redis;

//use think\cache\driver\Redis;

/**
 * 应用入口
 * Class Index
 * @package app\index\controller
 */
class Index extends Common
{
//    protected $middleware = ["Auth"];
//   public $field = "id,";
    /**
     * 首页列表
     */

//    public function index()
//    {
//        $redis = new Redis(config('cache.redis'));
//        $redis->select(3);
//        $redis->lpush('lists', 'html');
//        $redis->lpush('listb', 'php');
//        $redis->lpush('listv', 'asd');
//
//
////        $redis->set('username','张三');
////        return $redis->get('username');
//
//
//    }


    public function type()
    {
        $params = $this->request->param();  //获取参数
        if (!empty($params['type'])){
            $res = Db::table("jmx_tag_type")->where(["type" => $params['type']])->select();
            return json(["status" => "success", "data" => $res]);
        }
    }


    public function tag()
    {
        $params = $this->request->param();  //获取参数
        if (!empty($params['type'])){
            $res = Db::table("jmx_tag")->where(["cid" => $params['type']])->select();
            return json(["status" => "success", "data" => $res]);
        }
    }


    public function timing_refund()       //延时订单退款
    {

        ini_set('default_socket_timeout', -1);  //不超时
        $redis = new Redis(config('cache.redis'));

        while (true) {
            $time = time();
            $id = $redis->zRangeByScore('refund', $time, $time);
//            file_put_contents('2.txt', $id, FILE_APPEND);
            if ($id){
                $order = Db::table("jmx_order")->where(["id" => $id])->find();   //获取退款订单信息
                if (empty($order['run_id'])){      //十分钟拿出来订单如果没人接单 执行退款
                    $wxpay = new Wxpay();
                    $data = $wxpay->refund($order);
                }
            }
            sleep(1);
        }

    }



}
