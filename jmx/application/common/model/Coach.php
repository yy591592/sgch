<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/20
 * Time: 16:42
 */

namespace app\common\model;
class Coach extends Common
{
    protected $table = "gym_coach";

    /**
     * @param $value
     * 编辑教练头像
     */
    public function GetAvartarAttr($value)
    {
        $action = request()->action();
        switch ($action) {
            case "getlist":
                $value = "<a href='" . $value . "' data-lightbox='preview' title='教练头像'><img src='" . $value . "' stytle='wdith:50px'></a>";
                break;
        }
        return $value;
    }

    /**
     * @param $value
     * 格式化图集
     */
    public function GetImagesAttr($value)
    {
        $action = request()->action();
        switch ($action) {
            case "add":
                $value = json_decode($value, true);
                break;
        }
        return $value;
    }
}