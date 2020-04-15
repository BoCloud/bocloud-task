CREATE database if NOT EXISTS `paas_basic_task` default character set utf8mb4 collate utf8mb4_unicode_ci;
use `paas_basic_task`;

SET NAMES utf8mb4;

CREATE TABLE `xxl_job_info` (
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
  `trigger_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `xxl_job_info` VALUES (1, 1, '0 0 8 ? * *', '集群报表统计', '2020-04-15 14:52:53', '2020-04-15 15:14:58', 'admin', '', 'ROUND', 'clusterJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 14:52:53', '', 0, 0, 1586995200000);
INSERT INTO `xxl_job_info` VALUES (2, 1, '0 0 8 ? * *', '分区报表统计', '2020-04-15 14:56:34', '2020-04-15 14:56:34', 'admin', '', 'ROUND', 'partitionJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 14:56:34', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (3, 1, '0 0 8 ? * *', '主机报表统计', '2020-04-15 14:57:19', '2020-04-15 14:57:19', 'admin', '', 'ROUND', 'hostJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 14:57:19', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (4, 1, '0 0 8 ? * *', '租户报表统计', '2020-04-15 14:58:15', '2020-04-15 14:58:15', 'admin', '', 'ROUND', 'envJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 14:58:15', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (5, 1, '0 0 8 ? * *', '告警历史报表统计', '2020-04-15 14:58:38', '2020-04-15 14:58:38', 'admin', '', 'ROUND', 'alertHistoryJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 14:58:38', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (6, 1, '0 0 8 ? * *', '操作审计报表统计', '2020-04-15 14:59:06', '2020-04-15 14:59:06', 'admin', '', 'ROUND', 'actionAuditJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 14:59:06', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (7, 1, '0 0 8 ? * *', '应用报表统计', '2020-04-15 14:59:27', '2020-04-15 14:59:27', 'admin', '', 'ROUND', 'projectCoreJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 14:59:27', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (8, 1, '0 0 * * * ?', '计量计费定时任务', '2020-04-15 15:01:21', '2020-04-15 15:01:21', 'admin', '', 'ROUND', 'billJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 15:01:21', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (9, 2, '0 0/5 * * * ?', '跨仓库镜像同步后台定时任务', '2020-04-15 15:03:34', '2020-04-15 15:03:34', 'admin', '', 'ROUND', 'betweenRegistryCopyImageJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 15:03:34', '', 1, 0, 1586935200000);
INSERT INTO `xxl_job_info` VALUES (10, 2, '0/30 * * * * ?', '集群健康检查后台定时任务', '2020-04-15 15:04:21', '2020-04-15 15:04:21', 'admin', '', 'ROUND', 'clusterHealthCheckJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 15:04:21', '', 1, 1586935110000, 1586935140000);
INSERT INTO `xxl_job_info` VALUES (11, 2, '0/30 * * * * ?', '安装中/删除中节点更新定时任务', '2020-04-15 15:05:06', '2020-04-15 15:05:06', 'admin', '', 'ROUND', 'hostProcessCheckJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 15:05:06', '', 1, 1586935110000, 1586935140000);
INSERT INTO `xxl_job_info` VALUES (12, 2, '0 0/5 * * * ?', '仓库健康检查后台定时任务', '2020-04-15 15:07:33', '2020-04-15 15:07:33', 'admin', '', 'ROUND', 'registryHealthCheckJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 15:07:33', '', 1, 0, 1586935200000);
INSERT INTO `xxl_job_info` VALUES (13, 2, '0 0/5 * * * ?', '后台同步镜像定时任务', '2020-04-15 15:08:01', '2020-04-15 15:08:01', 'admin', '', 'ROUND', 'registrySynchronousImageJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 15:08:01', '', 1, 0, 1586935200000);
INSERT INTO `xxl_job_info` VALUES (14, 2, '0 0/5 * * * ?', '后台镜像扫描定时任务', '2020-04-15 15:08:36', '2020-04-15 15:08:36', 'admin', '', 'ROUND', 'ImageScannerJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 15:08:36', '', 1, 0, 1586935200000);
INSERT INTO `xxl_job_info` VALUES (15, 2, '0 0 2 * * ?', '镜像定时清理策略任务', '2020-04-15 15:09:15', '2020-04-15 15:09:15', 'admin', '', 'ROUND', 'exeImageSetPolicyJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 15:09:15', '', 1, 0, 1586973600000);
INSERT INTO `xxl_job_info` VALUES (16, 2, '0/30 * * * * ?', 'Pod更新分区定时任务开始', '2020-04-15 15:09:38', '2020-04-15 15:09:38', 'admin', '', 'ROUND', 'updatePartitionPodJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 15:09:38', '', 1, 1586935110000, 1586935140000);
INSERT INTO `xxl_job_info` VALUES (17, 3, '0/3 * * * * ?', '流水线后台服务监控', '2020-04-15 15:10:07', '2020-04-15 15:10:07', 'admin', '', 'ROUND', 'jenkinsBuildingHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 15:10:07', '', 1, 1586935113000, 1586935116000);
INSERT INTO `xxl_job_info` VALUES (18, 4, '0 */1 * * * ?', '组件状态检测', '2020-04-15 15:10:36', '2020-04-15 15:10:36', 'admin', '', 'ROUND', 'componentStatusJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2020-04-15 15:10:36', '', 1, 1586935080000, 1586935140000);


CREATE TABLE `xxl_job_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `alarm_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`),
  KEY `I_trigger_time` (`trigger_time`),
  KEY `I_handle_code` (`handle_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `xxl_job_log_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int(11) NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `xxl_job_logglue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `xxl_job_registry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) NOT NULL,
  `registry_key` varchar(255) NOT NULL,
  `registry_value` varchar(255) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_g_k_v` (`registry_group`,`registry_key`,`registry_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `xxl_job_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) NOT NULL COMMENT '执行器名称',
  `address_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` varchar(512) DEFAULT NULL COMMENT '执行器地址列表，多地址逗号分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `xxl_job_group` VALUES (1, 'task-boc-report', '报表执行器', 0, '192.168.2.170:10097');
INSERT INTO `xxl_job_group` VALUES (2, 'task-boc-runtime', 'runtime执行器', 0, '192.168.2.170:10096');
INSERT INTO `xxl_job_group` VALUES (3, 'task-bocloud-pipeline', '流水线定时任务', 0, '10.10.100.92:10098');
INSERT INTO `xxl_job_group` VALUES (4, 'task-boms-broker', 'broker执行器', 0, '10.20.11.112:9999');

CREATE TABLE `xxl_job_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `role` tinyint(4) NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `xxl_job_lock` (
  `lock_name` varchar(50) NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `xxl_job_user`(`id`, `username`, `password`, `role`, `permission`) VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);
INSERT INTO `xxl_job_lock` ( `lock_name`) VALUES ( 'schedule_lock');

commit;

