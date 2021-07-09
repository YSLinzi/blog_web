/*
 Navicat Premium Data Transfer

 Source Server         : ysl
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : bloguser

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 01/06/2021 19:10:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_bloguser
-- ----------------------------
DROP TABLE IF EXISTS `tb_bloguser`;
CREATE TABLE `tb_bloguser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '无',
  `user_blogname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '无',
  `user_stime` datetime(0) NULL DEFAULT NULL,
  `user_pro` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `user_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_bloguser
-- ----------------------------
INSERT INTO `tb_bloguser` VALUES (1, '张三', '123', '我不是张三', 'zsan', '2021-05-03 21:50:01', '1', '1', '13534678987');
INSERT INTO `tb_bloguser` VALUES (2, '李四', '456', 'wo shi lisi', 'lisi', '2021-05-11 20:14:08', '1', '1', '13534623098');
INSERT INTO `tb_bloguser` VALUES (3, '王五', '789', 'wuwuwu', 'wu', '2021-05-03 17:17:50', '2', '0', '15890566375');
INSERT INTO `tb_bloguser` VALUES (4, '陈七', '001', 'yes yes up!', 'cq', '2021-04-05 20:15:25', '1', '1', '13534678965');
INSERT INTO `tb_bloguser` VALUES (5, '赵柳', '390', 'new ', 'zliu', '2021-05-13 20:33:58', '1', '0', '13534623167');
INSERT INTO `tb_bloguser` VALUES (6, 'Selina', '990', '为什么', 'SSlin', '2021-05-04 20:10:10', '1', '0', '15820566375');
INSERT INTO `tb_bloguser` VALUES (7, '李华', 'yu9', '人生如戏', 'liHua', '2021-05-19 00:05:10', '1', '0', '1572015637');
INSERT INTO `tb_bloguser` VALUES (9, '叶字', 'slo9', '太难了', 'Yezi', '2021-05-19 00:12:40', '1', '0', '15720206375');
INSERT INTO `tb_bloguser` VALUES (10, '唐糖', 'sfo', '好事', 'Tag', '2021-05-19 00:34:37', '1', '1', '15720206385');
INSERT INTO `tb_bloguser` VALUES (11, 'aaaa', 'yu907', '有一种快乐叫做你不懂', 'Ty', '2021-05-23 09:51:43', '1', '0', '15720516385');
INSERT INTO `tb_bloguser` VALUES (12, 'bbbbb', 'miaomiao', '难', 'BB', '2021-05-23 09:52:37', '1', '0', '1572815637');
INSERT INTO `tb_bloguser` VALUES (13, 'eeee', 'caocao', '蘑菇', 'EE', '2021-05-23 10:01:57', '1', '0', '15829034372');
INSERT INTO `tb_bloguser` VALUES (14, 'yeye34', '66667', '啊啊啊啊', 'Ye', '2021-05-23 10:05:19', '1', '0', '15720566375');

SET FOREIGN_KEY_CHECKS = 1;
