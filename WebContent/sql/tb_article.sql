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

 Date: 01/06/2021 19:07:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_article
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article`  (
  `art_id` int(11) NOT NULL AUTO_INCREMENT,
  `art_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '无',
  `art_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '无',
  `art_pubtime` datetime(0) NULL DEFAULT NULL,
  `art_readnum` int(11) NULL DEFAULT 0,
  `art_author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isPublic` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `author_id` int(5) NULL DEFAULT NULL,
  `isReview` int(2) NULL DEFAULT 1,
  `ReviewNum` int(11) NULL DEFAULT 0,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `art_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '无',
  PRIMARY KEY (`art_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_article
-- ----------------------------
INSERT INTO `tb_article` VALUES (1, 'Python医学处理', 'Python医学处理', '2021-05-06 21:52:25', 3, '张三', '1', 1, 1, 2, '人工智能', '医学处理');
INSERT INTO `tb_article` VALUES (2, '知识图谱', '知识图谱的前世今生', '2021-05-03 19:36:20', 3, '李四', '0', 2, 1, 3, '人工智能', '知识图谱');
INSERT INTO `tb_article` VALUES (3, 'C++多态', 'C++多态详谈', '2021-05-05 21:53:47', 2, '王五', '1', 3, 0, 1, 'C++', '多态');
INSERT INTO `tb_article` VALUES (4, 'java如何把String类型转换为int类型', 'parseInt（）是Integer包装类里的一个方法，可以将字符串解析为带符号的整数\r\n\r\n示例：定义一个值为“1234” 的String类型的字符串变量str和一个值为100的int类型的整型变量inum ；使用parseInt（）方法，把变量str 作为其参数，在解析后把整数值返回给int类型变量inum2；最后输出整型变量“inum”、“inum2”的相加之和（整型变量sum的值）。', '2021-05-12 19:38:35', 4, '陈七', '0', 4, 0, 1, 'java', '字符串转化');
INSERT INTO `tb_article` VALUES (5, '在Java中将double转换为int的操作方法', '您可以通过三种方式将double转换为int。我将在下面列出所有内容，然后我们将一一列出。1，将double转换为int —使用类型转换2，将double转换为int —使用 Math.round()3，将double转换为int —使用 Double.IntValue()//创建Double wrapper对象Double doubleValueObject = 新 Double（doubleValue）;//将case双精度型转换为intint intValue = doubleValueObject。intValue（）;', '2021-05-02 03:52:42', 3, '张三', '1', 1, 1, 2, 'java', '数字转化');
INSERT INTO `tb_article` VALUES (6, 'HTML DOM Input Date 对象', '访问 Input Date 对象\r\n您可以通过使用 getElementById() 来访问元素：var x = document.getElementById(\"myDate\");', '2021-05-11 00:00:00', 0, '张三', '1', 1, 1, 0, 'html', 'Input Date 对象');
INSERT INTO `tb_article` VALUES (7, 'HTML DOM Element 对象', 'Element 对象\r\n在 HTML DOM 中，Element 对象表示 HTML 元素。\r\n\r\nElement 对象可以拥有类型为元素节点、文本节点、注释节点的子节点。\r\nNodeList 对象表示节点列表，比如 HTML 元素的子节点集合。', '2021-05-04 00:00:00', 1, '张三', '1', 1, 1, 0, 'html', 'HTML DOM Element 对象');
INSERT INTO `tb_article` VALUES (9, 'JavaScript 对象入门', '在 JavaScript 中，大多数事物都是对象, 从作为核心功能的字符串和数组，到建立在 JavaScript 之上的浏览器 API 。你甚至可以自己创建对象，将相关的函数和变量高效地封装打包成便捷的数据容器。对于进一步学习 JavaScript 语言知识而言，理解这种面向对象（object-oriented, OO）的特性是必不可少的，所以，我们提供了这个模块来帮助你了解这一切。这里我们会先详细介绍对象的理论和语法，再介绍如何创建对象。', '2021-05-19 20:09:07', 0, '唐糖', '1', 10, 1, 0, 'javaScript', 'JavaScript');

SET FOREIGN_KEY_CHECKS = 1;
