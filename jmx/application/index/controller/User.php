<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/23
 * Time: 10:48
 */

namespace app\index\controller;

use think\Request;
use think\Db;

class User extends Common
{
    protected $middleware = ["Auth"];

    /**
     * @return array
     *详情页查询条件
     */
    public function detail_map()
    {
        $map = [];
        $params = $this->request->param();
        $map["id"] = $params["uid"];
        return $map;
    }

    public function detail()
    {
        $map = $this->detail_map();
        if (count($map) == 0) {
            $map["id"] = $this->request->param("id");
        }
        $data = $this->model->getOneData($map, $this->detail_field);
        if (!empty($data['images'])) {
            $img = json_decode($data['images']);
            $data['images'] = $img;
        }
        $maps[] = ['min', '<=', $data['integral']];
        $maps[] = ['max', '>=', $data['integral']];
        $achievement = Db::table('jmx_achievement')->where($maps)->find();  //获取当前成就

        $next_achievement = Db::table('jmx_achievement')->where(['id' => $achievement['id'] + 1])->find();  //获取下一成就等级信息

        $upgrade = $next_achievement['min'] - $data['integral'];        //还差多少分升级

        $data['achievement'] = $achievement['classname'];
        $data['upgrade'] = $upgrade;
        $data['next_achievement'] = $next_achievement['classname'];

        return json(["status" => "success", "data" => $data]);
    }


    /**
     * 绑定手机号码
     */
    public function tel()
    {
        try {
            $uid = $this->request->param("uid");   //获取用户ID
            $params = $this->request->param();
            $result = $this->check($params, "tel"); //进行数据验证
            if ($result) {
                return $result;
            }
            if (!empty($params['code'])) {
                $code = $params['code'];
                $res = Db::table("jmx_sms_code")->where(["code" => $code])->find();
                if (empty($res)) {
                    return json(["status" => "fail", "msg" => "请输入正确验证码"]);
                    die;
                }
            } else {
                return json(["status" => "fail", "msg" => "请输入验证码"]);
                die;
            }

            $user_uid = Db::table("jmx_user")->where(["id" => $uid])->find();
            if (!empty($user_uid["tel"])) {
                return json(["status" => "fail", "msg" => "该用户已绑定过手机号码,请勿重复绑定"]);
                die;
            }
            $user_tel = Db::table("jmx_user")->where(["tel" => $params["tel"]])->find();
            if (!empty($user_tel)) {
                return json(["status" => "fail", "msg" => "该手机号码已被绑定"]);
                die;
            }
            Db::table("jmx_user")->where(["id" => $uid])->update(["tel" => $params["tel"]]);    //进行手机号码的绑定
            return json(["status" => "success", "msg" => "手机号码绑定成功"]);
        } catch (\Exception $e) {
            return json(["status" => "fail", "msg" => '手机号码绑定失败', "error" => $e->getMessage()]);
        }
    }

    /**
     * 设置个人资料
     */
    public function setUserInfo()
    {

        try {
            $uid = $this->request->param("uid");
            $params = $this->request->except(["uid"]);
            Db::table("jmx_user")->where(["id" => $uid])->update($params);    //进行资料补充
            return json(["status" => "success", "msg" => "保存成功"]);
        } catch (\Exception $e) {
            return json(["status" => "fail", "msg" => "保存失败", "error" => $e->getMessage()]);
        }
    }


    /**
     * 骑手端在线状态设置
     */
    public function run_status()
    {
        $data = [];
        $params = $this->request->param();
        if (!empty($params["status"])) {
            $data["status"] = $params["status"];
        }
        Db::table("jmx_user")->where(["id" => $params["uid"]])->update($data);    //进行资料补充
        return json(["status" => "success", "msg" => "设置成功"]);
    }


    /**
     * 账户明细列表
     */
    public function account()
    {
        $uid = $this->request->param("uid");
        $data = Db::table("jmx_order")->field(['id', 'price', 'paytime'])->where(["uid" => $uid])->select();
        $sum = Db::table("jmx_order")->where(["uid" => $uid])->sum('price');

        return json(["status" => "success", "data" => $data, "sum" => $sum]);
    }


    /**
     * 跑腿员认证接口
     */
    public function Authentication()
    {
        try {
            $uid = $this->request->param("uid");
            $params = $this->request->except(["uid"]);
            $res = Db::table("jmx_user")->where(["id" => $uid])->update($params);    //进行资料补充
            return json(["status" => "success", "msg" => "提交成功"]);

        } catch (\Exception $e) {
            return json(["status" => "fail", "msg" => "保存失败", "error" => $e->getMessage()]);
        }
    }

    /**
     * 发单地址列表
     */
    public function address_list()
    {
        try {
            $uid = $this->request->param("uid");
            $params = $this->request->except(["uid"]);
            $home = Db::table("jmx_address")->where(["uid" => $uid, "type" => 1])->find();    //获取家地址
            $company = Db::table("jmx_address")->where(["uid" => $uid, "type" => 2])->find();    //获取公司地址
            $use_address = Db::table("jmx_address")->where(["uid" => $uid, "type" => 3])->select();    //获取常用地址
            return json(["status" => "success", "home" => $home, "company" => $company, "use_address" => $use_address]);
        } catch (\Exception $e) {
            return json(["status" => "fail", "msg" => "保存失败", "error" => $e->getMessage()]);
        }
    }

    /**
     * 发单地址修改
     */
    public function address_edit()
    {

        $params = $this->request->param();
        $map = [];
        $map["uid"] = $params['uid'];

        if (!empty($params['type'])) {
            $map["type"] = $params['type'];
            if (!empty($params['id'])) {
                $map["id"] = $params['id'];
            }
            $res = Db::table("jmx_address")->where($map)->find();            //获取地址
            if (!empty($res)) { //修改地址
                Db::table("jmx_address")->where($map)->update($params);    //修改地址
                return json(["status" => "success", "msg" => "修改成功"]);
            } else {
                Db::table("jmx_address")->insert($params);                //添加地址
                return json(["status" => "success", "msg" => "添加成功"]);
            }
        }

    }


    public function balance()       //余额充值
    {
        $params = $this->request->param();
        $params['type'] = 'balance';
        $params["order_number"] = $params["uid"] . date("YmdHis") . rand(1, 9999); //订单号由用户id、时间日期和课程ID组成
        $params['status'] = 0;
        $params['time'] = date("Y-m-d");

        $res = Db::table("jmx_balance_order")->insert($params);
        if ($res) {
            $wxpay = new Wxpay();
            $data = $wxpay->pay($params);
            return json(["status" => "1", "data" => $data, "msg" => "发起成功"]);
        }
    }

    public function cash()       //跑腿员提现
    {
        Db::startTrans();  //开启事务
        try {
            $params = $this->request->param();
            $user = Db::table('jmx_user')->field('balance')->where(['id' => $params['uid']])->find();
            if ($params['price'] <= $user['balance']) {     //当提现金额小于用户余额时
                $params['time'] = date('Y-m-d');
                Db::table("jmx_user")->where(["id" => $params["uid"]])->dec("balance", $params['price'])->update();
                Db::table("jmx_cash")->insert($params);
                Db::commit();
                return json(["status" => "success", "msg" => "提现申请成功"]);
            } else {
                return json(["status" => "fail", "msg" => "提现金额不得大于余额"]);
            }

        } catch (\Exception $e) {
            Db::rollback(); //事务回滚
            return json(["status" => "fail", "msg" => "提现申请失败", "error" => $e->getMessage()]);
        }

    }

    public function cash_list()       //跑腿员提现申请明细
    {
        $params = $this->request->param();
        $data = Db::table('jmx_cash')->where(['uid' => $params['uid']])->select();
        return json(["status" => "success", "data" => $data]);
    }

    /**
     * 跑腿员余额明细列表
     */
    public function run_account()
    {
        $uid = $this->request->param("uid");

        $data = model("order")->field(['id', 'type', 'price', 'reward', 'paytime'])->where(["run_id" => $uid, "process" => 3])->select();

        return json(["status" => "success", "data" => $data]);
    }


}