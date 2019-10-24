<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/20
 * Time: 16:42
 */

namespace app\common\model;
class Guess extends Common
{
    protected $table = "jmx_guess";

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

    public function GetTypeAttr($value)
    {
        $status = [1=>'烧烤夜宵',2=>'网红饮品',3=>'饮品',4=>'小吃',5=>'便利店'];
        return $status[$value];

    }


}