<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/20
 * Time: 16:42
 */

namespace app\common\model;
class Category extends Common
{
    protected $table = "gym_category";

    /**
     * 获取分类列表
     */
    public function GetCategoryTreeList($pid = 0)
    {
        $list = self::where(["pid" => $pid])->order("sort ASC")->select();
        $data = [];
        foreach ($list as $key => $value) {
            $value["label"] = $value["typename"];
            $value["children"] = $this->GetCategoryChildrenList($value["id"]);
            $data[] = $value;
        }
        return $data;
    }

    /**
     * 获取子列表
     */
    public function GetCategoryChildrenList($pid)
    {
        $list = self::where(["pid" => $pid])->order("sort ASC")->select();
        if ($list) {
            $data = [];
            foreach ($list as $key => $value) {
                $value["label"] = $value["typename"];
                $value["children"] = $this->GetCategoryChildrenList($value["id"]);
                $data[] = $value;
            }
            return $data;
        } else {
            return $list;
        }
    }

    /**
     * 获取分类列表
     */
    public function GetCategoryList()
    {
        $list = self::order("sort ASC")->select();
        foreach ($list as $key => $value) {
            $list[$key]["icon"] = "<a href='" . $value["icon"] . "' data-lightbox='preview' title='类型图标'><img src='" . $value["icon"] . "' style='width:80px;'></a>";
        }
        return $list;
    }

    /**
     * @return bool|int|void
     * 删除数据
     */
    public function del($map)
    {
        try {
            $result = self::where($map)->delete();  //删除栏目
            $this->delChildren(["pid" => $map["id"]]);
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

    /**
     * 删除子栏目
     */
    public function delChildren($map)
    {
        $data = self::where($map)->select();    //获取类型的子类型
        if ($data) {
            self::where($map)->delete();  //删除类型的子类型
            foreach ($data as $key => $value) {
                $this->delChildren(["pid" => $value["id"]]);
            }
        }
    }
}