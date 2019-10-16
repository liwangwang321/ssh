/*
MySQL Data Transfer
Source Host: 127.0.0.1
Source Database: crm
Target Host: 127.0.0.1
Target Database: crm
Date: 2019/9/4 14:26:11
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bas_dict
-- ----------------------------
DROP TABLE IF EXISTS `bas_dict`;
CREATE TABLE `bas_dict` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_type_name` varchar(50) NOT NULL,
  `dict_item` varchar(50) NOT NULL,
  `dict_value` varchar(50) NOT NULL,
  `dict_is_editable` int(11) NOT NULL,
  `dict_type` int(11) NOT NULL,
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cst_activity
-- ----------------------------
DROP TABLE IF EXISTS `cst_activity`;
CREATE TABLE `cst_activity` (
  `atv_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_no` varchar(20) NOT NULL,
  `atv_cust_name` varchar(100) DEFAULT NULL,
  `atv_date` datetime NOT NULL,
  `atv_place` varchar(200) NOT NULL,
  `atv_title` varchar(500) NOT NULL,
  `atv_remark` varchar(200) DEFAULT NULL,
  `atv_desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`atv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cst_customer
-- ----------------------------
DROP TABLE IF EXISTS `cst_customer`;
CREATE TABLE `cst_customer` (
  `cust_no` varchar(20) NOT NULL,
  `cust_name` varchar(100) NOT NULL,
  `cust_region` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cust_manager_name` varchar(50) DEFAULT NULL,
  `cust_level` int(11) DEFAULT NULL,
  `cust_level_label` varchar(50) DEFAULT NULL,
  `cust_satisfy` int(11) DEFAULT '3',
  `cust_credit` int(11) DEFAULT '3',
  `cust_addr` varchar(300) DEFAULT NULL,
  `cust_tel` varchar(50) DEFAULT NULL,
  `cust_website` varchar(50) DEFAULT NULL,
  `cust_bankroll` int(11) DEFAULT '0',
  `cust_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cust_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cst_linkman
-- ----------------------------
DROP TABLE IF EXISTS `cst_linkman`;
CREATE TABLE `cst_linkman` (
  `lkm_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_no` varchar(20) NOT NULL,
  `lkm_cust_name` varchar(100) DEFAULT NULL,
  `lkm_name` varchar(50) NOT NULL,
  `lkm_sex` varchar(5) DEFAULT NULL,
  `lkm_postion` varchar(50) DEFAULT NULL,
  `lkm_tel` varchar(50) NOT NULL,
  `lkm_memo` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`lkm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cst_lost
-- ----------------------------
DROP TABLE IF EXISTS `cst_lost`;
CREATE TABLE `cst_lost` (
  `lst_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_no` varchar(20) NOT NULL,
  `lst_cust_name` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `lst_cust_manager_name` varchar(50) NOT NULL,
  `lst_last_order_date` datetime DEFAULT NULL,
  `lst_lost_date` datetime DEFAULT NULL,
  `lst_delay` varchar(500) DEFAULT '  ',
  `lst_reason` varchar(500) DEFAULT NULL,
  `lst_status` int(11) NOT NULL,
  PRIMARY KEY (`lst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cst_service
-- ----------------------------
DROP TABLE IF EXISTS `cst_service`;
CREATE TABLE `cst_service` (
  `svr_id` int(11) NOT NULL AUTO_INCREMENT,
  `svr_type` varchar(20) NOT NULL,
  `svr_title` varchar(500) NOT NULL,
  `cust_no` varchar(20) DEFAULT NULL,
  `svr_cust_name` varchar(100) NOT NULL,
  `svr_status` int(11) NOT NULL,
  `svr_request` varchar(500) NOT NULL,
  `svr_create_id` int(11) NOT NULL,
  `svr_create_name` varchar(50) NOT NULL,
  `svr_create_date` varchar(255) NOT NULL,
  `svr_due_id` int(11) DEFAULT NULL,
  `svr_due_to` varchar(50) DEFAULT NULL,
  `svr_due_date` varchar(255) DEFAULT NULL,
  `svr_deal` varchar(500) DEFAULT NULL,
  `svr_deal_id` int(11) DEFAULT NULL,
  `svr_deal_name` varchar(50) DEFAULT NULL,
  `svr_deal_date` varchar(255) DEFAULT NULL,
  `svr_result` varchar(100) DEFAULT NULL,
  `svr_satisfy` int(11) DEFAULT NULL,
  PRIMARY KEY (`svr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `odr_id` int(11) NOT NULL AUTO_INCREMENT,
  `odr_customer` varchar(100) DEFAULT NULL,
  `odr_date` datetime DEFAULT NULL,
  `odr_addr` varchar(200) DEFAULT NULL,
  `odr_status` varchar(55) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `odr_price` double(20,0) DEFAULT NULL,
  PRIMARY KEY (`odr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(200) NOT NULL,
  `prod_type` varchar(100) NOT NULL,
  `prod_unit` varchar(10) DEFAULT NULL,
  `prod_price` double DEFAULT NULL,
  `prod_memo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sal_chance
-- ----------------------------
DROP TABLE IF EXISTS `sal_chance`;
CREATE TABLE `sal_chance` (
  `chc_id` int(11) NOT NULL AUTO_INCREMENT,
  `chc_source` varchar(50) DEFAULT NULL,
  `chc_cust_name` varchar(100) NOT NULL,
  `chc_title` varchar(200) NOT NULL,
  `chc_rate` int(11) NOT NULL,
  `chc_linkman` varchar(50) DEFAULT NULL,
  `chc_tel` varchar(50) DEFAULT NULL,
  `chc_desc` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `chc_create_by` varchar(50) NOT NULL,
  `chc_create_date` varchar(255) NOT NULL,
  `chc_due_id` int(11) DEFAULT NULL,
  `chc_due_to` varchar(50) DEFAULT NULL,
  `chc_due_date` varchar(255) DEFAULT NULL,
  `chc_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`chc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sal_plan
-- ----------------------------
DROP TABLE IF EXISTS `sal_plan`;
CREATE TABLE `sal_plan` (
  `pla_id` int(11) NOT NULL AUTO_INCREMENT,
  `chc_id` int(11) NOT NULL,
  `pla_date` varchar(255) NOT NULL,
  `pla_todo` varchar(500) NOT NULL,
  `pla_result` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`pla_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage` (
  `stk_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) NOT NULL,
  `stk_warehouse` varchar(50) NOT NULL,
  `stk_count` int(11) NOT NULL,
  `stk_memo` varchar(200) NOT NULL,
  PRIMARY KEY (`stk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `serialno` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `menu_id` varchar(50) NOT NULL,
  `menu_name` varchar(50) NOT NULL,
  `menu_url` varchar(50) NOT NULL,
  `menu_icon` varchar(200) NOT NULL,
  `menu_pid` varchar(50) NOT NULL,
  `menu_type` int(11) NOT NULL,
  PRIMARY KEY (`serialno`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` varchar(50) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `role_desc` varchar(50) DEFAULT NULL,
  `role_flag` int(11) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `rolemenu_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(50) NOT NULL,
  `menu_id` varchar(50) NOT NULL,
  `rolemenu_state` int(11) NOT NULL,
  PRIMARY KEY (`rolemenu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_flag` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `userrole_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` varchar(50) NOT NULL,
  PRIMARY KEY (`userrole_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `bas_dict` VALUES ('1', '地区', '湖南', '湖南', '1', '1');
INSERT INTO `bas_dict` VALUES ('2', '地区', '湖北', '湖北', '1', '1');
INSERT INTO `bas_dict` VALUES ('3', '地区', '北京', '北京', '1', '1');
INSERT INTO `bas_dict` VALUES ('4', '地区', '天津', '天津', '1', '1');
INSERT INTO `bas_dict` VALUES ('5', '地区', '广东', '广东', '1', '1');
INSERT INTO `bas_dict` VALUES ('6', '客户满意度', '☆', '1', '0', '2');
INSERT INTO `bas_dict` VALUES ('7', '客户满意度', '☆☆', '2', '0', '2');
INSERT INTO `bas_dict` VALUES ('8', '客户满意度', '☆☆☆', '3', '0', '2');
INSERT INTO `bas_dict` VALUES ('9', '客户满意度', '☆☆☆☆', '4', '0', '2');
INSERT INTO `bas_dict` VALUES ('10', '客户满意度', '☆☆☆☆☆', '5', '0', '2');
INSERT INTO `bas_dict` VALUES ('11', '客户等级', '战略合作伙伴', '1', '1', '3');
INSERT INTO `bas_dict` VALUES ('12', '客户等级', '合伙人', '2', '1', '3');
INSERT INTO `bas_dict` VALUES ('13', '客户等级', '投资人', '3', '1', '3');
INSERT INTO `bas_dict` VALUES ('14', '客户等级', '股东', '4', '1', '3');
INSERT INTO `bas_dict` VALUES ('15', '客户信用度', '☆', '1', '1', '4');
INSERT INTO `bas_dict` VALUES ('16', '客户信用度', '☆☆', '2', '1', '4');
INSERT INTO `bas_dict` VALUES ('17', '客户信用度', '☆☆☆', '3', '1', '4');
INSERT INTO `bas_dict` VALUES ('18', '客户信用度', '☆☆☆☆', '4', '1', '4');
INSERT INTO `bas_dict` VALUES ('19', '客户信用度', '☆☆☆☆☆', '5', '1', '4');
INSERT INTO `bas_dict` VALUES ('20', '客户状态', '不可用', '0', '1', '5');
INSERT INTO `bas_dict` VALUES ('21', '客户状态', '可用', '1', '1', '5');
INSERT INTO `bas_dict` VALUES ('22', '流失状态', '预警', '1', '1', '6');
INSERT INTO `bas_dict` VALUES ('23', '流失状态', '暂缓流失', '2', '1', '6');
INSERT INTO `bas_dict` VALUES ('24', '流失状态', '确认流失', '3', '1', '6');
INSERT INTO `bas_dict` VALUES ('25', '服务类型', '咨询', '1', '1', '7');
INSERT INTO `bas_dict` VALUES ('26', '服务类型', '建议', '2', '1', '7');
INSERT INTO `bas_dict` VALUES ('27', '服务类型', '投诉', '3', '1', '7');
INSERT INTO `bas_dict` VALUES ('28', '服务状态', '新创建', '1', '1', '8');
INSERT INTO `bas_dict` VALUES ('29', '服务状态', '已分配', '2', '1', '8');
INSERT INTO `bas_dict` VALUES ('30', '服务状态', '已处理', '3', '1', '8');
INSERT INTO `bas_dict` VALUES ('31', '服务状态', '已归档', '3', '1', '8');
INSERT INTO `bas_dict` VALUES ('35', '地区', '模拟', '模拟', '1', '1');
INSERT INTO `bas_dict` VALUES ('36', '服务类型', '模拟', '模拟', '1', '7');
INSERT INTO `cst_activity` VALUES ('2', 'MK4186', '卓京', '2019-09-03 19:44:00', '咖啡吧', '12', '12', '12');
INSERT INTO `cst_customer` VALUES ('MK0668', '琳达科技', null, '4', 'liye', null, null, '3', '3', null, '166-5133-1319', null, '0', '1');
INSERT INTO `cst_customer` VALUES ('MK1056', '亚健康终结者', null, '4', 'liye', null, null, '3', '3', null, '13389108932', null, '0', '1');
INSERT INTO `cst_customer` VALUES ('MK1161', '煎饼果子公司', null, '4', 'liye', null, null, '3', '3', null, '1438192374', null, '0', '1');
INSERT INTO `cst_customer` VALUES ('MK2762', '马猴烧酒有限公司', '湖北', '4', 'liye', '2', null, '4', '3', '黄海雨街', '17789023417', 'www.78da.com', '8902', '1');
INSERT INTO `cst_customer` VALUES ('MK3153', '惠普科技有限公司', '广东', '4', 'liye', '3', null, '3', '3', '北京', '176-5689-8123', 'www.baidu.com', '20030000', '1');
INSERT INTO `cst_customer` VALUES ('MK3677', '华农电动', '湖南', '4', 'liye', '1', null, '5', '3', '湖南长沙岳麓区', '156-1356-1235', '', '19000000', '1');
INSERT INTO `cst_customer` VALUES ('MK4071', '腾讯公司', null, '4', 'liye', null, null, '3', '3', null, '176-8888-33333', null, '0', '1');
INSERT INTO `cst_customer` VALUES ('MK4186', '卓京', '湖北', '28', '可用liye', '1', null, '5', '4', '浪琴湾', '1783232123', 'www.baidu.com', '129999999', '1');
INSERT INTO `cst_customer` VALUES ('MK5055', '卓鼎', '湖南', '28', '可用liye', '4', null, '3', '3', 'langqw', '13289218933', 'www..baidu.com', '222222222', '1');
INSERT INTO `cst_customer` VALUES ('MK6180', '心心相映', null, '4', 'liye', null, null, '3', '3', null, '13278913782', null, '0', '1');
INSERT INTO `cst_customer` VALUES ('MK8638', '召唤与合成', null, '4', 'liye', null, null, '3', '3', null, '18523422341', null, '0', '1');
INSERT INTO `cst_customer` VALUES ('MK9251', '酷睿电动', null, '4', 'liye', null, null, '3', '3', null, '176-5232-8219', null, '0', '1');
INSERT INTO `cst_customer` VALUES ('MK9641', '酷睿数码', null, '4', 'liye', null, null, '3', '3', null, '126-5323-8219', null, '0', '1');
INSERT INTO `cst_linkman` VALUES ('1', 'MK4186', '卓京', '小李哥', '男', '销售总监', '17233556666', '对我们长期合作感兴趣');
INSERT INTO `cst_lost` VALUES ('2', 'MK1056', '亚健康终结者', '4', 'liye', '2019-09-17 16:52:28', null, ' \n请他喝茶\n						---2019-9-3 19:45:36\n请他吃饭\n						---2019-9-3 19:45:48', null, '2');
INSERT INTO `cst_lost` VALUES ('3', 'MK3153', '惠普科技有限公司', '4', 'liye', '2019-04-11 12:35:58', '2019-09-03 19:46:23', 'dddd\r\n发啊发发发\r\n						---2019-9-3 12:24:38\r\n发啊发发发\r\n						---2019-9-3 12:24:38', '合不来', '3');
INSERT INTO `cst_service` VALUES ('3', '1', '问我们的一个资费问题', 'MK4071', '腾讯公司', '4', '一个运费要多少，我们要包年', '4', 'liye', '2019-9-3-15:52', '3', 'cenyu', '2019-09-03 16:46:51', '多充钱越强', '4', 'liye', '2019-09-03 16:48:48', '已解决', '5');
INSERT INTO `cst_service` VALUES ('4', '1', '一个产品可以包邮吗', 'MK0668', '琳达科技', '4', '一个产品可以包邮吗，要多少才能包邮', '4', 'liye', '2019-9-3-15:52', '3', 'cenyu', '2019-09-03 16:46:57', '可以的哦亲', '4', 'liye', '2019-09-03 16:49:01', '已解决', '5');
INSERT INTO `cst_service` VALUES ('5', '2', '我建议你们也运动运动', 'MK1056', '亚健康终结者', '1', '整天在电脑前，能不亚健康吗，多出来运动运动', '4', 'liye', '2019-9-3-15:52', null, null, null, null, null, null, null, null, null);
INSERT INTO `cst_service` VALUES ('6', '2', '来一个', 'MK1161', '煎饼果子公司', '4', '煎饼果子来一套', '4', 'liye', '2019-9-3-15:52', '3', 'cenyu', '2019-09-03 16:47:05', '好的，欢迎下次再来', '4', 'liye', '2019-09-03 16:49:20', '已解决', '4');
INSERT INTO `cst_service` VALUES ('7', '2', '华农兄弟', 'MK3677', '华农电动', '2', '这个好像有点不聪明的亚子啊', '4', 'liye', '2019-9-3-15:52', '20', '关羽', '2019-09-03 18:28:24', null, '4', 'liye', null, null, null);
INSERT INTO `cst_service` VALUES ('8', '2', '纸张太多纸屑了', 'MK6180', '心心相映心心相映', '4', '解决纸屑问题，让纸巾更柔顺', '4', 'liye', '2019-9-3-16:3', '3', 'cenyu', '2019-09-03 16:47:35', '我会解决的', '4', 'liye', '2019-09-03 16:49:33', '已解决', '3');
INSERT INTO `cst_service` VALUES ('9', '1', '游戏公司', 'MK8638', '召唤与合成', '4', '充值问题', '4', 'liye', '2019-9-3-16:5', '3', 'cenyu', '2019-09-03 16:47:19', '多出联动', '4', 'liye', '2019-09-03 16:49:51', '已解决', '3');
INSERT INTO `cst_service` VALUES ('10', '3', '小动车耗油厉害', 'MK9251', '酷睿电动', '3', '要把这个问题解决！从根本上解决', '4', 'liye', '2019-9-3-16:5', '20', '关羽', '2019-09-03 18:28:35', '好的，稍后处理', '4', 'liye', '2019-09-03 18:32:33', null, null);
INSERT INTO `cst_service` VALUES ('11', '2', '数码相机像素要加强', 'MK9641', '酷睿数码', '4', '像素有待提高', '4', 'liye', '2019-9-3-16:5', '3', 'cenyu', '2019-09-03 16:47:44', '需要甲方加大资金才能解决', '4', 'liye', '2019-09-03 16:50:20', '已解决', '4');
INSERT INTO `cst_service` VALUES ('12', '3', '锻炼导致体力透支', 'MK1056', '亚健康终结者', '1', '减少锻炼时间', '4', 'liye', '2019-9-3-16:5', null, null, null, null, null, null, null, null, null);
INSERT INTO `cst_service` VALUES ('13', '1', '魔法少女', 'MK2762', '马猴烧酒有限公司', '4', '少女，渴望力量吗，来成为马猴烧酒吧', '4', 'liye', '2019-9-3-16:41', '3', 'cenyu', '2019-09-03 16:44:22', '好的，我渴望力量！！！', '4', 'liye', '2019-09-03 16:45:13', '我力量很强', '4');
INSERT INTO `cst_service` VALUES ('14', '2', '建议出行', 'MK2762', '马猴烧酒有限公司', '2', '出行的时候多穿点', '20', '关羽', '2019-9-3-18:26', '20', '关羽', '2019-09-03 18:28:07', null, '4', 'liye', null, null, null);
INSERT INTO `cst_service` VALUES ('15', '3', '你们不运动', 'MK1056', '亚健康终结者', '1', '你们不运动怎么能行呢', '20', '关羽', '2019-9-3-18:26', null, null, null, null, null, null, null, null, null);
INSERT INTO `cst_service` VALUES ('16', '2', '建议多放点辣椒', 'MK1161', '煎饼果子公司', '2', '能不能多放点辣椒，没味啊', '20', '关羽', '2019-9-3-18:28', '20', '关羽', '2019-09-03 18:31:17', null, '20', '关羽', null, null, null);
INSERT INTO `cst_service` VALUES ('17', '1', '充钱能变强吗', 'MK9251', '酷睿电动', '3', '充钱变强的快，还是秃头变强的快', '20', '关羽', '2019-9-3-18:28', '20', '关羽', '2019-09-03 18:31:10', '能哦，亲', '4', 'liye', '2019-09-03 18:31:53', null, null);
INSERT INTO `cst_service` VALUES ('18', '1', '学技术999', 'MK4186', '卓京', '4', '学好技术', '28', '可用liye', '2019-9-3-19:47', '3', 'cenyu', '2019-09-03 19:54:49', 'kkkkkkkkkk', '28', '可用liye', '2019-09-03 19:56:30', '晓哥棒棒', '5');
INSERT INTO `cst_service` VALUES ('19', '2', '坎坎坷坷扩', 'MK5055', '卓鼎', '4', '学混顶顶顶顶', '28', '可用liye', '2019-9-3-19:47', '3', 'cenyu', '2019-09-03 19:59:42', '是的发送到', '20', '师傅', '2019-09-03 20:01:34', '好', '5');
INSERT INTO `cst_service` VALUES ('20', '3', '没空看扩扩扩扩', 'MK2762', '马猴烧酒有限公司', '3', '就看看扩扩', '28', '可用liye', '2019-9-3-19:47', '3', 'cenyu', '2019-09-03 19:55:21', 'gggggggg', '28', '可用liye', '2019-09-03 19:56:43', null, null);
INSERT INTO `cst_service` VALUES ('21', '1', '啦啦啦啦啦', 'MK3153', '惠普科技有限公司', '4', '放松放松发顺丰', '28', '可用liye', '2019-9-3-19:47', '3', 'cenyu', '2019-09-03 19:59:48', 'dad', '20', '师傅', '2019-09-03 20:01:26', '项目结束', '5');
INSERT INTO `orders` VALUES ('1', '腾讯', '2018-08-12 00:00:00', '湖南长沙', '已回款', '6', '2888');
INSERT INTO `orders` VALUES ('2', '琳达科技', '2018-08-12 00:00:00', '湖南长沙', '已回款', '6', '121251');
INSERT INTO `orders` VALUES ('3', '亚健康终结者', '2018-08-12 00:00:00', '湖南长沙', '已回款', '6', '12341');
INSERT INTO `orders` VALUES ('4', '惠普科技有限公司', '2018-08-12 00:00:00', '湖南长沙', '已回款', '6', '12312');
INSERT INTO `orders` VALUES ('5', '长沙跑得快公司', '2018-08-12 00:00:00', '湖南长沙', '未回款', '6', '12334');
INSERT INTO `orders` VALUES ('6', '华农电动', '2018-08-12 00:00:00', '湖南长沙', '未回款', '6', '345');
INSERT INTO `orders` VALUES ('7', '酷睿电动', '2018-08-12 00:00:00', '湖南长沙', '未回款', '6', '123345');
INSERT INTO `orders` VALUES ('8', '腾讯1号', '2018-08-12 00:00:00', '湖南长沙', '未回款', '6', '838');
INSERT INTO `orders` VALUES ('9', '酷睿数码', '2018-08-12 00:00:00', '湖南长沙', '未回款', '6', '1685');
INSERT INTO `orders` VALUES ('10', '腾讯1', '2018-08-12 00:00:00', '湖南长沙', '未回款', '6', '2312');
INSERT INTO `product` VALUES ('1', '幸福牌电视机', '818 FFT', '台', '7500', '待生产');
INSERT INTO `product` VALUES ('2', '海尔空调', '777 TFE', '台', '5400', '待生产');
INSERT INTO `product` VALUES ('3', '海尔空调', '677 UTY', '台', '6400', '库存量太多');
INSERT INTO `product` VALUES ('4', '海尔空调', '237 ETR', '台', '4400', '');
INSERT INTO `product` VALUES ('5', '海龙笔记本', 'i8TuE', '台', '6750', '');
INSERT INTO `product` VALUES ('6', '海龙笔记本', '77p', '台', '5500', '待生产');
INSERT INTO `product` VALUES ('7', '大宝牌电动车', 'GTR', '台', '9400', '牛逼的一批');
INSERT INTO `product` VALUES ('8', '大宝牌SOD蜜', '男士', '瓶', '400', '一擦即白');
INSERT INTO `product` VALUES ('9', '大宝牌SOD蜜', '女士', '瓶', '600', '一擦即怀孕');
INSERT INTO `product` VALUES ('10', '旺旺牌空调', '123 TT', '台', '5400', '待生产');
INSERT INTO `product` VALUES ('11', '钰狗子牌大便', '牛粪', '坨', '200', '库存量太多');
INSERT INTO `product` VALUES ('12', '钰狗子牌辣条', '超大包', '箱', '400', '吃的想吐的感觉');
INSERT INTO `product` VALUES ('13', '烨狗子洗脚水', '昨晚的', '桶', '650', '');
INSERT INTO `product` VALUES ('14', '烨子卫生巾', '夜用', '包', '50', '用货量太大');
INSERT INTO `product` VALUES ('15', '大宝牌火箭', 'GTR', '台', '9422200', '牛逼的一批');
INSERT INTO `sal_chance` VALUES ('1', '通过上门顾问', '酷睿数码', '采购笔记本意向', '80', '杨力伟', '176-5513-8219', '访谈过程中对和我方合作兴趣很大，主要在笔记本放面。', '3', 'chenyu', '2019-09-03 02:36:55', null, null, null, '1');
INSERT INTO `sal_chance` VALUES ('3', '通过上门顾问', '长江科技', '有购买电冰箱意向', '60', '王建木', '156-5223-1571', '对电冰箱话题很感兴趣，但不怎么提购买意向。', '3', 'chenyu', '2019-09-03 02:42:25', null, null, null, '1');
INSERT INTO `sal_chance` VALUES ('5', '通过上门顾问', '常新电动科技', '建立合作', '80', '王小包', '139-7733-2678', '有意向与本公司签订合作协议。', '3', 'chenyu', '2019-09-03 02:47:32', null, null, null, '1');
INSERT INTO `sal_chance` VALUES ('6', '通过上门顾问', '琳达科技', '采购笔记本意向', '50', '小李', '166-5133-1319', '想大批购买笔记本产品', '3', 'chenyu', '2019-09-03 02:49:55', '4', 'liye', '2019-09-03 02:59:14', '3');
INSERT INTO `sal_chance` VALUES ('7', '通过上门顾问', '酷睿数码', '购买笔记本', '90', '阳丹', '126-5323-8219', '有很大兴趣和本公司合作。', '3', 'chenyu', '2019-09-03 02:51:10', '4', 'liye', '2019-09-03 02:58:34', '3');
INSERT INTO `sal_chance` VALUES ('8', '通过广告电话', '华农电动', '购买电动车产品', '78', '杨力', '156-1356-1235', '对电动车产品询问次数很多，', '3', 'chenyu', '2019-09-03 02:52:37', '4', 'liye', '2019-09-03 05:36:51', '3');
INSERT INTO `sal_chance` VALUES ('9', '通过上门顾问', '酷睿电动', '建立合作关系', '80', '杨伟', '176-5232-8219', '与本公司达成合作协议', '3', 'chenyu', '2019-09-03 02:53:36', '4', 'liye', '2019-09-03 05:36:59', '3');
INSERT INTO `sal_chance` VALUES ('10', '通过上门顾问', '丽泽公司', '想成为公司股东', '88', '刘大川', '136-5123-8231', '对本公司包有极大兴趣。', '3', 'chenyu', '2019-09-03 02:55:05', '4', 'liye', '2019-09-03 05:36:43', '4');
INSERT INTO `sal_chance` VALUES ('11', '通过上门顾问', '惠普科技有限公司', '采购笔记本意向', '80', '谢斜宁', '176-5689-8123', '建立长期合同', '3', 'chenyu', '2019-09-03 02:56:19', '4', 'liye', '2019-09-03 05:36:23', '3');
INSERT INTO `sal_chance` VALUES ('12', '小卡片', '腾讯公司', '收购我们公司', '90', '马化腾', '176-8888-33333', '谈的来', '2', 'wangwang', '2019-09-03 05:20:08', '4', 'liye', '2019-09-03 05:37:12', '3');
INSERT INTO `sal_chance` VALUES ('13', '打电话访问', '广东香菱公司', '购买马桶', '90', '李小力', '179-2331-5112', '对笔记本也感兴趣', '2', 'wangwang', '2019-09-03 05:21:36', '4', 'liye', '2019-09-03 05:38:02', '4');
INSERT INTO `sal_chance` VALUES ('14', '游泳健身认识', '亚健康终结者', '健身教练拉客户', '40', '张力', '13389108932', '游泳认识', '2', 'wangwang', '2019-09-03 05:24:24', '4', 'liye', '2019-09-03 05:37:41', '3');
INSERT INTO `sal_chance` VALUES ('15', '蹲坑认识', '心心相映', '大公司', '67', '张先生', '13278913782', '嘿嘿', '2', 'wangwang', '2019-09-03 05:25:47', '4', 'liye', '2019-09-03 05:37:31', '3');
INSERT INTO `sal_chance` VALUES ('16', '买煎饼果子', '煎饼果子公司', '好吃', '78', '李大姐', '1438192374', '他的果子很好吃', '2', 'wangwang', '2019-09-03 05:27:24', '4', 'liye', '2019-09-03 05:38:11', '3');
INSERT INTO `sal_chance` VALUES ('17', '发传单', '曾有情趣公司', '产品很好', '45', '曾大哥', '18932028934', '产品有很多', '2', 'wangwang', '2019-09-03 05:28:50', '4', 'liye', '2019-09-03 15:39:54', '4');
INSERT INTO `sal_chance` VALUES ('18', '家教', '小尚家教', '嘿嘿', '32', '尚老师', '178995078212', '孩子的家教老师', '2', 'wangwang', '2019-09-03 05:30:48', null, null, null, '1');
INSERT INTO `sal_chance` VALUES ('19', '看画展认识', '小小画廊', '他聊的比我投机', '88', '李晓东', '18977160923', '我觉得能成', '2', 'wangwang', '2019-09-03 05:33:04', '4', 'liye', '2019-09-03 15:40:38', '4');
INSERT INTO `sal_chance` VALUES ('20', '滴滴拼车认识', '力保健家电', '嘿嘿', '55', '陈大海', '13757438916', '家电卖不出，找人帮忙\n', '2', 'wangwang', '2019-09-03 05:35:20', '4', 'liye', '2019-09-03 15:40:21', '4');
INSERT INTO `sal_chance` VALUES ('23', '微博', '召唤与合成', '在聊天过程中聊到产品信息，他对本公司的产品感兴趣', '80', '丽丽', '18523422341', '开发的可能性比较的大', '3', 'cenyu', '2019-09-03 15:26:46', '4', 'liye', '2019-09-03 15:40:08', '3');
INSERT INTO `sal_chance` VALUES ('24', '聚餐上聊得投机', '马猴烧酒有限公司', '我们的产品对他们有帮助', '67', '小圆', '17789023417', '她对我们的产品有大量需求', '3', 'cenyu', '2019-09-03 16:13:23', '4', 'liye', '2019-09-03 16:33:23', '3');
INSERT INTO `sal_chance` VALUES ('25', '聚会认识', '卓京', '我们的产品对他们有帮助', '50', '张小', '1783232123', '他比我还投机', '30', '可用cenyu', '2019-09-03 19:28:10', '28', '可用liye', '2019-09-03 19:30:27', '3');
INSERT INTO `sal_chance` VALUES ('26', '聚会上认识', '卓鼎', '我们的产品对他们有帮助', '50', '李四', '13289218933', '需要50台空调', '30', '可用cenyu', '2019-09-03 19:29:03', '28', '可用liye', '2019-09-03 19:30:37', '3');
INSERT INTO `sal_chance` VALUES ('27', '聚会上认识', '马猴烧酒', '我们的产品对他们有帮助', '89', '小圆', '13323427832', '马猴烧酒', '30', '可用cenyu', '2019-09-03 19:29:55', '28', '可用liye', '2019-09-03 19:30:47', '4');
INSERT INTO `sal_plan` VALUES ('10', '6', '2019-09-03 05:39:09', '第一次喝酒', '花了我50,');
INSERT INTO `sal_plan` VALUES ('11', '7', '2019-09-03 05:40:03', '一个人我就能解决', '还好了');
INSERT INTO `sal_plan` VALUES ('12', '7', '2019-09-03 05:40:14', '第二次上', '不行啊');
INSERT INTO `sal_plan` VALUES ('13', '8', '2019-09-03 05:41:11', '给他100，他不要啊', '结果他给了我200.。。');
INSERT INTO `sal_plan` VALUES ('14', '11', '2019-09-03 05:42:04', '挺好的，他会唱会跳会rap', '可惜我们不要');
INSERT INTO `sal_plan` VALUES ('15', '21', '2019-09-03 13:14:07', '第一天见面', '他挺好的');
INSERT INTO `sal_plan` VALUES ('16', '21', '2019-09-03 13:26:36', '第二次喝酒', '没什么问题了');
INSERT INTO `sal_plan` VALUES ('17', '22', '2019-09-03 13:29:42', '第一次见面', '印象不太好');
INSERT INTO `sal_plan` VALUES ('18', '12', '2019-09-03 15:42:12', '对方发出一句狠话，1000万', '我说我要请教一下老板');
INSERT INTO `sal_plan` VALUES ('19', '12', '2019-09-03 15:43:13', '老板说，我们的后台也是马总', '我把他打了一顿，并高兴的说我们的后台也是马总');
INSERT INTO `sal_plan` VALUES ('20', '15', '2019-09-03 15:45:01', '第一天，去拉去喝酒', '他不怎么喝');
INSERT INTO `sal_plan` VALUES ('21', '15', '2019-09-03 15:45:40', '请他去玩一玩', '他要我去');
INSERT INTO `sal_plan` VALUES ('22', '23', '2019-09-03 15:46:39', '继续聊天', '他要我给他发公司产品信息库');
INSERT INTO `sal_plan` VALUES ('23', '16', '2019-09-03 15:48:07', '他说我们的产品挺好吃的', '但我想了想，我们的产品是电器啊');
INSERT INTO `sal_plan` VALUES ('24', '17', '2019-09-03 15:48:53', '聊天中', '他粗鲁的骂了我');
INSERT INTO `sal_plan` VALUES ('25', '19', '2019-09-03 15:49:51', '聊天中', '他对我非常冷淡');
INSERT INTO `sal_plan` VALUES ('26', '20', '2019-09-03 15:50:30', '聊天中', '他只发嘿嘿。。。');
INSERT INTO `sal_plan` VALUES ('27', '24', '2019-09-03 16:33:57', '约谈出来见面', 'e');
INSERT INTO `sal_plan` VALUES ('28', '24', '2019-09-03 16:34:54', '是的，要完成了', 'e');
INSERT INTO `sal_plan` VALUES ('29', '24', '2019-09-03 16:35:25', '快好了', 'e');
INSERT INTO `sal_plan` VALUES ('30', '25', '2019-09-03 19:31:33', '第一天约她见面会谈', '见面成功，兴趣河大');
INSERT INTO `sal_plan` VALUES ('31', '25', '2019-09-03 19:37:05', '再次约会', '签订合同');
INSERT INTO `sal_plan` VALUES ('32', '26', '2019-09-03 19:38:07', '喝酒', '喝醉了签合同');
INSERT INTO `storage` VALUES ('1', '1', '北京-北二环西北直门库', '182', '预存不足');
INSERT INTO `storage` VALUES ('2', '2', '北京-西六环西直门库', '12', '下次进货1000');
INSERT INTO `storage` VALUES ('3', '1', '长沙-岳麓库', '1112', '部分不可用');
INSERT INTO `storage` VALUES ('4', '3', '长沙-北沙东库', '18232', '预存超出');
INSERT INTO `storage` VALUES ('5', '1', '南京-南街西直门库', '1812', '');
INSERT INTO `storage` VALUES ('6', '5', '广州-中山步行街库', '182', '预存不足');
INSERT INTO `storage` VALUES ('7', '6', '南京-田安直库', '42', '预存不足');
INSERT INTO `storage` VALUES ('8', '8', '武汉-步行街西库', '122', '下次进货1000');
INSERT INTO `storage` VALUES ('9', '3', '四川-辣妹子库', '18112', '预存不足');
INSERT INTO `storage` VALUES ('10', '12', '广西-恰槟榔不咯库', '222', '部分不可用');
INSERT INTO `storage` VALUES ('11', '11', '南京-田安直库', '1832', '预存不足');
INSERT INTO `storage` VALUES ('12', '10', '北京-北二环西直门库', '18122', '预存超出');
INSERT INTO `storage` VALUES ('13', '2', '四川-辣妹子库', '132', '预存不足');
INSERT INTO `storage` VALUES ('14', '3', '北京-北二环西直门库', '32', '预存不足');
INSERT INTO `storage` VALUES ('15', '6', '广州-中山步行街库', '1832', '');
INSERT INTO `storage` VALUES ('16', '8', '南京-田安直库', '18221', '预存超出');
INSERT INTO `storage` VALUES ('17', '2', '北京-北二环西直门库', '182', '');
INSERT INTO `storage` VALUES ('18', '7', '长沙-岳麓库', '181', '预存不足');
INSERT INTO `storage` VALUES ('19', '13', '北京-北二环西直门库', '1123', '');
INSERT INTO `storage` VALUES ('20', '12', '武汉-步行街西库', '232', '预存不足');
INSERT INTO `storage` VALUES ('21', '13', '四川-辣妹子库', '552', '');
INSERT INTO `storage` VALUES ('22', '6', '长沙-岳麓库', '162', '预存不足');
INSERT INTO `sys_menu` VALUES ('00000000001', '000', '客户关系管理系统', '', '', '-1', '0');
INSERT INTO `sys_menu` VALUES ('00000000002', '001', '营销管理', '', '', '000', '0');
INSERT INTO `sys_menu` VALUES ('00000000003', '002', '客户管理', '', '', '000', '0');
INSERT INTO `sys_menu` VALUES ('00000000004', '003', '服务管理', '', '', '000', '0');
INSERT INTO `sys_menu` VALUES ('00000000005', '004', '统计报表', '', '', '000', '0');
INSERT INTO `sys_menu` VALUES ('00000000006', '005', '基础数据', '', '', '000', '0');
INSERT INTO `sys_menu` VALUES ('00000000007', '001001', '销售机会管理', 'jsp/marketingjsp/sal.jsp', '', '001', '1');
INSERT INTO `sys_menu` VALUES ('00000000008', '001002', '客户开发计划', 'jsp/marketingjsp/plan.jsp', '', '001', '1');
INSERT INTO `sys_menu` VALUES ('00000000009', '002001', '客户信息管理', 'jsp/clientjsp/clientIndex.jsp', '', '002', '1');
INSERT INTO `sys_menu` VALUES ('00000000010', '002002', '客户流失管理', 'jsp/clientjsp/lostIndex.jsp', '', '002', '1');
INSERT INTO `sys_menu` VALUES ('00000000011', '003001', '服务创建', 'jsp/servicejsp/createservice.jsp', '', '003', '1');
INSERT INTO `sys_menu` VALUES ('00000000012', '003002', '服务分配', 'jsp/servicejsp/distributionservice.jsp', '', '003', '1');
INSERT INTO `sys_menu` VALUES ('00000000013', '003003', '服务处理', 'jsp/servicejsp/dealservice.jsp', '', '003', '1');
INSERT INTO `sys_menu` VALUES ('00000000014', '003004', '服务反馈', 'jsp/servicejsp/allocationservice.jsp', '', '003', '1');
INSERT INTO `sys_menu` VALUES ('00000000015', '003005', '服务归档', 'jsp/servicejsp/archiveservice.jsp', '', '003', '1');
INSERT INTO `sys_menu` VALUES ('00000000016', '004001', '客户贡献分析', 'jsp/marketingjsp/screport.jsp', '', '004', '1');
INSERT INTO `sys_menu` VALUES ('00000000017', '004002', '客户构成分析', 'jsp/marketingjsp/ccreport.jsp', '', '004', '1');
INSERT INTO `sys_menu` VALUES ('00000000018', '004003', '客户服务分析', 'jsp/marketingjsp/csreport.jsp', '', '004', '1');
INSERT INTO `sys_menu` VALUES ('00000000019', '004004', '客户流失分析', 'jsp/marketingjsp/lcreport.jsp', '', '004', '1');
INSERT INTO `sys_menu` VALUES ('00000000020', '005001', '数据字典管理', 'jsp/datajsp/dictIndex.jsp', '', '005', '1');
INSERT INTO `sys_menu` VALUES ('00000000021', '005002', '查询产品信息', 'jsp/datajsp/productIndex.jsp', '', '005', '1');
INSERT INTO `sys_menu` VALUES ('00000000022', '005003', '查询库存', 'jsp/datajsp/StorageIndex.jsp', '', '005', '1');
INSERT INTO `sys_menu` VALUES ('00000000023', '006', '权限管理', '', '', '000', '0');
INSERT INTO `sys_menu` VALUES ('00000000024', '006001', '用户管理', 'jsp/rolejsp/userManger.jsp', '', '006', '1');
INSERT INTO `sys_menu` VALUES ('00000000025', '006002', '角色管理', 'jsp/rolejsp/roleManger.jsp', '', '006', '1');
INSERT INTO `sys_menu` VALUES ('00000000026', '006003', '菜单管理', 'jsp/rolejsp/menuManger.jsp', '', '006', '1');
INSERT INTO `sys_menu` VALUES ('00000000029', '002003', '历史订单', 'jsp/clientjsp/orderIndex.jsp', '', '002', '1');
INSERT INTO `sys_menu` VALUES ('00000000036', '007', '模拟', 'jsp', '', '000', '0');
INSERT INTO `sys_menu` VALUES ('00000000037', '007001', '模拟1', 'Jsp', '', '007', '1');
INSERT INTO `sys_role` VALUES ('r001', '超级管理员', '拥有所有权限', '1');
INSERT INTO `sys_role` VALUES ('r002', '系统管理员', '管理系统用户、角色与权限，保证系统正常运行。', '1');
INSERT INTO `sys_role` VALUES ('r003', '客户经理', '创建销售机会,对特定销售机会制定客户开发计划,执行客户开发计划,对负责的流失客户采取措施,', '1');
INSERT INTO `sys_role` VALUES ('r004', '高管', '审查客户贡献数据、客户构成数据、客户服务构成数据和客户流失数据。', '1');
INSERT INTO `sys_role` VALUES ('r005', '销售主管', '对客户服务进行分配,创建销售机会,对销售机会进行指派,对特定销售机会制定客户开发计划。', '1');
INSERT INTO `sys_role` VALUES ('r007', '测试', '这个测试欧克了，所以编辑成功', '1');
INSERT INTO `sys_role` VALUES ('r008', '将军', '手下一把刀', '1');
INSERT INTO `sys_role` VALUES ('r009', '军师', '永争第二吧，弟弟们', '0');
INSERT INTO `sys_role` VALUES ('r010', '测试', '测试专用', '1');
INSERT INTO `sys_role` VALUES ('模拟', '模拟城市', '测试用的', '0');
INSERT INTO `sys_role_menu` VALUES ('2', 'r001', '001', '1');
INSERT INTO `sys_role_menu` VALUES ('3', 'r001', '002', '1');
INSERT INTO `sys_role_menu` VALUES ('4', 'r001', '003', '1');
INSERT INTO `sys_role_menu` VALUES ('5', 'r001', '004', '1');
INSERT INTO `sys_role_menu` VALUES ('6', 'r001', '005', '1');
INSERT INTO `sys_role_menu` VALUES ('7', 'r001', '001001', '1');
INSERT INTO `sys_role_menu` VALUES ('8', 'r001', '001002', '1');
INSERT INTO `sys_role_menu` VALUES ('9', 'r001', '002001', '1');
INSERT INTO `sys_role_menu` VALUES ('10', 'r001', '002002', '1');
INSERT INTO `sys_role_menu` VALUES ('11', 'r001', '003001', '1');
INSERT INTO `sys_role_menu` VALUES ('12', 'r001', '003002', '1');
INSERT INTO `sys_role_menu` VALUES ('13', 'r001', '003003', '1');
INSERT INTO `sys_role_menu` VALUES ('14', 'r001', '003004', '1');
INSERT INTO `sys_role_menu` VALUES ('15', 'r001', '003005', '1');
INSERT INTO `sys_role_menu` VALUES ('16', 'r001', '004001', '1');
INSERT INTO `sys_role_menu` VALUES ('17', 'r001', '004002', '1');
INSERT INTO `sys_role_menu` VALUES ('18', 'r001', '004003', '1');
INSERT INTO `sys_role_menu` VALUES ('19', 'r001', '004004', '1');
INSERT INTO `sys_role_menu` VALUES ('20', 'r001', '005001', '1');
INSERT INTO `sys_role_menu` VALUES ('21', 'r001', '005002', '1');
INSERT INTO `sys_role_menu` VALUES ('22', 'r001', '005003', '1');
INSERT INTO `sys_role_menu` VALUES ('23', 'r001', '006', '1');
INSERT INTO `sys_role_menu` VALUES ('24', 'r001', '006001', '1');
INSERT INTO `sys_role_menu` VALUES ('25', 'r001', '006002', '1');
INSERT INTO `sys_role_menu` VALUES ('29', 'r002', '001', '0');
INSERT INTO `sys_role_menu` VALUES ('30', 'r002', '002', '0');
INSERT INTO `sys_role_menu` VALUES ('31', 'r002', '003', '0');
INSERT INTO `sys_role_menu` VALUES ('32', 'r002', '004', '0');
INSERT INTO `sys_role_menu` VALUES ('33', 'r002', '005', '1');
INSERT INTO `sys_role_menu` VALUES ('34', 'r002', '001001', '0');
INSERT INTO `sys_role_menu` VALUES ('35', 'r002', '001002', '0');
INSERT INTO `sys_role_menu` VALUES ('36', 'r002', '002001', '0');
INSERT INTO `sys_role_menu` VALUES ('37', 'r002', '002002', '0');
INSERT INTO `sys_role_menu` VALUES ('38', 'r002', '003001', '0');
INSERT INTO `sys_role_menu` VALUES ('39', 'r002', '003002', '0');
INSERT INTO `sys_role_menu` VALUES ('40', 'r002', '003003', '0');
INSERT INTO `sys_role_menu` VALUES ('41', 'r002', '003004', '0');
INSERT INTO `sys_role_menu` VALUES ('42', 'r002', '003005', '0');
INSERT INTO `sys_role_menu` VALUES ('43', 'r002', '004001', '0');
INSERT INTO `sys_role_menu` VALUES ('44', 'r002', '004002', '0');
INSERT INTO `sys_role_menu` VALUES ('45', 'r002', '004003', '0');
INSERT INTO `sys_role_menu` VALUES ('46', 'r002', '004004', '0');
INSERT INTO `sys_role_menu` VALUES ('47', 'r002', '005001', '1');
INSERT INTO `sys_role_menu` VALUES ('48', 'r002', '005002', '0');
INSERT INTO `sys_role_menu` VALUES ('49', 'r002', '005003', '0');
INSERT INTO `sys_role_menu` VALUES ('50', 'r002', '006', '1');
INSERT INTO `sys_role_menu` VALUES ('51', 'r002', '006001', '1');
INSERT INTO `sys_role_menu` VALUES ('52', 'r002', '006002', '1');
INSERT INTO `sys_role_menu` VALUES ('54', 'r003', '001', '1');
INSERT INTO `sys_role_menu` VALUES ('55', 'r003', '002', '1');
INSERT INTO `sys_role_menu` VALUES ('56', 'r003', '003', '1');
INSERT INTO `sys_role_menu` VALUES ('57', 'r003', '004', '0');
INSERT INTO `sys_role_menu` VALUES ('58', 'r003', '005', '0');
INSERT INTO `sys_role_menu` VALUES ('59', 'r003', '001001', '1');
INSERT INTO `sys_role_menu` VALUES ('60', 'r003', '001002', '1');
INSERT INTO `sys_role_menu` VALUES ('61', 'r003', '002001', '1');
INSERT INTO `sys_role_menu` VALUES ('62', 'r003', '002002', '1');
INSERT INTO `sys_role_menu` VALUES ('63', 'r003', '003001', '1');
INSERT INTO `sys_role_menu` VALUES ('64', 'r003', '003002', '0');
INSERT INTO `sys_role_menu` VALUES ('65', 'r003', '003003', '1');
INSERT INTO `sys_role_menu` VALUES ('66', 'r003', '003004', '1');
INSERT INTO `sys_role_menu` VALUES ('67', 'r003', '003005', '1');
INSERT INTO `sys_role_menu` VALUES ('68', 'r003', '004001', '0');
INSERT INTO `sys_role_menu` VALUES ('69', 'r003', '004002', '0');
INSERT INTO `sys_role_menu` VALUES ('70', 'r003', '004003', '0');
INSERT INTO `sys_role_menu` VALUES ('71', 'r003', '004004', '0');
INSERT INTO `sys_role_menu` VALUES ('72', 'r003', '005001', '0');
INSERT INTO `sys_role_menu` VALUES ('73', 'r003', '005002', '0');
INSERT INTO `sys_role_menu` VALUES ('74', 'r003', '005003', '0');
INSERT INTO `sys_role_menu` VALUES ('75', 'r003', '006', '0');
INSERT INTO `sys_role_menu` VALUES ('76', 'r003', '006001', '0');
INSERT INTO `sys_role_menu` VALUES ('77', 'r003', '006002', '0');
INSERT INTO `sys_role_menu` VALUES ('78', 'r004', '001', '0');
INSERT INTO `sys_role_menu` VALUES ('79', 'r004', '002', '0');
INSERT INTO `sys_role_menu` VALUES ('80', 'r004', '003', '0');
INSERT INTO `sys_role_menu` VALUES ('81', 'r004', '004', '1');
INSERT INTO `sys_role_menu` VALUES ('82', 'r004', '005', '1');
INSERT INTO `sys_role_menu` VALUES ('83', 'r004', '001001', '0');
INSERT INTO `sys_role_menu` VALUES ('84', 'r004', '001002', '0');
INSERT INTO `sys_role_menu` VALUES ('85', 'r004', '002001', '0');
INSERT INTO `sys_role_menu` VALUES ('86', 'r004', '002002', '0');
INSERT INTO `sys_role_menu` VALUES ('87', 'r004', '003001', '0');
INSERT INTO `sys_role_menu` VALUES ('88', 'r004', '003002', '0');
INSERT INTO `sys_role_menu` VALUES ('89', 'r004', '003003', '0');
INSERT INTO `sys_role_menu` VALUES ('90', 'r004', '003004', '0');
INSERT INTO `sys_role_menu` VALUES ('91', 'r004', '003005', '0');
INSERT INTO `sys_role_menu` VALUES ('92', 'r004', '004001', '1');
INSERT INTO `sys_role_menu` VALUES ('93', 'r004', '004002', '1');
INSERT INTO `sys_role_menu` VALUES ('94', 'r004', '004003', '1');
INSERT INTO `sys_role_menu` VALUES ('95', 'r004', '004004', '1');
INSERT INTO `sys_role_menu` VALUES ('96', 'r004', '005001', '0');
INSERT INTO `sys_role_menu` VALUES ('97', 'r004', '005002', '1');
INSERT INTO `sys_role_menu` VALUES ('98', 'r004', '005003', '1');
INSERT INTO `sys_role_menu` VALUES ('99', 'r004', '006', '0');
INSERT INTO `sys_role_menu` VALUES ('100', 'r004', '006001', '0');
INSERT INTO `sys_role_menu` VALUES ('101', 'r004', '006002', '0');
INSERT INTO `sys_role_menu` VALUES ('102', 'r005', '001', '1');
INSERT INTO `sys_role_menu` VALUES ('103', 'r005', '002', '0');
INSERT INTO `sys_role_menu` VALUES ('104', 'r005', '003', '1');
INSERT INTO `sys_role_menu` VALUES ('105', 'r005', '004', '1');
INSERT INTO `sys_role_menu` VALUES ('106', 'r005', '005', '1');
INSERT INTO `sys_role_menu` VALUES ('107', 'r005', '001001', '1');
INSERT INTO `sys_role_menu` VALUES ('108', 'r005', '001002', '1');
INSERT INTO `sys_role_menu` VALUES ('109', 'r005', '002001', '0');
INSERT INTO `sys_role_menu` VALUES ('110', 'r005', '002002', '0');
INSERT INTO `sys_role_menu` VALUES ('111', 'r005', '003001', '0');
INSERT INTO `sys_role_menu` VALUES ('112', 'r005', '003002', '1');
INSERT INTO `sys_role_menu` VALUES ('113', 'r005', '003003', '0');
INSERT INTO `sys_role_menu` VALUES ('114', 'r005', '003004', '0');
INSERT INTO `sys_role_menu` VALUES ('115', 'r005', '003005', '1');
INSERT INTO `sys_role_menu` VALUES ('116', 'r005', '004001', '1');
INSERT INTO `sys_role_menu` VALUES ('117', 'r005', '004002', '1');
INSERT INTO `sys_role_menu` VALUES ('118', 'r005', '004003', '1');
INSERT INTO `sys_role_menu` VALUES ('119', 'r005', '004004', '1');
INSERT INTO `sys_role_menu` VALUES ('120', 'r005', '005001', '0');
INSERT INTO `sys_role_menu` VALUES ('121', 'r005', '005002', '1');
INSERT INTO `sys_role_menu` VALUES ('122', 'r005', '005003', '1');
INSERT INTO `sys_role_menu` VALUES ('123', 'r005', '006', '0');
INSERT INTO `sys_role_menu` VALUES ('124', 'r005', '006001', '0');
INSERT INTO `sys_role_menu` VALUES ('125', 'r005', '006002', '0');
INSERT INTO `sys_role_menu` VALUES ('126', 'r007', '001', '1');
INSERT INTO `sys_role_menu` VALUES ('127', 'r007', '002', '1');
INSERT INTO `sys_role_menu` VALUES ('128', 'r007', '003', '1');
INSERT INTO `sys_role_menu` VALUES ('129', 'r007', '004', '0');
INSERT INTO `sys_role_menu` VALUES ('130', 'r007', '005', '0');
INSERT INTO `sys_role_menu` VALUES ('131', 'r007', '001001', '1');
INSERT INTO `sys_role_menu` VALUES ('132', 'r007', '001002', '1');
INSERT INTO `sys_role_menu` VALUES ('133', 'r007', '002001', '0');
INSERT INTO `sys_role_menu` VALUES ('134', 'r007', '002002', '0');
INSERT INTO `sys_role_menu` VALUES ('135', 'r007', '003001', '0');
INSERT INTO `sys_role_menu` VALUES ('136', 'r007', '003002', '0');
INSERT INTO `sys_role_menu` VALUES ('137', 'r007', '003003', '0');
INSERT INTO `sys_role_menu` VALUES ('138', 'r007', '003004', '0');
INSERT INTO `sys_role_menu` VALUES ('139', 'r007', '003005', '0');
INSERT INTO `sys_role_menu` VALUES ('140', 'r007', '004001', '0');
INSERT INTO `sys_role_menu` VALUES ('141', 'r007', '004002', '0');
INSERT INTO `sys_role_menu` VALUES ('142', 'r007', '004003', '0');
INSERT INTO `sys_role_menu` VALUES ('143', 'r007', '004004', '0');
INSERT INTO `sys_role_menu` VALUES ('144', 'r007', '005001', '0');
INSERT INTO `sys_role_menu` VALUES ('145', 'r007', '005002', '0');
INSERT INTO `sys_role_menu` VALUES ('146', 'r007', '005003', '0');
INSERT INTO `sys_role_menu` VALUES ('147', 'r007', '006', '0');
INSERT INTO `sys_role_menu` VALUES ('148', 'r007', '006001', '0');
INSERT INTO `sys_role_menu` VALUES ('149', 'r007', '006002', '0');
INSERT INTO `sys_role_menu` VALUES ('181', 'r001', '000', '1');
INSERT INTO `sys_role_menu` VALUES ('182', 'r002', '000', '1');
INSERT INTO `sys_role_menu` VALUES ('183', 'r003', '000', '1');
INSERT INTO `sys_role_menu` VALUES ('184', 'r004', '000', '1');
INSERT INTO `sys_role_menu` VALUES ('185', 'r005', '000', '1');
INSERT INTO `sys_role_menu` VALUES ('186', 'r007', '000', '1');
INSERT INTO `sys_role_menu` VALUES ('187', 'r001', '006003', '1');
INSERT INTO `sys_role_menu` VALUES ('188', 'r002', '006003', '1');
INSERT INTO `sys_role_menu` VALUES ('189', 'r003', '006003', '0');
INSERT INTO `sys_role_menu` VALUES ('190', 'r004', '006003', '0');
INSERT INTO `sys_role_menu` VALUES ('191', 'r005', '006003', '0');
INSERT INTO `sys_role_menu` VALUES ('192', 'r007', '006003', '0');
INSERT INTO `sys_role_menu` VALUES ('193', 'r008', '000', '1');
INSERT INTO `sys_role_menu` VALUES ('194', 'r008', '001', '0');
INSERT INTO `sys_role_menu` VALUES ('195', 'r008', '002', '0');
INSERT INTO `sys_role_menu` VALUES ('196', 'r008', '003', '0');
INSERT INTO `sys_role_menu` VALUES ('197', 'r008', '004', '0');
INSERT INTO `sys_role_menu` VALUES ('198', 'r008', '005', '1');
INSERT INTO `sys_role_menu` VALUES ('199', 'r008', '001001', '0');
INSERT INTO `sys_role_menu` VALUES ('200', 'r008', '001002', '0');
INSERT INTO `sys_role_menu` VALUES ('201', 'r008', '002001', '0');
INSERT INTO `sys_role_menu` VALUES ('202', 'r008', '002002', '0');
INSERT INTO `sys_role_menu` VALUES ('203', 'r008', '003001', '0');
INSERT INTO `sys_role_menu` VALUES ('204', 'r008', '003002', '0');
INSERT INTO `sys_role_menu` VALUES ('205', 'r008', '003003', '0');
INSERT INTO `sys_role_menu` VALUES ('206', 'r008', '003004', '0');
INSERT INTO `sys_role_menu` VALUES ('207', 'r008', '003005', '0');
INSERT INTO `sys_role_menu` VALUES ('208', 'r008', '004001', '0');
INSERT INTO `sys_role_menu` VALUES ('209', 'r008', '004002', '0');
INSERT INTO `sys_role_menu` VALUES ('210', 'r008', '004003', '0');
INSERT INTO `sys_role_menu` VALUES ('211', 'r008', '004004', '0');
INSERT INTO `sys_role_menu` VALUES ('212', 'r008', '005001', '1');
INSERT INTO `sys_role_menu` VALUES ('213', 'r008', '005002', '1');
INSERT INTO `sys_role_menu` VALUES ('214', 'r008', '005003', '0');
INSERT INTO `sys_role_menu` VALUES ('215', 'r008', '006', '1');
INSERT INTO `sys_role_menu` VALUES ('216', 'r008', '006001', '1');
INSERT INTO `sys_role_menu` VALUES ('217', 'r008', '006002', '1');
INSERT INTO `sys_role_menu` VALUES ('218', 'r008', '006003', '1');
INSERT INTO `sys_role_menu` VALUES ('224', 'r009', '000', '1');
INSERT INTO `sys_role_menu` VALUES ('225', 'r009', '001', '0');
INSERT INTO `sys_role_menu` VALUES ('226', 'r009', '002', '0');
INSERT INTO `sys_role_menu` VALUES ('227', 'r009', '003', '0');
INSERT INTO `sys_role_menu` VALUES ('228', 'r009', '004', '0');
INSERT INTO `sys_role_menu` VALUES ('229', 'r009', '005', '0');
INSERT INTO `sys_role_menu` VALUES ('230', 'r009', '001001', '0');
INSERT INTO `sys_role_menu` VALUES ('231', 'r009', '001002', '0');
INSERT INTO `sys_role_menu` VALUES ('232', 'r009', '002001', '0');
INSERT INTO `sys_role_menu` VALUES ('233', 'r009', '002002', '0');
INSERT INTO `sys_role_menu` VALUES ('234', 'r009', '003001', '0');
INSERT INTO `sys_role_menu` VALUES ('235', 'r009', '003002', '0');
INSERT INTO `sys_role_menu` VALUES ('236', 'r009', '003003', '0');
INSERT INTO `sys_role_menu` VALUES ('237', 'r009', '003004', '0');
INSERT INTO `sys_role_menu` VALUES ('238', 'r009', '003005', '0');
INSERT INTO `sys_role_menu` VALUES ('239', 'r009', '004001', '0');
INSERT INTO `sys_role_menu` VALUES ('240', 'r009', '004002', '0');
INSERT INTO `sys_role_menu` VALUES ('241', 'r009', '004003', '0');
INSERT INTO `sys_role_menu` VALUES ('242', 'r009', '004004', '0');
INSERT INTO `sys_role_menu` VALUES ('243', 'r009', '005001', '0');
INSERT INTO `sys_role_menu` VALUES ('244', 'r009', '005002', '0');
INSERT INTO `sys_role_menu` VALUES ('245', 'r009', '005003', '0');
INSERT INTO `sys_role_menu` VALUES ('246', 'r009', '006', '0');
INSERT INTO `sys_role_menu` VALUES ('247', 'r009', '006001', '0');
INSERT INTO `sys_role_menu` VALUES ('248', 'r009', '006002', '0');
INSERT INTO `sys_role_menu` VALUES ('249', 'r009', '006003', '0');
INSERT INTO `sys_role_menu` VALUES ('335', '模拟', '000', '1');
INSERT INTO `sys_role_menu` VALUES ('336', '模拟', '001', '0');
INSERT INTO `sys_role_menu` VALUES ('337', '模拟', '002', '0');
INSERT INTO `sys_role_menu` VALUES ('338', '模拟', '003', '0');
INSERT INTO `sys_role_menu` VALUES ('339', '模拟', '004', '0');
INSERT INTO `sys_role_menu` VALUES ('340', '模拟', '005', '0');
INSERT INTO `sys_role_menu` VALUES ('341', '模拟', '001001', '0');
INSERT INTO `sys_role_menu` VALUES ('342', '模拟', '001002', '0');
INSERT INTO `sys_role_menu` VALUES ('343', '模拟', '002001', '0');
INSERT INTO `sys_role_menu` VALUES ('344', '模拟', '002002', '0');
INSERT INTO `sys_role_menu` VALUES ('345', '模拟', '003001', '0');
INSERT INTO `sys_role_menu` VALUES ('346', '模拟', '003002', '0');
INSERT INTO `sys_role_menu` VALUES ('347', '模拟', '003003', '0');
INSERT INTO `sys_role_menu` VALUES ('348', '模拟', '003004', '0');
INSERT INTO `sys_role_menu` VALUES ('349', '模拟', '003005', '0');
INSERT INTO `sys_role_menu` VALUES ('350', '模拟', '004001', '0');
INSERT INTO `sys_role_menu` VALUES ('351', '模拟', '004002', '0');
INSERT INTO `sys_role_menu` VALUES ('352', '模拟', '004003', '0');
INSERT INTO `sys_role_menu` VALUES ('353', '模拟', '004004', '0');
INSERT INTO `sys_role_menu` VALUES ('354', '模拟', '005001', '0');
INSERT INTO `sys_role_menu` VALUES ('355', '模拟', '005002', '0');
INSERT INTO `sys_role_menu` VALUES ('356', '模拟', '005003', '0');
INSERT INTO `sys_role_menu` VALUES ('357', '模拟', '006', '0');
INSERT INTO `sys_role_menu` VALUES ('358', '模拟', '006001', '0');
INSERT INTO `sys_role_menu` VALUES ('359', '模拟', '006002', '0');
INSERT INTO `sys_role_menu` VALUES ('360', '模拟', '006003', '0');
INSERT INTO `sys_role_menu` VALUES ('361', '模拟', '002003', '0');
INSERT INTO `sys_role_menu` VALUES ('366', 'r001', '007', '0');
INSERT INTO `sys_role_menu` VALUES ('367', 'r002', '007', '0');
INSERT INTO `sys_role_menu` VALUES ('368', 'r003', '007', '0');
INSERT INTO `sys_role_menu` VALUES ('369', 'r004', '007', '0');
INSERT INTO `sys_role_menu` VALUES ('370', 'r005', '007', '0');
INSERT INTO `sys_role_menu` VALUES ('371', 'r007', '007', '0');
INSERT INTO `sys_role_menu` VALUES ('372', 'r008', '007', '0');
INSERT INTO `sys_role_menu` VALUES ('373', 'r009', '007', '0');
INSERT INTO `sys_role_menu` VALUES ('374', '模拟', '007', '0');
INSERT INTO `sys_role_menu` VALUES ('375', 'r010', '000', '1');
INSERT INTO `sys_role_menu` VALUES ('376', 'r010', '001', '0');
INSERT INTO `sys_role_menu` VALUES ('377', 'r010', '002', '0');
INSERT INTO `sys_role_menu` VALUES ('378', 'r010', '003', '0');
INSERT INTO `sys_role_menu` VALUES ('379', 'r010', '004', '0');
INSERT INTO `sys_role_menu` VALUES ('380', 'r010', '005', '0');
INSERT INTO `sys_role_menu` VALUES ('381', 'r010', '001001', '0');
INSERT INTO `sys_role_menu` VALUES ('382', 'r010', '001002', '0');
INSERT INTO `sys_role_menu` VALUES ('383', 'r010', '002001', '0');
INSERT INTO `sys_role_menu` VALUES ('384', 'r010', '002002', '0');
INSERT INTO `sys_role_menu` VALUES ('385', 'r010', '003001', '0');
INSERT INTO `sys_role_menu` VALUES ('386', 'r010', '003002', '0');
INSERT INTO `sys_role_menu` VALUES ('387', 'r010', '003003', '0');
INSERT INTO `sys_role_menu` VALUES ('388', 'r010', '003004', '0');
INSERT INTO `sys_role_menu` VALUES ('389', 'r010', '003005', '0');
INSERT INTO `sys_role_menu` VALUES ('390', 'r010', '004001', '0');
INSERT INTO `sys_role_menu` VALUES ('391', 'r010', '004002', '0');
INSERT INTO `sys_role_menu` VALUES ('392', 'r010', '004003', '0');
INSERT INTO `sys_role_menu` VALUES ('393', 'r010', '004004', '0');
INSERT INTO `sys_role_menu` VALUES ('394', 'r010', '005001', '0');
INSERT INTO `sys_role_menu` VALUES ('395', 'r010', '005002', '0');
INSERT INTO `sys_role_menu` VALUES ('396', 'r010', '005003', '0');
INSERT INTO `sys_role_menu` VALUES ('397', 'r010', '006', '0');
INSERT INTO `sys_role_menu` VALUES ('398', 'r010', '006001', '0');
INSERT INTO `sys_role_menu` VALUES ('399', 'r010', '006002', '0');
INSERT INTO `sys_role_menu` VALUES ('400', 'r010', '006003', '0');
INSERT INTO `sys_role_menu` VALUES ('401', 'r010', '002003', '0');
INSERT INTO `sys_role_menu` VALUES ('402', 'r010', '007', '1');
INSERT INTO `sys_role_menu` VALUES ('406', 'r001', '007001', '0');
INSERT INTO `sys_role_menu` VALUES ('407', 'r002', '007001', '0');
INSERT INTO `sys_role_menu` VALUES ('408', 'r003', '007001', '0');
INSERT INTO `sys_role_menu` VALUES ('409', 'r004', '007001', '0');
INSERT INTO `sys_role_menu` VALUES ('410', 'r005', '007001', '0');
INSERT INTO `sys_role_menu` VALUES ('411', 'r007', '007001', '0');
INSERT INTO `sys_role_menu` VALUES ('412', 'r008', '007001', '0');
INSERT INTO `sys_role_menu` VALUES ('413', 'r009', '007001', '0');
INSERT INTO `sys_role_menu` VALUES ('414', 'r010', '007001', '1');
INSERT INTO `sys_role_menu` VALUES ('415', '模拟', '007001', '0');
INSERT INTO `sys_user` VALUES ('1', 'dabao', '123', '1');
INSERT INTO `sys_user` VALUES ('2', 'wangwang', '123', '1');
INSERT INTO `sys_user` VALUES ('3', 'cenyu', '123', '1');
INSERT INTO `sys_user` VALUES ('4', 'liye', '123', '1');
INSERT INTO `sys_user` VALUES ('18', '333', '333', '0');
INSERT INTO `sys_user` VALUES ('20', '师傅', '1433233', '1');
INSERT INTO `sys_user` VALUES ('21', 'wl', '123', '0');
INSERT INTO `sys_user` VALUES ('28', '可用liye', '123', '1');
INSERT INTO `sys_user` VALUES ('29', '不可用liye', '123', '0');
INSERT INTO `sys_user` VALUES ('30', '可用cenyu', '123', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2', 'r002');
INSERT INTO `sys_user_role` VALUES ('3', '2', 'r001');
INSERT INTO `sys_user_role` VALUES ('23', '18', 'r003');
INSERT INTO `sys_user_role` VALUES ('26', '3', 'r005');
INSERT INTO `sys_user_role` VALUES ('27', '4', 'r003');
INSERT INTO `sys_user_role` VALUES ('43', '1', 'r002');
INSERT INTO `sys_user_role` VALUES ('56', '20', 'r003');
INSERT INTO `sys_user_role` VALUES ('57', '20', 'r005');
INSERT INTO `sys_user_role` VALUES ('58', '21', 'r010');
INSERT INTO `sys_user_role` VALUES ('60', '29', 'r003');
INSERT INTO `sys_user_role` VALUES ('61', '30', 'r005');
INSERT INTO `sys_user_role` VALUES ('63', '28', 'r003');
INSERT INTO `sys_user_role` VALUES ('64', '20', 'r010');
