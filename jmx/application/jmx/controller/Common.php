<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/20
 * Time: 12:03
 */

namespace app\jmx\controller;

use library\Controller;
use think\Db;

//定义公共控制器
class Common extends Controller
{

    public $model;
    public $table = "";
    public $page = 1;
    public $limit = 10;
    public $field = "*";
    public $order = "id DESC";
    public $except = ["_csrf_", "id", "file"];

    public function __construct()
    {
        parent::__construct();
        $namespace = 'app\common\model';
        $class_name = request()->controller();
        if (class_exists($namespace . '\\' . $class_name)) {    //判断是否存在对应的模型
            $this->model = model(strtolower($class_name));
        }
    }

    /**
     * @return array
     * 定义初始化条件
     */
    public function map()
    {
        return [];
    }

    /**
     * @auth true
     * @menu true
     */
    public function index()
    {
        $this->fetch();
    }

    /**
     * 获取数据列表
     */
    public function getList()
    {
        $param = $this->request->param();
        $page = $param["page"] ?? $this->page;
        $limit = $param["limit"] ?? $this->limit;
        $result = $this->model->getList($this->map(), $page, $limit, $this->field, $this->order);
        return json(["code" => 0, "count" => $result["count"], "data" => $result["list"], "pages" => $result["pages"]]);
    }

    /**
     * 添加系统权限
     * @auth true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function add()
    {

        $id = $this->request->param("id");

        $this->applyCsrfToken();
        $map["id"] = $id;
        $data = $this->model->getOneData($map);
        $this->assign("data", $data);
        $this->_form($this->table, 'form');
    }

    /**
     * 执行添加入库
     * @auth true
     */
    public function edit()
    {
        $id = $this->request->param("id");
        $data = $this->request->except($this->except);
        if (empty($id)) {
            $result = $this->model->add($data);
            if ($result["code"] == 0) {
                return json(["status" => "success", "msg" => "添加成功", "data" => $result["data"]]);
            } else {
                return json(["status" => "fail", "msg" => "添加失败", "error" => $result["error"]]);
            }
        } else {
            $map["id"] = $id;
            $result = $this->model->edit($data, $map);
            if ($result["code"] == 0) {
                return json(["status" => "success", "msg" => "编辑成功", "data" => $result["data"]]);
            } else {
                return json(["status" => "fail", "msg" => "编辑失败", "error" => $result["error"]]);
            }
        }
    }

    /**
     * 删除数据
     * @auth true
     */
    public function delete()
    {
        $id = $this->request->param("id");
//        dump($id);die();
        $map["id"] = $id;
        $result = $this->model->del($map);
        if ($result["code"] == 0) {
            return json(["status" => "success", "msg" => "删除成功", "data" => $result["data"]]);
        } else {
            return json(["status" => "fail", "msg" => "删除失败", "error" => $result["error"]]);
        }
    }

    /**
     * 修改排序
     * @auth true
     */
    public function editSort()
    {
        $param = $this->request->param();
        $map["id"] = $param["id"];
        $data["sort"] = $param["sort"];
        $result = $this->model->edit($data, $map);
        if ($result["code"] == 0) {
            return json(["status" => "success", "msg" => "操作成功", "data" => $result["data"]]);
        } else {
            return json(["status" => "fail", "msg" => "操作失败", "error" => $result["error"]]);
        }
    }
}