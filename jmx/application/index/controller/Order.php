<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/26
 * Time: 17:40
 */

namespace app\index\controller;

use think\Db;
use think\cache\driver\Redis;

class Order extends Common
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
        if (!empty($params['process'])) {       //订单进程 条件
            $map["process"] = $params["process"];
        }
        return $map;
    }

    public function appoint()       //指定跑腿员 指定商家列表
    {
        $map = [];
        $params = $this->request->param();

        if (!empty($params['type'])) {
            if ($params['type'] == 1) {
                $data = Db::table("jmx_user")->where('is_run', 1)->select();   //获取跑腿员列表
            } else {
                $data = Db::table("jmx_guess")->where($map)->select();   //获取商家列表
            }
            return json(["status" => "1", "data" => $data]);
        }
    }

    public function receipt()       //接单
    {


        $date = date('Ymd');
        $url = "http://api.goseek.cn/Tools/holiday?date=" . $date;      // 0 工作日 1 节假日 3 周末
        $res = file_get_contents($url);    //json格式，前端需要直接提供
        $res = json_decode($res, true);   //数组格式，方便后端判断

        try {
            $map = [];
            $params = $this->request->param();
            if (!empty($params['id'])) {
                $map['id'] = $params['id'];     //订单id
            }
            $data['process'] = 2;
            $data['run_id'] = $params['uid'];
            Db::table("jmx_order")->where($map)->update($data);   //修改订单状态
            if ($res['data'] == 0) {
                Db::table("jmx_user")->where('id', $params['uid'])->inc('integral', 1)->update();   //修改用户状态 接一单 加1分
            } else {
                Db::table("jmx_user")->where('id', $params['uid'])->inc('integral', 2)->update();   //修改用户状态 接一单 加2分
            }
            return json(["status" => "success", "msg" => '接单成功']);

        } catch (\Exception $e) {
            Db::rollback(); //事务回滚
            return json(["status" => "fail", "msg" => "接单失败", "error" => $e->getMessage()]);
        }
    }

    public function progress()       //订单状况改变
    {
        $map = [];
        $data = [];
        $params = $this->request->param();
        $map['id'] = $params['id'];
        if ($params['type']==3){
            $data['process'] = 3;
        }
        $data['progress'] = $params['type'];
        $data['completion_time'] = date('Y-m-d');
        Db::table("jmx_order")->where($map)->update($data);   //获取跑腿员列表
        return json(["status" => "success", "msg" => '切换成功']);
    }


    public function statistics()       //订单统计
    {

        $map1 = [];
        $map2 = [];
        $map3 = [];
        $map4 = [];
        $params = $this->request->param();
        if (!empty($params['type'])) {       //上月
            if ($params['type'] == 'day') {     //当天
                $begintime = mktime(0, 0, 0, date('m'), date('d'), date('Y'));
                $endtime = mktime(0, 0, 0, date('m'), date('d') + 1, date('Y')) - 1;
            }
            if ($params['type'] == 'lastmonth') {       //当月
                $begintime = mktime(0, 0, 0, date('m') - 1, 1, date('Y'));
                $endtime = mktime(23, 59, 59, date('m') - 1, date('t') - 1, date('Y'));
            }
            if ($params['type'] == 'samemonth') {       //上月
                $begintime = mktime(0, 0, 0, date('m'), 1, date('Y'));
                $endtime = mktime(23, 59, 59, date('m'), date('t'), date('Y'));
            }
            $map1[] = ["run_id", "=", $params['uid']];
            $map1[] = ["completion_time", "between", [$begintime, $endtime]];
            $map2[] = ["run_id", "=", $params['uid']];
            $map2[] = ["time", "between", [$begintime, $endtime]];
            $map2[] = ["status", "=", 1];
            $map3[] = ["run_id", "=", $params['uid']];
            $map3[] = ["time", "between", [$begintime, $endtime]];
            $map3[] = ["status", "=", 2];
            $map4[] = ["b.run_id", "=", $params['uid']];
            $map4[] = ["b.completion_time", "between", [$begintime, $endtime]];

        } else {
            $map1[] = ["run_id", "=", $params['uid']];
            $map2[] = ["run_id", "=", $params['uid']];
            $map2[] = ["status", "=", 1];
            $map3[] = ["run_id", "=", $params['uid']];;
            $map3[] = ["status", "=", 2];
        }

        $sum = Db::table("jmx_order")->where($map1)->count();    //获取总订单的个数
        $praise = Db::table("jmx_order_evaluate")->where($map2)->count();   //获取好评个数
        $bad = Db::table("jmx_order_evaluate")->where($map3)->count();   //获取差评个数
        $not = $sum - $praise - $bad;       //获取没有评价的个数


        $list = model('order')->alias('b')
            ->Join('jmx_order_evaluate a', 'a.order_id=b.id')
            ->field(['b.id', 'b.type', 'b.paytime', 'a.status'])
            ->where($map4)
            ->select();    //获取跑腿员已完成订单

        return json(["status" => "success", "praise" => $praise, "bad" => $bad, "not" => $not, "data" => $list]);

    }


    public function order()       //下单
    {
//        Db::startTrans();  //开启事务
//        try {
            $params = $this->request->param();
            $user = Db::table("jmx_user")->where(["id" => $params["uid"]])->find();   //获取用户信息

            $params["order_number"] = $params["uid"] . date("YmdHis") . rand(1, 9999); //订单号由用户id、时间日期和课程ID组成
            $params['addtime'] = date('Y-m-d');        //下单时间


            if ($user["balance"] >= $params['price']) {  //如果会员卡余额足够抵扣,那么直接下单
                $params['paytime'] = date('Y-m-d'); //订单支付时间;
                $params['process'] = 1;             //支付状态
                $params['refund_time'] = time() + 30;        //下单十分钟后为退款时间
                Db::table("jmx_user")->where(["id" => $params["uid"]])->dec("balance", $params['price'])->inc("consume_total", $params['price'])->update(); //减少用户余额，增加已消费金额
                $id = Db::table("jmx_order")->insertGetId($params);    //生成订单

                if ($id) {   //订单到期时间存入redis
                    $redis = new Redis(config('cache.redis'));
                    $redis->zAdd('refund', $params['refund_time'], $id); //存在就修改， 不存在就添加到集合中去
                }

                Db::commit();
                return json(["status" => "1", "msg" => "下单成功"]);
            } else {

                $params['process'] = 0;             //待支付状态

                $res = Db::table("jmx_order")->insert($params);    //生成订单
                Db::commit();
                if ($res) {
                    $params['type'] = 'order';
                    $wxpay = new Wxpay();

                    $data = $wxpay->pay($params);
                    return json(["status" => "1", "data" => $data, "msg" => "发起成功"]);
                } else {
                    return json(["status" => "0", "msg" => "下单失败"]);
                }
            }


//        } catch (\Exception $e) {
//            Db::rollback(); //事务回滚
//            return json(["status" => "fail", "msg" => "下单失败", "error" => $e->getMessage()]);
//        }

    }


}