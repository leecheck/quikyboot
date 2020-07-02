/*
SQLyog  v12.2.6 (64 bit)
MySQL - 8.0.12 : Database - emv
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`emv` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `emv`;

/*Table structure for table `tb_abnormal` */

DROP TABLE IF EXISTS `tb_abnormal`;

CREATE TABLE `tb_abnormal` (
  `id` VARCHAR(32) CHARACTER SET utf8mb4  NOT NULL COMMENT '异常id',
  `station_id` VARCHAR(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '台站id',
  `abnormal_id` VARCHAR(32) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '任务id',
  `start_time` DATETIME DEFAULT NULL COMMENT '开始时间',
  `over_time` DATETIME DEFAULT NULL COMMENT '结束时间',
  `describes` VARCHAR(100) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '异常描述',
  `create_user_id` BIGINT(20) DEFAULT NULL COMMENT '创建人',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_user_id` BIGINT(20) DEFAULT NULL COMMENT '修改人',
  `update_time` DATETIME DEFAULT NULL COMMENT '修改时间',
  `is_delete` INT(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `note` VARCHAR(100) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_abnormal` */

INSERT  INTO `tb_abnormal`(`id`,`station_id`,`abnormal_id`,`start_time`,`over_time`,`describes`,`create_user_id`,`create_time`,`update_user_id`,`update_time`,`is_delete`,`note`) VALUES 
('1','1','1','2018-10-17 17:22:22','2018-10-18 17:22:25','异常信号真多',NULL,NULL,NULL,NULL,0,NULL),
('2','2','2','2018-10-19 17:22:35','2018-10-20 17:22:39','异常',NULL,NULL,NULL,NULL,0,NULL);

/*Table structure for table `tb_spectrumdata_tzid` */

DROP TABLE IF EXISTS `tb_spectrumdata_tzid`;

CREATE TABLE `tb_spectrumdata_tzid` (
  `id` VARCHAR(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '数据ID',
  `sid` VARCHAR(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '台站id',
  `task_id` VARCHAR(100) CHARACTER SET utf8mb4 NOT NULL COMMENT '任务id',
  `seq_number` INT(11) DEFAULT NULL COMMENT '扫描序列号',
  `date_time` DATETIME DEFAULT NULL COMMENT '采集时间',
  `freq_start` DOUBLE DEFAULT NULL COMMENT '起始频率 Hz为单位',
  `freq_stop` DOUBLE DEFAULT NULL COMMENT '终止频率 Hz为单位',
  `points_count` INT(11) DEFAULT NULL COMMENT '扫描点数',
  `timestamp_sec` INT(11) DEFAULT NULL COMMENT '扫描时刻秒',
  `timestamp_nSec` INT(11) DEFAULT NULL COMMENT '扫描时刻纳秒',
  `data_quality` VARCHAR(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '数据质量',
  `longitude` DOUBLE DEFAULT NULL COMMENT '监测站经度',
  `latitude` DOUBLE DEFAULT NULL COMMENT '监测站纬度',
  `elevation` DOUBLE DEFAULT NULL COMMENT '监测站高度（米）',
  `syncalarm` INT(11) DEFAULT NULL COMMENT '同步警告',
  `amplitude` longtext COLLATE utf8mb4_general_ci COMMENT '振幅',
  `create_user_id` BIGINT(20) DEFAULT NULL,
  `update_user_id` BIGINT(20) DEFAULT NULL,
  `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `is_delete` INT(2) DEFAULT NULL,
  `note` VARCHAR(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `table_name` VARCHAR(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '数据库名',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='频谱数据';

/*Data for the table `tb_spectrumdata_tzid` */

/*Table structure for table `tb_stationdevices` */

DROP TABLE IF EXISTS `tb_stationdevices`;

CREATE TABLE `tb_stationdevices` (
  `id` VARCHAR(32) CHARACTER SET utf8mb4  NOT NULL COMMENT '站点ID',
  `device` VARCHAR(40) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '监测接收设备',
  `aerial_one` VARCHAR(40) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '天线1',
  `aerial_two` VARCHAR(40) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '天线2',
  `aerial_three` VARCHAR(40) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '天线3',
  `aerial_four` VARCHAR(40) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '天线4',
  `create_user_id` BIGINT(20) DEFAULT NULL,
  `update_user_id` BIGINT(20) DEFAULT NULL,
  `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `is_delete` INT(1) DEFAULT '0',
  `note` VARCHAR(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='监测站设备';

/*Data for the table `tb_stationdevices` */

/*Table structure for table `tb_stationsinfo` */

DROP TABLE IF EXISTS `tb_stationsinfo`;

CREATE TABLE `tb_stationsinfo` (
  `id` VARCHAR(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '站点ID',
  `station_code` VARCHAR(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '站点编号',
  `station_ip` VARCHAR(15) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '监测站IP',
  `station_name` VARCHAR(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '监测站名称',
  `station_des` VARCHAR(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '监测站描述',
  `station_state` INT(2) DEFAULT NULL COMMENT '监测站状态',
  `longitude` DOUBLE(9,6) DEFAULT NULL COMMENT '经度',
  `latitude` DOUBLE(8,6) DEFAULT NULL COMMENT '纬度',
  `altitude` DOUBLE DEFAULT NULL COMMENT '高度',
  `address` VARCHAR(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '地址',
  `handle` VARCHAR(40) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '处理模块',
  `device_count` INT(11) DEFAULT NULL COMMENT '设备数目',
  `create_user_id` BIGINT(20) DEFAULT NULL,
  `update_user_id` BIGINT(20) DEFAULT NULL,
  `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `is_delete` INT(1) DEFAULT '0',
  `note` VARCHAR(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `table_name` VARCHAR(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '数据库名',
  `organ_id` INT(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '单位id',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COMMENT='监测站';

/*Data for the table `tb_stationsinfo` */

INSERT  INTO `tb_stationsinfo`(`id`,`station_code`,`station_ip`,`station_name`,`station_des`,`station_state`,`longitude`,`latitude`,`altitude`,`address`,`handle`,`device_count`,`create_user_id`,`update_user_id`,`create_time`,`update_time`,`is_delete`,`note`,`table_name`) VALUES 
('1','001','11.11.22','衡水',NULL,0,11.000000,22.000000,NULL,'山东济南',NULL,NULL,NULL,NULL,'2018-10-17 17:18:16','2018-10-18 18:00:48',0,NULL,NULL,1),
('2','022','192.168.1.1','呵呵',NULL,0,95.000000,66.000000,NULL,'山东青岛',NULL,NULL,NULL,NULL,'2018-10-24 17:16:55','2018-10-25 18:00:59',0,NULL,NULL,4);

/*Table structure for table `tb_systemlog` */

DROP TABLE IF EXISTS `tb_systemlog`;

CREATE TABLE `tb_systemlog` (
  `id` VARCHAR(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '日志ID',
  `uid` VARCHAR(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '操作人',
  `strat_time` DATETIME DEFAULT NULL COMMENT '开始时间',
  `log_level` VARCHAR(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '日志级别',
  `log_type` VARCHAR(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '日志类型',
  `operation_type` VARCHAR(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '操作类型',
  `log_content` VARCHAR(1000) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '日志内容',
  `over_time` DATETIME DEFAULT NULL COMMENT '结束时间',
  `note` VARCHAR(1000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `is_delete` INT(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COMMENT='异常数据';

/*Data for the table `tb_systemlog` */

INSERT  INTO `tb_systemlog`(`id`,`uid`,`strat_time`,`log_level`,`log_type`,`operation_type`,`log_content`,`over_time`,`note`,`is_delete`) VALUES 
('1','1','2018-10-17 17:23:49','1','1','1',NULL,NULL,NULL,0);

/*Table structure for table `tb_taskmodels` */

DROP TABLE IF EXISTS `tb_taskmodels`;

CREATE TABLE `tb_taskmodels` (
  `model_id` VARCHAR(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '模板ID',
  `task_name` VARCHAR(40) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '任务名称',
  `task_type` VARCHAR(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '任务类型',
  `task_explain` VARCHAR(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '任务描述',
  `task_startRate` DOUBLE DEFAULT NULL COMMENT '起始频率',
  `task_endRate` DOUBLE DEFAULT NULL COMMENT '终止频率',
  `task_bandWidth` DOUBLE DEFAULT NULL COMMENT '分辨带宽',
  `tenuation` INT(11) DEFAULT NULL COMMENT '增益衰减',
  `task_station` VARCHAR(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '监测站',
  `antenna` int(11) DEFAULT NULL COMMENT '天线',
  `average_count` int(11) DEFAULT NULL COMMENT '平均次数',
  `expected_points` int(11) DEFAULT NULL COMMENT '扫描点数（实际设置时可能会微调）',
  `monitor_interval` int(11) DEFAULT NULL COMMENT '监测间隔-监测站送数据的间隔时间',
  `data_quality` int(1) DEFAULT NULL COMMENT '数据质量',
  `task_status` INT(11) DEFAULT NULL COMMENT '任务状态',
  `start_time` DATETIME DEFAULT NULL COMMENT '开始时间',
  `over_time` DATETIME DEFAULT NULL COMMENT '结束时间',
  `create_user_id` BIGINT(20) DEFAULT NULL,
  `update_user_id` BIGINT(20) DEFAULT NULL,
  `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `is_delete` INT(1) DEFAULT '0',
  `note` VARCHAR(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `is_model` INT(1) NOT NULL DEFAULT '0' COMMENT '是否是任务模板',
  PRIMARY KEY (`model_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_taskmodels` */

INSERT  INTO `tb_taskmodels`(`model_id`,`task_name`,`task_type`,`task_explain`,`task_startRate`,`task_endRate`,`task_bandWidth`,`tenuation`,`task_station`,`task_status`,`start_time`,`over_time`,`create_user_id`,`update_user_id`,`create_time`,`update_time`,`is_delete`,`note`,`is_model`) VALUES 
('1','请求','1','监测',11,22,NULL,NULL,'1',1,'2018-10-23 17:19:05','2018-10-24 17:19:08',NULL,NULL,NULL,NULL,0,NULL,0),
('2','五问','2','检查',22,33,NULL,NULL,'2',2,'2018-10-25 17:20:56','2018-10-26 17:21:00',NULL,NULL,NULL,NULL,0,NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
