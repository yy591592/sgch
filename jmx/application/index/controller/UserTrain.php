<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/26
 * Time: 18:16
 */

namespace app\index\controller;

use think\Db;

/**
 * Class UserTrain
 * @package app\index\controller
 * 定义排行控制器
 */
class UserTrain extends Common
{
    protected $middleware = ["Auth"];

    public $order = "training_duration DESC";

    public function index()
    {
        $params = $this->request->param();
        $order_type = !empty($params["order_type"]) ? $params["order_type"] : "";   //获取前台返回的  日  月  总榜
//        $params["uid"] = 1;
        switch ($order_type) {
            case "day":
                $data = strtotime(date("Ymd"));
                $user_train = Db::table("gym_user_train")->where(["uid" => $params["uid"], "date" => $data])->find();
                //获取用户当日训练信息
                $user_list = Db::table("gym_user_train")->where(["date" => $data])->order("training_duration DESC")->select();
                $list = Db::table("gym_user_train")->where(["date" => $data])->order("training_duration DESC")->limit(3)->select();               //获取当日排行榜
                $prev_user_train = Db::table("gym_user_train")->where([["training_duration", ">",$user_train["training_duration"]], ["date", "=", $data]])->order("training_duration ASC")->find();   //获取用户前一名信息
                $next_user_train = Db::table("gym_user_train")->where([["training_duration", "<", $user_train["training_duration"]], ["date", "=", strtotime(date("Ymd"))]])->order("training_duration DESC")->find();   //获取用户后一名信息
                break;
            case "month":
                $user_train = Db::table("gym_user_train")->field("uid,sum(training_duration) as training_duration")->where(["uid" => $params["uid"], "month" => date("Ym")])->group("uid,month")->find();   //获取当月用户信息
                $user_list = Db::table("gym_user_train")->field("uid,sum(training_duration) as training_duration")->where(["month" => date("Ym")])->order("training_duration DESC")->group("uid")->select();

                $list = Db::table("gym_user_train")->field("uid,sum(training_duration) as training_duration")->where(["month" => date("Ym")])->group("uid,month")->order("training_duration DESC")->limit(3)->select();  //获取用户月排行榜

                $prev_user_train = Db::table("gym_user_train")->field("uid,sum(training_duration) as training_duration")->where(["month" => date("Ym")])->having("training_duration >" . $user_train["training_duration"])->group("uid,month")->order("training_duration ASC")->find();  //获取用户月排行前一名
                $next_user_train = Db::table("gym_user_train")->field("uid,sum(training_duration) as training_duration")->where(["month" => date("Ym")])->having("training_duration <" . $user_train["training_duration"])->group("uid,month")->order("training_duration DESC")->find(); //获取用户月排行后一名
                break;
            default:
                $user_train = Db::table("gym_user_train")->field("uid,sum(training_duration) as training_duration")->where(["uid" => $params["uid"]])->group("uid")->find();    //获取用户总训练信息
                $user_list = Db::table("gym_user_train")->field("uid,sum(training_duration) as training_duration")->where('id'>0)->order("training_duration DESC")->group("uid")->select();
                $list = Db::table("gym_user_train")->field("uid,sum(training_duration) as training_duration")->group("uid")->order("training_duration DESC")->limit(3)->select();
                $prev_user_train = Db::table("gym_user_train")->field("uid,sum(training_duration) as training_duration")->group("uid")->having("training_duration >" . $user_train["training_duration"])->order("training_duration ASC")->find();
                $next_user_train = Db::table("gym_user_train")->field("uid,sum(training_duration) as training_duration")->group("uid")->having("training_duration <" . $user_train["training_duration"])->order("training_duration DESC")->find();
                break;
        }
        foreach ($user_list as $k => $v) {
            if ($v['uid'] == $params['uid']) {
                $ks = $k + 1;   //获取当前用户当日排名
                $user_train['ks']=$ks;
            }
        }
        $prev_user = Db::table("gym_user")->where(["id" => $prev_user_train["uid"]])->find();
        $next_user = Db::table("gym_user")->where(["id" => $next_user_train["uid"]])->find();
        $prev_user_train["nickname"] = $prev_user["nickname"];
        $prev_user_train["avartar"] = $prev_user["avartar"];
        $next_user_train["nickname"] = $next_user["nickname"];
        $next_user_train["avartar"] = $next_user["avartar"];
        $data = [];
        foreach ($list as $key => $value) {
            $user = Db::table("gym_user")->where(["id" => $value["uid"]])->find();
            $value["nickname"] = $user["nickname"];
            $value["avartar"] = $user["avartar"];
            $data[] = $value;
        }
        return json(["status" => "success", "data" => $data, "user_train" => $user_train, "prev_user_train" => $prev_user_train, "next_user_train" => $next_user_train]);
    }
}