/*
Navicat MySQL Data Transfer

Source Server         : 我的腾讯云
Source Server Version : 50717
Source Host           : 115.159.121.68:3306
Source Database       : pt_ethicon

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-03-12 00:32:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pt_admin
-- ----------------------------
DROP TABLE IF EXISTS `pt_admin`;
CREATE TABLE `pt_admin` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `admin_name` varchar(40) NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(40) DEFAULT '' COMMENT '真实姓名',
  `password` char(32) NOT NULL COMMENT '密码',
  `mobile` char(11) DEFAULT '' COMMENT '手机号',
  `head_img` varchar(200) DEFAULT '' COMMENT '头像',
  `role_id` int(11) NOT NULL COMMENT '角色编号',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `last_login_time` int(11) NOT NULL COMMENT '最后登录时间',
  `power` tinyint(3) DEFAULT '0' COMMENT '权限',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态（-1.已删除 0.已关闭 1.启用）',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of pt_admin
-- ----------------------------
INSERT INTO `pt_admin` VALUES ('1', 'puppet', '郭钊林', '92b27e00386b3a5b91ad9bb1d1bd98d7', '15021074383', '', '1', '1490937855', '1490937855', '1490937855', '10', '1');
INSERT INTO `pt_admin` VALUES ('2', 'smallke', '张奇', '27d900e2f5f9e375c1f3da349684645e', '', '', '1', '1532145093', '1532145093', '1532145093', '0', '0');
INSERT INTO `pt_admin` VALUES ('3', 'admin', '管理员', '5a93dab55064f5665ad6ad25b47f2936', '', '', '2', '1532277730', '1532277730', '1532277730', '0', '0');
INSERT INTO `pt_admin` VALUES ('4', 'weicheng', '魏程', '27d900e2f5f9e375c1f3da349684645e', '', '', '1', '1543925831', '1546396369', '1543925831', '0', '1');

-- ----------------------------
-- Table structure for pt_admin_action
-- ----------------------------
DROP TABLE IF EXISTS `pt_admin_action`;
CREATE TABLE `pt_admin_action` (
  `admin_action_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `admin_id` int(11) NOT NULL COMMENT '管理员编号',
  `content` text NOT NULL COMMENT '行为内容',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`admin_action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员行为记录表';

-- ----------------------------
-- Records of pt_admin_action
-- ----------------------------

-- ----------------------------
-- Table structure for pt_admin_limit
-- ----------------------------
DROP TABLE IF EXISTS `pt_admin_limit`;
CREATE TABLE `pt_admin_limit` (
  `admin_limit_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `limit_name` varchar(40) NOT NULL COMMENT '权限名',
  `limit_url` varchar(200) NOT NULL COMMENT '请求路由',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态（-1.已删除 1.启用）',
  PRIMARY KEY (`admin_limit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='管理员角色功能权限表';

-- ----------------------------
-- Records of pt_admin_limit
-- ----------------------------
INSERT INTO `pt_admin_limit` VALUES ('1', '管理员列表', '/admin/list', '1');
INSERT INTO `pt_admin_limit` VALUES ('2', '管理员添加', '/admin/create', '1');
INSERT INTO `pt_admin_limit` VALUES ('3', '管理员修改', '/admin/edit', '1');
INSERT INTO `pt_admin_limit` VALUES ('4', '管理员查看', '/admin/view', '1');
INSERT INTO `pt_admin_limit` VALUES ('5', '管理员权限列表', '/admin/limit/list', '1');
INSERT INTO `pt_admin_limit` VALUES ('6', '管理员权限添加', '/admin/limit/create', '1');
INSERT INTO `pt_admin_limit` VALUES ('7', '管理员权限修改', '/admin/limit/edit', '1');
INSERT INTO `pt_admin_limit` VALUES ('8', '管理员权限查看', '/admin/limit/view', '1');
INSERT INTO `pt_admin_limit` VALUES ('9', '管理员角色列表', '/admin/role/list', '1');
INSERT INTO `pt_admin_limit` VALUES ('10', '管理员角色添加', '/admin/role/create', '1');
INSERT INTO `pt_admin_limit` VALUES ('11', '管理员角色修改', '/admin/role/edit', '1');
INSERT INTO `pt_admin_limit` VALUES ('12', '管理员角色查看', '/admin/role/view', '1');
INSERT INTO `pt_admin_limit` VALUES ('13', '管理员删除', '/admin/delete', '1');
INSERT INTO `pt_admin_limit` VALUES ('14', '管理员权限删除', '/admin/limit/delete', '1');
INSERT INTO `pt_admin_limit` VALUES ('15', '管理员角色删除', '/admin/role/delete', '1');
INSERT INTO `pt_admin_limit` VALUES ('16', '表单列表', '/admin/form/list', '1');
INSERT INTO `pt_admin_limit` VALUES ('17', '问卷统计', '/admin/questionnaire/list', '1');

-- ----------------------------
-- Table structure for pt_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `pt_admin_role`;
CREATE TABLE `pt_admin_role` (
  `admin_role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(40) NOT NULL,
  `limits_ids` text NOT NULL COMMENT '权限编号',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态（-1.已删除 0.已关闭 1.启用）',
  PRIMARY KEY (`admin_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员角色表';

-- ----------------------------
-- Records of pt_admin_role
-- ----------------------------
INSERT INTO `pt_admin_role` VALUES ('1', '超级管理员', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\"]', '1');
INSERT INTO `pt_admin_role` VALUES ('2', '管理员', '[\"16\",\"17\"]', '1');

-- ----------------------------
-- Table structure for pt_form
-- ----------------------------
DROP TABLE IF EXISTS `pt_form`;
CREATE TABLE `pt_form` (
  `form_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '姓名',
  `hospital` varchar(100) NOT NULL DEFAULT '' COMMENT '医院',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '职称',
  `specialty` varchar(100) NOT NULL DEFAULT '' COMMENT '专科',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机',
  `operations_num_one_year` int(11) NOT NULL DEFAULT '0' COMMENT '1年宫颈癌手术例数',
  `endoscopic_rate` int(11) NOT NULL DEFAULT '0' COMMENT '腔镜率百分比',
  `qs_survey` text NOT NULL COMMENT '问卷调查',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pt_form
-- ----------------------------
INSERT INTO `pt_form` VALUES ('6', '郭钊林', '123', '主治医师', '妇科', '15021074383', '121', '49', '[{\"id\":\"1\",\"answer\":\"D\",\"value\":\"d,恭喜我\"},{\"id\":\"11\",\"answer\":\"E,A,B,C\",\"value\":\"e,5668858\"},{\"id\":\"12\",\"answer\":\"D\",\"value\":\"d,789\"},{\"id\":\"13\",\"answer\":\"D\",\"value\":\"d,好咯哦\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"E\",\"value\":\"e,阿鹿头摸哦\"},{\"id\":\"22\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"A\",\"value\":\"\"}]', '1546444379', '1');
INSERT INTO `pt_form` VALUES ('7', '123', '123', '主治医师', '外科', '123', '56', '12', '[{\"id\":\"1\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"10\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"A,E,C\",\"value\":\"e,123\"},{\"id\":\"12\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"D\",\"value\":\"d,123\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"E\",\"value\":\"e,泼墨哦\"},{\"id\":\"22\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"}]', '1546446311', '1');
INSERT INTO `pt_form` VALUES ('8', '111', '111', '住院医师', '外科', '111', '120', '49', '[{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"3\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"14\",\"answer\":\"F,A,B\",\"value\":\"f,111\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"}]', '1546563155', '1');
INSERT INTO `pt_form` VALUES ('9', '薛雯萱', '华山医院', '主任医师', '妇科', '13262615532', '133', '68', '[{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"E,C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"D\",\"value\":\"\"}]', '1548553381', '1');
INSERT INTO `pt_form` VALUES ('10', '薛雯萱', '强生', '其他', '妇科', '13262615532', '114', '70', '[{\"id\":\"23\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1548553507', '1');
INSERT INTO `pt_form` VALUES ('11', '测试', '测试', '住院医师', '妇科', '18221427430', '169', '54', '[{\"id\":\"1\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"10\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"14\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"C\",\"value\":\"\"}]', '1550461808', '1');
INSERT INTO `pt_form` VALUES ('12', 'ceshi', 'ceshi', '主治医师', '外科', '18221427430', '127', '57', '[{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"4\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"5\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"6\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"D,C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"14\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"}]', '1550462087', '1');
INSERT INTO `pt_form` VALUES ('13', 'yy', 'g g', '住院医师', '妇科', 'h h h', '246', '68', '[{\"id\":\"1\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"7\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"B,D,E\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"D\",\"value\":\"d,跟荷花把你那女生们看看动库徐江徐江\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"}]', '1550821117', '1');
INSERT INTO `pt_form` VALUES ('14', 'yy', 'g g', '住院医师', '妇科', 'h h h', '246', '68', '[{\"id\":\"1\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"7\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"B,D,E\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"D\",\"value\":\"d,跟荷花把你那女生们看看动库徐江徐江\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"}]', '1550821117', '1');
INSERT INTO `pt_form` VALUES ('15', 'yy', 'g g', '住院医师', '妇科', 'h h h', '246', '68', '[{\"id\":\"1\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"7\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"B,D,E\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"D\",\"value\":\"d,跟荷花把你那女生们看看动库徐江徐江\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"}]', '1550821117', '1');
INSERT INTO `pt_form` VALUES ('16', 'yy', 'g g', '住院医师', '妇科', 'h h h', '246', '68', '[{\"id\":\"1\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"7\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"B,D,E\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"D\",\"value\":\"d,跟荷花把你那女生们看看动库徐江徐江\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"}]', '1550821117', '1');
INSERT INTO `pt_form` VALUES ('17', 'yy', 'g g', '住院医师', '妇科', 'h h h', '246', '68', '[{\"id\":\"1\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"7\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"B,D,E\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"D\",\"value\":\"d,跟荷花把你那女生们看看动库徐江徐江\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"}]', '1550821117', '1');
INSERT INTO `pt_form` VALUES ('18', 'yy', 'g g', '住院医师', '妇科', 'h h h', '246', '68', '[{\"id\":\"1\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"7\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"B,D,E\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"D\",\"value\":\"d,跟荷花把你那女生们看看动库徐江徐江\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"}]', '1550821117', '1');
INSERT INTO `pt_form` VALUES ('19', 'yy', 'g g', '住院医师', '妇科', 'h h h', '246', '68', '[{\"id\":\"1\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"7\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"B,D,E\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"D\",\"value\":\"d,跟荷花把你那女生们看看动库徐江徐江\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"}]', '1550821117', '1');
INSERT INTO `pt_form` VALUES ('20', 'yy', 'g g', '住院医师', '妇科', 'h h h', '246', '68', '[{\"id\":\"1\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"7\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"B,D,E\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"D\",\"value\":\"d,跟荷花把你那女生们看看动库徐江徐江\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"}]', '1550821117', '1');
INSERT INTO `pt_form` VALUES ('21', 'yy', 'g g', '住院医师', '妇科', 'h h h', '246', '68', '[{\"id\":\"1\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"7\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"B,D,E\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"D\",\"value\":\"d,跟荷花把你那女生们看看动库徐江徐江\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"}]', '1550821118', '1');
INSERT INTO `pt_form` VALUES ('22', 'yy', 'g g', '住院医师', '妇科', 'h h h', '246', '68', '[{\"id\":\"1\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"7\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"B,D,E\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"D\",\"value\":\"d,跟荷花把你那女生们看看动库徐江徐江\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"}]', '1550821118', '1');
INSERT INTO `pt_form` VALUES ('23', '朱', '朱', '住院医师', '妇科', '13', '121', '35', '[{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"14\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"3\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"4\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"A\",\"value\":\"\"}]', '1551855142', '1');
INSERT INTO `pt_form` VALUES ('24', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066072', '1');
INSERT INTO `pt_form` VALUES ('25', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066072', '1');
INSERT INTO `pt_form` VALUES ('26', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066072', '1');
INSERT INTO `pt_form` VALUES ('27', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066072', '1');
INSERT INTO `pt_form` VALUES ('28', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066073', '1');
INSERT INTO `pt_form` VALUES ('29', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066073', '1');
INSERT INTO `pt_form` VALUES ('30', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066073', '1');
INSERT INTO `pt_form` VALUES ('31', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066073', '1');
INSERT INTO `pt_form` VALUES ('32', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066073', '1');
INSERT INTO `pt_form` VALUES ('33', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066073', '1');
INSERT INTO `pt_form` VALUES ('34', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066073', '1');
INSERT INTO `pt_form` VALUES ('35', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066073', '1');
INSERT INTO `pt_form` VALUES ('36', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066074', '1');
INSERT INTO `pt_form` VALUES ('37', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066074', '1');
INSERT INTO `pt_form` VALUES ('38', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066074', '1');
INSERT INTO `pt_form` VALUES ('39', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066074', '1');
INSERT INTO `pt_form` VALUES ('40', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066074', '1');
INSERT INTO `pt_form` VALUES ('41', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066074', '1');
INSERT INTO `pt_form` VALUES ('42', '纽扣', '阿里', '住院医师', '外科', '41588566', '84', '28', '[{\"id\":\"23\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"E\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"}]', '1553066074', '1');
INSERT INTO `pt_form` VALUES ('43', '1344', '哦不迷茫呢', '副主任医师', '妇科', '978098', '167', '67', '[{\"id\":\"1\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"7\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"C\",\"value\":\"\"}]', '1554283171', '1');
INSERT INTO `pt_form` VALUES ('44', '1344', '哦不迷茫呢', '副主任医师', '妇科', '978098', '167', '67', '[{\"id\":\"1\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"7\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"C\",\"value\":\"\"}]', '1554283171', '1');
INSERT INTO `pt_form` VALUES ('45', 'ee', 'eee', '住院医师', '妇科', '111', '279', '79', '[{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"3\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"16\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"17\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"A\",\"value\":\"\"}]', '1554779659', '1');
INSERT INTO `pt_form` VALUES ('46', 'eee', '呃呃呃', '住院医师', '妇科', '188111111', '113', '42', '[{\"id\":\"1\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"10\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"D,C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"15\",\"answer\":\"A,B\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"7\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"14\",\"answer\":\"C\",\"value\":\"\"}]', '1554819681', '1');
INSERT INTO `pt_form` VALUES ('47', '夏月', '上海市第一人民医院', '主治医师', '外科', '13678765432', '173', '61', '[{\"id\":\"1\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"10\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"B,E\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"16\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"17\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"C\",\"value\":\"\"}]', '1563442716', '1');
INSERT INTO `pt_form` VALUES ('48', '夏月', '上海市第一人民医院', '主治医师', '外科', '13678765432', '173', '61', '[{\"id\":\"1\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"10\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"11\",\"answer\":\"B,E\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"16\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"17\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"C\",\"value\":\"\"}]', '1563442716', '1');
INSERT INTO `pt_form` VALUES ('49', '111', '222', '主治医师', '外科', '3333', '128', '61', '[{\"id\":\"1\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"2\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"4\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"5\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"6\",\"answer\":\"E\",\"value\":\"啦啦啦啦啦啦\"},{\"id\":\"11\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"12\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"13\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"16\",\"answer\":\"B\",\"value\":\"\"},{\"id\":\"17\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"18\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"19\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"20\",\"answer\":\"A\",\"value\":\"\"},{\"id\":\"21\",\"answer\":\"D\",\"value\":\"\"},{\"id\":\"22\",\"answer\":\"C\",\"value\":\"\"},{\"id\":\"23\",\"answer\":\"A\",\"value\":\"\"}]', '1563442829', '1');

-- ----------------------------
-- Table structure for pt_form_question
-- ----------------------------
DROP TABLE IF EXISTS `pt_form_question`;
CREATE TABLE `pt_form_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `form_id` int(11) NOT NULL COMMENT '表单编号',
  `question_id` int(11) NOT NULL COMMENT '问题编号',
  `answer` varchar(10) NOT NULL DEFAULT '' COMMENT '答案',
  `value` varchar(10) NOT NULL DEFAULT '' COMMENT '回答数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pt_form_question
-- ----------------------------
INSERT INTO `pt_form_question` VALUES ('72', '6', '1', 'd', '恭喜我');
INSERT INTO `pt_form_question` VALUES ('73', '6', '11', 'e', '5668858');
INSERT INTO `pt_form_question` VALUES ('74', '6', '11', 'a', '');
INSERT INTO `pt_form_question` VALUES ('75', '6', '11', 'b', '');
INSERT INTO `pt_form_question` VALUES ('76', '6', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('77', '6', '12', 'd', '789');
INSERT INTO `pt_form_question` VALUES ('78', '6', '13', 'd', '好咯哦');
INSERT INTO `pt_form_question` VALUES ('79', '6', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('80', '6', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('81', '6', '20', 'c', '');
INSERT INTO `pt_form_question` VALUES ('82', '6', '21', 'e', '阿鹿头摸哦');
INSERT INTO `pt_form_question` VALUES ('83', '6', '22', 'a', '');
INSERT INTO `pt_form_question` VALUES ('84', '6', '23', 'a', '');
INSERT INTO `pt_form_question` VALUES ('85', '7', '1', 'c', '');
INSERT INTO `pt_form_question` VALUES ('86', '7', '10', 'a', '');
INSERT INTO `pt_form_question` VALUES ('87', '0', '0', 'a', '');
INSERT INTO `pt_form_question` VALUES ('88', '0', '0', 'e', '123');
INSERT INTO `pt_form_question` VALUES ('89', '0', '0', 'c', '');
INSERT INTO `pt_form_question` VALUES ('90', '7', '12', 'd', '');
INSERT INTO `pt_form_question` VALUES ('91', '7', '13', 'd', '123');
INSERT INTO `pt_form_question` VALUES ('92', '7', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('93', '7', '19', 'c', '');
INSERT INTO `pt_form_question` VALUES ('94', '7', '20', 'd', '');
INSERT INTO `pt_form_question` VALUES ('95', '7', '21', 'e', '泼墨哦');
INSERT INTO `pt_form_question` VALUES ('96', '7', '22', 'a', '');
INSERT INTO `pt_form_question` VALUES ('97', '7', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('98', '8', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('99', '8', '2', 'a', '');
INSERT INTO `pt_form_question` VALUES ('100', '8', '3', 'd', '');
INSERT INTO `pt_form_question` VALUES ('101', '8', '11', 'a', '');
INSERT INTO `pt_form_question` VALUES ('102', '8', '12', 'a', '');
INSERT INTO `pt_form_question` VALUES ('103', '8', '13', 'a', '');
INSERT INTO `pt_form_question` VALUES ('104', '0', '0', 'f', '111');
INSERT INTO `pt_form_question` VALUES ('105', '0', '0', 'a', '');
INSERT INTO `pt_form_question` VALUES ('106', '0', '0', 'b', '');
INSERT INTO `pt_form_question` VALUES ('107', '8', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('108', '8', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('109', '8', '20', 'c', '');
INSERT INTO `pt_form_question` VALUES ('110', '8', '21', 'a', '');
INSERT INTO `pt_form_question` VALUES ('111', '8', '22', 'a', '');
INSERT INTO `pt_form_question` VALUES ('112', '8', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('113', '9', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('114', '9', '2', 'e', '');
INSERT INTO `pt_form_question` VALUES ('115', '0', '0', 'e', '');
INSERT INTO `pt_form_question` VALUES ('116', '0', '0', 'c', '');
INSERT INTO `pt_form_question` VALUES ('117', '9', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('118', '9', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('119', '9', '15', 'b', '');
INSERT INTO `pt_form_question` VALUES ('120', '9', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('121', '9', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('122', '9', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('123', '9', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('124', '9', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('125', '9', '23', 'd', '');
INSERT INTO `pt_form_question` VALUES ('126', '10', '23', 'd', '');
INSERT INTO `pt_form_question` VALUES ('127', '10', '1', 'd', '');
INSERT INTO `pt_form_question` VALUES ('128', '10', '11', 'd', '');
INSERT INTO `pt_form_question` VALUES ('129', '10', '12', 'd', '');
INSERT INTO `pt_form_question` VALUES ('130', '10', '13', 'd', '');
INSERT INTO `pt_form_question` VALUES ('131', '10', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('132', '10', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('133', '10', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('134', '10', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('135', '10', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('136', '11', '1', 'c', '');
INSERT INTO `pt_form_question` VALUES ('137', '11', '10', 'c', '');
INSERT INTO `pt_form_question` VALUES ('138', '11', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('139', '11', '12', 'a', '');
INSERT INTO `pt_form_question` VALUES ('140', '11', '13', 'a', '');
INSERT INTO `pt_form_question` VALUES ('141', '11', '14', 'e', '');
INSERT INTO `pt_form_question` VALUES ('142', '11', '18', 'c', '');
INSERT INTO `pt_form_question` VALUES ('143', '11', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('144', '11', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('145', '11', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('146', '11', '22', 'c', '');
INSERT INTO `pt_form_question` VALUES ('147', '11', '23', 'c', '');
INSERT INTO `pt_form_question` VALUES ('148', '12', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('149', '12', '2', 'b', '');
INSERT INTO `pt_form_question` VALUES ('150', '12', '4', 'b', '');
INSERT INTO `pt_form_question` VALUES ('151', '12', '5', 'b', '');
INSERT INTO `pt_form_question` VALUES ('152', '12', '6', 'd', '');
INSERT INTO `pt_form_question` VALUES ('153', '0', '0', 'd', '');
INSERT INTO `pt_form_question` VALUES ('154', '0', '0', 'c', '');
INSERT INTO `pt_form_question` VALUES ('155', '12', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('156', '12', '13', 'a', '');
INSERT INTO `pt_form_question` VALUES ('157', '12', '14', 'c', '');
INSERT INTO `pt_form_question` VALUES ('158', '12', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('159', '12', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('160', '12', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('161', '12', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('162', '12', '22', 'a', '');
INSERT INTO `pt_form_question` VALUES ('163', '12', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('164', '15', '1', 'b', '');
INSERT INTO `pt_form_question` VALUES ('165', '16', '1', 'b', '');
INSERT INTO `pt_form_question` VALUES ('166', '14', '1', 'b', '');
INSERT INTO `pt_form_question` VALUES ('167', '13', '1', 'b', '');
INSERT INTO `pt_form_question` VALUES ('168', '13', '7', 'e', '');
INSERT INTO `pt_form_question` VALUES ('169', '15', '7', 'e', '');
INSERT INTO `pt_form_question` VALUES ('170', '14', '7', 'e', '');
INSERT INTO `pt_form_question` VALUES ('171', '0', '0', 'b', '');
INSERT INTO `pt_form_question` VALUES ('172', '16', '7', 'e', '');
INSERT INTO `pt_form_question` VALUES ('173', '0', '0', 'b', '');
INSERT INTO `pt_form_question` VALUES ('174', '0', '0', 'b', '');
INSERT INTO `pt_form_question` VALUES ('175', '0', '0', 'd', '');
INSERT INTO `pt_form_question` VALUES ('176', '0', '0', 'd', '');
INSERT INTO `pt_form_question` VALUES ('177', '0', '0', 'd', '');
INSERT INTO `pt_form_question` VALUES ('178', '0', '0', 'e', '');
INSERT INTO `pt_form_question` VALUES ('179', '0', '0', 'e', '');
INSERT INTO `pt_form_question` VALUES ('180', '0', '0', 'b', '');
INSERT INTO `pt_form_question` VALUES ('181', '0', '0', 'e', '');
INSERT INTO `pt_form_question` VALUES ('182', '0', '0', 'd', '');
INSERT INTO `pt_form_question` VALUES ('183', '14', '12', 'd', '跟荷花把你那女生们看');
INSERT INTO `pt_form_question` VALUES ('184', '15', '12', 'd', '跟荷花把你那女生们看');
INSERT INTO `pt_form_question` VALUES ('185', '13', '12', 'd', '跟荷花把你那女生们看');
INSERT INTO `pt_form_question` VALUES ('186', '0', '0', 'e', '');
INSERT INTO `pt_form_question` VALUES ('187', '14', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('188', '13', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('189', '15', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('190', '14', '15', 'b', '');
INSERT INTO `pt_form_question` VALUES ('191', '16', '12', 'd', '跟荷花把你那女生们看');
INSERT INTO `pt_form_question` VALUES ('192', '13', '15', 'b', '');
INSERT INTO `pt_form_question` VALUES ('193', '15', '15', 'b', '');
INSERT INTO `pt_form_question` VALUES ('194', '14', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('195', '16', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('196', '15', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('197', '13', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('198', '14', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('199', '15', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('200', '16', '15', 'b', '');
INSERT INTO `pt_form_question` VALUES ('201', '13', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('202', '16', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('203', '13', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('204', '14', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('205', '15', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('206', '13', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('207', '15', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('208', '16', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('209', '14', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('210', '13', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('211', '15', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('212', '14', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('213', '16', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('214', '13', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('215', '15', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('216', '14', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('217', '16', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('218', '16', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('219', '16', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('220', '17', '1', 'b', '');
INSERT INTO `pt_form_question` VALUES ('221', '18', '1', 'b', '');
INSERT INTO `pt_form_question` VALUES ('222', '19', '1', 'b', '');
INSERT INTO `pt_form_question` VALUES ('223', '17', '7', 'e', '');
INSERT INTO `pt_form_question` VALUES ('224', '18', '7', 'e', '');
INSERT INTO `pt_form_question` VALUES ('225', '20', '1', 'b', '');
INSERT INTO `pt_form_question` VALUES ('226', '19', '7', 'e', '');
INSERT INTO `pt_form_question` VALUES ('227', '0', '0', 'b', '');
INSERT INTO `pt_form_question` VALUES ('228', '0', '0', 'd', '');
INSERT INTO `pt_form_question` VALUES ('229', '0', '0', 'b', '');
INSERT INTO `pt_form_question` VALUES ('230', '0', '0', 'e', '');
INSERT INTO `pt_form_question` VALUES ('231', '0', '0', 'b', '');
INSERT INTO `pt_form_question` VALUES ('232', '0', '0', 'd', '');
INSERT INTO `pt_form_question` VALUES ('233', '0', '0', 'd', '');
INSERT INTO `pt_form_question` VALUES ('234', '0', '0', 'e', '');
INSERT INTO `pt_form_question` VALUES ('235', '17', '12', 'd', '跟荷花把你那女生们看');
INSERT INTO `pt_form_question` VALUES ('236', '20', '7', 'e', '');
INSERT INTO `pt_form_question` VALUES ('237', '0', '0', 'e', '');
INSERT INTO `pt_form_question` VALUES ('238', '17', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('239', '18', '12', 'd', '跟荷花把你那女生们看');
INSERT INTO `pt_form_question` VALUES ('240', '19', '12', 'd', '跟荷花把你那女生们看');
INSERT INTO `pt_form_question` VALUES ('241', '0', '0', 'b', '');
INSERT INTO `pt_form_question` VALUES ('242', '0', '0', 'd', '');
INSERT INTO `pt_form_question` VALUES ('243', '17', '15', 'b', '');
INSERT INTO `pt_form_question` VALUES ('244', '18', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('245', '19', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('246', '0', '0', 'e', '');
INSERT INTO `pt_form_question` VALUES ('247', '18', '15', 'b', '');
INSERT INTO `pt_form_question` VALUES ('248', '19', '15', 'b', '');
INSERT INTO `pt_form_question` VALUES ('249', '17', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('250', '19', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('251', '20', '12', 'd', '跟荷花把你那女生们看');
INSERT INTO `pt_form_question` VALUES ('252', '17', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('253', '18', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('254', '19', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('255', '20', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('256', '17', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('257', '18', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('258', '19', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('259', '18', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('260', '17', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('261', '20', '15', 'b', '');
INSERT INTO `pt_form_question` VALUES ('262', '19', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('263', '18', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('264', '17', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('265', '20', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('266', '18', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('267', '19', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('268', '17', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('269', '18', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('270', '19', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('271', '20', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('272', '20', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('273', '20', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('274', '20', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('275', '20', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('276', '21', '1', 'b', '');
INSERT INTO `pt_form_question` VALUES ('277', '22', '1', 'b', '');
INSERT INTO `pt_form_question` VALUES ('278', '21', '7', 'e', '');
INSERT INTO `pt_form_question` VALUES ('279', '22', '7', 'e', '');
INSERT INTO `pt_form_question` VALUES ('280', '0', '0', 'b', '');
INSERT INTO `pt_form_question` VALUES ('281', '0', '0', 'd', '');
INSERT INTO `pt_form_question` VALUES ('282', '0', '0', 'e', '');
INSERT INTO `pt_form_question` VALUES ('283', '0', '0', 'b', '');
INSERT INTO `pt_form_question` VALUES ('284', '0', '0', 'd', '');
INSERT INTO `pt_form_question` VALUES ('285', '21', '12', 'd', '跟荷花把你那女生们看');
INSERT INTO `pt_form_question` VALUES ('286', '0', '0', 'e', '');
INSERT INTO `pt_form_question` VALUES ('287', '21', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('288', '22', '12', 'd', '跟荷花把你那女生们看');
INSERT INTO `pt_form_question` VALUES ('289', '21', '15', 'b', '');
INSERT INTO `pt_form_question` VALUES ('290', '22', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('291', '21', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('292', '21', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('293', '22', '15', 'b', '');
INSERT INTO `pt_form_question` VALUES ('294', '21', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('295', '22', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('296', '21', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('297', '21', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('298', '22', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('299', '21', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('300', '22', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('301', '22', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('302', '22', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('303', '22', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('304', '23', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('305', '23', '11', 'e', '');
INSERT INTO `pt_form_question` VALUES ('306', '23', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('307', '23', '13', 'a', '');
INSERT INTO `pt_form_question` VALUES ('308', '23', '14', 'b', '');
INSERT INTO `pt_form_question` VALUES ('309', '23', '18', 'c', '');
INSERT INTO `pt_form_question` VALUES ('310', '23', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('311', '23', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('312', '23', '21', 'a', '');
INSERT INTO `pt_form_question` VALUES ('313', '23', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('314', '23', '3', 'a', '');
INSERT INTO `pt_form_question` VALUES ('315', '23', '4', 'b', '');
INSERT INTO `pt_form_question` VALUES ('316', '23', '22', 'b', '');
INSERT INTO `pt_form_question` VALUES ('317', '23', '23', 'a', '');
INSERT INTO `pt_form_question` VALUES ('318', '24', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('319', '26', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('320', '27', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('321', '25', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('322', '24', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('323', '25', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('324', '24', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('325', '25', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('326', '24', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('327', '25', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('328', '24', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('329', '27', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('330', '26', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('331', '27', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('332', '24', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('333', '25', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('334', '26', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('335', '27', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('336', '26', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('337', '24', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('338', '27', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('339', '26', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('340', '27', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('341', '25', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('342', '24', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('343', '26', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('344', '27', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('345', '26', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('346', '27', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('347', '24', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('348', '25', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('349', '26', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('350', '27', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('351', '24', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('352', '25', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('353', '27', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('354', '26', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('355', '24', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('356', '27', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('357', '26', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('358', '25', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('359', '26', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('360', '24', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('361', '27', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('362', '25', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('363', '26', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('364', '25', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('365', '25', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('366', '28', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('367', '29', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('368', '30', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('369', '31', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('370', '28', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('371', '29', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('372', '28', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('373', '30', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('374', '29', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('375', '28', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('376', '30', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('377', '31', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('378', '29', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('379', '28', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('380', '30', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('381', '29', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('382', '31', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('383', '28', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('384', '30', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('385', '29', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('386', '31', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('387', '28', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('388', '30', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('389', '29', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('390', '31', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('391', '28', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('392', '30', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('393', '29', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('394', '31', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('395', '28', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('396', '30', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('397', '29', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('398', '31', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('399', '28', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('400', '30', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('401', '29', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('402', '31', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('403', '30', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('404', '28', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('405', '29', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('406', '31', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('407', '29', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('408', '31', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('409', '28', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('410', '30', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('411', '30', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('412', '31', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('413', '31', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('414', '32', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('415', '33', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('416', '32', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('417', '34', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('418', '33', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('419', '32', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('420', '35', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('421', '33', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('422', '34', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('423', '32', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('424', '33', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('425', '32', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('426', '34', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('427', '35', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('428', '32', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('429', '33', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('430', '34', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('431', '33', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('432', '32', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('433', '35', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('434', '34', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('435', '33', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('436', '32', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('437', '35', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('438', '33', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('439', '32', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('440', '34', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('441', '32', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('442', '33', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('443', '35', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('444', '32', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('445', '34', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('446', '33', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('447', '32', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('448', '34', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('449', '35', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('450', '33', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('451', '34', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('452', '33', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('453', '34', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('454', '35', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('455', '35', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('456', '34', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('457', '34', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('458', '35', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('459', '35', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('460', '35', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('461', '35', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('462', '36', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('463', '37', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('464', '38', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('465', '39', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('466', '36', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('467', '37', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('468', '38', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('469', '36', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('470', '37', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('471', '39', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('472', '37', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('473', '36', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('474', '38', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('475', '39', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('476', '37', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('477', '36', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('478', '38', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('479', '37', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('480', '36', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('481', '39', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('482', '36', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('483', '37', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('484', '38', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('485', '36', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('486', '37', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('487', '38', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('488', '36', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('489', '39', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('490', '37', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('491', '36', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('492', '37', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('493', '38', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('494', '39', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('495', '36', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('496', '37', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('497', '38', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('498', '37', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('499', '36', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('500', '39', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('501', '38', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('502', '39', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('503', '38', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('504', '39', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('505', '38', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('506', '39', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('507', '38', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('508', '39', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('509', '39', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('510', '40', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('511', '41', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('512', '42', '23', 'b', '');
INSERT INTO `pt_form_question` VALUES ('513', '40', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('514', '42', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('515', '41', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('516', '40', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('517', '42', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('518', '41', '2', 'd', '');
INSERT INTO `pt_form_question` VALUES ('519', '40', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('520', '42', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('521', '41', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('522', '40', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('523', '41', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('524', '42', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('525', '40', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('526', '41', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('527', '42', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('528', '40', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('529', '41', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('530', '42', '15', 'e', '');
INSERT INTO `pt_form_question` VALUES ('531', '40', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('532', '42', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('533', '41', '18', 'd', '');
INSERT INTO `pt_form_question` VALUES ('534', '40', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('535', '41', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('536', '42', '19', 'b', '');
INSERT INTO `pt_form_question` VALUES ('537', '41', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('538', '40', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('539', '42', '20', 'b', '');
INSERT INTO `pt_form_question` VALUES ('540', '41', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('541', '42', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('542', '40', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('543', '41', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('544', '42', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('545', '40', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('546', '43', '1', 'b', '');
INSERT INTO `pt_form_question` VALUES ('547', '44', '1', 'b', '');
INSERT INTO `pt_form_question` VALUES ('548', '43', '7', 'b', '');
INSERT INTO `pt_form_question` VALUES ('549', '44', '7', 'b', '');
INSERT INTO `pt_form_question` VALUES ('550', '43', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('551', '43', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('552', '44', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('553', '43', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('554', '44', '12', 'b', '');
INSERT INTO `pt_form_question` VALUES ('555', '43', '15', 'd', '');
INSERT INTO `pt_form_question` VALUES ('556', '43', '18', 'c', '');
INSERT INTO `pt_form_question` VALUES ('557', '44', '13', 'b', '');
INSERT INTO `pt_form_question` VALUES ('558', '43', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('559', '44', '15', 'd', '');
INSERT INTO `pt_form_question` VALUES ('560', '43', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('561', '44', '18', 'c', '');
INSERT INTO `pt_form_question` VALUES ('562', '43', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('563', '44', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('564', '43', '22', 'a', '');
INSERT INTO `pt_form_question` VALUES ('565', '44', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('566', '43', '23', 'c', '');
INSERT INTO `pt_form_question` VALUES ('567', '44', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('568', '44', '22', 'a', '');
INSERT INTO `pt_form_question` VALUES ('569', '44', '23', 'c', '');
INSERT INTO `pt_form_question` VALUES ('570', '45', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('571', '45', '2', 'a', '');
INSERT INTO `pt_form_question` VALUES ('572', '45', '3', 'a', '');
INSERT INTO `pt_form_question` VALUES ('573', '45', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('574', '45', '12', 'c', '');
INSERT INTO `pt_form_question` VALUES ('575', '45', '13', 'c', '');
INSERT INTO `pt_form_question` VALUES ('576', '45', '16', 'a', '');
INSERT INTO `pt_form_question` VALUES ('577', '45', '17', 'a', '');
INSERT INTO `pt_form_question` VALUES ('578', '45', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('579', '45', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('580', '45', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('581', '45', '21', 'a', '');
INSERT INTO `pt_form_question` VALUES ('582', '45', '22', 'a', '');
INSERT INTO `pt_form_question` VALUES ('583', '45', '23', 'a', '');
INSERT INTO `pt_form_question` VALUES ('584', '46', '1', 'b', '');
INSERT INTO `pt_form_question` VALUES ('585', '46', '10', 'a', '');
INSERT INTO `pt_form_question` VALUES ('586', '0', '0', 'd', '');
INSERT INTO `pt_form_question` VALUES ('587', '0', '0', 'c', '');
INSERT INTO `pt_form_question` VALUES ('588', '46', '12', 'c', '');
INSERT INTO `pt_form_question` VALUES ('589', '46', '13', 'a', '');
INSERT INTO `pt_form_question` VALUES ('590', '0', '0', 'a', '');
INSERT INTO `pt_form_question` VALUES ('591', '0', '0', 'b', '');
INSERT INTO `pt_form_question` VALUES ('592', '46', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('593', '46', '19', 'c', '');
INSERT INTO `pt_form_question` VALUES ('594', '46', '20', 'c', '');
INSERT INTO `pt_form_question` VALUES ('595', '46', '21', 'c', '');
INSERT INTO `pt_form_question` VALUES ('596', '46', '22', 'c', '');
INSERT INTO `pt_form_question` VALUES ('597', '46', '23', 'c', '');
INSERT INTO `pt_form_question` VALUES ('598', '46', '7', 'b', '');
INSERT INTO `pt_form_question` VALUES ('599', '46', '14', 'c', '');
INSERT INTO `pt_form_question` VALUES ('600', '48', '1', 'c', '');
INSERT INTO `pt_form_question` VALUES ('601', '47', '1', 'c', '');
INSERT INTO `pt_form_question` VALUES ('602', '47', '10', 'b', '');
INSERT INTO `pt_form_question` VALUES ('603', '48', '10', 'b', '');
INSERT INTO `pt_form_question` VALUES ('604', '0', '0', 'b', '');
INSERT INTO `pt_form_question` VALUES ('605', '0', '0', 'b', '');
INSERT INTO `pt_form_question` VALUES ('606', '0', '0', 'e', '');
INSERT INTO `pt_form_question` VALUES ('607', '0', '0', 'e', '');
INSERT INTO `pt_form_question` VALUES ('608', '47', '12', 'c', '');
INSERT INTO `pt_form_question` VALUES ('609', '48', '12', 'c', '');
INSERT INTO `pt_form_question` VALUES ('610', '47', '13', 'c', '');
INSERT INTO `pt_form_question` VALUES ('611', '48', '13', 'c', '');
INSERT INTO `pt_form_question` VALUES ('612', '47', '16', 'b', '');
INSERT INTO `pt_form_question` VALUES ('613', '48', '16', 'b', '');
INSERT INTO `pt_form_question` VALUES ('614', '47', '17', 'c', '');
INSERT INTO `pt_form_question` VALUES ('615', '48', '17', 'c', '');
INSERT INTO `pt_form_question` VALUES ('616', '47', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('617', '48', '18', 'a', '');
INSERT INTO `pt_form_question` VALUES ('618', '47', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('619', '48', '19', 'a', '');
INSERT INTO `pt_form_question` VALUES ('620', '47', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('621', '48', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('622', '47', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('623', '48', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('624', '47', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('625', '48', '22', 'd', '');
INSERT INTO `pt_form_question` VALUES ('626', '48', '23', 'c', '');
INSERT INTO `pt_form_question` VALUES ('627', '47', '23', 'c', '');
INSERT INTO `pt_form_question` VALUES ('628', '49', '1', 'a', '');
INSERT INTO `pt_form_question` VALUES ('629', '49', '2', 'b', '');
INSERT INTO `pt_form_question` VALUES ('630', '49', '4', 'a', '');
INSERT INTO `pt_form_question` VALUES ('631', '49', '5', 'c', '');
INSERT INTO `pt_form_question` VALUES ('632', '49', '6', 'e', '啦啦啦啦啦啦');
INSERT INTO `pt_form_question` VALUES ('633', '49', '11', 'c', '');
INSERT INTO `pt_form_question` VALUES ('634', '49', '12', 'a', '');
INSERT INTO `pt_form_question` VALUES ('635', '49', '13', 'c', '');
INSERT INTO `pt_form_question` VALUES ('636', '49', '16', 'b', '');
INSERT INTO `pt_form_question` VALUES ('637', '49', '17', 'c', '');
INSERT INTO `pt_form_question` VALUES ('638', '49', '18', 'c', '');
INSERT INTO `pt_form_question` VALUES ('639', '49', '19', 'c', '');
INSERT INTO `pt_form_question` VALUES ('640', '49', '20', 'a', '');
INSERT INTO `pt_form_question` VALUES ('641', '49', '21', 'd', '');
INSERT INTO `pt_form_question` VALUES ('642', '49', '22', 'c', '');
INSERT INTO `pt_form_question` VALUES ('643', '49', '23', 'a', '');

-- ----------------------------
-- Table structure for pt_question
-- ----------------------------
DROP TABLE IF EXISTS `pt_question`;
CREATE TABLE `pt_question` (
  `question_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '问题编号',
  `question` text NOT NULL COMMENT '问题',
  `answer_a` varchar(255) NOT NULL DEFAULT '' COMMENT '答案A',
  `answer_b` varchar(255) NOT NULL DEFAULT '' COMMENT '答案B',
  `answer_c` varchar(255) NOT NULL DEFAULT '' COMMENT '答案C',
  `answer_d` varchar(255) NOT NULL DEFAULT '' COMMENT '答案D',
  `answer_e` varchar(255) NOT NULL DEFAULT '' COMMENT '答案E',
  `answer_f` varchar(255) NOT NULL DEFAULT '' COMMENT '答案F',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pt_question
-- ----------------------------
INSERT INTO `pt_question` VALUES ('1', '请问您对该研究结果的看法？（腔镜手术结果上劣于开放手术）【单选】', 'a. 支持/赞同/同意', 'b. 不支持/不赞同/不同意', 'c. 不好说（需要更多信息/询证证据）', 'd.其他', '', '');
INSERT INTO `pt_question` VALUES ('2', '请问您认为宫颈癌手术中腔镜技术劣于开放的主要原因？【多选，最多3项】', 'a.技术本身有缺陷', 'b.现阶段开展缺少资质认证', 'c.适应症选择不合适', 'd.术者手术技术&器械应用不成熟', 'e.其他', '');
INSERT INTO `pt_question` VALUES ('3', '请您具体阐述下腔镜下的应用有何缺陷【多选，最多3项】', 'a.腔镜下切除肿瘤时标本会暴露', 'b.CO2气腹造成潜在的播散', 'c.腔镜下操作医生缺少触感', 'd.腔镜下切除范围不够', 'e.其他', '');
INSERT INTO `pt_question` VALUES ('4', '请问您觉得应该如何加强医生资质认证？', 'a.提高门槛', 'b.加强培训', 'c.需要行业认证', '', '', '');
INSERT INTO `pt_question` VALUES ('5', '请问您认为术者应该提高哪方面技术？【多选，最多2项】', 'a.腔镜下基础操作（分离、缝合打结等）', 'b.腔镜下能量器械应用（超声刀）', 'c.腔镜手术团队配合', 'd.其他', '', '');
INSERT INTO `pt_question` VALUES ('6', '请问您认为此研究中造成腔镜复发率和死亡率高于开放组的原因？【多选】', 'a.腔镜技术本身劣势', 'b.没有严格遵照无瘤原则', 'c.技术开展没有严格认证，不同中心质控不同', 'd.计划入组数据没有完成', 'e.其他', '');
INSERT INTO `pt_question` VALUES ('7', '请问您选择不支持的原因：', 'a.研究本身设计问题/数据问题', 'b.一到两篇文献不足以改变，还需要更多证据', 'c.现在腔镜设备以及器械比2008有长足进步', 'd.文章中并没有给到具体的原因', 'e.其他', '');
INSERT INTO `pt_question` VALUES ('8', '请问您觉得研究设计/数据存在何种问题：', 'a.平均每个中心入组数量太少', 'b.复发病患集中在某些中心', 'c.直径<2cm的病患预后较好，所以复发和技术无关', 'd.其他', '', '');
INSERT INTO `pt_question` VALUES ('9', '请问您认为此研究中造成腔镜复发率和死亡率高于开放组的原因？【多选】', 'a.腔镜技术本身劣势', 'b.没有严格遵照无瘤原则', 'c.技术开展没有严格认证，不同中心质控不同', 'd.计划入组数据没有完成', 'e.其他', '');
INSERT INTO `pt_question` VALUES ('10', '您认为还需要何种证据？', 'a.更加完善的前瞻性多中心研究', 'b.在同一质控体系下的研究', 'c.需要更多时间更多研究', 'd.其他', '', '');
INSERT INTO `pt_question` VALUES ('11', '请问您会选择何种病例进行腹腔镜宫颈癌手术？【多选】', 'a.<img src=\"http://ethicon.weiniweixiao.com/img/question/11-1.png\"/>', 'b.<img src=\"http://ethicon.weiniweixiao.com/img/question/11-2.png\"/>', 'c.<img src=\"http://ethicon.weiniweixiao.com/img/question/11-3.png\"/>', 'd.同时考虑肿块大小(<20cm)', 'e.其他', '');
INSERT INTO `pt_question` VALUES ('12', '请问您腹腔镜宫颈癌手术中，使用何种举宫杯?', 'a.<img src=\"http://ethicon.weiniweixiao.com/img/question/12-1.png\"/>', 'b.<img src=\"http://ethicon.weiniweixiao.com/img/question/12-2.png\"/>', 'c.<img src=\"http://ethicon.weiniweixiao.com/img/question/12-3.png\"/>', 'd.其他', '', '');
INSERT INTO `pt_question` VALUES ('13', '请问您在腔镜宫颈癌手术中使用何种能量器械?', 'a.<img src=\"http://ethicon.weiniweixiao.com/img/question/13-1.png\"/>', 'b.<img src=\"http://ethicon.weiniweixiao.com/img/question/13-2.png\"/>', 'c.<img src=\"http://ethicon.weiniweixiao.com/img/question/13-3.png\"/>', 'd.其他', '', '');
INSERT INTO `pt_question` VALUES ('14', '请问您宫颈癌手术选择超声刀最主要原因？【多选，最多3项】', 'a.精准切割，适合游离', 'b.切凝同步，处理淋巴结和系膜高效', 'c.侧向热损伤小，重要脏器可以安心操作', 'd.一器多用，腔镜手术流畅', 'e.ACE+7可以凝闭7mm血管，一把器械可以解决所有问题', 'f.其他');
INSERT INTO `pt_question` VALUES ('15', '请问您宫颈癌手术选择智能双极最主要原因？【多选，最多3项】', 'a.精细切割，适合游离', 'b.切凝功能，可以处理淋巴结、韧带', 'c.向热损失不大', 'd.一器多用，腔镜手术流畅', 'e.7mm血管处理能力', 'f.其他');
INSERT INTO `pt_question` VALUES ('16', '请问您使用电钩的主要原因？【多选，最多2项】', 'a.精细切割，适合游离', 'b.速度快', 'c.费用限制', 'd.其他', '', '');
INSERT INTO `pt_question` VALUES ('17', '请问您在开放宫颈癌手术中主要使用何种能量器械?', 'a.超声刀<img src=\"http://ethicon.weiniweixiao.com/img/question/17-1.png\"/>', 'b.智能双极<img src=\"http://ethicon.weiniweixiao.com/img/question/17-2.png\"/>', 'c.电刀<img src=\"http://ethicon.weiniweixiao.com/img/question/17-3.png\"/>', 'd.其他', '', '');
INSERT INTO `pt_question` VALUES ('18', '淋巴结清扫<img src=\"http://ethicon.weiniweixiao.com/img/question/18-t-1.png\"/>', 'a.<img src=\"http://ethicon.weiniweixiao.com/img/question/18-1.png\"/>', 'b.<img src=\"http://ethicon.weiniweixiao.com/img/question/18-2.png\"/>', 'c.<img src=\"http://ethicon.weiniweixiao.com/img/question/18-3.png\"/>', 'd.<img src=\"http://ethicon.weiniweixiao.com/img/question/18-4.png\"/>', '', '');
INSERT INTO `pt_question` VALUES ('19', '韧带处理<img src=\"http://ethicon.weiniweixiao.com/img/question/19-t-1.png\"/>', 'a.<img src=\"http://ethicon.weiniweixiao.com/img/question/18-1.png\"/>', 'b.<img src=\"http://ethicon.weiniweixiao.com/img/question/18-2.png\"/>', 'c.<img src=\"http://ethicon.weiniweixiao.com/img/question/18-3.png\"/>', 'd.<img src=\"http://ethicon.weiniweixiao.com/img/question/18-4.png\"/>', '', '');
INSERT INTO `pt_question` VALUES ('20', '宫旁处理<img src=\"http://ethicon.weiniweixiao.com/img/question/20-t-1.png\"/>', 'a.<img src=\"http://ethicon.weiniweixiao.com/img/question/18-1.png\"/>', 'b.<img src=\"http://ethicon.weiniweixiao.com/img/question/18-2.png\"/>', 'c.<img src=\"http://ethicon.weiniweixiao.com/img/question/18-3.png\"/>', 'd.<img src=\"http://ethicon.weiniweixiao.com/img/question/18-4.png\"/>', '', '');
INSERT INTO `pt_question` VALUES ('21', '请问该研究的发布对您开展宫颈癌手术的影响？', 'a.依旧按照适应症选择腔镜手术', 'b.不再开展腔镜宫颈癌手术', 'c.更加严格选择病人，腔镜手术减少', 'd.更加严格选择病人，充分沟通后尊重病人意愿', 'e.其他', '');
INSERT INTO `pt_question` VALUES ('22', '现阶段对宫颈癌手术开展，您的需求？', 'a.手术规范性培训', 'b.手术观摩', 'c.团队技能提升', 'd.个人经验分享', '', '');
INSERT INTO `pt_question` VALUES ('23', '如何提高腔镜医生操作的规范性', 'a.制定行业规范并加以推广', 'b.提高医生腔镜技能以及器械应用技巧', 'c.严格医生准入制度', 'd.其他', '', '');

-- ----------------------------
-- Table structure for pt_question_statistics
-- ----------------------------
DROP TABLE IF EXISTS `pt_question_statistics`;
CREATE TABLE `pt_question_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `question_id` int(11) NOT NULL COMMENT '问题编号',
  `answer_a` int(11) NOT NULL DEFAULT '0' COMMENT '答案A数量',
  `answer_b` int(11) NOT NULL DEFAULT '0' COMMENT '答案B数量',
  `answer_c` int(11) NOT NULL DEFAULT '0' COMMENT '答案C数量',
  `answer_d` int(11) NOT NULL DEFAULT '0' COMMENT '答案D数量',
  `answer_e` int(11) NOT NULL DEFAULT '0' COMMENT '答案E数量',
  `answer_f` int(11) NOT NULL DEFAULT '0' COMMENT '答案F数量',
  `peoples` int(11) NOT NULL DEFAULT '0' COMMENT '总人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='问题统计表';

-- ----------------------------
-- Records of pt_question_statistics
-- ----------------------------
INSERT INTO `pt_question_statistics` VALUES ('21', '1', '23', '12', '3', '2', '0', '0', '40');
INSERT INTO `pt_question_statistics` VALUES ('22', '11', '3', '11', '27', '11', '14', '0', '40');
INSERT INTO `pt_question_statistics` VALUES ('23', '12', '3', '22', '4', '11', '0', '0', '40');
INSERT INTO `pt_question_statistics` VALUES ('24', '13', '5', '27', '4', '3', '0', '0', '39');
INSERT INTO `pt_question_statistics` VALUES ('25', '18', '18', '0', '5', '16', '0', '0', '39');
INSERT INTO `pt_question_statistics` VALUES ('26', '19', '16', '20', '3', '0', '0', '0', '39');
INSERT INTO `pt_question_statistics` VALUES ('27', '20', '18', '17', '3', '1', '0', '0', '39');
INSERT INTO `pt_question_statistics` VALUES ('28', '21', '3', '0', '20', '13', '2', '0', '38');
INSERT INTO `pt_question_statistics` VALUES ('29', '22', '7', '1', '3', '28', '0', '0', '39');
INSERT INTO `pt_question_statistics` VALUES ('30', '23', '4', '29', '6', '2', '0', '0', '41');
INSERT INTO `pt_question_statistics` VALUES ('31', '10', '2', '2', '1', '0', '0', '0', '5');
INSERT INTO `pt_question_statistics` VALUES ('32', '2', '2', '2', '0', '19', '1', '0', '24');
INSERT INTO `pt_question_statistics` VALUES ('33', '3', '2', '0', '0', '1', '0', '0', '3');
INSERT INTO `pt_question_statistics` VALUES ('34', '14', '1', '2', '2', '0', '1', '1', '5');
INSERT INTO `pt_question_statistics` VALUES ('35', '15', '1', '10', '0', '2', '17', '0', '29');
INSERT INTO `pt_question_statistics` VALUES ('36', '4', '1', '2', '0', '0', '0', '0', '3');
INSERT INTO `pt_question_statistics` VALUES ('37', '5', '0', '1', '1', '0', '0', '0', '2');
INSERT INTO `pt_question_statistics` VALUES ('38', '6', '0', '0', '0', '1', '1', '0', '2');
INSERT INTO `pt_question_statistics` VALUES ('39', '7', '0', '3', '0', '0', '9', '0', '12');
INSERT INTO `pt_question_statistics` VALUES ('40', '7', '0', '0', '0', '0', '1', '0', '1');
INSERT INTO `pt_question_statistics` VALUES ('41', '16', '1', '3', '0', '0', '0', '0', '4');
INSERT INTO `pt_question_statistics` VALUES ('42', '17', '1', '0', '3', '0', '0', '0', '4');
