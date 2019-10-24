<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/25
 * Time: 13:50
 */

namespace app\index\controller;

use think\Db;

/**
 * Class Wxpay
 * @package app\index\controller
 * 微信支付控制器
 */
class Wxpay extends Common
{

    public function pay($order)
    {


//        Db::startTrans();  //开启事务
//        try {
            // $course_title,$price,$order_number,$openid
            //开始调用微信支付

            if ($order['type'] == 'order') {
                $title = '下单';
                $type = 'order';
            }

            require_once "../Wxpay/WxPay.Api.php";
            require_once "../Wxpay/WxPay.ApiPay.php";
            require_once "../Wxpay/WxPay.Config.php";
            $tools = new \ApiPay();
            $input = new \WxPayUnifiedOrder();             //统一下单
            $input->SetAppid('wx39217068760aa440');                 //appid
            $input->SetMch_id('1555421811');               //商户号
            $input->SetBody($title);       //商品描述
            $input->SetAttach($type);              //订单附加数据，原样返回
            $input->SetOut_trade_no($order['order_number']);                //商户订单号
//             $input->SetTotal_fee($order["price"]*100);                     //标价金额
            $input->SetTotal_fee(1);                     //标价金额
            $input->SetOpenid($order["openid"]);         //openid
            $input->SetTime_start(date("YmdHis"));         //设置订单生成时间
            $input->SetTime_expire(date("YmdHis", time() + 600));       //设置订单失效时间
//        $input->SetGoods_tag("test");                //设置商品标记，代金券的参数
            $input->SetNotify_url('https://www.aqyytc.com/notify');    //支付异步通知回调地址
            $input->SetTrade_type("JSAPI");     //交易类型

            $config = new \WxPayConfig();
            $order = \WxPayApi::unifiedOrder($config, $input);

            if ($order['return_code'] == "FAIL") {
                return json(["0", "", $order['return_msg']]);
            }
            if ($order["result_code"] == "FAIL") {
                return json(["0", "", $order['err_code_des']]);
            }

            //得到需付款的数据
            $jsApiParameters = $tools->GetJsApiParameters($order);
            $jsApiParameters = json_decode($jsApiParameters, true);
            $jsApiParameters['code'] = 1;
            return $jsApiParameters;

//        } catch (\Exception $e) {
//            Db::rollback(); //事务回滚
//            return ["status" => "fail", "msg" => "支付失败", "error" => $e->getMessage()];
//        }

    }


    public function refund()
    {
//        Db::startTrans();  //开启事务
//        try {
        // $course_title,$price,$order_number,$openid
        //开始调用微信退款
        require_once "../Wxpay/WxPay.Api.php";
        require_once "../Wxpay/WxPay.ApiPay.php";
        require_once "../Wxpay/WxPay.Config.php";

        $input = new \WxPayRefund();             //统一下单
        $input->SetAppid(self::APPID);                 //appid
        $input->SetMch_id(self::mch_id);               //商户号
        $input->SetOut_trade_no('1217752501201407033233368018');       //商品描述
        $input->SetOut_refund_no('1217752501201407033233368018');                //商户订单号
        $input->SetTotal_fee(1);                     //标价金额
        $input->SetRefund_fee(1);         //设置订单生成时间
        $input->SetOp_user_id(self::mch_id);         //设置操作员
        $input->SetTransaction_id('1217752501201407033233368018');         //设置操作员
        $config = new \WxPayConfig();
        $res = \WxPayApi::refund($config, $input);


//        } catch (\Exception $e) {
//            Db::rollback(); //事务回滚
//            return ["status" => "fail", "msg" => "支付失败", "error" => $e->getMessage()];
//        }

    }

//处理微信支付回调

    public
    function notify()
    {
        require_once "../Wxpay/WxPay.Config.php";
        $result = file_get_contents('php://input', 'r');
        $result = simplexml_load_string($result, null, LIBXML_NOCDATA);
        $result = json_encode($result);
        $result = json_decode($result, true);

        if ($result['result_code'] === 'SUCCESS' && $result['mch_id'] === self::mch_id) {
            ksort($result);
            //拼接生成签名的字符串
            $sign_string = '';
            foreach ($result as $key => $value) {
                if ($key !== 'sign') {
                    $sign_string .= $key . '=' . $value . '&';
                }
            }
            $sign_string .= 'key=' . self::key;
            $sign = strtoupper(md5($sign_string));


            if ($sign === $result['sign']) {
                if ($result['attach'] == 'yuyue') {                    //预约课程
                    $order_number = $result['out_trade_no'];        //订单号
                    $map['order_number'] = $order_number;
                    $data['pay_status'] = 1;
                    Db::name("gym_course_order")->where($map)->update($data);
                }

                if ($result['attach'] == 'balance') {                  //余额充值
                    $order_number = $result['out_trade_no'];        //订单号
                    $map['order_number'] = $order_number;
                    $res = Db::name("gym_balance_order")->where($map)->find();      //获取充值记录
                    $price = $result['total_fee'] * 0.01;        //充值金额
                    if ($price == 1000) {
                        $price += 200;
                    }
                    if ($price == 2000) {
                        $price += 500;
                    }
                    if ($price == 3000) {
                        $price += 800;
                    }
                    if ($price == 4000) {
                        $price += 1200;
                    }
                    if ($price == 5000) {
                        $price += 1600;
                    }
                    $data['is_member'] = 1;
                    Db::name("gym_user")->where('id', $res['uid'])->inc('balance', $price)->update($data);   //修改用户余额
                }


                if ($result['attach'] == 'card') {                                   //健身卡办理
                    $order_number = $result['out_trade_no'];                         //订单号
                    $map['order_number'] = $order_number;
                    $res = Db::name("gym_balance_order")->where($map)->find();      //获取充值记录
                    if ($res['card_id'] == 1) {
                        $data['card_type'] = '月卡';
                        $data['endtime'] = date("Y-m-d", strtotime("+1 months", time()));
                    }
                    if ($res['card_id'] == 2) {
                        $data['card_type'] = '二月卡';
                        $data['endtime'] = date("Y-m-d", strtotime("+2 months", time()));
                    }
                    if ($res['card_id'] == 3) {
                        $data['card_type'] = '季卡';
                        $data['endtime'] = date("Y-m-d", strtotime("+3 months", time()));
                    }
                    if ($res['card_id'] == 4) {
                        $data['card_type'] = '年卡';
                        $data['endtime'] = date("Y-m-d", strtotime("+1 years", time()));
                    }
                    $data['is_member'] = 1;
                    $res = Db::name("gym_user")->where('id', $res['uid'])->update($data);   //修改会员状态日期
                }

                if ($result['attach'] == 'recharge') {                                   //健身卡办理
                    $order_number = $result['out_trade_no'];                         //订单号
                    $map['order_number'] = $order_number;
                    $res = Db::name("gym_balance_order")->where($map)->find();      //获取充值记录
                    $data['is_entrance'] = 1;
                    $res = Db::name("gym_user")->where('id', $res['uid'])->update($data);   //修改会员状态日期
                }


                return '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';//给微信正常相应（如
            }

        } else {
            return "fail";
        }
    }


}