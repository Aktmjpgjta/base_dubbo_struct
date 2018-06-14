/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : accent-sys-dev

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-06-14 19:03:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('scheduler', 'TaskA', '测试定时任务', '0/5 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
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
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
INSERT INTO `qrtz_fired_triggers` VALUES ('scheduler', '172.24.132.21615289461317231528946132092', 'TaskA', '测试定时任务', '172.24.132.2161528946131723', '1528948090071', '1528948095000', '5', 'ACQUIRED', null, null, '0', '0');

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
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
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('scheduler', 'TaskA', '测试定时任务', null, 'com.yingu.accent.job.TaskA', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000B7363686564756C654A6F6273720022636F6D2E79696E67752E616363656E742E6D6F64656C2E5363686564756C654A6F62674C767D9AFA5E0B0200054C0009636C6173734E616D657400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000567726F757071007E00094C00046E616D6571007E00094C000673746174757371007E0009787074001A636F6D2E79696E67752E616363656E742E6A6F622E5461736B4174000D302F35202A202A202A202A203F740012E6B58BE8AF95E5AE9AE697B6E4BBBBE58AA17400055461736B41707800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('scheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('scheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('scheduler', '172.24.132.2161528946131723', '1528948082783', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
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
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
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
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('scheduler', 'TaskA', '测试定时任务', 'TaskA', '测试定时任务', null, '1528948100000', '1528948095000', '5', 'ACQUIRED', 'CRON', '1528177950000', '0', null, '0', '');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `leaf` int(1) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `sortidx` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `value1` varchar(255) DEFAULT NULL,
  `value2` varchar(255) DEFAULT NULL,
  `value3` varchar(255) DEFAULT NULL,
  `value4` varchar(255) DEFAULT NULL,
  `value5` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=614 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('3', 'root', '数据字典', '/', null, '0', '2017-07-10 16:10:56', '2017-07-12 17:38:28', '1', '1', null, null, null, null, null, null, '1');
INSERT INTO `sys_dict` VALUES ('51', 'ACC', '账户系统', '/ACC', '3', '0', '2017-07-12 17:38:28', '2017-07-21 14:17:30', '1499852308389', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('53', 'SYS', '后台管理', '/SYS', '3', '0', '2017-07-12 17:38:53', '2017-07-12 17:39:09', '1499852333189', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('54', 'MENU_TYPE', '菜单类型', '/SYS/MENU_TYPE', '53', '0', '2017-07-12 17:39:09', '2017-07-12 17:39:28', '1499852348813', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('55', '1', '菜单', '/SYS/MENU_TYPE/1', '54', '1', '2017-07-12 17:39:28', '2017-07-12 17:39:28', '1499852368421', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('56', '2', '按钮', '/SYS/MENU_TYPE/2', '54', '1', '2017-07-12 17:39:36', '2017-07-13 10:52:20', '1499852376059', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('58', 'COMP', '公共字典', '/COMP', '3', '0', '2017-07-12 18:21:26', '2017-07-12 18:22:08', '1499854886055', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('59', 'GENDER', '性别', '/COMP/GENDER', '58', '0', '2017-07-12 18:22:08', '2017-07-12 18:22:20', '1499854928267', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('60', '1', '男', '/COMP/GENDER/1', '59', '1', '2017-07-12 18:22:20', '2017-07-12 18:22:20', '1499854940125', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('61', '0', '女', '/COMP/GENDER/0', '59', '1', '2017-07-12 18:22:26', '2017-07-12 18:22:26', '1499854946036', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('62', 'CARDKIND', '证件类型', '/COMP/CARDKIND', '58', '0', '2017-07-12 18:23:11', '2017-07-24 10:49:24', '1499854991478', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('63', 'STATUS', '系统状态', '/COMP/STATUS', '58', '0', '2017-07-12 18:24:19', '2017-07-12 18:24:41', '1499855059104', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('64', '0', '停用', '/COMP/STATUS/0', '63', '1', '2017-07-12 18:24:41', '2017-07-12 18:24:48', '1499855080800', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('65', '-1', '无效', '/COMP/STATUS/-1', '63', '1', '2017-07-12 18:25:02', '2017-07-12 18:25:02', '1499855101500', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('66', '1', '启用', '/COMP/STATUS/1', '63', '1', '2017-07-12 18:25:12', '2017-07-12 18:25:12', '1499855112186', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('74', 'COMPANY_HHR', '恒慧融公司账户', '/ACC/COMPANY_HHR', '51', '0', '2017-07-21 14:17:30', '2017-07-21 14:19:49', '1500617849517', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('75', 'FOUR_HHR', '四大服务费账户', '/ACC/COMPANY_HHR/FOUR_HHR', '74', '0', '2017-07-21 14:19:49', '2017-07-21 14:21:22', '1500617989409', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('76', 'LITONG_HHR', '利通服务费账户', '/ACC/COMPANY_HHR/FOUR_HHR/LITONG_HHR', '75', '1', '2017-07-21 14:21:22', '2017-07-21 18:17:19', '1500618082217', '0', 'B_20170721000202', '0.4', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('77', 'HUICHENG_HHR', '惠诚服务费服务费', '/ACC/COMPANY_HHR/FOUR_HHR/HUICHENG_HHR', '75', '1', '2017-07-21 14:21:54', '2017-07-21 18:17:32', '1500618114133', '0', 'B_20170721000203', '0.32', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('78', 'HUICAI_HHR', '汇财服务费账户', '/ACC/COMPANY_HHR/FOUR_HHR/HUICAI_HHR', '75', '1', '2017-07-21 14:22:15', '2017-07-21 18:17:07', '1500618134638', '0', 'B_20170721000201', '0.26', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('79', 'DESHENG_HHR', '德胜服务费账户', '/ACC/COMPANY_HHR/FOUR_HHR/DESHENG_HHR', '75', '1', '2017-07-21 14:22:35', '2017-07-21 18:17:42', '1500618155245', '0', 'B_20170721000204', '0.02', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('81', 'SAFE_HHR', '代收保险费账户', '/ACC/COMPANY_HHR/SAFE_HHR', '74', '1', '2017-07-21 14:24:37', '2017-07-21 18:18:37', '1500618276974', '0', 'B_20170721000209', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('82', 'PROMOTION_HHR', '运营推广账户', '/ACC/COMPANY_HHR/PROMOTION_HHR', '74', '1', '2017-07-21 14:26:17', '2017-07-21 18:19:04', '1500618377292', '0', 'B_20170721000212', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('83', 'RISK_HHR', '风险金账户', '/ACC/COMPANY_HHR/RISK_HHR', '74', '1', '2017-07-21 14:26:55', '2017-07-21 18:18:48', '1500618414997', '0', 'B_20170721000211', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('84', 'BREACH_HHR', '违约金账户', '/ACC/COMPANY_HHR/BREACH_HHR', '74', '1', '2017-07-21 14:27:38', '2017-11-27 17:35:02', '1500618457531', '0', 'B_20170721000206', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('85', 'PENALTY_HHR', '罚息账户', '/ACC/COMPANY_HHR/PENALTY_HHR', '74', '1', '2017-07-21 14:33:29', '2017-11-27 17:35:38', '1500618809016', '0', 'B_20170721000207', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('86', 'CS_HHR', '催收服务费账户', '/ACC/COMPANY_HHR/CS_HHR', '74', '1', '2017-07-21 14:38:49', '2017-07-21 18:18:26', '1500619129435', '0', 'B_20170721000208', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('87', 'ZQZR_HHR', '到期赎回服务费账户', '/ACC/COMPANY_HHR/ZQZR_HHR', '74', '1', '2017-07-21 14:40:07', '2017-12-07 16:54:12', '1500619207411', '0', 'B_2017120700000207', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('88', 'BIZSYSTEM', '业务系统', '/COMP/BIZSYSTEM', '58', '0', '2017-07-21 18:48:19', '2017-07-21 18:48:34', '1500634098638', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('89', 'HHR', '恒慧融', '/COMP/BIZSYSTEM/HHR', '88', '1', '2017-07-21 18:48:34', '2017-07-21 18:48:34', '1500634113931', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('90', 'SUB_TYPE', '子账户类型', '/ACC/SUB_TYPE', '51', '0', '2017-07-21 18:52:23', '2017-07-21 18:53:07', '1500634342843', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('91', '0', '现金账户', '/ACC/SUB_TYPE/0', '90', '1', '2017-07-21 18:53:07', '2017-07-26 12:01:58', '1500634387058', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('92', '5', '银行账户', '/ACC/SUB_TYPE/5', '90', '1', '2017-07-21 18:53:36', '2017-07-26 12:00:42', '1500634416048', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('93', '8', '普通冻结账户', '/ACC/SUB_TYPE/8', '90', '1', '2017-07-21 18:53:50', '2017-07-26 12:02:12', '1500634429639', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('96', 'ACC_DIR', '账务方向', '/ACC/ACC_DIR', '51', '0', '2017-07-21 18:54:54', '2017-07-21 18:55:16', '1500634494445', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('97', '0', '出账', '/ACC/ACC_DIR/0', '96', '1', '2017-07-21 18:55:16', '2017-07-21 18:55:16', '1500634516125', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('98', '1', '入账', '/ACC/ACC_DIR/1', '96', '1', '2017-07-21 18:55:24', '2017-07-21 18:55:24', '1500634523770', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('99', 'UNIT', '货币单位', '/COMP/UNIT', '58', '0', '2017-07-21 18:56:24', '2017-07-21 18:56:40', '1500634584338', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('100', '1', '人民币', '/COMP/UNIT/1', '99', '1', '2017-07-21 18:56:40', '2017-07-21 18:56:40', '1500634600036', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('101', 'BIZ_TYPE', '业务类型', '/ACC/BIZ_TYPE', '51', '0', '2017-07-21 18:57:37', '2017-07-21 18:57:52', '1500634657046', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('102', '0', '充值', '/ACC/BIZ_TYPE/0', '101', '1', '2017-07-21 18:57:52', '2017-07-21 18:57:52', '1500634672470', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('103', '1', '代付', '/ACC/BIZ_TYPE/1', '101', '1', '2017-07-21 18:58:05', '2017-12-19 14:28:43', '1500634685356', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('104', '13', '放款', '/ACC/BIZ_TYPE/13', '101', '1', '2017-07-21 18:58:19', '2017-07-21 18:58:19', '1500634698694', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('105', '34', '返现', '/ACC/BIZ_TYPE/34', '101', '1', '2017-07-21 18:58:42', '2017-07-21 18:58:53', '1500634721500', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('106', '7', '债权转让', '/ACC/BIZ_TYPE/7', '101', '1', '2017-07-21 18:59:09', '2017-07-21 18:59:09', '1500634748974', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('107', '4', '还款', '/ACC/BIZ_TYPE/4', '101', '1', '2017-07-21 18:59:29', '2017-07-21 18:59:29', '1500634769038', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('108', '29', '风险金代偿', '/ACC/BIZ_TYPE/29', '101', '1', '2017-07-21 18:59:41', '2017-07-21 18:59:41', '1500634781470', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('109', '30', '逾期还款', '/ACC/BIZ_TYPE/30', '101', '1', '2017-07-21 18:59:53', '2017-07-21 18:59:53', '1500634792776', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('110', '6', '提前结清', '/ACC/BIZ_TYPE/6', '101', '1', '2017-07-21 19:00:04', '2017-07-21 19:00:04', '1500634803554', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('111', '22', '资金解冻', '/ACC/BIZ_TYPE/22', '101', '1', '2017-07-21 19:00:19', '2017-07-21 19:00:19', '1500634818898', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('112', '41', '投标解冻', '/ACC/BIZ_TYPE/41', '101', '1', '2017-07-21 19:00:29', '2017-07-21 19:00:29', '1500634829074', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('113', '42', '提现解冻', '/ACC/BIZ_TYPE/42', '101', '1', '2017-07-21 19:00:39', '2017-07-21 19:00:39', '1500634839361', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('114', '39', '投标冻结', '/ACC/BIZ_TYPE/39', '101', '1', '2017-07-21 19:00:54', '2017-07-21 19:00:54', '1500634853612', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('115', '40', '提现冻结', '/ACC/BIZ_TYPE/40', '101', '1', '2017-07-21 19:01:08', '2017-07-21 19:01:08', '1500634867718', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('116', '10', '资金冻结', '/ACC/BIZ_TYPE/10', '101', '1', '2017-07-21 19:01:18', '2017-07-21 19:01:18', '1500634877818', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('117', '36', '收益补偿', '/ACC/BIZ_TYPE/36', '101', '1', '2017-07-21 19:01:36', '2017-07-21 19:01:36', '1500634896478', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('118', '37', '风险金偿还', '/ACC/BIZ_TYPE/37', '101', '1', '2017-07-21 19:01:48', '2017-07-21 19:01:48', '1500634908252', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('119', 'CAPITAL_TYPE', '资金类型', '/ACC/CAPITAL_TYPE', '51', '0', '2017-07-21 19:02:32', '2017-07-21 19:02:50', '1500634952264', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('120', '0', '冻结', '/ACC/CAPITAL_TYPE/0', '119', '1', '2017-07-21 19:02:50', '2017-07-21 19:02:50', '1500634969829', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('121', '1', '转账', '/ACC/CAPITAL_TYPE/1', '119', '1', '2017-07-21 19:03:02', '2017-07-21 19:03:02', '1500634982049', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('122', '2', '解冻', '/ACC/CAPITAL_TYPE/2', '119', '1', '2017-07-21 19:03:13', '2017-07-21 19:03:13', '1500634992754', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('123', '3', '充值', '/ACC/CAPITAL_TYPE/3', '119', '1', '2017-07-21 19:03:22', '2017-07-21 19:03:22', '1500635001531', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('124', '4', '提现', '/ACC/CAPITAL_TYPE/4', '119', '1', '2017-07-21 19:03:36', '2017-07-21 19:03:36', '1500635016209', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('125', 'CAPITAL_NAME', '资金名称', '/ACC/CAPITAL_NAME', '51', '0', '2017-07-24 10:37:33', '2017-07-24 10:39:21', '1500863853440', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('126', '0', '到账资金', '/ACC/CAPITAL_NAME/0', '125', '1', '2017-07-24 10:39:21', '2017-07-24 10:39:21', '1500863960949', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('127', '1', '手续费收取', '/ACC/CAPITAL_NAME/1', '125', '1', '2017-07-24 10:39:39', '2017-07-24 10:39:39', '1500863979340', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('128', '2', '冻结资金', '/ACC/CAPITAL_NAME/2', '125', '1', '2017-07-24 10:39:49', '2017-07-24 10:39:49', '1500863989178', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('129', '3', '解冻资金', '/ACC/CAPITAL_NAME/3', '125', '1', '2017-07-24 10:40:02', '2017-07-24 10:40:02', '1500864001908', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('130', '4', '发放红包资金', '/ACC/CAPITAL_NAME/4', '125', '1', '2017-07-24 10:40:13', '2017-07-24 10:40:13', '1500864012818', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('131', '5', '红包放款资金', '/ACC/CAPITAL_NAME/5', '125', '1', '2017-07-24 10:40:23', '2017-07-24 10:40:23', '1500864023225', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('132', '6', '首次出借放款资金', '/ACC/CAPITAL_NAME/6', '125', '1', '2017-07-24 10:40:36', '2017-07-24 10:40:36', '1500864036397', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('133', '7', '复投放款资金', '/ACC/CAPITAL_NAME/7', '125', '1', '2017-07-24 10:40:48', '2017-07-24 10:40:48', '1500864047960', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('134', '8', '可提现资金', '/ACC/CAPITAL_NAME/8', '125', '1', '2017-07-24 10:41:15', '2017-07-24 10:41:15', '1500864075338', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('135', '9', '利通收取服务费资金', '/ACC/CAPITAL_NAME/9', '125', '1', '2017-07-24 10:41:27', '2017-07-24 10:41:27', '1500864087444', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('136', '10', '德盛收取服务费资金', '/ACC/CAPITAL_NAME/10', '125', '1', '2017-07-24 10:41:39', '2017-07-24 10:41:39', '1500864099128', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('137', '11', '汇财收取服务费资金', '/ACC/CAPITAL_NAME/11', '125', '1', '2017-07-24 10:41:51', '2017-07-24 10:41:51', '1500864110915', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('138', '12', '惠诚收取服务费资金', '/ACC/CAPITAL_NAME/12', '125', '1', '2017-07-24 10:42:03', '2017-07-24 10:42:03', '1500864122576', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('139', '13', '代收保险费资金', '/ACC/CAPITAL_NAME/13', '125', '1', '2017-07-24 10:42:13', '2017-07-24 10:42:13', '1500864132900', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('140', '14', '返现资金', '/ACC/CAPITAL_NAME/14', '125', '1', '2017-07-24 10:42:24', '2017-07-24 10:42:24', '1500864143558', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('141', '15', '代扣所得税资金', '/ACC/CAPITAL_NAME/15', '125', '1', '2017-07-24 10:42:34', '2017-07-24 10:42:34', '1500864154037', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('142', '16', '收取服务费资金', '/ACC/CAPITAL_NAME/16', '125', '1', '2017-07-24 10:42:44', '2017-07-24 10:42:44', '1500864163843', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('143', '17', '还款资金', '/ACC/CAPITAL_NAME/17', '125', '1', '2017-07-24 10:42:54', '2017-07-24 10:42:54', '1500864174161', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('144', '18', '风险金代偿资金', '/ACC/CAPITAL_NAME/18', '125', '1', '2017-07-24 10:43:04', '2017-07-24 10:43:04', '1500864183695', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('145', '19', '偿还违约金资金', '/ACC/CAPITAL_NAME/19', '125', '1', '2017-07-24 10:43:14', '2017-07-24 10:43:14', '1500864194418', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('146', '20', '偿还罚息资金', '/ACC/CAPITAL_NAME/20', '125', '1', '2017-07-24 10:44:02', '2017-07-24 10:44:02', '1500864241931', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('147', '21', '利通退换服务费资金', '/ACC/CAPITAL_NAME/21', '125', '1', '2017-07-24 10:44:13', '2017-07-24 10:44:13', '1500864252982', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('148', '22', '德盛退还服务费资金', '/ACC/CAPITAL_NAME/22', '125', '1', '2017-07-24 10:44:24', '2017-07-24 10:44:24', '1500864264442', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('149', '23', '汇财退还服务费资金', '/ACC/CAPITAL_NAME/23', '125', '1', '2017-07-24 10:44:35', '2017-07-24 10:44:35', '1500864275281', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('150', '24', '汇诚退还服务费资金', '/ACC/CAPITAL_NAME/24', '125', '1', '2017-07-24 10:46:03', '2017-07-24 10:46:03', '1500864362560', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('151', '25', '补偿金额', '/ACC/CAPITAL_NAME/25', '125', '1', '2017-07-24 10:46:13', '2017-12-07 10:04:59', '1500864372505', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('152', '26', '退还服务费资金', '/ACC/CAPITAL_NAME/26', '125', '1', '2017-07-24 10:46:22', '2018-01-02 14:02:52', '1500864381995', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('153', '28', '偿还资金', '/ACC/CAPITAL_NAME/28', '125', '1', '2017-07-24 10:46:39', '2017-07-24 10:46:39', '1500864398932', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('154', '29', '债权转让', '/ACC/CAPITAL_NAME/29', '125', '1', '2017-07-24 10:46:48', '2017-07-24 10:46:48', '1500864408456', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('155', '30', '放款资金', '/ACC/CAPITAL_NAME/30', '125', '1', '2017-07-24 10:46:58', '2017-07-24 10:46:58', '1500864418138', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('156', '31', '偿还风险金资金', '/ACC/CAPITAL_NAME/31', '125', '1', '2017-07-24 10:47:08', '2017-07-24 10:47:08', '1500864427816', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('157', '01', '身份证', '/COMP/CARDKIND/01', '62', '1', '2017-07-24 10:49:24', '2017-07-24 10:49:24', '1500864564454', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('158', '02', '护照', '/COMP/CARDKIND/02', '62', '1', '2017-07-24 10:49:36', '2017-07-24 10:49:36', '1500864575949', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('159', '03', '港澳居民来往内地通行证', '/COMP/CARDKIND/03', '62', '1', '2017-07-24 10:49:47', '2017-12-13 14:28:57', '1500864587290', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('160', '04', '台湾同胞来往内地通行证', '/COMP/CARDKIND/04', '62', '1', '2017-07-24 10:49:57', '2017-12-13 14:29:08', '1500864596839', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('161', '05', '临时身份证', '/COMP/CARDKIND/05', '62', '1', '2017-07-24 10:50:06', '2017-12-13 14:29:24', '1500864605863', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('162', 'CUSTOMER_TYPE', '客户类别', '/ACC/CUSTOMER_TYPE', '51', '0', '2017-07-24 10:51:57', '2017-07-24 10:55:10', '1500864716805', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('163', '0', '个人账户', '/ACC/CUSTOMER_TYPE/0', '162', '1', '2017-07-24 10:52:18', '2017-07-24 10:52:18', '1500864737939', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('164', '1', '平台账户', '/ACC/CUSTOMER_TYPE/1', '162', '1', '2017-07-24 10:52:30', '2018-01-18 16:44:26', '1500864750011', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('165', 'CUSTOMER_ID_TYPE', '客户身份类型', '/ACC/CUSTOMER_ID_TYPE', '51', '0', '2017-07-24 10:54:56', '2017-07-24 10:55:44', '1500864895665', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('166', '1', '出借人', '/ACC/CUSTOMER_ID_TYPE/1', '165', '1', '2017-07-24 10:55:44', '2017-07-24 10:55:44', '1500864944128', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('167', '2', '借款人', '/ACC/CUSTOMER_ID_TYPE/2', '165', '1', '2017-07-24 10:55:54', '2017-11-07 09:56:15', '1500864954374', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('176', '43', '还款冻结', '/ACC/BIZ_TYPE/43', '101', '1', '2017-07-25 10:53:29', '2017-07-25 10:53:29', '1500951208678', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('177', '44', '还款解冻', '/ACC/BIZ_TYPE/44', '101', '1', '2017-07-25 10:53:43', '2017-07-25 10:53:43', '1500951222683', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('198', 'BIND_TYPE', '绑卡类型', '/ACC/BIND_TYPE', '51', '0', '2017-07-31 15:05:17', '2017-07-31 15:06:17', '1501484717009', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('199', '1', '绑卡', '/ACC/BIND_TYPE/1', '198', '1', '2017-07-31 15:06:17', '2017-07-31 15:06:55', '1501484776825', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('200', '2', '换卡', '/ACC/BIND_TYPE/2', '198', '1', '2017-07-31 15:07:15', '2017-07-31 15:07:15', '1501484834870', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('249', 'TEST122345674567', '测试字典', '/COMP/TEST122345674567', '58', '0', '2017-08-05 11:53:51', '2017-08-05 14:34:33', '1501905230686', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('250', '1', '叶子1', '/COMP/TEST122345674567/1', '249', '1', '2017-08-05 11:54:02', '2017-08-05 14:34:33', '1501905241770', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('251', '24444444555', '叶子244', '/COMP/TEST122345674567/24444444555', '249', '1', '2017-08-05 11:54:11', '2017-08-05 14:34:33', '1501905250610', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('252', '3', '叶子3', '/COMP/TEST122345674567/3', '249', '1', '2017-08-05 11:54:17', '2017-08-05 14:34:33', '1501905257443', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('254', 'RECHARGE_HHR', '充值手续费账户', '/ACC/COMPANY_HHR/RECHARGE_HHR', '74', '1', '2017-08-14 09:55:49', '2017-08-14 09:55:49', '1502675748515', '0', 'B_20170814000001', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('255', 'WITHDRAW_HHR', '提现手续费账户', '/ACC/COMPANY_HHR/WITHDRAW_HHR', '74', '1', '2017-08-14 09:56:28', '2017-08-14 09:56:28', '1502675788335', '0', 'B_20170814000002', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('256', 'SIGNOUT_HHR', '紧急赎回服务费账户', '/ACC/COMPANY_HHR/SIGNOUT_HHR', '74', '1', '2017-08-14 11:07:26', '2017-12-07 16:53:58', '1502680046343', '0', 'B_2017120700000208', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('284', 'INCOMETAX_HHR', '代扣所得税', '/ACC/COMPANY_HHR/INCOMETAX_HHR', '74', '1', '2017-09-20 11:16:20', '2017-09-20 11:16:20', '1505877380470', '0', 'B_20170721000210', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('285', 'AUDIT_STATUS', '审核状态', '/ACC/AUDIT_STATUS', '51', '0', '2017-09-26 10:08:10', '2017-09-26 10:16:20', '1506391690412', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('286', '0', '未审批', '/ACC/AUDIT_STATUS/0', '285', '1', '2017-09-26 10:08:29', '2017-09-26 10:16:20', '1506391708506', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('287', '1', '审批通过', '/ACC/AUDIT_STATUS/1', '285', '1', '2017-09-26 10:09:10', '2017-09-26 10:16:20', '1506391750340', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('288', '2', '审批拒绝', '/ACC/AUDIT_STATUS/2', '285', '1', '2017-09-26 10:09:22', '2017-09-26 10:16:20', '1506391762168', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('289', '3', '审批失败', '/ACC/AUDIT_STATUS/3', '285', '1', '2017-09-26 10:09:48', '2017-09-26 10:16:20', '1506391787891', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('303', 'UKEY_SIGNATURE_PATH', 'Ukey签名路径', '/ACC/UKEY_SIGNATURE_PATH', '51', '0', '2017-10-12 13:57:08', '2017-10-12 14:04:47', '1507787827940', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('304', 'TRUST_CERT_PATH', '公钥路径', '/ACC/UKEY_SIGNATURE_PATH/TRUST_CERT_PATH', '303', '1', '2017-10-12 13:58:32', '2017-10-12 14:02:49', '1507787912069', '0', 'key/dev/ca.cer', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('305', 'CLR_PATH', '证书路径', '/ACC/UKEY_SIGNATURE_PATH/CLR_PATH', '303', '1', '2017-10-12 14:03:43', '2017-10-12 14:04:25', '1507788222812', '0', 'key/dev/ca.crl', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('310', 'MAIL_TYPE', '邮件类型', '/ACC/MAIL_TYPE', '51', '0', '2017-10-17 14:21:22', '2017-10-17 14:35:21', '1508221282316', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('311', 'TZSQMail', '调账申请邮件配置', '/ACC/MAIL_TYPE/TZSQMail', '310', '1', '2017-10-17 14:23:16', '2017-10-17 14:35:21', '1508221396050', '0', 'wangyanan160420@credithc.com', 'ACCOUNTING_TZSQ', '', '', '', '值1：收件地址\r\n值2：模板类型', '1');
INSERT INTO `sys_dict` VALUES ('312', 'TZSHMail', '调账审批邮件配置', '/ACC/MAIL_TYPE/TZSHMail', '310', '1', '2017-10-17 14:32:02', '2017-10-17 14:35:21', '1508221922199', '0', 'wangyanan160420@credithc.com', 'ACCOUNTING_TZSH', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('313', 'REPELFEE_HHR', '结清退费账户', '/ACC/COMPANY_HHR/REPELFEE_HHR', '74', '1', '2017-10-25 11:38:22', '2017-11-25 15:08:23', '1508902701715', '0', 'B_20171030000004', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('314', 'PREMIUMQUALITY_HHR', '质保费账户', '/ACC/COMPANY_HHR/PREMIUMQUALITY_HHR', '74', '1', '2017-10-25 11:41:40', '2017-11-25 15:06:43', '1508902899909', '0', 'B_20171030000002', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('316', 'IMPACT_HHR', '冲正账户', '/ACC/COMPANY_HHR/IMPACT_HHR', '74', '1', '2017-10-25 11:46:19', '2017-11-25 15:07:58', '1508903178543', '0', 'B_20171030000003', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('317', 'SERVICE_HHR', '服务费账户', '/ACC/COMPANY_HHR/SERVICE_HHR', '74', '1', '2017-10-25 13:50:04', '2017-11-25 15:06:12', '1508910604413', '0', 'B_20171030000005', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('318', '40', '结清核销金额', '/ACC/CAPITAL_NAME/40', '125', '1', '2017-10-25 14:32:12', '2017-10-25 14:32:12', '1508913131621', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('319', '41', '非结清核销金额', '/ACC/CAPITAL_NAME/41', '125', '1', '2017-10-25 14:32:27', '2017-10-25 14:32:27', '1508913147144', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('320', '42', '表外金额', '/ACC/CAPITAL_NAME/42', '125', '1', '2017-10-25 14:32:44', '2017-10-25 14:32:44', '1508913164144', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('321', '39', '冲正金额', '/ACC/CAPITAL_NAME/39', '125', '1', '2017-10-26 10:14:16', '2017-10-26 10:14:16', '1508984055857', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('324', '43', '投标金额', '/ACC/CAPITAL_NAME/43', '125', '1', '2017-10-26 15:00:24', '2017-10-26 15:51:00', '1509001223507', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('325', '44', '承接金额', '/ACC/CAPITAL_NAME/44', '125', '1', '2017-10-26 15:00:37', '2017-10-26 15:51:06', '1509001237081', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('326', '45', '垫付金额', '/ACC/CAPITAL_NAME/45', '125', '1', '2017-10-26 15:01:13', '2017-10-26 15:51:11', '1509001273216', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('327', '32', '充值手续费资金', '/ACC/CAPITAL_NAME/32', '125', '1', '2017-10-27 09:44:26', '2017-10-27 09:44:26', '1509068666268', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('328', '37', '撤销金额', '/ACC/CAPITAL_NAME/37', '125', '1', '2017-10-27 11:13:10', '2017-10-27 11:13:10', '1509073990326', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('329', '36', '转让服务费金额', '/ACC/CAPITAL_NAME/36', '125', '1', '2017-10-27 16:00:52', '2017-10-27 16:00:52', '1509091252080', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('330', '38', '退出服务费金额', '/ACC/CAPITAL_NAME/38', '125', '1', '2017-10-27 16:00:59', '2017-10-27 16:00:59', '1509091259043', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('338', '48', '快捷充值', '/ACC/BIZ_TYPE/48', '101', '1', '2017-11-01 10:32:05', '2017-11-01 10:32:05', '1509503525034', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('342', '45', '现金红包', '/ACC/BIZ_TYPE/45', '101', '1', '2017-11-02 11:05:07', '2017-11-02 11:05:07', '1509591907028', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('345', '51', '红包资金撤销金额', '/ACC/CAPITAL_NAME/51', '125', '1', '2017-11-21 15:12:37', '2017-11-21 15:12:37', '1511248356552', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('346', 'ADVANCE_HHR', '垫付回款账户', '/ACC/COMPANY_HHR/ADVANCE_HHR', '74', '1', '2017-11-21 15:18:37', '2017-11-27 17:31:58', '1511248717182', '0', 'B_20171121000004', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('347', '10', '投标冻结子账户', '/ACC/SUB_TYPE/10', '90', '1', '2017-11-21 15:36:28', '2017-11-21 15:36:28', '1511249788409', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('348', '11', '提现冻结子账户', '/ACC/SUB_TYPE/11', '90', '1', '2017-11-21 15:36:44', '2017-11-21 15:36:44', '1511249803698', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('349', '13', '出借冻结子账户', '/ACC/SUB_TYPE/13', '90', '1', '2017-11-21 15:37:00', '2017-11-21 15:40:18', '1511249819708', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('350', '15', '还款预处理子账户', '/ACC/SUB_TYPE/15', '90', '1', '2017-11-21 15:37:21', '2017-11-21 15:37:21', '1511249840603', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('351', '12', '还款冻结子账户', '/ACC/SUB_TYPE/12', '90', '1', '2017-11-21 15:40:05', '2017-11-21 15:40:05', '1511250004713', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('352', '52', '自有资金申请金额', '/ACC/CAPITAL_NAME/52', '125', '1', '2017-11-21 17:17:59', '2017-11-21 17:17:59', '1511255878691', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('353', 'HFBANK', '银行存管', '/HFBANK', '3', '0', '2017-11-22 15:56:46', '2018-06-05 12:54:08', '1511337406493', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('354', 'OPEN_ACC', '开户信息', '/HFBANK/OPEN_ACC', '353', '0', '2017-11-22 15:58:49', '2017-11-22 15:59:16', '1511337528960', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('355', 'CUSTOMER_TYPE', '客户类型', '/HFBANK/OPEN_ACC/CUSTOMER_TYPE', '354', '0', '2017-11-22 15:59:16', '2017-11-22 15:59:39', '1511337555691', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('356', '0', '普通个人', '/HFBANK/OPEN_ACC/CUSTOMER_TYPE/0', '355', '1', '2017-11-22 15:59:39', '2017-11-22 15:59:39', '1511337578928', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('357', 'CUSTOMER_ID_TYPE', '客户角色', '/HFBANK/OPEN_ACC/CUSTOMER_ID_TYPE', '354', '0', '2017-11-22 16:00:07', '2017-11-22 16:00:44', '1511337606545', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('358', '1', '出借人', '/HFBANK/OPEN_ACC/CUSTOMER_ID_TYPE/1', '357', '1', '2017-11-22 16:00:44', '2017-11-22 16:00:44', '1511337644066', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('359', '2', '借款人', '/HFBANK/OPEN_ACC/CUSTOMER_ID_TYPE/2', '357', '1', '2017-11-22 16:00:55', '2017-11-22 16:00:55', '1511337654678', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('360', 'COMP_STATUS', '处理状态', '/HFBANK/COMP_STATUS', '353', '0', '2017-11-22 16:01:28', '2017-11-22 16:01:50', '1511337688261', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('361', '1', '待处理', '/HFBANK/COMP_STATUS/1', '360', '1', '2017-11-22 16:01:50', '2017-11-22 16:01:50', '1511337709531', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('362', '2', '处理中', '/HFBANK/COMP_STATUS/2', '360', '1', '2017-11-22 16:02:04', '2017-11-22 16:02:04', '1511337724023', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('363', '3', '处理成功', '/HFBANK/COMP_STATUS/3', '360', '1', '2017-11-22 16:02:16', '2017-11-22 16:02:16', '1511337736180', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('364', '4', '处理失败', '/HFBANK/COMP_STATUS/4', '360', '1', '2017-11-22 16:02:34', '2017-11-22 16:02:34', '1511337754395', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('365', 'ACC_STATUS', '记账状态', '/HFBANK/ACC_STATUS', '353', '0', '2017-11-22 16:04:10', '2017-11-22 16:04:27', '1511337850393', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('366', '1', '已发送', '/HFBANK/ACC_STATUS/1', '365', '1', '2017-11-22 16:04:27', '2017-11-22 16:04:27', '1511337866962', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('367', '2', '处理中', '/HFBANK/ACC_STATUS/2', '365', '1', '2017-11-22 16:04:41', '2017-11-22 16:04:41', '1511337881207', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('368', '3', '记账成功', '/HFBANK/ACC_STATUS/3', '365', '1', '2017-11-22 16:04:53', '2017-11-22 16:04:53', '1511337893331', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('369', '4', '记账失败', '/HFBANK/ACC_STATUS/4', '365', '1', '2017-11-22 16:05:05', '2017-11-22 16:05:05', '1511337904777', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('370', '9', '提现冻结成功', '/HFBANK/ACC_STATUS/9', '365', '1', '2017-11-22 16:05:20', '2017-11-22 16:05:20', '1511337919927', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('371', '10', '提现冻结失败', '/HFBANK/ACC_STATUS/10', '365', '1', '2017-11-22 16:05:32', '2017-11-22 16:05:32', '1511337932097', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('372', '11', '提现解冻成功', '/HFBANK/ACC_STATUS/11', '365', '1', '2017-11-22 16:05:44', '2017-11-22 16:05:44', '1511337943837', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('373', '12', '提现解冻失败', '/HFBANK/ACC_STATUS/12', '365', '1', '2017-11-22 16:06:05', '2017-11-22 16:06:05', '1511337964916', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('374', 'PAY_CHANNEL', '充值渠道', '/HFBANK/PAY_CHANNEL', '353', '0', '2017-11-22 16:20:40', '2017-11-22 16:21:02', '1511338839642', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('375', '0', '银行充值', '/HFBANK/PAY_CHANNEL/0', '374', '1', '2017-11-22 16:21:02', '2017-11-22 16:21:02', '1511338861911', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('376', '46', '银行代扣', '/HFBANK/PAY_CHANNEL/46', '374', '1', '2017-11-22 16:21:25', '2017-11-22 16:21:36', '1511338885267', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('377', '47', '网关充值', '/HFBANK/PAY_CHANNEL/47', '374', '1', '2017-11-22 16:21:56', '2017-11-22 16:21:56', '1511338915983', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('378', '48', '快捷充值', '/HFBANK/PAY_CHANNEL/48', '374', '1', '2017-11-22 16:22:11', '2017-11-22 16:22:11', '1511338930986', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('379', '49', '代扣', '/HFBANK/PAY_CHANNEL/49', '374', '1', '2017-11-22 16:22:22', '2017-11-22 16:22:22', '1511338942236', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('380', 'CHECK_STATUS', '审核提现状态', '/HFBANK/CHECK_STATUS', '353', '0', '2017-11-22 16:22:52', '2017-12-05 14:28:26', '1511338972443', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('381', '1', '待审核', '/HFBANK/CHECK_STATUS/1', '380', '1', '2017-11-22 16:23:04', '2017-11-22 16:23:04', '1511338983524', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('383', '3', '提现成功', '/HFBANK/CHECK_STATUS/3', '380', '1', '2017-11-22 16:23:36', '2017-11-22 16:23:36', '1511339015686', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('384', '4', '提现失败', '/HFBANK/CHECK_STATUS/4', '380', '1', '2017-11-22 16:23:46', '2017-11-22 16:23:46', '1511339026183', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('385', '13', '审核通过提现中', '/HFBANK/CHECK_STATUS/13', '380', '1', '2017-11-22 16:23:59', '2017-12-05 14:29:01', '1511339038561', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('386', '14', '审核拒绝', '/HFBANK/CHECK_STATUS/14', '380', '1', '2017-11-22 16:24:11', '2017-12-05 14:28:54', '1511339051368', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('391', 'FREEZE_TYPE', '冻结类型', '/HFBANK/FREEZE_TYPE', '353', '0', '2017-11-23 14:59:36', '2017-11-23 15:00:31', '1511420376403', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('392', 'UNFREEZE_TYPE', '解冻类型', '/HFBANK/UNFREEZE_TYPE', '353', '0', '2017-11-23 15:00:03', '2017-11-23 15:01:09', '1511420402803', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('393', '1', '普通冻结', '/HFBANK/FREEZE_TYPE/1', '391', '1', '2017-11-23 15:00:31', '2017-11-23 15:00:31', '1511420431433', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('394', '2', '还款冻结', '/HFBANK/FREEZE_TYPE/2', '391', '1', '2017-11-23 15:00:43', '2017-11-23 15:00:43', '1511420443181', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('395', '3', '出借冻结', '/HFBANK/FREEZE_TYPE/3', '391', '1', '2017-11-23 15:00:54', '2017-11-23 15:00:54', '1511420453905', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('396', '1', '普通解冻', '/HFBANK/UNFREEZE_TYPE/1', '392', '1', '2017-11-23 15:01:09', '2017-11-23 15:01:09', '1511420468968', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('397', '2', '还款解冻', '/HFBANK/UNFREEZE_TYPE/2', '392', '1', '2017-11-23 15:01:22', '2017-11-23 15:01:22', '1511420482133', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('398', '3', '出借解冻', '/HFBANK/UNFREEZE_TYPE/3', '392', '1', '2017-11-23 15:01:34', '2017-11-23 15:01:34', '1511420493885', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('399', 'PROJECT', '标的相关信息', '/HFBANK/PROJECT', '353', '0', '2017-11-23 17:10:26', '2017-11-23 17:10:49', '1511428225657', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('400', 'PROJECT_TYPE', '产品类型', '/HFBANK/PROJECT/PROJECT_TYPE', '399', '0', '2017-11-23 17:10:49', '2017-11-23 17:13:30', '1511428248647', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('401', 'VALUE_TYPE', '起息方式', '/HFBANK/PROJECT/VALUE_TYPE', '399', '0', '2017-11-23 17:11:13', '2017-11-23 17:14:08', '1511428272701', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('402', 'CREATE_TYPE', '成立方式', '/HFBANK/PROJECT/CREATE_TYPE', '399', '0', '2017-11-23 17:11:29', '2017-11-23 17:15:03', '1511428288947', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('403', 'REPAY_TYPE', '还款方式', '/HFBANK/PROJECT/REPAY_TYPE', '399', '0', '2017-11-23 17:11:47', '2017-11-23 17:15:48', '1511428306561', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('404', 'CHARGEOFF_TYPE', '出账标示', '/HFBANK/PROJECT/CHARGEOFF_TYPE', '399', '0', '2017-11-23 17:12:03', '2017-11-23 17:16:11', '1511428323311', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('405', 'LIMIT_TYPE', '超额限制', '/HFBANK/PROJECT/LIMIT_TYPE', '399', '0', '2017-11-23 17:12:23', '2017-11-23 17:16:25', '1511428343053', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('406', 'CARD_TYPE', '卡类型', '/HFBANK/PROJECT/CARD_TYPE', '399', '0', '2017-11-23 17:12:39', '2017-11-23 17:16:52', '1511428359089', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('407', 'PROJECT_STATUS', '产品状态', '/HFBANK/PROJECT/PROJECT_STATUS', '399', '0', '2017-11-23 17:13:04', '2017-11-23 17:18:17', '1511428383733', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('408', '0', '周期性产品', '/HFBANK/PROJECT/PROJECT_TYPE/0', '400', '1', '2017-11-23 17:13:30', '2017-11-23 17:13:30', '1511428409531', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('409', '1', '不定期出账产品', '/HFBANK/PROJECT/PROJECT_TYPE/1', '400', '1', '2017-11-23 17:13:48', '2017-11-23 17:13:48', '1511428427815', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('410', '0', '满额起息', '/HFBANK/PROJECT/VALUE_TYPE/0', '401', '1', '2017-11-23 17:14:08', '2017-11-23 17:14:08', '1511428447981', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('411', '1', '成立起息', '/HFBANK/PROJECT/VALUE_TYPE/1', '401', '1', '2017-11-23 17:14:20', '2017-11-23 17:14:20', '1511428460454', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('412', '2', '投标起息', '/HFBANK/PROJECT/VALUE_TYPE/2', '401', '1', '2017-11-23 17:14:36', '2017-11-23 17:14:36', '1511428475974', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('413', '3', '成立审核后起息', '/HFBANK/PROJECT/VALUE_TYPE/3', '401', '1', '2017-11-23 17:14:48', '2017-11-23 17:14:48', '1511428487603', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('414', '0', '满额成立', '/HFBANK/PROJECT/CREATE_TYPE/0', '402', '1', '2017-11-23 17:15:03', '2017-11-23 17:15:03', '1511428503293', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('415', '1', '成立日成立', '/HFBANK/PROJECT/CREATE_TYPE/1', '402', '1', '2017-11-23 17:15:14', '2017-11-23 17:15:14', '1511428514318', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('416', '2', '活期方式', '/HFBANK/PROJECT/CREATE_TYPE/2', '402', '1', '2017-11-23 17:15:26', '2017-11-23 17:15:26', '1511428526209', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('417', '0', '一次性还款', '/HFBANK/PROJECT/REPAY_TYPE/0', '403', '1', '2017-11-23 17:15:48', '2017-11-23 17:15:48', '1511428548476', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('418', '1', '分期还款', '/HFBANK/PROJECT/REPAY_TYPE/1', '403', '1', '2017-11-23 17:15:58', '2017-11-23 17:15:58', '1511428558006', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('419', '0', '成标后自动出账至借款人融资账户', '/HFBANK/PROJECT/CHARGEOFF_TYPE/0', '404', '1', '2017-11-23 17:16:11', '2017-11-23 17:16:11', '1511428571040', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('420', '0', '不限制', '/HFBANK/PROJECT/LIMIT_TYPE/0', '405', '1', '2017-11-23 17:16:25', '2017-11-23 17:16:25', '1511428585043', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('421', '1', '限制', '/HFBANK/PROJECT/LIMIT_TYPE/1', '405', '1', '2017-11-23 17:16:37', '2017-11-23 17:16:37', '1511428596772', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('422', '1', '个人', '/HFBANK/PROJECT/CARD_TYPE/1', '406', '1', '2017-11-23 17:16:52', '2017-11-23 17:16:52', '1511428612374', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('423', '2', '企业', '/HFBANK/PROJECT/CARD_TYPE/2', '406', '1', '2017-11-23 17:17:03', '2017-11-23 17:17:03', '1511428622730', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('424', '2', '成标', '/HFBANK/PROJECT/PROJECT_STATUS/2', '407', '1', '2017-11-23 17:18:17', '2017-11-23 17:18:17', '1511428696585', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('425', '3', '废标', '/HFBANK/PROJECT/PROJECT_STATUS/3', '407', '1', '2017-11-23 17:18:27', '2017-11-23 17:18:27', '1511428706733', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('426', 'CYCLE_UNIT', '周期单位', '/HFBANK/PROJECT/CYCLE_UNIT', '399', '0', '2017-11-23 17:23:37', '2017-11-23 17:23:52', '1511429016889', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('427', '1', '日', '/HFBANK/PROJECT/CYCLE_UNIT/1', '426', '1', '2017-11-23 17:23:52', '2017-11-23 17:23:52', '1511429032322', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('428', '2', '周', '/HFBANK/PROJECT/CYCLE_UNIT/2', '426', '1', '2017-11-23 17:24:03', '2017-11-23 17:24:03', '1511429042726', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('429', '3', '月', '/HFBANK/PROJECT/CYCLE_UNIT/3', '426', '1', '2017-11-23 17:24:13', '2017-11-23 17:24:13', '1511429052700', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('430', '4', '季', '/HFBANK/PROJECT/CYCLE_UNIT/4', '426', '1', '2017-11-23 17:24:27', '2017-11-23 17:24:27', '1511429067132', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('431', '5', '年', '/HFBANK/PROJECT/CYCLE_UNIT/5', '426', '1', '2017-11-23 17:24:35', '2017-11-23 17:24:35', '1511429075153', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('432', '19', '投标撤销成功', '/HFBANK/ACC_STATUS/19', '365', '1', '2017-11-23 19:55:01', '2017-11-23 19:55:01', '1511438101390', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('433', '20', '投标撤销失败', '/HFBANK/ACC_STATUS/20', '365', '1', '2017-11-23 19:55:17', '2017-11-23 19:55:17', '1511438116731', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('436', '3', '解绑', '/ACC/BIND_TYPE/3', '198', '1', '2017-11-25 10:45:51', '2017-11-25 10:45:51', '1511577950879', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('437', 'SCHEDULE_SET', '定时任务', '/HFBANK/SCHEDULE_SET', '353', '0', '2017-11-25 20:01:24', '2017-11-25 20:01:49', '1511611284201', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('438', 'RETRY_NUM', '重试次数', '/HFBANK/SCHEDULE_SET/RETRY_NUM', '437', '1', '2017-11-25 20:01:49', '2017-11-25 20:01:49', '1511611308680', '0', '5', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('439', 'RETRY_TIME', '重试时间', '/HFBANK/SCHEDULE_SET/RETRY_TIME', '437', '1', '2017-11-25 20:02:09', '2017-11-25 20:02:09', '1511611329062', '0', '5', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('440', '49', '代扣充值', '/ACC/BIZ_TYPE/49', '101', '1', '2017-11-29 10:23:54', '2017-12-06 19:00:24', '1511922234129', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('443', '48', '红包部分承接金额', '/ACC/CAPITAL_NAME/48', '125', '1', '2017-12-02 16:56:19', '2017-12-02 16:56:19', '1512204979454', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('444', '49', '到期赎回服务费金额', '/ACC/CAPITAL_NAME/49', '125', '1', '2017-12-02 17:13:39', '2017-12-02 17:13:39', '1512206018640', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('445', '50', '紧急赎回服务费金额', '/ACC/CAPITAL_NAME/50', '125', '1', '2017-12-02 17:13:52', '2017-12-02 17:13:52', '1512206032106', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('446', '35', '转让金额', '/ACC/CAPITAL_NAME/35', '125', '1', '2017-12-02 17:14:09', '2017-12-02 17:14:09', '1512206049468', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('447', '47', '网关充值', '/ACC/BIZ_TYPE/47', '101', '1', '2017-12-06 19:00:10', '2017-12-06 19:00:10', '1512558009833', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('448', 'BANK_CARD_AUTH_CHANNEL', '银行卡鉴权通道', '/HFBANK/BANK_CARD_AUTH_CHANNEL', '353', '0', '2017-12-11 14:15:07', '2018-03-08 14:27:28', '1512972907356', '0', '1', '13566543879', '', '', '', '值1=1:挡板开启,0：关闭\r\n值2：预留手机号与当前相等固定鉴权失败', '1');
INSERT INTO `sys_dict` VALUES ('449', '666', '测试通道', '/HFBANK/BANK_CARD_AUTH_CHANNEL/666', '448', '1', '2017-12-11 14:15:41', '2018-02-02 16:49:08', '1512972941402', '0', '1', '10000', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('450', 'CASH_TYPE', '补贴类型', '/HFBANK/CASH_TYPE', '353', '0', '2017-12-11 14:16:08', '2017-12-11 14:16:19', '1512972968470', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('451', '34', '返现', '/HFBANK/CASH_TYPE/34', '450', '1', '2017-12-11 14:16:19', '2017-12-11 14:16:19', '1512972978878', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('452', '36', '收益补偿', '/HFBANK/CASH_TYPE/36', '450', '1', '2017-12-11 14:16:28', '2017-12-11 14:16:28', '1512972987613', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('453', 'YES_NO', '是否', '/COMP/YES_NO', '58', '0', '2017-12-13 11:12:11', '2017-12-13 11:13:01', '1513134731307', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('454', '1', '是', '/COMP/YES_NO/1', '453', '1', '2017-12-13 11:13:01', '2017-12-13 11:13:01', '1513134780867', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('455', '0', '否', '/COMP/YES_NO/0', '453', '1', '2017-12-13 11:13:14', '2017-12-13 11:13:14', '1513134793746', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('456', 'OCTOPUS_CALL_BACK_TYPE', '回调类型', '/HFBANK/OCTOPUS_CALL_BACK_TYPE', '353', '0', '2017-12-13 11:41:56', '2017-12-13 11:42:51', '1513136515664', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('457', 'bankWithdrawCallback', '提现审核回调', '/HFBANK/OCTOPUS_CALL_BACK_TYPE/bankWithdrawCallback', '456', '1', '2017-12-13 11:42:51', '2017-12-16 15:34:48', '1513136570684', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('458', 'bidCallBack', '投标回调', '/HFBANK/OCTOPUS_CALL_BACK_TYPE/bidCallBack', '456', '1', '2017-12-13 11:44:16', '2017-12-13 11:44:16', '1513136655668', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('459', 'repayLateBankCallBack', '逾期还款回调', '/HFBANK/OCTOPUS_CALL_BACK_TYPE/repayLateBankCallBack', '456', '1', '2017-12-13 11:44:36', '2017-12-13 11:44:36', '1513136675702', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('460', 'repayNormalBankCallBack', '正常/提前还款回调', '/HFBANK/OCTOPUS_CALL_BACK_TYPE/repayNormalBankCallBack', '456', '1', '2017-12-13 11:44:54', '2017-12-13 11:44:54', '1513136694196', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('461', 'repayTargetBankBasicCallBack', '标的回款回调', '/HFBANK/OCTOPUS_CALL_BACK_TYPE/repayTargetBankBasicCallBack', '456', '1', '2017-12-13 11:45:14', '2017-12-13 11:45:14', '1513136713754', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('462', 'subsidyCallBack', '公司补贴回调', '/HFBANK/OCTOPUS_CALL_BACK_TYPE/subsidyCallBack', '456', '1', '2017-12-13 11:45:33', '2017-12-13 11:45:33', '1513136733159', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('463', 'transferCallBack', '债权转让回调', '/HFBANK/OCTOPUS_CALL_BACK_TYPE/transferCallBack', '456', '1', '2017-12-13 11:45:51', '2017-12-13 11:45:51', '1513136751072', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('464', 'TIMER', '定时器', '/ACC/TIMER', '51', '0', '2017-12-13 16:09:48', '2017-12-13 16:10:29', '1513152588094', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('465', 'USER_INFO', '用户信息', '/ACC/TIMER/USER_INFO', '464', '1', '2017-12-13 16:10:29', '2018-01-25 11:16:10', '1513152629363', '0', '', '', '1', '', '', '值1：beginDate   开始时间\r\n值2：endDate  结束时间\r\n值3：uploadType 上传类型：1全量，2增量', '1');
INSERT INTO `sys_dict` VALUES ('466', 'BANK_INFO', '用户银行卡信息', '/ACC/TIMER/BANK_INFO', '464', '1', '2017-12-13 16:11:12', '2018-01-26 16:48:38', '1513152672194', '0', '', '', '1', '', '', '值1：beginDate   开始时间\r\n值2：endDate  结束时间\r\n值3：uploadType 上传类型：1全量，2增量', '1');
INSERT INTO `sys_dict` VALUES ('467', 'BALANCE', '资金金额', '/ACC/TIMER/BALANCE', '464', '1', '2017-12-13 16:11:42', '2018-03-08 09:45:40', '1513152702343', '0', '', '2018-03-05 23:59:59', '1', '', '', '值1：beginDate   开始时间\r\n值2：endDate  结束时间\r\n值3：uploadType 上传类型：1全量，2增量', '1');
INSERT INTO `sys_dict` VALUES ('468', 'STATISTICS', '统计数据(充值、提现笔数)', '/ACC/TIMER/STATISTICS', '464', '1', '2017-12-13 16:12:27', '2018-01-09 17:05:07', '1513152746553', '0', '2016-12-12 00:00:00', '2016-12-12 23:59:59', '2', '', '', '值1：beginDate   开始时间\r\n值2：endDate  结束时间\r\n值3：uploadType 上传类型：1全量，2增量', '1');
INSERT INTO `sys_dict` VALUES ('469', '2', '调账', '/ACC/BIZ_TYPE/2', '101', '1', '2017-12-13 19:02:27', '2017-12-13 19:02:27', '1513162946767', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('471', '5', '手动调账', '/ACC/CAPITAL_TYPE/5', '119', '1', '2017-12-13 19:03:27', '2017-12-13 19:03:27', '1513163007050', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('472', '27', '调账金额', '/ACC/CAPITAL_NAME/27', '125', '1', '2017-12-13 19:03:48', '2017-12-13 19:03:48', '1513163027964', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('473', '51', '出借冻结', '/ACC/BIZ_TYPE/51', '101', '1', '2017-12-14 10:24:23', '2017-12-14 10:24:23', '1513218263288', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('474', '52', '出借解冻', '/ACC/BIZ_TYPE/52', '101', '1', '2017-12-14 10:29:10', '2017-12-14 10:29:10', '1513218550217', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('475', '54', '标的还款', '/ACC/BIZ_TYPE/54', '101', '1', '2017-12-15 11:09:59', '2017-12-15 11:09:59', '1513307399332', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('476', 'UPLOAD_FILE_TYPE', '文件类型', '/HFBANK/UPLOAD_FILE_TYPE', '353', '0', '2017-12-15 15:01:14', '2017-12-15 15:01:39', '1513321273829', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('477', '1', '用户信息', '/HFBANK/UPLOAD_FILE_TYPE/1', '476', '1', '2017-12-15 15:01:38', '2017-12-15 15:01:38', '1513321297638', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('478', '2', '银行卡信息', '/HFBANK/UPLOAD_FILE_TYPE/2', '476', '1', '2017-12-15 15:02:17', '2017-12-15 15:02:17', '1513321336814', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('479', '3', '资金余额信息', '/HFBANK/UPLOAD_FILE_TYPE/3', '476', '1', '2017-12-15 15:02:32', '2017-12-15 15:02:32', '1513321351871', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('480', 'DATA_MIGRATION', '数据迁移', '/ACC/DATA_MIGRATION', '51', '0', '2017-12-18 16:22:07', '2017-12-18 16:22:42', '1513585326924', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('481', 'FILE_FULL_PATH', '文件全路径', '/ACC/DATA_MIGRATION/FILE_FULL_PATH', '480', '1', '2017-12-18 16:22:41', '2018-01-15 14:16:45', '1513585361498', '0', '/data/apache-tomcat-8.5.16/logs/qianyi/1quanbuchenggong4.txt', '', '', '', '', '文件全路径，必须到文件名', '1');
INSERT INTO `sys_dict` VALUES ('482', '003', '银商', '/HFBANK/BANK_CARD_AUTH_CHANNEL/003', '448', '1', '2017-12-19 14:03:28', '2018-02-02 16:39:13', '1513663408480', '0', '1', '1000', '', '', '', '', '0');
INSERT INTO `sys_dict` VALUES ('483', '001', '宝付', '/HFBANK/BANK_CARD_AUTH_CHANNEL/001', '448', '1', '2017-12-19 14:03:42', '2018-02-02 16:43:57', '1513663421983', '0', '1', '1000', '', '', '', '', '0');
INSERT INTO `sys_dict` VALUES ('484', '004', '金运通', '/HFBANK/BANK_CARD_AUTH_CHANNEL/004', '448', '1', '2017-12-19 14:04:00', '2018-01-30 15:16:25', '1513663440466', '0', '1', '1000', '', '', '', '', '0');
INSERT INTO `sys_dict` VALUES ('485', '50', '正常提现', '/ACC/BIZ_TYPE/50', '101', '1', '2017-12-19 14:08:08', '2017-12-19 14:28:55', '1513663688320', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('486', 'VERIFY_TYPE', '四要素鉴权类型', '/HFBANK/VERIFY_TYPE', '353', '0', '2017-12-20 11:16:52', '2017-12-20 11:16:59', '1513739811951', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('487', '1', '开户鉴权', '/HFBANK/VERIFY_TYPE/1', '486', '1', '2017-12-20 11:16:59', '2017-12-20 11:16:59', '1513739818639', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('488', '2', '绑卡鉴权', '/HFBANK/VERIFY_TYPE/2', '486', '1', '2017-12-20 11:17:06', '2017-12-20 11:17:06', '1513739826405', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('489', '3', '换绑卡鉴权', '/HFBANK/VERIFY_TYPE/3', '486', '1', '2017-12-20 11:17:13', '2017-12-20 11:17:31', '1513739833242', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('490', '4', '单独鉴权', '/HFBANK/VERIFY_TYPE/4', '486', '1', '2017-12-20 11:17:22', '2017-12-20 11:17:22', '1513739841929', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('491', 'SETTLEMENT_HHR', '提前结清服务费账户', '/ACC/COMPANY_HHR/SETTLEMENT_HHR', '74', '1', '2017-12-21 16:37:14', '2017-12-21 16:50:26', '1513845433618', '0', 'B_2017122100000565', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('492', '54', '结清服务费金额', '/ACC/CAPITAL_NAME/54', '125', '1', '2017-12-21 16:39:51', '2017-12-21 16:39:51', '1513845591452', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('493', 'BANK_CODE', '银行编码', '/ACC/BANK_CODE', '51', '0', '2017-12-22 18:03:00', '2017-12-22 18:03:36', '1513936979785', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('494', '302', '中信银行', '/ACC/BANK_CODE/302', '493', '1', '2017-12-22 18:03:36', '2017-12-22 18:03:36', '1513937016490', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('495', '305', '中国民生银行', '/ACC/BANK_CODE/305', '493', '1', '2017-12-22 18:04:06', '2017-12-22 18:04:06', '1513937046094', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('496', '105', '中国建设银行', '/ACC/BANK_CODE/105', '493', '1', '2017-12-22 18:07:22', '2017-12-22 18:07:22', '1513937241537', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('497', '303', '中国光大银行', '/ACC/BANK_CODE/303', '493', '1', '2017-12-22 18:07:33', '2018-01-24 11:30:27', '1513937253037', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('498', '309', '兴业银行', '/ACC/BANK_CODE/309', '493', '1', '2017-12-22 18:07:45', '2017-12-22 18:07:45', '1513937265258', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('499', '308', '招商银行', '/ACC/BANK_CODE/308', '493', '1', '2017-12-22 18:07:57', '2017-12-22 18:07:57', '1513937276895', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('500', '103', '中国农业银行', '/ACC/BANK_CODE/103', '493', '1', '2017-12-22 18:08:08', '2017-12-22 18:08:08', '1513937287777', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('501', '102', '中国工商银行', '/ACC/BANK_CODE/102', '493', '1', '2017-12-22 18:08:18', '2017-12-22 18:08:18', '1513937297993', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('502', '403', '中国邮政储蓄银行', '/ACC/BANK_CODE/403', '493', '1', '2017-12-22 18:08:27', '2018-01-24 11:32:04', '1513937307448', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('504', '104', '中国银行', '/ACC/BANK_CODE/104', '493', '1', '2017-12-22 18:08:52', '2017-12-22 18:08:52', '1513937331871', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('505', '301', '交通银行', '/ACC/BANK_CODE/301', '493', '1', '2017-12-22 18:09:04', '2017-12-22 18:09:04', '1513937344324', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('506', '307', '平安银行', '/ACC/BANK_CODE/307', '493', '1', '2017-12-22 18:09:29', '2018-01-24 11:29:42', '1513937368724', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('507', '304', '华夏银行', '/ACC/BANK_CODE/304', '493', '1', '2017-12-22 18:09:56', '2017-12-22 18:09:56', '1513937395839', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('509', '8', '部分成功', '/HFBANK/COMP_STATUS/8', '360', '1', '2017-12-29 16:42:21', '2017-12-29 16:42:21', '1514536940792', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('510', '55', '收取服务费【公司收费】', '/ACC/BIZ_TYPE/55', '101', '1', '2018-01-04 16:58:28', '2018-01-04 16:58:28', '1515056307726', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('511', 'FILE_DETAIL_NUM', '文件导出条数', '/HFBANK/FILE_DETAIL_NUM', '353', '0', '2018-01-04 17:38:51', '2018-01-04 17:39:32', '1515058730730', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('512', 'DETAIL_NUM', '明细条数', '/HFBANK/FILE_DETAIL_NUM/DETAIL_NUM', '511', '1', '2018-01-04 17:39:32', '2018-03-05 14:19:30', '1515058772460', '0', '10000', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('513', 'FROZEN_ACCOUNT_FILE_FULL_PATH', '冻结账户文件全路径', '/ACC/DATA_MIGRATION/FROZEN_ACCOUNT_FILE_FULL_PATH', '480', '1', '2018-01-11 17:53:41', '2018-01-15 14:24:39', '1515664420714', '0', '/data/apache-tomcat-8.5.16/logs/dongjie/quanbuchenggong1.txt', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('514', '2', '企业账户', '/ACC/CUSTOMER_TYPE/2', '162', '1', '2018-01-18 16:44:42', '2018-01-18 16:45:33', '1516265082440', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('515', '06', '营业执照', '/COMP/CARDKIND/06', '62', '1', '2018-01-18 16:45:09', '2018-01-18 16:45:09', '1516265109060', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('516', 'BIZ_SYSTEM_TITLE', 'HC-HHR', '/COMP/BIZ_SYSTEM_TITLE', '58', '1', '2018-01-23 15:18:17', '2018-01-23 15:20:06', '1516691897047', '0', '/COMP/BIZ_SYSTEM_TITLE', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('517', '306', '广发银行', '/ACC/BANK_CODE/306', '493', '1', '2018-01-24 11:31:00', '2018-01-24 11:31:00', '1516764659591', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('518', '310', '浦发银行', '/ACC/BANK_CODE/310', '493', '1', '2018-01-24 11:31:34', '2018-01-24 11:31:50', '1516764694300', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('519', 'CASH_ACCOUNT_FILE_FULL_PATH', '现金账户文件全路径', '/ACC/DATA_MIGRATION/CASH_ACCOUNT_FILE_FULL_PATH', '480', '1', '2018-01-27 11:36:37', '2018-01-27 14:49:52', '1517024196555', '0', '/data/apache-tomcat-8.5.16/logs/qianyi/xianjin/quan1.txt', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('520', 'BANK_AUTH_CHANNEL_PZ', '银行卡鉴权通道配置', '/HFBANK/BANK_AUTH_CHANNEL_PZ', '353', '0', '2018-01-30 15:17:33', '2018-03-08 17:06:54', '1517296652699', '0', '1', '16632271000', '', '', '', '值1=1:挡板开启,0：关闭\r\n值2：预留手机号与当前相等固定鉴权失败', '1');
INSERT INTO `sys_dict` VALUES ('537', '1', '出借人卡鉴权通道配置', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1', '520', '0', '2018-02-02 10:41:55', '2018-02-02 10:53:01', '1517539314937', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('538', '2', '借款人卡鉴权通道配置', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2', '520', '0', '2018-02-02 10:42:08', '2018-02-02 10:53:41', '1517539327558', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('539', '310', '浦发银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/310', '537', '1', '2018-02-02 10:53:01', '2018-02-02 16:47:47', '1517539980993', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('540', '310', '浦发银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/310', '538', '1', '2018-02-02 10:53:41', '2018-02-06 15:25:02', '1517540021389', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('543', '403', '邮储银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/403', '537', '1', '2018-02-02 11:18:30', '2018-02-02 16:47:51', '1517541509716', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('544', '403', '邮储银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/403', '538', '1', '2018-02-02 11:18:55', '2018-02-02 16:49:20', '1517541535189', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('545', '103', '农业银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/103', '538', '1', '2018-02-02 11:23:33', '2018-02-02 16:49:24', '1517541812681', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('547', '309', '兴业银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/309', '537', '1', '2018-02-02 14:38:10', '2018-02-02 16:47:56', '1517553490068', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('548', '102', '工商银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/102', '537', '1', '2018-02-02 14:51:53', '2018-02-02 16:48:00', '1517554313193', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('550', '301', '交通银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/301', '537', '1', '2018-02-02 15:12:28', '2018-02-02 16:48:09', '1517555547605', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('551', '301', '交通银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/301', '538', '1', '2018-02-02 15:12:52', '2018-02-02 16:49:33', '1517555571983', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('553', '303', '光大银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/303', '538', '1', '2018-02-02 16:02:17', '2018-02-06 15:28:34', '1517558537135', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('554', '103', '农业银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/103', '537', '1', '2018-02-02 16:08:15', '2018-02-02 16:48:19', '1517558894842', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('555', '104', '中国银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/104', '537', '1', '2018-02-02 16:08:43', '2018-02-02 16:48:27', '1517558923159', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('556', '105', '建设银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/105', '537', '1', '2018-02-02 16:09:29', '2018-02-02 16:48:32', '1517558968646', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('557', '308', '招商银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/308', '537', '1', '2018-02-02 16:09:59', '2018-02-02 16:48:36', '1517558998853', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('558', '305', '民生银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/305', '537', '1', '2018-02-02 16:10:20', '2018-02-02 16:48:41', '1517559020086', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('559', '306', '广发银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/306', '537', '1', '2018-02-02 16:10:47', '2018-02-02 16:48:46', '1517559046962', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('560', '304', '华夏银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/304', '537', '1', '2018-02-02 16:11:06', '2018-02-02 16:48:50', '1517559065982', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('561', '307', '平安银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/307', '537', '1', '2018-02-02 16:12:12', '2018-02-02 16:48:54', '1517559131671', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('562', '302', '中信银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/302', '537', '1', '2018-02-02 16:12:34', '2018-02-02 16:48:59', '1517559154054', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('563', '102', '工商银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/102', '538', '1', '2018-02-02 16:13:51', '2018-02-02 16:49:54', '1517559231246', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('564', '104', '中国银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/104', '538', '1', '2018-02-02 16:14:20', '2018-02-02 16:49:58', '1517559260497', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('565', '308', '招商银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/308', '538', '1', '2018-02-02 16:15:00', '2018-02-02 16:50:06', '1517559299894', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('566', '305', '民生银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/305', '538', '1', '2018-02-02 16:15:35', '2018-02-02 16:50:10', '1517559335494', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('567', '306', '广发银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/306', '538', '1', '2018-02-02 16:16:29', '2018-02-02 16:50:18', '1517559389004', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('568', '304', '华夏银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/304', '538', '1', '2018-02-02 16:16:47', '2018-02-02 16:50:24', '1517559406910', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('569', '307', '平安银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/307', '538', '1', '2018-02-02 16:17:37', '2018-02-02 16:50:31', '1517559457182', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('570', '302', '中信银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/302', '538', '1', '2018-02-02 16:18:01', '2018-02-02 16:50:35', '1517559480905', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('571', '105', '建设银行', '/HFBANK/BANK_CARD_AUTH_CHANNEL/105', '448', '1', '2018-02-06 14:15:10', '2018-02-06 14:15:10', '1517897710093', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('572', '105', '建设银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/105', '520', '1', '2018-02-06 14:51:58', '2018-02-06 14:51:58', '1517899918353', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('573', '102', '工商银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/102', '520', '1', '2018-02-06 14:57:23', '2018-02-06 14:57:23', '1517900242802', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('574', '103', '农业银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/103', '520', '1', '2018-02-06 14:57:42', '2018-02-06 14:57:42', '1517900262198', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('575', '104', '中国银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/104', '520', '1', '2018-02-06 14:57:58', '2018-02-06 14:57:58', '1517900278482', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('576', '301', '交通银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/301', '520', '1', '2018-02-06 14:58:19', '2018-02-06 14:58:19', '1517900299250', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('577', '308', '招商银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/308', '520', '1', '2018-02-06 14:58:34', '2018-02-06 14:58:34', '1517900313949', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('578', '305', '民生银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/305', '520', '1', '2018-02-06 14:58:49', '2018-02-06 14:58:49', '1517900328962', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('579', '303', '光大银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/303', '520', '1', '2018-02-06 14:59:05', '2018-02-06 14:59:05', '1517900345419', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('580', '306', '广发银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/306', '520', '1', '2018-02-06 14:59:20', '2018-02-06 14:59:20', '1517900359536', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('581', '304', '华夏银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/304', '520', '1', '2018-02-06 14:59:37', '2018-02-06 14:59:37', '1517900376587', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('582', '310', '浦发银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/310', '520', '1', '2018-02-06 14:59:52', '2018-02-06 14:59:52', '1517900391593', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('583', '309', '兴业银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/309', '520', '1', '2018-02-06 15:00:08', '2018-02-06 15:00:08', '1517900408383', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('584', '403', '邮储银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/403', '520', '1', '2018-02-06 15:00:25', '2018-02-06 15:00:25', '1517900425068', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('585', '307', '平安银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/307', '520', '1', '2018-02-06 15:00:38', '2018-02-06 15:00:38', '1517900438373', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('586', '302', '中信银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/302', '520', '1', '2018-02-06 15:00:54', '2018-02-06 15:00:54', '1517900453832', '0', '测试', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('587', '105', '建设银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/105', '538', '1', '2018-02-06 15:29:55', '2018-02-06 15:29:55', '1517902195381', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('588', '303', '光大银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/303', '537', '1', '2018-02-06 15:30:49', '2018-02-06 15:30:49', '1517902248595', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('590', '15', '已锁定', '/HFBANK/CHECK_STATUS/15', '380', '1', '2018-02-27 10:41:38', '2018-02-27 10:41:38', '1519699298077', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('591', '5', '资金进出统计', '/HFBANK/UPLOAD_FILE_TYPE/5', '476', '1', '2018-02-27 10:46:40', '2018-02-27 10:46:40', '1519699599843', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('592', '4031000', '北京银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/1/4031000', '537', '1', '2018-02-27 16:07:56', '2018-02-27 16:08:40', '1519718876406', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('593', '4031000', '北京银行', '/HFBANK/BANK_AUTH_CHANNEL_PZ/2/4031000', '538', '1', '2018-02-27 16:08:11', '2018-02-27 16:08:28', '1519718890923', '0', '测试通道', '666', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('594', 'CompanyAccBalanceMAIL', '公司账户余额提醒', '/ACC/MAIL_TYPE/CompanyAccBalanceMAIL', '310', '0', '2018-03-05 11:28:05', '2018-03-06 10:47:57', '1520220484974', '0', 'dingyaru160420@credithc.com', '', '', '', '', '值1：账户编号；值2：邮箱地址；值3：预警金额\r\n值4：目标服务地址；值5：邮件标题', '1');
INSERT INTO `sys_dict` VALUES ('595', 'COMPANY_ACC_ZBF', '质保费账户', '/ACC/MAIL_TYPE/CompanyAccBalanceMAIL/COMPANY_ACC_ZBF', '594', '1', '2018-03-06 10:46:02', '2018-03-06 16:12:16', '1520304361652', '0', 'B_20171030000002', 'zhonghua150715@credithc.com,hewanyun150814@credithc.com,dingyaru160420@credithc.com', '100', 'ACCOUNTING_HHRTEST', '【账务中心】-公司质保费账户余额提醒', '值1：账户编号；值2：邮箱地址；值3：预警金额\r\n值4：目标服务地址；值5：邮件标题', '1');
INSERT INTO `sys_dict` VALUES ('596', 'COMPANY_ACC_CZ', '冲正账户', '/ACC/MAIL_TYPE/CompanyAccBalanceMAIL/COMPANY_ACC_CZ', '594', '1', '2018-03-06 14:26:47', '2018-03-06 16:26:16', '1520317607056', '0', 'B_20171030000003', 'zhonghua150715@credithc.com,hewanyun150814@credithc.com', '100', 'ACCOUNTING_HHRTEST', '【账务中心】-公司冲正账户余额提醒', '', '1');
INSERT INTO `sys_dict` VALUES ('597', 'COMPANY_ACC_TCFWF', '退出服务费账户', '/ACC/MAIL_TYPE/CompanyAccBalanceMAIL/COMPANY_ACC_TCFWF', '594', '1', '2018-03-06 14:30:31', '2018-03-06 16:26:23', '1520317831389', '0', 'B_20170814000003', 'zhonghua150715@credithc.com,hewanyun150814@credithc.com,dingyaru160420@credithc.com', '100', 'ACCOUNTING_HHRTEST', '【账务中心】-公司退出服务费账户余额提醒', '', '1');
INSERT INTO `sys_dict` VALUES ('598', 'COMPANY_ACC_TXSXF', '提现手续费账户', '/ACC/MAIL_TYPE/CompanyAccBalanceMAIL/COMPANY_ACC_TXSXF', '594', '1', '2018-03-06 14:32:57', '2018-03-06 16:26:28', '1520317977226', '0', 'B_20170814000002', 'zhonghua150715@credithc.com,hewanyun150814@credithc.com,dingyaru160420@credithc.com', '100', 'ACCOUNTING_HHRTEST', '【账务中心】-公司提现手续费账户余额提醒', '', '1');
INSERT INTO `sys_dict` VALUES ('599', 'COMPANY_ACC_JQTF', '结清退费账户', '/ACC/MAIL_TYPE/CompanyAccBalanceMAIL/COMPANY_ACC_JQTF', '594', '1', '2018-03-06 14:34:35', '2018-03-06 16:26:33', '1520318075011', '0', 'B_20171030000004', 'zhonghua150715@credithc.com,hewanyun150814@credithc.com,dingyaru160420@credithc.com', '100', 'ACCOUNTING_HHRTEST', '【账务中心】-公司结清退费账户余额提醒', '', '1');
INSERT INTO `sys_dict` VALUES ('600', 'COMPANY_ACC_FWF', '服务费账户', '/ACC/MAIL_TYPE/CompanyAccBalanceMAIL/COMPANY_ACC_FWF', '594', '1', '2018-03-06 14:46:38', '2018-03-06 16:26:38', '1520318798016', '0', 'B_20171030000005', 'zhonghua150715@credithc.com,hewanyun150814@credithc.com,dingyaru160420@credithc.com', '100', 'ACCOUNTING_HHRTEST', '【账务中心】-公司服务费账户余额提醒', '', '1');
INSERT INTO `sys_dict` VALUES ('601', 'COMPANY_ACC_DFHK', '垫付回款账户', '/ACC/MAIL_TYPE/CompanyAccBalanceMAIL/COMPANY_ACC_DFHK', '594', '1', '2018-03-06 14:48:47', '2018-03-06 17:08:01', '1520318926867', '0', 'B_20171121000004', 'zhonghua150715@credithc.com,hewanyun150814@credithc.com,dingyaru160420@credithc.com', '6500', 'ACCOUNTING_HHRTEST', '【账务中心】-公司垫付回款账户余额提醒', '', '1');
INSERT INTO `sys_dict` VALUES ('602', 'COMPANY_ACC_DQSHFWF', '到期赎回服务费账户', '/ACC/MAIL_TYPE/CompanyAccBalanceMAIL/COMPANY_ACC_DQSHFWF', '594', '1', '2018-03-06 14:50:13', '2018-03-06 17:07:49', '1520319013033', '0', 'B_2017120700000207', 'zhonghua150715@credithc.com,hewanyun150814@credithc.com,dingyaru160420@credithc.com', '6500', 'ACCOUNTING_HHRTEST', '【账务中心】-公司到期赎回服务费账户余额提醒', '', '1');
INSERT INTO `sys_dict` VALUES ('603', 'COMPANY_ACC_JJSHFWF', '紧急赎回服务费账户', '/ACC/MAIL_TYPE/CompanyAccBalanceMAIL/COMPANY_ACC_JJSHFWF', '594', '1', '2018-03-06 14:52:35', '2018-03-06 16:26:56', '1520319154752', '0', 'B_2017120700000208', 'zhonghua150715@credithc.com,hewanyun150814@credithc.com,dingyaru160420@credithc.com', '100', 'ACCOUNTING_HHRTEST', '【账务中心】-公司紧急赎回服务费账户余额提醒', '', '1');
INSERT INTO `sys_dict` VALUES ('604', 'COMPANY_ACC_TQJQFWF', '提前结清服务费账户', '/ACC/MAIL_TYPE/CompanyAccBalanceMAIL/COMPANY_ACC_TQJQFWF', '594', '1', '2018-03-06 14:53:48', '2018-03-06 17:07:40', '1520319228186', '0', 'B_2017122100000565', 'zhonghua150715@credithc.com,hewanyun150814@credithc.com,dingyaru160420@credithc.com', '6500', 'ACCOUNTING_HHRTEST', '【账务中心】-公司提前结清服务费账户余额提醒', '', '1');
INSERT INTO `sys_dict` VALUES ('605', '1', '平台账户', '/HFBANK/OPEN_ACC/CUSTOMER_TYPE/1', '355', '1', '2018-03-14 10:39:51', '2018-03-14 10:39:51', '1520995190836', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('608', '33', '提现手续费资金', '/ACC/CAPITAL_NAME/33', '125', '1', '2018-03-20 15:14:18', '2018-03-20 15:14:18', '1521530058027', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('609', 'RETER_HHR', '紧急划回退费账户', '/ACC/COMPANY_HHR/RETER_HHR', '74', '1', '2018-04-11 16:28:27', '2018-04-11 16:28:27', '1523435306816', '0', 'B_2018041100000002', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('610', '56', '紧急划回', '/ACC/BIZ_TYPE/56', '101', '1', '2018-04-11 16:29:01', '2018-04-11 16:29:01', '1523435340711', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('611', '55', '退还保险费', '/ACC/CAPITAL_NAME/55', '125', '1', '2018-04-11 16:29:43', '2018-04-11 16:29:43', '1523435383126', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('612', '56', '退还服务费', '/ACC/CAPITAL_NAME/56', '125', '1', '2018-04-11 16:29:57', '2018-04-11 16:29:57', '1523435397361', '0', '', '', '', '', '', '', '1');
INSERT INTO `sys_dict` VALUES ('613', '57', '退还资金', '/ACC/CAPITAL_NAME/57', '125', '1', '2018-04-11 16:30:08', '2018-04-11 16:30:08', '1523435407902', '0', '', '', '', '', '', '', '1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) DEFAULT NULL,
  `parameter` varchar(400) DEFAULT NULL,
  `remote_addr` varchar(50) DEFAULT NULL,
  `agent` varchar(500) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'http://localhost:8080/sys/resources/findResourcesEMUByResources.do', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:01', '2018-06-14 19:01:04');
INSERT INTO `sys_log` VALUES ('2', 'http://localhost:8080/sys/resources', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:18', '2018-06-14 19:01:20');
INSERT INTO `sys_log` VALUES ('3', 'http://localhost:8080/sys/user', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:21', '2018-06-14 19:01:21');
INSERT INTO `sys_log` VALUES ('4', 'http://localhost:8080/sys/log', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:21', '2018-06-14 19:01:21');
INSERT INTO `sys_log` VALUES ('5', 'http://localhost:8080/sys/dict/findSubsByPath', '{\"path\":[\"/COMP/STATUS\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:22', '2018-06-14 19:01:23');
INSERT INTO `sys_log` VALUES ('6', 'http://localhost:8080/sys/msgLog', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:22', '2018-06-14 19:01:23');
INSERT INTO `sys_log` VALUES ('7', 'http://localhost:8080/sys/dict', '{\"path\":[\"/\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:22', '2018-06-14 19:01:24');
INSERT INTO `sys_log` VALUES ('8', 'http://localhost:8080/sys/serialNumber', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:22', '2018-06-14 19:01:24');
INSERT INTO `sys_log` VALUES ('9', 'http://localhost:8080/sys/dict/findSubsByPathNormal.do', '{\"path\":[\"/SYS/MENU_TYPE\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:24', '2018-06-14 19:01:24');
INSERT INTO `sys_log` VALUES ('10', 'http://localhost:8080/sys/scheduleJob/toList.do', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:24', '2018-06-14 19:01:24');
INSERT INTO `sys_log` VALUES ('11', 'http://localhost:8080/sys/resources/list.do', '{\"path\":[\"\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:24', '2018-06-14 19:01:25');
INSERT INTO `sys_log` VALUES ('12', 'http://localhost:8080/sys/role/listAll.do', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:25', '2018-06-14 19:01:25');
INSERT INTO `sys_log` VALUES ('13', 'http://localhost:8080/sys/user/list.do', '{\"page\":[\"1\"],\"rows\":[\"30\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:25', '2018-06-14 19:01:25');
INSERT INTO `sys_log` VALUES ('14', 'http://localhost:8080/sys/log/list.do', '{\"page\":[\"1\"],\"rows\":[\"50\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:25', '2018-06-14 19:01:25');
INSERT INTO `sys_log` VALUES ('15', 'http://localhost:8080/sys/dict/findSubsByPath', '{\"path\":[\"/COMP/STATUS\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:25', '2018-06-14 19:01:25');
INSERT INTO `sys_log` VALUES ('16', 'http://localhost:8080/sys/dict/findSubsByPathNormal.do', '{\"path\":[\"/SYS/SN_TYPE\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:25', '2018-06-14 19:01:25');
INSERT INTO `sys_log` VALUES ('17', 'http://localhost:8080/sys/msgLog/list.do', '{\"page\":[\"1\"],\"rows\":[\"30\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:25', '2018-06-14 19:01:25');
INSERT INTO `sys_log` VALUES ('18', 'http://localhost:8080/sys/serialNumber/list.do', '{\"page\":[\"1\"],\"rows\":[\"30\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:25', '2018-06-14 19:01:26');
INSERT INTO `sys_log` VALUES ('19', 'http://localhost:8080/sys/dict/list.do', '{\"path\":[\"/\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:26', '2018-06-14 19:01:26');
INSERT INTO `sys_log` VALUES ('20', 'http://localhost:8080/sys/dict/findSubsByPath', '{\"path\":[\"/SYS/MENU_TYPE\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:26', '2018-06-14 19:01:26');
INSERT INTO `sys_log` VALUES ('21', 'http://localhost:8080/sys/scheduleJob/list.do', '{}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-14 19:01:27', '2018-06-14 19:01:27');

-- ----------------------------
-- Table structure for sys_msg_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg_log`;
CREATE TABLE `sys_msg_log` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `biz_id` varchar(255) DEFAULT NULL,
  `biz_system` varchar(255) DEFAULT NULL,
  `invoke_time_millis` bigint(20) DEFAULT NULL,
  `mseconds` bigint(255) DEFAULT NULL,
  `reqmsg` text,
  `resmsg` text,
  `provider_name` varchar(255) DEFAULT NULL,
  `req_time` bigint(20) DEFAULT NULL,
  `res_time` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ret_code` varchar(255) DEFAULT NULL,
  `ret_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `biz_id_index` (`biz_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_msg_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `url` varchar(50) DEFAULT NULL COMMENT '路径地址',
  `type` varchar(50) DEFAULT NULL COMMENT '资源类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
INSERT INTO `sys_resources` VALUES ('1', null, '菜单', '/', '1', null);
INSERT INTO `sys_resources` VALUES ('2', '1', '系统管理', '#', '1', '3');
INSERT INTO `sys_resources` VALUES ('3', '2', '菜单管理', '/sys/resources', '1', '1');
INSERT INTO `sys_resources` VALUES ('4', '2', '用户管理', '/sys/user', '1', '2');
INSERT INTO `sys_resources` VALUES ('5', '2', '角色管理', '/sys/role', '1', '3');
INSERT INTO `sys_resources` VALUES ('6', '2', '日志管理', '/sys/log', '1', '4');
INSERT INTO `sys_resources` VALUES ('7', '2', '定时器管理', '/sys/scheduleJob/toList.do', '1', '7');
INSERT INTO `sys_resources` VALUES ('8', '2', '字典管理', '/sys/dict?path=/', '1', '6');
INSERT INTO `sys_resources` VALUES ('13', '6', '删除', '/sys/log/delete', '2', '1');
INSERT INTO `sys_resources` VALUES ('28', '1', '账户账务', '#', '1', '1');
INSERT INTO `sys_resources` VALUES ('29', '28', '公司账户列表', '/acc/accCompany', '1', '1');
INSERT INTO `sys_resources` VALUES ('30', '29', '新建', '/acc/accCompany/add', '2', '1');
INSERT INTO `sys_resources` VALUES ('31', '29', '修改', '/acc/accCompany/edit', '2', '2');
INSERT INTO `sys_resources` VALUES ('32', '28', '用户账户列表', '/acc/accMainAccount', '1', '2');
INSERT INTO `sys_resources` VALUES ('36', '28', '银行卡列表', '/acc/accBankInfo', '1', '3');
INSERT INTO `sys_resources` VALUES ('38', '28', '交易列表', '/acc/accTrade', '1', '4');
INSERT INTO `sys_resources` VALUES ('53', '28', '审核列表', '/acc/accAuditor', '1', '5');
INSERT INTO `sys_resources` VALUES ('54', '28', '绑定列表', '/acc/ukeyBind', '1', '6');
INSERT INTO `sys_resources` VALUES ('55', '32', '上传批量调账文件', '/acc/accMainAccount/fileUploadToBatchTransfer', '2', '2');
INSERT INTO `sys_resources` VALUES ('56', '54', '删除', '/acc/ukeyBind/del', '2', '1');
INSERT INTO `sys_resources` VALUES ('57', '29', '新建子账户', '/acc/accCompany/subList/add', '2', '3');
INSERT INTO `sys_resources` VALUES ('58', '29', '修改子账户', '/acc/accCompany/subList/edit', '2', '4');
INSERT INTO `sys_resources` VALUES ('60', '32', '启用/停用', '/acc/accMainAccount/status', '2', '5');
INSERT INTO `sys_resources` VALUES ('65', '28', '用户账户明细列表', '/acc/userAccountDetails', '1', '7');
INSERT INTO `sys_resources` VALUES ('66', '1', '银行存管', '#', '1', '2');
INSERT INTO `sys_resources` VALUES ('88', '2', '流水号管理', '/sys/serialNumber', '1', '8');
INSERT INTO `sys_resources` VALUES ('89', '29', '提现', '/acc/accCompany/subList/withdraw', '2', '5');
INSERT INTO `sys_resources` VALUES ('90', '2', '消息日志管理', '/sys/msgLog', '1', '9');
INSERT INTO `sys_resources` VALUES ('100', '2', '存管线程池', '/hfbank/queryThreadPool', '1', '91');
INSERT INTO `sys_resources` VALUES ('109', '32', '上传迁移文件', '/acc/accMainAccount/fileUploadToMigration', '2', '3');
INSERT INTO `sys_resources` VALUES ('110', '32', '上传冻结数据', '/acc/accMainAccount/fileUploadFrozenAccount', '2', '4');
INSERT INTO `sys_resources` VALUES ('111', '8', '列表', '/sys/dict/list', '2', '1');
INSERT INTO `sys_resources` VALUES ('112', '3', '添加', '/sys/resources/add', '2', '1');
INSERT INTO `sys_resources` VALUES ('113', '3', '修改', '/sys/resources/update', '2', '2');
INSERT INTO `sys_resources` VALUES ('114', '3', '删除', '/sys/resources/delete', '2', '3');
INSERT INTO `sys_resources` VALUES ('115', '4', '新增', '/sys/user/add', '2', '1');
INSERT INTO `sys_resources` VALUES ('116', '4', '修改', '/sys/user/update', '2', '2');
INSERT INTO `sys_resources` VALUES ('117', '4', '重置密码', '/sys/user/resetPwd', '2', '3');
INSERT INTO `sys_resources` VALUES ('118', '4', '禁用/启用', '/sys/user/disableUser', '2', '4');
INSERT INTO `sys_resources` VALUES ('119', '4', '删除用户', '/sys/user/delete', '2', '5');
INSERT INTO `sys_resources` VALUES ('120', '5', '新增', '/sys/role/add', '2', '1');
INSERT INTO `sys_resources` VALUES ('121', '5', '修改', '/sys/role/update', '2', '2');
INSERT INTO `sys_resources` VALUES ('122', '5', '删除', '/sys/role/delete', '2', '3');
INSERT INTO `sys_resources` VALUES ('123', '8', '添加', '/sys/dict/add', '2', '1');
INSERT INTO `sys_resources` VALUES ('124', '8', '编辑', '/sys/dict/update', '2', '3');
INSERT INTO `sys_resources` VALUES ('125', '8', '级联删除', '/sys/dict/delete', '2', '4');
INSERT INTO `sys_resources` VALUES ('126', '7', '新增', '/sys/scheduleJob/add', '2', '2');
INSERT INTO `sys_resources` VALUES ('127', '7', '编辑', '/sys/scheduleJob/update', '2', '3');
INSERT INTO `sys_resources` VALUES ('128', '7', '列表', '/sys/scheduleJob/list', '2', '1');
INSERT INTO `sys_resources` VALUES ('129', '7', '删除', '/sys/scheduleJob/delete', '2', '4');
INSERT INTO `sys_resources` VALUES ('130', '7', '暂停', '/sys/scheduleJob/stop', '2', '5');
INSERT INTO `sys_resources` VALUES ('131', '7', '恢复', '/sys/scheduleJob/resume', '2', '6');
INSERT INTO `sys_resources` VALUES ('132', '7', '执行一次', '/sys/scheduleJob/startNow', '2', '7');
INSERT INTO `sys_resources` VALUES ('133', '88', '新增', '/sys/serialNumber/add', '2', '1');
INSERT INTO `sys_resources` VALUES ('134', '88', '修改', '/sys/serialNumber/update', '2', '2');
INSERT INTO `sys_resources` VALUES ('135', '88', '删除', '/sys/serialNumber/delete', '2', '3');
INSERT INTO `sys_resources` VALUES ('160', '38', '交易明细', '/acc/accTrade/tradeDetailList', '2', '1');
INSERT INTO `sys_resources` VALUES ('161', '38', '导出', '/acc/accTrade/exportFile', '2', '2');
INSERT INTO `sys_resources` VALUES ('162', '160', '导出', '/acc/accTrade/exportDetailFile', '2', '3');
INSERT INTO `sys_resources` VALUES ('163', '53', '审核', '/acc/accAuditor/batchAuditor', '2', '1');
INSERT INTO `sys_resources` VALUES ('164', '53', '拒绝', '/acc/accAuditor/batchRefuse', '2', '2');
INSERT INTO `sys_resources` VALUES ('165', '29', '导出', '/acc/accCompany/subList/exportFile', '2', '6');
INSERT INTO `sys_resources` VALUES ('166', '53', '导出', '/acc/accAuditor/exportFile', '2', '3');
INSERT INTO `sys_resources` VALUES ('167', '54', '新增', '/acc/ukeyBind/addAndUpdate', '2', '2');
INSERT INTO `sys_resources` VALUES ('168', '54', '修改', '/acc/ukeyBind/addAndUpdate', '2', '3');
INSERT INTO `sys_resources` VALUES ('170', '36', '导出', '/acc/accBankInfo/exportFile', '2', '1');
INSERT INTO `sys_resources` VALUES ('174', '54', '获取序列号', '/acc/ukeyBind/getSerialNum', '2', '4');
INSERT INTO `sys_resources` VALUES ('176', '54', '验签', '/acc/ukeyBind/ukeyVerify', '2', '5');
INSERT INTO `sys_resources` VALUES ('178', '65', '导出', '/acc/userAccountDetails/exportDetailFile', '2', '1');
INSERT INTO `sys_resources` VALUES ('179', '65', '统计交易金额', '/acc/userAccountDetails/totalTradeAmount', '2', '2');
INSERT INTO `sys_resources` VALUES ('180', '32', '导出', '/acc/accMainAccount/exportFile', '2', '1');
INSERT INTO `sys_resources` VALUES ('182', '32', '所有子账户', '/acc/accMainAccount/allSubList', '2', '6');
INSERT INTO `sys_resources` VALUES ('183', '182', '子账户启用/停用', '/acc/accMainAccount/subList/status', '2', '1');
INSERT INTO `sys_resources` VALUES ('184', '182', '子账户调账', '/acc/accMainAccount/modifyAccountApply', '2', '2');
INSERT INTO `sys_resources` VALUES ('185', '182', '查看银行存管账户余额', '/acc/accMainAccount/subList/getAccentBalance', '2', '3');
INSERT INTO `sys_resources` VALUES ('186', '182', '资金冻结', '/acc/accMainAccount/subList/freeze', '2', '4');
INSERT INTO `sys_resources` VALUES ('187', '182', '资金解冻', '/acc/accMainAccount/subList/unFreeze', '2', '5');
INSERT INTO `sys_resources` VALUES ('188', '182', '子账户导出', '/acc/accMainAccount/subList/exportDetailFile', '2', '6');
INSERT INTO `sys_resources` VALUES ('189', '182', '子账户列表', '/acc/accMainAccount/subList', '2', '7');
INSERT INTO `sys_resources` VALUES ('190', '29', '公司子账户列表', '/acc/accCompany/subList', '2', '8');
INSERT INTO `sys_resources` VALUES ('191', '29', '公司子账户明细', '/acc/accCompany/listDitail', '2', '9');
INSERT INTO `sys_resources` VALUES ('192', '182', '交易流水', '/acc/accMainAccount/listDitail', '2', '8');
INSERT INTO `sys_resources` VALUES ('193', '32', '上传现金数据', '/acc/accMainAccount/fileUploadCashAccount', '2', '7');
INSERT INTO `sys_resources` VALUES ('207', '190', '子账户详情', '/acc/accCompany/allSubList', '2', '1');
INSERT INTO `sys_resources` VALUES ('208', '190', '交易流水', '/acc/accCompany/listDetail', '2', '2');
INSERT INTO `sys_resources` VALUES ('209', '190', '申请调账', '/acc/accCompany/modifyAccountApply', '2', '3');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员');
INSERT INTO `sys_role` VALUES ('2', '业务员');
INSERT INTO `sys_role` VALUES ('3', '测试员');
INSERT INTO `sys_role` VALUES ('4', '测试员2');
INSERT INTO `sys_role` VALUES ('5', '测试员3');

-- ----------------------------
-- Table structure for sys_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resources`;
CREATE TABLE `sys_role_resources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `resources_id` bigint(20) DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11583 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resources
-- ----------------------------
INSERT INTO `sys_role_resources` VALUES ('216', '4', '1');
INSERT INTO `sys_role_resources` VALUES ('217', '4', '2');
INSERT INTO `sys_role_resources` VALUES ('218', '4', '3');
INSERT INTO `sys_role_resources` VALUES ('798', '2', '1');
INSERT INTO `sys_role_resources` VALUES ('799', '2', '2');
INSERT INTO `sys_role_resources` VALUES ('800', '2', '3');
INSERT INTO `sys_role_resources` VALUES ('801', '2', '4');
INSERT INTO `sys_role_resources` VALUES ('802', '2', '5');
INSERT INTO `sys_role_resources` VALUES ('803', '2', '6');
INSERT INTO `sys_role_resources` VALUES ('804', '2', '13');
INSERT INTO `sys_role_resources` VALUES ('805', '2', '8');
INSERT INTO `sys_role_resources` VALUES ('806', '2', '7');
INSERT INTO `sys_role_resources` VALUES ('8093', '3', '1');
INSERT INTO `sys_role_resources` VALUES ('8094', '3', '28');
INSERT INTO `sys_role_resources` VALUES ('8095', '3', '29');
INSERT INTO `sys_role_resources` VALUES ('8096', '3', '30');
INSERT INTO `sys_role_resources` VALUES ('8097', '3', '31');
INSERT INTO `sys_role_resources` VALUES ('8098', '3', '57');
INSERT INTO `sys_role_resources` VALUES ('8099', '3', '58');
INSERT INTO `sys_role_resources` VALUES ('8100', '3', '89');
INSERT INTO `sys_role_resources` VALUES ('8101', '3', '165');
INSERT INTO `sys_role_resources` VALUES ('8102', '3', '32');
INSERT INTO `sys_role_resources` VALUES ('8103', '3', '180');
INSERT INTO `sys_role_resources` VALUES ('8104', '3', '55');
INSERT INTO `sys_role_resources` VALUES ('8105', '3', '109');
INSERT INTO `sys_role_resources` VALUES ('8106', '3', '110');
INSERT INTO `sys_role_resources` VALUES ('8107', '3', '60');
INSERT INTO `sys_role_resources` VALUES ('8108', '3', '182');
INSERT INTO `sys_role_resources` VALUES ('8109', '3', '183');
INSERT INTO `sys_role_resources` VALUES ('8110', '3', '184');
INSERT INTO `sys_role_resources` VALUES ('8111', '3', '185');
INSERT INTO `sys_role_resources` VALUES ('8112', '3', '186');
INSERT INTO `sys_role_resources` VALUES ('8113', '3', '187');
INSERT INTO `sys_role_resources` VALUES ('8114', '3', '188');
INSERT INTO `sys_role_resources` VALUES ('8115', '3', '36');
INSERT INTO `sys_role_resources` VALUES ('8116', '3', '170');
INSERT INTO `sys_role_resources` VALUES ('8117', '3', '38');
INSERT INTO `sys_role_resources` VALUES ('8118', '3', '160');
INSERT INTO `sys_role_resources` VALUES ('8119', '3', '162');
INSERT INTO `sys_role_resources` VALUES ('8120', '3', '161');
INSERT INTO `sys_role_resources` VALUES ('8121', '3', '53');
INSERT INTO `sys_role_resources` VALUES ('8122', '3', '163');
INSERT INTO `sys_role_resources` VALUES ('8123', '3', '164');
INSERT INTO `sys_role_resources` VALUES ('8124', '3', '166');
INSERT INTO `sys_role_resources` VALUES ('8125', '3', '54');
INSERT INTO `sys_role_resources` VALUES ('8126', '3', '56');
INSERT INTO `sys_role_resources` VALUES ('8127', '3', '167');
INSERT INTO `sys_role_resources` VALUES ('8128', '3', '168');
INSERT INTO `sys_role_resources` VALUES ('8129', '3', '174');
INSERT INTO `sys_role_resources` VALUES ('8130', '3', '176');
INSERT INTO `sys_role_resources` VALUES ('8131', '3', '65');
INSERT INTO `sys_role_resources` VALUES ('8132', '3', '178');
INSERT INTO `sys_role_resources` VALUES ('8133', '3', '179');
INSERT INTO `sys_role_resources` VALUES ('8134', '3', '66');
INSERT INTO `sys_role_resources` VALUES ('8137', '3', '150');
INSERT INTO `sys_role_resources` VALUES ('8138', '3', '151');
INSERT INTO `sys_role_resources` VALUES ('8140', '3', '144');
INSERT INTO `sys_role_resources` VALUES ('8141', '3', '145');
INSERT INTO `sys_role_resources` VALUES ('8143', '3', '146');
INSERT INTO `sys_role_resources` VALUES ('8144', '3', '147');
INSERT INTO `sys_role_resources` VALUES ('8145', '3', '148');
INSERT INTO `sys_role_resources` VALUES ('8146', '3', '149');
INSERT INTO `sys_role_resources` VALUES ('8148', '3', '138');
INSERT INTO `sys_role_resources` VALUES ('8149', '3', '139');
INSERT INTO `sys_role_resources` VALUES ('8150', '3', '140');
INSERT INTO `sys_role_resources` VALUES ('8151', '3', '141');
INSERT INTO `sys_role_resources` VALUES ('8153', '3', '136');
INSERT INTO `sys_role_resources` VALUES ('8155', '3', '137');
INSERT INTO `sys_role_resources` VALUES ('8166', '3', '153');
INSERT INTO `sys_role_resources` VALUES ('8168', '3', '155');
INSERT INTO `sys_role_resources` VALUES ('8169', '3', '156');
INSERT INTO `sys_role_resources` VALUES ('8171', '3', '154');
INSERT INTO `sys_role_resources` VALUES ('8175', '3', '157');
INSERT INTO `sys_role_resources` VALUES ('8177', '3', '142');
INSERT INTO `sys_role_resources` VALUES ('8179', '3', '143');
INSERT INTO `sys_role_resources` VALUES ('8183', '3', '158');
INSERT INTO `sys_role_resources` VALUES ('8184', '3', '159');
INSERT INTO `sys_role_resources` VALUES ('8186', '3', '152');
INSERT INTO `sys_role_resources` VALUES ('8188', '3', '49');
INSERT INTO `sys_role_resources` VALUES ('11218', '5', '1');
INSERT INTO `sys_role_resources` VALUES ('11219', '5', '2');
INSERT INTO `sys_role_resources` VALUES ('11220', '5', '3');
INSERT INTO `sys_role_resources` VALUES ('11221', '5', '4');
INSERT INTO `sys_role_resources` VALUES ('11222', '5', '5');
INSERT INTO `sys_role_resources` VALUES ('11403', '1', '1');
INSERT INTO `sys_role_resources` VALUES ('11404', '1', '28');
INSERT INTO `sys_role_resources` VALUES ('11405', '1', '29');
INSERT INTO `sys_role_resources` VALUES ('11406', '1', '30');
INSERT INTO `sys_role_resources` VALUES ('11407', '1', '31');
INSERT INTO `sys_role_resources` VALUES ('11408', '1', '57');
INSERT INTO `sys_role_resources` VALUES ('11409', '1', '58');
INSERT INTO `sys_role_resources` VALUES ('11410', '1', '89');
INSERT INTO `sys_role_resources` VALUES ('11411', '1', '165');
INSERT INTO `sys_role_resources` VALUES ('11412', '1', '190');
INSERT INTO `sys_role_resources` VALUES ('11413', '1', '207');
INSERT INTO `sys_role_resources` VALUES ('11414', '1', '208');
INSERT INTO `sys_role_resources` VALUES ('11415', '1', '209');
INSERT INTO `sys_role_resources` VALUES ('11416', '1', '191');
INSERT INTO `sys_role_resources` VALUES ('11417', '1', '32');
INSERT INTO `sys_role_resources` VALUES ('11418', '1', '180');
INSERT INTO `sys_role_resources` VALUES ('11419', '1', '55');
INSERT INTO `sys_role_resources` VALUES ('11420', '1', '109');
INSERT INTO `sys_role_resources` VALUES ('11421', '1', '110');
INSERT INTO `sys_role_resources` VALUES ('11422', '1', '60');
INSERT INTO `sys_role_resources` VALUES ('11423', '1', '182');
INSERT INTO `sys_role_resources` VALUES ('11424', '1', '183');
INSERT INTO `sys_role_resources` VALUES ('11425', '1', '184');
INSERT INTO `sys_role_resources` VALUES ('11426', '1', '185');
INSERT INTO `sys_role_resources` VALUES ('11427', '1', '186');
INSERT INTO `sys_role_resources` VALUES ('11428', '1', '187');
INSERT INTO `sys_role_resources` VALUES ('11429', '1', '188');
INSERT INTO `sys_role_resources` VALUES ('11430', '1', '189');
INSERT INTO `sys_role_resources` VALUES ('11431', '1', '192');
INSERT INTO `sys_role_resources` VALUES ('11432', '1', '193');
INSERT INTO `sys_role_resources` VALUES ('11433', '1', '36');
INSERT INTO `sys_role_resources` VALUES ('11434', '1', '170');
INSERT INTO `sys_role_resources` VALUES ('11435', '1', '38');
INSERT INTO `sys_role_resources` VALUES ('11436', '1', '160');
INSERT INTO `sys_role_resources` VALUES ('11437', '1', '162');
INSERT INTO `sys_role_resources` VALUES ('11438', '1', '161');
INSERT INTO `sys_role_resources` VALUES ('11439', '1', '53');
INSERT INTO `sys_role_resources` VALUES ('11440', '1', '163');
INSERT INTO `sys_role_resources` VALUES ('11441', '1', '164');
INSERT INTO `sys_role_resources` VALUES ('11442', '1', '166');
INSERT INTO `sys_role_resources` VALUES ('11443', '1', '54');
INSERT INTO `sys_role_resources` VALUES ('11444', '1', '56');
INSERT INTO `sys_role_resources` VALUES ('11445', '1', '167');
INSERT INTO `sys_role_resources` VALUES ('11446', '1', '168');
INSERT INTO `sys_role_resources` VALUES ('11447', '1', '174');
INSERT INTO `sys_role_resources` VALUES ('11448', '1', '176');
INSERT INTO `sys_role_resources` VALUES ('11449', '1', '65');
INSERT INTO `sys_role_resources` VALUES ('11450', '1', '178');
INSERT INTO `sys_role_resources` VALUES ('11451', '1', '179');
INSERT INTO `sys_role_resources` VALUES ('11452', '1', '66');
INSERT INTO `sys_role_resources` VALUES ('11455', '1', '150');
INSERT INTO `sys_role_resources` VALUES ('11456', '1', '151');
INSERT INTO `sys_role_resources` VALUES ('11458', '1', '144');
INSERT INTO `sys_role_resources` VALUES ('11459', '1', '145');
INSERT INTO `sys_role_resources` VALUES ('11461', '1', '146');
INSERT INTO `sys_role_resources` VALUES ('11462', '1', '147');
INSERT INTO `sys_role_resources` VALUES ('11463', '1', '148');
INSERT INTO `sys_role_resources` VALUES ('11464', '1', '149');
INSERT INTO `sys_role_resources` VALUES ('11465', '1', '212');
INSERT INTO `sys_role_resources` VALUES ('11467', '1', '138');
INSERT INTO `sys_role_resources` VALUES ('11468', '1', '139');
INSERT INTO `sys_role_resources` VALUES ('11469', '1', '140');
INSERT INTO `sys_role_resources` VALUES ('11470', '1', '141');
INSERT INTO `sys_role_resources` VALUES ('11471', '1', '214');
INSERT INTO `sys_role_resources` VALUES ('11473', '1', '136');
INSERT INTO `sys_role_resources` VALUES ('11475', '1', '137');
INSERT INTO `sys_role_resources` VALUES ('11487', '1', '153');
INSERT INTO `sys_role_resources` VALUES ('11489', '1', '155');
INSERT INTO `sys_role_resources` VALUES ('11490', '1', '156');
INSERT INTO `sys_role_resources` VALUES ('11491', '1', '205');
INSERT INTO `sys_role_resources` VALUES ('11493', '1', '154');
INSERT INTO `sys_role_resources` VALUES ('11495', '1', '206');
INSERT INTO `sys_role_resources` VALUES ('11498', '1', '157');
INSERT INTO `sys_role_resources` VALUES ('11500', '1', '142');
INSERT INTO `sys_role_resources` VALUES ('11503', '1', '143');
INSERT INTO `sys_role_resources` VALUES ('11508', '1', '158');
INSERT INTO `sys_role_resources` VALUES ('11509', '1', '159');
INSERT INTO `sys_role_resources` VALUES ('11511', '1', '152');
INSERT INTO `sys_role_resources` VALUES ('11514', '1', '195');
INSERT INTO `sys_role_resources` VALUES ('11515', '1', '196');
INSERT INTO `sys_role_resources` VALUES ('11516', '1', '197');
INSERT INTO `sys_role_resources` VALUES ('11517', '1', '198');
INSERT INTO `sys_role_resources` VALUES ('11519', '1', '201');
INSERT INTO `sys_role_resources` VALUES ('11520', '1', '202');
INSERT INTO `sys_role_resources` VALUES ('11521', '1', '203');
INSERT INTO `sys_role_resources` VALUES ('11522', '1', '204');
INSERT INTO `sys_role_resources` VALUES ('11523', '1', '2');
INSERT INTO `sys_role_resources` VALUES ('11524', '1', '3');
INSERT INTO `sys_role_resources` VALUES ('11525', '1', '112');
INSERT INTO `sys_role_resources` VALUES ('11526', '1', '113');
INSERT INTO `sys_role_resources` VALUES ('11527', '1', '114');
INSERT INTO `sys_role_resources` VALUES ('11528', '1', '4');
INSERT INTO `sys_role_resources` VALUES ('11529', '1', '115');
INSERT INTO `sys_role_resources` VALUES ('11530', '1', '116');
INSERT INTO `sys_role_resources` VALUES ('11531', '1', '117');
INSERT INTO `sys_role_resources` VALUES ('11532', '1', '118');
INSERT INTO `sys_role_resources` VALUES ('11533', '1', '119');
INSERT INTO `sys_role_resources` VALUES ('11534', '1', '5');
INSERT INTO `sys_role_resources` VALUES ('11535', '1', '120');
INSERT INTO `sys_role_resources` VALUES ('11536', '1', '121');
INSERT INTO `sys_role_resources` VALUES ('11537', '1', '122');
INSERT INTO `sys_role_resources` VALUES ('11538', '1', '6');
INSERT INTO `sys_role_resources` VALUES ('11539', '1', '13');
INSERT INTO `sys_role_resources` VALUES ('11540', '1', '8');
INSERT INTO `sys_role_resources` VALUES ('11541', '1', '111');
INSERT INTO `sys_role_resources` VALUES ('11542', '1', '123');
INSERT INTO `sys_role_resources` VALUES ('11543', '1', '124');
INSERT INTO `sys_role_resources` VALUES ('11544', '1', '125');
INSERT INTO `sys_role_resources` VALUES ('11545', '1', '7');
INSERT INTO `sys_role_resources` VALUES ('11546', '1', '128');
INSERT INTO `sys_role_resources` VALUES ('11547', '1', '126');
INSERT INTO `sys_role_resources` VALUES ('11548', '1', '127');
INSERT INTO `sys_role_resources` VALUES ('11549', '1', '129');
INSERT INTO `sys_role_resources` VALUES ('11550', '1', '130');
INSERT INTO `sys_role_resources` VALUES ('11551', '1', '131');
INSERT INTO `sys_role_resources` VALUES ('11552', '1', '132');
INSERT INTO `sys_role_resources` VALUES ('11553', '1', '88');
INSERT INTO `sys_role_resources` VALUES ('11554', '1', '133');
INSERT INTO `sys_role_resources` VALUES ('11555', '1', '134');
INSERT INTO `sys_role_resources` VALUES ('11556', '1', '135');
INSERT INTO `sys_role_resources` VALUES ('11557', '1', '90');
INSERT INTO `sys_role_resources` VALUES ('11558', '1', '100');
INSERT INTO `sys_role_resources` VALUES ('11559', '1', '93');
INSERT INTO `sys_role_resources` VALUES ('11560', '1', '94');
INSERT INTO `sys_role_resources` VALUES ('11561', '1', '97');
INSERT INTO `sys_role_resources` VALUES ('11562', '1', '96');
INSERT INTO `sys_role_resources` VALUES ('11563', '1', '95');
INSERT INTO `sys_role_resources` VALUES ('11564', '1', '49');
INSERT INTO `sys_role_resources` VALUES ('11565', '1', '50');
INSERT INTO `sys_role_resources` VALUES ('11566', '1', '52');
INSERT INTO `sys_role_resources` VALUES ('11567', '1', '64');
INSERT INTO `sys_role_resources` VALUES ('11568', '1', '35');
INSERT INTO `sys_role_resources` VALUES ('11569', '1', '34');
INSERT INTO `sys_role_resources` VALUES ('11570', '1', '37');
INSERT INTO `sys_role_resources` VALUES ('11571', '1', '39');
INSERT INTO `sys_role_resources` VALUES ('11572', '1', '40');
INSERT INTO `sys_role_resources` VALUES ('11573', '1', '42');
INSERT INTO `sys_role_resources` VALUES ('11574', '1', '43');
INSERT INTO `sys_role_resources` VALUES ('11575', '1', '45');
INSERT INTO `sys_role_resources` VALUES ('11576', '1', '46');
INSERT INTO `sys_role_resources` VALUES ('11577', '1', '47');
INSERT INTO `sys_role_resources` VALUES ('11578', '1', '51');
INSERT INTO `sys_role_resources` VALUES ('11579', '1', '59');
INSERT INTO `sys_role_resources` VALUES ('11580', '1', '12');
INSERT INTO `sys_role_resources` VALUES ('11581', '1', '24');
INSERT INTO `sys_role_resources` VALUES ('11582', '1', '25');

-- ----------------------------
-- Table structure for sys_serial_number
-- ----------------------------
DROP TABLE IF EXISTS `sys_serial_number`;
CREATE TABLE `sys_serial_number` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn_key` varchar(255) NOT NULL,
  `sn_type` int(11) NOT NULL,
  `curr_range` varchar(255) DEFAULT NULL,
  `next_num` bigint(20) NOT NULL,
  `pool_size` int(11) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `sortidx` bigint(255) DEFAULT NULL,
  `sn_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_serial_number
-- ----------------------------
INSERT INTO `sys_serial_number` VALUES ('1', 'MESSAGE_ID_SN', '3', '2017-11-20', '201', '200', '2017-07-03 17:04:40', '2017-11-20 13:36:33', '1430895995530', null);
INSERT INTO `sys_serial_number` VALUES ('2', 'ACCOUNT_NO_SN', '3', '2018-04-13', '201', '200', '2017-07-03 17:04:40', '2018-04-13 11:12:28', '1430895995529', null);
INSERT INTO `sys_serial_number` VALUES ('3', 'BIZ_ID_SN', '3', '2018-04-11', '201', '200', '2017-07-03 17:04:40', '2018-04-11 16:27:19', '1430895995528', null);
INSERT INTO `sys_serial_number` VALUES ('4', 'BAG_ID_SN', '3', '2017-09-11', '401', '200', '2017-08-03 10:19:06', '2017-09-11 10:21:16', '1430895995531', null);
INSERT INTO `sys_serial_number` VALUES ('5', 'BAP_ID_SN', '3', '2017-09-11', '3001', '200', '2017-08-03 10:20:44', '2017-09-11 17:48:57', '1430895995532', null);
INSERT INTO `sys_serial_number` VALUES ('6', 'BDT_ID_SN', '3', '2017-08-14', '1001', '200', '2017-08-04 10:46:52', '2017-08-14 14:18:36', '1430895995538', null);
INSERT INTO `sys_serial_number` VALUES ('7', 'PIF_ID_SN', '3', '2017-09-08', '201', '200', '2017-08-04 10:50:05', '2017-09-08 17:59:53', '1430895995539', null);
INSERT INTO `sys_serial_number` VALUES ('8', 'BAG_FILE_ID_SN', '3', '2017-09-11', '2001', '1000', '2017-09-04 10:09:31', '2017-09-11 10:21:16', '1430895995540', null);
INSERT INTO `sys_serial_number` VALUES ('9', 'BAP_FILE_ID_SN', '3', '2017-09-11', '60001', '4000', '2017-09-04 10:25:52', '2017-09-11 17:48:56', '1430895995541', null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) DEFAULT NULL COMMENT '登录名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `sortIdx` bigint(20) DEFAULT NULL COMMENT '排序号',
  `VERSION` int(11) DEFAULT NULL COMMENT '版本号',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '92e6b30d7ec4dc264f949923b60bb05a', '2017-08-04 11:43:51', '2018-01-24 10:26:28', '1430895995528', '0', '1', '管理员', 'admin@admin.cn');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('15', '1', '1');
