/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : merrydb

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2018-12-07 18:11:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '管理员名称',
  `password` varchar(32) DEFAULT NULL COMMENT '密码 MD5加密',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`adminId`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2012-08-08 00:00:00');
INSERT INTO `admin` VALUES ('2', '观音', 'e10adc3949ba59abbe56e057f20f883e', '2016-08-29 15:03:11');
INSERT INTO `admin` VALUES ('8', '王飞', '123456', '2016-08-29 15:46:09');

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `key` varchar(45) NOT NULL COMMENT 'Key',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '鍊?',
  `description` text COMMENT '描述',
  `createTime` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='网站配置';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('merry_template', 'user', '模板', null);
INSERT INTO `config` VALUES ('merry_user_drawCount', '1', '抽奖次数', null);

-- ----------------------------
-- Table structure for `loginlog`
-- ----------------------------
DROP TABLE IF EXISTS `loginlog`;
CREATE TABLE `loginlog` (
  `logid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '娑撳鏁?',
  `mobilephone` varchar(11) DEFAULT NULL COMMENT '用户手机号',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `createtime` datetime DEFAULT NULL COMMENT '访问时间',
  `ip` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `descString` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=1081 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loginlog
-- ----------------------------
INSERT INTO `loginlog` VALUES ('816', '13717561547', '18', '2018-12-05 10:59:27', '0:0:0:0:0:0:0:1', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('817', '13717561547', '18', '2018-12-05 11:00:13', '0:0:0:0:0:0:0:1', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('818', '13717561547', '18', '2018-12-05 11:00:22', '0:0:0:0:0:0:0:1', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('819', '13717561547', '18', '2018-12-05 11:08:37', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('820', '13520081506', '19', '2018-12-05 11:20:37', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('821', '13581865075', '20', '2018-12-05 11:20:59', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('822', '13520081506', '19', '2018-12-05 11:24:08', '14.116.137.167', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('823', '13581865075', '20', '2018-12-05 11:24:15', '101.227.139.161', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('824', '13581865075', '20', '2018-12-05 11:24:27', '106.121.62.77', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('825', '13581865075', '20', '2018-12-05 11:24:31', '1.202.176.10', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('826', '13581865075', '20', '2018-12-05 11:24:44', '106.121.62.77', 'wx10086', '领取流量');
INSERT INTO `loginlog` VALUES ('827', '13581865075', '20', '2018-12-05 11:24:59', '223.104.3.36', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('828', '13520081506', '19', '2018-12-05 11:25:03', '101.89.29.78', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('829', '13520081506', '19', '2018-12-05 11:25:07', '101.91.60.107', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('830', '13520081506', '19', '2018-12-05 11:25:08', '223.166.222.110', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('831', '13581865075', '20', '2018-12-05 11:25:15', '61.129.6.159', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('832', '13581865075', '20', '2018-12-05 11:25:27', '61.151.178.163', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('833', '13581865075', '20', '2018-12-05 11:25:30', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('834', '13581865075', '20', '2018-12-05 11:25:31', '61.129.6.251', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('835', '13581865075', '20', '2018-12-05 11:25:58', '61.151.207.205', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('836', '13581865075', '20', '2018-12-05 11:26:30', '101.89.19.149', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('837', '13581865075', '20', '2018-12-05 11:27:04', '1.202.176.10', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('838', '13581865075', '20', '2018-12-05 11:27:06', '106.121.62.77', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('839', '13581865075', '20', '2018-12-05 11:27:15', '1.202.176.10', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('840', '13581865075', '20', '2018-12-05 11:27:19', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('841', '13581865075', '20', '2018-12-05 11:28:04', '101.91.60.107', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('842', '13581865075', '20', '2018-12-05 11:28:06', '61.129.6.251', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('843', '13581865075', '20', '2018-12-05 11:29:32', '115.120.0.3', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('844', '13581865075', '20', '2018-12-05 11:31:53', '61.129.10.43', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('845', '13581865075', '20', '2018-12-05 11:32:28', '1.202.176.10', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('846', '13581865075', '20', '2018-12-05 11:32:34', '61.129.7.217', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('847', '13581865075', '20', '2018-12-05 11:32:53', '223.166.222.110', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('848', '13581865075', '20', '2018-12-05 11:32:53', '101.226.225.84', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('849', '13581865075', '20', '2018-12-05 11:33:00', '1.202.176.10', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('850', '13581865075', '20', '2018-12-05 11:33:13', '14.116.133.171', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('851', '13581865075', '20', '2018-12-05 11:33:28', '101.227.139.171', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('852', '13581865075', '20', '2018-12-05 11:33:33', '61.129.6.227', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('853', '13581865075', '20', '2018-12-05 11:33:53', '101.89.19.149', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('854', '13581865075', '20', '2018-12-05 11:34:00', '61.151.178.197', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('855', '13581865075', '20', '2018-12-05 11:34:04', '117.136.0.174', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('856', '13581865075', '20', '2018-12-05 11:34:12', '61.151.207.141', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('857', '13581865075', '20', '2018-12-05 11:34:12', '101.91.62.89', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('858', '13581865075', '20', '2018-12-05 11:34:32', '117.136.0.170', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('859', '13581865075', '20', '2018-12-05 11:34:50', '1.202.176.10', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('860', '13581865075', '20', '2018-12-05 11:34:59', '61.129.6.147', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('861', '13811811609', '21', '2018-12-05 11:35:03', '117.136.0.174', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('862', '13581865075', '20', '2018-12-05 11:35:04', '101.89.239.120', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('863', '13811811609', '21', '2018-12-05 11:35:13', '117.136.0.174', 'wx10086', '领取流量');
INSERT INTO `loginlog` VALUES ('864', '13811811609', '21', '2018-12-05 11:35:17', '1.202.176.10', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('865', '13810162830', '22', '2018-12-05 11:35:21', '117.136.0.170', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('866', '13811811609', '21', '2018-12-05 11:35:24', '117.136.0.174', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('867', '13581865075', '20', '2018-12-05 11:35:50', '61.151.178.165', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('868', '13811811609', '21', '2018-12-05 11:36:01', '61.151.178.177', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('869', '13811811609', '21', '2018-12-05 11:36:03', '61.151.178.165', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('870', '13811811609', '21', '2018-12-05 11:36:17', '101.89.29.97', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('871', '13810162830', '22', '2018-12-05 11:36:19', '61.151.178.177', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('872', '13810162830', '22', '2018-12-05 11:36:39', '117.136.0.174', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('873', '13810162830', '22', '2018-12-05 11:37:39', '180.97.118.223', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('874', '13810162830', '22', '2018-12-05 11:39:02', '106.121.62.77', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('875', '13810162830', '22', '2018-12-05 11:40:02', '101.91.62.99', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('876', '13581865075', '20', '2018-12-05 11:54:36', '117.136.0.174', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('877', '13581865075', '20', '2018-12-05 11:55:36', '61.129.6.225', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('878', '13581865075', '20', '2018-12-05 11:58:00', '106.121.61.206', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('879', '13581865075', '20', '2018-12-05 11:58:59', '61.151.207.186', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('880', '13810319167', '23', '2018-12-05 11:59:23', '115.120.0.3', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('881', '13810319167', '23', '2018-12-05 11:59:40', '101.227.139.172', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('882', '13810319167', '23', '2018-12-05 12:00:25', '101.89.239.120', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('883', '13810319167', '23', '2018-12-05 12:00:49', '117.136.0.174', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('884', '13810319167', '23', '2018-12-05 12:01:14', '117.136.0.174', 'wx10086', '领取流量');
INSERT INTO `loginlog` VALUES ('885', '13810319167', '23', '2018-12-05 12:01:46', '117.136.0.174', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('886', '13810319167', '23', '2018-12-05 12:03:13', '117.136.0.170', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('887', '13810319167', '23', '2018-12-05 12:03:23', '106.121.61.206', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('888', '13581865075', '20', '2018-12-05 12:06:31', '117.136.0.174', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('889', '13581865075', '20', '2018-12-05 12:07:31', '101.89.19.197', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('890', '13810319167', '23', '2018-12-05 12:08:18', '117.136.0.174', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('891', '13581865075', '20', '2018-12-05 12:17:06', '223.69.232.107', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('892', '13581865075', '20', '2018-12-05 12:18:06', '101.226.226.221', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('893', '13581865075', '20', '2018-12-05 12:26:18', '117.136.0.174', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('894', '13581865075', '20', '2018-12-05 12:27:18', '61.151.178.165', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('895', '13581865075', '20', '2018-12-05 13:11:15', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('896', '13581865075', '20', '2018-12-05 13:11:51', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('897', '13581865075', '20', '2018-12-05 13:12:24', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('898', '13581865075', '20', '2018-12-05 13:12:58', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('899', '13581865075', '20', '2018-12-05 13:13:19', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('900', '13581865075', '20', '2018-12-05 13:14:08', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('901', '13581865075', '20', '2018-12-05 13:14:44', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('902', '13810162830', '22', '2018-12-05 13:26:34', '1.202.176.10', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('903', '13810162830', '22', '2018-12-05 13:27:05', '1.202.176.10', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('904', '13810162830', '22', '2018-12-05 13:27:34', '101.91.60.107', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('905', '13810162830', '22', '2018-12-05 13:28:05', '61.151.207.141', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('906', '13581865075', '20', '2018-12-05 13:28:21', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('907', '13581865075', '20', '2018-12-05 13:33:41', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('908', '13581865075', '20', '2018-12-05 13:35:39', '0:0:0:0:0:0:0:1', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('909', '13581865075', '20', '2018-12-05 13:36:05', '0:0:0:0:0:0:0:1', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('910', '13581865075', '20', '2018-12-05 13:38:35', '0:0:0:0:0:0:0:1', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('911', '13581865075', '20', '2018-12-05 13:39:07', '0:0:0:0:0:0:0:1', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('912', '13581865075', '20', '2018-12-05 13:40:47', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('913', '13810162830', '22', '2018-12-05 14:21:37', '61.129.6.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('914', '13581865075', '20', '2018-12-05 14:23:27', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('915', '13581865075', '20', '2018-12-05 14:24:01', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('916', '13581865075', '20', '2018-12-05 14:24:53', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('917', '13581865075', '20', '2018-12-05 14:25:10', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('918', '13581865075', '20', '2018-12-05 14:25:55', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('919', '13581865075', '20', '2018-12-05 14:26:09', '101.89.19.149', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('920', '13581865075', '20', '2018-12-05 14:26:50', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('921', '13581865075', '20', '2018-12-05 14:27:06', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('922', '13581865075', '20', '2018-12-05 14:28:09', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('923', '13581865075', '20', '2018-12-05 14:28:39', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('924', '13581865075', '20', '2018-12-05 14:31:43', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('925', '13581865075', '20', '2018-12-05 14:31:45', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('926', '13581865075', '20', '2018-12-05 14:31:47', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('927', '13581865075', '20', '2018-12-05 14:32:32', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('928', '13581865075', '20', '2018-12-05 14:34:41', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('929', '13581865075', '20', '2018-12-05 14:36:10', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('930', '13581865075', '20', '2018-12-05 14:36:37', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('931', '13581865075', '20', '2018-12-05 14:36:42', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('932', '13581865075', '20', '2018-12-05 14:37:21', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('933', '13581865075', '20', '2018-12-05 14:37:41', '61.129.6.225', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('934', '13581865075', '20', '2018-12-05 14:41:30', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('935', '13581865075', '20', '2018-12-05 14:41:39', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('936', '13581865075', '20', '2018-12-05 14:42:37', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('937', '13581865075', '20', '2018-12-05 14:46:49', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('938', '13581865075', '20', '2018-12-05 14:47:04', '183.57.53.196', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('939', '13581865075', '20', '2018-12-05 14:48:35', '61.151.180.39', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('940', '13581865075', '20', '2018-12-05 14:48:36', '61.151.178.169', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('941', '13581865075', '20', '2018-12-05 15:28:41', '61.129.6.145', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('942', '13581865075', '20', '2018-12-05 15:32:22', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('943', '13581865075', '20', '2018-12-05 15:35:19', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('944', '13581865075', '20', '2018-12-05 15:35:44', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('945', '13581865075', '20', '2018-12-05 15:35:53', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('946', '13581865075', '20', '2018-12-05 15:35:54', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('947', '13581865075', '20', '2018-12-05 15:36:06', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('948', '13581865075', '20', '2018-12-05 15:37:31', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('949', '13581865075', '20', '2018-12-05 15:38:31', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('950', '13581865075', '20', '2018-12-05 15:43:18', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('951', '13810319167', '23', '2018-12-05 15:47:51', '115.120.0.3', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('952', '13717561547', '18', '2018-12-07 15:52:06', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('953', '13717561547', '18', '2018-12-07 15:53:38', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('954', '13717561547', '18', '2018-12-07 16:05:58', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('955', '13717561548', '24', '2018-12-07 16:06:21', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('956', '13717561548', '24', '2018-12-07 16:07:10', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('957', '13717561546', '25', '2018-12-07 16:07:26', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('958', '13717561542', '26', '2018-12-07 16:07:36', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('959', '13717561511', '27', '2018-12-07 16:07:45', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('960', '13717561511', '27', '2018-12-07 16:08:50', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('961', '13717561511', '27', '2018-12-07 16:10:49', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('962', '13717561511', '27', '2018-12-07 16:13:03', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('963', '13717561511', '27', '2018-12-07 16:13:08', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('964', '13717561512', '28', '2018-12-07 16:13:16', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('965', '13717561513', '29', '2018-12-07 16:13:32', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('966', '13717561514', '30', '2018-12-07 16:18:47', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('967', '13717561514', '30', '2018-12-07 16:21:36', '183.57.53.222', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('968', '13717561514', '30', '2018-12-07 16:22:18', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('969', '13717561514', '30', '2018-12-07 16:22:36', '61.151.178.175', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('970', '13717561514', '30', '2018-12-07 16:22:52', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('971', '13717561514', '30', '2018-12-07 16:22:58', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('972', '13717561514', '30', '2018-12-07 16:23:07', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('973', '13717561514', '30', '2018-12-07 16:23:30', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('974', '13717561514', '30', '2018-12-07 16:23:52', '61.151.178.236', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('975', '13717561514', '30', '2018-12-07 16:26:38', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('976', '13717561514', '30', '2018-12-07 16:26:42', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('977', '13717561514', '30', '2018-12-07 16:26:45', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('978', '13717561514', '30', '2018-12-07 16:26:48', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('979', '13717561514', '30', '2018-12-07 16:26:51', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('980', '13717561514', '30', '2018-12-07 16:26:54', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('981', '13717561514', '30', '2018-12-07 16:28:05', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('982', '13717561514', '30', '2018-12-07 16:28:09', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('983', '13717561514', '30', '2018-12-07 16:28:26', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('984', '13717561514', '30', '2018-12-07 16:28:42', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('985', '13717561514', '30', '2018-12-07 16:29:08', '61.151.207.205', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('986', '13717561514', '30', '2018-12-07 16:29:17', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('987', '13717561514', '30', '2018-12-07 16:29:25', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('988', '13717561514', '30', '2018-12-07 16:29:35', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('989', '13717561514', '30', '2018-12-07 16:29:47', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('990', '13717561514', '30', '2018-12-07 16:29:59', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('991', '13717561514', '30', '2018-12-07 16:30:07', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('992', '13717561514', '30', '2018-12-07 16:30:31', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('993', '13717561515', '31', '2018-12-07 16:30:38', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('994', '13717561515', '31', '2018-12-07 16:30:56', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('995', '13717561515', '31', '2018-12-07 16:32:35', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('996', '13717561515', '31', '2018-12-07 16:33:49', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('997', '13717561515', '31', '2018-12-07 16:35:45', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('998', '13717561515', '31', '2018-12-07 16:35:56', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('999', '13717561', '32', '2018-12-07 16:50:55', '101.227.139.172', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1000', '13717561', '32', '2018-12-07 16:51:54', '61.151.178.177', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1001', '13810319167', '23', '2018-12-07 17:03:36', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1002', '13810319167', '23', '2018-12-07 17:04:06', '101.227.139.172', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1003', '13810319167', '23', '2018-12-07 17:04:12', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1004', '13717561', '32', '2018-12-07 17:04:38', '61.151.178.167', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1005', '13810319167', '23', '2018-12-07 17:04:41', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1006', '13717561', '32', '2018-12-07 17:04:44', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1007', '13810319167', '23', '2018-12-07 17:05:03', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1008', '13810319167', '23', '2018-12-07 17:05:09', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1009', '13717561', '32', '2018-12-07 17:05:38', '101.89.239.230', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1010', '13717561', '32', '2018-12-07 17:05:44', '61.151.178.165', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1011', '13810319167', '23', '2018-12-07 17:06:27', '101.227.139.161', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1012', '13810319167', '23', '2018-12-07 17:06:30', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1013', '13810319166', '33', '2018-12-07 17:06:51', '101.227.139.161', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1014', '13810319167', '23', '2018-12-07 17:07:08', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1015', '13810319167', '23', '2018-12-07 17:07:11', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1016', '13810319166', '33', '2018-12-07 17:07:14', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1017', '13810319167', '23', '2018-12-07 17:07:26', '61.129.6.151', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1018', '13810319167', '23', '2018-12-07 17:07:28', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1019', '13810319167', '23', '2018-12-07 17:07:29', '101.89.29.78', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1020', '13810319166', '33', '2018-12-07 17:07:32', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1021', '13810319167', '23', '2018-12-07 17:07:40', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1022', '13810319166', '33', '2018-12-07 17:07:51', '61.151.178.166', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1023', '13810319166', '33', '2018-12-07 17:07:54', '101.91.60.108', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1024', '13810319167', '23', '2018-12-07 17:07:57', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1025', '13810319167', '23', '2018-12-07 17:08:07', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1026', '13810319167', '23', '2018-12-07 17:08:16', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1027', '13810319166', '33', '2018-12-07 17:08:30', '101.227.139.161', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1028', '13810319166', '33', '2018-12-07 17:08:31', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1029', '13810319166', '33', '2018-12-07 17:08:32', '61.151.207.205', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1030', '13810319166', '33', '2018-12-07 17:08:56', '124.239.252.150', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1031', '13810319166', '33', '2018-12-07 17:09:30', '101.89.29.78', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1032', '13810319166', '33', '2018-12-07 17:09:55', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1033', '13810319166', '33', '2018-12-07 17:10:20', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1034', '13810319167', '23', '2018-12-07 17:12:55', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1035', '13810319166', '33', '2018-12-07 17:13:45', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1036', '13810319166', '33', '2018-12-07 17:14:22', '124.239.252.150', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1037', '13810319167', '23', '2018-12-07 17:18:01', '203.187.161.203', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1038', '13810319166', '33', '2018-12-07 17:18:16', '124.239.252.150', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1039', '13810319166', '33', '2018-12-07 17:18:30', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1040', '13810319166', '33', '2018-12-07 17:18:34', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1041', '13810319166', '33', '2018-12-07 17:18:43', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1042', '13810319167', '23', '2018-12-07 17:18:59', '61.151.207.141', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1043', '13810319166', '33', '2018-12-07 17:19:30', '61.151.178.165', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1044', '13810319166', '33', '2018-12-07 17:19:40', '123.120.250.48', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1045', '13810319166', '33', '2018-12-07 17:20:46', '123.120.250.48', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1046', '13810319166', '33', '2018-12-07 17:22:16', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1047', '13810319166', '33', '2018-12-07 17:23:16', '221.219.123.126', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1048', '13717561514', '30', '2018-12-07 17:27:35', '61.129.8.179', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1049', '13810319166', '33', '2018-12-07 17:33:15', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1050', '13810319166', '33', '2018-12-07 17:33:19', '101.227.139.172', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1051', '13810319166', '33', '2018-12-07 17:33:29', '101.227.139.161', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1052', '13810319166', '33', '2018-12-07 17:33:32', '221.219.123.126', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1053', '13810319166', '33', '2018-12-07 17:33:52', '221.219.123.126', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1054', '13810319166', '33', '2018-12-07 17:34:56', '221.219.123.126', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1055', '13810319166', '33', '2018-12-07 17:35:55', '58.247.206.147', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1056', '13810319166', '33', '2018-12-07 17:35:58', '221.219.123.126', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1057', '13810319166', '33', '2018-12-07 17:36:17', '221.219.123.126', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1058', '13810319166', '33', '2018-12-07 17:37:30', '221.219.123.126', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1059', '13810319166', '33', '2018-12-07 17:38:49', '101.227.139.161', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1060', '13810319167', '23', '2018-12-07 17:38:57', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1061', '13810329166', '34', '2018-12-07 17:39:08', '221.219.123.126', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1062', '13810329166', '34', '2018-12-07 17:40:08', '101.89.29.97', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1063', '13810319166', '33', '2018-12-07 17:56:22', '221.219.123.126', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1064', '13810319166', '33', '2018-12-07 17:56:27', '221.219.123.126', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1065', '13810319166', '33', '2018-12-07 17:56:36', '221.219.123.126', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1066', '13810319166', '33', '2018-12-07 17:57:10', '221.219.123.126', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1067', '13810319167', '23', '2018-12-07 17:57:38', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1068', '13810319166', '33', '2018-12-07 17:57:39', '123.120.250.48', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1069', '13810319167', '23', '2018-12-07 17:57:40', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1070', '13810319167', '23', '2018-12-07 17:57:41', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1071', '13810319167', '23', '2018-12-07 17:57:59', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1072', '13810319166', '33', '2018-12-07 17:58:25', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1073', '13810319167', '23', '2018-12-07 17:58:33', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1074', '13717561547', '18', '2018-12-07 17:59:26', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1075', '13717561547', '18', '2018-12-07 17:59:28', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1076', '13717561547', '18', '2018-12-07 18:01:41', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1077', '13810319166', '33', '2018-12-07 18:03:03', '223.104.3.226', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1078', '13810319167', '23', '2018-12-07 18:09:50', '36.110.44.138', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1079', '13810319166', '33', '2018-12-07 18:10:13', '123.120.250.48', 'come', '本地访问');
INSERT INTO `loginlog` VALUES ('1080', '13810319166', '33', '2018-12-07 18:10:27', '123.120.250.48', 'come', '本地访问');

-- ----------------------------
-- Table structure for `mobilephone`
-- ----------------------------
DROP TABLE IF EXISTS `mobilephone`;
CREATE TABLE `mobilephone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `minnumber` varchar(11) DEFAULT NULL,
  `maxnumber` varchar(11) DEFAULT NULL,
  `addresstype` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=740 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mobilephone
-- ----------------------------
INSERT INTO `mobilephone` VALUES ('3', '15287740000', '15287749999', 'beijing');
INSERT INTO `mobilephone` VALUES ('4', '15287750000', '15287759999', 'beijing');
INSERT INTO `mobilephone` VALUES ('5', '15287760000', '15287769999', 'beijing');
INSERT INTO `mobilephone` VALUES ('6', '15287780000', '15287789999', 'beijing');
INSERT INTO `mobilephone` VALUES ('7', '15287790000', '15287799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('8', '15808600000', '15808609999', 'beijing');
INSERT INTO `mobilephone` VALUES ('9', '15808620000', '15808629999', 'beijing');
INSERT INTO `mobilephone` VALUES ('10', '15808630000', '15808639999', 'beijing');
INSERT INTO `mobilephone` VALUES ('11', '15808640000', '15808649999', 'beijing');
INSERT INTO `mobilephone` VALUES ('12', '15894210000', '15894219999', 'beijing');
INSERT INTO `mobilephone` VALUES ('13', '15894220000', '15894229999', 'beijing');
INSERT INTO `mobilephone` VALUES ('14', '15894230000', '15894239999', 'beijing');
INSERT INTO `mobilephone` VALUES ('15', '15894250000', '15894259999', 'beijing');
INSERT INTO `mobilephone` VALUES ('16', '15894260000', '15894269999', 'beijing');
INSERT INTO `mobilephone` VALUES ('17', '15894270000', '15894279999', 'beijing');
INSERT INTO `mobilephone` VALUES ('18', '15911800000', '15911809999', 'beijing');
INSERT INTO `mobilephone` VALUES ('19', '15911810000', '15911819999', 'beijing');
INSERT INTO `mobilephone` VALUES ('20', '15911820000', '15911829999', 'beijing');
INSERT INTO `mobilephone` VALUES ('21', '15912680000', '15912689999', 'beijing');
INSERT INTO `mobilephone` VALUES ('22', '15912690000', '15912699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('23', '15925060000', '15925069999', 'beijing');
INSERT INTO `mobilephone` VALUES ('24', '15925080000', '15925089999', 'beijing');
INSERT INTO `mobilephone` VALUES ('25', '15925090000', '15925099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('26', '15925500000', '15925509999', 'beijing');
INSERT INTO `mobilephone` VALUES ('27', '15925520000', '15925529999', 'beijing');
INSERT INTO `mobilephone` VALUES ('28', '15925530000', '15925539999', 'beijing');
INSERT INTO `mobilephone` VALUES ('29', '15925540000', '15925549999', 'beijing');
INSERT INTO `mobilephone` VALUES ('30', '15969010000', '15969019999', 'beijing');
INSERT INTO `mobilephone` VALUES ('31', '15969020000', '15969029999', 'beijing');
INSERT INTO `mobilephone` VALUES ('32', '15969030000', '15969039999', 'beijing');
INSERT INTO `mobilephone` VALUES ('33', '15974860000', '15974869999', 'beijing');
INSERT INTO `mobilephone` VALUES ('34', '15974870000', '15974879999', 'beijing');
INSERT INTO `mobilephone` VALUES ('35', '15974880000', '15974889999', 'beijing');
INSERT INTO `mobilephone` VALUES ('36', '15987000000', '15987009999', 'beijing');
INSERT INTO `mobilephone` VALUES ('37', '15987010000', '15987019999', 'beijing');
INSERT INTO `mobilephone` VALUES ('38', '15987020000', '15987029999', 'beijing');
INSERT INTO `mobilephone` VALUES ('39', '15987040000', '15987049999', 'beijing');
INSERT INTO `mobilephone` VALUES ('40', '15987050000', '15987059999', 'beijing');
INSERT INTO `mobilephone` VALUES ('41', '15987060000', '15987069999', 'beijing');
INSERT INTO `mobilephone` VALUES ('42', '15987910000', '15987919999', 'beijing');
INSERT INTO `mobilephone` VALUES ('43', '15987920000', '15987929999', 'beijing');
INSERT INTO `mobilephone` VALUES ('44', '18887020000', '18887029999', 'beijing');
INSERT INTO `mobilephone` VALUES ('45', '18887050000', '18887059999', 'beijing');
INSERT INTO `mobilephone` VALUES ('46', '15012270000', '15012279999', 'beijing');
INSERT INTO `mobilephone` VALUES ('47', '15012310000', '15012319999', 'beijing');
INSERT INTO `mobilephone` VALUES ('48', '15012340000', '15012349999', 'beijing');
INSERT INTO `mobilephone` VALUES ('49', '15012380000', '15012389999', 'beijing');
INSERT INTO `mobilephone` VALUES ('50', '15087210000', '15087219999', 'beijing');
INSERT INTO `mobilephone` VALUES ('51', '15087770000', '15087779999', 'beijing');
INSERT INTO `mobilephone` VALUES ('52', '15094260000', '15094269999', 'beijing');
INSERT INTO `mobilephone` VALUES ('53', '15094290000', '15094299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('54', '15096560000', '15096569999', 'beijing');
INSERT INTO `mobilephone` VALUES ('55', '15096590000', '15096599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('56', '15125300000', '15125309999', 'beijing');
INSERT INTO `mobilephone` VALUES ('57', '15125330000', '15125339999', 'beijing');
INSERT INTO `mobilephone` VALUES ('58', '15125360000', '15125369999', 'beijing');
INSERT INTO `mobilephone` VALUES ('59', '15125400000', '15125409999', 'beijing');
INSERT INTO `mobilephone` VALUES ('60', '15125470000', '15125479999', 'beijing');
INSERT INTO `mobilephone` VALUES ('61', '15126600000', '15126609999', 'beijing');
INSERT INTO `mobilephone` VALUES ('62', '13408820000', '13408829999', 'beijing');
INSERT INTO `mobilephone` VALUES ('63', '13466200000', '13466209999', 'beijing');
INSERT INTO `mobilephone` VALUES ('64', '13508700000', '13508709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('65', '13578050000', '13578059999', 'beijing');
INSERT INTO `mobilephone` VALUES ('66', '13618700000', '13618709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('67', '13638830000', '13638839999', 'beijing');
INSERT INTO `mobilephone` VALUES ('68', '13638890000', '13638899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('69', '13887000000', '13887009999', 'beijing');
INSERT INTO `mobilephone` VALUES ('70', '13887050000', '13887059999', 'beijing');
INSERT INTO `mobilephone` VALUES ('71', '13887110000', '13887119999', 'beijing');
INSERT INTO `mobilephone` VALUES ('72', '18214220000', '18214229999', 'beijing');
INSERT INTO `mobilephone` VALUES ('73', '18214260000', '18214269999', 'beijing');
INSERT INTO `mobilephone` VALUES ('74', '18287000000', '18287009999', 'beijing');
INSERT INTO `mobilephone` VALUES ('75', '18287040000', '18287049999', 'beijing');
INSERT INTO `mobilephone` VALUES ('76', '18287080000', '18287089999', 'beijing');
INSERT INTO `mobilephone` VALUES ('77', '18808810000', '18808819999', 'beijing');
INSERT INTO `mobilephone` VALUES ('78', '18887030000', '18887039999', 'beijing');
INSERT INTO `mobilephone` VALUES ('79', '13578030000', '13578039999', 'beijing');
INSERT INTO `mobilephone` VALUES ('80', '13638880000', '13638889999', 'beijing');
INSERT INTO `mobilephone` VALUES ('81', '13887130000', '13887139999', 'beijing');
INSERT INTO `mobilephone` VALUES ('82', '15012280000', '15012289999', 'beijing');
INSERT INTO `mobilephone` VALUES ('83', '15012330000', '15012339999', 'beijing');
INSERT INTO `mobilephone` VALUES ('84', '15012390000', '15012399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('85', '15087780000', '15087789999', 'beijing');
INSERT INTO `mobilephone` VALUES ('86', '15094280000', '15094289999', 'beijing');
INSERT INTO `mobilephone` VALUES ('87', '15096570000', '15096579999', 'beijing');
INSERT INTO `mobilephone` VALUES ('88', '15096840000', '15096849999', 'beijing');
INSERT INTO `mobilephone` VALUES ('89', '15125350000', '15125359999', 'beijing');
INSERT INTO `mobilephone` VALUES ('90', '15125410000', '15125419999', 'beijing');
INSERT INTO `mobilephone` VALUES ('91', '15125460000', '15125469999', 'beijing');
INSERT INTO `mobilephone` VALUES ('92', '15126630000', '15126639999', 'beijing');
INSERT INTO `mobilephone` VALUES ('93', '15126670000', '15126679999', 'beijing');
INSERT INTO `mobilephone` VALUES ('94', '15187010000', '15187019999', 'beijing');
INSERT INTO `mobilephone` VALUES ('95', '15187050000', '15187059999', 'beijing');
INSERT INTO `mobilephone` VALUES ('96', '15187090000', '15187099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('97', '15198530000', '15198539999', 'beijing');
INSERT INTO `mobilephone` VALUES ('98', '15198570000', '15198579999', 'beijing');
INSERT INTO `mobilephone` VALUES ('99', '15240800000', '15240809999', 'beijing');
INSERT INTO `mobilephone` VALUES ('100', '15240840000', '15240849999', 'beijing');
INSERT INTO `mobilephone` VALUES ('101', '15240880000', '15240889999', 'beijing');
INSERT INTO `mobilephone` VALUES ('102', '15284520000', '15284529999', 'beijing');
INSERT INTO `mobilephone` VALUES ('103', '15287010000', '15287019999', 'beijing');
INSERT INTO `mobilephone` VALUES ('104', '15287050000', '15287059999', 'beijing');
INSERT INTO `mobilephone` VALUES ('105', '15287090000', '15287099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('106', '15287730000', '15287739999', 'beijing');
INSERT INTO `mobilephone` VALUES ('107', '15287770000', '15287779999', 'beijing');
INSERT INTO `mobilephone` VALUES ('108', '15808610000', '15808619999', 'beijing');
INSERT INTO `mobilephone` VALUES ('109', '15894200000', '15894209999', 'beijing');
INSERT INTO `mobilephone` VALUES ('110', '15894240000', '15894249999', 'beijing');
INSERT INTO `mobilephone` VALUES ('111', '15908700000', '15908709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('112', '15911830000', '15911839999', 'beijing');
INSERT INTO `mobilephone` VALUES ('113', '15925070000', '15925079999', 'beijing');
INSERT INTO `mobilephone` VALUES ('114', '15925510000', '15925519999', 'beijing');
INSERT INTO `mobilephone` VALUES ('115', '15969000000', '15969009999', 'beijing');
INSERT INTO `mobilephone` VALUES ('116', '15974850000', '15974859999', 'beijing');
INSERT INTO `mobilephone` VALUES ('117', '15974890000', '15974899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('118', '15987030000', '15987039999', 'beijing');
INSERT INTO `mobilephone` VALUES ('119', '15987900000', '15987909999', 'beijing');
INSERT INTO `mobilephone` VALUES ('120', '15125430000', '15125439999', 'beijing');
INSERT INTO `mobilephone` VALUES ('121', '14769100000', '14769109999', 'beijing');
INSERT INTO `mobilephone` VALUES ('122', '14769110000', '14769119999', 'beijing');
INSERT INTO `mobilephone` VALUES ('123', '14769120000', '14769129999', 'beijing');
INSERT INTO `mobilephone` VALUES ('124', '14769130000', '14769139999', 'beijing');
INSERT INTO `mobilephone` VALUES ('125', '14769140000', '14769149999', 'beijing');
INSERT INTO `mobilephone` VALUES ('126', '14769150000', '14769159999', 'beijing');
INSERT INTO `mobilephone` VALUES ('127', '14769160000', '14769169999', 'beijing');
INSERT INTO `mobilephone` VALUES ('128', '14769170000', '14769179999', 'beijing');
INSERT INTO `mobilephone` VALUES ('129', '14769180000', '14769189999', 'beijing');
INSERT INTO `mobilephone` VALUES ('130', '14769190000', '14769199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('131', '18308700000', '18308709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('132', '18387000000', '18387009999', 'beijing');
INSERT INTO `mobilephone` VALUES ('133', '18387020000', '18387029999', 'beijing');
INSERT INTO `mobilephone` VALUES ('134', '18387030000', '18387039999', 'beijing');
INSERT INTO `mobilephone` VALUES ('135', '18387040000', '18387049999', 'beijing');
INSERT INTO `mobilephone` VALUES ('136', '18387060000', '18387069999', 'beijing');
INSERT INTO `mobilephone` VALUES ('137', '18387070000', '18387079999', 'beijing');
INSERT INTO `mobilephone` VALUES ('138', '18387080000', '18387089999', 'beijing');
INSERT INTO `mobilephone` VALUES ('139', '18388690000', '18388699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('140', '18388700000', '18388709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('141', '18388710000', '18388719999', 'beijing');
INSERT INTO `mobilephone` VALUES ('142', '18388730000', '18388739999', 'beijing');
INSERT INTO `mobilephone` VALUES ('143', '18388740000', '18388749999', 'beijing');
INSERT INTO `mobilephone` VALUES ('144', '18388750000', '18388759999', 'beijing');
INSERT INTO `mobilephone` VALUES ('145', '18388770000', '18388779999', 'beijing');
INSERT INTO `mobilephone` VALUES ('146', '18388780000', '18388789999', 'beijing');
INSERT INTO `mobilephone` VALUES ('147', '18388790000', '18388799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('148', '18387010000', '18387019999', 'beijing');
INSERT INTO `mobilephone` VALUES ('149', '18387050000', '18387059999', 'beijing');
INSERT INTO `mobilephone` VALUES ('150', '18387090000', '18387099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('151', '18388720000', '18388729999', 'beijing');
INSERT INTO `mobilephone` VALUES ('152', '18388760000', '18388769999', 'beijing');
INSERT INTO `mobilephone` VALUES ('153', '14708700000', '14708709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('154', '15708800000', '15708809999', 'beijing');
INSERT INTO `mobilephone` VALUES ('155', '15708810000', '15708819999', 'beijing');
INSERT INTO `mobilephone` VALUES ('156', '15708820000', '15708829999', 'beijing');
INSERT INTO `mobilephone` VALUES ('157', '15750110000', '15750119999', 'beijing');
INSERT INTO `mobilephone` VALUES ('158', '15750120000', '15750129999', 'beijing');
INSERT INTO `mobilephone` VALUES ('159', '15750130000', '15750139999', 'beijing');
INSERT INTO `mobilephone` VALUES ('160', '15750150000', '15750159999', 'beijing');
INSERT INTO `mobilephone` VALUES ('161', '15750160000', '15750169999', 'beijing');
INSERT INTO `mobilephone` VALUES ('162', '15750170000', '15750179999', 'beijing');
INSERT INTO `mobilephone` VALUES ('163', '15750190000', '15750199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('164', '18869410000', '18869419999', 'beijing');
INSERT INTO `mobilephone` VALUES ('165', '18869420000', '18869429999', 'beijing');
INSERT INTO `mobilephone` VALUES ('166', '18869440000', '18869449999', 'beijing');
INSERT INTO `mobilephone` VALUES ('167', '18869520000', '18869529999', 'beijing');
INSERT INTO `mobilephone` VALUES ('168', '18869530000', '18869539999', 'beijing');
INSERT INTO `mobilephone` VALUES ('169', '18869540000', '18869549999', 'beijing');
INSERT INTO `mobilephone` VALUES ('170', '18869570000', '18869579999', 'beijing');
INSERT INTO `mobilephone` VALUES ('171', '18869590000', '18869599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('172', '18869600000', '18869609999', 'beijing');
INSERT INTO `mobilephone` VALUES ('173', '18869400000', '18869409999', 'beijing');
INSERT INTO `mobilephone` VALUES ('174', '18869430000', '18869439999', 'beijing');
INSERT INTO `mobilephone` VALUES ('175', '18869510000', '18869519999', 'beijing');
INSERT INTO `mobilephone` VALUES ('176', '18869550000', '18869559999', 'beijing');
INSERT INTO `mobilephone` VALUES ('177', '18869580000', '18869589999', 'beijing');
INSERT INTO `mobilephone` VALUES ('178', '15708700000', '15708709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('179', '15750100000', '15750109999', 'beijing');
INSERT INTO `mobilephone` VALUES ('180', '15750140000', '15750149999', 'beijing');
INSERT INTO `mobilephone` VALUES ('181', '15750180000', '15750189999', 'beijing');
INSERT INTO `mobilephone` VALUES ('182', '18869500000', '18869509999', 'beijing');
INSERT INTO `mobilephone` VALUES ('183', '18869560000', '18869569999', 'beijing');
INSERT INTO `mobilephone` VALUES ('184', '18869610000', '18869619999', 'beijing');
INSERT INTO `mobilephone` VALUES ('185', '87100000000', '99999999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('186', '87000000000', '87099999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('187', '15701400000', '15701499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('188', '15701500000', '15701699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('189', '18811700000', '18811799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('190', '15701200000', '15701399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('191', '18810900000', '18810999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('192', '18813000000', '18813199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('193', '18401500000', '18401999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('194', '14700400000', '14700499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('195', '14700500000', '14700599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('196', '18410300000', '18410399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('197', '18401000000', '18401099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('198', '18401400000', '18401499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('199', '18410000000', '18410299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('200', '18401100000', '18401199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('201', '18401200000', '18401299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('202', '18401300000', '18401399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('203', '17810000000', '17810099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('204', '17801100000', '17801199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('205', '18410400000', '18410599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('206', '18410600000', '18411099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('207', '17800800000', '17800899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('208', '17801000000', '17801099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('209', '17888800000', '17888899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('210', '17810200000', '17810399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('211', '15911190000', '15911199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('212', '17801200000', '17801999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('213', '19800000000', '19800009999', 'beijing');
INSERT INTO `mobilephone` VALUES ('214', '19800010000', '19800019999', 'beijing');
INSERT INTO `mobilephone` VALUES ('215', '19800020000', '19800029999', 'beijing');
INSERT INTO `mobilephone` VALUES ('216', '19800030000', '19800039999', 'beijing');
INSERT INTO `mobilephone` VALUES ('217', '19800040000', '19800049999', 'beijing');
INSERT INTO `mobilephone` VALUES ('218', '19800050000', '19800059999', 'beijing');
INSERT INTO `mobilephone` VALUES ('219', '19800060000', '19800069999', 'beijing');
INSERT INTO `mobilephone` VALUES ('220', '19800070000', '19800079999', 'beijing');
INSERT INTO `mobilephone` VALUES ('221', '19800080000', '19800089999', 'beijing');
INSERT INTO `mobilephone` VALUES ('222', '19800090000', '19800099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('223', '19800100000', '19800109999', 'beijing');
INSERT INTO `mobilephone` VALUES ('224', '19800110000', '19800119999', 'beijing');
INSERT INTO `mobilephone` VALUES ('225', '19800120000', '19800129999', 'beijing');
INSERT INTO `mobilephone` VALUES ('226', '19800130000', '19800139999', 'beijing');
INSERT INTO `mobilephone` VALUES ('227', '19800140000', '19800149999', 'beijing');
INSERT INTO `mobilephone` VALUES ('228', '19800150000', '19800159999', 'beijing');
INSERT INTO `mobilephone` VALUES ('229', '19800160000', '19800169999', 'beijing');
INSERT INTO `mobilephone` VALUES ('230', '19800170000', '19800179999', 'beijing');
INSERT INTO `mobilephone` VALUES ('231', '19800180000', '19800189999', 'beijing');
INSERT INTO `mobilephone` VALUES ('232', '19800190000', '19800199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('233', '19800200000', '19800209999', 'beijing');
INSERT INTO `mobilephone` VALUES ('234', '19800210000', '19800219999', 'beijing');
INSERT INTO `mobilephone` VALUES ('235', '19800220000', '19800229999', 'beijing');
INSERT INTO `mobilephone` VALUES ('236', '19800230000', '19800239999', 'beijing');
INSERT INTO `mobilephone` VALUES ('237', '19800240000', '19800249999', 'beijing');
INSERT INTO `mobilephone` VALUES ('238', '19800250000', '19800259999', 'beijing');
INSERT INTO `mobilephone` VALUES ('239', '19800260000', '19800269999', 'beijing');
INSERT INTO `mobilephone` VALUES ('240', '19800270000', '19800279999', 'beijing');
INSERT INTO `mobilephone` VALUES ('241', '19800280000', '19800289999', 'beijing');
INSERT INTO `mobilephone` VALUES ('242', '19800290000', '19800299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('243', '19801000000', '19801009999', 'beijing');
INSERT INTO `mobilephone` VALUES ('244', '19801010000', '19801019999', 'beijing');
INSERT INTO `mobilephone` VALUES ('245', '19801020000', '19801029999', 'beijing');
INSERT INTO `mobilephone` VALUES ('246', '19801030000', '19801039999', 'beijing');
INSERT INTO `mobilephone` VALUES ('247', '19801040000', '19801049999', 'beijing');
INSERT INTO `mobilephone` VALUES ('248', '19801050000', '19801059999', 'beijing');
INSERT INTO `mobilephone` VALUES ('249', '19801060000', '19801069999', 'beijing');
INSERT INTO `mobilephone` VALUES ('250', '19801070000', '19801079999', 'beijing');
INSERT INTO `mobilephone` VALUES ('251', '19801080000', '19801089999', 'beijing');
INSERT INTO `mobilephone` VALUES ('252', '19801090000', '19801099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('253', '19801100000', '19801109999', 'beijing');
INSERT INTO `mobilephone` VALUES ('254', '13720000000', '13720089999', 'beijing');
INSERT INTO `mobilephone` VALUES ('255', '15010400000', '15010799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('256', '15120000000', '15120099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('257', '15101500000', '15101699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('258', '15101000000', '15101199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('259', '15011100000', '15011199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('260', '18811000000', '18811099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('261', '15711000000', '15711099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('262', '15711100000', '15711299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('263', '15110000000', '15110299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('264', '15116900000', '15116999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('265', '15201000000', '15201599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('266', '15117900000', '15117999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('267', '20000000000', '99999999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('268', '18811100000', '18811199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('269', '15210000000', '15210299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('270', '15210300000', '15210499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('271', '15210500000', '15210699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('272', '13720090000', '13720099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('273', '18701500000', '18701699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('274', '18811200000', '18811209999', 'beijing');
INSERT INTO `mobilephone` VALUES ('275', '18801360000', '18801369999', 'beijing');
INSERT INTO `mobilephone` VALUES ('276', '15210700000', '15210999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('277', '15210710000', '15210799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('278', '15210800000', '15210999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('279', '18811270000', '18811279999', 'beijing');
INSERT INTO `mobilephone` VALUES ('280', '18710000000', '18710049999', 'beijing');
INSERT INTO `mobilephone` VALUES ('281', '18811260000', '18811269999', 'beijing');
INSERT INTO `mobilephone` VALUES ('282', '18811210000', '18811259999', 'beijing');
INSERT INTO `mobilephone` VALUES ('283', '18701000000', '18701149999', 'beijing');
INSERT INTO `mobilephone` VALUES ('284', '18701150000', '18701299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('285', '18701300000', '18701499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('286', '18811600000', '18811699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('287', '15712800000', '15712999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('288', '15711300000', '15711399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('289', '18710050000', '18710099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('290', '18710100000', '18710199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('291', '18710200000', '18710299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('292', '15711400000', '15711499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('293', '15718800000', '15718899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('294', '15726600000', '15726699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('295', '15727300000', '15727399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('296', '15724700000', '15724799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('297', '18210000000', '18210369999', 'beijing');
INSERT INTO `mobilephone` VALUES ('298', '18210370000', '18210649999', 'beijing');
INSERT INTO `mobilephone` VALUES ('299', '18210650000', '18210899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('300', '14701400000', '14701419999', 'beijing');
INSERT INTO `mobilephone` VALUES ('301', '18811280000', '18811299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('302', '18201000000', '18201039999', 'beijing');
INSERT INTO `mobilephone` VALUES ('303', '18801000000', '18801179999', 'beijing');
INSERT INTO `mobilephone` VALUES ('304', '18801370000', '18801379999', 'beijing');
INSERT INTO `mobilephone` VALUES ('305', '18201250000', '18201499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('306', '18810100000', '18810199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('307', '18201500000', '18201699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('308', '18810000000', '18810099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('309', '18810200000', '18810249999', 'beijing');
INSERT INTO `mobilephone` VALUES ('310', '18201040000', '18201179999', 'beijing');
INSERT INTO `mobilephone` VALUES ('311', '18201180000', '18201249999', 'beijing');
INSERT INTO `mobilephone` VALUES ('312', '18801180000', '18801359999', 'beijing');
INSERT INTO `mobilephone` VALUES ('313', '18801380000', '18801499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('314', '14701420000', '14701499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('315', '14701540000', '14701699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('316', '18210900000', '18211199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('317', '18811200000', '18811209999', 'beijing');
INSERT INTO `mobilephone` VALUES ('318', '18811260000', '18811269999', 'beijing');
INSERT INTO `mobilephone` VALUES ('319', '18811280000', '18811289999', 'beijing');
INSERT INTO `mobilephone` VALUES ('320', '18810250000', '18810299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('321', '18810300000', '18810749999', 'beijing');
INSERT INTO `mobilephone` VALUES ('322', '14701750000', '14701999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('323', '15600000000', '15616157717', 'beijing');
INSERT INTO `mobilephone` VALUES ('324', '13436400000', '13436499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('325', '13810000000', '13810299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('326', '13810600000', '13810899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('327', '13810900000', '13810999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('328', '13811000000', '13811099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('329', '13811100000', '13811199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('330', '13611000000', '13611399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('331', '13621000000', '13621199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('332', '13641100000', '13641199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('333', '13651300000', '13651399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('334', '13520900000', '13521099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('335', '13522200000', '13522299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('336', '13522100000', '13522199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('337', '13522600000', '13522699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('338', '13522300000', '13522399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('339', '13552500000', '13552599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('340', '13621300000', '13621399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('341', '13681500000', '13681599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('342', '13681300000', '13681399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('343', '13681400000', '13681499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('344', '13683500000', '13683599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('345', '13683200000', '13683399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('346', '13691500000', '13691599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('347', '13718600000', '13718699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('348', '13718500000', '13718599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('349', '13718700000', '13718899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('350', '15010900000', '15010999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('351', '15010800000', '15010899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('352', '15201600000', '15201699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('353', '13552300000', '13552399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('354', '13552200000', '13552299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('355', '13552100000', '13552199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('356', '18311300000', '18311499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('357', '13621200000', '13621299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('358', '13671300000', '13671399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('359', '13683100000', '13683199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('360', '13693100000', '13693299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('361', '13717700000', '13717799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('362', '13717800000', '13717899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('363', '13436340000', '13436349999', 'beijing');
INSERT INTO `mobilephone` VALUES ('364', '18301000000', '18301499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('365', '14710000000', '14710099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('366', '14701700000', '14701749999', 'beijing');
INSERT INTO `mobilephone` VALUES ('367', '18301500000', '18301539999', 'beijing');
INSERT INTO `mobilephone` VALUES ('368', '18301550000', '18301699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('369', '18310000000', '18310099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('370', '18810750000', '18810899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('371', '18301540000', '18301549999', 'beijing');
INSERT INTO `mobilephone` VALUES ('372', '18310100000', '18310899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('373', '18311100000', '18311299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('374', '18310900000', '18311099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('375', '13520000000', '13520099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('376', '13520100000', '13520199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('377', '13520200000', '13520699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('378', '13520700000', '13520799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('379', '13521100000', '13521199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('380', '13521900000', '13521999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('381', '13521700000', '13521799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('382', '13521800000', '13521899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('383', '13522700000', '13522899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('384', '13641000000', '13641099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('385', '13641200000', '13641299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('386', '13641300000', '13641399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('387', '13651000000', '13651299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('388', '13661000000', '13661099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('389', '13661200000', '13661399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('390', '13671000000', '13671199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('391', '13691000000', '13691099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('392', '13691100000', '13691199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('393', '13691200000', '13691299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('394', '13693000000', '13693099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('395', '15011000000', '15011099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('396', '13522900000', '13522999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('397', '13811200000', '13811399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('398', '13811500000', '13811599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('399', '13811600000', '13811699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('400', '13811700000', '13811799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('401', '13811800000', '13811899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('402', '13811400000', '13811499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('403', '13811900000', '13811999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('404', '13581500000', '13581599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('405', '13581600000', '13581899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('406', '13581900000', '13581999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('407', '13488650000', '13488699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('408', '13466300000', '13466399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('409', '13466500000', '13466799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('410', '13488700000', '13488799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('411', '13488800000', '13488899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('412', '13401000000', '13401199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('413', '13426000000', '13426099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('414', '13426100000', '13426499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('415', '13699200000', '13699299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('416', '15901000000', '15901099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('417', '1000000000', '1099999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('418', '20000000000', '86999999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('419', '2000000000', '2099999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('420', '15801600000', '15801699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('421', '15910300000', '15910399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('422', '15901100000', '15901299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('423', '15901300000', '15901499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('424', '15910400000', '15910499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('425', '15901500000', '15901569999', 'beijing');
INSERT INTO `mobilephone` VALUES ('426', '15910600000', '15910699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('427', '15901570000', '15901599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('428', '15910700000', '15910899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('429', '15801400000', '15801599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('430', '15801200000', '15801399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('431', '15801000000', '15801199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('432', '15910500000', '15910599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('433', '15910900000', '15910999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('434', '13436700000', '13436749999', 'beijing');
INSERT INTO `mobilephone` VALUES ('435', '15911000000', '15911189999', 'beijing');
INSERT INTO `mobilephone` VALUES ('436', '15810100000', '15810500000', 'beijing');
INSERT INTO `mobilephone` VALUES ('437', '15810000000', '15810099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('438', '15810800000', '15810899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('439', '13810300000', '13810499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('440', '13810500000', '13810599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('441', '13501000000', '13501299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('442', '13501350000', '13501399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('443', '13511000000', '13511099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('444', '13601000000', '13601399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('445', '13701000000', '13701399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('446', '13801000000', '13801399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('447', '13901000000', '13901399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('448', '13910000000', '13911999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('449', '13466400000', '13466449999', 'beijing');
INSERT INTO `mobilephone` VALUES ('450', '13466450000', '13466499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('451', '13000000000', '13399999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('452', '13501300000', '13501349999', 'beijing');
INSERT INTO `mobilephone` VALUES ('453', '13520800000', '13520899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('454', '13521200000', '13521299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('455', '13521400000', '13521699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('456', '13522000000', '13522099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('457', '13522500000', '13522599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('458', '13552000000', '13552099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('459', '13552600000', '13552699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('460', '15810500000', '15810542999', 'beijing');
INSERT INTO `mobilephone` VALUES ('461', '15810542999', '15810599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('462', '15810900000', '15810999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('463', '15811000000', '15811399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('464', '13436750000', '13436799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('465', '13661100000', '13661199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('466', '13671200000', '13671299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('467', '13681000000', '13681299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('468', '13683000000', '13683099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('469', '13683600000', '13683699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('470', '13691300000', '13691499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('471', '13693300000', '13693399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('472', '13693500000', '13693699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('473', '13552400000', '13552499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('474', '13552800000', '13552899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('475', '13717500000', '13717599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('476', '13552900000', '13552999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('477', '13717600000', '13717699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('478', '13552700000', '13552799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('479', '13717900000', '13717999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('480', '13522400000', '13522499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('481', '13718000000', '13718099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('482', '13718100000', '13718199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('483', '13718200000', '13718399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('484', '13718400000', '13718499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('485', '13718900000', '13718999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('486', '13439000000', '13439189999', 'beijing');
INSERT INTO `mobilephone` VALUES ('487', '13439200000', '13439239999', 'beijing');
INSERT INTO `mobilephone` VALUES ('488', '13439250000', '13439299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('489', '13439300000', '13439399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('490', '13439500000', '13439799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('491', '13439400000', '13439499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('492', '13439800000', '13439899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('493', '13439190000', '13439199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('494', '13439900000', '13439999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('495', '13436300000', '13436339999', 'beijing');
INSERT INTO `mobilephone` VALUES ('496', '13436350000', '13436399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('497', '13436500000', '13436699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('498', '13521300000', '13521399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('499', '13436800000', '13436999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('500', '13699100000', '13699199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('501', '13716000000', '13716199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('502', '13716200000', '13716299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('503', '13716700000', '13716799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('504', '13716300000', '13716399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('505', '13716400000', '13716499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('506', '13716500000', '13716599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('507', '13716600000', '13716699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('508', '13716800000', '13716899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('509', '13716900000', '13716999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('510', '1000000000', '1099999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('511', '15910200000', '15910299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('512', '13439240000', '13439249999', 'beijing');
INSERT INTO `mobilephone` VALUES ('513', '15710000000', '15710099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('514', '15810600000', '15810799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('515', '15001000000', '15001399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('516', '15010000000', '15010399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('517', '15811400000', '15811599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('518', '15011200000', '15011599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('519', '18800000000', '18800099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('520', '18888800000', '18888899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('521', '18800100000', '18800199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('522', '18811300000', '18811599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('523', '15701000000', '15701199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('524', '13408810000', '13408819999', 'beijing');
INSERT INTO `mobilephone` VALUES ('525', '13408830000', '13408839999', 'beijing');
INSERT INTO `mobilephone` VALUES ('526', '13408850000', '13408859999', 'beijing');
INSERT INTO `mobilephone` VALUES ('527', '13408860000', '13408869999', 'beijing');
INSERT INTO `mobilephone` VALUES ('528', '13466210000', '13466219999', 'beijing');
INSERT INTO `mobilephone` VALUES ('529', '13466220000', '13466229999', 'beijing');
INSERT INTO `mobilephone` VALUES ('530', '13466240000', '13466249999', 'beijing');
INSERT INTO `mobilephone` VALUES ('531', '13578010000', '13578019999', 'beijing');
INSERT INTO `mobilephone` VALUES ('532', '13578020000', '13578029999', 'beijing');
INSERT INTO `mobilephone` VALUES ('533', '13578040000', '13578049999', 'beijing');
INSERT INTO `mobilephone` VALUES ('534', '13578060000', '13578069999', 'beijing');
INSERT INTO `mobilephone` VALUES ('535', '13578080000', '13578089999', 'beijing');
INSERT INTO `mobilephone` VALUES ('536', '13578090000', '13578099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('537', '13628700000', '13628709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('538', '13638800000', '13638809999', 'beijing');
INSERT INTO `mobilephone` VALUES ('539', '13638820000', '13638829999', 'beijing');
INSERT INTO `mobilephone` VALUES ('540', '13638850000', '13638859999', 'beijing');
INSERT INTO `mobilephone` VALUES ('541', '13638860000', '13638869999', 'beijing');
INSERT INTO `mobilephone` VALUES ('542', '13638870000', '13638879999', 'beijing');
INSERT INTO `mobilephone` VALUES ('543', '13648700000', '13648709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('544', '13649680000', '13649689999', 'beijing');
INSERT INTO `mobilephone` VALUES ('545', '13658700000', '13658709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('546', '13887010000', '13887019999', 'beijing');
INSERT INTO `mobilephone` VALUES ('547', '13887020000', '13887029999', 'beijing');
INSERT INTO `mobilephone` VALUES ('548', '13887040000', '13887049999', 'beijing');
INSERT INTO `mobilephone` VALUES ('549', '13887070000', '13887079999', 'beijing');
INSERT INTO `mobilephone` VALUES ('550', '13887080000', '13887089999', 'beijing');
INSERT INTO `mobilephone` VALUES ('551', '13887090000', '13887099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('552', '13887120000', '13887129999', 'beijing');
INSERT INTO `mobilephone` VALUES ('553', '13908700000', '13908709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('554', '18214200000', '18214209999', 'beijing');
INSERT INTO `mobilephone` VALUES ('555', '18214210000', '18214219999', 'beijing');
INSERT INTO `mobilephone` VALUES ('556', '18214230000', '18214239999', 'beijing');
INSERT INTO `mobilephone` VALUES ('557', '18214240000', '18214249999', 'beijing');
INSERT INTO `mobilephone` VALUES ('558', '18214250000', '18214259999', 'beijing');
INSERT INTO `mobilephone` VALUES ('559', '18214270000', '18214279999', 'beijing');
INSERT INTO `mobilephone` VALUES ('560', '18214280000', '18214289999', 'beijing');
INSERT INTO `mobilephone` VALUES ('561', '18214290000', '18214299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('562', '18287010000', '18287019999', 'beijing');
INSERT INTO `mobilephone` VALUES ('563', '18287020000', '18287029999', 'beijing');
INSERT INTO `mobilephone` VALUES ('564', '18287030000', '18287039999', 'beijing');
INSERT INTO `mobilephone` VALUES ('565', '18287050000', '18287059999', 'beijing');
INSERT INTO `mobilephone` VALUES ('566', '18287060000', '18287069999', 'beijing');
INSERT INTO `mobilephone` VALUES ('567', '18287070000', '18287079999', 'beijing');
INSERT INTO `mobilephone` VALUES ('568', '18287090000', '18287099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('569', '18708700000', '18708709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('570', '18808700000', '18808709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('571', '18808820000', '18808829999', 'beijing');
INSERT INTO `mobilephone` VALUES ('572', '18887000000', '18887009999', 'beijing');
INSERT INTO `mobilephone` VALUES ('573', '18887010000', '18887019999', 'beijing');
INSERT INTO `mobilephone` VALUES ('574', '18887040000', '18887049999', 'beijing');
INSERT INTO `mobilephone` VALUES ('575', '18887060000', '18887069999', 'beijing');
INSERT INTO `mobilephone` VALUES ('576', '18887070000', '18887079999', 'beijing');
INSERT INTO `mobilephone` VALUES ('577', '13408800000', '13408809999', 'beijing');
INSERT INTO `mobilephone` VALUES ('578', '13408840000', '13408849999', 'beijing');
INSERT INTO `mobilephone` VALUES ('579', '13408870000', '13408879999', 'beijing');
INSERT INTO `mobilephone` VALUES ('580', '13466230000', '13466239999', 'beijing');
INSERT INTO `mobilephone` VALUES ('581', '13578000000', '13578009999', 'beijing');
INSERT INTO `mobilephone` VALUES ('582', '13578070000', '13578079999', 'beijing');
INSERT INTO `mobilephone` VALUES ('583', '13608700000', '13608709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('584', '13638810000', '13638819999', 'beijing');
INSERT INTO `mobilephone` VALUES ('585', '13638840000', '13638849999', 'beijing');
INSERT INTO `mobilephone` VALUES ('586', '13649670000', '13649679999', 'beijing');
INSERT INTO `mobilephone` VALUES ('587', '13708600000', '13708609999', 'beijing');
INSERT INTO `mobilephone` VALUES ('588', '13887030000', '13887039999', 'beijing');
INSERT INTO `mobilephone` VALUES ('589', '13887060000', '13887069999', 'beijing');
INSERT INTO `mobilephone` VALUES ('590', '13887100000', '13887109999', 'beijing');
INSERT INTO `mobilephone` VALUES ('591', '14787000000', '14787009999', 'beijing');
INSERT INTO `mobilephone` VALUES ('592', '14787010000', '14787019999', 'beijing');
INSERT INTO `mobilephone` VALUES ('593', '14787020000', '14787029999', 'beijing');
INSERT INTO `mobilephone` VALUES ('594', '14787030000', '14787039999', 'beijing');
INSERT INTO `mobilephone` VALUES ('595', '14787040000', '14787049999', 'beijing');
INSERT INTO `mobilephone` VALUES ('596', '14787050000', '14787059999', 'beijing');
INSERT INTO `mobilephone` VALUES ('597', '14787060000', '14787069999', 'beijing');
INSERT INTO `mobilephone` VALUES ('598', '14787070000', '14787079999', 'beijing');
INSERT INTO `mobilephone` VALUES ('599', '15012250000', '15012259999', 'beijing');
INSERT INTO `mobilephone` VALUES ('600', '15012260000', '15012269999', 'beijing');
INSERT INTO `mobilephone` VALUES ('601', '15012290000', '15012299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('602', '15012300000', '15012309999', 'beijing');
INSERT INTO `mobilephone` VALUES ('603', '15012320000', '15012329999', 'beijing');
INSERT INTO `mobilephone` VALUES ('604', '15012350000', '15012359999', 'beijing');
INSERT INTO `mobilephone` VALUES ('605', '15012360000', '15012369999', 'beijing');
INSERT INTO `mobilephone` VALUES ('606', '15012370000', '15012379999', 'beijing');
INSERT INTO `mobilephone` VALUES ('607', '15087200000', '15087209999', 'beijing');
INSERT INTO `mobilephone` VALUES ('608', '15087750000', '15087759999', 'beijing');
INSERT INTO `mobilephone` VALUES ('609', '15087760000', '15087769999', 'beijing');
INSERT INTO `mobilephone` VALUES ('610', '15087790000', '15087799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('611', '15094250000', '15094259999', 'beijing');
INSERT INTO `mobilephone` VALUES ('612', '15094270000', '15094279999', 'beijing');
INSERT INTO `mobilephone` VALUES ('613', '15096530000', '15096539999', 'beijing');
INSERT INTO `mobilephone` VALUES ('614', '15096540000', '15096549999', 'beijing');
INSERT INTO `mobilephone` VALUES ('615', '15096550000', '15096559999', 'beijing');
INSERT INTO `mobilephone` VALUES ('616', '15096580000', '15096589999', 'beijing');
INSERT INTO `mobilephone` VALUES ('617', '15096820000', '15096829999', 'beijing');
INSERT INTO `mobilephone` VALUES ('618', '15096830000', '15096839999', 'beijing');
INSERT INTO `mobilephone` VALUES ('619', '15125310000', '15125319999', 'beijing');
INSERT INTO `mobilephone` VALUES ('620', '15125320000', '15125329999', 'beijing');
INSERT INTO `mobilephone` VALUES ('621', '15125340000', '15125349999', 'beijing');
INSERT INTO `mobilephone` VALUES ('622', '15125370000', '15125379999', 'beijing');
INSERT INTO `mobilephone` VALUES ('623', '15125380000', '15125389999', 'beijing');
INSERT INTO `mobilephone` VALUES ('624', '15125390000', '15125399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('625', '15125420000', '15125429999', 'beijing');
INSERT INTO `mobilephone` VALUES ('626', '15125440000', '15125449999', 'beijing');
INSERT INTO `mobilephone` VALUES ('627', '15125450000', '15125459999', 'beijing');
INSERT INTO `mobilephone` VALUES ('628', '15125480000', '15125489999', 'beijing');
INSERT INTO `mobilephone` VALUES ('629', '15125490000', '15125499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('630', '15126610000', '15126619999', 'beijing');
INSERT INTO `mobilephone` VALUES ('631', '15126620000', '15126629999', 'beijing');
INSERT INTO `mobilephone` VALUES ('632', '15126640000', '15126649999', 'beijing');
INSERT INTO `mobilephone` VALUES ('633', '15126650000', '15126659999', 'beijing');
INSERT INTO `mobilephone` VALUES ('634', '15126660000', '15126669999', 'beijing');
INSERT INTO `mobilephone` VALUES ('635', '15126680000', '15126689999', 'beijing');
INSERT INTO `mobilephone` VALUES ('636', '15126690000', '15126699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('637', '15187000000', '15187009999', 'beijing');
INSERT INTO `mobilephone` VALUES ('638', '15187020000', '15187029999', 'beijing');
INSERT INTO `mobilephone` VALUES ('639', '15187030000', '15187039999', 'beijing');
INSERT INTO `mobilephone` VALUES ('640', '15187040000', '15187049999', 'beijing');
INSERT INTO `mobilephone` VALUES ('641', '15187060000', '15187069999', 'beijing');
INSERT INTO `mobilephone` VALUES ('642', '15187070000', '15187079999', 'beijing');
INSERT INTO `mobilephone` VALUES ('643', '15187080000', '15187089999', 'beijing');
INSERT INTO `mobilephone` VALUES ('644', '15198500000', '15198509999', 'beijing');
INSERT INTO `mobilephone` VALUES ('645', '15198510000', '15198519999', 'beijing');
INSERT INTO `mobilephone` VALUES ('646', '15198520000', '15198529999', 'beijing');
INSERT INTO `mobilephone` VALUES ('647', '15198540000', '15198549999', 'beijing');
INSERT INTO `mobilephone` VALUES ('648', '15198550000', '15198559999', 'beijing');
INSERT INTO `mobilephone` VALUES ('649', '15198560000', '15198569999', 'beijing');
INSERT INTO `mobilephone` VALUES ('650', '15198580000', '15198589999', 'beijing');
INSERT INTO `mobilephone` VALUES ('651', '15198590000', '15198599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('652', '15208700000', '15208709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('653', '15240810000', '15240819999', 'beijing');
INSERT INTO `mobilephone` VALUES ('654', '15240820000', '15240829999', 'beijing');
INSERT INTO `mobilephone` VALUES ('655', '15240830000', '15240839999', 'beijing');
INSERT INTO `mobilephone` VALUES ('656', '15240850000', '15240859999', 'beijing');
INSERT INTO `mobilephone` VALUES ('657', '15240860000', '15240869999', 'beijing');
INSERT INTO `mobilephone` VALUES ('658', '15240870000', '15240879999', 'beijing');
INSERT INTO `mobilephone` VALUES ('659', '15240890000', '15240899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('660', '15284500000', '15284509999', 'beijing');
INSERT INTO `mobilephone` VALUES ('661', '15284510000', '15284519999', 'beijing');
INSERT INTO `mobilephone` VALUES ('662', '15284530000', '15284539999', 'beijing');
INSERT INTO `mobilephone` VALUES ('663', '15284540000', '15284549999', 'beijing');
INSERT INTO `mobilephone` VALUES ('664', '15287000000', '15287009999', 'beijing');
INSERT INTO `mobilephone` VALUES ('665', '15287020000', '15287029999', 'beijing');
INSERT INTO `mobilephone` VALUES ('666', '15287030000', '15287039999', 'beijing');
INSERT INTO `mobilephone` VALUES ('667', '15287040000', '15287049999', 'beijing');
INSERT INTO `mobilephone` VALUES ('668', '15287060000', '15287069999', 'beijing');
INSERT INTO `mobilephone` VALUES ('669', '15287070000', '15287079999', 'beijing');
INSERT INTO `mobilephone` VALUES ('670', '15287080000', '15287089999', 'beijing');
INSERT INTO `mobilephone` VALUES ('671', '15287700000', '15287709999', 'beijing');
INSERT INTO `mobilephone` VALUES ('672', '15287710000', '15287719999', 'beijing');
INSERT INTO `mobilephone` VALUES ('673', '15287720000', '15287729999', 'beijing');
INSERT INTO `mobilephone` VALUES ('674', '17801200000', '17801399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('675', '17801400000', '17801599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('676', '17801600000', '17801799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('677', '17801800000', '17801999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('678', '17800100000', '17800299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('679', '17800400000', '17800499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('680', '17800900000', '17800999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('681', '17810600000', '17810799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('682', '17810800000', '17810999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('683', '17812200000', '17812399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('684', '17812400000', '17812499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('685', '17812500000', '17812699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('686', '17812700000', '17812799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('687', '17812800000', '17812999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('688', '19800300000', '19800399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('689', '19800400000', '19800499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('690', '19800500000', '19800599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('691', '19800600000', '19800699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('692', '19800700000', '19800799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('693', '19800800000', '19800899999', 'beijing');
INSERT INTO `mobilephone` VALUES ('694', '19840600000', '19840699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('695', '17813000000', '17813199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('696', '17813200000', '17813399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('697', '17810400000', '17810599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('698', '17811000000', '17811099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('699', '17813400000', '17813599999', 'beijing');
INSERT INTO `mobilephone` VALUES ('700', '17813600000', '17813799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('701', '17813800000', '17813999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('702', '17888900000', '17888999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('703', '17880000000', '17880099999', 'beijing');
INSERT INTO `mobilephone` VALUES ('704', '19801110000', '19801119999', 'beijing');
INSERT INTO `mobilephone` VALUES ('705', '19801120000', '19801129999', 'beijing');
INSERT INTO `mobilephone` VALUES ('706', '19801130000', '19801139999', 'beijing');
INSERT INTO `mobilephone` VALUES ('707', '19801140000', '19801149999', 'beijing');
INSERT INTO `mobilephone` VALUES ('708', '19801150000', '19801159999', 'beijing');
INSERT INTO `mobilephone` VALUES ('709', '19801160000', '19801169999', 'beijing');
INSERT INTO `mobilephone` VALUES ('710', '19801170000', '19801179999', 'beijing');
INSERT INTO `mobilephone` VALUES ('711', '19801180000', '19801189999', 'beijing');
INSERT INTO `mobilephone` VALUES ('712', '19801190000', '19801199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('713', '19801200000', '19801209999', 'beijing');
INSERT INTO `mobilephone` VALUES ('714', '19801210000', '19801219999', 'beijing');
INSERT INTO `mobilephone` VALUES ('715', '19801220000', '19801229999', 'beijing');
INSERT INTO `mobilephone` VALUES ('716', '19801230000', '19801239999', 'beijing');
INSERT INTO `mobilephone` VALUES ('717', '19801240000', '19801249999', 'beijing');
INSERT INTO `mobilephone` VALUES ('718', '19801250000', '19801259999', 'beijing');
INSERT INTO `mobilephone` VALUES ('719', '19801260000', '19801269999', 'beijing');
INSERT INTO `mobilephone` VALUES ('720', '19801270000', '19801279999', 'beijing');
INSERT INTO `mobilephone` VALUES ('721', '19801280000', '19801289999', 'beijing');
INSERT INTO `mobilephone` VALUES ('722', '19801290000', '19801299999', 'beijing');
INSERT INTO `mobilephone` VALUES ('723', '19801300000', '19801309999', 'beijing');
INSERT INTO `mobilephone` VALUES ('724', '19801310000', '19801319999', 'beijing');
INSERT INTO `mobilephone` VALUES ('725', '19801320000', '19801329999', 'beijing');
INSERT INTO `mobilephone` VALUES ('726', '19801330000', '19801339999', 'beijing');
INSERT INTO `mobilephone` VALUES ('727', '19801340000', '19801349999', 'beijing');
INSERT INTO `mobilephone` VALUES ('728', '19801350000', '19801359999', 'beijing');
INSERT INTO `mobilephone` VALUES ('729', '19801360000', '19801369999', 'beijing');
INSERT INTO `mobilephone` VALUES ('730', '19801370000', '19801379999', 'beijing');
INSERT INTO `mobilephone` VALUES ('731', '19801380000', '19801389999', 'beijing');
INSERT INTO `mobilephone` VALUES ('732', '19801390000', '19801399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('733', '17812000000', '17812199999', 'beijing');
INSERT INTO `mobilephone` VALUES ('734', '17812200000', '17812399999', 'beijing');
INSERT INTO `mobilephone` VALUES ('735', '17812400000', '17812499999', 'beijing');
INSERT INTO `mobilephone` VALUES ('736', '17812500000', '17812699999', 'beijing');
INSERT INTO `mobilephone` VALUES ('737', '17812700000', '17812799999', 'beijing');
INSERT INTO `mobilephone` VALUES ('738', '17812800000', '17812999999', 'beijing');
INSERT INTO `mobilephone` VALUES ('739', '15616157719', '15699000000', 'beijing');

-- ----------------------------
-- Table structure for `prize`
-- ----------------------------
DROP TABLE IF EXISTS `prize`;
CREATE TABLE `prize` (
  `prizeId` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `info` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '韫囨瑨浼€閼鳖偆灏楁す瀛樺箠',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '类型',
  `probability` int(11) DEFAULT '0' COMMENT '概率',
  `prizeNumber` int(11) DEFAULT '0' COMMENT '奖品数量',
  PRIMARY KEY (`prizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of prize
-- ----------------------------
INSERT INTO `prize` VALUES ('1', '流量1G', '抽奖送流量，单位G', '0', '30', '1');
INSERT INTO `prize` VALUES ('4', '流量2G', '抽奖送流量，单位G', '0', '30', '2');
INSERT INTO `prize` VALUES ('12', '流量3G', '抽奖送流量，单位G', '0', '10', '3');
INSERT INTO `prize` VALUES ('13', '流量4G', '抽奖送流量，单位G', '0', '10', '4');
INSERT INTO `prize` VALUES ('14', '流量5G', '抽奖送流量，单位G', '0', '10', '5');
INSERT INTO `prize` VALUES ('15', '流量6G', '抽奖送流量，单位G', '0', '10', '6');
INSERT INTO `prize` VALUES ('16', '流量7G', '抽奖送流量，单位G', '0', '10', '7');
INSERT INTO `prize` VALUES ('17', '流量8G', '抽奖送流量，单位G', '0', '10', '8');
INSERT INTO `prize` VALUES ('18', '流量9G', '抽奖送流量，单位G', '0', '10', '9');
INSERT INTO `prize` VALUES ('19', '流量10G', '抽奖送流量，单位G', '0', '10', '10');

-- ----------------------------
-- Table structure for `prizehistory`
-- ----------------------------
DROP TABLE IF EXISTS `prizehistory`;
CREATE TABLE `prizehistory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) DEFAULT NULL,
  `prizeid` bigint(20) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prizehistory
-- ----------------------------
INSERT INTO `prizehistory` VALUES ('74', '18', '4', '2018-12-05 11:00:11');
INSERT INTO `prizehistory` VALUES ('75', '20', '1', '2018-12-05 11:24:34');
INSERT INTO `prizehistory` VALUES ('76', '21', '4', '2018-12-05 11:35:05');
INSERT INTO `prizehistory` VALUES ('77', '22', '16', '2018-12-05 11:35:23');
INSERT INTO `prizehistory` VALUES ('78', '23', '1', '2018-12-05 12:01:07');
INSERT INTO `prizehistory` VALUES ('79', '27', '12', '2018-12-07 16:13:06');
INSERT INTO `prizehistory` VALUES ('80', '28', '15', '2018-12-07 16:13:18');
INSERT INTO `prizehistory` VALUES ('81', '29', '4', '2018-12-07 16:13:33');
INSERT INTO `prizehistory` VALUES ('82', '30', '19', '2018-12-07 16:18:49');
INSERT INTO `prizehistory` VALUES ('83', '30', '13', '2018-12-07 16:23:11');
INSERT INTO `prizehistory` VALUES ('84', '30', '19', '2018-12-07 16:23:31');
INSERT INTO `prizehistory` VALUES ('85', '30', '1', '2018-12-07 16:26:40');
INSERT INTO `prizehistory` VALUES ('86', '30', '4', '2018-12-07 16:26:43');
INSERT INTO `prizehistory` VALUES ('87', '30', '19', '2018-12-07 16:26:46');
INSERT INTO `prizehistory` VALUES ('88', '30', '13', '2018-12-07 16:26:50');
INSERT INTO `prizehistory` VALUES ('89', '30', '13', '2018-12-07 16:26:53');
INSERT INTO `prizehistory` VALUES ('90', '30', '17', '2018-12-07 16:27:53');
INSERT INTO `prizehistory` VALUES ('91', '30', '17', '2018-12-07 16:28:12');
INSERT INTO `prizehistory` VALUES ('92', '30', '15', '2018-12-07 16:28:29');
INSERT INTO `prizehistory` VALUES ('93', '30', '19', '2018-12-07 16:28:32');
INSERT INTO `prizehistory` VALUES ('94', '30', '1', '2018-12-07 16:28:44');
INSERT INTO `prizehistory` VALUES ('95', '30', '12', '2018-12-07 16:29:19');
INSERT INTO `prizehistory` VALUES ('96', '30', '1', '2018-12-07 16:29:27');
INSERT INTO `prizehistory` VALUES ('97', '30', '18', '2018-12-07 16:29:39');
INSERT INTO `prizehistory` VALUES ('98', '30', '1', '2018-12-07 16:29:41');
INSERT INTO `prizehistory` VALUES ('99', '30', '16', '2018-12-07 16:29:48');
INSERT INTO `prizehistory` VALUES ('100', '30', '14', '2018-12-07 16:29:51');
INSERT INTO `prizehistory` VALUES ('101', '30', '15', '2018-12-07 16:30:02');
INSERT INTO `prizehistory` VALUES ('102', '31', '13', '2018-12-07 16:30:40');
INSERT INTO `prizehistory` VALUES ('103', '31', '1', '2018-12-07 16:30:58');
INSERT INTO `prizehistory` VALUES ('104', '31', '18', '2018-12-07 16:32:56');
INSERT INTO `prizehistory` VALUES ('105', '31', '18', '2018-12-07 16:33:53');
INSERT INTO `prizehistory` VALUES ('106', '31', '17', '2018-12-07 16:34:01');
INSERT INTO `prizehistory` VALUES ('107', '31', '18', '2018-12-07 16:35:47');
INSERT INTO `prizehistory` VALUES ('108', '31', '14', '2018-12-07 16:35:52');
INSERT INTO `prizehistory` VALUES ('109', '31', '1', '2018-12-07 16:35:58');
INSERT INTO `prizehistory` VALUES ('110', '23', '14', '2018-12-07 17:03:42');
INSERT INTO `prizehistory` VALUES ('111', '33', '17', '2018-12-07 17:09:56');
INSERT INTO `prizehistory` VALUES ('112', '34', '1', '2018-12-07 17:39:10');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `openId` bigint(20) DEFAULT NULL COMMENT '公共用户ID，只有是师说，QQ，微博等其它网站登录时才有。',
  `type` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '甯愬彿绫诲瀷锛? 鏈珯 1 甯堣 2 QQ 3 寰崥',
  `name` varchar(45) DEFAULT NULL COMMENT '用户名',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `mobilePhone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('18', null, 'wx', '13717561547', '2018-12-05 10:59:27', '13717561547');
INSERT INTO `user` VALUES ('19', null, 'wx', '13520081506', '2018-12-05 11:20:37', '13520081506');
INSERT INTO `user` VALUES ('20', null, 'wx', '13581865075', '2018-12-05 11:20:58', '13581865075');
INSERT INTO `user` VALUES ('21', null, 'wx', '13811811609', '2018-12-05 11:35:03', '13811811609');
INSERT INTO `user` VALUES ('22', null, 'wx', '13810162830', '2018-12-05 11:35:21', '13810162830');
INSERT INTO `user` VALUES ('23', null, 'wx', '13810319167', '2018-12-05 11:59:23', '13810319167');
INSERT INTO `user` VALUES ('24', null, 'wx', '13717561548', '2018-12-07 16:06:21', '13717561548');
INSERT INTO `user` VALUES ('25', null, 'wx', '13717561546', '2018-12-07 16:07:26', '13717561546');
INSERT INTO `user` VALUES ('26', null, 'wx', '13717561542', '2018-12-07 16:07:36', '13717561542');
INSERT INTO `user` VALUES ('27', null, 'wx', '13717561511', '2018-12-07 16:07:45', '13717561511');
INSERT INTO `user` VALUES ('28', null, 'wx', '13717561512', '2018-12-07 16:13:16', '13717561512');
INSERT INTO `user` VALUES ('29', null, 'wx', '13717561513', '2018-12-07 16:13:32', '13717561513');
INSERT INTO `user` VALUES ('30', null, 'wx', '13717561514', '2018-12-07 16:18:47', '13717561514');
INSERT INTO `user` VALUES ('31', null, 'wx', '13717561515', '2018-12-07 16:30:38', '13717561515');
INSERT INTO `user` VALUES ('32', null, 'wx', '13717561', '2018-12-07 16:50:55', '13717561');
INSERT INTO `user` VALUES ('33', null, 'wx', '13810319166', '2018-12-07 17:06:51', '13810319166');
INSERT INTO `user` VALUES ('34', null, 'wx', '13810329166', '2018-12-07 17:39:08', '13810329166');
