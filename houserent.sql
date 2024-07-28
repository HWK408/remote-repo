/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80036
Source Host           : localhost:3306
Source Database       : houserent

Target Server Type    : MYSQL
Target Server Version : 80036
File Encoding         : 65001

Date: 2024-02-24 10:46:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '反馈标题',
  `content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '反馈内容',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `status` int DEFAULT NULL COMMENT '处理状态： 0待处理 1已处理',
  `reply` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '回复内容',
  `contact_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '联系人姓名',
  `contact_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '联系人邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='反馈表';

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES ('3', '2024-02-20 12:18:06', '', '', '2', '1', 'sc', '水电费', '总刷到');
INSERT INTO `t_feedback` VALUES ('6', '2024-02-24 09:37:47', '是多少', 'fghj', '1', '1', 'x', 'LIke LIke', '2262997288@qq.com');
INSERT INTO `t_feedback` VALUES ('7', '2024-02-24 09:38:21', '', '', '4', '1', 'df', '李博肖', '2262997288@qq.com');

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_id` bigint DEFAULT NULL COMMENT '房东用户id',
  `rent_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '出租类型：整租whole/合租share',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '房屋名称',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '详细描述内容',
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '城市名称',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '详细地址，具体门牌号',
  `thumbnail_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '缩略图URL',
  `slide_url` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '轮播图URL',
  `month_rent` int DEFAULT NULL COMMENT '月租金额',
  `status` int DEFAULT NULL COMMENT '状态：0未租出 1已租出 -1已下架 -2待审核 -3审核不通过',
  `cetificate_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '房产证号',
  `toilet_num` int DEFAULT NULL COMMENT '卫生间数量',
  `kichen_num` int DEFAULT NULL COMMENT '厨房数量',
  `living_room_num` int DEFAULT NULL COMMENT '客厅数量',
  `bedroom_num` int DEFAULT NULL COMMENT '卧室数量',
  `has_air_conditioner` int DEFAULT NULL COMMENT '是否有空调  1有 0无',
  `area` decimal(10,2) DEFAULT NULL COMMENT '面积',
  `floor` int DEFAULT NULL COMMENT '当前所在楼层数',
  `max_floor` int DEFAULT NULL COMMENT '房子最大楼层数',
  `has_elevator` int DEFAULT NULL COMMENT '是否有电梯 1是0否',
  `build_year` int DEFAULT NULL COMMENT '建成年份',
  `direction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '朝向',
  `last_order_start_time` datetime DEFAULT NULL COMMENT '上次开始入住时间',
  `last_order_end_time` datetime DEFAULT NULL COMMENT '上次结束入住时间',
  `longitude_latitude` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '经纬度',
  `contact_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '联系人手机',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='房屋表';

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES ('3', '2023-03-15 19:40:07', '4', 'share', '合租-世界花园-4居室-C卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区世界之窗世纪花园小区12栋305室C卧', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '3000', '1', '1000000000', '1', '1', '1', '4', '1', '30.00', '3', '30', '1', '2010', '朝北', null, null, '113.978951,22.545783', '李先生', '13512344322');
INSERT INTO `t_house` VALUES ('4', '2021-03-15 19:40:07', '4', 'whole', '合租-世界花园-4居室-D卧', '优质好房，欢迎入住！！！', '北京', '广东省深圳市南山区世界之窗世纪花园小区12栋305室D卧', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '1800', '1', '1000000000', '1', '1', '1', '4', '1', '18.00', '3', '30', '1', '2010', '朝西', '2024-02-20 14:59:02', '2024-03-06 00:00:00', '113.978951,22.545783', '李先生', '13512344322');
INSERT INTO `t_house` VALUES ('11', '2021-03-13 19:40:07', '4', 'share', '合租-龙城西苑-4居室-A卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区科技园南龙城新苑小区12栋305室A卧', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '3000', '1', '1000000001', '1', '1', '1', '4', '1', '30.00', '3', '30', '1', '2010', '朝东', null, null, '113.933216,22.524803', '李先生', '13512344322');
INSERT INTO `t_house` VALUES ('12', '2021-03-13 19:40:07', '4', 'share', '合租-龙城西苑-4居室-B卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区科技园南龙城新苑小区12栋305室B卧', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '2800', '1', '1000000001', '1', '1', '1', '4', '1', '28.00', '3', '30', '1', '2010', '朝北', null, null, '113.933216,22.524803', '李先生', '13512344322');
INSERT INTO `t_house` VALUES ('13', '2023-03-13 19:40:07', '4', 'share', '合租-龙城西苑-4居室-C卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区科技园南龙城新苑小区12栋305室C卧', '/assets/img/indoors/2.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '2600', '1', '1000000001', '1', '1', '1', '4', '1', '26.00', '3', '30', '1', '2010', '朝西', null, null, '113.933216,22.524803', '李先生', '13512344322');
INSERT INTO `t_house` VALUES ('14', '2023-03-13 19:40:07', '4', 'share', '合租-龙城西苑-4居室-D卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区科技园南龙城新苑小区12栋305室D卧', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '2400', '0', '1000000001', '1', '1', '1', '4', '1', '24.00', '3', '30', '1', '2010', '朝南', null, null, '113.933216,22.524803', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('21', '2021-03-13 19:40:07', '4', 'share', '合租-金众小区-4居室-A卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室A卧', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '3000', '-2', '1000000002', '1', '1', '1', '4', '1', '30.00', '3', '30', '1', '2010', '朝东', null, null, '114.01862,22.543646', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('22', '2021-03-13 19:40:07', '4', 'share', '合租-金众小区-4居室-B卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室B卧', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '2800', '2', '1000000002', '1', '1', '1', '4', '1', '28.00', '3', '30', '1', '2010', '朝北', null, null, '114.01862,22.543646', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('23', '2021-03-13 19:40:07', '4', 'share', '合租-金众小区-4居室-C卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室C卧', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '2600', '-2', '1000000002', '1', '1', '1', '4', '1', '26.00', '3', '30', '1', '2010', '朝西', null, null, '114.01862,22.543646', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('24', '2021-03-13 19:40:07', '4', 'share', '合租-金众小区4居室-D卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室D卧', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '2400', '-2', '1000000002', '1', '1', '1', '4', '1', '24.00', '3', '30', '1', '2010', '朝南', null, null, '114.01862,22.543646', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('31', '2021-03-13 19:40:07', '4', 'share', '合租-椰树花园-4居室-A卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室A卧', '/assets/img/indoors/2.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '3000', '1', '1000000003', '1', '1', '1', '4', '1', '30.00', '3', '30', '1', '2010', '朝东', null, null, '114.044645,22.531124', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('32', '2021-03-13 19:40:07', '4', 'share', '合租-椰树花园-4居室-B卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室B卧', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '2800', '1', '1000000003', '1', '1', '1', '4', '1', '28.00', '3', '30', '1', '2010', '朝北', null, null, '114.044645,22.531124', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('33', '2021-03-13 19:40:07', '4', 'share', '合租-椰树花园-4居室-C卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室C卧', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '2600', '0', '1000000003', '1', '1', '1', '4', '1', '26.00', '3', '30', '1', '2010', '朝西', null, null, '114.044645,22.531124', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('34', '2021-03-13 19:40:07', '4', 'share', '合租-椰树花园4居室-D卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区金众小区12栋305室D卧', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '2400', '1', '1000000003', '1', '1', '1', '4', '1', '24.00', '3', '30', '1', '2010', '朝南', null, null, '114.044645,22.531124', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('41', '2021-03-13 19:40:07', '4', 'share', '合租-竹园小区-4居室-A卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区竹园小区12栋305室A卧', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '3000', '1', '1000000004', '1', '1', '1', '4', '1', '30.00', '3', '30', '1', '2010', '朝东', null, null, '114.022414,22.545682', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('42', '2021-03-13 19:40:07', '4', 'share', '合租-竹园小区-4居室-B卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区竹园小区12栋305室B卧', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '2800', '1', '1000000004', '1', '1', '1', '4', '1', '28.00', '3', '30', '1', '2010', '朝北', '2024-02-20 11:56:53', '2024-02-28 00:00:00', '114.022414,22.545682', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('43', '2021-03-13 19:40:07', '4', 'share', '合租-竹园小区-4居室-C卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区竹园小区12栋305室C卧', '/assets/img/indoors/2.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '2600', '1', '1000000004', '1', '1', '1', '4', '1', '26.00', '3', '30', '1', '2010', '朝西', null, null, '114.022414,22.545682', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('44', '2021-03-13 19:40:07', '4', 'share', '合租-竹园小区-4居室-D卧', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市福田区竹园小区12栋305室D卧', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '2400', '0', '1000000004', '1', '1', '1', '4', '1', '24.00', '3', '30', '1', '2010', '朝南', '2021-03-14 19:51:54', '2022-04-30 00:00:00', '114.022414,22.545682', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('100', '2021-03-13 20:07:47', '4', 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓12栋602室', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '8800', '0', '1000000020', '1', '1', '1', '3', '1', '110.00', '6', '35', '1', '2007', '朝北', '2024-02-20 11:44:29', '2024-02-24 09:50:20', '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('101', '2021-03-13 20:07:47', '4', 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓11栋601室', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '8800', '1', '1000000021', '1', '1', '1', '3', '1', '110.00', '6', '35', '1', '2007', '朝北', null, null, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('102', '2021-03-13 20:07:47', '4', 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓12栋602室', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '8800', '1', '1000000022', '1', '1', '1', '3', '1', '110.00', '6', '35', '1', '2007', '朝北', null, null, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('103', '2021-03-13 20:07:47', '4', 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓11栋603室', '/assets/img/indoors/2.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '8800', '1', '1000000023', '1', '1', '1', '3', '1', '110.00', '6', '35', '1', '2007', '朝北', null, null, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('104', '2021-03-13 20:07:47', '4', 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓12栋604室', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '8800', '1', '1000000020', '1', '1', '1', '3', '1', '110.00', '6', '35', '1', '2007', '朝北', null, null, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('105', '2021-03-13 20:07:47', '4', 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓11栋605室', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '8800', '1', '1000000021', '1', '1', '1', '3', '1', '110.00', '6', '35', '1', '2007', '朝北', null, null, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('106', '2021-03-13 20:07:47', '4', 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓12栋606室', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '8800', '1', '1000000022', '1', '1', '1', '3', '1', '110.00', '6', '35', '1', '2007', '朝北', null, null, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('107', '2021-03-13 20:07:47', '4', 'whole', '整租-桃苑公寓-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头桃苑公寓11栋607室', '/assets/img/indoors/6.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '8800', '1', '1000000023', '1', '1', '1', '3', '1', '110.00', '6', '35', '1', '2007', '朝北', null, null, '113.930485,22.534048', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('110', '2021-03-13 20:07:47', '4', 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头泰安轩12栋501', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '4800', '1', '1000000020', '1', '1', '1', '3', '1', '120.00', '5', '35', '1', '2012', '朝北', null, null, '114.031235,22.540339', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('111', '2021-03-13 20:07:47', '4', 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头泰安轩12栋502', '/assets/img/indoors/4.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '9800', '1', '1000000021', '1', '1', '1', '3', '1', '120.00', '5', '35', '1', '2012', '朝北', null, null, '114.031235,22.540339', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('112', '2021-03-13 20:07:47', '4', 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头泰安轩12栋503', '/assets/img/indoors/5.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '9800', '1', '1000000022', '1', '1', '1', '3', '1', '120.00', '5', '35', '1', '2012', '朝北', '2021-03-14 18:43:36', '2021-03-14 21:36:34', '114.031235,22.540339', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('113', '2021-03-13 20:07:47', '4', 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '北京', '广东省深圳市南山区南头泰安轩12栋504', '/uploads/19d21ab854354cc1b60fdd3e7ff84a15.jpg', '[\"/uploads/19d21ab854354cc1b60fdd3e7ff84a15.jpg\"]', '9800', '1', '1000000023', '1', '1', '1', '3', '1', '120.00', '5', '35', '1', '2012', '朝北', '2024-02-24 09:36:53', '2024-03-07 00:00:00', '114.031235,22.540339', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('114', '2021-03-13 20:07:47', '4', 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头泰安轩12栋505', '/assets/img/indoors/1.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '9800', '1', '1000000020', '1', '1', '1', '3', '1', '120.00', '5', '35', '1', '2012', '朝北', null, null, '114.031235,22.540339', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('116', '2021-03-13 20:07:47', '4', 'whole', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '深圳市', '广东省深圳市南山区南头泰安轩12栋507', '/assets/img/indoors/3.jpg', '[\"/assets/img/pl-1.jpg\",\"/assets/img/pl-2.jpg\",\"/assets/img/pl-3.jpg\",\"/assets/img/pl-4.jpg\",\"/assets/img/pl-5.jpg\",\"/assets/img/pl-6.jpg\",\"/assets/img/pl-7.jpg\",\"/assets/img/pl-8.jpg\"]', '8800', '0', '1000000022', '1', '1', '1', '3', '1', '120.00', '5', '35', '1', '2012', '朝北', null, null, '114.031235,22.540339', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('117', '2021-03-13 20:07:47', '4', 'share', '整租-泰安轩-3室1厅', '优质好房，欢迎入住！！！', '北京', '广东省深圳市南山区南头泰安轩12栋508', '/uploads/27c91fbcf8e04cec906987f333403a22.jpg', '[\"/uploads/27c91fbcf8e04cec906987f333403a22.jpg\"]', '9800', '0', '1000000023', '1', '1', '1', '3', '1', '120.00', '5', '35', '1', '2012', '朝北', '2021-03-15 10:52:13', '2025-04-05 00:00:00', '114.031235,22.540339', '马先生', '13512344322');
INSERT INTO `t_house` VALUES ('123', '2024-02-24 09:46:43', '2', 'whole', '的方法', '', '北京', '广东省深圳市南山区南头泰安轩12栋507', '/uploads/29820feebeb846a5bfae4ae4774ea0be.jpg', '[\"/uploads/29820feebeb846a5bfae4ae4774ea0be.jpg\"]', '2111', '0', '', '1', '1', '1', '1', '1', '135.00', null, null, '1', null, '', null, null, '116.401969,39.925117', '', '');
INSERT INTO `t_house` VALUES ('124', '2024-02-24 09:47:45', '2', 'share', '', '', '北京', '', '/uploads/6049355643a047b88424b3a72bf5fde7.jpg', '[\"/uploads/6049355643a047b88424b3a72bf5fde7.jpg\"]', null, '0', '', '1', '1', '1', '1', '1', null, null, null, '1', null, '', null, null, '', '', '');

-- ----------------------------
-- Table structure for t_mark
-- ----------------------------
DROP TABLE IF EXISTS `t_mark`;
CREATE TABLE `t_mark` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime DEFAULT NULL COMMENT '收藏时间',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `house_id` bigint DEFAULT NULL COMMENT '房子id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='收藏表';

-- ----------------------------
-- Records of t_mark
-- ----------------------------
INSERT INTO `t_mark` VALUES ('3', '2024-02-20 14:58:54', '2', '4');
INSERT INTO `t_mark` VALUES ('4', '2024-02-20 15:00:54', '4', '4');
INSERT INTO `t_mark` VALUES ('5', '2024-02-24 09:22:20', '1', '4');
INSERT INTO `t_mark` VALUES ('6', '2024-02-24 10:38:26', '4', '100');

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '标题',
  `summary` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '摘要',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='新闻表';

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('2', '2024-02-20 12:17:38', 'xcvb', 'zxcv', 'zxcv');
INSERT INTO `t_news` VALUES ('3', '2024-02-24 09:33:46', 'xcvbb', 'dxvb', 'dxvb');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `customer_user_id` bigint DEFAULT NULL COMMENT '租客用户id',
  `owner_user_id` bigint DEFAULT NULL COMMENT '房东用户id',
  `house_id` bigint DEFAULT NULL COMMENT '房子id',
  `status` int DEFAULT NULL COMMENT '订单状态： -3租客已取消 -2待签合同 -1待付款 0生效中 1已到期 ',
  `month_rent` int DEFAULT NULL COMMENT '月租金',
  `day_num` int DEFAULT NULL COMMENT '租住天数',
  `total_amount` int DEFAULT NULL COMMENT '总金额',
  `start_date` datetime DEFAULT NULL COMMENT '开始日期',
  `end_date` datetime DEFAULT NULL COMMENT '结束日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '2024-02-20 11:44:29', '1', '4', '100', '1', '8800', '4', '1172', '2024-02-20 11:44:29', '2024-02-24 09:50:20');
INSERT INTO `t_order` VALUES ('2', '2024-02-20 11:56:53', '5', '4', '42', '2', '2800', '8', '744', '2024-02-20 11:56:53', '2024-02-28 00:00:00');
INSERT INTO `t_order` VALUES ('3', '2024-02-20 14:59:02', '2', '4', '4', '0', '1800', '15', '900', '2024-02-20 14:59:02', '2024-03-06 00:00:00');
INSERT INTO `t_order` VALUES ('4', '2024-02-24 09:36:53', '1', '4', '113', '0', '9800', '12', '3912', '2024-02-24 09:36:53', '2024-03-07 00:00:00');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户名/账号',
  `user_display_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '电子邮箱',
  `user_pass` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '密码',
  `id_card` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '身份证',
  `user_avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '头像',
  `user_desc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '个人描述',
  `status` int NOT NULL DEFAULT '0' COMMENT '1正常 0禁用',
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '角色，管理员admin/房东owner/租客customer',
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '性别',
  `hobby` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '业余爱好',
  `job` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '职业',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '2023-03-18 09:19:43', 'zhangsan', '张三', '13012345678', '1234@qq.com', '123456', '还没有填fcg写！', '/assets/img/default-avatar.jpg', '还没有填写sdwedrfhfghj！', '1', 'customer', '保密', '还没有填写！dfgh', '互联网/计算机');
INSERT INTO `t_user` VALUES ('2', '2023-03-18 09:19:43', 'admin', '管理员（管理员）', '15219189011', 'admin@qq.com', '123456', '还没有填写！', '/assets/img/default-avatar.jpg', '还没有填写！111sdf', '1', 'admin', '保密', '还没有填写！', '互联网/计算机');
INSERT INTO `t_user` VALUES ('3', '2023-03-18 10:12:28', 'lisi', '李四', '13012345679', '12113@qq.com', '111111', '还没有填写！', '/assets/img/default-avatar.jpg', '还没有填写！', '1', 'customer', '保密', '还没有填写！', '还没有填写！');
INSERT INTO `t_user` VALUES ('4', '2023-03-18 09:19:43', 'wangwu', '王女士', '19129260657', '234@qq.com', '123456', '还没有填写！', '/assets/img/default-avatar.jpg', '还没有填写cvbn！', '1', 'owner', '保密', '还没有填写！', '互联网/计算机');
INSERT INTO `t_user` VALUES ('10', '2024-02-24 10:07:50', 'liu', 'ff', 'dfggg', 'ddf@qq.com', '123456', '还没有填写！', '/assets/img/default-avatar.jpg', '还没有填写！', '1', 'customer', '保密', '还没有填写！', '还没有填写！');
