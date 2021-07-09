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

 Date: 01/06/2021 19:10:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_artreview
-- ----------------------------
DROP TABLE IF EXISTS `tb_artreview`;
CREATE TABLE `tb_artreview`  (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `review_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `review_txt` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `review_time` datetime(0) NULL DEFAULT NULL,
  `ruser_id` int(5) NULL DEFAULT NULL,
  `isPublic` int(10) NULL DEFAULT NULL,
  `art_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`review_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_artreview
-- ----------------------------
INSERT INTO `tb_artreview` VALUES (1, 'zsan', '文章不错', '2021-05-05 21:54:20', 1, 1, 4);
INSERT INTO `tb_artreview` VALUES (4, 'zsan', '同求，博主数据集', '2021-05-04 20:17:29', 1, 1, 5);
INSERT INTO `tb_artreview` VALUES (7, 'cq', '学到了，收藏一波', '2021-05-01 00:00:00', 4, 1, 1);
INSERT INTO `tb_artreview` VALUES (8, 'zsan', 'dalao', '2021-04-07 00:00:00', 1, 1, 3);
INSERT INTO `tb_artreview` VALUES (9, 'lisi', '大佬可以跟你交流吗？', '2021-05-02 22:23:26', 2, 0, 1);

SET FOREIGN_KEY_CHECKS = 1;
