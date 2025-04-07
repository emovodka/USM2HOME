/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : house_rental

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 23/04/2022 20:37:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_bill`;
CREATE TABLE `t_bill`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_user_id` bigint(0) NULL DEFAULT NULL COMMENT '租客用户ID',
  `house_id` bigint(0) NULL DEFAULT NULL COMMENT '房屋ID',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态：0待支付，1已支付',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `total_amount` int(0) NULL DEFAULT NULL COMMENT '金额',
  `owner_user_id` bigint(0) NULL DEFAULT NULL COMMENT '房东用户id',
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `house_id`(`house_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `owner_user_id`(`owner_user_id`) USING BTREE,
  INDEX `customer_user_id`(`customer_user_id`) USING BTREE,
  CONSTRAINT `t_bill_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_bill_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_bill_ibfk_3` FOREIGN KEY (`owner_user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_bill_ibfk_4` FOREIGN KEY (`customer_user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bill
-- ----------------------------
INSERT INTO `t_bill` VALUES (1, 1001, 105, 1, '水电费', '2022-04-09 17:29:25', 100, 1000, 15);
INSERT INTO `t_bill` VALUES (2, 1001, 105, 1, '水电费', '2022-04-09 17:40:33', 80, 1000, 15);
INSERT INTO `t_bill` VALUES (3, 1001, 11, 1, '租金、物业费、停车费', '2022-04-09 17:43:30', 4900, 1000, NULL);
INSERT INTO `t_bill` VALUES (4, 1001, 11, 1, '3月水电费', '2022-04-09 17:48:41', 80, 1000, 17);
INSERT INTO `t_bill` VALUES (5, 1001, 11, 0, '5月水电费', '2022-04-23 19:43:15', 100, 1000, 17);
INSERT INTO `t_bill` VALUES (6, 1001, 11, 0, '桌子损坏费用', '2022-04-23 19:54:14', 50, 1000, 17);

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '文章ID',
  `post_user_id` bigint(0) NOT NULL COMMENT '文章用户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `post_id`(`post_id`) USING BTREE,
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `t_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, '2021-04-24 00:45:04', '支持！！', 1003, 1, 1001);
INSERT INTO `t_comment` VALUES (20, '2021-04-24 00:52:10', '加我微信123123', 1000, 1, 1001);

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈标题',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈内容',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `status` int(0) NOT NULL COMMENT '处理状态：0待处理，1已处理',
  `reply` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `t_feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES (1, '2021-03-14 13:48:47', '标题标题标题标题', '2222', 1001, 1, NULL);
INSERT INTO `t_feedback` VALUES (2, '2021-03-14 13:48:47', '标题标题标题标题', '内容内容内容内容', 1001, 0, NULL);
INSERT INTO `t_feedback` VALUES (3, '2021-03-14 13:48:47', '标题标题标题标题', '内容内容内容内容', 1001, 1, '好的！！！');
INSERT INTO `t_feedback` VALUES (4, '2021-03-14 13:48:47', '标题标题标题标题', '内容内容内容内容', 1001, 1, '谢谢反馈，已经解决了');
INSERT INTO `t_feedback` VALUES (8, '2021-03-21 19:27:18', '2222', '222', 1, 1, '2222');
INSERT INTO `t_feedback` VALUES (11, '2021-03-21 19:28:23', '222', '22', 1, 0, NULL);
INSERT INTO `t_feedback` VALUES (12, '2021-03-21 21:18:00', '反馈一下啊', '反馈一下啊反馈一下啊反馈一下啊反馈一下啊反馈一下啊', 1001, 1, '谢谢反馈，已处理哦！！！');
INSERT INTO `t_feedback` VALUES (13, '2022-04-23 19:47:11', '我是房东，我想反馈一个问题', '我是房东，我想反馈一个问题\r\n我是房东，我想反馈一个问题', 1000, 0, NULL);

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `user_id` bigint(0) NOT NULL COMMENT '房东用户ID',
  `rent_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出租类型：整租whole/ 合租share',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋名称',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细描述内容',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市名称',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址，具体门牌号',
  `thumbnail_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图URL',
  `slide_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮播图URL',
  `month_rent` int(0) NOT NULL COMMENT '月租金额',
  `status` int(0) NOT NULL DEFAULT 1 COMMENT '0未租出，1已租出，,-1已下架,-2待审核，-3审核不通过',
  `certificate_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房产证号',
  `toilet_num` int(0) NOT NULL COMMENT '卫生间数量',
  `kitchen_num` int(0) NOT NULL COMMENT '厨房数量',
  `living_room_num` int(0) NOT NULL COMMENT '客厅数量',
  `bedroom_num` int(0) NOT NULL COMMENT '卧室数量',
  `has_air_conditioner` int(0) NOT NULL COMMENT '是否有空调，1有，0无',
  `area` decimal(10, 2) NOT NULL COMMENT '面积',
  `floor` int(0) NOT NULL COMMENT '当前所在楼层数',
  `max_floor` int(0) NOT NULL COMMENT '房子最大楼层数',
  `has_elevator` int(0) NOT NULL COMMENT '是否有电梯',
  `build_year` int(0) NOT NULL COMMENT '建成年份',
  `direction` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '朝向',
  `last_order_start_time` datetime(0) NULL DEFAULT NULL COMMENT '上次开始入住时间',
  `last_order_end_time` datetime(0) NULL DEFAULT NULL COMMENT '上次结束入住时间',
  `longitude_latitude` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经纬度',
  `contact_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机',
  `day_parking_fee` int(0) NULL DEFAULT 0 COMMENT '停车费',
  `day_managing_fee` int(0) NULL DEFAULT 0 COMMENT '物业费',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  CONSTRAINT `t_house_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES (2, '2021-03-15 19:40:07', 1000, 'share', '合租-世界花园-4居室-B卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区世界之窗世纪花园小区12栋305室B卧', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2200, 0, '1000000000', 1, 1, 1, 4, 1, 22.00, 3, 30, 1, 2010, '朝南', '2021-03-15 11:06:32', '2025-03-15 00:00:00', '113.978951,22.545783', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (3, '2021-03-15 19:40:07', 1000, 'share', '合租-世界花园-4居室-C卧', '优质好房，欢迎入住！！！', '深圳', '合租-世界花园-4居室-C卧', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 3000, -2, '1000000000', 1, 1, 1, 4, 1, 30.00, 3, 30, 1, 2010, '朝北', NULL, NULL, '113.978951,22.545783', '马先生', '13512344322', 10, 5);
INSERT INTO `t_house` VALUES (4, '2021-03-15 19:40:07', 1000, 'share', '合租-世界花园-4居室-D卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区世界之窗世纪花园小区12栋305室D卧', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 1800, 0, '1000000000', 1, 1, 1, 4, 1, 18.00, 3, 30, 1, 2010, '朝西', '2021-03-15 10:55:54', '2023-10-27 00:00:00', '113.978951,22.545783', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (11, '2021-03-13 19:40:07', 1000, 'share', '合租-龙城西苑-4居室-A卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区科技园南龙城新苑小区12栋305室A卧', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 3000, 0, '1000000001', 1, 1, 1, 4, 1, 30.00, 3, 30, 1, 2010, '朝东', '2022-04-09 17:43:11', '2022-05-28 00:00:00', '113.933216,22.524803', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (12, '2021-03-13 19:40:07', 1000, 'share', '合租-龙城西苑-4居室-B卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区科技园南龙城新苑小区12栋305室B卧', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2800, 1, '1000000001', 1, 1, 1, 4, 1, 28.00, 3, 30, 1, 2010, '朝北', NULL, NULL, '113.933216,22.524803', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (13, '2021-03-13 19:40:07', 1000, 'share', '合租-龙城西苑-4居室-C卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区科技园南龙城新苑小区12栋305室C卧', '/assets/img/indoors/2.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2600, 1, '1000000001', 1, 1, 1, 4, 1, 26.00, 3, 30, 1, 2010, '朝西', NULL, NULL, '113.933216,22.524803', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (14, '2021-03-13 19:40:07', 1000, 'share', '合租-龙城西苑-4居室-D卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区科技园南龙城新苑小区12栋305室D卧', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2400, 1, '1000000001', 1, 1, 1, 4, 1, 24.00, 3, 30, 1, 2010, '朝南', NULL, NULL, '113.933216,22.524803', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (21, '2021-03-13 19:40:07', 1000, 'share', '合租-金众小区-4居室-A卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市福田区金众小区12栋305室A卧', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 3000, 1, '1000000002', 1, 1, 1, 4, 1, 30.00, 3, 30, 1, 2010, '朝东', NULL, NULL, '114.01862,22.543646', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (22, '2021-03-13 19:40:07', 1000, 'share', '合租-金众小区-4居室-B卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市福田区金众小区12栋305室B卧', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2800, 1, '1000000002', 1, 1, 1, 4, 1, 28.00, 3, 30, 1, 2010, '朝北', NULL, NULL, '114.01862,22.543646', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (23, '2021-03-13 19:40:07', 1000, 'share', '合租-金众小区-4居室-C卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市福田区金众小区12栋305室C卧', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2600, 1, '1000000002', 1, 1, 1, 4, 1, 26.00, 3, 30, 1, 2010, '朝西', NULL, NULL, '114.01862,22.543646', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (24, '2021-03-13 19:40:07', 1000, 'share', '合租-金众小区4居室-D卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市福田区金众小区12栋305室D卧', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2400, 1, '1000000002', 1, 1, 1, 4, 1, 24.00, 3, 30, 1, 2010, '朝南', NULL, NULL, '114.01862,22.543646', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (31, '2021-03-13 19:40:07', 1000, 'share', '合租-椰树花园-4居室-A卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市福田区金众小区12栋305室A卧', '/assets/img/indoors/2.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 3000, 1, '1000000003', 1, 1, 1, 4, 1, 30.00, 3, 30, 1, 2010, '朝东', NULL, NULL, '114.044645,22.531124', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (32, '2021-03-13 19:40:07', 1000, 'share', '合租-椰树花园-4居室-B卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市福田区金众小区12栋305室B卧', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2800, 1, '1000000003', 1, 1, 1, 4, 1, 28.00, 3, 30, 1, 2010, '朝北', NULL, NULL, '114.044645,22.531124', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (33, '2021-03-13 19:40:07', 1000, 'share', '合租-椰树花园-4居室-C卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市福田区金众小区12栋305室C卧', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2600, 1, '1000000003', 1, 1, 1, 4, 1, 26.00, 3, 30, 1, 2010, '朝西', NULL, NULL, '114.044645,22.531124', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (34, '2021-03-13 19:40:07', 1000, 'share', '合租-椰树花园4居室-D卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市福田区金众小区12栋305室D卧', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2400, 1, '1000000003', 1, 1, 1, 4, 1, 24.00, 3, 30, 1, 2010, '朝南', NULL, NULL, '114.044645,22.531124', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (41, '2021-03-13 19:40:07', 1000, 'share', '合租-竹园小区-4居室-A卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市福田区竹园小区12栋305室A卧', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 3000, 1, '1000000004', 1, 1, 1, 4, 1, 30.00, 3, 30, 1, 2010, '朝东', NULL, NULL, '114.022414,22.545682', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (42, '2021-03-13 19:40:07', 1000, 'share', '合租-竹园小区-4居室-B卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市福田区竹园小区12栋305室B卧', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2800, 1, '1000000004', 1, 1, 1, 4, 1, 28.00, 3, 30, 1, 2010, '朝北', '2021-03-14 19:48:40', '2021-03-22 11:08:08', '114.022414,22.545682', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (43, '2021-03-13 19:40:07', 1000, 'share', '合租-竹园小区-4居室-C卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市福田区竹园小区12栋305室C卧', '/assets/img/indoors/2.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2600, 1, '1000000004', 1, 1, 1, 4, 1, 26.00, 3, 30, 1, 2010, '朝西', NULL, NULL, '114.022414,22.545682', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (44, '2021-03-13 19:40:07', 1000, 'share', '合租-竹园小区-4居室-D卧', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市福田区竹园小区12栋305室D卧', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 2400, 0, '1000000004', 1, 1, 1, 4, 1, 24.00, 3, 30, 1, 2010, '朝南', '2021-03-14 19:51:54', '2022-04-30 00:00:00', '114.022414,22.545682', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (100, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头桃苑公寓12栋602室', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000020', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', NULL, NULL, '113.930485,22.534048', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (101, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头桃苑公寓11栋601室', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 0, '1000000021', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', '2021-03-21 20:42:21', '2021-04-04 00:00:00', '113.930485,22.534048', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (102, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头桃苑公寓12栋602室', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000022', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', NULL, NULL, '113.930485,22.534048', '马先生', '13512344322', 10, 5);
INSERT INTO `t_house` VALUES (103, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头桃苑公寓11栋603室', '/assets/img/indoors/2.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000023', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', NULL, NULL, '113.930485,22.534048', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (104, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头桃苑公寓12栋604室', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000020', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', NULL, NULL, '113.930485,22.534048', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (105, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头桃苑公寓11栋605室', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000021', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', '2022-04-09 15:16:41', '2022-04-09 17:42:14', '113.930485,22.534048', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (106, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头桃苑公寓12栋606室', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000022', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', NULL, NULL, '113.930485,22.534048', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (107, '2021-03-13 20:07:47', 1000, 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头桃苑公寓11栋607室', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, 1, '1000000023', 1, 1, 1, 3, 1, 110.00, 6, 35, 1, 2007, '朝北', NULL, NULL, '113.930485,22.534048', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (110, '2021-03-13 20:07:47', 1000, 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头泰安轩12栋501', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 4800, 1, '1000000020', 1, 1, 1, 3, 1, 120.00, 5, 35, 1, 2012, '朝北', NULL, NULL, '114.031235,22.540339', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (111, '2021-03-13 20:07:47', 1000, 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头泰安轩12栋502', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 9800, 1, '1000000021', 1, 1, 1, 3, 1, 120.00, 5, 35, 1, 2012, '朝北', NULL, NULL, '114.031235,22.540339', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (112, '2021-03-13 20:07:47', 1000, 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头泰安轩12栋503', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 9800, 1, '1000000022', 1, 1, 1, 3, 1, 120.00, 5, 35, 1, 2012, '朝北', '2021-03-14 18:43:36', '2021-03-14 21:36:34', '114.031235,22.540339', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (113, '2021-03-13 20:07:47', 1000, 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头泰安轩12栋504', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 9800, 1, '1000000023', 1, 1, 1, 3, 1, 120.00, 5, 35, 1, 2012, '朝北', NULL, NULL, '114.031235,22.540339', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (114, '2021-03-13 20:07:47', 1000, 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头泰安轩12栋505', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 9800, 1, '1000000020', 1, 1, 1, 3, 1, 120.00, 5, 35, 1, 2012, '朝北', NULL, NULL, '114.031235,22.540339', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (116, '2021-03-13 20:07:47', 1000, 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头泰安轩12栋507', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 8800, -1, '1000000022', 1, 1, 1, 3, 1, 120.00, 5, 35, 1, 2012, '朝北', NULL, NULL, '114.031235,22.540339', '马先生', '13512344322', 0, 0);
INSERT INTO `t_house` VALUES (117, '2021-03-13 20:07:47', 1000, 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳', '广东省深圳市南山区南头泰安轩12栋508', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', 9800, 0, '1000000023', 1, 1, 1, 3, 1, 120.00, 5, 35, 1, 2012, '朝北', '2021-03-15 10:52:13', '2025-04-05 00:00:00', '114.031235,22.540339', '马先生', '13512344322', 0, 0);

-- ----------------------------
-- Table structure for t_maintain
-- ----------------------------
DROP TABLE IF EXISTS `t_maintain`;
CREATE TABLE `t_maintain`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `house_id` bigint(0) NULL DEFAULT NULL COMMENT '房屋id',
  `status` int(0) NULL DEFAULT 0 COMMENT '状态：0待处理，1已处理',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '申报人id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `img_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片URL',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `house_id`(`house_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `t_maintain_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_maintain_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_maintain
-- ----------------------------
INSERT INTO `t_maintain` VALUES (2, '22', '222', 105, 1, 1001, '2022-04-09 15:40:28', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]');
INSERT INTO `t_maintain` VALUES (3, '空调坏了', '空调坏了\r\n空调坏了\r\n空调坏了', 105, 0, 1001, '2022-04-09 15:57:11', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]');
INSERT INTO `t_maintain` VALUES (4, '卧室灯不亮', '卧室灯不亮\r\n卧室灯不亮\r\n卧室灯不亮\r\n卧室灯不亮卧室灯不亮', 11, 0, 1001, '2022-04-09 17:44:02', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]');
INSERT INTO `t_maintain` VALUES (5, '222', '222', 11, 0, 1001, '2022-04-23 19:01:50', '[\"/uploads/fd3188c720764e11b0d46f8893e7da1a.png\"]');

-- ----------------------------
-- Table structure for t_mark
-- ----------------------------
DROP TABLE IF EXISTS `t_mark`;
CREATE TABLE `t_mark`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `house_id` bigint(0) NOT NULL COMMENT '房子ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `house_id`(`house_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `t_mark_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_mark_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mark
-- ----------------------------
INSERT INTO `t_mark` VALUES (2, '2021-03-14 13:39:52', 1001, 42);
INSERT INTO `t_mark` VALUES (3, '2021-03-14 18:14:42', 1001, 116);
INSERT INTO `t_mark` VALUES (4, '2021-03-14 19:58:03', 1005, 43);
INSERT INTO `t_mark` VALUES (5, '2021-03-14 19:58:09', 1005, 34);
INSERT INTO `t_mark` VALUES (7, '2021-03-15 10:52:39', 1003, 111);
INSERT INTO `t_mark` VALUES (8, '2021-03-15 10:52:42', 1003, 41);
INSERT INTO `t_mark` VALUES (9, '2021-03-17 18:53:51', 1, 110);
INSERT INTO `t_mark` VALUES (10, '2021-03-21 17:49:55', 1, 103);
INSERT INTO `t_mark` VALUES (12, '2021-03-21 18:06:18', 1, 104);
INSERT INTO `t_mark` VALUES (13, '2021-03-21 21:14:55', 1001, 100);
INSERT INTO `t_mark` VALUES (14, '2021-03-21 21:15:00', 1001, 104);
INSERT INTO `t_mark` VALUES (15, '2021-03-21 21:15:03', 1001, 105);
INSERT INTO `t_mark` VALUES (16, '2021-03-21 21:15:16', 1001, 12);
INSERT INTO `t_mark` VALUES (17, '2022-03-20 15:15:33', 1, 102);
INSERT INTO `t_mark` VALUES (18, '2022-04-09 16:13:29', 1001, 102);
INSERT INTO `t_mark` VALUES (19, '2022-04-23 19:29:45', 1001, 114);

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态',
  `type` int(0) NULL DEFAULT NULL COMMENT '类型',
  `friend_id` bigint(0) NULL DEFAULT NULL COMMENT '对方ID',
  `receiver_id` bigint(0) NULL DEFAULT NULL COMMENT '接收人ID',
  `sender_id` bigint(0) NULL DEFAULT NULL COMMENT '发送人ID',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `friend_id`(`friend_id`) USING BTREE,
  INDEX `sender_id`(`sender_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `receiver_id`(`receiver_id`) USING BTREE,
  CONSTRAINT `t_message_ibfk_1` FOREIGN KEY (`friend_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_message_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_message_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_message_ibfk_4` FOREIGN KEY (`receiver_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '私信表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES (1, '你好！', NULL, 2, NULL, 1000, 1000, 1, 1);
INSERT INTO `t_message` VALUES (2, '你好！', NULL, 2, NULL, 1, 1000, 1, 1000);
INSERT INTO `t_message` VALUES (3, '我是管理员', NULL, 2, NULL, 1, 1000, 1, 1000);
INSERT INTO `t_message` VALUES (4, '我是管理员', NULL, 2, NULL, 1000, 1000, 1, 1);
INSERT INTO `t_message` VALUES (5, '你好！我是马云，我是一个房东', NULL, 2, NULL, 1000, 1, 1000, 1);
INSERT INTO `t_message` VALUES (6, '你好！我是马云，我是一个房东', NULL, 2, NULL, 1, 1, 1000, 1000);
INSERT INTO `t_message` VALUES (7, '你好哦！', NULL, 2, NULL, 1, 1000, 1, 1000);
INSERT INTO `t_message` VALUES (8, '你好哦！', NULL, 2, NULL, 1000, 1000, 1, 1);
INSERT INTO `t_message` VALUES (9, '你好！什么时候可以看房呢？', NULL, 2, NULL, 1000, 1000, 1001, 1001);
INSERT INTO `t_message` VALUES (10, '你好！什么时候可以看房呢？', NULL, 2, NULL, 1001, 1000, 1001, 1000);
INSERT INTO `t_message` VALUES (11, '随时可以，电话15812345678', NULL, 2, NULL, 1001, 1001, 1000, 1000);
INSERT INTO `t_message` VALUES (12, '随时可以，电话15812345678', NULL, 2, NULL, 1000, 1001, 1000, 1001);
INSERT INTO `t_message` VALUES (13, '好的，谢谢', NULL, 2, NULL, 1000, 1000, 1001, 1001);
INSERT INTO `t_message` VALUES (14, '好的，谢谢', NULL, 2, NULL, 1001, 1000, 1001, 1000);
INSERT INTO `t_message` VALUES (15, '你好啊！', NULL, 2, NULL, 1002, 1002, 1001, 1001);
INSERT INTO `t_message` VALUES (16, '你好啊！', NULL, 1, NULL, 1001, 1002, 1001, 1002);
INSERT INTO `t_message` VALUES (17, 'OK', NULL, 2, NULL, 1000, 1000, 1, 1);
INSERT INTO `t_message` VALUES (18, 'OK', NULL, 2, NULL, 1, 1000, 1, 1000);
INSERT INTO `t_message` VALUES (19, '张三，你好啊！！', NULL, 2, NULL, 1001, 1001, 1, 1);
INSERT INTO `t_message` VALUES (20, '张三，你好啊！！', NULL, 2, NULL, 1, 1001, 1, 1001);
INSERT INTO `t_message` VALUES (21, '韩信，你好！！', NULL, 2, NULL, 1002, 1002, 1, 1);
INSERT INTO `t_message` VALUES (22, '韩信，你好！！', NULL, 1, NULL, 1, 1002, 1, 1002);
INSERT INTO `t_message` VALUES (23, '你好！', NULL, 2, NULL, 1002, 1002, 1001, 1001);
INSERT INTO `t_message` VALUES (24, '你好！', NULL, 1, NULL, 1001, 1002, 1001, 1002);
INSERT INTO `t_message` VALUES (25, '你好，管理员', NULL, 2, NULL, 1, 1, 1001, 1001);
INSERT INTO `t_message` VALUES (26, '你好，管理员', NULL, 1, NULL, 1001, 1, 1001, 1);
INSERT INTO `t_message` VALUES (27, '我今天有空', NULL, 2, NULL, 1000, 1000, 1001, 1001);
INSERT INTO `t_message` VALUES (28, '我今天有空', NULL, 2, NULL, 1001, 1000, 1001, 1000);
INSERT INTO `t_message` VALUES (29, '我来了', NULL, 2, NULL, 1000, 1000, 1001, 1001);
INSERT INTO `t_message` VALUES (30, '我来了', NULL, 2, NULL, 1001, 1000, 1001, 1000);
INSERT INTO `t_message` VALUES (31, '你好！', NULL, 2, NULL, 1001, 1001, 1000, 1000);
INSERT INTO `t_message` VALUES (32, '你好！', NULL, 2, NULL, 1000, 1001, 1000, 1001);
INSERT INTO `t_message` VALUES (33, '你好！！！', NULL, 2, NULL, 1000, 1000, 1001, 1001);
INSERT INTO `t_message` VALUES (34, '你好！！！', NULL, 1, NULL, 1001, 1000, 1001, 1000);
INSERT INTO `t_message` VALUES (35, '你好！！！', NULL, 2, NULL, 1002, 1002, 1001, 1001);
INSERT INTO `t_message` VALUES (36, '你好！！！', NULL, 1, NULL, 1001, 1002, 1001, 1002);

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `summary` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '摘要',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES (2, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (3, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (4, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (5, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (6, '2022-04-23 18:07:42', '新闻标题新闻标题新闻22标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarr', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\r\n\r\nSed ut perspiciatis u22nde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (7, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (8, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (9, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (10, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (11, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (12, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (13, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (14, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (15, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (16, '2021-03-13 23:25:01', '新闻标题新闻标题新闻标题新闻标题', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.');
INSERT INTO `t_news` VALUES (17, '2021-03-21 21:21:34', '最新新闻哈哈哈', '三生三世', '三生三世');
INSERT INTO `t_news` VALUES (18, '2021-04-24 00:00:04', 'ssssss', 'ssss\r\nssssss', 'ssss\r\nssssss');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `customer_user_id` bigint(0) NOT NULL COMMENT '租客用户ID',
  `owner_user_id` bigint(0) NOT NULL COMMENT '房东用户ID',
  `status` int(0) NOT NULL COMMENT '订单状态：-2待签合同，-1待付款，0生效中，1已到期，-3租客已取消',
  `house_id` bigint(0) NOT NULL COMMENT '房子ID',
  `month_rent` int(0) NOT NULL COMMENT '月租金',
  `day_num` int(0) NOT NULL COMMENT '租住日数',
  `total_amount` int(0) NOT NULL COMMENT '总金额',
  `start_date` datetime(0) NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '结束日期',
  `day_parking_Fee` int(0) NULL DEFAULT NULL COMMENT '停车费/日',
  `day_managing_fee` int(0) NULL DEFAULT NULL COMMENT '管理费/日',
  `water_fee` int(0) NULL DEFAULT NULL COMMENT '水费',
  `electricity_fee` int(0) NULL DEFAULT NULL COMMENT '电费',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner_user_id`(`owner_user_id`) USING BTREE,
  INDEX `customer_user_id`(`customer_user_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `house_id`(`house_id`) USING BTREE,
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`owner_user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`customer_user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_order_ibfk_3` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (1, '2021-03-14 18:16:29', 1001, 1000, -3, 116, 8800, 31, 9083, '2021-03-14 18:16:29', '2021-04-14 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (2, '2021-03-14 18:16:59', 1001, 1000, -3, 112, 9800, 20, 6520, '2021-03-14 18:16:59', '2021-04-03 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (3, '2021-03-14 18:17:24', 1001, 1000, -3, 113, 9800, 18, 5868, '2021-03-14 18:17:24', '2021-04-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (4, '2021-03-14 18:30:45', 1001, 1000, -3, 112, 9800, 18, 5868, '2021-03-14 18:30:45', '2021-04-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (5, '2021-03-14 18:30:47', 1001, 1000, -3, 112, 9800, 18, 5868, '2021-03-14 18:30:47', '2021-04-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (6, '2021-03-14 18:43:36', 1001, 1000, 1, 112, 9800, 0, 0, '2021-03-14 18:43:36', '2021-03-14 21:36:34', NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (7, '2021-03-14 19:48:40', 1001, 1000, 1, 42, 2800, -8, -744, '2021-03-14 19:48:40', '2021-03-22 11:08:08', NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (8, '2021-03-14 19:51:54', 1005, 1000, 0, 44, 2400, 412, 32960, '2021-03-14 19:51:54', '2022-04-30 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (10, '2021-03-15 10:52:13', 1003, 1000, 3, 117, 9800, 1482, 483132, '2021-03-15 10:52:13', '2025-04-05 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (11, '2021-03-15 10:55:54', 1006, 1000, 0, 4, 1800, 956, 57360, '2021-03-15 10:55:54', '2023-10-27 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (12, '2021-03-15 11:06:32', 1004, 1000, 0, 2, 2200, 1461, 106653, '2021-03-15 11:06:32', '2025-03-15 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (14, '2021-03-21 20:42:21', 1009, 1000, 1, 101, 8800, 14, 4102, '2021-03-21 20:42:21', '2021-04-04 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (15, '2022-04-09 15:16:41', 1001, 1000, 1, 105, 8800, 0, 0, '2022-04-09 15:16:41', '2022-04-09 17:42:14', NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (16, '2022-04-09 16:13:44', 1001, 1000, -3, 102, 8800, 14, 4102, '2022-04-09 16:13:44', '2022-04-23 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (17, '2022-04-09 17:43:11', 1001, 1000, 0, 11, 3000, 49, 4900, '2022-04-09 17:43:11', '2022-05-28 00:00:00', 0, 0, 0, 0);
INSERT INTO `t_order` VALUES (18, '2022-04-23 19:54:56', 1003, 1000, -1, 113, 9800, 406, 132356, '2022-04-23 19:54:56', '2023-06-03 00:00:00', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for t_post
-- ----------------------------
DROP TABLE IF EXISTS `t_post`;
CREATE TABLE `t_post`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `summary` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '摘要',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户ID',
  `post_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `t_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_post
-- ----------------------------
INSERT INTO `t_post` VALUES (1, '2021-04-24 00:11:01', '求租三室一厅深圳南山区的房子', '求租三室一厅深圳南山区的房子\r\n欢迎合适的房东联系我，微信XXXX，电话12312312312', '求租三室一厅深圳南山区的房子\r\n欢迎合适的房东联系我，微信XXXX，电话12312312312', 1001, 'qiu_zu');
INSERT INTO `t_post` VALUES (2, '2021-04-24 00:40:16', '求租三室一厅深圳福田区的房子', '求租三室一厅深圳福田区的房子\r\n求租三室一厅深圳福田区的房子\r\n求租三室一厅深圳福田区的房子\r\n求租三室一厅深圳福田区的房子\r\n', '求租三室一厅深圳福田区的房子\r\n求租三室一厅深圳福田区的房子\r\n求租三室一厅深圳福田区的房子\r\n求租三室一厅深圳福田区的房子\r\n', 1003, 'qiu_zu');
INSERT INTO `t_post` VALUES (3, '2021-04-24 00:40:16', '求租三室一厅深圳福田区的房子', '求租三室一厅深圳福田区的房子\r\n求租三室一厅深圳福田区的房子\r\n求租三室一厅深圳福田区的房子\r\n求租三室一厅深圳福田区的房子\r\n', '求租三室一厅深圳福田区的房子\r\n求租三室一厅深圳福田区的房子\r\n求租三室一厅深圳福田区的房子\r\n求租三室一厅深圳福田区的房子\r\n', 1003, 'qiu_zu');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime(0) NOT NULL COMMENT '注册时间',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名/账号',
  `user_display_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `user_pass` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `id_card` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `user_avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `user_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人描述',
  `status` int(0) NOT NULL DEFAULT 0 COMMENT '状态：1正常，0禁用',
  `role` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色，管理员admin/房东owner/租客customer',
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `hobby` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务爱好',
  `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `id_card_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证照片',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1009 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '2021-03-13 19:34:54', 'admin', '管理员', '13512344321', '847064370@qq.com', '123456', '1111111', 'https://eu.ui-avatars.com/api/?background=random&length=1&rounded=true&bold=true&name=管理员', '我是管理员用户哦，服务大家2', 0, 'admin', '男', '游泳,跑步', '互联网/计算机', '/assets/img/idcard.png');
INSERT INTO `t_user` VALUES (1000, '2021-03-13 19:34:54', 'mayun', '马昀', '13512344322', '847064370@qq.com', '123456', '11111111222', 'https://eu.ui-avatars.com/api/?background=random&length=1&rounded=true&bold=true&name=马昀', '我是马芸，不是那个马云哦，我是一个房东', 0, 'owner', '男', '游泳,跑步', '互联网/计算机', '/assets/img/idcard.png');
INSERT INTO `t_user` VALUES (1001, '2021-03-13 19:34:54', 'zhangsan', '张三', '13512224322', '847064370@qq.com', '123456', '11111111222', 'https://eu.ui-avatars.com/api/?background=random&length=1&rounded=true&bold=true&name=张三', '我是张三，一个在找房子的年轻人', 0, 'customer', '男', '游泳,跑步', '互联网/计算机', '/assets/img/idcard.png');
INSERT INTO `t_user` VALUES (1002, '2021-03-14 09:35:16', 'hanxin2', '韩信', '13512341234', '847064370@qq.com', '123456', NULL, 'https://eu.ui-avatars.com/api/?background=random&length=1&rounded=true&bold=true&name=韩信', NULL, 0, 'customer', '男', '游泳,跑步', '互联网/计算机', '/assets/img/idcard.png');
INSERT INTO `t_user` VALUES (1003, '2021-03-14 19:49:37', 'lisi', '李四', '13412346789', '847064370@qq.com', '123456', NULL, 'https://eu.ui-avatars.com/api/?background=random&length=1&rounded=true&bold=true&name=李四', NULL, 0, 'customer', '男', '游泳,跑步', '互联网/计算机', '/assets/img/idcard.png');
INSERT INTO `t_user` VALUES (1004, '2021-03-14 19:49:57', 'wangwu', '王五', '13211112222', '847064370@qq.com', '123456', NULL, 'https://eu.ui-avatars.com/api/?background=random&length=1&rounded=true&bold=true&name=王五', NULL, 0, 'customer', '男', '游泳,跑步', '互联网/计算机', '/assets/img/idcard.png');
INSERT INTO `t_user` VALUES (1005, '2021-03-14 19:50:27', 'zhouyun', '周韵', '13512335566', '847064370@qq.com', '123456', '123123123122199', 'https://eu.ui-avatars.com/api/?background=random&length=1&rounded=true&bold=true&name=周韵', '', 0, 'customer', '女', '游泳,跑步', '文化/传媒', '/assets/img/idcard.png');
INSERT INTO `t_user` VALUES (1006, '2021-03-14 19:49:37', 'tom', '汤姆', '13412346789', '847064370@qq.com', '123456', '123123123122122', 'https://eu.ui-avatars.com/api/?background=random&length=1&rounded=true&bold=true&name=汤姆', '', 0, 'customer', '男', '游泳,跑步,游戏', '互联网/计算机', '/assets/img/idcard.png');
INSERT INTO `t_user` VALUES (1007, '2021-03-14 19:49:57', 'jerry', '杰瑞', '13211112222', '847064370@qq.com', '123456', NULL, 'https://eu.ui-avatars.com/api/?background=random&length=1&rounded=true&bold=true&name=杰瑞', NULL, 0, 'customer', '男', '游泳,跑步', '互联网/计算机', '/assets/img/idcard.png');
INSERT INTO `t_user` VALUES (1008, '2021-03-14 19:50:27', 'frank', '法兰克', '13512335566', '847064370@qq.com', '123456', '123123123122199', 'https://eu.ui-avatars.com/api/?background=random&length=1&rounded=true&bold=true&name=法兰克', '', 1, 'customer', '女', '游泳,跑步', '文化/传媒', '/assets/img/idcard.png');
INSERT INTO `t_user` VALUES (1009, '2021-03-21 20:18:44', 'zhuge', 'zhuge', '15812345678', 'yanzhao_liu@qq.com', '22132504', NULL, 'https://eu.ui-avatars.com/api/?background=random&length=1&rounded=true&bold=true&name=zhuge', '还没有填写！', 0, 'customer', '保密', '还没有填写！', '其他', '/assets/img/idcard.png');

SET FOREIGN_KEY_CHECKS = 1;
