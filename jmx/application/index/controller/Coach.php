<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/26
 * Time: 17:34
 */

namespace app\index\controller;
/**
 * Class Coach
 * @package app\index\controller
 * 教练控制器
 */
class Coach extends Common
{
    protected $middleware = ["Auth"];

}