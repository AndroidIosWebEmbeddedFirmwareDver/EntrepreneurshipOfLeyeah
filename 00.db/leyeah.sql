/*
 Navicat Premium Data Transfer

 Source Server         : 120.78.189.94
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 120.78.189.94:3306
 Source Schema         : leyeah

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 12/05/2018 10:14:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for le_mobile_soft_version
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_soft_version`;
CREATE TABLE `le_mobile_soft_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `softVer` text COMMENT '客户端软件版本',
  `softType` int(11) DEFAULT '0' COMMENT '客户端软件类型，默认0-未知，1-安卓，2-苹果',
  `softUrl` text COMMENT '客户端软件下载地址',
  `softDesc` text COMMENT '客户端软件版本描述',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) NOT NULL COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端用户类型表';

-- ----------------------------
-- Table structure for le_mobile_user
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_user`;
CREATE TABLE `le_mobile_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` text COMMENT '客户端用户名称',
  `password` text COMMENT '客户端用户登录密码，MD5加密',
  `phone` text COMMENT '客户端用户登录手机号',
  `callPhone` text COMMENT '客户端用户联系电话',
  `typeId` bigint(20) DEFAULT NULL COMMENT '客户端用户类型id',
  `typeName` text COMMENT '客户端用户类型',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  `sessionToken` text CHARACTER SET latin1 COMMENT '最后一次登录会话描述，有效时间7天',
  `sessionCreateDateTime` timestamp NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `avatarUrl` text COMMENT '客户端用户头像获取地址',
  `score` double(4,2) DEFAULT '5.00' COMMENT '客户端用户评分',
  `canBeSearch` int(11) DEFAULT '0' COMMENT '是否可以被搜索 ，默认0，1-不可以 0-可以 ',
  `beRna` int(11) DEFAULT '0' COMMENT '是否实名认证 ，默认0，默认0，0-未提交，待提交,1-已提交，待审核，2-已审核，未通过，3-已审核，已通过',
  `areaCountryPkId` int(20) DEFAULT '0' COMMENT '所在国家ID',
  `areaCountryName` text COMMENT '所在国家名称',
  `areaProvincePkId` int(20) DEFAULT '0' COMMENT '所在省份ID',
  `areaProvinceName` text COMMENT '所在省份名称',
  `areaCityPkId` int(20) DEFAULT '0' COMMENT '所在城市ID',
  `areaCityName` text COMMENT '所在城市名称',
  `areaAreaAndCountyPkId` int(20) DEFAULT '0' COMMENT '所在区县ID',
  `areaAreaAndCountyName` text COMMENT '所在区县名称',
  `areaAddress` text COMMENT '所在详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='客户端用户表';

-- ----------------------------
-- Records of le_mobile_user
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_user` VALUES (22, '四川仁恒置业有限公司成都天府新区分公司', NULL, '1321988999', NULL, 1, '雇主', '2017-12-12 20:12:47', '2017-10-19 15:25:40', 0, NULL, NULL, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511253812751&di=2e50c4174daa22b69bdd794fc2a76a1e&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fbaike%2Fpic%2Fitem%2F8718367adab44aeda6ac0c65b31c8701a08bfb55.jpg', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (49, '我是萌萌', NULL, '13788990000', NULL, 2, '雇员', '2017-12-21 22:05:08', '2017-11-21 09:47:08', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/ACCAF1A8F8BF4F84B06F95B7C0C773E7.JPG', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (50, '我是萌萌', NULL, '13268776788', NULL, 2, '雇员', '2017-12-21 22:03:45', '2017-11-21 11:15:59', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/ACCAF1A8F8BF4F84B06F95B7C0C773E7.JPG', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (51, '我是萌萌', NULL, '18798990099', NULL, 2, '雇员', '2017-12-21 22:03:46', '2017-11-24 21:39:06', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/F1108A3E74C543168E0DECFAB27163A9.jpg', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (52, '我是萌萌', NULL, '18723669966', NULL, 2, '雇员', '2017-12-21 22:03:23', '2017-11-24 21:39:30', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/32002DA8246C43D7A2BCA86BB673332E.jpg', 4.90, 0, 0, 1, '中国', 2287, '四川省', 2288, '成都市', 2294, '龙泉驿区', 'Tian. FU Square,.');
INSERT INTO `le_mobile_user` VALUES (53, '我是萌萌', NULL, '13219630317', NULL, 2, '雇员', '2017-12-21 22:03:48', '2017-11-30 13:09:26', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/FF9D7B661349492C943ABCF7C6E3039E.JPG', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (54, '我是萌萌', NULL, '13355668899', NULL, 2, '雇员', '2017-12-21 22:03:49', '2017-11-30 23:09:55', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/6296EBF305B7490493FCE1949B6CF9A9.jpg', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (55, 'Jjxh', NULL, '18702839327', NULL, 2, '雇员', '2018-02-01 13:36:37', '2017-12-05 16:54:55', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/71410C76414D4D3A81F66661CCBF1E45.jpg', 4.90, 0, 3, 1, '中国', 2287, '四川省', 2288, '成都市', 3267, '高新区', '啦啦啦');
INSERT INTO `le_mobile_user` VALUES (56, '我是萌萌', NULL, '18733669933', NULL, 2, '雇员', '2017-12-21 22:03:51', '2017-12-07 13:59:46', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/F1108A3E74C543168E0DECFAB27163A9.jpg', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (57, '四川成都高新技术开发有限公司', NULL, '17899889900', NULL, 1, '雇主', '2017-12-21 22:04:47', '2017-12-12 10:45:13', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/F1108A3E74C543168E0DECFAB27163A9.jpg', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (58, '四川成都高新技术开发有限公司', NULL, '17788990000', NULL, 1, '雇主', '2017-12-21 22:04:48', '2017-12-12 10:47:50', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/4D4DE634F7FC4809B31B5E9C95705FBD.jpg', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (59, '四川成都高新技术开发有限公司', NULL, '16646669866', '4644664846464', 1, '雇主', '2017-12-21 22:04:49', '2017-12-12 17:20:27', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/02C382B3BE594D70AA435D09B991B0E2.jpg', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (60, '四川成都高新技术开发有限公司', NULL, '18899009900', NULL, 1, '雇主', '2017-12-21 22:42:35', '2017-12-12 20:26:49', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/F1108A3E74C543168E0DECFAB27163A9.jpg', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (61, '四川成都高新技术开发有限公司', NULL, '16677889999', NULL, 1, '雇主', '2017-12-21 22:42:36', '2017-12-12 20:46:17', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/F1108A3E74C543168E0DECFAB27163A9.jpg', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (62, '四川成都高新技术开发有限公司', NULL, '17782376981', NULL, 1, '雇主', '2017-12-21 22:42:37', '2017-12-12 20:49:30', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/21CC97B5DDB644D49BF177593CF4ED24.jpg', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (63, '四川成都高新技术开发有限公司', NULL, '13256669966', '0283-8866553', 1, '雇主', '2017-12-21 22:42:37', '2017-12-12 21:23:32', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/ED538C2554EF4F3EB703AAB5B54A39CE.jpg', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (67, '四川成都高新技术开发有限公司', NULL, '13334445566', '123adasd', 1, '雇主', '2017-12-21 22:42:38', '2017-12-13 10:52:59', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/F1108A3E74C543168E0DECFAB27163A9.jpg', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (68, '四川成都高新技术开发有限公司', NULL, '15677777888', '1253768179832', 1, '雇主', '2017-12-29 16:22:30', '2017-12-13 11:20:10', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/CC0492D3560F4DDF824D5CBC03F5BF9D.jpg', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (69, '我是萌萌', NULL, '13255668852', NULL, 2, '雇员', '2017-12-21 22:42:41', '2017-12-14 15:51:37', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/F1108A3E74C543168E0DECFAB27163A9.jpg', 4.90, 0, 0, 1, '中国', 349, '内蒙古自治区', 360, '包头市', 362, '昆都仑区', '哦明明你摸');
INSERT INTO `le_mobile_user` VALUES (70, '我是萌萌', NULL, '13233331234', NULL, 2, '雇员', '2018-01-02 12:52:32', '2017-12-14 16:47:22', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/C2223300DD5F4C3692997F4CDB954E90.jpg', 4.90, 0, 3, 1, '中国', 349, '内蒙古自治区', 360, '包头市', 362, '昆都仑区', '你弟哦民工');
INSERT INTO `le_mobile_user` VALUES (71, '我是萌萌', NULL, '18723556633', NULL, 2, '雇员', '2017-12-21 22:42:42', '2017-12-15 14:58:18', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/F1108A3E74C543168E0DECFAB27163A9.jpg', 4.90, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (72, '我是萌萌', NULL, '13266996633', NULL, 2, '雇员', '2017-12-21 22:42:43', '2017-12-20 21:47:46', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/E97A12D34CA24095855A0A241D9E574E.jpg', 4.90, 0, 0, 1, '中国', 2287, '四川省', 2288, '成都市', 2290, '青羊区', '天下第一庄10086门');
INSERT INTO `le_mobile_user` VALUES (73, '四川成都高新技术开发有限公司', NULL, '18702839327', '028-3366995566', 1, '雇主', '2018-02-01 23:09:41', '2017-12-21 10:57:23', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/6082880396F247918D600BDAE96F75EF.jpg', 4.90, 0, 3, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (74, '鲁西肥牛餐饮有限公司', NULL, '15680001753', '15680001753', 1, '雇主', '2018-01-17 09:33:41', '2018-01-01 21:46:03', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/38E2A0AED7164C889BE9FFB909D5DDB2.jpg', 0.00, 0, 3, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (75, '郝纯', NULL, '15680001753', NULL, 2, '雇员', '2018-01-01 21:57:31', '2018-01-01 21:49:47', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/BF610F97D92B4B27A9989AF78351BE26.jpg', 0.00, 0, 3, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (76, '把', NULL, '13255666998', NULL, 2, '雇员', '2018-01-02 10:55:48', '2018-01-02 09:33:58', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/CCB8343C37B84D5DADC4056AC448C0A4.jpg', 0.00, 0, 3, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (77, '陈成', NULL, '15882364142', '15882364142', 1, '雇主', '2018-01-08 15:01:18', '2018-01-08 13:45:09', 0, NULL, NULL, NULL, 0.00, 0, 3, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (78, '陈成', NULL, '15882364142', NULL, 2, '雇员', '2018-01-08 14:42:22', '2018-01-08 13:58:07', 0, NULL, NULL, NULL, 0.00, 0, 3, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (79, '至尊会员', NULL, '13963362233', NULL, 2, '雇员', '2018-01-12 11:08:20', '2018-01-09 11:34:57', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/5D3E151419084AC28D7223B5AB046070.jpg', 0.00, 0, 3, 1, '中国', 349, '内蒙古自治区', 350, '呼和浩特市', 355, '土默特左旗', '我摸');
INSERT INTO `le_mobile_user` VALUES (80, 'Llll', NULL, '13388990000', NULL, 2, '雇员', '2018-01-09 13:41:17', '2018-01-09 12:33:06', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/365668C0CE8E4F8397D1BA0A8BAA4CD9.jpg', 0.00, 0, 3, 1, '中国', 38, '河北省', 39, '石家庄市', 40, '长安区', 'Ddddddd');
INSERT INTO `le_mobile_user` VALUES (81, '欧阳夏丹', NULL, '18233669966', NULL, 2, '雇员', '2018-01-09 23:23:46', '2018-01-09 23:21:32', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/3B28CC924DF948BBA68AD5ECE423B891.jpg', 0.00, 0, 3, 1, '中国', 2287, '四川省', 2288, '成都市', 2289, '锦江区', '我是一个地址');
INSERT INTO `le_mobile_user` VALUES (82, NULL, NULL, '18200111079', NULL, 2, '雇员', '2018-01-15 18:59:28', '2018-01-15 18:59:28', 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (83, '我是你的', NULL, '15866966633', NULL, 2, '雇员', '2018-01-17 19:50:41', '2018-01-17 19:48:52', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/B1AF04EF2BE540B39FFF35FD77333990.jpg', 0.00, 0, 3, 1, '中国', 349, '内蒙古自治区', 350, '呼和浩特市', 351, '新城区', '呃呃呃KKK');
INSERT INTO `le_mobile_user` VALUES (84, NULL, NULL, '18200111079', NULL, 1, '雇主', '2018-01-21 13:23:33', '2018-01-21 13:23:33', 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (85, '上官婉儿', NULL, '13255669966', NULL, 2, '雇员', '2018-01-23 15:04:56', '2018-01-21 15:30:25', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/573B8C457F9C44FDB35FBB958092F674.jpg', 0.00, 0, 3, 1, '中国', 2287, '四川省', 2309, '自贡市', 2312, '大安区', 'NO7212');
INSERT INTO `le_mobile_user` VALUES (86, '庚奇', NULL, '13331751061', NULL, 2, '雇员', '2018-01-22 00:27:37', '2018-01-22 00:27:00', 0, NULL, NULL, NULL, 0.00, 0, 0, 1, '中国', 580, '吉林省', 581, '长春市', 584, '朝阳区', '朝阳区');
INSERT INTO `le_mobile_user` VALUES (87, NULL, NULL, '18705835552', NULL, 1, '雇主', '2018-02-01 11:14:07', '2018-02-01 11:14:07', 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (88, '我默默地看着你', NULL, '18702539327', '18702839327', 1, '雇主', '2018-02-01 11:15:11', '2018-02-01 11:14:26', 0, NULL, NULL, NULL, 0.00, 0, 3, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (89, NULL, NULL, '19900990099', NULL, 1, '雇主', '2018-02-01 23:05:47', '2018-02-01 23:05:47', 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
INSERT INTO `le_mobile_user` VALUES (90, '绝世武神', NULL, '18702869966', NULL, 2, '雇员', '2018-05-03 08:35:25', '2018-02-03 17:42:13', 0, NULL, NULL, 'http://oz2x7bysv.bkt.clouddn.com/8E86A93E46D24124BFD3DB550C05A692.jpg', 0.00, 0, 3, 1, '中国', 2287, '四川省', 2288, '成都市', 3267, '高新区', '我们');
INSERT INTO `le_mobile_user` VALUES (91, NULL, NULL, '15902832286', NULL, 2, '雇员', '2018-03-20 22:58:58', '2018-03-20 22:56:57', 0, NULL, NULL, NULL, 0.00, 0, 0, 1, '中国', 2287, '四川省', 2288, '成都市', 3267, '高新区', '3204');
INSERT INTO `le_mobile_user` VALUES (92, NULL, NULL, '15852364142', NULL, 1, '雇主', '2018-04-25 13:40:18', '2018-04-25 13:40:18', 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_user_advise_order
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_user_advise_order`;
CREATE TABLE `le_mobile_user_advise_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` bigint(20) DEFAULT '0' COMMENT '客户端用户ID',
  `userPhone` text COMMENT '客户端用户电话',
  `adviseTitle` text COMMENT '反馈标题',
  `adviseDesc` text COMMENT '反馈描述',
  `adviseImageUrl` text COMMENT '反馈图片',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) NOT NULL COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='用户反馈意见表';

-- ----------------------------
-- Records of le_mobile_user_advise_order
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_user_advise_order` VALUES (4, 53, '13219630317', ' ', 'Aaaa', '', '2017-12-05 11:15:09', '2017-12-05 11:15:09', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (5, 53, '13219630317', ' ', 'Aaaaaaaa', '', '2017-12-05 11:16:27', '2017-12-05 11:16:27', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (6, 53, '13219630317', ' ', 'Aaaaaaaaa', '', '2017-12-05 11:17:20', '2017-12-05 11:17:20', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (7, 53, '13219630317', ' ', 'Asdasdadiahfjhifgdahfiuhaiidoqhilhdhwdlhfjhsdljfhjahsdhlakhdkjfhkjahjsldhliuasuigifh;uagsiudgaigflasdgliasfgalugdliashuidalid', '', '2017-12-05 11:17:35', '2017-12-05 11:17:35', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (8, 53, '13219630317', ' ', ' ', '', '2017-12-05 12:52:49', '2017-12-05 12:52:49', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (9, 53, '13219630317', '未输入标题', 'Aaaaaaaaaaaaaaaaaaaaaa', 'http://oz2x7bysv.bkt.clouddn.com/9D9790CAF4AC450B9D0D6374CAD03C38.jpg', '2017-12-05 13:07:23', '2017-12-05 13:07:23', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (10, 52, '18702839327', '未输入标题', '明明哦哦哦公民哦哦哦哦', 'http://oz2x7bysv.bkt.clouddn.com/AB5A2BAFFB8C4523A3FBBA1BFFA0D356.jpg', '2017-12-05 13:40:31', '2017-12-05 13:40:31', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (11, 52, '18702839327', '未输入标题', 'OMG你的1额1额你爹呵呵1哦公民osmosis哦哦魔攻哦哦哦', NULL, '2017-12-05 13:40:47', '2017-12-05 13:40:47', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (12, 55, '18702839327', '未输入标题', '和您敏敏哦log敏敏莫咯log我明', 'http://oz2x7bysv.bkt.clouddn.com/55D75B7D9AB345A39B97F030827D8A4F.jpg', '2017-12-07 13:27:53', '2017-12-07 13:27:53', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (13, 52, '18702839327', '未输入标题', 'Aaaaaaaaaaaaaaaaaa', 'http://oz2x7bysv.bkt.clouddn.com/4DB07F55C80E42C7A3FD99A3147831CF.jpg', '2017-12-07 13:29:53', '2017-12-07 13:29:53', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (14, 52, '18702839327', '未输入标题', 'Aaaaaaaaaa', 'http://oz2x7bysv.bkt.clouddn.com/88D01C92AB7C4D2188BE76EBAD1DAA83.jpg', '2017-12-07 13:30:34', '2017-12-07 13:30:34', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (15, 62, '17782376981', '未输入标题', 'Asasdsadsadasdasdads', 'http://oz2x7bysv.bkt.clouddn.com/F1A3B079178A43ADB3A5E7357DB95C02.jpg', '2017-12-12 21:32:17', '2017-12-12 21:32:17', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (16, 63, '13256669966', '未输入标题', '过敏您明明哦红米', 'http://oz2x7bysv.bkt.clouddn.com/8944A766B6C14085A8CA74EF6D3F7AC6.jpg', '2017-12-12 21:40:44', '2017-12-12 21:40:44', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (17, 72, '13266996633', '未输入标题', '傻X姓名哦红米敏敏用的是什么意思啊，。，，。，。', 'http://oz2x7bysv.bkt.clouddn.com/4FA71E63D19343DFAFF93BF0F20CC24A.jpg', '2017-12-20 22:39:21', '2017-12-20 22:39:21', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (18, 73, '18702839327', '未输入标题', '让我高兴高兴敏敏哦送你莫咯咯破功inn咯咙哦solo咯楼摸了1哦外婆哄我黑心给外婆去外婆过敏你你你墨瞳倪敏', 'http://oz2x7bysv.bkt.clouddn.com/6C64128B02A04B1F9FC49A51E55E192A.jpg', '2017-12-21 17:12:56', '2017-12-21 17:12:56', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (19, 74, '15680001753', '未输入标题', '一敏敏1哦', 'http://oz2x7bysv.bkt.clouddn.com/1B4F1424FE214803A24365E5EF839855.jpg', '2018-01-03 09:59:18', '2018-01-03 09:59:18', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (20, 55, '18702839327', '未输入标题', 'Aaaaaaaaaaaaa', 'http://oz2x7bysv.bkt.clouddn.com/066236CAE8664BD399FB194DC7CE132D.jpg', '2018-01-09 14:02:50', '2018-01-09 14:02:50', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (21, 74, '15680001753', '未输入标题', '这可以哦', 'http://oz2x7bysv.bkt.clouddn.com/BEF3F43F71A94ECEAADDF12EAA0AE801.jpg', '2018-01-11 17:04:15', '2018-01-11 17:04:15', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (22, 74, '15680001753', '未输入标题', '退咯哦啦', NULL, '2018-01-11 21:32:04', '2018-01-11 21:32:04', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (23, 55, '18702839327', '未输入标题', '慢慢慢', 'http://oz2x7bysv.bkt.clouddn.com/D6B57E3D77CA4637BD658C7D8D61F001.jpg', '2018-01-19 13:35:13', '2018-01-19 13:35:13', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (24, 90, '18702869966', '未输入标题', '噢噢噢哦哦', 'http://oz2x7bysv.bkt.clouddn.com/E71A28BC1F6349DBB9897FD61B04C492.jpg', '2018-02-10 09:52:26', '2018-02-10 09:52:26', 0);
INSERT INTO `le_mobile_user_advise_order` VALUES (25, 90, '18702869966', '未输入标题', 'Hh', 'http://oz2x7bysv.bkt.clouddn.com/5A2DA48DFD894716AF76648B5C0E431F.jpg', '2018-03-13 23:31:29', '2018-03-13 23:31:29', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_user_resume
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_user_resume`;
CREATE TABLE `le_mobile_user_resume` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '客户端用户id',
  `typeName` text COMMENT '客户端用户类型',
  `typeId` bigint(20) DEFAULT NULL COMMENT '客户端用户类型id',
  `workTypes` text COMMENT '工作JSon',
  `workExperienceType` text COMMENT '工作经验',
  `workExperienceTypeDesc` text COMMENT '工作经验描述',
  `workGoodAts` text COMMENT '擅长JSon',
  `workSelfEvals` text COMMENT '自我评价JSon',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='客户端用户简历表';

-- ----------------------------
-- Records of le_mobile_user_resume
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_user_resume` VALUES (26, 62, '雇员', 2, '[{\"id\":2,\"name\":\"木工\",\"description\":\"木工（Wood Working）是一门工艺，也是建筑常用的技术，是中国传统三行（即木工、木头、木匠）之一。木工是为业主完成房屋装修过程中的各项木质工程的工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"焊工\",\"description\":\"焊工是采用合适的焊接方式，合理的焊接工艺，适当的焊接设备，采用同材质或不同材质的填充物，来将金属或非金属工件紧密连接的一个工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":14,\"name\":\"瓦工\",\"description\":\"瓦工就是用砖或砌块和砂浆砌筑房屋、烟囱或房顶铺瓦砖及其它构筑物的工人。\",\"modifiedDateTime\":1505232000000,\"createdDateTime\":1505232000000,\"isDeleted\":0,\"selected\":true}]', '56', '5-10年工作经验', NULL, NULL, '2017-12-14 15:47:04', '2017-12-14 15:43:51', 0);
INSERT INTO `le_mobile_user_resume` VALUES (27, 69, '雇员', 2, '[{\"id\":1,\"name\":\"电工\",\"description\":\"从事电力生产和电气制造电气维修、建筑安装行业等工业生产体系的人员（工种）。从事电磁领域的客观规律研究及其应用的人员，通常称电气工程师。\",\"modifiedDateTime\":1505750400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"焊工\",\"description\":\"焊工是采用合适的焊接方式，合理的焊接工艺，适当的焊接设备，采用同材质或不同材质的填充物，来将金属或非金属工件紧密连接的一个工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":15,\"name\":\"万能工\",\"description\":\"万能工\",\"modifiedDateTime\":1505232000000,\"createdDateTime\":1505232000000,\"isDeleted\":0,\"selected\":true}]', '56', '5-10年工作经验', '[{\"id\":2,\"name\":\"搬砖\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"沙袋\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":4,\"name\":\"电焊\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":6,\"name\":\"上进\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true},{\"id\":7,\"name\":\"品质好\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true},{\"id\":8,\"name\":\"无负担\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '2017-12-14 16:46:07', '2017-12-14 15:51:42', 0);
INSERT INTO `le_mobile_user_resume` VALUES (28, 70, '雇员', 2, '[{\"id\":14,\"name\":\"瓦工\",\"description\":\"瓦工就是用砖或砌块和砂浆砌筑房屋、烟囱或房顶铺瓦砖及其它构筑物的工人。\",\"modifiedDateTime\":1505232000000,\"createdDateTime\":1505232000000,\"isDeleted\":0,\"selected\":true},{\"id\":15,\"name\":\"万能工\",\"description\":\"万能工\",\"modifiedDateTime\":1505232000000,\"createdDateTime\":1505232000000,\"isDeleted\":0,\"selected\":true},{\"id\":16,\"name\":\"包装工\",\"description\":\"包装工\",\"modifiedDateTime\":1505232000000,\"createdDateTime\":1505232000000,\"isDeleted\":0,\"selected\":true}]', '57', '10年以上工作经验', '[{\"id\":6,\"name\":\"水泥\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true},{\"id\":7,\"name\":\"抹灰\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true},{\"id\":8,\"name\":\"油漆\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":10,\"name\":\"不喝酒\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true},{\"id\":11,\"name\":\"不抽烟\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true},{\"id\":12,\"name\":\"活好\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '2017-12-14 16:48:12', '2017-12-14 16:47:22', 0);
INSERT INTO `le_mobile_user_resume` VALUES (29, 71, '雇员', 2, NULL, '0', NULL, NULL, NULL, '2017-12-15 14:58:18', '2017-12-15 14:58:18', 0);
INSERT INTO `le_mobile_user_resume` VALUES (30, 72, '雇员', 2, '[{\"id\":15,\"name\":\"万能工\",\"description\":\"万能工\",\"modifiedDateTime\":1505232000000,\"createdDateTime\":1505232000000,\"isDeleted\":0,\"selected\":true},{\"id\":16,\"name\":\"包装工\",\"description\":\"包装工\",\"modifiedDateTime\":1505232000000,\"createdDateTime\":1505232000000,\"isDeleted\":0,\"selected\":true},{\"id\":17,\"name\":\"电梯工\",\"description\":\"电梯工\",\"modifiedDateTime\":1505232000000,\"createdDateTime\":1505232000000,\"isDeleted\":0,\"selected\":true}]', '57', '10年以上工作经验', '[{\"id\":5,\"name\":\"钢筋\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":6,\"name\":\"水泥\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true},{\"id\":11,\"name\":\"木活\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":1,\"name\":\"诚实\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":2,\"name\":\"能吃苦\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"开朗大方\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '2017-12-20 21:58:18', '2017-12-20 21:47:46', 0);
INSERT INTO `le_mobile_user_resume` VALUES (31, 55, '雇员', 2, '[{\"id\":1,\"name\":\"电工\",\"description\":\"从事电力生产和电气制造电气维修、建筑安装行业等工业生产体系的人员（工种）。从事电磁领域的客观规律研究及其应用的人员，通常称电气工程师。\",\"modifiedDateTime\":1505750400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"焊工\",\"description\":\"焊工是采用合适的焊接方式，合理的焊接工艺，适当的焊接设备，采用同材质或不同材质的填充物，来将金属或非金属工件紧密连接的一个工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":50,\"name\":\"普工\",\"description\":\"普工,顾名思义 ,普通的工人。普工指的是， 拥有基本的技能， 能胜任普通工作的人员。普工在珠三角和长三角地区制造型工厂是用来指在生产线上做一些技术要求不高的岗位的员工.\",\"modifiedDateTime\":1517020801000,\"createdDateTime\":1516588484000,\"isDeleted\":0,\"selected\":true}]', '56', '5-10年工作经验', '[{\"id\":6,\"name\":\"水泥\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true},{\"id\":9,\"name\":\"管道\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true},{\"id\":10,\"name\":\"架子\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":4,\"name\":\"作风优良\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":5,\"name\":\"团结友善\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":6,\"name\":\"上进\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '2018-01-31 13:36:27', '2017-12-21 14:00:01', 0);
INSERT INTO `le_mobile_user_resume` VALUES (32, 75, '雇员', 2, '[{\"id\":1,\"name\":\"电工\",\"description\":\"从事电力生产和电气制造电气维修、建筑安装行业等工业生产体系的人员（工种）。从事电磁领域的客观规律研究及其应用的人员，通常称电气工程师。\",\"modifiedDateTime\":1505750400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"焊工\",\"description\":\"焊工是采用合适的焊接方式，合理的焊接工艺，适当的焊接设备，采用同材质或不同材质的填充物，来将金属或非金属工件紧密连接的一个工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":50,\"name\":\"普工\",\"description\":\"普通工人\",\"modifiedDateTime\":1516515548000,\"createdDateTime\":null,\"isDeleted\":0,\"selected\":true}]', '54', '1-3年工作经验', '[{\"id\":2,\"name\":\"搬砖\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":5,\"name\":\"钢筋\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":6,\"name\":\"水泥\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":11,\"name\":\"不抽烟\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true},{\"id\":12,\"name\":\"活好\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '2018-01-21 14:47:48', '2018-01-01 21:49:47', 0);
INSERT INTO `le_mobile_user_resume` VALUES (33, 76, '雇员', 2, '[{\"id\":1,\"name\":\"电工\",\"description\":\"从事电力生产和电气制造电气维修、建筑安装行业等工业生产体系的人员（工种）。从事电磁领域的客观规律研究及其应用的人员，通常称电气工程师。\",\"modifiedDateTime\":1505750400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":2,\"name\":\"木工\",\"description\":\"木工（Wood Working）是一门工艺，也是建筑常用的技术，是中国传统三行（即木工、木头、木匠）之一。木工是为业主完成房屋装修过程中的各项木质工程的工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"焊工\",\"description\":\"焊工是采用合适的焊接方式，合理的焊接工艺，适当的焊接设备，采用同材质或不同材质的填充物，来将金属或非金属工件紧密连接的一个工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true}]', '57', '10年以上工作经验', '[{\"id\":2,\"name\":\"搬砖\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":4,\"name\":\"电焊\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":5,\"name\":\"钢筋\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":1,\"name\":\"诚实\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":2,\"name\":\"能吃苦\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":4,\"name\":\"作风优良\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '2018-01-02 10:56:32', '2018-01-02 09:33:58', 0);
INSERT INTO `le_mobile_user_resume` VALUES (34, 78, '雇员', 2, '[{\"id\":1,\"name\":\"电工\",\"description\":\"从事电力生产和电气制造电气维修、建筑安装行业等工业生产体系的人员（工种）。从事电磁领域的客观规律研究及其应用的人员，通常称电气工程师。\",\"modifiedDateTime\":1505750400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":2,\"name\":\"木工\",\"description\":\"木工（Wood Working）是一门工艺，也是建筑常用的技术，是中国传统三行（即木工、木头、木匠）之一。木工是为业主完成房屋装修过程中的各项木质工程的工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true}]', '54', '1-3年工作经验', '[{\"id\":3,\"name\":\"沙袋\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":9,\"name\":\"管道\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":1,\"name\":\"诚实\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"开朗大方\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '2018-01-10 14:24:39', '2018-01-08 13:58:07', 0);
INSERT INTO `le_mobile_user_resume` VALUES (35, 79, '雇员', 2, '[{\"id\":1,\"name\":\"电工\",\"description\":\"从事电力生产和电气制造电气维修、建筑安装行业等工业生产体系的人员（工种）。从事电磁领域的客观规律研究及其应用的人员，通常称电气工程师。\",\"modifiedDateTime\":1505750400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":2,\"name\":\"木工\",\"description\":\"木工（Wood Working）是一门工艺，也是建筑常用的技术，是中国传统三行（即木工、木头、木匠）之一。木工是为业主完成房屋装修过程中的各项木质工程的工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"焊工\",\"description\":\"焊工是采用合适的焊接方式，合理的焊接工艺，适当的焊接设备，采用同材质或不同材质的填充物，来将金属或非金属工件紧密连接的一个工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true}]', '57', '10年以上工作经验', '[{\"id\":2,\"name\":\"搬砖\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"沙袋\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":4,\"name\":\"电焊\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":1,\"name\":\"诚实\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":2,\"name\":\"能吃苦\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"开朗大方\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '2018-01-11 16:08:31', '2018-01-09 11:34:57', 0);
INSERT INTO `le_mobile_user_resume` VALUES (36, 80, '雇员', 2, '[{\"id\":1,\"name\":\"电工\",\"description\":\"从事电力生产和电气制造电气维修、建筑安装行业等工业生产体系的人员（工种）。从事电磁领域的客观规律研究及其应用的人员，通常称电气工程师。\",\"modifiedDateTime\":1505750400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"焊工\",\"description\":\"焊工是采用合适的焊接方式，合理的焊接工艺，适当的焊接设备，采用同材质或不同材质的填充物，来将金属或非金属工件紧密连接的一个工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":14,\"name\":\"瓦工\",\"description\":\"瓦工就是用砖或砌块和砂浆砌筑房屋、烟囱或房顶铺瓦砖及其它构筑物的工人。\",\"modifiedDateTime\":1505232000000,\"createdDateTime\":1505232000000,\"isDeleted\":0,\"selected\":true}]', '56', '5-10年工作经验', '[{\"id\":5,\"name\":\"钢筋\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":7,\"name\":\"抹灰\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true},{\"id\":8,\"name\":\"油漆\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":5,\"name\":\"团结友善\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":6,\"name\":\"上进\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true},{\"id\":8,\"name\":\"无负担\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '2018-01-09 12:54:56', '2018-01-09 12:33:06', 0);
INSERT INTO `le_mobile_user_resume` VALUES (37, 81, '雇员', 2, '[{\"id\":1,\"name\":\"电工\",\"description\":\"从事电力生产和电气制造电气维修、建筑安装行业等工业生产体系的人员（工种）。从事电磁领域的客观规律研究及其应用的人员，通常称电气工程师。\",\"modifiedDateTime\":1505750400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":2,\"name\":\"木工\",\"description\":\"木工（Wood Working）是一门工艺，也是建筑常用的技术，是中国传统三行（即木工、木头、木匠）之一。木工是为业主完成房屋装修过程中的各项木质工程的工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"焊工\",\"description\":\"焊工是采用合适的焊接方式，合理的焊接工艺，适当的焊接设备，采用同材质或不同材质的填充物，来将金属或非金属工件紧密连接的一个工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true}]', '54', '1-3年工作经验', '[{\"id\":2,\"name\":\"搬砖\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"沙袋\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":4,\"name\":\"电焊\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":1,\"name\":\"诚实\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":2,\"name\":\"能吃苦\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"开朗大方\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '2018-01-09 23:22:51', '2018-01-09 23:21:32', 0);
INSERT INTO `le_mobile_user_resume` VALUES (38, 82, '雇员', 2, '[{\"id\":1,\"name\":\"电工\",\"description\":\"从事电力生产和电气制造电气维修、建筑安装行业等工业生产体系的人员（工种）。从事电磁领域的客观规律研究及其应用的人员，通常称电气工程师。\",\"modifiedDateTime\":1505750400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true}]', '54', '1-3年工作经验', '[{\"id\":2,\"name\":\"搬砖\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":1,\"name\":\"诚实\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '2018-01-15 18:59:55', '2018-01-15 18:59:28', 0);
INSERT INTO `le_mobile_user_resume` VALUES (39, 83, '雇员', 2, '[{\"id\":1,\"name\":\"电工\",\"description\":\"从事电力生产和电气制造电气维修、建筑安装行业等工业生产体系的人员（工种）。从事电磁领域的客观规律研究及其应用的人员，通常称电气工程师。\",\"modifiedDateTime\":1505750400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":13,\"name\":\"技工\",\"description\":\"技工的含义是指有专长或职业技能的技术人员，技工工种大约有3类，凭借着本身的技能，负责着某一工作领域或生产制造流水线的正常运行·是否是高级技工，是凭掌握技能的多少和层次高低而定的。.技工学校(technical school) 是培养技术技能型人才的主要基地。\",\"modifiedDateTime\":1505232000000,\"createdDateTime\":1505232000000,\"isDeleted\":0,\"selected\":true},{\"id\":15,\"name\":\"万能工\",\"description\":\"万能工\",\"modifiedDateTime\":1505232000000,\"createdDateTime\":1505232000000,\"isDeleted\":0,\"selected\":true}]', '57', '10年以上工作经验', '[{\"id\":3,\"name\":\"沙袋\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":6,\"name\":\"水泥\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true},{\"id\":7,\"name\":\"抹灰\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":1,\"name\":\"诚实\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":4,\"name\":\"作风优良\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":6,\"name\":\"上进\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '2018-01-17 19:49:50', '2018-01-17 19:48:52', 0);
INSERT INTO `le_mobile_user_resume` VALUES (40, 85, '雇员', 2, '[{\"id\":1,\"name\":\"电工\",\"description\":\"从事电力生产和电气制造电气维修、建筑安装行业等工业生产体系的人员（工种）。从事电磁领域的客观规律研究及其应用的人员，通常称电气工程师。\",\"modifiedDateTime\":1505750400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"焊工\",\"description\":\"焊工是采用合适的焊接方式，合理的焊接工艺，适当的焊接设备，采用同材质或不同材质的填充物，来将金属或非金属工件紧密连接的一个工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":50,\"name\":\"普工\",\"description\":\"普通工人\",\"modifiedDateTime\":1516515548000,\"createdDateTime\":null,\"isDeleted\":0,\"selected\":true}]', '57', '10年以上工作经验', '[{\"id\":5,\"name\":\"钢筋\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":6,\"name\":\"水泥\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true},{\"id\":7,\"name\":\"抹灰\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":1,\"name\":\"诚实\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":2,\"name\":\"能吃苦\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"开朗大方\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '2018-01-21 15:32:54', '2018-01-21 15:30:25', 0);
INSERT INTO `le_mobile_user_resume` VALUES (41, 86, '雇员', 2, '[{\"id\":50,\"name\":\"普工\",\"description\":\"普通工人\",\"modifiedDateTime\":1516515548000,\"createdDateTime\":null,\"isDeleted\":0,\"selected\":true}]', '57', '10年以上工作经验', '[{\"id\":2,\"name\":\"搬砖\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"沙袋\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":9,\"name\":\"管道\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":1,\"name\":\"诚实\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '2018-01-22 00:28:06', '2018-01-22 00:27:00', 0);
INSERT INTO `le_mobile_user_resume` VALUES (42, 90, '雇员', 2, '[{\"id\":1,\"name\":\"电工\",\"description\":\"从事电力生产和电气制造电气维修、建筑安装行业等工业生产体系的人员（工种）。从事电磁领域的客观规律研究及其应用的人员，通常称电气工程师。\",\"modifiedDateTime\":1505750400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"焊工\",\"description\":\"焊工是采用合适的焊接方式，合理的焊接工艺，适当的焊接设备，采用同材质或不同材质的填充物，来将金属或非金属工件紧密连接的一个工种。\",\"modifiedDateTime\":1505318400000,\"createdDateTime\":1503849600000,\"isDeleted\":0,\"selected\":true},{\"id\":50,\"name\":\"普工\",\"description\":\"普工,顾名思义 ,普通的工人。普工指的是， 拥有基本的技能， 能胜任普通工作的人员。普工在珠三角和长三角地区制造型工厂是用来指在生产线上做一些技术要求不高的岗位的员工.\",\"modifiedDateTime\":1517020801000,\"createdDateTime\":1516588484000,\"isDeleted\":0,\"selected\":true}]', '57', '10年以上工作经验', '[{\"id\":2,\"name\":\"搬砖\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":4,\"name\":\"电焊\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":6,\"name\":\"水泥\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":2,\"name\":\"能吃苦\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":5,\"name\":\"团结友善\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":8,\"name\":\"无负担\",\"modifiedDateTime\":1510848000000,\"createdDateTime\":1510848000000,\"isDeleted\":0,\"selected\":true}]', '2018-02-05 22:05:26', '2018-02-03 17:42:13', 0);
INSERT INTO `le_mobile_user_resume` VALUES (43, 91, '雇员', 2, '[{\"id\":50,\"name\":\"普工\",\"description\":\"普工,顾名思义 ,普通的工人。普工指的是， 拥有基本的技能， 能胜任普通工作的人员。普工在珠三角和长三角地区制造型工厂是用来指在生产线上做一些技术要求不高的岗位的员工.\",\"modifiedDateTime\":1517020801000,\"createdDateTime\":1516588484000,\"isDeleted\":0,\"selected\":true}]', '56', '5-10年工作经验', '[{\"id\":2,\"name\":\"搬砖\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '[{\"id\":1,\"name\":\"诚实\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":2,\"name\":\"能吃苦\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true},{\"id\":3,\"name\":\"开朗大方\",\"modifiedDateTime\":1510675200000,\"createdDateTime\":1510675200000,\"isDeleted\":0,\"selected\":true}]', '2018-03-20 22:59:16', '2018-03-20 22:56:57', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_user_resume_ain_goodats
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_user_resume_ain_goodats`;
CREATE TABLE `le_mobile_user_resume_ain_goodats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '客户端用户id',
  `typeName` text COMMENT '客户端用户类型',
  `typeId` bigint(20) DEFAULT NULL COMMENT '客户端用户类型id',
  `goodAtTypeId` bigint(20) DEFAULT NULL COMMENT '工作类型id',
  `goodAtTypeName` text COMMENT '工作类型',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='客户端用户简历表-子表-擅长';

-- ----------------------------
-- Records of le_mobile_user_resume_ain_goodats
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (29, 69, '雇员', 2, 2, '搬砖', '2017-12-14 16:45:41', '2017-12-14 16:45:41', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (30, 69, '雇员', 2, 3, '沙袋', '2017-12-14 16:45:41', '2017-12-14 16:45:41', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (31, 69, '雇员', 2, 4, '电焊', '2017-12-14 16:45:41', '2017-12-14 16:45:41', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (32, 70, '雇员', 2, 6, '水泥', '2017-12-14 16:48:07', '2017-12-14 16:48:07', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (33, 70, '雇员', 2, 7, '抹灰', '2017-12-14 16:48:07', '2017-12-14 16:48:07', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (34, 70, '雇员', 2, 8, '油漆', '2017-12-14 16:48:07', '2017-12-14 16:48:07', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (35, 72, '雇员', 2, 5, '钢筋', '2017-12-20 21:58:12', '2017-12-20 21:58:12', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (36, 72, '雇员', 2, 6, '水泥', '2017-12-20 21:58:12', '2017-12-20 21:58:12', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (37, 72, '雇员', 2, 11, '木活', '2017-12-20 21:58:12', '2017-12-20 21:58:12', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (41, 75, '雇员', 2, 2, '搬砖', '2018-01-01 22:01:31', '2018-01-01 22:01:31', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (42, 75, '雇员', 2, 5, '钢筋', '2018-01-01 22:01:31', '2018-01-01 22:01:31', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (43, 75, '雇员', 2, 6, '水泥', '2018-01-01 22:01:31', '2018-01-01 22:01:31', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (44, 76, '雇员', 2, 2, '搬砖', '2018-01-02 10:56:29', '2018-01-02 10:56:29', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (45, 76, '雇员', 2, 4, '电焊', '2018-01-02 10:56:29', '2018-01-02 10:56:29', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (46, 76, '雇员', 2, 5, '钢筋', '2018-01-02 10:56:29', '2018-01-02 10:56:29', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (47, 80, '雇员', 2, 5, '钢筋', '2018-01-09 12:54:53', '2018-01-09 12:54:53', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (48, 80, '雇员', 2, 7, '抹灰', '2018-01-09 12:54:53', '2018-01-09 12:54:53', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (49, 80, '雇员', 2, 8, '油漆', '2018-01-09 12:54:53', '2018-01-09 12:54:53', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (53, 81, '雇员', 2, 2, '搬砖', '2018-01-09 23:22:48', '2018-01-09 23:22:48', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (54, 81, '雇员', 2, 3, '沙袋', '2018-01-09 23:22:48', '2018-01-09 23:22:48', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (55, 81, '雇员', 2, 4, '电焊', '2018-01-09 23:22:48', '2018-01-09 23:22:48', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (56, 78, '雇员', 2, 3, '沙袋', '2018-01-10 14:24:22', '2018-01-10 14:24:22', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (57, 78, '雇员', 2, 9, '管道', '2018-01-10 14:24:22', '2018-01-10 14:24:22', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (61, 79, '雇员', 2, 2, '搬砖', '2018-01-11 16:08:34', '2018-01-11 16:08:34', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (62, 79, '雇员', 2, 3, '沙袋', '2018-01-11 16:08:34', '2018-01-11 16:08:34', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (63, 79, '雇员', 2, 4, '电焊', '2018-01-11 16:08:34', '2018-01-11 16:08:34', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (64, 82, '雇员', 2, 2, '搬砖', '2018-01-15 18:59:53', '2018-01-15 18:59:53', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (65, 83, '雇员', 2, 3, '沙袋', '2018-01-17 19:49:47', '2018-01-17 19:49:47', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (66, 83, '雇员', 2, 6, '水泥', '2018-01-17 19:49:47', '2018-01-17 19:49:47', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (67, 83, '雇员', 2, 7, '抹灰', '2018-01-17 19:49:47', '2018-01-17 19:49:47', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (70, 55, '雇员', 2, 6, '水泥', '2018-01-19 13:33:47', '2018-01-19 13:33:47', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (71, 55, '雇员', 2, 9, '管道', '2018-01-19 13:33:47', '2018-01-19 13:33:47', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (72, 55, '雇员', 2, 10, '架子', '2018-01-19 13:33:47', '2018-01-19 13:33:47', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (73, 85, '雇员', 2, 5, '钢筋', '2018-01-21 15:32:46', '2018-01-21 15:32:46', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (74, 85, '雇员', 2, 6, '水泥', '2018-01-21 15:32:46', '2018-01-21 15:32:46', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (75, 85, '雇员', 2, 7, '抹灰', '2018-01-21 15:32:46', '2018-01-21 15:32:46', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (76, 86, '雇员', 2, 2, '搬砖', '2018-01-22 00:28:02', '2018-01-22 00:28:02', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (77, 86, '雇员', 2, 3, '沙袋', '2018-01-22 00:28:02', '2018-01-22 00:28:02', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (78, 86, '雇员', 2, 9, '管道', '2018-01-22 00:28:02', '2018-01-22 00:28:02', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (79, 90, '雇员', 2, 2, '搬砖', '2018-02-05 22:05:22', '2018-02-05 22:05:22', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (80, 90, '雇员', 2, 4, '电焊', '2018-02-05 22:05:22', '2018-02-05 22:05:22', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (81, 90, '雇员', 2, 6, '水泥', '2018-02-05 22:05:22', '2018-02-05 22:05:22', 0);
INSERT INTO `le_mobile_user_resume_ain_goodats` VALUES (82, 91, '雇员', 2, 2, '搬砖', '2018-03-20 22:58:33', '2018-03-20 22:58:33', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_user_resume_ain_selfevals
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_user_resume_ain_selfevals`;
CREATE TABLE `le_mobile_user_resume_ain_selfevals` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '客户端用户id',
  `typeName` text COMMENT '客户端用户类型',
  `typeId` bigint(20) DEFAULT NULL COMMENT '客户端用户类型id',
  `selfevalTypeId` bigint(20) DEFAULT NULL COMMENT '工作类型id',
  `selfevalTypeName` text COMMENT '工作类型',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='客户端用户简历表-子表-自我评价';

-- ----------------------------
-- Records of le_mobile_user_resume_ain_selfevals
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (32, 69, '雇员', 2, 6, '上进', '2017-12-14 16:46:08', '2017-12-14 16:46:08', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (33, 69, '雇员', 2, 7, '品质好', '2017-12-14 16:46:08', '2017-12-14 16:46:08', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (34, 69, '雇员', 2, 8, '无负担', '2017-12-14 16:46:08', '2017-12-14 16:46:08', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (35, 70, '雇员', 2, 10, '不喝酒', '2017-12-14 16:48:12', '2017-12-14 16:48:12', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (36, 70, '雇员', 2, 11, '不抽烟', '2017-12-14 16:48:12', '2017-12-14 16:48:12', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (37, 70, '雇员', 2, 12, '活好', '2017-12-14 16:48:12', '2017-12-14 16:48:12', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (38, 72, '雇员', 2, 1, '诚实', '2017-12-20 21:58:19', '2017-12-20 21:58:19', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (39, 72, '雇员', 2, 2, '能吃苦', '2017-12-20 21:58:19', '2017-12-20 21:58:19', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (40, 72, '雇员', 2, 3, '开朗大方', '2017-12-20 21:58:19', '2017-12-20 21:58:19', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (44, 75, '雇员', 2, 11, '不抽烟', '2018-01-01 22:01:38', '2018-01-01 22:01:38', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (45, 75, '雇员', 2, 12, '活好', '2018-01-01 22:01:38', '2018-01-01 22:01:38', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (46, 76, '雇员', 2, 1, '诚实', '2018-01-02 10:56:32', '2018-01-02 10:56:32', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (47, 76, '雇员', 2, 2, '能吃苦', '2018-01-02 10:56:32', '2018-01-02 10:56:32', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (48, 76, '雇员', 2, 4, '作风优良', '2018-01-02 10:56:32', '2018-01-02 10:56:32', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (49, 80, '雇员', 2, 5, '团结友善', '2018-01-09 12:54:56', '2018-01-09 12:54:56', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (50, 80, '雇员', 2, 6, '上进', '2018-01-09 12:54:56', '2018-01-09 12:54:56', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (51, 80, '雇员', 2, 8, '无负担', '2018-01-09 12:54:56', '2018-01-09 12:54:56', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (55, 81, '雇员', 2, 1, '诚实', '2018-01-09 23:22:51', '2018-01-09 23:22:51', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (56, 81, '雇员', 2, 2, '能吃苦', '2018-01-09 23:22:51', '2018-01-09 23:22:51', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (57, 81, '雇员', 2, 3, '开朗大方', '2018-01-09 23:22:51', '2018-01-09 23:22:51', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (58, 78, '雇员', 2, 1, '诚实', '2018-01-10 14:24:39', '2018-01-10 14:24:39', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (59, 78, '雇员', 2, 3, '开朗大方', '2018-01-10 14:24:39', '2018-01-10 14:24:39', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (60, 79, '雇员', 2, 1, '诚实', '2018-01-11 15:52:35', '2018-01-11 15:52:35', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (61, 79, '雇员', 2, 2, '能吃苦', '2018-01-11 15:52:35', '2018-01-11 15:52:35', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (62, 79, '雇员', 2, 3, '开朗大方', '2018-01-11 15:52:35', '2018-01-11 15:52:35', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (63, 82, '雇员', 2, 1, '诚实', '2018-01-15 18:59:55', '2018-01-15 18:59:55', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (64, 83, '雇员', 2, 1, '诚实', '2018-01-17 19:49:50', '2018-01-17 19:49:50', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (65, 83, '雇员', 2, 4, '作风优良', '2018-01-17 19:49:50', '2018-01-17 19:49:50', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (66, 83, '雇员', 2, 6, '上进', '2018-01-17 19:49:50', '2018-01-17 19:49:50', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (67, 55, '雇员', 2, 4, '作风优良', '2018-01-19 13:34:03', '2018-01-19 13:34:03', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (68, 55, '雇员', 2, 5, '团结友善', '2018-01-19 13:34:03', '2018-01-19 13:34:03', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (69, 55, '雇员', 2, 6, '上进', '2018-01-19 13:34:03', '2018-01-19 13:34:03', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (70, 85, '雇员', 2, 1, '诚实', '2018-01-21 15:32:54', '2018-01-21 15:32:54', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (71, 85, '雇员', 2, 2, '能吃苦', '2018-01-21 15:32:54', '2018-01-21 15:32:54', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (72, 85, '雇员', 2, 3, '开朗大方', '2018-01-21 15:32:54', '2018-01-21 15:32:54', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (73, 86, '雇员', 2, 1, '诚实', '2018-01-22 00:28:06', '2018-01-22 00:28:06', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (74, 90, '雇员', 2, 2, '能吃苦', '2018-02-05 22:05:26', '2018-02-05 22:05:26', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (75, 90, '雇员', 2, 5, '团结友善', '2018-02-05 22:05:26', '2018-02-05 22:05:26', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (76, 90, '雇员', 2, 8, '无负担', '2018-02-05 22:05:26', '2018-02-05 22:05:26', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (77, 91, '雇员', 2, 1, '诚实', '2018-03-20 22:59:17', '2018-03-20 22:59:17', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (78, 91, '雇员', 2, 2, '能吃苦', '2018-03-20 22:59:17', '2018-03-20 22:59:17', 0);
INSERT INTO `le_mobile_user_resume_ain_selfevals` VALUES (79, 91, '雇员', 2, 3, '开朗大方', '2018-03-20 22:59:17', '2018-03-20 22:59:17', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_user_resume_ain_work_types
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_user_resume_ain_work_types`;
CREATE TABLE `le_mobile_user_resume_ain_work_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '客户端用户id',
  `typeName` text COMMENT '客户端用户类型',
  `typeId` bigint(20) DEFAULT NULL COMMENT '客户端用户类型id',
  `workTypeId` bigint(20) DEFAULT NULL COMMENT '工作类型id',
  `workTypeName` text COMMENT '工作类型',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='客户端用户简历表-子表-工种';

-- ----------------------------
-- Records of le_mobile_user_resume_ain_work_types
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (36, 69, '雇员', 2, 1, '电工', '2017-12-14 16:45:30', '2017-12-14 16:45:30', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (37, 69, '雇员', 2, 3, '焊工', '2017-12-14 16:45:30', '2017-12-14 16:45:30', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (38, 69, '雇员', 2, 15, '万能工', '2017-12-14 16:45:30', '2017-12-14 16:45:30', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (39, 70, '雇员', 2, 14, '瓦工', '2017-12-14 16:48:00', '2017-12-14 16:48:00', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (40, 70, '雇员', 2, 15, '万能工', '2017-12-14 16:48:00', '2017-12-14 16:48:00', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (41, 70, '雇员', 2, 16, '包装工', '2017-12-14 16:48:00', '2017-12-14 16:48:00', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (42, 72, '雇员', 2, 15, '万能工', '2017-12-20 21:58:00', '2017-12-20 21:58:00', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (43, 72, '雇员', 2, 16, '包装工', '2017-12-20 21:58:00', '2017-12-20 21:58:00', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (44, 72, '雇员', 2, 17, '电梯工', '2017-12-20 21:58:00', '2017-12-20 21:58:00', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (53, 76, '雇员', 2, 1, '电工', '2018-01-02 10:56:14', '2018-01-02 10:56:14', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (54, 76, '雇员', 2, 2, '木工', '2018-01-02 10:56:14', '2018-01-02 10:56:14', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (55, 76, '雇员', 2, 3, '焊工', '2018-01-02 10:56:14', '2018-01-02 10:56:14', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (56, 80, '雇员', 2, 1, '电工', '2018-01-09 12:54:45', '2018-01-09 12:54:45', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (57, 80, '雇员', 2, 3, '焊工', '2018-01-09 12:54:45', '2018-01-09 12:54:45', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (58, 80, '雇员', 2, 14, '瓦工', '2018-01-09 12:54:45', '2018-01-09 12:54:45', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (62, 81, '雇员', 2, 1, '电工', '2018-01-09 23:22:42', '2018-01-09 23:22:42', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (63, 81, '雇员', 2, 2, '木工', '2018-01-09 23:22:42', '2018-01-09 23:22:42', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (64, 81, '雇员', 2, 3, '焊工', '2018-01-09 23:22:42', '2018-01-09 23:22:42', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (65, 78, '雇员', 2, 1, '电工', '2018-01-10 14:24:04', '2018-01-10 14:24:04', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (66, 78, '雇员', 2, 2, '木工', '2018-01-10 14:24:04', '2018-01-10 14:24:04', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (70, 79, '雇员', 2, 1, '电工', '2018-01-11 16:08:31', '2018-01-11 16:08:31', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (71, 79, '雇员', 2, 2, '木工', '2018-01-11 16:08:31', '2018-01-11 16:08:31', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (72, 79, '雇员', 2, 3, '焊工', '2018-01-11 16:08:31', '2018-01-11 16:08:31', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (73, 82, '雇员', 2, 1, '电工', '2018-01-15 18:59:44', '2018-01-15 18:59:44', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (74, 83, '雇员', 2, 1, '电工', '2018-01-17 19:49:38', '2018-01-17 19:49:38', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (75, 83, '雇员', 2, 13, '技工', '2018-01-17 19:49:38', '2018-01-17 19:49:38', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (76, 83, '雇员', 2, 15, '万能工', '2018-01-17 19:49:38', '2018-01-17 19:49:38', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (77, 75, '雇员', 2, 1, '电工', '2018-01-21 14:47:48', '2018-01-21 14:47:48', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (78, 75, '雇员', 2, 3, '焊工', '2018-01-21 14:47:48', '2018-01-21 14:47:48', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (79, 75, '雇员', 2, 50, '普工', '2018-01-21 14:47:48', '2018-01-21 14:47:48', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (80, 85, '雇员', 2, 1, '电工', '2018-01-21 15:32:37', '2018-01-21 15:32:37', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (81, 85, '雇员', 2, 3, '焊工', '2018-01-21 15:32:37', '2018-01-21 15:32:37', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (82, 85, '雇员', 2, 50, '普工', '2018-01-21 15:32:37', '2018-01-21 15:32:37', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (83, 86, '雇员', 2, 50, '普工', '2018-01-22 00:27:44', '2018-01-22 00:27:44', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (84, 55, '雇员', 2, 1, '电工', '2018-01-31 13:36:27', '2018-01-31 13:36:27', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (85, 55, '雇员', 2, 3, '焊工', '2018-01-31 13:36:28', '2018-01-31 13:36:28', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (86, 55, '雇员', 2, 50, '普工', '2018-01-31 13:36:28', '2018-01-31 13:36:28', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (89, 90, '雇员', 2, 1, '电工', '2018-02-05 22:05:15', '2018-02-05 22:05:15', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (90, 90, '雇员', 2, 3, '焊工', '2018-02-05 22:05:15', '2018-02-05 22:05:15', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (91, 90, '雇员', 2, 50, '普工', '2018-02-05 22:05:15', '2018-02-05 22:05:15', 0);
INSERT INTO `le_mobile_user_resume_ain_work_types` VALUES (92, 91, '雇员', 2, 50, '普工', '2018-03-20 22:58:39', '2018-03-20 22:58:39', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_user_resume_goodats_type
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_user_resume_goodats_type`;
CREATE TABLE `le_mobile_user_resume_goodats_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` text COMMENT '擅长描述',
  `modifiedDateTime` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='客户端用户简历表之擅长类型';

-- ----------------------------
-- Records of le_mobile_user_resume_goodats_type
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_user_resume_goodats_type` VALUES (2, '搬砖', '2017-11-15 00:00:00', '2017-11-15 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_goodats_type` VALUES (3, '沙袋', '2017-11-15 00:00:00', '2017-11-15 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_goodats_type` VALUES (4, '电焊', '2017-11-15 00:00:00', '2017-11-15 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_goodats_type` VALUES (5, '钢筋', '2017-11-15 00:00:00', '2017-11-15 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_goodats_type` VALUES (6, '水泥', '2017-11-17 00:00:00', '2017-11-17 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_goodats_type` VALUES (7, '抹灰', '2017-11-17 00:00:00', '2017-11-17 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_goodats_type` VALUES (8, '油漆', '2017-11-17 00:00:00', '2017-11-17 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_goodats_type` VALUES (9, '管道', '2017-11-17 00:00:00', '2017-11-17 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_goodats_type` VALUES (10, '架子', '2017-11-17 00:00:00', '2017-11-17 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_goodats_type` VALUES (11, '木活', '2017-11-17 00:00:00', '2017-11-17 00:00:00', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_user_resume_selfevals_type
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_user_resume_selfevals_type`;
CREATE TABLE `le_mobile_user_resume_selfevals_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` text COMMENT '自我评价描述',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='客户端用户简历描述之自我评价类型';

-- ----------------------------
-- Records of le_mobile_user_resume_selfevals_type
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_user_resume_selfevals_type` VALUES (1, '诚实', '2017-11-15 00:00:00', '2017-11-15 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_selfevals_type` VALUES (2, '能吃苦', '2017-11-15 00:00:00', '2017-11-15 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_selfevals_type` VALUES (3, '开朗大方', '2017-11-15 00:00:00', '2017-11-15 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_selfevals_type` VALUES (4, '作风优良', '2017-11-15 00:00:00', '2017-11-15 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_selfevals_type` VALUES (5, '团结友善', '2017-11-15 00:00:00', '2017-11-15 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_selfevals_type` VALUES (6, '上进', '2017-11-17 00:00:00', '2017-11-17 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_selfevals_type` VALUES (7, '品质好', '2017-11-17 00:00:00', '2017-11-17 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_selfevals_type` VALUES (8, '无负担', '2017-11-17 00:00:00', '2017-11-17 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_selfevals_type` VALUES (9, '身体健康', '2017-11-17 00:00:00', '2017-11-17 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_selfevals_type` VALUES (10, '不喝酒', '2017-11-17 00:00:00', '2017-11-17 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_selfevals_type` VALUES (11, '不抽烟', '2017-11-17 00:00:00', '2017-11-17 00:00:00', 0);
INSERT INTO `le_mobile_user_resume_selfevals_type` VALUES (12, '活好', '2017-11-17 00:00:00', '2017-11-17 00:00:00', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_user_rna_order
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_user_rna_order`;
CREATE TABLE `le_mobile_user_rna_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `stateId` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单状态ID',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态，默认1，1-已提交，待审核，2-已审核，未通过，3-已审核，已通过',
  `userId` bigint(20) NOT NULL COMMENT '客户端用户id',
  `typeId` bigint(20) DEFAULT NULL COMMENT '客户端用户类型id',
  `typeName` text COMMENT '客户端用户类型',
  `userName` text COMMENT '客户端用户/公司/机构名称',
  `userIdCardNo` text COMMENT '客户端用户身份证号码/统一社会征信代码',
  `userPhoneNo` text COMMENT '客户端用户手机号',
  `userCallPhoneNo` text COMMENT '客户端用户联系电话',
  `userIdCardFontImageUrl` text COMMENT '客户端用户身份证正面照',
  `userIdCardBackImageUrl` text COMMENT '客户端用户身份证背面照',
  `userSkillBookFontImageUrl` text COMMENT '客户端用户技能证书/公司营业执照正面照',
  `userSkillBookBackImageUrl` text COMMENT '客户端用户技能证书/公司营业执照背面照',
  `changeStateReason` text COMMENT '客户端用户实名认证订单审核批注内容',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='客户端用户实名认证订单\nReal name authentication\n\n';

-- ----------------------------
-- Records of le_mobile_user_rna_order
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_user_rna_order` VALUES (3, 0, 3, 55, 2, '雇员', '我是萌萌哒天团', '510823199303125563', '18702839327', NULL, 'http://oz2x7bysv.bkt.clouddn.com/7D5B408842574C9FA75D84D82AA557E3.jpg', 'http://oz2x7bysv.bkt.clouddn.com/FBEDC80A1D4A46148AD71A72F5EE9561.jpg', 'http://oz2x7bysv.bkt.clouddn.com/6E0BD8D01C1E40B49FB3C12AC5F3639B.jpg', NULL, NULL, '2017-12-21 17:16:30', '2017-12-21 17:16:31', 0);
INSERT INTO `le_mobile_user_rna_order` VALUES (4, 0, 3, 73, 1, '雇主', '四川成都高新技术开发有限公司', '33333333666666', '18702839327', '028-3366995566', 'http://oz2x7bysv.bkt.clouddn.com/0963FFB7C90A40AD885EA8325CF551AC.jpg', NULL, NULL, NULL, NULL, '2017-12-21 22:41:35', '2017-12-21 22:41:35', 0);
INSERT INTO `le_mobile_user_rna_order` VALUES (5, 0, 3, 74, 1, '雇主', '郝纯', '220104198707203820', '15680001753', '15680001753', 'http://oz2x7bysv.bkt.clouddn.com/2E13D0856CD5480E8C889DC7E90C16D5.jpg', 'http://oz2x7bysv.bkt.clouddn.com/4B974F4D81534604BBF2C4A4195CC489.jpg', NULL, NULL, NULL, '2018-01-01 21:47:35', '2018-01-01 21:47:35', 0);
INSERT INTO `le_mobile_user_rna_order` VALUES (6, 0, 3, 75, 2, '雇员', '郝纯', '220104198707203820', '15680001753', NULL, 'http://oz2x7bysv.bkt.clouddn.com/27EA81D1C4C2457FB1853E34FBF595FF.jpg', 'http://oz2x7bysv.bkt.clouddn.com/8F57044CC69D4C6CB1FAE3B2C8A9487C.jpg', 'http://oz2x7bysv.bkt.clouddn.com/E7F67392FAAB44F09366765EED763508.jpg', NULL, NULL, '2018-01-01 21:50:51', '2018-01-01 21:50:51', 0);
INSERT INTO `le_mobile_user_rna_order` VALUES (7, 0, 3, 76, 2, '雇员', '把', '510923199312035566', '13255666998', NULL, 'http://oz2x7bysv.bkt.clouddn.com/C444BEC10A9043BC9EFE8D277C6B969B.jpg', 'http://oz2x7bysv.bkt.clouddn.com/B0A4D5B374D24F94B7088CF7BDDCA491.jpg', 'http://oz2x7bysv.bkt.clouddn.com/D540F25270284F1CB3972616D4E5C947.jpg', NULL, NULL, '2018-01-02 09:47:40', '2018-01-02 09:47:40', 0);
INSERT INTO `le_mobile_user_rna_order` VALUES (8, 0, 3, 70, 2, '雇员', '我是萌萌', '510823199212039966', '13233331234', NULL, 'http://oz2x7bysv.bkt.clouddn.com/940303614A8E45188A41BF14FB88380E.jpg', 'http://oz2x7bysv.bkt.clouddn.com/07201C9E550440CB8CD3F3544933762E.jpg', 'http://oz2x7bysv.bkt.clouddn.com/CF153C9C00DB4A25B73F4B9C9980DC91.jpg', NULL, NULL, '2018-01-02 11:22:21', '2018-01-02 11:22:21', 0);
INSERT INTO `le_mobile_user_rna_order` VALUES (9, 0, 3, 78, 2, '雇员', '陈成', '51092119880929577X', '15882364142', NULL, 'http://oz2x7bysv.bkt.clouddn.com/26D7290AACE846F2B45C43119D091683.jpg', 'http://oz2x7bysv.bkt.clouddn.com/6CB4E609181845D8945C16E8898EA8BF.jpg', 'http://oz2x7bysv.bkt.clouddn.com/93212F55D8AB4A0487FE413CE4B9E43D.jpg', NULL, NULL, '2018-01-08 14:42:22', '2018-01-08 14:42:22', 0);
INSERT INTO `le_mobile_user_rna_order` VALUES (10, 0, 3, 77, 1, '雇主', '陈成', '51092119880929577x', '15882364142', '15882364142', 'http://oz2x7bysv.bkt.clouddn.com/ADAF97A43B0B451EA8C5DF93AE8D54A4.jpg', 'http://oz2x7bysv.bkt.clouddn.com/8C1ECB61D6AC47CF84F47EC6D3E3EE91.jpg', NULL, NULL, NULL, '2018-01-08 15:01:18', '2018-01-08 15:01:18', 0);
INSERT INTO `le_mobile_user_rna_order` VALUES (11, 0, 3, 80, 2, '雇员', 'Llll', '510823199608089900', '13388990000', NULL, 'http://oz2x7bysv.bkt.clouddn.com/DD74D4A4A4FE4FA7AC8134C02193814A.jpg', 'http://oz2x7bysv.bkt.clouddn.com/2B6415958D9349CC954782C870D11963.jpg', 'http://oz2x7bysv.bkt.clouddn.com/975AEE3659EA46A9A98870E6DBA09276.jpg', NULL, NULL, '2018-01-09 13:18:17', '2018-01-09 13:18:17', 0);
INSERT INTO `le_mobile_user_rna_order` VALUES (12, 0, 3, 79, 2, '雇员', '上官花花', '510823198912038855', '13963362233', NULL, 'http://oz2x7bysv.bkt.clouddn.com/96254B950FD94FFD9DDD0706277BBFF6.jpg', 'http://oz2x7bysv.bkt.clouddn.com/DC275A7D43DA44B48945A37EBAA91546.jpg', 'http://oz2x7bysv.bkt.clouddn.com/23C800C622F4432E911540EF2F1053C8.jpg', NULL, NULL, '2018-01-09 15:59:20', '2018-01-09 15:59:20', 0);
INSERT INTO `le_mobile_user_rna_order` VALUES (13, 0, 3, 81, 2, '雇员', '欧阳夏丹', '512355196303128899', '18233669966', NULL, 'http://oz2x7bysv.bkt.clouddn.com/34CE501FFFCA42D592B9B06B80920197.jpg', 'http://oz2x7bysv.bkt.clouddn.com/CD13F2EC1B794FDE90EBBF3796B24183.jpg', NULL, NULL, NULL, '2018-01-09 23:23:46', '2018-01-09 23:23:46', 0);
INSERT INTO `le_mobile_user_rna_order` VALUES (14, 0, 3, 83, 2, '雇员', '我是你的', '510366169302135566', '15866966633', NULL, 'http://oz2x7bysv.bkt.clouddn.com/FFC1F4AE6B13460EA04BA7A1FC6395C7.jpg', 'http://oz2x7bysv.bkt.clouddn.com/591F85B36F6043E79E36D1AB29E19E4B.jpg', 'http://oz2x7bysv.bkt.clouddn.com/10435165EBD148B39667758F77E99A69.jpg', NULL, NULL, '2018-01-17 19:50:41', '2018-01-17 19:50:41', 0);
INSERT INTO `le_mobile_user_rna_order` VALUES (15, 0, 3, 85, 2, '雇员', '改改脾气', '512355196312225566', '13255669966', NULL, 'http://oz2x7bysv.bkt.clouddn.com/D80241DB9C1F46BCAACBA5E447BEC890.jpg', 'http://oz2x7bysv.bkt.clouddn.com/0C8B454FE9FF4B09AA5951621C083B7B.jpg', NULL, NULL, NULL, '2018-01-21 15:34:22', '2018-01-21 15:34:22', 0);
INSERT INTO `le_mobile_user_rna_order` VALUES (16, 0, 3, 88, 1, '雇主', '我默默地看着你', '510823196308082233', '18702539327', '18702839327', 'http://oz2x7bysv.bkt.clouddn.com/49A379BA5D264180AA35B123601B5DB2.jpg', 'http://oz2x7bysv.bkt.clouddn.com/389B4C9495104C728F8891490C3C4D27.jpg', NULL, NULL, NULL, '2018-02-01 11:15:11', '2018-02-01 11:15:12', 0);
INSERT INTO `le_mobile_user_rna_order` VALUES (17, 0, 3, 90, 2, '雇员', '我的', '523699196382038822', '18702869966', NULL, 'http://oz2x7bysv.bkt.clouddn.com/38F9DFB1CDE046C79993D76E87842278.jpg', 'http://oz2x7bysv.bkt.clouddn.com/8F028B3237804C938F68EB6E52CBF052.jpg', NULL, NULL, NULL, '2018-02-06 11:20:22', '2018-02-06 11:20:23', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_user_rna_state
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_user_rna_state`;
CREATE TABLE `le_mobile_user_rna_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` text NOT NULL COMMENT '客户端用户实名认证状态名称',
  `stateValue` bigint(20) NOT NULL COMMENT '客户端用户实名认证状态别名，英文。',
  `desc` text COMMENT '客户端用户实名认证状态描述',
  `modifiedDateTime` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) DEFAULT NULL COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='客户端用户实名认证状态类型表\n\n10 待审核\n11 未通过\n12 已通过\n\n———————————\n\n简历 \n资料\n雇主\n雇员\n自由职业者\n实名认证\n状态\n\nresume\ndata\nEmployer\nEmployee\nProfessional\nReal name authentication\nstate\n\n\n';

-- ----------------------------
-- Records of le_mobile_user_rna_state
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_user_rna_state` VALUES (1, '待审核', 10, '待审核', '2017-08-28 00:00:00', '2017-08-28 00:00:00', 0);
INSERT INTO `le_mobile_user_rna_state` VALUES (2, '未通过', 11, '未通过', '2017-08-28 00:00:00', '2017-08-28 00:00:00', 0);
INSERT INTO `le_mobile_user_rna_state` VALUES (3, '已通过', 12, '已通过', '2017-08-28 00:00:00', '2017-08-28 00:00:00', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_user_sms
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_user_sms`;
CREATE TABLE `le_mobile_user_sms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` text COMMENT '客户端用户手机号',
  `smsCode` text COMMENT '短信内容',
  `smsTag` text COMMENT '短信防重复验证tag',
  `isDeleted` int(11) DEFAULT NULL COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  `modifiedDateTime` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='客户端用户短信缓存表';

-- ----------------------------
-- Records of le_mobile_user_sms
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_user_sms` VALUES (42, '18702839327', '9548', '1510638265371B645EE700A634F13814980428903C899', 0, '2017-11-14 13:44:25', '2017-11-14 13:44:25');
INSERT INTO `le_mobile_user_sms` VALUES (43, '18702839327', '7567', '1510638398345B648C85BB24D43959957A8239517A60D', 0, '2017-11-14 13:46:38', '2017-11-14 13:46:38');
INSERT INTO `le_mobile_user_sms` VALUES (44, '18702839327', '4427', '15108875171610B13F7B9E5A64FC9BFC261AE73FA826C', 0, '2017-11-17 10:58:37', '2017-11-17 10:58:37');
INSERT INTO `le_mobile_user_sms` VALUES (45, '18702839327', '9959', '1512455078007B342B1A6A8CF4ED7A22D85A24B960372', 0, '2017-12-05 14:24:38', '2017-12-05 14:24:38');
INSERT INTO `le_mobile_user_sms` VALUES (46, '18702839327', '2370', '15148771689180CD2C93082D54344BECCA929A0F0FBE2', 0, '2018-01-02 15:12:48', '2018-01-02 15:12:48');
INSERT INTO `le_mobile_user_sms` VALUES (47, '15680001753', '7742', '1514954096135FC810FCBED6449ACB420E7A961D8342C', 0, '2018-01-03 12:34:56', '2018-01-03 12:34:56');
INSERT INTO `le_mobile_user_sms` VALUES (48, '18702839327', '5894', '1514954122328A2193E2A7CB5479E8AD459AF9E07B35E', 0, '2018-01-03 12:35:22', '2018-01-03 12:35:22');
INSERT INTO `le_mobile_user_sms` VALUES (49, '15882364142', '8867', '1515390296908DF5B2BBB4B5B4F1F88370162B24A62A6', 0, '2018-01-08 13:44:56', '2018-01-08 13:44:56');
INSERT INTO `le_mobile_user_sms` VALUES (50, '15882364142', '1166', '151539107724029C3A5E3F4D343428A5A73A3398EF359', 0, '2018-01-08 13:57:57', '2018-01-08 13:57:57');
INSERT INTO `le_mobile_user_sms` VALUES (51, '13963362233', '4848', '1515468971042051D58B1EAB7497BB2F1B376424E7165', 0, '2018-01-09 11:36:11', '2018-01-09 11:36:11');
INSERT INTO `le_mobile_user_sms` VALUES (52, '13388990000', '9214', '1515474476612080A71FA4BB44FCD96FEF7C3A436FFDB', 0, '2018-01-09 13:07:56', '2018-01-09 13:07:56');
INSERT INTO `le_mobile_user_sms` VALUES (53, '18702839327', '8028', '1516232998692AA75236127B14A4DA7F0EC37A38AE2D7', 0, '2018-01-18 07:49:58', '2018-01-18 07:49:58');
INSERT INTO `le_mobile_user_sms` VALUES (54, '18702839327', '3868', '1516518270035EB8704AABA0D41F48F51F9F62EB5CFFC', 0, '2018-01-21 15:04:30', '2018-01-21 15:04:30');
INSERT INTO `le_mobile_user_sms` VALUES (55, '13255669966', '7465', '15165198197341DA17CAB832D4C51B47241CCDA8F97C0', 0, '2018-01-21 15:30:19', '2018-01-21 15:30:19');
INSERT INTO `le_mobile_user_sms` VALUES (56, '13331751061', '9683', '15165520076826242E6C88EB341B2A79E4B8CB1B45A31', 0, '2018-01-22 00:26:47', '2018-01-22 00:26:47');
INSERT INTO `le_mobile_user_sms` VALUES (57, '18702839327', '3068', '15196201263495717F51820414FE9B2228D93C44D4591', 0, '2018-02-26 12:42:06', '2018-02-26 12:42:06');
INSERT INTO `le_mobile_user_sms` VALUES (58, '15902832286', '1768', '1521557802370B0AEB9397E92433C9037F49BD468F2CB', 0, '2018-03-20 22:56:42', '2018-03-20 22:56:42');
INSERT INTO `le_mobile_user_sms` VALUES (59, '15852364142', '9691', '1524634816198EA8719F90FEF4EB2874CF40521A29603', 0, '2018-04-25 13:40:16', '2018-04-25 13:40:16');
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_user_type
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_user_type`;
CREATE TABLE `le_mobile_user_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` text COMMENT '客户端用户类型名称',
  `nickName` text CHARACTER SET latin1 COMMENT '客户端用户类型别名，英文。',
  `desc` text COMMENT '客户端用户类型描述',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) NOT NULL COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='客户端用户类型表';

-- ----------------------------
-- Records of le_mobile_user_type
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_user_type` VALUES (1, '雇主', 'Employer', '雇主，拥有雇主权限', '2017-08-28 00:00:00', '2017-08-28 00:00:00', 0);
INSERT INTO `le_mobile_user_type` VALUES (2, '雇员', 'Employee', '雇员，拥有雇员权限', '2017-08-28 00:00:00', '2017-08-28 00:00:00', 0);
INSERT INTO `le_mobile_user_type` VALUES (3, '自由人', 'Professional', '自由人，拥有雇员和雇主所有权限', '2017-08-28 00:00:00', '2017-08-28 00:00:00', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_work_notification
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_work_notification`;
CREATE TABLE `le_mobile_work_notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `receUserId` bigint(20) NOT NULL DEFAULT '0' COMMENT '接收者ID',
  `sendUserId` bigint(20) NOT NULL DEFAULT '0' COMMENT '发送者ID',
  `msg` text COMMENT '消息内容',
  `action` text COMMENT '动作指令',
  `modifiedDateTime` timestamp NULL DEFAULT NULL COMMENT '消息内容',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) NOT NULL COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户类型表';

-- ----------------------------
-- Table structure for le_mobile_work_order
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_work_order`;
CREATE TABLE `le_mobile_work_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderNum` text COMMENT '订单编号',
  `orderWokerTypeId` int(11) DEFAULT NULL COMMENT '订单需求雇员类型ID',
  `orderWokerTypeName` text COMMENT '订单需求雇员类型名称',
  `workStartTime` timestamp NULL DEFAULT NULL COMMENT '订单工作开始时间',
  `workStopTime` timestamp NULL DEFAULT NULL COMMENT '订单工作结束时间',
  `workAddress` text COMMENT '订单工作地址',
  `workExperienceRequireType` int(11) DEFAULT NULL COMMENT '订单对工作经验要求',
  `workExperienceRequireTypeDesc` text COMMENT '订单对工作经验要求描述',
  `workRewardsId` bigint(20) DEFAULT NULL COMMENT '订单工作报酬记录',
  `workNeedEmplpyeeNums` int(11) DEFAULT NULL COMMENT '订单对雇员需求数量',
  `workDescription` text COMMENT '订单工作描述',
  `workEmployerId` bigint(20) DEFAULT NULL COMMENT '订单雇主ID',
  `workOrderPushType` int(11) DEFAULT '0' COMMENT '订单发布类型，默认0， 0-自投 1-紧急 2-被聘',
  `workOrderStatus` int(11) DEFAULT '0' COMMENT '订单进度状态，默认0， 0-未开工 1-开工中 2-已完工 -1-异常',
  `workRecruitStatus` int(11) DEFAULT '0' COMMENT '订单招聘状态，默认0， 0-招聘中 1-招聘完成',
  `areaCountryPkId` int(20) DEFAULT NULL,
  `areaProvincePkId` int(20) DEFAULT NULL,
  `areaCityPkId` int(20) DEFAULT NULL,
  `areaAreaAndCountyPkId` int(20) DEFAULT NULL,
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) DEFAULT NULL COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8 COMMENT='客户端用户表';

-- ----------------------------
-- Records of le_mobile_work_order
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_work_order` VALUES (229, 'HNN151653791976734F23F353FC74A1A98D529BB0B721857', 50, '普工', '2018-02-11 00:00:00', '2018-01-21 00:00:00', '四川省成都市武侯区天府二街希顿国际广场', 54, '1-3年工作经验', 140, 2, '广告安装工', 77, 1, 1, 0, 1, 2287, 2288, 2292, '2018-02-01 00:21:51', '2018-01-21 20:31:59', 0);
INSERT INTO `le_mobile_work_order` VALUES (230, 'HNN1516612875254AC46B4B4A0F74EE79AF8E45F82467285', 1, '电工', '2018-01-31 00:00:00', '2018-02-22 00:00:00', '四川省成都市锦江区可测', 53, '不限', 141, 23, '过敏名额', 74, 0, 0, 0, 1, 2287, 2288, 2289, '2018-01-31 13:37:34', '2018-01-22 17:21:15', 1);
INSERT INTO `le_mobile_work_order` VALUES (231, 'HNN151741556943410D504BA00B1411A984DFA970571FC96', 50, '普工', '2018-02-09 00:00:00', '2018-02-10 00:00:00', '四川省成都市武侯区天府大道666号成都希尔顿酒店', 54, '1-3年工作经验', 142, 5, '搭建舞台', 77, 1, 1, 0, 1, 2287, 2288, 2292, '2018-02-01 00:23:21', '2018-02-01 00:19:29', 0);
INSERT INTO `le_mobile_work_order` VALUES (232, 'HNN1517455492866E8498AA82C9B4FBE8E1808BA2BF76CDD', 1, '电工', '2018-02-01 00:00:00', '2018-03-09 00:00:00', '四川省成都市锦江区万西苑', 57, '10年以上工作经验', 143, 222, '五兔兔YY语音聊天记录了，，，，，！我是真的爱你么么哒老婆我爱你我爱你老婆我爱你么么哒！？！我也觉得自己真的没有啊你', 88, 1, 0, 0, 1, 2287, 2288, 2289, '2018-02-01 11:24:53', '2018-02-01 11:24:53', 0);
INSERT INTO `le_mobile_work_order` VALUES (233, 'HNN151745674724538751FC7FE5D4C19B987BFD5987C34C0', 1, '电工', '2018-02-01 00:00:00', '2018-02-14 00:00:00', '四川省成都市锦江区哦哦哦', 53, '不限', 144, 12, '来来来', 88, 1, 0, 0, 1, 2287, 2288, 2289, '2018-02-01 11:45:47', '2018-02-01 11:45:47', 0);
INSERT INTO `le_mobile_work_order` VALUES (234, 'HNN151749666092198FF2A908E844632B82147D04980E828', 3, '焊工', '2018-02-22 00:00:00', '2018-02-28 00:00:00', '四川省成都市高新区111', 54, '1-3年工作经验', 145, 1, '11212', 73, 1, 1, 1, 1, 2287, 2288, 3267, '2018-02-26 12:43:07', '2018-02-01 22:51:01', 0);
INSERT INTO `le_mobile_work_order` VALUES (235, 'HNN1517647785315B23C615277664F2A9CD87FA0331F1A4D', 2, '木工', '2018-02-28 00:00:00', '2018-03-31 00:00:00', '四川省成都市高新区百草路111号18楼', 57, '10年以上工作经验', 146, 1800, '搭架子', 88, 0, 1, 0, 1, 2287, 2288, 3267, '2018-02-03 16:50:25', '2018-02-03 16:49:45', 0);
INSERT INTO `le_mobile_work_order` VALUES (236, 'HNN1519620243730B0B699C6253E4DA7B2A74261495327FD', 1, '电工', '2018-02-26 00:00:00', '2018-03-31 00:00:00', '四川省成都市高新区公民', 53, '不限', 147, 11, '哈哈', 73, 2, 0, 0, 1, 2287, 2288, 3267, '2018-02-26 12:44:04', '2018-02-26 12:44:04', 0);
INSERT INTO `le_mobile_work_order` VALUES (237, 'HNN15198590076049F67B3BB533E4350B42E0B7AA9AFECAB', 50, '普工', '2018-03-02 00:00:00', '2018-03-23 00:00:00', '四川省成都市高新区噢噢噢哦哦', 53, '不限', 148, 2, '呃呃', 73, 2, 0, 0, 1, 2287, 2288, 3267, '2018-03-01 07:03:28', '2018-03-01 07:03:28', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_work_order_employees
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_work_order_employees`;
CREATE TABLE `le_mobile_work_order_employees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderId` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `workEmployerId` bigint(20) DEFAULT NULL COMMENT '订单雇主ID',
  `workEmployeeId` bigint(20) DEFAULT NULL COMMENT '订单雇员ID',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  `employerWorkConfirm` int(11) DEFAULT '0' COMMENT '雇主确定录用，1-已录用，0-未录用，-1-拒绝',
  `employeeWorkStart` int(11) DEFAULT '0' COMMENT '雇员上工签到开始工作，1-已签到，0-未签到，-1-拒绝',
  `employeeWorkEnd` int(11) DEFAULT '0' COMMENT '雇员下工签退工作结束，1-已结束，0-未结束',
  `employerPaidedWork` int(11) DEFAULT '0' COMMENT '雇主确定付款，1-已付款，0-未付款，-1-拒绝',
  `employeeWorkPaided` int(11) DEFAULT '0' COMMENT '雇员确定收款，1-已付款，0-未付款，-1-拒绝',
  `employeeEvaluateEnv` int(11) DEFAULT '0' COMMENT '雇员评价-环境，1-5共5个等级，默认0',
  `employeeEvaluateAward` int(11) DEFAULT '0' COMMENT '雇员评价-待遇，1-5共5个等级，默认0',
  `employeeEvaluateEmployer` int(11) DEFAULT '0' COMMENT '雇员评价-雇主，1-5共5个等级，默认0',
  `employeeEvaluatePaid` int(11) DEFAULT '0' COMMENT '雇员评价-付款体验，速度等，1-5共5个等级，默认0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8 COMMENT='客户端订单雇佣关系及状态处理表';

-- ----------------------------
-- Records of le_mobile_work_order_employees
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_work_order_employees` VALUES (267, 229, 77, 78, '2018-01-21 20:32:14', '2018-02-01 00:21:26', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (268, 230, 74, 85, '2018-01-22 17:21:24', '2018-01-22 17:22:11', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (269, 229, 77, 75, '2018-01-23 13:04:23', '2018-02-01 00:21:01', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (270, 229, 77, 55, '2018-01-23 13:56:32', '2018-02-01 18:41:19', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (271, 230, 74, 55, '2018-01-23 14:28:46', '2018-01-23 14:28:46', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (272, 231, 77, 78, '2018-02-01 00:20:13', '2018-02-01 00:34:50', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (273, 231, 77, 55, '2018-02-01 10:08:24', '2018-02-01 10:08:24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (274, 232, 88, 55, '2018-02-01 11:25:31', '2018-02-01 11:43:49', 0, 1, 1, 1, 1, 1, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (275, 232, 88, 75, '2018-02-01 11:26:12', '2018-02-01 11:26:12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (276, 233, 88, 55, '2018-02-01 11:46:15', '2018-02-01 11:46:32', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (277, 232, 88, 78, '2018-02-01 17:44:06', '2018-02-01 17:44:06', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (278, 234, 73, 55, '2018-02-01 22:51:37', '2018-02-01 22:57:33', 0, 1, 1, 1, 1, 1, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (279, 231, 77, 75, '2018-02-02 10:23:35', '2018-02-02 10:23:35', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (280, 235, 88, 55, '2018-02-03 16:50:00', '2018-02-03 16:52:02', 0, 1, 1, 1, 1, 1, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (281, 235, 88, 90, '2018-02-06 11:20:32', '2018-02-06 11:20:32', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (282, 234, 73, 90, '2018-02-09 04:48:06', '2018-02-26 12:42:40', 0, -1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (283, 229, 77, 90, '2018-02-10 09:51:11', '2018-02-10 09:51:11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (284, 236, 73, 90, '2018-02-26 12:44:04', '2018-02-26 12:44:17', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (285, 236, 73, 55, '2018-02-26 12:44:04', '2018-02-26 12:44:04', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (286, 236, 73, 85, '2018-02-26 12:44:04', '2018-02-26 12:44:04', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (287, 236, 73, 75, '2018-02-26 12:44:04', '2018-02-26 12:44:04', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (288, 236, 73, 83, '2018-02-26 12:44:04', '2018-02-26 12:44:04', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (289, 236, 73, 82, '2018-02-26 12:44:04', '2018-02-26 12:44:04', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (290, 236, 73, 79, '2018-02-26 12:44:04', '2018-02-26 12:44:04', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (291, 236, 73, 78, '2018-02-26 12:44:04', '2018-02-26 12:44:04', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (292, 236, 73, 81, '2018-02-26 12:44:04', '2018-02-26 12:44:04', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (293, 236, 73, 80, '2018-02-26 12:44:04', '2018-02-26 12:44:04', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (294, 236, 73, 76, '2018-02-26 12:44:04', '2018-02-26 12:44:04', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (295, 237, 73, 90, '2018-03-01 07:03:28', '2018-03-01 07:03:41', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `le_mobile_work_order_employees` VALUES (296, 237, 73, 55, '2018-03-01 07:03:28', '2018-03-01 07:03:28', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_work_order_experience_require_type
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_work_order_experience_require_type`;
CREATE TABLE `le_mobile_work_order_experience_require_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` text COMMENT '名称',
  `description` text COMMENT '描述',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) NOT NULL COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='订单中经验要求种类\n不限\n1-3年工作经验\n3-5年工作经验\n5-10年工作经验\n10年以上工作经验';

-- ----------------------------
-- Records of le_mobile_work_order_experience_require_type
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_work_order_experience_require_type` VALUES (53, 'type0', '不限', '2017-10-13 14:39:03', '2017-10-13 14:39:05', 0);
INSERT INTO `le_mobile_work_order_experience_require_type` VALUES (54, 'type1', '1-3年工作经验', '2017-10-13 14:39:46', '2017-10-13 14:39:48', 0);
INSERT INTO `le_mobile_work_order_experience_require_type` VALUES (55, 'type2', '3-5年工作经验', '2017-10-13 14:40:06', '2017-10-13 14:40:10', 0);
INSERT INTO `le_mobile_work_order_experience_require_type` VALUES (56, 'type3', '5-10年工作经验', '2017-10-13 14:40:29', '2017-10-13 14:40:31', 0);
INSERT INTO `le_mobile_work_order_experience_require_type` VALUES (57, 'type4', '10年以上工作经验', '2017-10-13 14:40:47', '2017-10-13 14:40:51', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_work_order_loves
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_work_order_loves`;
CREATE TABLE `le_mobile_work_order_loves` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderId` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `orderNum` text COMMENT '订单编号',
  `workEmployerId` bigint(20) DEFAULT NULL COMMENT '雇主ID',
  `workEmployeeId` bigint(20) DEFAULT NULL COMMENT '收藏者ID',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `isDeleted` int(11) DEFAULT NULL COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='客户端用户收藏的工作\n';

-- ----------------------------
-- Records of le_mobile_work_order_loves
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_work_order_loves` VALUES (1, 235, 'HNN1517647785315B23C615277664F2A9CD87FA0331F1A4D', 88, 90, '2018-02-09 04:47:55', '2018-02-09 04:47:55', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_work_order_punch_card
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_work_order_punch_card`;
CREATE TABLE `le_mobile_work_order_punch_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '打卡LOG主键',
  `orderNum` text COMMENT '订单编号',
  `orderId` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `punchDate` date DEFAULT NULL COMMENT '打卡日期',
  `workEmployerId` bigint(20) DEFAULT '0' COMMENT '订单雇主ID',
  `workEmployeeId` bigint(20) DEFAULT '0' COMMENT '订单雇员ID',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间/打卡时间',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='客户端用户表';

-- ----------------------------
-- Records of le_mobile_work_order_punch_card
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_work_order_punch_card` VALUES (1, 'HNN1517455492866E8498AA82C9B4FBE8E1808BA2BF76CDD', 232, '2018-02-01', 88, 55, '2018-02-01 11:39:22', '2018-02-01 11:39:22', 0);
INSERT INTO `le_mobile_work_order_punch_card` VALUES (2, 'HNN151745674724538751FC7FE5D4C19B987BFD5987C34C0', 233, '2018-02-01', 88, 55, '2018-02-01 11:46:39', '2018-02-01 11:46:39', 0);
INSERT INTO `le_mobile_work_order_punch_card` VALUES (3, 'HNN151745674724538751FC7FE5D4C19B987BFD5987C34C0', 233, '2018-02-02', 88, 55, '2018-02-02 13:43:13', '2018-02-02 13:43:13', 0);
INSERT INTO `le_mobile_work_order_punch_card` VALUES (4, 'HNN151745674724538751FC7FE5D4C19B987BFD5987C34C0', 233, '2018-02-03', 88, 55, '2018-02-03 08:59:55', '2018-02-03 08:59:55', 0);
INSERT INTO `le_mobile_work_order_punch_card` VALUES (5, 'HNN1519620243730B0B699C6253E4DA7B2A74261495327FD', 236, '2018-02-26', 73, 90, '2018-02-26 12:44:35', '2018-02-26 12:44:35', 0);
INSERT INTO `le_mobile_work_order_punch_card` VALUES (6, 'HNN1519620243730B0B699C6253E4DA7B2A74261495327FD', 236, '2018-03-01', 73, 90, '2018-03-01 07:04:10', '2018-03-01 07:04:10', 0);
INSERT INTO `le_mobile_work_order_punch_card` VALUES (7, 'HNN15198590076049F67B3BB533E4350B42E0B7AA9AFECAB', 237, '2018-03-15', 73, 90, '2018-03-15 07:40:29', '2018-03-15 07:40:29', 0);
INSERT INTO `le_mobile_work_order_punch_card` VALUES (8, 'HNN1519620243730B0B699C6253E4DA7B2A74261495327FD', 236, '2018-03-24', 73, 90, '2018-03-24 14:41:31', '2018-03-24 14:41:31', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_work_order_rewards
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_work_order_rewards`;
CREATE TABLE `le_mobile_work_order_rewards` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderId` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `orderNum` text COMMENT '订单编号',
  `workEmployerId` bigint(20) DEFAULT NULL COMMENT '订单雇主ID',
  `rewardMoney` double DEFAULT NULL COMMENT '名称',
  `rewardType` int(11) DEFAULT NULL COMMENT '默认0，0-每天，1-总价',
  `provideBoard` int(11) DEFAULT NULL COMMENT '包吃，默认0，0-false，1-true',
  `provideRoom` int(11) DEFAULT NULL COMMENT '包住，默认0，0-false，1-true',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间/打卡时间',
  `modifiedDateTime` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `isDeleted` int(11) DEFAULT NULL COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COMMENT='订单中福利待遇\n';

-- ----------------------------
-- Records of le_mobile_work_order_rewards
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_work_order_rewards` VALUES (140, 229, 'HNN151653791976734F23F353FC74A1A98D529BB0B721857', 77, 300, 0, 0, 0, '2018-01-21 20:31:59', '2018-01-21 20:31:59', 0);
INSERT INTO `le_mobile_work_order_rewards` VALUES (141, 230, 'HNN1516612875254AC46B4B4A0F74EE79AF8E45F82467285', 74, 123, 0, 1, 1, '2018-01-22 17:21:15', '2018-01-22 17:21:15', 0);
INSERT INTO `le_mobile_work_order_rewards` VALUES (142, 231, 'HNN151741556943410D504BA00B1411A984DFA970571FC96', 77, 300, 0, 0, 0, '2018-02-01 00:19:29', '2018-02-01 00:19:29', 0);
INSERT INTO `le_mobile_work_order_rewards` VALUES (143, 232, 'HNN1517455492866E8498AA82C9B4FBE8E1808BA2BF76CDD', 88, 2000, 1, 1, 1, '2018-02-01 11:24:53', '2018-02-01 11:24:53', 0);
INSERT INTO `le_mobile_work_order_rewards` VALUES (144, 233, 'HNN151745674724538751FC7FE5D4C19B987BFD5987C34C0', 88, 220, 0, 1, 0, '2018-02-01 11:45:47', '2018-02-01 11:45:47', 0);
INSERT INTO `le_mobile_work_order_rewards` VALUES (145, 234, 'HNN151749666092198FF2A908E844632B82147D04980E828', 73, 1111, 0, 1, 0, '2018-02-01 22:51:01', '2018-02-01 22:51:01', 0);
INSERT INTO `le_mobile_work_order_rewards` VALUES (146, 235, 'HNN1517647785315B23C615277664F2A9CD87FA0331F1A4D', 88, 888, 0, 1, 1, '2018-02-03 16:49:45', '2018-02-03 16:49:45', 0);
INSERT INTO `le_mobile_work_order_rewards` VALUES (147, 236, 'HNN1519620243730B0B699C6253E4DA7B2A74261495327FD', 73, 123, 0, 1, 1, '2018-02-26 12:44:04', '2018-02-26 12:44:04', 0);
INSERT INTO `le_mobile_work_order_rewards` VALUES (148, 237, 'HNN15198590076049F67B3BB533E4350B42E0B7AA9AFECAB', 73, 3333, 0, 1, 1, '2018-03-01 07:03:28', '2018-03-01 07:03:28', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_mobile_work_order_sort_type
-- ----------------------------
DROP TABLE IF EXISTS `le_mobile_work_order_sort_type`;
CREATE TABLE `le_mobile_work_order_sort_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` text COMMENT '名称',
  `description` text COMMENT '描述',
  `modifiedDateTime` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) NOT NULL COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='系统用户类型表';

-- ----------------------------
-- Records of le_mobile_work_order_sort_type
-- ----------------------------
BEGIN;
INSERT INTO `le_mobile_work_order_sort_type` VALUES (50, 'workStartTime', '开工时间', '2017-09-25 10:21:25', '2017-09-25 10:21:27', 0);
INSERT INTO `le_mobile_work_order_sort_type` VALUES (51, 'workNeedEmplpyeeNums', '用工数量', '2017-09-25 10:25:10', '2017-09-25 10:25:13', 0);
INSERT INTO `le_mobile_work_order_sort_type` VALUES (52, 'workAddress', '距我最近', '2017-09-25 10:27:18', '2017-09-25 10:27:21', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_sys_mobile_app_banar
-- ----------------------------
DROP TABLE IF EXISTS `le_sys_mobile_app_banar`;
CREATE TABLE `le_sys_mobile_app_banar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `appType` bigint(20) NOT NULL DEFAULT '0' COMMENT '默认0 0-雇员 1-雇主',
  `imageUrl` text NOT NULL COMMENT '图片链接URL',
  `adLinkUrl` text NOT NULL COMMENT '推广链接URL',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统用户类型表';

-- ----------------------------
-- Records of le_sys_mobile_app_banar
-- ----------------------------
BEGIN;
INSERT INTO `le_sys_mobile_app_banar` VALUES (1, 0, 'http://oz2x7bysv.bkt.clouddn.com/9A2D1D9EB6F7426DAF093EA05BA27C38.png', 'http://120.78.189.94/', '2018-01-31 13:16:16', '2018-01-02 15:59:51', 0);
INSERT INTO `le_sys_mobile_app_banar` VALUES (2, 0, 'http://oz2x7bysv.bkt.clouddn.com/A8144F4EBF4C4206B4A37DA21C1F2795.png', 'http://120.78.189.94/', '2018-01-26 20:51:57', '2018-01-02 16:00:22', 0);
INSERT INTO `le_sys_mobile_app_banar` VALUES (3, 0, 'http://oz2x7bysv.bkt.clouddn.com/829C320D6D9E40ADBDF6DF9BA069C6BF.png', 'http://120.78.189.94/', '2018-01-26 20:53:02', '2018-01-02 16:00:33', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_sys_region
-- ----------------------------
DROP TABLE IF EXISTS `le_sys_region`;
CREATE TABLE `le_sys_region` (
  `pkId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `regionName` varchar(50) NOT NULL COMMENT '区域名称',
  `level` int(11) NOT NULL COMMENT '级别',
  `parentId` int(11) NOT NULL COMMENT '父级RegionId',
  `cityCode` varchar(50) DEFAULT NULL COMMENT '城市编码',
  `adCode` varchar(50) DEFAULT NULL COMMENT '区域编码',
  `centerLng` double(18,8) NOT NULL COMMENT '中心经度',
  `centerLat` double(18,8) NOT NULL COMMENT '中心维度',
  `provinceId` int(11) DEFAULT NULL COMMENT '省Id',
  `provinceName` varchar(50) DEFAULT NULL COMMENT '省名称',
  `cityId` int(11) DEFAULT NULL COMMENT '市Id',
  `cityName` varchar(50) DEFAULT NULL COMMENT '市名称',
  `districtId` int(11) DEFAULT NULL COMMENT '区Id',
  `districtName` varchar(50) DEFAULT NULL COMMENT '区名称',
  `createBy` varchar(50) NOT NULL COMMENT '创建人',
  `modifyBy` varchar(50) NOT NULL COMMENT '最后修改人',
  `isActive` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否有效',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`pkId`)
) ENGINE=InnoDB AUTO_INCREMENT=3268 DEFAULT CHARSET=utf8 COMMENT='行政区域表';

-- ----------------------------
-- Records of le_sys_region
-- ----------------------------
BEGIN;
INSERT INTO `le_sys_region` VALUES (1, '中华人民共和国', 0, 0, NULL, '100000', 116.36832440, 39.91508500, NULL, NULL, NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:57:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2, '北京市', 1, 1, '010', '110000', 116.40528500, 39.90498900, 2, '北京市', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:57:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3, '北京市市辖区', 2, 2, '010', '110100', 116.40528500, 39.90498900, 2, '北京市', 3, '北京市市辖区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:57:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (4, '东城区', 3, 3, '010', '110101', 116.41875700, 39.91754400, 2, '北京市', 3, '北京市市辖区', 4, '东城区', 'system', 'system', b'1', '2017-04-18 01:57:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (5, '西城区', 3, 3, '010', '110102', 116.36679400, 39.91530900, 2, '北京市', 3, '北京市市辖区', 5, '西城区', 'system', 'system', b'1', '2017-04-18 01:57:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (6, '朝阳区', 3, 3, '010', '110105', 116.48640900, 39.92148900, 2, '北京市', 3, '北京市市辖区', 6, '朝阳区', 'system', 'system', b'1', '2017-04-18 01:58:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (7, '丰台区', 3, 3, '010', '110106', 116.28696800, 39.86364200, 2, '北京市', 3, '北京市市辖区', 7, '丰台区', 'system', 'system', b'1', '2017-04-18 01:58:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (8, '石景山区', 3, 3, '010', '110107', 116.19544500, 39.91460100, 2, '北京市', 3, '北京市市辖区', 8, '石景山区', 'system', 'system', b'1', '2017-04-18 01:58:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (9, '海淀区', 3, 3, '010', '110108', 116.31031600, 39.95607400, 2, '北京市', 3, '北京市市辖区', 9, '海淀区', 'system', 'system', b'1', '2017-04-18 01:58:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (10, '门头沟区', 3, 3, '010', '110109', 116.10538100, 39.93718300, 2, '北京市', 3, '北京市市辖区', 10, '门头沟区', 'system', 'system', b'1', '2017-04-18 01:58:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (11, '房山区', 3, 3, '010', '110111', 116.13915700, 39.73553500, 2, '北京市', 3, '北京市市辖区', 11, '房山区', 'system', 'system', b'1', '2017-04-18 01:58:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (12, '通州区', 3, 3, '010', '110112', 116.65860300, 39.90248600, 2, '北京市', 3, '北京市市辖区', 12, '通州区', 'system', 'system', b'1', '2017-04-18 01:58:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (13, '顺义区', 3, 3, '010', '110113', 116.65352500, 40.12893600, 2, '北京市', 3, '北京市市辖区', 13, '顺义区', 'system', 'system', b'1', '2017-04-18 01:58:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (14, '昌平区', 3, 3, '010', '110114', 116.23590600, 40.21808500, 2, '北京市', 3, '北京市市辖区', 14, '昌平区', 'system', 'system', b'1', '2017-04-18 01:58:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (15, '大兴区', 3, 3, '010', '110115', 116.33803300, 39.72890800, 2, '北京市', 3, '北京市市辖区', 15, '大兴区', 'system', 'system', b'1', '2017-04-18 01:58:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (16, '怀柔区', 3, 3, '010', '110116', 116.63712200, 40.32427200, 2, '北京市', 3, '北京市市辖区', 16, '怀柔区', 'system', 'system', b'1', '2017-04-18 01:58:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (17, '平谷区', 3, 3, '010', '110117', 117.11233500, 40.14478300, 2, '北京市', 3, '北京市市辖区', 17, '平谷区', 'system', 'system', b'1', '2017-04-18 01:58:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (18, '密云区', 3, 3, '010', '110118', 116.84335200, 40.37736200, 2, '北京市', 3, '北京市市辖区', 18, '密云区', 'system', 'system', b'1', '2017-04-18 01:58:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (19, '延庆区', 3, 3, '010', '110119', 115.98500600, 40.46532500, 2, '北京市', 3, '北京市市辖区', 19, '延庆区', 'system', 'system', b'1', '2017-04-18 01:58:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (20, '天津市', 1, 1, '022', '120000', 117.19018200, 39.12559600, 20, '天津市', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:58:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (21, '天津市市辖区', 2, 20, '022', '120100', 117.19018200, 39.12559600, 20, '天津市', 21, '天津市市辖区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:58:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (22, '和平区', 3, 21, '022', '120101', 117.19590700, 39.11832700, 20, '天津市', 21, '天津市市辖区', 22, '和平区', 'system', 'system', b'1', '2017-04-18 01:59:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (23, '河东区', 3, 21, '022', '120102', 117.22656800, 39.12212500, 20, '天津市', 21, '天津市市辖区', 23, '河东区', 'system', 'system', b'1', '2017-04-18 01:59:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (24, '河西区', 3, 21, '022', '120103', 117.21753600, 39.10189700, 20, '天津市', 21, '天津市市辖区', 24, '河西区', 'system', 'system', b'1', '2017-04-18 01:59:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (25, '南开区', 3, 21, '022', '120104', 117.16414300, 39.12047400, 20, '天津市', 21, '天津市市辖区', 25, '南开区', 'system', 'system', b'1', '2017-04-18 01:59:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (26, '河北区', 3, 21, '022', '120105', 117.20156900, 39.15663200, 20, '天津市', 21, '天津市市辖区', 26, '河北区', 'system', 'system', b'1', '2017-04-18 01:59:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (27, '红桥区', 3, 21, '022', '120106', 117.16330100, 39.17506600, 20, '天津市', 21, '天津市市辖区', 27, '红桥区', 'system', 'system', b'1', '2017-04-18 01:59:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (28, '东丽区', 3, 21, '022', '120110', 117.31396700, 39.08776400, 20, '天津市', 21, '天津市市辖区', 28, '东丽区', 'system', 'system', b'1', '2017-04-18 01:59:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (29, '西青区', 3, 21, '022', '120111', 117.01224700, 39.13944600, 20, '天津市', 21, '天津市市辖区', 29, '西青区', 'system', 'system', b'1', '2017-04-18 01:59:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (30, '津南区', 3, 21, '022', '120112', 117.38254900, 38.98957700, 20, '天津市', 21, '天津市市辖区', 30, '津南区', 'system', 'system', b'1', '2017-04-18 01:59:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (31, '北辰区', 3, 21, '022', '120113', 117.13482000, 39.22555500, 20, '天津市', 21, '天津市市辖区', 31, '北辰区', 'system', 'system', b'1', '2017-04-18 01:59:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (32, '武清区', 3, 21, '022', '120114', 117.05795900, 39.37692500, 20, '天津市', 21, '天津市市辖区', 32, '武清区', 'system', 'system', b'1', '2017-04-18 01:59:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (33, '宝坻区', 3, 21, '022', '120115', 117.30809400, 39.71696500, 20, '天津市', 21, '天津市市辖区', 33, '宝坻区', 'system', 'system', b'1', '2017-04-18 01:59:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (34, '滨海新区', 3, 21, '022', '120116', 117.65417300, 39.03284600, 20, '天津市', 21, '天津市市辖区', 34, '滨海新区', 'system', 'system', b'1', '2017-04-18 01:59:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (35, '宁河区', 3, 21, '022', '120117', 117.82828000, 39.32888600, 20, '天津市', 21, '天津市市辖区', 35, '宁河区', 'system', 'system', b'1', '2017-04-18 01:59:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (36, '静海区', 3, 21, '022', '120118', 116.92530400, 38.93567100, 20, '天津市', 21, '天津市市辖区', 36, '静海区', 'system', 'system', b'1', '2017-04-18 01:59:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (37, '蓟州区', 3, 21, '022', '120119', 117.40744900, 40.04534200, 20, '天津市', 21, '天津市市辖区', 37, '蓟州区', 'system', 'system', b'1', '2017-04-18 01:59:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (38, '河北省', 1, 1, NULL, '130000', 114.50246100, 38.04547400, 38, '河北省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:59:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (39, '石家庄市', 2, 38, '0311', '130100', 114.50246100, 38.04547400, 38, '河北省', 39, '石家庄市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:59:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (40, '长安区', 3, 39, '0311', '130102', 114.54815100, 38.04750100, 38, '河北省', 39, '石家庄市', 40, '长安区', 'system', 'system', b'1', '2017-04-18 01:59:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (41, '桥西区', 3, 39, '0311', '130104', 114.46293100, 38.02838300, 38, '河北省', 39, '石家庄市', 41, '桥西区', 'system', 'system', b'1', '2017-04-18 01:59:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (42, '新华区', 3, 39, '0311', '130105', 114.46597400, 38.06714200, 38, '河北省', 39, '石家庄市', 42, '新华区', 'system', 'system', b'1', '2017-04-18 01:59:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (43, '井陉矿区', 3, 39, '0311', '130107', 114.05817800, 38.06974800, 38, '河北省', 39, '石家庄市', 43, '井陉矿区', 'system', 'system', b'1', '2017-04-18 01:59:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (44, '裕华区', 3, 39, '0311', '130108', 114.53325700, 38.02769600, 38, '河北省', 39, '石家庄市', 44, '裕华区', 'system', 'system', b'1', '2017-04-18 01:59:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (45, '藁城区', 3, 39, '0311', '130109', 114.84964700, 38.03376700, 38, '河北省', 39, '石家庄市', 45, '藁城区', 'system', 'system', b'1', '2017-04-18 01:59:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (46, '鹿泉区', 3, 39, '0311', '130110', 114.32102300, 38.09399400, 38, '河北省', 39, '石家庄市', 46, '鹿泉区', 'system', 'system', b'1', '2017-04-18 01:59:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (47, '栾城区', 3, 39, '0311', '130111', 114.65428100, 37.88691100, 38, '河北省', 39, '石家庄市', 47, '栾城区', 'system', 'system', b'1', '2017-04-18 01:59:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (48, '井陉县', 3, 39, '0311', '130121', 114.14448800, 38.03361400, 38, '河北省', 39, '石家庄市', 48, '井陉县', 'system', 'system', b'1', '2017-04-18 01:59:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (49, '正定县', 3, 39, '0311', '130123', 114.56988700, 38.14783500, 38, '河北省', 39, '石家庄市', 49, '正定县', 'system', 'system', b'1', '2017-04-18 01:59:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (50, '行唐县', 3, 39, '0311', '130125', 114.55273400, 38.43742200, 38, '河北省', 39, '石家庄市', 50, '行唐县', 'system', 'system', b'1', '2017-04-18 01:59:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (51, '灵寿县', 3, 39, '0311', '130126', 114.37946000, 38.30654600, 38, '河北省', 39, '石家庄市', 51, '灵寿县', 'system', 'system', b'1', '2017-04-18 01:59:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (52, '高邑县', 3, 39, '0311', '130127', 114.61069900, 37.60571400, 38, '河北省', 39, '石家庄市', 52, '高邑县', 'system', 'system', b'1', '2017-04-18 01:59:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (53, '深泽县', 3, 39, '0311', '130128', 115.20020700, 38.18454000, 38, '河北省', 39, '石家庄市', 53, '深泽县', 'system', 'system', b'1', '2017-04-18 01:59:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (54, '赞皇县', 3, 39, '0311', '130129', 114.38775600, 37.66019900, 38, '河北省', 39, '石家庄市', 54, '赞皇县', 'system', 'system', b'1', '2017-04-18 01:59:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (55, '无极县', 3, 39, '0311', '130130', 114.97784500, 38.17637600, 38, '河北省', 39, '石家庄市', 55, '无极县', 'system', 'system', b'1', '2017-04-18 01:59:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (56, '平山县', 3, 39, '0311', '130131', 114.18414400, 38.25931100, 38, '河北省', 39, '石家庄市', 56, '平山县', 'system', 'system', b'1', '2017-04-18 01:59:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (57, '元氏县', 3, 39, '0311', '130132', 114.52618000, 37.76251400, 38, '河北省', 39, '石家庄市', 57, '元氏县', 'system', 'system', b'1', '2017-04-18 01:59:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (58, '赵县', 3, 39, '0311', '130133', 114.77536200, 37.75434100, 38, '河北省', 39, '石家庄市', 58, '赵县', 'system', 'system', b'1', '2017-04-18 01:59:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (59, '辛集市', 3, 39, '0311', '130181', 115.21745100, 37.92904000, 38, '河北省', 39, '石家庄市', 59, '辛集市', 'system', 'system', b'1', '2017-04-18 01:59:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (60, '晋州市', 3, 39, '0311', '130183', 115.04488600, 38.02747800, 38, '河北省', 39, '石家庄市', 60, '晋州市', 'system', 'system', b'1', '2017-04-18 01:59:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (61, '新乐市', 3, 39, '0311', '130184', 114.68578000, 38.34476800, 38, '河北省', 39, '石家庄市', 61, '新乐市', 'system', 'system', b'1', '2017-04-18 01:59:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (62, '唐山市', 2, 38, '0315', '130200', 118.17539300, 39.63511300, 38, '河北省', 62, '唐山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:59:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (63, '路南区', 3, 62, '0315', '130202', 118.21082100, 39.61516200, 38, '河北省', 62, '唐山市', 63, '路南区', 'system', 'system', b'1', '2017-04-18 01:59:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (64, '路北区', 3, 62, '0315', '130203', 118.17473600, 39.62853800, 38, '河北省', 62, '唐山市', 64, '路北区', 'system', 'system', b'1', '2017-04-18 01:59:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (65, '古冶区', 3, 62, '0315', '130204', 118.45429000, 39.71573600, 38, '河北省', 62, '唐山市', 65, '古冶区', 'system', 'system', b'1', '2017-04-18 01:59:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (66, '开平区', 3, 62, '0315', '130205', 118.26442500, 39.67617100, 38, '河北省', 62, '唐山市', 66, '开平区', 'system', 'system', b'1', '2017-04-18 01:59:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (67, '丰南区', 3, 62, '0315', '130207', 118.11079300, 39.56303000, 38, '河北省', 62, '唐山市', 67, '丰南区', 'system', 'system', b'1', '2017-04-18 01:59:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (68, '丰润区', 3, 62, '0315', '130208', 118.15577900, 39.83136300, 38, '河北省', 62, '唐山市', 68, '丰润区', 'system', 'system', b'1', '2017-04-18 01:59:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (69, '曹妃甸区', 3, 62, '0315', '130209', 118.44658500, 39.27827700, 38, '河北省', 62, '唐山市', 69, '曹妃甸区', 'system', 'system', b'1', '2017-04-18 01:59:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (70, '滦县', 3, 62, '0315', '130223', 118.69954700, 39.74485100, 38, '河北省', 62, '唐山市', 70, '滦县', 'system', 'system', b'1', '2017-04-18 01:59:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (71, '滦南县', 3, 62, '0315', '130224', 118.68155200, 39.50620100, 38, '河北省', 62, '唐山市', 71, '滦南县', 'system', 'system', b'1', '2017-04-18 01:59:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (72, '乐亭县', 3, 62, '0315', '130225', 118.90534100, 39.42813000, 38, '河北省', 62, '唐山市', 72, '乐亭县', 'system', 'system', b'1', '2017-04-18 01:59:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (73, '迁西县', 3, 62, '0315', '130227', 118.30513900, 40.14623800, 38, '河北省', 62, '唐山市', 73, '迁西县', 'system', 'system', b'1', '2017-04-18 01:59:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (74, '玉田县', 3, 62, '0315', '130229', 117.75366500, 39.88732300, 38, '河北省', 62, '唐山市', 74, '玉田县', 'system', 'system', b'1', '2017-04-18 01:59:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (75, '遵化市', 3, 62, '0315', '130281', 117.96587500, 40.18861600, 38, '河北省', 62, '唐山市', 75, '遵化市', 'system', 'system', b'1', '2017-04-18 01:59:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (76, '迁安市', 3, 62, '0315', '130283', 118.70193300, 40.01210800, 38, '河北省', 62, '唐山市', 76, '迁安市', 'system', 'system', b'1', '2017-04-18 01:59:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (77, '秦皇岛市', 2, 38, '0335', '130300', 119.58657900, 39.94253100, 38, '河北省', 77, '秦皇岛市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:59:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (78, '海港区', 3, 77, '0335', '130302', 119.59622400, 39.94345800, 38, '河北省', 77, '秦皇岛市', 78, '海港区', 'system', 'system', b'1', '2017-04-18 01:59:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (79, '山海关区', 3, 77, '0335', '130303', 119.75359100, 39.99802300, 38, '河北省', 77, '秦皇岛市', 79, '山海关区', 'system', 'system', b'1', '2017-04-18 01:59:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (80, '北戴河区', 3, 77, '0335', '130304', 119.48628600, 39.82512100, 38, '河北省', 77, '秦皇岛市', 80, '北戴河区', 'system', 'system', b'1', '2017-04-18 01:59:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (81, '青龙满族自治县', 3, 77, '0335', '130321', 118.95455500, 40.40602300, 38, '河北省', 77, '秦皇岛市', 81, '青龙满族自治县', 'system', 'system', b'1', '2017-04-18 01:59:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (82, '昌黎县', 3, 77, '0335', '130322', 119.16454100, 39.70972900, 38, '河北省', 77, '秦皇岛市', 82, '昌黎县', 'system', 'system', b'1', '2017-04-18 01:59:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (83, '抚宁区', 3, 77, '0335', '130306', 119.24065100, 39.88705300, 38, '河北省', 77, '秦皇岛市', 83, '抚宁区', 'system', 'system', b'1', '2017-04-18 01:59:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (84, '卢龙县', 3, 77, '0335', '130324', 118.88180900, 39.89163900, 38, '河北省', 77, '秦皇岛市', 84, '卢龙县', 'system', 'system', b'1', '2017-04-18 01:59:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (85, '邯郸市', 2, 38, '0310', '130400', 114.49068600, 36.61227300, 38, '河北省', 85, '邯郸市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:59:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (86, '邯山区', 3, 85, '0310', '130402', 114.48498900, 36.60319600, 38, '河北省', 85, '邯郸市', 86, '邯山区', 'system', 'system', b'1', '2017-04-18 01:59:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (87, '丛台区', 3, 85, '0310', '130403', 114.49470300, 36.61108200, 38, '河北省', 85, '邯郸市', 87, '丛台区', 'system', 'system', b'1', '2017-04-18 01:59:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (88, '复兴区', 3, 85, '0310', '130404', 114.45824200, 36.61548400, 38, '河北省', 85, '邯郸市', 88, '复兴区', 'system', 'system', b'1', '2017-04-18 01:59:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (89, '峰峰矿区', 3, 85, '0310', '130406', 114.20993600, 36.42048700, 38, '河北省', 85, '邯郸市', 89, '峰峰矿区', 'system', 'system', b'1', '2017-04-18 01:59:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (90, '临漳县', 3, 85, '0310', '130423', 114.61070300, 36.33760400, 38, '河北省', 85, '邯郸市', 90, '临漳县', 'system', 'system', b'1', '2017-04-18 01:59:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (91, '成安县', 3, 85, '0310', '130424', 114.68035600, 36.44383200, 38, '河北省', 85, '邯郸市', 91, '成安县', 'system', 'system', b'1', '2017-04-18 01:59:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (92, '大名县', 3, 85, '0310', '130425', 115.15258600, 36.28331600, 38, '河北省', 85, '邯郸市', 92, '大名县', 'system', 'system', b'1', '2017-04-18 01:59:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (93, '涉县', 3, 85, '0310', '130426', 113.67329700, 36.56314300, 38, '河北省', 85, '邯郸市', 93, '涉县', 'system', 'system', b'1', '2017-04-18 01:59:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (94, '磁县', 3, 85, '0310', '130427', 114.38208000, 36.36767300, 38, '河北省', 85, '邯郸市', 94, '磁县', 'system', 'system', b'1', '2017-04-18 01:59:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (95, '肥乡区', 3, 85, '0310', '130428', 114.80515400, 36.55577800, 38, '河北省', 85, '邯郸市', 95, '肥乡区', 'system', 'system', b'1', '2017-04-18 01:59:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (96, '永年区', 3, 85, '0310', '130429', 114.49616200, 36.77641300, 38, '河北省', 85, '邯郸市', 96, '永年区', 'system', 'system', b'1', '2017-04-18 01:59:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (97, '邱县', 3, 85, '0310', '130430', 115.16858400, 36.81325000, 38, '河北省', 85, '邯郸市', 97, '邱县', 'system', 'system', b'1', '2017-04-18 01:59:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (98, '鸡泽县', 3, 85, '0310', '130431', 114.87851700, 36.91490800, 38, '河北省', 85, '邯郸市', 98, '鸡泽县', 'system', 'system', b'1', '2017-04-18 01:59:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (99, '广平县', 3, 85, '0310', '130432', 114.95085900, 36.48360300, 38, '河北省', 85, '邯郸市', 99, '广平县', 'system', 'system', b'1', '2017-04-18 01:59:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (100, '馆陶县', 3, 85, '0310', '130433', 115.28905700, 36.53946100, 38, '河北省', 85, '邯郸市', 100, '馆陶县', 'system', 'system', b'1', '2017-04-18 01:59:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (101, '魏县', 3, 85, '0310', '130434', 114.93411000, 36.35424800, 38, '河北省', 85, '邯郸市', 101, '魏县', 'system', 'system', b'1', '2017-04-18 01:59:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (102, '曲周县', 3, 85, '0310', '130435', 114.95758800, 36.77339800, 38, '河北省', 85, '邯郸市', 102, '曲周县', 'system', 'system', b'1', '2017-04-18 01:59:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (103, '武安市', 3, 85, '0310', '130481', 114.19458100, 36.69611500, 38, '河北省', 85, '邯郸市', 103, '武安市', 'system', 'system', b'1', '2017-04-18 01:59:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (104, '邢台市', 2, 38, '0319', '130500', 114.50885100, 37.06820000, 38, '河北省', 104, '邢台市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:59:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (105, '桥东区', 3, 104, '0319', '130502', 114.50713100, 37.06412500, 38, '河北省', 104, '邢台市', 105, '桥东区', 'system', 'system', b'1', '2017-04-18 01:59:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (106, '桥西区', 3, 104, '0319', '130503', 114.47368700, 37.06800900, 38, '河北省', 104, '邢台市', 106, '桥西区', 'system', 'system', b'1', '2017-04-18 01:59:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (107, '邢台县', 3, 104, '0319', '130521', 114.56113200, 37.05073000, 38, '河北省', 104, '邢台市', 107, '邢台县', 'system', 'system', b'1', '2017-04-18 01:59:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (108, '临城县', 3, 104, '0319', '130522', 114.50687300, 37.44400900, 38, '河北省', 104, '邢台市', 108, '临城县', 'system', 'system', b'1', '2017-04-18 01:59:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (109, '内丘县', 3, 104, '0319', '130523', 114.51152300, 37.28766300, 38, '河北省', 104, '邢台市', 109, '内丘县', 'system', 'system', b'1', '2017-04-18 01:59:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (110, '柏乡县', 3, 104, '0319', '130524', 114.69338200, 37.48359600, 38, '河北省', 104, '邢台市', 110, '柏乡县', 'system', 'system', b'1', '2017-04-18 01:59:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (111, '隆尧县', 3, 104, '0319', '130525', 114.77634800, 37.35092500, 38, '河北省', 104, '邢台市', 111, '隆尧县', 'system', 'system', b'1', '2017-04-18 01:59:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (112, '任县', 3, 104, '0319', '130526', 114.68446900, 37.12995200, 38, '河北省', 104, '邢台市', 112, '任县', 'system', 'system', b'1', '2017-04-18 01:59:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (113, '南和县', 3, 104, '0319', '130527', 114.69137700, 37.00381200, 38, '河北省', 104, '邢台市', 113, '南和县', 'system', 'system', b'1', '2017-04-18 01:59:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (114, '宁晋县', 3, 104, '0319', '130528', 114.92102700, 37.61895600, 38, '河北省', 104, '邢台市', 114, '宁晋县', 'system', 'system', b'1', '2017-04-18 01:59:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (115, '巨鹿县', 3, 104, '0319', '130529', 115.03878200, 37.21768000, 38, '河北省', 104, '邢台市', 115, '巨鹿县', 'system', 'system', b'1', '2017-04-18 01:59:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (116, '新河县', 3, 104, '0319', '130530', 115.24753700, 37.52621600, 38, '河北省', 104, '邢台市', 116, '新河县', 'system', 'system', b'1', '2017-04-18 01:59:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (117, '广宗县', 3, 104, '0319', '130531', 115.14279700, 37.07554800, 38, '河北省', 104, '邢台市', 117, '广宗县', 'system', 'system', b'1', '2017-04-18 01:59:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (118, '平乡县', 3, 104, '0319', '130532', 115.02921800, 37.06940400, 38, '河北省', 104, '邢台市', 118, '平乡县', 'system', 'system', b'1', '2017-04-18 01:59:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (119, '威县', 3, 104, '0319', '130533', 115.27274900, 36.98327200, 38, '河北省', 104, '邢台市', 119, '威县', 'system', 'system', b'1', '2017-04-18 01:59:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (120, '清河县', 3, 104, '0319', '130534', 115.66899900, 37.05999100, 38, '河北省', 104, '邢台市', 120, '清河县', 'system', 'system', b'1', '2017-04-18 01:59:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (121, '临西县', 3, 104, '0319', '130535', 115.49868400, 36.86420000, 38, '河北省', 104, '邢台市', 121, '临西县', 'system', 'system', b'1', '2017-04-18 01:59:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (122, '南宫市', 3, 104, '0319', '130581', 115.39810200, 37.35966800, 38, '河北省', 104, '邢台市', 122, '南宫市', 'system', 'system', b'1', '2017-04-18 01:59:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (123, '沙河市', 3, 104, '0319', '130582', 114.50490200, 36.86190300, 38, '河北省', 104, '邢台市', 123, '沙河市', 'system', 'system', b'1', '2017-04-18 01:59:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (124, '保定市', 2, 38, '0312', '130600', 115.48233100, 38.86765700, 38, '河北省', 124, '保定市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:59:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (125, '竞秀区', 3, 124, '0312', '130602', 115.47065900, 38.88662000, 38, '河北省', 124, '保定市', 125, '竞秀区', 'system', 'system', b'1', '2017-04-18 01:59:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (126, '莲池区', 3, 124, '0312', '130606', 115.50093400, 38.86500500, 38, '河北省', 124, '保定市', 126, '莲池区', 'system', 'system', b'1', '2017-04-18 01:59:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (127, '满城区', 3, 124, '0312', '130607', 115.32442000, 38.95138000, 38, '河北省', 124, '保定市', 127, '满城区', 'system', 'system', b'1', '2017-04-18 01:59:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (128, '清苑区', 3, 124, '0312', '130608', 115.49222100, 38.77101200, 38, '河北省', 124, '保定市', 128, '清苑区', 'system', 'system', b'1', '2017-04-18 01:59:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (129, '涞水县', 3, 124, '0312', '130623', 115.71198500, 39.39314800, 38, '河北省', 124, '保定市', 129, '涞水县', 'system', 'system', b'1', '2017-04-18 01:59:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (130, '阜平县', 3, 124, '0312', '130624', 114.19880100, 38.84727600, 38, '河北省', 124, '保定市', 130, '阜平县', 'system', 'system', b'1', '2017-04-18 01:59:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (131, '徐水区', 3, 124, '0312', '130609', 115.64941000, 39.02039500, 38, '河北省', 124, '保定市', 131, '徐水区', 'system', 'system', b'1', '2017-04-18 01:59:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (132, '定兴县', 3, 124, '0312', '130626', 115.79689500, 39.26619500, 38, '河北省', 124, '保定市', 132, '定兴县', 'system', 'system', b'1', '2017-04-18 01:59:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (133, '唐县', 3, 124, '0312', '130627', 114.98124100, 38.74854200, 38, '河北省', 124, '保定市', 133, '唐县', 'system', 'system', b'1', '2017-04-18 01:59:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (134, '高阳县', 3, 124, '0312', '130628', 115.77887800, 38.69009200, 38, '河北省', 124, '保定市', 134, '高阳县', 'system', 'system', b'1', '2017-04-18 01:59:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (135, '容城县', 3, 124, '0312', '130629', 115.86624700, 39.05282000, 38, '河北省', 124, '保定市', 135, '容城县', 'system', 'system', b'1', '2017-04-18 01:59:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (136, '涞源县', 3, 124, '0312', '130630', 114.69256700, 39.35755000, 38, '河北省', 124, '保定市', 136, '涞源县', 'system', 'system', b'1', '2017-04-18 01:59:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (137, '望都县', 3, 124, '0312', '130631', 115.15400900, 38.70744800, 38, '河北省', 124, '保定市', 137, '望都县', 'system', 'system', b'1', '2017-04-18 01:59:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (138, '安新县', 3, 124, '0312', '130632', 115.93197900, 38.92991200, 38, '河北省', 124, '保定市', 138, '安新县', 'system', 'system', b'1', '2017-04-18 01:59:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (139, '易县', 3, 124, '0312', '130633', 115.50114600, 39.35297000, 38, '河北省', 124, '保定市', 139, '易县', 'system', 'system', b'1', '2017-04-18 01:59:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (140, '曲阳县', 3, 124, '0312', '130634', 114.70405500, 38.61999200, 38, '河北省', 124, '保定市', 140, '曲阳县', 'system', 'system', b'1', '2017-04-18 01:59:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (141, '蠡县', 3, 124, '0312', '130635', 115.58363100, 38.49642900, 38, '河北省', 124, '保定市', 141, '蠡县', 'system', 'system', b'1', '2017-04-18 01:59:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (142, '顺平县', 3, 124, '0312', '130636', 115.13274900, 38.84512700, 38, '河北省', 124, '保定市', 142, '顺平县', 'system', 'system', b'1', '2017-04-18 01:59:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (143, '博野县', 3, 124, '0312', '130637', 115.46179800, 38.45827100, 38, '河北省', 124, '保定市', 143, '博野县', 'system', 'system', b'1', '2017-04-18 01:59:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (144, '雄县', 3, 124, '0312', '130638', 116.10747400, 38.99081900, 38, '河北省', 124, '保定市', 144, '雄县', 'system', 'system', b'1', '2017-04-18 01:59:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (145, '涿州市', 3, 124, '0312', '130681', 115.97340900, 39.48576500, 38, '河北省', 124, '保定市', 145, '涿州市', 'system', 'system', b'1', '2017-04-18 01:59:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (146, '定州市', 3, 124, '0312', '130682', 114.99138900, 38.51760200, 38, '河北省', 124, '保定市', 146, '定州市', 'system', 'system', b'1', '2017-04-18 01:59:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (147, '安国市', 3, 124, '0312', '130683', 115.33141000, 38.42136700, 38, '河北省', 124, '保定市', 147, '安国市', 'system', 'system', b'1', '2017-04-18 01:59:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (148, '高碑店市', 3, 124, '0312', '130684', 115.88270400, 39.32768900, 38, '河北省', 124, '保定市', 148, '高碑店市', 'system', 'system', b'1', '2017-04-18 01:59:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (149, '张家口市', 2, 38, '0313', '130700', 114.88409100, 40.81190100, 38, '河北省', 149, '张家口市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:59:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (150, '桥东区', 3, 149, '0313', '130702', 114.88565800, 40.81387500, 38, '河北省', 149, '张家口市', 150, '桥东区', 'system', 'system', b'1', '2017-04-18 01:59:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (151, '桥西区', 3, 149, '0313', '130703', 114.88212700, 40.82438500, 38, '河北省', 149, '张家口市', 151, '桥西区', 'system', 'system', b'1', '2017-04-18 01:59:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (152, '宣化区', 3, 149, '0313', '130705', 115.06320000, 40.60936800, 38, '河北省', 149, '张家口市', 152, '宣化区', 'system', 'system', b'1', '2017-04-18 01:59:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (153, '下花园区', 3, 149, '0313', '130706', 115.28100200, 40.48864500, 38, '河北省', 149, '张家口市', 153, '下花园区', 'system', 'system', b'1', '2017-04-18 01:59:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (154, '张北县', 3, 149, '0313', '130722', 114.71595100, 41.15171300, 38, '河北省', 149, '张家口市', 154, '张北县', 'system', 'system', b'1', '2017-04-18 01:59:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (155, '康保县', 3, 149, '0313', '130723', 114.61580900, 41.85004600, 38, '河北省', 149, '张家口市', 155, '康保县', 'system', 'system', b'1', '2017-04-18 01:59:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (156, '沽源县', 3, 149, '0313', '130724', 115.68483600, 41.66741900, 38, '河北省', 149, '张家口市', 156, '沽源县', 'system', 'system', b'1', '2017-04-18 01:59:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (157, '尚义县', 3, 149, '0313', '130725', 113.97771300, 41.08009100, 38, '河北省', 149, '张家口市', 157, '尚义县', 'system', 'system', b'1', '2017-04-18 01:59:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (158, '蔚县', 3, 149, '0313', '130726', 114.58269500, 39.83718100, 38, '河北省', 149, '张家口市', 158, '蔚县', 'system', 'system', b'1', '2017-04-18 01:59:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (159, '阳原县', 3, 149, '0313', '130727', 114.16734300, 40.11341900, 38, '河北省', 149, '张家口市', 159, '阳原县', 'system', 'system', b'1', '2017-04-18 01:59:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (160, '怀安县', 3, 149, '0313', '130728', 114.42236400, 40.67127400, 38, '河北省', 149, '张家口市', 160, '怀安县', 'system', 'system', b'1', '2017-04-18 01:59:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (161, '万全区', 3, 149, '0313', '130708', 114.73613100, 40.76513600, 38, '河北省', 149, '张家口市', 161, '万全区', 'system', 'system', b'1', '2017-04-18 01:59:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (162, '怀来县', 3, 149, '0313', '130730', 115.52084600, 40.40540500, 38, '河北省', 149, '张家口市', 162, '怀来县', 'system', 'system', b'1', '2017-04-18 01:59:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (163, '涿鹿县', 3, 149, '0313', '130731', 115.21924600, 40.37870100, 38, '河北省', 149, '张家口市', 163, '涿鹿县', 'system', 'system', b'1', '2017-04-18 01:59:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (164, '赤城县', 3, 149, '0313', '130732', 115.83270800, 40.91208100, 38, '河北省', 149, '张家口市', 164, '赤城县', 'system', 'system', b'1', '2017-04-18 01:59:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (165, '崇礼区', 3, 149, '0313', '130709', 115.28165200, 40.97130200, 38, '河北省', 149, '张家口市', 165, '崇礼区', 'system', 'system', b'1', '2017-04-18 01:59:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (166, '承德市', 2, 38, '0314', '130800', 117.93915200, 40.97620400, 38, '河北省', 166, '承德市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:59:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (167, '双桥区', 3, 166, '0314', '130802', 117.93915200, 40.97620400, 38, '河北省', 166, '承德市', 167, '双桥区', 'system', 'system', b'1', '2017-04-18 01:59:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (168, '双滦区', 3, 166, '0314', '130803', 117.79748500, 40.95975600, 38, '河北省', 166, '承德市', 168, '双滦区', 'system', 'system', b'1', '2017-04-18 01:59:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (169, '鹰手营子矿区', 3, 166, '0314', '130804', 117.66115400, 40.54695600, 38, '河北省', 166, '承德市', 169, '鹰手营子矿区', 'system', 'system', b'1', '2017-04-18 01:59:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (170, '承德县', 3, 166, '0314', '130821', 118.17249600, 40.76863700, 38, '河北省', 166, '承德市', 170, '承德县', 'system', 'system', b'1', '2017-04-18 01:59:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (171, '兴隆县', 3, 166, '0314', '130822', 117.50709800, 40.41852500, 38, '河北省', 166, '承德市', 171, '兴隆县', 'system', 'system', b'1', '2017-04-18 01:59:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (172, '平泉县', 3, 166, '0314', '130823', 118.69023800, 41.00561000, 38, '河北省', 166, '承德市', 172, '平泉县', 'system', 'system', b'1', '2017-04-18 01:59:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (173, '滦平县', 3, 166, '0314', '130824', 117.33712400, 40.93664400, 38, '河北省', 166, '承德市', 173, '滦平县', 'system', 'system', b'1', '2017-04-18 01:59:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (174, '隆化县', 3, 166, '0314', '130825', 117.73634300, 41.31666700, 38, '河北省', 166, '承德市', 174, '隆化县', 'system', 'system', b'1', '2017-04-18 01:59:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (175, '丰宁满族自治县', 3, 166, '0314', '130826', 116.65121000, 41.20990300, 38, '河北省', 166, '承德市', 175, '丰宁满族自治县', 'system', 'system', b'1', '2017-04-18 01:59:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (176, '宽城满族自治县', 3, 166, '0314', '130827', 118.48864200, 40.60798100, 38, '河北省', 166, '承德市', 176, '宽城满族自治县', 'system', 'system', b'1', '2017-04-18 01:59:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (177, '围场满族蒙古族自治县', 3, 166, '0314', '130828', 117.76408600, 41.94940400, 38, '河北省', 166, '承德市', 177, '围场满族蒙古族自治县', 'system', 'system', b'1', '2017-04-18 01:59:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (178, '沧州市', 2, 38, '0317', '130900', 116.85746100, 38.31058200, 38, '河北省', 178, '沧州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 01:59:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (179, '新华区', 3, 178, '0317', '130902', 116.87304900, 38.30827300, 38, '河北省', 178, '沧州市', 179, '新华区', 'system', 'system', b'1', '2017-04-18 01:59:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (180, '运河区', 3, 178, '0317', '130903', 116.84006300, 38.30740500, 38, '河北省', 178, '沧州市', 180, '运河区', 'system', 'system', b'1', '2017-04-18 01:59:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (181, '沧县', 3, 178, '0317', '130921', 117.00747800, 38.21985600, 38, '河北省', 178, '沧州市', 181, '沧县', 'system', 'system', b'1', '2017-04-18 01:59:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (182, '青县', 3, 178, '0317', '130922', 116.83838400, 38.56964600, 38, '河北省', 178, '沧州市', 182, '青县', 'system', 'system', b'1', '2017-04-18 01:59:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (183, '东光县', 3, 178, '0317', '130923', 116.54206200, 37.88655000, 38, '河北省', 178, '沧州市', 183, '东光县', 'system', 'system', b'1', '2017-04-18 01:59:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (184, '海兴县', 3, 178, '0317', '130924', 117.49660600, 38.14158200, 38, '河北省', 178, '沧州市', 184, '海兴县', 'system', 'system', b'1', '2017-04-18 01:59:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (185, '盐山县', 3, 178, '0317', '130925', 117.22981400, 38.05614100, 38, '河北省', 178, '沧州市', 185, '盐山县', 'system', 'system', b'1', '2017-04-18 01:59:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (186, '肃宁县', 3, 178, '0317', '130926', 115.83585600, 38.42710200, 38, '河北省', 178, '沧州市', 186, '肃宁县', 'system', 'system', b'1', '2017-04-18 01:59:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (187, '南皮县', 3, 178, '0317', '130927', 116.70917100, 38.04243900, 38, '河北省', 178, '沧州市', 187, '南皮县', 'system', 'system', b'1', '2017-04-18 01:59:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (188, '吴桥县', 3, 178, '0317', '130928', 116.39151200, 37.62818200, 38, '河北省', 178, '沧州市', 188, '吴桥县', 'system', 'system', b'1', '2017-04-18 01:59:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (189, '献县', 3, 178, '0317', '130929', 116.12384400, 38.18966100, 38, '河北省', 178, '沧州市', 189, '献县', 'system', 'system', b'1', '2017-04-18 01:59:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (190, '孟村回族自治县', 3, 178, '0317', '130930', 117.10510400, 38.05795300, 38, '河北省', 178, '沧州市', 190, '孟村回族自治县', 'system', 'system', b'1', '2017-04-18 01:59:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (191, '泊头市', 3, 178, '0317', '130981', 116.57016300, 38.07347900, 38, '河北省', 178, '沧州市', 191, '泊头市', 'system', 'system', b'1', '2017-04-18 02:00:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (192, '任丘市', 3, 178, '0317', '130982', 116.10676400, 38.70651300, 38, '河北省', 178, '沧州市', 192, '任丘市', 'system', 'system', b'1', '2017-04-18 02:00:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (193, '黄骅市', 3, 178, '0317', '130983', 117.34380300, 38.36923800, 38, '河北省', 178, '沧州市', 193, '黄骅市', 'system', 'system', b'1', '2017-04-18 02:00:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (194, '河间市', 3, 178, '0317', '130984', 116.08945200, 38.44149000, 38, '河北省', 178, '沧州市', 194, '河间市', 'system', 'system', b'1', '2017-04-18 02:00:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (195, '廊坊市', 2, 38, '0316', '131000', 116.70444100, 39.52392700, 38, '河北省', 195, '廊坊市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:00:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (196, '安次区', 3, 195, '0316', '131002', 116.69454400, 39.50256900, 38, '河北省', 195, '廊坊市', 196, '安次区', 'system', 'system', b'1', '2017-04-18 02:00:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (197, '广阳区', 3, 195, '0316', '131003', 116.71370800, 39.52193100, 38, '河北省', 195, '廊坊市', 197, '广阳区', 'system', 'system', b'1', '2017-04-18 02:00:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (198, '固安县', 3, 195, '0316', '131022', 116.29989400, 39.43646800, 38, '河北省', 195, '廊坊市', 198, '固安县', 'system', 'system', b'1', '2017-04-18 02:00:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (199, '永清县', 3, 195, '0316', '131023', 116.49808900, 39.31971700, 38, '河北省', 195, '廊坊市', 199, '永清县', 'system', 'system', b'1', '2017-04-18 02:00:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (200, '香河县', 3, 195, '0316', '131024', 117.00716100, 39.75721200, 38, '河北省', 195, '廊坊市', 200, '香河县', 'system', 'system', b'1', '2017-04-18 02:00:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (201, '大城县', 3, 195, '0316', '131025', 116.64073500, 38.69921500, 38, '河北省', 195, '廊坊市', 201, '大城县', 'system', 'system', b'1', '2017-04-18 02:00:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (202, '文安县', 3, 195, '0316', '131026', 116.46010700, 38.86680100, 38, '河北省', 195, '廊坊市', 202, '文安县', 'system', 'system', b'1', '2017-04-18 02:00:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (203, '大厂回族自治县', 3, 195, '0316', '131028', 116.98650100, 39.88926600, 38, '河北省', 195, '廊坊市', 203, '大厂回族自治县', 'system', 'system', b'1', '2017-04-18 02:00:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (204, '霸州市', 3, 195, '0316', '131081', 116.39202100, 39.11733100, 38, '河北省', 195, '廊坊市', 204, '霸州市', 'system', 'system', b'1', '2017-04-18 02:00:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (205, '三河市', 3, 195, '0316', '131082', 117.07701800, 39.98277800, 38, '河北省', 195, '廊坊市', 205, '三河市', 'system', 'system', b'1', '2017-04-18 02:00:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (206, '衡水市', 2, 38, '0318', '131100', 115.66599300, 37.73509700, 38, '河北省', 206, '衡水市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:00:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (207, '桃城区', 3, 206, '0318', '131102', 115.69494500, 37.73223700, 38, '河北省', 206, '衡水市', 207, '桃城区', 'system', 'system', b'1', '2017-04-18 02:00:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (208, '枣强县', 3, 206, '0318', '131121', 115.72649900, 37.51151200, 38, '河北省', 206, '衡水市', 208, '枣强县', 'system', 'system', b'1', '2017-04-18 02:00:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (209, '武邑县', 3, 206, '0318', '131122', 115.89241500, 37.80377400, 38, '河北省', 206, '衡水市', 209, '武邑县', 'system', 'system', b'1', '2017-04-18 02:00:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (210, '武强县', 3, 206, '0318', '131123', 115.97023600, 38.03698000, 38, '河北省', 206, '衡水市', 210, '武强县', 'system', 'system', b'1', '2017-04-18 02:00:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (211, '饶阳县', 3, 206, '0318', '131124', 115.72657700, 38.23267100, 38, '河北省', 206, '衡水市', 211, '饶阳县', 'system', 'system', b'1', '2017-04-18 02:00:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (212, '安平县', 3, 206, '0318', '131125', 115.51962700, 38.23351100, 38, '河北省', 206, '衡水市', 212, '安平县', 'system', 'system', b'1', '2017-04-18 02:00:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (213, '故城县', 3, 206, '0318', '131126', 115.96674700, 37.35098100, 38, '河北省', 206, '衡水市', 213, '故城县', 'system', 'system', b'1', '2017-04-18 02:00:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (214, '景县', 3, 206, '0318', '131127', 116.25844600, 37.68662200, 38, '河北省', 206, '衡水市', 214, '景县', 'system', 'system', b'1', '2017-04-18 02:00:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (215, '阜城县', 3, 206, '0318', '131128', 116.16472700, 37.86994500, 38, '河北省', 206, '衡水市', 215, '阜城县', 'system', 'system', b'1', '2017-04-18 02:00:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (216, '冀州区', 3, 206, '0318', '131103', 115.57917300, 37.54278800, 38, '河北省', 206, '衡水市', 216, '冀州区', 'system', 'system', b'1', '2017-04-18 02:00:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (217, '深州市', 3, 206, '0318', '131182', 115.55459600, 38.00347000, 38, '河北省', 206, '衡水市', 217, '深州市', 'system', 'system', b'1', '2017-04-18 02:00:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (218, '山西省', 1, 1, NULL, '140000', 112.54924800, 37.85701400, 218, '山西省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (219, '太原市', 2, 218, '0351', '140100', 112.54924800, 37.85701400, 218, '山西省', 219, '太原市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (220, '小店区', 3, 219, '0351', '140105', 112.56427300, 37.81797400, 218, '山西省', 219, '太原市', 220, '小店区', 'system', 'system', b'1', '2017-04-18 02:01:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (221, '迎泽区', 3, 219, '0351', '140106', 112.55885100, 37.85580400, 218, '山西省', 219, '太原市', 221, '迎泽区', 'system', 'system', b'1', '2017-04-18 02:01:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (222, '杏花岭区', 3, 219, '0351', '140107', 112.56074300, 37.87929100, 218, '山西省', 219, '太原市', 222, '杏花岭区', 'system', 'system', b'1', '2017-04-18 02:01:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (223, '尖草坪区', 3, 219, '0351', '140108', 112.48712200, 37.93989300, 218, '山西省', 219, '太原市', 223, '尖草坪区', 'system', 'system', b'1', '2017-04-18 02:01:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (224, '万柏林区', 3, 219, '0351', '140109', 112.52225800, 37.86265300, 218, '山西省', 219, '太原市', 224, '万柏林区', 'system', 'system', b'1', '2017-04-18 02:01:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (225, '晋源区', 3, 219, '0351', '140110', 112.47784900, 37.71561900, 218, '山西省', 219, '太原市', 225, '晋源区', 'system', 'system', b'1', '2017-04-18 02:01:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (226, '清徐县', 3, 219, '0351', '140121', 112.35796100, 37.60729000, 218, '山西省', 219, '太原市', 226, '清徐县', 'system', 'system', b'1', '2017-04-18 02:01:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (227, '阳曲县', 3, 219, '0351', '140122', 112.67381800, 38.05879700, 218, '山西省', 219, '太原市', 227, '阳曲县', 'system', 'system', b'1', '2017-04-18 02:01:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (228, '娄烦县', 3, 219, '0351', '140123', 111.79379800, 38.06603500, 218, '山西省', 219, '太原市', 228, '娄烦县', 'system', 'system', b'1', '2017-04-18 02:01:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (229, '古交市', 3, 219, '0351', '140181', 112.17435300, 37.90853400, 218, '山西省', 219, '太原市', 229, '古交市', 'system', 'system', b'1', '2017-04-18 02:01:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (230, '大同市', 2, 218, '0352', '140200', 113.29525900, 40.09031000, 218, '山西省', 230, '大同市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (231, '城区', 3, 230, '0352', '140202', 113.30143800, 40.09051100, 218, '山西省', 230, '大同市', 231, '城区', 'system', 'system', b'1', '2017-04-18 02:01:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (232, '矿区', 3, 230, '0352', '140203', 113.16865600, 40.03626000, 218, '山西省', 230, '大同市', 232, '矿区', 'system', 'system', b'1', '2017-04-18 02:01:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (233, '南郊区', 3, 230, '0352', '140211', 113.16892000, 40.01802000, 218, '山西省', 230, '大同市', 233, '南郊区', 'system', 'system', b'1', '2017-04-18 02:01:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (234, '新荣区', 3, 230, '0352', '140212', 113.14104400, 40.25826900, 218, '山西省', 230, '大同市', 234, '新荣区', 'system', 'system', b'1', '2017-04-18 02:01:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (235, '阳高县', 3, 230, '0352', '140221', 113.74987100, 40.36492700, 218, '山西省', 230, '大同市', 235, '阳高县', 'system', 'system', b'1', '2017-04-18 02:01:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (236, '天镇县', 3, 230, '0352', '140222', 114.09112000, 40.42133600, 218, '山西省', 230, '大同市', 236, '天镇县', 'system', 'system', b'1', '2017-04-18 02:01:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (237, '广灵县', 3, 230, '0352', '140223', 114.27925200, 39.76305100, 218, '山西省', 230, '大同市', 237, '广灵县', 'system', 'system', b'1', '2017-04-18 02:01:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (238, '灵丘县', 3, 230, '0352', '140224', 114.23576000, 39.43886700, 218, '山西省', 230, '大同市', 238, '灵丘县', 'system', 'system', b'1', '2017-04-18 02:01:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (239, '浑源县', 3, 230, '0352', '140225', 113.69809100, 39.69909900, 218, '山西省', 230, '大同市', 239, '浑源县', 'system', 'system', b'1', '2017-04-18 02:01:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (240, '左云县', 3, 230, '0352', '140226', 112.70641000, 40.01287300, 218, '山西省', 230, '大同市', 240, '左云县', 'system', 'system', b'1', '2017-04-18 02:01:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (241, '大同县', 3, 230, '0352', '140227', 113.61130600, 40.03934500, 218, '山西省', 230, '大同市', 241, '大同县', 'system', 'system', b'1', '2017-04-18 02:01:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (242, '阳泉市', 2, 218, '0353', '140300', 113.58328500, 37.86118800, 218, '山西省', 242, '阳泉市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (243, '城区', 3, 242, '0353', '140302', 113.58651300, 37.86093800, 218, '山西省', 242, '阳泉市', 243, '城区', 'system', 'system', b'1', '2017-04-18 02:01:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (244, '矿区', 3, 242, '0353', '140303', 113.55906600, 37.87008500, 218, '山西省', 242, '阳泉市', 244, '矿区', 'system', 'system', b'1', '2017-04-18 02:01:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (245, '郊区', 3, 242, '0353', '140311', 113.58664000, 37.94096000, 218, '山西省', 242, '阳泉市', 245, '郊区', 'system', 'system', b'1', '2017-04-18 02:01:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (246, '平定县', 3, 242, '0353', '140321', 113.63104900, 37.80028900, 218, '山西省', 242, '阳泉市', 246, '平定县', 'system', 'system', b'1', '2017-04-18 02:01:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (247, '盂县', 3, 242, '0353', '140322', 113.41223000, 38.08613100, 218, '山西省', 242, '阳泉市', 247, '盂县', 'system', 'system', b'1', '2017-04-18 02:01:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (248, '长治市', 2, 218, '0355', '140400', 113.11355600, 36.19111200, 218, '山西省', 248, '长治市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (249, '城区', 3, 248, '0355', '140402', 113.11410700, 36.18789600, 218, '山西省', 248, '长治市', 249, '城区', 'system', 'system', b'1', '2017-04-18 02:01:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (250, '郊区', 3, 248, '0355', '140411', 113.10121100, 36.21838800, 218, '山西省', 248, '长治市', 250, '郊区', 'system', 'system', b'1', '2017-04-18 02:01:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (251, '长治县', 3, 248, '0355', '140421', 113.05667900, 36.05243800, 218, '山西省', 248, '长治市', 251, '长治县', 'system', 'system', b'1', '2017-04-18 02:01:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (252, '襄垣县', 3, 248, '0355', '140423', 113.05009400, 36.53285400, 218, '山西省', 248, '长治市', 252, '襄垣县', 'system', 'system', b'1', '2017-04-18 02:01:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (253, '屯留县', 3, 248, '0355', '140424', 112.89274100, 36.31407200, 218, '山西省', 248, '长治市', 253, '屯留县', 'system', 'system', b'1', '2017-04-18 02:01:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (254, '平顺县', 3, 248, '0355', '140425', 113.43879100, 36.20020200, 218, '山西省', 248, '长治市', 254, '平顺县', 'system', 'system', b'1', '2017-04-18 02:01:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (255, '黎城县', 3, 248, '0355', '140426', 113.38736600, 36.50297100, 218, '山西省', 248, '长治市', 255, '黎城县', 'system', 'system', b'1', '2017-04-18 02:01:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (256, '壶关县', 3, 248, '0355', '140427', 113.20613800, 36.11093800, 218, '山西省', 248, '长治市', 256, '壶关县', 'system', 'system', b'1', '2017-04-18 02:01:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (257, '长子县', 3, 248, '0355', '140428', 112.88465600, 36.11948400, 218, '山西省', 248, '长治市', 257, '长子县', 'system', 'system', b'1', '2017-04-18 02:01:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (258, '武乡县', 3, 248, '0355', '140429', 112.86530000, 36.83431500, 218, '山西省', 248, '长治市', 258, '武乡县', 'system', 'system', b'1', '2017-04-18 02:01:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (259, '沁县', 3, 248, '0355', '140430', 112.70138000, 36.75712300, 218, '山西省', 248, '长治市', 259, '沁县', 'system', 'system', b'1', '2017-04-18 02:01:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (260, '沁源县', 3, 248, '0355', '140431', 112.34087800, 36.50077700, 218, '山西省', 248, '长治市', 260, '沁源县', 'system', 'system', b'1', '2017-04-18 02:01:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (261, '潞城市', 3, 248, '0355', '140481', 113.22324500, 36.33223300, 218, '山西省', 248, '长治市', 261, '潞城市', 'system', 'system', b'1', '2017-04-18 02:01:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (262, '晋城市', 2, 218, '0356', '140500', 112.85127400, 35.49755300, 218, '山西省', 262, '晋城市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (263, '城区', 3, 262, '0356', '140502', 112.85310600, 35.49664100, 218, '山西省', 262, '晋城市', 263, '城区', 'system', 'system', b'1', '2017-04-18 02:01:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (264, '沁水县', 3, 262, '0356', '140521', 112.18721300, 35.68947200, 218, '山西省', 262, '晋城市', 264, '沁水县', 'system', 'system', b'1', '2017-04-18 02:01:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (265, '阳城县', 3, 262, '0356', '140522', 112.42201400, 35.48217700, 218, '山西省', 262, '晋城市', 265, '阳城县', 'system', 'system', b'1', '2017-04-18 02:01:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (266, '陵川县', 3, 262, '0356', '140524', 113.27887700, 35.77561400, 218, '山西省', 262, '晋城市', 266, '陵川县', 'system', 'system', b'1', '2017-04-18 02:01:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (267, '泽州县', 3, 262, '0356', '140525', 112.89913700, 35.61722100, 218, '山西省', 262, '晋城市', 267, '泽州县', 'system', 'system', b'1', '2017-04-18 02:01:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (268, '高平市', 3, 262, '0356', '140581', 112.93069100, 35.79135500, 218, '山西省', 262, '晋城市', 268, '高平市', 'system', 'system', b'1', '2017-04-18 02:01:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (269, '朔州市', 2, 218, '0349', '140600', 112.43338700, 39.33126100, 218, '山西省', 269, '朔州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (270, '朔城区', 3, 269, '0349', '140602', 112.42867600, 39.32452500, 218, '山西省', 269, '朔州市', 270, '朔城区', 'system', 'system', b'1', '2017-04-18 02:01:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (271, '平鲁区', 3, 269, '0349', '140603', 112.29522700, 39.51560300, 218, '山西省', 269, '朔州市', 271, '平鲁区', 'system', 'system', b'1', '2017-04-18 02:01:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (272, '山阴县', 3, 269, '0349', '140621', 112.81639600, 39.52677000, 218, '山西省', 269, '朔州市', 272, '山阴县', 'system', 'system', b'1', '2017-04-18 02:01:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (273, '应县', 3, 269, '0349', '140622', 113.18750500, 39.55918700, 218, '山西省', 269, '朔州市', 273, '应县', 'system', 'system', b'1', '2017-04-18 02:01:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (274, '右玉县', 3, 269, '0349', '140623', 112.46558800, 39.98881200, 218, '山西省', 269, '朔州市', 274, '右玉县', 'system', 'system', b'1', '2017-04-18 02:01:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (275, '怀仁县', 3, 269, '0349', '140624', 113.10051200, 39.82079000, 218, '山西省', 269, '朔州市', 275, '怀仁县', 'system', 'system', b'1', '2017-04-18 02:01:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (276, '晋中市', 2, 218, '0354', '140700', 112.73646500, 37.69649500, 218, '山西省', 276, '晋中市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (277, '榆次区', 3, 276, '0354', '140702', 112.74005600, 37.69760000, 218, '山西省', 276, '晋中市', 277, '榆次区', 'system', 'system', b'1', '2017-04-18 02:01:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (278, '榆社县', 3, 276, '0354', '140721', 112.97352100, 37.06901900, 218, '山西省', 276, '晋中市', 278, '榆社县', 'system', 'system', b'1', '2017-04-18 02:01:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (279, '左权县', 3, 276, '0354', '140722', 113.37783400, 37.07967200, 218, '山西省', 276, '晋中市', 279, '左权县', 'system', 'system', b'1', '2017-04-18 02:01:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (280, '和顺县', 3, 276, '0354', '140723', 113.57291900, 37.32702700, 218, '山西省', 276, '晋中市', 280, '和顺县', 'system', 'system', b'1', '2017-04-18 02:01:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (281, '昔阳县', 3, 276, '0354', '140724', 113.70616600, 37.60437000, 218, '山西省', 276, '晋中市', 281, '昔阳县', 'system', 'system', b'1', '2017-04-18 02:01:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (282, '寿阳县', 3, 276, '0354', '140725', 113.17770800, 37.89113600, 218, '山西省', 276, '晋中市', 282, '寿阳县', 'system', 'system', b'1', '2017-04-18 02:01:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (283, '太谷县', 3, 276, '0354', '140726', 112.55410300, 37.42459500, 218, '山西省', 276, '晋中市', 283, '太谷县', 'system', 'system', b'1', '2017-04-18 02:01:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (284, '祁县', 3, 276, '0354', '140727', 112.33053200, 37.35873900, 218, '山西省', 276, '晋中市', 284, '祁县', 'system', 'system', b'1', '2017-04-18 02:01:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (285, '平遥县', 3, 276, '0354', '140728', 112.17405900, 37.19547400, 218, '山西省', 276, '晋中市', 285, '平遥县', 'system', 'system', b'1', '2017-04-18 02:01:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (286, '灵石县', 3, 276, '0354', '140729', 111.77275900, 36.84746900, 218, '山西省', 276, '晋中市', 286, '灵石县', 'system', 'system', b'1', '2017-04-18 02:01:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (287, '介休市', 3, 276, '0354', '140781', 111.91385700, 37.02761600, 218, '山西省', 276, '晋中市', 287, '介休市', 'system', 'system', b'1', '2017-04-18 02:01:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (288, '运城市', 2, 218, '0359', '140800', 111.00395700, 35.02277800, 218, '山西省', 288, '运城市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (289, '盐湖区', 3, 288, '0359', '140802', 111.00062700, 35.02564300, 218, '山西省', 288, '运城市', 289, '盐湖区', 'system', 'system', b'1', '2017-04-18 02:01:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (290, '临猗县', 3, 288, '0359', '140821', 110.77493000, 35.14188300, 218, '山西省', 288, '运城市', 290, '临猗县', 'system', 'system', b'1', '2017-04-18 02:01:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (291, '万荣县', 3, 288, '0359', '140822', 110.84356100, 35.41704200, 218, '山西省', 288, '运城市', 291, '万荣县', 'system', 'system', b'1', '2017-04-18 02:01:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (292, '闻喜县', 3, 288, '0359', '140823', 111.22030600, 35.35383900, 218, '山西省', 288, '运城市', 292, '闻喜县', 'system', 'system', b'1', '2017-04-18 02:01:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (293, '稷山县', 3, 288, '0359', '140824', 110.97899600, 35.60041200, 218, '山西省', 288, '运城市', 293, '稷山县', 'system', 'system', b'1', '2017-04-18 02:01:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (294, '新绛县', 3, 288, '0359', '140825', 111.22520500, 35.61369700, 218, '山西省', 288, '运城市', 294, '新绛县', 'system', 'system', b'1', '2017-04-18 02:01:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (295, '绛县', 3, 288, '0359', '140826', 111.57618200, 35.49045000, 218, '山西省', 288, '运城市', 295, '绛县', 'system', 'system', b'1', '2017-04-18 02:01:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (296, '垣曲县', 3, 288, '0359', '140827', 111.67099000, 35.29829300, 218, '山西省', 288, '运城市', 296, '垣曲县', 'system', 'system', b'1', '2017-04-18 02:01:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (297, '夏县', 3, 288, '0359', '140828', 111.22317400, 35.14044100, 218, '山西省', 288, '运城市', 297, '夏县', 'system', 'system', b'1', '2017-04-18 02:01:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (298, '平陆县', 3, 288, '0359', '140829', 111.21237700, 34.83725600, 218, '山西省', 288, '运城市', 298, '平陆县', 'system', 'system', b'1', '2017-04-18 02:01:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (299, '芮城县', 3, 288, '0359', '140830', 110.69114000, 34.69476900, 218, '山西省', 288, '运城市', 299, '芮城县', 'system', 'system', b'1', '2017-04-18 02:01:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (300, '永济市', 3, 288, '0359', '140881', 110.44798400, 34.86512500, 218, '山西省', 288, '运城市', 300, '永济市', 'system', 'system', b'1', '2017-04-18 02:01:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (301, '河津市', 3, 288, '0359', '140882', 110.71026800, 35.59715000, 218, '山西省', 288, '运城市', 301, '河津市', 'system', 'system', b'1', '2017-04-18 02:01:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (302, '忻州市', 2, 218, '0350', '140900', 112.73353800, 38.41769000, 218, '山西省', 302, '忻州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (303, '忻府区', 3, 302, '0350', '140902', 112.73411200, 38.41774300, 218, '山西省', 302, '忻州市', 303, '忻府区', 'system', 'system', b'1', '2017-04-18 02:01:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (304, '定襄县', 3, 302, '0350', '140921', 112.96323100, 38.48494800, 218, '山西省', 302, '忻州市', 304, '定襄县', 'system', 'system', b'1', '2017-04-18 02:01:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (305, '五台县', 3, 302, '0350', '140922', 113.25901200, 38.72571100, 218, '山西省', 302, '忻州市', 305, '五台县', 'system', 'system', b'1', '2017-04-18 02:01:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (306, '代县', 3, 302, '0350', '140923', 112.96251900, 39.06513800, 218, '山西省', 302, '忻州市', 306, '代县', 'system', 'system', b'1', '2017-04-18 02:01:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (307, '繁峙县', 3, 302, '0350', '140924', 113.26770700, 39.18810400, 218, '山西省', 302, '忻州市', 307, '繁峙县', 'system', 'system', b'1', '2017-04-18 02:01:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (308, '宁武县', 3, 302, '0350', '140925', 112.30793600, 39.00171800, 218, '山西省', 302, '忻州市', 308, '宁武县', 'system', 'system', b'1', '2017-04-18 02:01:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (309, '静乐县', 3, 302, '0350', '140926', 111.94023100, 38.35594700, 218, '山西省', 302, '忻州市', 309, '静乐县', 'system', 'system', b'1', '2017-04-18 02:01:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (310, '神池县', 3, 302, '0350', '140927', 112.20043800, 39.08846700, 218, '山西省', 302, '忻州市', 310, '神池县', 'system', 'system', b'1', '2017-04-18 02:01:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (311, '五寨县', 3, 302, '0350', '140928', 111.84101500, 38.91276100, 218, '山西省', 302, '忻州市', 311, '五寨县', 'system', 'system', b'1', '2017-04-18 02:01:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (312, '岢岚县', 3, 302, '0350', '140929', 111.56981000, 38.70562500, 218, '山西省', 302, '忻州市', 312, '岢岚县', 'system', 'system', b'1', '2017-04-18 02:01:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (313, '河曲县', 3, 302, '0350', '140930', 111.14660900, 39.38189500, 218, '山西省', 302, '忻州市', 313, '河曲县', 'system', 'system', b'1', '2017-04-18 02:01:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (314, '保德县', 3, 302, '0350', '140931', 111.08568800, 39.02257600, 218, '山西省', 302, '忻州市', 314, '保德县', 'system', 'system', b'1', '2017-04-18 02:01:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (315, '偏关县', 3, 302, '0350', '140932', 111.50047700, 39.44215300, 218, '山西省', 302, '忻州市', 315, '偏关县', 'system', 'system', b'1', '2017-04-18 02:01:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (316, '原平市', 3, 302, '0350', '140981', 112.71313200, 38.72918600, 218, '山西省', 302, '忻州市', 316, '原平市', 'system', 'system', b'1', '2017-04-18 02:01:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (317, '临汾市', 2, 218, '0357', '141000', 111.51797300, 36.08415000, 218, '山西省', 317, '临汾市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (318, '尧都区', 3, 317, '0357', '141002', 111.52294500, 36.08036600, 218, '山西省', 317, '临汾市', 318, '尧都区', 'system', 'system', b'1', '2017-04-18 02:01:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (319, '曲沃县', 3, 317, '0357', '141021', 111.47552900, 35.64138700, 218, '山西省', 317, '临汾市', 319, '曲沃县', 'system', 'system', b'1', '2017-04-18 02:01:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (320, '翼城县', 3, 317, '0357', '141022', 111.71350800, 35.73862100, 218, '山西省', 317, '临汾市', 320, '翼城县', 'system', 'system', b'1', '2017-04-18 02:01:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (321, '襄汾县', 3, 317, '0357', '141023', 111.44293200, 35.87613900, 218, '山西省', 317, '临汾市', 321, '襄汾县', 'system', 'system', b'1', '2017-04-18 02:01:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (322, '洪洞县', 3, 317, '0357', '141024', 111.67369200, 36.25574200, 218, '山西省', 317, '临汾市', 322, '洪洞县', 'system', 'system', b'1', '2017-04-18 02:01:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (323, '古县', 3, 317, '0357', '141025', 111.92020700, 36.26855000, 218, '山西省', 317, '临汾市', 323, '古县', 'system', 'system', b'1', '2017-04-18 02:01:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (324, '安泽县', 3, 317, '0357', '141026', 112.25137200, 36.14603200, 218, '山西省', 317, '临汾市', 324, '安泽县', 'system', 'system', b'1', '2017-04-18 02:01:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (325, '浮山县', 3, 317, '0357', '141027', 111.85003900, 35.97135900, 218, '山西省', 317, '临汾市', 325, '浮山县', 'system', 'system', b'1', '2017-04-18 02:01:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (326, '吉县', 3, 317, '0357', '141028', 110.68285300, 36.09935500, 218, '山西省', 317, '临汾市', 326, '吉县', 'system', 'system', b'1', '2017-04-18 02:01:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (327, '乡宁县', 3, 317, '0357', '141029', 110.85736500, 35.97540200, 218, '山西省', 317, '临汾市', 327, '乡宁县', 'system', 'system', b'1', '2017-04-18 02:01:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (328, '大宁县', 3, 317, '0357', '141030', 110.75128300, 36.46383000, 218, '山西省', 317, '临汾市', 328, '大宁县', 'system', 'system', b'1', '2017-04-18 02:01:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (329, '隰县', 3, 317, '0357', '141031', 110.93580900, 36.69267500, 218, '山西省', 317, '临汾市', 329, '隰县', 'system', 'system', b'1', '2017-04-18 02:01:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (330, '永和县', 3, 317, '0357', '141032', 110.63127600, 36.76061400, 218, '山西省', 317, '临汾市', 330, '永和县', 'system', 'system', b'1', '2017-04-18 02:01:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (331, '蒲县', 3, 317, '0357', '141033', 111.09733000, 36.41168200, 218, '山西省', 317, '临汾市', 331, '蒲县', 'system', 'system', b'1', '2017-04-18 02:01:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (332, '汾西县', 3, 317, '0357', '141034', 111.56302100, 36.65336800, 218, '山西省', 317, '临汾市', 332, '汾西县', 'system', 'system', b'1', '2017-04-18 02:01:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (333, '侯马市', 3, 317, '0357', '141081', 111.37127200, 35.62030200, 218, '山西省', 317, '临汾市', 333, '侯马市', 'system', 'system', b'1', '2017-04-18 02:01:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (334, '霍州市', 3, 317, '0357', '141082', 111.72310300, 36.57202000, 218, '山西省', 317, '临汾市', 334, '霍州市', 'system', 'system', b'1', '2017-04-18 02:01:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (335, '吕梁市', 2, 218, '0358', '141100', 111.13433500, 37.52436600, 218, '山西省', 335, '吕梁市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (336, '离石区', 3, 335, '0358', '141102', 111.13446200, 37.52403700, 218, '山西省', 335, '吕梁市', 336, '离石区', 'system', 'system', b'1', '2017-04-18 02:01:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (337, '文水县', 3, 335, '0358', '141121', 112.03259500, 37.43631400, 218, '山西省', 335, '吕梁市', 337, '文水县', 'system', 'system', b'1', '2017-04-18 02:01:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (338, '交城县', 3, 335, '0358', '141122', 112.15915400, 37.55515500, 218, '山西省', 335, '吕梁市', 338, '交城县', 'system', 'system', b'1', '2017-04-18 02:01:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (339, '兴县', 3, 335, '0358', '141123', 111.12481600, 38.46413600, 218, '山西省', 335, '吕梁市', 339, '兴县', 'system', 'system', b'1', '2017-04-18 02:01:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (340, '临县', 3, 335, '0358', '141124', 110.99596300, 37.96080600, 218, '山西省', 335, '吕梁市', 340, '临县', 'system', 'system', b'1', '2017-04-18 02:01:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (341, '柳林县', 3, 335, '0358', '141125', 110.89613000, 37.43166400, 218, '山西省', 335, '吕梁市', 341, '柳林县', 'system', 'system', b'1', '2017-04-18 02:01:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (342, '石楼县', 3, 335, '0358', '141126', 110.83711900, 36.99942600, 218, '山西省', 335, '吕梁市', 342, '石楼县', 'system', 'system', b'1', '2017-04-18 02:01:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (343, '岚县', 3, 335, '0358', '141127', 111.67155500, 38.27865400, 218, '山西省', 335, '吕梁市', 343, '岚县', 'system', 'system', b'1', '2017-04-18 02:01:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (344, '方山县', 3, 335, '0358', '141128', 111.23888500, 37.89263200, 218, '山西省', 335, '吕梁市', 344, '方山县', 'system', 'system', b'1', '2017-04-18 02:01:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (345, '中阳县', 3, 335, '0358', '141129', 111.19331900, 37.34205400, 218, '山西省', 335, '吕梁市', 345, '中阳县', 'system', 'system', b'1', '2017-04-18 02:01:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (346, '交口县', 3, 335, '0358', '141130', 111.18318800, 36.98306800, 218, '山西省', 335, '吕梁市', 346, '交口县', 'system', 'system', b'1', '2017-04-18 02:01:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (347, '孝义市', 3, 335, '0358', '141181', 111.78156800, 37.14447400, 218, '山西省', 335, '吕梁市', 347, '孝义市', 'system', 'system', b'1', '2017-04-18 02:01:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (348, '汾阳市', 3, 335, '0358', '141182', 111.78527300, 37.26774200, 218, '山西省', 335, '吕梁市', 348, '汾阳市', 'system', 'system', b'1', '2017-04-18 02:01:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (349, '内蒙古自治区', 1, 1, NULL, '150000', 111.67080100, 40.81831100, 349, '内蒙古自治区', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (350, '呼和浩特市', 2, 349, '0471', '150100', 111.67080100, 40.81831100, 349, '内蒙古自治区', 350, '呼和浩特市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (351, '新城区', 3, 350, '0471', '150102', 111.68596400, 40.82622500, 349, '内蒙古自治区', 350, '呼和浩特市', 351, '新城区', 'system', 'system', b'1', '2017-04-18 02:01:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (352, '回民区', 3, 350, '0471', '150103', 111.66216200, 40.81514900, 349, '内蒙古自治区', 350, '呼和浩特市', 352, '回民区', 'system', 'system', b'1', '2017-04-18 02:01:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (353, '玉泉区', 3, 350, '0471', '150104', 111.66543000, 40.79942100, 349, '内蒙古自治区', 350, '呼和浩特市', 353, '玉泉区', 'system', 'system', b'1', '2017-04-18 02:01:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (354, '赛罕区', 3, 350, '0471', '150105', 111.69846300, 40.80783400, 349, '内蒙古自治区', 350, '呼和浩特市', 354, '赛罕区', 'system', 'system', b'1', '2017-04-18 02:01:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (355, '土默特左旗', 3, 350, '0471', '150121', 111.13361500, 40.72041600, 349, '内蒙古自治区', 350, '呼和浩特市', 355, '土默特左旗', 'system', 'system', b'1', '2017-04-18 02:01:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (356, '托克托县', 3, 350, '0471', '150122', 111.19731700, 40.27672900, 349, '内蒙古自治区', 350, '呼和浩特市', 356, '托克托县', 'system', 'system', b'1', '2017-04-18 02:01:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (357, '和林格尔县', 3, 350, '0471', '150123', 111.82414300, 40.38028800, 349, '内蒙古自治区', 350, '呼和浩特市', 357, '和林格尔县', 'system', 'system', b'1', '2017-04-18 02:01:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (358, '清水河县', 3, 350, '0471', '150124', 111.67222000, 39.91247900, 349, '内蒙古自治区', 350, '呼和浩特市', 358, '清水河县', 'system', 'system', b'1', '2017-04-18 02:01:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (359, '武川县', 3, 350, '0471', '150125', 111.45656300, 41.09448300, 349, '内蒙古自治区', 350, '呼和浩特市', 359, '武川县', 'system', 'system', b'1', '2017-04-18 02:01:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (360, '包头市', 2, 349, '0472', '150200', 109.84040500, 40.65816800, 349, '内蒙古自治区', 360, '包头市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (361, '东河区', 3, 360, '0472', '150202', 110.02689500, 40.58705600, 349, '内蒙古自治区', 360, '包头市', 361, '东河区', 'system', 'system', b'1', '2017-04-18 02:01:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (362, '昆都仑区', 3, 360, '0472', '150203', 109.82293200, 40.66134500, 349, '内蒙古自治区', 360, '包头市', 362, '昆都仑区', 'system', 'system', b'1', '2017-04-18 02:01:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (363, '青山区', 3, 360, '0472', '150204', 109.88004900, 40.66855800, 349, '内蒙古自治区', 360, '包头市', 363, '青山区', 'system', 'system', b'1', '2017-04-18 02:01:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (364, '石拐区', 3, 360, '0472', '150205', 110.27256500, 40.67209400, 349, '内蒙古自治区', 360, '包头市', 364, '石拐区', 'system', 'system', b'1', '2017-04-18 02:01:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (365, '白云鄂博矿区', 3, 360, '0472', '150206', 109.97016000, 41.76924600, 349, '内蒙古自治区', 360, '包头市', 365, '白云鄂博矿区', 'system', 'system', b'1', '2017-04-18 02:01:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (366, '九原区', 3, 360, '0472', '150207', 109.96812200, 40.60058100, 349, '内蒙古自治区', 360, '包头市', 366, '九原区', 'system', 'system', b'1', '2017-04-18 02:01:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (367, '土默特右旗', 3, 360, '0472', '150221', 110.52676600, 40.56643400, 349, '内蒙古自治区', 360, '包头市', 367, '土默特右旗', 'system', 'system', b'1', '2017-04-18 02:01:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (368, '固阳县', 3, 360, '0472', '150222', 110.06342100, 41.03000400, 349, '内蒙古自治区', 360, '包头市', 368, '固阳县', 'system', 'system', b'1', '2017-04-18 02:01:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (369, '达尔罕茂明安联合旗', 3, 360, '0472', '150223', 110.43845200, 41.70283600, 349, '内蒙古自治区', 360, '包头市', 369, '达尔罕茂明安联合旗', 'system', 'system', b'1', '2017-04-18 02:01:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (370, '乌海市', 2, 349, '0473', '150300', 106.82556300, 39.67373400, 349, '内蒙古自治区', 370, '乌海市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (371, '海勃湾区', 3, 370, '0473', '150302', 106.81776200, 39.67352700, 349, '内蒙古自治区', 370, '乌海市', 371, '海勃湾区', 'system', 'system', b'1', '2017-04-18 02:01:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (372, '海南区', 3, 370, '0473', '150303', 106.88478900, 39.44153000, 349, '内蒙古自治区', 370, '乌海市', 372, '海南区', 'system', 'system', b'1', '2017-04-18 02:01:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (373, '乌达区', 3, 370, '0473', '150304', 106.72271100, 39.50228800, 349, '内蒙古自治区', 370, '乌海市', 373, '乌达区', 'system', 'system', b'1', '2017-04-18 02:01:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (374, '赤峰市', 2, 349, '0476', '150400', 118.95680600, 42.27531700, 349, '内蒙古自治区', 374, '赤峰市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (375, '红山区', 3, 374, '0476', '150402', 118.96108700, 42.26973200, 349, '内蒙古自治区', 374, '赤峰市', 375, '红山区', 'system', 'system', b'1', '2017-04-18 02:01:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (376, '元宝山区', 3, 374, '0476', '150403', 119.28987700, 42.04116800, 349, '内蒙古自治区', 374, '赤峰市', 376, '元宝山区', 'system', 'system', b'1', '2017-04-18 02:01:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (377, '松山区', 3, 374, '0476', '150404', 118.93895800, 42.28104600, 349, '内蒙古自治区', 374, '赤峰市', 377, '松山区', 'system', 'system', b'1', '2017-04-18 02:01:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (378, '阿鲁科尔沁旗', 3, 374, '0476', '150421', 120.09496900, 43.87877000, 349, '内蒙古自治区', 374, '赤峰市', 378, '阿鲁科尔沁旗', 'system', 'system', b'1', '2017-04-18 02:01:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (379, '巴林左旗', 3, 374, '0476', '150422', 119.39173700, 43.98071500, 349, '内蒙古自治区', 374, '赤峰市', 379, '巴林左旗', 'system', 'system', b'1', '2017-04-18 02:01:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (380, '巴林右旗', 3, 374, '0476', '150423', 118.67834700, 43.52896300, 349, '内蒙古自治区', 374, '赤峰市', 380, '巴林右旗', 'system', 'system', b'1', '2017-04-18 02:01:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (381, '林西县', 3, 374, '0476', '150424', 118.05775000, 43.60532600, 349, '内蒙古自治区', 374, '赤峰市', 381, '林西县', 'system', 'system', b'1', '2017-04-18 02:01:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (382, '克什克腾旗', 3, 374, '0476', '150425', 117.54246500, 43.25623300, 349, '内蒙古自治区', 374, '赤峰市', 382, '克什克腾旗', 'system', 'system', b'1', '2017-04-18 02:01:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (383, '翁牛特旗', 3, 374, '0476', '150426', 119.02261900, 42.93712800, 349, '内蒙古自治区', 374, '赤峰市', 383, '翁牛特旗', 'system', 'system', b'1', '2017-04-18 02:01:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (384, '喀喇沁旗', 3, 374, '0476', '150428', 118.70857200, 41.92778000, 349, '内蒙古自治区', 374, '赤峰市', 384, '喀喇沁旗', 'system', 'system', b'1', '2017-04-18 02:01:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (385, '宁城县', 3, 374, '0476', '150429', 119.33924200, 41.59869200, 349, '内蒙古自治区', 374, '赤峰市', 385, '宁城县', 'system', 'system', b'1', '2017-04-18 02:01:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (386, '敖汉旗', 3, 374, '0476', '150430', 119.90648600, 42.28701200, 349, '内蒙古自治区', 374, '赤峰市', 386, '敖汉旗', 'system', 'system', b'1', '2017-04-18 02:01:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (387, '通辽市', 2, 349, '0475', '150500', 122.26311900, 43.61742900, 349, '内蒙古自治区', 387, '通辽市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (388, '科尔沁区', 3, 387, '0475', '150502', 122.26404200, 43.61742200, 349, '内蒙古自治区', 387, '通辽市', 388, '科尔沁区', 'system', 'system', b'1', '2017-04-18 02:01:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (389, '科尔沁左翼中旗', 3, 387, '0475', '150521', 123.31387300, 44.12716600, 349, '内蒙古自治区', 387, '通辽市', 389, '科尔沁左翼中旗', 'system', 'system', b'1', '2017-04-18 02:01:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (390, '科尔沁左翼后旗', 3, 387, '0475', '150522', 122.35515500, 42.95456400, 349, '内蒙古自治区', 387, '通辽市', 390, '科尔沁左翼后旗', 'system', 'system', b'1', '2017-04-18 02:01:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (391, '开鲁县', 3, 387, '0475', '150523', 121.30879700, 43.60243200, 349, '内蒙古自治区', 387, '通辽市', 391, '开鲁县', 'system', 'system', b'1', '2017-04-18 02:01:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (392, '库伦旗', 3, 387, '0475', '150524', 121.77488600, 42.73469200, 349, '内蒙古自治区', 387, '通辽市', 392, '库伦旗', 'system', 'system', b'1', '2017-04-18 02:01:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (393, '奈曼旗', 3, 387, '0475', '150525', 120.66254300, 42.84685000, 349, '内蒙古自治区', 387, '通辽市', 393, '奈曼旗', 'system', 'system', b'1', '2017-04-18 02:01:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (394, '扎鲁特旗', 3, 387, '0475', '150526', 120.90527500, 44.55529400, 349, '内蒙古自治区', 387, '通辽市', 394, '扎鲁特旗', 'system', 'system', b'1', '2017-04-18 02:01:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (395, '霍林郭勒市', 3, 387, '0475', '150581', 119.65786200, 45.53236100, 349, '内蒙古自治区', 387, '通辽市', 395, '霍林郭勒市', 'system', 'system', b'1', '2017-04-18 02:01:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (396, '鄂尔多斯市', 2, 349, '0477', '150600', 109.99029000, 39.81717900, 349, '内蒙古自治区', 396, '鄂尔多斯市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (397, '东胜区', 3, 396, '0477', '150602', 109.98945000, 39.81788000, 349, '内蒙古自治区', 396, '鄂尔多斯市', 397, '东胜区', 'system', 'system', b'1', '2017-04-18 02:01:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (398, '康巴什区', 3, 396, '0477', '150603', 109.79007600, 39.60747200, 349, '内蒙古自治区', 396, '鄂尔多斯市', 398, '康巴什区', 'system', 'system', b'1', '2017-04-18 02:01:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (399, '达拉特旗', 3, 396, '0477', '150621', 110.04028100, 40.40407600, 349, '内蒙古自治区', 396, '鄂尔多斯市', 399, '达拉特旗', 'system', 'system', b'1', '2017-04-18 02:01:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (400, '准格尔旗', 3, 396, '0477', '150622', 111.23833200, 39.86522100, 349, '内蒙古自治区', 396, '鄂尔多斯市', 400, '准格尔旗', 'system', 'system', b'1', '2017-04-18 02:01:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (401, '鄂托克前旗', 3, 396, '0477', '150623', 107.48172000, 38.18325700, 349, '内蒙古自治区', 396, '鄂尔多斯市', 401, '鄂托克前旗', 'system', 'system', b'1', '2017-04-18 02:01:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (402, '鄂托克旗', 3, 396, '0477', '150624', 107.98260400, 39.09575200, 349, '内蒙古自治区', 396, '鄂尔多斯市', 402, '鄂托克旗', 'system', 'system', b'1', '2017-04-18 02:01:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (403, '杭锦旗', 3, 396, '0477', '150625', 108.73632400, 39.83178900, 349, '内蒙古自治区', 396, '鄂尔多斯市', 403, '杭锦旗', 'system', 'system', b'1', '2017-04-18 02:01:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (404, '乌审旗', 3, 396, '0477', '150626', 108.84245400, 38.59661100, 349, '内蒙古自治区', 396, '鄂尔多斯市', 404, '乌审旗', 'system', 'system', b'1', '2017-04-18 02:01:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (405, '伊金霍洛旗', 3, 396, '0477', '150627', 109.78740200, 39.60431200, 349, '内蒙古自治区', 396, '鄂尔多斯市', 405, '伊金霍洛旗', 'system', 'system', b'1', '2017-04-18 02:01:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (406, '呼伦贝尔市', 2, 349, '0470', '150700', 119.75816800, 49.21533300, 349, '内蒙古自治区', 406, '呼伦贝尔市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (407, '海拉尔区', 3, 406, '0470', '150702', 119.76492300, 49.21388900, 349, '内蒙古自治区', 406, '呼伦贝尔市', 407, '海拉尔区', 'system', 'system', b'1', '2017-04-18 02:01:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (408, '扎赉诺尔区', 3, 406, '0470', '150703', 117.71637300, 49.45656700, 349, '内蒙古自治区', 406, '呼伦贝尔市', 408, '扎赉诺尔区', 'system', 'system', b'1', '2017-04-18 02:01:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (409, '阿荣旗', 3, 406, '0470', '150721', 123.46461500, 48.13050300, 349, '内蒙古自治区', 406, '呼伦贝尔市', 409, '阿荣旗', 'system', 'system', b'1', '2017-04-18 02:01:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (410, '莫力达瓦达斡尔族自治旗', 3, 406, '0470', '150722', 124.50740100, 48.47838500, 349, '内蒙古自治区', 406, '呼伦贝尔市', 410, '莫力达瓦达斡尔族自治旗', 'system', 'system', b'1', '2017-04-18 02:01:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (411, '鄂伦春自治旗', 3, 406, '0470', '150723', 123.72568400, 50.59017700, 349, '内蒙古自治区', 406, '呼伦贝尔市', 411, '鄂伦春自治旗', 'system', 'system', b'1', '2017-04-18 02:01:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (412, '鄂温克族自治旗', 3, 406, '0470', '150724', 119.75404100, 49.14329300, 349, '内蒙古自治区', 406, '呼伦贝尔市', 412, '鄂温克族自治旗', 'system', 'system', b'1', '2017-04-18 02:01:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (413, '陈巴尔虎旗', 3, 406, '0470', '150725', 119.43760900, 49.32842200, 349, '内蒙古自治区', 406, '呼伦贝尔市', 413, '陈巴尔虎旗', 'system', 'system', b'1', '2017-04-18 02:01:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (414, '新巴尔虎左旗', 3, 406, '0470', '150726', 118.26745400, 48.21657100, 349, '内蒙古自治区', 406, '呼伦贝尔市', 414, '新巴尔虎左旗', 'system', 'system', b'1', '2017-04-18 02:01:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (415, '新巴尔虎右旗', 3, 406, '0470', '150727', 116.82599100, 48.66913400, 349, '内蒙古自治区', 406, '呼伦贝尔市', 415, '新巴尔虎右旗', 'system', 'system', b'1', '2017-04-18 02:01:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (416, '满洲里市', 3, 406, '0470', '150781', 117.45556100, 49.59078800, 349, '内蒙古自治区', 406, '呼伦贝尔市', 416, '满洲里市', 'system', 'system', b'1', '2017-04-18 02:01:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (417, '牙克石市', 3, 406, '0470', '150782', 120.72900500, 49.28702400, 349, '内蒙古自治区', 406, '呼伦贝尔市', 417, '牙克石市', 'system', 'system', b'1', '2017-04-18 02:01:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (418, '扎兰屯市', 3, 406, '0470', '150783', 122.74440100, 48.00741200, 349, '内蒙古自治区', 406, '呼伦贝尔市', 418, '扎兰屯市', 'system', 'system', b'1', '2017-04-18 02:01:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (419, '额尔古纳市', 3, 406, '0470', '150784', 120.17863600, 50.24390000, 349, '内蒙古自治区', 406, '呼伦贝尔市', 419, '额尔古纳市', 'system', 'system', b'1', '2017-04-18 02:01:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (420, '根河市', 3, 406, '0470', '150785', 121.53272400, 50.78045400, 349, '内蒙古自治区', 406, '呼伦贝尔市', 420, '根河市', 'system', 'system', b'1', '2017-04-18 02:01:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (421, '巴彦淖尔市', 2, 349, '0478', '150800', 107.41695900, 40.75740200, 349, '内蒙古自治区', 421, '巴彦淖尔市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (422, '临河区', 3, 421, '0478', '150802', 107.41701800, 40.75709200, 349, '内蒙古自治区', 421, '巴彦淖尔市', 422, '临河区', 'system', 'system', b'1', '2017-04-18 02:01:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (423, '五原县', 3, 421, '0478', '150821', 108.27065800, 41.09763900, 349, '内蒙古自治区', 421, '巴彦淖尔市', 423, '五原县', 'system', 'system', b'1', '2017-04-18 02:01:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (424, '磴口县', 3, 421, '0478', '150822', 107.00605600, 40.33047900, 349, '内蒙古自治区', 421, '巴彦淖尔市', 424, '磴口县', 'system', 'system', b'1', '2017-04-18 02:01:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (425, '乌拉特前旗', 3, 421, '0478', '150823', 108.65681600, 40.72520900, 349, '内蒙古自治区', 421, '巴彦淖尔市', 425, '乌拉特前旗', 'system', 'system', b'1', '2017-04-18 02:01:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (426, '乌拉特中旗', 3, 421, '0478', '150824', 108.51525500, 41.57254000, 349, '内蒙古自治区', 421, '巴彦淖尔市', 426, '乌拉特中旗', 'system', 'system', b'1', '2017-04-18 02:01:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (427, '乌拉特后旗', 3, 421, '0478', '150825', 107.07494100, 41.08430700, 349, '内蒙古自治区', 421, '巴彦淖尔市', 427, '乌拉特后旗', 'system', 'system', b'1', '2017-04-18 02:01:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (428, '杭锦后旗', 3, 421, '0478', '150826', 107.14768200, 40.88879700, 349, '内蒙古自治区', 421, '巴彦淖尔市', 428, '杭锦后旗', 'system', 'system', b'1', '2017-04-18 02:01:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (429, '乌兰察布市', 2, 349, '0474', '150900', 113.11454300, 41.03412600, 349, '内蒙古自治区', 429, '乌兰察布市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (430, '集宁区', 3, 429, '0474', '150902', 113.11645300, 41.03413400, 349, '内蒙古自治区', 429, '乌兰察布市', 430, '集宁区', 'system', 'system', b'1', '2017-04-18 02:01:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (431, '卓资县', 3, 429, '0474', '150921', 112.57770200, 40.89576000, 349, '内蒙古自治区', 429, '乌兰察布市', 431, '卓资县', 'system', 'system', b'1', '2017-04-18 02:01:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (432, '化德县', 3, 429, '0474', '150922', 114.01008000, 41.89933500, 349, '内蒙古自治区', 429, '乌兰察布市', 432, '化德县', 'system', 'system', b'1', '2017-04-18 02:01:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (433, '商都县', 3, 429, '0474', '150923', 113.56064300, 41.56016300, 349, '内蒙古自治区', 429, '乌兰察布市', 433, '商都县', 'system', 'system', b'1', '2017-04-18 02:01:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (434, '兴和县', 3, 429, '0474', '150924', 113.83400900, 40.87243700, 349, '内蒙古自治区', 429, '乌兰察布市', 434, '兴和县', 'system', 'system', b'1', '2017-04-18 02:01:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (435, '凉城县', 3, 429, '0474', '150925', 112.50091100, 40.53162700, 349, '内蒙古自治区', 429, '乌兰察布市', 435, '凉城县', 'system', 'system', b'1', '2017-04-18 02:01:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (436, '察哈尔右翼前旗', 3, 429, '0474', '150926', 113.21195800, 40.78685900, 349, '内蒙古自治区', 429, '乌兰察布市', 436, '察哈尔右翼前旗', 'system', 'system', b'1', '2017-04-18 02:01:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (437, '察哈尔右翼中旗', 3, 429, '0474', '150927', 112.63356300, 41.27421200, 349, '内蒙古自治区', 429, '乌兰察布市', 437, '察哈尔右翼中旗', 'system', 'system', b'1', '2017-04-18 02:01:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (438, '察哈尔右翼后旗', 3, 429, '0474', '150928', 113.19060000, 41.44721300, 349, '内蒙古自治区', 429, '乌兰察布市', 438, '察哈尔右翼后旗', 'system', 'system', b'1', '2017-04-18 02:01:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (439, '四子王旗', 3, 429, '0474', '150929', 111.70123000, 41.52811400, 349, '内蒙古自治区', 429, '乌兰察布市', 439, '四子王旗', 'system', 'system', b'1', '2017-04-18 02:01:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (440, '丰镇市', 3, 429, '0474', '150981', 113.16346200, 40.43753400, 349, '内蒙古自治区', 429, '乌兰察布市', 440, '丰镇市', 'system', 'system', b'1', '2017-04-18 02:01:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (441, '兴安盟', 2, 349, '0482', '152200', 122.07031700, 46.07626800, 349, '内蒙古自治区', 441, '兴安盟', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (442, '乌兰浩特市', 3, 441, '0482', '152201', 122.06897500, 46.07723800, 349, '内蒙古自治区', 441, '兴安盟', 442, '乌兰浩特市', 'system', 'system', b'1', '2017-04-18 02:01:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (443, '阿尔山市', 3, 441, '0482', '152202', 119.94365600, 47.17700000, 349, '内蒙古自治区', 441, '兴安盟', 443, '阿尔山市', 'system', 'system', b'1', '2017-04-18 02:01:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (444, '科尔沁右翼前旗', 3, 441, '0482', '152221', 121.95754400, 46.07649700, 349, '内蒙古自治区', 441, '兴安盟', 444, '科尔沁右翼前旗', 'system', 'system', b'1', '2017-04-18 02:01:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (445, '科尔沁右翼中旗', 3, 441, '0482', '152222', 121.47281800, 45.05964500, 349, '内蒙古自治区', 441, '兴安盟', 445, '科尔沁右翼中旗', 'system', 'system', b'1', '2017-04-18 02:01:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (446, '扎赉特旗', 3, 441, '0482', '152223', 122.90933200, 46.72513600, 349, '内蒙古自治区', 441, '兴安盟', 446, '扎赉特旗', 'system', 'system', b'1', '2017-04-18 02:01:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (447, '突泉县', 3, 441, '0482', '152224', 121.56485600, 45.38098600, 349, '内蒙古自治区', 441, '兴安盟', 447, '突泉县', 'system', 'system', b'1', '2017-04-18 02:01:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (448, '锡林郭勒盟', 2, 349, '0479', '152500', 116.09099600, 43.94401800, 349, '内蒙古自治区', 448, '锡林郭勒盟', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (449, '二连浩特市', 3, 448, '0479', '152501', 111.97981000, 43.65289500, 349, '内蒙古自治区', 448, '锡林郭勒盟', 449, '二连浩特市', 'system', 'system', b'1', '2017-04-18 02:01:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (450, '锡林浩特市', 3, 448, '0479', '152502', 116.09190300, 43.94430100, 349, '内蒙古自治区', 448, '锡林郭勒盟', 450, '锡林浩特市', 'system', 'system', b'1', '2017-04-18 02:01:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (451, '阿巴嘎旗', 3, 448, '0479', '152522', 114.97061800, 44.02272800, 349, '内蒙古自治区', 448, '锡林郭勒盟', 451, '阿巴嘎旗', 'system', 'system', b'1', '2017-04-18 02:01:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (452, '苏尼特左旗', 3, 448, '0479', '152523', 113.65341200, 43.85410800, 349, '内蒙古自治区', 448, '锡林郭勒盟', 452, '苏尼特左旗', 'system', 'system', b'1', '2017-04-18 02:01:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (453, '苏尼特右旗', 3, 448, '0479', '152524', 112.65539000, 42.74666200, 349, '内蒙古自治区', 448, '锡林郭勒盟', 453, '苏尼特右旗', 'system', 'system', b'1', '2017-04-18 02:01:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (454, '东乌珠穆沁旗', 3, 448, '0479', '152525', 116.98002200, 45.51030700, 349, '内蒙古自治区', 448, '锡林郭勒盟', 454, '东乌珠穆沁旗', 'system', 'system', b'1', '2017-04-18 02:01:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (455, '西乌珠穆沁旗', 3, 448, '0479', '152526', 117.61524900, 44.58614700, 349, '内蒙古自治区', 448, '锡林郭勒盟', 455, '西乌珠穆沁旗', 'system', 'system', b'1', '2017-04-18 02:01:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (456, '太仆寺旗', 3, 448, '0479', '152527', 115.28728000, 41.89519900, 349, '内蒙古自治区', 448, '锡林郭勒盟', 456, '太仆寺旗', 'system', 'system', b'1', '2017-04-18 02:01:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (457, '镶黄旗', 3, 448, '0479', '152528', 113.84386900, 42.23922900, 349, '内蒙古自治区', 448, '锡林郭勒盟', 457, '镶黄旗', 'system', 'system', b'1', '2017-04-18 02:01:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (458, '正镶白旗', 3, 448, '0479', '152529', 115.03142300, 42.28680700, 349, '内蒙古自治区', 448, '锡林郭勒盟', 458, '正镶白旗', 'system', 'system', b'1', '2017-04-18 02:01:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (459, '正蓝旗', 3, 448, '0479', '152530', 116.00331100, 42.24589500, 349, '内蒙古自治区', 448, '锡林郭勒盟', 459, '正蓝旗', 'system', 'system', b'1', '2017-04-18 02:01:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (460, '多伦县', 3, 448, '0479', '152531', 116.47728800, 42.19796200, 349, '内蒙古自治区', 448, '锡林郭勒盟', 460, '多伦县', 'system', 'system', b'1', '2017-04-18 02:01:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (461, '阿拉善盟', 2, 349, '0483', '152900', 105.70642200, 38.84481400, 349, '内蒙古自治区', 461, '阿拉善盟', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (462, '阿拉善左旗', 3, 461, '0483', '152921', 105.70192000, 38.84724100, 349, '内蒙古自治区', 461, '阿拉善盟', 462, '阿拉善左旗', 'system', 'system', b'1', '2017-04-18 02:01:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (463, '阿拉善右旗', 3, 461, '0483', '152922', 101.67198400, 39.21159000, 349, '内蒙古自治区', 461, '阿拉善盟', 463, '阿拉善右旗', 'system', 'system', b'1', '2017-04-18 02:01:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (464, '额济纳旗', 3, 461, '0483', '152923', 101.06944000, 41.95881300, 349, '内蒙古自治区', 461, '阿拉善盟', 464, '额济纳旗', 'system', 'system', b'1', '2017-04-18 02:01:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (465, '辽宁省', 1, 1, NULL, '210000', 123.42909600, 41.79676700, 465, '辽宁省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (466, '沈阳市', 2, 465, '024', '210100', 123.42909600, 41.79676700, 465, '辽宁省', 466, '沈阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (467, '和平区', 3, 466, '024', '210102', 123.40666400, 41.78807400, 465, '辽宁省', 466, '沈阳市', 467, '和平区', 'system', 'system', b'1', '2017-04-18 02:01:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (468, '沈河区', 3, 466, '024', '210103', 123.44569600, 41.79559100, 465, '辽宁省', 466, '沈阳市', 468, '沈河区', 'system', 'system', b'1', '2017-04-18 02:01:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (469, '大东区', 3, 466, '024', '210104', 123.46995600, 41.80850300, 465, '辽宁省', 466, '沈阳市', 469, '大东区', 'system', 'system', b'1', '2017-04-18 02:01:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (470, '皇姑区', 3, 466, '024', '210105', 123.40567700, 41.82233600, 465, '辽宁省', 466, '沈阳市', 470, '皇姑区', 'system', 'system', b'1', '2017-04-18 02:01:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (471, '铁西区', 3, 466, '024', '210106', 123.35066400, 41.78780800, 465, '辽宁省', 466, '沈阳市', 471, '铁西区', 'system', 'system', b'1', '2017-04-18 02:01:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (472, '苏家屯区', 3, 466, '024', '210111', 123.34160400, 41.66590400, 465, '辽宁省', 466, '沈阳市', 472, '苏家屯区', 'system', 'system', b'1', '2017-04-18 02:01:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (473, '浑南区', 3, 466, '024', '210112', 123.45898100, 41.74194600, 465, '辽宁省', 466, '沈阳市', 473, '浑南区', 'system', 'system', b'1', '2017-04-18 02:01:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (474, '沈北新区', 3, 466, '024', '210113', 123.52147100, 42.05231200, 465, '辽宁省', 466, '沈阳市', 474, '沈北新区', 'system', 'system', b'1', '2017-04-18 02:01:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (475, '于洪区', 3, 466, '024', '210114', 123.31082900, 41.79583300, 465, '辽宁省', 466, '沈阳市', 475, '于洪区', 'system', 'system', b'1', '2017-04-18 02:01:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (476, '辽中区', 3, 466, '024', '210115', 122.73126900, 41.51272500, 465, '辽宁省', 466, '沈阳市', 476, '辽中区', 'system', 'system', b'1', '2017-04-18 02:01:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (477, '康平县', 3, 466, '024', '210123', 123.35270300, 42.74153300, 465, '辽宁省', 466, '沈阳市', 477, '康平县', 'system', 'system', b'1', '2017-04-18 02:01:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (478, '法库县', 3, 466, '024', '210124', 123.41672200, 42.50704500, 465, '辽宁省', 466, '沈阳市', 478, '法库县', 'system', 'system', b'1', '2017-04-18 02:01:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (479, '新民市', 3, 466, '024', '210181', 122.82886800, 41.99650800, 465, '辽宁省', 466, '沈阳市', 479, '新民市', 'system', 'system', b'1', '2017-04-18 02:01:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (480, '大连市', 2, 465, '0411', '210200', 121.61862200, 38.91459000, 465, '辽宁省', 480, '大连市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (481, '中山区', 3, 480, '0411', '210202', 121.64376000, 38.92155300, 465, '辽宁省', 480, '大连市', 481, '中山区', 'system', 'system', b'1', '2017-04-18 02:01:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (482, '西岗区', 3, 480, '0411', '210203', 121.61611200, 38.91426600, 465, '辽宁省', 480, '大连市', 482, '西岗区', 'system', 'system', b'1', '2017-04-18 02:01:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (483, '沙河口区', 3, 480, '0411', '210204', 121.59370200, 38.91285900, 465, '辽宁省', 480, '大连市', 483, '沙河口区', 'system', 'system', b'1', '2017-04-18 02:01:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (484, '甘井子区', 3, 480, '0411', '210211', 121.58261400, 38.97514800, 465, '辽宁省', 480, '大连市', 484, '甘井子区', 'system', 'system', b'1', '2017-04-18 02:01:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (485, '旅顺口区', 3, 480, '0411', '210212', 121.26713000, 38.81204300, 465, '辽宁省', 480, '大连市', 485, '旅顺口区', 'system', 'system', b'1', '2017-04-18 02:01:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (486, '金州区', 3, 480, '0411', '210213', 121.78941300, 39.05274500, 465, '辽宁省', 480, '大连市', 486, '金州区', 'system', 'system', b'1', '2017-04-18 02:01:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (487, '长海县', 3, 480, '0411', '210224', 122.58782400, 39.27239900, 465, '辽宁省', 480, '大连市', 487, '长海县', 'system', 'system', b'1', '2017-04-18 02:01:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (488, '瓦房店市', 3, 480, '0411', '210281', 122.00265600, 39.63065000, 465, '辽宁省', 480, '大连市', 488, '瓦房店市', 'system', 'system', b'1', '2017-04-18 02:01:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (489, '普兰店区', 3, 480, '0411', '210214', 121.97050000, 39.40155500, 465, '辽宁省', 480, '大连市', 489, '普兰店区', 'system', 'system', b'1', '2017-04-18 02:01:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (490, '庄河市', 3, 480, '0411', '210283', 122.97061200, 39.69829000, 465, '辽宁省', 480, '大连市', 490, '庄河市', 'system', 'system', b'1', '2017-04-18 02:01:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (491, '鞍山市', 2, 465, '0412', '210300', 122.99563200, 41.11062600, 465, '辽宁省', 491, '鞍山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (492, '铁东区', 3, 491, '0412', '210302', 122.99447500, 41.11034400, 465, '辽宁省', 491, '鞍山市', 492, '铁东区', 'system', 'system', b'1', '2017-04-18 02:01:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (493, '铁西区', 3, 491, '0412', '210303', 122.97183400, 41.11069000, 465, '辽宁省', 491, '鞍山市', 493, '铁西区', 'system', 'system', b'1', '2017-04-18 02:01:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (494, '立山区', 3, 491, '0412', '210304', 123.02480600, 41.15062200, 465, '辽宁省', 491, '鞍山市', 494, '立山区', 'system', 'system', b'1', '2017-04-18 02:01:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (495, '千山区', 3, 491, '0412', '210311', 122.94929800, 41.06890900, 465, '辽宁省', 491, '鞍山市', 495, '千山区', 'system', 'system', b'1', '2017-04-18 02:01:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (496, '台安县', 3, 491, '0412', '210321', 122.42973600, 41.38686000, 465, '辽宁省', 491, '鞍山市', 496, '台安县', 'system', 'system', b'1', '2017-04-18 02:01:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (497, '岫岩满族自治县', 3, 491, '0412', '210323', 123.28833000, 40.28150900, 465, '辽宁省', 491, '鞍山市', 497, '岫岩满族自治县', 'system', 'system', b'1', '2017-04-18 02:01:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (498, '海城市', 3, 491, '0412', '210381', 122.75219900, 40.85253300, 465, '辽宁省', 491, '鞍山市', 498, '海城市', 'system', 'system', b'1', '2017-04-18 02:01:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (499, '抚顺市', 2, 465, '0413', '210400', 123.92110900, 41.87595600, 465, '辽宁省', 499, '抚顺市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (500, '新抚区', 3, 499, '0413', '210402', 123.90285800, 41.86082000, 465, '辽宁省', 499, '抚顺市', 500, '新抚区', 'system', 'system', b'1', '2017-04-18 02:01:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (501, '东洲区', 3, 499, '0413', '210403', 124.04721900, 41.86682900, 465, '辽宁省', 499, '抚顺市', 501, '东洲区', 'system', 'system', b'1', '2017-04-18 02:01:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (502, '望花区', 3, 499, '0413', '210404', 123.80150900, 41.85180300, 465, '辽宁省', 499, '抚顺市', 502, '望花区', 'system', 'system', b'1', '2017-04-18 02:01:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (503, '顺城区', 3, 499, '0413', '210411', 123.91716500, 41.88113200, 465, '辽宁省', 499, '抚顺市', 503, '顺城区', 'system', 'system', b'1', '2017-04-18 02:01:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (504, '抚顺县', 3, 499, '0413', '210421', 124.09797900, 41.92264400, 465, '辽宁省', 499, '抚顺市', 504, '抚顺县', 'system', 'system', b'1', '2017-04-18 02:01:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (505, '新宾满族自治县', 3, 499, '0413', '210422', 125.03754700, 41.73245600, 465, '辽宁省', 499, '抚顺市', 505, '新宾满族自治县', 'system', 'system', b'1', '2017-04-18 02:01:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (506, '清原满族自治县', 3, 499, '0413', '210423', 124.92719200, 42.10135000, 465, '辽宁省', 499, '抚顺市', 506, '清原满族自治县', 'system', 'system', b'1', '2017-04-18 02:01:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (507, '本溪市', 2, 465, '0414', '210500', 123.77051900, 41.29790900, 465, '辽宁省', 507, '本溪市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (508, '平山区', 3, 507, '0414', '210502', 123.76123100, 41.29158100, 465, '辽宁省', 507, '本溪市', 508, '平山区', 'system', 'system', b'1', '2017-04-18 02:01:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (509, '溪湖区', 3, 507, '0414', '210503', 123.76522600, 41.33005600, 465, '辽宁省', 507, '本溪市', 509, '溪湖区', 'system', 'system', b'1', '2017-04-18 02:01:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (510, '明山区', 3, 507, '0414', '210504', 123.76328800, 41.30242900, 465, '辽宁省', 507, '本溪市', 510, '明山区', 'system', 'system', b'1', '2017-04-18 02:01:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (511, '南芬区', 3, 507, '0414', '210505', 123.74838100, 41.10409300, 465, '辽宁省', 507, '本溪市', 511, '南芬区', 'system', 'system', b'1', '2017-04-18 02:01:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (512, '本溪满族自治县', 3, 507, '0414', '210521', 124.12615600, 41.30034400, 465, '辽宁省', 507, '本溪市', 512, '本溪满族自治县', 'system', 'system', b'1', '2017-04-18 02:01:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (513, '桓仁满族自治县', 3, 507, '0414', '210522', 125.35919500, 41.26899700, 465, '辽宁省', 507, '本溪市', 513, '桓仁满族自治县', 'system', 'system', b'1', '2017-04-18 02:01:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (514, '丹东市', 2, 465, '0415', '210600', 124.38304400, 40.12429600, 465, '辽宁省', 514, '丹东市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:01:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (515, '元宝区', 3, 514, '0415', '210602', 124.39781400, 40.13648300, 465, '辽宁省', 514, '丹东市', 515, '元宝区', 'system', 'system', b'1', '2017-04-18 02:01:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (516, '振兴区', 3, 514, '0415', '210603', 124.36115300, 40.10280100, 465, '辽宁省', 514, '丹东市', 516, '振兴区', 'system', 'system', b'1', '2017-04-18 02:01:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (517, '振安区', 3, 514, '0415', '210604', 124.42770900, 40.15855700, 465, '辽宁省', 514, '丹东市', 517, '振安区', 'system', 'system', b'1', '2017-04-18 02:01:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (518, '宽甸满族自治县', 3, 514, '0415', '210624', 124.78486700, 40.73041200, 465, '辽宁省', 514, '丹东市', 518, '宽甸满族自治县', 'system', 'system', b'1', '2017-04-18 02:01:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (519, '东港市', 3, 514, '0415', '210681', 124.14943700, 39.88346700, 465, '辽宁省', 514, '丹东市', 519, '东港市', 'system', 'system', b'1', '2017-04-18 02:02:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (520, '凤城市', 3, 514, '0415', '210682', 124.07106700, 40.45756700, 465, '辽宁省', 514, '丹东市', 520, '凤城市', 'system', 'system', b'1', '2017-04-18 02:02:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (521, '锦州市', 2, 465, '0416', '210700', 121.13574200, 41.11926900, 465, '辽宁省', 521, '锦州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (522, '古塔区', 3, 521, '0416', '210702', 121.13008500, 41.11571900, 465, '辽宁省', 521, '锦州市', 522, '古塔区', 'system', 'system', b'1', '2017-04-18 02:02:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (523, '凌河区', 3, 521, '0416', '210703', 121.15130400, 41.11466200, 465, '辽宁省', 521, '锦州市', 523, '凌河区', 'system', 'system', b'1', '2017-04-18 02:02:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (524, '太和区', 3, 521, '0416', '210711', 121.10729700, 41.10537800, 465, '辽宁省', 521, '锦州市', 524, '太和区', 'system', 'system', b'1', '2017-04-18 02:02:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (525, '黑山县', 3, 521, '0416', '210726', 122.11791500, 41.69180400, 465, '辽宁省', 521, '锦州市', 525, '黑山县', 'system', 'system', b'1', '2017-04-18 02:02:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (526, '义县', 3, 521, '0416', '210727', 121.24283100, 41.53722400, 465, '辽宁省', 521, '锦州市', 526, '义县', 'system', 'system', b'1', '2017-04-18 02:02:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (527, '凌海市', 3, 521, '0416', '210781', 121.36423600, 41.17173800, 465, '辽宁省', 521, '锦州市', 527, '凌海市', 'system', 'system', b'1', '2017-04-18 02:02:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (528, '北镇市', 3, 521, '0416', '210782', 121.79596200, 41.59876400, 465, '辽宁省', 521, '锦州市', 528, '北镇市', 'system', 'system', b'1', '2017-04-18 02:02:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (529, '营口市', 2, 465, '0417', '210800', 122.23515100, 40.66743200, 465, '辽宁省', 529, '营口市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (530, '站前区', 3, 529, '0417', '210802', 122.25323500, 40.66994900, 465, '辽宁省', 529, '营口市', 530, '站前区', 'system', 'system', b'1', '2017-04-18 02:02:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (531, '西市区', 3, 529, '0417', '210803', 122.21006700, 40.66308600, 465, '辽宁省', 529, '营口市', 531, '西市区', 'system', 'system', b'1', '2017-04-18 02:02:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (532, '鲅鱼圈区', 3, 529, '0417', '210804', 122.12724200, 40.26364600, 465, '辽宁省', 529, '营口市', 532, '鲅鱼圈区', 'system', 'system', b'1', '2017-04-18 02:02:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (533, '老边区', 3, 529, '0417', '210811', 122.38258400, 40.68272300, 465, '辽宁省', 529, '营口市', 533, '老边区', 'system', 'system', b'1', '2017-04-18 02:02:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (534, '盖州市', 3, 529, '0417', '210881', 122.35553400, 40.40523400, 465, '辽宁省', 529, '营口市', 534, '盖州市', 'system', 'system', b'1', '2017-04-18 02:02:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (535, '大石桥市', 3, 529, '0417', '210882', 122.50589400, 40.63397300, 465, '辽宁省', 529, '营口市', 535, '大石桥市', 'system', 'system', b'1', '2017-04-18 02:02:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (536, '阜新市', 2, 465, '0418', '210900', 121.64896200, 42.01179600, 465, '辽宁省', 536, '阜新市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (537, '海州区', 3, 536, '0418', '210902', 121.65763900, 42.01116200, 465, '辽宁省', 536, '阜新市', 537, '海州区', 'system', 'system', b'1', '2017-04-18 02:02:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (538, '新邱区', 3, 536, '0418', '210903', 121.79054100, 42.08660300, 465, '辽宁省', 536, '阜新市', 538, '新邱区', 'system', 'system', b'1', '2017-04-18 02:02:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (539, '太平区', 3, 536, '0418', '210904', 121.67757500, 42.01114500, 465, '辽宁省', 536, '阜新市', 539, '太平区', 'system', 'system', b'1', '2017-04-18 02:02:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (540, '清河门区', 3, 536, '0418', '210905', 121.42018000, 41.78047700, 465, '辽宁省', 536, '阜新市', 540, '清河门区', 'system', 'system', b'1', '2017-04-18 02:02:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (541, '细河区', 3, 536, '0418', '210911', 121.65479100, 42.01921800, 465, '辽宁省', 536, '阜新市', 541, '细河区', 'system', 'system', b'1', '2017-04-18 02:02:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (542, '阜新蒙古族自治县', 3, 536, '0418', '210921', 121.74312500, 42.05860700, 465, '辽宁省', 536, '阜新市', 542, '阜新蒙古族自治县', 'system', 'system', b'1', '2017-04-18 02:02:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (543, '彰武县', 3, 536, '0418', '210922', 122.53744400, 42.38482300, 465, '辽宁省', 536, '阜新市', 543, '彰武县', 'system', 'system', b'1', '2017-04-18 02:02:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (544, '辽阳市', 2, 465, '0419', '211000', 123.18152000, 41.26940200, 465, '辽宁省', 544, '辽阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (545, '白塔区', 3, 544, '0419', '211002', 123.17261100, 41.26745000, 465, '辽宁省', 544, '辽阳市', 545, '白塔区', 'system', 'system', b'1', '2017-04-18 02:02:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (546, '文圣区', 3, 544, '0419', '211003', 123.18822700, 41.26676500, 465, '辽宁省', 544, '辽阳市', 546, '文圣区', 'system', 'system', b'1', '2017-04-18 02:02:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (547, '宏伟区', 3, 544, '0419', '211004', 123.20046100, 41.20574700, 465, '辽宁省', 544, '辽阳市', 547, '宏伟区', 'system', 'system', b'1', '2017-04-18 02:02:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (548, '弓长岭区', 3, 544, '0419', '211005', 123.43163300, 41.15783100, 465, '辽宁省', 544, '辽阳市', 548, '弓长岭区', 'system', 'system', b'1', '2017-04-18 02:02:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (549, '太子河区', 3, 544, '0419', '211011', 123.18533600, 41.25168200, 465, '辽宁省', 544, '辽阳市', 549, '太子河区', 'system', 'system', b'1', '2017-04-18 02:02:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (550, '辽阳县', 3, 544, '0419', '211021', 123.07967400, 41.21647900, 465, '辽宁省', 544, '辽阳市', 550, '辽阳县', 'system', 'system', b'1', '2017-04-18 02:02:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (551, '灯塔市', 3, 544, '0419', '211081', 123.32586400, 41.42783600, 465, '辽宁省', 544, '辽阳市', 551, '灯塔市', 'system', 'system', b'1', '2017-04-18 02:02:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (552, '盘锦市', 2, 465, '0427', '211100', 122.06957000, 41.12448400, 465, '辽宁省', 552, '盘锦市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (553, '双台子区', 3, 552, '0427', '211102', 122.05573300, 41.19036500, 465, '辽宁省', 552, '盘锦市', 553, '双台子区', 'system', 'system', b'1', '2017-04-18 02:02:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (554, '兴隆台区', 3, 552, '0427', '211103', 122.07162400, 41.12242300, 465, '辽宁省', 552, '盘锦市', 554, '兴隆台区', 'system', 'system', b'1', '2017-04-18 02:02:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (555, '大洼区', 3, 552, '0427', '211104', 122.07170800, 40.99442800, 465, '辽宁省', 552, '盘锦市', 555, '大洼区', 'system', 'system', b'1', '2017-04-18 02:02:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (556, '盘山县', 3, 552, '0427', '211122', 121.98528000, 41.24070100, 465, '辽宁省', 552, '盘锦市', 556, '盘山县', 'system', 'system', b'1', '2017-04-18 02:02:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (557, '铁岭市', 2, 465, '0410', '211200', 123.84427900, 42.29058500, 465, '辽宁省', 557, '铁岭市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (558, '银州区', 3, 557, '0410', '211202', 123.84487700, 42.29227800, 465, '辽宁省', 557, '铁岭市', 558, '银州区', 'system', 'system', b'1', '2017-04-18 02:02:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (559, '清河区', 3, 557, '0410', '211204', 124.14896000, 42.54297800, 465, '辽宁省', 557, '铁岭市', 559, '清河区', 'system', 'system', b'1', '2017-04-18 02:02:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (560, '铁岭县', 3, 557, '0410', '211221', 123.72566900, 42.22331600, 465, '辽宁省', 557, '铁岭市', 560, '铁岭县', 'system', 'system', b'1', '2017-04-18 02:02:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (561, '西丰县', 3, 557, '0410', '211223', 124.72332000, 42.73809100, 465, '辽宁省', 557, '铁岭市', 561, '西丰县', 'system', 'system', b'1', '2017-04-18 02:02:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (562, '昌图县', 3, 557, '0410', '211224', 124.11017000, 42.78444100, 465, '辽宁省', 557, '铁岭市', 562, '昌图县', 'system', 'system', b'1', '2017-04-18 02:02:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (563, '调兵山市', 3, 557, '0410', '211281', 123.54536600, 42.45073400, 465, '辽宁省', 557, '铁岭市', 563, '调兵山市', 'system', 'system', b'1', '2017-04-18 02:02:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (564, '开原市', 3, 557, '0410', '211282', 124.04555100, 42.54214100, 465, '辽宁省', 557, '铁岭市', 564, '开原市', 'system', 'system', b'1', '2017-04-18 02:02:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (565, '朝阳市', 2, 465, '0421', '211300', 120.45117600, 41.57675800, 465, '辽宁省', 565, '朝阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (566, '双塔区', 3, 565, '0421', '211302', 120.44877000, 41.57938900, 465, '辽宁省', 565, '朝阳市', 566, '双塔区', 'system', 'system', b'1', '2017-04-18 02:02:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (567, '龙城区', 3, 565, '0421', '211303', 120.41337600, 41.57674900, 465, '辽宁省', 565, '朝阳市', 567, '龙城区', 'system', 'system', b'1', '2017-04-18 02:02:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (568, '朝阳县', 3, 565, '0421', '211321', 120.40421700, 41.52634200, 465, '辽宁省', 565, '朝阳市', 568, '朝阳县', 'system', 'system', b'1', '2017-04-18 02:02:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (569, '建平县', 3, 565, '0421', '211322', 119.64236300, 41.40257600, 465, '辽宁省', 565, '朝阳市', 569, '建平县', 'system', 'system', b'1', '2017-04-18 02:02:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (570, '喀喇沁左翼蒙古族自治县', 3, 565, '0421', '211324', 119.74488300, 41.12542800, 465, '辽宁省', 565, '朝阳市', 570, '喀喇沁左翼蒙古族自治县', 'system', 'system', b'1', '2017-04-18 02:02:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (571, '北票市', 3, 565, '0421', '211381', 120.76695100, 41.80328600, 465, '辽宁省', 565, '朝阳市', 571, '北票市', 'system', 'system', b'1', '2017-04-18 02:02:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (572, '凌源市', 3, 565, '0421', '211382', 119.40478900, 41.24308600, 465, '辽宁省', 565, '朝阳市', 572, '凌源市', 'system', 'system', b'1', '2017-04-18 02:02:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (573, '葫芦岛市', 2, 465, '0429', '211400', 120.85639400, 40.75557200, 465, '辽宁省', 573, '葫芦岛市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (574, '连山区', 3, 573, '0429', '211402', 120.85937000, 40.75514300, 465, '辽宁省', 573, '葫芦岛市', 574, '连山区', 'system', 'system', b'1', '2017-04-18 02:02:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (575, '龙港区', 3, 573, '0429', '211403', 120.83856900, 40.70999100, 465, '辽宁省', 573, '葫芦岛市', 575, '龙港区', 'system', 'system', b'1', '2017-04-18 02:02:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (576, '南票区', 3, 573, '0429', '211404', 120.75231400, 41.09881300, 465, '辽宁省', 573, '葫芦岛市', 576, '南票区', 'system', 'system', b'1', '2017-04-18 02:02:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (577, '绥中县', 3, 573, '0429', '211421', 120.34211200, 40.32840700, 465, '辽宁省', 573, '葫芦岛市', 577, '绥中县', 'system', 'system', b'1', '2017-04-18 02:02:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (578, '建昌县', 3, 573, '0429', '211422', 119.80777600, 40.81287100, 465, '辽宁省', 573, '葫芦岛市', 578, '建昌县', 'system', 'system', b'1', '2017-04-18 02:02:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (579, '兴城市', 3, 573, '0429', '211481', 120.72936500, 40.61941300, 465, '辽宁省', 573, '葫芦岛市', 579, '兴城市', 'system', 'system', b'1', '2017-04-18 02:02:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (580, '吉林省', 1, 1, NULL, '220000', 125.32450000, 43.88684100, 580, '吉林省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (581, '长春市', 2, 580, '0431', '220100', 125.32450000, 43.88684100, 580, '吉林省', 581, '长春市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (582, '南关区', 3, 581, '0431', '220102', 125.33723700, 43.89023500, 580, '吉林省', 581, '长春市', 582, '南关区', 'system', 'system', b'1', '2017-04-18 02:02:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (583, '宽城区', 3, 581, '0431', '220103', 125.34282800, 43.90382300, 580, '吉林省', 581, '长春市', 583, '宽城区', 'system', 'system', b'1', '2017-04-18 02:02:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (584, '朝阳区', 3, 581, '0431', '220104', 125.31804200, 43.86491000, 580, '吉林省', 581, '长春市', 584, '朝阳区', 'system', 'system', b'1', '2017-04-18 02:02:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (585, '二道区', 3, 581, '0431', '220105', 125.38472700, 43.87082400, 580, '吉林省', 581, '长春市', 585, '二道区', 'system', 'system', b'1', '2017-04-18 02:02:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (586, '绿园区', 3, 581, '0431', '220106', 125.27246700, 43.89217700, 580, '吉林省', 581, '长春市', 586, '绿园区', 'system', 'system', b'1', '2017-04-18 02:02:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (587, '双阳区', 3, 581, '0431', '220112', 125.65901800, 43.52516800, 580, '吉林省', 581, '长春市', 587, '双阳区', 'system', 'system', b'1', '2017-04-18 02:02:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (588, '九台区', 3, 581, '0431', '220113', 125.84468200, 44.15715500, 580, '吉林省', 581, '长春市', 588, '九台区', 'system', 'system', b'1', '2017-04-18 02:02:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (589, '农安县', 3, 581, '0431', '220122', 125.17528700, 44.43125800, 580, '吉林省', 581, '长春市', 589, '农安县', 'system', 'system', b'1', '2017-04-18 02:02:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (590, '榆树市', 3, 581, '0431', '220182', 126.55010700, 44.82764200, 580, '吉林省', 581, '长春市', 590, '榆树市', 'system', 'system', b'1', '2017-04-18 02:02:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (591, '德惠市', 3, 581, '0431', '220183', 125.70332700, 44.53390900, 580, '吉林省', 581, '长春市', 591, '德惠市', 'system', 'system', b'1', '2017-04-18 02:02:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (592, '吉林市', 2, 580, '0432', '220200', 126.55302000, 43.84357700, 580, '吉林省', 592, '吉林市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (593, '昌邑区', 3, 592, '0432', '220202', 126.57076600, 43.85111800, 580, '吉林省', 592, '吉林市', 593, '昌邑区', 'system', 'system', b'1', '2017-04-18 02:02:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (594, '龙潭区', 3, 592, '0432', '220203', 126.56142900, 43.90975500, 580, '吉林省', 592, '吉林市', 594, '龙潭区', 'system', 'system', b'1', '2017-04-18 02:02:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (595, '船营区', 3, 592, '0432', '220204', 126.55239000, 43.84380400, 580, '吉林省', 592, '吉林市', 595, '船营区', 'system', 'system', b'1', '2017-04-18 02:02:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (596, '丰满区', 3, 592, '0432', '220211', 126.56075900, 43.81659400, 580, '吉林省', 592, '吉林市', 596, '丰满区', 'system', 'system', b'1', '2017-04-18 02:02:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (597, '永吉县', 3, 592, '0432', '220221', 126.50162200, 43.66741600, 580, '吉林省', 592, '吉林市', 597, '永吉县', 'system', 'system', b'1', '2017-04-18 02:02:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (598, '蛟河市', 3, 592, '0432', '220281', 127.34273900, 43.72057900, 580, '吉林省', 592, '吉林市', 598, '蛟河市', 'system', 'system', b'1', '2017-04-18 02:02:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (599, '桦甸市', 3, 592, '0432', '220282', 126.74544500, 42.97209300, 580, '吉林省', 592, '吉林市', 599, '桦甸市', 'system', 'system', b'1', '2017-04-18 02:02:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (600, '舒兰市', 3, 592, '0432', '220283', 126.94781300, 44.41090600, 580, '吉林省', 592, '吉林市', 600, '舒兰市', 'system', 'system', b'1', '2017-04-18 02:02:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (601, '磐石市', 3, 592, '0432', '220284', 126.05992900, 42.94247600, 580, '吉林省', 592, '吉林市', 601, '磐石市', 'system', 'system', b'1', '2017-04-18 02:02:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (602, '四平市', 2, 580, '0434', '220300', 124.37078500, 43.17034400, 580, '吉林省', 602, '四平市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (603, '铁西区', 3, 602, '0434', '220302', 124.36089400, 43.17626300, 580, '吉林省', 602, '四平市', 603, '铁西区', 'system', 'system', b'1', '2017-04-18 02:02:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (604, '铁东区', 3, 602, '0434', '220303', 124.38846400, 43.16726000, 580, '吉林省', 602, '四平市', 604, '铁东区', 'system', 'system', b'1', '2017-04-18 02:02:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (605, '梨树县', 3, 602, '0434', '220322', 124.33580200, 43.30831000, 580, '吉林省', 602, '四平市', 605, '梨树县', 'system', 'system', b'1', '2017-04-18 02:02:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (606, '伊通满族自治县', 3, 602, '0434', '220323', 125.30312400, 43.34546400, 580, '吉林省', 602, '四平市', 606, '伊通满族自治县', 'system', 'system', b'1', '2017-04-18 02:02:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (607, '公主岭市', 3, 602, '0434', '220381', 124.81758800, 43.50947400, 580, '吉林省', 602, '四平市', 607, '公主岭市', 'system', 'system', b'1', '2017-04-18 02:02:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (608, '双辽市', 3, 602, '0434', '220382', 123.50528300, 43.51827500, 580, '吉林省', 602, '四平市', 608, '双辽市', 'system', 'system', b'1', '2017-04-18 02:02:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (609, '辽源市', 2, 580, '0437', '220400', 125.14534900, 42.90269200, 580, '吉林省', 609, '辽源市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (610, '龙山区', 3, 609, '0437', '220402', 125.14516400, 42.90270200, 580, '吉林省', 609, '辽源市', 610, '龙山区', 'system', 'system', b'1', '2017-04-18 02:02:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (611, '西安区', 3, 609, '0437', '220403', 125.15142400, 42.92041500, 580, '吉林省', 609, '辽源市', 611, '西安区', 'system', 'system', b'1', '2017-04-18 02:02:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (612, '东丰县', 3, 609, '0437', '220421', 125.52962300, 42.67522800, 580, '吉林省', 609, '辽源市', 612, '东丰县', 'system', 'system', b'1', '2017-04-18 02:02:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (613, '东辽县', 3, 609, '0437', '220422', 124.99199500, 42.92772400, 580, '吉林省', 609, '辽源市', 613, '东辽县', 'system', 'system', b'1', '2017-04-18 02:02:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (614, '通化市', 2, 580, '0435', '220500', 125.93650100, 41.72117700, 580, '吉林省', 614, '通化市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (615, '东昌区', 3, 614, '0435', '220502', 125.93671600, 41.72123300, 580, '吉林省', 614, '通化市', 615, '东昌区', 'system', 'system', b'1', '2017-04-18 02:02:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (616, '二道江区', 3, 614, '0435', '220503', 126.04598700, 41.77756400, 580, '吉林省', 614, '通化市', 616, '二道江区', 'system', 'system', b'1', '2017-04-18 02:02:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (617, '通化县', 3, 614, '0435', '220521', 125.75312100, 41.67791800, 580, '吉林省', 614, '通化市', 617, '通化县', 'system', 'system', b'1', '2017-04-18 02:02:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (618, '辉南县', 3, 614, '0435', '220523', 126.04282100, 42.68345900, 580, '吉林省', 614, '通化市', 618, '辉南县', 'system', 'system', b'1', '2017-04-18 02:02:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (619, '柳河县', 3, 614, '0435', '220524', 125.74053600, 42.28148400, 580, '吉林省', 614, '通化市', 619, '柳河县', 'system', 'system', b'1', '2017-04-18 02:02:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (620, '梅河口市', 3, 614, '0435', '220581', 125.68733600, 42.53000200, 580, '吉林省', 614, '通化市', 620, '梅河口市', 'system', 'system', b'1', '2017-04-18 02:02:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (621, '集安市', 3, 614, '0435', '220582', 126.18620400, 41.12627600, 580, '吉林省', 614, '通化市', 621, '集安市', 'system', 'system', b'1', '2017-04-18 02:02:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (622, '白山市', 2, 580, '0439', '220600', 126.42783900, 41.94250500, 580, '吉林省', 622, '白山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (623, '浑江区', 3, 622, '0439', '220602', 126.42803500, 41.94306500, 580, '吉林省', 622, '白山市', 623, '浑江区', 'system', 'system', b'1', '2017-04-18 02:02:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (624, '江源区', 3, 622, '0439', '220605', 126.58422900, 42.04810900, 580, '吉林省', 622, '白山市', 624, '江源区', 'system', 'system', b'1', '2017-04-18 02:02:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (625, '抚松县', 3, 622, '0439', '220621', 127.27379600, 42.33264300, 580, '吉林省', 622, '白山市', 625, '抚松县', 'system', 'system', b'1', '2017-04-18 02:02:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (626, '靖宇县', 3, 622, '0439', '220622', 126.80838600, 42.38968900, 580, '吉林省', 622, '白山市', 626, '靖宇县', 'system', 'system', b'1', '2017-04-18 02:02:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (627, '长白朝鲜族自治县', 3, 622, '0439', '220623', 128.20338400, 41.41936100, 580, '吉林省', 622, '白山市', 627, '长白朝鲜族自治县', 'system', 'system', b'1', '2017-04-18 02:02:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (628, '临江市', 3, 622, '0439', '220681', 126.91929600, 41.81068900, 580, '吉林省', 622, '白山市', 628, '临江市', 'system', 'system', b'1', '2017-04-18 02:02:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (629, '松原市', 2, 580, '0438', '220700', 124.82360800, 45.11824300, 580, '吉林省', 629, '松原市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (630, '宁江区', 3, 629, '0438', '220702', 124.82785100, 45.17649800, 580, '吉林省', 629, '松原市', 630, '宁江区', 'system', 'system', b'1', '2017-04-18 02:02:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (631, '前郭尔罗斯蒙古族自治县', 3, 629, '0438', '220721', 124.82680800, 45.11628800, 580, '吉林省', 629, '松原市', 631, '前郭尔罗斯蒙古族自治县', 'system', 'system', b'1', '2017-04-18 02:02:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (632, '长岭县', 3, 629, '0438', '220722', 123.98518400, 44.27657900, 580, '吉林省', 629, '松原市', 632, '长岭县', 'system', 'system', b'1', '2017-04-18 02:02:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (633, '乾安县', 3, 629, '0438', '220723', 124.02436100, 45.00684600, 580, '吉林省', 629, '松原市', 633, '乾安县', 'system', 'system', b'1', '2017-04-18 02:02:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (634, '扶余市', 3, 629, '0438', '220781', 126.04275800, 44.98619900, 580, '吉林省', 629, '松原市', 634, '扶余市', 'system', 'system', b'1', '2017-04-18 02:02:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (635, '白城市', 2, 580, '0436', '220800', 122.84111400, 45.61902600, 580, '吉林省', 635, '白城市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (636, '洮北区', 3, 635, '0436', '220802', 122.84249900, 45.61925300, 580, '吉林省', 635, '白城市', 636, '洮北区', 'system', 'system', b'1', '2017-04-18 02:02:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (637, '镇赉县', 3, 635, '0436', '220821', 123.20224600, 45.84608900, 580, '吉林省', 635, '白城市', 637, '镇赉县', 'system', 'system', b'1', '2017-04-18 02:02:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (638, '通榆县', 3, 635, '0436', '220822', 123.08854300, 44.80915000, 580, '吉林省', 635, '白城市', 638, '通榆县', 'system', 'system', b'1', '2017-04-18 02:02:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (639, '洮南市', 3, 635, '0436', '220881', 122.78377900, 45.33911300, 580, '吉林省', 635, '白城市', 639, '洮南市', 'system', 'system', b'1', '2017-04-18 02:02:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (640, '大安市', 3, 635, '0436', '220882', 124.29151200, 45.50764800, 580, '吉林省', 635, '白城市', 640, '大安市', 'system', 'system', b'1', '2017-04-18 02:02:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (641, '延边朝鲜族自治州', 2, 580, '1433', '222400', 129.51322800, 42.90482300, 580, '吉林省', 641, '延边朝鲜族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (642, '延吉市', 3, 641, '1433', '222401', 129.51579000, 42.90696400, 580, '吉林省', 641, '延边朝鲜族自治州', 642, '延吉市', 'system', 'system', b'1', '2017-04-18 02:02:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (643, '图们市', 3, 641, '1433', '222402', 129.84670100, 42.96662100, 580, '吉林省', 641, '延边朝鲜族自治州', 643, '图们市', 'system', 'system', b'1', '2017-04-18 02:02:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (644, '敦化市', 3, 641, '1433', '222403', 128.22986000, 43.36692100, 580, '吉林省', 641, '延边朝鲜族自治州', 644, '敦化市', 'system', 'system', b'1', '2017-04-18 02:02:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (645, '珲春市', 3, 641, '1433', '222404', 130.36578700, 42.87105700, 580, '吉林省', 641, '延边朝鲜族自治州', 645, '珲春市', 'system', 'system', b'1', '2017-04-18 02:02:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (646, '龙井市', 3, 641, '1433', '222405', 129.42574700, 42.77102900, 580, '吉林省', 641, '延边朝鲜族自治州', 646, '龙井市', 'system', 'system', b'1', '2017-04-18 02:02:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (647, '和龙市', 3, 641, '1433', '222406', 129.00874800, 42.54700400, 580, '吉林省', 641, '延边朝鲜族自治州', 647, '和龙市', 'system', 'system', b'1', '2017-04-18 02:02:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (648, '汪清县', 3, 641, '1433', '222424', 129.76616100, 43.31542600, 580, '吉林省', 641, '延边朝鲜族自治州', 648, '汪清县', 'system', 'system', b'1', '2017-04-18 02:02:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (649, '安图县', 3, 641, '1433', '222426', 128.90186500, 43.11099400, 580, '吉林省', 641, '延边朝鲜族自治州', 649, '安图县', 'system', 'system', b'1', '2017-04-18 02:02:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (650, '黑龙江省', 1, 1, NULL, '230000', 126.64246400, 45.75696700, 650, '黑龙江省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (651, '哈尔滨市', 2, 650, '0451', '230100', 126.64246400, 45.75696700, 650, '黑龙江省', 651, '哈尔滨市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (652, '道里区', 3, 651, '0451', '230102', 126.61253200, 45.76203500, 650, '黑龙江省', 651, '哈尔滨市', 652, '道里区', 'system', 'system', b'1', '2017-04-18 02:02:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (653, '南岗区', 3, 651, '0451', '230103', 126.65209800, 45.75597100, 650, '黑龙江省', 651, '哈尔滨市', 653, '南岗区', 'system', 'system', b'1', '2017-04-18 02:02:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (654, '道外区', 3, 651, '0451', '230104', 126.64883800, 45.78454000, 650, '黑龙江省', 651, '哈尔滨市', 654, '道外区', 'system', 'system', b'1', '2017-04-18 02:02:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (655, '平房区', 3, 651, '0451', '230108', 126.62925700, 45.60556700, 650, '黑龙江省', 651, '哈尔滨市', 655, '平房区', 'system', 'system', b'1', '2017-04-18 02:02:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (656, '松北区', 3, 651, '0451', '230109', 126.56306600, 45.81465600, 650, '黑龙江省', 651, '哈尔滨市', 656, '松北区', 'system', 'system', b'1', '2017-04-18 02:02:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (657, '香坊区', 3, 651, '0451', '230110', 126.66704900, 45.71306700, 650, '黑龙江省', 651, '哈尔滨市', 657, '香坊区', 'system', 'system', b'1', '2017-04-18 02:02:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (658, '呼兰区', 3, 651, '0451', '230111', 126.60330200, 45.98423000, 650, '黑龙江省', 651, '哈尔滨市', 658, '呼兰区', 'system', 'system', b'1', '2017-04-18 02:02:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (659, '阿城区', 3, 651, '0451', '230112', 126.97272600, 45.53837200, 650, '黑龙江省', 651, '哈尔滨市', 659, '阿城区', 'system', 'system', b'1', '2017-04-18 02:02:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (660, '双城区', 3, 651, '0451', '230113', 126.30878400, 45.37794200, 650, '黑龙江省', 651, '哈尔滨市', 660, '双城区', 'system', 'system', b'1', '2017-04-18 02:02:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (661, '依兰县', 3, 651, '0451', '230123', 129.56559400, 46.31510500, 650, '黑龙江省', 651, '哈尔滨市', 661, '依兰县', 'system', 'system', b'1', '2017-04-18 02:02:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (662, '方正县', 3, 651, '0451', '230124', 128.83613100, 45.83953600, 650, '黑龙江省', 651, '哈尔滨市', 662, '方正县', 'system', 'system', b'1', '2017-04-18 02:02:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (663, '宾县', 3, 651, '0451', '230125', 127.48594000, 45.75936900, 650, '黑龙江省', 651, '哈尔滨市', 663, '宾县', 'system', 'system', b'1', '2017-04-18 02:02:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (664, '巴彦县', 3, 651, '0451', '230126', 127.40360200, 46.08188900, 650, '黑龙江省', 651, '哈尔滨市', 664, '巴彦县', 'system', 'system', b'1', '2017-04-18 02:02:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (665, '木兰县', 3, 651, '0451', '230127', 128.04267500, 45.94982600, 650, '黑龙江省', 651, '哈尔滨市', 665, '木兰县', 'system', 'system', b'1', '2017-04-18 02:02:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (666, '通河县', 3, 651, '0451', '230128', 128.74778600, 45.97761800, 650, '黑龙江省', 651, '哈尔滨市', 666, '通河县', 'system', 'system', b'1', '2017-04-18 02:02:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (667, '延寿县', 3, 651, '0451', '230129', 128.33188600, 45.45564800, 650, '黑龙江省', 651, '哈尔滨市', 667, '延寿县', 'system', 'system', b'1', '2017-04-18 02:02:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (668, '尚志市', 3, 651, '0451', '230183', 127.96853900, 45.21495300, 650, '黑龙江省', 651, '哈尔滨市', 668, '尚志市', 'system', 'system', b'1', '2017-04-18 02:02:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (669, '五常市', 3, 651, '0451', '230184', 127.15759000, 44.91941800, 650, '黑龙江省', 651, '哈尔滨市', 669, '五常市', 'system', 'system', b'1', '2017-04-18 02:02:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (670, '齐齐哈尔市', 2, 650, '0452', '230200', 123.95792000, 47.34208100, 650, '黑龙江省', 670, '齐齐哈尔市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (671, '龙沙区', 3, 670, '0452', '230202', 123.95733800, 47.34173600, 650, '黑龙江省', 670, '齐齐哈尔市', 671, '龙沙区', 'system', 'system', b'1', '2017-04-18 02:02:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (672, '建华区', 3, 670, '0452', '230203', 123.95588800, 47.35449400, 650, '黑龙江省', 670, '齐齐哈尔市', 672, '建华区', 'system', 'system', b'1', '2017-04-18 02:02:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (673, '铁锋区', 3, 670, '0452', '230204', 123.97355500, 47.33949900, 650, '黑龙江省', 670, '齐齐哈尔市', 673, '铁锋区', 'system', 'system', b'1', '2017-04-18 02:02:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (674, '昂昂溪区', 3, 670, '0452', '230205', 123.81318100, 47.15686700, 650, '黑龙江省', 670, '齐齐哈尔市', 674, '昂昂溪区', 'system', 'system', b'1', '2017-04-18 02:02:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (675, '富拉尔基区', 3, 670, '0452', '230206', 123.63887300, 47.20697000, 650, '黑龙江省', 670, '齐齐哈尔市', 675, '富拉尔基区', 'system', 'system', b'1', '2017-04-18 02:02:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (676, '碾子山区', 3, 670, '0452', '230207', 122.88797200, 47.51401000, 650, '黑龙江省', 670, '齐齐哈尔市', 676, '碾子山区', 'system', 'system', b'1', '2017-04-18 02:02:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (677, '梅里斯达斡尔族区', 3, 670, '0452', '230208', 123.75459900, 47.31111300, 650, '黑龙江省', 670, '齐齐哈尔市', 677, '梅里斯达斡尔族区', 'system', 'system', b'1', '2017-04-18 02:02:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (678, '龙江县', 3, 670, '0452', '230221', 123.18722500, 47.33638800, 650, '黑龙江省', 670, '齐齐哈尔市', 678, '龙江县', 'system', 'system', b'1', '2017-04-18 02:02:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (679, '依安县', 3, 670, '0452', '230223', 125.30756100, 47.89009800, 650, '黑龙江省', 670, '齐齐哈尔市', 679, '依安县', 'system', 'system', b'1', '2017-04-18 02:02:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (680, '泰来县', 3, 670, '0452', '230224', 123.41953000, 46.39233000, 650, '黑龙江省', 670, '齐齐哈尔市', 680, '泰来县', 'system', 'system', b'1', '2017-04-18 02:02:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (681, '甘南县', 3, 670, '0452', '230225', 123.50603400, 47.91783800, 650, '黑龙江省', 670, '齐齐哈尔市', 681, '甘南县', 'system', 'system', b'1', '2017-04-18 02:02:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (682, '富裕县', 3, 670, '0452', '230227', 124.46910600, 47.79717200, 650, '黑龙江省', 670, '齐齐哈尔市', 682, '富裕县', 'system', 'system', b'1', '2017-04-18 02:02:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (683, '克山县', 3, 670, '0452', '230229', 125.87435500, 48.03434200, 650, '黑龙江省', 670, '齐齐哈尔市', 683, '克山县', 'system', 'system', b'1', '2017-04-18 02:02:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (684, '克东县', 3, 670, '0452', '230230', 126.24909400, 48.03732000, 650, '黑龙江省', 670, '齐齐哈尔市', 684, '克东县', 'system', 'system', b'1', '2017-04-18 02:02:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (685, '拜泉县', 3, 670, '0452', '230231', 126.09191100, 47.60736300, 650, '黑龙江省', 670, '齐齐哈尔市', 685, '拜泉县', 'system', 'system', b'1', '2017-04-18 02:02:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (686, '讷河市', 3, 670, '0452', '230281', 124.88217200, 48.48113300, 650, '黑龙江省', 670, '齐齐哈尔市', 686, '讷河市', 'system', 'system', b'1', '2017-04-18 02:02:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (687, '鸡西市', 2, 650, '0467', '230300', 130.97596600, 45.30004600, 650, '黑龙江省', 687, '鸡西市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (688, '鸡冠区', 3, 687, '0467', '230302', 130.97437400, 45.30034000, 650, '黑龙江省', 687, '鸡西市', 688, '鸡冠区', 'system', 'system', b'1', '2017-04-18 02:02:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (689, '恒山区', 3, 687, '0467', '230303', 130.91063600, 45.21324200, 650, '黑龙江省', 687, '鸡西市', 689, '恒山区', 'system', 'system', b'1', '2017-04-18 02:02:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (690, '滴道区', 3, 687, '0467', '230304', 130.84682300, 45.34881200, 650, '黑龙江省', 687, '鸡西市', 690, '滴道区', 'system', 'system', b'1', '2017-04-18 02:02:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (691, '梨树区', 3, 687, '0467', '230305', 130.69778100, 45.09219500, 650, '黑龙江省', 687, '鸡西市', 691, '梨树区', 'system', 'system', b'1', '2017-04-18 02:02:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (692, '城子河区', 3, 687, '0467', '230306', 131.01050100, 45.33824800, 650, '黑龙江省', 687, '鸡西市', 692, '城子河区', 'system', 'system', b'1', '2017-04-18 02:02:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (693, '麻山区', 3, 687, '0467', '230307', 130.48112600, 45.20960700, 650, '黑龙江省', 687, '鸡西市', 693, '麻山区', 'system', 'system', b'1', '2017-04-18 02:02:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (694, '鸡东县', 3, 687, '0467', '230321', 131.14890700, 45.25089200, 650, '黑龙江省', 687, '鸡西市', 694, '鸡东县', 'system', 'system', b'1', '2017-04-18 02:02:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (695, '虎林市', 3, 687, '0467', '230381', 132.97388100, 45.76798500, 650, '黑龙江省', 687, '鸡西市', 695, '虎林市', 'system', 'system', b'1', '2017-04-18 02:02:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (696, '密山市', 3, 687, '0467', '230382', 131.87413700, 45.54725000, 650, '黑龙江省', 687, '鸡西市', 696, '密山市', 'system', 'system', b'1', '2017-04-18 02:02:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (697, '鹤岗市', 2, 650, '0468', '230400', 130.27748700, 47.33208500, 650, '黑龙江省', 697, '鹤岗市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (698, '向阳区', 3, 697, '0468', '230402', 130.29247800, 47.34537200, 650, '黑龙江省', 697, '鹤岗市', 698, '向阳区', 'system', 'system', b'1', '2017-04-18 02:02:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (699, '工农区', 3, 697, '0468', '230403', 130.27665200, 47.33167800, 650, '黑龙江省', 697, '鹤岗市', 699, '工农区', 'system', 'system', b'1', '2017-04-18 02:02:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (700, '南山区', 3, 697, '0468', '230404', 130.27553300, 47.31324000, 650, '黑龙江省', 697, '鹤岗市', 700, '南山区', 'system', 'system', b'1', '2017-04-18 02:02:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (701, '兴安区', 3, 697, '0468', '230405', 130.23616900, 47.25291100, 650, '黑龙江省', 697, '鹤岗市', 701, '兴安区', 'system', 'system', b'1', '2017-04-18 02:02:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (702, '东山区', 3, 697, '0468', '230406', 130.31714000, 47.33738500, 650, '黑龙江省', 697, '鹤岗市', 702, '东山区', 'system', 'system', b'1', '2017-04-18 02:02:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (703, '兴山区', 3, 697, '0468', '230407', 130.30534000, 47.35997000, 650, '黑龙江省', 697, '鹤岗市', 703, '兴山区', 'system', 'system', b'1', '2017-04-18 02:02:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (704, '萝北县', 3, 697, '0468', '230421', 130.82908700, 47.57757700, 650, '黑龙江省', 697, '鹤岗市', 704, '萝北县', 'system', 'system', b'1', '2017-04-18 02:02:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (705, '绥滨县', 3, 697, '0468', '230422', 131.86052600, 47.28989200, 650, '黑龙江省', 697, '鹤岗市', 705, '绥滨县', 'system', 'system', b'1', '2017-04-18 02:02:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (706, '双鸭山市', 2, 650, '0469', '230500', 131.15730400, 46.64344200, 650, '黑龙江省', 706, '双鸭山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (707, '尖山区', 3, 706, '0469', '230502', 131.15896000, 46.64296100, 650, '黑龙江省', 706, '双鸭山市', 707, '尖山区', 'system', 'system', b'1', '2017-04-18 02:02:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (708, '岭东区', 3, 706, '0469', '230503', 131.16367500, 46.59107600, 650, '黑龙江省', 706, '双鸭山市', 708, '岭东区', 'system', 'system', b'1', '2017-04-18 02:02:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (709, '四方台区', 3, 706, '0469', '230505', 131.33318100, 46.59434700, 650, '黑龙江省', 706, '双鸭山市', 709, '四方台区', 'system', 'system', b'1', '2017-04-18 02:02:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (710, '宝山区', 3, 706, '0469', '230506', 131.40429400, 46.57336600, 650, '黑龙江省', 706, '双鸭山市', 710, '宝山区', 'system', 'system', b'1', '2017-04-18 02:02:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (711, '集贤县', 3, 706, '0469', '230521', 131.13933000, 46.72898000, 650, '黑龙江省', 706, '双鸭山市', 711, '集贤县', 'system', 'system', b'1', '2017-04-18 02:02:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (712, '友谊县', 3, 706, '0469', '230522', 131.81062200, 46.77515900, 650, '黑龙江省', 706, '双鸭山市', 712, '友谊县', 'system', 'system', b'1', '2017-04-18 02:02:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (713, '宝清县', 3, 706, '0469', '230523', 132.20641500, 46.32878100, 650, '黑龙江省', 706, '双鸭山市', 713, '宝清县', 'system', 'system', b'1', '2017-04-18 02:02:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (714, '饶河县', 3, 706, '0469', '230524', 134.02116200, 46.80128800, 650, '黑龙江省', 706, '双鸭山市', 714, '饶河县', 'system', 'system', b'1', '2017-04-18 02:02:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (715, '大庆市', 2, 650, '0459', '230600', 125.11272000, 46.59073400, 650, '黑龙江省', 715, '大庆市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (716, '萨尔图区', 3, 715, '0459', '230602', 125.11464300, 46.59635600, 650, '黑龙江省', 715, '大庆市', 716, '萨尔图区', 'system', 'system', b'1', '2017-04-18 02:02:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (717, '龙凤区', 3, 715, '0459', '230603', 125.14579400, 46.57394800, 650, '黑龙江省', 715, '大庆市', 717, '龙凤区', 'system', 'system', b'1', '2017-04-18 02:02:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (718, '让胡路区', 3, 715, '0459', '230604', 124.86834100, 46.65325400, 650, '黑龙江省', 715, '大庆市', 718, '让胡路区', 'system', 'system', b'1', '2017-04-18 02:02:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (719, '红岗区', 3, 715, '0459', '230605', 124.88952800, 46.40304900, 650, '黑龙江省', 715, '大庆市', 719, '红岗区', 'system', 'system', b'1', '2017-04-18 02:02:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (720, '大同区', 3, 715, '0459', '230606', 124.81850900, 46.03430400, 650, '黑龙江省', 715, '大庆市', 720, '大同区', 'system', 'system', b'1', '2017-04-18 02:02:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (721, '肇州县', 3, 715, '0459', '230621', 125.27325400, 45.70868500, 650, '黑龙江省', 715, '大庆市', 721, '肇州县', 'system', 'system', b'1', '2017-04-18 02:02:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (722, '肇源县', 3, 715, '0459', '230622', 125.08197400, 45.51883200, 650, '黑龙江省', 715, '大庆市', 722, '肇源县', 'system', 'system', b'1', '2017-04-18 02:02:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (723, '林甸县', 3, 715, '0459', '230623', 124.87774200, 47.18641100, 650, '黑龙江省', 715, '大庆市', 723, '林甸县', 'system', 'system', b'1', '2017-04-18 02:02:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (724, '杜尔伯特蒙古族自治县', 3, 715, '0459', '230624', 124.44625900, 46.86597300, 650, '黑龙江省', 715, '大庆市', 724, '杜尔伯特蒙古族自治县', 'system', 'system', b'1', '2017-04-18 02:02:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (725, '伊春市', 2, 650, '0458', '230700', 128.89939600, 47.72477500, 650, '黑龙江省', 725, '伊春市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (726, '伊春区', 3, 725, '0458', '230702', 128.89928400, 47.72685100, 650, '黑龙江省', 725, '伊春市', 726, '伊春区', 'system', 'system', b'1', '2017-04-18 02:02:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (727, '南岔区', 3, 725, '0458', '230703', 129.28246000, 47.13731400, 650, '黑龙江省', 725, '伊春市', 727, '南岔区', 'system', 'system', b'1', '2017-04-18 02:02:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (728, '友好区', 3, 725, '0458', '230704', 128.83896100, 47.85430300, 650, '黑龙江省', 725, '伊春市', 728, '友好区', 'system', 'system', b'1', '2017-04-18 02:02:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (729, '西林区', 3, 725, '0458', '230705', 129.31144100, 47.47943700, 650, '黑龙江省', 725, '伊春市', 729, '西林区', 'system', 'system', b'1', '2017-04-18 02:02:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (730, '翠峦区', 3, 725, '0458', '230706', 128.67174600, 47.72622800, 650, '黑龙江省', 725, '伊春市', 730, '翠峦区', 'system', 'system', b'1', '2017-04-18 02:02:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (731, '新青区', 3, 725, '0458', '230707', 129.52995000, 48.28829200, 650, '黑龙江省', 725, '伊春市', 731, '新青区', 'system', 'system', b'1', '2017-04-18 02:02:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (732, '美溪区', 3, 725, '0458', '230708', 129.13341100, 47.63610200, 650, '黑龙江省', 725, '伊春市', 732, '美溪区', 'system', 'system', b'1', '2017-04-18 02:02:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (733, '金山屯区', 3, 725, '0458', '230709', 129.43594400, 47.41295000, 650, '黑龙江省', 725, '伊春市', 733, '金山屯区', 'system', 'system', b'1', '2017-04-18 02:02:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (734, '五营区', 3, 725, '0458', '230710', 129.24502800, 48.10820400, 650, '黑龙江省', 725, '伊春市', 734, '五营区', 'system', 'system', b'1', '2017-04-18 02:02:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (735, '乌马河区', 3, 725, '0458', '230711', 128.80294100, 47.72696100, 650, '黑龙江省', 725, '伊春市', 735, '乌马河区', 'system', 'system', b'1', '2017-04-18 02:02:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (736, '汤旺河区', 3, 725, '0458', '230712', 129.57224000, 48.45365100, 650, '黑龙江省', 725, '伊春市', 736, '汤旺河区', 'system', 'system', b'1', '2017-04-18 02:02:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (737, '带岭区', 3, 725, '0458', '230713', 129.02115100, 47.02753200, 650, '黑龙江省', 725, '伊春市', 737, '带岭区', 'system', 'system', b'1', '2017-04-18 02:02:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (738, '乌伊岭区', 3, 725, '0458', '230714', 129.43784700, 48.59112000, 650, '黑龙江省', 725, '伊春市', 738, '乌伊岭区', 'system', 'system', b'1', '2017-04-18 02:02:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (739, '红星区', 3, 725, '0458', '230715', 129.38879600, 48.23836800, 650, '黑龙江省', 725, '伊春市', 739, '红星区', 'system', 'system', b'1', '2017-04-18 02:02:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (740, '上甘岭区', 3, 725, '0458', '230716', 129.02508000, 47.97485900, 650, '黑龙江省', 725, '伊春市', 740, '上甘岭区', 'system', 'system', b'1', '2017-04-18 02:02:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (741, '嘉荫县', 3, 725, '0458', '230722', 130.39768400, 48.89137800, 650, '黑龙江省', 725, '伊春市', 741, '嘉荫县', 'system', 'system', b'1', '2017-04-18 02:02:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (742, '铁力市', 3, 725, '0458', '230781', 128.03056100, 46.98577200, 650, '黑龙江省', 725, '伊春市', 742, '铁力市', 'system', 'system', b'1', '2017-04-18 02:02:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (743, '佳木斯市', 2, 650, '0454', '230800', 130.36163400, 46.80960600, 650, '黑龙江省', 743, '佳木斯市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (744, '向阳区', 3, 743, '0454', '230803', 130.36178600, 46.80964500, 650, '黑龙江省', 743, '佳木斯市', 744, '向阳区', 'system', 'system', b'1', '2017-04-18 02:02:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (745, '前进区', 3, 743, '0454', '230804', 130.37768400, 46.81234500, 650, '黑龙江省', 743, '佳木斯市', 745, '前进区', 'system', 'system', b'1', '2017-04-18 02:02:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (746, '东风区', 3, 743, '0454', '230805', 130.40329700, 46.82247600, 650, '黑龙江省', 743, '佳木斯市', 746, '东风区', 'system', 'system', b'1', '2017-04-18 02:02:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (747, '郊区', 3, 743, '0454', '230811', 130.35158800, 46.80712000, 650, '黑龙江省', 743, '佳木斯市', 747, '郊区', 'system', 'system', b'1', '2017-04-18 02:02:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (748, '桦南县', 3, 743, '0454', '230822', 130.57011200, 46.24011800, 650, '黑龙江省', 743, '佳木斯市', 748, '桦南县', 'system', 'system', b'1', '2017-04-18 02:02:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (749, '桦川县', 3, 743, '0454', '230826', 130.72371300, 47.02303900, 650, '黑龙江省', 743, '佳木斯市', 749, '桦川县', 'system', 'system', b'1', '2017-04-18 02:02:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (750, '汤原县', 3, 743, '0454', '230828', 129.90446300, 46.73004800, 650, '黑龙江省', 743, '佳木斯市', 750, '汤原县', 'system', 'system', b'1', '2017-04-18 02:02:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (751, '抚远市', 3, 743, '0454', '230883', 134.29450100, 48.36470700, 650, '黑龙江省', 743, '佳木斯市', 751, '抚远市', 'system', 'system', b'1', '2017-04-18 02:02:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (752, '同江市', 3, 743, '0454', '230881', 132.51011900, 47.65113100, 650, '黑龙江省', 743, '佳木斯市', 752, '同江市', 'system', 'system', b'1', '2017-04-18 02:02:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (753, '富锦市', 3, 743, '0454', '230882', 132.03795100, 47.25074700, 650, '黑龙江省', 743, '佳木斯市', 753, '富锦市', 'system', 'system', b'1', '2017-04-18 02:02:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (754, '七台河市', 2, 650, '0464', '230900', 131.01558400, 45.77126600, 650, '黑龙江省', 754, '七台河市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (755, '新兴区', 3, 754, '0464', '230902', 130.88948200, 45.79425800, 650, '黑龙江省', 754, '七台河市', 755, '新兴区', 'system', 'system', b'1', '2017-04-18 02:02:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (756, '桃山区', 3, 754, '0464', '230903', 131.01584800, 45.77121700, 650, '黑龙江省', 754, '七台河市', 756, '桃山区', 'system', 'system', b'1', '2017-04-18 02:02:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (757, '茄子河区', 3, 754, '0464', '230904', 131.07156100, 45.77658700, 650, '黑龙江省', 754, '七台河市', 757, '茄子河区', 'system', 'system', b'1', '2017-04-18 02:02:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (758, '勃利县', 3, 754, '0464', '230921', 130.57502500, 45.75157300, 650, '黑龙江省', 754, '七台河市', 758, '勃利县', 'system', 'system', b'1', '2017-04-18 02:02:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (759, '牡丹江市', 2, 650, '0453', '231000', 129.61860200, 44.58296200, 650, '黑龙江省', 759, '牡丹江市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (760, '东安区', 3, 759, '0453', '231002', 129.62329200, 44.58239900, 650, '黑龙江省', 759, '牡丹江市', 760, '东安区', 'system', 'system', b'1', '2017-04-18 02:02:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (761, '阳明区', 3, 759, '0453', '231003', 129.63464500, 44.59632800, 650, '黑龙江省', 759, '牡丹江市', 761, '阳明区', 'system', 'system', b'1', '2017-04-18 02:02:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (762, '爱民区', 3, 759, '0453', '231004', 129.60123200, 44.59544300, 650, '黑龙江省', 759, '牡丹江市', 762, '爱民区', 'system', 'system', b'1', '2017-04-18 02:02:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (763, '西安区', 3, 759, '0453', '231005', 129.61311000, 44.58103200, 650, '黑龙江省', 759, '牡丹江市', 763, '西安区', 'system', 'system', b'1', '2017-04-18 02:02:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (764, '东宁市', 3, 759, '0453', '231086', 131.12529600, 44.06357800, 650, '黑龙江省', 759, '牡丹江市', 764, '东宁市', 'system', 'system', b'1', '2017-04-18 02:02:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (765, '林口县', 3, 759, '0453', '231025', 130.26840200, 45.28664500, 650, '黑龙江省', 759, '牡丹江市', 765, '林口县', 'system', 'system', b'1', '2017-04-18 02:02:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (766, '绥芬河市', 3, 759, '0453', '231081', 131.16485600, 44.39686400, 650, '黑龙江省', 759, '牡丹江市', 766, '绥芬河市', 'system', 'system', b'1', '2017-04-18 02:02:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (767, '海林市', 3, 759, '0453', '231083', 129.38790200, 44.57414900, 650, '黑龙江省', 759, '牡丹江市', 767, '海林市', 'system', 'system', b'1', '2017-04-18 02:02:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (768, '宁安市', 3, 759, '0453', '231084', 129.47001900, 44.34683600, 650, '黑龙江省', 759, '牡丹江市', 768, '宁安市', 'system', 'system', b'1', '2017-04-18 02:02:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (769, '穆棱市', 3, 759, '0453', '231085', 130.52708500, 44.91967000, 650, '黑龙江省', 759, '牡丹江市', 769, '穆棱市', 'system', 'system', b'1', '2017-04-18 02:02:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (770, '黑河市', 2, 650, '0456', '231100', 127.49902300, 50.24958500, 650, '黑龙江省', 770, '黑河市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (771, '爱辉区', 3, 770, '0456', '231102', 127.49763900, 50.24902700, 650, '黑龙江省', 770, '黑河市', 771, '爱辉区', 'system', 'system', b'1', '2017-04-18 02:02:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (772, '嫩江县', 3, 770, '0456', '231121', 125.22990400, 49.17746100, 650, '黑龙江省', 770, '黑河市', 772, '嫩江县', 'system', 'system', b'1', '2017-04-18 02:02:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (773, '逊克县', 3, 770, '0456', '231123', 128.47615200, 49.58297400, 650, '黑龙江省', 770, '黑河市', 773, '逊克县', 'system', 'system', b'1', '2017-04-18 02:02:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (774, '孙吴县', 3, 770, '0456', '231124', 127.32731500, 49.42394100, 650, '黑龙江省', 770, '黑河市', 774, '孙吴县', 'system', 'system', b'1', '2017-04-18 02:02:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (775, '北安市', 3, 770, '0456', '231181', 126.50873700, 48.24543700, 650, '黑龙江省', 770, '黑河市', 775, '北安市', 'system', 'system', b'1', '2017-04-18 02:02:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (776, '五大连池市', 3, 770, '0456', '231182', 126.19769400, 48.51268800, 650, '黑龙江省', 770, '黑河市', 776, '五大连池市', 'system', 'system', b'1', '2017-04-18 02:02:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (777, '绥化市', 2, 650, '0455', '231200', 126.99293000, 46.63739300, 650, '黑龙江省', 777, '绥化市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (778, '北林区', 3, 777, '0455', '231202', 126.99066500, 46.63491200, 650, '黑龙江省', 777, '绥化市', 778, '北林区', 'system', 'system', b'1', '2017-04-18 02:02:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (779, '望奎县', 3, 777, '0455', '231221', 126.48419100, 46.83352000, 650, '黑龙江省', 777, '绥化市', 779, '望奎县', 'system', 'system', b'1', '2017-04-18 02:02:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (780, '兰西县', 3, 777, '0455', '231222', 126.28931500, 46.25903700, 650, '黑龙江省', 777, '绥化市', 780, '兰西县', 'system', 'system', b'1', '2017-04-18 02:02:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (781, '青冈县', 3, 777, '0455', '231223', 126.11226800, 46.68659600, 650, '黑龙江省', 777, '绥化市', 781, '青冈县', 'system', 'system', b'1', '2017-04-18 02:02:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (782, '庆安县', 3, 777, '0455', '231224', 127.51002400, 46.87920300, 650, '黑龙江省', 777, '绥化市', 782, '庆安县', 'system', 'system', b'1', '2017-04-18 02:02:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (783, '明水县', 3, 777, '0455', '231225', 125.90754400, 47.18352700, 650, '黑龙江省', 777, '绥化市', 783, '明水县', 'system', 'system', b'1', '2017-04-18 02:02:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (784, '绥棱县', 3, 777, '0455', '231226', 127.11112100, 47.24719500, 650, '黑龙江省', 777, '绥化市', 784, '绥棱县', 'system', 'system', b'1', '2017-04-18 02:02:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (785, '安达市', 3, 777, '0455', '231281', 125.32992600, 46.41061400, 650, '黑龙江省', 777, '绥化市', 785, '安达市', 'system', 'system', b'1', '2017-04-18 02:02:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (786, '肇东市', 3, 777, '0455', '231282', 125.99140200, 46.06947100, 650, '黑龙江省', 777, '绥化市', 786, '肇东市', 'system', 'system', b'1', '2017-04-18 02:02:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (787, '海伦市', 3, 777, '0455', '231283', 126.96938300, 47.46042800, 650, '黑龙江省', 777, '绥化市', 787, '海伦市', 'system', 'system', b'1', '2017-04-18 02:02:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (788, '大兴安岭地区', 2, 650, '0457', '232700', 124.71152600, 52.33526200, 650, '黑龙江省', 788, '大兴安岭地区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (789, '加格达奇区', 3, 788, '0457', '232701', 124.12671600, 50.42465400, 650, '黑龙江省', 788, '大兴安岭地区', 789, '加格达奇区', 'system', 'system', b'1', '2017-04-18 02:02:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (790, '呼玛县', 3, 788, '0457', '232721', 126.66210500, 51.72699800, 650, '黑龙江省', 788, '大兴安岭地区', 790, '呼玛县', 'system', 'system', b'1', '2017-04-18 02:02:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (791, '塔河县', 3, 788, '0457', '232722', 124.71051600, 52.33522900, 650, '黑龙江省', 788, '大兴安岭地区', 791, '塔河县', 'system', 'system', b'1', '2017-04-18 02:02:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (792, '漠河县', 3, 788, '0457', '232723', 122.53625600, 52.97207400, 650, '黑龙江省', 788, '大兴安岭地区', 792, '漠河县', 'system', 'system', b'1', '2017-04-18 02:02:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (793, '上海市', 1, 1, '021', '310000', 121.47264400, 31.23170600, 793, '上海市', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (794, '上海市市辖区', 2, 793, '021', '310100', 121.47264400, 31.23170600, 793, '上海市', 794, '上海市市辖区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (795, '黄浦区', 3, 794, '021', '310101', 121.49031700, 31.22277100, 793, '上海市', 794, '上海市市辖区', 795, '黄浦区', 'system', 'system', b'1', '2017-04-18 02:02:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (796, '徐汇区', 3, 794, '021', '310104', 121.43752000, 31.17997300, 793, '上海市', 794, '上海市市辖区', 796, '徐汇区', 'system', 'system', b'1', '2017-04-18 02:02:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (797, '长宁区', 3, 794, '021', '310105', 121.42220000, 31.21812300, 793, '上海市', 794, '上海市市辖区', 797, '长宁区', 'system', 'system', b'1', '2017-04-18 02:02:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (798, '静安区', 3, 794, '021', '310106', 121.44822400, 31.22900300, 793, '上海市', 794, '上海市市辖区', 798, '静安区', 'system', 'system', b'1', '2017-04-18 02:02:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (799, '普陀区', 3, 794, '021', '310107', 121.39249900, 31.24170100, 793, '上海市', 794, '上海市市辖区', 799, '普陀区', 'system', 'system', b'1', '2017-04-18 02:02:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (800, '虹口区', 3, 794, '021', '310109', 121.49183200, 31.26097000, 793, '上海市', 794, '上海市市辖区', 800, '虹口区', 'system', 'system', b'1', '2017-04-18 02:02:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (801, '杨浦区', 3, 794, '021', '310110', 121.52279700, 31.27075500, 793, '上海市', 794, '上海市市辖区', 801, '杨浦区', 'system', 'system', b'1', '2017-04-18 02:02:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (802, '闵行区', 3, 794, '021', '310112', 121.37597200, 31.11165800, 793, '上海市', 794, '上海市市辖区', 802, '闵行区', 'system', 'system', b'1', '2017-04-18 02:02:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (803, '宝山区', 3, 794, '021', '310113', 121.48993400, 31.39889600, 793, '上海市', 794, '上海市市辖区', 803, '宝山区', 'system', 'system', b'1', '2017-04-18 02:02:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (804, '嘉定区', 3, 794, '021', '310114', 121.25033300, 31.38352400, 793, '上海市', 794, '上海市市辖区', 804, '嘉定区', 'system', 'system', b'1', '2017-04-18 02:02:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (805, '浦东新区', 3, 794, '021', '310115', 121.56770600, 31.24594400, 793, '上海市', 794, '上海市市辖区', 805, '浦东新区', 'system', 'system', b'1', '2017-04-18 02:02:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (806, '金山区', 3, 794, '021', '310116', 121.33073600, 30.72469700, 793, '上海市', 794, '上海市市辖区', 806, '金山区', 'system', 'system', b'1', '2017-04-18 02:02:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (807, '松江区', 3, 794, '021', '310117', 121.22354300, 31.03047000, 793, '上海市', 794, '上海市市辖区', 807, '松江区', 'system', 'system', b'1', '2017-04-18 02:02:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (808, '青浦区', 3, 794, '021', '310118', 121.11302100, 31.15120900, 793, '上海市', 794, '上海市市辖区', 808, '青浦区', 'system', 'system', b'1', '2017-04-18 02:02:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (809, '奉贤区', 3, 794, '021', '310120', 121.45847200, 30.91234500, 793, '上海市', 794, '上海市市辖区', 809, '奉贤区', 'system', 'system', b'1', '2017-04-18 02:02:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (810, '崇明区', 3, 794, '021', '310151', 121.39751600, 31.62694600, 793, '上海市', 794, '上海市市辖区', 810, '崇明区', 'system', 'system', b'1', '2017-04-18 02:02:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (811, '江苏省', 1, 1, NULL, '320000', 118.76741300, 32.04154400, 811, '江苏省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (812, '南京市', 2, 811, '025', '320100', 118.76741300, 32.04154400, 811, '江苏省', 812, '南京市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (813, '玄武区', 3, 812, '025', '320102', 118.79219900, 32.05067800, 811, '江苏省', 812, '南京市', 813, '玄武区', 'system', 'system', b'1', '2017-04-18 02:02:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (814, '秦淮区', 3, 812, '025', '320104', 118.78608800, 32.03381800, 811, '江苏省', 812, '南京市', 814, '秦淮区', 'system', 'system', b'1', '2017-04-18 02:02:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (815, '建邺区', 3, 812, '025', '320105', 118.73268800, 32.00453800, 811, '江苏省', 812, '南京市', 815, '建邺区', 'system', 'system', b'1', '2017-04-18 02:02:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (816, '鼓楼区', 3, 812, '025', '320106', 118.76973900, 32.06696600, 811, '江苏省', 812, '南京市', 816, '鼓楼区', 'system', 'system', b'1', '2017-04-18 02:02:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (817, '浦口区', 3, 812, '025', '320111', 118.62530700, 32.05839000, 811, '江苏省', 812, '南京市', 817, '浦口区', 'system', 'system', b'1', '2017-04-18 02:02:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (818, '栖霞区', 3, 812, '025', '320113', 118.80870200, 32.10214700, 811, '江苏省', 812, '南京市', 818, '栖霞区', 'system', 'system', b'1', '2017-04-18 02:02:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (819, '雨花台区', 3, 812, '025', '320114', 118.77207000, 31.99594600, 811, '江苏省', 812, '南京市', 819, '雨花台区', 'system', 'system', b'1', '2017-04-18 02:02:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (820, '江宁区', 3, 812, '025', '320115', 118.85062100, 31.95341800, 811, '江苏省', 812, '南京市', 820, '江宁区', 'system', 'system', b'1', '2017-04-18 02:02:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (821, '六合区', 3, 812, '025', '320116', 118.85065000, 32.34065500, 811, '江苏省', 812, '南京市', 821, '六合区', 'system', 'system', b'1', '2017-04-18 02:02:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (822, '溧水区', 3, 812, '025', '320117', 119.02873200, 31.65306100, 811, '江苏省', 812, '南京市', 822, '溧水区', 'system', 'system', b'1', '2017-04-18 02:02:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (823, '高淳区', 3, 812, '025', '320118', 118.87589000, 31.32713200, 811, '江苏省', 812, '南京市', 823, '高淳区', 'system', 'system', b'1', '2017-04-18 02:02:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (824, '无锡市', 2, 811, '0510', '320200', 120.30166300, 31.57472900, 811, '江苏省', 824, '无锡市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (825, '梁溪区', 3, 824, '0510', '320213', 120.29659500, 31.57570600, 811, '江苏省', 824, '无锡市', 825, '梁溪区', 'system', 'system', b'1', '2017-04-18 02:02:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (826, '新吴区', 3, 824, '0510', '320214', 120.35278200, 31.55096600, 811, '江苏省', 824, '无锡市', 826, '新吴区', 'system', 'system', b'1', '2017-04-18 02:02:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (827, '锡山区', 3, 824, '0510', '320205', 120.35729800, 31.58555900, 811, '江苏省', 824, '无锡市', 827, '锡山区', 'system', 'system', b'1', '2017-04-18 02:02:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (828, '惠山区', 3, 824, '0510', '320206', 120.30354300, 31.68101900, 811, '江苏省', 824, '无锡市', 828, '惠山区', 'system', 'system', b'1', '2017-04-18 02:02:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (829, '滨湖区', 3, 824, '0510', '320211', 120.26605300, 31.55022800, 811, '江苏省', 824, '无锡市', 829, '滨湖区', 'system', 'system', b'1', '2017-04-18 02:02:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (830, '江阴市', 3, 824, '0510', '320281', 120.27589100, 31.91098400, 811, '江苏省', 824, '无锡市', 830, '江阴市', 'system', 'system', b'1', '2017-04-18 02:02:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (831, '宜兴市', 3, 824, '0510', '320282', 119.82053800, 31.36438400, 811, '江苏省', 824, '无锡市', 831, '宜兴市', 'system', 'system', b'1', '2017-04-18 02:02:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (832, '徐州市', 2, 811, '0516', '320300', 117.18481100, 34.26179200, 811, '江苏省', 832, '徐州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (833, '鼓楼区', 3, 832, '0516', '320302', 117.19294100, 34.26939700, 811, '江苏省', 832, '徐州市', 833, '鼓楼区', 'system', 'system', b'1', '2017-04-18 02:02:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (834, '云龙区', 3, 832, '0516', '320303', 117.19458900, 34.25480500, 811, '江苏省', 832, '徐州市', 834, '云龙区', 'system', 'system', b'1', '2017-04-18 02:02:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (835, '贾汪区', 3, 832, '0516', '320305', 117.45021200, 34.44164200, 811, '江苏省', 832, '徐州市', 835, '贾汪区', 'system', 'system', b'1', '2017-04-18 02:02:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (836, '泉山区', 3, 832, '0516', '320311', 117.18222500, 34.26224900, 811, '江苏省', 832, '徐州市', 836, '泉山区', 'system', 'system', b'1', '2017-04-18 02:02:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (837, '铜山区', 3, 832, '0516', '320312', 117.18389400, 34.19288000, 811, '江苏省', 832, '徐州市', 837, '铜山区', 'system', 'system', b'1', '2017-04-18 02:02:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (838, '丰县', 3, 832, '0516', '320321', 116.59288800, 34.69694600, 811, '江苏省', 832, '徐州市', 838, '丰县', 'system', 'system', b'1', '2017-04-18 02:02:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (839, '沛县', 3, 832, '0516', '320322', 116.93718200, 34.72904400, 811, '江苏省', 832, '徐州市', 839, '沛县', 'system', 'system', b'1', '2017-04-18 02:02:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (840, '睢宁县', 3, 832, '0516', '320324', 117.95066000, 33.89922200, 811, '江苏省', 832, '徐州市', 840, '睢宁县', 'system', 'system', b'1', '2017-04-18 02:02:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (841, '新沂市', 3, 832, '0516', '320381', 118.34582800, 34.36877900, 811, '江苏省', 832, '徐州市', 841, '新沂市', 'system', 'system', b'1', '2017-04-18 02:02:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (842, '邳州市', 3, 832, '0516', '320382', 117.96392300, 34.31470800, 811, '江苏省', 832, '徐州市', 842, '邳州市', 'system', 'system', b'1', '2017-04-18 02:02:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (843, '常州市', 2, 811, '0519', '320400', 119.94697300, 31.77275200, 811, '江苏省', 843, '常州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (844, '天宁区', 3, 843, '0519', '320402', 119.96378300, 31.77963200, 811, '江苏省', 843, '常州市', 844, '天宁区', 'system', 'system', b'1', '2017-04-18 02:02:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (845, '钟楼区', 3, 843, '0519', '320404', 119.94838800, 31.78096000, 811, '江苏省', 843, '常州市', 845, '钟楼区', 'system', 'system', b'1', '2017-04-18 02:02:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (846, '新北区', 3, 843, '0519', '320411', 119.97465400, 31.82466400, 811, '江苏省', 843, '常州市', 846, '新北区', 'system', 'system', b'1', '2017-04-18 02:02:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (847, '武进区', 3, 843, '0519', '320412', 119.95877300, 31.71856600, 811, '江苏省', 843, '常州市', 847, '武进区', 'system', 'system', b'1', '2017-04-18 02:02:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (848, '溧阳市', 3, 843, '0519', '320481', 119.48781600, 31.42708100, 811, '江苏省', 843, '常州市', 848, '溧阳市', 'system', 'system', b'1', '2017-04-18 02:02:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (849, '金坛区', 3, 843, '0519', '320413', 119.57339500, 31.74439900, 811, '江苏省', 843, '常州市', 849, '金坛区', 'system', 'system', b'1', '2017-04-18 02:02:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (850, '苏州市', 2, 811, '0512', '320500', 120.61958500, 31.29937900, 811, '江苏省', 850, '苏州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (851, '虎丘区', 3, 850, '0512', '320505', 120.56683300, 31.29484500, 811, '江苏省', 850, '苏州市', 851, '虎丘区', 'system', 'system', b'1', '2017-04-18 02:02:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (852, '吴中区', 3, 850, '0512', '320506', 120.62462100, 31.27083900, 811, '江苏省', 850, '苏州市', 852, '吴中区', 'system', 'system', b'1', '2017-04-18 02:02:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (853, '相城区', 3, 850, '0512', '320507', 120.61895600, 31.39668400, 811, '江苏省', 850, '苏州市', 853, '相城区', 'system', 'system', b'1', '2017-04-18 02:02:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (854, '姑苏区', 3, 850, '0512', '320508', 120.62224900, 31.31141400, 811, '江苏省', 850, '苏州市', 854, '姑苏区', 'system', 'system', b'1', '2017-04-18 02:02:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (855, '吴江区', 3, 850, '0512', '320509', 120.64160100, 31.16040400, 811, '江苏省', 850, '苏州市', 855, '吴江区', 'system', 'system', b'1', '2017-04-18 02:02:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (856, '常熟市', 3, 850, '0512', '320581', 120.74852000, 31.65815600, 811, '江苏省', 850, '苏州市', 856, '常熟市', 'system', 'system', b'1', '2017-04-18 02:02:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (857, '张家港市', 3, 850, '0512', '320582', 120.54344100, 31.86555300, 811, '江苏省', 850, '苏州市', 857, '张家港市', 'system', 'system', b'1', '2017-04-18 02:02:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (858, '昆山市', 3, 850, '0512', '320583', 120.95813700, 31.38192500, 811, '江苏省', 850, '苏州市', 858, '昆山市', 'system', 'system', b'1', '2017-04-18 02:02:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (859, '太仓市', 3, 850, '0512', '320585', 121.11227500, 31.45256800, 811, '江苏省', 850, '苏州市', 859, '太仓市', 'system', 'system', b'1', '2017-04-18 02:02:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (860, '南通市', 2, 811, '0513', '320600', 120.86460800, 32.01621200, 811, '江苏省', 860, '南通市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (861, '崇川区', 3, 860, '0513', '320602', 120.86635000, 32.01527800, 811, '江苏省', 860, '南通市', 861, '崇川区', 'system', 'system', b'1', '2017-04-18 02:02:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (862, '港闸区', 3, 860, '0513', '320611', 120.83390000, 32.04029900, 811, '江苏省', 860, '南通市', 862, '港闸区', 'system', 'system', b'1', '2017-04-18 02:02:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (863, '通州区', 3, 860, '0513', '320612', 121.07317100, 32.08428700, 811, '江苏省', 860, '南通市', 863, '通州区', 'system', 'system', b'1', '2017-04-18 02:02:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (864, '海安县', 3, 860, '0513', '320621', 120.46599500, 32.54028900, 811, '江苏省', 860, '南通市', 864, '海安县', 'system', 'system', b'1', '2017-04-18 02:02:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (865, '如东县', 3, 860, '0513', '320623', 121.18608800, 32.31183200, 811, '江苏省', 860, '南通市', 865, '如东县', 'system', 'system', b'1', '2017-04-18 02:02:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (866, '启东市', 3, 860, '0513', '320681', 121.65972400, 31.81015800, 811, '江苏省', 860, '南通市', 866, '启东市', 'system', 'system', b'1', '2017-04-18 02:02:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (867, '如皋市', 3, 860, '0513', '320682', 120.56632400, 32.39159100, 811, '江苏省', 860, '南通市', 867, '如皋市', 'system', 'system', b'1', '2017-04-18 02:02:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (868, '海门市', 3, 860, '0513', '320684', 121.17660900, 31.89352800, 811, '江苏省', 860, '南通市', 868, '海门市', 'system', 'system', b'1', '2017-04-18 02:02:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (869, '连云港市', 2, 811, '0518', '320700', 119.17882100, 34.60001800, 811, '江苏省', 869, '连云港市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (870, '连云区', 3, 869, '0518', '320703', 119.36648700, 34.73952900, 811, '江苏省', 869, '连云港市', 870, '连云区', 'system', 'system', b'1', '2017-04-18 02:02:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (871, '海州区', 3, 869, '0518', '320706', 119.17979300, 34.60158400, 811, '江苏省', 869, '连云港市', 871, '海州区', 'system', 'system', b'1', '2017-04-18 02:02:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (872, '赣榆区', 3, 869, '0518', '320707', 119.12877400, 34.83915400, 811, '江苏省', 869, '连云港市', 872, '赣榆区', 'system', 'system', b'1', '2017-04-18 02:02:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (873, '东海县', 3, 869, '0518', '320722', 118.76648900, 34.52285900, 811, '江苏省', 869, '连云港市', 873, '东海县', 'system', 'system', b'1', '2017-04-18 02:02:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (874, '灌云县', 3, 869, '0518', '320723', 119.25574100, 34.29843600, 811, '江苏省', 869, '连云港市', 874, '灌云县', 'system', 'system', b'1', '2017-04-18 02:02:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (875, '灌南县', 3, 869, '0518', '320724', 119.35233100, 34.09255300, 811, '江苏省', 869, '连云港市', 875, '灌南县', 'system', 'system', b'1', '2017-04-18 02:02:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (876, '淮安市', 2, 811, '0517', '320800', 119.02126500, 33.59750600, 811, '江苏省', 876, '淮安市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (877, '清江浦区', 3, 876, '0517', '320802', 119.01945400, 33.60323400, 811, '江苏省', 876, '淮安市', 877, '清江浦区', 'system', 'system', b'1', '2017-04-18 02:02:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (878, '淮安区', 3, 876, '0517', '320803', 119.14634000, 33.50749900, 811, '江苏省', 876, '淮安市', 878, '淮安区', 'system', 'system', b'1', '2017-04-18 02:02:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (879, '淮阴区', 3, 876, '0517', '320804', 119.02081700, 33.62245200, 811, '江苏省', 876, '淮安市', 879, '淮阴区', 'system', 'system', b'1', '2017-04-18 02:02:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (880, '涟水县', 3, 876, '0517', '320826', 119.26607800, 33.77130800, 811, '江苏省', 876, '淮安市', 880, '涟水县', 'system', 'system', b'1', '2017-04-18 02:02:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (881, '洪泽区', 3, 876, '0517', '320813', 118.86787500, 33.29497500, 811, '江苏省', 876, '淮安市', 881, '洪泽区', 'system', 'system', b'1', '2017-04-18 02:02:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (882, '盱眙县', 3, 876, '0517', '320830', 118.49382300, 33.00439000, 811, '江苏省', 876, '淮安市', 882, '盱眙县', 'system', 'system', b'1', '2017-04-18 02:02:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (883, '金湖县', 3, 876, '0517', '320831', 119.01693600, 33.01816200, 811, '江苏省', 876, '淮安市', 883, '金湖县', 'system', 'system', b'1', '2017-04-18 02:02:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (884, '盐城市', 2, 811, '0515', '320900', 120.13999800, 33.37763100, 811, '江苏省', 884, '盐城市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (885, '亭湖区', 3, 884, '0515', '320902', 120.13607800, 33.38391200, 811, '江苏省', 884, '盐城市', 885, '亭湖区', 'system', 'system', b'1', '2017-04-18 02:02:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (886, '盐都区', 3, 884, '0515', '320903', 120.13975300, 33.34128800, 811, '江苏省', 884, '盐城市', 886, '盐都区', 'system', 'system', b'1', '2017-04-18 02:02:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (887, '响水县', 3, 884, '0515', '320921', 119.57957300, 34.19996000, 811, '江苏省', 884, '盐城市', 887, '响水县', 'system', 'system', b'1', '2017-04-18 02:02:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (888, '滨海县', 3, 884, '0515', '320922', 119.82843400, 33.98988800, 811, '江苏省', 884, '盐城市', 888, '滨海县', 'system', 'system', b'1', '2017-04-18 02:02:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (889, '阜宁县', 3, 884, '0515', '320923', 119.80533800, 33.78573000, 811, '江苏省', 884, '盐城市', 889, '阜宁县', 'system', 'system', b'1', '2017-04-18 02:02:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (890, '射阳县', 3, 884, '0515', '320924', 120.25744400, 33.77377900, 811, '江苏省', 884, '盐城市', 890, '射阳县', 'system', 'system', b'1', '2017-04-18 02:02:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (891, '建湖县', 3, 884, '0515', '320925', 119.79310500, 33.47262100, 811, '江苏省', 884, '盐城市', 891, '建湖县', 'system', 'system', b'1', '2017-04-18 02:02:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (892, '东台市', 3, 884, '0515', '320981', 120.31410100, 32.85317400, 811, '江苏省', 884, '盐城市', 892, '东台市', 'system', 'system', b'1', '2017-04-18 02:02:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (893, '大丰区', 3, 884, '0515', '320904', 120.47032400, 33.19953100, 811, '江苏省', 884, '盐城市', 893, '大丰区', 'system', 'system', b'1', '2017-04-18 02:02:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (894, '扬州市', 2, 811, '0514', '321000', 119.42100300, 32.39315900, 811, '江苏省', 894, '扬州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (895, '广陵区', 3, 894, '0514', '321002', 119.44226700, 32.39215400, 811, '江苏省', 894, '扬州市', 895, '广陵区', 'system', 'system', b'1', '2017-04-18 02:02:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (896, '邗江区', 3, 894, '0514', '321003', 119.39777700, 32.37789900, 811, '江苏省', 894, '扬州市', 896, '邗江区', 'system', 'system', b'1', '2017-04-18 02:02:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (897, '江都区', 3, 894, '0514', '321012', 119.56748100, 32.42656400, 811, '江苏省', 894, '扬州市', 897, '江都区', 'system', 'system', b'1', '2017-04-18 02:02:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (898, '宝应县', 3, 894, '0514', '321023', 119.32128400, 33.23694000, 811, '江苏省', 894, '扬州市', 898, '宝应县', 'system', 'system', b'1', '2017-04-18 02:02:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (899, '仪征市', 3, 894, '0514', '321081', 119.18244300, 32.27196500, 811, '江苏省', 894, '扬州市', 899, '仪征市', 'system', 'system', b'1', '2017-04-18 02:02:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (900, '高邮市', 3, 894, '0514', '321084', 119.44384200, 32.78516400, 811, '江苏省', 894, '扬州市', 900, '高邮市', 'system', 'system', b'1', '2017-04-18 02:02:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (901, '镇江市', 2, 811, '0511', '321100', 119.45275300, 32.20440200, 811, '江苏省', 901, '镇江市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (902, '京口区', 3, 901, '0511', '321102', 119.45457100, 32.20619100, 811, '江苏省', 901, '镇江市', 902, '京口区', 'system', 'system', b'1', '2017-04-18 02:02:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (903, '润州区', 3, 901, '0511', '321111', 119.41487700, 32.21350100, 811, '江苏省', 901, '镇江市', 903, '润州区', 'system', 'system', b'1', '2017-04-18 02:02:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (904, '丹徒区', 3, 901, '0511', '321112', 119.43388300, 32.12897200, 811, '江苏省', 901, '镇江市', 904, '丹徒区', 'system', 'system', b'1', '2017-04-18 02:02:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (905, '丹阳市', 3, 901, '0511', '321181', 119.58191100, 31.99145900, 811, '江苏省', 901, '镇江市', 905, '丹阳市', 'system', 'system', b'1', '2017-04-18 02:02:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (906, '扬中市', 3, 901, '0511', '321182', 119.82805400, 32.23726600, 811, '江苏省', 901, '镇江市', 906, '扬中市', 'system', 'system', b'1', '2017-04-18 02:02:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (907, '句容市', 3, 901, '0511', '321183', 119.16713500, 31.94735500, 811, '江苏省', 901, '镇江市', 907, '句容市', 'system', 'system', b'1', '2017-04-18 02:02:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (908, '泰州市', 2, 811, '0523', '321200', 119.91517600, 32.48488200, 811, '江苏省', 908, '泰州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (909, '海陵区', 3, 908, '0523', '321202', 119.92018700, 32.48840600, 811, '江苏省', 908, '泰州市', 909, '海陵区', 'system', 'system', b'1', '2017-04-18 02:02:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (910, '高港区', 3, 908, '0523', '321203', 119.88166000, 32.31570100, 811, '江苏省', 908, '泰州市', 910, '高港区', 'system', 'system', b'1', '2017-04-18 02:02:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (911, '姜堰区', 3, 908, '0523', '321204', 120.14820800, 32.50848300, 811, '江苏省', 908, '泰州市', 911, '姜堰区', 'system', 'system', b'1', '2017-04-18 02:02:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (912, '兴化市', 3, 908, '0523', '321281', 119.84016200, 32.93806500, 811, '江苏省', 908, '泰州市', 912, '兴化市', 'system', 'system', b'1', '2017-04-18 02:02:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (913, '靖江市', 3, 908, '0523', '321282', 120.26825000, 32.01816800, 811, '江苏省', 908, '泰州市', 913, '靖江市', 'system', 'system', b'1', '2017-04-18 02:02:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (914, '泰兴市', 3, 908, '0523', '321283', 120.02022800, 32.16878400, 811, '江苏省', 908, '泰州市', 914, '泰兴市', 'system', 'system', b'1', '2017-04-18 02:02:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (915, '宿迁市', 2, 811, '0527', '321300', 118.27516200, 33.96300800, 811, '江苏省', 915, '宿迁市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (916, '宿城区', 3, 915, '0527', '321302', 118.27898400, 33.93772600, 811, '江苏省', 915, '宿迁市', 916, '宿城区', 'system', 'system', b'1', '2017-04-18 02:02:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (917, '宿豫区', 3, 915, '0527', '321311', 118.33001200, 33.94107100, 811, '江苏省', 915, '宿迁市', 917, '宿豫区', 'system', 'system', b'1', '2017-04-18 02:02:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (918, '沭阳县', 3, 915, '0527', '321322', 118.77588900, 34.12909700, 811, '江苏省', 915, '宿迁市', 918, '沭阳县', 'system', 'system', b'1', '2017-04-18 02:02:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (919, '泗阳县', 3, 915, '0527', '321323', 118.68128400, 33.71143300, 811, '江苏省', 915, '宿迁市', 919, '泗阳县', 'system', 'system', b'1', '2017-04-18 02:02:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (920, '泗洪县', 3, 915, '0527', '321324', 118.21182400, 33.45653800, 811, '江苏省', 915, '宿迁市', 920, '泗洪县', 'system', 'system', b'1', '2017-04-18 02:02:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (921, '浙江省', 1, 1, NULL, '330000', 120.15357600, 30.28745900, 921, '浙江省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (922, '杭州市', 2, 921, '0571', '330100', 120.15357600, 30.28745900, 921, '浙江省', 922, '杭州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:02:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (923, '上城区', 3, 922, '0571', '330102', 120.17146500, 30.25023600, 921, '浙江省', 922, '杭州市', 923, '上城区', 'system', 'system', b'1', '2017-04-18 02:02:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (924, '下城区', 3, 922, '0571', '330103', 120.17276300, 30.27627100, 921, '浙江省', 922, '杭州市', 924, '下城区', 'system', 'system', b'1', '2017-04-18 02:02:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (925, '江干区', 3, 922, '0571', '330104', 120.20263300, 30.26660300, 921, '浙江省', 922, '杭州市', 925, '江干区', 'system', 'system', b'1', '2017-04-18 02:02:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (926, '拱墅区', 3, 922, '0571', '330105', 120.15005300, 30.31469700, 921, '浙江省', 922, '杭州市', 926, '拱墅区', 'system', 'system', b'1', '2017-04-18 02:02:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (927, '西湖区', 3, 922, '0571', '330106', 120.14737600, 30.27293400, 921, '浙江省', 922, '杭州市', 927, '西湖区', 'system', 'system', b'1', '2017-04-18 02:02:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (928, '滨江区', 3, 922, '0571', '330108', 120.21062000, 30.20661500, 921, '浙江省', 922, '杭州市', 928, '滨江区', 'system', 'system', b'1', '2017-04-18 02:02:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (929, '萧山区', 3, 922, '0571', '330109', 120.27069000, 30.16293200, 921, '浙江省', 922, '杭州市', 929, '萧山区', 'system', 'system', b'1', '2017-04-18 02:03:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (930, '余杭区', 3, 922, '0571', '330110', 120.30173700, 30.42118700, 921, '浙江省', 922, '杭州市', 930, '余杭区', 'system', 'system', b'1', '2017-04-18 02:03:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (931, '富阳区', 3, 922, '0571', '330111', 119.94986900, 30.04987100, 921, '浙江省', 922, '杭州市', 931, '富阳区', 'system', 'system', b'1', '2017-04-18 02:03:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (932, '桐庐县', 3, 922, '0571', '330122', 119.68504500, 29.79743700, 921, '浙江省', 922, '杭州市', 932, '桐庐县', 'system', 'system', b'1', '2017-04-18 02:03:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (933, '淳安县', 3, 922, '0571', '330127', 119.04427600, 29.60417700, 921, '浙江省', 922, '杭州市', 933, '淳安县', 'system', 'system', b'1', '2017-04-18 02:03:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (934, '建德市', 3, 922, '0571', '330182', 119.27908900, 29.47228400, 921, '浙江省', 922, '杭州市', 934, '建德市', 'system', 'system', b'1', '2017-04-18 02:03:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (935, '临安市', 3, 922, '0571', '330185', 119.71510100, 30.23115300, 921, '浙江省', 922, '杭州市', 935, '临安市', 'system', 'system', b'1', '2017-04-18 02:03:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (936, '宁波市', 2, 921, '0574', '330200', 121.54979200, 29.86838800, 921, '浙江省', 936, '宁波市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (937, '海曙区', 3, 936, '0574', '330203', 121.53969800, 29.87445200, 921, '浙江省', 936, '宁波市', 937, '海曙区', 'system', 'system', b'1', '2017-04-18 02:03:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (938, '江北区', 3, 936, '0574', '330205', 121.55928200, 29.88836100, 921, '浙江省', 936, '宁波市', 938, '江北区', 'system', 'system', b'1', '2017-04-18 02:03:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (939, '北仑区', 3, 936, '0574', '330206', 121.83130300, 29.90944000, 921, '浙江省', 936, '宁波市', 939, '北仑区', 'system', 'system', b'1', '2017-04-18 02:03:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (940, '镇海区', 3, 936, '0574', '330211', 121.71316200, 29.95210700, 921, '浙江省', 936, '宁波市', 940, '镇海区', 'system', 'system', b'1', '2017-04-18 02:03:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (941, '鄞州区', 3, 936, '0574', '330212', 121.55843600, 29.83166200, 921, '浙江省', 936, '宁波市', 941, '鄞州区', 'system', 'system', b'1', '2017-04-18 02:03:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (942, '象山县', 3, 936, '0574', '330225', 121.87709100, 29.47020600, 921, '浙江省', 936, '宁波市', 942, '象山县', 'system', 'system', b'1', '2017-04-18 02:03:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (943, '宁海县', 3, 936, '0574', '330226', 121.43260600, 29.29983600, 921, '浙江省', 936, '宁波市', 943, '宁海县', 'system', 'system', b'1', '2017-04-18 02:03:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (944, '余姚市', 3, 936, '0574', '330281', 121.15629400, 30.04540400, 921, '浙江省', 936, '宁波市', 944, '余姚市', 'system', 'system', b'1', '2017-04-18 02:03:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (945, '慈溪市', 3, 936, '0574', '330282', 121.24805200, 30.17714200, 921, '浙江省', 936, '宁波市', 945, '慈溪市', 'system', 'system', b'1', '2017-04-18 02:03:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (946, '奉化区', 3, 936, '0574', '330283', 121.41089000, 29.66234800, 921, '浙江省', 936, '宁波市', 946, '奉化区', 'system', 'system', b'1', '2017-04-18 02:03:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (947, '温州市', 2, 921, '0577', '330300', 120.67211100, 28.00057500, 921, '浙江省', 947, '温州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (948, '鹿城区', 3, 947, '0577', '330302', 120.67423100, 28.00335200, 921, '浙江省', 947, '温州市', 948, '鹿城区', 'system', 'system', b'1', '2017-04-18 02:03:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (949, '龙湾区', 3, 947, '0577', '330303', 120.76346900, 27.97025400, 921, '浙江省', 947, '温州市', 949, '龙湾区', 'system', 'system', b'1', '2017-04-18 02:03:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (950, '瓯海区', 3, 947, '0577', '330304', 120.63714500, 28.00644400, 921, '浙江省', 947, '温州市', 950, '瓯海区', 'system', 'system', b'1', '2017-04-18 02:03:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (951, '洞头区', 3, 947, '0577', '330305', 121.15618100, 27.83605700, 921, '浙江省', 947, '温州市', 951, '洞头区', 'system', 'system', b'1', '2017-04-18 02:03:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (952, '永嘉县', 3, 947, '0577', '330324', 120.69096800, 28.15388600, 921, '浙江省', 947, '温州市', 952, '永嘉县', 'system', 'system', b'1', '2017-04-18 02:03:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (953, '平阳县', 3, 947, '0577', '330326', 120.56438700, 27.66930000, 921, '浙江省', 947, '温州市', 953, '平阳县', 'system', 'system', b'1', '2017-04-18 02:03:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (954, '苍南县', 3, 947, '0577', '330327', 120.40625600, 27.50774300, 921, '浙江省', 947, '温州市', 954, '苍南县', 'system', 'system', b'1', '2017-04-18 02:03:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (955, '文成县', 3, 947, '0577', '330328', 120.09245000, 27.78913300, 921, '浙江省', 947, '温州市', 955, '文成县', 'system', 'system', b'1', '2017-04-18 02:03:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (956, '泰顺县', 3, 947, '0577', '330329', 119.71624000, 27.55730900, 921, '浙江省', 947, '温州市', 956, '泰顺县', 'system', 'system', b'1', '2017-04-18 02:03:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (957, '瑞安市', 3, 947, '0577', '330381', 120.64617100, 27.77932100, 921, '浙江省', 947, '温州市', 957, '瑞安市', 'system', 'system', b'1', '2017-04-18 02:03:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (958, '乐清市', 3, 947, '0577', '330382', 120.96714700, 28.11608300, 921, '浙江省', 947, '温州市', 958, '乐清市', 'system', 'system', b'1', '2017-04-18 02:03:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (959, '嘉兴市', 2, 921, '0573', '330400', 120.75086500, 30.76265300, 921, '浙江省', 959, '嘉兴市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (960, '南湖区', 3, 959, '0573', '330402', 120.74995300, 30.76465200, 921, '浙江省', 959, '嘉兴市', 960, '南湖区', 'system', 'system', b'1', '2017-04-18 02:03:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (961, '秀洲区', 3, 959, '0573', '330411', 120.72043100, 30.76332300, 921, '浙江省', 959, '嘉兴市', 961, '秀洲区', 'system', 'system', b'1', '2017-04-18 02:03:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (962, '嘉善县', 3, 959, '0573', '330421', 120.92187100, 30.84135200, 921, '浙江省', 959, '嘉兴市', 962, '嘉善县', 'system', 'system', b'1', '2017-04-18 02:03:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (963, '海盐县', 3, 959, '0573', '330424', 120.94201700, 30.52222300, 921, '浙江省', 959, '嘉兴市', 963, '海盐县', 'system', 'system', b'1', '2017-04-18 02:03:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (964, '海宁市', 3, 959, '0573', '330481', 120.68882100, 30.52554400, 921, '浙江省', 959, '嘉兴市', 964, '海宁市', 'system', 'system', b'1', '2017-04-18 02:03:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (965, '平湖市', 3, 959, '0573', '330482', 121.01466600, 30.69892100, 921, '浙江省', 959, '嘉兴市', 965, '平湖市', 'system', 'system', b'1', '2017-04-18 02:03:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (966, '桐乡市', 3, 959, '0573', '330483', 120.55108500, 30.62906500, 921, '浙江省', 959, '嘉兴市', 966, '桐乡市', 'system', 'system', b'1', '2017-04-18 02:03:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (967, '湖州市', 2, 921, '0572', '330500', 120.10239800, 30.86719800, 921, '浙江省', 967, '湖州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (968, '吴兴区', 3, 967, '0572', '330502', 120.10141600, 30.86725200, 921, '浙江省', 967, '湖州市', 968, '吴兴区', 'system', 'system', b'1', '2017-04-18 02:03:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (969, '南浔区', 3, 967, '0572', '330503', 120.41719500, 30.87274200, 921, '浙江省', 967, '湖州市', 969, '南浔区', 'system', 'system', b'1', '2017-04-18 02:03:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (970, '德清县', 3, 967, '0572', '330521', 119.96766200, 30.53492700, 921, '浙江省', 967, '湖州市', 970, '德清县', 'system', 'system', b'1', '2017-04-18 02:03:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (971, '长兴县', 3, 967, '0572', '330522', 119.91012200, 31.00475000, 921, '浙江省', 967, '湖州市', 971, '长兴县', 'system', 'system', b'1', '2017-04-18 02:03:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (972, '安吉县', 3, 967, '0572', '330523', 119.68789100, 30.63197400, 921, '浙江省', 967, '湖州市', 972, '安吉县', 'system', 'system', b'1', '2017-04-18 02:03:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (973, '绍兴市', 2, 921, '0575', '330600', 120.58211200, 29.99711700, 921, '浙江省', 973, '绍兴市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (974, '越城区', 3, 973, '0575', '330602', 120.58531500, 29.99699300, 921, '浙江省', 973, '绍兴市', 974, '越城区', 'system', 'system', b'1', '2017-04-18 02:03:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (975, '柯桥区', 3, 973, '0575', '330603', 120.47607500, 30.07803800, 921, '浙江省', 973, '绍兴市', 975, '柯桥区', 'system', 'system', b'1', '2017-04-18 02:03:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (976, '上虞区', 3, 973, '0575', '330604', 120.87418500, 30.01676900, 921, '浙江省', 973, '绍兴市', 976, '上虞区', 'system', 'system', b'1', '2017-04-18 02:03:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (977, '新昌县', 3, 973, '0575', '330624', 120.90566500, 29.50120500, 921, '浙江省', 973, '绍兴市', 977, '新昌县', 'system', 'system', b'1', '2017-04-18 02:03:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (978, '诸暨市', 3, 973, '0575', '330681', 120.24432600, 29.71366200, 921, '浙江省', 973, '绍兴市', 978, '诸暨市', 'system', 'system', b'1', '2017-04-18 02:03:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (979, '嵊州市', 3, 973, '0575', '330683', 120.82888000, 29.58660600, 921, '浙江省', 973, '绍兴市', 979, '嵊州市', 'system', 'system', b'1', '2017-04-18 02:03:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (980, '金华市', 2, 921, '0579', '330700', 119.64950600, 29.08952400, 921, '浙江省', 980, '金华市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (981, '婺城区', 3, 980, '0579', '330702', 119.65257900, 29.08260700, 921, '浙江省', 980, '金华市', 981, '婺城区', 'system', 'system', b'1', '2017-04-18 02:03:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (982, '金东区', 3, 980, '0579', '330703', 119.68126400, 29.09583500, 921, '浙江省', 980, '金华市', 982, '金东区', 'system', 'system', b'1', '2017-04-18 02:03:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (983, '武义县', 3, 980, '0579', '330723', 119.81915900, 28.89656300, 921, '浙江省', 980, '金华市', 983, '武义县', 'system', 'system', b'1', '2017-04-18 02:03:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (984, '浦江县', 3, 980, '0579', '330726', 119.89336300, 29.45125400, 921, '浙江省', 980, '金华市', 984, '浦江县', 'system', 'system', b'1', '2017-04-18 02:03:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (985, '磐安县', 3, 980, '0579', '330727', 120.44513000, 29.05262700, 921, '浙江省', 980, '金华市', 985, '磐安县', 'system', 'system', b'1', '2017-04-18 02:03:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (986, '兰溪市', 3, 980, '0579', '330781', 119.46052100, 29.21006500, 921, '浙江省', 980, '金华市', 986, '兰溪市', 'system', 'system', b'1', '2017-04-18 02:03:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (987, '义乌市', 3, 980, '0579', '330782', 120.07491100, 29.30686300, 921, '浙江省', 980, '金华市', 987, '义乌市', 'system', 'system', b'1', '2017-04-18 02:03:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (988, '东阳市', 3, 980, '0579', '330783', 120.23334000, 29.26254600, 921, '浙江省', 980, '金华市', 988, '东阳市', 'system', 'system', b'1', '2017-04-18 02:03:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (989, '永康市', 3, 980, '0579', '330784', 120.03632800, 28.89529300, 921, '浙江省', 980, '金华市', 989, '永康市', 'system', 'system', b'1', '2017-04-18 02:03:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (990, '衢州市', 2, 921, '0570', '330800', 118.87263000, 28.94170800, 921, '浙江省', 990, '衢州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (991, '柯城区', 3, 990, '0570', '330802', 118.87304100, 28.94453900, 921, '浙江省', 990, '衢州市', 991, '柯城区', 'system', 'system', b'1', '2017-04-18 02:03:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (992, '衢江区', 3, 990, '0570', '330803', 118.95768300, 28.97319500, 921, '浙江省', 990, '衢州市', 992, '衢江区', 'system', 'system', b'1', '2017-04-18 02:03:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (993, '常山县', 3, 990, '0570', '330822', 118.52165400, 28.90003900, 921, '浙江省', 990, '衢州市', 993, '常山县', 'system', 'system', b'1', '2017-04-18 02:03:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (994, '开化县', 3, 990, '0570', '330824', 118.41443500, 29.13650300, 921, '浙江省', 990, '衢州市', 994, '开化县', 'system', 'system', b'1', '2017-04-18 02:03:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (995, '龙游县', 3, 990, '0570', '330825', 119.17252500, 29.03136400, 921, '浙江省', 990, '衢州市', 995, '龙游县', 'system', 'system', b'1', '2017-04-18 02:03:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (996, '江山市', 3, 990, '0570', '330881', 118.62787900, 28.73467400, 921, '浙江省', 990, '衢州市', 996, '江山市', 'system', 'system', b'1', '2017-04-18 02:03:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (997, '舟山市', 2, 921, '0580', '330900', 122.10686300, 30.01602800, 921, '浙江省', 997, '舟山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (998, '定海区', 3, 997, '0580', '330902', 122.10849600, 30.01642300, 921, '浙江省', 997, '舟山市', 998, '定海区', 'system', 'system', b'1', '2017-04-18 02:03:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (999, '普陀区', 3, 997, '0580', '330903', 122.30195300, 29.94561400, 921, '浙江省', 997, '舟山市', 999, '普陀区', 'system', 'system', b'1', '2017-04-18 02:03:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1000, '岱山县', 3, 997, '0580', '330921', 122.20113200, 30.24286500, 921, '浙江省', 997, '舟山市', 1000, '岱山县', 'system', 'system', b'1', '2017-04-18 02:03:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1001, '嵊泗县', 3, 997, '0580', '330922', 122.45780900, 30.72716600, 921, '浙江省', 997, '舟山市', 1001, '嵊泗县', 'system', 'system', b'1', '2017-04-18 02:03:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1002, '台州市', 2, 921, '0576', '331000', 121.42859900, 28.66137800, 921, '浙江省', 1002, '台州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1003, '椒江区', 3, 1002, '0576', '331002', 121.43104900, 28.67615000, 921, '浙江省', 1002, '台州市', 1003, '椒江区', 'system', 'system', b'1', '2017-04-18 02:03:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1004, '黄岩区', 3, 1002, '0576', '331003', 121.26213800, 28.64488000, 921, '浙江省', 1002, '台州市', 1004, '黄岩区', 'system', 'system', b'1', '2017-04-18 02:03:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1005, '路桥区', 3, 1002, '0576', '331004', 121.37292000, 28.58179900, 921, '浙江省', 1002, '台州市', 1005, '路桥区', 'system', 'system', b'1', '2017-04-18 02:03:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1006, '玉环县', 3, 1002, '0576', '331021', 121.23233700, 28.12842000, 921, '浙江省', 1002, '台州市', 1006, '玉环县', 'system', 'system', b'1', '2017-04-18 02:03:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1007, '三门县', 3, 1002, '0576', '331022', 121.37642900, 29.11895500, 921, '浙江省', 1002, '台州市', 1007, '三门县', 'system', 'system', b'1', '2017-04-18 02:03:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1008, '天台县', 3, 1002, '0576', '331023', 121.03122700, 29.14112600, 921, '浙江省', 1002, '台州市', 1008, '天台县', 'system', 'system', b'1', '2017-04-18 02:03:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1009, '仙居县', 3, 1002, '0576', '331024', 120.73507400, 28.84921300, 921, '浙江省', 1002, '台州市', 1009, '仙居县', 'system', 'system', b'1', '2017-04-18 02:03:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1010, '温岭市', 3, 1002, '0576', '331081', 121.37361100, 28.36878100, 921, '浙江省', 1002, '台州市', 1010, '温岭市', 'system', 'system', b'1', '2017-04-18 02:03:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1011, '临海市', 3, 1002, '0576', '331082', 121.13122900, 28.84544100, 921, '浙江省', 1002, '台州市', 1011, '临海市', 'system', 'system', b'1', '2017-04-18 02:03:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1012, '丽水市', 2, 921, '0578', '331100', 119.92178600, 28.45199300, 921, '浙江省', 1012, '丽水市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1013, '莲都区', 3, 1012, '0578', '331102', 119.92229300, 28.45110300, 921, '浙江省', 1012, '丽水市', 1013, '莲都区', 'system', 'system', b'1', '2017-04-18 02:03:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1014, '青田县', 3, 1012, '0578', '331121', 120.29193900, 28.13524700, 921, '浙江省', 1012, '丽水市', 1014, '青田县', 'system', 'system', b'1', '2017-04-18 02:03:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1015, '缙云县', 3, 1012, '0578', '331122', 120.07896500, 28.65420800, 921, '浙江省', 1012, '丽水市', 1015, '缙云县', 'system', 'system', b'1', '2017-04-18 02:03:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1016, '遂昌县', 3, 1012, '0578', '331123', 119.27589000, 28.59240000, 921, '浙江省', 1012, '丽水市', 1016, '遂昌县', 'system', 'system', b'1', '2017-04-18 02:03:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1017, '松阳县', 3, 1012, '0578', '331124', 119.48529200, 28.44993700, 921, '浙江省', 1012, '丽水市', 1017, '松阳县', 'system', 'system', b'1', '2017-04-18 02:03:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1018, '云和县', 3, 1012, '0578', '331125', 119.56945800, 28.11107700, 921, '浙江省', 1012, '丽水市', 1018, '云和县', 'system', 'system', b'1', '2017-04-18 02:03:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1019, '庆元县', 3, 1012, '0578', '331126', 119.06723300, 27.61823100, 921, '浙江省', 1012, '丽水市', 1019, '庆元县', 'system', 'system', b'1', '2017-04-18 02:03:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1020, '景宁畲族自治县', 3, 1012, '0578', '331127', 119.63466900, 27.97724700, 921, '浙江省', 1012, '丽水市', 1020, '景宁畲族自治县', 'system', 'system', b'1', '2017-04-18 02:03:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1021, '龙泉市', 3, 1012, '0578', '331181', 119.13231900, 28.06917700, 921, '浙江省', 1012, '丽水市', 1021, '龙泉市', 'system', 'system', b'1', '2017-04-18 02:03:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1022, '安徽省', 1, 1, NULL, '340000', 117.28304200, 31.86119000, 1022, '安徽省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1023, '合肥市', 2, 1022, '0551', '340100', 117.28304200, 31.86119000, 1022, '安徽省', 1023, '合肥市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1024, '瑶海区', 3, 1023, '0551', '340102', 117.31535800, 31.86961000, 1022, '安徽省', 1023, '合肥市', 1024, '瑶海区', 'system', 'system', b'1', '2017-04-18 02:03:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1025, '庐阳区', 3, 1023, '0551', '340103', 117.28377600, 31.86901100, 1022, '安徽省', 1023, '合肥市', 1025, '庐阳区', 'system', 'system', b'1', '2017-04-18 02:03:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1026, '蜀山区', 3, 1023, '0551', '340104', 117.26207200, 31.85586800, 1022, '安徽省', 1023, '合肥市', 1026, '蜀山区', 'system', 'system', b'1', '2017-04-18 02:03:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1027, '包河区', 3, 1023, '0551', '340111', 117.28575100, 31.82956000, 1022, '安徽省', 1023, '合肥市', 1027, '包河区', 'system', 'system', b'1', '2017-04-18 02:03:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1028, '长丰县', 3, 1023, '0551', '340121', 117.16469900, 32.47854800, 1022, '安徽省', 1023, '合肥市', 1028, '长丰县', 'system', 'system', b'1', '2017-04-18 02:03:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1029, '肥东县', 3, 1023, '0551', '340122', 117.46322200, 31.88399200, 1022, '安徽省', 1023, '合肥市', 1029, '肥东县', 'system', 'system', b'1', '2017-04-18 02:03:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1030, '肥西县', 3, 1023, '0551', '340123', 117.16611800, 31.71964600, 1022, '安徽省', 1023, '合肥市', 1030, '肥西县', 'system', 'system', b'1', '2017-04-18 02:03:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1031, '庐江县', 3, 1023, '0551', '340124', 117.28984400, 31.25148800, 1022, '安徽省', 1023, '合肥市', 1031, '庐江县', 'system', 'system', b'1', '2017-04-18 02:03:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1032, '巢湖市', 3, 1023, '0551', '340181', 117.87415500, 31.60051800, 1022, '安徽省', 1023, '合肥市', 1032, '巢湖市', 'system', 'system', b'1', '2017-04-18 02:03:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1033, '芜湖市', 2, 1022, '0553', '340200', 118.37645100, 31.32631900, 1022, '安徽省', 1033, '芜湖市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1034, '镜湖区', 3, 1033, '0553', '340202', 118.37634300, 31.32559000, 1022, '安徽省', 1033, '芜湖市', 1034, '镜湖区', 'system', 'system', b'1', '2017-04-18 02:03:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1035, '弋江区', 3, 1033, '0553', '340203', 118.37747600, 31.31339400, 1022, '安徽省', 1033, '芜湖市', 1035, '弋江区', 'system', 'system', b'1', '2017-04-18 02:03:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1036, '鸠江区', 3, 1033, '0553', '340207', 118.40017400, 31.36271600, 1022, '安徽省', 1033, '芜湖市', 1036, '鸠江区', 'system', 'system', b'1', '2017-04-18 02:03:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1037, '三山区', 3, 1033, '0553', '340208', 118.23398700, 31.22542300, 1022, '安徽省', 1033, '芜湖市', 1037, '三山区', 'system', 'system', b'1', '2017-04-18 02:03:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1038, '芜湖县', 3, 1033, '0553', '340221', 118.57230100, 31.14526200, 1022, '安徽省', 1033, '芜湖市', 1038, '芜湖县', 'system', 'system', b'1', '2017-04-18 02:03:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1039, '繁昌县', 3, 1033, '0553', '340222', 118.20134900, 31.08089600, 1022, '安徽省', 1033, '芜湖市', 1039, '繁昌县', 'system', 'system', b'1', '2017-04-18 02:03:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1040, '南陵县', 3, 1033, '0553', '340223', 118.33710400, 30.91963800, 1022, '安徽省', 1033, '芜湖市', 1040, '南陵县', 'system', 'system', b'1', '2017-04-18 02:03:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1041, '无为县', 3, 1033, '0553', '340225', 117.91143200, 31.30307500, 1022, '安徽省', 1033, '芜湖市', 1041, '无为县', 'system', 'system', b'1', '2017-04-18 02:03:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1042, '蚌埠市', 2, 1022, '0552', '340300', 117.36322800, 32.93966700, 1022, '安徽省', 1042, '蚌埠市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1043, '龙子湖区', 3, 1042, '0552', '340302', 117.38231200, 32.95045200, 1022, '安徽省', 1042, '蚌埠市', 1043, '龙子湖区', 'system', 'system', b'1', '2017-04-18 02:03:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1044, '蚌山区', 3, 1042, '0552', '340303', 117.35578900, 32.93806600, 1022, '安徽省', 1042, '蚌埠市', 1044, '蚌山区', 'system', 'system', b'1', '2017-04-18 02:03:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1045, '禹会区', 3, 1042, '0552', '340304', 117.35259000, 32.93193300, 1022, '安徽省', 1042, '蚌埠市', 1045, '禹会区', 'system', 'system', b'1', '2017-04-18 02:03:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1046, '淮上区', 3, 1042, '0552', '340311', 117.34709000, 32.96314700, 1022, '安徽省', 1042, '蚌埠市', 1046, '淮上区', 'system', 'system', b'1', '2017-04-18 02:03:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1047, '怀远县', 3, 1042, '0552', '340321', 117.20017100, 32.95693400, 1022, '安徽省', 1042, '蚌埠市', 1047, '怀远县', 'system', 'system', b'1', '2017-04-18 02:03:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1048, '五河县', 3, 1042, '0552', '340322', 117.88880900, 33.14620200, 1022, '安徽省', 1042, '蚌埠市', 1048, '五河县', 'system', 'system', b'1', '2017-04-18 02:03:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1049, '固镇县', 3, 1042, '0552', '340323', 117.31596200, 33.31867900, 1022, '安徽省', 1042, '蚌埠市', 1049, '固镇县', 'system', 'system', b'1', '2017-04-18 02:03:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1050, '淮南市', 2, 1022, '0554', '340400', 117.01832900, 32.64757400, 1022, '安徽省', 1050, '淮南市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1051, '大通区', 3, 1050, '0554', '340402', 117.05292700, 32.63206600, 1022, '安徽省', 1050, '淮南市', 1051, '大通区', 'system', 'system', b'1', '2017-04-18 02:03:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1052, '田家庵区', 3, 1050, '0554', '340403', 117.01831800, 32.64434200, 1022, '安徽省', 1050, '淮南市', 1052, '田家庵区', 'system', 'system', b'1', '2017-04-18 02:03:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1053, '谢家集区', 3, 1050, '0554', '340404', 116.86535400, 32.59828900, 1022, '安徽省', 1050, '淮南市', 1053, '谢家集区', 'system', 'system', b'1', '2017-04-18 02:03:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1054, '八公山区', 3, 1050, '0554', '340405', 116.84111100, 32.62822900, 1022, '安徽省', 1050, '淮南市', 1054, '八公山区', 'system', 'system', b'1', '2017-04-18 02:03:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1055, '潘集区', 3, 1050, '0554', '340406', 116.81687900, 32.78211700, 1022, '安徽省', 1050, '淮南市', 1055, '潘集区', 'system', 'system', b'1', '2017-04-18 02:03:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1056, '凤台县', 3, 1050, '0554', '340421', 116.72276900, 32.70538200, 1022, '安徽省', 1050, '淮南市', 1056, '凤台县', 'system', 'system', b'1', '2017-04-18 02:03:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1057, '寿县', 3, 1050, '0554', '340422', 116.78534900, 32.57730400, 1022, '安徽省', 1050, '淮南市', 1057, '寿县', 'system', 'system', b'1', '2017-04-18 02:03:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1058, '马鞍山市', 2, 1022, '0555', '340500', 118.50790600, 31.68936200, 1022, '安徽省', 1058, '马鞍山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1059, '花山区', 3, 1058, '0555', '340503', 118.51130800, 31.69902000, 1022, '安徽省', 1058, '马鞍山市', 1059, '花山区', 'system', 'system', b'1', '2017-04-18 02:03:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1060, '雨山区', 3, 1058, '0555', '340504', 118.49310400, 31.68591200, 1022, '安徽省', 1058, '马鞍山市', 1060, '雨山区', 'system', 'system', b'1', '2017-04-18 02:03:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1061, '博望区', 3, 1058, '0555', '340506', 118.84374200, 31.56232100, 1022, '安徽省', 1058, '马鞍山市', 1061, '博望区', 'system', 'system', b'1', '2017-04-18 02:03:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1062, '当涂县', 3, 1058, '0555', '340521', 118.48987300, 31.55616700, 1022, '安徽省', 1058, '马鞍山市', 1062, '当涂县', 'system', 'system', b'1', '2017-04-18 02:03:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1063, '含山县', 3, 1058, '0555', '340522', 118.10554500, 31.72775800, 1022, '安徽省', 1058, '马鞍山市', 1063, '含山县', 'system', 'system', b'1', '2017-04-18 02:03:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1064, '和县', 3, 1058, '0555', '340523', 118.36299800, 31.71663400, 1022, '安徽省', 1058, '马鞍山市', 1064, '和县', 'system', 'system', b'1', '2017-04-18 02:03:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1065, '淮北市', 2, 1022, '0561', '340600', 116.79466400, 33.97170700, 1022, '安徽省', 1065, '淮北市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1066, '杜集区', 3, 1065, '0561', '340602', 116.83392500, 33.99121800, 1022, '安徽省', 1065, '淮北市', 1066, '杜集区', 'system', 'system', b'1', '2017-04-18 02:03:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1067, '相山区', 3, 1065, '0561', '340603', 116.79077500, 33.97091600, 1022, '安徽省', 1065, '淮北市', 1067, '相山区', 'system', 'system', b'1', '2017-04-18 02:03:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1068, '烈山区', 3, 1065, '0561', '340604', 116.80946500, 33.88952900, 1022, '安徽省', 1065, '淮北市', 1068, '烈山区', 'system', 'system', b'1', '2017-04-18 02:03:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1069, '濉溪县', 3, 1065, '0561', '340621', 116.76743500, 33.91640700, 1022, '安徽省', 1065, '淮北市', 1069, '濉溪县', 'system', 'system', b'1', '2017-04-18 02:03:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1070, '铜陵市', 2, 1022, '0562', '340700', 117.81657600, 30.92993500, 1022, '安徽省', 1070, '铜陵市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1071, '铜官区', 3, 1070, '0562', '340705', 117.81842700, 30.93182000, 1022, '安徽省', 1070, '铜陵市', 1071, '铜官区', 'system', 'system', b'1', '2017-04-18 02:03:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1072, '郊区', 3, 1070, '0562', '340711', 117.80707000, 30.90892700, 1022, '安徽省', 1070, '铜陵市', 1072, '郊区', 'system', 'system', b'1', '2017-04-18 02:03:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1073, '义安区', 3, 1070, '0562', '340706', 117.79228800, 30.95233800, 1022, '安徽省', 1070, '铜陵市', 1073, '义安区', 'system', 'system', b'1', '2017-04-18 02:03:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1074, '枞阳县', 3, 1070, '0562', '340722', 117.22202700, 30.70061500, 1022, '安徽省', 1070, '铜陵市', 1074, '枞阳县', 'system', 'system', b'1', '2017-04-18 02:03:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1075, '安庆市', 2, 1022, '0556', '340800', 117.04355100, 30.50883000, 1022, '安徽省', 1075, '安庆市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1076, '迎江区', 3, 1075, '0556', '340802', 117.04496500, 30.50637500, 1022, '安徽省', 1075, '安庆市', 1076, '迎江区', 'system', 'system', b'1', '2017-04-18 02:03:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1077, '大观区', 3, 1075, '0556', '340803', 117.03451200, 30.50563200, 1022, '安徽省', 1075, '安庆市', 1077, '大观区', 'system', 'system', b'1', '2017-04-18 02:03:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1078, '宜秀区', 3, 1075, '0556', '340811', 117.07000300, 30.54132300, 1022, '安徽省', 1075, '安庆市', 1078, '宜秀区', 'system', 'system', b'1', '2017-04-18 02:03:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1079, '怀宁县', 3, 1075, '0556', '340822', 116.82866400, 30.73499400, 1022, '安徽省', 1075, '安庆市', 1079, '怀宁县', 'system', 'system', b'1', '2017-04-18 02:03:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1080, '潜山县', 3, 1075, '0556', '340824', 116.57366600, 30.63822200, 1022, '安徽省', 1075, '安庆市', 1080, '潜山县', 'system', 'system', b'1', '2017-04-18 02:03:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1081, '太湖县', 3, 1075, '0556', '340825', 116.30522500, 30.45186900, 1022, '安徽省', 1075, '安庆市', 1081, '太湖县', 'system', 'system', b'1', '2017-04-18 02:03:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1082, '宿松县', 3, 1075, '0556', '340826', 116.12020400, 30.15832700, 1022, '安徽省', 1075, '安庆市', 1082, '宿松县', 'system', 'system', b'1', '2017-04-18 02:03:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1083, '望江县', 3, 1075, '0556', '340827', 116.69092700, 30.12491000, 1022, '安徽省', 1075, '安庆市', 1083, '望江县', 'system', 'system', b'1', '2017-04-18 02:03:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1084, '岳西县', 3, 1075, '0556', '340828', 116.36048200, 30.84850200, 1022, '安徽省', 1075, '安庆市', 1084, '岳西县', 'system', 'system', b'1', '2017-04-18 02:03:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1085, '桐城市', 3, 1075, '0556', '340881', 116.95965600, 31.05057600, 1022, '安徽省', 1075, '安庆市', 1085, '桐城市', 'system', 'system', b'1', '2017-04-18 02:03:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1086, '黄山市', 2, 1022, '0559', '341000', 118.31732500, 29.70923900, 1022, '安徽省', 1086, '黄山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1087, '屯溪区', 3, 1086, '0559', '341002', 118.31735400, 29.70918600, 1022, '安徽省', 1086, '黄山市', 1087, '屯溪区', 'system', 'system', b'1', '2017-04-18 02:03:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1088, '黄山区', 3, 1086, '0559', '341003', 118.13663900, 30.29451700, 1022, '安徽省', 1086, '黄山市', 1088, '黄山区', 'system', 'system', b'1', '2017-04-18 02:03:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1089, '徽州区', 3, 1086, '0559', '341004', 118.33974300, 29.82520100, 1022, '安徽省', 1086, '黄山市', 1089, '徽州区', 'system', 'system', b'1', '2017-04-18 02:03:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1090, '歙县', 3, 1086, '0559', '341021', 118.42802500, 29.86774800, 1022, '安徽省', 1086, '黄山市', 1090, '歙县', 'system', 'system', b'1', '2017-04-18 02:03:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1091, '休宁县', 3, 1086, '0559', '341022', 118.18853100, 29.78887800, 1022, '安徽省', 1086, '黄山市', 1091, '休宁县', 'system', 'system', b'1', '2017-04-18 02:03:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1092, '黟县', 3, 1086, '0559', '341023', 117.94291100, 29.92381200, 1022, '安徽省', 1086, '黄山市', 1092, '黟县', 'system', 'system', b'1', '2017-04-18 02:03:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1093, '祁门县', 3, 1086, '0559', '341024', 117.71723700, 29.85347200, 1022, '安徽省', 1086, '黄山市', 1093, '祁门县', 'system', 'system', b'1', '2017-04-18 02:03:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1094, '滁州市', 2, 1022, '0550', '341100', 118.31626400, 32.30362700, 1022, '安徽省', 1094, '滁州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1095, '琅琊区', 3, 1094, '0550', '341102', 118.31647500, 32.30379700, 1022, '安徽省', 1094, '滁州市', 1095, '琅琊区', 'system', 'system', b'1', '2017-04-18 02:03:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1096, '南谯区', 3, 1094, '0550', '341103', 118.29695500, 32.32984100, 1022, '安徽省', 1094, '滁州市', 1096, '南谯区', 'system', 'system', b'1', '2017-04-18 02:03:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1097, '来安县', 3, 1094, '0550', '341122', 118.43329300, 32.45023100, 1022, '安徽省', 1094, '滁州市', 1097, '来安县', 'system', 'system', b'1', '2017-04-18 02:03:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1098, '全椒县', 3, 1094, '0550', '341124', 118.26857600, 32.09385000, 1022, '安徽省', 1094, '滁州市', 1098, '全椒县', 'system', 'system', b'1', '2017-04-18 02:03:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1099, '定远县', 3, 1094, '0550', '341125', 117.68371300, 32.52710500, 1022, '安徽省', 1094, '滁州市', 1099, '定远县', 'system', 'system', b'1', '2017-04-18 02:03:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1100, '凤阳县', 3, 1094, '0550', '341126', 117.56246100, 32.86714600, 1022, '安徽省', 1094, '滁州市', 1100, '凤阳县', 'system', 'system', b'1', '2017-04-18 02:03:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1101, '天长市', 3, 1094, '0550', '341181', 119.01121200, 32.68150000, 1022, '安徽省', 1094, '滁州市', 1101, '天长市', 'system', 'system', b'1', '2017-04-18 02:03:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1102, '明光市', 3, 1094, '0550', '341182', 117.99804800, 32.78120600, 1022, '安徽省', 1094, '滁州市', 1102, '明光市', 'system', 'system', b'1', '2017-04-18 02:03:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1103, '阜阳市', 2, 1022, '1558', '341200', 115.81972900, 32.89696900, 1022, '安徽省', 1103, '阜阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1104, '颍州区', 3, 1103, '1558', '341202', 115.81391400, 32.89123800, 1022, '安徽省', 1103, '阜阳市', 1104, '颍州区', 'system', 'system', b'1', '2017-04-18 02:03:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1105, '颍东区', 3, 1103, '1558', '341203', 115.85874700, 32.90886100, 1022, '安徽省', 1103, '阜阳市', 1105, '颍东区', 'system', 'system', b'1', '2017-04-18 02:03:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1106, '颍泉区', 3, 1103, '1558', '341204', 115.80452500, 32.92479700, 1022, '安徽省', 1103, '阜阳市', 1106, '颍泉区', 'system', 'system', b'1', '2017-04-18 02:03:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1107, '临泉县', 3, 1103, '1558', '341221', 115.26168800, 33.06269800, 1022, '安徽省', 1103, '阜阳市', 1107, '临泉县', 'system', 'system', b'1', '2017-04-18 02:03:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1108, '太和县', 3, 1103, '1558', '341222', 115.62724300, 33.16229000, 1022, '安徽省', 1103, '阜阳市', 1108, '太和县', 'system', 'system', b'1', '2017-04-18 02:03:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1109, '阜南县', 3, 1103, '1558', '341225', 115.59053400, 32.63810200, 1022, '安徽省', 1103, '阜阳市', 1109, '阜南县', 'system', 'system', b'1', '2017-04-18 02:03:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1110, '颍上县', 3, 1103, '1558', '341226', 116.25912200, 32.63706500, 1022, '安徽省', 1103, '阜阳市', 1110, '颍上县', 'system', 'system', b'1', '2017-04-18 02:03:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1111, '界首市', 3, 1103, '1558', '341282', 115.36211700, 33.26153000, 1022, '安徽省', 1103, '阜阳市', 1111, '界首市', 'system', 'system', b'1', '2017-04-18 02:03:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1112, '宿州市', 2, 1022, '0557', '341300', 116.98408400, 33.63389100, 1022, '安徽省', 1112, '宿州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1113, '埇桥区', 3, 1112, '0557', '341302', 116.98330900, 33.63385300, 1022, '安徽省', 1112, '宿州市', 1113, '埇桥区', 'system', 'system', b'1', '2017-04-18 02:03:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1114, '砀山县', 3, 1112, '0557', '341321', 116.35111300, 34.42624700, 1022, '安徽省', 1112, '宿州市', 1114, '砀山县', 'system', 'system', b'1', '2017-04-18 02:03:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1115, '萧县', 3, 1112, '0557', '341322', 116.94539900, 34.18326600, 1022, '安徽省', 1112, '宿州市', 1115, '萧县', 'system', 'system', b'1', '2017-04-18 02:03:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1116, '灵璧县', 3, 1112, '0557', '341323', 117.55149300, 33.54062900, 1022, '安徽省', 1112, '宿州市', 1116, '灵璧县', 'system', 'system', b'1', '2017-04-18 02:03:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1117, '泗县', 3, 1112, '0557', '341324', 117.88544300, 33.47758000, 1022, '安徽省', 1112, '宿州市', 1117, '泗县', 'system', 'system', b'1', '2017-04-18 02:03:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1118, '六安市', 2, 1022, '0564', '341500', 116.50767600, 31.75288900, 1022, '安徽省', 1118, '六安市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1119, '金安区', 3, 1118, '0564', '341502', 116.50328800, 31.75449100, 1022, '安徽省', 1118, '六安市', 1119, '金安区', 'system', 'system', b'1', '2017-04-18 02:03:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1120, '裕安区', 3, 1118, '0564', '341503', 116.49454300, 31.75069200, 1022, '安徽省', 1118, '六安市', 1120, '裕安区', 'system', 'system', b'1', '2017-04-18 02:03:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1121, '叶集区', 3, 1118, '0564', '341504', 115.91359400, 31.84768000, 1022, '安徽省', 1118, '六安市', 1121, '叶集区', 'system', 'system', b'1', '2017-04-18 02:03:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1122, '霍邱县', 3, 1118, '0564', '341522', 116.27887500, 32.34130500, 1022, '安徽省', 1118, '六安市', 1122, '霍邱县', 'system', 'system', b'1', '2017-04-18 02:03:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1123, '舒城县', 3, 1118, '0564', '341523', 116.94408800, 31.46284800, 1022, '安徽省', 1118, '六安市', 1123, '舒城县', 'system', 'system', b'1', '2017-04-18 02:03:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1124, '金寨县', 3, 1118, '0564', '341524', 115.87851400, 31.68162400, 1022, '安徽省', 1118, '六安市', 1124, '金寨县', 'system', 'system', b'1', '2017-04-18 02:03:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1125, '霍山县', 3, 1118, '0564', '341525', 116.33307800, 31.40245600, 1022, '安徽省', 1118, '六安市', 1125, '霍山县', 'system', 'system', b'1', '2017-04-18 02:03:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1126, '亳州市', 2, 1022, '0558', '341600', 115.78293900, 33.86933800, 1022, '安徽省', 1126, '亳州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1127, '谯城区', 3, 1126, '0558', '341602', 115.78121400, 33.86928400, 1022, '安徽省', 1126, '亳州市', 1127, '谯城区', 'system', 'system', b'1', '2017-04-18 02:03:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1128, '涡阳县', 3, 1126, '0558', '341621', 116.21155100, 33.50283100, 1022, '安徽省', 1126, '亳州市', 1128, '涡阳县', 'system', 'system', b'1', '2017-04-18 02:03:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1129, '蒙城县', 3, 1126, '0558', '341622', 116.56033700, 33.26081400, 1022, '安徽省', 1126, '亳州市', 1129, '蒙城县', 'system', 'system', b'1', '2017-04-18 02:03:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1130, '利辛县', 3, 1126, '0558', '341623', 116.20778200, 33.14350300, 1022, '安徽省', 1126, '亳州市', 1130, '利辛县', 'system', 'system', b'1', '2017-04-18 02:03:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1131, '池州市', 2, 1022, '0566', '341700', 117.48915700, 30.65603700, 1022, '安徽省', 1131, '池州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1132, '贵池区', 3, 1131, '0566', '341702', 117.48834200, 30.65737800, 1022, '安徽省', 1131, '池州市', 1132, '贵池区', 'system', 'system', b'1', '2017-04-18 02:03:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1133, '东至县', 3, 1131, '0566', '341721', 117.02147600, 30.09656800, 1022, '安徽省', 1131, '池州市', 1133, '东至县', 'system', 'system', b'1', '2017-04-18 02:03:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1134, '石台县', 3, 1131, '0566', '341722', 117.48290700, 30.21032400, 1022, '安徽省', 1131, '池州市', 1134, '石台县', 'system', 'system', b'1', '2017-04-18 02:03:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1135, '青阳县', 3, 1131, '0566', '341723', 117.85739500, 30.63818000, 1022, '安徽省', 1131, '池州市', 1135, '青阳县', 'system', 'system', b'1', '2017-04-18 02:03:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1136, '宣城市', 2, 1022, '0563', '341800', 118.75799500, 30.94566700, 1022, '安徽省', 1136, '宣城市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1137, '宣州区', 3, 1136, '0563', '341802', 118.75841200, 30.94600300, 1022, '安徽省', 1136, '宣城市', 1137, '宣州区', 'system', 'system', b'1', '2017-04-18 02:03:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1138, '郎溪县', 3, 1136, '0563', '341821', 119.18502400, 31.12783400, 1022, '安徽省', 1136, '宣城市', 1138, '郎溪县', 'system', 'system', b'1', '2017-04-18 02:03:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1139, '广德县', 3, 1136, '0563', '341822', 119.41752100, 30.89311600, 1022, '安徽省', 1136, '宣城市', 1139, '广德县', 'system', 'system', b'1', '2017-04-18 02:03:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1140, '泾县', 3, 1136, '0563', '341823', 118.41239700, 30.68597500, 1022, '安徽省', 1136, '宣城市', 1140, '泾县', 'system', 'system', b'1', '2017-04-18 02:03:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1141, '绩溪县', 3, 1136, '0563', '341824', 118.59470500, 30.06526700, 1022, '安徽省', 1136, '宣城市', 1141, '绩溪县', 'system', 'system', b'1', '2017-04-18 02:03:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1142, '旌德县', 3, 1136, '0563', '341825', 118.54308100, 30.28805700, 1022, '安徽省', 1136, '宣城市', 1142, '旌德县', 'system', 'system', b'1', '2017-04-18 02:03:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1143, '宁国市', 3, 1136, '0563', '341881', 118.98340700, 30.62652900, 1022, '安徽省', 1136, '宣城市', 1143, '宁国市', 'system', 'system', b'1', '2017-04-18 02:03:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1144, '福建省', 1, 1, NULL, '350000', 119.30623900, 26.07530200, 1144, '福建省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1145, '福州市', 2, 1144, '0591', '350100', 119.30623900, 26.07530200, 1144, '福建省', 1145, '福州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1146, '鼓楼区', 3, 1145, '0591', '350102', 119.29929000, 26.08228400, 1144, '福建省', 1145, '福州市', 1146, '鼓楼区', 'system', 'system', b'1', '2017-04-18 02:03:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1147, '台江区', 3, 1145, '0591', '350103', 119.31015600, 26.05861600, 1144, '福建省', 1145, '福州市', 1147, '台江区', 'system', 'system', b'1', '2017-04-18 02:03:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1148, '仓山区', 3, 1145, '0591', '350104', 119.32098800, 26.03891200, 1144, '福建省', 1145, '福州市', 1148, '仓山区', 'system', 'system', b'1', '2017-04-18 02:03:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1149, '马尾区', 3, 1145, '0591', '350105', 119.45872500, 25.99197500, 1144, '福建省', 1145, '福州市', 1149, '马尾区', 'system', 'system', b'1', '2017-04-18 02:03:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1150, '晋安区', 3, 1145, '0591', '350111', 119.32859700, 26.07883700, 1144, '福建省', 1145, '福州市', 1150, '晋安区', 'system', 'system', b'1', '2017-04-18 02:03:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1151, '闽侯县', 3, 1145, '0591', '350121', 119.14511700, 26.14856700, 1144, '福建省', 1145, '福州市', 1151, '闽侯县', 'system', 'system', b'1', '2017-04-18 02:03:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1152, '连江县', 3, 1145, '0591', '350122', 119.53836500, 26.20210900, 1144, '福建省', 1145, '福州市', 1152, '连江县', 'system', 'system', b'1', '2017-04-18 02:03:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1153, '罗源县', 3, 1145, '0591', '350123', 119.55264500, 26.48723400, 1144, '福建省', 1145, '福州市', 1153, '罗源县', 'system', 'system', b'1', '2017-04-18 02:03:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1154, '闽清县', 3, 1145, '0591', '350124', 118.86841600, 26.22379300, 1144, '福建省', 1145, '福州市', 1154, '闽清县', 'system', 'system', b'1', '2017-04-18 02:03:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1155, '永泰县', 3, 1145, '0591', '350125', 118.93908900, 25.86482500, 1144, '福建省', 1145, '福州市', 1155, '永泰县', 'system', 'system', b'1', '2017-04-18 02:03:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1156, '平潭县', 3, 1145, '0591', '350128', 119.79119700, 25.50367200, 1144, '福建省', 1145, '福州市', 1156, '平潭县', 'system', 'system', b'1', '2017-04-18 02:03:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1157, '福清市', 3, 1145, '0591', '350181', 119.37699200, 25.72040200, 1144, '福建省', 1145, '福州市', 1157, '福清市', 'system', 'system', b'1', '2017-04-18 02:03:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1158, '长乐市', 3, 1145, '0591', '350182', 119.51084900, 25.96058300, 1144, '福建省', 1145, '福州市', 1158, '长乐市', 'system', 'system', b'1', '2017-04-18 02:03:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1159, '厦门市', 2, 1144, '0592', '350200', 118.11022000, 24.49047400, 1144, '福建省', 1159, '厦门市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1160, '思明区', 3, 1159, '0592', '350203', 118.08782800, 24.46205900, 1144, '福建省', 1159, '厦门市', 1160, '思明区', 'system', 'system', b'1', '2017-04-18 02:03:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1161, '海沧区', 3, 1159, '0592', '350205', 118.03636400, 24.49251200, 1144, '福建省', 1159, '厦门市', 1161, '海沧区', 'system', 'system', b'1', '2017-04-18 02:03:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1162, '湖里区', 3, 1159, '0592', '350206', 118.10943000, 24.51276400, 1144, '福建省', 1159, '厦门市', 1162, '湖里区', 'system', 'system', b'1', '2017-04-18 02:03:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1163, '集美区', 3, 1159, '0592', '350211', 118.10086900, 24.57287400, 1144, '福建省', 1159, '厦门市', 1163, '集美区', 'system', 'system', b'1', '2017-04-18 02:03:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1164, '同安区', 3, 1159, '0592', '350212', 118.15045500, 24.72933300, 1144, '福建省', 1159, '厦门市', 1164, '同安区', 'system', 'system', b'1', '2017-04-18 02:03:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1165, '翔安区', 3, 1159, '0592', '350213', 118.24281100, 24.63747900, 1144, '福建省', 1159, '厦门市', 1165, '翔安区', 'system', 'system', b'1', '2017-04-18 02:03:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1166, '莆田市', 2, 1144, '0594', '350300', 119.00755800, 25.43101100, 1144, '福建省', 1166, '莆田市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1167, '城厢区', 3, 1166, '0594', '350302', 119.00102800, 25.43373700, 1144, '福建省', 1166, '莆田市', 1167, '城厢区', 'system', 'system', b'1', '2017-04-18 02:03:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1168, '涵江区', 3, 1166, '0594', '350303', 119.11910200, 25.45927300, 1144, '福建省', 1166, '莆田市', 1168, '涵江区', 'system', 'system', b'1', '2017-04-18 02:03:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1169, '荔城区', 3, 1166, '0594', '350304', 119.02004700, 25.43004700, 1144, '福建省', 1166, '莆田市', 1169, '荔城区', 'system', 'system', b'1', '2017-04-18 02:03:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1170, '秀屿区', 3, 1166, '0594', '350305', 119.09260700, 25.31614100, 1144, '福建省', 1166, '莆田市', 1170, '秀屿区', 'system', 'system', b'1', '2017-04-18 02:03:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1171, '仙游县', 3, 1166, '0594', '350322', 118.69433100, 25.35652900, 1144, '福建省', 1166, '莆田市', 1171, '仙游县', 'system', 'system', b'1', '2017-04-18 02:03:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1172, '三明市', 2, 1144, '0598', '350400', 117.63500100, 26.26544400, 1144, '福建省', 1172, '三明市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1173, '梅列区', 3, 1172, '0598', '350402', 117.63687000, 26.26920800, 1144, '福建省', 1172, '三明市', 1173, '梅列区', 'system', 'system', b'1', '2017-04-18 02:03:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1174, '三元区', 3, 1172, '0598', '350403', 117.60741800, 26.23419100, 1144, '福建省', 1172, '三明市', 1174, '三元区', 'system', 'system', b'1', '2017-04-18 02:03:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1175, '明溪县', 3, 1172, '0598', '350421', 117.20184500, 26.35737500, 1144, '福建省', 1172, '三明市', 1175, '明溪县', 'system', 'system', b'1', '2017-04-18 02:03:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1176, '清流县', 3, 1172, '0598', '350423', 116.81582100, 26.17761000, 1144, '福建省', 1172, '三明市', 1176, '清流县', 'system', 'system', b'1', '2017-04-18 02:03:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1177, '宁化县', 3, 1172, '0598', '350424', 116.65972500, 26.25993200, 1144, '福建省', 1172, '三明市', 1177, '宁化县', 'system', 'system', b'1', '2017-04-18 02:03:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1178, '大田县', 3, 1172, '0598', '350425', 117.84935500, 25.69080300, 1144, '福建省', 1172, '三明市', 1178, '大田县', 'system', 'system', b'1', '2017-04-18 02:03:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1179, '尤溪县', 3, 1172, '0598', '350426', 118.18857700, 26.16926100, 1144, '福建省', 1172, '三明市', 1179, '尤溪县', 'system', 'system', b'1', '2017-04-18 02:03:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1180, '沙县', 3, 1172, '0598', '350427', 117.78909500, 26.39736100, 1144, '福建省', 1172, '三明市', 1180, '沙县', 'system', 'system', b'1', '2017-04-18 02:03:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1181, '将乐县', 3, 1172, '0598', '350428', 117.47355800, 26.72866700, 1144, '福建省', 1172, '三明市', 1181, '将乐县', 'system', 'system', b'1', '2017-04-18 02:03:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1182, '泰宁县', 3, 1172, '0598', '350429', 117.17752200, 26.89799500, 1144, '福建省', 1172, '三明市', 1182, '泰宁县', 'system', 'system', b'1', '2017-04-18 02:03:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1183, '建宁县', 3, 1172, '0598', '350430', 116.84583200, 26.83139800, 1144, '福建省', 1172, '三明市', 1183, '建宁县', 'system', 'system', b'1', '2017-04-18 02:03:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1184, '永安市', 3, 1172, '0598', '350481', 117.36444700, 25.97407500, 1144, '福建省', 1172, '三明市', 1184, '永安市', 'system', 'system', b'1', '2017-04-18 02:03:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1185, '泉州市', 2, 1144, '0595', '350500', 118.58942100, 24.90885300, 1144, '福建省', 1185, '泉州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1186, '鲤城区', 3, 1185, '0595', '350502', 118.58892900, 24.90764500, 1144, '福建省', 1185, '泉州市', 1186, '鲤城区', 'system', 'system', b'1', '2017-04-18 02:03:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1187, '丰泽区', 3, 1185, '0595', '350503', 118.60514700, 24.89604100, 1144, '福建省', 1185, '泉州市', 1187, '丰泽区', 'system', 'system', b'1', '2017-04-18 02:03:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1188, '洛江区', 3, 1185, '0595', '350504', 118.67031200, 24.94115300, 1144, '福建省', 1185, '泉州市', 1188, '洛江区', 'system', 'system', b'1', '2017-04-18 02:03:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1189, '泉港区', 3, 1185, '0595', '350505', 118.91228500, 25.12685900, 1144, '福建省', 1185, '泉州市', 1189, '泉港区', 'system', 'system', b'1', '2017-04-18 02:03:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1190, '惠安县', 3, 1185, '0595', '350521', 118.79895400, 25.02871800, 1144, '福建省', 1185, '泉州市', 1190, '惠安县', 'system', 'system', b'1', '2017-04-18 02:03:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1191, '安溪县', 3, 1185, '0595', '350524', 118.18601400, 25.05682400, 1144, '福建省', 1185, '泉州市', 1191, '安溪县', 'system', 'system', b'1', '2017-04-18 02:03:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1192, '永春县', 3, 1185, '0595', '350525', 118.29503000, 25.32072100, 1144, '福建省', 1185, '泉州市', 1192, '永春县', 'system', 'system', b'1', '2017-04-18 02:03:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1193, '德化县', 3, 1185, '0595', '350526', 118.24298600, 25.48900400, 1144, '福建省', 1185, '泉州市', 1193, '德化县', 'system', 'system', b'1', '2017-04-18 02:03:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1194, '金门县', 3, 1185, '0595', '350527', 118.32322100, 24.43641700, 1144, '福建省', 1185, '泉州市', 1194, '金门县', 'system', 'system', b'1', '2017-04-18 02:03:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1195, '石狮市', 3, 1185, '0595', '350581', 118.62840200, 24.73197800, 1144, '福建省', 1185, '泉州市', 1195, '石狮市', 'system', 'system', b'1', '2017-04-18 02:03:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1196, '晋江市', 3, 1185, '0595', '350582', 118.57733800, 24.80732200, 1144, '福建省', 1185, '泉州市', 1196, '晋江市', 'system', 'system', b'1', '2017-04-18 02:03:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1197, '南安市', 3, 1185, '0595', '350583', 118.38703100, 24.95949400, 1144, '福建省', 1185, '泉州市', 1197, '南安市', 'system', 'system', b'1', '2017-04-18 02:03:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1198, '漳州市', 2, 1144, '0596', '350600', 117.66180100, 24.51089700, 1144, '福建省', 1198, '漳州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1199, '芗城区', 3, 1198, '0596', '350602', 117.65646100, 24.50995500, 1144, '福建省', 1198, '漳州市', 1199, '芗城区', 'system', 'system', b'1', '2017-04-18 02:03:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1200, '龙文区', 3, 1198, '0596', '350603', 117.67138700, 24.51565600, 1144, '福建省', 1198, '漳州市', 1200, '龙文区', 'system', 'system', b'1', '2017-04-18 02:03:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1201, '云霄县', 3, 1198, '0596', '350622', 117.34094600, 23.95048600, 1144, '福建省', 1198, '漳州市', 1201, '云霄县', 'system', 'system', b'1', '2017-04-18 02:03:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1202, '漳浦县', 3, 1198, '0596', '350623', 117.61402300, 24.11790700, 1144, '福建省', 1198, '漳州市', 1202, '漳浦县', 'system', 'system', b'1', '2017-04-18 02:03:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1203, '诏安县', 3, 1198, '0596', '350624', 117.17608300, 23.71083400, 1144, '福建省', 1198, '漳州市', 1203, '诏安县', 'system', 'system', b'1', '2017-04-18 02:03:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1204, '长泰县', 3, 1198, '0596', '350625', 117.75591300, 24.62147500, 1144, '福建省', 1198, '漳州市', 1204, '长泰县', 'system', 'system', b'1', '2017-04-18 02:03:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1205, '东山县', 3, 1198, '0596', '350626', 117.42767900, 23.70284500, 1144, '福建省', 1198, '漳州市', 1205, '东山县', 'system', 'system', b'1', '2017-04-18 02:03:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1206, '南靖县', 3, 1198, '0596', '350627', 117.36546200, 24.51642500, 1144, '福建省', 1198, '漳州市', 1206, '南靖县', 'system', 'system', b'1', '2017-04-18 02:03:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1207, '平和县', 3, 1198, '0596', '350628', 117.31354900, 24.36615800, 1144, '福建省', 1198, '漳州市', 1207, '平和县', 'system', 'system', b'1', '2017-04-18 02:03:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1208, '华安县', 3, 1198, '0596', '350629', 117.53631000, 25.00141600, 1144, '福建省', 1198, '漳州市', 1208, '华安县', 'system', 'system', b'1', '2017-04-18 02:03:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1209, '龙海市', 3, 1198, '0596', '350681', 117.81729200, 24.44534100, 1144, '福建省', 1198, '漳州市', 1209, '龙海市', 'system', 'system', b'1', '2017-04-18 02:03:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1210, '南平市', 2, 1144, '0599', '350700', 118.17845900, 26.63562700, 1144, '福建省', 1210, '南平市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1211, '延平区', 3, 1210, '0599', '350702', 118.17891800, 26.63607900, 1144, '福建省', 1210, '南平市', 1211, '延平区', 'system', 'system', b'1', '2017-04-18 02:03:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1212, '建阳区', 3, 1210, '0599', '350703', 118.12267000, 27.33206700, 1144, '福建省', 1210, '南平市', 1212, '建阳区', 'system', 'system', b'1', '2017-04-18 02:03:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1213, '顺昌县', 3, 1210, '0599', '350721', 117.80771000, 26.79285100, 1144, '福建省', 1210, '南平市', 1213, '顺昌县', 'system', 'system', b'1', '2017-04-18 02:03:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1214, '浦城县', 3, 1210, '0599', '350722', 118.53682200, 27.92041200, 1144, '福建省', 1210, '南平市', 1214, '浦城县', 'system', 'system', b'1', '2017-04-18 02:03:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1215, '光泽县', 3, 1210, '0599', '350723', 117.33789700, 27.54280300, 1144, '福建省', 1210, '南平市', 1215, '光泽县', 'system', 'system', b'1', '2017-04-18 02:03:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1216, '松溪县', 3, 1210, '0599', '350724', 118.78349100, 27.52578500, 1144, '福建省', 1210, '南平市', 1216, '松溪县', 'system', 'system', b'1', '2017-04-18 02:03:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1217, '政和县', 3, 1210, '0599', '350725', 118.85866100, 27.36539800, 1144, '福建省', 1210, '南平市', 1217, '政和县', 'system', 'system', b'1', '2017-04-18 02:03:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1218, '邵武市', 3, 1210, '0599', '350781', 117.49154400, 27.33795200, 1144, '福建省', 1210, '南平市', 1218, '邵武市', 'system', 'system', b'1', '2017-04-18 02:03:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1219, '武夷山市', 3, 1210, '0599', '350782', 118.03279600, 27.75173300, 1144, '福建省', 1210, '南平市', 1219, '武夷山市', 'system', 'system', b'1', '2017-04-18 02:03:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1220, '建瓯市', 3, 1210, '0599', '350783', 118.32176500, 27.03502000, 1144, '福建省', 1210, '南平市', 1220, '建瓯市', 'system', 'system', b'1', '2017-04-18 02:03:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1221, '龙岩市', 2, 1144, '0597', '350800', 117.02978000, 25.09160300, 1144, '福建省', 1221, '龙岩市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1222, '新罗区', 3, 1221, '0597', '350802', 117.03072100, 25.09180000, 1144, '福建省', 1221, '龙岩市', 1222, '新罗区', 'system', 'system', b'1', '2017-04-18 02:03:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1223, '永定区', 3, 1221, '0597', '350803', 116.73269100, 24.72044200, 1144, '福建省', 1221, '龙岩市', 1223, '永定区', 'system', 'system', b'1', '2017-04-18 02:03:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1224, '长汀县', 3, 1221, '0597', '350821', 116.36100700, 25.84227800, 1144, '福建省', 1221, '龙岩市', 1224, '长汀县', 'system', 'system', b'1', '2017-04-18 02:03:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1225, '上杭县', 3, 1221, '0597', '350823', 116.42477400, 25.05001900, 1144, '福建省', 1221, '龙岩市', 1225, '上杭县', 'system', 'system', b'1', '2017-04-18 02:03:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1226, '武平县', 3, 1221, '0597', '350824', 116.10092800, 25.08865000, 1144, '福建省', 1221, '龙岩市', 1226, '武平县', 'system', 'system', b'1', '2017-04-18 02:03:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1227, '连城县', 3, 1221, '0597', '350825', 116.75668700, 25.70850600, 1144, '福建省', 1221, '龙岩市', 1227, '连城县', 'system', 'system', b'1', '2017-04-18 02:03:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1228, '漳平市', 3, 1221, '0597', '350881', 117.42073000, 25.29159700, 1144, '福建省', 1221, '龙岩市', 1228, '漳平市', 'system', 'system', b'1', '2017-04-18 02:03:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1229, '宁德市', 2, 1144, '0593', '350900', 119.52708200, 26.65924000, 1144, '福建省', 1229, '宁德市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1230, '蕉城区', 3, 1229, '0593', '350902', 119.52722500, 26.65925300, 1144, '福建省', 1229, '宁德市', 1230, '蕉城区', 'system', 'system', b'1', '2017-04-18 02:03:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1231, '霞浦县', 3, 1229, '0593', '350921', 120.00521400, 26.88206800, 1144, '福建省', 1229, '宁德市', 1231, '霞浦县', 'system', 'system', b'1', '2017-04-18 02:03:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1232, '古田县', 3, 1229, '0593', '350922', 118.74315600, 26.57749100, 1144, '福建省', 1229, '宁德市', 1232, '古田县', 'system', 'system', b'1', '2017-04-18 02:03:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1233, '屏南县', 3, 1229, '0593', '350923', 118.98754400, 26.91082600, 1144, '福建省', 1229, '宁德市', 1233, '屏南县', 'system', 'system', b'1', '2017-04-18 02:03:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1234, '寿宁县', 3, 1229, '0593', '350924', 119.50673300, 27.45779800, 1144, '福建省', 1229, '宁德市', 1234, '寿宁县', 'system', 'system', b'1', '2017-04-18 02:03:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1235, '周宁县', 3, 1229, '0593', '350925', 119.33823900, 27.10310600, 1144, '福建省', 1229, '宁德市', 1235, '周宁县', 'system', 'system', b'1', '2017-04-18 02:03:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1236, '柘荣县', 3, 1229, '0593', '350926', 119.89822600, 27.23616300, 1144, '福建省', 1229, '宁德市', 1236, '柘荣县', 'system', 'system', b'1', '2017-04-18 02:03:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1237, '福安市', 3, 1229, '0593', '350981', 119.65079800, 27.08424600, 1144, '福建省', 1229, '宁德市', 1237, '福安市', 'system', 'system', b'1', '2017-04-18 02:03:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1238, '福鼎市', 3, 1229, '0593', '350982', 120.21976100, 27.31888400, 1144, '福建省', 1229, '宁德市', 1238, '福鼎市', 'system', 'system', b'1', '2017-04-18 02:03:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1239, '江西省', 1, 1, NULL, '360000', 115.89215100, 28.67649300, 1239, '江西省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1240, '南昌市', 2, 1239, '0791', '360100', 115.89215100, 28.67649300, 1239, '江西省', 1240, '南昌市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1241, '东湖区', 3, 1240, '0791', '360102', 115.88967500, 28.68298800, 1239, '江西省', 1240, '南昌市', 1241, '东湖区', 'system', 'system', b'1', '2017-04-18 02:03:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1242, '西湖区', 3, 1240, '0791', '360103', 115.91065000, 28.66290100, 1239, '江西省', 1240, '南昌市', 1242, '西湖区', 'system', 'system', b'1', '2017-04-18 02:03:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1243, '青云谱区', 3, 1240, '0791', '360104', 115.90729200, 28.63572400, 1239, '江西省', 1240, '南昌市', 1243, '青云谱区', 'system', 'system', b'1', '2017-04-18 02:03:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1244, '湾里区', 3, 1240, '0791', '360105', 115.73132400, 28.71480300, 1239, '江西省', 1240, '南昌市', 1244, '湾里区', 'system', 'system', b'1', '2017-04-18 02:03:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1245, '青山湖区', 3, 1240, '0791', '360111', 115.94904400, 28.68929200, 1239, '江西省', 1240, '南昌市', 1245, '青山湖区', 'system', 'system', b'1', '2017-04-18 02:03:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1246, '南昌县', 3, 1240, '0791', '360121', 115.94246500, 28.54378100, 1239, '江西省', 1240, '南昌市', 1246, '南昌县', 'system', 'system', b'1', '2017-04-18 02:03:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1247, '新建区', 3, 1240, '0791', '360112', 115.82080600, 28.69078800, 1239, '江西省', 1240, '南昌市', 1247, '新建区', 'system', 'system', b'1', '2017-04-18 02:03:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1248, '安义县', 3, 1240, '0791', '360123', 115.55310900, 28.84133400, 1239, '江西省', 1240, '南昌市', 1248, '安义县', 'system', 'system', b'1', '2017-04-18 02:03:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1249, '进贤县', 3, 1240, '0791', '360124', 116.26767100, 28.36568100, 1239, '江西省', 1240, '南昌市', 1249, '进贤县', 'system', 'system', b'1', '2017-04-18 02:03:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1250, '景德镇市', 2, 1239, '0798', '360200', 117.21466400, 29.29256000, 1239, '江西省', 1250, '景德镇市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1251, '昌江区', 3, 1250, '0798', '360202', 117.19502300, 29.28846500, 1239, '江西省', 1250, '景德镇市', 1251, '昌江区', 'system', 'system', b'1', '2017-04-18 02:03:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1252, '珠山区', 3, 1250, '0798', '360203', 117.21481400, 29.29281200, 1239, '江西省', 1250, '景德镇市', 1252, '珠山区', 'system', 'system', b'1', '2017-04-18 02:03:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1253, '浮梁县', 3, 1250, '0798', '360222', 117.21761100, 29.35225100, 1239, '江西省', 1250, '景德镇市', 1253, '浮梁县', 'system', 'system', b'1', '2017-04-18 02:03:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1254, '乐平市', 3, 1250, '0798', '360281', 117.12937600, 28.96736100, 1239, '江西省', 1250, '景德镇市', 1254, '乐平市', 'system', 'system', b'1', '2017-04-18 02:03:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1255, '萍乡市', 2, 1239, '0799', '360300', 113.85218600, 27.62294600, 1239, '江西省', 1255, '萍乡市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1256, '安源区', 3, 1255, '0799', '360302', 113.85504400, 27.62582600, 1239, '江西省', 1255, '萍乡市', 1256, '安源区', 'system', 'system', b'1', '2017-04-18 02:03:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1257, '湘东区', 3, 1255, '0799', '360313', 113.74560000, 27.63931900, 1239, '江西省', 1255, '萍乡市', 1257, '湘东区', 'system', 'system', b'1', '2017-04-18 02:03:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1258, '莲花县', 3, 1255, '0799', '360321', 113.95558200, 27.12780700, 1239, '江西省', 1255, '萍乡市', 1258, '莲花县', 'system', 'system', b'1', '2017-04-18 02:03:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1259, '上栗县', 3, 1255, '0799', '360322', 113.80052500, 27.87704100, 1239, '江西省', 1255, '萍乡市', 1259, '上栗县', 'system', 'system', b'1', '2017-04-18 02:03:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1260, '芦溪县', 3, 1255, '0799', '360323', 114.04120600, 27.63363300, 1239, '江西省', 1255, '萍乡市', 1260, '芦溪县', 'system', 'system', b'1', '2017-04-18 02:03:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1261, '九江市', 2, 1239, '0792', '360400', 115.99281100, 29.71203400, 1239, '江西省', 1261, '九江市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1262, '濂溪区', 3, 1261, '0792', '360402', 115.99012000, 29.67617500, 1239, '江西省', 1261, '九江市', 1262, '濂溪区', 'system', 'system', b'1', '2017-04-18 02:03:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1263, '浔阳区', 3, 1261, '0792', '360403', 115.99594700, 29.72465000, 1239, '江西省', 1261, '九江市', 1263, '浔阳区', 'system', 'system', b'1', '2017-04-18 02:03:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1264, '九江县', 3, 1261, '0792', '360421', 115.89297700, 29.61026400, 1239, '江西省', 1261, '九江市', 1264, '九江县', 'system', 'system', b'1', '2017-04-18 02:03:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1265, '武宁县', 3, 1261, '0792', '360423', 115.10564600, 29.26018200, 1239, '江西省', 1261, '九江市', 1265, '武宁县', 'system', 'system', b'1', '2017-04-18 02:03:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1266, '修水县', 3, 1261, '0792', '360424', 114.57342800, 29.03272900, 1239, '江西省', 1261, '九江市', 1266, '修水县', 'system', 'system', b'1', '2017-04-18 02:03:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1267, '永修县', 3, 1261, '0792', '360425', 115.80905500, 29.01821200, 1239, '江西省', 1261, '九江市', 1267, '永修县', 'system', 'system', b'1', '2017-04-18 02:03:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1268, '德安县', 3, 1261, '0792', '360426', 115.76261100, 29.32747400, 1239, '江西省', 1261, '九江市', 1268, '德安县', 'system', 'system', b'1', '2017-04-18 02:03:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1269, '庐山市', 3, 1261, '0792', '360427', 116.04374300, 29.45616900, 1239, '江西省', 1261, '九江市', 1269, '庐山市', 'system', 'system', b'1', '2017-04-18 02:03:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1270, '都昌县', 3, 1261, '0792', '360428', 116.20511400, 29.27510500, 1239, '江西省', 1261, '九江市', 1270, '都昌县', 'system', 'system', b'1', '2017-04-18 02:03:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1271, '湖口县', 3, 1261, '0792', '360429', 116.24431300, 29.72630000, 1239, '江西省', 1261, '九江市', 1271, '湖口县', 'system', 'system', b'1', '2017-04-18 02:03:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1272, '彭泽县', 3, 1261, '0792', '360430', 116.55584000, 29.89886500, 1239, '江西省', 1261, '九江市', 1272, '彭泽县', 'system', 'system', b'1', '2017-04-18 02:03:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1273, '瑞昌市', 3, 1261, '0792', '360481', 115.66908100, 29.67659900, 1239, '江西省', 1261, '九江市', 1273, '瑞昌市', 'system', 'system', b'1', '2017-04-18 02:03:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1274, '共青城市', 3, 1261, '0792', '360482', 115.80571200, 29.24788400, 1239, '江西省', 1261, '九江市', 1274, '共青城市', 'system', 'system', b'1', '2017-04-18 02:03:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1275, '新余市', 2, 1239, '0790', '360500', 114.93083500, 27.81083400, 1239, '江西省', 1275, '新余市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1276, '渝水区', 3, 1275, '0790', '360502', 114.92392300, 27.81917100, 1239, '江西省', 1275, '新余市', 1276, '渝水区', 'system', 'system', b'1', '2017-04-18 02:03:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1277, '分宜县', 3, 1275, '0790', '360521', 114.67526200, 27.81130100, 1239, '江西省', 1275, '新余市', 1277, '分宜县', 'system', 'system', b'1', '2017-04-18 02:03:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1278, '鹰潭市', 2, 1239, '0701', '360600', 117.03383800, 28.23863800, 1239, '江西省', 1278, '鹰潭市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1279, '月湖区', 3, 1278, '0701', '360602', 117.03411200, 28.23907600, 1239, '江西省', 1278, '鹰潭市', 1279, '月湖区', 'system', 'system', b'1', '2017-04-18 02:03:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1280, '余江县', 3, 1278, '0701', '360622', 116.82276300, 28.20617700, 1239, '江西省', 1278, '鹰潭市', 1280, '余江县', 'system', 'system', b'1', '2017-04-18 02:03:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1281, '贵溪市', 3, 1278, '0701', '360681', 117.21210300, 28.28369300, 1239, '江西省', 1278, '鹰潭市', 1281, '贵溪市', 'system', 'system', b'1', '2017-04-18 02:03:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1282, '赣州市', 2, 1239, '0797', '360700', 114.94027800, 25.85097000, 1239, '江西省', 1282, '赣州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1283, '章贡区', 3, 1282, '0797', '360702', 114.93872000, 25.85136700, 1239, '江西省', 1282, '赣州市', 1283, '章贡区', 'system', 'system', b'1', '2017-04-18 02:03:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1284, '南康区', 3, 1282, '0797', '360703', 114.75693300, 25.66172100, 1239, '江西省', 1282, '赣州市', 1284, '南康区', 'system', 'system', b'1', '2017-04-18 02:03:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1285, '赣县', 3, 1282, '0797', '360721', 115.01846100, 25.86543200, 1239, '江西省', 1282, '赣州市', 1285, '赣县', 'system', 'system', b'1', '2017-04-18 02:03:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1286, '信丰县', 3, 1282, '0797', '360722', 114.93089300, 25.38023000, 1239, '江西省', 1282, '赣州市', 1286, '信丰县', 'system', 'system', b'1', '2017-04-18 02:03:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1287, '大余县', 3, 1282, '0797', '360723', 114.36224300, 25.39593700, 1239, '江西省', 1282, '赣州市', 1287, '大余县', 'system', 'system', b'1', '2017-04-18 02:03:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1288, '上犹县', 3, 1282, '0797', '360724', 114.54053700, 25.79428400, 1239, '江西省', 1282, '赣州市', 1288, '上犹县', 'system', 'system', b'1', '2017-04-18 02:03:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1289, '崇义县', 3, 1282, '0797', '360725', 114.30734800, 25.68791100, 1239, '江西省', 1282, '赣州市', 1289, '崇义县', 'system', 'system', b'1', '2017-04-18 02:03:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1290, '安远县', 3, 1282, '0797', '360726', 115.39232800, 25.13459100, 1239, '江西省', 1282, '赣州市', 1290, '安远县', 'system', 'system', b'1', '2017-04-18 02:03:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1291, '龙南县', 3, 1282, '0797', '360727', 114.79265700, 24.90476000, 1239, '江西省', 1282, '赣州市', 1291, '龙南县', 'system', 'system', b'1', '2017-04-18 02:03:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1292, '定南县', 3, 1282, '0797', '360728', 115.03267000, 24.77427700, 1239, '江西省', 1282, '赣州市', 1292, '定南县', 'system', 'system', b'1', '2017-04-18 02:03:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1293, '全南县', 3, 1282, '0797', '360729', 114.53158900, 24.74265100, 1239, '江西省', 1282, '赣州市', 1293, '全南县', 'system', 'system', b'1', '2017-04-18 02:03:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1294, '宁都县', 3, 1282, '0797', '360730', 116.01878200, 26.47205400, 1239, '江西省', 1282, '赣州市', 1294, '宁都县', 'system', 'system', b'1', '2017-04-18 02:03:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1295, '于都县', 3, 1282, '0797', '360731', 115.41119800, 25.95503300, 1239, '江西省', 1282, '赣州市', 1295, '于都县', 'system', 'system', b'1', '2017-04-18 02:03:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1296, '兴国县', 3, 1282, '0797', '360732', 115.35189600, 26.33048900, 1239, '江西省', 1282, '赣州市', 1296, '兴国县', 'system', 'system', b'1', '2017-04-18 02:03:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1297, '会昌县', 3, 1282, '0797', '360733', 115.79115800, 25.59912500, 1239, '江西省', 1282, '赣州市', 1297, '会昌县', 'system', 'system', b'1', '2017-04-18 02:03:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1298, '寻乌县', 3, 1282, '0797', '360734', 115.65139900, 24.95413600, 1239, '江西省', 1282, '赣州市', 1298, '寻乌县', 'system', 'system', b'1', '2017-04-18 02:03:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1299, '石城县', 3, 1282, '0797', '360735', 116.34224900, 26.32658200, 1239, '江西省', 1282, '赣州市', 1299, '石城县', 'system', 'system', b'1', '2017-04-18 02:03:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1300, '瑞金市', 3, 1282, '0797', '360781', 116.03485400, 25.87527800, 1239, '江西省', 1282, '赣州市', 1300, '瑞金市', 'system', 'system', b'1', '2017-04-18 02:03:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1301, '吉安市', 2, 1239, '0796', '360800', 114.98637300, 27.11169900, 1239, '江西省', 1301, '吉安市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1302, '吉州区', 3, 1301, '0796', '360802', 114.98733100, 27.11236700, 1239, '江西省', 1301, '吉安市', 1302, '吉州区', 'system', 'system', b'1', '2017-04-18 02:03:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1303, '青原区', 3, 1301, '0796', '360803', 115.01630600, 27.10587900, 1239, '江西省', 1301, '吉安市', 1303, '青原区', 'system', 'system', b'1', '2017-04-18 02:03:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1304, '吉安县', 3, 1301, '0796', '360821', 114.90511700, 27.04004200, 1239, '江西省', 1301, '吉安市', 1304, '吉安县', 'system', 'system', b'1', '2017-04-18 02:03:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1305, '吉水县', 3, 1301, '0796', '360822', 115.13456900, 27.21344500, 1239, '江西省', 1301, '吉安市', 1305, '吉水县', 'system', 'system', b'1', '2017-04-18 02:03:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1306, '峡江县', 3, 1301, '0796', '360823', 115.31933100, 27.58086200, 1239, '江西省', 1301, '吉安市', 1306, '峡江县', 'system', 'system', b'1', '2017-04-18 02:03:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1307, '新干县', 3, 1301, '0796', '360824', 115.39929400, 27.75575800, 1239, '江西省', 1301, '吉安市', 1307, '新干县', 'system', 'system', b'1', '2017-04-18 02:03:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1308, '永丰县', 3, 1301, '0796', '360825', 115.43555900, 27.32108700, 1239, '江西省', 1301, '吉安市', 1308, '永丰县', 'system', 'system', b'1', '2017-04-18 02:03:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1309, '泰和县', 3, 1301, '0796', '360826', 114.90139300, 26.79016400, 1239, '江西省', 1301, '吉安市', 1309, '泰和县', 'system', 'system', b'1', '2017-04-18 02:03:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1310, '遂川县', 3, 1301, '0796', '360827', 114.51689000, 26.32370500, 1239, '江西省', 1301, '吉安市', 1310, '遂川县', 'system', 'system', b'1', '2017-04-18 02:03:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1311, '万安县', 3, 1301, '0796', '360828', 114.78469400, 26.46208500, 1239, '江西省', 1301, '吉安市', 1311, '万安县', 'system', 'system', b'1', '2017-04-18 02:03:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1312, '安福县', 3, 1301, '0796', '360829', 114.61384000, 27.38274600, 1239, '江西省', 1301, '吉安市', 1312, '安福县', 'system', 'system', b'1', '2017-04-18 02:03:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1313, '永新县', 3, 1301, '0796', '360830', 114.24253400, 26.94472100, 1239, '江西省', 1301, '吉安市', 1313, '永新县', 'system', 'system', b'1', '2017-04-18 02:03:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1314, '井冈山市', 3, 1301, '0796', '360881', 114.28442100, 26.74591900, 1239, '江西省', 1301, '吉安市', 1314, '井冈山市', 'system', 'system', b'1', '2017-04-18 02:03:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1315, '宜春市', 2, 1239, '0795', '360900', 114.39113600, 27.80430000, 1239, '江西省', 1315, '宜春市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1316, '袁州区', 3, 1315, '0795', '360902', 114.38737900, 27.80011700, 1239, '江西省', 1315, '宜春市', 1316, '袁州区', 'system', 'system', b'1', '2017-04-18 02:03:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1317, '奉新县', 3, 1315, '0795', '360921', 115.38989900, 28.70067200, 1239, '江西省', 1315, '宜春市', 1317, '奉新县', 'system', 'system', b'1', '2017-04-18 02:03:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1318, '万载县', 3, 1315, '0795', '360922', 114.44901200, 28.10452800, 1239, '江西省', 1315, '宜春市', 1318, '万载县', 'system', 'system', b'1', '2017-04-18 02:03:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1319, '上高县', 3, 1315, '0795', '360923', 114.93265300, 28.23478900, 1239, '江西省', 1315, '宜春市', 1319, '上高县', 'system', 'system', b'1', '2017-04-18 02:03:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1320, '宜丰县', 3, 1315, '0795', '360924', 114.78738100, 28.38828900, 1239, '江西省', 1315, '宜春市', 1320, '宜丰县', 'system', 'system', b'1', '2017-04-18 02:03:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1321, '靖安县', 3, 1315, '0795', '360925', 115.36174400, 28.86054000, 1239, '江西省', 1315, '宜春市', 1321, '靖安县', 'system', 'system', b'1', '2017-04-18 02:03:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1322, '铜鼓县', 3, 1315, '0795', '360926', 114.37014000, 28.52095600, 1239, '江西省', 1315, '宜春市', 1322, '铜鼓县', 'system', 'system', b'1', '2017-04-18 02:03:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1323, '丰城市', 3, 1315, '0795', '360981', 115.78600500, 28.19158400, 1239, '江西省', 1315, '宜春市', 1323, '丰城市', 'system', 'system', b'1', '2017-04-18 02:03:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1324, '樟树市', 3, 1315, '0795', '360982', 115.54338800, 28.05589800, 1239, '江西省', 1315, '宜春市', 1324, '樟树市', 'system', 'system', b'1', '2017-04-18 02:03:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1325, '高安市', 3, 1315, '0795', '360983', 115.38152700, 28.42095100, 1239, '江西省', 1315, '宜春市', 1325, '高安市', 'system', 'system', b'1', '2017-04-18 02:03:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1326, '抚州市', 2, 1239, '0794', '361000', 116.35835100, 27.98385000, 1239, '江西省', 1326, '抚州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1327, '临川区', 3, 1326, '0794', '361002', 116.36140400, 27.98191900, 1239, '江西省', 1326, '抚州市', 1327, '临川区', 'system', 'system', b'1', '2017-04-18 02:03:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1328, '南城县', 3, 1326, '0794', '361021', 116.63945000, 27.55531000, 1239, '江西省', 1326, '抚州市', 1328, '南城县', 'system', 'system', b'1', '2017-04-18 02:03:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1329, '黎川县', 3, 1326, '0794', '361022', 116.91457000, 27.29256100, 1239, '江西省', 1326, '抚州市', 1329, '黎川县', 'system', 'system', b'1', '2017-04-18 02:03:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1330, '南丰县', 3, 1326, '0794', '361023', 116.53299400, 27.21013200, 1239, '江西省', 1326, '抚州市', 1330, '南丰县', 'system', 'system', b'1', '2017-04-18 02:03:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1331, '崇仁县', 3, 1326, '0794', '361024', 116.05910900, 27.76090700, 1239, '江西省', 1326, '抚州市', 1331, '崇仁县', 'system', 'system', b'1', '2017-04-18 02:03:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1332, '乐安县', 3, 1326, '0794', '361025', 115.83843200, 27.42010100, 1239, '江西省', 1326, '抚州市', 1332, '乐安县', 'system', 'system', b'1', '2017-04-18 02:03:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1333, '宜黄县', 3, 1326, '0794', '361026', 116.22302300, 27.54651200, 1239, '江西省', 1326, '抚州市', 1333, '宜黄县', 'system', 'system', b'1', '2017-04-18 02:03:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1334, '金溪县', 3, 1326, '0794', '361027', 116.77875100, 27.90738700, 1239, '江西省', 1326, '抚州市', 1334, '金溪县', 'system', 'system', b'1', '2017-04-18 02:03:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1335, '资溪县', 3, 1326, '0794', '361028', 117.06609500, 27.70653000, 1239, '江西省', 1326, '抚州市', 1335, '资溪县', 'system', 'system', b'1', '2017-04-18 02:03:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1336, '东乡县', 3, 1326, '0794', '361029', 116.60534100, 28.23250000, 1239, '江西省', 1326, '抚州市', 1336, '东乡县', 'system', 'system', b'1', '2017-04-18 02:03:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1337, '广昌县', 3, 1326, '0794', '361030', 116.32729100, 26.83842600, 1239, '江西省', 1326, '抚州市', 1337, '广昌县', 'system', 'system', b'1', '2017-04-18 02:03:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1338, '上饶市', 2, 1239, '0793', '361100', 117.97118500, 28.44442000, 1239, '江西省', 1338, '上饶市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:03:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1339, '信州区', 3, 1338, '0793', '361102', 117.97052200, 28.44537800, 1239, '江西省', 1338, '上饶市', 1339, '信州区', 'system', 'system', b'1', '2017-04-18 02:04:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1340, '广丰区', 3, 1338, '0793', '361103', 118.18985200, 28.44028500, 1239, '江西省', 1338, '上饶市', 1340, '广丰区', 'system', 'system', b'1', '2017-04-18 02:04:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1341, '上饶县', 3, 1338, '0793', '361121', 117.90612000, 28.45389700, 1239, '江西省', 1338, '上饶市', 1341, '上饶县', 'system', 'system', b'1', '2017-04-18 02:04:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1342, '玉山县', 3, 1338, '0793', '361123', 118.24440800, 28.67347900, 1239, '江西省', 1338, '上饶市', 1342, '玉山县', 'system', 'system', b'1', '2017-04-18 02:04:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1343, '铅山县', 3, 1338, '0793', '361124', 117.71190600, 28.31089200, 1239, '江西省', 1338, '上饶市', 1343, '铅山县', 'system', 'system', b'1', '2017-04-18 02:04:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1344, '横峰县', 3, 1338, '0793', '361125', 117.60824700, 28.41510300, 1239, '江西省', 1338, '上饶市', 1344, '横峰县', 'system', 'system', b'1', '2017-04-18 02:04:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1345, '弋阳县', 3, 1338, '0793', '361126', 117.43500200, 28.40239100, 1239, '江西省', 1338, '上饶市', 1345, '弋阳县', 'system', 'system', b'1', '2017-04-18 02:04:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1346, '余干县', 3, 1338, '0793', '361127', 116.69107200, 28.69173000, 1239, '江西省', 1338, '上饶市', 1346, '余干县', 'system', 'system', b'1', '2017-04-18 02:04:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1347, '鄱阳县', 3, 1338, '0793', '361128', 116.67374800, 28.99337400, 1239, '江西省', 1338, '上饶市', 1347, '鄱阳县', 'system', 'system', b'1', '2017-04-18 02:04:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1348, '万年县', 3, 1338, '0793', '361129', 117.07015000, 28.69258900, 1239, '江西省', 1338, '上饶市', 1348, '万年县', 'system', 'system', b'1', '2017-04-18 02:04:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1349, '婺源县', 3, 1338, '0793', '361130', 117.86219000, 29.25401500, 1239, '江西省', 1338, '上饶市', 1349, '婺源县', 'system', 'system', b'1', '2017-04-18 02:04:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1350, '德兴市', 3, 1338, '0793', '361181', 117.57873200, 28.94503400, 1239, '江西省', 1338, '上饶市', 1350, '德兴市', 'system', 'system', b'1', '2017-04-18 02:04:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1351, '山东省', 1, 1, NULL, '370000', 117.00092300, 36.67580700, 1351, '山东省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1352, '济南市', 2, 1351, '0531', '370100', 117.00092300, 36.67580700, 1351, '山东省', 1352, '济南市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1353, '历下区', 3, 1352, '0531', '370102', 117.03862000, 36.66416900, 1351, '山东省', 1352, '济南市', 1353, '历下区', 'system', 'system', b'1', '2017-04-18 02:04:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1354, '市中区', 3, 1352, '0531', '370103', 116.99898000, 36.65735400, 1351, '山东省', 1352, '济南市', 1354, '市中区', 'system', 'system', b'1', '2017-04-18 02:04:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1355, '槐荫区', 3, 1352, '0531', '370104', 116.94792100, 36.66820500, 1351, '山东省', 1352, '济南市', 1355, '槐荫区', 'system', 'system', b'1', '2017-04-18 02:04:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1356, '天桥区', 3, 1352, '0531', '370105', 116.99608600, 36.69337400, 1351, '山东省', 1352, '济南市', 1356, '天桥区', 'system', 'system', b'1', '2017-04-18 02:04:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1357, '历城区', 3, 1352, '0531', '370112', 117.06374400, 36.68174400, 1351, '山东省', 1352, '济南市', 1357, '历城区', 'system', 'system', b'1', '2017-04-18 02:04:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1358, '长清区', 3, 1352, '0531', '370113', 116.74588000, 36.56104900, 1351, '山东省', 1352, '济南市', 1358, '长清区', 'system', 'system', b'1', '2017-04-18 02:04:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1359, '平阴县', 3, 1352, '0531', '370124', 116.45505400, 36.28692300, 1351, '山东省', 1352, '济南市', 1359, '平阴县', 'system', 'system', b'1', '2017-04-18 02:04:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1360, '济阳县', 3, 1352, '0531', '370125', 117.17603500, 36.97677200, 1351, '山东省', 1352, '济南市', 1360, '济阳县', 'system', 'system', b'1', '2017-04-18 02:04:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1361, '商河县', 3, 1352, '0531', '370126', 117.15636900, 37.31054400, 1351, '山东省', 1352, '济南市', 1361, '商河县', 'system', 'system', b'1', '2017-04-18 02:04:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1362, '章丘区', 3, 1352, '0531', '370181', 117.54069000, 36.71209000, 1351, '山东省', 1352, '济南市', 1362, '章丘区', 'system', 'system', b'1', '2017-04-18 02:04:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1363, '青岛市', 2, 1351, '0532', '370200', 120.35517300, 36.08298200, 1351, '山东省', 1363, '青岛市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1364, '市南区', 3, 1363, '0532', '370202', 120.39596600, 36.07089200, 1351, '山东省', 1363, '青岛市', 1364, '市南区', 'system', 'system', b'1', '2017-04-18 02:04:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1365, '市北区', 3, 1363, '0532', '370203', 120.35502600, 36.08381900, 1351, '山东省', 1363, '青岛市', 1365, '市北区', 'system', 'system', b'1', '2017-04-18 02:04:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1366, '黄岛区', 3, 1363, '0532', '370211', 119.99551800, 35.87513800, 1351, '山东省', 1363, '青岛市', 1366, '黄岛区', 'system', 'system', b'1', '2017-04-18 02:04:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1367, '崂山区', 3, 1363, '0532', '370212', 120.46739300, 36.10256900, 1351, '山东省', 1363, '青岛市', 1367, '崂山区', 'system', 'system', b'1', '2017-04-18 02:04:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1368, '李沧区', 3, 1363, '0532', '370213', 120.42123600, 36.16002300, 1351, '山东省', 1363, '青岛市', 1368, '李沧区', 'system', 'system', b'1', '2017-04-18 02:04:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1369, '城阳区', 3, 1363, '0532', '370214', 120.38913500, 36.30683300, 1351, '山东省', 1363, '青岛市', 1369, '城阳区', 'system', 'system', b'1', '2017-04-18 02:04:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1370, '胶州市', 3, 1363, '0532', '370281', 120.00620200, 36.28587800, 1351, '山东省', 1363, '青岛市', 1370, '胶州市', 'system', 'system', b'1', '2017-04-18 02:04:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1371, '即墨市', 3, 1363, '0532', '370282', 120.44735200, 36.39084700, 1351, '山东省', 1363, '青岛市', 1371, '即墨市', 'system', 'system', b'1', '2017-04-18 02:04:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1372, '平度市', 3, 1363, '0532', '370283', 119.95901200, 36.78882800, 1351, '山东省', 1363, '青岛市', 1372, '平度市', 'system', 'system', b'1', '2017-04-18 02:04:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1373, '莱西市', 3, 1363, '0532', '370285', 120.52622600, 36.86509000, 1351, '山东省', 1363, '青岛市', 1373, '莱西市', 'system', 'system', b'1', '2017-04-18 02:04:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1374, '淄博市', 2, 1351, '0533', '370300', 118.04764800, 36.81493900, 1351, '山东省', 1374, '淄博市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1375, '淄川区', 3, 1374, '0533', '370302', 117.96769600, 36.64727200, 1351, '山东省', 1374, '淄博市', 1375, '淄川区', 'system', 'system', b'1', '2017-04-18 02:04:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1376, '张店区', 3, 1374, '0533', '370303', 118.05352100, 36.80704900, 1351, '山东省', 1374, '淄博市', 1376, '张店区', 'system', 'system', b'1', '2017-04-18 02:04:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1377, '博山区', 3, 1374, '0533', '370304', 117.85823000, 36.49756700, 1351, '山东省', 1374, '淄博市', 1377, '博山区', 'system', 'system', b'1', '2017-04-18 02:04:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1378, '临淄区', 3, 1374, '0533', '370305', 118.30601800, 36.81665700, 1351, '山东省', 1374, '淄博市', 1378, '临淄区', 'system', 'system', b'1', '2017-04-18 02:04:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1379, '周村区', 3, 1374, '0533', '370306', 117.85103600, 36.80369900, 1351, '山东省', 1374, '淄博市', 1379, '周村区', 'system', 'system', b'1', '2017-04-18 02:04:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1380, '桓台县', 3, 1374, '0533', '370321', 118.10155600, 36.95977300, 1351, '山东省', 1374, '淄博市', 1380, '桓台县', 'system', 'system', b'1', '2017-04-18 02:04:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1381, '高青县', 3, 1374, '0533', '370322', 117.82983900, 37.16958100, 1351, '山东省', 1374, '淄博市', 1381, '高青县', 'system', 'system', b'1', '2017-04-18 02:04:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1382, '沂源县', 3, 1374, '0533', '370323', 118.16616100, 36.18628200, 1351, '山东省', 1374, '淄博市', 1382, '沂源县', 'system', 'system', b'1', '2017-04-18 02:04:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1383, '枣庄市', 2, 1351, '0632', '370400', 117.55796400, 34.85642400, 1351, '山东省', 1383, '枣庄市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1384, '市中区', 3, 1383, '0632', '370402', 117.55728100, 34.85665100, 1351, '山东省', 1383, '枣庄市', 1384, '市中区', 'system', 'system', b'1', '2017-04-18 02:04:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1385, '薛城区', 3, 1383, '0632', '370403', 117.26529300, 34.79789000, 1351, '山东省', 1383, '枣庄市', 1385, '薛城区', 'system', 'system', b'1', '2017-04-18 02:04:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1386, '峄城区', 3, 1383, '0632', '370404', 117.58631600, 34.76771300, 1351, '山东省', 1383, '枣庄市', 1386, '峄城区', 'system', 'system', b'1', '2017-04-18 02:04:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1387, '台儿庄区', 3, 1383, '0632', '370405', 117.73474700, 34.56481500, 1351, '山东省', 1383, '枣庄市', 1387, '台儿庄区', 'system', 'system', b'1', '2017-04-18 02:04:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1388, '山亭区', 3, 1383, '0632', '370406', 117.45896800, 35.09607700, 1351, '山东省', 1383, '枣庄市', 1388, '山亭区', 'system', 'system', b'1', '2017-04-18 02:04:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1389, '滕州市', 3, 1383, '0632', '370481', 117.16209800, 35.08849800, 1351, '山东省', 1383, '枣庄市', 1389, '滕州市', 'system', 'system', b'1', '2017-04-18 02:04:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1390, '东营市', 2, 1351, '0546', '370500', 118.66471000, 37.43456400, 1351, '山东省', 1390, '东营市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1391, '东营区', 3, 1390, '0546', '370502', 118.50754300, 37.46156700, 1351, '山东省', 1390, '东营市', 1391, '东营区', 'system', 'system', b'1', '2017-04-18 02:04:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1392, '河口区', 3, 1390, '0546', '370503', 118.52961300, 37.88601500, 1351, '山东省', 1390, '东营市', 1392, '河口区', 'system', 'system', b'1', '2017-04-18 02:04:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1393, '垦利区', 3, 1390, '0546', '370505', 118.55131400, 37.58867900, 1351, '山东省', 1390, '东营市', 1393, '垦利区', 'system', 'system', b'1', '2017-04-18 02:04:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1394, '利津县', 3, 1390, '0546', '370522', 118.24885400, 37.49336500, 1351, '山东省', 1390, '东营市', 1394, '利津县', 'system', 'system', b'1', '2017-04-18 02:04:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1395, '广饶县', 3, 1390, '0546', '370523', 118.40752200, 37.05161000, 1351, '山东省', 1390, '东营市', 1395, '广饶县', 'system', 'system', b'1', '2017-04-18 02:04:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1396, '烟台市', 2, 1351, '0535', '370600', 121.39138200, 37.53929700, 1351, '山东省', 1396, '烟台市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1397, '芝罘区', 3, 1396, '0535', '370602', 121.38587700, 37.54092500, 1351, '山东省', 1396, '烟台市', 1397, '芝罘区', 'system', 'system', b'1', '2017-04-18 02:04:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1398, '福山区', 3, 1396, '0535', '370611', 121.26474100, 37.49687500, 1351, '山东省', 1396, '烟台市', 1398, '福山区', 'system', 'system', b'1', '2017-04-18 02:04:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1399, '牟平区', 3, 1396, '0535', '370612', 121.60151000, 37.38835600, 1351, '山东省', 1396, '烟台市', 1399, '牟平区', 'system', 'system', b'1', '2017-04-18 02:04:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1400, '莱山区', 3, 1396, '0535', '370613', 121.44886600, 37.47354900, 1351, '山东省', 1396, '烟台市', 1400, '莱山区', 'system', 'system', b'1', '2017-04-18 02:04:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1401, '长岛县', 3, 1396, '0535', '370634', 120.73834500, 37.91619400, 1351, '山东省', 1396, '烟台市', 1401, '长岛县', 'system', 'system', b'1', '2017-04-18 02:04:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1402, '龙口市', 3, 1396, '0535', '370681', 120.52832800, 37.64844600, 1351, '山东省', 1396, '烟台市', 1402, '龙口市', 'system', 'system', b'1', '2017-04-18 02:04:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1403, '莱阳市', 3, 1396, '0535', '370682', 120.71115100, 36.97703700, 1351, '山东省', 1396, '烟台市', 1403, '莱阳市', 'system', 'system', b'1', '2017-04-18 02:04:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1404, '莱州市', 3, 1396, '0535', '370683', 119.94213500, 37.18272500, 1351, '山东省', 1396, '烟台市', 1404, '莱州市', 'system', 'system', b'1', '2017-04-18 02:04:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1405, '蓬莱市', 3, 1396, '0535', '370684', 120.76268900, 37.81116800, 1351, '山东省', 1396, '烟台市', 1405, '蓬莱市', 'system', 'system', b'1', '2017-04-18 02:04:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1406, '招远市', 3, 1396, '0535', '370685', 120.40314200, 37.36491900, 1351, '山东省', 1396, '烟台市', 1406, '招远市', 'system', 'system', b'1', '2017-04-18 02:04:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1407, '栖霞市', 3, 1396, '0535', '370686', 120.83409700, 37.30585400, 1351, '山东省', 1396, '烟台市', 1407, '栖霞市', 'system', 'system', b'1', '2017-04-18 02:04:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1408, '海阳市', 3, 1396, '0535', '370687', 121.16839200, 36.78065700, 1351, '山东省', 1396, '烟台市', 1408, '海阳市', 'system', 'system', b'1', '2017-04-18 02:04:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1409, '潍坊市', 2, 1351, '0536', '370700', 119.10707800, 36.70925000, 1351, '山东省', 1409, '潍坊市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1410, '潍城区', 3, 1409, '0536', '370702', 119.10378400, 36.71006200, 1351, '山东省', 1409, '潍坊市', 1410, '潍城区', 'system', 'system', b'1', '2017-04-18 02:04:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1411, '寒亭区', 3, 1409, '0536', '370703', 119.20786600, 36.77210300, 1351, '山东省', 1409, '潍坊市', 1411, '寒亭区', 'system', 'system', b'1', '2017-04-18 02:04:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1412, '坊子区', 3, 1409, '0536', '370704', 119.16632600, 36.65461600, 1351, '山东省', 1409, '潍坊市', 1412, '坊子区', 'system', 'system', b'1', '2017-04-18 02:04:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1413, '奎文区', 3, 1409, '0536', '370705', 119.13735700, 36.70949400, 1351, '山东省', 1409, '潍坊市', 1413, '奎文区', 'system', 'system', b'1', '2017-04-18 02:04:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1414, '临朐县', 3, 1409, '0536', '370724', 118.53987600, 36.51637100, 1351, '山东省', 1409, '潍坊市', 1414, '临朐县', 'system', 'system', b'1', '2017-04-18 02:04:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1415, '昌乐县', 3, 1409, '0536', '370725', 118.83999500, 36.70325300, 1351, '山东省', 1409, '潍坊市', 1415, '昌乐县', 'system', 'system', b'1', '2017-04-18 02:04:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1416, '青州市', 3, 1409, '0536', '370781', 118.48469300, 36.69785500, 1351, '山东省', 1409, '潍坊市', 1416, '青州市', 'system', 'system', b'1', '2017-04-18 02:04:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1417, '诸城市', 3, 1409, '0536', '370782', 119.40318200, 35.99709300, 1351, '山东省', 1409, '潍坊市', 1417, '诸城市', 'system', 'system', b'1', '2017-04-18 02:04:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1418, '寿光市', 3, 1409, '0536', '370783', 118.73645100, 36.87441100, 1351, '山东省', 1409, '潍坊市', 1418, '寿光市', 'system', 'system', b'1', '2017-04-18 02:04:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1419, '安丘市', 3, 1409, '0536', '370784', 119.20688600, 36.42741700, 1351, '山东省', 1409, '潍坊市', 1419, '安丘市', 'system', 'system', b'1', '2017-04-18 02:04:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1420, '高密市', 3, 1409, '0536', '370785', 119.75703300, 36.37754000, 1351, '山东省', 1409, '潍坊市', 1420, '高密市', 'system', 'system', b'1', '2017-04-18 02:04:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1421, '昌邑市', 3, 1409, '0536', '370786', 119.39450200, 36.85493700, 1351, '山东省', 1409, '潍坊市', 1421, '昌邑市', 'system', 'system', b'1', '2017-04-18 02:04:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1422, '济宁市', 2, 1351, '0537', '370800', 116.58724500, 35.41539300, 1351, '山东省', 1422, '济宁市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1423, '任城区', 3, 1422, '0537', '370811', 116.59526100, 35.41482800, 1351, '山东省', 1422, '济宁市', 1423, '任城区', 'system', 'system', b'1', '2017-04-18 02:04:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1424, '兖州区', 3, 1422, '0537', '370812', 116.82899600, 35.55644500, 1351, '山东省', 1422, '济宁市', 1424, '兖州区', 'system', 'system', b'1', '2017-04-18 02:04:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1425, '微山县', 3, 1422, '0537', '370826', 117.12861000, 34.80952500, 1351, '山东省', 1422, '济宁市', 1425, '微山县', 'system', 'system', b'1', '2017-04-18 02:04:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1426, '鱼台县', 3, 1422, '0537', '370827', 116.65002300, 34.99770600, 1351, '山东省', 1422, '济宁市', 1426, '鱼台县', 'system', 'system', b'1', '2017-04-18 02:04:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1427, '金乡县', 3, 1422, '0537', '370828', 116.31036400, 35.06977000, 1351, '山东省', 1422, '济宁市', 1427, '金乡县', 'system', 'system', b'1', '2017-04-18 02:04:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1428, '嘉祥县', 3, 1422, '0537', '370829', 116.34288500, 35.39809800, 1351, '山东省', 1422, '济宁市', 1428, '嘉祥县', 'system', 'system', b'1', '2017-04-18 02:04:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1429, '汶上县', 3, 1422, '0537', '370830', 116.48714600, 35.72174600, 1351, '山东省', 1422, '济宁市', 1429, '汶上县', 'system', 'system', b'1', '2017-04-18 02:04:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1430, '泗水县', 3, 1422, '0537', '370831', 117.27360500, 35.65321600, 1351, '山东省', 1422, '济宁市', 1430, '泗水县', 'system', 'system', b'1', '2017-04-18 02:04:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1431, '梁山县', 3, 1422, '0537', '370832', 116.08963000, 35.80184300, 1351, '山东省', 1422, '济宁市', 1431, '梁山县', 'system', 'system', b'1', '2017-04-18 02:04:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1432, '曲阜市', 3, 1422, '0537', '370881', 116.99188500, 35.59278800, 1351, '山东省', 1422, '济宁市', 1432, '曲阜市', 'system', 'system', b'1', '2017-04-18 02:04:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1433, '邹城市', 3, 1422, '0537', '370883', 116.96673000, 35.40525900, 1351, '山东省', 1422, '济宁市', 1433, '邹城市', 'system', 'system', b'1', '2017-04-18 02:04:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1434, '泰安市', 2, 1351, '0538', '370900', 117.12906300, 36.19496800, 1351, '山东省', 1434, '泰安市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1435, '泰山区', 3, 1434, '0538', '370902', 117.12998400, 36.18931300, 1351, '山东省', 1434, '泰安市', 1435, '泰山区', 'system', 'system', b'1', '2017-04-18 02:04:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1436, '岱岳区', 3, 1434, '0538', '370911', 117.04353000, 36.18410000, 1351, '山东省', 1434, '泰安市', 1436, '岱岳区', 'system', 'system', b'1', '2017-04-18 02:04:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1437, '宁阳县', 3, 1434, '0538', '370921', 116.79929700, 35.76754000, 1351, '山东省', 1434, '泰安市', 1437, '宁阳县', 'system', 'system', b'1', '2017-04-18 02:04:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1438, '东平县', 3, 1434, '0538', '370923', 116.46105200, 35.93046700, 1351, '山东省', 1434, '泰安市', 1438, '东平县', 'system', 'system', b'1', '2017-04-18 02:04:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1439, '新泰市', 3, 1434, '0538', '370982', 117.76609200, 35.91038700, 1351, '山东省', 1434, '泰安市', 1439, '新泰市', 'system', 'system', b'1', '2017-04-18 02:04:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1440, '肥城市', 3, 1434, '0538', '370983', 116.76370300, 36.18560000, 1351, '山东省', 1434, '泰安市', 1440, '肥城市', 'system', 'system', b'1', '2017-04-18 02:04:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1441, '威海市', 2, 1351, '0631', '371000', 122.11639400, 37.50969100, 1351, '山东省', 1441, '威海市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1442, '环翠区', 3, 1441, '0631', '371002', 122.11618900, 37.51075400, 1351, '山东省', 1441, '威海市', 1442, '环翠区', 'system', 'system', b'1', '2017-04-18 02:04:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1443, '文登区', 3, 1441, '0631', '371003', 122.05713900, 37.19621100, 1351, '山东省', 1441, '威海市', 1443, '文登区', 'system', 'system', b'1', '2017-04-18 02:04:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1444, '荣成市', 3, 1441, '0631', '371082', 122.42289600, 37.16013400, 1351, '山东省', 1441, '威海市', 1444, '荣成市', 'system', 'system', b'1', '2017-04-18 02:04:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1445, '乳山市', 3, 1441, '0631', '371083', 121.53634600, 36.91962200, 1351, '山东省', 1441, '威海市', 1445, '乳山市', 'system', 'system', b'1', '2017-04-18 02:04:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1446, '日照市', 2, 1351, '0633', '371100', 119.46120800, 35.42858800, 1351, '山东省', 1446, '日照市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1447, '东港区', 3, 1446, '0633', '371102', 119.45770300, 35.42615200, 1351, '山东省', 1446, '日照市', 1447, '东港区', 'system', 'system', b'1', '2017-04-18 02:04:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1448, '岚山区', 3, 1446, '0633', '371103', 119.31584400, 35.11979400, 1351, '山东省', 1446, '日照市', 1448, '岚山区', 'system', 'system', b'1', '2017-04-18 02:04:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1449, '五莲县', 3, 1446, '0633', '371121', 119.20674500, 35.75193600, 1351, '山东省', 1446, '日照市', 1449, '五莲县', 'system', 'system', b'1', '2017-04-18 02:04:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1450, '莒县', 3, 1446, '0633', '371122', 118.83285900, 35.58811500, 1351, '山东省', 1446, '日照市', 1450, '莒县', 'system', 'system', b'1', '2017-04-18 02:04:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1451, '莱芜市', 2, 1351, '0634', '371200', 117.67773600, 36.21439700, 1351, '山东省', 1451, '莱芜市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1452, '莱城区', 3, 1451, '0634', '371202', 117.67835100, 36.21366200, 1351, '山东省', 1451, '莱芜市', 1452, '莱城区', 'system', 'system', b'1', '2017-04-18 02:04:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1453, '钢城区', 3, 1451, '0634', '371203', 117.82033000, 36.05803800, 1351, '山东省', 1451, '莱芜市', 1453, '钢城区', 'system', 'system', b'1', '2017-04-18 02:04:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1454, '临沂市', 2, 1351, '0539', '371300', 118.32644300, 35.06528200, 1351, '山东省', 1454, '临沂市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1455, '兰山区', 3, 1454, '0539', '371302', 118.32766700, 35.06163100, 1351, '山东省', 1454, '临沂市', 1455, '兰山区', 'system', 'system', b'1', '2017-04-18 02:04:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1456, '罗庄区', 3, 1454, '0539', '371311', 118.28479500, 34.99720400, 1351, '山东省', 1454, '临沂市', 1456, '罗庄区', 'system', 'system', b'1', '2017-04-18 02:04:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1457, '河东区', 3, 1454, '0539', '371312', 118.39829600, 35.08500400, 1351, '山东省', 1454, '临沂市', 1457, '河东区', 'system', 'system', b'1', '2017-04-18 02:04:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1458, '沂南县', 3, 1454, '0539', '371321', 118.45539500, 35.54700200, 1351, '山东省', 1454, '临沂市', 1458, '沂南县', 'system', 'system', b'1', '2017-04-18 02:04:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1459, '郯城县', 3, 1454, '0539', '371322', 118.34296300, 34.61474100, 1351, '山东省', 1454, '临沂市', 1459, '郯城县', 'system', 'system', b'1', '2017-04-18 02:04:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1460, '沂水县', 3, 1454, '0539', '371323', 118.63454300, 35.78702900, 1351, '山东省', 1454, '临沂市', 1460, '沂水县', 'system', 'system', b'1', '2017-04-18 02:04:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1461, '兰陵县', 3, 1454, '0539', '371324', 118.04996800, 34.85557300, 1351, '山东省', 1454, '临沂市', 1461, '兰陵县', 'system', 'system', b'1', '2017-04-18 02:04:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1462, '费县', 3, 1454, '0539', '371325', 117.96886900, 35.26917400, 1351, '山东省', 1454, '临沂市', 1462, '费县', 'system', 'system', b'1', '2017-04-18 02:04:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1463, '平邑县', 3, 1454, '0539', '371326', 117.63188400, 35.51151900, 1351, '山东省', 1454, '临沂市', 1463, '平邑县', 'system', 'system', b'1', '2017-04-18 02:04:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1464, '莒南县', 3, 1454, '0539', '371327', 118.83832200, 35.17591100, 1351, '山东省', 1454, '临沂市', 1464, '莒南县', 'system', 'system', b'1', '2017-04-18 02:04:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1465, '蒙阴县', 3, 1454, '0539', '371328', 117.94327100, 35.71243500, 1351, '山东省', 1454, '临沂市', 1465, '蒙阴县', 'system', 'system', b'1', '2017-04-18 02:04:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1466, '临沭县', 3, 1454, '0539', '371329', 118.64837900, 34.91706200, 1351, '山东省', 1454, '临沂市', 1466, '临沭县', 'system', 'system', b'1', '2017-04-18 02:04:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1467, '德州市', 2, 1351, '0534', '371400', 116.30742800, 37.45396800, 1351, '山东省', 1467, '德州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1468, '德城区', 3, 1467, '0534', '371402', 116.30707600, 37.45392300, 1351, '山东省', 1467, '德州市', 1468, '德城区', 'system', 'system', b'1', '2017-04-18 02:04:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1469, '陵城区', 3, 1467, '0534', '371403', 116.57492900, 37.33284800, 1351, '山东省', 1467, '德州市', 1469, '陵城区', 'system', 'system', b'1', '2017-04-18 02:04:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1470, '宁津县', 3, 1467, '0534', '371422', 116.79372000, 37.64961900, 1351, '山东省', 1467, '德州市', 1470, '宁津县', 'system', 'system', b'1', '2017-04-18 02:04:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1471, '庆云县', 3, 1467, '0534', '371423', 117.39050700, 37.77772400, 1351, '山东省', 1467, '德州市', 1471, '庆云县', 'system', 'system', b'1', '2017-04-18 02:04:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1472, '临邑县', 3, 1467, '0534', '371424', 116.86702800, 37.19204400, 1351, '山东省', 1467, '德州市', 1472, '临邑县', 'system', 'system', b'1', '2017-04-18 02:04:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1473, '齐河县', 3, 1467, '0534', '371425', 116.75839400, 36.79549700, 1351, '山东省', 1467, '德州市', 1473, '齐河县', 'system', 'system', b'1', '2017-04-18 02:04:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1474, '平原县', 3, 1467, '0534', '371426', 116.43390400, 37.16446500, 1351, '山东省', 1467, '德州市', 1474, '平原县', 'system', 'system', b'1', '2017-04-18 02:04:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1475, '夏津县', 3, 1467, '0534', '371427', 116.00381600, 36.95050100, 1351, '山东省', 1467, '德州市', 1475, '夏津县', 'system', 'system', b'1', '2017-04-18 02:04:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1476, '武城县', 3, 1467, '0534', '371428', 116.07862700, 37.20952700, 1351, '山东省', 1467, '德州市', 1476, '武城县', 'system', 'system', b'1', '2017-04-18 02:04:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1477, '乐陵市', 3, 1467, '0534', '371481', 117.21665700, 37.72911500, 1351, '山东省', 1467, '德州市', 1477, '乐陵市', 'system', 'system', b'1', '2017-04-18 02:04:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1478, '禹城市', 3, 1467, '0534', '371482', 116.64255400, 36.93448500, 1351, '山东省', 1467, '德州市', 1478, '禹城市', 'system', 'system', b'1', '2017-04-18 02:04:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1479, '聊城市', 2, 1351, '0635', '371500', 115.98036700, 36.45601300, 1351, '山东省', 1479, '聊城市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1480, '东昌府区', 3, 1479, '0635', '371502', 115.98002300, 36.45606000, 1351, '山东省', 1479, '聊城市', 1480, '东昌府区', 'system', 'system', b'1', '2017-04-18 02:04:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1481, '阳谷县', 3, 1479, '0635', '371521', 115.78428700, 36.11370800, 1351, '山东省', 1479, '聊城市', 1481, '阳谷县', 'system', 'system', b'1', '2017-04-18 02:04:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1482, '莘县', 3, 1479, '0635', '371522', 115.66729100, 36.23759700, 1351, '山东省', 1479, '聊城市', 1482, '莘县', 'system', 'system', b'1', '2017-04-18 02:04:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1483, '茌平县', 3, 1479, '0635', '371523', 116.25335000, 36.59193400, 1351, '山东省', 1479, '聊城市', 1483, '茌平县', 'system', 'system', b'1', '2017-04-18 02:04:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1484, '东阿县', 3, 1479, '0635', '371524', 116.24885500, 36.33600400, 1351, '山东省', 1479, '聊城市', 1484, '东阿县', 'system', 'system', b'1', '2017-04-18 02:04:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1485, '冠县', 3, 1479, '0635', '371525', 115.44480800, 36.48375300, 1351, '山东省', 1479, '聊城市', 1485, '冠县', 'system', 'system', b'1', '2017-04-18 02:04:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1486, '高唐县', 3, 1479, '0635', '371526', 116.22966200, 36.85975500, 1351, '山东省', 1479, '聊城市', 1486, '高唐县', 'system', 'system', b'1', '2017-04-18 02:04:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1487, '临清市', 3, 1479, '0635', '371581', 115.71346200, 36.84259800, 1351, '山东省', 1479, '聊城市', 1487, '临清市', 'system', 'system', b'1', '2017-04-18 02:04:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1488, '滨州市', 2, 1351, '0543', '371600', 118.01697400, 37.38354200, 1351, '山东省', 1488, '滨州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1489, '滨城区', 3, 1488, '0543', '371602', 118.02014900, 37.38484200, 1351, '山东省', 1488, '滨州市', 1489, '滨城区', 'system', 'system', b'1', '2017-04-18 02:04:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1490, '沾化区', 3, 1488, '0543', '371603', 118.12990200, 37.69845600, 1351, '山东省', 1488, '滨州市', 1490, '沾化区', 'system', 'system', b'1', '2017-04-18 02:04:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1491, '惠民县', 3, 1488, '0543', '371621', 117.50894100, 37.48387600, 1351, '山东省', 1488, '滨州市', 1491, '惠民县', 'system', 'system', b'1', '2017-04-18 02:04:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1492, '阳信县', 3, 1488, '0543', '371622', 117.58132600, 37.64049200, 1351, '山东省', 1488, '滨州市', 1492, '阳信县', 'system', 'system', b'1', '2017-04-18 02:04:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1493, '无棣县', 3, 1488, '0543', '371623', 117.61632500, 37.74084800, 1351, '山东省', 1488, '滨州市', 1493, '无棣县', 'system', 'system', b'1', '2017-04-18 02:04:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1494, '博兴县', 3, 1488, '0543', '371625', 118.12309600, 37.14700200, 1351, '山东省', 1488, '滨州市', 1494, '博兴县', 'system', 'system', b'1', '2017-04-18 02:04:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1495, '邹平县', 3, 1488, '0543', '371626', 117.73680700, 36.87803000, 1351, '山东省', 1488, '滨州市', 1495, '邹平县', 'system', 'system', b'1', '2017-04-18 02:04:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1496, '菏泽市', 2, 1351, '0530', '371700', 115.46938100, 35.24653100, 1351, '山东省', 1496, '菏泽市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1497, '牡丹区', 3, 1496, '0530', '371702', 115.47094600, 35.24311000, 1351, '山东省', 1496, '菏泽市', 1497, '牡丹区', 'system', 'system', b'1', '2017-04-18 02:04:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1498, '曹县', 3, 1496, '0530', '371721', 115.54948200, 34.82325300, 1351, '山东省', 1496, '菏泽市', 1498, '曹县', 'system', 'system', b'1', '2017-04-18 02:04:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1499, '单县', 3, 1496, '0530', '371722', 116.08262000, 34.79085100, 1351, '山东省', 1496, '菏泽市', 1499, '单县', 'system', 'system', b'1', '2017-04-18 02:04:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1500, '成武县', 3, 1496, '0530', '371723', 115.89734900, 34.94736600, 1351, '山东省', 1496, '菏泽市', 1500, '成武县', 'system', 'system', b'1', '2017-04-18 02:04:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1501, '巨野县', 3, 1496, '0530', '371724', 116.08934100, 35.39099900, 1351, '山东省', 1496, '菏泽市', 1501, '巨野县', 'system', 'system', b'1', '2017-04-18 02:04:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1502, '郓城县', 3, 1496, '0530', '371725', 115.93885000, 35.59477300, 1351, '山东省', 1496, '菏泽市', 1502, '郓城县', 'system', 'system', b'1', '2017-04-18 02:04:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1503, '鄄城县', 3, 1496, '0530', '371726', 115.51434000, 35.56025700, 1351, '山东省', 1496, '菏泽市', 1503, '鄄城县', 'system', 'system', b'1', '2017-04-18 02:04:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1504, '定陶区', 3, 1496, '0530', '371703', 115.56960100, 35.07270100, 1351, '山东省', 1496, '菏泽市', 1504, '定陶区', 'system', 'system', b'1', '2017-04-18 02:04:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1505, '东明县', 3, 1496, '0530', '371728', 115.09841200, 35.28963700, 1351, '山东省', 1496, '菏泽市', 1505, '东明县', 'system', 'system', b'1', '2017-04-18 02:04:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1506, '河南省', 1, 1, NULL, '410000', 113.66541200, 34.75797500, 1506, '河南省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1507, '郑州市', 2, 1506, '0371', '410100', 113.66541200, 34.75797500, 1506, '河南省', 1507, '郑州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1508, '中原区', 3, 1507, '0371', '410102', 113.61157600, 34.74828600, 1506, '河南省', 1507, '郑州市', 1508, '中原区', 'system', 'system', b'1', '2017-04-18 02:04:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1509, '二七区', 3, 1507, '0371', '410103', 113.64542200, 34.73093600, 1506, '河南省', 1507, '郑州市', 1509, '二七区', 'system', 'system', b'1', '2017-04-18 02:04:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1510, '管城回族区', 3, 1507, '0371', '410104', 113.68531300, 34.74645300, 1506, '河南省', 1507, '郑州市', 1510, '管城回族区', 'system', 'system', b'1', '2017-04-18 02:04:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1511, '金水区', 3, 1507, '0371', '410105', 113.68603700, 34.77583800, 1506, '河南省', 1507, '郑州市', 1511, '金水区', 'system', 'system', b'1', '2017-04-18 02:04:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1512, '上街区', 3, 1507, '0371', '410106', 113.29828200, 34.80868900, 1506, '河南省', 1507, '郑州市', 1512, '上街区', 'system', 'system', b'1', '2017-04-18 02:04:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1513, '惠济区', 3, 1507, '0371', '410108', 113.61836000, 34.82859100, 1506, '河南省', 1507, '郑州市', 1513, '惠济区', 'system', 'system', b'1', '2017-04-18 02:04:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1514, '中牟县', 3, 1507, '0371', '410122', 114.02252100, 34.72197600, 1506, '河南省', 1507, '郑州市', 1514, '中牟县', 'system', 'system', b'1', '2017-04-18 02:04:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1515, '巩义市', 3, 1507, '0371', '410181', 112.98283000, 34.75218000, 1506, '河南省', 1507, '郑州市', 1515, '巩义市', 'system', 'system', b'1', '2017-04-18 02:04:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1516, '荥阳市', 3, 1507, '0371', '410182', 113.39152300, 34.78907700, 1506, '河南省', 1507, '郑州市', 1516, '荥阳市', 'system', 'system', b'1', '2017-04-18 02:04:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1517, '新密市', 3, 1507, '0371', '410183', 113.38061600, 34.53784600, 1506, '河南省', 1507, '郑州市', 1517, '新密市', 'system', 'system', b'1', '2017-04-18 02:04:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1518, '新郑市', 3, 1507, '0371', '410184', 113.73967000, 34.39421900, 1506, '河南省', 1507, '郑州市', 1518, '新郑市', 'system', 'system', b'1', '2017-04-18 02:04:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1519, '登封市', 3, 1507, '0371', '410185', 113.03776800, 34.45993900, 1506, '河南省', 1507, '郑州市', 1519, '登封市', 'system', 'system', b'1', '2017-04-18 02:04:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1520, '开封市', 2, 1506, '0378', '410200', 114.34144700, 34.79704900, 1506, '河南省', 1520, '开封市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1521, '龙亭区', 3, 1520, '0378', '410202', 114.35334800, 34.79983300, 1506, '河南省', 1520, '开封市', 1521, '龙亭区', 'system', 'system', b'1', '2017-04-18 02:04:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1522, '顺河回族区', 3, 1520, '0378', '410203', 114.36487500, 34.80045900, 1506, '河南省', 1520, '开封市', 1522, '顺河回族区', 'system', 'system', b'1', '2017-04-18 02:04:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1523, '鼓楼区', 3, 1520, '0378', '410204', 114.34850000, 34.79238300, 1506, '河南省', 1520, '开封市', 1523, '鼓楼区', 'system', 'system', b'1', '2017-04-18 02:04:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1524, '禹王台区', 3, 1520, '0378', '410205', 114.35024600, 34.77972700, 1506, '河南省', 1520, '开封市', 1524, '禹王台区', 'system', 'system', b'1', '2017-04-18 02:04:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1525, '祥符区', 3, 1520, '0378', '410212', 114.43762200, 34.75647600, 1506, '河南省', 1520, '开封市', 1525, '祥符区', 'system', 'system', b'1', '2017-04-18 02:04:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1526, '杞县', 3, 1520, '0378', '410221', 114.77047200, 34.55458500, 1506, '河南省', 1520, '开封市', 1526, '杞县', 'system', 'system', b'1', '2017-04-18 02:04:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1527, '通许县', 3, 1520, '0378', '410222', 114.46773400, 34.47730200, 1506, '河南省', 1520, '开封市', 1527, '通许县', 'system', 'system', b'1', '2017-04-18 02:04:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1528, '尉氏县', 3, 1520, '0378', '410223', 114.19392700, 34.41225600, 1506, '河南省', 1520, '开封市', 1528, '尉氏县', 'system', 'system', b'1', '2017-04-18 02:04:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1529, '兰考县', 3, 1520, '0378', '410225', 114.82057200, 34.82989900, 1506, '河南省', 1520, '开封市', 1529, '兰考县', 'system', 'system', b'1', '2017-04-18 02:04:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1530, '洛阳市', 2, 1506, '0379', '410300', 112.43446800, 34.66304100, 1506, '河南省', 1530, '洛阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1531, '老城区', 3, 1530, '0379', '410302', 112.47729800, 34.68294500, 1506, '河南省', 1530, '洛阳市', 1531, '老城区', 'system', 'system', b'1', '2017-04-18 02:04:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1532, '西工区', 3, 1530, '0379', '410303', 112.44323200, 34.66784700, 1506, '河南省', 1530, '洛阳市', 1532, '西工区', 'system', 'system', b'1', '2017-04-18 02:04:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1533, '瀍河回族区', 3, 1530, '0379', '410304', 112.49162500, 34.68473800, 1506, '河南省', 1530, '洛阳市', 1533, '瀍河回族区', 'system', 'system', b'1', '2017-04-18 02:04:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1534, '涧西区', 3, 1530, '0379', '410305', 112.39924300, 34.65425100, 1506, '河南省', 1530, '洛阳市', 1534, '涧西区', 'system', 'system', b'1', '2017-04-18 02:04:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1535, '吉利区', 3, 1530, '0379', '410306', 112.58479600, 34.89909300, 1506, '河南省', 1530, '洛阳市', 1535, '吉利区', 'system', 'system', b'1', '2017-04-18 02:04:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1536, '洛龙区', 3, 1530, '0379', '410311', 112.45663400, 34.61855700, 1506, '河南省', 1530, '洛阳市', 1536, '洛龙区', 'system', 'system', b'1', '2017-04-18 02:04:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1537, '孟津县', 3, 1530, '0379', '410322', 112.44389200, 34.82648500, 1506, '河南省', 1530, '洛阳市', 1537, '孟津县', 'system', 'system', b'1', '2017-04-18 02:04:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1538, '新安县', 3, 1530, '0379', '410323', 112.14140300, 34.72867900, 1506, '河南省', 1530, '洛阳市', 1538, '新安县', 'system', 'system', b'1', '2017-04-18 02:04:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1539, '栾川县', 3, 1530, '0379', '410324', 111.61838600, 33.78319500, 1506, '河南省', 1530, '洛阳市', 1539, '栾川县', 'system', 'system', b'1', '2017-04-18 02:04:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1540, '嵩县', 3, 1530, '0379', '410325', 112.08776500, 34.13156300, 1506, '河南省', 1530, '洛阳市', 1540, '嵩县', 'system', 'system', b'1', '2017-04-18 02:04:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1541, '汝阳县', 3, 1530, '0379', '410326', 112.47378900, 34.15323000, 1506, '河南省', 1530, '洛阳市', 1541, '汝阳县', 'system', 'system', b'1', '2017-04-18 02:04:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1542, '宜阳县', 3, 1530, '0379', '410327', 112.17998900, 34.51647800, 1506, '河南省', 1530, '洛阳市', 1542, '宜阳县', 'system', 'system', b'1', '2017-04-18 02:04:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1543, '洛宁县', 3, 1530, '0379', '410328', 111.65539900, 34.38717900, 1506, '河南省', 1530, '洛阳市', 1543, '洛宁县', 'system', 'system', b'1', '2017-04-18 02:04:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1544, '伊川县', 3, 1530, '0379', '410329', 112.42938400, 34.42341600, 1506, '河南省', 1530, '洛阳市', 1544, '伊川县', 'system', 'system', b'1', '2017-04-18 02:04:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1545, '偃师市', 3, 1530, '0379', '410381', 112.78773900, 34.72304200, 1506, '河南省', 1530, '洛阳市', 1545, '偃师市', 'system', 'system', b'1', '2017-04-18 02:04:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1546, '平顶山市', 2, 1506, '0375', '410400', 113.30771800, 33.73524100, 1506, '河南省', 1546, '平顶山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1547, '新华区', 3, 1546, '0375', '410402', 113.29906100, 33.73757900, 1506, '河南省', 1546, '平顶山市', 1547, '新华区', 'system', 'system', b'1', '2017-04-18 02:04:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1548, '卫东区', 3, 1546, '0375', '410403', 113.31032700, 33.73928500, 1506, '河南省', 1546, '平顶山市', 1548, '卫东区', 'system', 'system', b'1', '2017-04-18 02:04:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1549, '石龙区', 3, 1546, '0375', '410404', 112.88988500, 33.90153800, 1506, '河南省', 1546, '平顶山市', 1549, '石龙区', 'system', 'system', b'1', '2017-04-18 02:04:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1550, '湛河区', 3, 1546, '0375', '410411', 113.32087300, 33.72568100, 1506, '河南省', 1546, '平顶山市', 1550, '湛河区', 'system', 'system', b'1', '2017-04-18 02:04:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1551, '宝丰县', 3, 1546, '0375', '410421', 113.06681200, 33.86635900, 1506, '河南省', 1546, '平顶山市', 1551, '宝丰县', 'system', 'system', b'1', '2017-04-18 02:04:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1552, '叶县', 3, 1546, '0375', '410422', 113.35829800, 33.62125200, 1506, '河南省', 1546, '平顶山市', 1552, '叶县', 'system', 'system', b'1', '2017-04-18 02:04:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1553, '鲁山县', 3, 1546, '0375', '410423', 112.90670300, 33.74032500, 1506, '河南省', 1546, '平顶山市', 1553, '鲁山县', 'system', 'system', b'1', '2017-04-18 02:04:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1554, '郏县', 3, 1546, '0375', '410425', 113.22045100, 33.97199300, 1506, '河南省', 1546, '平顶山市', 1554, '郏县', 'system', 'system', b'1', '2017-04-18 02:04:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1555, '舞钢市', 3, 1546, '0375', '410481', 113.52625000, 33.30208200, 1506, '河南省', 1546, '平顶山市', 1555, '舞钢市', 'system', 'system', b'1', '2017-04-18 02:04:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1556, '汝州市', 3, 1546, '0375', '410482', 112.84533600, 34.16740800, 1506, '河南省', 1546, '平顶山市', 1556, '汝州市', 'system', 'system', b'1', '2017-04-18 02:04:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1557, '安阳市', 2, 1506, '0372', '410500', 114.35248200, 36.10344200, 1506, '河南省', 1557, '安阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1558, '文峰区', 3, 1557, '0372', '410502', 114.35256200, 36.09810100, 1506, '河南省', 1557, '安阳市', 1558, '文峰区', 'system', 'system', b'1', '2017-04-18 02:04:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1559, '北关区', 3, 1557, '0372', '410503', 114.35264600, 36.10978000, 1506, '河南省', 1557, '安阳市', 1559, '北关区', 'system', 'system', b'1', '2017-04-18 02:04:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1560, '殷都区', 3, 1557, '0372', '410505', 114.30009800, 36.10897400, 1506, '河南省', 1557, '安阳市', 1560, '殷都区', 'system', 'system', b'1', '2017-04-18 02:04:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1561, '龙安区', 3, 1557, '0372', '410506', 114.32352200, 36.09556800, 1506, '河南省', 1557, '安阳市', 1561, '龙安区', 'system', 'system', b'1', '2017-04-18 02:04:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1562, '安阳县', 3, 1557, '0372', '410522', 114.13020700, 36.13058500, 1506, '河南省', 1557, '安阳市', 1562, '安阳县', 'system', 'system', b'1', '2017-04-18 02:04:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1563, '汤阴县', 3, 1557, '0372', '410523', 114.36235700, 35.92234900, 1506, '河南省', 1557, '安阳市', 1563, '汤阴县', 'system', 'system', b'1', '2017-04-18 02:04:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1564, '滑县', 3, 1557, '0372', '410526', 114.52400000, 35.57462800, 1506, '河南省', 1557, '安阳市', 1564, '滑县', 'system', 'system', b'1', '2017-04-18 02:04:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1565, '内黄县', 3, 1557, '0372', '410527', 114.90458200, 35.95370200, 1506, '河南省', 1557, '安阳市', 1565, '内黄县', 'system', 'system', b'1', '2017-04-18 02:04:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1566, '林州市', 3, 1557, '0372', '410581', 113.82376700, 36.06340300, 1506, '河南省', 1557, '安阳市', 1566, '林州市', 'system', 'system', b'1', '2017-04-18 02:04:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1567, '鹤壁市', 2, 1506, '0392', '410600', 114.29544400, 35.74823600, 1506, '河南省', 1567, '鹤壁市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1568, '鹤山区', 3, 1567, '0392', '410602', 114.16655100, 35.93612800, 1506, '河南省', 1567, '鹤壁市', 1568, '鹤山区', 'system', 'system', b'1', '2017-04-18 02:04:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1569, '山城区', 3, 1567, '0392', '410603', 114.18420200, 35.89605800, 1506, '河南省', 1567, '鹤壁市', 1569, '山城区', 'system', 'system', b'1', '2017-04-18 02:04:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1570, '淇滨区', 3, 1567, '0392', '410611', 114.29391700, 35.74838200, 1506, '河南省', 1567, '鹤壁市', 1570, '淇滨区', 'system', 'system', b'1', '2017-04-18 02:04:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1571, '浚县', 3, 1567, '0392', '410621', 114.55016200, 35.67128200, 1506, '河南省', 1567, '鹤壁市', 1571, '浚县', 'system', 'system', b'1', '2017-04-18 02:04:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1572, '淇县', 3, 1567, '0392', '410622', 114.20037900, 35.60947800, 1506, '河南省', 1567, '鹤壁市', 1572, '淇县', 'system', 'system', b'1', '2017-04-18 02:04:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1573, '新乡市', 2, 1506, '0373', '410700', 113.88399100, 35.30261600, 1506, '河南省', 1573, '新乡市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1574, '红旗区', 3, 1573, '0373', '410702', 113.87815800, 35.30268400, 1506, '河南省', 1573, '新乡市', 1574, '红旗区', 'system', 'system', b'1', '2017-04-18 02:04:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1575, '卫滨区', 3, 1573, '0373', '410703', 113.86606500, 35.30490500, 1506, '河南省', 1573, '新乡市', 1575, '卫滨区', 'system', 'system', b'1', '2017-04-18 02:04:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1576, '凤泉区', 3, 1573, '0373', '410704', 113.90671200, 35.37985500, 1506, '河南省', 1573, '新乡市', 1576, '凤泉区', 'system', 'system', b'1', '2017-04-18 02:04:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1577, '牧野区', 3, 1573, '0373', '410711', 113.89716000, 35.31297400, 1506, '河南省', 1573, '新乡市', 1577, '牧野区', 'system', 'system', b'1', '2017-04-18 02:04:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1578, '新乡县', 3, 1573, '0373', '410721', 113.80618600, 35.19002100, 1506, '河南省', 1573, '新乡市', 1578, '新乡县', 'system', 'system', b'1', '2017-04-18 02:04:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1579, '获嘉县', 3, 1573, '0373', '410724', 113.65724900, 35.26168500, 1506, '河南省', 1573, '新乡市', 1579, '获嘉县', 'system', 'system', b'1', '2017-04-18 02:04:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1580, '原阳县', 3, 1573, '0373', '410725', 113.96596600, 35.05400100, 1506, '河南省', 1573, '新乡市', 1580, '原阳县', 'system', 'system', b'1', '2017-04-18 02:04:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1581, '延津县', 3, 1573, '0373', '410726', 114.20098200, 35.14951500, 1506, '河南省', 1573, '新乡市', 1581, '延津县', 'system', 'system', b'1', '2017-04-18 02:04:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1582, '封丘县', 3, 1573, '0373', '410727', 114.42340500, 35.04057000, 1506, '河南省', 1573, '新乡市', 1582, '封丘县', 'system', 'system', b'1', '2017-04-18 02:04:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1583, '长垣县', 3, 1573, '0373', '410728', 114.67380700, 35.19615000, 1506, '河南省', 1573, '新乡市', 1583, '长垣县', 'system', 'system', b'1', '2017-04-18 02:04:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1584, '卫辉市', 3, 1573, '0373', '410781', 114.06585500, 35.40429500, 1506, '河南省', 1573, '新乡市', 1584, '卫辉市', 'system', 'system', b'1', '2017-04-18 02:04:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1585, '辉县市', 3, 1573, '0373', '410782', 113.80251800, 35.46131800, 1506, '河南省', 1573, '新乡市', 1585, '辉县市', 'system', 'system', b'1', '2017-04-18 02:04:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1586, '焦作市', 2, 1506, '0391', '410800', 113.23826600, 35.23904000, 1506, '河南省', 1586, '焦作市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1587, '解放区', 3, 1586, '0391', '410802', 113.22612600, 35.24135300, 1506, '河南省', 1586, '焦作市', 1587, '解放区', 'system', 'system', b'1', '2017-04-18 02:04:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1588, '中站区', 3, 1586, '0391', '410803', 113.17548500, 35.23614500, 1506, '河南省', 1586, '焦作市', 1588, '中站区', 'system', 'system', b'1', '2017-04-18 02:04:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1589, '马村区', 3, 1586, '0391', '410804', 113.32170300, 35.26545300, 1506, '河南省', 1586, '焦作市', 1589, '马村区', 'system', 'system', b'1', '2017-04-18 02:04:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1590, '山阳区', 3, 1586, '0391', '410811', 113.26766000, 35.21476000, 1506, '河南省', 1586, '焦作市', 1590, '山阳区', 'system', 'system', b'1', '2017-04-18 02:04:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1591, '修武县', 3, 1586, '0391', '410821', 113.44746500, 35.22992300, 1506, '河南省', 1586, '焦作市', 1591, '修武县', 'system', 'system', b'1', '2017-04-18 02:04:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1592, '博爱县', 3, 1586, '0391', '410822', 113.06931300, 35.17035100, 1506, '河南省', 1586, '焦作市', 1592, '博爱县', 'system', 'system', b'1', '2017-04-18 02:04:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1593, '武陟县', 3, 1586, '0391', '410823', 113.40833400, 35.09885000, 1506, '河南省', 1586, '焦作市', 1593, '武陟县', 'system', 'system', b'1', '2017-04-18 02:04:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1594, '温县', 3, 1586, '0391', '410825', 113.07911800, 34.94123300, 1506, '河南省', 1586, '焦作市', 1594, '温县', 'system', 'system', b'1', '2017-04-18 02:04:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1595, '沁阳市', 3, 1586, '0391', '410882', 112.93453800, 35.08901000, 1506, '河南省', 1586, '焦作市', 1595, '沁阳市', 'system', 'system', b'1', '2017-04-18 02:04:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1596, '孟州市', 3, 1586, '0391', '410883', 112.78708000, 34.90963000, 1506, '河南省', 1586, '焦作市', 1596, '孟州市', 'system', 'system', b'1', '2017-04-18 02:04:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1597, '濮阳市', 2, 1506, '0393', '410900', 115.04129900, 35.76823400, 1506, '河南省', 1597, '濮阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1598, '华龙区', 3, 1597, '0393', '410902', 115.03184000, 35.76047300, 1506, '河南省', 1597, '濮阳市', 1598, '华龙区', 'system', 'system', b'1', '2017-04-18 02:04:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1599, '清丰县', 3, 1597, '0393', '410922', 115.10728700, 35.90241300, 1506, '河南省', 1597, '濮阳市', 1599, '清丰县', 'system', 'system', b'1', '2017-04-18 02:04:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1600, '南乐县', 3, 1597, '0393', '410923', 115.20433600, 36.07520400, 1506, '河南省', 1597, '濮阳市', 1600, '南乐县', 'system', 'system', b'1', '2017-04-18 02:04:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1601, '范县', 3, 1597, '0393', '410926', 115.50421200, 35.85197700, 1506, '河南省', 1597, '濮阳市', 1601, '范县', 'system', 'system', b'1', '2017-04-18 02:04:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1602, '台前县', 3, 1597, '0393', '410927', 115.85568100, 35.99647400, 1506, '河南省', 1597, '濮阳市', 1602, '台前县', 'system', 'system', b'1', '2017-04-18 02:04:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1603, '濮阳县', 3, 1597, '0393', '410928', 115.02384400, 35.71034900, 1506, '河南省', 1597, '濮阳市', 1603, '濮阳县', 'system', 'system', b'1', '2017-04-18 02:04:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1604, '许昌市', 2, 1506, '0374', '411000', 113.82606300, 34.02295600, 1506, '河南省', 1604, '许昌市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1605, '魏都区', 3, 1604, '0374', '411002', 113.82830700, 34.02711000, 1506, '河南省', 1604, '许昌市', 1605, '魏都区', 'system', 'system', b'1', '2017-04-18 02:04:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1606, '许昌县', 3, 1604, '0374', '411023', 113.84289800, 34.00501800, 1506, '河南省', 1604, '许昌市', 1606, '许昌县', 'system', 'system', b'1', '2017-04-18 02:04:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1607, '鄢陵县', 3, 1604, '0374', '411024', 114.18850700, 34.10050200, 1506, '河南省', 1604, '许昌市', 1607, '鄢陵县', 'system', 'system', b'1', '2017-04-18 02:04:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1608, '襄城县', 3, 1604, '0374', '411025', 113.49316600, 33.85594300, 1506, '河南省', 1604, '许昌市', 1608, '襄城县', 'system', 'system', b'1', '2017-04-18 02:04:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1609, '禹州市', 3, 1604, '0374', '411081', 113.47131600, 34.15440300, 1506, '河南省', 1604, '许昌市', 1609, '禹州市', 'system', 'system', b'1', '2017-04-18 02:04:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1610, '长葛市', 3, 1604, '0374', '411082', 113.76891200, 34.21925700, 1506, '河南省', 1604, '许昌市', 1610, '长葛市', 'system', 'system', b'1', '2017-04-18 02:04:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1611, '漯河市', 2, 1506, '0395', '411100', 114.02640500, 33.57585500, 1506, '河南省', 1611, '漯河市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1612, '源汇区', 3, 1611, '0395', '411102', 114.01794800, 33.56544100, 1506, '河南省', 1611, '漯河市', 1612, '源汇区', 'system', 'system', b'1', '2017-04-18 02:04:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1613, '郾城区', 3, 1611, '0395', '411103', 114.01681300, 33.58889700, 1506, '河南省', 1611, '漯河市', 1613, '郾城区', 'system', 'system', b'1', '2017-04-18 02:04:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1614, '召陵区', 3, 1611, '0395', '411104', 114.05168600, 33.56755500, 1506, '河南省', 1611, '漯河市', 1614, '召陵区', 'system', 'system', b'1', '2017-04-18 02:04:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1615, '舞阳县', 3, 1611, '0395', '411121', 113.61056500, 33.43627800, 1506, '河南省', 1611, '漯河市', 1615, '舞阳县', 'system', 'system', b'1', '2017-04-18 02:04:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1616, '临颍县', 3, 1611, '0395', '411122', 113.93889100, 33.80609000, 1506, '河南省', 1611, '漯河市', 1616, '临颍县', 'system', 'system', b'1', '2017-04-18 02:04:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1617, '三门峡市', 2, 1506, '0398', '411200', 111.19409900, 34.77733800, 1506, '河南省', 1617, '三门峡市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1618, '湖滨区', 3, 1617, '0398', '411202', 111.19487000, 34.77812000, 1506, '河南省', 1617, '三门峡市', 1618, '湖滨区', 'system', 'system', b'1', '2017-04-18 02:04:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1619, '陕州区', 3, 1617, '0398', '411203', 111.10385100, 34.72024400, 1506, '河南省', 1617, '三门峡市', 1619, '陕州区', 'system', 'system', b'1', '2017-04-18 02:04:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1620, '渑池县', 3, 1617, '0398', '411221', 111.76299200, 34.76348700, 1506, '河南省', 1617, '三门峡市', 1620, '渑池县', 'system', 'system', b'1', '2017-04-18 02:04:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1621, '卢氏县', 3, 1617, '0398', '411224', 111.05264900, 34.05399500, 1506, '河南省', 1617, '三门峡市', 1621, '卢氏县', 'system', 'system', b'1', '2017-04-18 02:04:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1622, '义马市', 3, 1617, '0398', '411281', 111.86941700, 34.74686800, 1506, '河南省', 1617, '三门峡市', 1622, '义马市', 'system', 'system', b'1', '2017-04-18 02:04:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1623, '灵宝市', 3, 1617, '0398', '411282', 110.88577000, 34.52126400, 1506, '河南省', 1617, '三门峡市', 1623, '灵宝市', 'system', 'system', b'1', '2017-04-18 02:04:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1624, '南阳市', 2, 1506, '0377', '411300', 112.54091800, 32.99908200, 1506, '河南省', 1624, '南阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1625, '宛城区', 3, 1624, '0377', '411302', 112.54459100, 32.99485700, 1506, '河南省', 1624, '南阳市', 1625, '宛城区', 'system', 'system', b'1', '2017-04-18 02:04:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1626, '卧龙区', 3, 1624, '0377', '411303', 112.52878900, 32.98987700, 1506, '河南省', 1624, '南阳市', 1626, '卧龙区', 'system', 'system', b'1', '2017-04-18 02:04:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1627, '南召县', 3, 1624, '0377', '411321', 112.43558300, 33.48861700, 1506, '河南省', 1624, '南阳市', 1627, '南召县', 'system', 'system', b'1', '2017-04-18 02:04:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1628, '方城县', 3, 1624, '0377', '411322', 113.01093300, 33.25513800, 1506, '河南省', 1624, '南阳市', 1628, '方城县', 'system', 'system', b'1', '2017-04-18 02:04:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1629, '西峡县', 3, 1624, '0377', '411323', 111.48577200, 33.30298100, 1506, '河南省', 1624, '南阳市', 1629, '西峡县', 'system', 'system', b'1', '2017-04-18 02:04:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1630, '镇平县', 3, 1624, '0377', '411324', 112.23272200, 33.03665100, 1506, '河南省', 1624, '南阳市', 1630, '镇平县', 'system', 'system', b'1', '2017-04-18 02:04:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1631, '内乡县', 3, 1624, '0377', '411325', 111.84380100, 33.04635800, 1506, '河南省', 1624, '南阳市', 1631, '内乡县', 'system', 'system', b'1', '2017-04-18 02:04:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1632, '淅川县', 3, 1624, '0377', '411326', 111.48902600, 33.13610600, 1506, '河南省', 1624, '南阳市', 1632, '淅川县', 'system', 'system', b'1', '2017-04-18 02:04:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1633, '社旗县', 3, 1624, '0377', '411327', 112.93827900, 33.05612600, 1506, '河南省', 1624, '南阳市', 1633, '社旗县', 'system', 'system', b'1', '2017-04-18 02:04:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1634, '唐河县', 3, 1624, '0377', '411328', 112.83849200, 32.68789200, 1506, '河南省', 1624, '南阳市', 1634, '唐河县', 'system', 'system', b'1', '2017-04-18 02:04:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1635, '新野县', 3, 1624, '0377', '411329', 112.36562400, 32.52400600, 1506, '河南省', 1624, '南阳市', 1635, '新野县', 'system', 'system', b'1', '2017-04-18 02:04:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1636, '桐柏县', 3, 1624, '0377', '411330', 113.40605900, 32.36715300, 1506, '河南省', 1624, '南阳市', 1636, '桐柏县', 'system', 'system', b'1', '2017-04-18 02:04:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1637, '邓州市', 3, 1624, '0377', '411381', 112.09271600, 32.68164200, 1506, '河南省', 1624, '南阳市', 1637, '邓州市', 'system', 'system', b'1', '2017-04-18 02:04:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1638, '商丘市', 2, 1506, '0370', '411400', 115.65049700, 34.43705400, 1506, '河南省', 1638, '商丘市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1639, '梁园区', 3, 1638, '0370', '411402', 115.65459000, 34.43655300, 1506, '河南省', 1638, '商丘市', 1639, '梁园区', 'system', 'system', b'1', '2017-04-18 02:04:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1640, '睢阳区', 3, 1638, '0370', '411403', 115.65381300, 34.39053600, 1506, '河南省', 1638, '商丘市', 1640, '睢阳区', 'system', 'system', b'1', '2017-04-18 02:04:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1641, '民权县', 3, 1638, '0370', '411421', 115.14814600, 34.64845500, 1506, '河南省', 1638, '商丘市', 1641, '民权县', 'system', 'system', b'1', '2017-04-18 02:04:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1642, '睢县', 3, 1638, '0370', '411422', 115.07010900, 34.42843300, 1506, '河南省', 1638, '商丘市', 1642, '睢县', 'system', 'system', b'1', '2017-04-18 02:04:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1643, '宁陵县', 3, 1638, '0370', '411423', 115.32005500, 34.44929900, 1506, '河南省', 1638, '商丘市', 1643, '宁陵县', 'system', 'system', b'1', '2017-04-18 02:04:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1644, '柘城县', 3, 1638, '0370', '411424', 115.30743300, 34.07527700, 1506, '河南省', 1638, '商丘市', 1644, '柘城县', 'system', 'system', b'1', '2017-04-18 02:04:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1645, '虞城县', 3, 1638, '0370', '411425', 115.86381100, 34.39963400, 1506, '河南省', 1638, '商丘市', 1645, '虞城县', 'system', 'system', b'1', '2017-04-18 02:04:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1646, '夏邑县', 3, 1638, '0370', '411426', 116.13989000, 34.24089400, 1506, '河南省', 1638, '商丘市', 1646, '夏邑县', 'system', 'system', b'1', '2017-04-18 02:04:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1647, '永城市', 3, 1638, '0370', '411481', 116.44967200, 33.93131800, 1506, '河南省', 1638, '商丘市', 1647, '永城市', 'system', 'system', b'1', '2017-04-18 02:04:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1648, '信阳市', 2, 1506, '0376', '411500', 114.07503100, 32.12327400, 1506, '河南省', 1648, '信阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1649, '浉河区', 3, 1648, '0376', '411502', 114.07503100, 32.12327400, 1506, '河南省', 1648, '信阳市', 1649, '浉河区', 'system', 'system', b'1', '2017-04-18 02:04:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1650, '平桥区', 3, 1648, '0376', '411503', 114.12602700, 32.09839500, 1506, '河南省', 1648, '信阳市', 1650, '平桥区', 'system', 'system', b'1', '2017-04-18 02:04:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1651, '罗山县', 3, 1648, '0376', '411521', 114.53341400, 32.20320600, 1506, '河南省', 1648, '信阳市', 1651, '罗山县', 'system', 'system', b'1', '2017-04-18 02:04:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1652, '光山县', 3, 1648, '0376', '411522', 114.90357700, 32.01039800, 1506, '河南省', 1648, '信阳市', 1652, '光山县', 'system', 'system', b'1', '2017-04-18 02:04:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1653, '新县', 3, 1648, '0376', '411523', 114.87705000, 31.63515000, 1506, '河南省', 1648, '信阳市', 1653, '新县', 'system', 'system', b'1', '2017-04-18 02:04:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1654, '商城县', 3, 1648, '0376', '411524', 115.40629700, 31.79998200, 1506, '河南省', 1648, '信阳市', 1654, '商城县', 'system', 'system', b'1', '2017-04-18 02:04:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1655, '固始县', 3, 1648, '0376', '411525', 115.66732800, 32.18307400, 1506, '河南省', 1648, '信阳市', 1655, '固始县', 'system', 'system', b'1', '2017-04-18 02:04:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1656, '潢川县', 3, 1648, '0376', '411526', 115.05012300, 32.13402400, 1506, '河南省', 1648, '信阳市', 1656, '潢川县', 'system', 'system', b'1', '2017-04-18 02:04:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1657, '淮滨县', 3, 1648, '0376', '411527', 115.41545100, 32.45263900, 1506, '河南省', 1648, '信阳市', 1657, '淮滨县', 'system', 'system', b'1', '2017-04-18 02:04:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1658, '息县', 3, 1648, '0376', '411528', 114.74071300, 32.34474400, 1506, '河南省', 1648, '信阳市', 1658, '息县', 'system', 'system', b'1', '2017-04-18 02:04:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1659, '周口市', 2, 1506, '0394', '411600', 114.64965300, 33.62035700, 1506, '河南省', 1659, '周口市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1660, '川汇区', 3, 1659, '0394', '411602', 114.65213600, 33.61483600, 1506, '河南省', 1659, '周口市', 1660, '川汇区', 'system', 'system', b'1', '2017-04-18 02:04:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1661, '扶沟县', 3, 1659, '0394', '411621', 114.39200800, 34.05406100, 1506, '河南省', 1659, '周口市', 1661, '扶沟县', 'system', 'system', b'1', '2017-04-18 02:04:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1662, '西华县', 3, 1659, '0394', '411622', 114.53006700, 33.78437800, 1506, '河南省', 1659, '周口市', 1662, '西华县', 'system', 'system', b'1', '2017-04-18 02:04:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1663, '商水县', 3, 1659, '0394', '411623', 114.60927000, 33.54384500, 1506, '河南省', 1659, '周口市', 1663, '商水县', 'system', 'system', b'1', '2017-04-18 02:04:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1664, '沈丘县', 3, 1659, '0394', '411624', 115.07837500, 33.39551400, 1506, '河南省', 1659, '周口市', 1664, '沈丘县', 'system', 'system', b'1', '2017-04-18 02:04:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1665, '郸城县', 3, 1659, '0394', '411625', 115.18900000, 33.64385200, 1506, '河南省', 1659, '周口市', 1665, '郸城县', 'system', 'system', b'1', '2017-04-18 02:04:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1666, '淮阳县', 3, 1659, '0394', '411626', 114.87016600, 33.73254700, 1506, '河南省', 1659, '周口市', 1666, '淮阳县', 'system', 'system', b'1', '2017-04-18 02:04:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1667, '太康县', 3, 1659, '0394', '411627', 114.85383400, 34.06531200, 1506, '河南省', 1659, '周口市', 1667, '太康县', 'system', 'system', b'1', '2017-04-18 02:04:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1668, '鹿邑县', 3, 1659, '0394', '411628', 115.48638600, 33.86106700, 1506, '河南省', 1659, '周口市', 1668, '鹿邑县', 'system', 'system', b'1', '2017-04-18 02:04:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1669, '项城市', 3, 1659, '0394', '411681', 114.89952100, 33.44308500, 1506, '河南省', 1659, '周口市', 1669, '项城市', 'system', 'system', b'1', '2017-04-18 02:04:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1670, '驻马店市', 2, 1506, '0396', '411700', 114.02473600, 32.98016900, 1506, '河南省', 1670, '驻马店市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1671, '驿城区', 3, 1670, '0396', '411702', 114.02914900, 32.97755900, 1506, '河南省', 1670, '驻马店市', 1671, '驿城区', 'system', 'system', b'1', '2017-04-18 02:04:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1672, '西平县', 3, 1670, '0396', '411721', 114.02686400, 33.38231500, 1506, '河南省', 1670, '驻马店市', 1672, '西平县', 'system', 'system', b'1', '2017-04-18 02:04:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1673, '上蔡县', 3, 1670, '0396', '411722', 114.26689200, 33.26471900, 1506, '河南省', 1670, '驻马店市', 1673, '上蔡县', 'system', 'system', b'1', '2017-04-18 02:04:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1674, '平舆县', 3, 1670, '0396', '411723', 114.63710500, 32.95562600, 1506, '河南省', 1670, '驻马店市', 1674, '平舆县', 'system', 'system', b'1', '2017-04-18 02:04:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1675, '正阳县', 3, 1670, '0396', '411724', 114.38948000, 32.60182600, 1506, '河南省', 1670, '驻马店市', 1675, '正阳县', 'system', 'system', b'1', '2017-04-18 02:04:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1676, '确山县', 3, 1670, '0396', '411725', 114.02667900, 32.80153800, 1506, '河南省', 1670, '驻马店市', 1676, '确山县', 'system', 'system', b'1', '2017-04-18 02:04:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1677, '泌阳县', 3, 1670, '0396', '411726', 113.32605000, 32.72512900, 1506, '河南省', 1670, '驻马店市', 1677, '泌阳县', 'system', 'system', b'1', '2017-04-18 02:04:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1678, '汝南县', 3, 1670, '0396', '411727', 114.35949500, 33.00453500, 1506, '河南省', 1670, '驻马店市', 1678, '汝南县', 'system', 'system', b'1', '2017-04-18 02:04:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1679, '遂平县', 3, 1670, '0396', '411728', 114.00371000, 33.14698000, 1506, '河南省', 1670, '驻马店市', 1679, '遂平县', 'system', 'system', b'1', '2017-04-18 02:04:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1680, '新蔡县', 3, 1670, '0396', '411729', 114.97524600, 32.74994800, 1506, '河南省', 1670, '驻马店市', 1680, '新蔡县', 'system', 'system', b'1', '2017-04-18 02:04:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1681, '济源市', 2, 1506, '1391', '419001', 112.59004700, 35.09037800, 1506, '河南省', 1681, '济源市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1682, '湖北省', 1, 1, NULL, '420000', 114.29857200, 30.58435500, 1682, '湖北省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1683, '武汉市', 2, 1682, '027', '420100', 114.29857200, 30.58435500, 1682, '湖北省', 1683, '武汉市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1684, '江岸区', 3, 1683, '027', '420102', 114.30304000, 30.59491100, 1682, '湖北省', 1683, '武汉市', 1684, '江岸区', 'system', 'system', b'1', '2017-04-18 02:04:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1685, '江汉区', 3, 1683, '027', '420103', 114.28310900, 30.57877100, 1682, '湖北省', 1683, '武汉市', 1685, '江汉区', 'system', 'system', b'1', '2017-04-18 02:04:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1686, '硚口区', 3, 1683, '027', '420104', 114.26456800, 30.57061000, 1682, '湖北省', 1683, '武汉市', 1686, '硚口区', 'system', 'system', b'1', '2017-04-18 02:04:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1687, '汉阳区', 3, 1683, '027', '420105', 114.26580700, 30.54932600, 1682, '湖北省', 1683, '武汉市', 1687, '汉阳区', 'system', 'system', b'1', '2017-04-18 02:04:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1688, '武昌区', 3, 1683, '027', '420106', 114.30734400, 30.54653600, 1682, '湖北省', 1683, '武汉市', 1688, '武昌区', 'system', 'system', b'1', '2017-04-18 02:04:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1689, '青山区', 3, 1683, '027', '420107', 114.39707000, 30.63421500, 1682, '湖北省', 1683, '武汉市', 1689, '青山区', 'system', 'system', b'1', '2017-04-18 02:04:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1690, '洪山区', 3, 1683, '027', '420111', 114.40071800, 30.50425900, 1682, '湖北省', 1683, '武汉市', 1690, '洪山区', 'system', 'system', b'1', '2017-04-18 02:04:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1691, '东西湖区', 3, 1683, '027', '420112', 114.14248300, 30.62246700, 1682, '湖北省', 1683, '武汉市', 1691, '东西湖区', 'system', 'system', b'1', '2017-04-18 02:04:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1692, '汉南区', 3, 1683, '027', '420113', 114.08124000, 30.30963700, 1682, '湖北省', 1683, '武汉市', 1692, '汉南区', 'system', 'system', b'1', '2017-04-18 02:04:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1693, '蔡甸区', 3, 1683, '027', '420114', 114.02934100, 30.58218600, 1682, '湖北省', 1683, '武汉市', 1693, '蔡甸区', 'system', 'system', b'1', '2017-04-18 02:04:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1694, '江夏区', 3, 1683, '027', '420115', 114.31396100, 30.34904500, 1682, '湖北省', 1683, '武汉市', 1694, '江夏区', 'system', 'system', b'1', '2017-04-18 02:04:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1695, '黄陂区', 3, 1683, '027', '420116', 114.37402500, 30.87415500, 1682, '湖北省', 1683, '武汉市', 1695, '黄陂区', 'system', 'system', b'1', '2017-04-18 02:04:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1696, '新洲区', 3, 1683, '027', '420117', 114.80210800, 30.84214900, 1682, '湖北省', 1683, '武汉市', 1696, '新洲区', 'system', 'system', b'1', '2017-04-18 02:04:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1697, '黄石市', 2, 1682, '0714', '420200', 115.07704800, 30.22007400, 1682, '湖北省', 1697, '黄石市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1698, '黄石港区', 3, 1697, '0714', '420202', 115.09016400, 30.21208600, 1682, '湖北省', 1697, '黄石市', 1698, '黄石港区', 'system', 'system', b'1', '2017-04-18 02:04:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1699, '西塞山区', 3, 1697, '0714', '420203', 115.09335400, 30.20536500, 1682, '湖北省', 1697, '黄石市', 1699, '西塞山区', 'system', 'system', b'1', '2017-04-18 02:04:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1700, '下陆区', 3, 1697, '0714', '420204', 114.97575500, 30.17784500, 1682, '湖北省', 1697, '黄石市', 1700, '下陆区', 'system', 'system', b'1', '2017-04-18 02:04:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1701, '铁山区', 3, 1697, '0714', '420205', 114.90136600, 30.20601000, 1682, '湖北省', 1697, '黄石市', 1701, '铁山区', 'system', 'system', b'1', '2017-04-18 02:04:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1702, '阳新县', 3, 1697, '0714', '420222', 115.21288300, 29.84157200, 1682, '湖北省', 1697, '黄石市', 1702, '阳新县', 'system', 'system', b'1', '2017-04-18 02:04:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1703, '大冶市', 3, 1697, '0714', '420281', 114.97484200, 30.09880400, 1682, '湖北省', 1697, '黄石市', 1703, '大冶市', 'system', 'system', b'1', '2017-04-18 02:04:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1704, '十堰市', 2, 1682, '0719', '420300', 110.78791600, 32.64690700, 1682, '湖北省', 1704, '十堰市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1705, '茅箭区', 3, 1704, '0719', '420302', 110.78621000, 32.64446300, 1682, '湖北省', 1704, '十堰市', 1705, '茅箭区', 'system', 'system', b'1', '2017-04-18 02:04:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1706, '张湾区', 3, 1704, '0719', '420303', 110.77236500, 32.65251600, 1682, '湖北省', 1704, '十堰市', 1706, '张湾区', 'system', 'system', b'1', '2017-04-18 02:04:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1707, '郧阳区', 3, 1704, '0719', '420304', 110.81209900, 32.83826700, 1682, '湖北省', 1704, '十堰市', 1707, '郧阳区', 'system', 'system', b'1', '2017-04-18 02:04:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1708, '郧西县', 3, 1704, '0719', '420322', 110.42647200, 32.99145700, 1682, '湖北省', 1704, '十堰市', 1708, '郧西县', 'system', 'system', b'1', '2017-04-18 02:04:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1709, '竹山县', 3, 1704, '0719', '420323', 110.22960000, 32.22586000, 1682, '湖北省', 1704, '十堰市', 1709, '竹山县', 'system', 'system', b'1', '2017-04-18 02:04:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1710, '竹溪县', 3, 1704, '0719', '420324', 109.71719600, 32.31534200, 1682, '湖北省', 1704, '十堰市', 1710, '竹溪县', 'system', 'system', b'1', '2017-04-18 02:04:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1711, '房县', 3, 1704, '0719', '420325', 110.74196600, 32.05500200, 1682, '湖北省', 1704, '十堰市', 1711, '房县', 'system', 'system', b'1', '2017-04-18 02:04:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1712, '丹江口市', 3, 1704, '0719', '420381', 111.51379300, 32.53883900, 1682, '湖北省', 1704, '十堰市', 1712, '丹江口市', 'system', 'system', b'1', '2017-04-18 02:04:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1713, '宜昌市', 2, 1682, '0717', '420500', 111.29084300, 30.70263600, 1682, '湖北省', 1713, '宜昌市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1714, '西陵区', 3, 1713, '0717', '420502', 111.29546800, 30.70247600, 1682, '湖北省', 1713, '宜昌市', 1714, '西陵区', 'system', 'system', b'1', '2017-04-18 02:04:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1715, '伍家岗区', 3, 1713, '0717', '420503', 111.30721500, 30.67905300, 1682, '湖北省', 1713, '宜昌市', 1715, '伍家岗区', 'system', 'system', b'1', '2017-04-18 02:04:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1716, '点军区', 3, 1713, '0717', '420504', 111.26816300, 30.69232200, 1682, '湖北省', 1713, '宜昌市', 1716, '点军区', 'system', 'system', b'1', '2017-04-18 02:04:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1717, '猇亭区', 3, 1713, '0717', '420505', 111.42764200, 30.53074400, 1682, '湖北省', 1713, '宜昌市', 1717, '猇亭区', 'system', 'system', b'1', '2017-04-18 02:04:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1718, '夷陵区', 3, 1713, '0717', '420506', 111.32674700, 30.77019900, 1682, '湖北省', 1713, '宜昌市', 1718, '夷陵区', 'system', 'system', b'1', '2017-04-18 02:04:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1719, '远安县', 3, 1713, '0717', '420525', 111.64331000, 31.05962600, 1682, '湖北省', 1713, '宜昌市', 1719, '远安县', 'system', 'system', b'1', '2017-04-18 02:04:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1720, '兴山县', 3, 1713, '0717', '420526', 110.75449900, 31.34795000, 1682, '湖北省', 1713, '宜昌市', 1720, '兴山县', 'system', 'system', b'1', '2017-04-18 02:04:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1721, '秭归县', 3, 1713, '0717', '420527', 110.97678500, 30.82390800, 1682, '湖北省', 1713, '宜昌市', 1721, '秭归县', 'system', 'system', b'1', '2017-04-18 02:04:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1722, '长阳土家族自治县', 3, 1713, '0717', '420528', 111.19847500, 30.46653400, 1682, '湖北省', 1713, '宜昌市', 1722, '长阳土家族自治县', 'system', 'system', b'1', '2017-04-18 02:04:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1723, '五峰土家族自治县', 3, 1713, '0717', '420529', 110.67493800, 30.19925200, 1682, '湖北省', 1713, '宜昌市', 1723, '五峰土家族自治县', 'system', 'system', b'1', '2017-04-18 02:04:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1724, '宜都市', 3, 1713, '0717', '420581', 111.45436700, 30.38723400, 1682, '湖北省', 1713, '宜昌市', 1724, '宜都市', 'system', 'system', b'1', '2017-04-18 02:04:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1725, '当阳市', 3, 1713, '0717', '420582', 111.79341900, 30.82449200, 1682, '湖北省', 1713, '宜昌市', 1725, '当阳市', 'system', 'system', b'1', '2017-04-18 02:04:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1726, '枝江市', 3, 1713, '0717', '420583', 111.75179900, 30.42536400, 1682, '湖北省', 1713, '宜昌市', 1726, '枝江市', 'system', 'system', b'1', '2017-04-18 02:04:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1727, '襄阳市', 2, 1682, '0710', '420600', 112.14414600, 32.04242600, 1682, '湖北省', 1727, '襄阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1728, '襄城区', 3, 1727, '0710', '420602', 112.15032700, 32.01508800, 1682, '湖北省', 1727, '襄阳市', 1728, '襄城区', 'system', 'system', b'1', '2017-04-18 02:04:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1729, '樊城区', 3, 1727, '0710', '420606', 112.13957000, 32.05858900, 1682, '湖北省', 1727, '襄阳市', 1729, '樊城区', 'system', 'system', b'1', '2017-04-18 02:04:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1730, '襄州区', 3, 1727, '0710', '420607', 112.19737800, 32.08551700, 1682, '湖北省', 1727, '襄阳市', 1730, '襄州区', 'system', 'system', b'1', '2017-04-18 02:04:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1731, '南漳县', 3, 1727, '0710', '420624', 111.84442400, 31.77692000, 1682, '湖北省', 1727, '襄阳市', 1731, '南漳县', 'system', 'system', b'1', '2017-04-18 02:04:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1732, '谷城县', 3, 1727, '0710', '420625', 111.64014700, 32.26267600, 1682, '湖北省', 1727, '襄阳市', 1732, '谷城县', 'system', 'system', b'1', '2017-04-18 02:04:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1733, '保康县', 3, 1727, '0710', '420626', 111.26223500, 31.87350700, 1682, '湖北省', 1727, '襄阳市', 1733, '保康县', 'system', 'system', b'1', '2017-04-18 02:04:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1734, '老河口市', 3, 1727, '0710', '420682', 111.67573200, 32.38543800, 1682, '湖北省', 1727, '襄阳市', 1734, '老河口市', 'system', 'system', b'1', '2017-04-18 02:04:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1735, '枣阳市', 3, 1727, '0710', '420683', 112.76526800, 32.12308300, 1682, '湖北省', 1727, '襄阳市', 1735, '枣阳市', 'system', 'system', b'1', '2017-04-18 02:04:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1736, '宜城市', 3, 1727, '0710', '420684', 112.26144100, 31.70920300, 1682, '湖北省', 1727, '襄阳市', 1736, '宜城市', 'system', 'system', b'1', '2017-04-18 02:04:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1737, '鄂州市', 2, 1682, '0711', '420700', 114.89059300, 30.39653600, 1682, '湖北省', 1737, '鄂州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1738, '梁子湖区', 3, 1737, '0711', '420702', 114.68196700, 30.09819100, 1682, '湖北省', 1737, '鄂州市', 1738, '梁子湖区', 'system', 'system', b'1', '2017-04-18 02:04:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1739, '华容区', 3, 1737, '0711', '420703', 114.74148000, 30.53446800, 1682, '湖北省', 1737, '鄂州市', 1739, '华容区', 'system', 'system', b'1', '2017-04-18 02:04:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1740, '鄂城区', 3, 1737, '0711', '420704', 114.89001200, 30.39669000, 1682, '湖北省', 1737, '鄂州市', 1740, '鄂城区', 'system', 'system', b'1', '2017-04-18 02:04:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1741, '荆门市', 2, 1682, '0724', '420800', 112.20425100, 31.03542000, 1682, '湖北省', 1741, '荆门市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1742, '东宝区', 3, 1741, '0724', '420802', 112.20480400, 31.03346100, 1682, '湖北省', 1741, '荆门市', 1742, '东宝区', 'system', 'system', b'1', '2017-04-18 02:04:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1743, '掇刀区', 3, 1741, '0724', '420804', 112.19841300, 30.98079800, 1682, '湖北省', 1741, '荆门市', 1743, '掇刀区', 'system', 'system', b'1', '2017-04-18 02:04:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1744, '京山县', 3, 1741, '0724', '420821', 113.11459500, 31.02245800, 1682, '湖北省', 1741, '荆门市', 1744, '京山县', 'system', 'system', b'1', '2017-04-18 02:04:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1745, '沙洋县', 3, 1741, '0724', '420822', 112.59521800, 30.70359000, 1682, '湖北省', 1741, '荆门市', 1745, '沙洋县', 'system', 'system', b'1', '2017-04-18 02:04:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1746, '钟祥市', 3, 1741, '0724', '420881', 112.58726700, 31.16557300, 1682, '湖北省', 1741, '荆门市', 1746, '钟祥市', 'system', 'system', b'1', '2017-04-18 02:04:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1747, '孝感市', 2, 1682, '0712', '420900', 113.92665500, 30.92642300, 1682, '湖北省', 1747, '孝感市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:04:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1748, '孝南区', 3, 1747, '0712', '420902', 113.92584900, 30.92596600, 1682, '湖北省', 1747, '孝感市', 1748, '孝南区', 'system', 'system', b'1', '2017-04-18 02:04:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1749, '孝昌县', 3, 1747, '0712', '420921', 113.98896400, 31.25161800, 1682, '湖北省', 1747, '孝感市', 1749, '孝昌县', 'system', 'system', b'1', '2017-04-18 02:04:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1750, '大悟县', 3, 1747, '0712', '420922', 114.12624900, 31.56548300, 1682, '湖北省', 1747, '孝感市', 1750, '大悟县', 'system', 'system', b'1', '2017-04-18 02:04:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1751, '云梦县', 3, 1747, '0712', '420923', 113.75061600, 31.02169100, 1682, '湖北省', 1747, '孝感市', 1751, '云梦县', 'system', 'system', b'1', '2017-04-18 02:04:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1752, '应城市', 3, 1747, '0712', '420981', 113.57384200, 30.93903800, 1682, '湖北省', 1747, '孝感市', 1752, '应城市', 'system', 'system', b'1', '2017-04-18 02:04:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1753, '安陆市', 3, 1747, '0712', '420982', 113.69040100, 31.26174000, 1682, '湖北省', 1747, '孝感市', 1753, '安陆市', 'system', 'system', b'1', '2017-04-18 02:05:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1754, '汉川市', 3, 1747, '0712', '420984', 113.83530100, 30.65216500, 1682, '湖北省', 1747, '孝感市', 1754, '汉川市', 'system', 'system', b'1', '2017-04-18 02:05:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1755, '荆州市', 2, 1682, '0716', '421000', 112.23813000, 30.32685700, 1682, '湖北省', 1755, '荆州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1756, '沙市区', 3, 1755, '0716', '421002', 112.25743300, 30.31589500, 1682, '湖北省', 1755, '荆州市', 1756, '沙市区', 'system', 'system', b'1', '2017-04-18 02:05:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1757, '荆州区', 3, 1755, '0716', '421003', 112.19535400, 30.35067400, 1682, '湖北省', 1755, '荆州市', 1757, '荆州区', 'system', 'system', b'1', '2017-04-18 02:05:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1758, '公安县', 3, 1755, '0716', '421022', 112.23017900, 30.05906500, 1682, '湖北省', 1755, '荆州市', 1758, '公安县', 'system', 'system', b'1', '2017-04-18 02:05:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1759, '监利县', 3, 1755, '0716', '421023', 112.90434400, 29.82007900, 1682, '湖北省', 1755, '荆州市', 1759, '监利县', 'system', 'system', b'1', '2017-04-18 02:05:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1760, '江陵县', 3, 1755, '0716', '421024', 112.41735000, 30.03391900, 1682, '湖北省', 1755, '荆州市', 1760, '江陵县', 'system', 'system', b'1', '2017-04-18 02:05:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1761, '石首市', 3, 1755, '0716', '421081', 112.40887000, 29.71643700, 1682, '湖北省', 1755, '荆州市', 1761, '石首市', 'system', 'system', b'1', '2017-04-18 02:05:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1762, '洪湖市', 3, 1755, '0716', '421083', 113.47030400, 29.81297000, 1682, '湖北省', 1755, '荆州市', 1762, '洪湖市', 'system', 'system', b'1', '2017-04-18 02:05:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1763, '松滋市', 3, 1755, '0716', '421087', 111.77818000, 30.17603700, 1682, '湖北省', 1755, '荆州市', 1763, '松滋市', 'system', 'system', b'1', '2017-04-18 02:05:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1764, '黄冈市', 2, 1682, '0713', '421100', 114.87936500, 30.44771100, 1682, '湖北省', 1764, '黄冈市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1765, '黄州区', 3, 1764, '0713', '421102', 114.87893400, 30.44743500, 1682, '湖北省', 1764, '黄冈市', 1765, '黄州区', 'system', 'system', b'1', '2017-04-18 02:05:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1766, '团风县', 3, 1764, '0713', '421121', 114.87202900, 30.63569000, 1682, '湖北省', 1764, '黄冈市', 1766, '团风县', 'system', 'system', b'1', '2017-04-18 02:05:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1767, '红安县', 3, 1764, '0713', '421122', 114.61509500, 31.28477700, 1682, '湖北省', 1764, '黄冈市', 1767, '红安县', 'system', 'system', b'1', '2017-04-18 02:05:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1768, '罗田县', 3, 1764, '0713', '421123', 115.39898400, 30.78167900, 1682, '湖北省', 1764, '黄冈市', 1768, '罗田县', 'system', 'system', b'1', '2017-04-18 02:05:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1769, '英山县', 3, 1764, '0713', '421124', 115.67753000, 30.73579400, 1682, '湖北省', 1764, '黄冈市', 1769, '英山县', 'system', 'system', b'1', '2017-04-18 02:05:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1770, '浠水县', 3, 1764, '0713', '421125', 115.26344000, 30.45483700, 1682, '湖北省', 1764, '黄冈市', 1770, '浠水县', 'system', 'system', b'1', '2017-04-18 02:05:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1771, '蕲春县', 3, 1764, '0713', '421126', 115.43396400, 30.23492700, 1682, '湖北省', 1764, '黄冈市', 1771, '蕲春县', 'system', 'system', b'1', '2017-04-18 02:05:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1772, '黄梅县', 3, 1764, '0713', '421127', 115.94254800, 30.07511300, 1682, '湖北省', 1764, '黄冈市', 1772, '黄梅县', 'system', 'system', b'1', '2017-04-18 02:05:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1773, '麻城市', 3, 1764, '0713', '421181', 115.02541000, 31.17790600, 1682, '湖北省', 1764, '黄冈市', 1773, '麻城市', 'system', 'system', b'1', '2017-04-18 02:05:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1774, '武穴市', 3, 1764, '0713', '421182', 115.56242000, 29.84934200, 1682, '湖北省', 1764, '黄冈市', 1774, '武穴市', 'system', 'system', b'1', '2017-04-18 02:05:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1775, '咸宁市', 2, 1682, '0715', '421200', 114.32896300, 29.83279800, 1682, '湖北省', 1775, '咸宁市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1776, '咸安区', 3, 1775, '0715', '421202', 114.33389400, 29.82471600, 1682, '湖北省', 1775, '咸宁市', 1776, '咸安区', 'system', 'system', b'1', '2017-04-18 02:05:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1777, '嘉鱼县', 3, 1775, '0715', '421221', 113.92154700, 29.97336300, 1682, '湖北省', 1775, '咸宁市', 1777, '嘉鱼县', 'system', 'system', b'1', '2017-04-18 02:05:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1778, '通城县', 3, 1775, '0715', '421222', 113.81413100, 29.24607600, 1682, '湖北省', 1775, '咸宁市', 1778, '通城县', 'system', 'system', b'1', '2017-04-18 02:05:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1779, '崇阳县', 3, 1775, '0715', '421223', 114.04995800, 29.54101000, 1682, '湖北省', 1775, '咸宁市', 1779, '崇阳县', 'system', 'system', b'1', '2017-04-18 02:05:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1780, '通山县', 3, 1775, '0715', '421224', 114.49316300, 29.60445500, 1682, '湖北省', 1775, '咸宁市', 1780, '通山县', 'system', 'system', b'1', '2017-04-18 02:05:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1781, '赤壁市', 3, 1775, '0715', '421281', 113.88366000, 29.71687900, 1682, '湖北省', 1775, '咸宁市', 1781, '赤壁市', 'system', 'system', b'1', '2017-04-18 02:05:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1782, '随州市', 2, 1682, '0722', '421300', 113.37377000, 31.71749700, 1682, '湖北省', 1782, '随州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1783, '曾都区', 3, 1782, '0722', '421303', 113.37451900, 31.71752100, 1682, '湖北省', 1782, '随州市', 1783, '曾都区', 'system', 'system', b'1', '2017-04-18 02:05:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1784, '随县', 3, 1782, '0722', '421321', 113.30138400, 31.85424600, 1682, '湖北省', 1782, '随州市', 1784, '随县', 'system', 'system', b'1', '2017-04-18 02:05:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1785, '广水市', 3, 1782, '0722', '421381', 113.82660100, 31.61773100, 1682, '湖北省', 1782, '随州市', 1785, '广水市', 'system', 'system', b'1', '2017-04-18 02:05:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1786, '恩施土家族苗族自治州', 2, 1682, '0718', '422800', 109.48699000, 30.28311400, 1682, '湖北省', 1786, '恩施土家族苗族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1787, '恩施市', 3, 1786, '0718', '422801', 109.48676100, 30.28240600, 1682, '湖北省', 1786, '恩施土家族苗族自治州', 1787, '恩施市', 'system', 'system', b'1', '2017-04-18 02:05:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1788, '利川市', 3, 1786, '0718', '422802', 108.94349100, 30.29424700, 1682, '湖北省', 1786, '恩施土家族苗族自治州', 1788, '利川市', 'system', 'system', b'1', '2017-04-18 02:05:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1789, '建始县', 3, 1786, '0718', '422822', 109.72382200, 30.60163200, 1682, '湖北省', 1786, '恩施土家族苗族自治州', 1789, '建始县', 'system', 'system', b'1', '2017-04-18 02:05:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1790, '巴东县', 3, 1786, '0718', '422823', 110.33666500, 31.04140300, 1682, '湖北省', 1786, '恩施土家族苗族自治州', 1790, '巴东县', 'system', 'system', b'1', '2017-04-18 02:05:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1791, '宣恩县', 3, 1786, '0718', '422825', 109.48281900, 29.98867000, 1682, '湖北省', 1786, '恩施土家族苗族自治州', 1791, '宣恩县', 'system', 'system', b'1', '2017-04-18 02:05:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1792, '咸丰县', 3, 1786, '0718', '422826', 109.15041000, 29.67896700, 1682, '湖北省', 1786, '恩施土家族苗族自治州', 1792, '咸丰县', 'system', 'system', b'1', '2017-04-18 02:05:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1793, '来凤县', 3, 1786, '0718', '422827', 109.40832800, 29.50694500, 1682, '湖北省', 1786, '恩施土家族苗族自治州', 1793, '来凤县', 'system', 'system', b'1', '2017-04-18 02:05:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1794, '鹤峰县', 3, 1786, '0718', '422828', 110.03369900, 29.88729800, 1682, '湖北省', 1786, '恩施土家族苗族自治州', 1794, '鹤峰县', 'system', 'system', b'1', '2017-04-18 02:05:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1795, '仙桃市', 2, 1682, '0728', '429004', 113.45397400, 30.36495300, 1682, '湖北省', 1795, '仙桃市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1796, '潜江市', 2, 1682, '2728', '429005', 112.89686600, 30.42121500, 1682, '湖北省', 1796, '潜江市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1797, '天门市', 2, 1682, '1728', '429006', 113.16586200, 30.65306100, 1682, '湖北省', 1797, '天门市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1798, '神农架林区', 2, 1682, '1719', '429021', 110.67152500, 31.74444900, 1682, '湖北省', 1798, '神农架林区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1799, '湖南省', 1, 1, NULL, '430000', 112.98227900, 28.19409000, 1799, '湖南省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1800, '长沙市', 2, 1799, '0731', '430100', 112.98227900, 28.19409000, 1799, '湖南省', 1800, '长沙市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1801, '芙蓉区', 3, 1800, '0731', '430102', 112.98809400, 28.19310600, 1799, '湖南省', 1800, '长沙市', 1801, '芙蓉区', 'system', 'system', b'1', '2017-04-18 02:05:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1802, '天心区', 3, 1800, '0731', '430103', 112.97307000, 28.19237500, 1799, '湖南省', 1800, '长沙市', 1802, '天心区', 'system', 'system', b'1', '2017-04-18 02:05:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1803, '岳麓区', 3, 1800, '0731', '430104', 112.91159100, 28.21304400, 1799, '湖南省', 1800, '长沙市', 1803, '岳麓区', 'system', 'system', b'1', '2017-04-18 02:05:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1804, '开福区', 3, 1800, '0731', '430105', 112.98552500, 28.20133600, 1799, '湖南省', 1800, '长沙市', 1804, '开福区', 'system', 'system', b'1', '2017-04-18 02:05:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1805, '雨花区', 3, 1800, '0731', '430111', 113.01633700, 28.10993700, 1799, '湖南省', 1800, '长沙市', 1805, '雨花区', 'system', 'system', b'1', '2017-04-18 02:05:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1806, '望城区', 3, 1800, '0731', '430112', 112.81954900, 28.34745800, 1799, '湖南省', 1800, '长沙市', 1806, '望城区', 'system', 'system', b'1', '2017-04-18 02:05:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1807, '长沙县', 3, 1800, '0731', '430121', 113.08009800, 28.23788800, 1799, '湖南省', 1800, '长沙市', 1807, '长沙县', 'system', 'system', b'1', '2017-04-18 02:05:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1808, '宁乡县', 3, 1800, '0731', '430124', 112.55318200, 28.25392800, 1799, '湖南省', 1800, '长沙市', 1808, '宁乡县', 'system', 'system', b'1', '2017-04-18 02:05:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1809, '浏阳市', 3, 1800, '0731', '430181', 113.63330100, 28.14111200, 1799, '湖南省', 1800, '长沙市', 1809, '浏阳市', 'system', 'system', b'1', '2017-04-18 02:05:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1810, '株洲市', 2, 1799, '0733', '430200', 113.15173700, 27.83580600, 1799, '湖南省', 1810, '株洲市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1811, '荷塘区', 3, 1810, '0733', '430202', 113.16254800, 27.83303600, 1799, '湖南省', 1810, '株洲市', 1811, '荷塘区', 'system', 'system', b'1', '2017-04-18 02:05:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1812, '芦淞区', 3, 1810, '0733', '430203', 113.15516900, 27.82724600, 1799, '湖南省', 1810, '株洲市', 1812, '芦淞区', 'system', 'system', b'1', '2017-04-18 02:05:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1813, '石峰区', 3, 1810, '0733', '430204', 113.11295000, 27.87194500, 1799, '湖南省', 1810, '株洲市', 1813, '石峰区', 'system', 'system', b'1', '2017-04-18 02:05:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1814, '天元区', 3, 1810, '0733', '430211', 113.13625200, 27.82690900, 1799, '湖南省', 1810, '株洲市', 1814, '天元区', 'system', 'system', b'1', '2017-04-18 02:05:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1815, '株洲县', 3, 1810, '0733', '430221', 113.14617600, 27.70584400, 1799, '湖南省', 1810, '株洲市', 1815, '株洲县', 'system', 'system', b'1', '2017-04-18 02:05:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1816, '攸县', 3, 1810, '0733', '430223', 113.34577400, 27.00007100, 1799, '湖南省', 1810, '株洲市', 1816, '攸县', 'system', 'system', b'1', '2017-04-18 02:05:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1817, '茶陵县', 3, 1810, '0733', '430224', 113.54650900, 26.78953400, 1799, '湖南省', 1810, '株洲市', 1817, '茶陵县', 'system', 'system', b'1', '2017-04-18 02:05:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1818, '炎陵县', 3, 1810, '0733', '430225', 113.77688400, 26.48945900, 1799, '湖南省', 1810, '株洲市', 1818, '炎陵县', 'system', 'system', b'1', '2017-04-18 02:05:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1819, '醴陵市', 3, 1810, '0733', '430281', 113.50715700, 27.65787300, 1799, '湖南省', 1810, '株洲市', 1819, '醴陵市', 'system', 'system', b'1', '2017-04-18 02:05:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1820, '湘潭市', 2, 1799, '0732', '430300', 112.94405200, 27.82973000, 1799, '湖南省', 1820, '湘潭市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1821, '雨湖区', 3, 1820, '0732', '430302', 112.90742700, 27.86077000, 1799, '湖南省', 1820, '湘潭市', 1821, '雨湖区', 'system', 'system', b'1', '2017-04-18 02:05:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1822, '岳塘区', 3, 1820, '0732', '430304', 112.92770700, 27.82885400, 1799, '湖南省', 1820, '湘潭市', 1822, '岳塘区', 'system', 'system', b'1', '2017-04-18 02:05:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1823, '湘潭县', 3, 1820, '0732', '430321', 112.95282900, 27.77860100, 1799, '湖南省', 1820, '湘潭市', 1823, '湘潭县', 'system', 'system', b'1', '2017-04-18 02:05:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1824, '湘乡市', 3, 1820, '0732', '430381', 112.52521700, 27.73491800, 1799, '湖南省', 1820, '湘潭市', 1824, '湘乡市', 'system', 'system', b'1', '2017-04-18 02:05:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1825, '韶山市', 3, 1820, '0732', '430382', 112.52848000, 27.92268200, 1799, '湖南省', 1820, '湘潭市', 1825, '韶山市', 'system', 'system', b'1', '2017-04-18 02:05:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1826, '衡阳市', 2, 1799, '0734', '430400', 112.60769300, 26.90035800, 1799, '湖南省', 1826, '衡阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1827, '珠晖区', 3, 1826, '0734', '430405', 112.62632400, 26.89106300, 1799, '湖南省', 1826, '衡阳市', 1827, '珠晖区', 'system', 'system', b'1', '2017-04-18 02:05:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1828, '雁峰区', 3, 1826, '0734', '430406', 112.61224100, 26.89369400, 1799, '湖南省', 1826, '衡阳市', 1828, '雁峰区', 'system', 'system', b'1', '2017-04-18 02:05:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1829, '石鼓区', 3, 1826, '0734', '430407', 112.60763500, 26.90390800, 1799, '湖南省', 1826, '衡阳市', 1829, '石鼓区', 'system', 'system', b'1', '2017-04-18 02:05:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1830, '蒸湘区', 3, 1826, '0734', '430408', 112.57060800, 26.89087000, 1799, '湖南省', 1826, '衡阳市', 1830, '蒸湘区', 'system', 'system', b'1', '2017-04-18 02:05:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1831, '南岳区', 3, 1826, '0734', '430412', 112.73414700, 27.24053600, 1799, '湖南省', 1826, '衡阳市', 1831, '南岳区', 'system', 'system', b'1', '2017-04-18 02:05:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1832, '衡阳县', 3, 1826, '0734', '430421', 112.37964300, 26.96238800, 1799, '湖南省', 1826, '衡阳市', 1832, '衡阳县', 'system', 'system', b'1', '2017-04-18 02:05:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1833, '衡南县', 3, 1826, '0734', '430422', 112.67745900, 26.73997300, 1799, '湖南省', 1826, '衡阳市', 1833, '衡南县', 'system', 'system', b'1', '2017-04-18 02:05:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1834, '衡山县', 3, 1826, '0734', '430423', 112.86971000, 27.23480800, 1799, '湖南省', 1826, '衡阳市', 1834, '衡山县', 'system', 'system', b'1', '2017-04-18 02:05:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1835, '衡东县', 3, 1826, '0734', '430424', 112.95041200, 27.08353100, 1799, '湖南省', 1826, '衡阳市', 1835, '衡东县', 'system', 'system', b'1', '2017-04-18 02:05:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1836, '祁东县', 3, 1826, '0734', '430426', 112.11119200, 26.78710900, 1799, '湖南省', 1826, '衡阳市', 1836, '祁东县', 'system', 'system', b'1', '2017-04-18 02:05:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1837, '耒阳市', 3, 1826, '0734', '430481', 112.84721500, 26.41416200, 1799, '湖南省', 1826, '衡阳市', 1837, '耒阳市', 'system', 'system', b'1', '2017-04-18 02:05:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1838, '常宁市', 3, 1826, '0734', '430482', 112.39682100, 26.40677300, 1799, '湖南省', 1826, '衡阳市', 1838, '常宁市', 'system', 'system', b'1', '2017-04-18 02:05:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1839, '邵阳市', 2, 1799, '0739', '430500', 111.46923000, 27.23784200, 1799, '湖南省', 1839, '邵阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1840, '双清区', 3, 1839, '0739', '430502', 111.47975600, 27.24000100, 1799, '湖南省', 1839, '邵阳市', 1840, '双清区', 'system', 'system', b'1', '2017-04-18 02:05:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1841, '大祥区', 3, 1839, '0739', '430503', 111.46296800, 27.23359300, 1799, '湖南省', 1839, '邵阳市', 1841, '大祥区', 'system', 'system', b'1', '2017-04-18 02:05:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1842, '北塔区', 3, 1839, '0739', '430511', 111.45231500, 27.24568800, 1799, '湖南省', 1839, '邵阳市', 1842, '北塔区', 'system', 'system', b'1', '2017-04-18 02:05:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1843, '邵东县', 3, 1839, '0739', '430521', 111.74316800, 27.25727300, 1799, '湖南省', 1839, '邵阳市', 1843, '邵东县', 'system', 'system', b'1', '2017-04-18 02:05:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1844, '新邵县', 3, 1839, '0739', '430522', 111.45976200, 27.31142900, 1799, '湖南省', 1839, '邵阳市', 1844, '新邵县', 'system', 'system', b'1', '2017-04-18 02:05:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1845, '邵阳县', 3, 1839, '0739', '430523', 111.27570000, 26.98971300, 1799, '湖南省', 1839, '邵阳市', 1845, '邵阳县', 'system', 'system', b'1', '2017-04-18 02:05:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1846, '隆回县', 3, 1839, '0739', '430524', 111.03878500, 27.11600200, 1799, '湖南省', 1839, '邵阳市', 1846, '隆回县', 'system', 'system', b'1', '2017-04-18 02:05:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1847, '洞口县', 3, 1839, '0739', '430525', 110.57921200, 27.06228600, 1799, '湖南省', 1839, '邵阳市', 1847, '洞口县', 'system', 'system', b'1', '2017-04-18 02:05:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1848, '绥宁县', 3, 1839, '0739', '430527', 110.15507500, 26.58062200, 1799, '湖南省', 1839, '邵阳市', 1848, '绥宁县', 'system', 'system', b'1', '2017-04-18 02:05:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1849, '新宁县', 3, 1839, '0739', '430528', 110.85911500, 26.43891200, 1799, '湖南省', 1839, '邵阳市', 1849, '新宁县', 'system', 'system', b'1', '2017-04-18 02:05:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1850, '城步苗族自治县', 3, 1839, '0739', '430529', 110.31322600, 26.36357500, 1799, '湖南省', 1839, '邵阳市', 1850, '城步苗族自治县', 'system', 'system', b'1', '2017-04-18 02:05:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1851, '武冈市', 3, 1839, '0739', '430581', 110.63680400, 26.73208600, 1799, '湖南省', 1839, '邵阳市', 1851, '武冈市', 'system', 'system', b'1', '2017-04-18 02:05:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1852, '岳阳市', 2, 1799, '0730', '430600', 113.13285500, 29.37029000, 1799, '湖南省', 1852, '岳阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1853, '岳阳楼区', 3, 1852, '0730', '430602', 113.12075100, 29.36678400, 1799, '湖南省', 1852, '岳阳市', 1853, '岳阳楼区', 'system', 'system', b'1', '2017-04-18 02:05:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1854, '云溪区', 3, 1852, '0730', '430603', 113.27387000, 29.47339500, 1799, '湖南省', 1852, '岳阳市', 1854, '云溪区', 'system', 'system', b'1', '2017-04-18 02:05:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1855, '君山区', 3, 1852, '0730', '430611', 113.00408200, 29.43806200, 1799, '湖南省', 1852, '岳阳市', 1855, '君山区', 'system', 'system', b'1', '2017-04-18 02:05:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1856, '岳阳县', 3, 1852, '0730', '430621', 113.11607300, 29.14484300, 1799, '湖南省', 1852, '岳阳市', 1856, '岳阳县', 'system', 'system', b'1', '2017-04-18 02:05:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1857, '华容县', 3, 1852, '0730', '430623', 112.55936900, 29.52410700, 1799, '湖南省', 1852, '岳阳市', 1857, '华容县', 'system', 'system', b'1', '2017-04-18 02:05:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1858, '湘阴县', 3, 1852, '0730', '430624', 112.88974800, 28.67749800, 1799, '湖南省', 1852, '岳阳市', 1858, '湘阴县', 'system', 'system', b'1', '2017-04-18 02:05:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1859, '平江县', 3, 1852, '0730', '430626', 113.59375100, 28.70152300, 1799, '湖南省', 1852, '岳阳市', 1859, '平江县', 'system', 'system', b'1', '2017-04-18 02:05:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1860, '汨罗市', 3, 1852, '0730', '430681', 113.07941900, 28.80314900, 1799, '湖南省', 1852, '岳阳市', 1860, '汨罗市', 'system', 'system', b'1', '2017-04-18 02:05:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1861, '临湘市', 3, 1852, '0730', '430682', 113.45080900, 29.47159400, 1799, '湖南省', 1852, '岳阳市', 1861, '临湘市', 'system', 'system', b'1', '2017-04-18 02:05:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1862, '常德市', 2, 1799, '0736', '430700', 111.69134700, 29.04022500, 1799, '湖南省', 1862, '常德市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1863, '武陵区', 3, 1862, '0736', '430702', 111.69071800, 29.04047700, 1799, '湖南省', 1862, '常德市', 1863, '武陵区', 'system', 'system', b'1', '2017-04-18 02:05:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1864, '鼎城区', 3, 1862, '0736', '430703', 111.68532700, 29.01442600, 1799, '湖南省', 1862, '常德市', 1864, '鼎城区', 'system', 'system', b'1', '2017-04-18 02:05:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1865, '安乡县', 3, 1862, '0736', '430721', 112.17228900, 29.41448300, 1799, '湖南省', 1862, '常德市', 1865, '安乡县', 'system', 'system', b'1', '2017-04-18 02:05:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1866, '汉寿县', 3, 1862, '0736', '430722', 111.96850600, 28.90731900, 1799, '湖南省', 1862, '常德市', 1866, '汉寿县', 'system', 'system', b'1', '2017-04-18 02:05:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1867, '澧县', 3, 1862, '0736', '430723', 111.76168200, 29.64264000, 1799, '湖南省', 1862, '常德市', 1867, '澧县', 'system', 'system', b'1', '2017-04-18 02:05:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1868, '临澧县', 3, 1862, '0736', '430724', 111.64560200, 29.44321700, 1799, '湖南省', 1862, '常德市', 1868, '临澧县', 'system', 'system', b'1', '2017-04-18 02:05:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1869, '桃源县', 3, 1862, '0736', '430725', 111.48450300, 28.90273400, 1799, '湖南省', 1862, '常德市', 1869, '桃源县', 'system', 'system', b'1', '2017-04-18 02:05:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1870, '石门县', 3, 1862, '0736', '430726', 111.37908700, 29.58470300, 1799, '湖南省', 1862, '常德市', 1870, '石门县', 'system', 'system', b'1', '2017-04-18 02:05:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1871, '津市市', 3, 1862, '0736', '430781', 111.87960900, 29.63086700, 1799, '湖南省', 1862, '常德市', 1871, '津市市', 'system', 'system', b'1', '2017-04-18 02:05:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1872, '张家界市', 2, 1799, '0744', '430800', 110.47992100, 29.12740100, 1799, '湖南省', 1872, '张家界市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1873, '永定区', 3, 1872, '0744', '430802', 110.48455900, 29.12596100, 1799, '湖南省', 1872, '张家界市', 1873, '永定区', 'system', 'system', b'1', '2017-04-18 02:05:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1874, '武陵源区', 3, 1872, '0744', '430811', 110.54758000, 29.34782700, 1799, '湖南省', 1872, '张家界市', 1874, '武陵源区', 'system', 'system', b'1', '2017-04-18 02:05:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1875, '慈利县', 3, 1872, '0744', '430821', 111.13270200, 29.42387600, 1799, '湖南省', 1872, '张家界市', 1875, '慈利县', 'system', 'system', b'1', '2017-04-18 02:05:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1876, '桑植县', 3, 1872, '0744', '430822', 110.16403900, 29.39993900, 1799, '湖南省', 1872, '张家界市', 1876, '桑植县', 'system', 'system', b'1', '2017-04-18 02:05:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1877, '益阳市', 2, 1799, '0737', '430900', 112.35504200, 28.57006600, 1799, '湖南省', 1877, '益阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1878, '资阳区', 3, 1877, '0737', '430902', 112.33084000, 28.59277100, 1799, '湖南省', 1877, '益阳市', 1878, '资阳区', 'system', 'system', b'1', '2017-04-18 02:05:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1879, '赫山区', 3, 1877, '0737', '430903', 112.36094600, 28.56832700, 1799, '湖南省', 1877, '益阳市', 1879, '赫山区', 'system', 'system', b'1', '2017-04-18 02:05:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1880, '南县', 3, 1877, '0737', '430921', 112.41039900, 29.37218100, 1799, '湖南省', 1877, '益阳市', 1880, '南县', 'system', 'system', b'1', '2017-04-18 02:05:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1881, '桃江县', 3, 1877, '0737', '430922', 112.13973200, 28.52099300, 1799, '湖南省', 1877, '益阳市', 1881, '桃江县', 'system', 'system', b'1', '2017-04-18 02:05:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1882, '安化县', 3, 1877, '0737', '430923', 111.22182400, 28.37742100, 1799, '湖南省', 1877, '益阳市', 1882, '安化县', 'system', 'system', b'1', '2017-04-18 02:05:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1883, '沅江市', 3, 1877, '0737', '430981', 112.36108800, 28.83971300, 1799, '湖南省', 1877, '益阳市', 1883, '沅江市', 'system', 'system', b'1', '2017-04-18 02:05:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1884, '郴州市', 2, 1799, '0735', '431000', 113.03206700, 25.79358900, 1799, '湖南省', 1884, '郴州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1885, '北湖区', 3, 1884, '0735', '431002', 113.03220800, 25.79262800, 1799, '湖南省', 1884, '郴州市', 1885, '北湖区', 'system', 'system', b'1', '2017-04-18 02:05:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1886, '苏仙区', 3, 1884, '0735', '431003', 113.03869800, 25.79315700, 1799, '湖南省', 1884, '郴州市', 1886, '苏仙区', 'system', 'system', b'1', '2017-04-18 02:05:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1887, '桂阳县', 3, 1884, '0735', '431021', 112.73446600, 25.73744700, 1799, '湖南省', 1884, '郴州市', 1887, '桂阳县', 'system', 'system', b'1', '2017-04-18 02:05:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1888, '宜章县', 3, 1884, '0735', '431022', 112.94788400, 25.39434500, 1799, '湖南省', 1884, '郴州市', 1888, '宜章县', 'system', 'system', b'1', '2017-04-18 02:05:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1889, '永兴县', 3, 1884, '0735', '431023', 113.11481900, 26.12939200, 1799, '湖南省', 1884, '郴州市', 1889, '永兴县', 'system', 'system', b'1', '2017-04-18 02:05:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1890, '嘉禾县', 3, 1884, '0735', '431024', 112.37061800, 25.58730900, 1799, '湖南省', 1884, '郴州市', 1890, '嘉禾县', 'system', 'system', b'1', '2017-04-18 02:05:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1891, '临武县', 3, 1884, '0735', '431025', 112.56458900, 25.27911900, 1799, '湖南省', 1884, '郴州市', 1891, '临武县', 'system', 'system', b'1', '2017-04-18 02:05:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1892, '汝城县', 3, 1884, '0735', '431026', 113.68568600, 25.55375900, 1799, '湖南省', 1884, '郴州市', 1892, '汝城县', 'system', 'system', b'1', '2017-04-18 02:05:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1893, '桂东县', 3, 1884, '0735', '431027', 113.94587900, 26.07391700, 1799, '湖南省', 1884, '郴州市', 1893, '桂东县', 'system', 'system', b'1', '2017-04-18 02:05:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1894, '安仁县', 3, 1884, '0735', '431028', 113.27217000, 26.70862500, 1799, '湖南省', 1884, '郴州市', 1894, '安仁县', 'system', 'system', b'1', '2017-04-18 02:05:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1895, '资兴市', 3, 1884, '0735', '431081', 113.23682000, 25.97415200, 1799, '湖南省', 1884, '郴州市', 1895, '资兴市', 'system', 'system', b'1', '2017-04-18 02:05:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1896, '永州市', 2, 1799, '0746', '431100', 111.60801900, 26.43451600, 1799, '湖南省', 1896, '永州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1897, '零陵区', 3, 1896, '0746', '431102', 111.62634800, 26.22334700, 1799, '湖南省', 1896, '永州市', 1897, '零陵区', 'system', 'system', b'1', '2017-04-18 02:05:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1898, '冷水滩区', 3, 1896, '0746', '431103', 111.60715600, 26.43436400, 1799, '湖南省', 1896, '永州市', 1898, '冷水滩区', 'system', 'system', b'1', '2017-04-18 02:05:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1899, '祁阳县', 3, 1896, '0746', '431121', 111.85734000, 26.58592900, 1799, '湖南省', 1896, '永州市', 1899, '祁阳县', 'system', 'system', b'1', '2017-04-18 02:05:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1900, '东安县', 3, 1896, '0746', '431122', 111.31303500, 26.39727800, 1799, '湖南省', 1896, '永州市', 1900, '东安县', 'system', 'system', b'1', '2017-04-18 02:05:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1901, '双牌县', 3, 1896, '0746', '431123', 111.66214600, 25.95939700, 1799, '湖南省', 1896, '永州市', 1901, '双牌县', 'system', 'system', b'1', '2017-04-18 02:05:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1902, '道县', 3, 1896, '0746', '431124', 111.59161400, 25.51844400, 1799, '湖南省', 1896, '永州市', 1902, '道县', 'system', 'system', b'1', '2017-04-18 02:05:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1903, '江永县', 3, 1896, '0746', '431125', 111.34680300, 25.26815400, 1799, '湖南省', 1896, '永州市', 1903, '江永县', 'system', 'system', b'1', '2017-04-18 02:05:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1904, '宁远县', 3, 1896, '0746', '431126', 111.94452900, 25.58411200, 1799, '湖南省', 1896, '永州市', 1904, '宁远县', 'system', 'system', b'1', '2017-04-18 02:05:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1905, '蓝山县', 3, 1896, '0746', '431127', 112.19419500, 25.37525500, 1799, '湖南省', 1896, '永州市', 1905, '蓝山县', 'system', 'system', b'1', '2017-04-18 02:05:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1906, '新田县', 3, 1896, '0746', '431128', 112.22034100, 25.90692700, 1799, '湖南省', 1896, '永州市', 1906, '新田县', 'system', 'system', b'1', '2017-04-18 02:05:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1907, '江华瑶族自治县', 3, 1896, '0746', '431129', 111.57727600, 25.18259600, 1799, '湖南省', 1896, '永州市', 1907, '江华瑶族自治县', 'system', 'system', b'1', '2017-04-18 02:05:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1908, '怀化市', 2, 1799, '0745', '431200', 109.97824000, 27.55008200, 1799, '湖南省', 1908, '怀化市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1909, '鹤城区', 3, 1908, '0745', '431202', 109.98224200, 27.54847400, 1799, '湖南省', 1908, '怀化市', 1909, '鹤城区', 'system', 'system', b'1', '2017-04-18 02:05:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1910, '中方县', 3, 1908, '0745', '431221', 109.94806100, 27.43736000, 1799, '湖南省', 1908, '怀化市', 1910, '中方县', 'system', 'system', b'1', '2017-04-18 02:05:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1911, '沅陵县', 3, 1908, '0745', '431222', 110.39916100, 28.45555400, 1799, '湖南省', 1908, '怀化市', 1911, '沅陵县', 'system', 'system', b'1', '2017-04-18 02:05:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1912, '辰溪县', 3, 1908, '0745', '431223', 110.19695300, 28.00547400, 1799, '湖南省', 1908, '怀化市', 1912, '辰溪县', 'system', 'system', b'1', '2017-04-18 02:05:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1913, '溆浦县', 3, 1908, '0745', '431224', 110.59337300, 27.90380200, 1799, '湖南省', 1908, '怀化市', 1913, '溆浦县', 'system', 'system', b'1', '2017-04-18 02:05:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1914, '会同县', 3, 1908, '0745', '431225', 109.72078500, 26.87078900, 1799, '湖南省', 1908, '怀化市', 1914, '会同县', 'system', 'system', b'1', '2017-04-18 02:05:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1915, '麻阳苗族自治县', 3, 1908, '0745', '431226', 109.80280700, 27.86599100, 1799, '湖南省', 1908, '怀化市', 1915, '麻阳苗族自治县', 'system', 'system', b'1', '2017-04-18 02:05:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1916, '新晃侗族自治县', 3, 1908, '0745', '431227', 109.17444300, 27.35989700, 1799, '湖南省', 1908, '怀化市', 1916, '新晃侗族自治县', 'system', 'system', b'1', '2017-04-18 02:05:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1917, '芷江侗族自治县', 3, 1908, '0745', '431228', 109.68777700, 27.43799600, 1799, '湖南省', 1908, '怀化市', 1917, '芷江侗族自治县', 'system', 'system', b'1', '2017-04-18 02:05:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1918, '靖州苗族侗族自治县', 3, 1908, '0745', '431229', 109.69115900, 26.57351100, 1799, '湖南省', 1908, '怀化市', 1918, '靖州苗族侗族自治县', 'system', 'system', b'1', '2017-04-18 02:05:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1919, '通道侗族自治县', 3, 1908, '0745', '431230', 109.78335900, 26.15834900, 1799, '湖南省', 1908, '怀化市', 1919, '通道侗族自治县', 'system', 'system', b'1', '2017-04-18 02:05:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1920, '洪江市', 3, 1908, '0745', '431281', 109.83176500, 27.20187600, 1799, '湖南省', 1908, '怀化市', 1920, '洪江市', 'system', 'system', b'1', '2017-04-18 02:05:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1921, '娄底市', 2, 1799, '0738', '431300', 112.00849700, 27.72813600, 1799, '湖南省', 1921, '娄底市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1922, '娄星区', 3, 1921, '0738', '431302', 112.00848600, 27.72664300, 1799, '湖南省', 1921, '娄底市', 1922, '娄星区', 'system', 'system', b'1', '2017-04-18 02:05:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1923, '双峰县', 3, 1921, '0738', '431321', 112.19824500, 27.45912600, 1799, '湖南省', 1921, '娄底市', 1923, '双峰县', 'system', 'system', b'1', '2017-04-18 02:05:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1924, '新化县', 3, 1921, '0738', '431322', 111.30674700, 27.73745600, 1799, '湖南省', 1921, '娄底市', 1924, '新化县', 'system', 'system', b'1', '2017-04-18 02:05:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1925, '冷水江市', 3, 1921, '0738', '431381', 111.43467400, 27.68575900, 1799, '湖南省', 1921, '娄底市', 1925, '冷水江市', 'system', 'system', b'1', '2017-04-18 02:05:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1926, '涟源市', 3, 1921, '0738', '431382', 111.67084700, 27.69230100, 1799, '湖南省', 1921, '娄底市', 1926, '涟源市', 'system', 'system', b'1', '2017-04-18 02:05:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1927, '湘西土家族苗族自治州', 2, 1799, '0743', '433100', 109.73973500, 28.31429600, 1799, '湖南省', 1927, '湘西土家族苗族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1928, '吉首市', 3, 1927, '0743', '433101', 109.73827300, 28.31482700, 1799, '湖南省', 1927, '湘西土家族苗族自治州', 1928, '吉首市', 'system', 'system', b'1', '2017-04-18 02:05:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1929, '泸溪县', 3, 1927, '0743', '433122', 110.21442800, 28.21451600, 1799, '湖南省', 1927, '湘西土家族苗族自治州', 1929, '泸溪县', 'system', 'system', b'1', '2017-04-18 02:05:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1930, '凤凰县', 3, 1927, '0743', '433123', 109.59919100, 27.94830800, 1799, '湖南省', 1927, '湘西土家族苗族自治州', 1930, '凤凰县', 'system', 'system', b'1', '2017-04-18 02:05:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1931, '花垣县', 3, 1927, '0743', '433124', 109.47906300, 28.58135200, 1799, '湖南省', 1927, '湘西土家族苗族自治州', 1931, '花垣县', 'system', 'system', b'1', '2017-04-18 02:05:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1932, '保靖县', 3, 1927, '0743', '433125', 109.65144500, 28.70960500, 1799, '湖南省', 1927, '湘西土家族苗族自治州', 1932, '保靖县', 'system', 'system', b'1', '2017-04-18 02:05:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1933, '古丈县', 3, 1927, '0743', '433126', 109.94959200, 28.61697300, 1799, '湖南省', 1927, '湘西土家族苗族自治州', 1933, '古丈县', 'system', 'system', b'1', '2017-04-18 02:05:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1934, '永顺县', 3, 1927, '0743', '433127', 109.85329200, 28.99806800, 1799, '湖南省', 1927, '湘西土家族苗族自治州', 1934, '永顺县', 'system', 'system', b'1', '2017-04-18 02:05:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1935, '龙山县', 3, 1927, '0743', '433130', 109.44118900, 29.45343800, 1799, '湖南省', 1927, '湘西土家族苗族自治州', 1935, '龙山县', 'system', 'system', b'1', '2017-04-18 02:05:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1936, '广东省', 1, 1, NULL, '440000', 113.28063700, 23.12517800, 1936, '广东省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1937, '广州市', 2, 1936, '020', '440100', 113.28063700, 23.12517800, 1936, '广东省', 1937, '广州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1938, '荔湾区', 3, 1937, '020', '440103', 113.24303800, 23.12494300, 1936, '广东省', 1937, '广州市', 1938, '荔湾区', 'system', 'system', b'1', '2017-04-18 02:05:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1939, '越秀区', 3, 1937, '020', '440104', 113.28071400, 23.12562400, 1936, '广东省', 1937, '广州市', 1939, '越秀区', 'system', 'system', b'1', '2017-04-18 02:05:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1940, '海珠区', 3, 1937, '020', '440105', 113.26200800, 23.10313100, 1936, '广东省', 1937, '广州市', 1940, '海珠区', 'system', 'system', b'1', '2017-04-18 02:05:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1941, '天河区', 3, 1937, '020', '440106', 113.33536700, 23.13559000, 1936, '广东省', 1937, '广州市', 1941, '天河区', 'system', 'system', b'1', '2017-04-18 02:05:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1942, '白云区', 3, 1937, '020', '440111', 113.26283100, 23.16228100, 1936, '广东省', 1937, '广州市', 1942, '白云区', 'system', 'system', b'1', '2017-04-18 02:05:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1943, '黄埔区', 3, 1937, '020', '440112', 113.45076100, 23.10323900, 1936, '广东省', 1937, '广州市', 1943, '黄埔区', 'system', 'system', b'1', '2017-04-18 02:05:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1944, '番禺区', 3, 1937, '020', '440113', 113.36461900, 22.93858200, 1936, '广东省', 1937, '广州市', 1944, '番禺区', 'system', 'system', b'1', '2017-04-18 02:05:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1945, '花都区', 3, 1937, '020', '440114', 113.21118400, 23.39205000, 1936, '广东省', 1937, '广州市', 1945, '花都区', 'system', 'system', b'1', '2017-04-18 02:05:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1946, '南沙区', 3, 1937, '020', '440115', 113.53738000, 22.79453100, 1936, '广东省', 1937, '广州市', 1946, '南沙区', 'system', 'system', b'1', '2017-04-18 02:05:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1947, '从化区', 3, 1937, '020', '440117', 113.58738600, 23.54528300, 1936, '广东省', 1937, '广州市', 1947, '从化区', 'system', 'system', b'1', '2017-04-18 02:05:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1948, '增城区', 3, 1937, '020', '440118', 113.82957900, 23.29049700, 1936, '广东省', 1937, '广州市', 1948, '增城区', 'system', 'system', b'1', '2017-04-18 02:05:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1949, '韶关市', 2, 1936, '0751', '440200', 113.59154400, 24.80132200, 1936, '广东省', 1949, '韶关市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1950, '武江区', 3, 1949, '0751', '440203', 113.58828900, 24.80016000, 1936, '广东省', 1949, '韶关市', 1950, '武江区', 'system', 'system', b'1', '2017-04-18 02:05:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1951, '浈江区', 3, 1949, '0751', '440204', 113.59922400, 24.80397700, 1936, '广东省', 1949, '韶关市', 1951, '浈江区', 'system', 'system', b'1', '2017-04-18 02:05:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1952, '曲江区', 3, 1949, '0751', '440205', 113.60558200, 24.68019500, 1936, '广东省', 1949, '韶关市', 1952, '曲江区', 'system', 'system', b'1', '2017-04-18 02:05:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1953, '始兴县', 3, 1949, '0751', '440222', 114.06720500, 24.94836400, 1936, '广东省', 1949, '韶关市', 1953, '始兴县', 'system', 'system', b'1', '2017-04-18 02:05:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1954, '仁化县', 3, 1949, '0751', '440224', 113.74862700, 25.08822600, 1936, '广东省', 1949, '韶关市', 1954, '仁化县', 'system', 'system', b'1', '2017-04-18 02:05:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1955, '翁源县', 3, 1949, '0751', '440229', 114.13128900, 24.35388700, 1936, '广东省', 1949, '韶关市', 1955, '翁源县', 'system', 'system', b'1', '2017-04-18 02:05:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1956, '乳源瑶族自治县', 3, 1949, '0751', '440232', 113.27841700, 24.77610900, 1936, '广东省', 1949, '韶关市', 1956, '乳源瑶族自治县', 'system', 'system', b'1', '2017-04-18 02:05:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1957, '新丰县', 3, 1949, '0751', '440233', 114.20703400, 24.05541200, 1936, '广东省', 1949, '韶关市', 1957, '新丰县', 'system', 'system', b'1', '2017-04-18 02:05:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1958, '乐昌市', 3, 1949, '0751', '440281', 113.35241300, 25.12844500, 1936, '广东省', 1949, '韶关市', 1958, '乐昌市', 'system', 'system', b'1', '2017-04-18 02:05:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1959, '南雄市', 3, 1949, '0751', '440282', 114.31123100, 25.11532800, 1936, '广东省', 1949, '韶关市', 1959, '南雄市', 'system', 'system', b'1', '2017-04-18 02:05:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1960, '深圳市', 2, 1936, '0755', '440300', 114.08594700, 22.54700000, 1936, '广东省', 1960, '深圳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1961, '罗湖区', 3, 1960, '0755', '440303', 114.12388500, 22.55534100, 1936, '广东省', 1960, '深圳市', 1961, '罗湖区', 'system', 'system', b'1', '2017-04-18 02:05:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1962, '福田区', 3, 1960, '0755', '440304', 114.05096000, 22.54100900, 1936, '广东省', 1960, '深圳市', 1962, '福田区', 'system', 'system', b'1', '2017-04-18 02:05:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1963, '南山区', 3, 1960, '0755', '440305', 113.92943000, 22.53122100, 1936, '广东省', 1960, '深圳市', 1963, '南山区', 'system', 'system', b'1', '2017-04-18 02:05:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1964, '宝安区', 3, 1960, '0755', '440306', 113.82867100, 22.75474100, 1936, '广东省', 1960, '深圳市', 1964, '宝安区', 'system', 'system', b'1', '2017-04-18 02:05:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1965, '龙岗区', 3, 1960, '0755', '440307', 114.25137200, 22.72151100, 1936, '广东省', 1960, '深圳市', 1965, '龙岗区', 'system', 'system', b'1', '2017-04-18 02:05:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1966, '盐田区', 3, 1960, '0755', '440308', 114.23536600, 22.55506900, 1936, '广东省', 1960, '深圳市', 1966, '盐田区', 'system', 'system', b'1', '2017-04-18 02:05:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1967, '珠海市', 2, 1936, '0756', '440400', 113.55398600, 22.22497900, 1936, '广东省', 1967, '珠海市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1968, '香洲区', 3, 1967, '0756', '440402', 113.55027000, 22.27124900, 1936, '广东省', 1967, '珠海市', 1968, '香洲区', 'system', 'system', b'1', '2017-04-18 02:05:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1969, '斗门区', 3, 1967, '0756', '440403', 113.29773900, 22.20911700, 1936, '广东省', 1967, '珠海市', 1969, '斗门区', 'system', 'system', b'1', '2017-04-18 02:05:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1970, '金湾区', 3, 1967, '0756', '440404', 113.34507100, 22.13912200, 1936, '广东省', 1967, '珠海市', 1970, '金湾区', 'system', 'system', b'1', '2017-04-18 02:05:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1971, '汕头市', 2, 1936, '0754', '440500', 116.70846300, 23.37102000, 1936, '广东省', 1971, '汕头市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1972, '龙湖区', 3, 1971, '0754', '440507', 116.73201500, 23.37375400, 1936, '广东省', 1971, '汕头市', 1972, '龙湖区', 'system', 'system', b'1', '2017-04-18 02:05:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1973, '金平区', 3, 1971, '0754', '440511', 116.70358300, 23.36707100, 1936, '广东省', 1971, '汕头市', 1973, '金平区', 'system', 'system', b'1', '2017-04-18 02:05:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1974, '濠江区', 3, 1971, '0754', '440512', 116.72952800, 23.27934500, 1936, '广东省', 1971, '汕头市', 1974, '濠江区', 'system', 'system', b'1', '2017-04-18 02:05:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1975, '潮阳区', 3, 1971, '0754', '440513', 116.60260200, 23.26233600, 1936, '广东省', 1971, '汕头市', 1975, '潮阳区', 'system', 'system', b'1', '2017-04-18 02:05:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1976, '潮南区', 3, 1971, '0754', '440514', 116.42360700, 23.24979800, 1936, '广东省', 1971, '汕头市', 1976, '潮南区', 'system', 'system', b'1', '2017-04-18 02:05:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1977, '澄海区', 3, 1971, '0754', '440515', 116.76336000, 23.46844000, 1936, '广东省', 1971, '汕头市', 1977, '澄海区', 'system', 'system', b'1', '2017-04-18 02:05:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1978, '南澳县', 3, 1971, '0754', '440523', 117.02710500, 23.41956200, 1936, '广东省', 1971, '汕头市', 1978, '南澳县', 'system', 'system', b'1', '2017-04-18 02:05:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1979, '佛山市', 2, 1936, '0757', '440600', 113.12271700, 23.02876200, 1936, '广东省', 1979, '佛山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1980, '禅城区', 3, 1979, '0757', '440604', 113.11241400, 23.01964300, 1936, '广东省', 1979, '佛山市', 1980, '禅城区', 'system', 'system', b'1', '2017-04-18 02:05:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1981, '南海区', 3, 1979, '0757', '440605', 113.14557700, 23.03156200, 1936, '广东省', 1979, '佛山市', 1981, '南海区', 'system', 'system', b'1', '2017-04-18 02:05:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1982, '顺德区', 3, 1979, '0757', '440606', 113.28182600, 22.75851000, 1936, '广东省', 1979, '佛山市', 1982, '顺德区', 'system', 'system', b'1', '2017-04-18 02:05:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1983, '三水区', 3, 1979, '0757', '440607', 112.89941400, 23.16504000, 1936, '广东省', 1979, '佛山市', 1983, '三水区', 'system', 'system', b'1', '2017-04-18 02:05:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1984, '高明区', 3, 1979, '0757', '440608', 112.88212300, 22.89385500, 1936, '广东省', 1979, '佛山市', 1984, '高明区', 'system', 'system', b'1', '2017-04-18 02:05:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1985, '江门市', 2, 1936, '0750', '440700', 113.09494200, 22.59043100, 1936, '广东省', 1985, '江门市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1986, '蓬江区', 3, 1985, '0750', '440703', 113.07859000, 22.59677000, 1936, '广东省', 1985, '江门市', 1986, '蓬江区', 'system', 'system', b'1', '2017-04-18 02:05:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1987, '江海区', 3, 1985, '0750', '440704', 113.12060100, 22.57221100, 1936, '广东省', 1985, '江门市', 1987, '江海区', 'system', 'system', b'1', '2017-04-18 02:05:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1988, '新会区', 3, 1985, '0750', '440705', 113.03858400, 22.52024700, 1936, '广东省', 1985, '江门市', 1988, '新会区', 'system', 'system', b'1', '2017-04-18 02:05:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1989, '台山市', 3, 1985, '0750', '440781', 112.79341400, 22.25071300, 1936, '广东省', 1985, '江门市', 1989, '台山市', 'system', 'system', b'1', '2017-04-18 02:05:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1990, '开平市', 3, 1985, '0750', '440783', 112.69226200, 22.36628600, 1936, '广东省', 1985, '江门市', 1990, '开平市', 'system', 'system', b'1', '2017-04-18 02:05:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1991, '鹤山市', 3, 1985, '0750', '440784', 112.96179500, 22.76810400, 1936, '广东省', 1985, '江门市', 1991, '鹤山市', 'system', 'system', b'1', '2017-04-18 02:05:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1992, '恩平市', 3, 1985, '0750', '440785', 112.31405100, 22.18295600, 1936, '广东省', 1985, '江门市', 1992, '恩平市', 'system', 'system', b'1', '2017-04-18 02:05:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1993, '湛江市', 2, 1936, '0759', '440800', 110.36497700, 21.27489800, 1936, '广东省', 1993, '湛江市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1994, '赤坎区', 3, 1993, '0759', '440802', 110.36163400, 21.27336500, 1936, '广东省', 1993, '湛江市', 1994, '赤坎区', 'system', 'system', b'1', '2017-04-18 02:05:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1995, '霞山区', 3, 1993, '0759', '440803', 110.40638200, 21.19422900, 1936, '广东省', 1993, '湛江市', 1995, '霞山区', 'system', 'system', b'1', '2017-04-18 02:05:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1996, '坡头区', 3, 1993, '0759', '440804', 110.45563200, 21.24441000, 1936, '广东省', 1993, '湛江市', 1996, '坡头区', 'system', 'system', b'1', '2017-04-18 02:05:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1997, '麻章区', 3, 1993, '0759', '440811', 110.32916700, 21.26599700, 1936, '广东省', 1993, '湛江市', 1997, '麻章区', 'system', 'system', b'1', '2017-04-18 02:05:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1998, '遂溪县', 3, 1993, '0759', '440823', 110.25532100, 21.37691500, 1936, '广东省', 1993, '湛江市', 1998, '遂溪县', 'system', 'system', b'1', '2017-04-18 02:05:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (1999, '徐闻县', 3, 1993, '0759', '440825', 110.17571800, 20.32608300, 1936, '广东省', 1993, '湛江市', 1999, '徐闻县', 'system', 'system', b'1', '2017-04-18 02:05:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2000, '廉江市', 3, 1993, '0759', '440881', 110.28496100, 21.61128100, 1936, '广东省', 1993, '湛江市', 2000, '廉江市', 'system', 'system', b'1', '2017-04-18 02:05:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2001, '雷州市', 3, 1993, '0759', '440882', 110.08827500, 20.90852300, 1936, '广东省', 1993, '湛江市', 2001, '雷州市', 'system', 'system', b'1', '2017-04-18 02:05:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2002, '吴川市', 3, 1993, '0759', '440883', 110.78050800, 21.42845300, 1936, '广东省', 1993, '湛江市', 2002, '吴川市', 'system', 'system', b'1', '2017-04-18 02:05:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2003, '茂名市', 2, 1936, '0668', '440900', 110.91922900, 21.65975100, 1936, '广东省', 2003, '茂名市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2004, '茂南区', 3, 2003, '0668', '440902', 110.92054200, 21.66042500, 1936, '广东省', 2003, '茂名市', 2004, '茂南区', 'system', 'system', b'1', '2017-04-18 02:05:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2005, '电白区', 3, 2003, '0668', '440904', 111.00726400, 21.50721900, 1936, '广东省', 2003, '茂名市', 2005, '电白区', 'system', 'system', b'1', '2017-04-18 02:05:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2006, '高州市', 3, 2003, '0668', '440981', 110.85325100, 21.91515300, 1936, '广东省', 2003, '茂名市', 2006, '高州市', 'system', 'system', b'1', '2017-04-18 02:05:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2007, '化州市', 3, 2003, '0668', '440982', 110.63839000, 21.65495300, 1936, '广东省', 2003, '茂名市', 2007, '化州市', 'system', 'system', b'1', '2017-04-18 02:05:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2008, '信宜市', 3, 2003, '0668', '440983', 110.94165600, 22.35268100, 1936, '广东省', 2003, '茂名市', 2008, '信宜市', 'system', 'system', b'1', '2017-04-18 02:05:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2009, '肇庆市', 2, 1936, '0758', '441200', 112.47252900, 23.05154600, 1936, '广东省', 2009, '肇庆市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2010, '端州区', 3, 2009, '0758', '441202', 112.47232900, 23.05266200, 1936, '广东省', 2009, '肇庆市', 2010, '端州区', 'system', 'system', b'1', '2017-04-18 02:05:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2011, '鼎湖区', 3, 2009, '0758', '441203', 112.56524900, 23.15582200, 1936, '广东省', 2009, '肇庆市', 2011, '鼎湖区', 'system', 'system', b'1', '2017-04-18 02:05:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2012, '广宁县', 3, 2009, '0758', '441223', 112.44041900, 23.63148600, 1936, '广东省', 2009, '肇庆市', 2012, '广宁县', 'system', 'system', b'1', '2017-04-18 02:05:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2013, '怀集县', 3, 2009, '0758', '441224', 112.18246600, 23.91307200, 1936, '广东省', 2009, '肇庆市', 2013, '怀集县', 'system', 'system', b'1', '2017-04-18 02:05:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2014, '封开县', 3, 2009, '0758', '441225', 111.50297300, 23.43473100, 1936, '广东省', 2009, '肇庆市', 2014, '封开县', 'system', 'system', b'1', '2017-04-18 02:05:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2015, '德庆县', 3, 2009, '0758', '441226', 111.78156000, 23.14171100, 1936, '广东省', 2009, '肇庆市', 2015, '德庆县', 'system', 'system', b'1', '2017-04-18 02:05:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2016, '高要区', 3, 2009, '0758', '441204', 112.46084600, 23.02769400, 1936, '广东省', 2009, '肇庆市', 2016, '高要区', 'system', 'system', b'1', '2017-04-18 02:05:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2017, '四会市', 3, 2009, '0758', '441284', 112.69502800, 23.34032400, 1936, '广东省', 2009, '肇庆市', 2017, '四会市', 'system', 'system', b'1', '2017-04-18 02:05:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2018, '惠州市', 2, 1936, '0752', '441300', 114.41259900, 23.07940400, 1936, '广东省', 2018, '惠州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2019, '惠城区', 3, 2018, '0752', '441302', 114.41397800, 23.07988300, 1936, '广东省', 2018, '惠州市', 2019, '惠城区', 'system', 'system', b'1', '2017-04-18 02:05:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2020, '惠阳区', 3, 2018, '0752', '441303', 114.46944400, 22.78851000, 1936, '广东省', 2018, '惠州市', 2020, '惠阳区', 'system', 'system', b'1', '2017-04-18 02:05:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2021, '博罗县', 3, 2018, '0752', '441322', 114.28425400, 23.16757500, 1936, '广东省', 2018, '惠州市', 2021, '博罗县', 'system', 'system', b'1', '2017-04-18 02:05:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2022, '惠东县', 3, 2018, '0752', '441323', 114.72309200, 22.98303600, 1936, '广东省', 2018, '惠州市', 2022, '惠东县', 'system', 'system', b'1', '2017-04-18 02:05:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2023, '龙门县', 3, 2018, '0752', '441324', 114.25998600, 23.72389400, 1936, '广东省', 2018, '惠州市', 2023, '龙门县', 'system', 'system', b'1', '2017-04-18 02:05:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2024, '梅州市', 2, 1936, '0753', '441400', 116.11758200, 24.29911200, 1936, '广东省', 2024, '梅州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2025, '梅江区', 3, 2024, '0753', '441402', 116.12116000, 24.30259300, 1936, '广东省', 2024, '梅州市', 2025, '梅江区', 'system', 'system', b'1', '2017-04-18 02:05:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2026, '梅县区', 3, 2024, '0753', '441403', 116.08348200, 24.26782500, 1936, '广东省', 2024, '梅州市', 2026, '梅县区', 'system', 'system', b'1', '2017-04-18 02:05:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2027, '大埔县', 3, 2024, '0753', '441422', 116.69552000, 24.35158700, 1936, '广东省', 2024, '梅州市', 2027, '大埔县', 'system', 'system', b'1', '2017-04-18 02:05:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2028, '丰顺县', 3, 2024, '0753', '441423', 116.18441900, 23.75277100, 1936, '广东省', 2024, '梅州市', 2028, '丰顺县', 'system', 'system', b'1', '2017-04-18 02:05:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2029, '五华县', 3, 2024, '0753', '441424', 115.77500400, 23.92542400, 1936, '广东省', 2024, '梅州市', 2029, '五华县', 'system', 'system', b'1', '2017-04-18 02:05:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2030, '平远县', 3, 2024, '0753', '441426', 115.89172900, 24.56965100, 1936, '广东省', 2024, '梅州市', 2030, '平远县', 'system', 'system', b'1', '2017-04-18 02:05:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2031, '蕉岭县', 3, 2024, '0753', '441427', 116.17053100, 24.65331300, 1936, '广东省', 2024, '梅州市', 2031, '蕉岭县', 'system', 'system', b'1', '2017-04-18 02:05:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2032, '兴宁市', 3, 2024, '0753', '441481', 115.73164800, 24.13807700, 1936, '广东省', 2024, '梅州市', 2032, '兴宁市', 'system', 'system', b'1', '2017-04-18 02:05:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2033, '汕尾市', 2, 1936, '0660', '441500', 115.36423800, 22.77448500, 1936, '广东省', 2033, '汕尾市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2034, '城区', 3, 2033, '0660', '441502', 115.36366700, 22.77622700, 1936, '广东省', 2033, '汕尾市', 2034, '城区', 'system', 'system', b'1', '2017-04-18 02:05:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2035, '海丰县', 3, 2033, '0660', '441521', 115.33732400, 22.97104200, 1936, '广东省', 2033, '汕尾市', 2035, '海丰县', 'system', 'system', b'1', '2017-04-18 02:05:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2036, '陆河县', 3, 2033, '0660', '441523', 115.65756500, 23.30268200, 1936, '广东省', 2033, '汕尾市', 2036, '陆河县', 'system', 'system', b'1', '2017-04-18 02:05:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2037, '陆丰市', 3, 2033, '0660', '441581', 115.64420300, 22.94610400, 1936, '广东省', 2033, '汕尾市', 2037, '陆丰市', 'system', 'system', b'1', '2017-04-18 02:05:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2038, '河源市', 2, 1936, '0762', '441600', 114.69780200, 23.74626600, 1936, '广东省', 2038, '河源市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2039, '源城区', 3, 2038, '0762', '441602', 114.69682800, 23.74625500, 1936, '广东省', 2038, '河源市', 2039, '源城区', 'system', 'system', b'1', '2017-04-18 02:05:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2040, '紫金县', 3, 2038, '0762', '441621', 115.18438300, 23.63374400, 1936, '广东省', 2038, '河源市', 2040, '紫金县', 'system', 'system', b'1', '2017-04-18 02:05:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2041, '龙川县', 3, 2038, '0762', '441622', 115.25641500, 24.10117400, 1936, '广东省', 2038, '河源市', 2041, '龙川县', 'system', 'system', b'1', '2017-04-18 02:05:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2042, '连平县', 3, 2038, '0762', '441623', 114.49595200, 24.36422700, 1936, '广东省', 2038, '河源市', 2042, '连平县', 'system', 'system', b'1', '2017-04-18 02:05:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2043, '和平县', 3, 2038, '0762', '441624', 114.94147300, 24.44318000, 1936, '广东省', 2038, '河源市', 2043, '和平县', 'system', 'system', b'1', '2017-04-18 02:05:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2044, '东源县', 3, 2038, '0762', '441625', 114.74271100, 23.78909300, 1936, '广东省', 2038, '河源市', 2044, '东源县', 'system', 'system', b'1', '2017-04-18 02:05:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2045, '阳江市', 2, 1936, '0662', '441700', 111.97510700, 21.85922200, 1936, '广东省', 2045, '阳江市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2046, '江城区', 3, 2045, '0662', '441702', 111.96890900, 21.85918200, 1936, '广东省', 2045, '阳江市', 2046, '江城区', 'system', 'system', b'1', '2017-04-18 02:05:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2047, '阳东区', 3, 2045, '0662', '441704', 112.01126700, 21.86472800, 1936, '广东省', 2045, '阳江市', 2047, '阳东区', 'system', 'system', b'1', '2017-04-18 02:05:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2048, '阳西县', 3, 2045, '0662', '441721', 111.61755600, 21.75367000, 1936, '广东省', 2045, '阳江市', 2048, '阳西县', 'system', 'system', b'1', '2017-04-18 02:05:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2049, '阳春市', 3, 2045, '0662', '441781', 111.79050000, 22.16959800, 1936, '广东省', 2045, '阳江市', 2049, '阳春市', 'system', 'system', b'1', '2017-04-18 02:05:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2050, '清远市', 2, 1936, '0763', '441800', 113.05122700, 23.68502200, 1936, '广东省', 2050, '清远市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2051, '清城区', 3, 2050, '0763', '441802', 113.04869800, 23.68897600, 1936, '广东省', 2050, '清远市', 2051, '清城区', 'system', 'system', b'1', '2017-04-18 02:05:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2052, '清新区', 3, 2050, '0763', '441803', 113.01520300, 23.73694900, 1936, '广东省', 2050, '清远市', 2052, '清新区', 'system', 'system', b'1', '2017-04-18 02:05:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2053, '佛冈县', 3, 2050, '0763', '441821', 113.53409400, 23.86673900, 1936, '广东省', 2050, '清远市', 2053, '佛冈县', 'system', 'system', b'1', '2017-04-18 02:05:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2054, '阳山县', 3, 2050, '0763', '441823', 112.63401900, 24.47028600, 1936, '广东省', 2050, '清远市', 2054, '阳山县', 'system', 'system', b'1', '2017-04-18 02:05:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2055, '连山壮族瑶族自治县', 3, 2050, '0763', '441825', 112.08655500, 24.56727100, 1936, '广东省', 2050, '清远市', 2055, '连山壮族瑶族自治县', 'system', 'system', b'1', '2017-04-18 02:05:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2056, '连南瑶族自治县', 3, 2050, '0763', '441826', 112.29080800, 24.71909700, 1936, '广东省', 2050, '清远市', 2056, '连南瑶族自治县', 'system', 'system', b'1', '2017-04-18 02:05:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2057, '英德市', 3, 2050, '0763', '441881', 113.40540400, 24.18612000, 1936, '广东省', 2050, '清远市', 2057, '英德市', 'system', 'system', b'1', '2017-04-18 02:05:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2058, '连州市', 3, 2050, '0763', '441882', 112.37927100, 24.78396600, 1936, '广东省', 2050, '清远市', 2058, '连州市', 'system', 'system', b'1', '2017-04-18 02:05:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2059, '东莞市', 2, 1936, '0769', '441900', 113.74626200, 23.04623700, 1936, '广东省', 2059, '东莞市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2060, '东宝路', 3, 2059, '0769', '441900', 113.78521900, 23.04382600, 1936, '广东省', 2059, '东莞市', 2060, '东宝路', 'system', 'system', b'1', '2017-04-18 02:05:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2061, '花园新村', 3, 2059, '0769', '441900', 113.76327800, 23.05437300, 1936, '广东省', 2059, '东莞市', 2061, '花园新村', 'system', 'system', b'1', '2017-04-18 02:05:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2062, '三元里', 3, 2059, '0769', '441900', 113.74097800, 23.00939900, 1936, '广东省', 2059, '东莞市', 2062, '三元里', 'system', 'system', b'1', '2017-04-18 02:05:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2063, '中山市', 2, 1936, '0760', '442000', 113.38239100, 22.52111300, 1936, '广东省', 2063, '中山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2064, '竹苑', 3, 2063, '0760', '442000', 113.39845500, 22.51597000, 1936, '广东省', 2063, '中山市', 2064, '竹苑', 'system', 'system', b'1', '2017-04-18 02:05:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2065, '湖滨北路', 3, 2063, '0760', '442000', 113.38261800, 22.54291900, 1936, '广东省', 2063, '中山市', 2065, '湖滨北路', 'system', 'system', b'1', '2017-04-18 02:05:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2066, '潮州市', 2, 1936, '0768', '445100', 116.63230100, 23.66170100, 1936, '广东省', 2066, '潮州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2067, '湘桥区', 3, 2066, '0768', '445102', 116.63365000, 23.66467500, 1936, '广东省', 2066, '潮州市', 2067, '湘桥区', 'system', 'system', b'1', '2017-04-18 02:05:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2068, '潮安区', 3, 2066, '0768', '445103', 116.67931000, 23.46101200, 1936, '广东省', 2066, '潮州市', 2068, '潮安区', 'system', 'system', b'1', '2017-04-18 02:05:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2069, '饶平县', 3, 2066, '0768', '445122', 117.00205000, 23.66817100, 1936, '广东省', 2066, '潮州市', 2069, '饶平县', 'system', 'system', b'1', '2017-04-18 02:05:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2070, '揭阳市', 2, 1936, '0663', '445200', 116.35573300, 23.54377800, 1936, '广东省', 2070, '揭阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2071, '榕城区', 3, 2070, '0663', '445202', 116.35704500, 23.53552400, 1936, '广东省', 2070, '揭阳市', 2071, '榕城区', 'system', 'system', b'1', '2017-04-18 02:05:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2072, '揭东区', 3, 2070, '0663', '445203', 116.41294700, 23.56988700, 1936, '广东省', 2070, '揭阳市', 2072, '揭东区', 'system', 'system', b'1', '2017-04-18 02:05:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2073, '揭西县', 3, 2070, '0663', '445222', 115.83870800, 23.42730000, 1936, '广东省', 2070, '揭阳市', 2073, '揭西县', 'system', 'system', b'1', '2017-04-18 02:05:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2074, '惠来县', 3, 2070, '0663', '445224', 116.29583200, 23.02983400, 1936, '广东省', 2070, '揭阳市', 2074, '惠来县', 'system', 'system', b'1', '2017-04-18 02:05:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2075, '普宁市', 3, 2070, '0663', '445281', 116.16508200, 23.29788000, 1936, '广东省', 2070, '揭阳市', 2075, '普宁市', 'system', 'system', b'1', '2017-04-18 02:05:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2076, '云浮市', 2, 1936, '0766', '445300', 112.04443900, 22.92980100, 1936, '广东省', 2076, '云浮市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2077, '云城区', 3, 2076, '0766', '445302', 112.04471000, 22.93082700, 1936, '广东省', 2076, '云浮市', 2077, '云城区', 'system', 'system', b'1', '2017-04-18 02:05:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2078, '云安区', 3, 2076, '0766', '445303', 112.00560900, 23.07315200, 1936, '广东省', 2076, '云浮市', 2078, '云安区', 'system', 'system', b'1', '2017-04-18 02:05:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2079, '新兴县', 3, 2076, '0766', '445321', 112.23083000, 22.70320400, 1936, '广东省', 2076, '云浮市', 2079, '新兴县', 'system', 'system', b'1', '2017-04-18 02:05:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2080, '郁南县', 3, 2076, '0766', '445322', 111.53592100, 23.23770900, 1936, '广东省', 2076, '云浮市', 2080, '郁南县', 'system', 'system', b'1', '2017-04-18 02:05:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2081, '罗定市', 3, 2076, '0766', '445381', 111.57820100, 22.76541500, 1936, '广东省', 2076, '云浮市', 2081, '罗定市', 'system', 'system', b'1', '2017-04-18 02:05:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2082, '广西壮族自治区', 1, 1, NULL, '450000', 108.32000400, 22.82402000, 2082, '广西壮族自治区', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2083, '南宁市', 2, 2082, '0771', '450100', 108.32000400, 22.82402000, 2082, '广西壮族自治区', 2083, '南宁市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2084, '兴宁区', 3, 2083, '0771', '450102', 108.32018900, 22.81951100, 2082, '广西壮族自治区', 2083, '南宁市', 2084, '兴宁区', 'system', 'system', b'1', '2017-04-18 02:05:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2085, '青秀区', 3, 2083, '0771', '450103', 108.34611300, 22.81661400, 2082, '广西壮族自治区', 2083, '南宁市', 2085, '青秀区', 'system', 'system', b'1', '2017-04-18 02:05:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2086, '江南区', 3, 2083, '0771', '450105', 108.31047800, 22.79959300, 2082, '广西壮族自治区', 2083, '南宁市', 2086, '江南区', 'system', 'system', b'1', '2017-04-18 02:05:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2087, '西乡塘区', 3, 2083, '0771', '450107', 108.30690300, 22.83277900, 2082, '广西壮族自治区', 2083, '南宁市', 2087, '西乡塘区', 'system', 'system', b'1', '2017-04-18 02:05:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2088, '良庆区', 3, 2083, '0771', '450108', 108.32210200, 22.75909000, 2082, '广西壮族自治区', 2083, '南宁市', 2088, '良庆区', 'system', 'system', b'1', '2017-04-18 02:05:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2089, '邕宁区', 3, 2083, '0771', '450109', 108.48425100, 22.75659800, 2082, '广西壮族自治区', 2083, '南宁市', 2089, '邕宁区', 'system', 'system', b'1', '2017-04-18 02:05:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2090, '武鸣区', 3, 2083, '0771', '450110', 108.28071700, 23.15716300, 2082, '广西壮族自治区', 2083, '南宁市', 2090, '武鸣区', 'system', 'system', b'1', '2017-04-18 02:05:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2091, '隆安县', 3, 2083, '0771', '450123', 107.68866100, 23.17476300, 2082, '广西壮族自治区', 2083, '南宁市', 2091, '隆安县', 'system', 'system', b'1', '2017-04-18 02:05:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2092, '马山县', 3, 2083, '0771', '450124', 108.17290300, 23.71175800, 2082, '广西壮族自治区', 2083, '南宁市', 2092, '马山县', 'system', 'system', b'1', '2017-04-18 02:05:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2093, '上林县', 3, 2083, '0771', '450125', 108.60393700, 23.43176900, 2082, '广西壮族自治区', 2083, '南宁市', 2093, '上林县', 'system', 'system', b'1', '2017-04-18 02:05:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2094, '宾阳县', 3, 2083, '0771', '450126', 108.81673500, 23.21688400, 2082, '广西壮族自治区', 2083, '南宁市', 2094, '宾阳县', 'system', 'system', b'1', '2017-04-18 02:05:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2095, '横县', 3, 2083, '0771', '450127', 109.27098700, 22.68743000, 2082, '广西壮族自治区', 2083, '南宁市', 2095, '横县', 'system', 'system', b'1', '2017-04-18 02:05:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2096, '柳州市', 2, 2082, '0772', '450200', 109.41170300, 24.31461700, 2082, '广西壮族自治区', 2096, '柳州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2097, '城中区', 3, 2096, '0772', '450202', 109.41174900, 24.31232400, 2082, '广西壮族自治区', 2096, '柳州市', 2097, '城中区', 'system', 'system', b'1', '2017-04-18 02:05:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2098, '鱼峰区', 3, 2096, '0772', '450203', 109.41536400, 24.30384800, 2082, '广西壮族自治区', 2096, '柳州市', 2098, '鱼峰区', 'system', 'system', b'1', '2017-04-18 02:05:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2099, '柳南区', 3, 2096, '0772', '450204', 109.39593600, 24.28701300, 2082, '广西壮族自治区', 2096, '柳州市', 2099, '柳南区', 'system', 'system', b'1', '2017-04-18 02:05:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2100, '柳北区', 3, 2096, '0772', '450205', 109.40657700, 24.35914500, 2082, '广西壮族自治区', 2096, '柳州市', 2100, '柳北区', 'system', 'system', b'1', '2017-04-18 02:05:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2101, '柳江区', 3, 2096, '0772', '450221', 109.33450300, 24.25751200, 2082, '广西壮族自治区', 2096, '柳州市', 2101, '柳江区', 'system', 'system', b'1', '2017-04-18 02:05:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2102, '柳城县', 3, 2096, '0772', '450222', 109.24581200, 24.65512100, 2082, '广西壮族自治区', 2096, '柳州市', 2102, '柳城县', 'system', 'system', b'1', '2017-04-18 02:05:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2103, '鹿寨县', 3, 2096, '0772', '450223', 109.74080500, 24.48340500, 2082, '广西壮族自治区', 2096, '柳州市', 2103, '鹿寨县', 'system', 'system', b'1', '2017-04-18 02:05:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2104, '融安县', 3, 2096, '0772', '450224', 109.40362100, 25.21470300, 2082, '广西壮族自治区', 2096, '柳州市', 2104, '融安县', 'system', 'system', b'1', '2017-04-18 02:05:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2105, '融水苗族自治县', 3, 2096, '0772', '450225', 109.25274400, 25.06881200, 2082, '广西壮族自治区', 2096, '柳州市', 2105, '融水苗族自治县', 'system', 'system', b'1', '2017-04-18 02:05:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2106, '三江侗族自治县', 3, 2096, '0772', '450226', 109.61484600, 25.78553000, 2082, '广西壮族自治区', 2096, '柳州市', 2106, '三江侗族自治县', 'system', 'system', b'1', '2017-04-18 02:05:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2107, '桂林市', 2, 2082, '0773', '450300', 110.29912100, 25.27421500, 2082, '广西壮族自治区', 2107, '桂林市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2108, '秀峰区', 3, 2107, '0773', '450302', 110.29244500, 25.27854400, 2082, '广西壮族自治区', 2107, '桂林市', 2108, '秀峰区', 'system', 'system', b'1', '2017-04-18 02:05:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2109, '叠彩区', 3, 2107, '0773', '450303', 110.30078300, 25.30133400, 2082, '广西壮族自治区', 2107, '桂林市', 2109, '叠彩区', 'system', 'system', b'1', '2017-04-18 02:05:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2110, '象山区', 3, 2107, '0773', '450304', 110.28488200, 25.26198600, 2082, '广西壮族自治区', 2107, '桂林市', 2110, '象山区', 'system', 'system', b'1', '2017-04-18 02:05:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2111, '七星区', 3, 2107, '0773', '450305', 110.31757700, 25.25433900, 2082, '广西壮族自治区', 2107, '桂林市', 2111, '七星区', 'system', 'system', b'1', '2017-04-18 02:05:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2112, '雁山区', 3, 2107, '0773', '450311', 110.30566700, 25.07764600, 2082, '广西壮族自治区', 2107, '桂林市', 2112, '雁山区', 'system', 'system', b'1', '2017-04-18 02:05:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2113, '临桂区', 3, 2107, '0773', '450312', 110.20548700, 25.24625700, 2082, '广西壮族自治区', 2107, '桂林市', 2113, '临桂区', 'system', 'system', b'1', '2017-04-18 02:05:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2114, '阳朔县', 3, 2107, '0773', '450321', 110.49469900, 24.77534000, 2082, '广西壮族自治区', 2107, '桂林市', 2114, '阳朔县', 'system', 'system', b'1', '2017-04-18 02:05:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2115, '灵川县', 3, 2107, '0773', '450323', 110.32571200, 25.40854100, 2082, '广西壮族自治区', 2107, '桂林市', 2115, '灵川县', 'system', 'system', b'1', '2017-04-18 02:05:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2116, '全州县', 3, 2107, '0773', '450324', 111.07298900, 25.92989700, 2082, '广西壮族自治区', 2107, '桂林市', 2116, '全州县', 'system', 'system', b'1', '2017-04-18 02:05:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2117, '兴安县', 3, 2107, '0773', '450325', 110.67078300, 25.60955400, 2082, '广西壮族自治区', 2107, '桂林市', 2117, '兴安县', 'system', 'system', b'1', '2017-04-18 02:05:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2118, '永福县', 3, 2107, '0773', '450326', 109.98920800, 24.98669200, 2082, '广西壮族自治区', 2107, '桂林市', 2118, '永福县', 'system', 'system', b'1', '2017-04-18 02:05:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2119, '灌阳县', 3, 2107, '0773', '450327', 111.16024800, 25.48909800, 2082, '广西壮族自治区', 2107, '桂林市', 2119, '灌阳县', 'system', 'system', b'1', '2017-04-18 02:05:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2120, '龙胜各族自治县', 3, 2107, '0773', '450328', 110.00942300, 25.79642800, 2082, '广西壮族自治区', 2107, '桂林市', 2120, '龙胜各族自治县', 'system', 'system', b'1', '2017-04-18 02:05:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2121, '资源县', 3, 2107, '0773', '450329', 110.64258700, 26.03420000, 2082, '广西壮族自治区', 2107, '桂林市', 2121, '资源县', 'system', 'system', b'1', '2017-04-18 02:05:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2122, '平乐县', 3, 2107, '0773', '450330', 110.64282100, 24.63221600, 2082, '广西壮族自治区', 2107, '桂林市', 2122, '平乐县', 'system', 'system', b'1', '2017-04-18 02:05:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2123, '荔浦县', 3, 2107, '0773', '450331', 110.40014900, 24.49778600, 2082, '广西壮族自治区', 2107, '桂林市', 2123, '荔浦县', 'system', 'system', b'1', '2017-04-18 02:05:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2124, '恭城瑶族自治县', 3, 2107, '0773', '450332', 110.82952000, 24.83361200, 2082, '广西壮族自治区', 2107, '桂林市', 2124, '恭城瑶族自治县', 'system', 'system', b'1', '2017-04-18 02:05:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2125, '梧州市', 2, 2082, '0774', '450400', 111.29760400, 23.47480300, 2082, '广西壮族自治区', 2125, '梧州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2126, '万秀区', 3, 2125, '0774', '450403', 111.31581700, 23.47131800, 2082, '广西壮族自治区', 2125, '梧州市', 2126, '万秀区', 'system', 'system', b'1', '2017-04-18 02:05:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2127, '长洲区', 3, 2125, '0774', '450405', 111.27567800, 23.47770000, 2082, '广西壮族自治区', 2125, '梧州市', 2127, '长洲区', 'system', 'system', b'1', '2017-04-18 02:05:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2128, '龙圩区', 3, 2125, '0774', '450406', 111.24603500, 23.40996000, 2082, '广西壮族自治区', 2125, '梧州市', 2128, '龙圩区', 'system', 'system', b'1', '2017-04-18 02:05:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2129, '苍梧县', 3, 2125, '0774', '450421', 111.54400800, 23.84509700, 2082, '广西壮族自治区', 2125, '梧州市', 2129, '苍梧县', 'system', 'system', b'1', '2017-04-18 02:05:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2130, '藤县', 3, 2125, '0774', '450422', 110.93182600, 23.37396300, 2082, '广西壮族自治区', 2125, '梧州市', 2130, '藤县', 'system', 'system', b'1', '2017-04-18 02:05:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2131, '蒙山县', 3, 2125, '0774', '450423', 110.52260000, 24.19982900, 2082, '广西壮族自治区', 2125, '梧州市', 2131, '蒙山县', 'system', 'system', b'1', '2017-04-18 02:05:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2132, '岑溪市', 3, 2125, '0774', '450481', 110.99811400, 22.91840600, 2082, '广西壮族自治区', 2125, '梧州市', 2132, '岑溪市', 'system', 'system', b'1', '2017-04-18 02:05:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2133, '北海市', 2, 2082, '0779', '450500', 109.11925400, 21.47334300, 2082, '广西壮族自治区', 2133, '北海市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2134, '海城区', 3, 2133, '0779', '450502', 109.10752900, 21.46844300, 2082, '广西壮族自治区', 2133, '北海市', 2134, '海城区', 'system', 'system', b'1', '2017-04-18 02:05:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2135, '银海区', 3, 2133, '0779', '450503', 109.11870700, 21.44490900, 2082, '广西壮族自治区', 2133, '北海市', 2135, '银海区', 'system', 'system', b'1', '2017-04-18 02:05:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2136, '铁山港区', 3, 2133, '0779', '450512', 109.45057300, 21.59280000, 2082, '广西壮族自治区', 2133, '北海市', 2136, '铁山港区', 'system', 'system', b'1', '2017-04-18 02:05:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2137, '合浦县', 3, 2133, '0779', '450521', 109.20069500, 21.66355400, 2082, '广西壮族自治区', 2133, '北海市', 2137, '合浦县', 'system', 'system', b'1', '2017-04-18 02:05:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2138, '防城港市', 2, 2082, '0770', '450600', 108.34547800, 21.61463100, 2082, '广西壮族自治区', 2138, '防城港市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2139, '港口区', 3, 2138, '0770', '450602', 108.34628100, 21.61440600, 2082, '广西壮族自治区', 2138, '防城港市', 2139, '港口区', 'system', 'system', b'1', '2017-04-18 02:05:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2140, '防城区', 3, 2138, '0770', '450603', 108.35842600, 21.76475800, 2082, '广西壮族自治区', 2138, '防城港市', 2140, '防城区', 'system', 'system', b'1', '2017-04-18 02:05:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2141, '上思县', 3, 2138, '0770', '450621', 107.98213900, 22.15142300, 2082, '广西壮族自治区', 2138, '防城港市', 2141, '上思县', 'system', 'system', b'1', '2017-04-18 02:05:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2142, '东兴市', 3, 2138, '0770', '450681', 107.97017000, 21.54117200, 2082, '广西壮族自治区', 2138, '防城港市', 2142, '东兴市', 'system', 'system', b'1', '2017-04-18 02:05:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2143, '钦州市', 2, 2082, '0777', '450700', 108.62417500, 21.96712700, 2082, '广西壮族自治区', 2143, '钦州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2144, '钦南区', 3, 2143, '0777', '450702', 108.62662900, 21.96680800, 2082, '广西壮族自治区', 2143, '钦州市', 2144, '钦南区', 'system', 'system', b'1', '2017-04-18 02:05:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2145, '钦北区', 3, 2143, '0777', '450703', 108.44911000, 22.13276100, 2082, '广西壮族自治区', 2143, '钦州市', 2145, '钦北区', 'system', 'system', b'1', '2017-04-18 02:05:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2146, '灵山县', 3, 2143, '0777', '450721', 109.29346800, 22.41804100, 2082, '广西壮族自治区', 2143, '钦州市', 2146, '灵山县', 'system', 'system', b'1', '2017-04-18 02:05:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2147, '浦北县', 3, 2143, '0777', '450722', 109.55634100, 22.26833500, 2082, '广西壮族自治区', 2143, '钦州市', 2147, '浦北县', 'system', 'system', b'1', '2017-04-18 02:05:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2148, '贵港市', 2, 2082, '1755', '450800', 109.60214600, 23.09360000, 2082, '广西壮族自治区', 2148, '贵港市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2149, '港北区', 3, 2148, '1755', '450802', 109.59481000, 23.10767700, 2082, '广西壮族自治区', 2148, '贵港市', 2149, '港北区', 'system', 'system', b'1', '2017-04-18 02:05:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2150, '港南区', 3, 2148, '1755', '450803', 109.60466500, 23.06751600, 2082, '广西壮族自治区', 2148, '贵港市', 2150, '港南区', 'system', 'system', b'1', '2017-04-18 02:05:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2151, '覃塘区', 3, 2148, '1755', '450804', 109.41569700, 23.13281500, 2082, '广西壮族自治区', 2148, '贵港市', 2151, '覃塘区', 'system', 'system', b'1', '2017-04-18 02:05:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2152, '平南县', 3, 2148, '1755', '450821', 110.39748500, 23.54454600, 2082, '广西壮族自治区', 2148, '贵港市', 2152, '平南县', 'system', 'system', b'1', '2017-04-18 02:05:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2153, '桂平市', 3, 2148, '1755', '450881', 110.07466800, 23.38247300, 2082, '广西壮族自治区', 2148, '贵港市', 2153, '桂平市', 'system', 'system', b'1', '2017-04-18 02:05:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2154, '玉林市', 2, 2082, '0775', '450900', 110.15439300, 22.63136000, 2082, '广西壮族自治区', 2154, '玉林市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:05:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2155, '玉州区', 3, 2154, '0775', '450902', 110.15491200, 22.63213200, 2082, '广西壮族自治区', 2154, '玉林市', 2155, '玉州区', 'system', 'system', b'1', '2017-04-18 02:05:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2156, '福绵区', 3, 2154, '0775', '450903', 110.05415500, 22.58163000, 2082, '广西壮族自治区', 2154, '玉林市', 2156, '福绵区', 'system', 'system', b'1', '2017-04-18 02:05:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2157, '容县', 3, 2154, '0775', '450921', 110.55246700, 22.85643500, 2082, '广西壮族自治区', 2154, '玉林市', 2157, '容县', 'system', 'system', b'1', '2017-04-18 02:05:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2158, '陆川县', 3, 2154, '0775', '450922', 110.26484200, 22.32105400, 2082, '广西壮族自治区', 2154, '玉林市', 2158, '陆川县', 'system', 'system', b'1', '2017-04-18 02:05:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2159, '博白县', 3, 2154, '0775', '450923', 109.98000400, 22.27128500, 2082, '广西壮族自治区', 2154, '玉林市', 2159, '博白县', 'system', 'system', b'1', '2017-04-18 02:05:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2160, '兴业县', 3, 2154, '0775', '450924', 109.87776800, 22.74187000, 2082, '广西壮族自治区', 2154, '玉林市', 2160, '兴业县', 'system', 'system', b'1', '2017-04-18 02:05:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2161, '北流市', 3, 2154, '0775', '450981', 110.34805200, 22.70164800, 2082, '广西壮族自治区', 2154, '玉林市', 2161, '北流市', 'system', 'system', b'1', '2017-04-18 02:05:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2162, '百色市', 2, 2082, '0776', '451000', 106.61628500, 23.89774200, 2082, '广西壮族自治区', 2162, '百色市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2163, '右江区', 3, 2162, '0776', '451002', 106.61572700, 23.89767500, 2082, '广西壮族自治区', 2162, '百色市', 2163, '右江区', 'system', 'system', b'1', '2017-04-18 02:06:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2164, '田阳县', 3, 2162, '0776', '451021', 106.90431500, 23.73607900, 2082, '广西壮族自治区', 2162, '百色市', 2164, '田阳县', 'system', 'system', b'1', '2017-04-18 02:06:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2165, '田东县', 3, 2162, '0776', '451022', 107.12426000, 23.60044400, 2082, '广西壮族自治区', 2162, '百色市', 2165, '田东县', 'system', 'system', b'1', '2017-04-18 02:06:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2166, '平果县', 3, 2162, '0776', '451023', 107.58040300, 23.32047900, 2082, '广西壮族自治区', 2162, '百色市', 2166, '平果县', 'system', 'system', b'1', '2017-04-18 02:06:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2167, '德保县', 3, 2162, '0776', '451024', 106.61816400, 23.32146400, 2082, '广西壮族自治区', 2162, '百色市', 2167, '德保县', 'system', 'system', b'1', '2017-04-18 02:06:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2168, '靖西市', 3, 2162, '0776', '451081', 106.41754900, 23.13476600, 2082, '广西壮族自治区', 2162, '百色市', 2168, '靖西市', 'system', 'system', b'1', '2017-04-18 02:06:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2169, '那坡县', 3, 2162, '0776', '451026', 105.83355300, 23.40078500, 2082, '广西壮族自治区', 2162, '百色市', 2169, '那坡县', 'system', 'system', b'1', '2017-04-18 02:06:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2170, '凌云县', 3, 2162, '0776', '451027', 106.56487000, 24.34564300, 2082, '广西壮族自治区', 2162, '百色市', 2170, '凌云县', 'system', 'system', b'1', '2017-04-18 02:06:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2171, '乐业县', 3, 2162, '0776', '451028', 106.55963800, 24.78220400, 2082, '广西壮族自治区', 2162, '百色市', 2171, '乐业县', 'system', 'system', b'1', '2017-04-18 02:06:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2172, '田林县', 3, 2162, '0776', '451029', 106.23504700, 24.29026200, 2082, '广西壮族自治区', 2162, '百色市', 2172, '田林县', 'system', 'system', b'1', '2017-04-18 02:06:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2173, '西林县', 3, 2162, '0776', '451030', 105.09502500, 24.49204100, 2082, '广西壮族自治区', 2162, '百色市', 2173, '西林县', 'system', 'system', b'1', '2017-04-18 02:06:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2174, '隆林各族自治县', 3, 2162, '0776', '451031', 105.34236300, 24.77431800, 2082, '广西壮族自治区', 2162, '百色市', 2174, '隆林各族自治县', 'system', 'system', b'1', '2017-04-18 02:06:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2175, '贺州市', 2, 2082, '1774', '451100', 111.55205600, 24.41414100, 2082, '广西壮族自治区', 2175, '贺州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2176, '八步区', 3, 2175, '1774', '451102', 111.55199100, 24.41244600, 2082, '广西壮族自治区', 2175, '贺州市', 2176, '八步区', 'system', 'system', b'1', '2017-04-18 02:06:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2177, '平桂区', 3, 2175, '1774', '451103', 111.52401400, 24.41714800, 2082, '广西壮族自治区', 2175, '贺州市', 2177, '平桂区', 'system', 'system', b'1', '2017-04-18 02:06:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2178, '昭平县', 3, 2175, '1774', '451121', 110.81086500, 24.17295800, 2082, '广西壮族自治区', 2175, '贺州市', 2178, '昭平县', 'system', 'system', b'1', '2017-04-18 02:06:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2179, '钟山县', 3, 2175, '1774', '451122', 111.30362900, 24.52856600, 2082, '广西壮族自治区', 2175, '贺州市', 2179, '钟山县', 'system', 'system', b'1', '2017-04-18 02:06:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2180, '富川瑶族自治县', 3, 2175, '1774', '451123', 111.27722800, 24.81896000, 2082, '广西壮族自治区', 2175, '贺州市', 2180, '富川瑶族自治县', 'system', 'system', b'1', '2017-04-18 02:06:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2181, '河池市', 2, 2082, '0778', '451200', 108.06210500, 24.69589900, 2082, '广西壮族自治区', 2181, '河池市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2182, '金城江区', 3, 2181, '0778', '451202', 108.06213100, 24.69562500, 2082, '广西壮族自治区', 2181, '河池市', 2182, '金城江区', 'system', 'system', b'1', '2017-04-18 02:06:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2183, '南丹县', 3, 2181, '0778', '451221', 107.54660500, 24.98319200, 2082, '广西壮族自治区', 2181, '河池市', 2183, '南丹县', 'system', 'system', b'1', '2017-04-18 02:06:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2184, '天峨县', 3, 2181, '0778', '451222', 107.17493900, 24.98596400, 2082, '广西壮族自治区', 2181, '河池市', 2184, '天峨县', 'system', 'system', b'1', '2017-04-18 02:06:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2185, '凤山县', 3, 2181, '0778', '451223', 107.04459200, 24.54456100, 2082, '广西壮族自治区', 2181, '河池市', 2185, '凤山县', 'system', 'system', b'1', '2017-04-18 02:06:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2186, '东兰县', 3, 2181, '0778', '451224', 107.37369600, 24.50936700, 2082, '广西壮族自治区', 2181, '河池市', 2186, '东兰县', 'system', 'system', b'1', '2017-04-18 02:06:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2187, '罗城仫佬族自治县', 3, 2181, '0778', '451225', 108.90245300, 24.77932700, 2082, '广西壮族自治区', 2181, '河池市', 2187, '罗城仫佬族自治县', 'system', 'system', b'1', '2017-04-18 02:06:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2188, '环江毛南族自治县', 3, 2181, '0778', '451226', 108.25866900, 24.82762800, 2082, '广西壮族自治区', 2181, '河池市', 2188, '环江毛南族自治县', 'system', 'system', b'1', '2017-04-18 02:06:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2189, '巴马瑶族自治县', 3, 2181, '0778', '451227', 107.25312600, 24.13953800, 2082, '广西壮族自治区', 2181, '河池市', 2189, '巴马瑶族自治县', 'system', 'system', b'1', '2017-04-18 02:06:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2190, '都安瑶族自治县', 3, 2181, '0778', '451228', 108.10276100, 23.93496400, 2082, '广西壮族自治区', 2181, '河池市', 2190, '都安瑶族自治县', 'system', 'system', b'1', '2017-04-18 02:06:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2191, '大化瑶族自治县', 3, 2181, '0778', '451229', 107.99450000, 23.73959600, 2082, '广西壮族自治区', 2181, '河池市', 2191, '大化瑶族自治县', 'system', 'system', b'1', '2017-04-18 02:06:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2192, '宜州市', 3, 2181, '0778', '451281', 108.65396500, 24.49219300, 2082, '广西壮族自治区', 2181, '河池市', 2192, '宜州市', 'system', 'system', b'1', '2017-04-18 02:06:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2193, '来宾市', 2, 2082, '1772', '451300', 109.22977200, 23.73376600, 2082, '广西壮族自治区', 2193, '来宾市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2194, '兴宾区', 3, 2193, '1772', '451302', 109.23054100, 23.73292600, 2082, '广西壮族自治区', 2193, '来宾市', 2194, '兴宾区', 'system', 'system', b'1', '2017-04-18 02:06:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2195, '忻城县', 3, 2193, '1772', '451321', 108.66736100, 24.06477900, 2082, '广西壮族自治区', 2193, '来宾市', 2195, '忻城县', 'system', 'system', b'1', '2017-04-18 02:06:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2196, '象州县', 3, 2193, '1772', '451322', 109.68455500, 23.95982400, 2082, '广西壮族自治区', 2193, '来宾市', 2196, '象州县', 'system', 'system', b'1', '2017-04-18 02:06:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2197, '武宣县', 3, 2193, '1772', '451323', 109.66287000, 23.60416200, 2082, '广西壮族自治区', 2193, '来宾市', 2197, '武宣县', 'system', 'system', b'1', '2017-04-18 02:06:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2198, '金秀瑶族自治县', 3, 2193, '1772', '451324', 110.18855600, 24.13494100, 2082, '广西壮族自治区', 2193, '来宾市', 2198, '金秀瑶族自治县', 'system', 'system', b'1', '2017-04-18 02:06:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2199, '合山市', 3, 2193, '1772', '451381', 108.88858000, 23.81311000, 2082, '广西壮族自治区', 2193, '来宾市', 2199, '合山市', 'system', 'system', b'1', '2017-04-18 02:06:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2200, '崇左市', 2, 2082, '1771', '451400', 107.35392600, 22.40410800, 2082, '广西壮族自治区', 2200, '崇左市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2201, '江州区', 3, 2200, '1771', '451402', 107.35444300, 22.40469000, 2082, '广西壮族自治区', 2200, '崇左市', 2201, '江州区', 'system', 'system', b'1', '2017-04-18 02:06:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2202, '扶绥县', 3, 2200, '1771', '451421', 107.91153300, 22.63582100, 2082, '广西壮族自治区', 2200, '崇左市', 2202, '扶绥县', 'system', 'system', b'1', '2017-04-18 02:06:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2203, '宁明县', 3, 2200, '1771', '451422', 107.06761600, 22.13135300, 2082, '广西壮族自治区', 2200, '崇左市', 2203, '宁明县', 'system', 'system', b'1', '2017-04-18 02:06:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2204, '龙州县', 3, 2200, '1771', '451423', 106.85750200, 22.34371600, 2082, '广西壮族自治区', 2200, '崇左市', 2204, '龙州县', 'system', 'system', b'1', '2017-04-18 02:06:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2205, '大新县', 3, 2200, '1771', '451424', 107.20080300, 22.83336900, 2082, '广西壮族自治区', 2200, '崇左市', 2205, '大新县', 'system', 'system', b'1', '2017-04-18 02:06:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2206, '天等县', 3, 2200, '1771', '451425', 107.14244100, 23.08248400, 2082, '广西壮族自治区', 2200, '崇左市', 2206, '天等县', 'system', 'system', b'1', '2017-04-18 02:06:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2207, '凭祥市', 3, 2200, '1771', '451481', 106.75903800, 22.10888200, 2082, '广西壮族自治区', 2200, '崇左市', 2207, '凭祥市', 'system', 'system', b'1', '2017-04-18 02:06:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2208, '海南省', 1, 1, NULL, '460000', 110.33119000, 20.03197100, 2208, '海南省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2209, '海口市', 2, 2208, '0898', '460100', 110.33119000, 20.03197100, 2208, '海南省', 2209, '海口市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2210, '秀英区', 3, 2209, '0898', '460105', 110.28239300, 20.00814500, 2208, '海南省', 2209, '海口市', 2210, '秀英区', 'system', 'system', b'1', '2017-04-18 02:06:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2211, '龙华区', 3, 2209, '0898', '460106', 110.33037300, 20.03102600, 2208, '海南省', 2209, '海口市', 2211, '龙华区', 'system', 'system', b'1', '2017-04-18 02:06:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2212, '琼山区', 3, 2209, '0898', '460107', 110.35472200, 20.00105100, 2208, '海南省', 2209, '海口市', 2212, '琼山区', 'system', 'system', b'1', '2017-04-18 02:06:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2213, '美兰区', 3, 2209, '0898', '460108', 110.35656600, 20.03074000, 2208, '海南省', 2209, '海口市', 2213, '美兰区', 'system', 'system', b'1', '2017-04-18 02:06:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2214, '三亚市', 2, 2208, '0899', '460200', 109.50826800, 18.24787200, 2208, '海南省', 2214, '三亚市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2215, '海棠区', 3, 2214, '0899', '460202', 109.76077800, 18.40751600, 2208, '海南省', 2214, '三亚市', 2215, '海棠区', 'system', 'system', b'1', '2017-04-18 02:06:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2216, '吉阳区', 3, 2214, '0899', '460203', 109.51208100, 18.24743600, 2208, '海南省', 2214, '三亚市', 2216, '吉阳区', 'system', 'system', b'1', '2017-04-18 02:06:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2217, '天涯区', 3, 2214, '0899', '460204', 109.50635700, 18.24734000, 2208, '海南省', 2214, '三亚市', 2217, '天涯区', 'system', 'system', b'1', '2017-04-18 02:06:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2218, '崖州区', 3, 2214, '0899', '460205', 109.17430600, 18.35219200, 2208, '海南省', 2214, '三亚市', 2218, '崖州区', 'system', 'system', b'1', '2017-04-18 02:06:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2219, '解放路', 3, 2214, '0899', '460200', 109.50270800, 18.25297500, 2208, '海南省', 2214, '三亚市', 2219, '解放路', 'system', 'system', b'1', '2017-04-18 02:06:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2220, '迎宾路', 3, 2214, '0899', '460200', 109.50852200, 18.27162100, 2208, '海南省', 2214, '三亚市', 2220, '迎宾路', 'system', 'system', b'1', '2017-04-18 02:06:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2221, '河西', 3, 2214, '0899', '460200', 109.50661500, 18.24936900, 2208, '海南省', 2214, '三亚市', 2221, '河西', 'system', 'system', b'1', '2017-04-18 02:06:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2222, '河东', 3, 2214, '0899', '460200', 109.50832500, 18.25461200, 2208, '海南省', 2214, '三亚市', 2222, '河东', 'system', 'system', b'1', '2017-04-18 02:06:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2223, '亚龙湾', 3, 2214, '0899', '460200', 109.63332100, 18.24077600, 2208, '海南省', 2214, '三亚市', 2223, '亚龙湾', 'system', 'system', b'1', '2017-04-18 02:06:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2224, '大东海', 3, 2214, '0899', '460200', 109.52247000, 18.22296600, 2208, '海南省', 2214, '三亚市', 2224, '大东海', 'system', 'system', b'1', '2017-04-18 02:06:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2225, '三亚湾', 3, 2214, '0899', '460200', 109.46115500, 18.27697800, 2208, '海南省', 2214, '三亚市', 2225, '三亚湾', 'system', 'system', b'1', '2017-04-18 02:06:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2226, '三沙市', 2, 2208, '2898', '460300', 112.34882000, 16.83103900, 2208, '海南省', 2226, '三沙市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2227, '西沙群岛', 3, 2226, '1895', '460321', 111.79294400, 16.20454600, 2208, '海南省', 2226, '三沙市', 2227, '西沙群岛', 'system', 'system', b'1', '2017-04-18 02:06:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2228, '南沙群岛', 3, 2226, '1891', '460322', 116.74999800, 11.47188800, 2208, '海南省', 2226, '三沙市', 2228, '南沙群岛', 'system', 'system', b'1', '2017-04-18 02:06:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2229, '中沙群岛的岛礁及其海域', 3, 2226, '2801', '460323', 117.74007100, 15.11285600, 2208, '海南省', 2226, '三沙市', 2229, '中沙群岛的岛礁及其海域', 'system', 'system', b'1', '2017-04-18 02:06:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2230, '儋州市', 2, 2208, '0805', '460400', 109.57678200, 19.51748600, 2208, '海南省', 2230, '儋州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2231, '五指山市', 2, 2208, '1897', '469001', 109.51666200, 18.77692100, 2208, '海南省', 2231, '五指山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2232, '琼海市', 2, 2208, '1894', '469002', 110.46678500, 19.24601100, 2208, '海南省', 2232, '琼海市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2233, '文昌市', 2, 2208, '1893', '469005', 110.75397500, 19.61298600, 2208, '海南省', 2233, '文昌市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2234, '万宁市', 2, 2208, '1898', '469006', 110.38879300, 18.79621600, 2208, '海南省', 2234, '万宁市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2235, '东方市', 2, 2208, '0807', '469007', 108.65378900, 19.10198000, 2208, '海南省', 2235, '东方市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2236, '定安县', 2, 2208, '0806', '469021', 110.34923500, 19.68496600, 2208, '海南省', 2236, '定安县', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2237, '屯昌县', 2, 2208, '1892', '469022', 110.10277300, 19.36291600, 2208, '海南省', 2237, '屯昌县', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2238, '澄迈县', 2, 2208, '0804', '469023', 110.00714700, 19.73709500, 2208, '海南省', 2238, '澄迈县', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2239, '临高县', 2, 2208, '1896', '469024', 109.68769700, 19.90829300, 2208, '海南省', 2239, '临高县', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2240, '白沙黎族自治县', 2, 2208, '0802', '469025', 109.45260600, 19.22458400, 2208, '海南省', 2240, '白沙黎族自治县', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2241, '昌江黎族自治县', 2, 2208, '0803', '469026', 109.05335100, 19.26096800, 2208, '海南省', 2241, '昌江黎族自治县', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2242, '乐东黎族自治县', 2, 2208, '2802', '469027', 109.17544400, 18.74758000, 2208, '海南省', 2242, '乐东黎族自治县', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2243, '陵水黎族自治县', 2, 2208, '0809', '469028', 110.03721800, 18.50500600, 2208, '海南省', 2243, '陵水黎族自治县', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2244, '保亭黎族苗族自治县', 2, 2208, '0801', '469029', 109.70245000, 18.63637100, 2208, '海南省', 2244, '保亭黎族苗族自治县', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2245, '琼中黎族苗族自治县', 2, 2208, '1899', '469030', 109.83999600, 19.03557000, 2208, '海南省', 2245, '琼中黎族苗族自治县', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2246, '重庆市', 1, 1, '023', '500000', 106.50496200, 29.53315500, 2246, '重庆市', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2247, '重庆市市辖区', 2, 2246, '023', '500100', 106.50496200, 29.53315500, 2246, '重庆市', 2247, '重庆市市辖区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2248, '万州区', 3, 2247, '023', '500101', 108.38024600, 30.80780700, 2246, '重庆市', 2247, '重庆市市辖区', 2248, '万州区', 'system', 'system', b'1', '2017-04-18 02:06:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2249, '涪陵区', 3, 2247, '023', '500102', 107.39490500, 29.70365200, 2246, '重庆市', 2247, '重庆市市辖区', 2249, '涪陵区', 'system', 'system', b'1', '2017-04-18 02:06:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2250, '渝中区', 3, 2247, '023', '500103', 106.56288000, 29.55674200, 2246, '重庆市', 2247, '重庆市市辖区', 2250, '渝中区', 'system', 'system', b'1', '2017-04-18 02:06:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2251, '大渡口区', 3, 2247, '023', '500104', 106.48613000, 29.48100200, 2246, '重庆市', 2247, '重庆市市辖区', 2251, '大渡口区', 'system', 'system', b'1', '2017-04-18 02:06:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2252, '江北区', 3, 2247, '023', '500105', 106.53284400, 29.57535200, 2246, '重庆市', 2247, '重庆市市辖区', 2252, '江北区', 'system', 'system', b'1', '2017-04-18 02:06:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2253, '沙坪坝区', 3, 2247, '023', '500106', 106.45420000, 29.54122400, 2246, '重庆市', 2247, '重庆市市辖区', 2253, '沙坪坝区', 'system', 'system', b'1', '2017-04-18 02:06:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2254, '九龙坡区', 3, 2247, '023', '500107', 106.48098900, 29.52349200, 2246, '重庆市', 2247, '重庆市市辖区', 2254, '九龙坡区', 'system', 'system', b'1', '2017-04-18 02:06:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2255, '南岸区', 3, 2247, '023', '500108', 106.56081300, 29.52399200, 2246, '重庆市', 2247, '重庆市市辖区', 2255, '南岸区', 'system', 'system', b'1', '2017-04-18 02:06:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2256, '北碚区', 3, 2247, '023', '500109', 106.43786800, 29.82543000, 2246, '重庆市', 2247, '重庆市市辖区', 2256, '北碚区', 'system', 'system', b'1', '2017-04-18 02:06:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2257, '綦江区', 3, 2247, '023', '500110', 106.65141700, 29.02809100, 2246, '重庆市', 2247, '重庆市市辖区', 2257, '綦江区', 'system', 'system', b'1', '2017-04-18 02:06:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2258, '大足区', 3, 2247, '023', '500111', 105.71531900, 29.70049800, 2246, '重庆市', 2247, '重庆市市辖区', 2258, '大足区', 'system', 'system', b'1', '2017-04-18 02:06:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2259, '渝北区', 3, 2247, '023', '500112', 106.51285100, 29.60145100, 2246, '重庆市', 2247, '重庆市市辖区', 2259, '渝北区', 'system', 'system', b'1', '2017-04-18 02:06:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2260, '巴南区', 3, 2247, '023', '500113', 106.51942300, 29.38191900, 2246, '重庆市', 2247, '重庆市市辖区', 2260, '巴南区', 'system', 'system', b'1', '2017-04-18 02:06:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2261, '黔江区', 3, 2247, '023', '500114', 108.78257700, 29.52754800, 2246, '重庆市', 2247, '重庆市市辖区', 2261, '黔江区', 'system', 'system', b'1', '2017-04-18 02:06:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2262, '长寿区', 3, 2247, '023', '500115', 107.07485400, 29.83367100, 2246, '重庆市', 2247, '重庆市市辖区', 2262, '长寿区', 'system', 'system', b'1', '2017-04-18 02:06:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2263, '江津区', 3, 2247, '023', '500116', 106.25315600, 29.28338700, 2246, '重庆市', 2247, '重庆市市辖区', 2263, '江津区', 'system', 'system', b'1', '2017-04-18 02:06:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2264, '合川区', 3, 2247, '023', '500117', 106.26555400, 29.99099300, 2246, '重庆市', 2247, '重庆市市辖区', 2264, '合川区', 'system', 'system', b'1', '2017-04-18 02:06:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2265, '永川区', 3, 2247, '023', '500118', 105.89471400, 29.34874800, 2246, '重庆市', 2247, '重庆市市辖区', 2265, '永川区', 'system', 'system', b'1', '2017-04-18 02:06:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2266, '南川区', 3, 2247, '023', '500119', 107.09815300, 29.15664600, 2246, '重庆市', 2247, '重庆市市辖区', 2266, '南川区', 'system', 'system', b'1', '2017-04-18 02:06:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2267, '璧山区', 3, 2247, '023', '500120', 106.23112600, 29.59358100, 2246, '重庆市', 2247, '重庆市市辖区', 2267, '璧山区', 'system', 'system', b'1', '2017-04-18 02:06:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2268, '铜梁区', 3, 2247, '023', '500151', 106.05494800, 29.83994400, 2246, '重庆市', 2247, '重庆市市辖区', 2268, '铜梁区', 'system', 'system', b'1', '2017-04-18 02:06:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2269, '潼南区', 3, 2247, '023', '500152', 105.84181800, 30.18955400, 2246, '重庆市', 2247, '重庆市市辖区', 2269, '潼南区', 'system', 'system', b'1', '2017-04-18 02:06:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2270, '荣昌区', 3, 2247, '023', '500153', 105.59406100, 29.40362700, 2246, '重庆市', 2247, '重庆市市辖区', 2270, '荣昌区', 'system', 'system', b'1', '2017-04-18 02:06:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2271, '开州区', 3, 2247, '023', '500154', 108.41331700, 31.16773500, 2246, '重庆市', 2247, '重庆市市辖区', 2271, '开州区', 'system', 'system', b'1', '2017-04-18 02:06:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2272, '梁平县', 3, 2247, '023', '500228', 107.80003400, 30.67216800, 2246, '重庆市', 2247, '重庆市市辖区', 2272, '梁平县', 'system', 'system', b'1', '2017-04-18 02:06:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2273, '城口县', 3, 2247, '023', '500229', 108.66490000, 31.94629300, 2246, '重庆市', 2247, '重庆市市辖区', 2273, '城口县', 'system', 'system', b'1', '2017-04-18 02:06:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2274, '丰都县', 3, 2247, '023', '500230', 107.73248000, 29.86642400, 2246, '重庆市', 2247, '重庆市市辖区', 2274, '丰都县', 'system', 'system', b'1', '2017-04-18 02:06:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2275, '垫江县', 3, 2247, '023', '500231', 107.34869200, 30.33001200, 2246, '重庆市', 2247, '重庆市市辖区', 2275, '垫江县', 'system', 'system', b'1', '2017-04-18 02:06:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2276, '武隆县', 3, 2247, '023', '500232', 107.75655000, 29.32376000, 2246, '重庆市', 2247, '重庆市市辖区', 2276, '武隆县', 'system', 'system', b'1', '2017-04-18 02:06:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2277, '忠县', 3, 2247, '023', '500233', 108.03751800, 30.29153700, 2246, '重庆市', 2247, '重庆市市辖区', 2277, '忠县', 'system', 'system', b'1', '2017-04-18 02:06:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2278, '云阳县', 3, 2247, '023', '500235', 108.69769800, 30.93052900, 2246, '重庆市', 2247, '重庆市市辖区', 2278, '云阳县', 'system', 'system', b'1', '2017-04-18 02:06:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2279, '奉节县', 3, 2247, '023', '500236', 109.46577400, 31.01996700, 2246, '重庆市', 2247, '重庆市市辖区', 2279, '奉节县', 'system', 'system', b'1', '2017-04-18 02:06:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2280, '巫山县', 3, 2247, '023', '500237', 109.87892800, 31.07484300, 2246, '重庆市', 2247, '重庆市市辖区', 2280, '巫山县', 'system', 'system', b'1', '2017-04-18 02:06:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2281, '巫溪县', 3, 2247, '023', '500238', 109.62891200, 31.39660000, 2246, '重庆市', 2247, '重庆市市辖区', 2281, '巫溪县', 'system', 'system', b'1', '2017-04-18 02:06:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2282, '石柱土家族自治县', 3, 2247, '023', '500240', 108.11244800, 29.99853000, 2246, '重庆市', 2247, '重庆市市辖区', 2282, '石柱土家族自治县', 'system', 'system', b'1', '2017-04-18 02:06:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2283, '秀山土家族苗族自治县', 3, 2247, '023', '500241', 108.99604300, 28.44477200, 2246, '重庆市', 2247, '重庆市市辖区', 2283, '秀山土家族苗族自治县', 'system', 'system', b'1', '2017-04-18 02:06:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2284, '酉阳土家族苗族自治县', 3, 2247, '023', '500242', 108.76720100, 28.83982800, 2246, '重庆市', 2247, '重庆市市辖区', 2284, '酉阳土家族苗族自治县', 'system', 'system', b'1', '2017-04-18 02:06:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2285, '彭水苗族土家族自治县', 3, 2247, '023', '500243', 108.16655100, 29.29385600, 2246, '重庆市', 2247, '重庆市市辖区', 2285, '彭水苗族土家族自治县', 'system', 'system', b'1', '2017-04-18 02:06:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2286, '重庆市郊县', 2, 2246, '023', '500200', 108.17025500, 29.29196500, 2246, '重庆市', 2286, '重庆市郊县', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2287, '四川省', 1, 1, NULL, '510000', 104.06573500, 30.65946200, 2287, '四川省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2288, '成都市', 2, 2287, '028', '510100', 104.06573500, 30.65946200, 2287, '四川省', 2288, '成都市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2289, '锦江区', 3, 2288, '028', '510104', 104.08098900, 30.65768900, 2287, '四川省', 2288, '成都市', 2289, '锦江区', 'system', 'system', b'1', '2017-04-18 02:06:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2290, '青羊区', 3, 2288, '028', '510105', 104.05573100, 30.66764800, 2287, '四川省', 2288, '成都市', 2290, '青羊区', 'system', 'system', b'1', '2017-04-18 02:06:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2291, '金牛区', 3, 2288, '028', '510106', 104.04348700, 30.69205800, 2287, '四川省', 2288, '成都市', 2291, '金牛区', 'system', 'system', b'1', '2017-04-18 02:06:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2292, '武侯区', 3, 2288, '028', '510107', 104.05167000, 30.63086200, 2287, '四川省', 2288, '成都市', 2292, '武侯区', 'system', 'system', b'1', '2017-04-18 02:06:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2293, '成华区', 3, 2288, '028', '510108', 104.10307700, 30.66027500, 2287, '四川省', 2288, '成都市', 2293, '成华区', 'system', 'system', b'1', '2017-04-18 02:06:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2294, '龙泉驿区', 3, 2288, '028', '510112', 104.26918100, 30.56065000, 2287, '四川省', 2288, '成都市', 2294, '龙泉驿区', 'system', 'system', b'1', '2017-04-18 02:06:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2295, '青白江区', 3, 2288, '028', '510113', 104.25494000, 30.88343800, 2287, '四川省', 2288, '成都市', 2295, '青白江区', 'system', 'system', b'1', '2017-04-18 02:06:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2296, '新都区', 3, 2288, '028', '510114', 104.16022000, 30.82422300, 2287, '四川省', 2288, '成都市', 2296, '新都区', 'system', 'system', b'1', '2017-04-18 02:06:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2297, '温江区', 3, 2288, '028', '510115', 103.83677600, 30.69799600, 2287, '四川省', 2288, '成都市', 2297, '温江区', 'system', 'system', b'1', '2017-04-18 02:06:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2298, '金堂县', 3, 2288, '028', '510121', 104.41560400, 30.85841700, 2287, '四川省', 2288, '成都市', 2298, '金堂县', 'system', 'system', b'1', '2017-04-18 02:06:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2299, '双流区', 3, 2288, '028', '510116', 103.92270600, 30.57324300, 2287, '四川省', 2288, '成都市', 2299, '双流区', 'system', 'system', b'1', '2017-04-18 02:06:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2300, '郫县', 3, 2288, '028', '510124', 103.88784200, 30.80875200, 2287, '四川省', 2288, '成都市', 2300, '郫县', 'system', 'system', b'1', '2017-04-18 02:06:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2301, '大邑县', 3, 2288, '028', '510129', 103.52239700, 30.58660200, 2287, '四川省', 2288, '成都市', 2301, '大邑县', 'system', 'system', b'1', '2017-04-18 02:06:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2302, '蒲江县', 3, 2288, '028', '510131', 103.51154100, 30.19435900, 2287, '四川省', 2288, '成都市', 2302, '蒲江县', 'system', 'system', b'1', '2017-04-18 02:06:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2303, '新津县', 3, 2288, '028', '510132', 103.81244900, 30.41428400, 2287, '四川省', 2288, '成都市', 2303, '新津县', 'system', 'system', b'1', '2017-04-18 02:06:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2304, '简阳市', 3, 2288, '028', '510180', 104.55033900, 30.39066600, 2287, '四川省', 2288, '成都市', 2304, '简阳市', 'system', 'system', b'1', '2017-04-18 02:06:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2305, '都江堰市', 3, 2288, '028', '510181', 103.62789800, 30.99114000, 2287, '四川省', 2288, '成都市', 2305, '都江堰市', 'system', 'system', b'1', '2017-04-18 02:06:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2306, '彭州市', 3, 2288, '028', '510182', 103.94117300, 30.98516100, 2287, '四川省', 2288, '成都市', 2306, '彭州市', 'system', 'system', b'1', '2017-04-18 02:06:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2307, '邛崃市', 3, 2288, '028', '510183', 103.46143000, 30.41327100, 2287, '四川省', 2288, '成都市', 2307, '邛崃市', 'system', 'system', b'1', '2017-04-18 02:06:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2308, '崇州市', 3, 2288, '028', '510184', 103.67104900, 30.63147800, 2287, '四川省', 2288, '成都市', 2308, '崇州市', 'system', 'system', b'1', '2017-04-18 02:06:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2309, '自贡市', 2, 2287, '0813', '510300', 104.77344700, 29.35276500, 2287, '四川省', 2309, '自贡市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2310, '自流井区', 3, 2309, '0813', '510302', 104.77818800, 29.34323100, 2287, '四川省', 2309, '自贡市', 2310, '自流井区', 'system', 'system', b'1', '2017-04-18 02:06:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2311, '贡井区', 3, 2309, '0813', '510303', 104.71437200, 29.34567500, 2287, '四川省', 2309, '自贡市', 2311, '贡井区', 'system', 'system', b'1', '2017-04-18 02:06:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2312, '大安区', 3, 2309, '0813', '510304', 104.78322900, 29.36713600, 2287, '四川省', 2309, '自贡市', 2312, '大安区', 'system', 'system', b'1', '2017-04-18 02:06:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2313, '沿滩区', 3, 2309, '0813', '510311', 104.87641700, 29.27252100, 2287, '四川省', 2309, '自贡市', 2313, '沿滩区', 'system', 'system', b'1', '2017-04-18 02:06:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2314, '荣县', 3, 2309, '0813', '510321', 104.42393200, 29.45485100, 2287, '四川省', 2309, '自贡市', 2314, '荣县', 'system', 'system', b'1', '2017-04-18 02:06:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2315, '富顺县', 3, 2309, '0813', '510322', 104.98425600, 29.18128200, 2287, '四川省', 2309, '自贡市', 2315, '富顺县', 'system', 'system', b'1', '2017-04-18 02:06:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2316, '攀枝花市', 2, 2287, '0812', '510400', 101.71600700, 26.58044600, 2287, '四川省', 2316, '攀枝花市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2317, '东区', 3, 2316, '0812', '510402', 101.71513400, 26.58088700, 2287, '四川省', 2316, '攀枝花市', 2317, '东区', 'system', 'system', b'1', '2017-04-18 02:06:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2318, '西区', 3, 2316, '0812', '510403', 101.63796900, 26.59677600, 2287, '四川省', 2316, '攀枝花市', 2318, '西区', 'system', 'system', b'1', '2017-04-18 02:06:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2319, '仁和区', 3, 2316, '0812', '510411', 101.73791600, 26.49718500, 2287, '四川省', 2316, '攀枝花市', 2319, '仁和区', 'system', 'system', b'1', '2017-04-18 02:06:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2320, '米易县', 3, 2316, '0812', '510421', 102.10987700, 26.88747400, 2287, '四川省', 2316, '攀枝花市', 2320, '米易县', 'system', 'system', b'1', '2017-04-18 02:06:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2321, '盐边县', 3, 2316, '0812', '510422', 101.85184800, 26.67761900, 2287, '四川省', 2316, '攀枝花市', 2321, '盐边县', 'system', 'system', b'1', '2017-04-18 02:06:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2322, '泸州市', 2, 2287, '0830', '510500', 105.44334800, 28.88913800, 2287, '四川省', 2322, '泸州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2323, '江阳区', 3, 2322, '0830', '510502', 105.44513100, 28.88288900, 2287, '四川省', 2322, '泸州市', 2323, '江阳区', 'system', 'system', b'1', '2017-04-18 02:06:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2324, '纳溪区', 3, 2322, '0830', '510503', 105.37721000, 28.77631000, 2287, '四川省', 2322, '泸州市', 2324, '纳溪区', 'system', 'system', b'1', '2017-04-18 02:06:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2325, '龙马潭区', 3, 2322, '0830', '510504', 105.43522800, 28.89757200, 2287, '四川省', 2322, '泸州市', 2325, '龙马潭区', 'system', 'system', b'1', '2017-04-18 02:06:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2326, '泸县', 3, 2322, '0830', '510521', 105.37633500, 29.15128800, 2287, '四川省', 2322, '泸州市', 2326, '泸县', 'system', 'system', b'1', '2017-04-18 02:06:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2327, '合江县', 3, 2322, '0830', '510522', 105.83409800, 28.81032500, 2287, '四川省', 2322, '泸州市', 2327, '合江县', 'system', 'system', b'1', '2017-04-18 02:06:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2328, '叙永县', 3, 2322, '0830', '510524', 105.43777500, 28.16791900, 2287, '四川省', 2322, '泸州市', 2328, '叙永县', 'system', 'system', b'1', '2017-04-18 02:06:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2329, '古蔺县', 3, 2322, '0830', '510525', 105.81335900, 28.03948000, 2287, '四川省', 2322, '泸州市', 2329, '古蔺县', 'system', 'system', b'1', '2017-04-18 02:06:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2330, '德阳市', 2, 2287, '0838', '510600', 104.39865100, 31.12799100, 2287, '四川省', 2330, '德阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2331, '旌阳区', 3, 2330, '0838', '510603', 104.38964800, 31.13042800, 2287, '四川省', 2330, '德阳市', 2331, '旌阳区', 'system', 'system', b'1', '2017-04-18 02:06:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2332, '中江县', 3, 2330, '0838', '510623', 104.67783100, 31.03681000, 2287, '四川省', 2330, '德阳市', 2332, '中江县', 'system', 'system', b'1', '2017-04-18 02:06:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2333, '罗江县', 3, 2330, '0838', '510626', 104.50712600, 31.30328100, 2287, '四川省', 2330, '德阳市', 2333, '罗江县', 'system', 'system', b'1', '2017-04-18 02:06:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2334, '广汉市', 3, 2330, '0838', '510681', 104.28190300, 30.97715000, 2287, '四川省', 2330, '德阳市', 2334, '广汉市', 'system', 'system', b'1', '2017-04-18 02:06:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2335, '什邡市', 3, 2330, '0838', '510682', 104.17365300, 31.12688100, 2287, '四川省', 2330, '德阳市', 2335, '什邡市', 'system', 'system', b'1', '2017-04-18 02:06:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2336, '绵竹市', 3, 2330, '0838', '510683', 104.20016200, 31.34308400, 2287, '四川省', 2330, '德阳市', 2336, '绵竹市', 'system', 'system', b'1', '2017-04-18 02:06:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2337, '绵阳市', 2, 2287, '0816', '510700', 104.74172200, 31.46402000, 2287, '四川省', 2337, '绵阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2338, '涪城区', 3, 2337, '0816', '510703', 104.74097100, 31.46355700, 2287, '四川省', 2337, '绵阳市', 2338, '涪城区', 'system', 'system', b'1', '2017-04-18 02:06:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2339, '游仙区', 3, 2337, '0816', '510704', 104.77000600, 31.48477200, 2287, '四川省', 2337, '绵阳市', 2339, '游仙区', 'system', 'system', b'1', '2017-04-18 02:06:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2340, '三台县', 3, 2337, '0816', '510722', 105.09031600, 31.09090900, 2287, '四川省', 2337, '绵阳市', 2340, '三台县', 'system', 'system', b'1', '2017-04-18 02:06:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2341, '盐亭县', 3, 2337, '0816', '510723', 105.39199100, 31.22318000, 2287, '四川省', 2337, '绵阳市', 2341, '盐亭县', 'system', 'system', b'1', '2017-04-18 02:06:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2342, '安州区', 3, 2337, '0816', '510705', 104.56034100, 31.53894000, 2287, '四川省', 2337, '绵阳市', 2342, '安州区', 'system', 'system', b'1', '2017-04-18 02:06:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2343, '梓潼县', 3, 2337, '0816', '510725', 105.16353000, 31.63522500, 2287, '四川省', 2337, '绵阳市', 2343, '梓潼县', 'system', 'system', b'1', '2017-04-18 02:06:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2344, '北川羌族自治县', 3, 2337, '0816', '510726', 104.46806900, 31.61586300, 2287, '四川省', 2337, '绵阳市', 2344, '北川羌族自治县', 'system', 'system', b'1', '2017-04-18 02:06:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2345, '平武县', 3, 2337, '0816', '510727', 104.53055500, 32.40758800, 2287, '四川省', 2337, '绵阳市', 2345, '平武县', 'system', 'system', b'1', '2017-04-18 02:06:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2346, '江油市', 3, 2337, '0816', '510781', 104.74443100, 31.77638600, 2287, '四川省', 2337, '绵阳市', 2346, '江油市', 'system', 'system', b'1', '2017-04-18 02:06:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2347, '广元市', 2, 2287, '0839', '510800', 105.82975700, 32.43366800, 2287, '四川省', 2347, '广元市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2348, '利州区', 3, 2347, '0839', '510802', 105.82619400, 32.43227600, 2287, '四川省', 2347, '广元市', 2348, '利州区', 'system', 'system', b'1', '2017-04-18 02:06:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2349, '昭化区', 3, 2347, '0839', '510811', 105.96412100, 32.32278800, 2287, '四川省', 2347, '广元市', 2349, '昭化区', 'system', 'system', b'1', '2017-04-18 02:06:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2350, '朝天区', 3, 2347, '0839', '510812', 105.88917000, 32.64263200, 2287, '四川省', 2347, '广元市', 2350, '朝天区', 'system', 'system', b'1', '2017-04-18 02:06:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2351, '旺苍县', 3, 2347, '0839', '510821', 106.29042600, 32.22833000, 2287, '四川省', 2347, '广元市', 2351, '旺苍县', 'system', 'system', b'1', '2017-04-18 02:06:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2352, '青川县', 3, 2347, '0839', '510822', 105.23884700, 32.58565500, 2287, '四川省', 2347, '广元市', 2352, '青川县', 'system', 'system', b'1', '2017-04-18 02:06:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2353, '剑阁县', 3, 2347, '0839', '510823', 105.52703500, 32.28651700, 2287, '四川省', 2347, '广元市', 2353, '剑阁县', 'system', 'system', b'1', '2017-04-18 02:06:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2354, '苍溪县', 3, 2347, '0839', '510824', 105.93970600, 31.73225100, 2287, '四川省', 2347, '广元市', 2354, '苍溪县', 'system', 'system', b'1', '2017-04-18 02:06:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2355, '遂宁市', 2, 2287, '0825', '510900', 105.57133100, 30.51331100, 2287, '四川省', 2355, '遂宁市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2356, '船山区', 3, 2355, '0825', '510903', 105.58221500, 30.50264700, 2287, '四川省', 2355, '遂宁市', 2356, '船山区', 'system', 'system', b'1', '2017-04-18 02:06:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2357, '安居区', 3, 2355, '0825', '510904', 105.45938300, 30.34612100, 2287, '四川省', 2355, '遂宁市', 2357, '安居区', 'system', 'system', b'1', '2017-04-18 02:06:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2358, '蓬溪县', 3, 2355, '0825', '510921', 105.71369900, 30.77488300, 2287, '四川省', 2355, '遂宁市', 2358, '蓬溪县', 'system', 'system', b'1', '2017-04-18 02:06:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2359, '射洪县', 3, 2355, '0825', '510922', 105.38184900, 30.86875200, 2287, '四川省', 2355, '遂宁市', 2359, '射洪县', 'system', 'system', b'1', '2017-04-18 02:06:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2360, '大英县', 3, 2355, '0825', '510923', 105.25218700, 30.58157100, 2287, '四川省', 2355, '遂宁市', 2360, '大英县', 'system', 'system', b'1', '2017-04-18 02:06:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2361, '内江市', 2, 2287, '1832', '511000', 105.06613800, 29.58708000, 2287, '四川省', 2361, '内江市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2362, '市中区', 3, 2361, '1832', '511002', 105.06546700, 29.58526500, 2287, '四川省', 2361, '内江市', 2362, '市中区', 'system', 'system', b'1', '2017-04-18 02:06:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2363, '东兴区', 3, 2361, '1832', '511011', 105.06720300, 29.60010700, 2287, '四川省', 2361, '内江市', 2363, '东兴区', 'system', 'system', b'1', '2017-04-18 02:06:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2364, '威远县', 3, 2361, '1832', '511024', 104.66832700, 29.52686000, 2287, '四川省', 2361, '内江市', 2364, '威远县', 'system', 'system', b'1', '2017-04-18 02:06:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2365, '资中县', 3, 2361, '1832', '511025', 104.85246300, 29.77529500, 2287, '四川省', 2361, '内江市', 2365, '资中县', 'system', 'system', b'1', '2017-04-18 02:06:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2366, '隆昌县', 3, 2361, '1832', '511028', 105.28807400, 29.33816200, 2287, '四川省', 2361, '内江市', 2366, '隆昌县', 'system', 'system', b'1', '2017-04-18 02:06:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2367, '乐山市', 2, 2287, '0833', '511100', 103.76126300, 29.58202400, 2287, '四川省', 2367, '乐山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2368, '市中区', 3, 2367, '0833', '511102', 103.75539000, 29.58832700, 2287, '四川省', 2367, '乐山市', 2368, '市中区', 'system', 'system', b'1', '2017-04-18 02:06:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2369, '沙湾区', 3, 2367, '0833', '511111', 103.54996100, 29.41653600, 2287, '四川省', 2367, '乐山市', 2369, '沙湾区', 'system', 'system', b'1', '2017-04-18 02:06:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2370, '五通桥区', 3, 2367, '0833', '511112', 103.81683700, 29.40618600, 2287, '四川省', 2367, '乐山市', 2370, '五通桥区', 'system', 'system', b'1', '2017-04-18 02:06:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2371, '金口河区', 3, 2367, '0833', '511113', 103.07783100, 29.24602000, 2287, '四川省', 2367, '乐山市', 2371, '金口河区', 'system', 'system', b'1', '2017-04-18 02:06:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2372, '犍为县', 3, 2367, '0833', '511123', 103.94426600, 29.20978200, 2287, '四川省', 2367, '乐山市', 2372, '犍为县', 'system', 'system', b'1', '2017-04-18 02:06:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2373, '井研县', 3, 2367, '0833', '511124', 104.06885000, 29.65164500, 2287, '四川省', 2367, '乐山市', 2373, '井研县', 'system', 'system', b'1', '2017-04-18 02:06:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2374, '夹江县', 3, 2367, '0833', '511126', 103.57886200, 29.74101900, 2287, '四川省', 2367, '乐山市', 2374, '夹江县', 'system', 'system', b'1', '2017-04-18 02:06:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2375, '沐川县', 3, 2367, '0833', '511129', 103.90211000, 28.95633800, 2287, '四川省', 2367, '乐山市', 2375, '沐川县', 'system', 'system', b'1', '2017-04-18 02:06:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2376, '峨边彝族自治县', 3, 2367, '0833', '511132', 103.26214800, 29.23027100, 2287, '四川省', 2367, '乐山市', 2376, '峨边彝族自治县', 'system', 'system', b'1', '2017-04-18 02:06:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2377, '马边彝族自治县', 3, 2367, '0833', '511133', 103.54685100, 28.83893300, 2287, '四川省', 2367, '乐山市', 2377, '马边彝族自治县', 'system', 'system', b'1', '2017-04-18 02:06:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2378, '峨眉山市', 3, 2367, '0833', '511181', 103.49248800, 29.59747800, 2287, '四川省', 2367, '乐山市', 2378, '峨眉山市', 'system', 'system', b'1', '2017-04-18 02:06:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2379, '南充市', 2, 2287, '0817', '511300', 106.08297400, 30.79528100, 2287, '四川省', 2379, '南充市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2380, '顺庆区', 3, 2379, '0817', '511302', 106.08409100, 30.79557200, 2287, '四川省', 2379, '南充市', 2380, '顺庆区', 'system', 'system', b'1', '2017-04-18 02:06:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2381, '高坪区', 3, 2379, '0817', '511303', 106.10899600, 30.78180900, 2287, '四川省', 2379, '南充市', 2381, '高坪区', 'system', 'system', b'1', '2017-04-18 02:06:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2382, '嘉陵区', 3, 2379, '0817', '511304', 106.06702700, 30.76297600, 2287, '四川省', 2379, '南充市', 2382, '嘉陵区', 'system', 'system', b'1', '2017-04-18 02:06:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2383, '南部县', 3, 2379, '0817', '511321', 106.06113800, 31.34940700, 2287, '四川省', 2379, '南充市', 2383, '南部县', 'system', 'system', b'1', '2017-04-18 02:06:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2384, '营山县', 3, 2379, '0817', '511322', 106.56489300, 31.07590700, 2287, '四川省', 2379, '南充市', 2384, '营山县', 'system', 'system', b'1', '2017-04-18 02:06:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2385, '蓬安县', 3, 2379, '0817', '511323', 106.41348800, 31.02797800, 2287, '四川省', 2379, '南充市', 2385, '蓬安县', 'system', 'system', b'1', '2017-04-18 02:06:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2386, '仪陇县', 3, 2379, '0817', '511324', 106.29708300, 31.27126100, 2287, '四川省', 2379, '南充市', 2386, '仪陇县', 'system', 'system', b'1', '2017-04-18 02:06:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2387, '西充县', 3, 2379, '0817', '511325', 105.89302100, 30.99461600, 2287, '四川省', 2379, '南充市', 2387, '西充县', 'system', 'system', b'1', '2017-04-18 02:06:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2388, '阆中市', 3, 2379, '0817', '511381', 105.97526600, 31.58046600, 2287, '四川省', 2379, '南充市', 2388, '阆中市', 'system', 'system', b'1', '2017-04-18 02:06:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2389, '眉山市', 2, 2287, '1833', '511400', 103.83178800, 30.04831800, 2287, '四川省', 2389, '眉山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2390, '东坡区', 3, 2389, '1833', '511402', 103.83155300, 30.04812800, 2287, '四川省', 2389, '眉山市', 2390, '东坡区', 'system', 'system', b'1', '2017-04-18 02:06:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2391, '彭山区', 3, 2389, '1833', '511403', 103.87010000, 30.19229800, 2287, '四川省', 2389, '眉山市', 2391, '彭山区', 'system', 'system', b'1', '2017-04-18 02:06:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2392, '仁寿县', 3, 2389, '1833', '511421', 104.14764600, 29.99672100, 2287, '四川省', 2389, '眉山市', 2392, '仁寿县', 'system', 'system', b'1', '2017-04-18 02:06:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2393, '洪雅县', 3, 2389, '1833', '511423', 103.37500600, 29.90486700, 2287, '四川省', 2389, '眉山市', 2393, '洪雅县', 'system', 'system', b'1', '2017-04-18 02:06:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2394, '丹棱县', 3, 2389, '1833', '511424', 103.51833300, 30.01275100, 2287, '四川省', 2389, '眉山市', 2394, '丹棱县', 'system', 'system', b'1', '2017-04-18 02:06:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2395, '青神县', 3, 2389, '1833', '511425', 103.84613100, 29.83146900, 2287, '四川省', 2389, '眉山市', 2395, '青神县', 'system', 'system', b'1', '2017-04-18 02:06:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2396, '宜宾市', 2, 2287, '0831', '511500', 104.63082500, 28.76018900, 2287, '四川省', 2396, '宜宾市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2397, '翠屏区', 3, 2396, '0831', '511502', 104.63023100, 28.76017900, 2287, '四川省', 2396, '宜宾市', 2397, '翠屏区', 'system', 'system', b'1', '2017-04-18 02:06:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2398, '南溪区', 3, 2396, '0831', '511503', 104.98113300, 28.83980600, 2287, '四川省', 2396, '宜宾市', 2398, '南溪区', 'system', 'system', b'1', '2017-04-18 02:06:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2399, '宜宾县', 3, 2396, '0831', '511521', 104.54148900, 28.69567800, 2287, '四川省', 2396, '宜宾市', 2399, '宜宾县', 'system', 'system', b'1', '2017-04-18 02:06:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2400, '江安县', 3, 2396, '0831', '511523', 105.06869700, 28.72810200, 2287, '四川省', 2396, '宜宾市', 2400, '江安县', 'system', 'system', b'1', '2017-04-18 02:06:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2401, '长宁县', 3, 2396, '0831', '511524', 104.92111600, 28.57727100, 2287, '四川省', 2396, '宜宾市', 2401, '长宁县', 'system', 'system', b'1', '2017-04-18 02:06:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2402, '高县', 3, 2396, '0831', '511525', 104.51918700, 28.43567600, 2287, '四川省', 2396, '宜宾市', 2402, '高县', 'system', 'system', b'1', '2017-04-18 02:06:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2403, '珙县', 3, 2396, '0831', '511526', 104.71226800, 28.44904100, 2287, '四川省', 2396, '宜宾市', 2403, '珙县', 'system', 'system', b'1', '2017-04-18 02:06:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2404, '筠连县', 3, 2396, '0831', '511527', 104.50784800, 28.16201700, 2287, '四川省', 2396, '宜宾市', 2404, '筠连县', 'system', 'system', b'1', '2017-04-18 02:06:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2405, '兴文县', 3, 2396, '0831', '511528', 105.23654900, 28.30298800, 2287, '四川省', 2396, '宜宾市', 2405, '兴文县', 'system', 'system', b'1', '2017-04-18 02:06:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2406, '屏山县', 3, 2396, '0831', '511529', 104.16261700, 28.64237000, 2287, '四川省', 2396, '宜宾市', 2406, '屏山县', 'system', 'system', b'1', '2017-04-18 02:06:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2407, '广安市', 2, 2287, '0826', '511600', 106.63336900, 30.45639800, 2287, '四川省', 2407, '广安市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2408, '广安区', 3, 2407, '0826', '511602', 106.63290700, 30.45646200, 2287, '四川省', 2407, '广安市', 2408, '广安区', 'system', 'system', b'1', '2017-04-18 02:06:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2409, '前锋区', 3, 2407, '0826', '511603', 106.89327700, 30.49630000, 2287, '四川省', 2407, '广安市', 2409, '前锋区', 'system', 'system', b'1', '2017-04-18 02:06:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2410, '岳池县', 3, 2407, '0826', '511621', 106.44445100, 30.53353800, 2287, '四川省', 2407, '广安市', 2410, '岳池县', 'system', 'system', b'1', '2017-04-18 02:06:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2411, '武胜县', 3, 2407, '0826', '511622', 106.29247300, 30.34429100, 2287, '四川省', 2407, '广安市', 2411, '武胜县', 'system', 'system', b'1', '2017-04-18 02:06:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2412, '邻水县', 3, 2407, '0826', '511623', 106.93496800, 30.33432300, 2287, '四川省', 2407, '广安市', 2412, '邻水县', 'system', 'system', b'1', '2017-04-18 02:06:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2413, '华蓥市', 3, 2407, '0826', '511681', 106.77788200, 30.38057400, 2287, '四川省', 2407, '广安市', 2413, '华蓥市', 'system', 'system', b'1', '2017-04-18 02:06:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2414, '达州市', 2, 2287, '0818', '511700', 107.50226200, 31.20948400, 2287, '四川省', 2414, '达州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2415, '通川区', 3, 2414, '0818', '511702', 107.50106200, 31.21352200, 2287, '四川省', 2414, '达州市', 2415, '通川区', 'system', 'system', b'1', '2017-04-18 02:06:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2416, '达川区', 3, 2414, '0818', '511703', 107.50792600, 31.19906200, 2287, '四川省', 2414, '达州市', 2416, '达川区', 'system', 'system', b'1', '2017-04-18 02:06:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2417, '宣汉县', 3, 2414, '0818', '511722', 107.72225400, 31.35502500, 2287, '四川省', 2414, '达州市', 2417, '宣汉县', 'system', 'system', b'1', '2017-04-18 02:06:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2418, '开江县', 3, 2414, '0818', '511723', 107.86413500, 31.08553700, 2287, '四川省', 2414, '达州市', 2418, '开江县', 'system', 'system', b'1', '2017-04-18 02:06:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2419, '大竹县', 3, 2414, '0818', '511724', 107.20742000, 30.73628900, 2287, '四川省', 2414, '达州市', 2419, '大竹县', 'system', 'system', b'1', '2017-04-18 02:06:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2420, '渠县', 3, 2414, '0818', '511725', 106.97074600, 30.83634800, 2287, '四川省', 2414, '达州市', 2420, '渠县', 'system', 'system', b'1', '2017-04-18 02:06:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2421, '万源市', 3, 2414, '0818', '511781', 108.03754800, 32.06777000, 2287, '四川省', 2414, '达州市', 2421, '万源市', 'system', 'system', b'1', '2017-04-18 02:06:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2422, '雅安市', 2, 2287, '0835', '511800', 103.00103300, 29.98772200, 2287, '四川省', 2422, '雅安市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2423, '雨城区', 3, 2422, '0835', '511802', 103.00339800, 29.98183100, 2287, '四川省', 2422, '雅安市', 2423, '雨城区', 'system', 'system', b'1', '2017-04-18 02:06:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2424, '名山区', 3, 2422, '0835', '511803', 103.11221400, 30.08471800, 2287, '四川省', 2422, '雅安市', 2424, '名山区', 'system', 'system', b'1', '2017-04-18 02:06:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2425, '荥经县', 3, 2422, '0835', '511822', 102.84467400, 29.79552900, 2287, '四川省', 2422, '雅安市', 2425, '荥经县', 'system', 'system', b'1', '2017-04-18 02:06:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2426, '汉源县', 3, 2422, '0835', '511823', 102.67714500, 29.34991500, 2287, '四川省', 2422, '雅安市', 2426, '汉源县', 'system', 'system', b'1', '2017-04-18 02:06:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2427, '石棉县', 3, 2422, '0835', '511824', 102.35962000, 29.23406300, 2287, '四川省', 2422, '雅安市', 2427, '石棉县', 'system', 'system', b'1', '2017-04-18 02:06:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2428, '天全县', 3, 2422, '0835', '511825', 102.76346200, 30.05995500, 2287, '四川省', 2422, '雅安市', 2428, '天全县', 'system', 'system', b'1', '2017-04-18 02:06:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2429, '芦山县', 3, 2422, '0835', '511826', 102.92401600, 30.15290700, 2287, '四川省', 2422, '雅安市', 2429, '芦山县', 'system', 'system', b'1', '2017-04-18 02:06:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2430, '宝兴县', 3, 2422, '0835', '511827', 102.81337700, 30.36902600, 2287, '四川省', 2422, '雅安市', 2430, '宝兴县', 'system', 'system', b'1', '2017-04-18 02:06:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2431, '巴中市', 2, 2287, '0827', '511900', 106.75366900, 31.85880900, 2287, '四川省', 2431, '巴中市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2432, '巴州区', 3, 2431, '0827', '511902', 106.75367100, 31.85836600, 2287, '四川省', 2431, '巴中市', 2432, '巴州区', 'system', 'system', b'1', '2017-04-18 02:06:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2433, '恩阳区', 3, 2431, '0827', '511903', 106.48651500, 31.81633600, 2287, '四川省', 2431, '巴中市', 2433, '恩阳区', 'system', 'system', b'1', '2017-04-18 02:06:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2434, '通江县', 3, 2431, '0827', '511921', 107.24762100, 31.91212000, 2287, '四川省', 2431, '巴中市', 2434, '通江县', 'system', 'system', b'1', '2017-04-18 02:06:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2435, '南江县', 3, 2431, '0827', '511922', 106.84341800, 32.35316400, 2287, '四川省', 2431, '巴中市', 2435, '南江县', 'system', 'system', b'1', '2017-04-18 02:06:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2436, '平昌县', 3, 2431, '0827', '511923', 107.10193700, 31.56281400, 2287, '四川省', 2431, '巴中市', 2436, '平昌县', 'system', 'system', b'1', '2017-04-18 02:06:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2437, '资阳市', 2, 2287, '0832', '512000', 104.64191700, 30.12221100, 2287, '四川省', 2437, '资阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2438, '雁江区', 3, 2437, '0832', '512002', 104.64233800, 30.12168600, 2287, '四川省', 2437, '资阳市', 2438, '雁江区', 'system', 'system', b'1', '2017-04-18 02:06:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2439, '安岳县', 3, 2437, '0832', '512021', 105.33676400, 30.09920600, 2287, '四川省', 2437, '资阳市', 2439, '安岳县', 'system', 'system', b'1', '2017-04-18 02:06:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2440, '乐至县', 3, 2437, '0832', '512022', 105.03114200, 30.27561900, 2287, '四川省', 2437, '资阳市', 2440, '乐至县', 'system', 'system', b'1', '2017-04-18 02:06:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2441, '阿坝藏族羌族自治州', 2, 2287, '0837', '513200', 102.22137400, 31.89979200, 2287, '四川省', 2441, '阿坝藏族羌族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2442, '汶川县', 3, 2441, '0837', '513221', 103.58067500, 31.47463000, 2287, '四川省', 2441, '阿坝藏族羌族自治州', 2442, '汶川县', 'system', 'system', b'1', '2017-04-18 02:06:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2443, '理县', 3, 2441, '0837', '513222', 103.16548600, 31.43676400, 2287, '四川省', 2441, '阿坝藏族羌族自治州', 2443, '理县', 'system', 'system', b'1', '2017-04-18 02:06:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2444, '茂县', 3, 2441, '0837', '513223', 103.85068400, 31.68040700, 2287, '四川省', 2441, '阿坝藏族羌族自治州', 2444, '茂县', 'system', 'system', b'1', '2017-04-18 02:06:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2445, '松潘县', 3, 2441, '0837', '513224', 103.59917700, 32.63838000, 2287, '四川省', 2441, '阿坝藏族羌族自治州', 2445, '松潘县', 'system', 'system', b'1', '2017-04-18 02:06:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2446, '九寨沟县', 3, 2441, '0837', '513225', 104.23634400, 33.26209700, 2287, '四川省', 2441, '阿坝藏族羌族自治州', 2446, '九寨沟县', 'system', 'system', b'1', '2017-04-18 02:06:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2447, '金川县', 3, 2441, '0837', '513226', 102.06464700, 31.47635600, 2287, '四川省', 2441, '阿坝藏族羌族自治州', 2447, '金川县', 'system', 'system', b'1', '2017-04-18 02:06:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2448, '小金县', 3, 2441, '0837', '513227', 102.36319300, 30.99901600, 2287, '四川省', 2441, '阿坝藏族羌族自治州', 2448, '小金县', 'system', 'system', b'1', '2017-04-18 02:06:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2449, '黑水县', 3, 2441, '0837', '513228', 102.99080500, 32.06172100, 2287, '四川省', 2441, '阿坝藏族羌族自治州', 2449, '黑水县', 'system', 'system', b'1', '2017-04-18 02:06:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2450, '马尔康市', 3, 2441, '0837', '513201', 102.22118700, 31.89976100, 2287, '四川省', 2441, '阿坝藏族羌族自治州', 2450, '马尔康市', 'system', 'system', b'1', '2017-04-18 02:06:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2451, '壤塘县', 3, 2441, '0837', '513230', 100.97913600, 32.26488700, 2287, '四川省', 2441, '阿坝藏族羌族自治州', 2451, '壤塘县', 'system', 'system', b'1', '2017-04-18 02:06:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2452, '阿坝县', 3, 2441, '0837', '513231', 101.70098500, 32.90422300, 2287, '四川省', 2441, '阿坝藏族羌族自治州', 2452, '阿坝县', 'system', 'system', b'1', '2017-04-18 02:06:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2453, '若尔盖县', 3, 2441, '0837', '513232', 102.96372600, 33.57593400, 2287, '四川省', 2441, '阿坝藏族羌族自治州', 2453, '若尔盖县', 'system', 'system', b'1', '2017-04-18 02:06:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2454, '红原县', 3, 2441, '0837', '513233', 102.54490600, 32.79390200, 2287, '四川省', 2441, '阿坝藏族羌族自治州', 2454, '红原县', 'system', 'system', b'1', '2017-04-18 02:06:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2455, '甘孜藏族自治州', 2, 2287, '0836', '513300', 101.96381500, 30.05066300, 2287, '四川省', 2455, '甘孜藏族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2456, '康定市', 3, 2455, '0836', '513301', 101.96405700, 30.05073800, 2287, '四川省', 2455, '甘孜藏族自治州', 2456, '康定市', 'system', 'system', b'1', '2017-04-18 02:06:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2457, '泸定县', 3, 2455, '0836', '513322', 102.23322500, 29.91248200, 2287, '四川省', 2455, '甘孜藏族自治州', 2457, '泸定县', 'system', 'system', b'1', '2017-04-18 02:06:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2458, '丹巴县', 3, 2455, '0836', '513323', 101.88612500, 30.87708300, 2287, '四川省', 2455, '甘孜藏族自治州', 2458, '丹巴县', 'system', 'system', b'1', '2017-04-18 02:06:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2459, '九龙县', 3, 2455, '0836', '513324', 101.50694200, 29.00197500, 2287, '四川省', 2455, '甘孜藏族自治州', 2459, '九龙县', 'system', 'system', b'1', '2017-04-18 02:06:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2460, '雅江县', 3, 2455, '0836', '513325', 101.01573500, 30.03225000, 2287, '四川省', 2455, '甘孜藏族自治州', 2460, '雅江县', 'system', 'system', b'1', '2017-04-18 02:06:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2461, '道孚县', 3, 2455, '0836', '513326', 101.12332700, 30.97876700, 2287, '四川省', 2455, '甘孜藏族自治州', 2461, '道孚县', 'system', 'system', b'1', '2017-04-18 02:06:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2462, '炉霍县', 3, 2455, '0836', '513327', 100.67949500, 31.39267400, 2287, '四川省', 2455, '甘孜藏族自治州', 2462, '炉霍县', 'system', 'system', b'1', '2017-04-18 02:06:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2463, '甘孜县', 3, 2455, '0836', '513328', 99.99175300, 31.61975000, 2287, '四川省', 2455, '甘孜藏族自治州', 2463, '甘孜县', 'system', 'system', b'1', '2017-04-18 02:06:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2464, '新龙县', 3, 2455, '0836', '513329', 100.31209400, 30.93896000, 2287, '四川省', 2455, '甘孜藏族自治州', 2464, '新龙县', 'system', 'system', b'1', '2017-04-18 02:06:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2465, '德格县', 3, 2455, '0836', '513330', 98.57999000, 31.80672900, 2287, '四川省', 2455, '甘孜藏族自治州', 2465, '德格县', 'system', 'system', b'1', '2017-04-18 02:06:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2466, '白玉县', 3, 2455, '0836', '513331', 98.82434300, 31.20880500, 2287, '四川省', 2455, '甘孜藏族自治州', 2466, '白玉县', 'system', 'system', b'1', '2017-04-18 02:06:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2467, '石渠县', 3, 2455, '0836', '513332', 98.10088700, 32.97530200, 2287, '四川省', 2455, '甘孜藏族自治州', 2467, '石渠县', 'system', 'system', b'1', '2017-04-18 02:06:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2468, '色达县', 3, 2455, '0836', '513333', 100.33165700, 32.26877700, 2287, '四川省', 2455, '甘孜藏族自治州', 2468, '色达县', 'system', 'system', b'1', '2017-04-18 02:06:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2469, '理塘县', 3, 2455, '0836', '513334', 100.26986200, 29.99180700, 2287, '四川省', 2455, '甘孜藏族自治州', 2469, '理塘县', 'system', 'system', b'1', '2017-04-18 02:06:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2470, '巴塘县', 3, 2455, '0836', '513335', 99.10903700, 30.00572300, 2287, '四川省', 2455, '甘孜藏族自治州', 2470, '巴塘县', 'system', 'system', b'1', '2017-04-18 02:06:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2471, '乡城县', 3, 2455, '0836', '513336', 99.79994300, 28.93085500, 2287, '四川省', 2455, '甘孜藏族自治州', 2471, '乡城县', 'system', 'system', b'1', '2017-04-18 02:06:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2472, '稻城县', 3, 2455, '0836', '513337', 100.29668900, 29.03754400, 2287, '四川省', 2455, '甘孜藏族自治州', 2472, '稻城县', 'system', 'system', b'1', '2017-04-18 02:06:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2473, '得荣县', 3, 2455, '0836', '513338', 99.28803600, 28.71134000, 2287, '四川省', 2455, '甘孜藏族自治州', 2473, '得荣县', 'system', 'system', b'1', '2017-04-18 02:06:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2474, '凉山彝族自治州', 2, 2287, '0834', '513400', 102.25874600, 27.88676200, 2287, '四川省', 2474, '凉山彝族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2475, '西昌市', 3, 2474, '0834', '513401', 102.25875800, 27.88578600, 2287, '四川省', 2474, '凉山彝族自治州', 2475, '西昌市', 'system', 'system', b'1', '2017-04-18 02:06:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2476, '木里藏族自治县', 3, 2474, '0834', '513422', 101.28018400, 27.92685900, 2287, '四川省', 2474, '凉山彝族自治州', 2476, '木里藏族自治县', 'system', 'system', b'1', '2017-04-18 02:06:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2477, '盐源县', 3, 2474, '0834', '513423', 101.50890900, 27.42341500, 2287, '四川省', 2474, '凉山彝族自治州', 2477, '盐源县', 'system', 'system', b'1', '2017-04-18 02:06:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2478, '德昌县', 3, 2474, '0834', '513424', 102.17884500, 27.40382700, 2287, '四川省', 2474, '凉山彝族自治州', 2478, '德昌县', 'system', 'system', b'1', '2017-04-18 02:06:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2479, '会理县', 3, 2474, '0834', '513425', 102.24954800, 26.65870200, 2287, '四川省', 2474, '凉山彝族自治州', 2479, '会理县', 'system', 'system', b'1', '2017-04-18 02:06:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2480, '会东县', 3, 2474, '0834', '513426', 102.57898500, 26.63071300, 2287, '四川省', 2474, '凉山彝族自治州', 2480, '会东县', 'system', 'system', b'1', '2017-04-18 02:06:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2481, '宁南县', 3, 2474, '0834', '513427', 102.75737400, 27.06520500, 2287, '四川省', 2474, '凉山彝族自治州', 2481, '宁南县', 'system', 'system', b'1', '2017-04-18 02:06:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2482, '普格县', 3, 2474, '0834', '513428', 102.54108200, 27.37682800, 2287, '四川省', 2474, '凉山彝族自治州', 2482, '普格县', 'system', 'system', b'1', '2017-04-18 02:06:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2483, '布拖县', 3, 2474, '0834', '513429', 102.80880100, 27.70906200, 2287, '四川省', 2474, '凉山彝族自治州', 2483, '布拖县', 'system', 'system', b'1', '2017-04-18 02:06:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2484, '金阳县', 3, 2474, '0834', '513430', 103.24870400, 27.69591600, 2287, '四川省', 2474, '凉山彝族自治州', 2484, '金阳县', 'system', 'system', b'1', '2017-04-18 02:06:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2485, '昭觉县', 3, 2474, '0834', '513431', 102.84399100, 28.01055400, 2287, '四川省', 2474, '凉山彝族自治州', 2485, '昭觉县', 'system', 'system', b'1', '2017-04-18 02:06:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2486, '喜德县', 3, 2474, '0834', '513432', 102.41234200, 28.30548600, 2287, '四川省', 2474, '凉山彝族自治州', 2486, '喜德县', 'system', 'system', b'1', '2017-04-18 02:06:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2487, '冕宁县', 3, 2474, '0834', '513433', 102.17004600, 28.55084400, 2287, '四川省', 2474, '凉山彝族自治州', 2487, '冕宁县', 'system', 'system', b'1', '2017-04-18 02:06:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2488, '越西县', 3, 2474, '0834', '513434', 102.50887500, 28.63963200, 2287, '四川省', 2474, '凉山彝族自治州', 2488, '越西县', 'system', 'system', b'1', '2017-04-18 02:06:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2489, '甘洛县', 3, 2474, '0834', '513435', 102.77592400, 28.97709400, 2287, '四川省', 2474, '凉山彝族自治州', 2489, '甘洛县', 'system', 'system', b'1', '2017-04-18 02:06:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2490, '美姑县', 3, 2474, '0834', '513436', 103.13200700, 28.32794600, 2287, '四川省', 2474, '凉山彝族自治州', 2490, '美姑县', 'system', 'system', b'1', '2017-04-18 02:06:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2491, '雷波县', 3, 2474, '0834', '513437', 103.57158400, 28.26294600, 2287, '四川省', 2474, '凉山彝族自治州', 2491, '雷波县', 'system', 'system', b'1', '2017-04-18 02:06:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2492, '贵州省', 1, 1, NULL, '520000', 106.71347800, 26.57834300, 2492, '贵州省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2493, '贵阳市', 2, 2492, '0851', '520100', 106.71347800, 26.57834300, 2492, '贵州省', 2493, '贵阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2494, '南明区', 3, 2493, '0851', '520102', 106.71596300, 26.57374300, 2492, '贵州省', 2493, '贵阳市', 2494, '南明区', 'system', 'system', b'1', '2017-04-18 02:06:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2495, '云岩区', 3, 2493, '0851', '520103', 106.71339700, 26.58301000, 2492, '贵州省', 2493, '贵阳市', 2495, '云岩区', 'system', 'system', b'1', '2017-04-18 02:06:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2496, '花溪区', 3, 2493, '0851', '520111', 106.67079100, 26.41046400, 2492, '贵州省', 2493, '贵阳市', 2496, '花溪区', 'system', 'system', b'1', '2017-04-18 02:06:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2497, '乌当区', 3, 2493, '0851', '520112', 106.76212300, 26.63092800, 2492, '贵州省', 2493, '贵阳市', 2497, '乌当区', 'system', 'system', b'1', '2017-04-18 02:06:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2498, '白云区', 3, 2493, '0851', '520113', 106.63303700, 26.67684900, 2492, '贵州省', 2493, '贵阳市', 2498, '白云区', 'system', 'system', b'1', '2017-04-18 02:06:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2499, '观山湖区', 3, 2493, '0851', '520115', 106.62632300, 26.64635800, 2492, '贵州省', 2493, '贵阳市', 2499, '观山湖区', 'system', 'system', b'1', '2017-04-18 02:06:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2500, '开阳县', 3, 2493, '0851', '520121', 106.96943800, 27.05679300, 2492, '贵州省', 2493, '贵阳市', 2500, '开阳县', 'system', 'system', b'1', '2017-04-18 02:06:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2501, '息烽县', 3, 2493, '0851', '520122', 106.73769300, 27.09266500, 2492, '贵州省', 2493, '贵阳市', 2501, '息烽县', 'system', 'system', b'1', '2017-04-18 02:06:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2502, '修文县', 3, 2493, '0851', '520123', 106.59921800, 26.84067200, 2492, '贵州省', 2493, '贵阳市', 2502, '修文县', 'system', 'system', b'1', '2017-04-18 02:06:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2503, '清镇市', 3, 2493, '0851', '520181', 106.47027800, 26.55128900, 2492, '贵州省', 2493, '贵阳市', 2503, '清镇市', 'system', 'system', b'1', '2017-04-18 02:06:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2504, '六盘水市', 2, 2492, '0858', '520200', 104.84674300, 26.58464300, 2492, '贵州省', 2504, '六盘水市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2505, '钟山区', 3, 2504, '0858', '520201', 104.84624400, 26.58480500, 2492, '贵州省', 2504, '六盘水市', 2505, '钟山区', 'system', 'system', b'1', '2017-04-18 02:06:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2506, '六枝特区', 3, 2504, '0858', '520203', 105.47423500, 26.21066200, 2492, '贵州省', 2504, '六盘水市', 2506, '六枝特区', 'system', 'system', b'1', '2017-04-18 02:06:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2507, '水城县', 3, 2504, '0858', '520221', 104.95685000, 26.54047800, 2492, '贵州省', 2504, '六盘水市', 2507, '水城县', 'system', 'system', b'1', '2017-04-18 02:06:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2508, '盘县', 3, 2504, '0858', '520222', 104.46836700, 25.70696600, 2492, '贵州省', 2504, '六盘水市', 2508, '盘县', 'system', 'system', b'1', '2017-04-18 02:06:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2509, '遵义市', 2, 2492, '0852', '520300', 106.93726500, 27.70662600, 2492, '贵州省', 2509, '遵义市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2510, '红花岗区', 3, 2509, '0852', '520302', 106.94378400, 27.69439500, 2492, '贵州省', 2509, '遵义市', 2510, '红花岗区', 'system', 'system', b'1', '2017-04-18 02:06:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2511, '汇川区', 3, 2509, '0852', '520303', 106.93726500, 27.70662600, 2492, '贵州省', 2509, '遵义市', 2511, '汇川区', 'system', 'system', b'1', '2017-04-18 02:06:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2512, '播州区', 3, 2509, '0852', '520304', 106.83166800, 27.53528800, 2492, '贵州省', 2509, '遵义市', 2512, '播州区', 'system', 'system', b'1', '2017-04-18 02:06:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2513, '桐梓县', 3, 2509, '0852', '520322', 106.82659100, 28.13155900, 2492, '贵州省', 2509, '遵义市', 2513, '桐梓县', 'system', 'system', b'1', '2017-04-18 02:06:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2514, '绥阳县', 3, 2509, '0852', '520323', 107.19102400, 27.95134200, 2492, '贵州省', 2509, '遵义市', 2514, '绥阳县', 'system', 'system', b'1', '2017-04-18 02:06:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2515, '正安县', 3, 2509, '0852', '520324', 107.44187200, 28.55033700, 2492, '贵州省', 2509, '遵义市', 2515, '正安县', 'system', 'system', b'1', '2017-04-18 02:06:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2516, '道真仡佬族苗族自治县', 3, 2509, '0852', '520325', 107.60534200, 28.88008800, 2492, '贵州省', 2509, '遵义市', 2516, '道真仡佬族苗族自治县', 'system', 'system', b'1', '2017-04-18 02:06:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2517, '务川仡佬族苗族自治县', 3, 2509, '0852', '520326', 107.88785700, 28.52156700, 2492, '贵州省', 2509, '遵义市', 2517, '务川仡佬族苗族自治县', 'system', 'system', b'1', '2017-04-18 02:06:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2518, '凤冈县', 3, 2509, '0852', '520327', 107.72202100, 27.96085800, 2492, '贵州省', 2509, '遵义市', 2518, '凤冈县', 'system', 'system', b'1', '2017-04-18 02:06:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2519, '湄潭县', 3, 2509, '0852', '520328', 107.48572300, 27.76583900, 2492, '贵州省', 2509, '遵义市', 2519, '湄潭县', 'system', 'system', b'1', '2017-04-18 02:06:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2520, '余庆县', 3, 2509, '0852', '520329', 107.89256600, 27.22155200, 2492, '贵州省', 2509, '遵义市', 2520, '余庆县', 'system', 'system', b'1', '2017-04-18 02:06:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2521, '习水县', 3, 2509, '0852', '520330', 106.20095400, 28.32782600, 2492, '贵州省', 2509, '遵义市', 2521, '习水县', 'system', 'system', b'1', '2017-04-18 02:06:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2522, '赤水市', 3, 2509, '0852', '520381', 105.69811600, 28.58705700, 2492, '贵州省', 2509, '遵义市', 2522, '赤水市', 'system', 'system', b'1', '2017-04-18 02:06:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2523, '仁怀市', 3, 2509, '0852', '520382', 106.41247600, 27.80337700, 2492, '贵州省', 2509, '遵义市', 2523, '仁怀市', 'system', 'system', b'1', '2017-04-18 02:06:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2524, '安顺市', 2, 2492, '0853', '520400', 105.93218800, 26.24554400, 2492, '贵州省', 2524, '安顺市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2525, '西秀区', 3, 2524, '0853', '520402', 105.94616900, 26.24832300, 2492, '贵州省', 2524, '安顺市', 2525, '西秀区', 'system', 'system', b'1', '2017-04-18 02:06:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2526, '平坝区', 3, 2524, '0853', '520403', 106.25994200, 26.40608000, 2492, '贵州省', 2524, '安顺市', 2526, '平坝区', 'system', 'system', b'1', '2017-04-18 02:06:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2527, '普定县', 3, 2524, '0853', '520422', 105.74560900, 26.30579400, 2492, '贵州省', 2524, '安顺市', 2527, '普定县', 'system', 'system', b'1', '2017-04-18 02:06:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2528, '镇宁布依族苗族自治县', 3, 2524, '0853', '520423', 105.76865600, 26.05609600, 2492, '贵州省', 2524, '安顺市', 2528, '镇宁布依族苗族自治县', 'system', 'system', b'1', '2017-04-18 02:06:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2529, '关岭布依族苗族自治县', 3, 2524, '0853', '520424', 105.61845400, 25.94424800, 2492, '贵州省', 2524, '安顺市', 2529, '关岭布依族苗族自治县', 'system', 'system', b'1', '2017-04-18 02:06:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2530, '紫云苗族布依族自治县', 3, 2524, '0853', '520425', 106.08451500, 25.75156700, 2492, '贵州省', 2524, '安顺市', 2530, '紫云苗族布依族自治县', 'system', 'system', b'1', '2017-04-18 02:06:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2531, '毕节市', 2, 2492, '0857', '520500', 105.28501000, 27.30169300, 2492, '贵州省', 2531, '毕节市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2532, '七星关区', 3, 2531, '0857', '520502', 105.28485200, 27.30208500, 2492, '贵州省', 2531, '毕节市', 2532, '七星关区', 'system', 'system', b'1', '2017-04-18 02:06:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2533, '大方县', 3, 2531, '0857', '520521', 105.60925400, 27.14352100, 2492, '贵州省', 2531, '毕节市', 2533, '大方县', 'system', 'system', b'1', '2017-04-18 02:06:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2534, '黔西县', 3, 2531, '0857', '520522', 106.03829900, 27.02492300, 2492, '贵州省', 2531, '毕节市', 2534, '黔西县', 'system', 'system', b'1', '2017-04-18 02:06:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2535, '金沙县', 3, 2531, '0857', '520523', 106.22210300, 27.45969300, 2492, '贵州省', 2531, '毕节市', 2535, '金沙县', 'system', 'system', b'1', '2017-04-18 02:06:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2536, '织金县', 3, 2531, '0857', '520524', 105.76899700, 26.66849700, 2492, '贵州省', 2531, '毕节市', 2536, '织金县', 'system', 'system', b'1', '2017-04-18 02:06:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2537, '纳雍县', 3, 2531, '0857', '520525', 105.37532200, 26.76987500, 2492, '贵州省', 2531, '毕节市', 2537, '纳雍县', 'system', 'system', b'1', '2017-04-18 02:06:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2538, '威宁彝族回族苗族自治县', 3, 2531, '0857', '520526', 104.28652300, 26.85909900, 2492, '贵州省', 2531, '毕节市', 2538, '威宁彝族回族苗族自治县', 'system', 'system', b'1', '2017-04-18 02:06:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2539, '赫章县', 3, 2531, '0857', '520527', 104.72643800, 27.11924300, 2492, '贵州省', 2531, '毕节市', 2539, '赫章县', 'system', 'system', b'1', '2017-04-18 02:06:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2540, '铜仁市', 2, 2492, '0856', '520600', 109.19155500, 27.71834600, 2492, '贵州省', 2540, '铜仁市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2541, '碧江区', 3, 2540, '0856', '520602', 109.19211700, 27.71874500, 2492, '贵州省', 2540, '铜仁市', 2541, '碧江区', 'system', 'system', b'1', '2017-04-18 02:06:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2542, '万山区', 3, 2540, '0856', '520603', 109.21199000, 27.51903000, 2492, '贵州省', 2540, '铜仁市', 2542, '万山区', 'system', 'system', b'1', '2017-04-18 02:06:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2543, '江口县', 3, 2540, '0856', '520621', 108.84842700, 27.69190400, 2492, '贵州省', 2540, '铜仁市', 2543, '江口县', 'system', 'system', b'1', '2017-04-18 02:06:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2544, '玉屏侗族自治县', 3, 2540, '0856', '520622', 108.91788200, 27.23802400, 2492, '贵州省', 2540, '铜仁市', 2544, '玉屏侗族自治县', 'system', 'system', b'1', '2017-04-18 02:06:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2545, '石阡县', 3, 2540, '0856', '520623', 108.22985400, 27.51938600, 2492, '贵州省', 2540, '铜仁市', 2545, '石阡县', 'system', 'system', b'1', '2017-04-18 02:06:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2546, '思南县', 3, 2540, '0856', '520624', 108.25582700, 27.94133100, 2492, '贵州省', 2540, '铜仁市', 2546, '思南县', 'system', 'system', b'1', '2017-04-18 02:06:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2547, '印江土家族苗族自治县', 3, 2540, '0856', '520625', 108.40551700, 27.99797600, 2492, '贵州省', 2540, '铜仁市', 2547, '印江土家族苗族自治县', 'system', 'system', b'1', '2017-04-18 02:06:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2548, '德江县', 3, 2540, '0856', '520626', 108.11731700, 28.26094000, 2492, '贵州省', 2540, '铜仁市', 2548, '德江县', 'system', 'system', b'1', '2017-04-18 02:06:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2549, '沿河土家族自治县', 3, 2540, '0856', '520627', 108.49574600, 28.56048700, 2492, '贵州省', 2540, '铜仁市', 2549, '沿河土家族自治县', 'system', 'system', b'1', '2017-04-18 02:06:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2550, '松桃苗族自治县', 3, 2540, '0856', '520628', 109.20262700, 28.16541900, 2492, '贵州省', 2540, '铜仁市', 2550, '松桃苗族自治县', 'system', 'system', b'1', '2017-04-18 02:06:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2551, '黔西南布依族苗族自治州', 2, 2492, '0859', '522300', 104.89797100, 25.08812000, 2492, '贵州省', 2551, '黔西南布依族苗族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2552, '兴义市', 3, 2551, '0859', '522301', 104.89798200, 25.08859900, 2492, '贵州省', 2551, '黔西南布依族苗族自治州', 2552, '兴义市', 'system', 'system', b'1', '2017-04-18 02:06:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2553, '兴仁县', 3, 2551, '0859', '522322', 105.19277800, 25.43137800, 2492, '贵州省', 2551, '黔西南布依族苗族自治州', 2553, '兴仁县', 'system', 'system', b'1', '2017-04-18 02:06:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2554, '普安县', 3, 2551, '0859', '522323', 104.95534700, 25.78640400, 2492, '贵州省', 2551, '黔西南布依族苗族自治州', 2554, '普安县', 'system', 'system', b'1', '2017-04-18 02:06:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2555, '晴隆县', 3, 2551, '0859', '522324', 105.21877300, 25.83288100, 2492, '贵州省', 2551, '黔西南布依族苗族自治州', 2555, '晴隆县', 'system', 'system', b'1', '2017-04-18 02:06:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2556, '贞丰县', 3, 2551, '0859', '522325', 105.65013300, 25.38575200, 2492, '贵州省', 2551, '黔西南布依族苗族自治州', 2556, '贞丰县', 'system', 'system', b'1', '2017-04-18 02:06:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2557, '望谟县', 3, 2551, '0859', '522326', 106.09156300, 25.16666700, 2492, '贵州省', 2551, '黔西南布依族苗族自治州', 2557, '望谟县', 'system', 'system', b'1', '2017-04-18 02:06:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2558, '册亨县', 3, 2551, '0859', '522327', 105.81241000, 24.98333800, 2492, '贵州省', 2551, '黔西南布依族苗族自治州', 2558, '册亨县', 'system', 'system', b'1', '2017-04-18 02:06:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2559, '安龙县', 3, 2551, '0859', '522328', 105.47149800, 25.10895900, 2492, '贵州省', 2551, '黔西南布依族苗族自治州', 2559, '安龙县', 'system', 'system', b'1', '2017-04-18 02:06:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2560, '黔东南苗族侗族自治州', 2, 2492, '0855', '522600', 107.97748800, 26.58335200, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2561, '凯里市', 3, 2560, '0855', '522601', 107.97754100, 26.58296400, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2561, '凯里市', 'system', 'system', b'1', '2017-04-18 02:06:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2562, '黄平县', 3, 2560, '0855', '522622', 107.90133700, 26.89697300, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2562, '黄平县', 'system', 'system', b'1', '2017-04-18 02:06:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2563, '施秉县', 3, 2560, '0855', '522623', 108.12678000, 27.03465700, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2563, '施秉县', 'system', 'system', b'1', '2017-04-18 02:06:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2564, '三穗县', 3, 2560, '0855', '522624', 108.68112100, 26.95988400, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2564, '三穗县', 'system', 'system', b'1', '2017-04-18 02:06:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2565, '镇远县', 3, 2560, '0855', '522625', 108.42365600, 27.05023300, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2565, '镇远县', 'system', 'system', b'1', '2017-04-18 02:06:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2566, '岑巩县', 3, 2560, '0855', '522626', 108.81645900, 27.17324400, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2566, '岑巩县', 'system', 'system', b'1', '2017-04-18 02:06:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2567, '天柱县', 3, 2560, '0855', '522627', 109.21279800, 26.90968400, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2567, '天柱县', 'system', 'system', b'1', '2017-04-18 02:06:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2568, '锦屏县', 3, 2560, '0855', '522628', 109.20252000, 26.68062500, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2568, '锦屏县', 'system', 'system', b'1', '2017-04-18 02:06:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2569, '剑河县', 3, 2560, '0855', '522629', 108.44049900, 26.72734900, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2569, '剑河县', 'system', 'system', b'1', '2017-04-18 02:06:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2570, '台江县', 3, 2560, '0855', '522630', 108.31463700, 26.66913800, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2570, '台江县', 'system', 'system', b'1', '2017-04-18 02:06:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2571, '黎平县', 3, 2560, '0855', '522631', 109.13650400, 26.23063600, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2571, '黎平县', 'system', 'system', b'1', '2017-04-18 02:06:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2572, '榕江县', 3, 2560, '0855', '522632', 108.52102600, 25.93108500, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2572, '榕江县', 'system', 'system', b'1', '2017-04-18 02:06:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2573, '从江县', 3, 2560, '0855', '522633', 108.91264800, 25.74705800, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2573, '从江县', 'system', 'system', b'1', '2017-04-18 02:06:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2574, '雷山县', 3, 2560, '0855', '522634', 108.07961300, 26.38102700, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2574, '雷山县', 'system', 'system', b'1', '2017-04-18 02:06:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2575, '麻江县', 3, 2560, '0855', '522635', 107.59317200, 26.49480300, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2575, '麻江县', 'system', 'system', b'1', '2017-04-18 02:06:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2576, '丹寨县', 3, 2560, '0855', '522636', 107.79480800, 26.19949700, 2492, '贵州省', 2560, '黔东南苗族侗族自治州', 2576, '丹寨县', 'system', 'system', b'1', '2017-04-18 02:06:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2577, '黔南布依族苗族自治州', 2, 2492, '0854', '522700', 107.51715600, 26.25821900, 2492, '贵州省', 2577, '黔南布依族苗族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:06:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2578, '都匀市', 3, 2577, '0854', '522701', 107.51702100, 26.25820500, 2492, '贵州省', 2577, '黔南布依族苗族自治州', 2578, '都匀市', 'system', 'system', b'1', '2017-04-18 02:07:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2579, '福泉市', 3, 2577, '0854', '522702', 107.51350800, 26.70250800, 2492, '贵州省', 2577, '黔南布依族苗族自治州', 2579, '福泉市', 'system', 'system', b'1', '2017-04-18 02:07:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2580, '荔波县', 3, 2577, '0854', '522722', 107.88380000, 25.41223900, 2492, '贵州省', 2577, '黔南布依族苗族自治州', 2580, '荔波县', 'system', 'system', b'1', '2017-04-18 02:07:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2581, '贵定县', 3, 2577, '0854', '522723', 107.23358800, 26.58080700, 2492, '贵州省', 2577, '黔南布依族苗族自治州', 2581, '贵定县', 'system', 'system', b'1', '2017-04-18 02:07:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2582, '瓮安县', 3, 2577, '0854', '522725', 107.47841700, 27.06633900, 2492, '贵州省', 2577, '黔南布依族苗族自治州', 2582, '瓮安县', 'system', 'system', b'1', '2017-04-18 02:07:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2583, '独山县', 3, 2577, '0854', '522726', 107.54275700, 25.82628300, 2492, '贵州省', 2577, '黔南布依族苗族自治州', 2583, '独山县', 'system', 'system', b'1', '2017-04-18 02:07:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2584, '平塘县', 3, 2577, '0854', '522727', 107.32405000, 25.83180300, 2492, '贵州省', 2577, '黔南布依族苗族自治州', 2584, '平塘县', 'system', 'system', b'1', '2017-04-18 02:07:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2585, '罗甸县', 3, 2577, '0854', '522728', 106.75000600, 25.42989400, 2492, '贵州省', 2577, '黔南布依族苗族自治州', 2585, '罗甸县', 'system', 'system', b'1', '2017-04-18 02:07:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2586, '长顺县', 3, 2577, '0854', '522729', 106.44737600, 26.02211600, 2492, '贵州省', 2577, '黔南布依族苗族自治州', 2586, '长顺县', 'system', 'system', b'1', '2017-04-18 02:07:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2587, '龙里县', 3, 2577, '0854', '522730', 106.97773300, 26.44880900, 2492, '贵州省', 2577, '黔南布依族苗族自治州', 2587, '龙里县', 'system', 'system', b'1', '2017-04-18 02:07:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2588, '惠水县', 3, 2577, '0854', '522731', 106.65784800, 26.12863700, 2492, '贵州省', 2577, '黔南布依族苗族自治州', 2588, '惠水县', 'system', 'system', b'1', '2017-04-18 02:07:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2589, '三都水族自治县', 3, 2577, '0854', '522732', 107.87747000, 25.98518300, 2492, '贵州省', 2577, '黔南布依族苗族自治州', 2589, '三都水族自治县', 'system', 'system', b'1', '2017-04-18 02:07:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2590, '云南省', 1, 1, NULL, '530000', 102.71225100, 25.04060900, 2590, '云南省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2591, '昆明市', 2, 2590, '0871', '530100', 102.71225100, 25.04060900, 2590, '云南省', 2591, '昆明市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2592, '五华区', 3, 2591, '0871', '530102', 102.70441200, 25.04216500, 2590, '云南省', 2591, '昆明市', 2592, '五华区', 'system', 'system', b'1', '2017-04-18 02:07:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2593, '盘龙区', 3, 2591, '0871', '530103', 102.72904400, 25.07023900, 2590, '云南省', 2591, '昆明市', 2593, '盘龙区', 'system', 'system', b'1', '2017-04-18 02:07:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2594, '官渡区', 3, 2591, '0871', '530111', 102.72343700, 25.02121100, 2590, '云南省', 2591, '昆明市', 2594, '官渡区', 'system', 'system', b'1', '2017-04-18 02:07:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2595, '西山区', 3, 2591, '0871', '530112', 102.70590400, 25.02436000, 2590, '云南省', 2591, '昆明市', 2595, '西山区', 'system', 'system', b'1', '2017-04-18 02:07:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2596, '东川区', 3, 2591, '0871', '530113', 103.18200000, 26.08349000, 2590, '云南省', 2591, '昆明市', 2596, '东川区', 'system', 'system', b'1', '2017-04-18 02:07:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2597, '呈贡区', 3, 2591, '0871', '530114', 102.80138200, 24.88927500, 2590, '云南省', 2591, '昆明市', 2597, '呈贡区', 'system', 'system', b'1', '2017-04-18 02:07:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2598, '晋宁县', 3, 2591, '0871', '530122', 102.59498700, 24.66694400, 2590, '云南省', 2591, '昆明市', 2598, '晋宁县', 'system', 'system', b'1', '2017-04-18 02:07:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2599, '富民县', 3, 2591, '0871', '530124', 102.49788800, 25.21966700, 2590, '云南省', 2591, '昆明市', 2599, '富民县', 'system', 'system', b'1', '2017-04-18 02:07:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2600, '宜良县', 3, 2591, '0871', '530125', 103.14598900, 24.91821500, 2590, '云南省', 2591, '昆明市', 2600, '宜良县', 'system', 'system', b'1', '2017-04-18 02:07:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2601, '石林彝族自治县', 3, 2591, '0871', '530126', 103.27196200, 24.75454500, 2590, '云南省', 2591, '昆明市', 2601, '石林彝族自治县', 'system', 'system', b'1', '2017-04-18 02:07:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2602, '嵩明县', 3, 2591, '0871', '530127', 103.03877700, 25.33508700, 2590, '云南省', 2591, '昆明市', 2602, '嵩明县', 'system', 'system', b'1', '2017-04-18 02:07:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2603, '禄劝彝族苗族自治县', 3, 2591, '0871', '530128', 102.46905000, 25.55653300, 2590, '云南省', 2591, '昆明市', 2603, '禄劝彝族苗族自治县', 'system', 'system', b'1', '2017-04-18 02:07:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2604, '寻甸回族彝族自治县', 3, 2591, '0871', '530129', 103.25758800, 25.55947400, 2590, '云南省', 2591, '昆明市', 2604, '寻甸回族彝族自治县', 'system', 'system', b'1', '2017-04-18 02:07:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2605, '安宁市', 3, 2591, '0871', '530181', 102.48554400, 24.92178500, 2590, '云南省', 2591, '昆明市', 2605, '安宁市', 'system', 'system', b'1', '2017-04-18 02:07:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2606, '曲靖市', 2, 2590, '0874', '530300', 103.79785100, 25.50155700, 2590, '云南省', 2606, '曲靖市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2607, '麒麟区', 3, 2606, '0874', '530302', 103.79805400, 25.50126900, 2590, '云南省', 2606, '曲靖市', 2607, '麒麟区', 'system', 'system', b'1', '2017-04-18 02:07:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2608, '马龙县', 3, 2606, '0874', '530321', 103.57875500, 25.42945100, 2590, '云南省', 2606, '曲靖市', 2608, '马龙县', 'system', 'system', b'1', '2017-04-18 02:07:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2609, '陆良县', 3, 2606, '0874', '530322', 103.65523300, 25.02287800, 2590, '云南省', 2606, '曲靖市', 2609, '陆良县', 'system', 'system', b'1', '2017-04-18 02:07:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2610, '师宗县', 3, 2606, '0874', '530323', 103.99380800, 24.82568100, 2590, '云南省', 2606, '曲靖市', 2610, '师宗县', 'system', 'system', b'1', '2017-04-18 02:07:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2611, '罗平县', 3, 2606, '0874', '530324', 104.30926300, 24.88570800, 2590, '云南省', 2606, '曲靖市', 2611, '罗平县', 'system', 'system', b'1', '2017-04-18 02:07:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2612, '富源县', 3, 2606, '0874', '530325', 104.25692000, 25.67064000, 2590, '云南省', 2606, '曲靖市', 2612, '富源县', 'system', 'system', b'1', '2017-04-18 02:07:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2613, '会泽县', 3, 2606, '0874', '530326', 103.30004100, 26.41286100, 2590, '云南省', 2606, '曲靖市', 2613, '会泽县', 'system', 'system', b'1', '2017-04-18 02:07:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2614, '沾益区', 3, 2606, '0874', '530303', 103.81926200, 25.60087800, 2590, '云南省', 2606, '曲靖市', 2614, '沾益区', 'system', 'system', b'1', '2017-04-18 02:07:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2615, '宣威市', 3, 2606, '0874', '530381', 104.09554000, 26.22777700, 2590, '云南省', 2606, '曲靖市', 2615, '宣威市', 'system', 'system', b'1', '2017-04-18 02:07:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2616, '玉溪市', 2, 2590, '0877', '530400', 102.54390700, 24.35046100, 2590, '云南省', 2616, '玉溪市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2617, '红塔区', 3, 2616, '0877', '530402', 102.54346800, 24.35075300, 2590, '云南省', 2616, '玉溪市', 2617, '红塔区', 'system', 'system', b'1', '2017-04-18 02:07:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2618, '江川区', 3, 2616, '0877', '530403', 102.74983900, 24.29100600, 2590, '云南省', 2616, '玉溪市', 2618, '江川区', 'system', 'system', b'1', '2017-04-18 02:07:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2619, '澄江县', 3, 2616, '0877', '530422', 102.91665200, 24.66967900, 2590, '云南省', 2616, '玉溪市', 2619, '澄江县', 'system', 'system', b'1', '2017-04-18 02:07:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2620, '通海县', 3, 2616, '0877', '530423', 102.76003900, 24.11220500, 2590, '云南省', 2616, '玉溪市', 2620, '通海县', 'system', 'system', b'1', '2017-04-18 02:07:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2621, '华宁县', 3, 2616, '0877', '530424', 102.92898200, 24.18980700, 2590, '云南省', 2616, '玉溪市', 2621, '华宁县', 'system', 'system', b'1', '2017-04-18 02:07:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2622, '易门县', 3, 2616, '0877', '530425', 102.16211000, 24.66959800, 2590, '云南省', 2616, '玉溪市', 2622, '易门县', 'system', 'system', b'1', '2017-04-18 02:07:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2623, '峨山彝族自治县', 3, 2616, '0877', '530426', 102.40435800, 24.17325600, 2590, '云南省', 2616, '玉溪市', 2623, '峨山彝族自治县', 'system', 'system', b'1', '2017-04-18 02:07:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2624, '新平彝族傣族自治县', 3, 2616, '0877', '530427', 101.99090300, 24.06640000, 2590, '云南省', 2616, '玉溪市', 2624, '新平彝族傣族自治县', 'system', 'system', b'1', '2017-04-18 02:07:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2625, '元江哈尼族彝族傣族自治县', 3, 2616, '0877', '530428', 101.99965800, 23.59761800, 2590, '云南省', 2616, '玉溪市', 2625, '元江哈尼族彝族傣族自治县', 'system', 'system', b'1', '2017-04-18 02:07:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2626, '保山市', 2, 2590, '0875', '530500', 99.16713300, 25.11180200, 2590, '云南省', 2626, '保山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2627, '隆阳区', 3, 2626, '0875', '530502', 99.16582500, 25.11214400, 2590, '云南省', 2626, '保山市', 2627, '隆阳区', 'system', 'system', b'1', '2017-04-18 02:07:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2628, '施甸县', 3, 2626, '0875', '530521', 99.18375800, 24.73084700, 2590, '云南省', 2626, '保山市', 2628, '施甸县', 'system', 'system', b'1', '2017-04-18 02:07:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2629, '腾冲市', 3, 2626, '0875', '530581', 98.49729200, 25.01757000, 2590, '云南省', 2626, '保山市', 2629, '腾冲市', 'system', 'system', b'1', '2017-04-18 02:07:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2630, '龙陵县', 3, 2626, '0875', '530523', 98.69356700, 24.59191200, 2590, '云南省', 2626, '保山市', 2630, '龙陵县', 'system', 'system', b'1', '2017-04-18 02:07:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2631, '昌宁县', 3, 2626, '0875', '530524', 99.61234400, 24.82366200, 2590, '云南省', 2626, '保山市', 2631, '昌宁县', 'system', 'system', b'1', '2017-04-18 02:07:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2632, '昭通市', 2, 2590, '0870', '530600', 103.71721600, 27.33699900, 2590, '云南省', 2632, '昭通市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2633, '昭阳区', 3, 2632, '0870', '530602', 103.71726700, 27.33663600, 2590, '云南省', 2632, '昭通市', 2633, '昭阳区', 'system', 'system', b'1', '2017-04-18 02:07:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2634, '鲁甸县', 3, 2632, '0870', '530621', 103.54933300, 27.19163700, 2590, '云南省', 2632, '昭通市', 2634, '鲁甸县', 'system', 'system', b'1', '2017-04-18 02:07:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2635, '巧家县', 3, 2632, '0870', '530622', 102.92928400, 26.91170000, 2590, '云南省', 2632, '昭通市', 2635, '巧家县', 'system', 'system', b'1', '2017-04-18 02:07:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2636, '盐津县', 3, 2632, '0870', '530623', 104.23506000, 28.10692300, 2590, '云南省', 2632, '昭通市', 2636, '盐津县', 'system', 'system', b'1', '2017-04-18 02:07:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2637, '大关县', 3, 2632, '0870', '530624', 103.89160800, 27.74711400, 2590, '云南省', 2632, '昭通市', 2637, '大关县', 'system', 'system', b'1', '2017-04-18 02:07:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2638, '永善县', 3, 2632, '0870', '530625', 103.63732000, 28.23152600, 2590, '云南省', 2632, '昭通市', 2638, '永善县', 'system', 'system', b'1', '2017-04-18 02:07:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2639, '绥江县', 3, 2632, '0870', '530626', 103.96109500, 28.59995300, 2590, '云南省', 2632, '昭通市', 2639, '绥江县', 'system', 'system', b'1', '2017-04-18 02:07:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2640, '镇雄县', 3, 2632, '0870', '530627', 104.87305500, 27.43626700, 2590, '云南省', 2632, '昭通市', 2640, '镇雄县', 'system', 'system', b'1', '2017-04-18 02:07:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2641, '彝良县', 3, 2632, '0870', '530628', 104.04849200, 27.62742500, 2590, '云南省', 2632, '昭通市', 2641, '彝良县', 'system', 'system', b'1', '2017-04-18 02:07:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2642, '威信县', 3, 2632, '0870', '530629', 105.04869000, 27.84338100, 2590, '云南省', 2632, '昭通市', 2642, '威信县', 'system', 'system', b'1', '2017-04-18 02:07:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2643, '水富县', 3, 2632, '0870', '530630', 104.41537600, 28.62968800, 2590, '云南省', 2632, '昭通市', 2643, '水富县', 'system', 'system', b'1', '2017-04-18 02:07:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2644, '丽江市', 2, 2590, '0888', '530700', 100.23302600, 26.87210800, 2590, '云南省', 2644, '丽江市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2645, '古城区', 3, 2644, '0888', '530702', 100.23441200, 26.87222900, 2590, '云南省', 2644, '丽江市', 2645, '古城区', 'system', 'system', b'1', '2017-04-18 02:07:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2646, '玉龙纳西族自治县', 3, 2644, '0888', '530721', 100.23831200, 26.83059300, 2590, '云南省', 2644, '丽江市', 2646, '玉龙纳西族自治县', 'system', 'system', b'1', '2017-04-18 02:07:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2647, '永胜县', 3, 2644, '0888', '530722', 100.75090100, 26.68562300, 2590, '云南省', 2644, '丽江市', 2647, '永胜县', 'system', 'system', b'1', '2017-04-18 02:07:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2648, '华坪县', 3, 2644, '0888', '530723', 101.26779600, 26.62883400, 2590, '云南省', 2644, '丽江市', 2648, '华坪县', 'system', 'system', b'1', '2017-04-18 02:07:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2649, '宁蒗彝族自治县', 3, 2644, '0888', '530724', 100.85242700, 27.28110900, 2590, '云南省', 2644, '丽江市', 2649, '宁蒗彝族自治县', 'system', 'system', b'1', '2017-04-18 02:07:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2650, '普洱市', 2, 2590, '0879', '530800', 100.97234400, 22.77732100, 2590, '云南省', 2650, '普洱市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2651, '思茅区', 3, 2650, '0879', '530802', 100.97322700, 22.77659500, 2590, '云南省', 2650, '普洱市', 2651, '思茅区', 'system', 'system', b'1', '2017-04-18 02:07:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2652, '宁洱哈尼族彝族自治县', 3, 2650, '0879', '530821', 101.04524000, 23.06250700, 2590, '云南省', 2650, '普洱市', 2652, '宁洱哈尼族彝族自治县', 'system', 'system', b'1', '2017-04-18 02:07:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2653, '墨江哈尼族自治县', 3, 2650, '0879', '530822', 101.68760600, 23.42816500, 2590, '云南省', 2650, '普洱市', 2653, '墨江哈尼族自治县', 'system', 'system', b'1', '2017-04-18 02:07:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2654, '景东彝族自治县', 3, 2650, '0879', '530823', 100.84001100, 24.44852300, 2590, '云南省', 2650, '普洱市', 2654, '景东彝族自治县', 'system', 'system', b'1', '2017-04-18 02:07:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2655, '景谷傣族彝族自治县', 3, 2650, '0879', '530824', 100.70142500, 23.50027800, 2590, '云南省', 2650, '普洱市', 2655, '景谷傣族彝族自治县', 'system', 'system', b'1', '2017-04-18 02:07:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2656, '镇沅彝族哈尼族拉祜族自治县', 3, 2650, '0879', '530825', 101.10851200, 24.00571200, 2590, '云南省', 2650, '普洱市', 2656, '镇沅彝族哈尼族拉祜族自治县', 'system', 'system', b'1', '2017-04-18 02:07:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2657, '江城哈尼族彝族自治县', 3, 2650, '0879', '530826', 101.85914400, 22.58336000, 2590, '云南省', 2650, '普洱市', 2657, '江城哈尼族彝族自治县', 'system', 'system', b'1', '2017-04-18 02:07:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2658, '孟连傣族拉祜族佤族自治县', 3, 2650, '0879', '530827', 99.58540600, 22.32592400, 2590, '云南省', 2650, '普洱市', 2658, '孟连傣族拉祜族佤族自治县', 'system', 'system', b'1', '2017-04-18 02:07:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2659, '澜沧拉祜族自治县', 3, 2650, '0879', '530828', 99.93120100, 22.55308300, 2590, '云南省', 2650, '普洱市', 2659, '澜沧拉祜族自治县', 'system', 'system', b'1', '2017-04-18 02:07:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2660, '西盟佤族自治县', 3, 2650, '0879', '530829', 99.59437200, 22.64442300, 2590, '云南省', 2650, '普洱市', 2660, '西盟佤族自治县', 'system', 'system', b'1', '2017-04-18 02:07:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2661, '临沧市', 2, 2590, '0883', '530900', 100.08697000, 23.88656700, 2590, '云南省', 2661, '临沧市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2662, '临翔区', 3, 2661, '0883', '530902', 100.08648600, 23.88656200, 2590, '云南省', 2661, '临沧市', 2662, '临翔区', 'system', 'system', b'1', '2017-04-18 02:07:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2663, '凤庆县', 3, 2661, '0883', '530921', 99.91871000, 24.59273800, 2590, '云南省', 2661, '临沧市', 2663, '凤庆县', 'system', 'system', b'1', '2017-04-18 02:07:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2664, '云县', 3, 2661, '0883', '530922', 100.12563700, 24.43902600, 2590, '云南省', 2661, '临沧市', 2664, '云县', 'system', 'system', b'1', '2017-04-18 02:07:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2665, '永德县', 3, 2661, '0883', '530923', 99.25367900, 24.02815900, 2590, '云南省', 2661, '临沧市', 2665, '永德县', 'system', 'system', b'1', '2017-04-18 02:07:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2666, '镇康县', 3, 2661, '0883', '530924', 98.82743000, 23.76141500, 2590, '云南省', 2661, '临沧市', 2666, '镇康县', 'system', 'system', b'1', '2017-04-18 02:07:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2667, '双江拉祜族佤族布朗族傣族自治县', 3, 2661, '0883', '530925', 99.82441900, 23.47747600, 2590, '云南省', 2661, '临沧市', 2667, '双江拉祜族佤族布朗族傣族自治县', 'system', 'system', b'1', '2017-04-18 02:07:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2668, '耿马傣族佤族自治县', 3, 2661, '0883', '530926', 99.40249500, 23.53457900, 2590, '云南省', 2661, '临沧市', 2668, '耿马傣族佤族自治县', 'system', 'system', b'1', '2017-04-18 02:07:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2669, '沧源佤族自治县', 3, 2661, '0883', '530927', 99.24740000, 23.14688700, 2590, '云南省', 2661, '临沧市', 2669, '沧源佤族自治县', 'system', 'system', b'1', '2017-04-18 02:07:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2670, '楚雄彝族自治州', 2, 2590, '0878', '532300', 101.54604600, 25.04198800, 2590, '云南省', 2670, '楚雄彝族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2671, '楚雄市', 3, 2670, '0878', '532301', 101.54614500, 25.04091200, 2590, '云南省', 2670, '楚雄彝族自治州', 2671, '楚雄市', 'system', 'system', b'1', '2017-04-18 02:07:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2672, '双柏县', 3, 2670, '0878', '532322', 101.63824000, 24.68509400, 2590, '云南省', 2670, '楚雄彝族自治州', 2672, '双柏县', 'system', 'system', b'1', '2017-04-18 02:07:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2673, '牟定县', 3, 2670, '0878', '532323', 101.54304400, 25.31211100, 2590, '云南省', 2670, '楚雄彝族自治州', 2673, '牟定县', 'system', 'system', b'1', '2017-04-18 02:07:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2674, '南华县', 3, 2670, '0878', '532324', 101.27499100, 25.19240800, 2590, '云南省', 2670, '楚雄彝族自治州', 2674, '南华县', 'system', 'system', b'1', '2017-04-18 02:07:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2675, '姚安县', 3, 2670, '0878', '532325', 101.23839900, 25.50540300, 2590, '云南省', 2670, '楚雄彝族自治州', 2675, '姚安县', 'system', 'system', b'1', '2017-04-18 02:07:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2676, '大姚县', 3, 2670, '0878', '532326', 101.32360200, 25.72234800, 2590, '云南省', 2670, '楚雄彝族自治州', 2676, '大姚县', 'system', 'system', b'1', '2017-04-18 02:07:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2677, '永仁县', 3, 2670, '0878', '532327', 101.67117500, 26.05631600, 2590, '云南省', 2670, '楚雄彝族自治州', 2677, '永仁县', 'system', 'system', b'1', '2017-04-18 02:07:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2678, '元谋县', 3, 2670, '0878', '532328', 101.87083700, 25.70331300, 2590, '云南省', 2670, '楚雄彝族自治州', 2678, '元谋县', 'system', 'system', b'1', '2017-04-18 02:07:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2679, '武定县', 3, 2670, '0878', '532329', 102.40678500, 25.53010000, 2590, '云南省', 2670, '楚雄彝族自治州', 2679, '武定县', 'system', 'system', b'1', '2017-04-18 02:07:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2680, '禄丰县', 3, 2670, '0878', '532331', 102.07569400, 25.14327000, 2590, '云南省', 2670, '楚雄彝族自治州', 2680, '禄丰县', 'system', 'system', b'1', '2017-04-18 02:07:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2681, '红河哈尼族彝族自治州', 2, 2590, '0873', '532500', 103.38418200, 23.36677500, 2590, '云南省', 2681, '红河哈尼族彝族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2682, '个旧市', 3, 2681, '0873', '532501', 103.15475200, 23.36038300, 2590, '云南省', 2681, '红河哈尼族彝族自治州', 2682, '个旧市', 'system', 'system', b'1', '2017-04-18 02:07:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2683, '开远市', 3, 2681, '0873', '532502', 103.25867900, 23.71383200, 2590, '云南省', 2681, '红河哈尼族彝族自治州', 2683, '开远市', 'system', 'system', b'1', '2017-04-18 02:07:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2684, '蒙自市', 3, 2681, '0873', '532503', 103.38500500, 23.36684300, 2590, '云南省', 2681, '红河哈尼族彝族自治州', 2684, '蒙自市', 'system', 'system', b'1', '2017-04-18 02:07:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2685, '弥勒市', 3, 2681, '0873', '532504', 103.43698800, 24.40837000, 2590, '云南省', 2681, '红河哈尼族彝族自治州', 2685, '弥勒市', 'system', 'system', b'1', '2017-04-18 02:07:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2686, '屏边苗族自治县', 3, 2681, '0873', '532523', 103.68722900, 22.98701300, 2590, '云南省', 2681, '红河哈尼族彝族自治州', 2686, '屏边苗族自治县', 'system', 'system', b'1', '2017-04-18 02:07:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2687, '建水县', 3, 2681, '0873', '532524', 102.82049300, 23.61838700, 2590, '云南省', 2681, '红河哈尼族彝族自治州', 2687, '建水县', 'system', 'system', b'1', '2017-04-18 02:07:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2688, '石屏县', 3, 2681, '0873', '532525', 102.48446900, 23.71256900, 2590, '云南省', 2681, '红河哈尼族彝族自治州', 2688, '石屏县', 'system', 'system', b'1', '2017-04-18 02:07:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2689, '泸西县', 3, 2681, '0873', '532527', 103.75962200, 24.53236800, 2590, '云南省', 2681, '红河哈尼族彝族自治州', 2689, '泸西县', 'system', 'system', b'1', '2017-04-18 02:07:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2690, '元阳县', 3, 2681, '0873', '532528', 102.83705600, 23.21977300, 2590, '云南省', 2681, '红河哈尼族彝族自治州', 2690, '元阳县', 'system', 'system', b'1', '2017-04-18 02:07:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2691, '红河县', 3, 2681, '0873', '532529', 102.42121000, 23.36919100, 2590, '云南省', 2681, '红河哈尼族彝族自治州', 2691, '红河县', 'system', 'system', b'1', '2017-04-18 02:07:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2692, '金平苗族瑶族傣族自治县', 3, 2681, '0873', '532530', 103.22835900, 22.77998200, 2590, '云南省', 2681, '红河哈尼族彝族自治州', 2692, '金平苗族瑶族傣族自治县', 'system', 'system', b'1', '2017-04-18 02:07:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2693, '绿春县', 3, 2681, '0873', '532531', 102.39286000, 22.99352000, 2590, '云南省', 2681, '红河哈尼族彝族自治州', 2693, '绿春县', 'system', 'system', b'1', '2017-04-18 02:07:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2694, '河口瑶族自治县', 3, 2681, '0873', '532532', 103.96159300, 22.50756300, 2590, '云南省', 2681, '红河哈尼族彝族自治州', 2694, '河口瑶族自治县', 'system', 'system', b'1', '2017-04-18 02:07:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2695, '文山壮族苗族自治州', 2, 2590, '0876', '532600', 104.24401000, 23.36951000, 2590, '云南省', 2695, '文山壮族苗族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2696, '文山市', 3, 2695, '0876', '532601', 104.24427700, 23.36921600, 2590, '云南省', 2695, '文山壮族苗族自治州', 2696, '文山市', 'system', 'system', b'1', '2017-04-18 02:07:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2697, '砚山县', 3, 2695, '0876', '532622', 104.34398900, 23.61230100, 2590, '云南省', 2695, '文山壮族苗族自治州', 2697, '砚山县', 'system', 'system', b'1', '2017-04-18 02:07:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2698, '西畴县', 3, 2695, '0876', '532623', 104.67571100, 23.43743900, 2590, '云南省', 2695, '文山壮族苗族自治州', 2698, '西畴县', 'system', 'system', b'1', '2017-04-18 02:07:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2699, '麻栗坡县', 3, 2695, '0876', '532624', 104.70189900, 23.12420200, 2590, '云南省', 2695, '文山壮族苗族自治州', 2699, '麻栗坡县', 'system', 'system', b'1', '2017-04-18 02:07:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2700, '马关县', 3, 2695, '0876', '532625', 104.39861900, 23.01172300, 2590, '云南省', 2695, '文山壮族苗族自治州', 2700, '马关县', 'system', 'system', b'1', '2017-04-18 02:07:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2701, '丘北县', 3, 2695, '0876', '532626', 104.19436600, 24.04098200, 2590, '云南省', 2695, '文山壮族苗族自治州', 2701, '丘北县', 'system', 'system', b'1', '2017-04-18 02:07:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2702, '广南县', 3, 2695, '0876', '532627', 105.05668400, 24.05027200, 2590, '云南省', 2695, '文山壮族苗族自治州', 2702, '广南县', 'system', 'system', b'1', '2017-04-18 02:07:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2703, '富宁县', 3, 2695, '0876', '532628', 105.62856000, 23.62649400, 2590, '云南省', 2695, '文山壮族苗族自治州', 2703, '富宁县', 'system', 'system', b'1', '2017-04-18 02:07:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2704, '西双版纳傣族自治州', 2, 2590, '0691', '532800', 100.79794100, 22.00172400, 2590, '云南省', 2704, '西双版纳傣族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2705, '景洪市', 3, 2704, '0691', '532801', 100.79794700, 22.00208700, 2590, '云南省', 2704, '西双版纳傣族自治州', 2705, '景洪市', 'system', 'system', b'1', '2017-04-18 02:07:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2706, '勐海县', 3, 2704, '0691', '532822', 100.44828800, 21.95586600, 2590, '云南省', 2704, '西双版纳傣族自治州', 2706, '勐海县', 'system', 'system', b'1', '2017-04-18 02:07:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2707, '勐腊县', 3, 2704, '0691', '532823', 101.56705100, 21.47944900, 2590, '云南省', 2704, '西双版纳傣族自治州', 2707, '勐腊县', 'system', 'system', b'1', '2017-04-18 02:07:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2708, '大理白族自治州', 2, 2590, '0872', '532900', 100.22566800, 25.58944900, 2590, '云南省', 2708, '大理白族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2709, '大理市', 3, 2708, '0872', '532901', 100.24136900, 25.59306700, 2590, '云南省', 2708, '大理白族自治州', 2709, '大理市', 'system', 'system', b'1', '2017-04-18 02:07:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2710, '漾濞彝族自治县', 3, 2708, '0872', '532922', 99.95797000, 25.66954300, 2590, '云南省', 2708, '大理白族自治州', 2710, '漾濞彝族自治县', 'system', 'system', b'1', '2017-04-18 02:07:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2711, '祥云县', 3, 2708, '0872', '532923', 100.55402500, 25.47707200, 2590, '云南省', 2708, '大理白族自治州', 2711, '祥云县', 'system', 'system', b'1', '2017-04-18 02:07:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2712, '宾川县', 3, 2708, '0872', '532924', 100.57895700, 25.82590400, 2590, '云南省', 2708, '大理白族自治州', 2712, '宾川县', 'system', 'system', b'1', '2017-04-18 02:07:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2713, '弥渡县', 3, 2708, '0872', '532925', 100.49066900, 25.34259400, 2590, '云南省', 2708, '大理白族自治州', 2713, '弥渡县', 'system', 'system', b'1', '2017-04-18 02:07:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2714, '南涧彝族自治县', 3, 2708, '0872', '532926', 100.51868300, 25.04127900, 2590, '云南省', 2708, '大理白族自治州', 2714, '南涧彝族自治县', 'system', 'system', b'1', '2017-04-18 02:07:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2715, '巍山彝族回族自治县', 3, 2708, '0872', '532927', 100.30793000, 25.23090900, 2590, '云南省', 2708, '大理白族自治州', 2715, '巍山彝族回族自治县', 'system', 'system', b'1', '2017-04-18 02:07:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2716, '永平县', 3, 2708, '0872', '532928', 99.53353600, 25.46128100, 2590, '云南省', 2708, '大理白族自治州', 2716, '永平县', 'system', 'system', b'1', '2017-04-18 02:07:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2717, '云龙县', 3, 2708, '0872', '532929', 99.36940200, 25.88495500, 2590, '云南省', 2708, '大理白族自治州', 2717, '云龙县', 'system', 'system', b'1', '2017-04-18 02:07:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2718, '洱源县', 3, 2708, '0872', '532930', 99.95170800, 26.11118400, 2590, '云南省', 2708, '大理白族自治州', 2718, '洱源县', 'system', 'system', b'1', '2017-04-18 02:07:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2719, '剑川县', 3, 2708, '0872', '532931', 99.90588700, 26.53006600, 2590, '云南省', 2708, '大理白族自治州', 2719, '剑川县', 'system', 'system', b'1', '2017-04-18 02:07:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2720, '鹤庆县', 3, 2708, '0872', '532932', 100.17337500, 26.55839000, 2590, '云南省', 2708, '大理白族自治州', 2720, '鹤庆县', 'system', 'system', b'1', '2017-04-18 02:07:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2721, '德宏傣族景颇族自治州', 2, 2590, '0692', '533100', 98.57836300, 24.43669400, 2590, '云南省', 2721, '德宏傣族景颇族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2722, '瑞丽市', 3, 2721, '0692', '533102', 97.85588300, 24.01073400, 2590, '云南省', 2721, '德宏傣族景颇族自治州', 2722, '瑞丽市', 'system', 'system', b'1', '2017-04-18 02:07:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2723, '芒市', 3, 2721, '0692', '533103', 98.57760800, 24.43669900, 2590, '云南省', 2721, '德宏傣族景颇族自治州', 2723, '芒市', 'system', 'system', b'1', '2017-04-18 02:07:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2724, '梁河县', 3, 2721, '0692', '533122', 98.29819600, 24.80742000, 2590, '云南省', 2721, '德宏傣族景颇族自治州', 2724, '梁河县', 'system', 'system', b'1', '2017-04-18 02:07:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2725, '盈江县', 3, 2721, '0692', '533123', 97.93393000, 24.70954100, 2590, '云南省', 2721, '德宏傣族景颇族自治州', 2725, '盈江县', 'system', 'system', b'1', '2017-04-18 02:07:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2726, '陇川县', 3, 2721, '0692', '533124', 97.79444100, 24.18406500, 2590, '云南省', 2721, '德宏傣族景颇族自治州', 2726, '陇川县', 'system', 'system', b'1', '2017-04-18 02:07:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2727, '怒江傈僳族自治州', 2, 2590, '0886', '533300', 98.85430400, 25.85094900, 2590, '云南省', 2727, '怒江傈僳族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2728, '泸水市', 3, 2727, '0886', '533301', 98.85406300, 25.85114200, 2590, '云南省', 2727, '怒江傈僳族自治州', 2728, '泸水市', 'system', 'system', b'1', '2017-04-18 02:07:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2729, '福贡县', 3, 2727, '0886', '533323', 98.86741300, 26.90273800, 2590, '云南省', 2727, '怒江傈僳族自治州', 2729, '福贡县', 'system', 'system', b'1', '2017-04-18 02:07:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2730, '贡山独龙族怒族自治县', 3, 2727, '0886', '533324', 98.66614100, 27.73805400, 2590, '云南省', 2727, '怒江傈僳族自治州', 2730, '贡山独龙族怒族自治县', 'system', 'system', b'1', '2017-04-18 02:07:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2731, '兰坪白族普米族自治县', 3, 2727, '0886', '533325', 99.42137800, 26.45383900, 2590, '云南省', 2727, '怒江傈僳族自治州', 2731, '兰坪白族普米族自治县', 'system', 'system', b'1', '2017-04-18 02:07:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2732, '迪庆藏族自治州', 2, 2590, '0887', '533400', 99.70646300, 27.82685300, 2590, '云南省', 2732, '迪庆藏族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2733, '香格里拉市', 3, 2732, '0887', '533401', 99.70866700, 27.82580400, 2590, '云南省', 2732, '迪庆藏族自治州', 2733, '香格里拉市', 'system', 'system', b'1', '2017-04-18 02:07:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2734, '德钦县', 3, 2732, '0887', '533422', 98.91506000, 28.48327200, 2590, '云南省', 2732, '迪庆藏族自治州', 2734, '德钦县', 'system', 'system', b'1', '2017-04-18 02:07:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2735, '维西傈僳族自治县', 3, 2732, '0887', '533423', 99.28635500, 27.18094800, 2590, '云南省', 2732, '迪庆藏族自治州', 2735, '维西傈僳族自治县', 'system', 'system', b'1', '2017-04-18 02:07:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2736, '西藏自治区', 1, 1, NULL, '540000', 91.13221200, 29.66036100, 2736, '西藏自治区', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2737, '拉萨市', 2, 2736, '0891', '540100', 91.13221200, 29.66036100, 2736, '西藏自治区', 2737, '拉萨市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2738, '城关区', 3, 2737, '0891', '540102', 91.13291100, 29.65947200, 2736, '西藏自治区', 2737, '拉萨市', 2738, '城关区', 'system', 'system', b'1', '2017-04-18 02:07:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2739, '林周县', 3, 2737, '0891', '540121', 91.26184200, 29.89575400, 2736, '西藏自治区', 2737, '拉萨市', 2739, '林周县', 'system', 'system', b'1', '2017-04-18 02:07:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2740, '当雄县', 3, 2737, '0891', '540122', 91.10355100, 30.47481900, 2736, '西藏自治区', 2737, '拉萨市', 2740, '当雄县', 'system', 'system', b'1', '2017-04-18 02:07:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2741, '尼木县', 3, 2737, '0891', '540123', 90.16554500, 29.43134600, 2736, '西藏自治区', 2737, '拉萨市', 2741, '尼木县', 'system', 'system', b'1', '2017-04-18 02:07:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2742, '曲水县', 3, 2737, '0891', '540124', 90.73805100, 29.34989500, 2736, '西藏自治区', 2737, '拉萨市', 2742, '曲水县', 'system', 'system', b'1', '2017-04-18 02:07:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2743, '堆龙德庆区', 3, 2737, '0891', '540103', 91.00282300, 29.64734700, 2736, '西藏自治区', 2737, '拉萨市', 2743, '堆龙德庆区', 'system', 'system', b'1', '2017-04-18 02:07:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2744, '达孜县', 3, 2737, '0891', '540126', 91.35097600, 29.67031400, 2736, '西藏自治区', 2737, '拉萨市', 2744, '达孜县', 'system', 'system', b'1', '2017-04-18 02:07:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2745, '墨竹工卡县', 3, 2737, '0891', '540127', 91.73115800, 29.83465700, 2736, '西藏自治区', 2737, '拉萨市', 2745, '墨竹工卡县', 'system', 'system', b'1', '2017-04-18 02:07:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2746, '日喀则市', 2, 2736, '0892', '540200', 88.88514800, 29.26751900, 2736, '西藏自治区', 2746, '日喀则市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2747, '桑珠孜区', 3, 2746, '0892', '540202', 88.88667000, 29.26700300, 2736, '西藏自治区', 2746, '日喀则市', 2747, '桑珠孜区', 'system', 'system', b'1', '2017-04-18 02:07:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2748, '南木林县', 3, 2746, '0892', '540221', 89.09943400, 29.68045900, 2736, '西藏自治区', 2746, '日喀则市', 2748, '南木林县', 'system', 'system', b'1', '2017-04-18 02:07:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2749, '江孜县', 3, 2746, '0892', '540222', 89.60504400, 28.90884500, 2736, '西藏自治区', 2746, '日喀则市', 2749, '江孜县', 'system', 'system', b'1', '2017-04-18 02:07:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2750, '定日县', 3, 2746, '0892', '540223', 87.12388700, 28.65666700, 2736, '西藏自治区', 2746, '日喀则市', 2750, '定日县', 'system', 'system', b'1', '2017-04-18 02:07:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2751, '萨迦县', 3, 2746, '0892', '540224', 88.02300700, 28.90107700, 2736, '西藏自治区', 2746, '日喀则市', 2751, '萨迦县', 'system', 'system', b'1', '2017-04-18 02:07:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2752, '拉孜县', 3, 2746, '0892', '540225', 87.63743000, 29.08513600, 2736, '西藏自治区', 2746, '日喀则市', 2752, '拉孜县', 'system', 'system', b'1', '2017-04-18 02:07:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2753, '昂仁县', 3, 2746, '0892', '540226', 87.23578000, 29.29475800, 2736, '西藏自治区', 2746, '日喀则市', 2753, '昂仁县', 'system', 'system', b'1', '2017-04-18 02:07:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2754, '谢通门县', 3, 2746, '0892', '540227', 88.26051700, 29.43159700, 2736, '西藏自治区', 2746, '日喀则市', 2754, '谢通门县', 'system', 'system', b'1', '2017-04-18 02:07:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2755, '白朗县', 3, 2746, '0892', '540228', 89.26361800, 29.10662700, 2736, '西藏自治区', 2746, '日喀则市', 2755, '白朗县', 'system', 'system', b'1', '2017-04-18 02:07:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2756, '仁布县', 3, 2746, '0892', '540229', 89.84320700, 29.23029900, 2736, '西藏自治区', 2746, '日喀则市', 2756, '仁布县', 'system', 'system', b'1', '2017-04-18 02:07:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2757, '康马县', 3, 2746, '0892', '540230', 89.68340600, 28.55471900, 2736, '西藏自治区', 2746, '日喀则市', 2757, '康马县', 'system', 'system', b'1', '2017-04-18 02:07:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2758, '定结县', 3, 2746, '0892', '540231', 87.76772300, 28.36409000, 2736, '西藏自治区', 2746, '日喀则市', 2758, '定结县', 'system', 'system', b'1', '2017-04-18 02:07:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2759, '仲巴县', 3, 2746, '0892', '540232', 84.03282600, 29.76833600, 2736, '西藏自治区', 2746, '日喀则市', 2759, '仲巴县', 'system', 'system', b'1', '2017-04-18 02:07:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2760, '亚东县', 3, 2746, '0892', '540233', 88.90680600, 27.48277200, 2736, '西藏自治区', 2746, '日喀则市', 2760, '亚东县', 'system', 'system', b'1', '2017-04-18 02:07:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2761, '吉隆县', 3, 2746, '0892', '540234', 85.29834900, 28.85241600, 2736, '西藏自治区', 2746, '日喀则市', 2761, '吉隆县', 'system', 'system', b'1', '2017-04-18 02:07:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2762, '聂拉木县', 3, 2746, '0892', '540235', 85.98195300, 28.15595000, 2736, '西藏自治区', 2746, '日喀则市', 2762, '聂拉木县', 'system', 'system', b'1', '2017-04-18 02:07:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2763, '萨嘎县', 3, 2746, '0892', '540236', 85.23462200, 29.32819400, 2736, '西藏自治区', 2746, '日喀则市', 2763, '萨嘎县', 'system', 'system', b'1', '2017-04-18 02:07:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2764, '岗巴县', 3, 2746, '0892', '540237', 88.51890300, 28.27437100, 2736, '西藏自治区', 2746, '日喀则市', 2764, '岗巴县', 'system', 'system', b'1', '2017-04-18 02:07:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2765, '昌都市', 2, 2736, '0895', '540300', 97.17845200, 31.13687500, 2736, '西藏自治区', 2765, '昌都市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2766, '卡若区', 3, 2765, '0895', '540302', 97.17825500, 31.13703500, 2736, '西藏自治区', 2765, '昌都市', 2766, '卡若区', 'system', 'system', b'1', '2017-04-18 02:07:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2767, '江达县', 3, 2765, '0895', '540321', 98.21835100, 31.49953400, 2736, '西藏自治区', 2765, '昌都市', 2767, '江达县', 'system', 'system', b'1', '2017-04-18 02:07:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2768, '贡觉县', 3, 2765, '0895', '540322', 98.27119100, 30.85920600, 2736, '西藏自治区', 2765, '昌都市', 2768, '贡觉县', 'system', 'system', b'1', '2017-04-18 02:07:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2769, '类乌齐县', 3, 2765, '0895', '540323', 96.60125900, 31.21304800, 2736, '西藏自治区', 2765, '昌都市', 2769, '类乌齐县', 'system', 'system', b'1', '2017-04-18 02:07:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2770, '丁青县', 3, 2765, '0895', '540324', 95.59774800, 31.41068100, 2736, '西藏自治区', 2765, '昌都市', 2770, '丁青县', 'system', 'system', b'1', '2017-04-18 02:07:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2771, '察雅县', 3, 2765, '0895', '540325', 97.56570100, 30.65303800, 2736, '西藏自治区', 2765, '昌都市', 2771, '察雅县', 'system', 'system', b'1', '2017-04-18 02:07:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2772, '八宿县', 3, 2765, '0895', '540326', 96.91789300, 30.05340800, 2736, '西藏自治区', 2765, '昌都市', 2772, '八宿县', 'system', 'system', b'1', '2017-04-18 02:07:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2773, '左贡县', 3, 2765, '0895', '540327', 97.84053200, 29.67133500, 2736, '西藏自治区', 2765, '昌都市', 2773, '左贡县', 'system', 'system', b'1', '2017-04-18 02:07:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2774, '芒康县', 3, 2765, '0895', '540328', 98.59644400, 29.68661500, 2736, '西藏自治区', 2765, '昌都市', 2774, '芒康县', 'system', 'system', b'1', '2017-04-18 02:07:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2775, '洛隆县', 3, 2765, '0895', '540329', 95.82341800, 30.74194700, 2736, '西藏自治区', 2765, '昌都市', 2775, '洛隆县', 'system', 'system', b'1', '2017-04-18 02:07:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2776, '边坝县', 3, 2765, '0895', '540330', 94.70750400, 30.93384900, 2736, '西藏自治区', 2765, '昌都市', 2776, '边坝县', 'system', 'system', b'1', '2017-04-18 02:07:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2777, '山南市', 2, 2736, '0893', '540500', 91.76652900, 29.23602300, 2736, '西藏自治区', 2777, '山南市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2778, '乃东区', 3, 2777, '0893', '540502', 91.76525000, 29.23610600, 2736, '西藏自治区', 2777, '山南市', 2778, '乃东区', 'system', 'system', b'1', '2017-04-18 02:07:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2779, '扎囊县', 3, 2777, '0893', '540521', 91.33800000, 29.24647600, 2736, '西藏自治区', 2777, '山南市', 2779, '扎囊县', 'system', 'system', b'1', '2017-04-18 02:07:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2780, '贡嘎县', 3, 2777, '0893', '540522', 90.98527100, 29.28907800, 2736, '西藏自治区', 2777, '山南市', 2780, '贡嘎县', 'system', 'system', b'1', '2017-04-18 02:07:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2781, '桑日县', 3, 2777, '0893', '540523', 92.01573200, 29.25977400, 2736, '西藏自治区', 2777, '山南市', 2781, '桑日县', 'system', 'system', b'1', '2017-04-18 02:07:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2782, '琼结县', 3, 2777, '0893', '540524', 91.68375300, 29.02524200, 2736, '西藏自治区', 2777, '山南市', 2782, '琼结县', 'system', 'system', b'1', '2017-04-18 02:07:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2783, '曲松县', 3, 2777, '0893', '540525', 92.20106600, 29.06365600, 2736, '西藏自治区', 2777, '山南市', 2783, '曲松县', 'system', 'system', b'1', '2017-04-18 02:07:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2784, '措美县', 3, 2777, '0893', '540526', 91.43234700, 28.43735300, 2736, '西藏自治区', 2777, '山南市', 2784, '措美县', 'system', 'system', b'1', '2017-04-18 02:07:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2785, '洛扎县', 3, 2777, '0893', '540527', 90.85824300, 28.38576500, 2736, '西藏自治区', 2777, '山南市', 2785, '洛扎县', 'system', 'system', b'1', '2017-04-18 02:07:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2786, '加查县', 3, 2777, '0893', '540528', 92.59104300, 29.14092100, 2736, '西藏自治区', 2777, '山南市', 2786, '加查县', 'system', 'system', b'1', '2017-04-18 02:07:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2787, '隆子县', 3, 2777, '0893', '540529', 92.46330900, 28.40854800, 2736, '西藏自治区', 2777, '山南市', 2787, '隆子县', 'system', 'system', b'1', '2017-04-18 02:07:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2788, '错那县', 3, 2777, '0893', '540530', 91.96013200, 27.99170700, 2736, '西藏自治区', 2777, '山南市', 2788, '错那县', 'system', 'system', b'1', '2017-04-18 02:07:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2789, '浪卡子县', 3, 2777, '0893', '540531', 90.39874700, 28.96836000, 2736, '西藏自治区', 2777, '山南市', 2789, '浪卡子县', 'system', 'system', b'1', '2017-04-18 02:07:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2790, '那曲地区', 2, 2736, '0896', '542400', 92.06021400, 31.47600400, 2736, '西藏自治区', 2790, '那曲地区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2791, '那曲县', 3, 2790, '0896', '542421', 92.06186200, 31.47575600, 2736, '西藏自治区', 2790, '那曲地区', 2791, '那曲县', 'system', 'system', b'1', '2017-04-18 02:07:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2792, '嘉黎县', 3, 2790, '0896', '542422', 93.23290700, 30.64084600, 2736, '西藏自治区', 2790, '那曲地区', 2792, '嘉黎县', 'system', 'system', b'1', '2017-04-18 02:07:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2793, '比如县', 3, 2790, '0896', '542423', 93.68044000, 31.47991700, 2736, '西藏自治区', 2790, '那曲地区', 2793, '比如县', 'system', 'system', b'1', '2017-04-18 02:07:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2794, '聂荣县', 3, 2790, '0896', '542424', 92.30365900, 32.10785500, 2736, '西藏自治区', 2790, '那曲地区', 2794, '聂荣县', 'system', 'system', b'1', '2017-04-18 02:07:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2795, '安多县', 3, 2790, '0896', '542425', 91.68187900, 32.26029900, 2736, '西藏自治区', 2790, '那曲地区', 2795, '安多县', 'system', 'system', b'1', '2017-04-18 02:07:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2796, '申扎县', 3, 2790, '0896', '542426', 88.70977700, 30.92905600, 2736, '西藏自治区', 2790, '那曲地区', 2796, '申扎县', 'system', 'system', b'1', '2017-04-18 02:07:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2797, '索县', 3, 2790, '0896', '542427', 93.78496400, 31.88617300, 2736, '西藏自治区', 2790, '那曲地区', 2797, '索县', 'system', 'system', b'1', '2017-04-18 02:07:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2798, '班戈县', 3, 2790, '0896', '542428', 90.01182200, 31.39457800, 2736, '西藏自治区', 2790, '那曲地区', 2798, '班戈县', 'system', 'system', b'1', '2017-04-18 02:07:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2799, '巴青县', 3, 2790, '0896', '542429', 94.05404900, 31.91869100, 2736, '西藏自治区', 2790, '那曲地区', 2799, '巴青县', 'system', 'system', b'1', '2017-04-18 02:07:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2800, '尼玛县', 3, 2790, '0896', '542430', 87.23664600, 31.78497900, 2736, '西藏自治区', 2790, '那曲地区', 2800, '尼玛县', 'system', 'system', b'1', '2017-04-18 02:07:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2801, '双湖县', 3, 2790, '0896', '542431', 88.83857800, 33.18698000, 2736, '西藏自治区', 2790, '那曲地区', 2801, '双湖县', 'system', 'system', b'1', '2017-04-18 02:07:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2802, '阿里地区', 2, 2736, '0897', '542500', 80.10549800, 32.50318700, 2736, '西藏自治区', 2802, '阿里地区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2803, '普兰县', 3, 2802, '0897', '542521', 81.17758800, 30.29189600, 2736, '西藏自治区', 2802, '阿里地区', 2803, '普兰县', 'system', 'system', b'1', '2017-04-18 02:07:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2804, '札达县', 3, 2802, '0897', '542522', 79.80319100, 31.47858700, 2736, '西藏自治区', 2802, '阿里地区', 2804, '札达县', 'system', 'system', b'1', '2017-04-18 02:07:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2805, '噶尔县', 3, 2802, '0897', '542523', 80.10500500, 32.50337300, 2736, '西藏自治区', 2802, '阿里地区', 2805, '噶尔县', 'system', 'system', b'1', '2017-04-18 02:07:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2806, '日土县', 3, 2802, '0897', '542524', 79.73193700, 33.38245400, 2736, '西藏自治区', 2802, '阿里地区', 2806, '日土县', 'system', 'system', b'1', '2017-04-18 02:07:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2807, '革吉县', 3, 2802, '0897', '542525', 81.14289600, 32.38919200, 2736, '西藏自治区', 2802, '阿里地区', 2807, '革吉县', 'system', 'system', b'1', '2017-04-18 02:07:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2808, '改则县', 3, 2802, '0897', '542526', 84.06238400, 32.30207600, 2736, '西藏自治区', 2802, '阿里地区', 2808, '改则县', 'system', 'system', b'1', '2017-04-18 02:07:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2809, '措勤县', 3, 2802, '0897', '542527', 85.15925400, 31.01677400, 2736, '西藏自治区', 2802, '阿里地区', 2809, '措勤县', 'system', 'system', b'1', '2017-04-18 02:07:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2810, '林芝市', 2, 2736, '0894', '540400', 94.36234800, 29.65469300, 2736, '西藏自治区', 2810, '林芝市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2811, '巴宜区', 3, 2810, '0894', '540402', 94.36098700, 29.65373200, 2736, '西藏自治区', 2810, '林芝市', 2811, '巴宜区', 'system', 'system', b'1', '2017-04-18 02:07:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2812, '工布江达县', 3, 2810, '0894', '540421', 93.24651500, 29.88447000, 2736, '西藏自治区', 2810, '林芝市', 2812, '工布江达县', 'system', 'system', b'1', '2017-04-18 02:07:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2813, '米林县', 3, 2810, '0894', '540422', 94.21367900, 29.21381100, 2736, '西藏自治区', 2810, '林芝市', 2813, '米林县', 'system', 'system', b'1', '2017-04-18 02:07:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2814, '墨脱县', 3, 2810, '0894', '540423', 95.33224500, 29.32573000, 2736, '西藏自治区', 2810, '林芝市', 2814, '墨脱县', 'system', 'system', b'1', '2017-04-18 02:07:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2815, '波密县', 3, 2810, '0894', '540424', 95.76815100, 29.85877100, 2736, '西藏自治区', 2810, '林芝市', 2815, '波密县', 'system', 'system', b'1', '2017-04-18 02:07:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2816, '察隅县', 3, 2810, '0894', '540425', 97.46500200, 28.66024400, 2736, '西藏自治区', 2810, '林芝市', 2816, '察隅县', 'system', 'system', b'1', '2017-04-18 02:07:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2817, '朗县', 3, 2810, '0894', '540426', 93.07342900, 29.04460000, 2736, '西藏自治区', 2810, '林芝市', 2817, '朗县', 'system', 'system', b'1', '2017-04-18 02:07:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2818, '陕西省', 1, 1, NULL, '610000', 108.94802400, 34.26316100, 2818, '陕西省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2819, '西安市', 2, 2818, '029', '610100', 108.94802400, 34.26316100, 2818, '陕西省', 2819, '西安市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2820, '新城区', 3, 2819, '029', '610102', 108.95990300, 34.26927000, 2818, '陕西省', 2819, '西安市', 2820, '新城区', 'system', 'system', b'1', '2017-04-18 02:07:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2821, '碑林区', 3, 2819, '029', '610103', 108.94699400, 34.25106100, 2818, '陕西省', 2819, '西安市', 2821, '碑林区', 'system', 'system', b'1', '2017-04-18 02:07:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2822, '莲湖区', 3, 2819, '029', '610104', 108.93319400, 34.26560000, 2818, '陕西省', 2819, '西安市', 2822, '莲湖区', 'system', 'system', b'1', '2017-04-18 02:07:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2823, '灞桥区', 3, 2819, '029', '610111', 109.06726100, 34.26745300, 2818, '陕西省', 2819, '西安市', 2823, '灞桥区', 'system', 'system', b'1', '2017-04-18 02:07:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2824, '未央区', 3, 2819, '029', '610112', 108.94602200, 34.30823000, 2818, '陕西省', 2819, '西安市', 2824, '未央区', 'system', 'system', b'1', '2017-04-18 02:07:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2825, '雁塔区', 3, 2819, '029', '610113', 108.92659300, 34.21338900, 2818, '陕西省', 2819, '西安市', 2825, '雁塔区', 'system', 'system', b'1', '2017-04-18 02:07:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2826, '阎良区', 3, 2819, '029', '610114', 109.22802000, 34.66214100, 2818, '陕西省', 2819, '西安市', 2826, '阎良区', 'system', 'system', b'1', '2017-04-18 02:07:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2827, '临潼区', 3, 2819, '029', '610115', 109.21398600, 34.37206500, 2818, '陕西省', 2819, '西安市', 2827, '临潼区', 'system', 'system', b'1', '2017-04-18 02:07:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2828, '长安区', 3, 2819, '029', '610116', 108.94157900, 34.15709700, 2818, '陕西省', 2819, '西安市', 2828, '长安区', 'system', 'system', b'1', '2017-04-18 02:07:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2829, '高陵区', 3, 2819, '029', '610117', 109.08889600, 34.53506500, 2818, '陕西省', 2819, '西安市', 2829, '高陵区', 'system', 'system', b'1', '2017-04-18 02:07:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2830, '蓝田县', 3, 2819, '029', '610122', 109.31763400, 34.15618900, 2818, '陕西省', 2819, '西安市', 2830, '蓝田县', 'system', 'system', b'1', '2017-04-18 02:07:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2831, '周至县', 3, 2819, '029', '610124', 108.21646500, 34.16153200, 2818, '陕西省', 2819, '西安市', 2831, '周至县', 'system', 'system', b'1', '2017-04-18 02:07:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2832, '户县', 3, 2819, '029', '610125', 108.60738500, 34.10866800, 2818, '陕西省', 2819, '西安市', 2832, '户县', 'system', 'system', b'1', '2017-04-18 02:07:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2833, '铜川市', 2, 2818, '0919', '610200', 108.97960800, 34.91658200, 2818, '陕西省', 2833, '铜川市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2834, '王益区', 3, 2833, '0919', '610202', 109.07586200, 35.06909800, 2818, '陕西省', 2833, '铜川市', 2834, '王益区', 'system', 'system', b'1', '2017-04-18 02:07:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2835, '印台区', 3, 2833, '0919', '610203', 109.10081400, 35.11192700, 2818, '陕西省', 2833, '铜川市', 2835, '印台区', 'system', 'system', b'1', '2017-04-18 02:07:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2836, '耀州区', 3, 2833, '0919', '610204', 108.96253800, 34.91020600, 2818, '陕西省', 2833, '铜川市', 2836, '耀州区', 'system', 'system', b'1', '2017-04-18 02:07:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2837, '宜君县', 3, 2833, '0919', '610222', 109.11827800, 35.39876600, 2818, '陕西省', 2833, '铜川市', 2837, '宜君县', 'system', 'system', b'1', '2017-04-18 02:07:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2838, '宝鸡市', 2, 2818, '0917', '610300', 107.14487000, 34.36931500, 2818, '陕西省', 2838, '宝鸡市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2839, '渭滨区', 3, 2838, '0917', '610302', 107.14446700, 34.37100800, 2818, '陕西省', 2838, '宝鸡市', 2839, '渭滨区', 'system', 'system', b'1', '2017-04-18 02:07:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2840, '金台区', 3, 2838, '0917', '610303', 107.14994300, 34.37519200, 2818, '陕西省', 2838, '宝鸡市', 2840, '金台区', 'system', 'system', b'1', '2017-04-18 02:07:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2841, '陈仓区', 3, 2838, '0917', '610304', 107.38364500, 34.35274700, 2818, '陕西省', 2838, '宝鸡市', 2841, '陈仓区', 'system', 'system', b'1', '2017-04-18 02:07:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2842, '凤翔县', 3, 2838, '0917', '610322', 107.40057700, 34.52166800, 2818, '陕西省', 2838, '宝鸡市', 2842, '凤翔县', 'system', 'system', b'1', '2017-04-18 02:07:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2843, '岐山县', 3, 2838, '0917', '610323', 107.62446400, 34.44296000, 2818, '陕西省', 2838, '宝鸡市', 2843, '岐山县', 'system', 'system', b'1', '2017-04-18 02:07:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2844, '扶风县', 3, 2838, '0917', '610324', 107.89141900, 34.37549700, 2818, '陕西省', 2838, '宝鸡市', 2844, '扶风县', 'system', 'system', b'1', '2017-04-18 02:07:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2845, '眉县', 3, 2838, '0917', '610326', 107.75237100, 34.27213700, 2818, '陕西省', 2838, '宝鸡市', 2845, '眉县', 'system', 'system', b'1', '2017-04-18 02:07:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2846, '陇县', 3, 2838, '0917', '610327', 106.85706600, 34.89326200, 2818, '陕西省', 2838, '宝鸡市', 2846, '陇县', 'system', 'system', b'1', '2017-04-18 02:07:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2847, '千阳县', 3, 2838, '0917', '610328', 107.13298700, 34.64258400, 2818, '陕西省', 2838, '宝鸡市', 2847, '千阳县', 'system', 'system', b'1', '2017-04-18 02:07:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2848, '麟游县', 3, 2838, '0917', '610329', 107.79660800, 34.67771400, 2818, '陕西省', 2838, '宝鸡市', 2848, '麟游县', 'system', 'system', b'1', '2017-04-18 02:07:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2849, '凤县', 3, 2838, '0917', '610330', 106.52521200, 33.91246400, 2818, '陕西省', 2838, '宝鸡市', 2849, '凤县', 'system', 'system', b'1', '2017-04-18 02:07:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2850, '太白县', 3, 2838, '0917', '610331', 107.31653300, 34.05921500, 2818, '陕西省', 2838, '宝鸡市', 2850, '太白县', 'system', 'system', b'1', '2017-04-18 02:07:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2851, '咸阳市', 2, 2818, '0910', '610400', 108.70511700, 34.33343900, 2818, '陕西省', 2851, '咸阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2852, '秦都区', 3, 2851, '0910', '610402', 108.69863600, 34.32980100, 2818, '陕西省', 2851, '咸阳市', 2852, '秦都区', 'system', 'system', b'1', '2017-04-18 02:07:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2853, '杨陵区', 3, 2851, '0910', '610403', 108.08634800, 34.27135000, 2818, '陕西省', 2851, '咸阳市', 2853, '杨陵区', 'system', 'system', b'1', '2017-04-18 02:07:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2854, '渭城区', 3, 2851, '0910', '610404', 108.73095700, 34.33684700, 2818, '陕西省', 2851, '咸阳市', 2854, '渭城区', 'system', 'system', b'1', '2017-04-18 02:07:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2855, '三原县', 3, 2851, '0910', '610422', 108.94348100, 34.61399600, 2818, '陕西省', 2851, '咸阳市', 2855, '三原县', 'system', 'system', b'1', '2017-04-18 02:07:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2856, '泾阳县', 3, 2851, '0910', '610423', 108.83784000, 34.52849300, 2818, '陕西省', 2851, '咸阳市', 2856, '泾阳县', 'system', 'system', b'1', '2017-04-18 02:07:39', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2857, '乾县', 3, 2851, '0910', '610424', 108.24740600, 34.52726100, 2818, '陕西省', 2851, '咸阳市', 2857, '乾县', 'system', 'system', b'1', '2017-04-18 02:07:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2858, '礼泉县', 3, 2851, '0910', '610425', 108.42831700, 34.48258300, 2818, '陕西省', 2851, '咸阳市', 2858, '礼泉县', 'system', 'system', b'1', '2017-04-18 02:07:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2859, '永寿县', 3, 2851, '0910', '610426', 108.14312900, 34.69261900, 2818, '陕西省', 2851, '咸阳市', 2859, '永寿县', 'system', 'system', b'1', '2017-04-18 02:07:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2860, '彬县', 3, 2851, '0910', '610427', 108.08367400, 35.03423300, 2818, '陕西省', 2851, '咸阳市', 2860, '彬县', 'system', 'system', b'1', '2017-04-18 02:07:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2861, '长武县', 3, 2851, '0910', '610428', 107.79583500, 35.20612200, 2818, '陕西省', 2851, '咸阳市', 2861, '长武县', 'system', 'system', b'1', '2017-04-18 02:07:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2862, '旬邑县', 3, 2851, '0910', '610429', 108.33723100, 35.11223400, 2818, '陕西省', 2851, '咸阳市', 2862, '旬邑县', 'system', 'system', b'1', '2017-04-18 02:07:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2863, '淳化县', 3, 2851, '0910', '610430', 108.58117300, 34.79797000, 2818, '陕西省', 2851, '咸阳市', 2863, '淳化县', 'system', 'system', b'1', '2017-04-18 02:07:40', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2864, '武功县', 3, 2851, '0910', '610431', 108.21285700, 34.25973200, 2818, '陕西省', 2851, '咸阳市', 2864, '武功县', 'system', 'system', b'1', '2017-04-18 02:07:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2865, '兴平市', 3, 2851, '0910', '610481', 108.48849300, 34.29713400, 2818, '陕西省', 2851, '咸阳市', 2865, '兴平市', 'system', 'system', b'1', '2017-04-18 02:07:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2866, '渭南市', 2, 2818, '0913', '610500', 109.50288200, 34.49938100, 2818, '陕西省', 2866, '渭南市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2867, '临渭区', 3, 2866, '0913', '610502', 109.50329900, 34.50127100, 2818, '陕西省', 2866, '渭南市', 2867, '临渭区', 'system', 'system', b'1', '2017-04-18 02:07:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2868, '华州区', 3, 2866, '0913', '610503', 109.76141000, 34.51195800, 2818, '陕西省', 2866, '渭南市', 2868, '华州区', 'system', 'system', b'1', '2017-04-18 02:07:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2869, '潼关县', 3, 2866, '0913', '610522', 110.24726000, 34.54451500, 2818, '陕西省', 2866, '渭南市', 2869, '潼关县', 'system', 'system', b'1', '2017-04-18 02:07:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2870, '大荔县', 3, 2866, '0913', '610523', 109.94312300, 34.79501100, 2818, '陕西省', 2866, '渭南市', 2870, '大荔县', 'system', 'system', b'1', '2017-04-18 02:07:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2871, '合阳县', 3, 2866, '0913', '610524', 110.14797900, 35.23709800, 2818, '陕西省', 2866, '渭南市', 2871, '合阳县', 'system', 'system', b'1', '2017-04-18 02:07:41', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2872, '澄城县', 3, 2866, '0913', '610525', 109.93760900, 35.18400000, 2818, '陕西省', 2866, '渭南市', 2872, '澄城县', 'system', 'system', b'1', '2017-04-18 02:07:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2873, '蒲城县', 3, 2866, '0913', '610526', 109.58965300, 34.95603400, 2818, '陕西省', 2866, '渭南市', 2873, '蒲城县', 'system', 'system', b'1', '2017-04-18 02:07:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2874, '白水县', 3, 2866, '0913', '610527', 109.59430900, 35.17729100, 2818, '陕西省', 2866, '渭南市', 2874, '白水县', 'system', 'system', b'1', '2017-04-18 02:07:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2875, '富平县', 3, 2866, '0913', '610528', 109.18717400, 34.74667900, 2818, '陕西省', 2866, '渭南市', 2875, '富平县', 'system', 'system', b'1', '2017-04-18 02:07:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2876, '韩城市', 3, 2866, '0913', '610581', 110.45239100, 35.47523800, 2818, '陕西省', 2866, '渭南市', 2876, '韩城市', 'system', 'system', b'1', '2017-04-18 02:07:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2877, '华阴市', 3, 2866, '0913', '610582', 110.08952000, 34.56535900, 2818, '陕西省', 2866, '渭南市', 2877, '华阴市', 'system', 'system', b'1', '2017-04-18 02:07:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2878, '延安市', 2, 2818, '0911', '610600', 109.49081000, 36.59653700, 2818, '陕西省', 2878, '延安市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:42', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2879, '宝塔区', 3, 2878, '0911', '610602', 109.49069000, 36.59629100, 2818, '陕西省', 2878, '延安市', 2879, '宝塔区', 'system', 'system', b'1', '2017-04-18 02:07:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2880, '延长县', 3, 2878, '0911', '610621', 110.01296100, 36.57830600, 2818, '陕西省', 2878, '延安市', 2880, '延长县', 'system', 'system', b'1', '2017-04-18 02:07:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2881, '延川县', 3, 2878, '0911', '610622', 110.19031400, 36.88206600, 2818, '陕西省', 2878, '延安市', 2881, '延川县', 'system', 'system', b'1', '2017-04-18 02:07:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2882, '子长县', 3, 2878, '0911', '610623', 109.67596800, 37.14207000, 2818, '陕西省', 2878, '延安市', 2882, '子长县', 'system', 'system', b'1', '2017-04-18 02:07:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2883, '安塞区', 3, 2878, '0911', '610624', 109.32534100, 36.86441000, 2818, '陕西省', 2878, '延安市', 2883, '安塞区', 'system', 'system', b'1', '2017-04-18 02:07:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2884, '志丹县', 3, 2878, '0911', '610625', 108.76889800, 36.82303100, 2818, '陕西省', 2878, '延安市', 2884, '志丹县', 'system', 'system', b'1', '2017-04-18 02:07:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2885, '吴起县', 3, 2878, '0911', '610626', 108.17697600, 36.92485200, 2818, '陕西省', 2878, '延安市', 2885, '吴起县', 'system', 'system', b'1', '2017-04-18 02:07:43', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2886, '甘泉县', 3, 2878, '0911', '610627', 109.34961000, 36.27772900, 2818, '陕西省', 2878, '延安市', 2886, '甘泉县', 'system', 'system', b'1', '2017-04-18 02:07:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2887, '富县', 3, 2878, '0911', '610628', 109.38413600, 35.99649500, 2818, '陕西省', 2878, '延安市', 2887, '富县', 'system', 'system', b'1', '2017-04-18 02:07:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2888, '洛川县', 3, 2878, '0911', '610629', 109.43571200, 35.76213300, 2818, '陕西省', 2878, '延安市', 2888, '洛川县', 'system', 'system', b'1', '2017-04-18 02:07:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2889, '宜川县', 3, 2878, '0911', '610630', 110.17553700, 36.05039100, 2818, '陕西省', 2878, '延安市', 2889, '宜川县', 'system', 'system', b'1', '2017-04-18 02:07:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2890, '黄龙县', 3, 2878, '0911', '610631', 109.83502000, 35.58327600, 2818, '陕西省', 2878, '延安市', 2890, '黄龙县', 'system', 'system', b'1', '2017-04-18 02:07:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2891, '黄陵县', 3, 2878, '0911', '610632', 109.26246900, 35.58016500, 2818, '陕西省', 2878, '延安市', 2891, '黄陵县', 'system', 'system', b'1', '2017-04-18 02:07:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2892, '汉中市', 2, 2818, '0916', '610700', 107.02862100, 33.07766800, 2818, '陕西省', 2892, '汉中市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:44', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2893, '汉台区', 3, 2892, '0916', '610702', 107.02823300, 33.07767400, 2818, '陕西省', 2892, '汉中市', 2893, '汉台区', 'system', 'system', b'1', '2017-04-18 02:07:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2894, '南郑县', 3, 2892, '0916', '610721', 106.94239300, 33.00334100, 2818, '陕西省', 2892, '汉中市', 2894, '南郑县', 'system', 'system', b'1', '2017-04-18 02:07:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2895, '城固县', 3, 2892, '0916', '610722', 107.32988700, 33.15309800, 2818, '陕西省', 2892, '汉中市', 2895, '城固县', 'system', 'system', b'1', '2017-04-18 02:07:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2896, '洋县', 3, 2892, '0916', '610723', 107.54996200, 33.22328300, 2818, '陕西省', 2892, '汉中市', 2896, '洋县', 'system', 'system', b'1', '2017-04-18 02:07:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2897, '西乡县', 3, 2892, '0916', '610724', 107.76585800, 32.98796100, 2818, '陕西省', 2892, '汉中市', 2897, '西乡县', 'system', 'system', b'1', '2017-04-18 02:07:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2898, '勉县', 3, 2892, '0916', '610725', 106.68017500, 33.15561800, 2818, '陕西省', 2892, '汉中市', 2898, '勉县', 'system', 'system', b'1', '2017-04-18 02:07:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2899, '宁强县', 3, 2892, '0916', '610726', 106.25739000, 32.83080600, 2818, '陕西省', 2892, '汉中市', 2899, '宁强县', 'system', 'system', b'1', '2017-04-18 02:07:45', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2900, '略阳县', 3, 2892, '0916', '610727', 106.15389900, 33.32963800, 2818, '陕西省', 2892, '汉中市', 2900, '略阳县', 'system', 'system', b'1', '2017-04-18 02:07:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2901, '镇巴县', 3, 2892, '0916', '610728', 107.89531000, 32.53585400, 2818, '陕西省', 2892, '汉中市', 2901, '镇巴县', 'system', 'system', b'1', '2017-04-18 02:07:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2902, '留坝县', 3, 2892, '0916', '610729', 106.92437700, 33.61334000, 2818, '陕西省', 2892, '汉中市', 2902, '留坝县', 'system', 'system', b'1', '2017-04-18 02:07:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2903, '佛坪县', 3, 2892, '0916', '610730', 107.98858200, 33.52074500, 2818, '陕西省', 2892, '汉中市', 2903, '佛坪县', 'system', 'system', b'1', '2017-04-18 02:07:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2904, '榆林市', 2, 2818, '0912', '610800', 109.74119300, 38.29016200, 2818, '陕西省', 2904, '榆林市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2905, '榆阳区', 3, 2904, '0912', '610802', 109.74791000, 38.29926700, 2818, '陕西省', 2904, '榆林市', 2905, '榆阳区', 'system', 'system', b'1', '2017-04-18 02:07:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2906, '神木县', 3, 2904, '0912', '610821', 110.49700500, 38.83564100, 2818, '陕西省', 2904, '榆林市', 2906, '神木县', 'system', 'system', b'1', '2017-04-18 02:07:46', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2907, '府谷县', 3, 2904, '0912', '610822', 111.06964500, 39.02924300, 2818, '陕西省', 2904, '榆林市', 2907, '府谷县', 'system', 'system', b'1', '2017-04-18 02:07:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2908, '横山区', 3, 2904, '0912', '610803', 109.29259600, 37.96404800, 2818, '陕西省', 2904, '榆林市', 2908, '横山区', 'system', 'system', b'1', '2017-04-18 02:07:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2909, '靖边县', 3, 2904, '0912', '610824', 108.80567000, 37.59608400, 2818, '陕西省', 2904, '榆林市', 2909, '靖边县', 'system', 'system', b'1', '2017-04-18 02:07:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2910, '定边县', 3, 2904, '0912', '610825', 107.60128400, 37.59523000, 2818, '陕西省', 2904, '榆林市', 2910, '定边县', 'system', 'system', b'1', '2017-04-18 02:07:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2911, '绥德县', 3, 2904, '0912', '610826', 110.26537700, 37.50770100, 2818, '陕西省', 2904, '榆林市', 2911, '绥德县', 'system', 'system', b'1', '2017-04-18 02:07:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2912, '米脂县', 3, 2904, '0912', '610827', 110.17868300, 37.75908100, 2818, '陕西省', 2904, '榆林市', 2912, '米脂县', 'system', 'system', b'1', '2017-04-18 02:07:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2913, '佳县', 3, 2904, '0912', '610828', 110.49336700, 38.02159700, 2818, '陕西省', 2904, '榆林市', 2913, '佳县', 'system', 'system', b'1', '2017-04-18 02:07:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2914, '吴堡县', 3, 2904, '0912', '610829', 110.73931500, 37.45192500, 2818, '陕西省', 2904, '榆林市', 2914, '吴堡县', 'system', 'system', b'1', '2017-04-18 02:07:47', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2915, '清涧县', 3, 2904, '0912', '610830', 110.12146000, 37.08770200, 2818, '陕西省', 2904, '榆林市', 2915, '清涧县', 'system', 'system', b'1', '2017-04-18 02:07:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2916, '子洲县', 3, 2904, '0912', '610831', 110.03457000, 37.61157300, 2818, '陕西省', 2904, '榆林市', 2916, '子洲县', 'system', 'system', b'1', '2017-04-18 02:07:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2917, '安康市', 2, 2818, '0915', '610900', 109.02927300, 32.69030000, 2818, '陕西省', 2917, '安康市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2918, '汉滨区', 3, 2917, '0915', '610902', 109.02909800, 32.69081700, 2818, '陕西省', 2917, '安康市', 2918, '汉滨区', 'system', 'system', b'1', '2017-04-18 02:07:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2919, '汉阴县', 3, 2917, '0915', '610921', 108.51094600, 32.89112100, 2818, '陕西省', 2917, '安康市', 2919, '汉阴县', 'system', 'system', b'1', '2017-04-18 02:07:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2920, '石泉县', 3, 2917, '0915', '610922', 108.25051200, 33.03851200, 2818, '陕西省', 2917, '安康市', 2920, '石泉县', 'system', 'system', b'1', '2017-04-18 02:07:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2921, '宁陕县', 3, 2917, '0915', '610923', 108.31371400, 33.31218400, 2818, '陕西省', 2917, '安康市', 2921, '宁陕县', 'system', 'system', b'1', '2017-04-18 02:07:48', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2922, '紫阳县', 3, 2917, '0915', '610924', 108.53778800, 32.52017600, 2818, '陕西省', 2917, '安康市', 2922, '紫阳县', 'system', 'system', b'1', '2017-04-18 02:07:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2923, '岚皋县', 3, 2917, '0915', '610925', 108.90066300, 32.31069000, 2818, '陕西省', 2917, '安康市', 2923, '岚皋县', 'system', 'system', b'1', '2017-04-18 02:07:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2924, '平利县', 3, 2917, '0915', '610926', 109.36186500, 32.38793300, 2818, '陕西省', 2917, '安康市', 2924, '平利县', 'system', 'system', b'1', '2017-04-18 02:07:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2925, '镇坪县', 3, 2917, '0915', '610927', 109.52643700, 31.88339500, 2818, '陕西省', 2917, '安康市', 2925, '镇坪县', 'system', 'system', b'1', '2017-04-18 02:07:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2926, '旬阳县', 3, 2917, '0915', '610928', 109.36814900, 32.83356700, 2818, '陕西省', 2917, '安康市', 2926, '旬阳县', 'system', 'system', b'1', '2017-04-18 02:07:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2927, '白河县', 3, 2917, '0915', '610929', 110.11418600, 32.80948400, 2818, '陕西省', 2917, '安康市', 2927, '白河县', 'system', 'system', b'1', '2017-04-18 02:07:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2928, '商洛市', 2, 2818, '0914', '611000', 109.93977600, 33.86831900, 2818, '陕西省', 2928, '商洛市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:49', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2929, '商州区', 3, 2928, '0914', '611002', 109.93768500, 33.86920800, 2818, '陕西省', 2928, '商洛市', 2929, '商州区', 'system', 'system', b'1', '2017-04-18 02:07:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2930, '洛南县', 3, 2928, '0914', '611021', 110.14571600, 34.08850200, 2818, '陕西省', 2928, '商洛市', 2930, '洛南县', 'system', 'system', b'1', '2017-04-18 02:07:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2931, '丹凤县', 3, 2928, '0914', '611022', 110.33191000, 33.69471100, 2818, '陕西省', 2928, '商洛市', 2931, '丹凤县', 'system', 'system', b'1', '2017-04-18 02:07:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2932, '商南县', 3, 2928, '0914', '611023', 110.88543700, 33.52636700, 2818, '陕西省', 2928, '商洛市', 2932, '商南县', 'system', 'system', b'1', '2017-04-18 02:07:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2933, '山阳县', 3, 2928, '0914', '611024', 109.88043500, 33.53041100, 2818, '陕西省', 2928, '商洛市', 2933, '山阳县', 'system', 'system', b'1', '2017-04-18 02:07:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2934, '镇安县', 3, 2928, '0914', '611025', 109.15107500, 33.42398100, 2818, '陕西省', 2928, '商洛市', 2934, '镇安县', 'system', 'system', b'1', '2017-04-18 02:07:50', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2935, '柞水县', 3, 2928, '0914', '611026', 109.11124900, 33.68277300, 2818, '陕西省', 2928, '商洛市', 2935, '柞水县', 'system', 'system', b'1', '2017-04-18 02:07:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2936, '甘肃省', 1, 1, NULL, '620000', 103.82355700, 36.05803900, 2936, '甘肃省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2937, '兰州市', 2, 2936, '0931', '620100', 103.82355700, 36.05803900, 2936, '甘肃省', 2937, '兰州市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2938, '城关区', 3, 2937, '0931', '620102', 103.84103200, 36.04911500, 2936, '甘肃省', 2937, '兰州市', 2938, '城关区', 'system', 'system', b'1', '2017-04-18 02:07:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2939, '七里河区', 3, 2937, '0931', '620103', 103.78432600, 36.06673000, 2936, '甘肃省', 2937, '兰州市', 2939, '七里河区', 'system', 'system', b'1', '2017-04-18 02:07:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2940, '西固区', 3, 2937, '0931', '620104', 103.62233100, 36.10036900, 2936, '甘肃省', 2937, '兰州市', 2940, '西固区', 'system', 'system', b'1', '2017-04-18 02:07:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2941, '安宁区', 3, 2937, '0931', '620105', 103.72403800, 36.10329000, 2936, '甘肃省', 2937, '兰州市', 2941, '安宁区', 'system', 'system', b'1', '2017-04-18 02:07:51', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2942, '红古区', 3, 2937, '0931', '620111', 102.86181400, 36.34417700, 2936, '甘肃省', 2937, '兰州市', 2942, '红古区', 'system', 'system', b'1', '2017-04-18 02:07:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2943, '永登县', 3, 2937, '0931', '620121', 103.26220300, 36.73442800, 2936, '甘肃省', 2937, '兰州市', 2943, '永登县', 'system', 'system', b'1', '2017-04-18 02:07:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2944, '皋兰县', 3, 2937, '0931', '620122', 103.94933000, 36.33125400, 2936, '甘肃省', 2937, '兰州市', 2944, '皋兰县', 'system', 'system', b'1', '2017-04-18 02:07:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2945, '榆中县', 3, 2937, '0931', '620123', 104.11497500, 35.84443000, 2936, '甘肃省', 2937, '兰州市', 2945, '榆中县', 'system', 'system', b'1', '2017-04-18 02:07:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2946, '嘉峪关市', 2, 2936, '1937', '620200', 98.27730400, 39.78652900, 2936, '甘肃省', 2946, '嘉峪关市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2947, '金昌市', 2, 2936, '0935', '620300', 102.18788800, 38.51423800, 2936, '甘肃省', 2947, '金昌市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2948, '金川区', 3, 2947, '0935', '620302', 102.18768300, 38.51379300, 2936, '甘肃省', 2947, '金昌市', 2948, '金川区', 'system', 'system', b'1', '2017-04-18 02:07:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2949, '永昌县', 3, 2947, '0935', '620321', 101.97195700, 38.24735400, 2936, '甘肃省', 2947, '金昌市', 2949, '永昌县', 'system', 'system', b'1', '2017-04-18 02:07:52', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2950, '白银市', 2, 2936, '0943', '620400', 104.17360600, 36.54568000, 2936, '甘肃省', 2950, '白银市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2951, '白银区', 3, 2950, '0943', '620402', 104.17425000, 36.54564900, 2936, '甘肃省', 2950, '白银市', 2951, '白银区', 'system', 'system', b'1', '2017-04-18 02:07:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2952, '平川区', 3, 2950, '0943', '620403', 104.81920700, 36.72921000, 2936, '甘肃省', 2950, '白银市', 2952, '平川区', 'system', 'system', b'1', '2017-04-18 02:07:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2953, '靖远县', 3, 2950, '0943', '620421', 104.68697200, 36.56142400, 2936, '甘肃省', 2950, '白银市', 2953, '靖远县', 'system', 'system', b'1', '2017-04-18 02:07:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2954, '会宁县', 3, 2950, '0943', '620422', 105.05433700, 35.69248600, 2936, '甘肃省', 2950, '白银市', 2954, '会宁县', 'system', 'system', b'1', '2017-04-18 02:07:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2955, '景泰县', 3, 2950, '0943', '620423', 104.06639400, 37.19351900, 2936, '甘肃省', 2950, '白银市', 2955, '景泰县', 'system', 'system', b'1', '2017-04-18 02:07:53', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2956, '天水市', 2, 2936, '0938', '620500', 105.72499800, 34.57852900, 2936, '甘肃省', 2956, '天水市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2957, '秦州区', 3, 2956, '0938', '620502', 105.72447700, 34.57864500, 2936, '甘肃省', 2956, '天水市', 2957, '秦州区', 'system', 'system', b'1', '2017-04-18 02:07:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2958, '麦积区', 3, 2956, '0938', '620503', 105.89763100, 34.56350400, 2936, '甘肃省', 2956, '天水市', 2958, '麦积区', 'system', 'system', b'1', '2017-04-18 02:07:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2959, '清水县', 3, 2956, '0938', '620521', 106.13987800, 34.75287000, 2936, '甘肃省', 2956, '天水市', 2959, '清水县', 'system', 'system', b'1', '2017-04-18 02:07:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2960, '秦安县', 3, 2956, '0938', '620522', 105.67330000, 34.86235400, 2936, '甘肃省', 2956, '天水市', 2960, '秦安县', 'system', 'system', b'1', '2017-04-18 02:07:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2961, '甘谷县', 3, 2956, '0938', '620523', 105.33234700, 34.74732700, 2936, '甘肃省', 2956, '天水市', 2961, '甘谷县', 'system', 'system', b'1', '2017-04-18 02:07:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2962, '武山县', 3, 2956, '0938', '620524', 104.89169600, 34.72195500, 2936, '甘肃省', 2956, '天水市', 2962, '武山县', 'system', 'system', b'1', '2017-04-18 02:07:54', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2963, '张家川回族自治县', 3, 2956, '0938', '620525', 106.21241600, 34.99323700, 2936, '甘肃省', 2956, '天水市', 2963, '张家川回族自治县', 'system', 'system', b'1', '2017-04-18 02:07:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2964, '武威市', 2, 2936, '1935', '620600', 102.63469700, 37.92999600, 2936, '甘肃省', 2964, '武威市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2965, '凉州区', 3, 2964, '1935', '620602', 102.63449200, 37.93025000, 2936, '甘肃省', 2964, '武威市', 2965, '凉州区', 'system', 'system', b'1', '2017-04-18 02:07:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2966, '民勤县', 3, 2964, '1935', '620621', 103.09065400, 38.62462100, 2936, '甘肃省', 2964, '武威市', 2966, '民勤县', 'system', 'system', b'1', '2017-04-18 02:07:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2967, '古浪县', 3, 2964, '1935', '620622', 102.89804700, 37.47057100, 2936, '甘肃省', 2964, '武威市', 2967, '古浪县', 'system', 'system', b'1', '2017-04-18 02:07:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2968, '天祝藏族自治县', 3, 2964, '1935', '620623', 103.14203400, 36.97167800, 2936, '甘肃省', 2964, '武威市', 2968, '天祝藏族自治县', 'system', 'system', b'1', '2017-04-18 02:07:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2969, '张掖市', 2, 2936, '0936', '620700', 100.45547200, 38.93289700, 2936, '甘肃省', 2969, '张掖市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:55', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2970, '甘州区', 3, 2969, '0936', '620702', 100.45486200, 38.93177400, 2936, '甘肃省', 2969, '张掖市', 2970, '甘州区', 'system', 'system', b'1', '2017-04-18 02:07:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2971, '肃南裕固族自治县', 3, 2969, '0936', '620721', 99.61708600, 38.83726900, 2936, '甘肃省', 2969, '张掖市', 2971, '肃南裕固族自治县', 'system', 'system', b'1', '2017-04-18 02:07:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2972, '民乐县', 3, 2969, '0936', '620722', 100.81662300, 38.43445400, 2936, '甘肃省', 2969, '张掖市', 2972, '民乐县', 'system', 'system', b'1', '2017-04-18 02:07:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2973, '临泽县', 3, 2969, '0936', '620723', 100.16633300, 39.15215100, 2936, '甘肃省', 2969, '张掖市', 2973, '临泽县', 'system', 'system', b'1', '2017-04-18 02:07:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2974, '高台县', 3, 2969, '0936', '620724', 99.81665000, 39.37630800, 2936, '甘肃省', 2969, '张掖市', 2974, '高台县', 'system', 'system', b'1', '2017-04-18 02:07:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2975, '山丹县', 3, 2969, '0936', '620725', 101.08844200, 38.78483900, 2936, '甘肃省', 2969, '张掖市', 2975, '山丹县', 'system', 'system', b'1', '2017-04-18 02:07:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2976, '平凉市', 2, 2936, '0933', '620800', 106.68469100, 35.54279000, 2936, '甘肃省', 2976, '平凉市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:56', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2977, '崆峒区', 3, 2976, '0933', '620802', 106.68422300, 35.54173000, 2936, '甘肃省', 2976, '平凉市', 2977, '崆峒区', 'system', 'system', b'1', '2017-04-18 02:07:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2978, '泾川县', 3, 2976, '0933', '620821', 107.36521800, 35.33528300, 2936, '甘肃省', 2976, '平凉市', 2978, '泾川县', 'system', 'system', b'1', '2017-04-18 02:07:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2979, '灵台县', 3, 2976, '0933', '620822', 107.62058700, 35.06400900, 2936, '甘肃省', 2976, '平凉市', 2979, '灵台县', 'system', 'system', b'1', '2017-04-18 02:07:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2980, '崇信县', 3, 2976, '0933', '620823', 107.03125300, 35.30453300, 2936, '甘肃省', 2976, '平凉市', 2980, '崇信县', 'system', 'system', b'1', '2017-04-18 02:07:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2981, '华亭县', 3, 2976, '0933', '620824', 106.64930800, 35.21534200, 2936, '甘肃省', 2976, '平凉市', 2981, '华亭县', 'system', 'system', b'1', '2017-04-18 02:07:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2982, '庄浪县', 3, 2976, '0933', '620825', 106.04197900, 35.20342800, 2936, '甘肃省', 2976, '平凉市', 2982, '庄浪县', 'system', 'system', b'1', '2017-04-18 02:07:57', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2983, '静宁县', 3, 2976, '0933', '620826', 105.73348900, 35.52524300, 2936, '甘肃省', 2976, '平凉市', 2983, '静宁县', 'system', 'system', b'1', '2017-04-18 02:07:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2984, '酒泉市', 2, 2936, '0937', '620900', 98.51079500, 39.74402300, 2936, '甘肃省', 2984, '酒泉市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2985, '肃州区', 3, 2984, '0937', '620902', 98.51115500, 39.74385800, 2936, '甘肃省', 2984, '酒泉市', 2985, '肃州区', 'system', 'system', b'1', '2017-04-18 02:07:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2986, '金塔县', 3, 2984, '0937', '620921', 98.90295900, 39.98303600, 2936, '甘肃省', 2984, '酒泉市', 2986, '金塔县', 'system', 'system', b'1', '2017-04-18 02:07:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2987, '瓜州县', 3, 2984, '0937', '620922', 95.78059100, 40.51652500, 2936, '甘肃省', 2984, '酒泉市', 2987, '瓜州县', 'system', 'system', b'1', '2017-04-18 02:07:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2988, '肃北蒙古族自治县', 3, 2984, '0937', '620923', 94.87728000, 39.51224000, 2936, '甘肃省', 2984, '酒泉市', 2988, '肃北蒙古族自治县', 'system', 'system', b'1', '2017-04-18 02:07:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2989, '阿克塞哈萨克族自治县', 3, 2984, '0937', '620924', 94.33764200, 39.63164200, 2936, '甘肃省', 2984, '酒泉市', 2989, '阿克塞哈萨克族自治县', 'system', 'system', b'1', '2017-04-18 02:07:58', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2990, '玉门市', 3, 2984, '0937', '620981', 97.03720600, 40.28682000, 2936, '甘肃省', 2984, '酒泉市', 2990, '玉门市', 'system', 'system', b'1', '2017-04-18 02:07:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2991, '敦煌市', 3, 2984, '0937', '620982', 94.66427900, 40.14111900, 2936, '甘肃省', 2984, '酒泉市', 2991, '敦煌市', 'system', 'system', b'1', '2017-04-18 02:07:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2992, '庆阳市', 2, 2936, '0934', '621000', 107.63837200, 35.73421800, 2936, '甘肃省', 2992, '庆阳市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:07:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2993, '西峰区', 3, 2992, '0934', '621002', 107.63882400, 35.73371300, 2936, '甘肃省', 2992, '庆阳市', 2993, '西峰区', 'system', 'system', b'1', '2017-04-18 02:07:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2994, '庆城县', 3, 2992, '0934', '621021', 107.88566400, 36.01350400, 2936, '甘肃省', 2992, '庆阳市', 2994, '庆城县', 'system', 'system', b'1', '2017-04-18 02:07:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2995, '环县', 3, 2992, '0934', '621022', 107.30875400, 36.56932200, 2936, '甘肃省', 2992, '庆阳市', 2995, '环县', 'system', 'system', b'1', '2017-04-18 02:07:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2996, '华池县', 3, 2992, '0934', '621023', 107.98628800, 36.45730400, 2936, '甘肃省', 2992, '庆阳市', 2996, '华池县', 'system', 'system', b'1', '2017-04-18 02:07:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2997, '合水县', 3, 2992, '0934', '621024', 108.01986500, 35.81900500, 2936, '甘肃省', 2992, '庆阳市', 2997, '合水县', 'system', 'system', b'1', '2017-04-18 02:07:59', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2998, '正宁县', 3, 2992, '0934', '621025', 108.36106800, 35.49064200, 2936, '甘肃省', 2992, '庆阳市', 2998, '正宁县', 'system', 'system', b'1', '2017-04-18 02:08:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (2999, '宁县', 3, 2992, '0934', '621026', 107.92118200, 35.50201000, 2936, '甘肃省', 2992, '庆阳市', 2999, '宁县', 'system', 'system', b'1', '2017-04-18 02:08:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3000, '镇原县', 3, 2992, '0934', '621027', 107.19570600, 35.67780600, 2936, '甘肃省', 2992, '庆阳市', 3000, '镇原县', 'system', 'system', b'1', '2017-04-18 02:08:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3001, '定西市', 2, 2936, '0932', '621100', 104.62629400, 35.57957800, 2936, '甘肃省', 3001, '定西市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3002, '安定区', 3, 3001, '0932', '621102', 104.62577000, 35.57976400, 2936, '甘肃省', 3001, '定西市', 3002, '安定区', 'system', 'system', b'1', '2017-04-18 02:08:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3003, '通渭县', 3, 3001, '0932', '621121', 105.25010200, 35.20892200, 2936, '甘肃省', 3001, '定西市', 3003, '通渭县', 'system', 'system', b'1', '2017-04-18 02:08:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3004, '陇西县', 3, 3001, '0932', '621122', 104.63755400, 35.00340900, 2936, '甘肃省', 3001, '定西市', 3004, '陇西县', 'system', 'system', b'1', '2017-04-18 02:08:00', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3005, '渭源县', 3, 3001, '0932', '621123', 104.21174200, 35.13302300, 2936, '甘肃省', 3001, '定西市', 3005, '渭源县', 'system', 'system', b'1', '2017-04-18 02:08:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3006, '临洮县', 3, 3001, '0932', '621124', 103.86218600, 35.37623300, 2936, '甘肃省', 3001, '定西市', 3006, '临洮县', 'system', 'system', b'1', '2017-04-18 02:08:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3007, '漳县', 3, 3001, '0932', '621125', 104.46675600, 34.84864200, 2936, '甘肃省', 3001, '定西市', 3007, '漳县', 'system', 'system', b'1', '2017-04-18 02:08:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3008, '岷县', 3, 3001, '0932', '621126', 104.03988200, 34.43910500, 2936, '甘肃省', 3001, '定西市', 3008, '岷县', 'system', 'system', b'1', '2017-04-18 02:08:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3009, '陇南市', 2, 2936, '2935', '621200', 104.92937900, 33.38859800, 2936, '甘肃省', 3009, '陇南市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3010, '武都区', 3, 3009, '2935', '621202', 104.92986600, 33.38815500, 2936, '甘肃省', 3009, '陇南市', 3010, '武都区', 'system', 'system', b'1', '2017-04-18 02:08:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3011, '成县', 3, 3009, '2935', '621221', 105.73443400, 33.73986300, 2936, '甘肃省', 3009, '陇南市', 3011, '成县', 'system', 'system', b'1', '2017-04-18 02:08:01', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3012, '文县', 3, 3009, '2935', '621222', 104.68244800, 32.94217100, 2936, '甘肃省', 3009, '陇南市', 3012, '文县', 'system', 'system', b'1', '2017-04-18 02:08:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3013, '宕昌县', 3, 3009, '2935', '621223', 104.39447500, 34.04265500, 2936, '甘肃省', 3009, '陇南市', 3013, '宕昌县', 'system', 'system', b'1', '2017-04-18 02:08:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3014, '康县', 3, 3009, '2935', '621224', 105.60953400, 33.32826600, 2936, '甘肃省', 3009, '陇南市', 3014, '康县', 'system', 'system', b'1', '2017-04-18 02:08:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3015, '西和县', 3, 3009, '2935', '621225', 105.29973700, 34.01371800, 2936, '甘肃省', 3009, '陇南市', 3015, '西和县', 'system', 'system', b'1', '2017-04-18 02:08:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3016, '礼县', 3, 3009, '2935', '621226', 105.18161600, 34.18938700, 2936, '甘肃省', 3009, '陇南市', 3016, '礼县', 'system', 'system', b'1', '2017-04-18 02:08:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3017, '徽县', 3, 3009, '2935', '621227', 106.08563200, 33.76778500, 2936, '甘肃省', 3009, '陇南市', 3017, '徽县', 'system', 'system', b'1', '2017-04-18 02:08:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3018, '两当县', 3, 3009, '2935', '621228', 106.30695900, 33.91072900, 2936, '甘肃省', 3009, '陇南市', 3018, '两当县', 'system', 'system', b'1', '2017-04-18 02:08:02', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3019, '临夏回族自治州', 2, 2936, '0930', '622900', 103.21200600, 35.59944600, 2936, '甘肃省', 3019, '临夏回族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3020, '临夏市', 3, 3019, '0930', '622901', 103.21163400, 35.59941000, 2936, '甘肃省', 3019, '临夏回族自治州', 3020, '临夏市', 'system', 'system', b'1', '2017-04-18 02:08:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3021, '临夏县', 3, 3019, '0930', '622921', 102.99387300, 35.49236000, 2936, '甘肃省', 3019, '临夏回族自治州', 3021, '临夏县', 'system', 'system', b'1', '2017-04-18 02:08:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3022, '康乐县', 3, 3019, '0930', '622922', 103.70985200, 35.37190600, 2936, '甘肃省', 3019, '临夏回族自治州', 3022, '康乐县', 'system', 'system', b'1', '2017-04-18 02:08:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3023, '永靖县', 3, 3019, '0930', '622923', 103.31987100, 35.93893300, 2936, '甘肃省', 3019, '临夏回族自治州', 3023, '永靖县', 'system', 'system', b'1', '2017-04-18 02:08:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3024, '广河县', 3, 3019, '0930', '622924', 103.57618800, 35.48168800, 2936, '甘肃省', 3019, '临夏回族自治州', 3024, '广河县', 'system', 'system', b'1', '2017-04-18 02:08:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3025, '和政县', 3, 3019, '0930', '622925', 103.35035700, 35.42597100, 2936, '甘肃省', 3019, '临夏回族自治州', 3025, '和政县', 'system', 'system', b'1', '2017-04-18 02:08:03', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3026, '东乡族自治县', 3, 3019, '0930', '622926', 103.38956800, 35.66383000, 2936, '甘肃省', 3019, '临夏回族自治州', 3026, '东乡族自治县', 'system', 'system', b'1', '2017-04-18 02:08:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3027, '积石山保安族东乡族撒拉族自治县', 3, 3019, '0930', '622927', 102.87747300, 35.71290600, 2936, '甘肃省', 3019, '临夏回族自治州', 3027, '积石山保安族东乡族撒拉族自治县', 'system', 'system', b'1', '2017-04-18 02:08:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3028, '甘南藏族自治州', 2, 2936, '0941', '623000', 102.91100800, 34.98635400, 2936, '甘肃省', 3028, '甘南藏族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3029, '合作市', 3, 3028, '0941', '623001', 102.91149000, 34.98597300, 2936, '甘肃省', 3028, '甘南藏族自治州', 3029, '合作市', 'system', 'system', b'1', '2017-04-18 02:08:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3030, '临潭县', 3, 3028, '0941', '623021', 103.35305400, 34.69164000, 2936, '甘肃省', 3028, '甘南藏族自治州', 3030, '临潭县', 'system', 'system', b'1', '2017-04-18 02:08:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3031, '卓尼县', 3, 3028, '0941', '623022', 103.50850800, 34.58816500, 2936, '甘肃省', 3028, '甘南藏族自治州', 3031, '卓尼县', 'system', 'system', b'1', '2017-04-18 02:08:04', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3032, '舟曲县', 3, 3028, '0941', '623023', 104.37027100, 33.78296400, 2936, '甘肃省', 3028, '甘南藏族自治州', 3032, '舟曲县', 'system', 'system', b'1', '2017-04-18 02:08:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3033, '迭部县', 3, 3028, '0941', '623024', 103.22100900, 34.05534800, 2936, '甘肃省', 3028, '甘南藏族自治州', 3033, '迭部县', 'system', 'system', b'1', '2017-04-18 02:08:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3034, '玛曲县', 3, 3028, '0941', '623025', 102.07576700, 33.99806800, 2936, '甘肃省', 3028, '甘南藏族自治州', 3034, '玛曲县', 'system', 'system', b'1', '2017-04-18 02:08:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3035, '碌曲县', 3, 3028, '0941', '623026', 102.48849500, 34.58959100, 2936, '甘肃省', 3028, '甘南藏族自治州', 3035, '碌曲县', 'system', 'system', b'1', '2017-04-18 02:08:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3036, '夏河县', 3, 3028, '0941', '623027', 102.52074300, 35.20085300, 2936, '甘肃省', 3028, '甘南藏族自治州', 3036, '夏河县', 'system', 'system', b'1', '2017-04-18 02:08:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3037, '青海省', 1, 1, NULL, '630000', 101.77891600, 36.62317800, 3037, '青海省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3038, '西宁市', 2, 3037, '0971', '630100', 101.77891600, 36.62317800, 3037, '青海省', 3038, '西宁市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3039, '城东区', 3, 3038, '0971', '630102', 101.79609500, 36.61604300, 3037, '青海省', 3038, '西宁市', 3039, '城东区', 'system', 'system', b'1', '2017-04-18 02:08:05', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3040, '城中区', 3, 3038, '0971', '630103', 101.78455400, 36.62118100, 3037, '青海省', 3038, '西宁市', 3040, '城中区', 'system', 'system', b'1', '2017-04-18 02:08:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3041, '城西区', 3, 3038, '0971', '630104', 101.76364900, 36.62832300, 3037, '青海省', 3038, '西宁市', 3041, '城西区', 'system', 'system', b'1', '2017-04-18 02:08:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3042, '城北区', 3, 3038, '0971', '630105', 101.76129700, 36.64844800, 3037, '青海省', 3038, '西宁市', 3042, '城北区', 'system', 'system', b'1', '2017-04-18 02:08:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3043, '大通回族土族自治县', 3, 3038, '0971', '630121', 101.68418300, 36.93134300, 3037, '青海省', 3038, '西宁市', 3043, '大通回族土族自治县', 'system', 'system', b'1', '2017-04-18 02:08:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3044, '湟中县', 3, 3038, '0971', '630122', 101.56947500, 36.50041900, 3037, '青海省', 3038, '西宁市', 3044, '湟中县', 'system', 'system', b'1', '2017-04-18 02:08:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3045, '湟源县', 3, 3038, '0971', '630123', 101.26343500, 36.68481800, 3037, '青海省', 3038, '西宁市', 3045, '湟源县', 'system', 'system', b'1', '2017-04-18 02:08:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3046, '海东市', 2, 3037, '0972', '630200', 102.10327000, 36.50291600, 3037, '青海省', 3046, '海东市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:06', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3047, '乐都区', 3, 3046, '0972', '630202', 102.40243100, 36.48029100, 3037, '青海省', 3046, '海东市', 3047, '乐都区', 'system', 'system', b'1', '2017-04-18 02:08:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3048, '平安区', 3, 3046, '0972', '630203', 102.10429500, 36.50271400, 3037, '青海省', 3046, '海东市', 3048, '平安区', 'system', 'system', b'1', '2017-04-18 02:08:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3049, '民和回族土族自治县', 3, 3046, '0972', '630222', 102.80420900, 36.32945100, 3037, '青海省', 3046, '海东市', 3049, '民和回族土族自治县', 'system', 'system', b'1', '2017-04-18 02:08:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3050, '互助土族自治县', 3, 3046, '0972', '630223', 101.95673400, 36.83994000, 3037, '青海省', 3046, '海东市', 3050, '互助土族自治县', 'system', 'system', b'1', '2017-04-18 02:08:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3051, '化隆回族自治县', 3, 3046, '0972', '630224', 102.26232900, 36.09832200, 3037, '青海省', 3046, '海东市', 3051, '化隆回族自治县', 'system', 'system', b'1', '2017-04-18 02:08:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3052, '循化撒拉族自治县', 3, 3046, '0972', '630225', 102.48653400, 35.84724700, 3037, '青海省', 3046, '海东市', 3052, '循化撒拉族自治县', 'system', 'system', b'1', '2017-04-18 02:08:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3053, '海北藏族自治州', 2, 3037, '0970', '632200', 100.90105900, 36.95943500, 3037, '青海省', 3053, '海北藏族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:07', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3054, '门源回族自治县', 3, 3053, '0970', '632221', 101.61846100, 37.37662700, 3037, '青海省', 3053, '海北藏族自治州', 3054, '门源回族自治县', 'system', 'system', b'1', '2017-04-18 02:08:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3055, '祁连县', 3, 3053, '0970', '632222', 100.24977800, 38.17540900, 3037, '青海省', 3053, '海北藏族自治州', 3055, '祁连县', 'system', 'system', b'1', '2017-04-18 02:08:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3056, '海晏县', 3, 3053, '0970', '632223', 100.90049000, 36.95954200, 3037, '青海省', 3053, '海北藏族自治州', 3056, '海晏县', 'system', 'system', b'1', '2017-04-18 02:08:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3057, '刚察县', 3, 3053, '0970', '632224', 100.13841700, 37.32626300, 3037, '青海省', 3053, '海北藏族自治州', 3057, '刚察县', 'system', 'system', b'1', '2017-04-18 02:08:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3058, '黄南藏族自治州', 2, 3037, '0973', '632300', 102.01998800, 35.51774400, 3037, '青海省', 3058, '黄南藏族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3059, '同仁县', 3, 3058, '0973', '632321', 102.01760400, 35.51633700, 3037, '青海省', 3058, '黄南藏族自治州', 3059, '同仁县', 'system', 'system', b'1', '2017-04-18 02:08:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3060, '尖扎县', 3, 3058, '0973', '632322', 102.03195300, 35.93820500, 3037, '青海省', 3058, '黄南藏族自治州', 3060, '尖扎县', 'system', 'system', b'1', '2017-04-18 02:08:08', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3061, '泽库县', 3, 3058, '0973', '632323', 101.46934300, 35.03684200, 3037, '青海省', 3058, '黄南藏族自治州', 3061, '泽库县', 'system', 'system', b'1', '2017-04-18 02:08:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3062, '河南蒙古族自治县', 3, 3058, '0973', '632324', 101.61187700, 34.73452200, 3037, '青海省', 3058, '黄南藏族自治州', 3062, '河南蒙古族自治县', 'system', 'system', b'1', '2017-04-18 02:08:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3063, '海南藏族自治州', 2, 3037, '0974', '632500', 100.61954200, 36.28035300, 3037, '青海省', 3063, '海南藏族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3064, '共和县', 3, 3063, '0974', '632521', 100.61959700, 36.28028600, 3037, '青海省', 3063, '海南藏族自治州', 3064, '共和县', 'system', 'system', b'1', '2017-04-18 02:08:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3065, '同德县', 3, 3063, '0974', '632522', 100.57946500, 35.25449200, 3037, '青海省', 3063, '海南藏族自治州', 3065, '同德县', 'system', 'system', b'1', '2017-04-18 02:08:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3066, '贵德县', 3, 3063, '0974', '632523', 101.43185600, 36.04045600, 3037, '青海省', 3063, '海南藏族自治州', 3066, '贵德县', 'system', 'system', b'1', '2017-04-18 02:08:09', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3067, '兴海县', 3, 3063, '0974', '632524', 99.98696300, 35.58909000, 3037, '青海省', 3063, '海南藏族自治州', 3067, '兴海县', 'system', 'system', b'1', '2017-04-18 02:08:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3068, '贵南县', 3, 3063, '0974', '632525', 100.74792000, 35.58708500, 3037, '青海省', 3063, '海南藏族自治州', 3068, '贵南县', 'system', 'system', b'1', '2017-04-18 02:08:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3069, '果洛藏族自治州', 2, 3037, '0975', '632600', 100.24214300, 34.47360000, 3037, '青海省', 3069, '果洛藏族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3070, '玛沁县', 3, 3069, '0975', '632621', 100.24353100, 34.47338600, 3037, '青海省', 3069, '果洛藏族自治州', 3070, '玛沁县', 'system', 'system', b'1', '2017-04-18 02:08:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3071, '班玛县', 3, 3069, '0975', '632622', 100.73795500, 32.93158900, 3037, '青海省', 3069, '果洛藏族自治州', 3071, '班玛县', 'system', 'system', b'1', '2017-04-18 02:08:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3072, '甘德县', 3, 3069, '0975', '632623', 99.90258900, 33.96698700, 3037, '青海省', 3069, '果洛藏族自治州', 3072, '甘德县', 'system', 'system', b'1', '2017-04-18 02:08:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3073, '达日县', 3, 3069, '0975', '632624', 99.65171500, 33.75325900, 3037, '青海省', 3069, '果洛藏族自治州', 3073, '达日县', 'system', 'system', b'1', '2017-04-18 02:08:10', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3074, '久治县', 3, 3069, '0975', '632625', 101.48488400, 33.43021700, 3037, '青海省', 3069, '果洛藏族自治州', 3074, '久治县', 'system', 'system', b'1', '2017-04-18 02:08:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3075, '玛多县', 3, 3069, '0975', '632626', 98.21134300, 34.91528000, 3037, '青海省', 3069, '果洛藏族自治州', 3075, '玛多县', 'system', 'system', b'1', '2017-04-18 02:08:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3076, '玉树藏族自治州', 2, 3037, '0976', '632700', 97.00852200, 33.00404900, 3037, '青海省', 3076, '玉树藏族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3077, '玉树市', 3, 3076, '0976', '632701', 97.00876200, 33.00393000, 3037, '青海省', 3076, '玉树藏族自治州', 3077, '玉树市', 'system', 'system', b'1', '2017-04-18 02:08:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3078, '杂多县', 3, 3076, '0976', '632722', 95.29342300, 32.89188600, 3037, '青海省', 3076, '玉树藏族自治州', 3078, '杂多县', 'system', 'system', b'1', '2017-04-18 02:08:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3079, '称多县', 3, 3076, '0976', '632723', 97.11089300, 33.36788400, 3037, '青海省', 3076, '玉树藏族自治州', 3079, '称多县', 'system', 'system', b'1', '2017-04-18 02:08:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3080, '治多县', 3, 3076, '0976', '632724', 95.61684300, 33.85232200, 3037, '青海省', 3076, '玉树藏族自治州', 3080, '治多县', 'system', 'system', b'1', '2017-04-18 02:08:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3081, '囊谦县', 3, 3076, '0976', '632725', 96.47979700, 32.20320600, 3037, '青海省', 3076, '玉树藏族自治州', 3081, '囊谦县', 'system', 'system', b'1', '2017-04-18 02:08:11', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3082, '曲麻莱县', 3, 3076, '0976', '632726', 95.80067400, 34.12654000, 3037, '青海省', 3076, '玉树藏族自治州', 3082, '曲麻莱县', 'system', 'system', b'1', '2017-04-18 02:08:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3083, '海西蒙古族藏族自治州', 2, 3037, '0977', '632800', 97.37078500, 37.37466300, 3037, '青海省', 3083, '海西蒙古族藏族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3084, '格尔木市', 3, 3083, '0977', '632801', 94.90577700, 36.40154100, 3037, '青海省', 3083, '海西蒙古族藏族自治州', 3084, '格尔木市', 'system', 'system', b'1', '2017-04-18 02:08:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3085, '德令哈市', 3, 3083, '0977', '632802', 97.37014300, 37.37455500, 3037, '青海省', 3083, '海西蒙古族藏族自治州', 3085, '德令哈市', 'system', 'system', b'1', '2017-04-18 02:08:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3086, '乌兰县', 3, 3083, '0977', '632821', 98.47985200, 36.93038900, 3037, '青海省', 3083, '海西蒙古族藏族自治州', 3086, '乌兰县', 'system', 'system', b'1', '2017-04-18 02:08:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3087, '都兰县', 3, 3083, '0977', '632822', 98.08916100, 36.29855300, 3037, '青海省', 3083, '海西蒙古族藏族自治州', 3087, '都兰县', 'system', 'system', b'1', '2017-04-18 02:08:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3088, '天峻县', 3, 3083, '0977', '632823', 99.02078000, 37.29906000, 3037, '青海省', 3083, '海西蒙古族藏族自治州', 3088, '天峻县', 'system', 'system', b'1', '2017-04-18 02:08:12', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3089, '海西蒙古族藏族自治州直辖', 3, 3083, '0977', '632825', 95.35723300, 37.85363100, 3037, '青海省', 3083, '海西蒙古族藏族自治州', 3089, '海西蒙古族藏族自治州直辖', 'system', 'system', b'1', '2017-04-18 02:08:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3090, '宁夏回族自治区', 1, 1, NULL, '640000', 106.27817900, 38.46637000, 3090, '宁夏回族自治区', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3091, '银川市', 2, 3090, '0951', '640100', 106.27817900, 38.46637000, 3090, '宁夏回族自治区', 3091, '银川市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3092, '兴庆区', 3, 3091, '0951', '640104', 106.27839300, 38.46747000, 3090, '宁夏回族自治区', 3091, '银川市', 3092, '兴庆区', 'system', 'system', b'1', '2017-04-18 02:08:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3093, '西夏区', 3, 3091, '0951', '640105', 106.13211600, 38.49242400, 3090, '宁夏回族自治区', 3091, '银川市', 3093, '西夏区', 'system', 'system', b'1', '2017-04-18 02:08:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3094, '金凤区', 3, 3091, '0951', '640106', 106.22848600, 38.47735300, 3090, '宁夏回族自治区', 3091, '银川市', 3094, '金凤区', 'system', 'system', b'1', '2017-04-18 02:08:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3095, '永宁县', 3, 3091, '0951', '640121', 106.25378100, 38.28043000, 3090, '宁夏回族自治区', 3091, '银川市', 3095, '永宁县', 'system', 'system', b'1', '2017-04-18 02:08:13', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3096, '贺兰县', 3, 3091, '0951', '640122', 106.34590400, 38.55456300, 3090, '宁夏回族自治区', 3091, '银川市', 3096, '贺兰县', 'system', 'system', b'1', '2017-04-18 02:08:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3097, '灵武市', 3, 3091, '0951', '640181', 106.33470100, 38.09405800, 3090, '宁夏回族自治区', 3091, '银川市', 3097, '灵武市', 'system', 'system', b'1', '2017-04-18 02:08:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3098, '石嘴山市', 2, 3090, '0952', '640200', 106.37617300, 39.01333000, 3090, '宁夏回族自治区', 3098, '石嘴山市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3099, '大武口区', 3, 3098, '0952', '640202', 106.37665100, 39.01415800, 3090, '宁夏回族自治区', 3098, '石嘴山市', 3099, '大武口区', 'system', 'system', b'1', '2017-04-18 02:08:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3100, '惠农区', 3, 3098, '0952', '640205', 106.77551300, 39.23009400, 3090, '宁夏回族自治区', 3098, '石嘴山市', 3100, '惠农区', 'system', 'system', b'1', '2017-04-18 02:08:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3101, '平罗县', 3, 3098, '0952', '640221', 106.54489000, 38.90674000, 3090, '宁夏回族自治区', 3098, '石嘴山市', 3101, '平罗县', 'system', 'system', b'1', '2017-04-18 02:08:14', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3102, '吴忠市', 2, 3090, '0953', '640300', 106.19940900, 37.98616500, 3090, '宁夏回族自治区', 3102, '吴忠市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3103, '利通区', 3, 3102, '0953', '640302', 106.19941900, 37.98596700, 3090, '宁夏回族自治区', 3102, '吴忠市', 3103, '利通区', 'system', 'system', b'1', '2017-04-18 02:08:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3104, '红寺堡区', 3, 3102, '0953', '640303', 106.06731500, 37.42161600, 3090, '宁夏回族自治区', 3102, '吴忠市', 3104, '红寺堡区', 'system', 'system', b'1', '2017-04-18 02:08:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3105, '盐池县', 3, 3102, '0953', '640323', 107.40541000, 37.78422200, 3090, '宁夏回族自治区', 3102, '吴忠市', 3105, '盐池县', 'system', 'system', b'1', '2017-04-18 02:08:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3106, '同心县', 3, 3102, '0953', '640324', 105.91476400, 36.98290000, 3090, '宁夏回族自治区', 3102, '吴忠市', 3106, '同心县', 'system', 'system', b'1', '2017-04-18 02:08:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3107, '青铜峡市', 3, 3102, '0953', '640381', 106.07539500, 38.02150900, 3090, '宁夏回族自治区', 3102, '吴忠市', 3107, '青铜峡市', 'system', 'system', b'1', '2017-04-18 02:08:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3108, '固原市', 2, 3090, '0954', '640400', 106.28524100, 36.00456100, 3090, '宁夏回族自治区', 3108, '固原市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:15', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3109, '原州区', 3, 3108, '0954', '640402', 106.28477000, 36.00533700, 3090, '宁夏回族自治区', 3108, '固原市', 3109, '原州区', 'system', 'system', b'1', '2017-04-18 02:08:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3110, '西吉县', 3, 3108, '0954', '640422', 105.73180100, 35.96538400, 3090, '宁夏回族自治区', 3108, '固原市', 3110, '西吉县', 'system', 'system', b'1', '2017-04-18 02:08:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3111, '隆德县', 3, 3108, '0954', '640423', 106.12344000, 35.61823400, 3090, '宁夏回族自治区', 3108, '固原市', 3111, '隆德县', 'system', 'system', b'1', '2017-04-18 02:08:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3112, '泾源县', 3, 3108, '0954', '640424', 106.33867400, 35.49344000, 3090, '宁夏回族自治区', 3108, '固原市', 3112, '泾源县', 'system', 'system', b'1', '2017-04-18 02:08:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3113, '彭阳县', 3, 3108, '0954', '640425', 106.64151200, 35.84997500, 3090, '宁夏回族自治区', 3108, '固原市', 3113, '彭阳县', 'system', 'system', b'1', '2017-04-18 02:08:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3114, '中卫市', 2, 3090, '1953', '640500', 105.18956800, 37.51495100, 3090, '宁夏回族自治区', 3114, '中卫市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3115, '沙坡头区', 3, 3114, '1953', '640502', 105.19053600, 37.51456400, 3090, '宁夏回族自治区', 3114, '中卫市', 3115, '沙坡头区', 'system', 'system', b'1', '2017-04-18 02:08:16', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3116, '中宁县', 3, 3114, '1953', '640521', 105.67578400, 37.48973600, 3090, '宁夏回族自治区', 3114, '中卫市', 3116, '中宁县', 'system', 'system', b'1', '2017-04-18 02:08:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3117, '海原县', 3, 3114, '1953', '640522', 105.64732300, 36.56200700, 3090, '宁夏回族自治区', 3114, '中卫市', 3117, '海原县', 'system', 'system', b'1', '2017-04-18 02:08:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3118, '新疆维吾尔自治区', 1, 1, NULL, '650000', 87.61773300, 43.79281800, 3118, '新疆维吾尔自治区', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3119, '乌鲁木齐市', 2, 3118, '0991', '650100', 87.61773300, 43.79281800, 3118, '新疆维吾尔自治区', 3119, '乌鲁木齐市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3120, '天山区', 3, 3119, '0991', '650102', 87.62011600, 43.79642800, 3118, '新疆维吾尔自治区', 3119, '乌鲁木齐市', 3120, '天山区', 'system', 'system', b'1', '2017-04-18 02:08:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3121, '沙依巴克区', 3, 3119, '0991', '650103', 87.59663900, 43.78887200, 3118, '新疆维吾尔自治区', 3119, '乌鲁木齐市', 3121, '沙依巴克区', 'system', 'system', b'1', '2017-04-18 02:08:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3122, '新市区', 3, 3119, '0991', '650104', 87.56065300, 43.87088200, 3118, '新疆维吾尔自治区', 3119, '乌鲁木齐市', 3122, '新市区', 'system', 'system', b'1', '2017-04-18 02:08:17', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3123, '水磨沟区', 3, 3119, '0991', '650105', 87.61309300, 43.81674700, 3118, '新疆维吾尔自治区', 3119, '乌鲁木齐市', 3123, '水磨沟区', 'system', 'system', b'1', '2017-04-18 02:08:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3124, '头屯河区', 3, 3119, '0991', '650106', 87.42582300, 43.87605300, 3118, '新疆维吾尔自治区', 3119, '乌鲁木齐市', 3124, '头屯河区', 'system', 'system', b'1', '2017-04-18 02:08:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3125, '达坂城区', 3, 3119, '0991', '650107', 88.30994000, 43.36181000, 3118, '新疆维吾尔自治区', 3119, '乌鲁木齐市', 3125, '达坂城区', 'system', 'system', b'1', '2017-04-18 02:08:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3126, '米东区', 3, 3119, '0991', '650109', 87.69180100, 43.96098200, 3118, '新疆维吾尔自治区', 3119, '乌鲁木齐市', 3126, '米东区', 'system', 'system', b'1', '2017-04-18 02:08:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3127, '乌鲁木齐县', 3, 3119, '0991', '650121', 87.50560300, 43.98254600, 3118, '新疆维吾尔自治区', 3119, '乌鲁木齐市', 3127, '乌鲁木齐县', 'system', 'system', b'1', '2017-04-18 02:08:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3128, '克拉玛依市', 2, 3118, '0990', '650200', 84.87394600, 45.59588600, 3118, '新疆维吾尔自治区', 3128, '克拉玛依市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3129, '独山子区', 3, 3128, '0990', '650202', 84.88226700, 44.32720700, 3118, '新疆维吾尔自治区', 3128, '克拉玛依市', 3129, '独山子区', 'system', 'system', b'1', '2017-04-18 02:08:18', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3130, '克拉玛依区', 3, 3128, '0990', '650203', 84.86891800, 45.60047700, 3118, '新疆维吾尔自治区', 3128, '克拉玛依市', 3130, '克拉玛依区', 'system', 'system', b'1', '2017-04-18 02:08:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3131, '白碱滩区', 3, 3128, '0990', '650204', 85.12988200, 45.68902100, 3118, '新疆维吾尔自治区', 3128, '克拉玛依市', 3131, '白碱滩区', 'system', 'system', b'1', '2017-04-18 02:08:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3132, '乌尔禾区', 3, 3128, '0990', '650205', 85.69776700, 46.08776000, 3118, '新疆维吾尔自治区', 3128, '克拉玛依市', 3132, '乌尔禾区', 'system', 'system', b'1', '2017-04-18 02:08:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3133, '吐鲁番市', 2, 3118, '0995', '650400', 89.18407800, 42.94761300, 3118, '新疆维吾尔自治区', 3133, '吐鲁番市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3134, '高昌区', 3, 3133, '0995', '650402', 89.18232400, 42.94762700, 3118, '新疆维吾尔自治区', 3133, '吐鲁番市', 3134, '高昌区', 'system', 'system', b'1', '2017-04-18 02:08:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3135, '鄯善县', 3, 3133, '0995', '650421', 90.21269200, 42.86550300, 3118, '新疆维吾尔自治区', 3133, '吐鲁番市', 3135, '鄯善县', 'system', 'system', b'1', '2017-04-18 02:08:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3136, '托克逊县', 3, 3133, '0995', '650422', 88.65577100, 42.79353600, 3118, '新疆维吾尔自治区', 3133, '吐鲁番市', 3136, '托克逊县', 'system', 'system', b'1', '2017-04-18 02:08:19', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3137, '哈密市', 2, 3118, '0902', '650500', 93.51316000, 42.83324800, 3118, '新疆维吾尔自治区', 3137, '哈密市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3138, '伊州区', 3, 3137, '0902', '650502', 93.50917400, 42.83388800, 3118, '新疆维吾尔自治区', 3137, '哈密市', 3138, '伊州区', 'system', 'system', b'1', '2017-04-18 02:08:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3139, '巴里坤哈萨克自治县', 3, 3137, '0902', '650521', 93.02179500, 43.59903200, 3118, '新疆维吾尔自治区', 3137, '哈密市', 3139, '巴里坤哈萨克自治县', 'system', 'system', b'1', '2017-04-18 02:08:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3140, '伊吾县', 3, 3137, '0902', '650522', 94.69277300, 43.25201200, 3118, '新疆维吾尔自治区', 3137, '哈密市', 3140, '伊吾县', 'system', 'system', b'1', '2017-04-18 02:08:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3141, '昌吉回族自治州', 2, 3118, '0994', '652300', 87.30401200, 44.01457700, 3118, '新疆维吾尔自治区', 3141, '昌吉回族自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3142, '昌吉市', 3, 3141, '0994', '652301', 87.30411200, 44.01318300, 3118, '新疆维吾尔自治区', 3141, '昌吉回族自治州', 3142, '昌吉市', 'system', 'system', b'1', '2017-04-18 02:08:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3143, '阜康市', 3, 3141, '0994', '652302', 87.98384000, 44.15215300, 3118, '新疆维吾尔自治区', 3141, '昌吉回族自治州', 3143, '阜康市', 'system', 'system', b'1', '2017-04-18 02:08:20', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3144, '呼图壁县', 3, 3141, '0994', '652323', 86.88861300, 44.18934200, 3118, '新疆维吾尔自治区', 3141, '昌吉回族自治州', 3144, '呼图壁县', 'system', 'system', b'1', '2017-04-18 02:08:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3145, '玛纳斯县', 3, 3141, '0994', '652324', 86.21768700, 44.30562500, 3118, '新疆维吾尔自治区', 3141, '昌吉回族自治州', 3145, '玛纳斯县', 'system', 'system', b'1', '2017-04-18 02:08:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3146, '奇台县', 3, 3141, '0994', '652325', 89.59143700, 44.02199600, 3118, '新疆维吾尔自治区', 3141, '昌吉回族自治州', 3146, '奇台县', 'system', 'system', b'1', '2017-04-18 02:08:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3147, '吉木萨尔县', 3, 3141, '0994', '652327', 89.18128800, 43.99716200, 3118, '新疆维吾尔自治区', 3141, '昌吉回族自治州', 3147, '吉木萨尔县', 'system', 'system', b'1', '2017-04-18 02:08:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3148, '木垒哈萨克自治县', 3, 3141, '0994', '652328', 90.28283300, 43.83244200, 3118, '新疆维吾尔自治区', 3141, '昌吉回族自治州', 3148, '木垒哈萨克自治县', 'system', 'system', b'1', '2017-04-18 02:08:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3149, '博尔塔拉蒙古自治州', 2, 3118, '0909', '652700', 82.07477800, 44.90325800, 3118, '新疆维吾尔自治区', 3149, '博尔塔拉蒙古自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3150, '博乐市', 3, 3149, '0909', '652701', 82.07223700, 44.90308700, 3118, '新疆维吾尔自治区', 3149, '博尔塔拉蒙古自治州', 3150, '博乐市', 'system', 'system', b'1', '2017-04-18 02:08:21', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3151, '阿拉山口市', 3, 3149, '0909', '652702', 82.56938900, 45.16777000, 3118, '新疆维吾尔自治区', 3149, '博尔塔拉蒙古自治州', 3151, '阿拉山口市', 'system', 'system', b'1', '2017-04-18 02:08:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3152, '精河县', 3, 3149, '0909', '652722', 82.89293800, 44.60564500, 3118, '新疆维吾尔自治区', 3149, '博尔塔拉蒙古自治州', 3152, '精河县', 'system', 'system', b'1', '2017-04-18 02:08:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3153, '温泉县', 3, 3149, '0909', '652723', 81.03099000, 44.97375100, 3118, '新疆维吾尔自治区', 3149, '博尔塔拉蒙古自治州', 3153, '温泉县', 'system', 'system', b'1', '2017-04-18 02:08:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3154, '巴音郭楞蒙古自治州', 2, 3118, '0996', '652800', 86.15096900, 41.76855200, 3118, '新疆维吾尔自治区', 3154, '巴音郭楞蒙古自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3155, '库尔勒市', 3, 3154, '0996', '652801', 86.14594800, 41.76312200, 3118, '新疆维吾尔自治区', 3154, '巴音郭楞蒙古自治州', 3155, '库尔勒市', 'system', 'system', b'1', '2017-04-18 02:08:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3156, '轮台县', 3, 3154, '0996', '652822', 84.24854200, 41.78126600, 3118, '新疆维吾尔自治区', 3154, '巴音郭楞蒙古自治州', 3156, '轮台县', 'system', 'system', b'1', '2017-04-18 02:08:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3157, '尉犁县', 3, 3154, '0996', '652823', 86.26341200, 41.33742800, 3118, '新疆维吾尔自治区', 3154, '巴音郭楞蒙古自治州', 3157, '尉犁县', 'system', 'system', b'1', '2017-04-18 02:08:22', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3158, '若羌县', 3, 3154, '0996', '652824', 88.16880700, 39.02380700, 3118, '新疆维吾尔自治区', 3154, '巴音郭楞蒙古自治州', 3158, '若羌县', 'system', 'system', b'1', '2017-04-18 02:08:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3159, '且末县', 3, 3154, '0996', '652825', 85.53262900, 38.13856200, 3118, '新疆维吾尔自治区', 3154, '巴音郭楞蒙古自治州', 3159, '且末县', 'system', 'system', b'1', '2017-04-18 02:08:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3160, '焉耆回族自治县', 3, 3154, '0996', '652826', 86.56980000, 42.06434900, 3118, '新疆维吾尔自治区', 3154, '巴音郭楞蒙古自治州', 3160, '焉耆回族自治县', 'system', 'system', b'1', '2017-04-18 02:08:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3161, '和静县', 3, 3154, '0996', '652827', 86.39106700, 42.31716000, 3118, '新疆维吾尔自治区', 3154, '巴音郭楞蒙古自治州', 3161, '和静县', 'system', 'system', b'1', '2017-04-18 02:08:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3162, '和硕县', 3, 3154, '0996', '652828', 86.86494700, 42.26886300, 3118, '新疆维吾尔自治区', 3154, '巴音郭楞蒙古自治州', 3162, '和硕县', 'system', 'system', b'1', '2017-04-18 02:08:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3163, '博湖县', 3, 3154, '0996', '652829', 86.63157600, 41.98016600, 3118, '新疆维吾尔自治区', 3154, '巴音郭楞蒙古自治州', 3163, '博湖县', 'system', 'system', b'1', '2017-04-18 02:08:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3164, '阿克苏地区', 2, 3118, '0997', '652900', 80.26506800, 41.17071200, 3118, '新疆维吾尔自治区', 3164, '阿克苏地区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:23', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3165, '阿克苏市', 3, 3164, '0997', '652901', 80.26290000, 41.17127200, 3118, '新疆维吾尔自治区', 3164, '阿克苏地区', 3165, '阿克苏市', 'system', 'system', b'1', '2017-04-18 02:08:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3166, '温宿县', 3, 3164, '0997', '652922', 80.24327300, 41.27299500, 3118, '新疆维吾尔自治区', 3164, '阿克苏地区', 3166, '温宿县', 'system', 'system', b'1', '2017-04-18 02:08:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3167, '库车县', 3, 3164, '0997', '652923', 82.96304000, 41.71714100, 3118, '新疆维吾尔自治区', 3164, '阿克苏地区', 3167, '库车县', 'system', 'system', b'1', '2017-04-18 02:08:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3168, '沙雅县', 3, 3164, '0997', '652924', 82.78077000, 41.22626800, 3118, '新疆维吾尔自治区', 3164, '阿克苏地区', 3168, '沙雅县', 'system', 'system', b'1', '2017-04-18 02:08:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3169, '新和县', 3, 3164, '0997', '652925', 82.61082800, 41.55117600, 3118, '新疆维吾尔自治区', 3164, '阿克苏地区', 3169, '新和县', 'system', 'system', b'1', '2017-04-18 02:08:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3170, '拜城县', 3, 3164, '0997', '652926', 81.86988100, 41.79610100, 3118, '新疆维吾尔自治区', 3164, '阿克苏地区', 3170, '拜城县', 'system', 'system', b'1', '2017-04-18 02:08:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3171, '乌什县', 3, 3164, '0997', '652927', 79.23080500, 41.21587000, 3118, '新疆维吾尔自治区', 3164, '阿克苏地区', 3171, '乌什县', 'system', 'system', b'1', '2017-04-18 02:08:24', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3172, '阿瓦提县', 3, 3164, '0997', '652928', 80.37842600, 40.63842200, 3118, '新疆维吾尔自治区', 3164, '阿克苏地区', 3172, '阿瓦提县', 'system', 'system', b'1', '2017-04-18 02:08:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3173, '柯坪县', 3, 3164, '0997', '652929', 79.04785000, 40.50624000, 3118, '新疆维吾尔自治区', 3164, '阿克苏地区', 3173, '柯坪县', 'system', 'system', b'1', '2017-04-18 02:08:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3174, '克孜勒苏柯尔克孜自治州', 2, 3118, '0908', '653000', 76.17282500, 39.71343100, 3118, '新疆维吾尔自治区', 3174, '克孜勒苏柯尔克孜自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3175, '阿图什市', 3, 3174, '0908', '653001', 76.17393900, 39.71289800, 3118, '新疆维吾尔自治区', 3174, '克孜勒苏柯尔克孜自治州', 3175, '阿图什市', 'system', 'system', b'1', '2017-04-18 02:08:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3176, '阿克陶县', 3, 3174, '0908', '653022', 75.94515900, 39.14707900, 3118, '新疆维吾尔自治区', 3174, '克孜勒苏柯尔克孜自治州', 3176, '阿克陶县', 'system', 'system', b'1', '2017-04-18 02:08:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3177, '阿合奇县', 3, 3174, '0908', '653023', 78.45016400, 40.93756700, 3118, '新疆维吾尔自治区', 3174, '克孜勒苏柯尔克孜自治州', 3177, '阿合奇县', 'system', 'system', b'1', '2017-04-18 02:08:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3178, '乌恰县', 3, 3174, '0908', '653024', 75.25969000, 39.71663300, 3118, '新疆维吾尔自治区', 3174, '克孜勒苏柯尔克孜自治州', 3178, '乌恰县', 'system', 'system', b'1', '2017-04-18 02:08:25', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3179, '喀什地区', 2, 3118, '0998', '653100', 75.98913800, 39.46766400, 3118, '新疆维吾尔自治区', 3179, '喀什地区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3180, '喀什市', 3, 3179, '0998', '653101', 75.98838000, 39.46786100, 3118, '新疆维吾尔自治区', 3179, '喀什地区', 3180, '喀什市', 'system', 'system', b'1', '2017-04-18 02:08:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3181, '疏附县', 3, 3179, '0998', '653121', 75.86307500, 39.37830600, 3118, '新疆维吾尔自治区', 3179, '喀什地区', 3181, '疏附县', 'system', 'system', b'1', '2017-04-18 02:08:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3182, '疏勒县', 3, 3179, '0998', '653122', 76.05365300, 39.39946100, 3118, '新疆维吾尔自治区', 3179, '喀什地区', 3182, '疏勒县', 'system', 'system', b'1', '2017-04-18 02:08:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3183, '英吉沙县', 3, 3179, '0998', '653123', 76.17429200, 38.92983900, 3118, '新疆维吾尔自治区', 3179, '喀什地区', 3183, '英吉沙县', 'system', 'system', b'1', '2017-04-18 02:08:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3184, '泽普县', 3, 3179, '0998', '653124', 77.27359300, 38.19121700, 3118, '新疆维吾尔自治区', 3179, '喀什地区', 3184, '泽普县', 'system', 'system', b'1', '2017-04-18 02:08:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3185, '莎车县', 3, 3179, '0998', '653125', 77.24888400, 38.41449900, 3118, '新疆维吾尔自治区', 3179, '喀什地区', 3185, '莎车县', 'system', 'system', b'1', '2017-04-18 02:08:26', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3186, '叶城县', 3, 3179, '0998', '653126', 77.42035300, 37.88467900, 3118, '新疆维吾尔自治区', 3179, '喀什地区', 3186, '叶城县', 'system', 'system', b'1', '2017-04-18 02:08:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3187, '麦盖提县', 3, 3179, '0998', '653127', 77.65153800, 38.90338400, 3118, '新疆维吾尔自治区', 3179, '喀什地区', 3187, '麦盖提县', 'system', 'system', b'1', '2017-04-18 02:08:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3188, '岳普湖县', 3, 3179, '0998', '653128', 76.77240000, 39.23524800, 3118, '新疆维吾尔自治区', 3179, '喀什地区', 3188, '岳普湖县', 'system', 'system', b'1', '2017-04-18 02:08:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3189, '伽师县', 3, 3179, '0998', '653129', 76.74198200, 39.49432500, 3118, '新疆维吾尔自治区', 3179, '喀什地区', 3189, '伽师县', 'system', 'system', b'1', '2017-04-18 02:08:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3190, '巴楚县', 3, 3179, '0998', '653130', 78.55041000, 39.78347900, 3118, '新疆维吾尔自治区', 3179, '喀什地区', 3190, '巴楚县', 'system', 'system', b'1', '2017-04-18 02:08:27', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3191, '塔什库尔干塔吉克自治县', 3, 3179, '0998', '653131', 75.22806800, 37.77543700, 3118, '新疆维吾尔自治区', 3179, '喀什地区', 3191, '塔什库尔干塔吉克自治县', 'system', 'system', b'1', '2017-04-18 02:08:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3192, '和田地区', 2, 3118, '0903', '653200', 79.92533000, 37.11068700, 3118, '新疆维吾尔自治区', 3192, '和田地区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3193, '和田市', 3, 3192, '0903', '653201', 79.92754200, 37.10894400, 3118, '新疆维吾尔自治区', 3192, '和田地区', 3193, '和田市', 'system', 'system', b'1', '2017-04-18 02:08:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3194, '和田县', 3, 3192, '0903', '653221', 79.81907000, 37.12003100, 3118, '新疆维吾尔自治区', 3192, '和田地区', 3194, '和田县', 'system', 'system', b'1', '2017-04-18 02:08:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3195, '墨玉县', 3, 3192, '0903', '653222', 79.73662900, 37.27151100, 3118, '新疆维吾尔自治区', 3192, '和田地区', 3195, '墨玉县', 'system', 'system', b'1', '2017-04-18 02:08:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3196, '皮山县', 3, 3192, '0903', '653223', 78.28230100, 37.61633200, 3118, '新疆维吾尔自治区', 3192, '和田地区', 3196, '皮山县', 'system', 'system', b'1', '2017-04-18 02:08:28', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3197, '洛浦县', 3, 3192, '0903', '653224', 80.18403800, 37.07437700, 3118, '新疆维吾尔自治区', 3192, '和田地区', 3197, '洛浦县', 'system', 'system', b'1', '2017-04-18 02:08:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3198, '策勒县', 3, 3192, '0903', '653225', 80.80357200, 37.00167200, 3118, '新疆维吾尔自治区', 3192, '和田地区', 3198, '策勒县', 'system', 'system', b'1', '2017-04-18 02:08:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3199, '于田县', 3, 3192, '0903', '653226', 81.66784500, 36.85462800, 3118, '新疆维吾尔自治区', 3192, '和田地区', 3199, '于田县', 'system', 'system', b'1', '2017-04-18 02:08:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3200, '民丰县', 3, 3192, '0903', '653227', 82.69235400, 37.06490900, 3118, '新疆维吾尔自治区', 3192, '和田地区', 3200, '民丰县', 'system', 'system', b'1', '2017-04-18 02:08:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3201, '伊犁哈萨克自治州', 2, 3118, '0999', '654000', 81.31794600, 43.92186000, 3118, '新疆维吾尔自治区', 3201, '伊犁哈萨克自治州', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3202, '伊宁市', 3, 3201, '0999', '654002', 81.31634300, 43.92220900, 3118, '新疆维吾尔自治区', 3201, '伊犁哈萨克自治州', 3202, '伊宁市', 'system', 'system', b'1', '2017-04-18 02:08:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3203, '奎屯市', 3, 3201, '0999', '654003', 84.90160200, 44.42344500, 3118, '新疆维吾尔自治区', 3201, '伊犁哈萨克自治州', 3203, '奎屯市', 'system', 'system', b'1', '2017-04-18 02:08:29', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3204, '霍尔果斯市', 3, 3201, '0999', '654004', 80.42075900, 44.20166900, 3118, '新疆维吾尔自治区', 3201, '伊犁哈萨克自治州', 3204, '霍尔果斯市', 'system', 'system', b'1', '2017-04-18 02:08:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3205, '伊宁县', 3, 3201, '0999', '654021', 81.52467100, 43.97787600, 3118, '新疆维吾尔自治区', 3201, '伊犁哈萨克自治州', 3205, '伊宁县', 'system', 'system', b'1', '2017-04-18 02:08:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3206, '察布查尔锡伯自治县', 3, 3201, '0999', '654022', 81.15087400, 43.83888300, 3118, '新疆维吾尔自治区', 3201, '伊犁哈萨克自治州', 3206, '察布查尔锡伯自治县', 'system', 'system', b'1', '2017-04-18 02:08:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3207, '霍城县', 3, 3201, '0999', '654023', 80.87250800, 44.04991200, 3118, '新疆维吾尔自治区', 3201, '伊犁哈萨克自治州', 3207, '霍城县', 'system', 'system', b'1', '2017-04-18 02:08:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3208, '巩留县', 3, 3201, '0999', '654024', 82.22704400, 43.48161800, 3118, '新疆维吾尔自治区', 3201, '伊犁哈萨克自治州', 3208, '巩留县', 'system', 'system', b'1', '2017-04-18 02:08:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3209, '新源县', 3, 3201, '0999', '654025', 83.25849300, 43.43424900, 3118, '新疆维吾尔自治区', 3201, '伊犁哈萨克自治州', 3209, '新源县', 'system', 'system', b'1', '2017-04-18 02:08:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3210, '昭苏县', 3, 3201, '0999', '654026', 81.12602900, 43.15776500, 3118, '新疆维吾尔自治区', 3201, '伊犁哈萨克自治州', 3210, '昭苏县', 'system', 'system', b'1', '2017-04-18 02:08:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3211, '特克斯县', 3, 3201, '0999', '654027', 81.84005800, 43.21486100, 3118, '新疆维吾尔自治区', 3201, '伊犁哈萨克自治州', 3211, '特克斯县', 'system', 'system', b'1', '2017-04-18 02:08:30', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3212, '尼勒克县', 3, 3201, '0999', '654028', 82.50411900, 43.78973700, 3118, '新疆维吾尔自治区', 3201, '伊犁哈萨克自治州', 3212, '尼勒克县', 'system', 'system', b'1', '2017-04-18 02:08:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3213, '塔城地区', 2, 3118, '0901', '654200', 82.98573200, 46.74630100, 3118, '新疆维吾尔自治区', 3213, '塔城地区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3214, '塔城市', 3, 3213, '0901', '654201', 82.98398800, 46.74628100, 3118, '新疆维吾尔自治区', 3213, '塔城地区', 3214, '塔城市', 'system', 'system', b'1', '2017-04-18 02:08:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3215, '乌苏市', 3, 3213, '0901', '654202', 84.67762400, 44.43011500, 3118, '新疆维吾尔自治区', 3213, '塔城地区', 3215, '乌苏市', 'system', 'system', b'1', '2017-04-18 02:08:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3216, '额敏县', 3, 3213, '0901', '654221', 83.62211800, 46.52255500, 3118, '新疆维吾尔自治区', 3213, '塔城地区', 3216, '额敏县', 'system', 'system', b'1', '2017-04-18 02:08:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3217, '沙湾县', 3, 3213, '0901', '654223', 85.62250800, 44.32954400, 3118, '新疆维吾尔自治区', 3213, '塔城地区', 3217, '沙湾县', 'system', 'system', b'1', '2017-04-18 02:08:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3218, '托里县', 3, 3213, '0901', '654224', 83.60469000, 45.93586300, 3118, '新疆维吾尔自治区', 3213, '塔城地区', 3218, '托里县', 'system', 'system', b'1', '2017-04-18 02:08:31', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3219, '裕民县', 3, 3213, '0901', '654225', 82.98215700, 46.20278100, 3118, '新疆维吾尔自治区', 3213, '塔城地区', 3219, '裕民县', 'system', 'system', b'1', '2017-04-18 02:08:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3220, '和布克赛尔蒙古自治县', 3, 3213, '0901', '654226', 85.73355100, 46.79300100, 3118, '新疆维吾尔自治区', 3213, '塔城地区', 3220, '和布克赛尔蒙古自治县', 'system', 'system', b'1', '2017-04-18 02:08:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3221, '阿勒泰地区', 2, 3118, '0906', '654300', 88.13963000, 47.84839300, 3118, '新疆维吾尔自治区', 3221, '阿勒泰地区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3222, '阿勒泰市', 3, 3221, '0906', '654301', 88.13874300, 47.84891100, 3118, '新疆维吾尔自治区', 3221, '阿勒泰地区', 3222, '阿勒泰市', 'system', 'system', b'1', '2017-04-18 02:08:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3223, '布尔津县', 3, 3221, '0906', '654321', 86.86186000, 47.70453000, 3118, '新疆维吾尔自治区', 3221, '阿勒泰地区', 3223, '布尔津县', 'system', 'system', b'1', '2017-04-18 02:08:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3224, '富蕴县', 3, 3221, '0906', '654322', 89.52499300, 46.99310600, 3118, '新疆维吾尔自治区', 3221, '阿勒泰地区', 3224, '富蕴县', 'system', 'system', b'1', '2017-04-18 02:08:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3225, '福海县', 3, 3221, '0906', '654323', 87.49456900, 47.11312800, 3118, '新疆维吾尔自治区', 3221, '阿勒泰地区', 3225, '福海县', 'system', 'system', b'1', '2017-04-18 02:08:32', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3226, '哈巴河县', 3, 3221, '0906', '654324', 86.41896400, 48.05928400, 3118, '新疆维吾尔自治区', 3221, '阿勒泰地区', 3226, '哈巴河县', 'system', 'system', b'1', '2017-04-18 02:08:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3227, '青河县', 3, 3221, '0906', '654325', 90.38156100, 46.67244600, 3118, '新疆维吾尔自治区', 3221, '阿勒泰地区', 3227, '青河县', 'system', 'system', b'1', '2017-04-18 02:08:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3228, '吉木乃县', 3, 3221, '0906', '654326', 85.87606400, 47.43463300, 3118, '新疆维吾尔自治区', 3221, '阿勒泰地区', 3228, '吉木乃县', 'system', 'system', b'1', '2017-04-18 02:08:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3229, '石河子市', 2, 3118, '0993', '659001', 86.04107500, 44.30588600, 3118, '新疆维吾尔自治区', 3229, '石河子市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3230, '阿拉尔市', 2, 3118, '1997', '659002', 81.28588400, 40.54191400, 3118, '新疆维吾尔自治区', 3230, '阿拉尔市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3231, '图木舒克市', 2, 3118, '1998', '659003', 79.07797800, 39.86731600, 3118, '新疆维吾尔自治区', 3231, '图木舒克市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3232, '五家渠市', 2, 3118, '1994', '659004', 87.52688400, 44.16740100, 3118, '新疆维吾尔自治区', 3232, '五家渠市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:33', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3233, '北屯市', 2, 3118, '1906', '659005', 87.82493200, 47.35317700, 3118, '新疆维吾尔自治区', 3233, '北屯市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3234, '铁门关市', 2, 3118, '1996', '659006', 85.50121800, 41.82725100, 3118, '新疆维吾尔自治区', 3234, '铁门关市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3235, '双河市', 2, 3118, '1909', '659007', 82.35365600, 44.84052400, 3118, '新疆维吾尔自治区', 3235, '双河市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3236, '可克达拉市', 2, 3118, '1999', '659008', 80.63579000, 43.68320000, 3118, '新疆维吾尔自治区', 3236, '可克达拉市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3237, '昆玉市', 2, 3118, '1903', '659009', 79.28737200, 37.20799400, 3118, '新疆维吾尔自治区', 3237, '昆玉市', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3238, '台湾省', 1, 1, '1886', '710000', 121.50906200, 25.04433200, 3238, '台湾省', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3239, '香港特别行政区', 1, 1, '1852', '810000', 114.17335500, 22.32004800, 3239, '香港特别行政区', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:34', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3240, '中西区', 2, 3239, '1852', '810001', 114.15433400, 22.28193100, 3239, '香港特别行政区', 3240, '中西区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3241, '湾仔区', 2, 3239, '1852', '810002', 114.18299000, 22.27634500, 3239, '香港特别行政区', 3241, '湾仔区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3242, '东区', 2, 3239, '1852', '810003', 114.22596500, 22.27977900, 3239, '香港特别行政区', 3242, '东区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3243, '南区', 2, 3239, '1852', '810004', 114.16002300, 22.24581100, 3239, '香港特别行政区', 3243, '南区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3244, '油尖旺区', 2, 3239, '1852', '810005', 114.17334700, 22.31163200, 3239, '香港特别行政区', 3244, '油尖旺区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3245, '深水埗区', 2, 3239, '1852', '810006', 114.16334900, 22.33377500, 3239, '香港特别行政区', 3245, '深水埗区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3246, '九龙城区', 2, 3239, '1852', '810007', 114.19304700, 22.31237300, 3239, '香港特别行政区', 3246, '九龙城区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:35', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3247, '黄大仙区', 2, 3239, '1852', '810008', 114.20398500, 22.33611200, 3239, '香港特别行政区', 3247, '黄大仙区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3248, '观塘区', 2, 3239, '1852', '810009', 114.21408300, 22.32067900, 3239, '香港特别行政区', 3248, '观塘区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3249, '荃湾区', 2, 3239, '1852', '810010', 114.12123400, 22.36845800, 3239, '香港特别行政区', 3249, '荃湾区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3250, '屯门区', 2, 3239, '1852', '810011', 113.97630800, 22.39389600, 3239, '香港特别行政区', 3250, '屯门区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3251, '元朗区', 2, 3239, '1852', '810012', 114.03252800, 22.44132000, 3239, '香港特别行政区', 3251, '元朗区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3252, '北区', 2, 3239, '1852', '810013', 114.14740400, 22.49614300, 3239, '香港特别行政区', 3252, '北区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3253, '大埔区', 2, 3239, '1852', '810014', 114.17171300, 22.44573000, 3239, '香港特别行政区', 3253, '大埔区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:36', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3254, '西贡区', 2, 3239, '1852', '810015', 114.26481300, 22.31420300, 3239, '香港特别行政区', 3254, '西贡区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3255, '沙田区', 2, 3239, '1852', '810016', 114.19512600, 22.37971500, 3239, '香港特别行政区', 3255, '沙田区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3256, '葵青区', 2, 3239, '1852', '810017', 114.13918000, 22.36390800, 3239, '香港特别行政区', 3256, '葵青区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3257, '离岛区', 2, 3239, '1852', '810018', 113.94605900, 22.28637100, 3239, '香港特别行政区', 3257, '离岛区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3258, '澳门特别行政区', 1, 1, '1853', '820000', 113.54909000, 22.19895100, 3258, '澳门特别行政区', NULL, NULL, NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3259, '花地玛堂区', 2, 3258, '1853', '820001', 113.55296500, 22.20788200, 3258, '澳门特别行政区', 3259, '花地玛堂区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3260, '花王堂区', 2, 3258, '1853', '820002', 113.54905200, 22.19917500, 3258, '澳门特别行政区', 3260, '花王堂区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:37', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3261, '望德堂区', 2, 3258, '1853', '820003', 113.55025200, 22.19379100, 3258, '澳门特别行政区', 3261, '望德堂区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3262, '大堂区', 2, 3258, '1853', '820004', 113.55374000, 22.18811900, 3258, '澳门特别行政区', 3262, '大堂区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3263, '风顺堂区', 2, 3258, '1853', '820005', 113.54167000, 22.18777800, 3258, '澳门特别行政区', 3263, '风顺堂区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3264, '嘉模堂区', 2, 3258, '1853', '820006', 113.55878300, 22.15412400, 3258, '澳门特别行政区', 3264, '嘉模堂区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3265, '路凼填海区', 2, 3258, '1853', '820007', 113.56925000, 22.13654600, 3258, '澳门特别行政区', 3265, '路凼填海区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3266, '圣方济各堂区', 2, 3258, '1853', '820008', 113.55995400, 22.12404900, 3258, '澳门特别行政区', 3266, '圣方济各堂区', NULL, NULL, 'system', 'system', b'1', '2017-04-18 02:08:38', '2017-04-18 02:12:06');
INSERT INTO `le_sys_region` VALUES (3267, '高新区', 3, 2288, '028', '510184', 103.67104900, 30.63147800, 2287, '四川省', 2288, '成都市', 2308, '高新区', 'system', 'system', b'1', '2018-02-01 13:06:21', '2018-02-01 13:12:06');
COMMIT;

-- ----------------------------
-- Table structure for le_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `le_sys_user`;
CREATE TABLE `le_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` text COMMENT '系统用户名称',
  `password` text COMMENT '系统用户登录密码，MD5加密',
  `phone` text CHARACTER SET latin1 COMMENT '系统用户手机号',
  `typeId` bigint(20) DEFAULT NULL COMMENT '系统用户类型',
  `modifiedDateTime` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) NOT NULL COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12425 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of le_sys_user
-- ----------------------------
BEGIN;
INSERT INTO `le_sys_user` VALUES (1, 'admin', 'YWRtaW4yMDE3', '13219630317', 1, '2017-08-30 00:00:00', '2017-08-30 00:00:00', 0);
INSERT INTO `le_sys_user` VALUES (4, '12123', 'MTEyMzEyMzEzNDEzNGFzZGFkYWFzZA==', '13219630317', 1, '2017-08-30 00:00:00', '2017-08-30 00:00:00', 0);
INSERT INTO `le_sys_user` VALUES (5, '1ad12', 'MTEyMzEyMzEzNDEzNGFzZGFkYWFzZA==', '13219630317', 2, '2017-08-30 00:00:00', '2017-08-30 00:00:00', 0);
INSERT INTO `le_sys_user` VALUES (6, '1a2312', 'MTEyMzEyMzEzNDEzNGFzZGFkYWFzZA==', '13219630317', 3, '2017-08-30 00:00:00', '2017-08-30 00:00:00', 0);
INSERT INTO `le_sys_user` VALUES (7, '1a2312', 'MTEyMzEyMzEzNDEzNGFzZGFkYWFzZA==', '13219630317', 3, '2017-08-30 00:00:00', '2017-08-30 00:00:00', 0);
INSERT INTO `le_sys_user` VALUES (8, '1a2312', 'MTEyMzEyMzEzNDEzNGFzZGFkYWFzZA==', '13219630317', 3, '2017-08-30 00:00:00', '2017-08-30 00:00:00', 0);
INSERT INTO `le_sys_user` VALUES (9, '1a2312', 'MTEyMzEyMzEzNDEzNGFzZGFkYWFzZA==', '13219630317', 3, '2017-08-30 00:00:00', '2017-08-30 00:00:00', 0);
INSERT INTO `le_sys_user` VALUES (12419, 'asdasd', 'MTIxMzEzNA==', '13219889900', 2, '2017-08-30 00:00:00', '2017-08-30 00:00:00', 0);
INSERT INTO `le_sys_user` VALUES (12420, 'asdasd', 'MTIxMzEzNA==', '13219889900', 2, '2017-08-30 00:00:00', '2017-08-30 00:00:00', 0);
INSERT INTO `le_sys_user` VALUES (12421, 'asdasd', 'MTIxMzEzNA==', '13219889900', 2, '2017-08-30 00:00:00', '2017-08-30 00:00:00', 0);
INSERT INTO `le_sys_user` VALUES (12422, 'asdasd', 'MTIxMzEzNA==', '13219889900', 2, '2017-08-30 00:00:00', '2017-08-30 00:00:00', 0);
INSERT INTO `le_sys_user` VALUES (12423, 'asdasd', 'MTIxMzEzNA==', '13219889900', 2, '2017-08-30 00:00:00', '2017-08-30 00:00:00', 0);
INSERT INTO `le_sys_user` VALUES (12424, 'asdasd', 'MTIxMzEzNA==', '13219889900', 2, '2017-08-30 00:00:00', '2017-08-30 00:00:00', 0);
COMMIT;

-- ----------------------------
-- Table structure for le_sys_user_type
-- ----------------------------
DROP TABLE IF EXISTS `le_sys_user_type`;
CREATE TABLE `le_sys_user_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` text COMMENT '系统用户类型名称',
  `desc` text COMMENT '系统用户类型描述',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) NOT NULL COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户类型表';

-- ----------------------------
-- Table structure for le_sys_woker_type
-- ----------------------------
DROP TABLE IF EXISTS `le_sys_woker_type`;
CREATE TABLE `le_sys_woker_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` text COMMENT '工种类型名称',
  `description` text COMMENT '工种类型描述',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) NOT NULL COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='系统用户类型表';

-- ----------------------------
-- Records of le_sys_woker_type
-- ----------------------------
BEGIN;
INSERT INTO `le_sys_woker_type` VALUES (1, '电工', '从事电力生产和电气制造电气维修、建筑安装行业等工业生产体系的人员（工种）。从事电磁领域的客观规律研究及其应用的人员，通常称电气工程师。', '2017-09-19 00:00:00', '2017-08-28 00:00:00', 0);
INSERT INTO `le_sys_woker_type` VALUES (2, '木工', '木工（Wood Working）是一门工艺，也是建筑常用的技术，是中国传统三行（即木工、木头、木匠）之一。木工是为业主完成房屋装修过程中的各项木质工程的工种。', '2017-09-14 00:00:00', '2017-08-28 00:00:00', 0);
INSERT INTO `le_sys_woker_type` VALUES (3, '焊工', '焊工是采用合适的焊接方式，合理的焊接工艺，适当的焊接设备，采用同材质或不同材质的填充物，来将金属或非金属工件紧密连接的一个工种。', '2017-09-14 00:00:00', '2017-08-28 00:00:00', 0);
INSERT INTO `le_sys_woker_type` VALUES (13, '技工', '技工的含义是指有专长或职业技能的技术人员，技工工种大约有3类，凭借着本身的技能，负责着某一工作领域或生产制造流水线的正常运行·是否是高级技工，是凭掌握技能的多少和层次高低而定的。.技工学校(technical school) 是培养技术技能型人才的主要基地。', '2018-01-21 14:18:43', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (14, '瓦工', '瓦工就是用砖或砌块和砂浆砌筑房屋、烟囱或房顶铺瓦砖及其它构筑物的工人。', '2018-01-21 14:17:55', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (15, '万能工', '万能工', '2018-01-21 14:18:35', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (16, '包装工', '包装工', '2018-01-21 14:18:03', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (17, '电梯工', '电梯工', '2018-01-21 14:17:59', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (35, 'a', 'a', '2017-09-14 00:00:00', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (36, 'aaaa', 'aaa', '2017-09-14 00:00:00', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (37, '木工1111111111111', 'aaa', '2017-09-14 00:00:00', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (39, 'vvvv', 'vvvvvv', '2017-09-13 00:00:00', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (40, 'dddd', 'dddd', '2017-09-13 00:00:00', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (41, 'wqwewqe', 'qweqeqwe', '2017-09-13 00:00:00', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (42, 'aa', 'aaa', '2017-09-13 00:00:00', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (43, 'aaaaaa', 'aaaaaaaa', '2017-09-13 00:00:00', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (44, 'aaaaa', 'aaaaa', '2017-09-13 00:00:00', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (45, 'myNameIsJuck', 'myNameIsJuck,Are you believe in?', '2017-09-13 00:00:00', '2017-09-13 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (46, '多元多次方程', '多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次方程多元多次', '2017-09-19 00:00:00', '2017-09-14 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (47, '我是个假的工种', '就问你信不信！！哈哈哈！！！', '2017-09-14 00:00:00', '2017-09-14 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (48, '你慢慢来，我不管！', '你慢慢来，我不管！你慢慢来，我不管！', '2017-09-19 00:00:00', '2017-09-14 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (49, 'Edit it b', 'Edit it bEdit it bEdit it bEdit it b', '2017-09-19 00:00:00', '2017-09-19 00:00:00', 1);
INSERT INTO `le_sys_woker_type` VALUES (50, '普工', '普工,顾名思义 ,普通的工人。普工指的是， 拥有基本的技能， 能胜任普通工作的人员。普工在珠三角和长三角地区制造型工厂是用来指在生产线上做一些技术要求不高的岗位的员工.', '2018-01-27 10:40:01', '2018-01-22 10:34:44', 0);
INSERT INTO `le_sys_woker_type` VALUES (51, 'aaaaaaaa', 'aaaaaaaa', '2018-01-27 10:34:02', '2018-01-27 10:33:33', 1);
INSERT INTO `le_sys_woker_type` VALUES (52, 'sssssssss', 'sssssssss', '2018-01-27 10:33:50', '2018-01-27 10:33:43', 1);
INSERT INTO `le_sys_woker_type` VALUES (53, '啊啊啊啊啊啊啊', '啊啊啊啊啊啊啊', '2018-01-27 10:35:10', '2018-01-27 10:34:57', 1);
COMMIT;

-- ----------------------------
-- Table structure for le_sys_z_config_ini
-- ----------------------------
DROP TABLE IF EXISTS `le_sys_z_config_ini`;
CREATE TABLE `le_sys_z_config_ini` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` text COMMENT '系统配置KEY',
  `keyDesc` text COMMENT '系统配置KEY描述',
  `value` int(11) DEFAULT '0' COMMENT '系统配置VALUE，默认0，1-打开，0-关闭',
  `modifiedDateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createdDateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否被删除/隐藏 1-删除 0-正常 -1-封印',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of le_sys_z_config_ini
-- ----------------------------
BEGIN;
INSERT INTO `le_sys_z_config_ini` VALUES (4, 'z_auto_rna', '自动实名认证', 1, '2017-11-16 15:04:23', '2017-11-16 15:03:28', 0);
INSERT INTO `le_sys_z_config_ini` VALUES (5, 'z_valid_fast_sms', '启动sms后门', 1, '2017-12-14 17:01:03', '2017-11-16 15:05:35', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
