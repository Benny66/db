/*
 Navicat Premium Data Transfer

 Source Server         : 47.110.227.59
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 47.110.227.59:33307
 Source Schema         : goblog

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 26/11/2020 20:13:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_articles
-- ----------------------------
DROP TABLE IF EXISTS `t_articles`;
CREATE TABLE `t_articles` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `title` varchar(200) NOT NULL COMMENT '文章标题',
  `content` longtext NOT NULL COMMENT '文章内容',
  `status` varchar(16) NOT NULL DEFAULT 'publish' COMMENT '状态:public=公开,private=私有',
  `views` int(10) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`article_id`),
  KEY `idx_blog_articles_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

-- ----------------------------
-- Records of t_articles
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_comments
-- ----------------------------
DROP TABLE IF EXISTS `t_comments`;
CREATE TABLE `t_comments` (
  `comment_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `user_id` int(10) NOT NULL COMMENT '发表用户ID',
  `article_id` int(10) NOT NULL COMMENT '评论博文ID',
  `like_count` bigint(20) NOT NULL COMMENT '点赞数',
  `date` datetime DEFAULT NULL COMMENT '评论日期',
  `content` text NOT NULL COMMENT '评论内容',
  `p_comment_id` bigint(20) NOT NULL COMMENT '父评论ID',
  PRIMARY KEY (`comment_id`),
  KEY `article_id` (`article_id`) USING BTREE,
  KEY `date` (`date`) USING BTREE,
  KEY `p_comment_id` (`p_comment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评论表';

-- ----------------------------
-- Records of t_comments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_labels
-- ----------------------------
DROP TABLE IF EXISTS `t_labels`;
CREATE TABLE `t_labels` (
  `label_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `name` varchar(20) NOT NULL COMMENT '标签名称',
  `alias` varchar(15) NOT NULL COMMENT '标签别名',
  `description` text NOT NULL COMMENT '标签描述',
  PRIMARY KEY (`label_id`),
  KEY `name` (`name`) USING BTREE,
  KEY `alias` (`alias`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签表';

-- ----------------------------
-- Records of t_labels
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_options
-- ----------------------------
DROP TABLE IF EXISTS `t_options`;
CREATE TABLE `t_options` (
  `name` varchar(32) NOT NULL COMMENT '配置名',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配置用户id',
  `value` text COMMENT '配置内容',
  PRIMARY KEY (`name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户配置表';

-- ----------------------------
-- Records of t_options
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_set_article_label
-- ----------------------------
DROP TABLE IF EXISTS `t_set_article_label`;
CREATE TABLE `t_set_article_label` (
  `article_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `label_id` int(10) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`article_id`),
  KEY `label_id` (`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章关联标签表';

-- ----------------------------
-- Records of t_set_article_label
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_set_article_sort
-- ----------------------------
DROP TABLE IF EXISTS `t_set_article_sort`;
CREATE TABLE `t_set_article_sort` (
  `article_id` int(10) NOT NULL COMMENT '文章ID',
  `sort_id` int(10) NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`article_id`,`sort_id`),
  KEY `sort_id` (`sort_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章关联分类表';

-- ----------------------------
-- Records of t_set_article_sort
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_set_users_platform
-- ----------------------------
DROP TABLE IF EXISTS `t_set_users_platform`;
CREATE TABLE `t_set_users_platform` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `type` varchar(10) NOT NULL COMMENT '第三方平台类型',
  `openid` varchar(64) NOT NULL COMMENT '第三方唯一标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户关联第三方平台账号表';

-- ----------------------------
-- Records of t_set_users_platform
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_sorts
-- ----------------------------
DROP TABLE IF EXISTS `t_sorts`;
CREATE TABLE `t_sorts` (
  `sort_id` int(10) NOT NULL COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `alias` varchar(15) NOT NULL COMMENT '分类别名',
  `description` text NOT NULL COMMENT '分类描述',
  `p_sort_id` bigint(20) NOT NULL COMMENT '父分类ID',
  PRIMARY KEY (`sort_id`),
  KEY `name` (`name`) USING BTREE,
  KEY `alias` (`alias`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分类表';

-- ----------------------------
-- Records of t_sorts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) NOT NULL COMMENT '登录账号',
  `password` varchar(64) NOT NULL COMMENT '登陆密码',
  `email` varchar(100) DEFAULT NULL COMMENT '用户邮箱',
  `avatar_url` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `screen_name` varchar(32) NOT NULL COMMENT '昵称',
  `create_time` datetime NOT NULL COMMENT '创建时间：yyyy-mm-dd HH:ii:ss',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：yyyy-mm-dd HH:ii:ss',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `mail` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户账号表';

-- ----------------------------
-- Records of t_users
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_users_qq
-- ----------------------------
DROP TABLE IF EXISTS `t_users_qq`;
CREATE TABLE `t_users_qq` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `openid` varchar(64) NOT NULL COMMENT '用户唯一标识',
  `nick_name` varchar(100) NOT NULL COMMENT 'qq昵称',
  `avatar_url` varchar(200) NOT NULL COMMENT 'qq头像',
  `city` varchar(50) NOT NULL COMMENT '城市',
  `province` varchar(50) NOT NULL COMMENT '省份',
  `country` varchar(50) NOT NULL COMMENT '国家',
  `gender` varchar(10) NOT NULL COMMENT '性别',
  `create_time` datetime NOT NULL COMMENT '创建时间：yyyy-mm-dd HH:ii:ss',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：yyyy-mm-dd HH:ii:ss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_users_qq_openid` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='QQ用户表';

-- ----------------------------
-- Records of t_users_qq
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_users_wx
-- ----------------------------
DROP TABLE IF EXISTS `t_users_wx`;
CREATE TABLE `t_users_wx` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `openid` varchar(64) NOT NULL COMMENT '用户唯一标识',
  `nick_name` varchar(100) NOT NULL COMMENT '微信昵称',
  `avatar_url` varchar(200) NOT NULL COMMENT '微信头像',
  `city` varchar(50) NOT NULL COMMENT '城市',
  `province` varchar(50) NOT NULL COMMENT '省份',
  `country` varchar(50) NOT NULL COMMENT '国家',
  `gender` varchar(10) NOT NULL COMMENT '性别',
  `create_time` datetime NOT NULL COMMENT '创建时间：yyyy-mm-dd HH:ii:ss',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：yyyy-mm-dd HH:ii:ss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_users_wx_openid` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信用户表';

-- ----------------------------
-- Records of t_users_wx
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
