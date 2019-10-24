<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/20
 * Time: 16:42
 */

namespace app\common\model;
class Notice extends Common
{
    protected $table = "jmx_notice";


    public function GetTypeAttr($value)
    {

        $status = [1=>'通知',2=>'公告'];
        return $status[$value];

    }

}