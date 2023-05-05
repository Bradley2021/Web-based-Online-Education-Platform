/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : guli_college

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 28/07/2022 17:19:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acl_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_permission`;
CREATE TABLE `acl_permission`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '编号',
  `pid` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '类型(1:菜单,2:按钮)',
  `permission_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限值',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问路径',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pid`(`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acl_permission
-- ----------------------------
INSERT INTO `acl_permission` VALUES ('1', '0', '全部数据', 0, NULL, NULL, NULL, '', NULL, 0, '2019-11-15 17:13:06', '2019-11-15 17:13:06');
INSERT INTO `acl_permission` VALUES ('1195268474480156673', '1', '系统管理', 1, NULL, '/acl', 'Layout', '', NULL, 0, '2019-11-15 17:13:06', '2019-11-18 13:54:25');
INSERT INTO `acl_permission` VALUES ('1195268616021139457', '1195268474480156673', '用户管理', 1, NULL, 'user/list', '/acl/user/list', '', NULL, 0, '2019-11-15 17:13:40', '2019-11-18 13:53:12');
INSERT INTO `acl_permission` VALUES ('1195268788138598401', '1195268474480156673', '角色管理', 1, NULL, 'role/list', '/acl/role/list', NULL, NULL, 0, '2019-11-15 17:14:21', '2019-11-15 17:14:21');
INSERT INTO `acl_permission` VALUES ('1195268893830864898', '1195268474480156673', '菜单管理', 1, NULL, 'menu/list', '/acl/menu/list', NULL, NULL, 0, '2019-11-15 17:14:46', '2019-11-15 17:14:46');
INSERT INTO `acl_permission` VALUES ('1195269143060602882', '1195268616021139457', '查看', 2, 'user.list', '', '', NULL, NULL, 0, '2019-11-15 17:15:45', '2019-11-17 21:57:16');
INSERT INTO `acl_permission` VALUES ('1195269295926206466', '1195268616021139457', '添加', 2, 'user.add', 'user/add', '/acl/user/form', NULL, NULL, 0, '2019-11-15 17:16:22', '2019-11-15 17:16:22');
INSERT INTO `acl_permission` VALUES ('1195269473479483394', '1195268616021139457', '修改', 2, 'user.update', 'user/update/:id', '/acl/user/form', NULL, NULL, 0, '2019-11-15 17:17:04', '2019-11-15 17:17:04');
INSERT INTO `acl_permission` VALUES ('1195269547269873666', '1195268616021139457', '删除', 2, 'user.remove', '', '', NULL, NULL, 0, '2019-11-15 17:17:22', '2019-11-15 17:17:22');
INSERT INTO `acl_permission` VALUES ('1195269821262782465', '1195268788138598401', '修改', 2, 'role.update', 'role/update/:id', '/acl/role/form', NULL, NULL, 0, '2019-11-15 17:18:27', '2019-11-15 17:19:53');
INSERT INTO `acl_permission` VALUES ('1195269903542444034', '1195268788138598401', '查看', 2, 'role.list', '', '', NULL, NULL, 0, '2019-11-15 17:18:47', '2019-11-15 17:18:47');
INSERT INTO `acl_permission` VALUES ('1195270037005197313', '1195268788138598401', '添加', 2, 'role.add', 'role/add', '/acl/role/form', NULL, NULL, 0, '2019-11-15 17:19:19', '2019-11-18 11:05:42');
INSERT INTO `acl_permission` VALUES ('1195270442602782721', '1195268788138598401', '删除', 2, 'role.remove', '', '', NULL, NULL, 0, '2019-11-15 17:20:55', '2019-11-15 17:20:55');
INSERT INTO `acl_permission` VALUES ('1195270621548568578', '1195268788138598401', '角色权限', 2, 'role.acl', 'role/distribution/:id', '/acl/role/roleForm', NULL, NULL, 0, '2019-11-15 17:21:38', '2019-11-15 17:21:38');
INSERT INTO `acl_permission` VALUES ('1195270744097742849', '1195268893830864898', '查看', 2, 'permission.list', '', '', NULL, NULL, 0, '2019-11-15 17:22:07', '2019-11-15 17:22:07');
INSERT INTO `acl_permission` VALUES ('1195270810560684034', '1195268893830864898', '添加', 2, 'permission.add', '', '', NULL, NULL, 0, '2019-11-15 17:22:23', '2019-11-15 17:22:23');
INSERT INTO `acl_permission` VALUES ('1195270862100291586', '1195268893830864898', '修改', 2, 'permission.update', '', '', NULL, NULL, 0, '2019-11-15 17:22:35', '2019-11-15 17:22:35');
INSERT INTO `acl_permission` VALUES ('1195270887933009922', '1195268893830864898', '删除', 2, 'permission.remove', '', '', NULL, NULL, 0, '2019-11-15 17:22:41', '2019-11-15 17:22:41');
INSERT INTO `acl_permission` VALUES ('1195349439240048642', '1', '讲师管理', 1, NULL, '/teacher', 'Layout', NULL, NULL, 0, '2019-11-15 22:34:49', '2019-11-15 22:34:49');
INSERT INTO `acl_permission` VALUES ('1195349699995734017', '1195349439240048642', '讲师列表', 1, '', 'table', '/edu/teacher/list', '', NULL, 0, '2019-11-15 22:35:52', '2019-11-15 22:35:52');
INSERT INTO `acl_permission` VALUES ('1195349810561781761', '1195349439240048642', '添加讲师', 1, '', 'save', '/edu/teacher/save', '', NULL, 0, '2019-11-15 22:36:18', '2019-11-15 22:36:18');
INSERT INTO `acl_permission` VALUES ('1195349876252971010', '1195349810561781761', '添加', 2, 'teacher.add', '', '', NULL, NULL, 0, '2019-11-15 22:36:34', '2019-11-15 22:36:34');
INSERT INTO `acl_permission` VALUES ('1195349979797753857', '1195349699995734017', '查看', 2, 'teacher.list', '', '', NULL, NULL, 0, '2019-11-15 22:36:58', '2019-11-15 22:36:58');
INSERT INTO `acl_permission` VALUES ('1195350117270261762', '1195349699995734017', '修改', 2, 'teacher.update', 'edit/:id', '/edu/teacher/save', NULL, NULL, 0, '2019-11-15 22:37:31', '2019-11-15 22:37:31');
INSERT INTO `acl_permission` VALUES ('1195350188359520258', '1195349699995734017', '删除', 2, 'teacher.remove', '', '', NULL, NULL, 0, '2019-11-15 22:37:48', '2019-11-15 22:37:48');
INSERT INTO `acl_permission` VALUES ('1195350299365969922', '1', '课程分类', 1, NULL, '/subject', 'Layout', NULL, NULL, 0, '2019-11-15 22:38:15', '2019-11-15 22:38:15');
INSERT INTO `acl_permission` VALUES ('1195350397751758850', '1195350299365969922', '课程分类列表', 1, NULL, 'list', '/edu/subject/list', NULL, NULL, 0, '2019-11-15 22:38:38', '2019-11-15 22:38:38');
INSERT INTO `acl_permission` VALUES ('1195350500512206850', '1195350299365969922', '导入课程分类', 1, NULL, 'save', '/edu/subject/save', NULL, NULL, 0, '2019-11-15 22:39:03', '2019-11-15 22:39:03');
INSERT INTO `acl_permission` VALUES ('1195350612172967938', '1195350397751758850', '查看', 2, 'subject.list', '', '', NULL, NULL, 0, '2019-11-15 22:39:29', '2019-11-15 22:39:29');
INSERT INTO `acl_permission` VALUES ('1195350687590748161', '1195350500512206850', '导入', 2, 'subject.import', '', '', NULL, NULL, 0, '2019-11-15 22:39:47', '2019-11-15 22:39:47');
INSERT INTO `acl_permission` VALUES ('1195350831744782337', '1', '课程管理', 1, NULL, '/course', 'Layout', NULL, NULL, 0, '2019-11-15 22:40:21', '2019-11-15 22:40:21');
INSERT INTO `acl_permission` VALUES ('1195350919074385921', '1195350831744782337', '课程列表', 1, NULL, 'list', '/edu/course/list', NULL, NULL, 0, '2019-11-15 22:40:42', '2019-11-15 22:40:42');
INSERT INTO `acl_permission` VALUES ('1195351020463296513', '1195350831744782337', '发布课程', 1, NULL, 'info', '/edu/course/info', NULL, NULL, 0, '2019-11-15 22:41:06', '2019-11-15 22:41:06');
INSERT INTO `acl_permission` VALUES ('1195351159672246274', '1195350919074385921', '完成发布', 2, 'course.publish', 'publish/:id', '/edu/course/publish', NULL, NULL, 0, '2019-11-15 22:41:40', '2019-11-15 22:44:01');
INSERT INTO `acl_permission` VALUES ('1195351326706208770', '1195350919074385921', '编辑课程', 2, 'course.update', 'info/:id', '/edu/course/info', NULL, NULL, 0, '2019-11-15 22:42:19', '2019-11-15 22:42:19');
INSERT INTO `acl_permission` VALUES ('1195351566221938690', '1195350919074385921', '编辑课程大纲', 2, 'chapter.update', 'chapter/:id', '/edu/course/chapter', NULL, NULL, 0, '2019-11-15 22:43:17', '2019-11-15 22:43:17');
INSERT INTO `acl_permission` VALUES ('1195351862889254913', '1', '统计分析', 1, NULL, '/sta', 'Layout', NULL, NULL, 0, '2019-11-15 22:44:27', '2019-11-15 22:44:27');
INSERT INTO `acl_permission` VALUES ('1195351968841568257', '1195351862889254913', '生成统计', 1, NULL, 'create', '/sta/create', NULL, NULL, 0, '2019-11-15 22:44:53', '2019-11-15 22:44:53');
INSERT INTO `acl_permission` VALUES ('1195352054917074946', '1195351862889254913', '统计图表', 1, NULL, 'show', '/sta/show', NULL, NULL, 0, '2019-11-15 22:45:13', '2019-11-15 22:45:13');
INSERT INTO `acl_permission` VALUES ('1195352127734386690', '1195352054917074946', '查看', 2, 'daily.list', '', '', NULL, NULL, 0, '2019-11-15 22:45:30', '2019-11-15 22:45:30');
INSERT INTO `acl_permission` VALUES ('1195352215768633346', '1195351968841568257', '生成', 2, 'daily.add', '', '', NULL, NULL, 0, '2019-11-15 22:45:51', '2019-11-15 22:45:51');
INSERT INTO `acl_permission` VALUES ('1195352547621965825', '1', '首页管理', 1, NULL, '/homepage', 'Layout', NULL, NULL, 0, '2019-11-15 22:47:11', '2019-11-18 10:51:46');
INSERT INTO `acl_permission` VALUES ('1195352856645701633', '1195353513549205505', '查看', 2, 'banner.list', '', NULL, NULL, NULL, 0, '2019-11-15 22:48:24', '2019-11-15 22:48:24');
INSERT INTO `acl_permission` VALUES ('1195352909401657346', '1195353513549205505', '添加', 2, 'banner.add', '', '/homepage/website/index', NULL, NULL, 0, '2019-11-15 22:48:37', '2019-11-18 10:52:10');
INSERT INTO `acl_permission` VALUES ('1195353051395624961', '1195353513549205505', '修改', 2, 'banner.update', 'banner/update/:id', '/cms/banner/form', NULL, NULL, 0, '2019-11-15 22:49:11', '2019-11-18 10:52:05');
INSERT INTO `acl_permission` VALUES ('1195353513549205505', '1195352547621965825', '头部导航', 1, NULL, 'website/index', '/homepage/website/index', NULL, NULL, 0, '2019-11-15 22:51:01', '2019-11-18 10:51:29');
INSERT INTO `acl_permission` VALUES ('1195353672110673921', '1195353513549205505', '删除', 2, 'banner.remove', '', '', NULL, NULL, 0, '2019-11-15 22:51:39', '2019-11-15 22:51:39');
INSERT INTO `acl_permission` VALUES ('1195354076890370050', '1', '订单管理', 1, NULL, '/order', 'Layout', NULL, NULL, 0, '2019-11-15 22:53:15', '2019-11-15 22:53:15');
INSERT INTO `acl_permission` VALUES ('1195354153482555393', '1195354076890370050', '订单列表', 1, NULL, 'index', '/order/index', NULL, NULL, 0, '2019-11-15 22:53:33', '2022-07-19 16:16:16');
INSERT INTO `acl_permission` VALUES ('1195354315093282817', '1195354153482555393', '查看', 2, 'order.list', '', '', NULL, NULL, 0, '2019-11-15 22:54:12', '2019-11-15 22:54:12');
INSERT INTO `acl_permission` VALUES ('1196301740985311234', '1195268616021139457', '分配角色', 2, 'user.assgin', 'user/role/:id', '/acl/user/roleForm', NULL, NULL, 0, '2019-11-18 13:38:56', '2019-11-18 13:38:56');
INSERT INTO `acl_permission` VALUES ('1549299136216457218', '1', '学员管理', 1, NULL, '/student', 'Layout', NULL, NULL, 0, '2022-07-19 15:44:33', '2022-07-19 15:44:33');
INSERT INTO `acl_permission` VALUES ('1549299636219437058', '1549299136216457218', '学员列表', 1, NULL, 'index', '/student/index', NULL, NULL, 0, '2022-07-19 15:46:33', '2022-07-19 16:16:41');
INSERT INTO `acl_permission` VALUES ('1549302551977943042', '1195352547621965825', '专区管理', 1, NULL, 'zone/index', '/homepage/zone/index', NULL, NULL, 0, '2022-07-19 15:58:08', '2022-07-19 15:58:08');
INSERT INTO `acl_permission` VALUES ('1549302806161154049', '1195352547621965825', '轮播图管理', 1, NULL, 'banner/index', '/homepage/banner/index', NULL, NULL, 0, '2022-07-19 15:59:08', '2022-07-19 15:59:08');
INSERT INTO `acl_permission` VALUES ('1549303265240309762', '1195352547621965825', '底部链接', 1, NULL, 'footer/index', '/homepage/footer/index', NULL, NULL, 0, '2022-07-19 16:00:58', '2022-07-19 16:00:58');
INSERT INTO `acl_permission` VALUES ('1549310212203110401', '1195350831744782337', '评论列表', 1, NULL, 'comment/index', '/edu/comment/index', NULL, NULL, 0, '2022-07-19 16:28:34', '2022-07-19 16:28:34');
INSERT INTO `acl_permission` VALUES ('1552474248130396162', '1195349439240048642', '讲师审核', 1, NULL, 'audit', '/edu/teacher/audit', NULL, NULL, 0, '2022-07-28 10:01:19', '2022-07-28 10:01:19');

-- ----------------------------
-- Table structure for acl_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE `acl_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `role_sort` int(4) NULL DEFAULT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色状态（0-正常 1-停用）',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除（1-已删除 0-未删除）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acl_role
-- ----------------------------
INSERT INTO `acl_role` VALUES (1, '超级管理员', 'admin', 1, '0', 0, NULL, '2019-11-11 13:09:32', '2022-07-27 14:34:45');
INSERT INTO `acl_role` VALUES (2, '系统管理员', 'common', 2, '0', 0, NULL, '2019-11-11 13:09:45', '2022-07-27 14:34:56');
INSERT INTO `acl_role` VALUES (3, '课程管理员', 'course', 3, '0', 0, NULL, '2022-07-19 14:42:53', '2022-07-27 14:35:22');

-- ----------------------------
-- Table structure for acl_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_permission`;
CREATE TABLE `acl_role_permission`  (
  `role_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '角色id',
  `permission_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '权限id',
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acl_role_permission
-- ----------------------------
INSERT INTO `acl_role_permission` VALUES (1, '1');
INSERT INTO `acl_role_permission` VALUES (1, '1195268474480156673');
INSERT INTO `acl_role_permission` VALUES (1, '1195268616021139457');
INSERT INTO `acl_role_permission` VALUES (1, '1195268788138598401');
INSERT INTO `acl_role_permission` VALUES (1, '1195268893830864898');
INSERT INTO `acl_role_permission` VALUES (1, '1195269143060602882');
INSERT INTO `acl_role_permission` VALUES (1, '1195269295926206466');
INSERT INTO `acl_role_permission` VALUES (1, '1195269473479483394');
INSERT INTO `acl_role_permission` VALUES (1, '1195269547269873666');
INSERT INTO `acl_role_permission` VALUES (1, '1195269821262782465');
INSERT INTO `acl_role_permission` VALUES (1, '1195269903542444034');
INSERT INTO `acl_role_permission` VALUES (1, '1195270037005197313');
INSERT INTO `acl_role_permission` VALUES (1, '1195270442602782721');
INSERT INTO `acl_role_permission` VALUES (1, '1195270621548568578');
INSERT INTO `acl_role_permission` VALUES (1, '1195270744097742849');
INSERT INTO `acl_role_permission` VALUES (1, '1195270810560684034');
INSERT INTO `acl_role_permission` VALUES (1, '1195270862100291586');
INSERT INTO `acl_role_permission` VALUES (1, '1195270887933009922');
INSERT INTO `acl_role_permission` VALUES (1, '1195349439240048642');
INSERT INTO `acl_role_permission` VALUES (1, '1195349699995734017');
INSERT INTO `acl_role_permission` VALUES (1, '1195349810561781761');
INSERT INTO `acl_role_permission` VALUES (1, '1195349876252971010');
INSERT INTO `acl_role_permission` VALUES (1, '1195349979797753857');
INSERT INTO `acl_role_permission` VALUES (1, '1195350117270261762');
INSERT INTO `acl_role_permission` VALUES (1, '1195350188359520258');
INSERT INTO `acl_role_permission` VALUES (1, '1195350299365969922');
INSERT INTO `acl_role_permission` VALUES (1, '1195350397751758850');
INSERT INTO `acl_role_permission` VALUES (1, '1195350500512206850');
INSERT INTO `acl_role_permission` VALUES (1, '1195350612172967938');
INSERT INTO `acl_role_permission` VALUES (1, '1195350687590748161');
INSERT INTO `acl_role_permission` VALUES (1, '1195350831744782337');
INSERT INTO `acl_role_permission` VALUES (1, '1195350919074385921');
INSERT INTO `acl_role_permission` VALUES (1, '1195351020463296513');
INSERT INTO `acl_role_permission` VALUES (1, '1195351159672246274');
INSERT INTO `acl_role_permission` VALUES (1, '1195351326706208770');
INSERT INTO `acl_role_permission` VALUES (1, '1195351566221938690');
INSERT INTO `acl_role_permission` VALUES (1, '1195351862889254913');
INSERT INTO `acl_role_permission` VALUES (1, '1195351968841568257');
INSERT INTO `acl_role_permission` VALUES (1, '1195352054917074946');
INSERT INTO `acl_role_permission` VALUES (1, '1195352127734386690');
INSERT INTO `acl_role_permission` VALUES (1, '1195352215768633346');
INSERT INTO `acl_role_permission` VALUES (1, '1195352547621965825');
INSERT INTO `acl_role_permission` VALUES (1, '1195352856645701633');
INSERT INTO `acl_role_permission` VALUES (1, '1195352909401657346');
INSERT INTO `acl_role_permission` VALUES (1, '1195353051395624961');
INSERT INTO `acl_role_permission` VALUES (1, '1195353513549205505');
INSERT INTO `acl_role_permission` VALUES (1, '1195353672110673921');
INSERT INTO `acl_role_permission` VALUES (1, '1195354076890370050');
INSERT INTO `acl_role_permission` VALUES (1, '1195354153482555393');
INSERT INTO `acl_role_permission` VALUES (1, '1195354315093282817');
INSERT INTO `acl_role_permission` VALUES (1, '1196301740985311234');
INSERT INTO `acl_role_permission` VALUES (1, '1549299136216457218');
INSERT INTO `acl_role_permission` VALUES (1, '1549299636219437058');
INSERT INTO `acl_role_permission` VALUES (1, '1549302551977943042');
INSERT INTO `acl_role_permission` VALUES (1, '1549302806161154049');
INSERT INTO `acl_role_permission` VALUES (1, '1549303265240309762');
INSERT INTO `acl_role_permission` VALUES (1, '1549310212203110401');
INSERT INTO `acl_role_permission` VALUES (2, '1195268474480156673');
INSERT INTO `acl_role_permission` VALUES (2, '1195268616021139457');
INSERT INTO `acl_role_permission` VALUES (2, '1195268788138598401');
INSERT INTO `acl_role_permission` VALUES (2, '1195268893830864898');
INSERT INTO `acl_role_permission` VALUES (2, '1195269143060602882');
INSERT INTO `acl_role_permission` VALUES (2, '1195269295926206466');
INSERT INTO `acl_role_permission` VALUES (2, '1195269473479483394');
INSERT INTO `acl_role_permission` VALUES (2, '1195269547269873666');
INSERT INTO `acl_role_permission` VALUES (2, '1195269821262782465');
INSERT INTO `acl_role_permission` VALUES (2, '1195269903542444034');
INSERT INTO `acl_role_permission` VALUES (2, '1195270037005197313');
INSERT INTO `acl_role_permission` VALUES (2, '1195270442602782721');
INSERT INTO `acl_role_permission` VALUES (2, '1195270621548568578');
INSERT INTO `acl_role_permission` VALUES (2, '1195270744097742849');
INSERT INTO `acl_role_permission` VALUES (2, '1195270810560684034');
INSERT INTO `acl_role_permission` VALUES (2, '1195270862100291586');
INSERT INTO `acl_role_permission` VALUES (2, '1195270887933009922');
INSERT INTO `acl_role_permission` VALUES (2, '1196301740985311234');
INSERT INTO `acl_role_permission` VALUES (3, '1195350299365969922');
INSERT INTO `acl_role_permission` VALUES (3, '1195350397751758850');
INSERT INTO `acl_role_permission` VALUES (3, '1195350500512206850');
INSERT INTO `acl_role_permission` VALUES (3, '1195350612172967938');
INSERT INTO `acl_role_permission` VALUES (3, '1195350687590748161');
INSERT INTO `acl_role_permission` VALUES (3, '1195350831744782337');
INSERT INTO `acl_role_permission` VALUES (3, '1195350919074385921');
INSERT INTO `acl_role_permission` VALUES (3, '1195351020463296513');
INSERT INTO `acl_role_permission` VALUES (3, '1195351159672246274');
INSERT INTO `acl_role_permission` VALUES (3, '1195351326706208770');
INSERT INTO `acl_role_permission` VALUES (3, '1195351566221938690');
INSERT INTO `acl_role_permission` VALUES (3, '1549310212203110401');

-- ----------------------------
-- Table structure for acl_user
-- ----------------------------
DROP TABLE IF EXISTS `acl_user`;
CREATE TABLE `acl_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户号',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phonenumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别（0-男 1-女 2-未知）',
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态（0-启用，1-停用）',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户签名',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acl_user
-- ----------------------------
INSERT INTO `acl_user` VALUES (1, 'admin', '96e79218965eb72c92a549dd5a330112', '管理员', '13888888888', '1', 'admin@qq.com', '0', '', NULL, 0, NULL, '2019-11-01 10:39:47', '2022-07-27 14:34:17');
INSERT INTO `acl_user` VALUES (2, 'starsea', 'e10adc3949ba59abbe56e057f20f883e', '星海', '13888888888', '0', 'starsea@qq.com', '0', NULL, NULL, 0, NULL, '2022-03-22 10:58:36', '2022-03-22 10:58:36');
INSERT INTO `acl_user` VALUES (3, 'test', '96e79218965eb72c92a549dd5a330112', '测试', '13888888888', '1', 'test@qq.com', '0', NULL, NULL, 0, NULL, '2022-03-22 11:35:11', '2022-07-27 17:11:55');

-- ----------------------------
-- Table structure for acl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_role`;
CREATE TABLE `acl_user_role`  (
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `role_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '角色id',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acl_user_role
-- ----------------------------
INSERT INTO `acl_user_role` VALUES (1, 1);
INSERT INTO `acl_user_role` VALUES (2, 2);
INSERT INTO `acl_user_role` VALUES (3, 3);

-- ----------------------------
-- Table structure for crm_banner
-- ----------------------------
DROP TABLE IF EXISTS `crm_banner`;
CREATE TABLE `crm_banner`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'ID',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标题',
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '首页banner表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of crm_banner
-- ----------------------------
INSERT INTO `crm_banner` VALUES ('1194556896025845762', 'test1', 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/08/3431348164.png', '/', 1, 0, '2019-11-13 18:05:32', '2019-11-18 10:28:22');
INSERT INTO `crm_banner` VALUES ('1194607458461216769', 'test2', 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/08/126594545.png', '/', 2, 0, '2019-11-13 21:26:27', '2019-11-14 09:12:15');
INSERT INTO `crm_banner` VALUES ('1194607458461316768', 'test3', 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/08/520276763.png', '/', 3, 0, '2022-07-22 21:26:27', '2022-07-22 09:12:15');
INSERT INTO `crm_banner` VALUES ('1194607458481036763', 'test4', 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/08/5c3f2341846b77e0a.png', '/', 4, 0, '2022-07-22 21:26:27', '2022-07-22 09:12:15');

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示排序',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------
INSERT INTO `edu_chapter` VALUES ('1192252428399751169', '1192252213659774977', '第一章 面向对象', 1, '2019-11-07 09:28:25', '2022-07-22 10:54:17');
INSERT INTO `edu_chapter` VALUES ('1318440895913095169', '1318437210860544002', '第一章 1111', 1, '2020-10-20 14:36:20', '2020-10-20 15:01:01');
INSERT INTO `edu_chapter` VALUES ('1318441164965113857', '1318437210860544002', '第二章 2222', 2, '2020-10-20 14:37:24', '2020-10-20 14:37:24');
INSERT INTO `edu_chapter` VALUES ('1318482448710856705', '1318482325536731137', '第一节111', 1, '2020-10-20 17:21:27', '2020-10-20 17:21:49');
INSERT INTO `edu_chapter` VALUES ('1318484831549485058', '1318484503861096449', '第一节', 1, '2020-10-20 17:30:55', '2020-10-20 17:30:55');
INSERT INTO `edu_chapter` VALUES ('1318486946841849857', '1318484503861096449', '二姐阿萨德饭', 2, '2020-10-20 17:39:19', '2020-10-20 17:40:11');
INSERT INTO `edu_chapter` VALUES ('1318491880274489345', '1318488694562189314', '第一章111', 1, '2020-10-20 17:58:55', '2020-10-20 17:58:55');
INSERT INTO `edu_chapter` VALUES ('1318491979213926402', '1318488694562189314', '撒旦法', 0, '2020-10-20 17:59:19', '2020-10-20 17:59:59');
INSERT INTO `edu_chapter` VALUES ('1318722552473804802', '1318722478616305666', '第一章', 1, '2020-10-21 09:15:32', '2020-10-21 09:15:32');
INSERT INTO `edu_chapter` VALUES ('1318722592315498497', '1318722478616305666', '第三章', 0, '2020-10-21 09:15:41', '2020-10-21 09:15:59');
INSERT INTO `edu_chapter` VALUES ('1318728290696941569', '1318728249454350338', '12345', 0, '2020-10-21 09:38:20', '2020-10-21 09:38:20');
INSERT INTO `edu_chapter` VALUES ('1318747712266412034', '1318747684848246785', '第一章', 0, '2020-10-21 10:55:30', '2020-10-21 10:55:30');
INSERT INTO `edu_chapter` VALUES ('1319121740231495681', '1319121648275574786', '第一章概述', 0, '2020-10-22 11:41:46', '2020-10-22 11:41:46');
INSERT INTO `edu_chapter` VALUES ('1319140707822133250', '1319140639874408450', '第一张 概述', 1, '2020-10-22 12:57:08', '2022-07-22 14:34:10');
INSERT INTO `edu_chapter` VALUES ('1319152488095342593', '1319152450967363586', '第一章 课程介绍', 1, '2020-10-22 13:43:56', '2022-07-22 14:36:18');
INSERT INTO `edu_chapter` VALUES ('1319166091204681729', '1319166036838113282', '第一章', 0, '2020-10-22 14:38:00', '2020-10-22 14:38:00');
INSERT INTO `edu_chapter` VALUES ('1319174797774479361', '1319174768083001346', '一、基础篇', 0, '2020-10-22 15:12:36', '2022-07-22 14:39:11');
INSERT INTO `edu_chapter` VALUES ('1319267764531056641', '1319267725708578817', '第一章', 0, '2020-10-22 21:22:01', '2020-10-22 21:22:01');
INSERT INTO `edu_chapter` VALUES ('1319566509063917569', '1319566435449688065', '一、介绍', 1, '2020-10-23 17:09:07', '2022-07-22 14:40:23');
INSERT INTO `edu_chapter` VALUES ('1506176567448035329', '1506176095987294210', 'SpringBoot基础篇', 1, '2022-03-22 15:50:52', '2022-03-22 15:50:52');
INSERT INTO `edu_chapter` VALUES ('1550309313749192706', '1318747112317362177', 'Redis基础篇', 0, '2022-07-22 10:38:38', '2022-07-22 10:39:13');
INSERT INTO `edu_chapter` VALUES ('1550309399027781634', '1318747112317362177', 'Redis集群篇', 1, '2022-07-22 10:38:59', '2022-07-22 10:39:19');

-- ----------------------------
-- Table structure for edu_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_comment`;
CREATE TABLE `edu_comment`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论ID',
  `course_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '讲师id',
  `member_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员头像',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_comment
-- ----------------------------
INSERT INTO `edu_comment` VALUES ('1194499162790211585', '1192252213659774977', '1189389726308478977', '1320958790404640770', '测试用户', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '课程很好', 0, '2019-11-13 14:16:08', '2019-11-13 14:16:08');
INSERT INTO `edu_comment` VALUES ('1506820568248811521', '1317006248872202242', '1189426464967995393', '1320958790404640770', '测试用户', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '加点简称', 0, '2022-03-24 10:29:53', '2022-03-24 10:29:53');
INSERT INTO `edu_comment` VALUES ('1550384630773907457', '1192252213659774977', '1189389726308478977', '1320958790404640770', '测试用户', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '加点介绍', 0, '2022-07-22 15:37:55', '2022-07-22 15:37:55');

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程专业ID',
  `subject_parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程专业父级ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程标题',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销售数量',
  `view_count` bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Draft' COMMENT '课程状态 Draft未发布  Normal已发布',
  `is_deleted` tinyint(3) NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES ('1192252213659774977', '1189389726308478977', '1312323828407990000', '1312323828407992322', 'Java基础课程', 0.01, 17, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/20220722100024.png', 4, 387, 1, 'Normal', 0, '2019-11-07 09:27:33', '2022-07-22 14:25:28');
INSERT INTO `edu_course` VALUES ('1316902348370411521', '2215678333805357853', '1315564828592541698', '1315564828407992322', 'MySQL基础篇', 0.00, 5, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/20220722095953.png', 0, 0, 1, 'Draft', 0, '2020-10-16 08:42:41', '2022-07-22 14:26:14');
INSERT INTO `edu_course` VALUES ('1317006248872202242', '1189426464967995393', '1315564826696716290', '1315564825711054849', 'Vue高级课程', 0.01, 15, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/151728236468.png', 0, 0, 1, 'Normal', 0, '2020-10-16 15:35:33', '2022-07-22 10:42:31');
INSERT INTO `edu_course` VALUES ('1317020820450533378', '1506158412432531457', '1312323828407990000', '1312323828407992322', 'Java高级开发', 0.02, 20, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/QuanGuo_F3V80900.png', 0, 0, 1, 'Draft', 0, '2020-10-16 16:33:27', '2022-07-22 14:28:14');
INSERT INTO `edu_course` VALUES ('1318076075703500801', '1313425019266715649', '1315564827028066305', '1315564825711054849', 'JavaScript课程', 0.01, 10, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/62263327163841b.png', 0, 0, 1, 'Draft', 0, '2020-10-19 14:26:40', '2022-07-22 14:29:21');
INSERT INTO `edu_course` VALUES ('1318747112317362177', '1189426437876985857', '1315564867767992322', '1315564828407992322', 'Redis分布式', 0.00, 10, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/6537288cd8afd.png', 0, 0, 1, 'Draft', 0, '2020-10-21 10:53:07', '2022-07-22 14:30:33');
INSERT INTO `edu_course` VALUES ('1318747684848246785', '1195337453429129218', '1315564828277655985', '1315564827900481538', 'RabbitMQ中间件', 0.03, 10, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/h_11a47468447e72870c.png', 0, 0, 1, 'Normal', 0, '2020-10-21 10:55:24', '2022-07-22 14:31:13');
INSERT INTO `edu_course` VALUES ('1319121648275574786', '1313753567470829570', '1312323828407990123', '1312323828407992322', 'Linux课程', 0.00, 10, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/_2020_08_Linux-file-.png', 0, 0, 1, 'Draft', 0, '2020-10-22 11:41:24', '2022-07-22 14:44:05');
INSERT INTO `edu_course` VALUES ('1319140639874408450', '1314200439788519425', '1315524869767992322', '1315775828407992321', '数据结构与算法', 0.01, 10, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/2605sifa1u949ioate2.png', 0, 0, 1, 'Draft', 0, '2020-10-22 12:56:52', '2022-07-22 14:33:48');
INSERT INTO `edu_course` VALUES ('1319152450967363586', '1313425310498213889', '1315524510767992372', '1315775828407992321', '计算机组成原理', 0.01, 10, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/2605sifa1u949ioate2.png', 0, 0, 1, 'Draft', 0, '2020-10-22 13:43:48', '2022-07-22 14:35:53');
INSERT INTO `edu_course` VALUES ('1319166036838113282', '1506158412432531457', '1313824869767992324', '1315775828407992321', '操作系统', 0.05, 10, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/_ChMkKl_qnEqIZxNHAAAtDqsdlMEAA.png', 0, 0, 1, 'Draft', 0, '2020-10-22 14:37:47', '2022-07-22 14:37:17');
INSERT INTO `edu_course` VALUES ('1319174768083001346', '1508736834995785730', '1315564828089225217', '1315564827900481538', 'Spring提高篇', 0.01, 10, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/20140829_Img4039005.png', 0, 0, 1, 'Draft', 0, '2020-10-22 15:12:28', '2022-07-22 14:38:31');
INSERT INTO `edu_course` VALUES ('1319566435449688065', '1192249914833055746', '1315523458265385985', '1315564827900481538', 'Kafka冲刺篇', 0.01, 10, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/20220722095651.png', 0, 0, 1, 'Draft', 0, '2020-10-23 17:08:49', '2022-07-22 14:40:02');
INSERT INTO `edu_course` VALUES ('1506176095987294210', '1436576767676767676', '1315564828089225217', '1315564827900481538', 'SpringBoot核心技术篇', 0.01, 158, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/20220722095632.png', 0, 0, 1, 'Normal', 0, '2022-03-22 15:48:59', '2022-03-29 17:27:18');
INSERT INTO `edu_course` VALUES ('1843447675768399437', '1235465777548999552', '1312323828407990000', '1312323828407992322', 'Java精品课程', 0.01, 20, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/10F5140JE.png', 151, 737, 6, 'Normal', 0, '2018-04-02 21:28:46', '2019-11-18 11:14:52');

-- ----------------------------
-- Table structure for edu_course_collect
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_collect`;
CREATE TABLE `edu_course_collect`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收藏ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程讲师ID',
  `member_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '课程专业ID',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程收藏' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_course_collect
-- ----------------------------
INSERT INTO `edu_course_collect` VALUES ('1196269345666019330', '1192252213659774977', '1', 1, '2019-11-18 11:30:12', '2019-11-18 11:30:12');

-- ----------------------------
-- Table structure for edu_course_description
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_description`;
CREATE TABLE `edu_course_description`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '课程简介',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程简介' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_course_description
-- ----------------------------
INSERT INTO `edu_course_description` VALUES ('1192252213659774977', '<p>Java是一门<a href=\"https://baike.baidu.com/item/%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1\" target=\"_blank\" rel=\"noopener\">面向对象</a>的编程语言，不仅吸收了<a href=\"https://baike.baidu.com/item/C%2B%2B\" target=\"_blank\" rel=\"noopener\">C++</a>语言的各种优点，还摒弃了C++里难以理解的多继承、<a href=\"https://baike.baidu.com/item/%E6%8C%87%E9%92%88/2878304\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"2878304\">指针</a>等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程。</p>', '2020-10-22 11:41:24', '2022-07-22 14:25:28');
INSERT INTO `edu_course_description` VALUES ('1316902348370411521', '<p>MySQL是一个<strong><a href=\"https://baike.baidu.com/item/%E5%85%B3%E7%B3%BB%E5%9E%8B%E6%95%B0%E6%8D%AE%E5%BA%93%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F/696511\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"696511\">关系型数据库管理系统</a></strong><strong>，</strong>由瑞典<a href=\"https://baike.baidu.com/item/MySQL%20AB/2620844\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"2620844\">MySQL AB</a>&nbsp;公司开发，属于&nbsp;<a href=\"https://baike.baidu.com/item/Oracle\" target=\"_blank\" rel=\"noopener\">Oracle</a>&nbsp;旗下产品。MySQL 是最流行的<a href=\"https://baike.baidu.com/item/%E5%85%B3%E7%B3%BB%E5%9E%8B%E6%95%B0%E6%8D%AE%E5%BA%93%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F/696511\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"696511\">关系型数据库管理系统</a>之一，在&nbsp;<a href=\"https://baike.baidu.com/item/WEB/150564\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"150564\">WEB</a>&nbsp;应用方面，MySQL是最好的&nbsp;<a href=\"https://baike.baidu.com/item/RDBMS/1048260\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"1048260\">RDBMS</a>&nbsp;(Relational Database Management System，关系数据库管理系统) 应用软件之一。</p>', '2020-10-16 08:42:42', '2022-07-22 14:26:14');
INSERT INTO `edu_course_description` VALUES ('1317006248872202242', '<p>Vue.js目前最火的的一个前端框架，三大主流前端框架之一。</p>\n<p>Vue.js是一套构建用户界面的框架（一套完整的解决方案，对项目侵入性大，中途需要跟换框架则需要重构整个项目），只关注视图层，易上手，有配套的第三方类库。</p>\n<p>提高开发效率，帮助减少不必要的dom操作；双向数据绑定，通过框架提供的指令，前端只需要关注业务逻辑，不再关心dom如何渲染。</p>', '2020-10-16 15:35:34', '2022-07-22 10:37:05');
INSERT INTO `edu_course_description` VALUES ('1317020820450533378', '<p><strong>145233<img class=\"wscnph\" src=\"data:image/jpeg;base64,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oooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBKKKKACiiigYUUUUAFFFFAF6ikyaTNQIdRTc0ZoAfRSUUwCiiigQEVGRUlIRTGR4o208LTsUARYoxUm2jbSGMxSgU/FLikA2ilxRikMaaSnYoAoAbikIqTFIRTER4pMU/FBFMBlFLg0mKYwooooATvS4pQKBQSB5XFRopUnNS0UDExRRS0DCjNFJQAuaUGm0oFSA8GlpAKcBSAa3SojU7DioiOaoRGaSpMU0jmkACpAajpc0APJppNJupOtAC0hooxTEKDSg03FA4oAmU5p4xVffinK+aRZYBp4NVw1SLJUMCYSEcU7zDjFQBsmpCeKkYhbNR55pWNIKYCnFMIFKaYTTAYetJTqKoQwikp5ppFMQ2lxQBTgKAExSEU/FIRTEMIpKeRSEUAMxRilopgNooopkBRRRQUJmjNJRQAuaM0lFABRRRQAUUUUAFFFFABRRRQAUUUUAFFLRQAlFLRQAlFLRQAlFLRQAlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAJRS0lAF7FNIqTFIRUARGgU4ikxSEOFLSUtMYUtJS0xCUUtLSGNop1JigBpNJupxWmlaYxQ1ODVHilxSAfupcimUUhj8ijikooAKSijNABSgUmaAaAH7RimMlSDpS4oEVylJtqwVFMK0ARYpKkK0wimAlLSUtMApwxSYpQKAAgUhp22jbSAZSil20uKQAKWkxSigYGm4p9JQAwimEVKaYaYDMUUppKYgooooEJRRijFABRRijFAB1NOFJilFADhSimilzQMnQ1KOlV0NTA8VFhikUmOKXNOA4oArfxVJ5fFLtAapVweKljK5TFNYcVbaMEVA6YNCmBARTcc1P5ftSeX7VegEOKKlZMdqjK0AANLSAU7jFADaXig0YpiGkUmKfikxTuIjIpMU8ikxTJGYoxTsUmKBjaKdikoASiiimAUUUUAFFFFADaKXFGKAEopcUYoASloxRigBaKKKACiiigAooooAKKKKAG0UUUAFFFFABRS4oxQAlFLijFACUUUUAFFFFABRRRQAUUUUAFFLijFACUUuKMUAX6Q0UhrMQhpo60ppKYxaKKXFABRRRTELS02ipGOoptFACk00mnYpMUxjaWnBRTtopgR0Zp5UUhWpGN3UbqCtJigBc0ZoooAM0A0UUAODU8NUOaUE0hE+c0mKapqQUwIytMK1YIqNloAgIoxzUhWk24pgGOKKKbk0xjxS4pgNPBpCF20m2njpRSAZtpMVJRigCI0w1MVphWgZHRT9tGKAI8UmKk20baoRHijFPxSEUwGYoxS4ooEJijFLRQAYopaKACiiigBympA1RClzU2GTBqkVqqhqmRqQyUgU0HBp+OKYTWa1GSLJ607CtVbdzT435ocQJdoo2+1KGGKUEUDInSomT2qycUxgKAKu3ml2VMVFIVqxERWkIqQ0mKYhhFNIqUrTStAEZFJipCtNK07iGYpMU/FJimIZikxT8UhFMY3FGKXFGKAExRilxRigBtFFFMAopaKAEooooAKWiigAooooAKKKKACiiigAooooASiiigAooooAKKKKACiiigAooooAKKKKAGnrSUpHNGKBCUtGKAOaAFoxS0UDExRilooAt0lLRUCEoxS0CgBAKdilApwFAxhFNqUimEUAJRRRSAKKKKACiiigYUZoooAWilooAbijFOpKAIyKTFPIoxQAzFKBTsUYoAKBSUtADgaeDUQNOBoESZopuaM0DFOKaRS5o70AM20mKlxSEUCI+lANKRTcGkA7caMmgCngCgBoJpwNLgUmBTAdTStOoqSiMrSbalpCOKYEVFOIpKokaaSnYoxTEMxSYqTFJigBmKTFPIpMUXER85paXFGKACiiimMKKKKQxaUE5pKXpUjLKtkUHmoUapgcikBGRQOtOIpAOaAH05TikpRikMUtRuFO2g00x0gGg04HNM5FKKAArzSHilJpCaYCf1pO3SlaRR+B5pBIrYYfdxUjGUUEiirJGGilNJVANNIaU0hqhDaKKKQwooooAbRRRVCCiiigAopaKAEopaKAEopaKAEopaSgAooooAKKKKACijFGKCQooxRigAooxRigAooxRigAooooAKKKKAEopaKAEopaKACiiigAooooAtUUUVABRRQaQDgaeDmoAakU0FEmKQilFKaYEOKKcRzSUgEopaKAEopaKBiUUtFADaKXFGKAEopcUAUAGKMU/FGKAGYoxT9tGKAI8UmKfikxQA2lFLikoAXNGaQ0lAh4NFIKWgB1FFKKBibaQpT6KQiLBzSinmm5oAWkwaUGnCgBMUlSbRQ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JjJzXZWMOY046GuK0yXbOg6iu505w23FZs1R0Oky/uyh981q2RA3IOxrCsCyTNxx1rctWUy5x97Gago0FaVPunIqRZSeXSkjIztarATPSmSRrIA/C1eilO2qHKPyKuRSqU6VIFrzOE+tTc1WLDgDsRVsHJFUI4H4uX4t/DUVsetxMo/Ac/0rxotleK9O+M8mbvTbfsFZv515cTjiumL0M2hpNManGmmrJAU4CmgU8UAX6KKKCQooooAKKSigBaKSigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAG0UUUDCiiigAooooAKKKKAEooooEFFFFABRSUUALRSUUALRSUUALRSUUAFFFFIAooooAKKKKACiiigBKM0UUAGaKKKAAdaUdaTtSrSQEFycsKg6tUkxy1RjrVFIco5okHFKtK/IoBlZhxUPQ1O/HFRd6yaKQwdalXpTMUZxSGK4plSDkUxhg0AFANJRUgSA08VADTw1AEmaXNR5pc1QCmkpM0ZoAKSiigAooooAKKKKACiiigBaKSikAtLmm0UAPzRmm0UxC5pd1NooAfuo3UyimA/dRuplFAEmacDUYpQaYx+aaTRmmk80gEY03NKxpopAKacKaacvWkBfsFxPxXWabIyMvPSuW08fva6WxYhxUM0R2eiss7sCOSK0liaKfjpWN4dP+mAetdPLGN+6pGCOT1q3DcY61CidOKseQCuR1pEFhdkq570zaEamQkI3NXQsMgGTQBCHyPl9RV6KTJ6VCsUajj1qyqgHgdqaA80+Mlpm30+8AyokKE/gTXkrnmvdvilYfa/Bs7gZa3ZJB+YFeENXRAhjaKKK0JFFOXrSYNOXrQIu0UUUCCiiigBKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAG0UUUDCiiigAooooAKKKKAEooooEFFFFACUUUUAFFFFABRRRQAUUUUAFFFFIAooooAKKKKACiiigBKKKKACiiigBKU8LRikc4WmgKb5BNOiUtS7d5qdUCJVFIj24pVTIpcipI8YoApTDBqGrUwBaqxGDWUkNDDTDUjUw1BQqmlIzTOlSJzQA0imEVMRUbCpAZTgaSimA/NLmm0UwHUUlLQAUUUUAFFFFABRRRQAUUUUAHNHNLRTsAnNHNLS0WASilopCEopaKAFxRijN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\" /></strong></p>', '2020-10-16 16:33:28', '2022-07-22 14:28:14');
INSERT INTO `edu_course_description` VALUES ('1318076075703500801', '<p>JavaScript（简称&ldquo;JS&rdquo;） 是一种具有函数优先的轻量级，解释型或即时编译型的<strong>编程语言</strong>。虽然它是作为开发Web页面的脚本语言而出名，但是它也被用到了很多非<a href=\"https://baike.baidu.com/item/%E6%B5%8F%E8%A7%88%E5%99%A8/213911\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"213911\">浏览器</a>环境中，JavaScript 基于原型编程、多范式的动态脚本语言，并且支持<a href=\"https://baike.baidu.com/item/%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1/2262089\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"2262089\">面向对象</a>、命令式、声明式、<a href=\"https://baike.baidu.com/item/%E5%87%BD%E6%95%B0/301912\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"301912\">函数</a>式编程范式。</p>', '2020-10-19 14:26:40', '2022-07-22 14:29:21');
INSERT INTO `edu_course_description` VALUES ('1318747112317362177', '<p>redis是一个<strong>key-value</strong>存储系统。和Memcached类似，它支持存储的value类型相对更多，包括string(字符串)、list(链表)、set(集合)、zset(sorted set --有序集合)和hash（哈希类型）。</p>\n<p>这些数据类型都支持push/pop、add/remove及取交集并集和差集及更丰富的操作，而且这些操作都是原子性的。在此基础上，redis支持各种不同方式的排序。</p>\n<p>与memcached一样，为了保证效率，数据都是缓存在内存中。区别的是redis会周期性的把更新的数据写入磁盘或者把修改操作写入追加的记录文件，并且在此基础上实现了master-slave(主从)同步。</p>', '2020-10-21 10:53:08', '2022-07-22 14:30:33');
INSERT INTO `edu_course_description` VALUES ('1318747684848246785', '<p><strong>RabbitMQ</strong>是实现了高级消息队列协议（AMQP）的开源消息代理软件（亦称面向消息的中间件）。RabbitMQ服务器是用<a href=\"https://baike.baidu.com/item/Erlang\" target=\"_blank\" rel=\"noopener\">Erlang</a>语言编写的，而群集和故障转移是构建在<a href=\"https://baike.baidu.com/item/%E5%BC%80%E6%94%BE%E7%94%B5%E4%BF%A1%E5%B9%B3%E5%8F%B0\" target=\"_blank\" rel=\"noopener\">开放电信平台</a>框架上的。所有主要的编程语言均有与代理接口通讯的客户端<a href=\"https://baike.baidu.com/item/%E5%BA%93\" target=\"_blank\" rel=\"noopener\">库</a>。</p>', '2020-10-21 10:55:24', '2022-07-22 14:31:13');
INSERT INTO `edu_course_description` VALUES ('1319121648275574786', '<p>Linux，全称GNU/Linux，是一种免费使用和自由传播的类UNIX操作系统，其内核由林纳斯&middot;本纳第克特&middot;托瓦兹于1991年10月5日首次发布，它主要受到Minix和Unix思想的启发，是一个基于POSIX的多用户、多任务、支持多线程和多CPU的操作系统。</p>\n<p>它能运行主要的Unix工具软件、应用程序和网络协议。它支持32位和64位硬件。Linux继承了Unix以网络为核心的设计思想，是一个性能稳定的多用户网络操作系统。</p>\n<p>Linux有上百种不同的发行版，如基于社区开发的debian、archlinux，和基于商业开发的Red Hat Enterprise Linux、SUSE、Oracle Linux等。</p>', '2022-03-22 15:48:59', '2022-07-22 14:44:05');
INSERT INTO `edu_course_description` VALUES ('1319140639874408450', '<p>数据结构是计算机存储、组织数据的方式。数据结构是指相互之间存在一种或多种特定的数据元素的集合。这里的结构就是指数据元素之间存在的关系，分为逻辑结构和存储结构。</p>\n<p>数据结构分类大体分为两类，包括包括线性结构和非线性结构</p>\n<p>1）线性结构作为最常用的数据结构，其特点就是数据元素之间存在一对一的线性关系</p>\n<p>2）线性结构有两种不同的存储结构：顺序结构(数组)和链式存储结构(链表)。顺序存储的线性表称为顺序表，顺序表中的存储元素是连续的。</p>\n<p>3）链式存储的线性表称为链表，链表中存储元素不一定是连续的，元素节点中存放数据元素以及相邻元素的信息。</p>\n<p>4）线性结构常见的有：数组、队列、链表和栈</p>\n<p>非线性结构</p>\n<p>线性结构包括：二维数组、多维数组、广义表、树结构、图结构</p>', '2020-10-22 12:56:52', '2022-07-22 14:33:48');
INSERT INTO `edu_course_description` VALUES ('1319152450967363586', '<p>介绍了计算机的基本组成原理和内部工作机制。全书共分8章，</p>\n<p>主要内容分成两个部分：第1、2章介绍了计算机的基础知识；</p>\n<p>第3-8章介绍了计算机的各子系统（包括运算器、存储器、控制器、外部设备和输入输出子系统等）的基本组成原理、设计方法、相互关系以及各子系统互相连接构成整机系统的技术。</p>', '2020-10-22 13:43:48', '2022-07-22 14:35:53');
INSERT INTO `edu_course_description` VALUES ('1319166036838113282', '<p>操作系统是管理计算机硬件与软件资源的计算机程序。操作系统需要处理如管理与配置<a class=\"hl hl-1\" href=\"https://so.csdn.net/so/search?q=%E5%86%85%E5%AD%98&amp;spm=1001.2101.3001.7020\" target=\"_blank\" rel=\"noopener\" data-report-click=\"{&quot;spm&quot;:&quot;1001.2101.3001.7020&quot;,&quot;dest&quot;:&quot;https://so.csdn.net/so/search?q=%E5%86%85%E5%AD%98&amp;spm=1001.2101.3001.7020&quot;}\" data-tit=\"内存\" data-pretit=\"内存\">内存</a>、决定系统资源供需的优先次序、控制输入设备与输出设备、操作网络与管理文件系统等基本事务。</p>\n<p>操作系统也提供一个让用户与系统交互的操作界面。</p>', '2020-10-22 14:37:47', '2022-07-22 14:37:17');
INSERT INTO `edu_course_description` VALUES ('1319174768083001346', '<p>Spring框架是一个<a href=\"https://baike.baidu.com/item/%E5%BC%80%E6%94%BE%E6%BA%90%E4%BB%A3%E7%A0%81/114160\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"114160\">开放源代码</a>的<a href=\"https://baike.baidu.com/item/J2EE/110838\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"110838\">J2EE</a>应用程序框架，由<a href=\"https://baike.baidu.com/item/Rod%20Johnson/1423612\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"1423612\">Rod Johnson</a>发起，是针对bean的生命周期进行管理的轻量级容器（lightweight container）。</p>\n<p>Spring解决了开发者在J2EE开发中遇到的许多常见的问题，提供了功能强大IOC、<a href=\"https://baike.baidu.com/item/AOP/1332219\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"1332219\">AOP</a>及Web MVC等功能。Spring可以单独应用于构筑应用程序，也可以和Struts、Webwork、Tapestry等众多Web框架组合使用，并且可以与 Swing等<a href=\"https://baike.baidu.com/item/%E6%A1%8C%E9%9D%A2%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F/2331979\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"2331979\">桌面应用程序</a>AP组合。</p>\n<p>因此，Spring不仅仅能应用于J2EE应用程序之中，也可以应用于桌面应用程序以及小应用程序之中。</p>\n<p>Spring框架主要由七部分组成，分别是 Spring Core、 Spring AOP、 Spring ORM、 Spring DAO、Spring Context、 Spring Web和 Spring Web MVC。</p>', '2020-10-22 15:12:29', '2022-07-22 14:38:31');
INSERT INTO `edu_course_description` VALUES ('1319566435449688065', '<p>消息（Message）是指在应用之间传送的数据，消息可以非常简单，比如只包含文本字符串，也可以更复杂，可能包含嵌入对象。</p>\n<p>消息队列（Message Queue）是一种应用间的通信方式，消息发送后可以立即返回，有消息系统来确保信息的可靠专递，消息发布者只管把消息发布到MQ中而不管谁来取，消息使用者只管从MQ中取消息而不管谁发布的，这样发布者和使用者都不用知道对方的存在。</p>', '2020-10-23 17:08:50', '2022-07-22 14:40:02');
INSERT INTO `edu_course_description` VALUES ('1506176095987294210', '<p>SpringBoot是企业级开发的整体整合解决方案，特别用于快速构建微服务应用，旨在用简单的方式让开发人员适应各种开发场景。SpringBoot全套视频分为上下两部，本视频属于上部，着重介绍SpringBoot的使用和内部原理，内容包含微服务概念、配置文件、日志框架的使用.web开发、Thymeleaf模板引擎.Docker容器技术、MyBatis、Spring Data、JPA、自定义starter等。学习本套视频基本需要掌握Spring、SpringMVC、Maven。配合《尚硅谷_Spring注解视频教程》一起学习效果更好。</p>', '2022-03-22 15:48:59', '2022-03-22 15:48:59');
INSERT INTO `edu_course_description` VALUES ('1843447675768399437', '<p>Java是一门<a href=\"https://baike.baidu.com/item/%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1\" target=\"_blank\" rel=\"noopener\">面向对象</a>的编程语言，不仅吸收了<a href=\"https://baike.baidu.com/item/C%2B%2B\" target=\"_blank\" rel=\"noopener\">C++</a>语言的各种优点，还摒弃了C++里难以理解的多继承、<a href=\"https://baike.baidu.com/item/%E6%8C%87%E9%92%88/2878304\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"2878304\">指针</a>等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程。</p>', '2022-07-22 14:45:50', '2022-07-22 14:45:55');

-- ----------------------------
-- Table structure for edu_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_subject`;
CREATE TABLE `edu_subject`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程类别ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别名称',
  `parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程科目' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_subject
-- ----------------------------
INSERT INTO `edu_subject` VALUES ('1312323828407891100', 'Python', '1312323828407992322', 0, '2022-07-20 17:42:28', '2022-07-20 17:42:30');
INSERT INTO `edu_subject` VALUES ('1312323828407990000', 'Java', '1312323828407992322', 0, '2022-07-20 17:42:28', '2022-07-20 17:42:30');
INSERT INTO `edu_subject` VALUES ('1312323828407990123', 'Linux', '1312323828407992322', 0, '2022-07-20 17:42:28', '2022-07-20 17:42:30');
INSERT INTO `edu_subject` VALUES ('1312323828407992322', '编程语言', '0', 0, '2020-10-12 16:07:52', '2020-10-12 16:07:52');
INSERT INTO `edu_subject` VALUES ('1313824869767992324', '操作系统', '1315775828407992321', 0, '2022-07-20 17:39:02', '2022-07-20 17:39:04');
INSERT INTO `edu_subject` VALUES ('1315523458265385985', 'Kafka', '1315564827900481538', 0, '2020-10-12 16:07:52', '2020-10-12 16:07:52');
INSERT INTO `edu_subject` VALUES ('1315524510767992372', '计算机组成原理', '1315775828407992321', 0, '2022-07-20 17:39:02', '2022-07-20 17:39:04');
INSERT INTO `edu_subject` VALUES ('1315524869767992322', '数据结构', '1315775828407992321', 0, '2022-07-20 17:39:02', '2022-07-20 17:39:04');
INSERT INTO `edu_subject` VALUES ('1315564825711054849', '前端开发', '0', 0, '2020-10-12 16:07:51', '2020-10-12 16:07:51');
INSERT INTO `edu_subject` VALUES ('1315564826696716290', 'Vue', '1315564825711054849', 0, '2020-10-12 16:07:51', '2020-10-12 16:07:51');
INSERT INTO `edu_subject` VALUES ('1315564827028066305', 'JavaScript', '1315564825711054849', 0, '2020-10-12 16:07:51', '2020-10-12 16:07:51');
INSERT INTO `edu_subject` VALUES ('1315564827690766338', 'Jquery', '1315564825711054849', 0, '2020-10-12 16:07:52', '2020-10-12 16:07:52');
INSERT INTO `edu_subject` VALUES ('1315564827900481538', '后端开发', '0', 0, '2020-10-12 16:07:52', '2022-07-20 17:42:30');
INSERT INTO `edu_subject` VALUES ('1315564828089225217', 'SpringBoot', '1315564827900481538', 0, '2020-10-12 16:07:52', '2022-07-20 17:42:30');
INSERT INTO `edu_subject` VALUES ('1315564828265385985', 'SpringCloud', '1315564827900481538', 0, '2020-10-12 16:07:52', '2022-07-20 17:42:30');
INSERT INTO `edu_subject` VALUES ('1315564828277655985', 'RabbitMQ', '1315564827900481538', 0, '2020-10-12 16:07:52', '2020-10-12 16:07:52');
INSERT INTO `edu_subject` VALUES ('1315564828407992322', '数据库开发', '0', 0, '2020-10-12 16:07:52', '2020-10-12 16:07:52');
INSERT INTO `edu_subject` VALUES ('1315564828592541698', 'MySQL', '1315564828407992322', 0, '2020-10-12 16:07:52', '2020-10-12 16:07:52');
INSERT INTO `edu_subject` VALUES ('1315564866667992322', 'Oracle', '1315564828407992322', 0, '2022-07-20 17:39:02', '2022-07-20 17:39:04');
INSERT INTO `edu_subject` VALUES ('1315564867767992322', 'Redis', '1315564828407992322', 0, '2022-07-20 17:39:02', '2022-07-20 17:39:04');
INSERT INTO `edu_subject` VALUES ('1315775828407992321', '编程基础', '0', 0, '2020-10-12 16:07:52', '2020-10-12 16:07:52');

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '讲师ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '讲师姓名',
  `intro` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '讲师简介',
  `career` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讲师资历,一句话说明讲师',
  `level` int(10) UNSIGNED NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讲师头像',
  `phonenumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `audit_status` int(2) NULL DEFAULT 0 COMMENT '审核状态（0-待审核 1-审核通过 2-审核不通过）',
  `audit_opinion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '讲师' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------
INSERT INTO `edu_teacher` VALUES ('1133437453429129218', '没名字', '1111', '1111', 1, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', '13888888888', 'test@qq.com', '0', 7, 0, 0, NULL, '2019-11-15 21:47:12', '2022-03-22 14:40:38');
INSERT INTO `edu_teacher` VALUES ('1189389726308478977', '晴天', '高级讲师简介', '高级讲师资历', 2, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', '13888888888', 'test@qq.com', '0', 2, 0, 1, '测试意见', '2022-03-29 17:24:27', '2022-07-28 11:12:20');
INSERT INTO `edu_teacher` VALUES ('1189390295668469762', '李刚', '高级讲师简介', '高级讲师', 1, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', '13888888888', 'test@qq.com', '0', 3, 0, 1, NULL, '2019-10-30 11:55:19', '2019-11-12 13:37:52');
INSERT INTO `edu_teacher` VALUES ('1189426437876985857', '孟老师', '教授', '具有多年项目开发和教育培训经验，曾在日本野村证券主持开发金融证券项目，对金融数据处理具有丰富的经验。', 2, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/17/d095c8da3d49ea9fe.png', '13888888888', 'test@qq.com', '0', 4, 0, 1, NULL, '2019-10-30 14:18:56', '2019-11-12 13:37:35');
INSERT INTO `edu_teacher` VALUES ('1189426464967995393', '王五', '高级讲师简介', '高级讲师', 1, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', '13888888888', 'test@qq.com', '0', 5, 0, 1, NULL, '2019-10-30 14:19:02', '2019-11-12 13:37:18');
INSERT INTO `edu_teacher` VALUES ('1192249914833055746', '李四', '高级讲师简介', '高级讲师', 2, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', '13888888888', 'test@qq.com', '0', 6, 0, 1, NULL, '2019-11-07 09:18:25', '2019-11-12 13:37:01');
INSERT INTO `edu_teacher` VALUES ('1195337453429129218', '李老师', '先后出版过《UNIX系统管理实用教程》、《Sun Solaris 8系统管理员指南》、《PHP5项目开发实战详解》、《完美应用Ubuntu》、《细说Linux系统管理》等多本计算机技术图书，国内多所大学特聘讲师，猎聘特邀讲师。近年来致力于Linux开源技术推广及职业教育，录制的Linux视频教程是无数从业者的入门宝典，出版的就业指导图书《明哥聊求职》广受好评，曾作客BTV《书香北京》栏目分享，在中国大学慕课网开设《年轻人的第一堂就业指导课》，2017年明哥聊求职获教育行业优秀自媒体奖，全网粉丝近百万。', '从业近二十年，曾任即时Linux研究院副院长、PHPChina技术总监等职，国内早期的UNIX/Linux从业者，中国UNIX用户协会成员，首批红旗Linux认证讲师。', 1, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', '13888888888', 'test@qq.com', '0', 7, 0, 1, NULL, '2019-11-15 21:47:12', '2022-03-22 14:40:38');
INSERT INTO `edu_teacher` VALUES ('1235465777548999552', '张三', '近年主持国家自然科学基金（6项）、江苏省重大科技成果转化项目（5项）、江苏省产学研前瞻性联合研究项目（3项）、省工业科技支撑、省高技术、省自然科学基金等省部级及其企业的主要科研项目40多个，多个项目在企业成功转化，产生了较好的经济、社会和环境效益。积极开展产学研科技合作，并与省内16家企业建立了江苏省研究生工作站，其中6家为江苏省优秀研究生工作站', '高级', 1, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', '13888888888', 'test@qq.com', '0', 1, 0, 1, NULL, '2022-03-29 17:24:27', '2019-11-12 13:36:36');
INSERT INTO `edu_teacher` VALUES ('1310497690173407233', '夏老师', '尚硅谷高级讲师', '\r\n中国科学院大学硕士，有多年JavaEE开发、项目管理经验。', 2, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/17/d095c8da3d49ea9fe.png', '13888888888', 'test@qq.com', '0', 8, 0, 1, NULL, '2020-09-28 16:32:52', '2020-09-28 16:32:52');
INSERT INTO `edu_teacher` VALUES ('1313425019266715649', '张讲师', '讲师简介', '讲师', 1, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/17/d095c8da3d49ea9fe.png', '13888888888', 'test@qq.com', '0', 9, 0, 1, NULL, '2020-10-06 18:25:02', '2020-10-06 18:25:02');
INSERT INTO `edu_teacher` VALUES ('1313425310498213889', '封老师', '具多年软件开发经验，曾主持或参与开发《中国电力轨道交通线路数据交换平台》、《SG186工程宁夏电网营销 稽查管理项目》、《天津市广告监管系统》等项目。对JavaEE 技术体系结构、JavaWeb 原理有深刻理解，精通多种主流框架以及 Maven、Ant 等构建工具。 课堂教学循序渐进，深入浅出，主张快乐学习，学以致用。', '教授', 2, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/17/54345655678987.png', '13888888888', 'test@qq.com', '0', 10, 0, 1, NULL, '2020-10-06 18:26:11', '2022-03-22 14:43:24');
INSERT INTO `edu_teacher` VALUES ('1313753567470829570', '王讲师', '尚硅谷高级讲师', '精通Java、C/C++等语言，熟练使用Java核心框架、大数据Hadoop、Spark框架，曾参与在线教育平台，股票交易系统，电子政务系统等大型、超大型项目的开发。课堂内容厚重，深入浅出，擅长通过实例让学员掌握新知识点及最新发展动向。', 1, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/17/d095c8da3d49ea9fe.png', '13888888888', 'test@qq.com', '0', 11, 0, 1, NULL, '2020-10-07 16:10:34', '2020-10-07 16:23:05');
INSERT INTO `edu_teacher` VALUES ('1314117799093780481', '测试上传图片', '2222', '1111', 2, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', '13888888888', 'test@qq.com', '0', 17, 0, 2, NULL, '2020-10-08 16:17:53', '2022-07-28 13:29:12');
INSERT INTO `edu_teacher` VALUES ('1314200439788519425', '缪老师', '精通 Go、Hadoop、Spark、Android、Java、C/C++，对区块链、大数据、Linux 等有深入研究。技术功底深厚，热衷于新技术的研究。从业IT教育多年，学员多任职于腾讯、联想、京东、新浪、Oracle、IBM 等国内外互联网公司。人称大海哥，号称尚硅谷第一帅。', '辽工大外聘大数据、区块链专家、辽工大保送硕士，曾就职于交大思诺、文思海辉、宅急送等知名企业，历任项目经理、架构师 。多年项目开发、管理经验。', 1, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/17/3037602452.png', '13888888888', 'test@qq.com', '0', 12, 0, 1, '11111', '2020-10-08 21:46:16', '2022-07-28 14:09:54');
INSERT INTO `edu_teacher` VALUES ('1436576767676767676', '宋老师', '东北师大理学学士，北京航空航天大学硕士，曾于北航软件开发环境国家重点实验室研究多项课题，对智能交通—浮动车海量数据挖掘及在线社交网络信息传播和控制问题有深入研究，曾发表论文数篇。具备丰富的软件开发经验和教学经验。精通C/C++、Java、Objective-C 等开发语言， 对JavaEE、Android开发有深入理解，对以Java语言为基础的各种框架有深入研究。亲自主持开发过多个大型项目，具备很强的项目管理能力和丰富的项目实施经验。', '先后担任过高级软件开发工程师，系统架构师，高级讲师。', 1, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/17/82035c6ac95a4136af.png', '13888888888', 'test@qq.com', '0', 16, 0, 1, NULL, '2020-10-05 08:50:28', '2022-03-22 14:41:33');
INSERT INTO `edu_teacher` VALUES ('1506158412432531457', '佟老师', ' 十年软件开发经验：参与完成辽宁某高校远程教学管理系统、慧文信息门户系统、日本麦卡尔超市管理系统、崎玉市外来人口登记系统、深海视频会议管理系统、仙台市宫城县日常事务系统等项目的设计和开发。 十年软件培训经验：曾在中国AOP全球外包排名第一的公司任Java、Oracle培训讲师、负责对公司员工新技术培训；曾任花旗银行特约JavaEE培训讲师；某部队研究所JavaEE培训；曾受聘为北航、厦门大学移动云计算专业教学主任， 并主讲Java、Android、iOS课程。', '资深项目经理、技术讲师、SUN SCJP、SCWCD、原工信部移动云计算教育培训中心教学总监。', 2, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/17/20200605233405.png', '13888888888', 'test@qq.com', '0', 13, 0, 1, NULL, '2022-03-22 14:38:43', '2022-03-22 14:38:43');
INSERT INTO `edu_teacher` VALUES ('1508736834995785730', '郭老师', '资深项目经理、技术讲师、SUN SCJP、SCWCD、原工信部移动云计算教育培训中心教学总监。', '高级讲师', 1, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/17/RIWGcrWG15dXN.png', '13888888888', 'test@qq.com', '0', 14, 0, 1, NULL, '2022-03-29 17:24:27', '2022-07-22 15:06:32');
INSERT INTO `edu_teacher` VALUES ('2215678333805357853', '周老师', '历经电信、互联网金融等热门行业的项目历练，对传统JavaEE技术体系、云计算、大数据及当下热门的互联网技术都具有深厚的技术功底。 能够将企业流行、实用的技术带回课堂，引导学生少走弯路。', '多年开发及管理经验，曾先后就职于神华和信、亚信联创、安润金融等大中型互联网公司，任技术经理、项目经理、架构师等职位。', 2, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/17/OEJMdlFjYU1WOF.png', '13888888888', 'test@qq.com', '0', 15, 0, 1, NULL, '2020-09-09 18:35:18', '2022-03-22 14:42:12');

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `chapter_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '节点名称',
  `video_source_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '云端视频资源',
  `video_original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始文件名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `play_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '播放次数',
  `is_free` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可以试听：0收费 1免费',
  `duration` float NOT NULL DEFAULT 0 COMMENT '视频时长（秒）',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Empty' COMMENT 'Empty未上传 Transcoding转码中  Normal正常',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '视频源文件大小（字节）',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程视频' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_video
-- ----------------------------
INSERT INTO `edu_video` VALUES ('1506176721240580098', '1506176095987294210', '1506176567448035329', 'SpringBoot概述、HelloWord案例', 'a00729efa3a749eda8b0c55e08969b36', '6 - What If I Want to Move Faster.mp4', 1, 0, 0, 0, 'Empty', 0, 1, '2022-03-22 15:51:28', '2022-03-29 17:26:55');
INSERT INTO `edu_video` VALUES ('1506177526425313281', '1506176095987294210', '1506176567448035329', 'SpringBoot的yaml配置注入', 'c55d4cfcc36c47c5b7fd9f34e5367555', '6 - What If I Want to Move Faster.mp4', 2, 0, 0, 0, 'Empty', 0, 1, '2022-03-22 15:54:40', '2022-03-22 15:55:08');
INSERT INTO `edu_video` VALUES ('1506177590786908161', '1506176095987294210', '1506176567448035329', 'SpringBoot运行原理', 'c55d4cfcc36c47c5b7fd9f34e5367555', '6 - What If I Want to Move Faster.mp4', 3, 0, 0, 0, 'Empty', 0, 1, '2022-03-22 15:54:56', '2022-03-22 15:54:56');
INSERT INTO `edu_video` VALUES ('1550309800535920642', '1318747112317362177', '1550309313749192706', 'Redis - 常用数据类型', '80c966f9d68a47b491db6459b6b250ca', '6 - What If I Want to Move Faster.mp4', 1, 0, 0, 0, 'Empty', 0, 1, '2022-07-22 10:40:34', '2022-07-22 10:40:34');
INSERT INTO `edu_video` VALUES ('1550309988763701249', '1318747112317362177', '1550309313749192706', 'Redis -  事务和锁机制', 'a6197d70b9854711a20743bed89b6403', '6 - What If I Want to Move Faster.mp4', 2, 0, 0, 0, 'Empty', 0, 1, '2022-07-22 10:41:19', '2022-07-22 10:41:19');
INSERT INTO `edu_video` VALUES ('1550310242087079938', '1318747112317362177', '1550309399027781634', 'Redis - 应用问题解决 - 缓存雪崩', '2788d0e52cad4d1080e5c7f92433aef3', '6 - What If I Want to Move Faster.mp4', 1, 0, 0, 0, 'Empty', 0, 1, '2022-07-22 10:42:20', '2022-07-22 10:42:20');
INSERT INTO `edu_video` VALUES ('1550313463379660801', '1192252213659774977', '1192252428399751169', '1. Java基本语法', '8e5dc3a30128424db7542638501c2225', '6 - What If I Want to Move Faster.mp4', 1, 0, 0, 0, 'Empty', 0, 1, '2022-07-22 10:55:08', '2022-07-22 10:55:08');
INSERT INTO `edu_video` VALUES ('1550313580107141121', '1192252213659774977', '1192252428399751169', '2. 数组', '9ae3e9534a7c4912bfac48c6d9b95576', '6 - What If I Want to Move Faster.mp4', 2, 0, 0, 0, 'Empty', 0, 1, '2022-07-22 10:55:36', '2022-07-22 10:55:36');
INSERT INTO `edu_video` VALUES ('1550313679868661762', '1192252213659774977', '1192252428399751169', '3. 集合类', '1af707a5f35042c7a3c5e4968a526e0f', '6 - What If I Want to Move Faster.mp4', 3, 0, 0, 0, 'Empty', 0, 1, '2022-07-22 10:55:59', '2022-07-22 10:55:59');

-- ----------------------------
-- Table structure for statistics_daily
-- ----------------------------
DROP TABLE IF EXISTS `statistics_daily`;
CREATE TABLE `statistics_daily`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `date_calculated` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '统计日期',
  `register_num` int(11) NOT NULL DEFAULT 0 COMMENT '注册人数',
  `login_num` int(11) NOT NULL DEFAULT 0 COMMENT '登录人数',
  `video_view_num` int(11) NOT NULL DEFAULT 0 COMMENT '每日播放视频数',
  `course_num` int(11) NOT NULL DEFAULT 0 COMMENT '每日新增课程数',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `statistics_day`(`date_calculated`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站统计日数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of statistics_daily
-- ----------------------------
INSERT INTO `statistics_daily` VALUES ('1323854010578333698', '2021-10-27', 2, 176, 176, 145, '2020-11-04 13:06:07', '2020-11-04 13:06:07');
INSERT INTO `statistics_daily` VALUES ('1323888458623492098', '2021-12-28', 1, 167, 147, 171, '2020-11-04 15:23:00', '2020-11-04 15:23:00');
INSERT INTO `statistics_daily` VALUES ('1323888602873995266', '2012-03-15', 2, 169, 185, 167, '2020-11-04 15:23:34', '2020-11-04 15:23:34');
INSERT INTO `statistics_daily` VALUES ('1506181894373408770', '2022-03-22', 10, 180, 196, 178, '2022-03-22 16:12:02', '2022-03-22 16:12:02');
INSERT INTO `statistics_daily` VALUES ('1552225255383228417', '2022-07-27', 0, 149, 160, 117, '2022-07-27 17:31:54', '2022-07-27 17:31:54');
INSERT INTO `statistics_daily` VALUES ('1552225255383228418', '2022-07-27', 0, 133, 101, 133, '2022-07-27 17:31:54', '2022-07-27 17:31:54');
INSERT INTO `statistics_daily` VALUES ('1552461841874137089', '2022-07-28', 0, 132, 115, 159, '2022-07-28 09:12:01', '2022-07-28 09:12:01');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `course_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `course_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `course_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程封面',
  `teacher_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讲师id',
  `teacher_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讲师名称',
  `member_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员手机',
  `total_fee` decimal(10, 2) NULL DEFAULT 0.01 COMMENT '订单金额（分）',
  `pay_type` tinyint(3) NULL DEFAULT NULL COMMENT '支付类型（1：微信 2：支付宝）',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '订单状态（0：未支付 1：已支付）',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_order_no`(`order_no`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1550379357845856257', '20220722151658294', '1317006248872202242', 'Vue高级课程', 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/151728236468.png', '1189426464967995393', '王五', '1080736474267144193', '用户XJtDf', '13888888888', 0.01, 1, 1, 0, NULL, '2022-07-22 15:16:58', '2022-07-22 15:18:31');
INSERT INTO `t_order` VALUES ('1550382494895841281', '20220722152926480', '1317006248872202242', 'Vue高级课程', 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/22/151728236468.png', '1189426464967995393', '王五', '1320958790404640770', '测试用户', '15645026572', 0.01, 1, 1, 0, NULL, '2022-07-22 15:29:26', '2022-07-22 15:29:42');

-- ----------------------------
-- Table structure for t_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_log`;
CREATE TABLE `t_pay_log`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付完成时间',
  `total_fee` decimal(10, 2) NULL DEFAULT 0.01 COMMENT '支付金额（分）',
  `transaction_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `trade_state` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易状态',
  `pay_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '支付类型（1：微信 2：支付宝）',
  `attr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '其他属性',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_pay_log
-- ----------------------------
INSERT INTO `t_pay_log` VALUES ('1550379746179686401', '20220722151658294', '2022-07-22 15:18:31', 0.01, '4200001546202207224898944244', 'SUCCESS', 1, '{\"transaction_id\":\"4200001546202207224898944244\",\"nonce_str\":\"d09dw88UkOArhh28\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"BOC_DEBIT\",\"openid\":\"oHwsHuFJML39xfpy4armetXTJKnI\",\"sign\":\"C67D10EE832F354E560676096AFC802D\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20220722151658294\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20220722151829\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2022-03-24 10:09:12', '2022-03-24 10:09:12');
INSERT INTO `t_pay_log` VALUES ('1550382561392336898', '20220722152926480', '2022-07-22 15:29:42', 0.01, '4200001476202207227910127958', 'SUCCESS', 1, '{\"transaction_id\":\"4200001476202207227910127958\",\"nonce_str\":\"CbOc6pmmRMdRT1st\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"BOC_DEBIT\",\"openid\":\"oHwsHuFJML39xfpy4armetXTJKnI\",\"sign\":\"2BEEC051D4532EB6336120C6B1DF6623\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20220722152926480\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20220722152940\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2022-07-22 15:29:42', '2022-07-22 15:29:42');
INSERT INTO `t_pay_log` VALUES ('1552566676875231233', '20220728160804744', '2022-07-28 16:08:36', 0.01, '4200001493202207289878534603', 'SUCCESS', 1, '{\"transaction_id\":\"4200001493202207289878534603\",\"nonce_str\":\"zXHKTvdMemnRzhHc\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"BOC_DEBIT\",\"openid\":\"oHwsHuFJML39xfpy4armetXTJKnI\",\"sign\":\"BDE3B7187C492C0025DD8A3D3FAD4B47\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20220728160804744\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20220728160838\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2022-07-28 16:08:36', '2022-07-28 16:08:36');

-- ----------------------------
-- Table structure for ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_member`;
CREATE TABLE `ucenter_member`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员id',
  `openid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '性别 1 女，2 男',
  `age` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户签名',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 1（true）已禁用，  0（false）未禁用',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ucenter_member
-- ----------------------------
INSERT INTO `ucenter_member` VALUES ('1080736474267144193', NULL, '13888888888', '96e79218965eb72c92a549dd5a330112', '用户XJtDf', 1, 19, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/17/54345655678987.png', NULL, 0, 0, '2019-01-02 12:12:45', '2019-01-02 12:12:56');
INSERT INTO `ucenter_member` VALUES ('1320958790404640770', NULL, '18846206515', '96e79218965eb72c92a549dd5a330112', '测试用户', NULL, NULL, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/2020/10/17/d095c8da3d49ea9fe.png', NULL, 0, 0, '2020-10-27 13:21:33', '2020-10-27 13:21:33');
INSERT INTO `ucenter_member` VALUES ('1321323412429189122', 'o3_SC57EClyClYfmHUm3uhz2mcDA', '', NULL, '逆行的雪豹', NULL, NULL, 'https://guli-edu-20201.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', NULL, 0, 0, '2020-10-28 13:30:25', '2020-10-28 13:30:25');

SET FOREIGN_KEY_CHECKS = 1;
