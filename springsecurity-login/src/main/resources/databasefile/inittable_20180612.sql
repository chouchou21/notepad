/*
 Navicat Premium Data Transfer

 Source Server         : mysql-localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : dbexchange

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 12/06/2018 17:55:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for d_app
-- ----------------------------
DROP TABLE IF EXISTS `d_app`;
CREATE TABLE `d_app`  (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_code` varchar(45) NULL DEFAULT NULL COMMENT '应用系统编码',
  `app_name` varchar(400) NULL DEFAULT NULL COMMENT '应用系统名称',
  `shortname` varchar(200) NULL DEFAULT NULL COMMENT '应用系统简称',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '所属单位',
  `app_status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 COMMENT = '应用系统';

-- ----------------------------
-- Table structure for d_link
-- ----------------------------
DROP TABLE IF EXISTS `d_link`;
CREATE TABLE `d_link`  (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `link_type` tinyint(4) NULL DEFAULT NULL COMMENT '连接类型',
  `ip` varchar(45) NULL DEFAULT NULL COMMENT 'ip地址',
  `port` smallint(6) NULL DEFAULT NULL COMMENT '端口',
  `servername` varchar(100) NULL DEFAULT NULL,
  `username` varchar(45) NULL DEFAULT NULL COMMENT '连接用户名',
  `password` varchar(45) NULL DEFAULT NULL COMMENT '连接密码',
  `path` varchar(1000) NULL DEFAULT NULL COMMENT '主目录/连接类型为ftp',
  `app_id` int(11) NULL DEFAULT NULL COMMENT '所属应用',
  `link_status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 COMMENT = '资源连接';

-- ----------------------------
-- Table structure for d_resource
-- ----------------------------
DROP TABLE IF EXISTS `d_resource`;
CREATE TABLE `d_resource`  (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `res_code` varchar(45) NULL DEFAULT NULL COMMENT '资源编码',
  `res_name` varchar(400) NULL DEFAULT NULL COMMENT '资源名称',
  `link_id` int(11) NULL DEFAULT NULL COMMENT '连接id',
  `res_type` tinyint(4) NULL DEFAULT NULL COMMENT '资源类型',
  `res_subtype` tinyint(4) NULL DEFAULT NULL COMMENT '资源子类型',
  `res_status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`res_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 COMMENT = '数据资源';

-- ----------------------------
-- Table structure for d_resource_catalog
-- ----------------------------
DROP TABLE IF EXISTS `d_resource_catalog`;
CREATE TABLE `d_resource_catalog`  (
  `catalog_id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_code` varchar(45) NULL DEFAULT NULL COMMENT '目录编码',
  `catalog_name` varchar(400) NULL DEFAULT NULL COMMENT '目录名称',
  `app_id` int(11) NULL DEFAULT NULL COMMENT '所属应用',
  `shortname` varchar(200) NULL DEFAULT NULL COMMENT '目录简称',
  `catalog_status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`catalog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 COMMENT = '资源目录';

-- ----------------------------
-- Table structure for d_resource_catalog_item
-- ----------------------------
DROP TABLE IF EXISTS `d_resource_catalog_item`;
CREATE TABLE `d_resource_catalog_item`  (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NULL DEFAULT NULL COMMENT '目录id',
  `res_id` int(11) NULL DEFAULT NULL COMMENT '资源id',
  `item_status` tinyint(1) NULL DEFAULT NULL COMMENT '发布状态',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 COMMENT = '资源列表（资源目录明细）';

-- ----------------------------
-- Table structure for d_resource_favorite
-- ----------------------------
DROP TABLE IF EXISTS `d_resource_favorite`;
CREATE TABLE `d_resource_favorite`  (
  `favorite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '收藏人id',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '收藏单位id',
  `res_id` int(11) NULL DEFAULT NULL COMMENT '收藏资源id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`favorite_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 COMMENT = '资源收藏夹';

-- ----------------------------
-- Table structure for d_resource_license
-- ----------------------------
DROP TABLE IF EXISTS `d_resource_license`;
CREATE TABLE `d_resource_license`  (
  `license_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '申请人id',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '申请单位id',
  `res_id` int(11) NULL DEFAULT NULL COMMENT '请求资源id',
  `authorizer` int(11) NULL DEFAULT NULL COMMENT '授权人id',
  `starttime` datetime(0) NULL DEFAULT NULL COMMENT '授权起始时间',
  `endtime` datetime(0) NULL DEFAULT NULL COMMENT '授权终止时间',
  `license_allow` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`license_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 COMMENT = '资源申请与授权';

-- ----------------------------
-- Table structure for d_resource_metadata
-- ----------------------------
DROP TABLE IF EXISTS `d_resource_metadata`;
CREATE TABLE `d_resource_metadata`  (
  `metadata_id` int(11) NOT NULL AUTO_INCREMENT,
  `res_id` int(11) NULL DEFAULT NULL COMMENT '所属资源id',
  `tablename` varchar(100) NULL DEFAULT NULL COMMENT '所属表名称',
  `fieldname` varchar(100) NULL DEFAULT NULL COMMENT '字段名',
  `fielddesc` varchar(400) NULL DEFAULT NULL COMMENT '字段中文描述',
  `fieldtype` varchar(45) NULL DEFAULT NULL COMMENT '字段类型',
  `fieldlenth` smallint(6) NULL DEFAULT NULL COMMENT '字段长度/字符串长度/数值型总长度',
  `fieldprec` smallint(6) NULL DEFAULT NULL COMMENT '小数点精度',
  PRIMARY KEY (`metadata_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 COMMENT = '元数据表';

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(45) NULL DEFAULT NULL COMMENT '单位编码',
  `dept_name` varchar(200) NULL DEFAULT NULL COMMENT '单位名称',
  `org_id` int(11) NULL DEFAULT NULL COMMENT '所属组织机构',
  `dept_status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 COMMENT = '单位表';

-- ----------------------------
-- Table structure for sys_element
-- ----------------------------
DROP TABLE IF EXISTS `sys_element`;
CREATE TABLE `sys_element`  (
  `element_id` int(11) NOT NULL AUTO_INCREMENT,
  `element_code` varchar(45) NULL DEFAULT NULL COMMENT 'ui元素编码',
  `element_label` varchar(200) NULL DEFAULT NULL COMMENT 'ui元素显示名称',
  `element_uri` varchar(400) NULL DEFAULT NULL COMMENT '链接地址',
  `element_icon` varchar(100) NULL DEFAULT NULL COMMENT '图标class',
  `parentid` int(11) NULL DEFAULT NULL COMMENT '菜单的上级菜单或按钮的所属页面',
  `seqno` int(11) NULL DEFAULT NULL COMMENT '显示顺序',
  `element_type` tinyint(1) NULL DEFAULT 0 COMMENT 'ui元素类型，0菜单，1按钮',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1501 COMMENT = '功能元素表';

-- ----------------------------
-- Records of sys_element
-- ----------------------------
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1000, 'menu_home', '首页', '/home', 'icon-home', 0, 1100, 0, 1);
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1100, 'menu_team', '组织用户', '/team', 'fa fa-users', 0, 1100, 0, 1);
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1101, 'menu_dept', '__组织单位', '/team/departments', NULL, 1100, 1101, 0, 1);
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1102, 'menu_user', '__用户管理', '/team/users', NULL, 1100, 1102, 0, 1);
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1103, 'menu_role', '__角色权限', '/team/role', NULL, 1100, 1103, 0, 1);
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1200, 'menu_app', '应用接入', '/application', 'fa fa-delicious', 0, NULL, 0, 1);
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1201, 'menu_app_register', '__应用注册', '/application/register', NULL, 1200, 1201, 0, 1);
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1202, 'menu_link', '__连接管理', '/application/link', NULL, 1200, 1202, 0, 1);
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1300, 'menu_datasource', '数据资源', '/dataSource', 'fa fa-database', 0, NULL, 0, 1);
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1301, 'menu_catalog', '__资源目录', '/dataSource/catalog', NULL, 1300, 1301, 0, 1);
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1302, 'menu_resource', '__资源管理', '/dataSource/manage', NULL, 1300, 1302, 0, 1);
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1303, 'menu_catalog_item', '__资源列表', '/dataSource/list', NULL, 1300, 1303, 0, 1);
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1304, 'menu_authorize', '__授权管理', '/dataSource/authorize', NULL, 1300, 1304, 0, 1);
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1400, 'menu_exchange', '交换中心', '/exchange', 'fa fa-exchange', 0, NULL, 0, 1);
INSERT INTO `sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1500, 'menu_exchange', '測試', '/exchange', 'fa fa-exchange', 0, NULL, 0, 1);

-- ----------------------------
-- Table structure for sys_operlog
-- ----------------------------
DROP TABLE IF EXISTS `sys_operlog`;
CREATE TABLE `sys_operlog`  (
  `operlog_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `oper_type` tinyint(4) NULL DEFAULT NULL COMMENT '操作类型',
  `element_id` int(11) NULL DEFAULT NULL COMMENT '操作功能',
  `oper_info` varchar(4000) NULL DEFAULT NULL COMMENT '操作信息',
  PRIMARY KEY (`operlog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 COMMENT = '操作日志表';

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization`  (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_code` varchar(45) NULL DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(200) NULL DEFAULT NULL COMMENT '组织名称',
  `parentid` int(11) NULL DEFAULT NULL COMMENT '上级组织',
  `org_status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 COMMENT = '组织表';

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` (`org_id`, `org_code`, `org_name`, `parentid`, `org_status`) VALUES (1, NULL, '自然资源部', NULL, 1);
INSERT INTO `sys_organization` (`org_id`, `org_code`, `org_name`, `parentid`, `org_status`) VALUES (2, NULL, '国家林业和草原局', NULL, 1);
INSERT INTO `sys_organization` (`org_id`, `org_code`, `org_name`, `parentid`, `org_status`) VALUES (3, NULL, '国家土地督察局', NULL, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(45) NULL DEFAULT NULL COMMENT '角色编码',
  `role_name` varchar(100) NULL DEFAULT NULL COMMENT '角色名称',
  `role_status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 COMMENT = '角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` (`role_id`, `role_code`, `role_name`, `role_status`) VALUES (1, 'ROLE_admin', '系统管理员', 1);
INSERT INTO `sys_role` (`role_id`, `role_code`, `role_name`, `role_status`) VALUES (2, 'ROLE_manager', '管理员', 1);
INSERT INTO `sys_role` (`role_id`, `role_code`, `role_name`, `role_status`) VALUES (3, 'ROLE_guest', '访客', 1);
INSERT INTO `sys_role` (`role_id`, `role_code`, `role_name`, `role_status`) VALUES (4, 'ROLE_team', '模块权限_组织用户', 1);
INSERT INTO `sys_role` (`role_id`, `role_code`, `role_name`, `role_status`) VALUES (5, 'ROLE_app', '模块权限_应用接入', 1);
INSERT INTO `sys_role` (`role_id`, `role_code`, `role_name`, `role_status`) VALUES (6, 'ROLE_datasource', '模块权限_数据资源', 1);
INSERT INTO `sys_role` (`role_id`, `role_code`, `role_name`, `role_status`) VALUES (7, 'ROLE_exchange', '模块权限_交换中心', 1);

-- ----------------------------
-- Table structure for sys_role_element_rel
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_element_rel`;
CREATE TABLE `sys_role_element_rel`  (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `element_id` int(11) NOT NULL COMMENT '元素id',
  `element_type` tinyint(1) NOT NULL COMMENT 'ui元素类型，0菜单，1按钮'
) ENGINE = InnoDB COMMENT = '角色元素权限表';

-- ----------------------------
-- Records of sys_role_element_rel
-- ----------------------------
INSERT INTO `sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (5, 1200, 0);
INSERT INTO `sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (5, 1201, 0);
INSERT INTO `sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (5, 1202, 0);
INSERT INTO `sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (6, 1300, 0);
INSERT INTO `sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (6, 1301, 0);
INSERT INTO `sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (6, 1302, 0);
INSERT INTO `sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (6, 1303, 0);
INSERT INTO `sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (6, 1304, 0);
INSERT INTO `sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (4, 1100, 0);
INSERT INTO `sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (4, 1101, 0);
INSERT INTO `sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (4, 1102, 0);
INSERT INTO `sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (4, 1103, 0);

-- ----------------------------
-- Table structure for sys_status
-- ----------------------------
DROP TABLE IF EXISTS `sys_status`;
CREATE TABLE `sys_status`  (
  `status_id` int(11) NOT NULL,
  `tablename` varchar(100) NULL DEFAULT NULL COMMENT '表名',
  `fieldname` varchar(100) NULL DEFAULT NULL COMMENT '字段名',
  `status_code` tinyint(4) NULL DEFAULT NULL COMMENT '枚举值',
  `status_desc` varchar(200) NULL DEFAULT NULL COMMENT '枚举值中文名',
  `seqno` tinyint(4) NULL DEFAULT NULL COMMENT '顺序号',
  `parent_fieldname` varchar(100) NULL DEFAULT NULL COMMENT '级联字段名',
  `parent_fieldvalue` varchar(200) NULL DEFAULT NULL COMMENT '级联字段值',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`status_id`) USING BTREE
) ENGINE = InnoDB COMMENT = '枚举值字典表';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(45) NULL DEFAULT NULL COMMENT '用户编码',
  `realname` varchar(100) NULL DEFAULT NULL COMMENT '用户姓名',
  `telephone` varchar(20) NULL DEFAULT NULL COMMENT '联系手机',
  `email` varchar(100) NULL DEFAULT NULL COMMENT '电子邮箱',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '所属单位',
  `username` varchar(45) NULL DEFAULT NULL COMMENT '登录帐户',
  `password` varchar(120) NULL DEFAULT NULL COMMENT '登录密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `user_status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  `enabled` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10003 COMMENT = '用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` (`user_id`, `user_code`, `realname`, `telephone`, `email`, `dept_id`, `username`, `password`, `create_time`, `last_login_time`, `user_status`, `enabled`) VALUES (10000, '120', 'admin', '13900010001', 'admin@163.com', NULL, 'admin', '$2a$10$YcdFRntVpydHtMVXLTIq8umsCyU7Ll0TwhATXeIqsBWr8O2kO6/Na', NULL, NULL, 1, 1);
INSERT INTO `sys_user` (`user_id`, `user_code`, `realname`, `telephone`, `email`, `dept_id`, `username`, `password`, `create_time`, `last_login_time`, `user_status`, `enabled`) VALUES (10001, '123', '张三', '13901230123', 'zhangs@163.com', NULL, 'zhangs', '$2a$10$uzqIZF37G8t.sPf.xOtdKu5mnGJJCfwXC2Sm2OtYRwEyvU5p1/cyq', NULL, NULL, 1, 1);
INSERT INTO `sys_user` (`user_id`, `user_code`, `realname`, `telephone`, `email`, `dept_id`, `username`, `password`, `create_time`, `last_login_time`, `user_status`, `enabled`) VALUES (10002, '124', '李四', '13901240124', 'lis@163.com', NULL, 'lis', '$2a$10$uzqIZF37G8t.sPf.xOtdKu5mnGJJCfwXC2Sm2OtYRwEyvU5p1/cyq', NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for sys_user_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_rel`;
CREATE TABLE `sys_user_role_rel`  (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id'
) ENGINE = InnoDB COMMENT = '用户角色关联表';

-- ----------------------------
-- Records of sys_user_role_rel
-- ----------------------------
INSERT INTO `sys_user_role_rel` (`user_id`, `role_id`) VALUES (10001, 1);
INSERT INTO `sys_user_role_rel` (`user_id`, `role_id`) VALUES (10001, 4);
INSERT INTO `sys_user_role_rel` (`user_id`, `role_id`) VALUES (10002, 5);
INSERT INTO `sys_user_role_rel` (`user_id`, `role_id`) VALUES (10002, 6);
INSERT INTO `sys_user_role_rel` (`user_id`, `role_id`) VALUES (10000, 1);
INSERT INTO `sys_user_role_rel` (`user_id`, `role_id`) VALUES (10000, 2);
INSERT INTO `sys_user_role_rel` (`user_id`, `role_id`) VALUES (10000, 3);
INSERT INTO `sys_user_role_rel` (`user_id`, `role_id`) VALUES (10000, 4);
INSERT INTO `sys_user_role_rel` (`user_id`, `role_id`) VALUES (10000, 5);
INSERT INTO `sys_user_role_rel` (`user_id`, `role_id`) VALUES (10000, 6);
INSERT INTO `sys_user_role_rel` (`user_id`, `role_id`) VALUES (10000, 7);













-- ----------------------------
-- Table structure for mytest_sys_element
-- ----------------------------
DROP TABLE IF EXISTS `mytest_sys_element`;
CREATE TABLE `mytest_sys_element`  (
  `element_id` int(11) NOT NULL AUTO_INCREMENT,
  `element_code` varchar(45) NULL DEFAULT NULL COMMENT 'ui元素编码',
  `element_label` varchar(200) NULL DEFAULT NULL COMMENT 'ui元素显示名称',
  `element_uri` varchar(400) NULL DEFAULT NULL COMMENT '链接地址',
  `element_icon` varchar(100) NULL DEFAULT NULL COMMENT '图标class',
  `parentid` int(11) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '菜单的上级菜单或按钮的所属页面',
  `seqno` int(11) NULL DEFAULT NULL COMMENT '显示顺序',
  `element_type` tinyint(1) NULL DEFAULT 0 COMMENT 'ui元素类型，0菜单，1按钮',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`element_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1501 COMMENT = '功能元素表';

-- ----------------------------
-- Records of mytest_sys_element
-- ----------------------------
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1000, 'menu_home', '首页', '/home', 'icon-home', 00000000000, 1100, 0, 1);
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1100, 'menu_team', '组织用户', '/team', 'fa fa-users', 00000000000, 1100, 0, 1);
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1101, 'menu_dept', '__组织单位', '/team/departments', NULL, 00000001100, 1101, 0, 1);
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1102, 'menu_user', '__用户管理', '/team/users', NULL, 00000001100, 1102, 0, 1);
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1103, 'menu_role', '__角色权限', '/team/role', NULL, 00000001100, 1103, 0, 1);
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1200, 'menu_app', '应用接入', '/application', 'fa fa-delicious', 00000000000, NULL, 0, 1);
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1201, 'menu_app_register', '__应用注册', '/application/register', NULL, 00000001200, 1201, 0, 1);
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1202, 'menu_link', '__连接管理', '/application/link', NULL, 00000001200, 1202, 0, 1);
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1300, 'menu_datasource', '数据资源', '/dataSource', 'fa fa-database', 00000000000, NULL, 0, 1);
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1301, 'menu_catalog', '__资源目录', '/dataSource/catalog', NULL, 00000001300, 1301, 0, 1);
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1302, 'menu_resource', '__资源管理', '/dataSource/manage', NULL, 00000001300, 1302, 0, 1);
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1303, 'menu_catalog_item', '__资源列表', '/dataSource/list', NULL, 00000001300, 1303, 0, 1);
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1304, 'menu_authorize', '__授权管理', '/dataSource/authorize', NULL, 00000001300, 1304, 0, 1);
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1400, 'menu_exchange', '交换中心', '/exchange', 'fa fa-exchange', 00000000000, NULL, 0, 1);
INSERT INTO `mytest_sys_element` (`element_id`, `element_code`, `element_label`, `element_uri`, `element_icon`, `parentid`, `seqno`, `element_type`, `enabled`) VALUES (1500, 'menu_exchange', '測試', '/exchange', 'fa fa-exchange', 00000000000, NULL, 0, 1);

-- ----------------------------
-- Table structure for mytest_sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `mytest_sys_organization`;
CREATE TABLE `mytest_sys_organization`  (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_code` varchar(45) NULL DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(200) NULL DEFAULT NULL COMMENT '组织名称',
  `parentid` int(11) NULL DEFAULT NULL COMMENT '上级组织',
  `org_status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 COMMENT = '组织表';

-- ----------------------------
-- Records of mytest_sys_organization
-- ----------------------------
INSERT INTO `mytest_sys_organization` (`org_id`, `org_code`, `org_name`, `parentid`, `org_status`) VALUES (1, NULL, '自然资源部', NULL, 1);
INSERT INTO `mytest_sys_organization` (`org_id`, `org_code`, `org_name`, `parentid`, `org_status`) VALUES (2, NULL, '国家林业和草原局', NULL, 1);
INSERT INTO `mytest_sys_organization` (`org_id`, `org_code`, `org_name`, `parentid`, `org_status`) VALUES (3, NULL, '国家土地督察局', NULL, 1);

-- ----------------------------
-- Table structure for mytest_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `mytest_sys_role`;
CREATE TABLE `mytest_sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(45) NULL DEFAULT NULL COMMENT '角色编码',
  `role_name` varchar(100) NULL DEFAULT NULL COMMENT '角色名称',
  `role_status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 COMMENT = '角色表';

-- ----------------------------
-- Records of mytest_sys_role
-- ----------------------------
INSERT INTO `mytest_sys_role` (`role_id`, `role_code`, `role_name`, `role_status`) VALUES (1, 'ROLE_admin', '系统管理员', 1);
INSERT INTO `mytest_sys_role` (`role_id`, `role_code`, `role_name`, `role_status`) VALUES (2, 'ROLE_manager', '管理员', 1);
INSERT INTO `mytest_sys_role` (`role_id`, `role_code`, `role_name`, `role_status`) VALUES (3, 'ROLE_guest', '访客', 1);
INSERT INTO `mytest_sys_role` (`role_id`, `role_code`, `role_name`, `role_status`) VALUES (4, 'ROLE_team', '模块权限_组织用户', 1);
INSERT INTO `mytest_sys_role` (`role_id`, `role_code`, `role_name`, `role_status`) VALUES (5, 'ROLE_app', '模块权限_应用接入', 1);
INSERT INTO `mytest_sys_role` (`role_id`, `role_code`, `role_name`, `role_status`) VALUES (6, 'ROLE_datasource', '模块权限_数据资源', 1);
INSERT INTO `mytest_sys_role` (`role_id`, `role_code`, `role_name`, `role_status`) VALUES (7, 'ROLE_exchange', '模块权限_交换中心', 1);

-- ----------------------------
-- Table structure for mytest_sys_role_element_rel
-- ----------------------------
DROP TABLE IF EXISTS `mytest_sys_role_element_rel`;
CREATE TABLE `mytest_sys_role_element_rel`  (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `element_id` int(11) NOT NULL COMMENT '元素id',
  `element_type` tinyint(1) NOT NULL COMMENT 'ui元素类型，0菜单，1按钮'
) ENGINE = InnoDB COMMENT = '角色元素权限表';

-- ----------------------------
-- Records of mytest_sys_role_element_rel
-- ----------------------------
INSERT INTO `mytest_sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (5, 1200, 0);
INSERT INTO `mytest_sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (5, 1201, 0);
INSERT INTO `mytest_sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (5, 1202, 0);
INSERT INTO `mytest_sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (6, 1300, 0);
INSERT INTO `mytest_sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (6, 1301, 0);
INSERT INTO `mytest_sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (6, 1302, 0);
INSERT INTO `mytest_sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (6, 1303, 0);
INSERT INTO `mytest_sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (6, 1304, 0);
INSERT INTO `mytest_sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (4, 1100, 0);
INSERT INTO `mytest_sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (4, 1101, 0);
INSERT INTO `mytest_sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (4, 1102, 0);
INSERT INTO `mytest_sys_role_element_rel` (`role_id`, `element_id`, `element_type`) VALUES (4, 1103, 0);

-- ----------------------------
-- Table structure for mytest_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `mytest_sys_user`;
CREATE TABLE `mytest_sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(45) NULL DEFAULT NULL COMMENT '用户编码',
  `realname` varchar(100) NULL DEFAULT NULL COMMENT '用户姓名',
  `telephone` varchar(20) NULL DEFAULT NULL COMMENT '联系手机',
  `email` varchar(100) NULL DEFAULT NULL COMMENT '电子邮箱',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '所属单位',
  `username` varchar(45) NULL DEFAULT NULL COMMENT '登录帐户',
  `password` varchar(120) NULL DEFAULT NULL COMMENT '登录密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `user_status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  `enabled` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10003 COMMENT = '用户表';

-- ----------------------------
-- Records of mytest_sys_user
-- ----------------------------
INSERT INTO `mytest_sys_user` (`user_id`, `user_code`, `realname`, `telephone`, `email`, `dept_id`, `username`, `password`, `create_time`, `last_login_time`, `user_status`, `enabled`) VALUES (10000, '120', 'admin', '13900010001', 'admin@163.com', NULL, 'admin', '$2a$10$YcdFRntVpydHtMVXLTIq8umsCyU7Ll0TwhATXeIqsBWr8O2kO6/Na', NULL, NULL, 1, 1);
INSERT INTO `mytest_sys_user` (`user_id`, `user_code`, `realname`, `telephone`, `email`, `dept_id`, `username`, `password`, `create_time`, `last_login_time`, `user_status`, `enabled`) VALUES (10001, '123', '张三', '13901230123', 'zhangs@163.com', NULL, 'zhangs', '$2a$10$uzqIZF37G8t.sPf.xOtdKu5mnGJJCfwXC2Sm2OtYRwEyvU5p1/cyq', NULL, NULL, 1, 1);
INSERT INTO `mytest_sys_user` (`user_id`, `user_code`, `realname`, `telephone`, `email`, `dept_id`, `username`, `password`, `create_time`, `last_login_time`, `user_status`, `enabled`) VALUES (10002, '124', '李四', '13901240124', 'lis@163.com', NULL, 'lis', '$2a$10$uzqIZF37G8t.sPf.xOtdKu5mnGJJCfwXC2Sm2OtYRwEyvU5p1/cyq', NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for mytest_sys_user_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `mytest_sys_user_role_rel`;
CREATE TABLE `mytest_sys_user_role_rel`  (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id'
) ENGINE = InnoDB COMMENT = '用户角色关联表';

-- ----------------------------
-- Records of mytest_sys_user_role_rel
-- ----------------------------
INSERT INTO `mytest_sys_user_role_rel` (`user_id`, `role_id`) VALUES (10001, 1);
INSERT INTO `mytest_sys_user_role_rel` (`user_id`, `role_id`) VALUES (10001, 4);
INSERT INTO `mytest_sys_user_role_rel` (`user_id`, `role_id`) VALUES (10002, 5);
INSERT INTO `mytest_sys_user_role_rel` (`user_id`, `role_id`) VALUES (10002, 6);
INSERT INTO `mytest_sys_user_role_rel` (`user_id`, `role_id`) VALUES (10000, 1);
INSERT INTO `mytest_sys_user_role_rel` (`user_id`, `role_id`) VALUES (10000, 2);
INSERT INTO `mytest_sys_user_role_rel` (`user_id`, `role_id`) VALUES (10000, 3);
INSERT INTO `mytest_sys_user_role_rel` (`user_id`, `role_id`) VALUES (10000, 4);
INSERT INTO `mytest_sys_user_role_rel` (`user_id`, `role_id`) VALUES (10000, 5);
INSERT INTO `mytest_sys_user_role_rel` (`user_id`, `role_id`) VALUES (10000, 6);
INSERT INTO `mytest_sys_user_role_rel` (`user_id`, `role_id`) VALUES (10000, 7);


SET FOREIGN_KEY_CHECKS = 1;
