<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/20
 * Time: 16:42
 */

namespace app\common\model;
class TagType extends Common
{
    protected $table = "jmx_tag_type";


    public function GetTypeAttr($value)
    {
        $status = [1=>'帮代购',2=>'帮取送',3=>'帮排队',4=>'万能跑腿'];
        return $status[$value];
    }

}