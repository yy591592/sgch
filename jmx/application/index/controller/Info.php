<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/23
 * Time: 11:47
 */

namespace app\index\controller;

use think\Db;

/**
 * Class Course
 * @package app\index\controller
 * 单页控制器
 */
class Info extends Common
{
    protected $middleware = ["Auth"];

}