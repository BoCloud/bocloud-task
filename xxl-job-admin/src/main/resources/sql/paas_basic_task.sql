/*
Navicat MariaDB Data Transfer

Source Server         : 192.168.2.172
Source Server Version : 100131
Source Host           : 192.168.2.172:3316
Source Database       : paas_basic_task

Target Server Type    : MariaDB
Target Server Version : 100131
File Encoding         : 65001

Date: 2019-02-21 09:49:29
*/
CREATE database if NOT EXISTS `paas-basic-task` default character set utf8 collate utf8_general_ci;
use `paas-basic-task`;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xxl_job_qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_blob_triggers`;
CREATE TABLE `xxl_job_qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `XXL_JOB_QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `xxl_job_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_calendars`;
CREATE TABLE `xxl_job_qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_cron_triggers`;
CREATE TABLE `xxl_job_qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `XXL_JOB_QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `xxl_job_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_cron_triggers
-- ----------------------------
INSERT INTO `xxl_job_qrtz_cron_triggers` VALUES ('getSchedulerFactoryBean', '2', '2', '0 */1 * * * ?', 'Asia/Shanghai');
INSERT INTO `xxl_job_qrtz_cron_triggers` VALUES ('getSchedulerFactoryBean', '25', '5', '0 0 * * * ?', 'Asia/Shanghai');
INSERT INTO `xxl_job_qrtz_cron_triggers` VALUES ('getSchedulerFactoryBean', '3', '2', '0 0 * * *  ?', 'Asia/Shanghai');
INSERT INTO `xxl_job_qrtz_cron_triggers` VALUES ('getSchedulerFactoryBean', '42', '5', '0 09 00 ? * *', 'Asia/Shanghai');
INSERT INTO `xxl_job_qrtz_cron_triggers` VALUES ('getSchedulerFactoryBean', '48', '5', '0 08 00 ? * *', 'Asia/Shanghai');
INSERT INTO `xxl_job_qrtz_cron_triggers` VALUES ('getSchedulerFactoryBean', '49', '5', '0 08 00 ? * *', 'Asia/Shanghai');
INSERT INTO `xxl_job_qrtz_cron_triggers` VALUES ('getSchedulerFactoryBean', '50', '5', '0 08 00 ? * *', 'Asia/Shanghai');
INSERT INTO `xxl_job_qrtz_cron_triggers` VALUES ('getSchedulerFactoryBean', '51', '5', '0 08 00 ? * *', 'Asia/Shanghai');
INSERT INTO `xxl_job_qrtz_cron_triggers` VALUES ('getSchedulerFactoryBean', '52', '5', '0 08 00 ? * *', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for xxl_job_qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_fired_triggers`;
CREATE TABLE `xxl_job_qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_job_details`;
CREATE TABLE `xxl_job_qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_job_details
-- ----------------------------
INSERT INTO `xxl_job_qrtz_job_details` VALUES ('getSchedulerFactoryBean', '2', '2', null, 'com.xxl.job.admin.core.jobbean.RemoteHttpJobBean', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `xxl_job_qrtz_job_details` VALUES ('getSchedulerFactoryBean', '25', '5', null, 'com.xxl.job.admin.core.jobbean.RemoteHttpJobBean', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `xxl_job_qrtz_job_details` VALUES ('getSchedulerFactoryBean', '3', '2', null, 'com.xxl.job.admin.core.jobbean.RemoteHttpJobBean', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `xxl_job_qrtz_job_details` VALUES ('getSchedulerFactoryBean', '42', '5', null, 'com.xxl.job.admin.core.jobbean.RemoteHttpJobBean', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `xxl_job_qrtz_job_details` VALUES ('getSchedulerFactoryBean', '48', '5', null, 'com.xxl.job.admin.core.jobbean.RemoteHttpJobBean', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `xxl_job_qrtz_job_details` VALUES ('getSchedulerFactoryBean', '49', '5', null, 'com.xxl.job.admin.core.jobbean.RemoteHttpJobBean', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `xxl_job_qrtz_job_details` VALUES ('getSchedulerFactoryBean', '50', '5', null, 'com.xxl.job.admin.core.jobbean.RemoteHttpJobBean', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `xxl_job_qrtz_job_details` VALUES ('getSchedulerFactoryBean', '51', '5', null, 'com.xxl.job.admin.core.jobbean.RemoteHttpJobBean', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `xxl_job_qrtz_job_details` VALUES ('getSchedulerFactoryBean', '52', '5', null, 'com.xxl.job.admin.core.jobbean.RemoteHttpJobBean', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);

-- ----------------------------
-- Table structure for xxl_job_qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_locks`;
CREATE TABLE `xxl_job_qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_locks
-- ----------------------------
INSERT INTO `xxl_job_qrtz_locks` VALUES ('getSchedulerFactoryBean', 'STATE_ACCESS');
INSERT INTO `xxl_job_qrtz_locks` VALUES ('getSchedulerFactoryBean', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for xxl_job_qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_paused_trigger_grps`;
CREATE TABLE `xxl_job_qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_scheduler_state`;
CREATE TABLE `xxl_job_qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_scheduler_state
-- ----------------------------
INSERT INTO `xxl_job_qrtz_scheduler_state` VALUES ('getSchedulerFactoryBean', 'web170.bocloud.com1549869356570', '1550713786459', '5000');

-- ----------------------------
-- Table structure for xxl_job_qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_simple_triggers`;
CREATE TABLE `xxl_job_qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `XXL_JOB_QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `xxl_job_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_simprop_triggers`;
CREATE TABLE `xxl_job_qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `XXL_JOB_QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `xxl_job_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_triggers`;
CREATE TABLE `xxl_job_qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `XXL_JOB_QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `xxl_job_qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_triggers
-- ----------------------------
INSERT INTO `xxl_job_qrtz_triggers` VALUES ('getSchedulerFactoryBean', '2', '2', '2', '2', null, '1550713800000', '1550713740000', '5', 'WAITING', 'CRON', '1548295173000', '0', null, '2', '');
INSERT INTO `xxl_job_qrtz_triggers` VALUES ('getSchedulerFactoryBean', '25', '5', '25', '5', null, '1550714400000', '1550710800000', '5', 'WAITING', 'CRON', '1548127833000', '0', null, '2', '');
INSERT INTO `xxl_job_qrtz_triggers` VALUES ('getSchedulerFactoryBean', '3', '2', '3', '2', null, '1550714400000', '1550710800000', '5', 'WAITING', 'CRON', '1548295176000', '0', null, '2', '');
INSERT INTO `xxl_job_qrtz_triggers` VALUES ('getSchedulerFactoryBean', '42', '5', '42', '5', null, '1550765340000', '1550678940000', '5', 'WAITING', 'CRON', '1548404706000', '0', null, '2', '');
INSERT INTO `xxl_job_qrtz_triggers` VALUES ('getSchedulerFactoryBean', '48', '5', '48', '5', null, '1550765280000', '1550678880000', '5', 'WAITING', 'CRON', '1549876714000', '0', null, '2', '');
INSERT INTO `xxl_job_qrtz_triggers` VALUES ('getSchedulerFactoryBean', '49', '5', '49', '5', null, '1550765280000', '1550678880000', '5', 'WAITING', 'CRON', '1549876731000', '0', null, '2', '');
INSERT INTO `xxl_job_qrtz_triggers` VALUES ('getSchedulerFactoryBean', '50', '5', '50', '5', null, '1550765280000', '1550678880000', '5', 'WAITING', 'CRON', '1550133422000', '0', null, '2', '');
INSERT INTO `xxl_job_qrtz_triggers` VALUES ('getSchedulerFactoryBean', '51', '5', '51', '5', null, '1550765280000', '1550678880000', '5', 'WAITING', 'CRON', '1550133835000', '0', null, '2', '');
INSERT INTO `xxl_job_qrtz_triggers` VALUES ('getSchedulerFactoryBean', '52', '5', '52', '5', null, '1550765280000', '1550678880000', '5', 'WAITING', 'CRON', '1550133838000', '0', null, '2', '');

-- ----------------------------
-- Table structure for xxl_job_qrtz_trigger_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_trigger_group`;
CREATE TABLE `xxl_job_qrtz_trigger_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) NOT NULL COMMENT '执行器名称',
  `order` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `address_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` varchar(512) DEFAULT NULL COMMENT '执行器地址列表，多地址逗号分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_trigger_group
-- ----------------------------
INSERT INTO `xxl_job_qrtz_trigger_group` VALUES ('2', 'task-paas-business-component', '组件管理执行器', '2', '0', '192.168.2.169:10098');
INSERT INTO `xxl_job_qrtz_trigger_group` VALUES ('5', 'task-paas-basic-report', '报表执行器', '1', '0', '192.168.2.170:10097');
INSERT INTO `xxl_job_qrtz_trigger_group` VALUES ('6', 'task-paas-runtime', 'runtime执行器', '3', '1', '192.168.2.169:10096');

-- ----------------------------
-- Table structure for xxl_job_qrtz_trigger_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_trigger_info`;
CREATE TABLE `xxl_job_qrtz_trigger_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_cron` varchar(128) NOT NULL COMMENT '任务执行CRON',
  `job_desc` varchar(255) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) DEFAULT NULL COMMENT '报警邮件',
  `executor_route_strategy` varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int(11) NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_trigger_info
-- ----------------------------
INSERT INTO `xxl_job_qrtz_trigger_info` VALUES ('2', '2', '0 */1 * * * ?', '组件管理', '2018-12-27 07:12:26', '2018-12-27 07:12:26', 'admin', '', 'ROUND', 'componentStatusMonitoringJobHandler', '', 'SERIAL_EXECUTION', '10', '0', 'BEAN', '', 'GLUE代码初始化', '2018-12-27 07:12:26', '');
INSERT INTO `xxl_job_qrtz_trigger_info` VALUES ('3', '2', '0 0 * * *  ?', '组件管理', '2018-12-27 07:13:01', '2018-12-27 07:13:01', 'admin', '', 'ROUND', 'gatewayRouteHandler', '', 'SERIAL_EXECUTION', '0', '0', 'BEAN', '', 'GLUE代码初始化', '2018-12-27 07:13:01', '');
INSERT INTO `xxl_job_qrtz_trigger_info` VALUES ('24', '2', '*/30 * * * * ?', '同步限流配置', '2019-01-22 01:45:17', '2019-01-22 01:45:17', 'admin', '', 'ROUND', 'operationLimitHandler', '', 'SERIAL_EXECUTION', '10', '1', 'BEAN', '', 'GLUE代码初始化', '2019-01-22 01:45:17', '');
INSERT INTO `xxl_job_qrtz_trigger_info` VALUES ('25', '5', '0 0 * * * ?', '计量计费定时任务', '2019-01-22 02:44:11', '2019-01-22 02:44:11', 'admin', '', 'FIRST', 'billJobHandler', '', 'SERIAL_EXECUTION', '0', '0', 'BEAN', '', 'GLUE代码初始化', '2019-01-22 02:44:11', '');
INSERT INTO `xxl_job_qrtz_trigger_info` VALUES ('42', '5', '0 09 00 ? * *', '集群报表统计', '2019-01-25 07:38:47', '2019-02-19 05:48:30', 'admin', '', 'FIRST', 'clusterJobHandler', '', 'SERIAL_EXECUTION', '0', '0', 'BEAN', '', '系统自动生成', '2019-01-25 07:38:47', '');
INSERT INTO `xxl_job_qrtz_trigger_info` VALUES ('48', '5', '0 08 00 ? * *', '分区报表统计', '2019-02-11 08:31:59', '2019-02-14 07:57:06', 'admin', '', 'FIRST', 'partitionJobHandler', '', 'SERIAL_EXECUTION', '0', '0', 'BEAN', '', '系统自动生成', '2019-02-11 08:31:59', '');
INSERT INTO `xxl_job_qrtz_trigger_info` VALUES ('49', '5', '0 08 00 ? * *', '告警历史报表统计', '2019-02-11 08:32:16', '2019-02-14 07:57:15', 'admin', '', 'FIRST', 'alertHistoryJobHandler', '', 'SERIAL_EXECUTION', '0', '0', 'BEAN', '', '系统自动生成', '2019-02-11 08:32:16', '');
INSERT INTO `xxl_job_qrtz_trigger_info` VALUES ('50', '5', '0 08 00 ? * *', '操作审计报表统计', '2019-02-14 07:50:16', '2019-02-14 07:58:04', 'admin', '', 'FIRST', 'actionAuditJobHandler', '', 'SERIAL_EXECUTION', '0', '0', 'BEAN', '', '系统自动生成', '2019-02-14 07:50:16', '');
INSERT INTO `xxl_job_qrtz_trigger_info` VALUES ('51', '5', '0 08 00 ? * *', '主机报表统计', '2019-02-14 07:57:09', '2019-02-14 07:57:09', 'admin', '', 'FIRST', 'hostJobHandler', '', 'SERIAL_EXECUTION', '0', '0', 'BEAN', '', '系统自动生成', '2019-02-14 07:57:09', '');
INSERT INTO `xxl_job_qrtz_trigger_info` VALUES ('52', '5', '0 08 00 ? * *', '租户报表统计', '2019-02-14 07:57:12', '2019-02-14 07:57:12', 'admin', '', 'FIRST', 'envJobHandler', '', 'SERIAL_EXECUTION', '0', '0', 'BEAN', '', '系统自动生成', '2019-02-14 07:57:12', '');

-- ----------------------------
-- Table structure for xxl_job_qrtz_trigger_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_trigger_log`;
CREATE TABLE `xxl_job_qrtz_trigger_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int(11) NOT NULL COMMENT '调度-结果',
  `trigger_msg` text COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int(11) NOT NULL COMMENT '执行-状态',
  `handle_msg` text COMMENT '执行-日志',
  PRIMARY KEY (`id`),
  KEY `I_trigger_time` (`trigger_time`)
) ENGINE=InnoDB AUTO_INCREMENT=104245 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_trigger_log
-- ----------------------------
INSERT INTO `xxl_job_qrtz_trigger_log` VALUES ('104244', '2', '2', '192.168.2.169:10098', 'componentStatusMonitoringJobHandler', '', null, '0', '2019-02-21 09:49:00', '200', '任务触发类型：Cron触发<br>调度机器：10.20.222.0<br>执行器-注册方式：自动注册<br>执行器-地址列表：[192.168.2.169:10098]<br>路由策略：轮询<br>阻塞处理策略：单机串行<br>任务超时时间：10<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：192.168.2.169:10098<br>code：200<br>msg：null', '2019-02-21 09:49:00', '200', '');

-- ----------------------------
-- Table structure for xxl_job_qrtz_trigger_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_trigger_logglue`;
CREATE TABLE `xxl_job_qrtz_trigger_logglue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) NOT NULL COMMENT 'GLUE备注',
  `add_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_trigger_logglue
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_qrtz_trigger_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_qrtz_trigger_registry`;
CREATE TABLE `xxl_job_qrtz_trigger_registry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(255) NOT NULL,
  `registry_key` varchar(255) NOT NULL,
  `registry_value` varchar(255) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_job_qrtz_trigger_registry
-- ----------------------------
INSERT INTO `xxl_job_qrtz_trigger_registry` VALUES ('98', 'EXECUTOR', 'task-paas-business-component', '192.168.2.169:10098', '2019-02-21 01:02:39');
INSERT INTO `xxl_job_qrtz_trigger_registry` VALUES ('106', 'EXECUTOR', 'task-paas-basic-report', '192.168.2.170:10097', '2019-02-21 01:02:38');
