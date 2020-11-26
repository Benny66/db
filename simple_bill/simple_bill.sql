/*
 Navicat Premium Data Transfer

 Source Server         : 47.110.227.59
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 47.110.227.59:33307
 Source Schema         : simple_bill

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 26/11/2020 17:15:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for s_bill
-- ----------------------------
DROP TABLE IF EXISTS `s_bill`;
CREATE TABLE `s_bill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `category_id` int(11) NOT NULL COMMENT '分类id',
  `content` varchar(20) NOT NULL COMMENT '内容',
  `cost` int(11) NOT NULL COMMENT '费用，单位为分',
  `flag` varchar(10) NOT NULL COMMENT '类型：pay=支出，income=收入',
  `week` enum('1','2','3','4','5','6','7') NOT NULL COMMENT '星期：1-7',
  `year` int(4) NOT NULL COMMENT '年份：yyyy',
  `month` int(2) NOT NULL COMMENT '月份：1-12（mm）',
  `day` int(2) NOT NULL COMMENT '日期：1-31（dd）',
  `create_time` datetime NOT NULL COMMENT '创建时间：yyyy-mm-dd HH:ii:ss',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：yyyy-mm-dd HH:ii:ss',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户记账表';

-- ----------------------------
-- Records of s_bill
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for s_bill_month_sta
-- ----------------------------
DROP TABLE IF EXISTS `s_bill_month_sta`;
CREATE TABLE `s_bill_month_sta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `category_id` int(11) NOT NULL COMMENT '分类id',
  `flag` varchar(10) NOT NULL COMMENT '类型：pay=支出，income=收入',
  `month` int(2) NOT NULL COMMENT '月份',
  `year` int(4) NOT NULL COMMENT '年份',
  `cost` int(20) NOT NULL COMMENT '统计费用，单位分',
  `last_cost` int(20) NOT NULL DEFAULT '0' COMMENT '上次统计费用，单位分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='按分类统计每月记账数据，不包括本月';

-- ----------------------------
-- Records of s_bill_month_sta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for s_bill_real_sta
-- ----------------------------
DROP TABLE IF EXISTS `s_bill_real_sta`;
CREATE TABLE `s_bill_real_sta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `category_id` int(11) NOT NULL COMMENT '分类id',
  `week` int(2) NOT NULL COMMENT '当前周',
  `week_cost` int(20) NOT NULL COMMENT '当前周费用，单位分',
  `month` int(2) NOT NULL COMMENT '当前月',
  `month_cost` int(20) NOT NULL COMMENT '当前月费用，单位分',
  `year` int(4) NOT NULL COMMENT '当前年',
  `year_cost` int(20) NOT NULL COMMENT '当前年费用',
  `flag` varchar(10) NOT NULL COMMENT '类型：pay=支出，income=收入',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='按分类统计本周本月今年的记账数据';

-- ----------------------------
-- Records of s_bill_real_sta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for s_bill_week_sta
-- ----------------------------
DROP TABLE IF EXISTS `s_bill_week_sta`;
CREATE TABLE `s_bill_week_sta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `category_id` int(11) NOT NULL COMMENT '分类id',
  `week` int(2) NOT NULL COMMENT '第几周',
  `flag` varchar(10) NOT NULL COMMENT '类型：pay=支出，income=收入',
  `year` int(4) NOT NULL COMMENT '年份',
  `cost` int(20) NOT NULL COMMENT '统计费用，单位分',
  `last_cost` int(20) NOT NULL DEFAULT '0' COMMENT '上次统计费用，单位分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='按分类统计每周记账数据，不包括本周';

-- ----------------------------
-- Records of s_bill_week_sta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for s_bill_year_sta
-- ----------------------------
DROP TABLE IF EXISTS `s_bill_year_sta`;
CREATE TABLE `s_bill_year_sta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `category_id` int(11) NOT NULL COMMENT '分类id',
  `year` int(4) NOT NULL COMMENT '年份',
  `flag` varchar(10) NOT NULL COMMENT '类型：pay=支出，income=收入',
  `cost` int(20) NOT NULL COMMENT '统计费用，单位分',
  `last_cost` int(20) NOT NULL DEFAULT '0' COMMENT '上次统计费用，单位分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='按分类统计每年记账数据，不包括今年';

-- ----------------------------
-- Records of s_bill_year_sta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for s_category
-- ----------------------------
DROP TABLE IF EXISTS `s_category`;
CREATE TABLE `s_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `icon` varchar(30) NOT NULL COMMENT '图标',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '类型：entertainment=娱乐',
  `flag` varchar(20) NOT NULL DEFAULT '' COMMENT '标示：pay=支出，income=收入',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除：1=是，0=否',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态：1=开启，0=未开启',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分类表';

-- ----------------------------
-- Records of s_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for s_set_users_platform
-- ----------------------------
DROP TABLE IF EXISTS `s_set_users_platform`;
CREATE TABLE `s_set_users_platform` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `type` varchar(10) NOT NULL COMMENT '第三方平台类型',
  `openid` varchar(64) NOT NULL COMMENT '第三方唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户关联第三方平台表';

-- ----------------------------
-- Records of s_set_users_platform
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for s_user
-- ----------------------------
DROP TABLE IF EXISTS `s_user`;
CREATE TABLE `s_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '电话',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex` int(2) NOT NULL COMMENT '性别：1=男，2=女，3=保密',
  `keep_clock_day` int(10) NOT NULL DEFAULT '0' COMMENT '连续打卡天数',
  `bill_day` int(10) NOT NULL DEFAULT '0' COMMENT '记账天数',
  `bill_num` int(10) NOT NULL DEFAULT '0' COMMENT '总记账次数',
  `budget` int(10) DEFAULT NULL COMMENT '预算',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of s_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for s_user_clock
-- ----------------------------
DROP TABLE IF EXISTS `s_user_clock`;
CREATE TABLE `s_user_clock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `clock_time` datetime NOT NULL COMMENT '打卡时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户打卡记录表';

-- ----------------------------
-- Records of s_user_clock
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for s_users_wx
-- ----------------------------
DROP TABLE IF EXISTS `s_users_wx`;
CREATE TABLE `s_users_wx` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `openid` varchar(64) NOT NULL COMMENT '用户唯一标识',
  `nick_name` varchar(100) NOT NULL COMMENT '微信昵称',
  `avatar_url` varchar(200) NOT NULL COMMENT '微信头像',
  `city` varchar(50) NOT NULL COMMENT '城市',
  `province` varchar(50) NOT NULL COMMENT '省份',
  `country` varchar(50) NOT NULL COMMENT '国家',
  `gender` varchar(10) NOT NULL COMMENT '性别',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_users_wx_openid` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信用户表';

-- ----------------------------
-- Records of s_users_wx
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
