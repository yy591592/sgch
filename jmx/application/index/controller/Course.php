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
 * 课程控制器
 */
class Course extends Common
{
    protected $middleware = ["Auth"];

    /**
     * 课程列表
     */

    public function index()
    {
        $params = $this->request->param();  //获取参数
        $result = $this->model->getList($this->map(), $this->page, $this->limit, $this->field, $this->order);
        $time = time();  //获取当前时间
        foreach ($result["list"] as $k => $v) {             //判断课程结束时节是否已过当前时间
            $ctimes = strtotime($v['endtime']);
            if ($ctimes < $time) {
                $v['is_end'] = '1';
            }
            if (!empty($v['member_discount'])) {
                $v['member_price'] = $v['member_discount'] * $v['price']; //会员价=原价*折扣
            }
            if (!empty($params['data'])) {
                $v['data'] = $params['data'];
            }

        }
        return json(["status" => "success", "count" => $result["count"], "data" => $result["list"], "pages" => $result["pages"]]);
    }

    public function detail()            //课程详情
    {
        $map = $this->detail_map();
        if (count($map) == 0) {
            $map["id"] = $this->request->param("id");
        }
        $data = $this->model->getOneData($map, $this->detail_field);
        $img = json_decode($data['images']);
        $data['images'] = $img;
        $data['coach'] = Db::table("gym_coach")->where(["id" => $data['coach_id']])->find();
        $data['member_price']=$data['member_discount'] * $data['price'];//会员价=原价*折扣
        return json(["status" => "success", "data" => $data]);
    }


    public function map()           //查询条件
    {
        $map = [];
        $params = $this->request->param();  //获取参数
        if (!empty($params["date"])) {      //课程日期
            $date = date('w', strtotime($params['date']));
            $map[] = ["week", "=", $date - 1];
        }
        if (!empty($params["week"])) {      //week课程周时间
            $map[] = ["week", "=", $params["week"]];
        }
        if (!empty($params["modeid"])) {    //modeid训练模式
            $map[] = ["modeid", "=", $params["modeid"]];
        }
        if (!empty($params["cateid"])) {    //cateid训练类型
            $map[] = ["cateid", "=", $params["cateid"]];
        }
        if (!empty($params["coach_id"])) {  //coach_id教练
            $map[] = ["coach_id", "=", $params["coach_id"]];
        }
        if (!empty($params["timesid"])) {   //timesid时段
            $map[] = ["timesid", "=", $params["timesid"]];
        }
        if (!empty($params["price"])) {     //免费课程
            $map[] = ["price", "=", '0.00'];
        }
        return $map;
    }


    public function video()          //获取课程主页视频
    {
        $result = Db::table("gym_info")->where(["id" => 1])->find();
        return json(["status" => "success", "data" => $result["video"]]);
    }


    /**
     * 预约课程
     */
    public function order()
    {


//        Db::startTrans();  //开启事务
//        try {
        $params = $this->request->param();

        $user = Db::table("gym_user")->where(["id" => $params["uid"]])->find();   //获取用户信息
        $course = Db::table("gym_course")->where(["id" => $params["course_id"]])->find(); //获取课程信息
//        if (!$params['vouchers_id']) {        //是否使用优惠券
//            $vouchers = Db::table("gym_user_vouchers")->where(["id" => $params["vouchers_id"]])->delete(); //删除用户此张优惠券
//        }


        $order_course = Db::table("gym_course_order")->where(["uid" => $params["uid"], "course_id" => $params["course_id"], "date" => $params["date"]])->find();    //获取用户预约当前课程信息
        if ($order_course) {    //用户已预约当前课程
            return json(["status" => "fail", "msg" => "你已预约当前课程，请勿重复预约"]);
            die;
        }

//            if ($course["modeid"] == 22) {  //如果预约的是团体课程
//                if ($params["people_number"] >= $course["people_number"]) { //如果预约人数大于等于课程满足优惠人数
//                    $total = $params["people_number"] * $params["day_number"] * $course["discount_price"]; //预约人数×预约天数×优惠单价
//                } else {
//                    $total = $params["people_number"] * $params["day_number"] * $course["price"]; //预约人数×预约天数×课程单价（实际单价）
//                }
//                $member_total = $total * ($course["member_discount"] / 100);   //最终价格×会员折扣
//            }
//
//            if ($course["modeid"] == 23) {  //如果预约的是私教课程，那么金额等于课程单价乘以节数
//                $params["people_number"] = 1;   //私教课程是一对一
//                $total = $course["price"] * $params["node_number"];   //每节实际单价×课程节数
//                $member_total = $total * ($course["member_discount"] / 100); //会员价格 = 最终价格×会员折扣
//            }

        $order["uid"] = $params['uid']; //订单用户
        $order["course_id"] = $params['course_id']; //课程id
        $order["createtime"] = date('Y-m-d'); //订单生成时间
        $order["order_number"] = $params["uid"] . date("YmdHis") . $params["course_id"]; //订单号由用户id、时间日期和课程ID组成
        $order['vouchers_id'] = isset($params['vouchers_id']) ? $params['vouchers_id'] : '';//代金券id
        $order['day_number'] = isset($params['day_number']) ? $params['day_number'] : '';//预约天数
        $order['people_number'] = isset($params['people_number']) ? $params['people_number'] : '';//预约人数
        $order['node_number'] = isset($params['node_number']) ? $params['node_number'] : '';//预约节数
        $order['price'] = isset($params['price']) ? $params['price'] : '';//订单支付金额
        $order['date'] = isset($params['date']) ? $params['date'] : '';//预约的日期
        $order['title'] = $course['title'];

        if ($user["is_member"] == 1) {  //如果是会员
            if ($user["balance"] >= $params['price']) {  //如果会员卡余额足够抵扣课程价格,那么直接下单
                $order['is_member_pay'] = 1;//是否是会员支付  0 普通支付 1 会员支付
                $order['paytime'] = date('Y-m-d'); //订单支付时间;
                $order['pay_status'] = 1; //订单支付状态 0未支付 1已支付;
                Db::table("gym_user")->where(["id" => $params["uid"]])->dec("balance", $order['price'])->inc("consume_total", $order['price'])->update(); //减少用户会员卡余额，增加已消费金额
                $res = Db::table("gym_course_order")->insert($order);    //生成预约订单
                return json(["status" => "success", "msg" => "预约成功"]);
            } else {
                $data = action('Wxpay/pay', $order);
//                dump($data);
//                die();
                return json(["status" => "fail", "data" => $data, "msg" => "会员余额不足，继续操作将使用微信支付，并且无法享受折扣"]);
            }
        } else {     //如果不是会员
            $order['is_member_pay'] = 0;//是否是会员支付  0 普通支付 1 会员支付
            $res = Db::table("gym_course_order")->insert($order);    //生成预约订单
            if ($res == 1) {
                //开始调用微信支付
//                $data = action('Wxpay/pay', $order);
            }

        }


//
//        if ($user["balance"] >= $params['price']) {  //如果会员卡余额足够抵扣课程价格,那么直接下单
//            $params["createtime"] = time(); //订单生成时间
//            $params["paytime"] = time();    //订单支付时间
//            $params["is_member_pay"] = 1;   //会员卡支付
//            $params["pay_status"] = 1;
//            $id = Db::table("gym_course_order")->insertGetId($params);    //生成预约订单
//            $order_number = $user["id"] . date("YmdHis") . $id; //订单号由用户id、时间日期和订单ID组成
//
//
//            Db::table("gym_course_order")->where(["id" => $id])->update(["order_number" => $order_number]);    //修改订单数据生成订单号
//            Db::table("gym_user")->where(["id" => $params["uid"]])->dec("balance", $member_total)->inc("consume_total", $member_total)->update(); //减少用户会员卡余额，增加已消费金额
//            Db::table("gym_course")->where(["id" => $params["course_id"]])->setInc("order_quota", $params["people_number"]);    //增加课程已预约名额
//            Db::commit();   //事务提交
//            return json(["status" => "success", "msg" => "课程预约成功", "is_member" => 1]);  //返回会员卡支付信息
//
//        } else {
//            return json(["status" => "fail", "msg" => "会员余额不足，继续操作将使用微信支付，并且无法享受折扣"]);
//        }
//    } else
//{
//
//}
//        } catch (\Exception $e) {
//            Db::rollback(); //事务回滚
//            return json(["status" => "fail", "msg" => "课程预约失败", "error" => $e->getMessage()]);
//        }
    }


}