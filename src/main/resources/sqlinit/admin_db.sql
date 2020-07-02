/*
SQLyog  v12.2.6 (64 bit)
MySQL - 8.0.12 : Database - admin_db
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`admin_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `admin_db`;

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `area_code` varchar(128) NOT NULL COMMENT '区域代码',
  `area_name` varchar(128) NOT NULL COMMENT '区域名称',
  `area_type` varchar(128) DEFAULT NULL COMMENT '区域类型',
  `sort` bigint(20) DEFAULT NULL COMMENT '排序字段',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='行政区划';

/*Data for the table `sys_area` */

insert  into `sys_area`(`id`,`area_code`,`area_name`,`area_type`,`sort`,`parent_id`,`create_user_id`,`update_user_id`) values 

(1,'001','中国',NULL,NULL,0,NULL,NULL),

(2,'002','山东省',NULL,NULL,1,NULL,NULL),

(3,'003','山西省',NULL,NULL,1,NULL,NULL),

(4,'0021','青岛市',NULL,NULL,2,NULL,NULL),

(5,'0031','太原市',NULL,NULL,3,NULL,NULL),

(6,'00211','李沧区',NULL,NULL,4,1,NULL);

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_name` varchar(128) NOT NULL COMMENT '字典名称',
  `dict_code` varchar(128) NOT NULL COMMENT '字典代码',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `dict_value` varchar(1000) NOT NULL COMMENT '字典值',
  `sort` int(5) DEFAULT NULL COMMENT '排序字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

/*Data for the table `sys_dict` */
insert  into `sys_dict`(`id`,`dict_name`,`dict_code`,`create_user_id`,`update_user_id`,`parent_id`,`dict_value`,`sort`) values 
(1,'系统字典树','system',NULL,NULL,0,'根节点',NULL),
(2,'任务类型','taskType',1,NULL,1,'定义任务类型',1),
(3,'图层组','layerGroup',1,NULL,1,'定义图层组',2),
(4,'底图','baseLayer',1,NULL,3,'baseLayer',2),
(6,'专题图','topicLayer',1,NULL,3,'topicLayer',0);

/*Table structure for table `sys_file` */

DROP TABLE IF EXISTS `sys_file`;

CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `size` bigint(20) DEFAULT NULL COMMENT '文件大小，字节',
  `type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `is_delete` int(11) DEFAULT '0' COMMENT '0正常1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_file` */

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '记录用户id',
  `log_type` varchar(128) NOT NULL COMMENT '日志类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `event` varchar(1000) DEFAULT NULL COMMENT '事件',
  `over_time` datetime DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典项表';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`user_id`,`log_type`,`create_time`,`event`,`over_time`) values 

(1,2,'3','2018-10-27 17:09:47','删除了一条信息','2018-10-27 17:10:06'),

(10,1,'2','2018-10-26 14:30:58','对用户名为:admin的用户执行了修改操作','2018-10-26 14:31:05');

/*Table structure for table `sys_maplayer` */

DROP TABLE IF EXISTS `sys_maplayer`;

CREATE TABLE `sys_maplayer` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `layer_id` varchar(50) NOT NULL COMMENT '图层服务id',
  `layer_name` varchar(50) NOT NULL COMMENT '名称',
  `map_url` varchar(255) NOT NULL COMMENT '地图服务地址',
  `layer_url` varchar(255) DEFAULT NULL COMMENT '数据地址',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `object_key` varchar(50) DEFAULT NULL COMMENT '数据源唯一字段key',
  `title_field` varchar(255) DEFAULT NULL COMMENT '数据源标题字段',
  `show_fields` varchar(4000) DEFAULT '[]' COMMENT '展示字段',
  `info_fields` varchar(4000) DEFAULT '[]' COMMENT '精简的展示字段',
  `feature_layer` varchar(255) DEFAULT NULL COMMENT '数据源表名',
  `is_load` int(2) DEFAULT '1' COMMENT '是否加载',
  `layer_group` varchar(255) DEFAULT NULL COMMENT '所属图层组（字典表读取）',
  `query_fields` varchar(4000) DEFAULT '[]' COMMENT '查询字段',
  `active_identy` int(2) DEFAULT '0' COMMENT '开启识别',
  `layer_type` varchar(50) NOT NULL DEFAULT 'esri_dynamic' COMMENT '图层类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_maplayer` */
insert  into `sys_maplayer`(`id`,`layer_id`,`layer_name`,`map_url`,`layer_url`,`description`,`object_key`,`title_field`,`show_fields`,`info_fields`,`feature_layer`,`is_load`,`layer_group`,`query_fields`,`active_identy`,`layer_type`) values 
(1,'test','图1','../','','','','','','','',1,NULL,'',0,''),
(3,'test1','图2','../','','','','','[]','[]','',1,'baseLayer','[]',0,'esri_dynamic'),
(4,'esriWorld','esri世界地图','https://services.arcgisonline.com/arcgis/rest/services/ESRI_Imagery_World_2D/MapServer','','','','','[]','[]','',0,'topicLayer','[]',0,'esri_tile'),
(5,'esriStreet','esri街景地图','https://services.arcgisonline.com/arcgis/rest/services/ESRI_StreetMap_World_2D/MapServer','','','','','[]','[]','',0,'topicLayer','[]',0,'esri_tile'),
(6,'esriDynamic','esri动态','https://services.arcgisonline.com/arcgis/rest/services/Specialty/Soil_Survey_Map/MapServer','','','','','[]','[]','',0,'topicLayer','[]',0,'esri_dynamic');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_url` varchar(256) NOT NULL COMMENT '菜单地址',
  `menu_route` varchar(256) DEFAULT NULL COMMENT '前端路由',
  `menu_name` varchar(128) NOT NULL COMMENT '菜单名称',
  `menu_icon` varchar(128) DEFAULT NULL COMMENT '菜单图标',
  `menu_type` varchar(128) DEFAULT NULL COMMENT '菜单类型',
  `model_name` varchar(128) DEFAULT NULL COMMENT '所属模块名称',
  `sort` bigint(20) DEFAULT NULL COMMENT '排序字段',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`menu_url`,`menu_route`,`menu_name`,`menu_icon`,`menu_type`,`model_name`,`sort`,`parent_id`,`create_user_id`,`update_user_id`) values 

(1,'../image/','http://10.0.0.1/#/about','一级菜单','1','1','1',NULL,0,NULL,NULL),

(2,'../image/','http://10.0.0.1/#/','二级菜单',NULL,NULL,NULL,NULL,1,NULL,NULL),

(3,'../image/','http://10.0.0.1/#/','第二级菜单',NULL,NULL,NULL,NULL,1,NULL,NULL),

(5,'../image/','http://10.0.0.1/#/concat','三级',NULL,NULL,NULL,NULL,2,NULL,NULL),

(6,'../image/','http://10.0.0.1/#/concat','第三级',NULL,NULL,NULL,NULL,2,NULL,NULL),

(7,'../image/','http://10.0.0.1/#/concat','三级','0',NULL,NULL,NULL,3,NULL,NULL),

(9,'../image/','http://10.0.0.1/#/concat4','四级',NULL,NULL,NULL,NULL,5,1,NULL);

/*Table structure for table `sys_organization` */

DROP TABLE IF EXISTS `sys_organization`;

CREATE TABLE `sys_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `organ_code` varchar(128) NOT NULL COMMENT '单位代码',
  `organ_name` varchar(128) NOT NULL COMMENT '单位名称',
  `area_id` bigint(20) DEFAULT NULL COMMENT '所属区域id',
  `area_code` varchar(128) DEFAULT NULL COMMENT '所属区域代码',
  `area_name` varchar(128) DEFAULT NULL COMMENT '所属区域名称',
  `sort` bigint(20) DEFAULT NULL COMMENT '排序字段',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='行政区划';

/*Data for the table `sys_organization` */

insert  into `sys_organization`(`id`,`organ_code`,`organ_name`,`area_id`,`area_code`,`area_name`,`sort`,`parent_id`,`create_user_id`,`update_user_id`) values 

(1,'0350','青岛市无线电管理',NULL,'','山东',NULL,0,NULL,NULL),

(2,'0351','李沧区无线电管理',NULL,'','李沧区',NULL,1,NULL,NULL),

(3,'0352','府山街道无线电',NULL,'','',NULL,2,NULL,NULL),

(4,'0353','虎山街道无线电',NULL,'','',NULL,2,NULL,NULL),

(5,'0405','黄岛区无线电管理',NULL,'','青岛',NULL,1,NULL,NULL),

(6,'0303','市北区无线电',NULL,'','青岛',NULL,1,1,NULL),

(8,'0307','李村',NULL,NULL,'',NULL,4,1,NULL),

(9,'0308','张村',NULL,NULL,'',NULL,4,1,NULL);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(64) NOT NULL COMMENT '角色名称',
  `role_code` varchar(64) NOT NULL COMMENT '角色code',
  `role_type` varchar(64) NOT NULL COMMENT '角色类型',
  `is_enabled` tinyint(1) DEFAULT '1' COMMENT '角色状态(1:激活,0:锁定)',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `name` varchar(128) DEFAULT NULL COMMENT 'ROLE_',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`role_name`,`role_code`,`role_type`,`is_enabled`,`remark`,`name`,`create_user_id`,`update_user_id`) values 

(1,'超级管理员','SUPER_ADMIN','SUPER_ADMIN',1,NULL,'ROLE_ADMIN',NULL,NULL),

(3,'区县管理','ROLE_COUNT','',1,'','',1,NULL);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`menu_id`,`role_id`) values 

(1,1,1);

/*Table structure for table `sys_run_log` */

DROP TABLE IF EXISTS `sys_run_log`;

CREATE TABLE `sys_run_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(128) DEFAULT NULL COMMENT '用户名称(显示名)',
  `action_log` text COMMENT '存储异常栈信息,或者运行的sql) json',
  `action_ip` varchar(64) DEFAULT NULL COMMENT '操作ip地址',
  `action_desc` varchar(1000) DEFAULT NULL COMMENT '操作描述',
  `action_start` datetime NOT NULL COMMENT '动作开始时间',
  `action_end` datetime NOT NULL COMMENT '动作结束时间',
  `action_count` bigint(20) NOT NULL COMMENT '总执行时间(微秒)',
  `action_class` varchar(128) DEFAULT NULL COMMENT '操作类',
  `action_method` varchar(128) DEFAULT NULL COMMENT '操作方法',
  `action_args` varchar(2048) DEFAULT NULL COMMENT '方法参数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';

/*Data for the table `sys_run_log` */

insert  into `sys_run_log`(`id`,`user_id`,`user_name`,`action_log`,`action_ip`,`action_desc`,`action_start`,`action_end`,`action_count`,`action_class`,`action_method`,`action_args`,`create_time`) values 

(1,1,'王磊',NULL,'192.168.1.1',NULL,'2018-10-21 09:07:25','2018-10-22 09:07:31',10,'user','add',NULL,'2018-10-22 09:08:36'),

(2,2,'管理员',NULL,'168.1.1.1',NULL,'2018-10-19 09:50:02','2018-10-20 09:50:06',5,NULL,NULL,NULL,'2018-10-21 09:50:40');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(32) NOT NULL COMMENT '用户名(登录名称)',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `avatar` varchar(128) DEFAULT NULL COMMENT '用户头像',
  `organ_id` bigint(20) DEFAULT NULL COMMENT '用户单位',
  `display_name` varchar(128) DEFAULT NULL COMMENT '用户名称(中文)',
  `last_password` varchar(128) DEFAULT NULL COMMENT '上次使用的密码',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账户状态(1:激活,0:冻结)',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `organ_name` varchar(128) DEFAULT NULL COMMENT '单位名称',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`,`avatar`,`organ_id`,`display_name`,`last_password`,`create_user_id`,`update_user_id`,`create_time`,`update_time`,`is_enabled`,`remark`,`organ_name`,`email`,`phone`) values 

(1,'main','7e5481d3495a294be63266e66b4d2c53','',3,'admin5','',NULL,NULL,'2018-09-07 10:14:21','2018-11-12 11:10:13',1,'管理员哦','府山街道无线电',NULL,NULL),

(2,'1111','c39a4372e7f21dac1ba053de96eaa0d5','',5,'wbz001','',1,NULL,'2018-09-25 11:11:46','2018-11-12 11:03:07',1,'我啊','黄岛区无线电管理',NULL,NULL);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色关系表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values 

(5,6,1),

(13,1,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
