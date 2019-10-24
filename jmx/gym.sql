/*
Navicat MySQL Data Transfer

Source Server         : 健身房
Source Server Version : 50725
Source Host           : 47.92.204.176:3306
Source Database       : gym

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-09-05 11:48:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gym_access_token`
-- ----------------------------
DROP TABLE IF EXISTS `gym_access_token`;
CREATE TABLE `gym_access_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'access_token ID',
  `access_token` char(100) NOT NULL DEFAULT '' COMMENT 'access_token',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `expirestime` int(11) NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='access_token表';

-- ----------------------------
-- Records of gym_access_token
-- ----------------------------

-- ----------------------------
-- Table structure for `gym_activify`
-- ----------------------------
DROP TABLE IF EXISTS `gym_activify`;
CREATE TABLE `gym_activify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `type` int(11) NOT NULL COMMENT '活动类型，1为会员活动，2为周活动，3为月活动',
  `address` char(100) NOT NULL DEFAULT '' COMMENT '活动地址',
  `cover_image` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图',
  `images` varchar(1000) NOT NULL DEFAULT '' COMMENT '图集',
  `course_description` varchar(255) NOT NULL DEFAULT '' COMMENT '课程简介',
  `private_education` varchar(255) NOT NULL DEFAULT '' COMMENT '私教简介',
  `camp` char(100) NOT NULL DEFAULT '' COMMENT 'CAMP',
  `store_features` varchar(500) NOT NULL DEFAULT '' COMMENT '门店特色',
  `service_features` varchar(500) NOT NULL DEFAULT '' COMMENT '服务特色',
  `qq` char(20) NOT NULL DEFAULT '' COMMENT '联系qq',
  `wechat` char(50) NOT NULL DEFAULT '' COMMENT '联系微信',
  `email` char(50) NOT NULL DEFAULT '' COMMENT '联系邮箱',
  `tel` char(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `note` varchar(1000) NOT NULL DEFAULT '' COMMENT '注意事项',
  `starttime` int(11) NOT NULL COMMENT '活动开始时间',
  `endtime` int(11) NOT NULL COMMENT '活动结束时间',
  `time` int(11) NOT NULL COMMENT '活动添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动表';

-- ----------------------------
-- Records of gym_activify
-- ----------------------------

-- ----------------------------
-- Table structure for `gym_category`
-- ----------------------------
DROP TABLE IF EXISTS `gym_category`;
CREATE TABLE `gym_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程分类ID',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上一级ID',
  `typename` char(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `describe` char(100) NOT NULL DEFAULT '' COMMENT '类型描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='课程分类表';

-- ----------------------------
-- Records of gym_category
-- ----------------------------
INSERT INTO `gym_category` VALUES ('20', '0', '训练模式', 'http://gym.bajsx.com/uploads/images/20190821/7d215bf8246990271cbaf3ca94a437f3.jpg', '0', '');
INSERT INTO `gym_category` VALUES ('21', '0', '类型', 'http://gym.bajsx.com/uploads/images/20190821/bca49ecb5bc257547d81ed7587bb8735.jpg', '1', '');
INSERT INTO `gym_category` VALUES ('22', '20', '团体', '', '0', '');
INSERT INTO `gym_category` VALUES ('23', '20', '私教', '', '0', '');
INSERT INTO `gym_category` VALUES ('24', '20', 'CAMP', '', '0', '');
INSERT INTO `gym_category` VALUES ('25', '21', '燃脂', '', '0', '');
INSERT INTO `gym_category` VALUES ('26', '21', '塑性', '', '0', '');
INSERT INTO `gym_category` VALUES ('27', '21', '增肌', '', '0', '');
INSERT INTO `gym_category` VALUES ('28', '21', '体能', '', '0', '');
INSERT INTO `gym_category` VALUES ('29', '21', '心肺', '', '0', '');
INSERT INTO `gym_category` VALUES ('30', '21', '体态', '', '0', '');
INSERT INTO `gym_category` VALUES ('31', '21', '拉伸', '', '0', '');

-- ----------------------------
-- Table structure for `gym_coach`
-- ----------------------------
DROP TABLE IF EXISTS `gym_coach`;
CREATE TABLE `gym_coach` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '教练ID',
  `name` char(50) NOT NULL COMMENT '教练名称',
  `qq` char(20) NOT NULL DEFAULT '' COMMENT '教练QQ',
  `wechat` char(50) NOT NULL DEFAULT '' COMMENT '教练微信',
  `tel` char(20) NOT NULL DEFAULT '' COMMENT '教练联系电话',
  `email` char(30) NOT NULL DEFAULT '' COMMENT '教练邮箱',
  `avartar` varchar(255) NOT NULL DEFAULT '' COMMENT '教练头像',
  `images` varchar(1000) NOT NULL DEFAULT '' COMMENT '教练介绍图集',
  `introduce` varchar(500) NOT NULL DEFAULT '' COMMENT '教练介绍',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='教练表';

-- ----------------------------
-- Records of gym_coach
-- ----------------------------
INSERT INTO `gym_coach` VALUES ('5', '测试教练', '', '', '', '', 'http://gym.bajsx.com/uploads/images/20190821/b0ff69e22c7ce80726762cc124153b4b.jpg', '{\"1956607583\":\"http:\\/\\/gym.bajsx.com\\/uploads\\/images\\/20190821\\/ce5d639167f42bca45b66881d7ac50c3.jpg\"}', '的撒多撒多撒');
INSERT INTO `gym_coach` VALUES ('6', '测试搜索', '', '', '', '', 'http://gym.bajsx.com/uploads/images/20190821/0bba5c18a15c3cf70f507cbe78beb4da.jpg', '{\"926761274\":\"http:\\/\\/gym.bajsx.com\\/uploads\\/images\\/20190821\\/5195610973ab5b78d5a0f4e83cfc3ba3.jpg\",\"1398012477\":\"http:\\/\\/gym.bajsx.com\\/uploads\\/images\\/20190821\\/1924d48cc28d2136cdd39715189c36cc.jpeg\"}', '哈哈');
INSERT INTO `gym_coach` VALUES ('4', '哈哈哈教练', '', '', '', '', 'http://gym.bajsx.com/uploads/images/20190821/b4fc6c76a212bd4b7e396944be5dc5c5.jpg', '{\"1182969937\":\"http:\\/\\/gym.bajsx.com\\/uploads\\/images\\/20190821\\/5236feff7bc2a7fba73262982dca29f4.png\",\"904065497\":\"http:\\/\\/gym.bajsx.com\\/uploads\\/images\\/20190821\\/c7a90d913ec67164b5c39dd53ba1760e.jpeg\",\"1933692490\":\"http:\\/\\/gym.bajsx.com\\/uploads\\/images\\/20190821\\/80b2359936fe0ed0dc8ad1de8109ae94.gif\"}', '这个教练很好啊实打实');
INSERT INTO `gym_coach` VALUES ('7', '呵呵呵', '408199073', '18179924072', '18179924072', '18179924072@163.com', 'http://gym.bajsx.com/uploads/images/20190821/c2aac36d690ae6b12512709712d282aa.jpg', '{\"815569262\":\"http:\\/\\/gym.bajsx.com\\/uploads\\/images\\/20190821\\/0b4c82abf80a72d62838c6b2d88a51ae.jpg\",\"1431529824\":\"http:\\/\\/gym.bajsx.com\\/uploads\\/images\\/20190821\\/e1c8da2e453653d6054ade4c9c3a34a7.jpg\",\"2064459329\":\"http:\\/\\/gym.bajsx.com\\/uploads\\/images\\/20190821\\/ab5a688c079e0703a2ec6391864020e9.jpeg\"}', '呵呵呵呵教练');

-- ----------------------------
-- Table structure for `gym_course`
-- ----------------------------
DROP TABLE IF EXISTS `gym_course`;
CREATE TABLE `gym_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `coach_id` int(11) NOT NULL DEFAULT '0' COMMENT '教练ID',
  `modeid` int(11) NOT NULL COMMENT '训练模式ID',
  `cateid` int(11) NOT NULL COMMENT '训练类型ID',
  `mode_title` char(50) NOT NULL DEFAULT '' COMMENT '训练模式名称',
  `cate_title` char(50) NOT NULL DEFAULT '' COMMENT '训练类型名称',
  `title` char(50) NOT NULL DEFAULT '' COMMENT '课程名称',
  `english_title` char(50) NOT NULL DEFAULT '' COMMENT '课程英文名称',
  `week` int(11) NOT NULL COMMENT '课程时间（1,2,3,4,5,6,7）分别代表周一，周二，周三，周四，周五，周六,周日',
  `starttime` char(10) NOT NULL COMMENT '课程开始时间',
  `endtime` char(10) NOT NULL COMMENT '课程结束时间',
  `training_duration` int(11) NOT NULL DEFAULT '0' COMMENT '训练时长(秒)',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '课程价格',
  `people_number` tinyint(4) NOT NULL DEFAULT '0' COMMENT '优惠人数，就是预约超过多少人会有相应的优惠',
  `discount_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '满足一定预约人数之后的优惠价格',
  `member_discount` tinyint(4) NOT NULL DEFAULT '100' COMMENT '课程会员折扣',
  `video_url` varchar(255) NOT NULL DEFAULT '' COMMENT '视频地址',
  `images` varchar(1000) NOT NULL DEFAULT '' COMMENT '图片地址',
  `effect` varchar(500) NOT NULL DEFAULT '' COMMENT '训练效果',
  `crowd` varchar(255) NOT NULL DEFAULT '' COMMENT '适合人群',
  `note` varchar(500) NOT NULL DEFAULT '' COMMENT '注意事项',
  `quota` int(11) NOT NULL DEFAULT '0' COMMENT '课程可预约名额',
  `time` int(11) NOT NULL COMMENT '课程添加时间',
  `reserve_field` char(1) NOT NULL DEFAULT '' COMMENT '预留字段,用于模型操作时的特殊操作,其余场景不用处理',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='课程表';

-- ----------------------------
-- Records of gym_course
-- ----------------------------
INSERT INTO `gym_course` VALUES ('3', '4', '0', '20', '热力战绳', '', '', '', '1', '1566403200', '1566421200', '0', '100.00', '0', '0.00', '95', '', '', '训练效果', '适合人群', '注意事项\n', '150', '1566385714', '');
INSERT INTO `gym_course` VALUES ('2', '5', '0', '20', '蜜桃臀团训', '', '', '', '2', '1566403200', '1566439200', '0', '100.00', '0', '0.00', '95', '', '', '训练效果', '适合人群', '适合人群', '150', '1566379710', '');
INSERT INTO `gym_course` VALUES ('4', '5', '22', '28', '团体', '体能', '', '', '3', '1566576000', '1566594000', '0', '150.00', '0', '0.00', '100', '', '', '阿打算打算', '的撒多撒多撒', '的撒多撒大所', '150', '1566554317', '');
INSERT INTO `gym_course` VALUES ('5', '4', '22', '26', '团体', '塑性', '蜜桃臀团训', 'HIP TRAINING', '4', '10:00:00', '11:00:00', '0', '120.00', '6', '99.00', '95', 'http://gym.bajsx.com/uploads/videos/20190826/f4e51e175adbe48ab05effa8df36d423.mp4', '{\"1177120289\":\"http:\\/\\/gym.bajsx.com\\/uploads\\/images\\/20190826\\/8023342db1ff95e994311a26f7495c5e.jpg\"}', '训练效果好', '适合人群妙', '适合人群妙', '150', '1566786952', '');
INSERT INTO `gym_course` VALUES ('6', '5', '23', '25', '私教', '燃脂', '脂肪终结者', 'FAT END', '6', '09:00:00', '10:00:00', '0', '220.00', '0', '220.00', '95', 'http://gym.bajsx.com/uploads/videos/20190826/ce3e712626743733bfa848bfbd926130.mp4', '{\"1657721738\":\"http:\\/\\/gym.bajsx.com\\/uploads\\/images\\/20190826\\/7371858829c1baa00efe1e109397aa04.jpg\"}', '训练效果好', '适合人群多', '适合人群多', '200', '1566787821', '');

-- ----------------------------
-- Table structure for `gym_course_evaluate`
-- ----------------------------
DROP TABLE IF EXISTS `gym_course_evaluate`;
CREATE TABLE `gym_course_evaluate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程评价ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '评价内容',
  `like_num` int(11) NOT NULL DEFAULT '0' COMMENT '评价点赞数',
  `time` int(11) NOT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='课程评价表';

-- ----------------------------
-- Records of gym_course_evaluate
-- ----------------------------
INSERT INTO `gym_course_evaluate` VALUES ('1', '4', '5', '哈哈哈哈哈哈哈哈哈哈哈哈', '0', '1566899239');

-- ----------------------------
-- Table structure for `gym_course_order`
-- ----------------------------
DROP TABLE IF EXISTS `gym_course_order`;
CREATE TABLE `gym_course_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '预约课程ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `vouchers_id` int(11) NOT NULL DEFAULT '0' COMMENT '代金券ID',
  `order_number` char(50) NOT NULL DEFAULT '' COMMENT '订单号',
  `day_number` int(11) NOT NULL DEFAULT '0' COMMENT '预约天数',
  `people_number` int(11) NOT NULL DEFAULT '0' COMMENT '预约人数',
  `node_number` int(11) NOT NULL DEFAULT '0' COMMENT '课程节数',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单原价',
  `member_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单会员价',
  `is_member_pay` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为会员卡支付，0为普通支付，1为会员卡支付',
  `date` int(11) NOT NULL COMMENT '日期时间',
  `createtime` int(11) NOT NULL COMMENT '订单生成时间',
  `paytime` int(11) NOT NULL DEFAULT '0' COMMENT '订单支付时间',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单支付状态，0为未支付，1为已支付',
  `reserve_field` char(1) NOT NULL DEFAULT '' COMMENT '预留字段,用于模型操作时的特殊操作,其余场景不用处理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='课程预约表';

-- ----------------------------
-- Records of gym_course_order
-- ----------------------------
INSERT INTO `gym_course_order` VALUES ('7', '1', '5', '0', '1201908261501227', '7', '6', '0', '0.00', '0.00', '1', '0', '1566802882', '1566802882', '1', '');

-- ----------------------------
-- Table structure for `gym_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `gym_recharge`;
CREATE TABLE `gym_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '充值ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `order_number` char(40) NOT NULL DEFAULT '' COMMENT '充值订单号',
  `recharge_amount_id` int(11) NOT NULL DEFAULT '0' COMMENT '充值金额ID',
  `createtime` int(11) NOT NULL COMMENT '订单生成时间',
  `paytime` int(11) NOT NULL DEFAULT '0' COMMENT '订单支付时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='充值表';

-- ----------------------------
-- Records of gym_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for `gym_recharge_amount`
-- ----------------------------
DROP TABLE IF EXISTS `gym_recharge_amount`;
CREATE TABLE `gym_recharge_amount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '充值金额ID',
  `recharge_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `give_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '赠送金额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='充值金额表';

-- ----------------------------
-- Records of gym_recharge_amount
-- ----------------------------
INSERT INTO `gym_recharge_amount` VALUES ('2', '500.00', '0.00');
INSERT INTO `gym_recharge_amount` VALUES ('3', '1000.00', '100.00');

-- ----------------------------
-- Table structure for `gym_sms_code`
-- ----------------------------
DROP TABLE IF EXISTS `gym_sms_code`;
CREATE TABLE `gym_sms_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '短信验证码ID',
  `tel` char(50) NOT NULL COMMENT '获取验证码的手机号码',
  `code` int(11) NOT NULL COMMENT '短信验证码',
  `send_time` int(11) NOT NULL COMMENT '验证码发送时间',
  `expire_time` int(11) NOT NULL COMMENT '验证码过期时间',
  `type` char(20) NOT NULL COMMENT '获取验证码类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=933 DEFAULT CHARSET=utf8 COMMENT='短信验证码获取表';

-- ----------------------------
-- Records of gym_sms_code
-- ----------------------------

-- ----------------------------
-- Table structure for `gym_user`
-- ----------------------------
DROP TABLE IF EXISTS `gym_user`;
CREATE TABLE `gym_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(50) NOT NULL DEFAULT '' COMMENT '用户名称',
  `avartar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `tel` char(20) NOT NULL DEFAULT '' COMMENT '会员联系电话',
  `session_key` char(50) NOT NULL DEFAULT '' COMMENT '用户登录的session_key',
  `unionid` char(50) NOT NULL DEFAULT '' COMMENT '会员unionid',
  `openid` char(50) NOT NULL DEFAULT '' COMMENT '会员openid',
  `login_token` varchar(300) NOT NULL DEFAULT '' COMMENT '用户登录凭证',
  `sex` tinyint(4) NOT NULL DEFAULT '1' COMMENT '性别，1为男，2为女',
  `height` int(11) NOT NULL DEFAULT '0' COMMENT '身高(CM)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '体重(KG)',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `createtime` int(11) NOT NULL COMMENT '注册时间',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员卡余额',
  `consume_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总消费金额',
  `is_member` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是会员，0为普通用户，1为会员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of gym_user
-- ----------------------------
INSERT INTO `gym_user` VALUES ('4', '从容', 'https://wx.qlogo.cn/mmopen/vi_32/gXOldSbLkcTSnzQcsBEgw2dykJHDpl5D3jwD8XicvGk9SOicwf2uvsa3rJM6pf6AxmJria1Ymnz1ww6IAEz1CDwZQ/132', '', 'UvZr1P0ogIV0K3sk1UAZYw==', '', 'o0bWQ4gI5D-bKadjWxmT8oau6Xew', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyYW5kIjoxNjg2NTM1NTg1LCJzZXNzaW9uX2tleSI6IlV2WnIxUDBvZ0lWMEszc2sxVUFaWXc9PSIsIm9wZW5pZCI6Im8wYldRNGdJNUQtYkthZGpXeG1UOG9hdTZYZXciLCJ1aWQiOjR9.fwgbEaHv7c3iRr19gzrwfoQHBsPP7XqsispFsMQBtPs', '1', '0', '0', '0', '1566886367', '0.00', '0.00', '0');

-- ----------------------------
-- Table structure for `gym_user_train`
-- ----------------------------
DROP TABLE IF EXISTS `gym_user_train`;
CREATE TABLE `gym_user_train` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员排行ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `date` int(11) NOT NULL COMMENT '当日日期',
  `month` int(11) NOT NULL COMMENT '当前月份',
  `training_duration` int(11) NOT NULL DEFAULT '0' COMMENT '训练时长',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='训练时长记录表';

-- ----------------------------
-- Records of gym_user_train
-- ----------------------------
INSERT INTO `gym_user_train` VALUES ('1', '1', '1566748800', '201908', '100');
INSERT INTO `gym_user_train` VALUES ('2', '1', '1566835200', '201908', '200');
INSERT INTO `gym_user_train` VALUES ('3', '2', '1566835200', '201909', '400');
INSERT INTO `gym_user_train` VALUES ('4', '2', '1566748800', '201908', '20');
INSERT INTO `gym_user_train` VALUES ('5', '3', '1566748800', '201908', '30');
INSERT INTO `gym_user_train` VALUES ('6', '3', '1566835200', '201908', '201');

-- ----------------------------
-- Table structure for `gym_user_vouchers`
-- ----------------------------
DROP TABLE IF EXISTS `gym_user_vouchers`;
CREATE TABLE `gym_user_vouchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户拥有代金券ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `vouchers_id` int(11) NOT NULL COMMENT '代金券ID',
  `createtime` int(11) NOT NULL COMMENT '领用日期',
  `endtime` int(11) NOT NULL COMMENT '有效截止日期',
  `usetime` int(11) NOT NULL DEFAULT '0' COMMENT '使用日期',
  `is_use` tinyint(4) NOT NULL DEFAULT '0' COMMENT '代金券使用状态，0为未使用，1为已使用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户代金券表';

-- ----------------------------
-- Records of gym_user_vouchers
-- ----------------------------
INSERT INTO `gym_user_vouchers` VALUES ('1', '4', '2', '1566886367', '1569600000', '0', '0');

-- ----------------------------
-- Table structure for `gym_vouchers`
-- ----------------------------
DROP TABLE IF EXISTS `gym_vouchers`;
CREATE TABLE `gym_vouchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '代金券ID',
  `title` char(50) NOT NULL COMMENT '代金券名称',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '代金券可抵扣金额',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '代金券描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='代金券表';

-- ----------------------------
-- Records of gym_vouchers
-- ----------------------------
INSERT INTO `gym_vouchers` VALUES ('2', '专享代金券', '10', '非会员预约课程时刻使用');

-- ----------------------------
-- Table structure for `store_express_company`
-- ----------------------------
DROP TABLE IF EXISTS `store_express_company`;
CREATE TABLE `store_express_company` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `express_title` varchar(50) DEFAULT '' COMMENT '快递公司名称',
  `express_code` varchar(50) DEFAULT '' COMMENT '快递公司代码',
  `express_desc` varchar(512) DEFAULT '' COMMENT '快递公司描述',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0.无效,1.有效)',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='商城-快递-公司';

-- ----------------------------
-- Records of store_express_company
-- ----------------------------
INSERT INTO `store_express_company` VALUES ('5', 'AAE全球专递', 'aae', null, '0', '0', '0', '2017-09-12 11:53:40');
INSERT INTO `store_express_company` VALUES ('6', '安捷快递', 'anjie', '', '0', '0', '0', '2017-09-13 15:27:26');
INSERT INTO `store_express_company` VALUES ('7', '安信达快递', 'anxindakuaixi', null, '0', '0', '0', '2017-09-13 16:05:19');
INSERT INTO `store_express_company` VALUES ('8', '彪记快递', 'biaojikuaidi', null, '0', '0', '0', '2017-09-13 16:05:26');
INSERT INTO `store_express_company` VALUES ('9', 'BHT', 'bht', '', '0', '0', '0', '2017-09-13 16:05:37');
INSERT INTO `store_express_company` VALUES ('10', '百福东方国际物流', 'baifudongfang', null, '0', '0', '0', '2017-09-13 16:05:41');
INSERT INTO `store_express_company` VALUES ('11', '中国东方（COE）', 'coe', null, '0', '0', '0', '2017-09-13 16:05:48');
INSERT INTO `store_express_company` VALUES ('12', '长宇物流', 'changyuwuliu', null, '0', '0', '0', '2017-09-13 16:05:58');
INSERT INTO `store_express_company` VALUES ('13', '大田物流', 'datianwuliu', null, '0', '0', '0', '2017-09-13 16:06:06');
INSERT INTO `store_express_company` VALUES ('14', '德邦物流', 'debangwuliu', '', '0', '1', '0', '2017-09-13 16:06:14');
INSERT INTO `store_express_company` VALUES ('15', 'DHL', 'dhl', null, '0', '0', '0', '2017-09-13 16:06:24');
INSERT INTO `store_express_company` VALUES ('16', 'DPEX', 'dpex', null, '0', '0', '0', '2017-09-13 16:06:29');
INSERT INTO `store_express_company` VALUES ('17', 'd速快递', 'dsukuaidi', null, '0', '0', '0', '2017-09-13 16:06:34');
INSERT INTO `store_express_company` VALUES ('18', '递四方', 'disifang', null, '0', '0', '0', '2017-09-13 16:06:40');
INSERT INTO `store_express_company` VALUES ('19', 'EMS快递', 'ems', '', '1', '0', '0', '2017-09-13 16:06:47');
INSERT INTO `store_express_company` VALUES ('20', 'FEDEX（国外）', 'fedex', null, '0', '0', '0', '2017-09-13 16:06:56');
INSERT INTO `store_express_company` VALUES ('21', '飞康达物流', 'feikangda', null, '0', '0', '0', '2017-09-13 16:07:03');
INSERT INTO `store_express_company` VALUES ('22', '凤凰快递', 'fenghuangkuaidi', null, '0', '0', '0', '2017-09-13 16:07:10');
INSERT INTO `store_express_company` VALUES ('23', '飞快达', 'feikuaida', null, '0', '0', '0', '2017-09-13 16:07:16');
INSERT INTO `store_express_company` VALUES ('24', '国通快递', 'guotongkuaidi', null, '0', '0', '0', '2017-09-13 16:07:27');
INSERT INTO `store_express_company` VALUES ('25', '港中能达物流', 'ganzhongnengda', null, '0', '0', '0', '2017-09-13 16:07:33');
INSERT INTO `store_express_company` VALUES ('26', '广东邮政物流', 'guangdongyouzhengwuliu', null, '0', '0', '0', '2017-09-13 16:08:22');
INSERT INTO `store_express_company` VALUES ('27', '共速达', 'gongsuda', null, '0', '0', '0', '2017-09-13 16:08:48');
INSERT INTO `store_express_company` VALUES ('28', '汇通快运', 'huitongkuaidi', null, '0', '0', '0', '2017-09-13 16:08:56');
INSERT INTO `store_express_company` VALUES ('29', '恒路物流', 'hengluwuliu', null, '0', '0', '0', '2017-09-13 16:09:02');
INSERT INTO `store_express_company` VALUES ('30', '华夏龙物流', 'huaxialongwuliu', null, '0', '0', '0', '2017-09-13 16:09:12');
INSERT INTO `store_express_company` VALUES ('31', '海红', 'haihongwangsong', null, '0', '0', '0', '2017-09-13 16:09:20');
INSERT INTO `store_express_company` VALUES ('32', '海外环球', 'haiwaihuanqiu', null, '0', '0', '0', '2017-09-13 16:09:27');
INSERT INTO `store_express_company` VALUES ('33', '佳怡物流', 'jiayiwuliu', null, '0', '0', '0', '2017-09-13 16:09:35');
INSERT INTO `store_express_company` VALUES ('34', '京广速递', 'jinguangsudikuaijian', null, '0', '0', '0', '2017-09-13 16:09:42');
INSERT INTO `store_express_company` VALUES ('35', '急先达', 'jixianda', null, '0', '0', '0', '2017-09-13 16:09:49');
INSERT INTO `store_express_company` VALUES ('36', '佳吉物流', 'jjwl', null, '0', '0', '0', '2017-09-13 16:10:01');
INSERT INTO `store_express_company` VALUES ('37', '加运美物流', 'jymwl', null, '0', '0', '0', '2017-09-13 16:10:13');
INSERT INTO `store_express_company` VALUES ('38', '金大物流', 'jindawuliu', null, '0', '0', '0', '2017-09-13 16:10:22');
INSERT INTO `store_express_company` VALUES ('39', '嘉里大通', 'jialidatong', null, '0', '0', '0', '2017-09-13 16:10:33');
INSERT INTO `store_express_company` VALUES ('40', '晋越快递', 'jykd', null, '0', '0', '0', '2017-09-13 16:10:40');
INSERT INTO `store_express_company` VALUES ('41', '快捷速递', 'kuaijiesudi', null, '0', '0', '0', '2017-09-13 16:10:49');
INSERT INTO `store_express_company` VALUES ('42', '联邦快递（国内）', 'lianb', null, '0', '0', '0', '2017-09-13 16:10:58');
INSERT INTO `store_express_company` VALUES ('43', '联昊通物流', 'lianhaowuliu', null, '0', '0', '0', '2017-09-13 16:11:07');
INSERT INTO `store_express_company` VALUES ('44', '龙邦物流', 'longbanwuliu', null, '0', '0', '0', '2017-09-13 16:11:15');
INSERT INTO `store_express_company` VALUES ('45', '立即送', 'lijisong', null, '0', '0', '0', '2017-09-13 16:11:25');
INSERT INTO `store_express_company` VALUES ('46', '乐捷递', 'lejiedi', null, '0', '0', '0', '2017-09-13 16:11:36');
INSERT INTO `store_express_company` VALUES ('47', '民航快递', 'minghangkuaidi', null, '0', '0', '0', '2017-09-13 16:11:45');
INSERT INTO `store_express_company` VALUES ('48', '美国快递', 'meiguokuaidi', null, '0', '0', '0', '2017-09-13 16:11:53');
INSERT INTO `store_express_company` VALUES ('49', '门对门', 'menduimen', null, '0', '0', '0', '2017-09-13 16:12:01');
INSERT INTO `store_express_company` VALUES ('50', 'OCS', 'ocs', null, '0', '0', '0', '2017-09-13 16:12:10');
INSERT INTO `store_express_company` VALUES ('51', '配思货运', 'peisihuoyunkuaidi', null, '0', '0', '0', '2017-09-13 16:12:18');
INSERT INTO `store_express_company` VALUES ('52', '全晨快递', 'quanchenkuaidi', null, '0', '0', '0', '2017-09-13 16:12:26');
INSERT INTO `store_express_company` VALUES ('53', '全峰快递', 'quanfengkuaidi', null, '0', '0', '0', '2017-09-13 16:12:34');
INSERT INTO `store_express_company` VALUES ('54', '全际通物流', 'quanjitong', null, '0', '0', '0', '2017-09-13 16:12:41');
INSERT INTO `store_express_company` VALUES ('55', '全日通快递', 'quanritongkuaidi', null, '0', '0', '0', '2017-09-13 16:12:49');
INSERT INTO `store_express_company` VALUES ('56', '全一快递', 'quanyikuaidi', null, '0', '0', '0', '2017-09-13 16:12:56');
INSERT INTO `store_express_company` VALUES ('57', '如风达', 'rufengda', null, '0', '0', '0', '2017-09-13 16:13:03');
INSERT INTO `store_express_company` VALUES ('58', '三态速递', 'santaisudi', null, '0', '0', '0', '2017-09-13 16:13:15');
INSERT INTO `store_express_company` VALUES ('59', '盛辉物流', 'shenghuiwuliu', null, '0', '0', '0', '2017-09-13 16:13:22');
INSERT INTO `store_express_company` VALUES ('60', '申通', 'shentong', null, '0', '0', '0', '2017-09-13 16:13:34');
INSERT INTO `store_express_company` VALUES ('61', '顺丰', 'shunfeng', '', '0', '0', '0', '2017-09-13 16:13:41');
INSERT INTO `store_express_company` VALUES ('62', '速尔物流', 'sue', null, '0', '0', '0', '2017-09-13 16:13:48');
INSERT INTO `store_express_company` VALUES ('63', '盛丰物流', 'shengfeng', null, '0', '0', '0', '2017-09-13 16:13:55');
INSERT INTO `store_express_company` VALUES ('64', '赛澳递', 'saiaodi', null, '0', '0', '0', '2017-09-13 16:14:02');
INSERT INTO `store_express_company` VALUES ('65', '天地华宇', 'tiandihuayu', null, '0', '0', '0', '2017-09-13 16:14:11');
INSERT INTO `store_express_company` VALUES ('66', '天天快递', 'tiantian', null, '0', '0', '0', '2017-09-13 16:14:19');
INSERT INTO `store_express_company` VALUES ('67', 'TNT', 'tnt', null, '0', '0', '0', '2017-09-13 16:14:26');
INSERT INTO `store_express_company` VALUES ('68', 'UPS', 'ups', null, '0', '0', '0', '2017-09-13 16:14:29');
INSERT INTO `store_express_company` VALUES ('69', '万家物流', 'wanjiawuliu', null, '0', '0', '0', '2017-09-13 16:14:37');
INSERT INTO `store_express_company` VALUES ('70', '文捷航空速递', 'wenjiesudi', null, '0', '0', '0', '2017-09-13 16:14:46');
INSERT INTO `store_express_company` VALUES ('71', '伍圆', 'wuyuan', null, '0', '0', '0', '2017-09-13 16:14:52');
INSERT INTO `store_express_company` VALUES ('72', '万象物流', 'wxwl', null, '0', '0', '0', '2017-09-13 16:15:00');
INSERT INTO `store_express_company` VALUES ('73', '新邦物流', 'xinbangwuliu', null, '0', '0', '0', '2017-09-13 16:15:06');
INSERT INTO `store_express_company` VALUES ('74', '信丰物流', 'xinfengwuliu', null, '0', '0', '0', '2017-09-13 16:15:15');
INSERT INTO `store_express_company` VALUES ('75', '亚风速递', 'yafengsudi', null, '0', '0', '0', '2017-09-13 16:15:23');
INSERT INTO `store_express_company` VALUES ('76', '一邦速递', 'yibangwuliu', null, '0', '0', '0', '2017-09-13 16:15:30');
INSERT INTO `store_express_company` VALUES ('77', '优速物流', 'youshuwuliu', null, '0', '0', '0', '2017-09-13 16:15:36');
INSERT INTO `store_express_company` VALUES ('78', '邮政包裹挂号信', 'youzhengguonei', null, '0', '3', '0', '2017-09-13 16:15:44');
INSERT INTO `store_express_company` VALUES ('79', '邮政国际包裹挂号信', 'youzhengguoji', null, '0', '2', '0', '2017-09-13 16:15:51');
INSERT INTO `store_express_company` VALUES ('80', '远成物流', 'yuanchengwuliu', null, '0', '0', '0', '2017-09-13 16:15:57');
INSERT INTO `store_express_company` VALUES ('81', '圆通速递', 'yuantong', '', '1', '1', '0', '2017-09-13 16:16:03');
INSERT INTO `store_express_company` VALUES ('82', '源伟丰快递', 'yuanweifeng', null, '0', '0', '0', '2017-09-13 16:16:10');
INSERT INTO `store_express_company` VALUES ('83', '元智捷诚快递', 'yuanzhijiecheng', null, '0', '0', '0', '2017-09-13 16:16:17');
INSERT INTO `store_express_company` VALUES ('84', '韵达快运', 'yunda', null, '0', '0', '0', '2017-09-13 16:16:24');
INSERT INTO `store_express_company` VALUES ('85', '运通快递', 'yuntongkuaidi', null, '0', '0', '0', '2017-09-13 16:16:33');
INSERT INTO `store_express_company` VALUES ('86', '越丰物流', 'yuefengwuliu', null, '0', '0', '0', '2017-09-13 16:16:40');
INSERT INTO `store_express_company` VALUES ('87', '源安达', 'yad', null, '0', '0', '0', '2017-09-13 16:16:47');
INSERT INTO `store_express_company` VALUES ('88', '银捷速递', 'yinjiesudi', null, '0', '0', '0', '2017-09-13 16:16:56');
INSERT INTO `store_express_company` VALUES ('89', '宅急送', 'zhaijisong', null, '0', '0', '0', '2017-09-13 16:17:03');
INSERT INTO `store_express_company` VALUES ('90', '中铁快运', 'zhongtiekuaiyun', null, '0', '0', '0', '2017-09-13 16:17:10');
INSERT INTO `store_express_company` VALUES ('91', '中通速递', 'zhongtong', '', '0', '0', '0', '2017-09-13 16:17:16');
INSERT INTO `store_express_company` VALUES ('92', '中邮物流', 'zhongyouwuliu', null, '0', '0', '0', '2017-09-13 16:17:27');
INSERT INTO `store_express_company` VALUES ('93', '忠信达', 'zhongxinda', null, '0', '0', '0', '2017-09-13 16:17:34');
INSERT INTO `store_express_company` VALUES ('94', '芝麻开门', 'zhimakaimen', '', '1', '0', '0', '2017-09-13 16:17:41');

-- ----------------------------
-- Table structure for `store_express_template`
-- ----------------------------
DROP TABLE IF EXISTS `store_express_template`;
CREATE TABLE `store_express_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rule` longtext COMMENT '省份规则内容',
  `order_reduction_state` tinyint(1) unsigned DEFAULT '0' COMMENT '订单满减状态',
  `order_reduction_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '订单满减金额',
  `first_number` bigint(20) unsigned DEFAULT '0' COMMENT '首件数量',
  `first_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '首件邮费',
  `next_number` bigint(20) unsigned DEFAULT '0' COMMENT '续件数量',
  `next_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '续件邮费',
  `is_default` tinyint(1) unsigned DEFAULT '0' COMMENT '默认规则',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_store_express_template_is_default` (`is_default`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商城-快递-模板';

-- ----------------------------
-- Records of store_express_template
-- ----------------------------

-- ----------------------------
-- Table structure for `store_goods`
-- ----------------------------
DROP TABLE IF EXISTS `store_goods`;
CREATE TABLE `store_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品分类',
  `title` text COMMENT '商品标题',
  `logo` text COMMENT '商品图标',
  `specs` text COMMENT '商品规格JSON',
  `lists` text COMMENT '商品列表JSON',
  `image` text COMMENT '商品图片',
  `content` longtext COMMENT '商品内容',
  `number_sales` bigint(20) unsigned DEFAULT '0' COMMENT '销售数量',
  `number_stock` bigint(20) unsigned DEFAULT '0' COMMENT '库库数量',
  `price_rate` decimal(20,4) unsigned DEFAULT '0.0000' COMMENT '返利比例',
  `price_express` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '统一运费',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '销售状态',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_store_goods_status` (`status`) USING BTREE,
  KEY `index_store_goods_cate_id` (`cate_id`) USING BTREE,
  KEY `index_store_goods_is_deleted` (`is_deleted`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品-记录';

-- ----------------------------
-- Records of store_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `store_goods_cate`
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_cate`;
CREATE TABLE `store_goods_cate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(500) DEFAULT '' COMMENT '分类图标',
  `title` varchar(255) DEFAULT '' COMMENT '分类名称',
  `desc` varchar(1024) DEFAULT '' COMMENT '分类描述',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '销售状态',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_store_goods_cate_is_deleted` (`is_deleted`) USING BTREE,
  KEY `index_store_goods_cate_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品-分类';

-- ----------------------------
-- Records of store_goods_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `store_goods_list`
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_list`;
CREATE TABLE `store_goods_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(20) DEFAULT '' COMMENT 'sku',
  `goods_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品ID',
  `goods_spec` varchar(100) DEFAULT '' COMMENT '商品规格',
  `price_market` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品标价',
  `price_selling` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品售价',
  `number_sales` bigint(20) unsigned DEFAULT '0' COMMENT '销售数量',
  `number_stock` bigint(20) unsigned DEFAULT '0' COMMENT '商品库存',
  `number_virtual` bigint(20) unsigned DEFAULT '0' COMMENT '虚拟销量',
  `number_express` bigint(20) unsigned DEFAULT '1' COMMENT '快递数量',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '商品状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_store_goods_list_id` (`goods_id`) USING BTREE,
  KEY `index_store_goods_list_spec` (`goods_spec`) USING BTREE,
  KEY `index_store_goods_list_status` (`status`) USING BTREE,
  KEY `index_store_goods_list_sku` (`sku`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品-详情';

-- ----------------------------
-- Records of store_goods_list
-- ----------------------------

-- ----------------------------
-- Table structure for `store_goods_stock`
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_stock`;
CREATE TABLE `store_goods_stock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品ID',
  `goods_spec` varchar(200) DEFAULT '' COMMENT '商品规格',
  `number_stock` bigint(20) unsigned DEFAULT '0' COMMENT '商品库存',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_store_goods_stock_gid` (`goods_id`) USING BTREE,
  KEY `index_store_goods_stock_spec` (`goods_spec`(191)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品-入库';

-- ----------------------------
-- Records of store_goods_stock
-- ----------------------------

-- ----------------------------
-- Table structure for `store_member`
-- ----------------------------
DROP TABLE IF EXISTS `store_member`;
CREATE TABLE `store_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) DEFAULT '' COMMENT '微信OPENID',
  `headimg` varchar(512) DEFAULT '' COMMENT '头像地址',
  `nickname` varchar(100) DEFAULT '' COMMENT '微信昵称',
  `phone` varchar(20) DEFAULT '' COMMENT '联系手机',
  `username` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `vip_level` tinyint(1) unsigned DEFAULT '0' COMMENT '会员级别(0游客,1为临时,2为VIP1,3为VIP2)',
  `vip_date` date DEFAULT NULL COMMENT '保级日期',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_store_member_openid` (`openid`) USING BTREE,
  KEY `index_store_member_phone` (`phone`) USING BTREE,
  KEY `index_store_member_vip_level` (`vip_level`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员-记录';

-- ----------------------------
-- Records of store_member
-- ----------------------------

-- ----------------------------
-- Table structure for `store_member_address`
-- ----------------------------
DROP TABLE IF EXISTS `store_member_address`;
CREATE TABLE `store_member_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `name` varchar(100) DEFAULT '' COMMENT '收货姓名',
  `phone` varchar(20) DEFAULT '' COMMENT '收货手机',
  `province` varchar(100) DEFAULT '' COMMENT '地址-省份',
  `city` varchar(100) DEFAULT '' COMMENT '地址-城市',
  `area` varchar(100) DEFAULT '' COMMENT '地址-区域',
  `address` varchar(255) DEFAULT '' COMMENT '地址-详情',
  `is_default` tinyint(1) unsigned DEFAULT '0' COMMENT '默认地址',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_store_member_address_mid` (`mid`) USING BTREE,
  KEY `index_store_member_address_is_default` (`is_default`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员-地址';

-- ----------------------------
-- Records of store_member_address
-- ----------------------------

-- ----------------------------
-- Table structure for `store_member_sms_history`
-- ----------------------------
DROP TABLE IF EXISTS `store_member_sms_history`;
CREATE TABLE `store_member_sms_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `phone` varchar(20) DEFAULT '' COMMENT '目标手机',
  `content` varchar(512) DEFAULT '' COMMENT '短信内容',
  `result` varchar(100) DEFAULT '' COMMENT '返回结果',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_store_member_sms_history_phone` (`phone`) USING BTREE,
  KEY `index_store_member_sms_history_mid` (`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员-短信';

-- ----------------------------
-- Records of store_member_sms_history
-- ----------------------------

-- ----------------------------
-- Table structure for `store_order`
-- ----------------------------
DROP TABLE IF EXISTS `store_order`;
CREATE TABLE `store_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `order_no` bigint(20) unsigned DEFAULT '0' COMMENT '订单单号',
  `from_mid` bigint(20) unsigned DEFAULT '0' COMMENT '推荐会员ID',
  `price_total` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '待付金额统计',
  `price_goods` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品费用统计',
  `price_express` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '快递费用统计',
  `price_rate_amount` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '返利金额统计',
  `pay_state` tinyint(1) unsigned DEFAULT '0' COMMENT '支付状态(0未支付,1已支付)',
  `pay_type` varchar(10) DEFAULT '' COMMENT '支付方式',
  `pay_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '支付金额',
  `pay_no` varchar(100) DEFAULT '' COMMENT '支付单号',
  `pay_at` datetime DEFAULT NULL COMMENT '支付时间',
  `cancel_state` tinyint(1) unsigned DEFAULT '0' COMMENT '取消状态',
  `cancel_at` datetime DEFAULT NULL COMMENT '取消时间',
  `cancel_desc` varchar(500) DEFAULT '' COMMENT '取消描述',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态(0未退款,1待退款,2已退款)',
  `refund_at` datetime DEFAULT NULL COMMENT '退款时间',
  `refund_no` varchar(100) DEFAULT '' COMMENT '退款单号',
  `refund_price` decimal(20,2) DEFAULT '0.00' COMMENT '退款金额',
  `refund_desc` varchar(500) DEFAULT '' COMMENT '退款描述',
  `express_state` tinyint(1) unsigned DEFAULT '0' COMMENT '发货状态(0未发货,1已发货,2已签收)',
  `express_company_code` varchar(255) DEFAULT '' COMMENT '发货快递公司编码',
  `express_company_title` varchar(255) DEFAULT '' COMMENT '发货快递公司名称',
  `express_send_no` varchar(50) DEFAULT '' COMMENT '发货单号',
  `express_send_at` datetime DEFAULT NULL COMMENT '发货时间',
  `express_address_id` bigint(20) unsigned DEFAULT '0' COMMENT '收货地址ID',
  `express_name` varchar(255) DEFAULT '' COMMENT '收货人姓名',
  `express_phone` varchar(11) DEFAULT '' COMMENT '收货人手机',
  `express_province` varchar(255) DEFAULT '' COMMENT '收货地址省份',
  `express_city` varchar(255) DEFAULT '' COMMENT '收货地址城市',
  `express_area` varchar(255) DEFAULT '' COMMENT '收货地址区域',
  `express_address` varchar(255) DEFAULT '' COMMENT '收货详细地址',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '订单状态(0已取消,1预订单待补全,2新订单待支付,3已支付待发货,4已发货待签收,5已完成)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_store_groups_order_mid` (`mid`) USING BTREE,
  KEY `index_store_groups_order_order_no` (`order_no`) USING BTREE,
  KEY `index_store_groups_order_pay_state` (`pay_state`) USING BTREE,
  KEY `index_store_groups_order_cancel_state` (`cancel_state`) USING BTREE,
  KEY `index_store_groups_order_refund_state` (`refund_state`) USING BTREE,
  KEY `index_store_groups_order_status` (`status`) USING BTREE,
  KEY `index_store_groups_order_pay_no` (`pay_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单-记录';

-- ----------------------------
-- Records of store_order
-- ----------------------------

-- ----------------------------
-- Table structure for `store_order_list`
-- ----------------------------
DROP TABLE IF EXISTS `store_order_list`;
CREATE TABLE `store_order_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `from_id` bigint(20) unsigned DEFAULT '0' COMMENT '推荐会员',
  `order_no` bigint(20) unsigned DEFAULT '0' COMMENT '订单单号',
  `goods_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品标识',
  `goods_title` varchar(255) DEFAULT '' COMMENT '商品标题',
  `goods_logo` varchar(500) DEFAULT '' COMMENT '商品图标',
  `goods_spec` varchar(100) DEFAULT '' COMMENT '商品规格',
  `price_real` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '交易金额',
  `price_selling` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '销售价格',
  `price_market` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '市场价格',
  `price_express` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '快递费用',
  `price_rate` decimal(20,4) unsigned DEFAULT '0.0000' COMMENT '分成比例',
  `price_rate_amount` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '分成金额',
  `number_goods` bigint(20) unsigned DEFAULT '0' COMMENT '商品数量',
  `number_express` bigint(20) unsigned DEFAULT '0' COMMENT '快递数量',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_store_goods_list_id` (`goods_id`) USING BTREE,
  KEY `index_store_goods_list_spec` (`goods_spec`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单-详情';

-- ----------------------------
-- Records of store_order_list
-- ----------------------------

-- ----------------------------
-- Table structure for `system_auth`
-- ----------------------------
DROP TABLE IF EXISTS `system_auth`;
CREATE TABLE `system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL COMMENT '权限名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '权限状态',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_auth_status` (`status`) USING BTREE,
  KEY `index_system_auth_title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='系统-权限';

-- ----------------------------
-- Records of system_auth
-- ----------------------------
INSERT INTO `system_auth` VALUES ('1', '超级管理员', '1', '0', '超级管理员', '2019-08-20 10:30:38');
INSERT INTO `system_auth` VALUES ('2', '普通管理员', '1', '0', '普通管理员', '2019-08-20 10:31:48');

-- ----------------------------
-- Table structure for `system_auth_node`
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_node`;
CREATE TABLE `system_auth_node` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色',
  `node` varchar(200) DEFAULT NULL COMMENT '节点',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_auth_auth` (`auth`) USING BTREE,
  KEY `index_system_auth_node` (`node`(191)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-权限-授权';

-- ----------------------------
-- Records of system_auth_node
-- ----------------------------

-- ----------------------------
-- Table structure for `system_config`
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '配置名',
  `value` varchar(500) DEFAULT '' COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_config_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COMMENT='系统-配置';

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES ('1', 'app_name', 'Lemonkeeper');
INSERT INTO `system_config` VALUES ('2', 'site_name', 'Lemonkeeper');
INSERT INTO `system_config` VALUES ('3', 'app_version', 'v0');
INSERT INTO `system_config` VALUES ('4', 'site_copy', '©版权所有 2014-2018 楚才科技');
INSERT INTO `system_config` VALUES ('5', 'site_icon', '/upload/decb0fe26fa3f486/b3f6521bf29403c8.png');
INSERT INTO `system_config` VALUES ('7', 'miitbeian', '粤ICP备16006642号-2');
INSERT INTO `system_config` VALUES ('8', 'storage_type', 'local');
INSERT INTO `system_config` VALUES ('9', 'storage_local_exts', 'doc,gif,icon,jpg,mp3,mp4,p12,pem,png,rar');
INSERT INTO `system_config` VALUES ('10', 'storage_qiniu_bucket', 'https');
INSERT INTO `system_config` VALUES ('11', 'storage_qiniu_domain', '用你自己的吧');
INSERT INTO `system_config` VALUES ('12', 'storage_qiniu_access_key', '用你自己的吧');
INSERT INTO `system_config` VALUES ('13', 'storage_qiniu_secret_key', '用你自己的吧');
INSERT INTO `system_config` VALUES ('14', 'storage_oss_bucket', 'cuci-mytest');
INSERT INTO `system_config` VALUES ('15', 'storage_oss_endpoint', 'oss-cn-hangzhou.aliyuncs.com');
INSERT INTO `system_config` VALUES ('16', 'storage_oss_domain', '用你自己的吧');
INSERT INTO `system_config` VALUES ('17', 'storage_oss_keyid', '用你自己的吧');
INSERT INTO `system_config` VALUES ('18', 'storage_oss_secret', '用你自己的吧');
INSERT INTO `system_config` VALUES ('36', 'storage_oss_is_https', 'http');
INSERT INTO `system_config` VALUES ('43', 'storage_qiniu_region', '华东');
INSERT INTO `system_config` VALUES ('44', 'storage_qiniu_is_https', 'https');
INSERT INTO `system_config` VALUES ('45', 'wechat_mch_id', '1332187001');
INSERT INTO `system_config` VALUES ('46', 'wechat_mch_key', 'A82DC5BD1F3359081049C568D8502BC5');
INSERT INTO `system_config` VALUES ('47', 'wechat_mch_ssl_type', 'p12');
INSERT INTO `system_config` VALUES ('48', 'wechat_mch_ssl_p12', '65b8e4f56718182d/1bc857ee646aa15d.p12');
INSERT INTO `system_config` VALUES ('49', 'wechat_mch_ssl_key', 'cc2e3e1345123930/c407d033294f283d.pem');
INSERT INTO `system_config` VALUES ('50', 'wechat_mch_ssl_cer', '966eaf89299e9c95/7014872cc109b29a.pem');
INSERT INTO `system_config` VALUES ('51', 'wechat_token', 'mytoken');
INSERT INTO `system_config` VALUES ('52', 'wechat_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES ('53', 'wechat_appsecret', '9978422e0e431643d4b42868d183d60b');
INSERT INTO `system_config` VALUES ('54', 'wechat_encodingaeskey', '');
INSERT INTO `system_config` VALUES ('55', 'wechat_push_url', '消息推送地址：http://127.0.0.1:8000/wechat/api.push');
INSERT INTO `system_config` VALUES ('56', 'wechat_type', 'thr');
INSERT INTO `system_config` VALUES ('57', 'wechat_thr_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES ('58', 'wechat_thr_appkey', 'd2c0139213d7a27898ca047d81a617be');
INSERT INTO `system_config` VALUES ('60', 'wechat_thr_appurl', '消息推送地址：http://127.0.0.1:8000/wechat/api.push');
INSERT INTO `system_config` VALUES ('61', 'component_appid', 'wx28b58798480874f9');
INSERT INTO `system_config` VALUES ('62', 'component_appsecret', '87ddce1cc24e4cd691039f926febd942');
INSERT INTO `system_config` VALUES ('63', 'component_token', 'P8QHTIxpBEq88IrxatqhgpBm2OAQROkI');
INSERT INTO `system_config` VALUES ('64', 'component_encodingaeskey', 'L5uFIa0U6KLalPyXckyqoVIJYLhsfrg8k9YzybZIHsx');
INSERT INTO `system_config` VALUES ('65', 'system_message_state', '0');
INSERT INTO `system_config` VALUES ('66', 'sms_zt_username', '可以找CUCI申请');
INSERT INTO `system_config` VALUES ('67', 'sms_zt_password', '可以找CUCI申请');
INSERT INTO `system_config` VALUES ('68', 'sms_reg_template', '您的验证码为{code}，请在十分钟内完成操作！');
INSERT INTO `system_config` VALUES ('69', 'sms_secure', '可以找CUCI申请');
INSERT INTO `system_config` VALUES ('70', 'store_title', '测试商城');
INSERT INTO `system_config` VALUES ('71', 'store_order_wait_time', '0.50');
INSERT INTO `system_config` VALUES ('72', 'store_order_clear_time', '24.00');
INSERT INTO `system_config` VALUES ('73', 'store_order_confirm_time', '60.00');

-- ----------------------------
-- Table structure for `system_data`
-- ----------------------------
DROP TABLE IF EXISTS `system_data`;
CREATE TABLE `system_data` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '配置名',
  `value` longtext COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_data_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-数据';

-- ----------------------------
-- Records of system_data
-- ----------------------------

-- ----------------------------
-- Table structure for `system_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `system_jobs`;
CREATE TABLE `system_jobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `queue` varchar(100) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` bigint(20) unsigned NOT NULL DEFAULT '0',
  `reserved` bigint(20) unsigned NOT NULL DEFAULT '0',
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_jobs_reserved` (`reserved`) USING BTREE,
  KEY `index_system_jobs_attempts` (`attempts`) USING BTREE,
  KEY `index_system_jobs_reserved_at` (`reserved_at`) USING BTREE,
  KEY `index_system_jobs_available_at` (`available_at`) USING BTREE,
  KEY `index_system_jobs_create_at` (`created_at`) USING BTREE,
  KEY `index_system_jobs_queue` (`queue`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-任务';

-- ----------------------------
-- Records of system_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `system_jobs_log`
-- ----------------------------
DROP TABLE IF EXISTS `system_jobs_log`;
CREATE TABLE `system_jobs_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '' COMMENT '任务名称',
  `uri` varchar(500) DEFAULT '' COMMENT '任务对象',
  `later` bigint(20) unsigned DEFAULT '0' COMMENT '任务延时',
  `data` longtext COMMENT '任务数据',
  `desc` varchar(500) DEFAULT '' COMMENT '任务描述',
  `double` tinyint(1) unsigned DEFAULT '1' COMMENT '任务多开',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '任务状态(1新任务,2任务进行中,3任务成功,4任务失败)',
  `status_at` datetime DEFAULT NULL COMMENT '任务状态时间',
  `status_desc` varchar(500) DEFAULT '' COMMENT '任务状态描述',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_jobs_log_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-任务-日志';

-- ----------------------------
-- Records of system_jobs_log
-- ----------------------------

-- ----------------------------
-- Table structure for `system_log`
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `geoip` varchar(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为名称',
  `content` varchar(1024) NOT NULL DEFAULT '' COMMENT '操作内容描述',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='系统-日志';

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES ('1', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-08-20 08:58:49');
INSERT INTO `system_log` VALUES ('2', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-08-20 10:46:55');
INSERT INTO `system_log` VALUES ('3', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-08-20 12:26:48');
INSERT INTO `system_log` VALUES ('4', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-08-20 13:52:17');
INSERT INTO `system_log` VALUES ('5', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-08-20 14:33:38');
INSERT INTO `system_log` VALUES ('6', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-08-20 17:18:48');
INSERT INTO `system_log` VALUES ('7', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-08-20 17:19:29');
INSERT INTO `system_log` VALUES ('8', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-08-21 09:18:17');
INSERT INTO `system_log` VALUES ('9', 'admin/login/index', '125.121.191.208', '系统管理', '用户登录系统成功', 'admin', '2019-08-21 11:11:37');
INSERT INTO `system_log` VALUES ('10', 'admin/login/index', '125.121.191.208', '系统管理', '用户登录系统成功', 'admin', '2019-08-21 11:41:54');
INSERT INTO `system_log` VALUES ('11', 'admin/login/index', '125.121.191.208', '系统管理', '用户登录系统成功', 'admin', '2019-08-21 12:47:05');
INSERT INTO `system_log` VALUES ('12', 'admin/login/index', '125.121.191.208', '系统管理', '用户登录系统成功', 'admin', '2019-08-21 17:49:10');
INSERT INTO `system_log` VALUES ('13', 'admin/login/index', '183.128.78.182', '系统管理', '用户登录系统成功', 'admin', '2019-08-22 09:03:13');
INSERT INTO `system_log` VALUES ('14', 'admin/login/index', '183.128.78.182', '系统管理', '用户登录系统成功', 'admin', '2019-08-22 09:05:51');
INSERT INTO `system_log` VALUES ('15', 'admin/login/index', '183.128.78.182', '系统管理', '用户登录系统成功', 'admin', '2019-08-23 14:13:11');
INSERT INTO `system_log` VALUES ('16', 'admin/login/index', '183.128.78.182', '系统管理', '用户登录系统成功', 'admin', '2019-08-25 09:52:33');
INSERT INTO `system_log` VALUES ('17', 'admin/login/index', '122.235.218.14', '系统管理', '用户登录系统成功', 'admin', '2019-08-26 09:02:26');
INSERT INTO `system_log` VALUES ('18', 'admin/login/index', '122.235.218.14', '系统管理', '用户登录系统成功', 'admin', '2019-08-27 10:35:46');
INSERT INTO `system_log` VALUES ('19', 'admin/login/index', '122.235.218.14', '系统管理', '用户登录系统成功', 'admin', '2019-08-28 13:51:17');
INSERT INTO `system_log` VALUES ('20', 'admin/login/index', '36.23.213.42', '系统管理', '用户登录系统成功', 'admin', '2019-08-28 13:52:26');
INSERT INTO `system_log` VALUES ('21', 'admin/login/index', '122.235.218.14', '系统管理', '用户登录系统成功', 'admin', '2019-08-28 15:02:31');
INSERT INTO `system_log` VALUES ('22', 'admin/login/index', '183.156.153.116', '系统管理', '用户登录系统成功', 'admin', '2019-08-30 09:58:30');

-- ----------------------------
-- Table structure for `system_menu`
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned DEFAULT '0' COMMENT '父ID',
  `title` varchar(100) DEFAULT '' COMMENT '名称',
  `node` varchar(200) DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) DEFAULT '_self' COMMENT '打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_menu_node` (`node`(191)) USING BTREE,
  KEY `index_system_menu_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COMMENT='系统-菜单';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('1', '0', '后台首页', '', '', 'admin/index/main', '', '_self', '500', '1', '2018-09-05 17:59:38');
INSERT INTO `system_menu` VALUES ('2', '0', '系统管理', '', '', '#', '', '_self', '100', '1', '2018-09-05 18:04:52');
INSERT INTO `system_menu` VALUES ('3', '4', '系统菜单管理', '', 'layui-icon layui-icon-layouts', 'admin/menu/index', '', '_self', '1', '1', '2018-09-05 18:05:26');
INSERT INTO `system_menu` VALUES ('4', '2', '系统配置', '', '', '#', '', '_self', '20', '1', '2018-09-05 18:07:17');
INSERT INTO `system_menu` VALUES ('5', '12', '系统用户管理', '', 'layui-icon layui-icon-username', 'admin/user/index', '', '_self', '1', '1', '2018-09-06 11:10:42');
INSERT INTO `system_menu` VALUES ('7', '12', '访问权限管理', '', 'layui-icon layui-icon-vercode', 'admin/auth/index', '', '_self', '2', '1', '2018-09-06 15:17:14');
INSERT INTO `system_menu` VALUES ('11', '4', '系统参数配置', '', 'layui-icon layui-icon-set', 'admin/config/info', '', '_self', '4', '1', '2018-09-06 16:43:47');
INSERT INTO `system_menu` VALUES ('12', '2', '权限管理', '', '', '#', '', '_self', '10', '1', '2018-09-06 18:01:31');
INSERT INTO `system_menu` VALUES ('13', '0', '健身房管理', '', '', '#', '', '_self', '400', '1', '2018-10-12 13:56:29');
INSERT INTO `system_menu` VALUES ('14', '48', '商品信息管理', '', 'layui-icon layui-icon-component', 'store/goods/index', '', '_self', '3', '0', '2018-10-12 13:56:48');
INSERT INTO `system_menu` VALUES ('16', '0', '微信管理', '', '', '#', '', '_self', '300', '1', '2018-10-31 15:15:27');
INSERT INTO `system_menu` VALUES ('17', '16', '微信管理', '', '', '#', '', '_self', '20', '1', '2018-10-31 15:16:46');
INSERT INTO `system_menu` VALUES ('18', '17', '微信授权配置', '', 'layui-icon layui-icon-set', 'wechat/config/options', '', '_self', '2', '1', '2018-10-31 15:17:11');
INSERT INTO `system_menu` VALUES ('19', '17', '微信支付配置', '', 'layui-icon layui-icon-rmb', 'wechat/config/payment', '', '_self', '1', '1', '2018-10-31 18:28:09');
INSERT INTO `system_menu` VALUES ('20', '16', '微信定制', '', '', '#', '', '_self', '10', '1', '2018-11-13 11:46:27');
INSERT INTO `system_menu` VALUES ('21', '20', '图文素材管理', '', 'layui-icon layui-icon-template', 'wechat/news/index', '', '_self', '6', '1', '2018-11-13 11:46:55');
INSERT INTO `system_menu` VALUES ('22', '20', '粉丝信息管理', '', 'layui-icon layui-icon-user', 'wechat/fans/index', '', '_self', '5', '1', '2018-11-15 09:51:13');
INSERT INTO `system_menu` VALUES ('23', '20', '回复规则管理', '', 'layui-icon layui-icon-engine', 'wechat/keys/index', '', '_self', '4', '1', '2018-11-22 11:29:08');
INSERT INTO `system_menu` VALUES ('24', '20', '关注回复配置', '', 'layui-icon layui-icon-senior', 'wechat/keys/subscribe', '', '_self', '3', '1', '2018-11-27 11:45:28');
INSERT INTO `system_menu` VALUES ('25', '20', '默认回复配置', '', 'layui-icon layui-icon-survey', 'wechat/keys/defaults', '', '_self', '2', '1', '2018-11-27 11:45:58');
INSERT INTO `system_menu` VALUES ('26', '20', '微信菜单管理', '', 'layui-icon layui-icon-cellphone', 'wechat/menu/index', '', '_self', '1', '1', '2018-11-27 17:56:56');
INSERT INTO `system_menu` VALUES ('27', '4', '系统任务管理', '', 'layui-icon layui-icon-log', 'admin/queue/index', '', '_self', '3', '1', '2018-11-29 11:13:34');
INSERT INTO `system_menu` VALUES ('37', '0', '开放平台', '', '', '#', '', '_self', '200', '1', '2018-12-28 13:29:25');
INSERT INTO `system_menu` VALUES ('38', '40', '开放平台配置', '', 'layui-icon layui-icon-set', 'service/config/index', '', '_self', '0', '1', '2018-12-28 13:29:44');
INSERT INTO `system_menu` VALUES ('39', '40', '公众授权管理', '', 'layui-icon layui-icon-template-1', 'service/index/index', '', '_self', '0', '1', '2018-12-28 13:30:07');
INSERT INTO `system_menu` VALUES ('40', '37', '平台管理', '', '', '#', '', '_self', '0', '1', '2018-12-28 16:05:46');
INSERT INTO `system_menu` VALUES ('42', '48', '会员信息管理', '', 'layui-icon layui-icon-user', 'store/member/index', '', '_self', '1', '0', '2019-01-22 14:24:23');
INSERT INTO `system_menu` VALUES ('43', '48', '订单记录管理', '', 'layui-icon layui-icon-template-1', 'store/order/index', '', '_self', '2', '0', '2019-01-22 14:46:22');
INSERT INTO `system_menu` VALUES ('44', '48', '商品分类管理', '', 'layui-icon layui-icon-app', 'store/goods_cate/index', '', '_self', '4', '0', '2019-01-23 10:41:06');
INSERT INTO `system_menu` VALUES ('45', '47', '商城参数配置', '', 'layui-icon layui-icon-set', 'store/config/index', '', '_self', '5', '0', '2019-01-24 16:47:33');
INSERT INTO `system_menu` VALUES ('46', '47', '短信发送记录', '', 'layui-icon layui-icon-console', 'store/message/index', '', '_self', '4', '0', '2019-01-24 18:09:58');
INSERT INTO `system_menu` VALUES ('47', '13', '商城配置', '', '', '#', '', '_self', '20', '0', '2019-01-25 16:47:49');
INSERT INTO `system_menu` VALUES ('48', '13', '数据管理', '', '', '#', '', '_self', '10', '0', '2019-01-25 16:48:35');
INSERT INTO `system_menu` VALUES ('49', '4', '系统日志管理', '', 'layui-icon layui-icon-form', 'admin/oplog/index', '', '_self', '2', '1', '2019-02-18 12:56:56');
INSERT INTO `system_menu` VALUES ('50', '47', '快递公司管理', '', 'layui-icon layui-icon-form', 'store/express_company/index', '', '_self', '3', '0', '2019-04-01 17:10:59');
INSERT INTO `system_menu` VALUES ('52', '47', '邮费模板管理', '', 'layui-icon layui-icon-fonts-clear', 'store/express_template/index', '', '_self', '1', '0', '2019-04-23 13:17:10');
INSERT INTO `system_menu` VALUES ('55', '17', '微信数据统计', '', 'layui-icon layui-icon-chart-screen', 'wechat/index/index', '', '_self', '3', '1', '2019-06-15 15:03:51');
INSERT INTO `system_menu` VALUES ('56', '13', '活动管理', '', '', '#', '', '_self', '0', '1', '2019-08-20 10:47:09');
INSERT INTO `system_menu` VALUES ('57', '56', '活动列表管理', '', 'layui-icon layui-icon-group', 'gym/activity/index', '', '_self', '0', '1', '2019-08-20 13:54:45');
INSERT INTO `system_menu` VALUES ('58', '13', '课程分类管理', '', '', '#', '', '_self', '0', '1', '2019-08-20 16:17:45');
INSERT INTO `system_menu` VALUES ('59', '58', '课程分类管理', '', 'layui-icon layui-icon-spread-left', 'gym/category/index', '', '_self', '0', '1', '2019-08-20 16:18:23');
INSERT INTO `system_menu` VALUES ('60', '13', '教练管理', '', '', '#', '', '_self', '0', '1', '2019-08-21 14:34:16');
INSERT INTO `system_menu` VALUES ('61', '60', '教练管理', '', 'fa fa-street-view', 'gym/coach/index', '', '_self', '0', '1', '2019-08-21 14:35:23');
INSERT INTO `system_menu` VALUES ('62', '13', '课程管理', '', '', '#', '', '_self', '0', '1', '2019-08-21 16:02:18');
INSERT INTO `system_menu` VALUES ('63', '62', '课程表', '', 'layui-icon layui-icon-tabs', 'gym/course/index', '', '_self', '0', '1', '2019-08-21 16:03:45');
INSERT INTO `system_menu` VALUES ('64', '13', '充值金额', '', '', '#', '', '_self', '0', '1', '2019-08-25 11:12:03');
INSERT INTO `system_menu` VALUES ('65', '64', '充值金额管理', '', 'layui-icon layui-icon-rmb', 'gym/recharge_amount/index', '', '_self', '0', '1', '2019-08-25 11:16:04');
INSERT INTO `system_menu` VALUES ('66', '13', '代金券管理', '', '', '#', '', '_self', '0', '1', '2019-08-26 13:58:32');
INSERT INTO `system_menu` VALUES ('67', '66', '代金券管理', '', 'fa fa-map-o', 'gym/vouchers/index', '', '_self', '0', '1', '2019-08-26 13:59:39');

-- ----------------------------
-- Table structure for `system_user`
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) DEFAULT '' COMMENT '用户密码',
  `qq` varchar(16) DEFAULT '' COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT '' COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT '' COMMENT '联系手机',
  `login_at` datetime DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(255) DEFAULT '' COMMENT '登录IP',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `authorize` varchar(255) DEFAULT '' COMMENT '权限授权',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除(1:删除,0:未删)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_system_user_username` (`username`) USING BTREE,
  KEY `index_system_user_status` (`status`) USING BTREE,
  KEY `index_system_user_deleted` (`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COMMENT='系统-用户';

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('10000', 'admin', '21232f297a57a5a743894a0e4a801fc3', '22222222', '', '', '2019-08-30 09:58:30', '183.156.153.116', '633', '', '', '1', '0', '2015-11-13 15:14:22');

-- ----------------------------
-- Table structure for `wechat_fans`
-- ----------------------------
DROP TABLE IF EXISTS `wechat_fans`;
CREATE TABLE `wechat_fans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT '' COMMENT '公众号APPID',
  `unionid` varchar(100) DEFAULT '' COMMENT '粉丝unionid',
  `openid` varchar(100) DEFAULT '' COMMENT '粉丝openid',
  `tagid_list` varchar(100) DEFAULT '' COMMENT '粉丝标签id',
  `is_black` tinyint(1) unsigned DEFAULT '0' COMMENT '是否为黑名单状态',
  `subscribe` tinyint(1) unsigned DEFAULT '0' COMMENT '关注状态(0未关注,1已关注)',
  `nickname` varchar(200) DEFAULT '' COMMENT '用户昵称',
  `sex` tinyint(1) unsigned DEFAULT NULL COMMENT '用户性别(1男性,2女性,0未知)',
  `country` varchar(50) DEFAULT '' COMMENT '用户所在国家',
  `province` varchar(50) DEFAULT '' COMMENT '用户所在省份',
  `city` varchar(50) DEFAULT '' COMMENT '用户所在城市',
  `language` varchar(50) DEFAULT '' COMMENT '用户的语言(zh_CN)',
  `headimgurl` varchar(500) DEFAULT '' COMMENT '用户头像',
  `subscribe_time` bigint(20) unsigned DEFAULT '0' COMMENT '关注时间',
  `subscribe_at` datetime DEFAULT NULL COMMENT '关注时间',
  `remark` varchar(50) DEFAULT '' COMMENT '备注',
  `subscribe_scene` varchar(200) DEFAULT '' COMMENT '扫码关注场景',
  `qr_scene` varchar(100) DEFAULT '' COMMENT '二维码场景值',
  `qr_scene_str` varchar(200) DEFAULT '' COMMENT '二维码场景内容',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_wechat_fans_openid` (`openid`) USING BTREE,
  KEY `index_wechat_fans_unionid` (`unionid`) USING BTREE,
  KEY `index_wechat_fans_is_back` (`is_black`) USING BTREE,
  KEY `index_wechat_fans_subscribe` (`subscribe`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-粉丝';

-- ----------------------------
-- Records of wechat_fans
-- ----------------------------

-- ----------------------------
-- Table structure for `wechat_fans_tags`
-- ----------------------------
DROP TABLE IF EXISTS `wechat_fans_tags`;
CREATE TABLE `wechat_fans_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `appid` varchar(50) DEFAULT '' COMMENT '公众号APPID',
  `name` varchar(35) DEFAULT NULL COMMENT '标签名称',
  `count` bigint(20) unsigned DEFAULT '0' COMMENT '总数',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  KEY `index_wechat_fans_tags_id` (`id`) USING BTREE,
  KEY `index_wechat_fans_tags_appid` (`appid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-粉丝-标签';

-- ----------------------------
-- Records of wechat_fans_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `wechat_keys`
-- ----------------------------
DROP TABLE IF EXISTS `wechat_keys`;
CREATE TABLE `wechat_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appid` char(100) DEFAULT '' COMMENT '公众号APPID',
  `type` varchar(20) DEFAULT '' COMMENT '类型(text,image,news)',
  `keys` varchar(100) DEFAULT NULL COMMENT '关键字',
  `content` text COMMENT '文本内容',
  `image_url` varchar(255) DEFAULT '' COMMENT '图片链接',
  `voice_url` varchar(255) DEFAULT '' COMMENT '语音链接',
  `music_title` varchar(100) DEFAULT '' COMMENT '音乐标题',
  `music_url` varchar(255) DEFAULT '' COMMENT '音乐链接',
  `music_image` varchar(255) DEFAULT '' COMMENT '缩略图片',
  `music_desc` varchar(255) DEFAULT '' COMMENT '音乐描述',
  `video_title` varchar(100) DEFAULT '' COMMENT '视频标题',
  `video_url` varchar(255) DEFAULT '' COMMENT '视频URL',
  `video_desc` varchar(255) DEFAULT '' COMMENT '视频描述',
  `news_id` bigint(20) unsigned DEFAULT NULL COMMENT '图文ID',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序字段',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用,1启用)',
  `create_by` bigint(20) unsigned DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_wechat_keys_appid` (`appid`) USING BTREE,
  KEY `index_wechat_keys_type` (`type`) USING BTREE,
  KEY `index_wechat_keys_keys` (`keys`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-关键字';

-- ----------------------------
-- Records of wechat_keys
-- ----------------------------

-- ----------------------------
-- Table structure for `wechat_media`
-- ----------------------------
DROP TABLE IF EXISTS `wechat_media`;
CREATE TABLE `wechat_media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(100) DEFAULT '' COMMENT '公众号ID',
  `md5` varchar(32) DEFAULT '' COMMENT '文件md5',
  `type` varchar(20) DEFAULT '' COMMENT '媒体类型',
  `media_id` varchar(100) DEFAULT '' COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT '' COMMENT '本地文件链接',
  `media_url` varchar(300) DEFAULT '' COMMENT '远程图片链接',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_wechat_media_appid` (`appid`) USING BTREE,
  KEY `index_wechat_media_md5` (`md5`) USING BTREE,
  KEY `index_wechat_media_type` (`type`) USING BTREE,
  KEY `index_wechat_media_media_id` (`media_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-素材';

-- ----------------------------
-- Records of wechat_media
-- ----------------------------

-- ----------------------------
-- Table structure for `wechat_news`
-- ----------------------------
DROP TABLE IF EXISTS `wechat_news`;
CREATE TABLE `wechat_news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_id` varchar(100) DEFAULT '' COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT '' COMMENT '永久素材显示URL',
  `article_id` varchar(60) DEFAULT '' COMMENT '关联图文ID(用英文逗号做分割)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_wechat_news_artcle_id` (`article_id`) USING BTREE,
  KEY `index_wechat_news_media_id` (`media_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-图文';

-- ----------------------------
-- Records of wechat_news
-- ----------------------------

-- ----------------------------
-- Table structure for `wechat_news_article`
-- ----------------------------
DROP TABLE IF EXISTS `wechat_news_article`;
CREATE TABLE `wechat_news_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT '' COMMENT '素材标题',
  `local_url` varchar(300) DEFAULT '' COMMENT '永久素材显示URL',
  `show_cover_pic` tinyint(4) unsigned DEFAULT '0' COMMENT '显示封面(0不显示,1显示)',
  `author` varchar(20) DEFAULT '' COMMENT '文章作者',
  `digest` varchar(300) DEFAULT '' COMMENT '摘要内容',
  `content` longtext COMMENT '图文内容',
  `content_source_url` varchar(200) DEFAULT '' COMMENT '原文地址',
  `read_num` bigint(20) unsigned DEFAULT '0' COMMENT '阅读数量',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-图文-文章';

-- ----------------------------
-- Records of wechat_news_article
-- ----------------------------

-- ----------------------------
-- Table structure for `wechat_service_config`
-- ----------------------------
DROP TABLE IF EXISTS `wechat_service_config`;
CREATE TABLE `wechat_service_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `authorizer_appid` varchar(100) DEFAULT '' COMMENT '公众号APPID',
  `authorizer_access_token` varchar(200) DEFAULT '' COMMENT '公众号授权Token',
  `authorizer_refresh_token` varchar(200) DEFAULT '' COMMENT '公众号刷新Token',
  `func_info` varchar(100) DEFAULT '' COMMENT '公众号集权',
  `nick_name` varchar(50) DEFAULT '' COMMENT '公众号昵称',
  `head_img` varchar(200) DEFAULT '' COMMENT '公众号头像',
  `expires_in` bigint(20) DEFAULT NULL COMMENT 'Token有效时间',
  `service_type` tinyint(2) DEFAULT NULL COMMENT '微信类型(0代表订阅号,2代表服务号,3代表小程序)',
  `service_type_info` tinyint(2) DEFAULT NULL COMMENT '公众号实际类型',
  `verify_type` tinyint(2) DEFAULT NULL COMMENT '公众号认证类型(-1代表未认证, 0代表微信认证)',
  `verify_type_info` tinyint(2) DEFAULT NULL COMMENT '公众号实际认证类型',
  `user_name` varchar(100) DEFAULT '' COMMENT '众众号原始账号',
  `alias` varchar(100) DEFAULT '' COMMENT '公众号别名',
  `qrcode_url` varchar(200) DEFAULT '' COMMENT '公众号二维码',
  `business_info` varchar(255) DEFAULT '',
  `principal_name` varchar(255) DEFAULT '' COMMENT '公司名称',
  `miniprograminfo` varchar(1024) DEFAULT '' COMMENT '小程序JSON',
  `idc` tinyint(1) unsigned DEFAULT NULL,
  `signature` text COMMENT '小程序的描述',
  `total` bigint(20) unsigned DEFAULT '0' COMMENT '统计调用次数',
  `appkey` varchar(32) DEFAULT '' COMMENT '应用接口KEY',
  `appuri` varchar(255) DEFAULT '' COMMENT '应用接口URI',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1正常授权,0取消授权)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(0未删除,1已删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_wechat_service_config_authorizer_appid` (`authorizer_appid`) USING BTREE,
  KEY `index_wechat_service_config_status` (`status`) USING BTREE,
  KEY `index_wechat_service_config_is_deleted` (`is_deleted`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-授权';

-- ----------------------------
-- Records of wechat_service_config
-- ----------------------------
