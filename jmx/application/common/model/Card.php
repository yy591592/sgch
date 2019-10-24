<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/23
 * Time: 10:51
 */

namespace app\common\model;
/**
 * Class Card
 * @package app\common\model
 * 定义健身卡模型
 */
class Card extends Common
{
    public $table = "gym_card";


    /**
     * @param $value
     * 编辑封面图
     */
    public function GetImagesAttr($value)
    {
        $action = request()->action();
        switch ($action) {
            case "getlist":
                $value = "<a href='" . $value . "' data-lightbox='preview' title='封面图'><img src='" . $value . "' stytle='wdith:50px'></a>";
                break;
        }
        return $value;
    }
}