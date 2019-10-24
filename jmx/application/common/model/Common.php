<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/20
 * Time: 16:41
 */

namespace app\common\model;

use think\Model;
use think\Db;

class Common extends Model
{

    public $method_name;   //关联模型方法名

    /**
     * 执行添加入库
     */
    public function add($data)
{
    try {

        $result = self::insertGetId($data);
        $data["code"] = 0;
        $data["data"] = $result;
    } catch (\Exception $e) {
        $data["code"] = 1;
        $data["error"] = $e->getMessage();
    }
    return $data;
}

    /**
     * @return \think\response\Json|void
     * 修改
     */
    public function edit($data, $map)
    {
        try {
            $result = self::where($map)->update($data);

            $data["code"] = 0;
            $data["data"] = $result;
        } catch (\Exception $e) {
            $data["code"] = 1;
            $data["error"] = $e->getMessage();
        }
        return $data;
    }


    /**
     * 获取数据列表
     */
    public function getList($map = [], $page = "", $limit = "", $field = "*", $order = "id DESC")
{
    if (!empty($this->method_name) && method_exists($this, $this->method_name)) {
        if (empty($limit)) {
            $list = self::with($this->method_name)->where($map)->field($field)->order($order)->select();
        } else {
            $list = self::with($this->method_name)->where($map)->field($field)->page($page)->limit($limit)->order($order)->select();
        }
    } else {
        if (empty($limit)) {
            $list = self::where($map)->field($field)->order($order)->select();
        } else {
            $list = self::where($map)->field($field)->page($page)->limit($limit)->order($order)->select();
        }
    }
    $count = self::where($map)->count();
    $pages = !empty($limit) ? ceil($count / $limit) : 1;
    $data["list"] = $list;
    $data["count"] = $count;
    $data["pages"] = $pages;
    return $data;
}

    /**
     * 获取单条数据
     */
    public function getOneData($map, $field = "*")
    {
        $result = self::where($map)->field($field)->find();
        return $result;
    }

    /**
     * @return bool|int|void
     * 删除数据
     */
    public function del($map)
    {
        try {
            $result = self::where($map)->delete();
            if ($result) {
                $data["code"] = 0;
                $data["data"] = $result;
            } else {
                $data["code"] = 1;
                $data["error"] = "删除失败";
            }
        } catch (\Exception $e) {
            $data["code"] = 1;
            $data["error"] = $e->getMessage();
        }
        return $data;
    }


}