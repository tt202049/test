/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 08/06/2023 22:00:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'train_normal', '普速车辆基本信息', NULL, NULL, 'TrainNormal', 'crud', 'com.ruoyi.train', 'train', 'normalTrain', '普速调令管理', 'YALO', '0', '/', '{\"parentMenuId\":2002}', 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40', NULL);
INSERT INTO `gen_table` VALUES (2, 'train_high', '高铁车辆管理', NULL, NULL, 'TrainHigh', 'crud', 'com.ruoyi.train', 'train', 'hightrain', '高铁车辆管理', 'YALO', '0', '/', '{\"parentMenuId\":2002}', 'admin', '2023-03-27 13:59:31', '', '2023-03-27 14:02:16', NULL);
INSERT INTO `gen_table` VALUES (3, 'train_city', '城际列车管理表', '', '', 'TrainCity', 'crud', 'com.ruoyi.train', 'train', 'cityTrain', '城际列车管理', 'YALO', '0', '/', '{\"parentMenuId\":2002}', 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:17:01', NULL);
INSERT INTO `gen_table` VALUES (4, 'train_group', '交路表', 'train_city', 'group_id', 'TrainGroup', 'sub', 'com.ruoyi.train', 'train', 'trainGroup', '交路管理', 'YALO', '0', '/', '{\"parentMenuId\":\"2002\"}', 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:03:00', NULL);
INSERT INTO `gen_table` VALUES (5, 'train_commond', '调令管理表', NULL, NULL, 'TrainCommond', 'crud', 'com.ruoyi.train', 'train', 'commondTrain', '调令管理', 'YALO', '0', '/', '{\"parentMenuId\":2002}', 'admin', '2023-03-31 16:38:34', '', '2023-03-31 16:41:14', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'train_id', '普速车ID', 'int', 'Long', 'trainId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (2, '1', 'train_name', '普速车车号', 'varchar(255)', 'String', 'trainName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (3, '1', 'depature_station', '始发站', 'varchar(255)', 'String', 'depatureStation', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (4, '1', 'is_depature', '是否始发', 'int', 'Boolean', 'isDepature', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (5, '1', 'terminal_station', '终到站', 'varchar(255)', 'String', 'terminalStation', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (6, '1', 'is_avaliable', '是否开行', 'int', 'Boolean', 'isAvaliable', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (7, '1', 'trainset_num', '图定编组数量', 'int', 'Long', 'trainsetNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (8, '1', 'preset_num', '现编组数量', 'int', 'Long', 'presetNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (9, '1', 'platform_no', '站台号', 'int', 'Long', 'platformNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 9, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (10, '1', 'deport_no', '检票口号', 'char(1)', 'String', 'deportNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 10, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (11, '1', 'max_dirction', '最大车号方向', 'char(1)', 'String', 'maxDirction', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 11, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (12, '1', 'arrive_time', '到站时间', 'datetime', 'Date', 'arriveTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 12, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (13, '1', 'leave_time', '开车时间', 'datetime', 'Date', 'leaveTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (14, '1', 'stay_time', '停车时间', 'datetime', 'Date', 'stayTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (15, '1', 'is_waterup', '是否上水', 'int', 'Boolean', 'isWaterup', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 15, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (16, '1', 'coupe_id', '折返ID', 'int', 'Long', 'coupeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (17, '1', 'coupe_name', '折返车号', 'varchar(255)', 'String', 'coupeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 17, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (18, '1', 'coupe_day', '折返时间', 'datetime', 'Date', 'coupeDay', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 18, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (19, '1', 'note', '补充说明', 'varchar(255)', 'String', 'note', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2023-03-22 22:08:21', '', '2023-03-22 22:13:40');
INSERT INTO `gen_table_column` VALUES (20, '2', 'hightrain_id', '高铁ID', 'int', 'Long', 'hightrainId', '1', '1', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-27 13:59:31', '', '2023-03-27 14:02:16');
INSERT INTO `gen_table_column` VALUES (21, '2', 'hightrain_name', '高铁车号', 'varchar(255)', 'String', 'hightrainName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-03-27 13:59:31', '', '2023-03-27 14:02:16');
INSERT INTO `gen_table_column` VALUES (22, '2', 'depature_station', '始发站', 'varchar(255)', 'String', 'depatureStation', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-03-27 13:59:31', '', '2023-03-27 14:02:16');
INSERT INTO `gen_table_column` VALUES (23, '2', 'terminal_station', '终到站', 'varchar(255)', 'String', 'terminalStation', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-03-27 13:59:31', '', '2023-03-27 14:02:16');
INSERT INTO `gen_table_column` VALUES (24, '2', 'is_avaliable', '是否开行', 'int', 'Long', 'isAvaliable', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2023-03-27 13:59:31', '', '2023-03-27 14:02:16');
INSERT INTO `gen_table_column` VALUES (25, '2', 'arrive_time', '到站时间', 'datetime', 'Date', 'arriveTime', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'datetime', '', 6, 'admin', '2023-03-27 13:59:31', '', '2023-03-27 14:02:16');
INSERT INTO `gen_table_column` VALUES (26, '2', 'leave_time', '开车时间', 'datetime', 'Date', 'leaveTime', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'datetime', '', 7, 'admin', '2023-03-27 13:59:31', '', '2023-03-27 14:02:16');
INSERT INTO `gen_table_column` VALUES (27, '2', 'trainset_num', '图定编组数量', 'int', 'Long', 'trainsetNum', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2023-03-27 13:59:31', '', '2023-03-27 14:02:16');
INSERT INTO `gen_table_column` VALUES (28, '2', 'platform_no', '站台号', 'int', 'Long', 'platformNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-03-27 13:59:31', '', '2023-03-27 14:02:16');
INSERT INTO `gen_table_column` VALUES (29, '2', 'deport_no', '检票口号', 'int', 'Long', 'deportNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-03-27 13:59:31', '', '2023-03-27 14:02:16');
INSERT INTO `gen_table_column` VALUES (30, '2', 'couple_id', '折返车次ID', 'int', 'Long', 'coupleId', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 11, 'admin', '2023-03-27 13:59:31', '', '2023-03-27 14:02:16');
INSERT INTO `gen_table_column` VALUES (31, '2', 'couple_name', '折返车号', 'varchar(255)', 'String', 'coupleName', '0', '0', NULL, '1', '1', '1', '0', 'LIKE', 'input', '', 12, 'admin', '2023-03-27 13:59:31', '', '2023-03-27 14:02:16');
INSERT INTO `gen_table_column` VALUES (32, '3', 'citytrain_id', '城际列车ID', 'int', 'Long', 'citytrainId', '1', '0', NULL, '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:17:01');
INSERT INTO `gen_table_column` VALUES (33, '3', 'group_id', '交路ID', 'int', 'Long', 'groupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:17:01');
INSERT INTO `gen_table_column` VALUES (34, '3', 'citytrain_name', '城际列车号', 'varchar(255)', 'String', 'citytrainName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:17:01');
INSERT INTO `gen_table_column` VALUES (35, '3', 'depature_station', '始发站', 'varchar(255)', 'String', 'depatureStation', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:17:01');
INSERT INTO `gen_table_column` VALUES (36, '3', 'terminal_station', '终到站', 'varchar(255)', 'String', 'terminalStation', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:17:01');
INSERT INTO `gen_table_column` VALUES (37, '3', 'is_avaliable', '是否开行', 'int', 'Long', 'isAvaliable', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:17:01');
INSERT INTO `gen_table_column` VALUES (38, '3', 'trainset_num', '编组数量', 'int', 'Long', 'trainsetNum', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:17:01');
INSERT INTO `gen_table_column` VALUES (39, '3', 'arrive_time', '到站时间', 'datetime', 'Date', 'arriveTime', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'datetime', '', 8, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:17:01');
INSERT INTO `gen_table_column` VALUES (40, '3', 'leave_time', '开车时间', 'datetime', 'Date', 'leaveTime', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'datetime', '', 9, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:17:01');
INSERT INTO `gen_table_column` VALUES (41, '3', 'platform_no', '站台号', 'int', 'Long', 'platformNo', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:17:01');
INSERT INTO `gen_table_column` VALUES (42, '3', 'deport_no', '检票口', 'varchar(10)', 'String', 'deportNo', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 11, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:17:01');
INSERT INTO `gen_table_column` VALUES (43, '3', 'citytrain_note', '备注', 'varchar(1000)', 'String', 'citytrainNote', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'textarea', '', 12, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:17:01');
INSERT INTO `gen_table_column` VALUES (44, '4', 'group_id', '交路ID', 'int', 'Long', 'groupId', '1', '1', NULL, '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:03:00');
INSERT INTO `gen_table_column` VALUES (45, '4', 'group_avaliable', '交路是否使用', 'int', 'Long', 'groupAvaliable', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 2, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:03:00');
INSERT INTO `gen_table_column` VALUES (46, '4', 'used_train', '交路运行车辆', 'varchar(255)', 'String', 'usedTrain', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:03:00');
INSERT INTO `gen_table_column` VALUES (47, '4', 'free_train', '交路空闲车辆', 'varchar(255)', 'String', 'freeTrain', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:03:00');
INSERT INTO `gen_table_column` VALUES (48, '4', 'group_note', '交路描述', 'text', 'String', 'groupNote', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2023-03-27 19:47:14', '', '2023-03-27 20:03:00');
INSERT INTO `gen_table_column` VALUES (49, '5', 'commond_id', '调令id', 'int', 'Long', 'commondId', '1', '0', NULL, '0', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-31 16:38:34', '', '2023-03-31 16:41:14');
INSERT INTO `gen_table_column` VALUES (50, '5', 'commond_name', '调令名称', 'varchar(255)', 'String', 'commondName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-03-31 16:38:34', '', '2023-03-31 16:41:14');
INSERT INTO `gen_table_column` VALUES (51, '5', 'group_id', '调令影响交路', 'int', 'Long', 'groupId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-03-31 16:38:34', '', '2023-03-31 16:41:14');
INSERT INTO `gen_table_column` VALUES (52, '5', 'start_time', '调令开始时间', 'datetime', 'Date', 'startTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2023-03-31 16:38:34', '', '2023-03-31 16:41:14');
INSERT INTO `gen_table_column` VALUES (53, '5', 'end_time', '调令结束时间', 'datetime', 'Date', 'endTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2023-03-31 16:38:34', '', '2023-03-31 16:41:14');
INSERT INTO `gen_table_column` VALUES (54, '5', 'citytrain_id', '调令影响高铁id', 'int', 'Long', 'citytrainId', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 6, 'admin', '2023-03-31 16:38:34', '', '2023-03-31 16:41:14');
INSERT INTO `gen_table_column` VALUES (55, '5', 'normaltrain_id', '调令影响普速', 'int', 'Long', 'normaltrainId', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 7, 'admin', '2023-03-31 16:38:34', '', '2023-03-31 16:41:14');
INSERT INTO `gen_table_column` VALUES (56, '5', 'citytrain_name', '调令影响高铁车次', 'varchar(255)', 'String', 'citytrainName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 8, 'admin', '2023-03-31 16:38:34', '', '2023-03-31 16:41:14');
INSERT INTO `gen_table_column` VALUES (57, '5', 'normaltrain_name', '调令影响普速车次', 'varchar(255)', 'String', 'normaltrainName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 9, 'admin', '2023-03-31 16:38:34', '', '2023-03-31 16:41:14');
INSERT INTO `gen_table_column` VALUES (58, '5', 'commond_content', '调令具体内容', 'text', 'String', 'commondContent', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 10, 'admin', '2023-03-31 16:38:34', '', '2023-03-31 16:41:14');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-12-05 13:20:50', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-12-05 13:20:50', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-12-05 13:20:50', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2022-12-05 13:20:50', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-12-05 13:20:50', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '北京铁路局', 0, 'aa', '15888888888', 'test@163.com', '0', '0', 'admin', '2022-12-05 13:20:50', 'admin', '2023-03-31 17:08:45');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '天津站', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-05 13:20:50', 'admin', '2023-03-31 17:09:06');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '天津西站', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-05 13:20:50', 'admin', '2023-03-31 17:09:14');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '客运车间', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-05 13:20:50', 'admin', '2023-03-31 17:09:32');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-12-05 13:20:50', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-05 13:20:50', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-12-05 13:20:50', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-12-05 13:20:50', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-12-05 13:20:50', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-12-05 13:20:50', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-12-05 13:20:50', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 177 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-12-05 17:10:37');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-05 17:10:41');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-05 17:10:45');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 17:10:51');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 17:58:31');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 14:07:33');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 14:42:49');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 15:26:50');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-10 21:34:55');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-10 22:41:33');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-10 23:37:23');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-01-30 15:56:45');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-30 15:56:48');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-30 15:56:51');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-30 16:46:13');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-22 21:39:17');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-22 22:55:27');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-23 11:27:29');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-23 12:29:05');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-23 17:21:34');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 21:32:38');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 23:48:41');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 11:52:11');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 17:56:03');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 19:22:07');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 11:03:17');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '192.168.1.3', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-03-29 11:33:50');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '192.168.1.3', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-29 11:33:54');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '192.168.1.3', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 11:33:56');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 13:50:07');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 21:17:49');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 22:51:37');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-31 12:04:44');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-31 12:04:47');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 12:04:51');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 12:51:38');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 16:38:24');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 17:05:54');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-03-31 22:33:42');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 22:33:49');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 20:48:06');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-03 17:12:42');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 17:12:46');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-04 10:18:45');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 10:18:51');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-04 11:17:40');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 11:17:49');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-10 21:02:03');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-10 22:34:03');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-11 21:20:59');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-16 21:05:00');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-16 22:35:01');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-04-19 11:48:14');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-19 11:48:18');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-19 19:25:03');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-19 19:55:52');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-19 20:59:56');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-20 09:55:55');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-20 17:35:55');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-02 12:10:57');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-02 19:00:39');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-02 20:46:31');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-02 22:00:00');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-02 23:48:27');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-02 23:48:31');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-05 21:32:02');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 17:42:13');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-06-07 11:48:22');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-06-07 11:48:25');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 11:48:28');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 14:01:56');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 14:33:35');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-07 14:47:44');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 14:47:51');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 16:05:34');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 22:07:48');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-08 21:13:53');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2034 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 2, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-12-05 13:20:50', 'admin', '2023-03-22 22:07:54', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-12-05 13:20:50', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-12-05 13:20:50', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-12-05 13:20:50', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-12-05 13:20:50', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-12-05 13:20:50', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-12-05 13:20:50', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-12-05 13:20:50', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-12-05 13:20:50', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-12-05 13:20:50', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-12-05 13:20:50', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-12-05 13:20:50', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-12-05 13:20:50', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-12-05 13:20:50', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-12-05 13:20:50', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-12-05 13:20:50', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-12-05 13:20:50', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-12-05 13:20:50', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-12-05 13:20:50', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-12-05 13:20:50', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-12-05 13:20:50', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-12-05 13:20:50', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-12-05 13:20:50', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '测试', 0, 7, 'test', NULL, NULL, 1, 0, 'M', '0', '0', '', 'list', 'admin', '2022-12-10 22:43:22', 'admin', '2023-03-22 22:07:42', '');
INSERT INTO `sys_menu` VALUES (2001, '测试表单', 2000, 1, 'testTable', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'form', 'admin', '2023-01-30 16:47:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '车站管理', 0, 1, 'train', NULL, NULL, 1, 0, 'M', '0', '0', '', 'edit', 'admin', '2023-03-22 22:07:12', 'admin', '2023-03-31 17:07:29', '');
INSERT INTO `sys_menu` VALUES (2003, '普速车辆管理', 2002, 2, 'normalTrain', 'train/normalTrain/index', NULL, 1, 0, 'C', '0', '0', 'train:normalTrain:list', 'swagger', 'admin', '2023-03-22 22:14:57', 'admin', '2023-03-31 17:07:34', '普速调令管理菜单');
INSERT INTO `sys_menu` VALUES (2004, '普速调令管理查询', 2003, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:normalTrain:query', '#', 'admin', '2023-03-22 22:14:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '普速调令管理新增', 2003, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:normalTrain:add', '#', 'admin', '2023-03-22 22:14:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '普速调令管理修改', 2003, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:normalTrain:edit', '#', 'admin', '2023-03-22 22:14:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '普速调令管理删除', 2003, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:normalTrain:remove', '#', 'admin', '2023-03-22 22:14:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '普速调令管理导出', 2003, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:normalTrain:export', '#', 'admin', '2023-03-22 22:14:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '高铁车辆管理', 2002, 2, 'hightrain', 'train/hightrain/index', NULL, 1, 0, 'C', '0', '0', 'train:hightrain:list', 'guide', 'admin', '2023-03-27 14:03:57', 'admin', '2023-03-31 17:07:45', '高铁车辆管理菜单');
INSERT INTO `sys_menu` VALUES (2011, '高铁车辆管理查询', 2010, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:hightrain:query', '#', 'admin', '2023-03-27 14:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '高铁车辆管理新增', 2010, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:hightrain:add', '#', 'admin', '2023-03-27 14:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '高铁车辆管理修改', 2010, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:hightrain:edit', '#', 'admin', '2023-03-27 14:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '高铁车辆管理删除', 2010, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:hightrain:remove', '#', 'admin', '2023-03-27 14:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '高铁车辆管理导出', 2010, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:hightrain:export', '#', 'admin', '2023-03-27 14:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '交路管理', 2002, 3, 'trainGroup', 'train/trainGroup/index', NULL, 1, 0, 'C', '0', '0', 'train:trainGroup:list', 'list', 'admin', '2023-03-27 19:53:39', 'admin', '2023-03-27 19:59:15', '交路管理菜单');
INSERT INTO `sys_menu` VALUES (2017, '交路管理查询', 2016, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:trainGroup:query', '#', 'admin', '2023-03-27 19:53:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '交路管理新增', 2016, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:trainGroup:add', '#', 'admin', '2023-03-27 19:53:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '交路管理修改', 2016, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:trainGroup:edit', '#', 'admin', '2023-03-27 19:53:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '交路管理删除', 2016, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:trainGroup:remove', '#', 'admin', '2023-03-27 19:53:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '交路管理导出', 2016, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:trainGroup:export', '#', 'admin', '2023-03-27 19:53:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '城际列车管理', 2002, 2, 'cityTrain', 'train/cityTrain/index', NULL, 1, 0, 'C', '0', '0', 'train:cityTrain:list', 'swagger', 'admin', '2023-03-27 20:17:54', 'admin', '2023-03-31 17:07:12', '城际列车管理菜单');
INSERT INTO `sys_menu` VALUES (2023, '城际列车管理查询', 2022, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:cityTrain:query', '#', 'admin', '2023-03-27 20:17:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '城际列车管理新增', 2022, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:cityTrain:add', '#', 'admin', '2023-03-27 20:17:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '城际列车管理修改', 2022, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:cityTrain:edit', '#', 'admin', '2023-03-27 20:17:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '城际列车管理删除', 2022, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:cityTrain:remove', '#', 'admin', '2023-03-27 20:17:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '城际列车管理导出', 2022, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:cityTrain:export', '#', 'admin', '2023-03-27 20:17:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '调令管理', 2002, 1, 'commondTrain', 'train/commondTrain/index', NULL, 1, 0, 'C', '0', '0', 'train:commondTrain:list', 'documentation', 'admin', '2023-03-31 16:42:07', 'admin', '2023-03-31 17:06:43', '调令管理菜单');
INSERT INTO `sys_menu` VALUES (2029, '调令管理查询', 2028, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:commondTrain:query', '#', 'admin', '2023-03-31 16:42:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '调令管理新增', 2028, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:commondTrain:add', '#', 'admin', '2023-03-31 16:42:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '调令管理修改', 2028, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:commondTrain:edit', '#', 'admin', '2023-03-31 16:42:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '调令管理删除', 2028, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:commondTrain:remove', '#', 'admin', '2023-03-31 16:42:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '调令管理导出', 2028, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'train:commondTrain:export', '#', 'admin', '2023-03-31 16:42:07', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-12-05 13:20:50', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-12-05 13:20:50', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 305 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '角色管理', 5, 'com.ruoyi.web.controller.system.SysRoleController.export()', 'POST', 1, 'admin', NULL, '/system/role/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2022-12-10 21:35:13');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2022-12-10 22:41:51');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2022-12-10 22:41:59');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"调令管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"train\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-10 22:43:22');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"调令管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"train\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"新增菜单\'调令管理\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2022-12-10 22:44:01');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-12-10 22:43:22\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"test\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-30 16:46:38');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"测试表单\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"testTable\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-30 16:47:51');
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-03-22 22:06:17');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"调令管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"train\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-22 22:07:12');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-12-10 22:43:22\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"测试\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"test\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-22 22:07:42');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-12-05 13:20:50\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-22 22:07:54');
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"train_normal\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-22 22:08:21');
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"normalTrain\",\"className\":\"TrainNormal\",\"columns\":[{\"capJavaField\":\"TrainId\",\"columnComment\":\"普速车ID\",\"columnId\":1,\"columnName\":\"train_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-22 22:08:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"trainId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TrainName\",\"columnComment\":\"普速车车号\",\"columnId\":2,\"columnName\":\"train_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-22 22:08:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"trainName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DepatureStation\",\"columnComment\":\"始发站\",\"columnId\":3,\"columnName\":\"depature_station\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-22 22:08:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"depatureStation\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"IsDepature\",\"columnComment\":\"是否始发\",\"columnId\":4,\"columnName\":\"is_depature\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-22 22:08:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-22 22:13:40');
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"train_normal\"}', NULL, 0, NULL, '2023-03-22 22:13:43');
INSERT INTO `sys_oper_log` VALUES (114, '普速调令管理', 1, 'com.ruoyi.train.controller.TrainNormalController.add()', 'POST', 1, 'admin', NULL, '/train/normalTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 22:49:00\",\"depatureStation\":\"天津\",\"isAvaliable\":false,\"isDepature\":true,\"isWaterup\":false,\"leaveTime\":\"1970-01-01 23:49:00\",\"params\":{},\"presetNum\":12,\"stayTime\":\"90\",\"terminalStation\":\"长沙\",\"trainName\":\"T21\",\"trainsetNum\":12}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'train_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainNormalMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainNormalMapper.insertTrainNormal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_normal          ( train_name,             depature_station,             is_depature,             terminal_station,             is_avaliable,             trainset_num,             preset_num,                                                    arrive_time,             leave_time,             stay_time,             is_waterup )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'train_id\' doesn\'t have a default value\n; Field \'train_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'train_id\' doesn\'t have a default value', '2023-03-26 23:52:57');
INSERT INTO `sys_oper_log` VALUES (115, '普速调令管理', 1, 'com.ruoyi.train.controller.TrainNormalController.add()', 'POST', 1, 'admin', NULL, '/train/normalTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 12:52:00\",\"depatureStation\":\"天津\",\"isAvaliable\":false,\"isDepature\":true,\"isWaterup\":false,\"leaveTime\":\"1970-01-01 14:52:00\",\"params\":{},\"presetNum\":23,\"stayTime\":\"90\",\"terminalStation\":\"武汉\",\"trainName\":\"T123\",\"trainsetNum\":12}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'train_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainNormalMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainNormalMapper.insertTrainNormal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_normal          ( train_name,             depature_station,             is_depature,             terminal_station,             is_avaliable,             trainset_num,             preset_num,                                                    arrive_time,             leave_time,             stay_time,             is_waterup )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'train_id\' doesn\'t have a default value\n; Field \'train_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'train_id\' doesn\'t have a default value', '2023-03-27 11:52:56');
INSERT INTO `sys_oper_log` VALUES (116, '普速调令管理', 1, 'com.ruoyi.train.controller.TrainNormalController.add()', 'POST', 1, 'admin', NULL, '/train/normalTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 12:52:00\",\"depatureStation\":\"天津\",\"isAvaliable\":false,\"isDepature\":true,\"isWaterup\":false,\"leaveTime\":\"1970-01-01 14:52:00\",\"params\":{},\"presetNum\":23,\"stayTime\":\"90\",\"terminalStation\":\"武汉\",\"trainName\":\"T123\",\"trainsetNum\":12}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'max_dirction\' doesn\'t have a default value\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainNormalMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainNormalMapper.insertTrainNormal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_normal          ( train_name,             depature_station,             is_depature,             terminal_station,             is_avaliable,             trainset_num,             preset_num,                                                    arrive_time,             leave_time,             stay_time,             is_waterup )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'max_dirction\' doesn\'t have a default value\n; Field \'max_dirction\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'max_dirction\' doesn\'t have a default value', '2023-03-27 12:07:52');
INSERT INTO `sys_oper_log` VALUES (117, '普速调令管理', 1, 'com.ruoyi.train.controller.TrainNormalController.add()', 'POST', 1, 'admin', NULL, '/train/normalTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 12:24:00\",\"depatureStation\":\"广州\",\"isAvaliable\":false,\"isDepature\":false,\"isWaterup\":false,\"leaveTime\":\"1970-01-01 13:24:00\",\"maxDirction\":\"east\",\"params\":{},\"presetNum\":23,\"stayTime\":\"90\",\"terminalStation\":\"天津\",\"trainName\":\"T21\",\"trainsetNum\":12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 12:25:06');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/normalTrain/index\",\"createTime\":\"2023-03-22 22:14:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"普速车辆管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"normalTrain\",\"perms\":\"train:normalTrain:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 13:12:40');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/normalTrain/index\",\"createTime\":\"2023-03-22 22:14:57\",\"icon\":\"swagger\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"普速车辆管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"normalTrain\",\"perms\":\"train:normalTrain:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 13:13:23');
INSERT INTO `sys_oper_log` VALUES (120, '普速调令管理', 1, 'com.ruoyi.train.controller.TrainNormalController.add()', 'POST', 1, 'admin', NULL, '/train/normalTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 13:20:00\",\"depatureStation\":\"长沙\",\"isAvaliable\":false,\"isDepature\":true,\"isWaterup\":true,\"leaveTime\":\"1970-01-01 14:20:00\",\"maxDirction\":\"西\",\"params\":{},\"presetNum\":23,\"stayTime\":\"80\",\"terminalStation\":\"北京\",\"trainName\":\"K23\",\"trainsetNum\":23}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 13:21:06');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"高铁车辆管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"hightrain\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 13:57:54');
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"train_high\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 13:59:31');
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"hightrain\",\"className\":\"TrainHigh\",\"columns\":[{\"capJavaField\":\"HightrainId\",\"columnComment\":\"高铁ID\",\"columnId\":20,\"columnName\":\"hightrain_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 13:59:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"hightrainId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HightrainName\",\"columnComment\":\"高铁车号\",\"columnId\":21,\"columnName\":\"hightrain_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 13:59:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"hightrainName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DepatureStation\",\"columnComment\":\"始发站\",\"columnId\":22,\"columnName\":\"depature_station\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 13:59:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"depatureStation\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TerminalStation\",\"columnComment\":\"终到站\",\"columnId\":23,\"columnName\":\"terminal_station\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 13:59:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 14:02:16');
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"train_high\"}', NULL, 0, NULL, '2023-03-27 14:02:33');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2009', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 14:10:05');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/hightrain/index\",\"createTime\":\"2023-03-27 14:03:57\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"高铁车辆管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"hightrain\",\"perms\":\"train:hightrain:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 14:10:35');
INSERT INTO `sys_oper_log` VALUES (127, '高铁车辆管理', 1, 'com.ruoyi.train.controller.TrainHighController.add()', 'POST', 1, 'admin', NULL, '/train/hightrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 14:41:00\",\"depatureStation\":\"天津\",\"deportNo\":7,\"hightrainId\":1,\"hightrainName\":\"G1391\",\"isAvaliable\":0,\"isDepature\":true,\"leaveTime\":\"1970-01-01 15:41:00\",\"params\":{},\"platformNo\":6,\"terminalStation\":\"蓟县\",\"trainsetNum\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 14:43:07');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-03-27 18:00:50');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-03-27 18:01:01');
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"train_city,train_group\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 19:47:14');
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"train_city,train_group\"}', NULL, 0, NULL, '2023-03-27 19:47:20');
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"train_group\"}', NULL, 0, NULL, '2023-03-27 19:47:54');
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"train_group\"}', NULL, 0, NULL, '2023-03-27 19:48:29');
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"trainGroup\",\"className\":\"TrainGroup\",\"columns\":[{\"capJavaField\":\"GroupId\",\"columnComment\":\"交路ID\",\"columnId\":44,\"columnName\":\"group_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 19:47:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"groupId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GroupAvaliable\",\"columnComment\":\"交路是否使用\",\"columnId\":45,\"columnName\":\"group_avaliable\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 19:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"groupAvaliable\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UsedTrain\",\"columnComment\":\"交路运行车辆\",\"columnId\":46,\"columnName\":\"used_train\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 19:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"usedTrain\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FreeTrain\",\"columnComment\":\"交路空闲车辆\",\"columnId\":47,\"columnName\":\"free_train\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 19:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"java', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 19:52:11');
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"train_group\"}', NULL, 0, NULL, '2023-03-27 19:52:52');
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/trainGroup/index\",\"createTime\":\"2023-03-27 19:53:39\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2016,\"menuName\":\"交路管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"path\":\"trainGroup\",\"perms\":\"train:trainGroup:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 19:59:15');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-22 22:07:12\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"调令管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"train\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 19:59:36');
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"trainGroup\",\"className\":\"TrainGroup\",\"columns\":[{\"capJavaField\":\"GroupId\",\"columnComment\":\"交路ID\",\"columnId\":44,\"columnName\":\"group_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 19:47:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"groupId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 19:52:11\",\"usableColumn\":false},{\"capJavaField\":\"GroupAvaliable\",\"columnComment\":\"交路是否使用\",\"columnId\":45,\"columnName\":\"group_avaliable\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 19:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"groupAvaliable\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 19:52:11\",\"usableColumn\":false},{\"capJavaField\":\"UsedTrain\",\"columnComment\":\"交路运行车辆\",\"columnId\":46,\"columnName\":\"used_train\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 19:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"usedTrain\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 19:52:11\",\"usableColumn\":false},{\"capJavaField\":\"FreeTrain\",\"columnComment\":\"交路空闲车辆\",\"columnId\":47,\"columnName\":\"free_train\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 19:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":fals', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 20:03:00');
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"train_group\"}', NULL, 0, NULL, '2023-03-27 20:03:08');
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"cityTrain\",\"className\":\"TrainCity\",\"columns\":[{\"capJavaField\":\"CitytrainId\",\"columnComment\":\"城际列车ID\",\"columnId\":32,\"columnName\":\"citytrain_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 19:47:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"citytrainId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GroupId\",\"columnComment\":\"交路ID\",\"columnId\":33,\"columnName\":\"group_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 19:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"groupId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CitytrainName\",\"columnComment\":\"城际列车号\",\"columnId\":34,\"columnName\":\"citytrain_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 19:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"citytrainName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DepatureStation\",\"columnComment\":\"始发站\",\"columnId\":35,\"columnName\":\"depature_station\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 19:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isP', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 20:17:01');
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"train_city\"}', NULL, 0, NULL, '2023-03-27 20:17:08');
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"train_city\"}', NULL, 0, NULL, '2023-03-27 20:18:30');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/cityTrain/index\",\"createTime\":\"2023-03-27 20:17:54\",\"icon\":\"swagger\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"城际列车管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"cityTrain\",\"perms\":\"train:cityTrain:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 20:30:17');
INSERT INTO `sys_oper_log` VALUES (144, '交路管理', 1, 'com.ruoyi.train.controller.TrainGroupController.add()', 'POST', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 20:49:58');
INSERT INTO `sys_oper_log` VALUES (145, '城际列车管理', 1, 'com.ruoyi.train.controller.TrainCityController.add()', 'POST', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":true,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'citytrain_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainCityMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainCityMapper.insertTrainCity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_city          ( group_id,             citytrain_name,             depature_station,             terminal_station,             is_avaliable,             trainset_num,             arrive_time,             leave_time,             platform_no,             deport_no )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'citytrain_id\' doesn\'t have a default value\n; Field \'citytrain_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'citytrain_id\' doesn\'t have a default value', '2023-03-27 21:35:19');
INSERT INTO `sys_oper_log` VALUES (146, '城际列车管理', 1, 'com.ruoyi.train.controller.TrainCityController.add()', 'POST', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":true,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 21:39:05');
INSERT INTO `sys_oper_log` VALUES (147, '城际列车管理', 2, 'com.ruoyi.train.controller.TrainCityController.edit()', 'PUT', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 21:49:17');
INSERT INTO `sys_oper_log` VALUES (148, '普速调令管理', 2, 'com.ruoyi.train.controller.TrainNormalController.edit()', 'PUT', 1, 'admin', NULL, '/train/normalTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 00:00:00\",\"depatureStation\":\"广州\",\"isAvaliable\":true,\"isDepature\":false,\"isWaterup\":false,\"leaveTime\":\"1970-01-01 00:00:00\",\"maxDirction\":\"东\",\"params\":{},\"presetNum\":23,\"stayTime\":\"90\",\"terminalStation\":\"天津\",\"trainId\":1,\"trainName\":\"T21\",\"trainsetNum\":12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 21:49:56');
INSERT INTO `sys_oper_log` VALUES (149, '城际列车管理', 2, 'com.ruoyi.train.controller.TrainCityController.edit()', 'PUT', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":true,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 21:50:16');
INSERT INTO `sys_oper_log` VALUES (150, '城际列车管理', 2, 'com.ruoyi.train.controller.TrainCityController.edit()', 'PUT', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 21:52:53');
INSERT INTO `sys_oper_log` VALUES (151, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 21:53:06');
INSERT INTO `sys_oper_log` VALUES (152, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 21:53:22');
INSERT INTO `sys_oper_log` VALUES (153, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 21:53:42');
INSERT INTO `sys_oper_log` VALUES (154, '城际列车管理', 1, 'com.ruoyi.train.controller.TrainCityController.add()', 'POST', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 11:45:00\",\"citytrainName\":\"G123\",\"depatureStation\":\"始发\",\"groupId\":2,\"isAvaliable\":true,\"leaveTime\":\"1970-01-01 13:45:00\",\"params\":{},\"terminalStation\":\"上水\",\"trainsetNum\":56}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 12:45:49');
INSERT INTO `sys_oper_log` VALUES (155, '交路管理', 1, 'com.ruoyi.train.controller.TrainGroupController.add()', 'POST', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 14:22:23');
INSERT INTO `sys_oper_log` VALUES (156, '交路管理', 1, 'com.ruoyi.train.controller.TrainGroupController.add()', 'POST', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 15:10:41');
INSERT INTO `sys_oper_log` VALUES (157, '交路管理', 1, 'com.ruoyi.train.controller.TrainGroupController.add()', 'POST', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 15:23:45');
INSERT INTO `sys_oper_log` VALUES (158, '交路管理', 3, 'com.ruoyi.train.controller.TrainGroupController.remove()', 'DELETE', 1, 'admin', NULL, '/train/trainGroup/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 15:25:12');
INSERT INTO `sys_oper_log` VALUES (159, '交路管理', 1, 'com.ruoyi.train.controller.TrainGroupController.add()', 'POST', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 15:25:16');
INSERT INTO `sys_oper_log` VALUES (160, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 15:43:49');
INSERT INTO `sys_oper_log` VALUES (161, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 15:45:45');
INSERT INTO `sys_oper_log` VALUES (162, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 15:47:35');
INSERT INTO `sys_oper_log` VALUES (163, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 15:50:37');
INSERT INTO `sys_oper_log` VALUES (164, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 15:53:36');
INSERT INTO `sys_oper_log` VALUES (165, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 15:53:56');
INSERT INTO `sys_oper_log` VALUES (166, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 15:55:32');
INSERT INTO `sys_oper_log` VALUES (167, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 16:03:21');
INSERT INTO `sys_oper_log` VALUES (168, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 16:08:41');
INSERT INTO `sys_oper_log` VALUES (169, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 16:11:00');
INSERT INTO `sys_oper_log` VALUES (170, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 16:12:56');
INSERT INTO `sys_oper_log` VALUES (171, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 16:13:50');
INSERT INTO `sys_oper_log` VALUES (172, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 16:16:02');
INSERT INTO `sys_oper_log` VALUES (173, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 21:18:01');
INSERT INTO `sys_oper_log` VALUES (174, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 21:22:07');
INSERT INTO `sys_oper_log` VALUES (175, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 21:40:56');
INSERT INTO `sys_oper_log` VALUES (176, '城际列车管理', 1, 'com.ruoyi.train.controller.TrainCityController.add()', 'POST', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"citytrainName\":\"G123\",\"depatureStation\":\"融入\",\"groupId\":2,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"这周\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 21:50:05');
INSERT INTO `sys_oper_log` VALUES (177, '城际列车管理', 1, 'com.ruoyi.train.controller.TrainCityController.add()', 'POST', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 21:50:19');
INSERT INTO `sys_oper_log` VALUES (178, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 21:50:35');
INSERT INTO `sys_oper_log` VALUES (179, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 21:51:15');
INSERT INTO `sys_oper_log` VALUES (180, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 22:51:49');
INSERT INTO `sys_oper_log` VALUES (181, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 22:58:58');
INSERT INTO `sys_oper_log` VALUES (182, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 22:59:52');
INSERT INTO `sys_oper_log` VALUES (183, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 23:00:36');
INSERT INTO `sys_oper_log` VALUES (184, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 23:02:15');
INSERT INTO `sys_oper_log` VALUES (185, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 23:02:30');
INSERT INTO `sys_oper_log` VALUES (186, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 23:05:16');
INSERT INTO `sys_oper_log` VALUES (187, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 12:05:26');
INSERT INTO `sys_oper_log` VALUES (188, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 12:12:26');
INSERT INTO `sys_oper_log` VALUES (189, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 12:13:46');
INSERT INTO `sys_oper_log` VALUES (190, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 12:15:55');
INSERT INTO `sys_oper_log` VALUES (191, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 12:18:15');
INSERT INTO `sys_oper_log` VALUES (192, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 12:19:47');
INSERT INTO `sys_oper_log` VALUES (193, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 12:22:03');
INSERT INTO `sys_oper_log` VALUES (194, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 12:52:03');
INSERT INTO `sys_oper_log` VALUES (195, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 12:54:14');
INSERT INTO `sys_oper_log` VALUES (196, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 12:56:31');
INSERT INTO `sys_oper_log` VALUES (197, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:01:00');
INSERT INTO `sys_oper_log` VALUES (198, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":4,\"citytrainName\":\"G2321\",\"depatureStation\":\"算是\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"方法\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:06:09');
INSERT INTO `sys_oper_log` VALUES (199, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:09:50');
INSERT INTO `sys_oper_log` VALUES (200, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"arriveTime\":\"1970-01-01 07:34:00\",\"citytrainId\":1,\"citytrainName\":\"G2578\",\"depatureStation\":\"天津\",\"deportNo\":\"15A\",\"groupId\":1,\"isAvaliable\":false,\"leaveTime\":\"1970-01-01 08:35:00\",\"params\":{},\"platformNo\":15,\"terminalStation\":\"北京\",\"trainsetNum\":8}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:12:57');
INSERT INTO `sys_oper_log` VALUES (201, '城际列车管理', 1, 'com.ruoyi.train.controller.TrainCityController.add()', 'POST', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"citytrainName\":\"G645\",\"depatureStation\":\"更改\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"融入\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:13:51');
INSERT INTO `sys_oper_log` VALUES (202, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":5,\"citytrainName\":\"G645\",\"depatureStation\":\"更改\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"融入\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:14:26');
INSERT INTO `sys_oper_log` VALUES (203, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":5,\"citytrainName\":\"G645\",\"depatureStation\":\"更改\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"融入\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:15:03');
INSERT INTO `sys_oper_log` VALUES (204, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:20:10');
INSERT INTO `sys_oper_log` VALUES (205, '城际列车管理', 1, 'com.ruoyi.train.controller.TrainCityController.add()', 'POST', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"citytrainName\":\"G1\",\"depatureStation\":\"阿达\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"vf\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:21:07');
INSERT INTO `sys_oper_log` VALUES (206, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:21:49');
INSERT INTO `sys_oper_log` VALUES (207, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":6,\"citytrainName\":\"G1\",\"depatureStation\":\"阿达\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"vf\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:23:24');
INSERT INTO `sys_oper_log` VALUES (208, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":4,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:23:50');
INSERT INTO `sys_oper_log` VALUES (209, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[{\"citytrainId\":6,\"citytrainName\":\"G1\",\"depatureStation\":\"阿达\",\"groupId\":3,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"vf\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:25:29');
INSERT INTO `sys_oper_log` VALUES (210, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":4,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:26:25');
INSERT INTO `sys_oper_log` VALUES (211, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":4,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:26:52');
INSERT INTO `sys_oper_log` VALUES (212, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":4,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:28:54');
INSERT INTO `sys_oper_log` VALUES (213, '城际列车管理', 1, 'com.ruoyi.train.controller.TrainCityController.add()', 'POST', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"citytrainName\":\"G2\",\"depatureStation\":\"酷酷酷\",\"groupId\":10,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"正在这\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:38:14');
INSERT INTO `sys_oper_log` VALUES (214, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:38:26');
INSERT INTO `sys_oper_log` VALUES (215, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":4,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:40:38');
INSERT INTO `sys_oper_log` VALUES (216, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:43:09');
INSERT INTO `sys_oper_log` VALUES (217, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:44:18');
INSERT INTO `sys_oper_log` VALUES (218, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:46:55');
INSERT INTO `sys_oper_log` VALUES (219, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[],\"usedTrain\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:47:53');
INSERT INTO `sys_oper_log` VALUES (220, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:49:01');
INSERT INTO `sys_oper_log` VALUES (221, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:49:40');
INSERT INTO `sys_oper_log` VALUES (222, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:50:01');
INSERT INTO `sys_oper_log` VALUES (223, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:50:50');
INSERT INTO `sys_oper_log` VALUES (224, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:52:24');
INSERT INTO `sys_oper_log` VALUES (225, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:53:41');
INSERT INTO `sys_oper_log` VALUES (226, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[],\"usedTrain\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:54:03');
INSERT INTO `sys_oper_log` VALUES (227, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:54:17');
INSERT INTO `sys_oper_log` VALUES (228, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[],\"usedTrain\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:55:19');
INSERT INTO `sys_oper_log` VALUES (229, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[],\"usedTrain\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:55:31');
INSERT INTO `sys_oper_log` VALUES (230, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[],\"usedTrain\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:56:35');
INSERT INTO `sys_oper_log` VALUES (231, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":4,\"params\":{},\"trainCityList\":[{\"citytrainId\":3,\"citytrainName\":\"G123\",\"depatureStation\":\"融入\",\"groupId\":4,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"这周\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:56:46');
INSERT INTO `sys_oper_log` VALUES (232, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[],\"usedTrain\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 13:59:13');
INSERT INTO `sys_oper_log` VALUES (233, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"reciveusedTrain\":[\"3\"],\"trainCityList\":[],\"usedTrain\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:25:15');
INSERT INTO `sys_oper_log` VALUES (234, '城际列车管理', 1, 'com.ruoyi.train.controller.TrainCityController.add()', 'POST', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"citytrainName\":\"G123\",\"depatureStation\":\"算是\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"烦烦烦\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:28:37');
INSERT INTO `sys_oper_log` VALUES (235, '城际列车管理', 1, 'com.ruoyi.train.controller.TrainCityController.add()', 'POST', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"citytrainName\":\"G2312\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":2,\"isAvaliable\":false,\"params\":{},\"terminalStation\":\"阿达\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:28:48');
INSERT INTO `sys_oper_log` VALUES (236, '城际列车管理', 1, 'com.ruoyi.train.controller.TrainCityController.add()', 'POST', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:29:03');
INSERT INTO `sys_oper_log` VALUES (237, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":4,\"params\":{},\"reciveusedTrain\":[\"8\"],\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:29:27');
INSERT INTO `sys_oper_log` VALUES (238, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"reciveusedTrain\":[],\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:37:21');
INSERT INTO `sys_oper_log` VALUES (239, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"reciveusedTrain\":[\"9\",\"10\"],\"trainCityList\":[{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"}],\"usedTrain\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'train_city.PRIMARY\'\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainGroupMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_city( citytrain_id, group_id, citytrain_name, depature_station, terminal_station, is_avaliable, trainset_num, arrive_time, leave_time, platform_no, deport_no, citytrain_note) values                  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'train_city.PRIMARY\'\n; Duplicate entry \'10\' for key \'train_city.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'train_city.PRIMARY\'', '2023-03-31 14:38:25');
INSERT INTO `sys_oper_log` VALUES (240, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"reciveusedTrain\":[\"9\",\"10\"],\"trainCityList\":[{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"}],\"usedTrain\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'train_city.PRIMARY\'\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainGroupMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_city( citytrain_id, group_id, citytrain_name, depature_station, terminal_station, is_avaliable, trainset_num, arrive_time, leave_time, platform_no, deport_no, citytrain_note) values                  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'train_city.PRIMARY\'\n; Duplicate entry \'10\' for key \'train_city.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'train_city.PRIMARY\'', '2023-03-31 14:39:10');
INSERT INTO `sys_oper_log` VALUES (241, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"}],\"usedTrain\":\"1\"}', NULL, 1, 'Cannot read the array length because \"<local2>\" is null', '2023-03-31 14:41:19');
INSERT INTO `sys_oper_log` VALUES (242, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"reciveusedTrain\":[\"9\",\"10\"],\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:41:32');
INSERT INTO `sys_oper_log` VALUES (243, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"reciveusedTrain\":[\"9\",\"10\"],\"trainCityList\":[{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"}],\"usedTrain\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'train_city.PRIMARY\'\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainGroupMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_city( citytrain_id, group_id, citytrain_name, depature_station, terminal_station, is_avaliable, trainset_num, arrive_time, leave_time, platform_no, deport_no, citytrain_note) values                  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'train_city.PRIMARY\'\n; Duplicate entry \'10\' for key \'train_city.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'train_city.PRIMARY\'', '2023-03-31 14:42:18');
INSERT INTO `sys_oper_log` VALUES (244, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"reciveusedTrain\":[\"9\",\"10\"],\"trainCityList\":[{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"}],\"usedTrain\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:42:41');
INSERT INTO `sys_oper_log` VALUES (245, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"reciveusedTrain\":[\"9\"],\"trainCityList\":[{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"}],\"usedTrain\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:43:52');
INSERT INTO `sys_oper_log` VALUES (246, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"reciveusedTrain\":[],\"trainCityList\":[{\"citytrainId\":9,\"citytrainName\":\"G2312\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":false,\"params\":{},\"terminalStation\":\"阿达\"},{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"}],\"usedTrain\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:44:06');
INSERT INTO `sys_oper_log` VALUES (247, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":5,\"params\":{},\"reciveusedTrain\":[\"9\",\"10\"],\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:45:08');
INSERT INTO `sys_oper_log` VALUES (248, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":5,\"params\":{},\"reciveusedTrain\":[\"9\",\"10\"],\"trainCityList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:46:54');
INSERT INTO `sys_oper_log` VALUES (249, '城际列车管理', 1, 'com.ruoyi.train.controller.TrainCityController.add()', 'POST', 1, 'admin', NULL, '/train/cityTrain', '127.0.0.1', '内网IP', '{\"citytrainName\":\"G234\",\"depatureStation\":\"嘎嘎\",\"groupId\":23,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"昂贵的\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:59:23');
INSERT INTO `sys_oper_log` VALUES (250, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[],\"usedTrain\":\"1\"}', NULL, 1, 'Cannot read the array length because \"<local2>\" is null', '2023-03-31 15:05:22');
INSERT INTO `sys_oper_log` VALUES (251, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[]}', NULL, 1, 'Cannot read the array length because \"<local2>\" is null', '2023-03-31 15:08:34');
INSERT INTO `sys_oper_log` VALUES (252, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[],\"usedTrain\":\"1\"}', NULL, 1, 'Cannot read the array length because \"<local2>\" is null', '2023-03-31 15:12:29');
INSERT INTO `sys_oper_log` VALUES (253, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"citytrainId\":9,\"citytrainName\":\"G2312\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":false,\"params\":{},\"terminalStation\":\"阿达\"},{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"},{\"citytrainId\":11,\"citytrainName\":\"G234\",\"depatureStation\":\"嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"昂贵的\"}],\"usedTrain\":\"1\"}', NULL, 1, 'Cannot read the array length because \"<local2>\" is null', '2023-03-31 15:18:52');
INSERT INTO `sys_oper_log` VALUES (254, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"citytrainId\":9,\"citytrainName\":\"G2312\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":false,\"params\":{},\"terminalStation\":\"阿达\"},{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"},{\"citytrainId\":11,\"citytrainName\":\"G234\",\"depatureStation\":\"嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"昂贵的\"}],\"usedTrain\":\"1\"}', NULL, 1, 'Cannot read the array length because \"<local2>\" is null', '2023-03-31 15:19:49');
INSERT INTO `sys_oper_log` VALUES (255, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"citytrainId\":9,\"citytrainName\":\"G2312\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":false,\"params\":{},\"terminalStation\":\"阿达\"},{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"},{\"citytrainId\":11,\"citytrainName\":\"G234\",\"depatureStation\":\"嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"昂贵的\"}],\"usedTrain\":\"1\"}', NULL, 1, 'Cannot read the array length because \"<local2>\" is null', '2023-03-31 15:20:18');
INSERT INTO `sys_oper_log` VALUES (256, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"citytrainId\":9,\"citytrainName\":\"G2312\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":false,\"params\":{},\"terminalStation\":\"阿达\"},{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"},{\"citytrainId\":11,\"citytrainName\":\"G234\",\"depatureStation\":\"嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"昂贵的\"}],\"usedTrain\":\"1\"}', NULL, 1, 'Cannot read the array length because \"<local2>\" is null', '2023-03-31 15:21:33');
INSERT INTO `sys_oper_log` VALUES (257, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":3,\"params\":{},\"trainCityList\":[]}', NULL, 1, 'Cannot read the array length because \"<local2>\" is null', '2023-03-31 15:22:40');
INSERT INTO `sys_oper_log` VALUES (258, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"trainCityList\":[{\"citytrainId\":9,\"citytrainName\":\"G2312\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":false,\"params\":{},\"terminalStation\":\"阿达\"},{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"},{\"citytrainId\":11,\"citytrainName\":\"G234\",\"depatureStation\":\"嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"昂贵的\"}],\"usedTrain\":\"1\"}', NULL, 1, 'Cannot read the array length because \"<local2>\" is null', '2023-03-31 15:29:29');
INSERT INTO `sys_oper_log` VALUES (259, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"reciveusedTrain\":[\"G2312\",\"G453\"],\"trainCityList\":[{\"citytrainId\":9,\"citytrainName\":\"G2312\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":false,\"params\":{},\"terminalStation\":\"阿达\"},{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"},{\"citytrainId\":11,\"citytrainName\":\"G234\",\"depatureStation\":\"嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"昂贵的\"}],\"usedTrain\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 15:33:15');
INSERT INTO `sys_oper_log` VALUES (260, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"reciveusedTrain\":[\"G2312\",\"G453\",\"G234\"],\"trainCityList\":[{\"citytrainId\":9,\"citytrainName\":\"G2312\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":false,\"params\":{},\"terminalStation\":\"阿达\"},{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"},{\"citytrainId\":11,\"citytrainName\":\"G234\",\"depatureStation\":\"嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"昂贵的\"}],\"usedTrain\":\"G2312G453G234\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 15:51:11');
INSERT INTO `sys_oper_log` VALUES (261, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"reciveusedTrain\":[\"G2312\",\"G453\"],\"trainCityList\":[{\"citytrainId\":9,\"citytrainName\":\"G2312\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":false,\"params\":{},\"terminalStation\":\"阿达\"},{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"},{\"citytrainId\":11,\"citytrainName\":\"G234\",\"depatureStation\":\"嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"昂贵的\"}],\"usedTrain\":\"G2312G453\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 15:59:41');
INSERT INTO `sys_oper_log` VALUES (262, '交路管理', 2, 'com.ruoyi.train.controller.TrainGroupController.edit()', 'PUT', 1, 'admin', NULL, '/train/trainGroup', '127.0.0.1', '内网IP', '{\"groupAvaliable\":0,\"groupId\":1,\"params\":{},\"reciveusedTrain\":[\"G2312\",\"G453\"],\"trainCityList\":[{\"citytrainId\":9,\"citytrainName\":\"G2312\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":false,\"params\":{},\"terminalStation\":\"阿达\"},{\"citytrainId\":10,\"citytrainName\":\"G453\",\"depatureStation\":\"嘎嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"收到\"},{\"citytrainId\":11,\"citytrainName\":\"G234\",\"depatureStation\":\"嘎嘎\",\"groupId\":1,\"isAvaliable\":true,\"params\":{},\"terminalStation\":\"昂贵的\"}],\"usedTrain\":\"G2312 G453 \"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:00:46');
INSERT INTO `sys_oper_log` VALUES (263, '交路管理', 3, 'com.ruoyi.train.controller.TrainGroupController.remove()', 'DELETE', 1, 'admin', NULL, '/train/trainGroup/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:04:01');
INSERT INTO `sys_oper_log` VALUES (264, '交路管理', 3, 'com.ruoyi.train.controller.TrainGroupController.remove()', 'DELETE', 1, 'admin', NULL, '/train/trainGroup/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:04:07');
INSERT INTO `sys_oper_log` VALUES (265, '交路管理', 3, 'com.ruoyi.train.controller.TrainGroupController.remove()', 'DELETE', 1, 'admin', NULL, '/train/trainGroup/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:04:10');
INSERT INTO `sys_oper_log` VALUES (266, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"train_commond\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:38:34');
INSERT INTO `sys_oper_log` VALUES (267, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"commondTrain\",\"className\":\"TrainCommond\",\"columns\":[{\"capJavaField\":\"CommondId\",\"columnComment\":\"调令id\",\"columnId\":49,\"columnName\":\"commond_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:38:34\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"commondId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CommondName\",\"columnComment\":\"调令名称\",\"columnId\":50,\"columnName\":\"commond_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:38:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"commondName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GroupId\",\"columnComment\":\"调令影响交路\",\"columnId\":51,\"columnName\":\"group_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:38:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"groupId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"调令开始时间\",\"columnId\":52,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:38:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:41:14');
INSERT INTO `sys_oper_log` VALUES (268, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"train_commond\"}', NULL, 0, NULL, '2023-03-31 16:41:23');
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-22 22:07:12\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"车站管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"train\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:41:36');
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/commondTrain/index\",\"createTime\":\"2023-03-31 16:42:07\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"调令管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"commondTrain\",\"perms\":\"train:commondTrain:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:06:43');
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/cityTrain/index\",\"createTime\":\"2023-03-27 20:17:54\",\"icon\":\"swagger\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"城际列车管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"path\":\"cityTrain\",\"perms\":\"train:cityTrain:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:07:02');
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/cityTrain/index\",\"createTime\":\"2023-03-27 20:17:54\",\"icon\":\"swagger\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"城际列车管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"cityTrain\",\"perms\":\"train:cityTrain:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:07:12');
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-22 22:07:12\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"车站管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"train\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:07:20');
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-22 22:07:12\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"车站管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"train\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:07:29');
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/normalTrain/index\",\"createTime\":\"2023-03-22 22:14:57\",\"icon\":\"swagger\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"普速车辆管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"normalTrain\",\"perms\":\"train:normalTrain:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:07:34');
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/hightrain/index\",\"createTime\":\"2023-03-27 14:03:57\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"高铁车辆管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"hightrain\",\"perms\":\"train:hightrain:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:07:45');
INSERT INTO `sys_oper_log` VALUES (277, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"北京铁路局\",\"email\":\"test@163.com\",\"leader\":\"aa\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:08:45');
INSERT INTO `sys_oper_log` VALUES (278, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"天津站\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"北京铁路局\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:09:06');
INSERT INTO `sys_oper_log` VALUES (279, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"天津西站\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"北京铁路局\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:09:14');
INSERT INTO `sys_oper_log` VALUES (280, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"客运车间\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"天津站\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:09:32');
INSERT INTO `sys_oper_log` VALUES (281, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:09:37');
INSERT INTO `sys_oper_log` VALUES (282, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-03-31 17:09:39');
INSERT INTO `sys_oper_log` VALUES (283, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:09:43');
INSERT INTO `sys_oper_log` VALUES (284, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:09:46');
INSERT INTO `sys_oper_log` VALUES (285, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:09:49');
INSERT INTO `sys_oper_log` VALUES (286, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 17:09:51');
INSERT INTO `sys_oper_log` VALUES (287, '调令管理', 1, 'com.ruoyi.train.controller.TrainCommondController.add()', 'POST', 1, 'admin', NULL, '/train/commondTrain', '127.0.0.1', '内网IP', '{\"commondContent\":\"<p>钱钱钱</p>\",\"commondName\":\"1111\",\"params\":{},\"startTime\":\"2023-04-04 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'commond_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainCommondMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainCommondMapper.insertTrainCommond-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_commond          ( commond_name,                          start_time,                                                                              commond_content )           values ( ?,                          ?,                                                                              ? )\r\n### Cause: java.sql.SQLException: Field \'commond_id\' doesn\'t have a default value\n; Field \'commond_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'commond_id\' doesn\'t have a default value', '2023-04-04 10:25:12');
INSERT INTO `sys_oper_log` VALUES (288, '调令管理', 1, 'com.ruoyi.train.controller.TrainCommondController.add()', 'POST', 1, 'admin', NULL, '/train/commondTrain', '127.0.0.1', '内网IP', '{\"commondContent\":\"<p>钱钱钱</p>\",\"commondName\":\"1111\",\"params\":{},\"startTime\":\"2023-04-04 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 10:25:59');
INSERT INTO `sys_oper_log` VALUES (289, '普速调令管理', 1, 'com.ruoyi.train.controller.TrainNormalController.add()', 'POST', 1, 'admin', NULL, '/train/normalTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 11:32:00\",\"depatureStation\":\"hhhh\",\"deportNo\":\"6\",\"isAvaliable\":false,\"isDepature\":false,\"isWaterup\":false,\"leaveTime\":\"1970-01-01 10:33:00\",\"params\":{},\"platformNo\":5,\"presetNum\":10,\"terminalStation\":\"jjjjjj\",\"trainName\":\"rtt\",\"trainsetNum\":10}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'max_dirction\' doesn\'t have a default value\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainNormalMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainNormalMapper.insertTrainNormal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_normal          ( train_name,             depature_station,             is_depature,             terminal_station,             is_avaliable,             trainset_num,             preset_num,             platform_no,             deport_no,                          arrive_time,             leave_time,                          is_waterup )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'max_dirction\' doesn\'t have a default value\n; Field \'max_dirction\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'max_dirction\' doesn\'t have a default value', '2023-04-04 10:33:24');
INSERT INTO `sys_oper_log` VALUES (290, '普速调令管理', 1, 'com.ruoyi.train.controller.TrainNormalController.add()', 'POST', 1, 'admin', NULL, '/train/normalTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 11:32:00\",\"depatureStation\":\"hhhh\",\"deportNo\":\"6\",\"isAvaliable\":false,\"isDepature\":false,\"isWaterup\":false,\"leaveTime\":\"1970-01-01 10:33:00\",\"params\":{},\"platformNo\":5,\"presetNum\":10,\"terminalStation\":\"jjjjjj\",\"trainName\":\"rtt\",\"trainsetNum\":10}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'max_dirction\' doesn\'t have a default value\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainNormalMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainNormalMapper.insertTrainNormal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_normal          ( train_name,             depature_station,             is_depature,             terminal_station,             is_avaliable,             trainset_num,             preset_num,             platform_no,             deport_no,                          arrive_time,             leave_time,                          is_waterup )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'max_dirction\' doesn\'t have a default value\n; Field \'max_dirction\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'max_dirction\' doesn\'t have a default value', '2023-04-04 10:33:29');
INSERT INTO `sys_oper_log` VALUES (291, '普速调令管理', 1, 'com.ruoyi.train.controller.TrainNormalController.add()', 'POST', 1, 'admin', NULL, '/train/normalTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 11:32:00\",\"depatureStation\":\"hhhh\",\"deportNo\":\"6\",\"isAvaliable\":false,\"isDepature\":false,\"isWaterup\":false,\"leaveTime\":\"1970-01-01 10:33:00\",\"maxDirction\":\"东\",\"params\":{},\"platformNo\":5,\"presetNum\":10,\"terminalStation\":\"jjjjjj\",\"trainName\":\"rtt\",\"trainsetNum\":10}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'stay_time\' doesn\'t have a default value\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainNormalMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainNormalMapper.insertTrainNormal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_normal          ( train_name,             depature_station,             is_depature,             terminal_station,             is_avaliable,             trainset_num,             preset_num,             platform_no,             deport_no,             max_dirction,             arrive_time,             leave_time,                          is_waterup )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'stay_time\' doesn\'t have a default value\n; Field \'stay_time\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'stay_time\' doesn\'t have a default value', '2023-04-04 10:33:39');
INSERT INTO `sys_oper_log` VALUES (292, '普速调令管理', 1, 'com.ruoyi.train.controller.TrainNormalController.add()', 'POST', 1, 'admin', NULL, '/train/normalTrain', '127.0.0.1', '内网IP', '{\"arriveTime\":\"1970-01-01 11:32:00\",\"depatureStation\":\"hhhh\",\"deportNo\":\"6\",\"isAvaliable\":false,\"isDepature\":false,\"isWaterup\":false,\"leaveTime\":\"1970-01-01 12:33:00\",\"maxDirction\":\"东\",\"params\":{},\"platformNo\":5,\"presetNum\":10,\"stayTime\":\"3\",\"terminalStation\":\"jjjjjj\",\"trainName\":\"rtt\",\"trainsetNum\":10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 10:34:25');
INSERT INTO `sys_oper_log` VALUES (293, '调令管理', 1, 'com.ruoyi.train.controller.TrainCommondController.add()', 'POST', 1, 'admin', NULL, '/train/commondTrain', '127.0.0.1', '内网IP', '{\"commondName\":\"222\",\"commondType\":0,\"commondUser\":\"admin\",\"endTime\":\"2023-04-29 00:00:00\",\"params\":{},\"shiftDay\":0,\"startTime\":\"2023-04-27 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'commond_content\' doesn\'t have a default value\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainCommondMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainCommondMapper.insertTrainCommond-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_commond          ( commond_name,             commond_user,                          start_time,             end_time )           values ( ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'commond_content\' doesn\'t have a default value\n; Field \'commond_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'commond_content\' doesn\'t have a default value', '2023-04-10 22:45:38');
INSERT INTO `sys_oper_log` VALUES (294, '调令管理', 1, 'com.ruoyi.train.controller.TrainCommondController.add()', 'POST', 1, 'admin', NULL, '/train/commondTrain', '127.0.0.1', '内网IP', '{\"commondName\":\"222\",\"commondType\":0,\"commondUser\":\"admin\",\"endTime\":\"2023-04-29 00:00:00\",\"params\":{},\"shiftDay\":0,\"startTime\":\"2023-04-27 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'commond_content\' doesn\'t have a default value\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainCommondMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainCommondMapper.insertTrainCommond-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_commond          ( commond_name,             commond_user,                          start_time,             end_time )           values ( ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'commond_content\' doesn\'t have a default value\n; Field \'commond_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'commond_content\' doesn\'t have a default value', '2023-04-10 22:46:38');
INSERT INTO `sys_oper_log` VALUES (295, '调令管理', 1, 'com.ruoyi.train.controller.TrainCommondController.add()', 'POST', 1, 'admin', NULL, '/train/commondTrain', '127.0.0.1', '内网IP', '{\"commondName\":\"222\",\"commondType\":0,\"commondUser\":\"admin\",\"endTime\":\"2023-04-29 00:00:00\",\"params\":{},\"shiftDay\":0,\"startTime\":\"2023-04-27 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'commond_content\' doesn\'t have a default value\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainCommondMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainCommondMapper.insertTrainCommond-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_commond          ( commond_name,             commond_user,                          start_time,             end_time )           values ( ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'commond_content\' doesn\'t have a default value\n; Field \'commond_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'commond_content\' doesn\'t have a default value', '2023-04-10 22:46:56');
INSERT INTO `sys_oper_log` VALUES (296, '调令管理', 1, 'com.ruoyi.train.controller.TrainCommondController.add()', 'POST', 1, 'admin', NULL, '/train/commondTrain', '127.0.0.1', '内网IP', '{\"commondContent\":\"<p>aaaa</p>\",\"commondName\":\"222\",\"commondType\":0,\"commondUser\":\"admin\",\"endTime\":\"2023-04-29 00:00:00\",\"params\":{},\"shiftDay\":0,\"startTime\":\"2023-04-27 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'commond_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainCommondMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainCommondMapper.insertTrainCommond-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_commond          ( commond_name,             commond_user,                          start_time,             end_time,                                                                 commond_content )           values ( ?,             ?,                          ?,             ?,                                                                 ? )\r\n### Cause: java.sql.SQLException: Field \'commond_type\' doesn\'t have a default value\n; Field \'commond_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'commond_type\' doesn\'t have a default value', '2023-04-10 22:47:08');
INSERT INTO `sys_oper_log` VALUES (297, '调令管理', 1, 'com.ruoyi.train.controller.TrainCommondController.add()', 'POST', 1, 'admin', NULL, '/train/commondTrain', '127.0.0.1', '内网IP', '{\"commondContent\":\"<p>aaaa</p>\",\"commondName\":\"222\",\"commondType\":0,\"commondUser\":\"admin\",\"endTime\":\"2023-04-29 00:00:00\",\"params\":{},\"shiftDay\":0,\"startTime\":\"2023-04-27 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'commond_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainCommondMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainCommondMapper.insertTrainCommond-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_commond          ( commond_name,             commond_user,                          start_time,             end_time,                                                                 commond_content )           values ( ?,             ?,                          ?,             ?,                                                                 ? )\r\n### Cause: java.sql.SQLException: Field \'commond_type\' doesn\'t have a default value\n; Field \'commond_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'commond_type\' doesn\'t have a default value', '2023-04-10 22:48:17');
INSERT INTO `sys_oper_log` VALUES (298, '调令管理', 1, 'com.ruoyi.train.controller.TrainCommondController.add()', 'POST', 1, 'admin', NULL, '/train/commondTrain', '127.0.0.1', '内网IP', '{\"commondContent\":\"<p>aaaa</p>\",\"commondName\":\"222\",\"commondType\":0,\"commondUser\":\"admin\",\"endTime\":\"2023-04-29 00:00:00\",\"params\":{},\"shiftDay\":0,\"startTime\":\"2023-04-27 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-10 22:49:31');
INSERT INTO `sys_oper_log` VALUES (299, '调令管理', 1, 'com.ruoyi.train.controller.TrainCommondController.add()', 'POST', 1, 'admin', NULL, '/train/commondTrain', '127.0.0.1', '内网IP', '{\"commondAffectTrainId\":\"389,390,391\",\"commondName\":\"333\",\"commondType\":1,\"commondUser\":\"admin\",\"isWeekStop\":3,\"params\":{},\"shiftDay\":0,\"trainStartDay\":\"2023-06-10 00:00:00\",\"trainType\":0}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'trainStartday\' in \'class com.ruoyi.train.domain.TrainCommond\'', '2023-05-02 22:57:55');
INSERT INTO `sys_oper_log` VALUES (300, '调令管理', 1, 'com.ruoyi.train.controller.TrainCommondController.add()', 'POST', 1, 'admin', NULL, '/train/commondTrain', '127.0.0.1', '内网IP', '{\"commondAffectTrainId\":\"389,390,391\",\"commondName\":\"333\",\"commondType\":1,\"commondUser\":\"admin\",\"isWeekStop\":3,\"params\":{},\"shiftDay\":0,\"trainStartDay\":\"2023-06-10 00:00:00\",\"trainType\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'= \'333\',\n            \n            \n            commond_type = 1\n            trai\' at line 2\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainCommondMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainCommondMapper.insertTrainCommond-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_commond          ( commond_name = ?,                                       commond_type = ?             train_type = ?             commond_affect_train_id = ?,                                       commond_user = ?,             is_weekstop = ?,                                       shift_day = ?,             train_startday = ? )           values ( commond_name = ?,                                       commond_type = ?             train_type = ?             commond_affect_train_id = ?,                                       commond_user = ?,             is_weekstop = ?,                                       shift_day = ?,             train_startday = ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'= \'333\',\n            \n            \n            commond_type = 1\n            trai\' at line 2\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'= \'333\',\n            \n            \n            commond_type = 1\n            trai\' at line 2', '2023-05-02 23:08:00');
INSERT INTO `sys_oper_log` VALUES (301, '调令管理', 1, 'com.ruoyi.train.controller.TrainCommondController.add()', 'POST', 1, 'admin', NULL, '/train/commondTrain', '127.0.0.1', '内网IP', '{\"commondAffectTrainId\":\"388,389,390\",\"commondName\":\"33\",\"commondType\":1,\"commondUser\":\"admin\",\"isWeekStop\":3,\"params\":{},\"shiftDay\":0,\"trainStartDay\":\"2023-06-10 00:00:00\",\"trainType\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'}\n            commond_affect_train_id,\n            \n            \n            com\' at line 6\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainCommondMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainCommondMapper.insertTrainCommond-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_commond          ( commond_name,                                       commond_type,             train_type,}             commond_affect_train_id,                                       commond_user,             is_weekstop,                                       shift_day,             train_startday )           values ( ?,                                        ?              ?              ?,                                        ?,              ?,                                        ?,              ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'}\n            commond_affect_train_id,\n            \n            \n            com\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'}\n            commond_affect_train_id,\n            \n            \n            com\' at line 6', '2023-05-02 23:48:50');
INSERT INTO `sys_oper_log` VALUES (302, '调令管理', 1, 'com.ruoyi.train.controller.TrainCommondController.add()', 'POST', 1, 'admin', NULL, '/train/commondTrain', '127.0.0.1', '内网IP', '{\"commondAffectTrainId\":\"388,389,390\",\"commondName\":\"33\",\"commondType\":1,\"commondUser\":\"admin\",\"isWeekStop\":3,\"params\":{},\"shiftDay\":0,\"trainStartDay\":\"2023-06-10 00:00:00\",\"trainType\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'}\n            commond_affect_train_id,\n            \n            \n            com\' at line 6\r\n### The error may exist in file [C:\\workplace\\RuoYi-Vue-master\\train\\target\\classes\\mapper\\train\\TrainCommondMapper.xml]\r\n### The error may involve com.ruoyi.train.mapper.TrainCommondMapper.insertTrainCommond-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into train_commond          ( commond_name,                                       commond_type,             train_type,}             commond_affect_train_id,                                       commond_user,             is_weekstop,                                       shift_day,             train_startday )           values ( ?,                                        ?,              ?,              ?,                                        ?,              ?,                                        ?,              ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'}\n            commond_affect_train_id,\n            \n            \n            com\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'}\n            commond_affect_train_id,\n            \n            \n            com\' at line 6', '2023-05-02 23:51:12');
INSERT INTO `sys_oper_log` VALUES (303, '调令管理', 1, 'com.ruoyi.train.controller.TrainCommondController.add()', 'POST', 1, 'admin', NULL, '/train/commondTrain', '127.0.0.1', '内网IP', '{\"commondAffectTrainId\":\"388,389,390\",\"commondName\":\"33\",\"commondType\":1,\"commondUser\":\"admin\",\"isWeekStop\":3,\"params\":{},\"shiftDay\":0,\"trainStartDay\":\"2023-06-10 00:00:00\",\"trainType\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-02 23:52:18');
INSERT INTO `sys_oper_log` VALUES (304, '交路管理', 3, 'com.ruoyi.train.controller.TrainGroupController.remove()', 'DELETE', 1, 'admin', NULL, '/train/trainGroup/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-08 21:39:31');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-12-05 13:20:50', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-12-05 13:20:50', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-12-05 13:20:50', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-06-08 21:13:54', 'admin', '2022-12-05 13:20:50', '', '2023-06-08 21:13:53', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-12-05 13:20:50', 'admin', '2022-12-05 13:20:50', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for train_city
-- ----------------------------
DROP TABLE IF EXISTS `train_city`;
CREATE TABLE `train_city`  (
  `train_id` int NOT NULL AUTO_INCREMENT COMMENT '城际列车ID',
  `group_id` int NOT NULL COMMENT '交路ID',
  `train_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '城际列车号',
  `depature_station` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '始发站',
  `terminal_station` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '终到站',
  `is_avaliable` int NOT NULL COMMENT '是否开行',
  `trainset_num` int NULL DEFAULT NULL COMMENT '编组数量',
  `arrive_time` datetime NULL DEFAULT NULL COMMENT '到站时间',
  `leave_time` datetime NULL DEFAULT NULL COMMENT '开车时间',
  `platform_no` int NULL DEFAULT NULL COMMENT '站台号',
  `deport_no` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检票口',
  `citytrain_note` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `is_week` int NULL DEFAULT NULL,
  `week_day` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_startday` date NULL DEFAULT NULL,
  `order_endday` date NULL DEFAULT NULL,
  PRIMARY KEY (`train_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train_city
-- ----------------------------

-- ----------------------------
-- Table structure for train_commond
-- ----------------------------
DROP TABLE IF EXISTS `train_commond`;
CREATE TABLE `train_commond`  (
  `commond_id` int NOT NULL AUTO_INCREMENT COMMENT '调令id',
  `commond_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调令名称',
  `start_time` datetime NULL DEFAULT NULL COMMENT '调令开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '调令结束时间',
  `commond_type` int NULL DEFAULT NULL COMMENT '调令种类',
  `train_type` int NULL DEFAULT NULL COMMENT '调令影响车次种类',
  `commond_affect_train_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '调令影响车次/调令id',
  `commond_affect_train_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '调令影响车次/调令名称',
  `commond_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '调令具体内容',
  `commond_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调令填写人',
  `is_weekstop` int NULL DEFAULT NULL COMMENT '是否按照星期停开',
  `stop_week` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '调令停开星期数',
  `stop_days` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '调令停开天数',
  `shift_day` int NULL DEFAULT NULL COMMENT '调令偏移天',
  `train_startday` date NULL DEFAULT NULL COMMENT '调令车次生效日期',
  `train_stopday` date NULL DEFAULT NULL COMMENT '调令车次失效日期',
  PRIMARY KEY (`commond_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train_commond
-- ----------------------------
INSERT INTO `train_commond` VALUES (1, '1111', '2023-04-04 00:00:00', NULL, 1, 2, NULL, '', '<p>钱钱钱</p>', '', NULL, NULL, NULL, 1, '2023-03-19', '2023-05-25');
INSERT INTO `train_commond` VALUES (2, '222', '2023-04-27 00:00:00', '2023-04-29 00:00:00', 2, 3, NULL, '2', '<p>aaaa</p>', 'admin', NULL, NULL, NULL, 3, '2022-12-26', '2023-04-19');
INSERT INTO `train_commond` VALUES (3, '33', NULL, NULL, 1, 0, '388,389,390', NULL, NULL, 'admin', 3, NULL, NULL, 0, '2023-06-10', NULL);

-- ----------------------------
-- Table structure for train_group
-- ----------------------------
DROP TABLE IF EXISTS `train_group`;
CREATE TABLE `train_group`  (
  `group_id` int NOT NULL AUTO_INCREMENT COMMENT '交路ID',
  `group_avaliable` int NOT NULL COMMENT '交路是否使用',
  `used_train` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交路运行车辆',
  `free_train` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交路空闲车辆',
  `group_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '交路描述',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train_group
-- ----------------------------

-- ----------------------------
-- Table structure for train_high
-- ----------------------------
DROP TABLE IF EXISTS `train_high`;
CREATE TABLE `train_high`  (
  `train_id` int NOT NULL AUTO_INCREMENT COMMENT '高铁ID',
  `train_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '高铁车号',
  `depature_station` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '始发站',
  `is_depature` int NOT NULL COMMENT '是否始发车',
  `terminal_station` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '终到站',
  `is_avaliable` int NOT NULL COMMENT '是否开行',
  `arrive_time` datetime NOT NULL COMMENT '到站时间',
  `leave_time` datetime NOT NULL COMMENT '开车时间',
  `trainset_num` int NULL DEFAULT NULL COMMENT '图定编组数量',
  `platform_no` int NULL DEFAULT NULL COMMENT '站台数量',
  `deport_no` int NULL DEFAULT NULL COMMENT '检票口号',
  `couple_id` int NULL DEFAULT NULL COMMENT '折返车次ID',
  `couple_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '折返车号',
  PRIMARY KEY (`train_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train_high
-- ----------------------------
INSERT INTO `train_high` VALUES (1, 'G1391', '天津', 1, '蓟县', 0, '1970-01-01 14:41:00', '1970-01-01 15:41:00', 8, 6, 7, NULL, NULL);

-- ----------------------------
-- Table structure for train_normal
-- ----------------------------
DROP TABLE IF EXISTS `train_normal`;
CREATE TABLE `train_normal`  (
  `train_id` int NOT NULL AUTO_INCREMENT COMMENT '普速车ID',
  `train_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '普速车车号',
  `depature_station` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '始发站',
  `is_depature` int NULL DEFAULT NULL COMMENT '是否始发',
  `terminal_station` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '终到站',
  `is_avaliable` int NULL DEFAULT NULL COMMENT '是否开行',
  `trainset_num` int NULL DEFAULT NULL COMMENT '图定编组数量',
  `preset_num` int NULL DEFAULT NULL COMMENT '现编组数量',
  `platform_no` int NULL DEFAULT NULL COMMENT '站台号',
  `deport_no` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检票口号',
  `max_dirction` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最大车号方向',
  `arrive_time` datetime NULL DEFAULT NULL COMMENT '到站时间',
  `leave_time` datetime NULL DEFAULT NULL COMMENT '开车时间',
  `stay_time` int NULL DEFAULT NULL COMMENT '停车时间',
  `is_waterup` int NULL DEFAULT NULL COMMENT '是否上水',
  `coupe_id` int NULL DEFAULT NULL COMMENT '折返ID',
  `coupe_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '折返车号',
  `coupe_day` datetime NULL DEFAULT NULL COMMENT '折返时间',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '补充说明',
  `check_time` datetime NULL DEFAULT NULL COMMENT '检票时间',
  PRIMARY KEY (`train_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 516 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train_normal
-- ----------------------------
INSERT INTO `train_normal` VALUES (388, 'K294/5', '济南', NULL, '齐齐哈尔', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 00:15:00', '2023-04-11 00:23:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 00:13:00');
INSERT INTO `train_normal` VALUES (389, 'K928', '海拉尔', NULL, '郑州', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 00:19:00', '2023-04-11 00:27:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 00:17:00');
INSERT INTO `train_normal` VALUES (390, 'K2388', '长春', NULL, '南宁', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 00:29:00', '2023-04-11 00:36:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 00:26:00');
INSERT INTO `train_normal` VALUES (391, 'K518/5', '吉林', NULL, '上海', NULL, NULL, NULL, 1, NULL, NULL, '2023-04-11 00:35:00', '2023-04-11 00:43:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 00:33:00');
INSERT INTO `train_normal` VALUES (392, 'K19', '北京', NULL, '满洲里', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 00:35:00', '2023-04-11 00:41:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 00:31:00');
INSERT INTO `train_normal` VALUES (393, 'Z194', '沈阳北', NULL, '太原', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 00:42:00', '2023-04-11 00:49:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 00:39:00');
INSERT INTO `train_normal` VALUES (394, 'Z368/5', '哈尔滨西', NULL, '南京', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 00:48:00', '2023-04-11 00:55:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 00:45:00');
INSERT INTO `train_normal` VALUES (395, 'Z102', '长春', NULL, '厦门北', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 01:07:00', '2023-04-11 01:15:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 01:05:00');
INSERT INTO `train_normal` VALUES (396, 'Z174/1', '哈尔滨西', NULL, '上海', NULL, NULL, NULL, 1, NULL, NULL, '2023-04-11 01:13:00', '2023-04-11 01:21:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 01:11:00');
INSERT INTO `train_normal` VALUES (397, 'K1984/5', '南通', NULL, '吉林', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 01:21:00', '2023-04-11 01:32:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 01:21:00');
INSERT INTO `train_normal` VALUES (398, '1230/27', '阜新南', NULL, '上海', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 01:29:00', '2023-04-11 01:38:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 01:28:00');
INSERT INTO `train_normal` VALUES (399, 'K1450/1', '烟台', NULL, '牡丹江', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 01:37:00', '2023-04-11 01:51:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 01:37:00');
INSERT INTO `train_normal` VALUES (400, 'K1572', '吉林', NULL, '西安', NULL, NULL, NULL, 1, NULL, NULL, '2023-04-11 01:38:00', '2023-04-11 01:45:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 01:35:00');
INSERT INTO `train_normal` VALUES (401, 'K128', '长春', NULL, '西安', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 01:45:00', '2023-04-11 01:53:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 01:43:00');
INSERT INTO `train_normal` VALUES (402, 'Z383', '海口', NULL, '长春', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 01:45:00', '2023-04-11 02:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 01:45:00');
INSERT INTO `train_normal` VALUES (403, 'K1528', '绥化', NULL, '邯郸', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 01:51:00', '2023-04-11 02:21:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 01:51:00');
INSERT INTO `train_normal` VALUES (404, 'K718', '大连', NULL, '石家庄北', NULL, NULL, NULL, 1, NULL, NULL, '2023-04-11 01:57:00', '2023-04-11 02:03:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 01:53:00');
INSERT INTO `train_normal` VALUES (405, 'K980', '齐齐哈尔', NULL, '西宁', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 02:04:00', '2023-04-11 02:14:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 02:04:00');
INSERT INTO `train_normal` VALUES (406, 'K7728', '秦皇岛', NULL, '邯郸', NULL, NULL, NULL, 1, NULL, NULL, '2023-04-11 02:11:00', '2023-04-11 02:31:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 02:11:00');
INSERT INTO `train_normal` VALUES (407, 'K927', '郑州', NULL, '海拉尔', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 02:21:00', '2023-04-11 02:32:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 02:21:00');
INSERT INTO `train_normal` VALUES (408, 'T244/1', '齐齐哈尔', NULL, '合肥', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 02:32:00', '2023-04-11 02:41:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 02:31:00');
INSERT INTO `train_normal` VALUES (409, 'K7727', '邯郸', NULL, '秦皇岛', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 02:33:00', '2023-04-11 02:39:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 02:29:00');
INSERT INTO `train_normal` VALUES (410, 'K388', '沈阳北', NULL, '成都西', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 02:40:00', '2023-04-11 02:47:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 02:37:00');
INSERT INTO `train_normal` VALUES (411, 'Z384', '长春', NULL, '海口', NULL, NULL, NULL, 1, NULL, NULL, '2023-04-11 02:47:00', '2023-04-11 02:55:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 02:45:00');
INSERT INTO `train_normal` VALUES (412, 'K956/7', '青岛北', NULL, '白城', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 02:50:00', '2023-04-11 03:04:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 02:50:00');
INSERT INTO `train_normal` VALUES (413, 'T368', '大连', NULL, '广州', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 02:54:00', '2023-04-11 03:01:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 02:51:00');
INSERT INTO `train_normal` VALUES (414, 'Z188', '沈阳北', NULL, '深圳东', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 03:00:00', '2023-04-11 03:12:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 03:00:00');
INSERT INTO `train_normal` VALUES (415, 'Z366/7', '南京', NULL, '哈尔滨西', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 03:03:00', '2023-04-11 03:11:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 03:01:00');
INSERT INTO `train_normal` VALUES (416, 'Z193', '太原', NULL, '沈阳北', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 03:25:00', '2023-04-11 03:32:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 03:22:00');
INSERT INTO `train_normal` VALUES (417, 'Z101', '厦门北', NULL, '长春', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 03:34:00', '2023-04-11 03:40:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 03:30:00');
INSERT INTO `train_normal` VALUES (418, 'K516/7', '上海', NULL, '吉林', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 03:42:00', '2023-04-11 03:50:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 03:40:00');
INSERT INTO `train_normal` VALUES (419, 'T242/3', '合肥', NULL, '齐齐哈尔', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 03:51:00', '2023-04-11 03:57:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 03:47:00');
INSERT INTO `train_normal` VALUES (420, 'K20', '满洲里', NULL, '北京', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 03:52:00', '2023-04-11 03:59:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 03:49:00');
INSERT INTO `train_normal` VALUES (421, 'T183', '武昌', NULL, '哈尔滨', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 03:58:00', '2023-04-11 04:09:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 03:58:00');
INSERT INTO `train_normal` VALUES (422, 'K1986/3', '吉林', NULL, '南通', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 04:00:00', '2023-04-11 04:32:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 04:00:00');
INSERT INTO `train_normal` VALUES (423, 'K702/3', '青岛北', NULL, '哈尔滨西', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 04:05:00', '2023-04-11 04:16:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 04:05:00');
INSERT INTO `train_normal` VALUES (424, 'K1054/5', '青岛北', NULL, '吉林', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 04:16:00', '2023-04-11 04:26:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 04:16:00');
INSERT INTO `train_normal` VALUES (425, 'Z176/7', '杭州', NULL, '哈尔滨西', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 04:23:00', '2023-04-11 04:33:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 04:23:00');
INSERT INTO `train_normal` VALUES (426, 'Z80', '大连', NULL, '北京', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 04:41:00', '2023-04-11 04:44:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 04:34:00');
INSERT INTO `train_normal` VALUES (427, 'T132/3', '上海', NULL, '大连', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 05:06:00', '2023-04-11 05:12:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 05:02:00');
INSERT INTO `train_normal` VALUES (428, 'K1056/3', '吉林', NULL, '青岛北', NULL, NULL, NULL, 1, NULL, NULL, '2023-04-11 05:16:00', '2023-04-11 05:22:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 05:12:00');
INSERT INTO `train_normal` VALUES (429, 'K1392/3', '烟台', NULL, '佳木斯', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 05:18:00', '2023-04-11 05:31:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 05:18:00');
INSERT INTO `train_normal` VALUES (430, 'K704/1', '哈尔滨西', NULL, '青岛北', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 05:26:00', '2023-04-11 05:34:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 05:24:00');
INSERT INTO `train_normal` VALUES (431, 'K1061', '重庆北', NULL, '哈尔滨西', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 05:28:00', '2023-04-11 05:41:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 05:28:00');
INSERT INTO `train_normal` VALUES (432, 'K866/7', '运城', NULL, '秦皇岛', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 05:40:00', '2023-04-11 05:48:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 05:38:00');
INSERT INTO `train_normal` VALUES (433, 'K958/5', '白城', NULL, '青岛北', NULL, NULL, NULL, 1, NULL, NULL, '2023-04-11 05:42:00', '2023-04-11 05:50:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 05:40:00');
INSERT INTO `train_normal` VALUES (434, 'K258', '峨眉', NULL, '天津', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 05:50:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `train_normal` VALUES (435, 'K346/7', '沈阳北', NULL, '温州', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 05:54:00', '2023-04-11 06:04:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 05:54:00');
INSERT INTO `train_normal` VALUES (436, 'Z113', '海口', NULL, '哈尔滨西', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 05:57:00', '2023-04-11 06:03:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 05:53:00');
INSERT INTO `train_normal` VALUES (437, 'K554/1', '佳木斯', NULL, '温州', NULL, NULL, NULL, 1, NULL, NULL, '2023-04-11 06:06:00', '2023-04-11 06:14:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 06:04:00');
INSERT INTO `train_normal` VALUES (438, 'K972/69', '通化', NULL, '青岛北', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 06:13:00', '2023-04-11 06:41:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 06:13:00');
INSERT INTO `train_normal` VALUES (439, 'K331', '洛阳', NULL, '天津', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 06:14:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `train_normal` VALUES (440, 'K28', '丹东', NULL, '北京', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 06:49:00', '2023-04-11 06:55:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 06:45:00');
INSERT INTO `train_normal` VALUES (441, 'K5203', '天津', NULL, '潞城', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-04-11 07:01:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 06:31:00');
INSERT INTO `train_normal` VALUES (442, 'K214', '西安', NULL, '天津', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 07:01:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `train_normal` VALUES (443, '2601', '大同', NULL, '秦皇岛', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 06:52:00', '2023-04-11 07:01:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 06:51:00');
INSERT INTO `train_normal` VALUES (444, 'S902', '天津', NULL, '蓟州北', NULL, NULL, NULL, 3, NULL, NULL, NULL, '2023-04-11 07:27:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 06:57:00');
INSERT INTO `train_normal` VALUES (445, 'Z173', '上海', NULL, '哈尔滨西', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 07:21:00', '2023-04-11 07:27:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 07:17:00');
INSERT INTO `train_normal` VALUES (446, 'K976', '哈尔滨西', NULL, '襄阳', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 07:43:00', '2023-04-11 07:51:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 07:41:00');
INSERT INTO `train_normal` VALUES (447, 'Z238', '哈尔滨西', NULL, '广州东', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 07:50:00', '2023-04-11 07:58:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 07:48:00');
INSERT INTO `train_normal` VALUES (448, 'T122', '长春', NULL, '广州', NULL, NULL, NULL, 1, NULL, NULL, '2023-04-11 08:01:00', '2023-04-11 08:24:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 08:01:00');
INSERT INTO `train_normal` VALUES (449, 'K1062', '哈尔滨西', NULL, '重庆北', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 08:19:00', '2023-04-11 08:37:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 08:19:00');
INSERT INTO `train_normal` VALUES (450, 'K2288', '长春', NULL, '昆明', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 08:34:00', '2023-04-11 08:57:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 08:34:00');
INSERT INTO `train_normal` VALUES (451, 'K940', '牡丹江', NULL, '石家庄', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 08:57:00', '2023-04-11 09:20:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 08:57:00');
INSERT INTO `train_normal` VALUES (452, 'S904', '天津', NULL, '蓟州北', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-04-11 09:27:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 08:57:00');
INSERT INTO `train_normal` VALUES (453, 'K1534', '乌兰浩特', NULL, '天津', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 10:50:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `train_normal` VALUES (454, 'K338/5', '长春', NULL, '宁波', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 11:20:00', '2023-04-11 11:30:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 11:15:00');
INSERT INTO `train_normal` VALUES (455, 'Z205', '长沙', NULL, '天津', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 11:15:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `train_normal` VALUES (456, 'K548', '哈尔滨西', NULL, '成都西', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 11:34:00', '2023-04-11 12:04:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 11:34:00');
INSERT INTO `train_normal` VALUES (457, 'Z178/5', '哈尔滨西', NULL, '杭州', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 11:45:00', '2023-04-11 11:53:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 11:43:00');
INSERT INTO `train_normal` VALUES (458, 'K2047', '西安', NULL, '沈阳北', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 11:56:00', '2023-04-11 12:06:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 11:56:00');
INSERT INTO `train_normal` VALUES (459, 'K1533', '天津', NULL, '乌兰浩特', NULL, NULL, NULL, 4, NULL, NULL, NULL, '2023-04-11 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 11:30:00');
INSERT INTO `train_normal` VALUES (460, 'K50/47', '齐齐哈尔', NULL, '杭州', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 12:04:00', '2023-04-11 12:19:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 12:04:00');
INSERT INTO `train_normal` VALUES (461, 'K188/9', '上海', NULL, '沈阳北', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 12:09:00', '2023-04-11 12:15:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 12:05:00');
INSERT INTO `train_normal` VALUES (462, 'T252', '天津', NULL, '广州', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-04-11 12:33:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 12:03:00');
INSERT INTO `train_normal` VALUES (463, 'K48/9', '杭州', NULL, '齐齐哈尔', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 12:52:00', '2023-04-11 13:02:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 12:52:00');
INSERT INTO `train_normal` VALUES (464, 'T57', '宝鸡', NULL, '天津', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 12:58:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `train_normal` VALUES (465, 'K296/3', '齐齐哈尔', NULL, '济南', NULL, NULL, NULL, 1, NULL, NULL, '2023-04-11 13:06:00', '2023-04-11 13:14:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 13:04:00');
INSERT INTO `train_normal` VALUES (466, 'K728', '牡丹江', NULL, '广州东', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 13:19:00', '2023-04-11 13:27:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 13:17:00');
INSERT INTO `train_normal` VALUES (467, 'K568', '齐齐哈尔', NULL, '东莞东', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 13:43:00', '2023-04-11 13:58:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 13:43:00');
INSERT INTO `train_normal` VALUES (468, 'T58', '天津', NULL, '宝鸡', NULL, NULL, NULL, 2, NULL, NULL, NULL, '2023-04-11 14:04:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 13:34:00');
INSERT INTO `train_normal` VALUES (469, 'K887', '兰州西', NULL, '天津', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 14:12:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `train_normal` VALUES (470, 'K213', '天津', NULL, '西安', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-04-11 14:33:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 14:03:00');
INSERT INTO `train_normal` VALUES (471, 'K567', '东莞东', NULL, '齐齐哈尔', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 14:28:00', '2023-04-11 14:36:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 14:26:00');
INSERT INTO `train_normal` VALUES (472, 'Z12', '沈阳北', NULL, '广州东', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 14:30:00', '2023-04-11 14:43:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 14:30:00');
INSERT INTO `train_normal` VALUES (473, 'K336/7', '宁波', NULL, '长春', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 14:36:00', '2023-04-11 14:42:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 14:32:00');
INSERT INTO `train_normal` VALUES (474, 'K975', '襄阳', NULL, '哈尔滨西', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 14:46:00', '2023-04-11 14:54:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 14:44:00');
INSERT INTO `train_normal` VALUES (475, '1228/9', '上海', NULL, '阜新南', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 14:59:00', '2023-04-11 15:06:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 14:56:00');
INSERT INTO `train_normal` VALUES (476, 'K2387', '南宁', NULL, '长春', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 15:15:00', '2023-04-11 15:23:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 15:13:00');
INSERT INTO `train_normal` VALUES (477, 'K1621', '深圳东', NULL, '天津', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 15:33:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `train_normal` VALUES (478, 'K552/3', '温州', NULL, '佳木斯', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 15:42:00', '2023-04-11 15:48:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 15:38:00');
INSERT INTO `train_normal` VALUES (479, 'Z11', '广州东', NULL, '沈阳北', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 15:57:00', '2023-04-11 16:03:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 15:53:00');
INSERT INTO `train_normal` VALUES (480, 'K257', '天津', NULL, '峨眉', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-04-11 16:22:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 15:52:00');
INSERT INTO `train_normal` VALUES (481, 'T367', '广州', NULL, '大连', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 16:27:00', '2023-04-11 16:37:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 16:27:00');
INSERT INTO `train_normal` VALUES (482, 'K127', '西安', NULL, '长春', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 16:46:00', '2023-04-11 16:54:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 16:44:00');
INSERT INTO `train_normal` VALUES (483, 'K2287', '昆明', NULL, '长春', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 17:04:00', '2023-04-11 17:10:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 17:00:00');
INSERT INTO `train_normal` VALUES (484, 'K547', '成都西', NULL, '哈尔滨西', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 17:29:00', '2023-04-11 17:59:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 17:29:00');
INSERT INTO `train_normal` VALUES (485, 'K1527', '邯郸', NULL, '绥化', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 17:47:00', '2023-04-11 18:12:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 17:47:00');
INSERT INTO `train_normal` VALUES (486, 'K387', '成都西', NULL, '沈阳北', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 18:14:00', '2023-04-11 18:22:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 18:12:00');
INSERT INTO `train_normal` VALUES (487, 'K1452/49', '牡丹江', NULL, '烟台', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 18:26:00', '2023-04-11 18:35:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 18:25:00');
INSERT INTO `train_normal` VALUES (488, 'Z206', '天津', NULL, '长沙', NULL, NULL, NULL, 2, NULL, NULL, NULL, '2023-04-11 18:42:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 18:12:00');
INSERT INTO `train_normal` VALUES (489, 'K717', '石家庄北', NULL, '大连', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 18:49:00', '2023-04-11 18:57:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 18:47:00');
INSERT INTO `train_normal` VALUES (490, 'K27', '北京', NULL, '丹东', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 19:03:00', '2023-04-11 19:09:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 18:59:00');
INSERT INTO `train_normal` VALUES (491, 'K1571', '西安', NULL, '吉林', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 19:09:00', '2023-04-11 19:15:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 19:05:00');
INSERT INTO `train_normal` VALUES (492, 'K2048', '沈阳北', NULL, '西安', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 19:09:00', '2023-04-11 19:27:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 19:17:00');
INSERT INTO `train_normal` VALUES (493, 'T121', '广州', NULL, '长春', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 19:25:00', '2023-04-11 19:34:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 19:24:00');
INSERT INTO `train_normal` VALUES (494, 'K979', '西宁', NULL, '齐齐哈尔', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 19:41:00', '2023-04-11 19:48:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 19:38:00');
INSERT INTO `train_normal` VALUES (495, 'K332', '天津', NULL, '洛阳', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-04-11 19:48:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 19:18:00');
INSERT INTO `train_normal` VALUES (496, 'K970/1', '青岛北', NULL, '通化', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 19:50:00', '2023-04-11 20:18:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 19:50:00');
INSERT INTO `train_normal` VALUES (497, 'Z187', '深圳东', NULL, '沈阳北', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 20:03:00', '2023-04-11 20:10:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 20:00:00');
INSERT INTO `train_normal` VALUES (498, 'Z237', '广州东', NULL, '哈尔滨西', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 20:21:00', '2023-04-11 20:39:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 20:21:00');
INSERT INTO `train_normal` VALUES (499, 'S915', '蓟州北', NULL, '天津', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 20:28:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `train_normal` VALUES (500, 'K1394/1', '佳木斯', NULL, '烟台', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 20:36:00', '2023-04-11 20:44:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 20:34:00');
INSERT INTO `train_normal` VALUES (501, 'K939', '石家庄', NULL, '牡丹江', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 20:54:00', '2023-04-11 21:18:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 20:54:00');
INSERT INTO `train_normal` VALUES (502, 'K727', '广州东', NULL, '牡丹江', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 21:17:00', '2023-04-11 21:24:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 21:14:00');
INSERT INTO `train_normal` VALUES (503, 'K888', '天津', NULL, '兰州西', NULL, NULL, NULL, 2, NULL, NULL, NULL, '2023-04-11 21:38:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 21:08:00');
INSERT INTO `train_normal` VALUES (504, 'K348/5', '温州', NULL, '沈阳北', NULL, NULL, NULL, 5, NULL, NULL, '2023-04-11 21:30:00', '2023-04-11 21:41:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 21:30:00');
INSERT INTO `train_normal` VALUES (505, 'T184', '哈尔滨', NULL, '武昌', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 21:33:00', '2023-04-11 21:47:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 21:33:00');
INSERT INTO `train_normal` VALUES (506, 'Z79', '北京', NULL, '大连', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 21:43:00', '2023-04-11 21:48:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 21:38:00');
INSERT INTO `train_normal` VALUES (507, '2602', '秦皇岛', NULL, '大同', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 21:46:00', '2023-04-11 22:11:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 21:46:00');
INSERT INTO `train_normal` VALUES (508, 'K1622', '天津', NULL, '深圳东', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-04-11 22:20:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 21:50:00');
INSERT INTO `train_normal` VALUES (509, 'T251', '广州', NULL, '天津', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 22:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `train_normal` VALUES (510, 'K5204', '潞城', NULL, '天津', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 22:06:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `train_normal` VALUES (511, 'K868/5', '秦皇岛', NULL, '临汾', NULL, NULL, NULL, 2, NULL, NULL, '2023-04-11 22:26:00', '2023-04-11 22:57:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 22:26:00');
INSERT INTO `train_normal` VALUES (512, 'Z114', '哈尔滨西', NULL, '海口', NULL, NULL, NULL, 1, NULL, NULL, '2023-04-11 22:38:00', '2023-04-11 22:44:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 22:34:00');
INSERT INTO `train_normal` VALUES (513, 'T134/1', '大连', NULL, '上海', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 22:45:00', '2023-04-11 22:51:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 22:41:00');
INSERT INTO `train_normal` VALUES (514, 'S917', '蓟州北', NULL, '天津', NULL, NULL, NULL, 4, NULL, NULL, '2023-04-11 23:11:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `train_normal` VALUES (515, 'K190/87', '沈阳北', NULL, '上海', NULL, NULL, NULL, 3, NULL, NULL, '2023-04-11 23:12:00', '2023-04-11 23:18:00', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 23:08:00');

SET FOREIGN_KEY_CHECKS = 1;
