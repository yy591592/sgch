<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/22
 * Time: 10:54
 */
Route::rule("login", "index/login/login")->allowCrossDomain();  //登录接口=>参数：code(登录凭证)

Route::rule("notice", "index/notice/index")->allowCrossDomain();  //通知公告接口=>参数：type=1 通知 type2 公告
Route::rule("notice_detail", "index/notice/detail")->allowCrossDomain();  //通知公告详情接口 参数传id
Route::rule("info", "index/info/detail")->allowCrossDomain();  //单页 传 id

Route::rule("Authentication", "index/user/Authentication")->allowCrossDomain();  //跑腿员认证接口
Route::rule("tel", "index/user/tel")->allowCrossDomain();   //绑定手机号码接口=>参数：tel(需要被绑定的手机号码)
Route::rule("code", "index/login/getCodeMessage")->allowCrossDomain();  //获取短信验证码接口=>参数：tel(手机号码)

Route::rule("user_vouchers_list", "index/user_vouchers/index")->allowCrossDomain();//用户代金券列表接口=>参数:用户登录凭证,
//(is_use = 0 获取未使用列表 is_use = 1获取已使用列表 is_use不传为 已过期优惠券列表)
Route::rule("user_detail", "index/user/detail")->allowCrossDomain();   //获取用户个人信息接口=>参数：用户登录凭证
Route::rule("user_info", "index/user/setUserInfo")->allowCrossDomain();   //填写个人资料接口=>参数：sex(性别，1男，2女)
Route::rule("user_account", "index/user/account")->allowCrossDomain();   //账户明细列表
Route::rule("run_account", "index/user/run_account")->allowCrossDomain();   //跑腿员余额明细列表
Route::rule("balance", "index/user/balance")->allowCrossDomain();  //充值余额接口 //参数 price 充值金额  openid
Route::rule("cash", "index/user/cash")->allowCrossDomain();  //跑腿员提现接口 //参数 price 充值金额  openid
Route::rule("cash_list", "index/user/cash_list")->allowCrossDomain();  //跑腿员提现明细接口

Route::rule("run_status", "index/user/run_status")->allowCrossDomain();  //骑手端在线状态设置 status 1在线 2忙碌 3下线

Route::rule("guess", "index/guess/index")->allowCrossDomain();   //猜你喜欢列表页 type 1烧烤夜宵2网红饮品3药品4小吃5便利店

Route::rule("address_list", "index/user/address_list")->allowCrossDomain();   //发单地址列表
Route::rule("address_edit", "index/user/address_edit")->allowCrossDomain();   //发单地址修改 传type 1 家 2公司 3常用地址 修改常用地址 要传地址id
Route::rule("order_evaluate_add", "index/order_evaluate/add")->allowCrossDomain();//订单评价接口=>参数：order_id(订单ID),content（评价内容）
//run_id(跑腿员id),status('状态 1 满意 2 不满意'),star('评价星级 1 一颗星 2 二颗星 3三颗星 4四颗星 5 五颗星'),price(打赏金额)

Route::rule("tag_type", "index/index/type")->allowCrossDomain();  //标签分类接口=>参数：type=1 帮代购标签分类 type=3 帮排队
Route::rule("tag", "index/index/tag")->allowCrossDomain();  //标签分类接口=>参数：type=标签分类id

Route::rule("order_list", "index/order/index")->allowCrossDomain();  //订单列表接口 订单进程process= 0 待支付 1待接单 2进行中 3已完成
Route::rule("order_detail", "index/order/detail")->allowCrossDomain();  //订单详情接口 订单id
Route::rule("statistics", "index/order/statistics")->allowCrossDomain();  //订单统计接口 type=day 当日 lastmonth 上月 samemonth 当月

Route::rule("appoint", "index/order/appoint")->allowCrossDomain();  //指定跑腿员 指定商家 type=1 获取跑腿员列表 type=2 获取商家列表
Route::rule("progress", "index/order/progress")->allowCrossDomain();  //骑手状况改变 参数： type 1第一步 2第二步 3第三步
Route::rule("receipt", "index/order/receipt")->allowCrossDomain();  //接单接口参数： id  订单id

Route::rule("add_order", "index/order/order")->allowCrossDomain();  //下单接口

Route::rule("timing_refund", "index/index/timing_refund")->allowCrossDomain();//定时退款接口


Route::rule("refund", "index/wxpay/refund")->allowCrossDomain();//微信支付回调接口
Route::rule("notify", "index/wxpay/notify")->allowCrossDomain()->middleware(["Auth"]);//微信支付回调接口






Route::rule("act_detail", "index/activity/detail")->allowCrossDomain();  //活动详情接口 参数传id


Route::rule("user_detail", "index/user/detail")->allowCrossDomain();   //获取用户个人信息接口=>参数：用户登录凭证
Route::rule("course_video", "index/course/video")->allowCrossDomain();   //课程主页视频
Route::rule("course_list", "index/course/index")->allowCrossDomain();   //课程列表接口=>参数：week(日期),modeid训练模式，cateid训练类型，coach_id教练，timesid时段，price=1免费课程
Route::rule("course_detail", "index/course/detail")->allowCrossDomain();   //课程详情接口=>参数：id(课程ID)
Route::rule("coach_detail", "index/coach/detail")->allowCrossDomain();   //教练详情接口=>参数：id(教练ID)
Route::rule("wxpay", "index/wxpay/pay")->allowCrossDomain()->middleware(["Auth"]);//微信支付接口

Route::rule("course_order_list", "index/course_order/index")->allowCrossDomain();//用户预约课程列表=>参数：用户登录凭证
Route::rule("course_order_detail", "index/course_order/detail")->allowCrossDomain();//用户预约课程订单详情=>参数：id(订单ID)
Route::rule("category_list", "index/category/index")->allowCrossDomain();//类型列表接口=>参数：pid(类型父ID)
Route::rule("category_list_timeslot", "index/category/timeslot")->allowCrossDomain();//时段课程列表接口
Route::rule("user_train_list", "index/user_train/index")->allowCrossDomain();//用户排行列表接口

Route::rule("card", "index/card/index")->allowCrossDomain();//健身卡列表接口

Route::rule("course_evaluate_list", "index/course_evaluate/index")->allowCrossDomain();//课程评价接口=>参数：course_id(课程ID)
Route::rule("course_evaluate_add", "index/course_evaluate/add")->allowCrossDomain();//课程评价接口=>参数：course_id(课程ID),content（评价内容）
Route::rule("like", "index/course_evaluate/like")->allowCrossDomain();//课程评价点赞接口=>参数：id(评论ID)


Route::rule("order", "index/course/order")->allowCrossDomain();//订单生成接口




