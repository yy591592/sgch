<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/23
 * Time: 10:51
 */

namespace app\common\model;
/**
 * Class User
 * @package app\common\model
 * 定义用户模型
 */

use think\Db;

class User extends Common
{
    public $table = "jmx_user";

    /**
     * @param $value
     * 用户头像
     */
    public function GetAvartarAttr($value)
    {
        $action = request()->action();
        switch ($action) {
            case "getlist":
                $value = "<a href='" . $value . "' data-lightbox='preview' title='用户头像'><img src='" . $value . "' stytle='wdith:50px'></a>";
                break;
        }
        return $value;
    }


    public function GetSexAttr($value)
    {
        $status = [0 => "", 1 => '男', 2 => '女'];
        return $status[$value];
    }

    public function GetRunTypeAttr($value)
    {
        $status = [0 => '', 1 => '全职', 2 => '兼职'];
        return $status[$value];
    }


    public function GetStatusAttr($value)
    {
        $status = [0 => "", 1 => '在线', 2 => '忙碌', 2 => '下线'];
        return $status[$value];

    }


}