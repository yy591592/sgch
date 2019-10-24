<?php

namespace app\http\middleware;

use think\Db;

class Auth
{
    public function handle($request, \Closure $next)
    {
//        $token = $request->header("token");
        $token = $request->header("Authorization");
        if (empty($token)) {
            return json(["status" => "fail", "msg" => "请登录"]);
            die;
        } else {

            $user = Db::table("jmx_user")->where(["login_token" => $token])->limit(1)->find(); //查询该token是否合法
//            dump(Db::table("gym_user")->getLastSql());
            if (empty($user)) {
                return json(["status" => "fail", "msg" => "无效的身份信息"]);
                die;
            } else {
                $result = deciphering($token);  //对token进行解析
                if ($result["openid"] != $user["openid"] || $result["uid"] != $user["id"]) {   //判断解析的token信息和数据库查询的身份信息是否一致
                    return json(["status" => "fail", "msg" => "身份信息不匹配"]);
                    die;
                } else {
                    $request->uid = $result["uid"];
                    return $next($request);
                }
            }
        }
    }
}
