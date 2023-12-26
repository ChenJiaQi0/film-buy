/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : film_buy

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 26/12/2023 08:31:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fb_actor
-- ----------------------------
DROP TABLE IF EXISTS `fb_actor`;
CREATE TABLE `fb_actor`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '照片',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0：未删除1：已删除）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fb_actor
-- ----------------------------
INSERT INTO `fb_actor` VALUES (1, '张小斐', 'https://pic.imgdb.cn/item/655856fdc458853aefadc4d1.jpg', 0, '2023-11-11 14:11:17', '2023-11-11 14:11:17');
INSERT INTO `fb_actor` VALUES (2, '李鸿其', 'https://pic.imgdb.cn/item/65585788c458853aefafaa70.png', 0, '2023-11-18 14:06:50', '2023-11-18 14:06:52');
INSERT INTO `fb_actor` VALUES (3, '惠英红', 'https://pic.imgdb.cn/item/655857edc458853aefb11d39.jpg', 0, '2023-11-18 14:07:08', '2023-11-18 14:07:10');
INSERT INTO `fb_actor` VALUES (4, '王之异', 'https://pic.imgdb.cn/item/65585848c458853aefb27549.jpg', 0, '2023-11-18 14:07:26', '2023-11-18 14:07:29');

-- ----------------------------
-- Table structure for fb_cinema
-- ----------------------------
DROP TABLE IF EXISTS `fb_cinema`;
CREATE TABLE `fb_cinema`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `cinema_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '影院名称',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0：未删除1：已删除）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fb_cinema
-- ----------------------------
INSERT INTO `fb_cinema` VALUES (1, '大地电影城', '中山公园店', '江苏省', '南京市', '栖霞区', '栖霞区学海路1号金鹰奥莱城C馆2层', 0, '2023-11-12 16:34:26', '2023-11-12 16:34:28');
INSERT INTO `fb_cinema` VALUES (2, '万达影城', '仙林金鹰店', '江苏省', '南京市', '栖霞区', '栖霞区学海路1号金鹰奥莱城C馆2层', 0, '2023-12-08 09:32:52', '2023-12-08 09:32:55');
INSERT INTO `fb_cinema` VALUES (3, '上影国际影城', '西善桥店', '江苏省', '南京市', '雨花台区', '雨花台区应天大街619号虹城4楼', 0, '2023-12-08 09:35:04', '2023-12-08 09:35:06');
INSERT INTO `fb_cinema` VALUES (4, '幸福蓝海', 'ITC激光沙发店', '江苏省', '南京市', '鼓楼区', '鼓楼区热河南路2号itcmall三楼', 0, '2023-12-08 09:37:10', '2023-12-08 09:37:12');
INSERT INTO `fb_cinema` VALUES (5, '测试', '测试', '江苏省', '常州市', '武进区', '测试', 0, '2023-12-12 11:56:52', '2023-12-12 11:56:55');

-- ----------------------------
-- Table structure for fb_cinema_film
-- ----------------------------
DROP TABLE IF EXISTS `fb_cinema_film`;
CREATE TABLE `fb_cinema_film`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cinema_id` bigint NULL DEFAULT NULL COMMENT '影院id',
  `film_id` bigint NULL DEFAULT NULL COMMENT '影片id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fb_cinema_film
-- ----------------------------
INSERT INTO `fb_cinema_film` VALUES (1, 1, 1);
INSERT INTO `fb_cinema_film` VALUES (2, 1, 2);
INSERT INTO `fb_cinema_film` VALUES (3, 2, 1);
INSERT INTO `fb_cinema_film` VALUES (4, 2, 2);
INSERT INTO `fb_cinema_film` VALUES (5, 3, 1);
INSERT INTO `fb_cinema_film` VALUES (6, 3, 2);

-- ----------------------------
-- Table structure for fb_comment
-- ----------------------------
DROP TABLE IF EXISTS `fb_comment`;
CREATE TABLE `fb_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sc` double NULL DEFAULT NULL COMMENT '评分',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `user_id` bigint NULL DEFAULT NULL COMMENT '评论者id',
  `film_id` bigint NULL DEFAULT NULL COMMENT '影片id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0：未删除1：已删除）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fb_comment
-- ----------------------------
INSERT INTO `fb_comment` VALUES (27, 10, '内容非常炸裂！', 6, 2, 0, '2023-12-21 13:26:59', '2023-12-21 13:26:59');
INSERT INTO `fb_comment` VALUES (28, 10, '内容非常好，演员们演技炸裂', 1, 2, 0, '2023-12-21 13:27:40', '2023-12-21 13:27:40');
INSERT INTO `fb_comment` VALUES (29, 10, '测试', 1, 2, 0, '2023-12-21 13:27:55', '2023-12-21 13:27:55');
INSERT INTO `fb_comment` VALUES (30, 10, '一级棒', 1, 2, 0, '2023-12-21 13:50:50', '2023-12-21 13:50:50');
INSERT INTO `fb_comment` VALUES (31, 5, '还行', 1, 2, 0, '2023-12-21 13:51:15', '2023-12-21 13:51:15');
INSERT INTO `fb_comment` VALUES (36, 10, '期待上映', 1, 6, 0, '2023-12-21 16:50:28', '2023-12-21 16:50:28');
INSERT INTO `fb_comment` VALUES (37, 10, '期待', 1, 6, 0, '2023-12-21 16:52:07', '2023-12-21 16:52:07');
INSERT INTO `fb_comment` VALUES (38, 10, '123', 1, 6, 0, '2023-12-21 16:53:00', '2023-12-21 16:53:00');
INSERT INTO `fb_comment` VALUES (39, 10, '123', 1, 4, 0, '2023-12-21 16:55:35', '2023-12-21 16:55:35');
INSERT INTO `fb_comment` VALUES (40, 10, '123', 1, 6, 0, '2023-12-21 16:56:02', '2023-12-21 16:56:02');
INSERT INTO `fb_comment` VALUES (41, 10, '1', 1, 6, 0, '2023-12-21 16:59:00', '2023-12-21 16:59:00');
INSERT INTO `fb_comment` VALUES (42, 10, '1', 1, 6, 0, '2023-12-21 16:59:14', '2023-12-21 16:59:14');
INSERT INTO `fb_comment` VALUES (43, 10, '123123', 1, 6, 0, '2023-12-21 16:59:57', '2023-12-21 16:59:57');

-- ----------------------------
-- Table structure for fb_film
-- ----------------------------
DROP TABLE IF EXISTS `fb_film`;
CREATE TABLE `fb_film`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '照片',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '影片中文名',
  `ename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '影皮英文名',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `cat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型',
  `date` datetime NULL DEFAULT NULL COMMENT '上映时间',
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上映地区',
  `dur` int NULL DEFAULT NULL COMMENT '时长',
  `wish` int NULL DEFAULT NULL COMMENT '想看人数',
  `watched` int NULL DEFAULT NULL COMMENT '看过人数',
  `sc` double NULL DEFAULT NULL COMMENT '评分',
  `snum` int NULL DEFAULT NULL COMMENT '评分人数',
  `status` int NULL DEFAULT NULL COMMENT '状态（0：未上映1：已上映2：预售3：想看）',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简介',
  `actors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '演员们的ids',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0：未删除1：已删除）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fb_film
-- ----------------------------
INSERT INTO `fb_film` VALUES (1, 'https://pic.imgdb.cn/item/65584dd3c458853aef89dd02.jpg', '拯救嫌疑人', 'Last Suspect', '\"年度犯罪悬疑重磅力作\"', '悬疑,犯罪,剧情', '2023-11-01 00:00:00', '中国大陆', 119, 324644, 10320698, 9.3, 86982, 1, '“谁动我女儿，我要谁命”愤怒母亲绝望反击！独居女大学生被刺27刀惨死，嫌凝人一审被判死刑！受害者母亲林淑娥（惠英红饰）本以为正义已到，但从无败诉的女律师陈智琪（张小斐饰）坚持为奸杀犯做无罪辩护，让受害者母亲陷入绝望。陈智琪为奸杀犯辩护的背后也有隐秘苦衷通神秘电话威她在五天之内为嫌疑人做无罪辨护，否则就杀死她女儿！陈智琪无助绝望之下联手警察金志雄（李鸿其饰展开调查，随着调查的展开，陷入绝境的两个母亲形成对峙，更大的阴谋开始展现，复仇与反杀似乎成了唯—的选择', '1,2,3,4', 0, '2023-11-12 16:35:12', '2023-11-12 16:35:14');
INSERT INTO `fb_film` VALUES (2, 'https://pic.imgdb.cn/item/65585015c458853aef928b08.jpg', '无价之宝', 'Be My Family', NULL, '喜剧', '2023-11-10 00:00:00', '中国大陆', 132, 78870, 2033394, 8.75, 12953, 1, '张译、潘斌龙新片化身“没头脑和不高兴“组合，因一次追债意外成为六岁孩童的监护人，由此开启了长达十多年的硬核育女之路，三人的命运紧密相连。“石头”石振邦（张译饰）和杨武(潘斌龙饰)这对落魄兄弟经营五金店艰难维生，为追讨欠款，他们不得不暂时照看欠债人的孩子芊芊。两人在与芊芊的相啟处中从最初嫌弃“拖油流竟潜移默化地转变成千方百计“为女儿战斗”，生活粗放的他们内心也变得越来越柔软。', '1,2,3,4', 0, '2023-11-18 13:43:41', '2023-11-18 13:43:44');
INSERT INTO `fb_film` VALUES (3, 'https://pic.imgdb.cn/item/656ee235c458853aef52149a.jpg', '囧妈', 'Lost in Russia', '俄囧', '剧情,喜剧', '2023-12-07 00:00:00', '中国大陆', 132, 48481, 2, 9, 33235, 3, '小老板伊万（徐峥饰）缠身于商业纠纷，却意外同母亲坐上了开往俄罗斯的火车。在旅途中，他和母亲发生激烈冲突，同时还要和竞争对手斗智斗勇。为了最终抵达莫斯科，他不得不和母亲共同克服难关，并面对家庭生活中一直所逃避的问题', '1,2,3,4', 0, '2023-12-05 16:40:33', '2023-12-05 16:40:35');
INSERT INTO `fb_film` VALUES (4, 'https://pic.imgdb.cn/item/65706882c458853aeff50c2c.jpg', '怒潮', 'WOLF HIDING', '暴力黑吃黑！年末最后一场猎杀', '犯罪,动作', '2023-12-16 00:00:00', '中国大陆', 106, 174227, 0, 0, 1, 2, '暗黑现实复仇动作爽片《怒潮》今日发布“来者不善”版剧情预告。各方势力轮番登场敌我难辨，全员狠人搅动邪恶浑水。伴随众多新角色逐一揭晓，一出复仇大戏即将“怒卷”岁末！影片由马浴柯导演、编剧兼主演，张家辉、阮经天、王大陆领衔主演，秦沛、马浴柯、陈国坤、连凯、吴启华、李相炫、陈晓依、何昕霖主演，姜皓文友情出演。影片将于12月16日全国上映，火热预售中。', '1,2,3,4', 0, '2023-12-06 20:25:35', '2023-12-06 20:25:38');
INSERT INTO `fb_film` VALUES (5, 'https://pic.imgdb.cn/item/6571b04cc458853aefbac80b.jpg', '再见，李可乐', 'So Long for Love', NULL, '剧情,家庭', '2023-12-01 00:00:00', '中国大陆', 105, 189994, 3328473, 9.4, 39624, 2, '高二因滑雪事故失去爸爸的李妍，对放弃爸爸治疗的妈妈心存芥蒂。李妍（谭松韵 饰）收养的小狗可乐陪伴她成长，可乐生日与爸爸忌日一样，李妍将它视为爸爸的化身。经历了矛盾，成长与失去，李妍从与可乐的告别中理解了母亲的选择。', '1,2,3,4', 0, '2023-12-07 19:43:14', '2023-12-07 19:43:17');
INSERT INTO `fb_film` VALUES (6, 'https://pic.imgdb.cn/item/6571b12dc458853aefbe0754.jpg', '年会不能停!', 'Johnny Keep Walking!', '跨年爆梗喜剧！打工人发疯嘴替！', '喜剧', '2023-12-29 00:00:00', '中国大陆', 117, 82492, 0, 0, 2, 2, '犒劳辛苦一年的自己，来影院大笑解压跨年！国民级喜剧人年底大聚会，真实还原打工人精神状态！钳工胡建林 (大鹏 饰)在集团裁员之际阴差阳错被调入总部，裹挟在“错调”事件中的人事经理马杰 (白客 饰) 为保饭碗被迫为其隐瞒四处周旋。从“工厂”到“大厂”，从“蓝领”变“金领”，胡建林因与大厂环境格格不入而笑料百出，也像一面“职场照妖镜”照出职场众生相......胡建林为何能在裁员之际一路升职加薪制霸大厂？马杰又能否在“错调”事件中全身而退？这场离谱的“错调”背后又隐藏着什么惊天大瓜', '1,2,3,4', 0, '2023-12-07 19:49:24', '2023-12-07 19:49:26');
INSERT INTO `fb_film` VALUES (7, 'https://pic.imgdb.cn/item/6571b1b6c458853aefc00629.jpg', '一闪一闪亮星星', 'Shining For One Thing', '纯爱天花板 跨年约会浪漫顶配', '爱情,奇幻', '2023-12-30 00:00:00', '中国大陆', 107, 1537759, 0, 0, 0, 3, '即将踏入三十岁的资深少女林北星因为男朋友展宇的毁约，与自己梦想的爱情殿堂擦肩而过，生活工作也变得一团乱麻，不知是被命运眷顾还是来自时光机老人的玩笑，林北星却意外回到了十八岁，高三本是一场噩梦，但林北星却计划着重新高考，摆脱展宇，为了自己重新活一次，然而林北星的美梦却频频被一个叫做张万森的男孩打破。张万森在高考之后的意外遭遇成了结束林北星时空之旅的开关，林北星开始调查张万森的死因，开始了拯救张万森的大作战。', '1,2,3,4', 0, '2023-12-07 19:52:52', '2023-12-07 19:52:55');

-- ----------------------------
-- Table structure for fb_order
-- ----------------------------
DROP TABLE IF EXISTS `fb_order`;
CREATE TABLE `fb_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cinema_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '影院名称',
  `film_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '影片名称',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `price` int NULL DEFAULT NULL COMMENT '总价',
  `count` int NULL DEFAULT NULL COMMENT '买票数量',
  `seat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '座位信息',
  `status` tinyint NULL DEFAULT NULL COMMENT '订单状态（0：待消费1：已完成）',
  `date` datetime NULL DEFAULT NULL COMMENT '电影开始时间',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0：未删除1：已删除）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fb_order
-- ----------------------------
INSERT INTO `fb_order` VALUES (4, '中山公园店', '无价之宝', 1, 76, 2, '148,149', 1, '2023-12-16 21:15:00', 0, '2023-12-15 15:49:19', '2023-12-15 15:49:19');
INSERT INTO `fb_order` VALUES (14, '中山公园店', '拯救嫌疑人', 5, 38, 2, '377,378', 1, '2023-12-21 13:30:00', 0, '2023-12-20 10:52:51', '2023-12-20 10:52:51');
INSERT INTO `fb_order` VALUES (15, '中山公园店', '拯救嫌疑人', 1, 76, 4, '379,370,369,376', 0, '2023-12-23 13:30:00', 0, '2023-12-21 14:16:06', '2023-12-21 14:16:06');
INSERT INTO `fb_order` VALUES (16, '中山公园店', '无价之宝', 1, 152, 4, '115,123,137,128', 0, '2023-12-23 21:15:00', 0, '2023-12-21 16:24:43', '2023-12-21 16:24:43');

-- ----------------------------
-- Table structure for fb_seat
-- ----------------------------
DROP TABLE IF EXISTS `fb_seat`;
CREATE TABLE `fb_seat`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `showtime_id` bigint NULL DEFAULT NULL COMMENT '场次id',
  `rn` tinyint NULL DEFAULT NULL COMMENT '座位所在排的编号',
  `cn` tinyint NOT NULL COMMENT '座位所在列的编号',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态（0：空闲1：已售出）',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0：未删除1：已删除）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 725 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fb_seat
-- ----------------------------
INSERT INTO `fb_seat` VALUES (22, 2, 1, 1, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (23, 2, 1, 2, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (24, 2, 1, 3, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (25, 2, 1, 4, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (26, 2, 1, 5, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (27, 2, 1, 6, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (28, 2, 1, 7, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (29, 2, 1, 8, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (30, 2, 2, 1, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (31, 2, 2, 2, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (32, 2, 2, 3, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (33, 2, 2, 4, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (34, 2, 2, 5, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (35, 2, 2, 6, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (36, 2, 2, 7, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (37, 2, 2, 8, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (38, 2, 3, 1, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (39, 2, 3, 2, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (40, 2, 3, 3, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (41, 2, 3, 4, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (42, 2, 3, 5, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (43, 2, 3, 6, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (44, 2, 3, 7, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (45, 2, 3, 8, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (46, 2, 4, 1, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (47, 2, 4, 2, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (48, 2, 4, 3, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (49, 2, 4, 4, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (50, 2, 4, 5, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (51, 2, 4, 6, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (52, 2, 4, 7, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (53, 2, 4, 8, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (54, 2, 5, 1, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (55, 2, 5, 2, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (56, 2, 5, 3, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (57, 2, 5, 4, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (58, 2, 5, 5, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (59, 2, 5, 6, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (60, 2, 5, 7, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (61, 2, 5, 8, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (62, 2, 6, 1, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (63, 2, 6, 2, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (64, 2, 6, 3, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (65, 2, 6, 4, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (66, 2, 6, 5, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (67, 2, 6, 6, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (68, 2, 6, 7, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (69, 2, 6, 8, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (70, 2, 7, 1, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (71, 2, 7, 2, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (72, 2, 7, 3, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (73, 2, 7, 4, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (74, 2, 7, 5, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (75, 2, 7, 6, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (76, 2, 7, 7, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (77, 2, 7, 8, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (78, 2, 8, 1, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (79, 2, 8, 2, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (80, 2, 8, 3, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (81, 2, 8, 4, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (82, 2, 8, 5, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (83, 2, 8, 6, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (84, 2, 8, 7, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (85, 2, 8, 8, 0, 0, '2023-12-14 12:49:41', '2023-12-14 12:49:41');
INSERT INTO `fb_seat` VALUES (86, 1, 1, 1, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (87, 1, 1, 2, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (88, 1, 1, 3, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (89, 1, 1, 4, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (90, 1, 1, 5, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (91, 1, 1, 6, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (92, 1, 1, 7, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (93, 1, 1, 8, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (94, 1, 2, 1, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (95, 1, 2, 2, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (96, 1, 2, 3, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (97, 1, 2, 4, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (98, 1, 2, 5, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (99, 1, 2, 6, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (100, 1, 2, 7, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (101, 1, 2, 8, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (102, 1, 3, 1, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (103, 1, 3, 2, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (104, 1, 3, 3, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (105, 1, 3, 4, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (106, 1, 3, 5, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (107, 1, 3, 6, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (108, 1, 3, 7, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (109, 1, 3, 8, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (110, 1, 4, 1, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (111, 1, 4, 2, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (112, 1, 4, 3, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (113, 1, 4, 4, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (114, 1, 4, 5, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (115, 1, 4, 6, 1, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (116, 1, 4, 7, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (117, 1, 4, 8, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (118, 1, 5, 1, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (119, 1, 5, 2, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (120, 1, 5, 3, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (121, 1, 5, 4, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (122, 1, 5, 5, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (123, 1, 5, 6, 1, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (124, 1, 5, 7, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (125, 1, 5, 8, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (126, 1, 6, 1, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (127, 1, 6, 2, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (128, 1, 6, 3, 1, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (129, 1, 6, 4, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (130, 1, 6, 5, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (131, 1, 6, 6, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (132, 1, 6, 7, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (133, 1, 6, 8, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (134, 1, 7, 1, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (135, 1, 7, 2, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (136, 1, 7, 3, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (137, 1, 7, 4, 1, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (138, 1, 7, 5, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (139, 1, 7, 6, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (140, 1, 7, 7, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (141, 1, 7, 8, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (142, 1, 8, 1, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (143, 1, 8, 2, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (144, 1, 8, 3, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (145, 1, 8, 4, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (146, 1, 8, 5, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (147, 1, 8, 6, 0, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (148, 1, 8, 7, 1, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (149, 1, 8, 8, 1, 0, '2023-12-14 12:51:44', '2023-12-14 12:51:44');
INSERT INTO `fb_seat` VALUES (214, 3, 1, 1, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (215, 3, 1, 2, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (216, 3, 1, 3, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (217, 3, 1, 4, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (218, 3, 1, 5, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (219, 3, 1, 6, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (220, 3, 1, 7, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (221, 3, 1, 8, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (222, 3, 2, 1, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (223, 3, 2, 2, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (224, 3, 2, 3, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (225, 3, 2, 4, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (226, 3, 2, 5, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (227, 3, 2, 6, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (228, 3, 2, 7, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (229, 3, 2, 8, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (230, 3, 3, 1, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (231, 3, 3, 2, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (232, 3, 3, 3, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (233, 3, 3, 4, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (234, 3, 3, 5, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (235, 3, 3, 6, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (236, 3, 3, 7, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (237, 3, 3, 8, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (238, 3, 4, 1, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (239, 3, 4, 2, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (240, 3, 4, 3, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (241, 3, 4, 4, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (242, 3, 4, 5, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (243, 3, 4, 6, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (244, 3, 4, 7, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (245, 3, 4, 8, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (246, 3, 5, 1, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (247, 3, 5, 2, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (248, 3, 5, 3, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (249, 3, 5, 4, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (250, 3, 5, 5, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (251, 3, 5, 6, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (252, 3, 5, 7, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (253, 3, 5, 8, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (254, 3, 6, 1, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (255, 3, 6, 2, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (256, 3, 6, 3, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (257, 3, 6, 4, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (258, 3, 6, 5, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (259, 3, 6, 6, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (260, 3, 6, 7, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (261, 3, 6, 8, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (262, 3, 7, 1, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (263, 3, 7, 2, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (264, 3, 7, 3, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (265, 3, 7, 4, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (266, 3, 7, 5, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (267, 3, 7, 6, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (268, 3, 7, 7, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (269, 3, 7, 8, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (270, 3, 8, 1, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (271, 3, 8, 2, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (272, 3, 8, 3, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (273, 3, 8, 4, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (274, 3, 8, 5, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (275, 3, 8, 6, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (276, 3, 8, 7, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (277, 3, 8, 8, 0, 0, '2023-12-17 16:39:00', '2023-12-17 16:39:00');
INSERT INTO `fb_seat` VALUES (278, 4, 1, 1, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (279, 4, 1, 2, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (280, 4, 1, 3, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (281, 4, 1, 4, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (282, 4, 1, 5, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (283, 4, 1, 6, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (284, 4, 1, 7, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (285, 4, 1, 8, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (286, 4, 2, 1, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (287, 4, 2, 2, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (288, 4, 2, 3, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (289, 4, 2, 4, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (290, 4, 2, 5, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (291, 4, 2, 6, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (292, 4, 2, 7, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (293, 4, 2, 8, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (294, 4, 3, 1, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (295, 4, 3, 2, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (296, 4, 3, 3, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (297, 4, 3, 4, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (298, 4, 3, 5, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (299, 4, 3, 6, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (300, 4, 3, 7, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (301, 4, 3, 8, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (302, 4, 4, 1, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (303, 4, 4, 2, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (304, 4, 4, 3, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (305, 4, 4, 4, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (306, 4, 4, 5, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (307, 4, 4, 6, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (308, 4, 4, 7, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (309, 4, 4, 8, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (310, 4, 5, 1, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (311, 4, 5, 2, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (312, 4, 5, 3, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (313, 4, 5, 4, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (314, 4, 5, 5, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (315, 4, 5, 6, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (316, 4, 5, 7, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (317, 4, 5, 8, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (318, 4, 6, 1, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (319, 4, 6, 2, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (320, 4, 6, 3, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (321, 4, 6, 4, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (322, 4, 6, 5, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (323, 4, 6, 6, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (324, 4, 6, 7, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (325, 4, 6, 8, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (326, 4, 7, 1, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (327, 4, 7, 2, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (328, 4, 7, 3, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (329, 4, 7, 4, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (330, 4, 7, 5, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (331, 4, 7, 6, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (332, 4, 7, 7, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (333, 4, 7, 8, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (334, 4, 8, 1, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (335, 4, 8, 2, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (336, 4, 8, 3, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (337, 4, 8, 4, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (338, 4, 8, 5, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (339, 4, 8, 6, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (340, 4, 8, 7, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (341, 4, 8, 8, 0, 0, '2023-12-17 16:39:37', '2023-12-17 16:39:37');
INSERT INTO `fb_seat` VALUES (342, 5, 1, 1, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (343, 5, 1, 2, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (344, 5, 1, 3, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (345, 5, 1, 4, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (346, 5, 1, 5, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (347, 5, 1, 6, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (348, 5, 1, 7, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (349, 5, 1, 8, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (350, 5, 2, 1, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (351, 5, 2, 2, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (352, 5, 2, 3, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (353, 5, 2, 4, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (354, 5, 2, 5, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (355, 5, 2, 6, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (356, 5, 2, 7, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (357, 5, 2, 8, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (358, 5, 3, 1, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (359, 5, 3, 2, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (360, 5, 3, 3, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (361, 5, 3, 4, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (362, 5, 3, 5, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (363, 5, 3, 6, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (364, 5, 3, 7, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (365, 5, 3, 8, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (366, 5, 4, 1, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (367, 5, 4, 2, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (368, 5, 4, 3, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (369, 5, 4, 4, 1, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (370, 5, 4, 5, 1, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (371, 5, 4, 6, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (372, 5, 4, 7, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (373, 5, 4, 8, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (374, 5, 5, 1, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (375, 5, 5, 2, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (376, 5, 5, 3, 1, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (377, 5, 5, 4, 1, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (378, 5, 5, 5, 1, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (379, 5, 5, 6, 1, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (380, 5, 5, 7, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (381, 5, 5, 8, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (382, 5, 6, 1, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (383, 5, 6, 2, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (384, 5, 6, 3, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (385, 5, 6, 4, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (386, 5, 6, 5, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (387, 5, 6, 6, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (388, 5, 6, 7, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (389, 5, 6, 8, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (390, 5, 7, 1, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (391, 5, 7, 2, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (392, 5, 7, 3, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (393, 5, 7, 4, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (394, 5, 7, 5, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (395, 5, 7, 6, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (396, 5, 7, 7, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (397, 5, 7, 8, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (398, 5, 8, 1, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (399, 5, 8, 2, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (400, 5, 8, 3, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (401, 5, 8, 4, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (402, 5, 8, 5, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (403, 5, 8, 6, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (404, 5, 8, 7, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (405, 5, 8, 8, 0, 0, '2023-12-17 16:45:22', '2023-12-17 16:45:22');
INSERT INTO `fb_seat` VALUES (470, 6, 1, 1, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (471, 6, 1, 2, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (472, 6, 1, 3, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (473, 6, 1, 4, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (474, 6, 1, 5, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (475, 6, 1, 6, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (476, 6, 1, 7, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (477, 6, 1, 8, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (478, 6, 2, 1, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (479, 6, 2, 2, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (480, 6, 2, 3, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (481, 6, 2, 4, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (482, 6, 2, 5, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (483, 6, 2, 6, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (484, 6, 2, 7, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (485, 6, 2, 8, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (486, 6, 3, 1, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (487, 6, 3, 2, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (488, 6, 3, 3, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (489, 6, 3, 4, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (490, 6, 3, 5, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (491, 6, 3, 6, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (492, 6, 3, 7, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (493, 6, 3, 8, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (494, 6, 4, 1, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (495, 6, 4, 2, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (496, 6, 4, 3, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (497, 6, 4, 4, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (498, 6, 4, 5, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (499, 6, 4, 6, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (500, 6, 4, 7, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (501, 6, 4, 8, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (502, 6, 5, 1, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (503, 6, 5, 2, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (504, 6, 5, 3, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (505, 6, 5, 4, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (506, 6, 5, 5, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (507, 6, 5, 6, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (508, 6, 5, 7, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (509, 6, 5, 8, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (510, 6, 6, 1, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (511, 6, 6, 2, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (512, 6, 6, 3, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (513, 6, 6, 4, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (514, 6, 6, 5, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (515, 6, 6, 6, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (516, 6, 6, 7, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (517, 6, 6, 8, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (518, 6, 7, 1, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (519, 6, 7, 2, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (520, 6, 7, 3, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (521, 6, 7, 4, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (522, 6, 7, 5, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (523, 6, 7, 6, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (524, 6, 7, 7, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (525, 6, 7, 8, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (526, 6, 8, 1, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (527, 6, 8, 2, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (528, 6, 8, 3, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (529, 6, 8, 4, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (530, 6, 8, 5, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (531, 6, 8, 6, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (532, 6, 8, 7, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (533, 6, 8, 8, 0, 0, '2023-12-21 14:24:48', '2023-12-21 14:24:48');
INSERT INTO `fb_seat` VALUES (534, 7, 1, 1, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (535, 7, 1, 2, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (536, 7, 1, 3, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (537, 7, 1, 4, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (538, 7, 1, 5, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (539, 7, 1, 6, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (540, 7, 1, 7, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (541, 7, 1, 8, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (542, 7, 2, 1, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (543, 7, 2, 2, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (544, 7, 2, 3, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (545, 7, 2, 4, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (546, 7, 2, 5, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (547, 7, 2, 6, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (548, 7, 2, 7, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (549, 7, 2, 8, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (550, 7, 3, 1, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (551, 7, 3, 2, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (552, 7, 3, 3, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (553, 7, 3, 4, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (554, 7, 3, 5, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (555, 7, 3, 6, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (556, 7, 3, 7, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (557, 7, 3, 8, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (558, 7, 4, 1, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (559, 7, 4, 2, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (560, 7, 4, 3, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (561, 7, 4, 4, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (562, 7, 4, 5, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (563, 7, 4, 6, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (564, 7, 4, 7, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (565, 7, 4, 8, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (566, 7, 5, 1, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (567, 7, 5, 2, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (568, 7, 5, 3, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (569, 7, 5, 4, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (570, 7, 5, 5, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (571, 7, 5, 6, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (572, 7, 5, 7, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (573, 7, 5, 8, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (574, 7, 6, 1, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (575, 7, 6, 2, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (576, 7, 6, 3, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (577, 7, 6, 4, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (578, 7, 6, 5, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (579, 7, 6, 6, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (580, 7, 6, 7, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (581, 7, 6, 8, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (582, 7, 7, 1, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (583, 7, 7, 2, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (584, 7, 7, 3, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (585, 7, 7, 4, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (586, 7, 7, 5, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (587, 7, 7, 6, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (588, 7, 7, 7, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (589, 7, 7, 8, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (590, 7, 8, 1, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (591, 7, 8, 2, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (592, 7, 8, 3, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (593, 7, 8, 4, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (594, 7, 8, 5, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (595, 7, 8, 6, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (596, 7, 8, 7, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (597, 7, 8, 8, 0, 0, '2023-12-21 14:24:52', '2023-12-21 14:24:52');
INSERT INTO `fb_seat` VALUES (598, 8, 1, 1, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (599, 8, 1, 2, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (600, 8, 1, 3, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (601, 8, 1, 4, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (602, 8, 1, 5, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (603, 8, 1, 6, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (604, 8, 1, 7, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (605, 8, 1, 8, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (606, 8, 2, 1, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (607, 8, 2, 2, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (608, 8, 2, 3, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (609, 8, 2, 4, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (610, 8, 2, 5, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (611, 8, 2, 6, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (612, 8, 2, 7, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (613, 8, 2, 8, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (614, 8, 3, 1, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (615, 8, 3, 2, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (616, 8, 3, 3, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (617, 8, 3, 4, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (618, 8, 3, 5, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (619, 8, 3, 6, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (620, 8, 3, 7, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (621, 8, 3, 8, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (622, 8, 4, 1, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (623, 8, 4, 2, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (624, 8, 4, 3, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (625, 8, 4, 4, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (626, 8, 4, 5, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (627, 8, 4, 6, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (628, 8, 4, 7, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (629, 8, 4, 8, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (630, 8, 5, 1, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (631, 8, 5, 2, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (632, 8, 5, 3, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (633, 8, 5, 4, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (634, 8, 5, 5, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (635, 8, 5, 6, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (636, 8, 5, 7, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (637, 8, 5, 8, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (638, 8, 6, 1, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (639, 8, 6, 2, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (640, 8, 6, 3, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (641, 8, 6, 4, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (642, 8, 6, 5, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (643, 8, 6, 6, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (644, 8, 6, 7, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (645, 8, 6, 8, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (646, 8, 7, 1, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (647, 8, 7, 2, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (648, 8, 7, 3, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (649, 8, 7, 4, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (650, 8, 7, 5, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (651, 8, 7, 6, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (652, 8, 7, 7, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (653, 8, 7, 8, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (654, 8, 8, 1, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (655, 8, 8, 2, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (656, 8, 8, 3, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (657, 8, 8, 4, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (658, 8, 8, 5, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (659, 8, 8, 6, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (660, 8, 8, 7, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (661, 8, 8, 8, 0, 0, '2023-12-21 14:27:20', '2023-12-21 14:27:20');
INSERT INTO `fb_seat` VALUES (662, 9, 1, 1, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (663, 9, 1, 2, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (664, 9, 1, 3, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (665, 9, 1, 4, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (666, 9, 1, 5, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (667, 9, 1, 6, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (668, 9, 1, 7, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (669, 9, 1, 8, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (670, 9, 2, 1, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (671, 9, 2, 2, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (672, 9, 2, 3, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (673, 9, 2, 4, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (674, 9, 2, 5, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (675, 9, 2, 6, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (676, 9, 2, 7, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (677, 9, 2, 8, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (678, 9, 3, 1, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (679, 9, 3, 2, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (680, 9, 3, 3, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (681, 9, 3, 4, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (682, 9, 3, 5, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (683, 9, 3, 6, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (684, 9, 3, 7, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (685, 9, 3, 8, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (686, 9, 4, 1, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (687, 9, 4, 2, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (688, 9, 4, 3, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (689, 9, 4, 4, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (690, 9, 4, 5, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (691, 9, 4, 6, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (692, 9, 4, 7, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (693, 9, 4, 8, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (694, 9, 5, 1, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (695, 9, 5, 2, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (696, 9, 5, 3, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (697, 9, 5, 4, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (698, 9, 5, 5, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (699, 9, 5, 6, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (700, 9, 5, 7, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (701, 9, 5, 8, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (702, 9, 6, 1, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (703, 9, 6, 2, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (704, 9, 6, 3, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (705, 9, 6, 4, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (706, 9, 6, 5, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (707, 9, 6, 6, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (708, 9, 6, 7, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (709, 9, 6, 8, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (710, 9, 7, 1, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (711, 9, 7, 2, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (712, 9, 7, 3, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (713, 9, 7, 4, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (714, 9, 7, 5, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (715, 9, 7, 6, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (716, 9, 7, 7, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (717, 9, 7, 8, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (718, 9, 8, 1, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (719, 9, 8, 2, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (720, 9, 8, 3, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (721, 9, 8, 4, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (722, 9, 8, 5, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (723, 9, 8, 6, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (724, 9, 8, 7, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');
INSERT INTO `fb_seat` VALUES (725, 9, 8, 8, 0, 0, '2023-12-21 14:27:24', '2023-12-21 14:27:24');

-- ----------------------------
-- Table structure for fb_showtime
-- ----------------------------
DROP TABLE IF EXISTS `fb_showtime`;
CREATE TABLE `fb_showtime`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cinema_id` bigint NULL DEFAULT NULL COMMENT '影院id',
  `film_id` bigint NULL DEFAULT NULL COMMENT '影片id',
  `date` datetime NULL DEFAULT NULL COMMENT '放映日期（显示今明两天）',
  `hour` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '放映时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '厅号',
  `price` int NULL DEFAULT NULL COMMENT '价格',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0：未删除1：已删除）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fb_showtime
-- ----------------------------
INSERT INTO `fb_showtime` VALUES (1, 1, 2, '2024-01-01 00:00:00', '21:15', '2', 38, 0, '2023-11-19 21:15:35', '2023-11-18 21:15:39');
INSERT INTO `fb_showtime` VALUES (2, 1, 2, '2024-01-01 00:00:00', '22:05', '7', 40, 0, '2023-11-19 21:15:24', '2023-11-18 21:15:27');
INSERT INTO `fb_showtime` VALUES (3, 1, 2, '2024-01-02 00:00:00', '13:00', '2', 25, 0, '2023-11-20 21:17:12', '2023-11-19 21:17:19');
INSERT INTO `fb_showtime` VALUES (4, 1, 2, '2024-01-02 00:00:00', '16:30', '7', 25, 0, '2023-11-20 21:17:12', '2023-11-19 21:17:12');
INSERT INTO `fb_showtime` VALUES (5, 1, 1, '2024-01-01 00:00:00', '13:30', '1', 19, 0, '2023-12-17 16:44:40', '2023-12-17 16:44:40');
INSERT INTO `fb_showtime` VALUES (6, 2, 2, '2024-01-01 00:00:00', '21:15', '2', 19, 0, '2023-12-21 14:21:47', '2023-12-21 14:21:50');
INSERT INTO `fb_showtime` VALUES (7, 2, 1, '2024-01-01 00:00:00', '14:30', '3', 19, 0, '2023-12-21 14:21:47', '2023-12-21 14:21:47');
INSERT INTO `fb_showtime` VALUES (8, 3, 1, '2024-01-01 00:00:00', '15:30', '4', 20, 0, '2023-12-21 14:26:33', '2023-12-21 14:26:35');
INSERT INTO `fb_showtime` VALUES (9, 3, 2, '2024-01-01 00:00:00', '13:45', '7', 19, 0, '2023-12-21 14:27:00', '2023-12-21 14:27:03');

-- ----------------------------
-- Table structure for fb_user
-- ----------------------------
DROP TABLE IF EXISTS `fb_user`;
CREATE TABLE `fb_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名邮箱',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` int NULL DEFAULT NULL COMMENT '盐值',
  `balance` int NULL DEFAULT NULL COMMENT '余额',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0：未删除1：已删除）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fb_user
-- ----------------------------
INSERT INTO `fb_user` VALUES (1, '3465976682@qq.com', '123456', NULL, 1867, 0, '2023-11-11 17:03:42', '2023-11-11 17:03:44');
INSERT INTO `fb_user` VALUES (5, '1090060206@qq.com', '123456', NULL, 762, 0, '2023-12-19 14:31:01', '2023-12-19 14:31:01');
INSERT INTO `fb_user` VALUES (6, '1090060207@qq.com', '123456', NULL, 0, 0, '2023-12-19 14:31:01', '2023-12-19 14:31:01');

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'fb_actor', '演员', '', '', 'Actor', 'crud', 'com.ruoyi.fb', 'actor', 'actor', 'actor', 'chen', '0', '/', '{}', 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:57:23', NULL);
INSERT INTO `gen_table` VALUES (2, 'fb_comment', '评论', NULL, NULL, 'Comment', 'crud', 'com.ruoyi.fb', 'comment', 'comment', 'comment', 'chen', '0', '/', '{}', 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:05', NULL);
INSERT INTO `gen_table` VALUES (3, 'fb_user', '用户', NULL, NULL, 'User', 'crud', 'com.ruoyi.fb', 'user', 'user', 'user', 'chen', '0', '/', '{}', 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:45', NULL);
INSERT INTO `gen_table` VALUES (4, 'fb_cinema', '影院', NULL, NULL, 'Cinema', 'crud', 'com.ruoyi.fb', 'cinema', 'cinema', 'cinema', 'chen', '0', '/', '{}', 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:58:56', NULL);
INSERT INTO `gen_table` VALUES (5, 'fb_film', '影片', NULL, NULL, 'Film', 'crud', 'com.ruoyi.fb', 'film', 'film', 'film', 'chen', '0', '/', '{}', 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05', NULL);
INSERT INTO `gen_table` VALUES (6, 'fb_order', '订单', NULL, NULL, 'Order', 'crud', 'com.ruoyi.fb', 'order', 'order', 'order', 'chen', '0', '/', '{}', 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:11', NULL);
INSERT INTO `gen_table` VALUES (7, 'fb_seat', '座位', NULL, NULL, 'Seat', 'crud', 'com.ruoyi.fb', 'seat', 'seat', 'seat', 'chen', '0', '/', '{}', 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:21', NULL);
INSERT INTO `gen_table` VALUES (8, 'fb_showtime', '放映场次', NULL, NULL, 'Showtime', 'crud', 'com.ruoyi.fb', 'showtime', 'showtime', 'showtime', 'chen', '0', '/', '{}', 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:29', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
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
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '主键id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:57:23');
INSERT INTO `gen_table_column` VALUES (2, 1, 'name', '姓名', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:57:23');
INSERT INTO `gen_table_column` VALUES (3, 1, 'img', '照片', 'varchar(255)', 'String', 'img', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:57:23');
INSERT INTO `gen_table_column` VALUES (4, 1, 'deleted', '删除标识（0：未删除1：已删除）', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:57:23');
INSERT INTO `gen_table_column` VALUES (5, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:57:23');
INSERT INTO `gen_table_column` VALUES (6, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:57:23');
INSERT INTO `gen_table_column` VALUES (7, 2, 'id', '主键id', 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:05');
INSERT INTO `gen_table_column` VALUES (8, 2, 'comment', '评论内容', 'varchar(255)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:05');
INSERT INTO `gen_table_column` VALUES (9, 2, 'user_id', '评论者id', 'bigint', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:05');
INSERT INTO `gen_table_column` VALUES (10, 2, 'film_id', '影片id', 'bigint', 'Long', 'filmId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:05');
INSERT INTO `gen_table_column` VALUES (11, 2, 'deleted', '删除标识（0：未删除1：已删除）', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:05');
INSERT INTO `gen_table_column` VALUES (12, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:05');
INSERT INTO `gen_table_column` VALUES (13, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:05');
INSERT INTO `gen_table_column` VALUES (14, 3, 'id', '主键id', 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:45');
INSERT INTO `gen_table_column` VALUES (15, 3, 'username', '用户名邮箱', 'varchar(255)', 'String', 'username', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:45');
INSERT INTO `gen_table_column` VALUES (16, 3, 'password', '密码', 'varchar(255)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:45');
INSERT INTO `gen_table_column` VALUES (17, 3, 'salt', '盐值', 'int', 'Long', 'salt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:45');
INSERT INTO `gen_table_column` VALUES (18, 3, 'balance', '余额', 'int', 'Long', 'balance', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:45');
INSERT INTO `gen_table_column` VALUES (19, 3, 'deleted', '删除标识（0：未删除1：已删除）', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-11 13:27:23', '', '2023-11-11 13:58:45');
INSERT INTO `gen_table_column` VALUES (20, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2023-11-11 13:27:24', '', '2023-11-11 13:58:45');
INSERT INTO `gen_table_column` VALUES (21, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-11-11 13:27:24', '', '2023-11-11 13:58:45');
INSERT INTO `gen_table_column` VALUES (22, 4, 'id', '主键id', 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:58:56');
INSERT INTO `gen_table_column` VALUES (23, 4, 'brand_name', '品牌名称', 'varchar(255)', 'String', 'brandName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:58:56');
INSERT INTO `gen_table_column` VALUES (24, 4, 'cinema_name', '影院名称', 'varchar(255)', 'String', 'cinemaName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:58:56');
INSERT INTO `gen_table_column` VALUES (25, 4, 'province', '省', 'varchar(255)', 'String', 'province', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:58:56');
INSERT INTO `gen_table_column` VALUES (26, 4, 'city', '市', 'varchar(255)', 'String', 'city', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:58:56');
INSERT INTO `gen_table_column` VALUES (27, 4, 'area', '区', 'varchar(255)', 'String', 'area', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:58:56');
INSERT INTO `gen_table_column` VALUES (28, 4, 'address', '地址', 'varchar(255)', 'String', 'address', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:58:56');
INSERT INTO `gen_table_column` VALUES (29, 4, 'deleted', '删除标识（0：未删除1：已删除）', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:58:56');
INSERT INTO `gen_table_column` VALUES (30, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:58:56');
INSERT INTO `gen_table_column` VALUES (31, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:58:56');
INSERT INTO `gen_table_column` VALUES (32, 5, 'id', '主键id', 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (33, 5, 'img', '照片', 'varchar(255)', 'String', 'img', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (34, 5, 'name', '影片中文名', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (35, 5, 'ename', '影皮英文名', 'varchar(255)', 'String', 'ename', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (36, 5, 'tag', '标签', 'varchar(255)', 'String', 'tag', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (37, 5, 'cat', '类型', 'varchar(255)', 'String', 'cat', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (38, 5, 'date', '上映时间', 'datetime', 'Date', 'date', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (39, 5, 'addr', '上映地区', 'varchar(255)', 'String', 'addr', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (40, 5, 'dur', '时长', 'int', 'Long', 'dur', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (41, 5, 'wish', '想看人数', 'int', 'Long', 'wish', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (42, 5, 'watched', '看过人数', 'int', 'Long', 'watched', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (43, 5, 'sc', '评分', 'double', 'Long', 'sc', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (44, 5, 'snum', '评分人数', 'int', 'Long', 'snum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (45, 5, 'status', '状态（0：未上映1：已上映）', 'int', 'Long', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 14, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (46, 5, 'actors', '演员们的ids', 'varchar(255)', 'String', 'actors', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (47, 5, 'deleted', '删除标识（0：未删除1：已删除）', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (48, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (49, 5, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:05');
INSERT INTO `gen_table_column` VALUES (50, 6, 'id', '主键id', 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:11');
INSERT INTO `gen_table_column` VALUES (51, 6, 'cinema_name', '影院名称', 'varchar(255)', 'String', 'cinemaName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:11');
INSERT INTO `gen_table_column` VALUES (52, 6, 'film_name', '影片名称', 'varchar(255)', 'String', 'filmName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:11');
INSERT INTO `gen_table_column` VALUES (53, 6, 'user_id', '用户id', 'bigint', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:11');
INSERT INTO `gen_table_column` VALUES (54, 6, 'seat', '座位信息', 'varchar(255)', 'String', 'seat', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:11');
INSERT INTO `gen_table_column` VALUES (55, 6, 'price', '总价', 'int', 'Long', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:11');
INSERT INTO `gen_table_column` VALUES (56, 6, 'deleted', '删除标识（0：未删除1：已删除）', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:11');
INSERT INTO `gen_table_column` VALUES (57, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:11');
INSERT INTO `gen_table_column` VALUES (58, 6, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:11');
INSERT INTO `gen_table_column` VALUES (59, 7, 'id', '主键id', 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:21');
INSERT INTO `gen_table_column` VALUES (60, 7, 'showtime_id', '场次id', 'bigint', 'Long', 'showtimeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:21');
INSERT INTO `gen_table_column` VALUES (61, 7, 'rn', '座位所在排的编号', 'tinyint', 'Long', 'rn', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:21');
INSERT INTO `gen_table_column` VALUES (62, 7, 'cn', '座位所在列的编号', 'tinyint', 'Long', 'cn', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:21');
INSERT INTO `gen_table_column` VALUES (63, 7, 'status', '状态（0：空闲1：已售出）', 'varchar(255)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:21');
INSERT INTO `gen_table_column` VALUES (64, 7, 'deleted', '删除标识（0：未删除1：已删除）', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:21');
INSERT INTO `gen_table_column` VALUES (65, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:21');
INSERT INTO `gen_table_column` VALUES (66, 7, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:21');
INSERT INTO `gen_table_column` VALUES (67, 8, 'id', '主键id', 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:29');
INSERT INTO `gen_table_column` VALUES (68, 8, 'cinema_id', '影院id', 'bigint', 'Long', 'cinemaId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:29');
INSERT INTO `gen_table_column` VALUES (69, 8, 'film_id', '影片id', 'bigint', 'Long', 'filmId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:29');
INSERT INTO `gen_table_column` VALUES (70, 8, 'date', '放映日期（显示今明两天）', 'datetime', 'Date', 'date', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:29');
INSERT INTO `gen_table_column` VALUES (71, 8, 'hour', '放映时间', 'varchar(255)', 'String', 'hour', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:29');
INSERT INTO `gen_table_column` VALUES (72, 8, 'name', '厅号', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:29');
INSERT INTO `gen_table_column` VALUES (73, 8, 'price', '价格', 'int', 'Long', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:29');
INSERT INTO `gen_table_column` VALUES (74, 8, 'deleted', '删除标识（0：未删除1：已删除）', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:29');
INSERT INTO `gen_table_column` VALUES (75, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:29');
INSERT INTO `gen_table_column` VALUES (76, 8, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2023-11-11 13:34:43', '', '2023-11-11 13:59:29');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-11-11 12:51:14', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-11-11 12:51:14', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-11-11 12:51:14', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2023-11-11 12:51:14', 'admin', '2023-11-11 12:54:00', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-11-11 12:51:14', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-11-11 12:51:14', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

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
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'FilmBuy', 0, 'chen', '15888888888', 'chen@qq.com', '0', '0', 'admin', '2023-11-11 12:51:13', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, 'chen', '15888888888', 'chen@qq.com', '0', '0', 'admin', '2023-11-11 12:51:13', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, 'chen', '15888888888', 'chen@qq.com', '0', '0', 'admin', '2023-11-11 12:51:13', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, 'chen', '15888888888', 'chen@qq.com', '0', '0', 'admin', '2023-11-11 12:51:13', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, 'chen', '15888888888', 'chen@qq.com', '0', '0', 'admin', '2023-11-11 12:51:13', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, 'chen', '15888888888', 'chen@qq.com', '0', '0', 'admin', '2023-11-11 12:51:13', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, 'chen', '15888888888', 'chen@qq.com', '0', '0', 'admin', '2023-11-11 12:51:13', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, 'chen', '15888888888', 'chen@qq.com', '0', '0', 'admin', '2023-11-11 12:51:13', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, 'chen', '15888888888', 'chen@qq.com', '0', '0', 'admin', '2023-11-11 12:51:13', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, 'chen', '15888888888', 'chen@qq.com', '0', '0', 'admin', '2023-11-11 12:51:13', '', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '停用状态');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-11-11 12:51:14', '', NULL, '登录状态列表');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-11-11 12:51:14', '', NULL, '');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

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
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-11 12:52:08');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-11 12:52:17');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-11 13:19:38');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-11 13:19:41');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-11 13:23:18');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-11 13:26:12');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-11 13:47:05');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-11 13:48:05');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-11 14:22:06');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-11 14:22:17');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-11 14:22:28');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-11 14:22:52');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-11 14:25:44');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-11 16:20:20');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-11 16:21:45');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-18 10:34:43');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-18 10:38:54');
INSERT INTO `sys_logininfor` VALUES (117, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-18 10:38:58');
INSERT INTO `sys_logininfor` VALUES (118, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-03 20:33:39');
INSERT INTO `sys_logininfor` VALUES (119, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-12-03 20:40:36');
INSERT INTO `sys_logininfor` VALUES (120, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-12-03 20:40:45');
INSERT INTO `sys_logininfor` VALUES (121, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-12-03 20:40:45');
INSERT INTO `sys_logininfor` VALUES (122, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-12-03 20:40:49');
INSERT INTO `sys_logininfor` VALUES (123, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-12-03 20:40:49');
INSERT INTO `sys_logininfor` VALUES (124, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-03 20:40:51');
INSERT INTO `sys_logininfor` VALUES (125, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-12-03 20:41:13');
INSERT INTO `sys_logininfor` VALUES (126, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-03 20:41:16');
INSERT INTO `sys_logininfor` VALUES (127, 'chen', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-17 16:14:32');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2050 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 3, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-11-11 12:51:14', 'admin', '2023-11-11 14:15:47', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-11-11 12:51:14', 'admin', '2023-11-11 14:14:50', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-11-11 12:51:14', 'admin', '2023-11-11 14:14:55', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, 'Github地址', 0, 5, 'https://github.com/ChenJiaQi0/film-buy', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-11-11 12:51:14', 'admin', '2023-11-11 14:14:58', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-11-11 12:51:14', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-11-11 12:51:14', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-11-11 12:51:14', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-11-11 12:51:14', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-11-11 12:51:14', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-11-11 12:51:14', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-11-11 12:51:14', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-11-11 12:51:14', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-11-11 12:51:14', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-11-11 12:51:14', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-11-11 12:51:14', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-11-11 12:51:14', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-11-11 12:51:14', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-11-11 12:51:14', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-11-11 12:51:14', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-11-11 12:51:14', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-11-11 12:51:14', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-11-11 12:51:14', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-11-11 12:51:14', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-11-11 12:51:14', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-11-11 12:51:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '演员', 2049, 1, 'actor', 'actor/actor/index', NULL, 1, 0, 'C', '0', '0', 'actor:actor:list', 'peoples', 'admin', '2023-11-11 13:37:41', 'admin', '2023-11-11 16:23:24', 'actor菜单');
INSERT INTO `sys_menu` VALUES (2001, '演员查询', 2000, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'actor:actor:query', '#', 'admin', '2023-11-11 13:37:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '演员新增', 2000, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'actor:actor:add', '#', 'admin', '2023-11-11 13:37:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '演员修改', 2000, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'actor:actor:edit', '#', 'admin', '2023-11-11 13:37:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '演员删除', 2000, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'actor:actor:remove', '#', 'admin', '2023-11-11 13:37:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '演员导出', 2000, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'actor:actor:export', '#', 'admin', '2023-11-11 13:37:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '影院', 2050, 0, 'cinema', 'cinema/cinema/index', NULL, 1, 0, 'C', '0', '0', 'cinema:cinema:list', 'dashboard', 'admin', '2023-11-11 13:37:53', 'admin', '2023-11-11 16:23:32', 'cinema菜单');
INSERT INTO `sys_menu` VALUES (2007, '影院查询', 2006, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'cinema:cinema:query', '#', 'admin', '2023-11-11 13:37:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '影院新增', 2006, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'cinema:cinema:add', '#', 'admin', '2023-11-11 13:37:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '影院修改', 2006, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'cinema:cinema:edit', '#', 'admin', '2023-11-11 13:37:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '影院删除', 2006, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'cinema:cinema:remove', '#', 'admin', '2023-11-11 13:37:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '影院导出', 2006, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'cinema:cinema:export', '#', 'admin', '2023-11-11 13:37:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '评论', 2048, 1, 'comment', 'comment/comment/index', NULL, 1, 0, 'C', '0', '0', 'comment:comment:list', 'email', 'admin', '2023-11-11 13:38:05', 'admin', '2023-11-11 16:22:53', 'comment菜单');
INSERT INTO `sys_menu` VALUES (2013, '评论查询', 2012, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'comment:comment:query', '#', 'admin', '2023-11-11 13:38:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '评论新增', 2012, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'comment:comment:add', '#', 'admin', '2023-11-11 13:38:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '评论修改', 2012, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'comment:comment:edit', '#', 'admin', '2023-11-11 13:38:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '评论删除', 2012, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'comment:comment:remove', '#', 'admin', '2023-11-11 13:38:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '评论导出', 2012, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'comment:comment:export', '#', 'admin', '2023-11-11 13:38:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '影片', 2049, 0, 'film', 'film/film/index', NULL, 1, 0, 'C', '0', '0', 'film:film:list', 'chart', 'admin', '2023-11-11 13:38:23', 'admin', '2023-11-11 16:23:12', 'film菜单');
INSERT INTO `sys_menu` VALUES (2019, '影片查询', 2018, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'film:film:query', '#', 'admin', '2023-11-11 13:38:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '影片新增', 2018, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'film:film:add', '#', 'admin', '2023-11-11 13:38:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '影片修改', 2018, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'film:film:edit', '#', 'admin', '2023-11-11 13:38:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '影片删除', 2018, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'film:film:remove', '#', 'admin', '2023-11-11 13:38:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '影片导出', 2018, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'film:film:export', '#', 'admin', '2023-11-11 13:38:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '订单', 2048, 2, 'order', 'order/order/index', NULL, 1, 0, 'C', '0', '0', 'order:order:list', 'shopping', 'admin', '2023-11-11 13:38:33', 'admin', '2023-11-11 16:23:04', 'order菜单');
INSERT INTO `sys_menu` VALUES (2025, '订单查询', 2024, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'order:order:query', '#', 'admin', '2023-11-11 13:38:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '订单新增', 2024, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'order:order:add', '#', 'admin', '2023-11-11 13:38:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '订单修改', 2024, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'order:order:edit', '#', 'admin', '2023-11-11 13:38:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '订单删除', 2024, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'order:order:remove', '#', 'admin', '2023-11-11 13:38:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '订单导出', 2024, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'order:order:export', '#', 'admin', '2023-11-11 13:38:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '座位', 2050, 2, 'seat', 'seat/seat/index', NULL, 1, 0, 'C', '0', '0', 'seat:seat:list', 'table', 'admin', '2023-11-11 13:38:40', 'admin', '2023-11-11 16:24:06', 'seat菜单');
INSERT INTO `sys_menu` VALUES (2031, '座位查询', 2030, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'seat:seat:query', '#', 'admin', '2023-11-11 13:38:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '座位新增', 2030, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'seat:seat:add', '#', 'admin', '2023-11-11 13:38:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '座位修改', 2030, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'seat:seat:edit', '#', 'admin', '2023-11-11 13:38:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '座位删除', 2030, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'seat:seat:remove', '#', 'admin', '2023-11-11 13:38:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '座位导出', 2030, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'seat:seat:export', '#', 'admin', '2023-11-11 13:38:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '放映场次', 2050, 1, 'showtime', 'showtime/showtime/index', NULL, 1, 0, 'C', '0', '0', 'showtime:showtime:list', 'education', 'admin', '2023-11-11 13:38:48', 'admin', '2023-11-11 16:23:38', 'showtime菜单');
INSERT INTO `sys_menu` VALUES (2037, '放映场次查询', 2036, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'showtime:showtime:query', '#', 'admin', '2023-11-11 13:38:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '放映场次新增', 2036, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'showtime:showtime:add', '#', 'admin', '2023-11-11 13:38:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '放映场次修改', 2036, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'showtime:showtime:edit', '#', 'admin', '2023-11-11 13:38:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '放映场次删除', 2036, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'showtime:showtime:remove', '#', 'admin', '2023-11-11 13:38:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '放映场次导出', 2036, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'showtime:showtime:export', '#', 'admin', '2023-11-11 13:38:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '用户', 2048, 0, 'user', 'user/user/index', NULL, 1, 0, 'C', '0', '0', 'user:user:list', 'user', 'admin', '2023-11-11 13:39:01', 'admin', '2023-11-11 16:22:32', 'user菜单');
INSERT INTO `sys_menu` VALUES (2043, '用户查询', 2042, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:user:query', '#', 'admin', '2023-11-11 13:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '用户新增', 2042, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:user:add', '#', 'admin', '2023-11-11 13:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '用户修改', 2042, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:user:edit', '#', 'admin', '2023-11-11 13:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '用户删除', 2042, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:user:remove', '#', 'admin', '2023-11-11 13:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '用户导出', 2042, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:user:export', '#', 'admin', '2023-11-11 13:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '用户模块', 0, 0, 'user', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'user', 'admin', '2023-11-11 14:08:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '影片模块', 0, 1, 'film', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'monitor', 'admin', '2023-11-11 14:13:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '影院模块', 0, 2, 'cinema', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'education', 'admin', '2023-11-11 14:15:36', '', NULL, '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-11-11 12:51:14', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-11-11 12:51:14', '', NULL, '管理员');

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
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 12:51:14\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 12:54:00', 57);
INSERT INTO `sys_oper_log` VALUES (101, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/11/11/blob_20231111125543A001.png\",\"code\":200}', 0, NULL, '2023-11-11 12:55:43', 116);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"fb_user,fb_actor,fb_comment\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:27:24', 77);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"actor\",\"className\":\"Actor\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Img\",\"columnComment\":\"照片\",\"columnId\":3,\"columnName\":\"img\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"img\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"删除标识（0：未删除1：已删除）\",\"columnId\":4,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"deleted\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"re', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:28:37', 36);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fb_actor\"}', NULL, 0, NULL, '2023-11-11 13:29:05', 34);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"comment\",\"className\":\"Comment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":7,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Comment\",\"columnComment\":\"评论内容\",\"columnId\":8,\"columnName\":\"comment\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"comment\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"评论者id\",\"columnId\":9,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FilmId\",\"columnComment\":\"影片id\",\"columnId\":10,\"columnName\":\"film_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"filmId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:32:09', 28);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"actor\",\"className\":\"Actor\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:28:37\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:28:37\",\"usableColumn\":false},{\"capJavaField\":\"Img\",\"columnComment\":\"照片\",\"columnId\":3,\"columnName\":\"img\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"img\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:28:37\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"删除标识（0：未删除1：已删除）\",\"columnId\":4,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"ja', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:32:37', 14);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"actor\",\"className\":\"Actor\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:32:37\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:32:37\",\"usableColumn\":false},{\"capJavaField\":\"Img\",\"columnComment\":\"照片\",\"columnId\":3,\"columnName\":\"img\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"img\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:32:37\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"删除标识（0：未删除1：已删除）\",\"columnId\":4,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"ja', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:33:35', 16);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"comment\",\"className\":\"Comment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":7,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:32:09\",\"usableColumn\":false},{\"capJavaField\":\"Comment\",\"columnComment\":\"评论内容\",\"columnId\":8,\"columnName\":\"comment\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"comment\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:32:09\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"评论者id\",\"columnId\":9,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:32:09\",\"usableColumn\":false},{\"capJavaField\":\"FilmId\",\"columnComment\":\"影片id\",\"columnId\":10,\"columnName\":\"film_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:33:44', 20);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user\",\"className\":\"User\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":14,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名邮箱\",\"columnId\":15,\"columnName\":\"username\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Password\",\"columnComment\":\"密码\",\"columnId\":16,\"columnName\":\"password\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"password\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Salt\",\"columnComment\":\"盐值\",\"columnId\":17,\"columnName\":\"salt\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"salt\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"E', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:34:18', 20);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"fb_order,fb_seat,fb_showtime,fb_film,fb_cinema\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:34:43', 103);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"cinema\",\"className\":\"Cinema\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BrandName\",\"columnComment\":\"品牌名称\",\"columnId\":23,\"columnName\":\"brand_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"brandName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CinemaName\",\"columnComment\":\"影院名称\",\"columnId\":24,\"columnName\":\"cinema_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cinemaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Province\",\"columnComment\":\"省\",\"columnId\":25,\"columnName\":\"province\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"province\",\"javaType\":\"String\",\"list\":true,\"params\":{', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:35:17', 17);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"film\",\"className\":\"Film\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":32,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Img\",\"columnComment\":\"照片\",\"columnId\":33,\"columnName\":\"img\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"img\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"影片中文名\",\"columnId\":34,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Ename\",\"columnComment\":\"影皮英文名\",\"columnId\":35,\"columnName\":\"ename\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"ename\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"requ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:35:42', 36);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"Order\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":50,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CinemaName\",\"columnComment\":\"影院名称\",\"columnId\":51,\"columnName\":\"cinema_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cinemaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FilmName\",\"columnComment\":\"影片名称\",\"columnId\":52,\"columnName\":\"film_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"filmName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":53,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"q', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:36:06', 13);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"seat\",\"className\":\"Seat\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":59,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ShowtimeId\",\"columnComment\":\"场次id\",\"columnId\":60,\"columnName\":\"showtime_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"showtimeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Rn\",\"columnComment\":\"座位所在排的编号\",\"columnId\":61,\"columnName\":\"rn\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"rn\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Cn\",\"columnComment\":\"座位所在列的编号\",\"columnId\":62,\"columnName\":\"cn\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"cn\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:36:31', 24);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"showtime\",\"className\":\"Showtime\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":67,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CinemaId\",\"columnComment\":\"影院id\",\"columnId\":68,\"columnName\":\"cinema_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cinemaId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FilmId\",\"columnComment\":\"影片id\",\"columnId\":69,\"columnName\":\"film_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"filmId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnComment\":\"放映日期（显示今明两天）\",\"columnId\":70,\"columnName\":\"date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"date\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryTyp', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:36:56', 26);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fb_actor,fb_comment,fb_user,fb_cinema,fb_film,fb_order,fb_seat,fb_showtime\"}', NULL, 0, NULL, '2023-11-11 13:36:59', 229);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"actor\",\"className\":\"Actor\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:33:35\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:33:35\",\"usableColumn\":false},{\"capJavaField\":\"Img\",\"columnComment\":\"照片\",\"columnId\":3,\"columnName\":\"img\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"img\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:33:35\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"删除标识（0：未删除1：已删除）\",\"columnId\":4,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"ja', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:57:23', 68);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"comment\",\"className\":\"Comment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":7,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:33:44\",\"usableColumn\":false},{\"capJavaField\":\"Comment\",\"columnComment\":\"评论内容\",\"columnId\":8,\"columnName\":\"comment\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"comment\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:33:44\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"评论者id\",\"columnId\":9,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:33:44\",\"usableColumn\":false},{\"capJavaField\":\"FilmId\",\"columnComment\":\"影片id\",\"columnId\":10,\"columnName\":\"film_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:58:05', 39);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user\",\"className\":\"User\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":14,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:34:18\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名邮箱\",\"columnId\":15,\"columnName\":\"username\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:34:18\",\"usableColumn\":false},{\"capJavaField\":\"Password\",\"columnComment\":\"密码\",\"columnId\":16,\"columnName\":\"password\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"password\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:34:18\",\"usableColumn\":false},{\"capJavaField\":\"Salt\",\"columnComment\":\"盐值\",\"columnId\":17,\"columnName\":\"salt\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:27:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:58:45', 48);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"cinema\",\"className\":\"Cinema\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:35:17\",\"usableColumn\":false},{\"capJavaField\":\"BrandName\",\"columnComment\":\"品牌名称\",\"columnId\":23,\"columnName\":\"brand_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"brandName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:35:17\",\"usableColumn\":false},{\"capJavaField\":\"CinemaName\",\"columnComment\":\"影院名称\",\"columnId\":24,\"columnName\":\"cinema_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cinemaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:35:17\",\"usableColumn\":false},{\"capJavaField\":\"Province\",\"columnComment\":\"省\",\"columnId\":25,\"columnName\":\"province\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:58:56', 30);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"film\",\"className\":\"Film\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":32,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:35:42\",\"usableColumn\":false},{\"capJavaField\":\"Img\",\"columnComment\":\"照片\",\"columnId\":33,\"columnName\":\"img\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"img\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:35:42\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"影片中文名\",\"columnId\":34,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:35:42\",\"usableColumn\":false},{\"capJavaField\":\"Ename\",\"columnComment\":\"影皮英文名\",\"columnId\":35,\"columnName\":\"ename\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaFi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:59:05', 34);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"Order\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":50,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:36:06\",\"usableColumn\":false},{\"capJavaField\":\"CinemaName\",\"columnComment\":\"影院名称\",\"columnId\":51,\"columnName\":\"cinema_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cinemaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:36:06\",\"usableColumn\":false},{\"capJavaField\":\"FilmName\",\"columnComment\":\"影片名称\",\"columnId\":52,\"columnName\":\"film_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"filmName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:36:06\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":53,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:59:11', 26);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"seat\",\"className\":\"Seat\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":59,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:36:31\",\"usableColumn\":false},{\"capJavaField\":\"ShowtimeId\",\"columnComment\":\"场次id\",\"columnId\":60,\"columnName\":\"showtime_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"showtimeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:36:31\",\"usableColumn\":false},{\"capJavaField\":\"Rn\",\"columnComment\":\"座位所在排的编号\",\"columnId\":61,\"columnName\":\"rn\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"rn\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:36:31\",\"usableColumn\":false},{\"capJavaField\":\"Cn\",\"columnComment\":\"座位所在列的编号\",\"columnId\":62,\"columnName\":\"cn\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:59:21', 20);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"showtime\",\"className\":\"Showtime\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":67,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:36:56\",\"usableColumn\":false},{\"capJavaField\":\"CinemaId\",\"columnComment\":\"影院id\",\"columnId\":68,\"columnName\":\"cinema_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cinemaId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:36:56\",\"usableColumn\":false},{\"capJavaField\":\"FilmId\",\"columnComment\":\"影片id\",\"columnId\":69,\"columnName\":\"film_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"filmId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-11-11 13:36:56\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnComment\":\"放映日期（显示今明两天）\",\"columnId\":70,\"columnName\":\"date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 13:34:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 13:59:29', 22);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fb_actor,fb_comment,fb_user,fb_cinema,fb_film,fb_order,fb_seat,fb_showtime\"}', NULL, 0, NULL, '2023-11-11 14:00:01', 259);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户模块\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"user\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:08:02', 132);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"actor/actor/index\",\"createTime\":\"2023-11-11 13:37:41\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"演员\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2048,\"path\":\"actor\",\"perms\":\"user:actor:actor:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:10:58', 10);
INSERT INTO `sys_oper_log` VALUES (128, 'actor', 1, 'com.ruoyi.fb.controller.ActorController.add()', 'POST', 1, 'admin', NULL, '/actor/actor', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-11 14:11:17\",\"deleted\":0,\"id\":1,\"img\":\"1\",\"name\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:11:17', 20);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"user/user/index\",\"createTime\":\"2023-11-11 13:39:01\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"用户\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2048,\"path\":\"user\",\"perms\":\"user:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:12:26', 12);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"order/order/index\",\"createTime\":\"2023-11-11 13:38:33\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"订单\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2048,\"path\":\"order\",\"perms\":\"order:order:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:12:41', 12);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"comment/comment/index\",\"createTime\":\"2023-11-11 13:38:05\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"评论\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2048,\"path\":\"comment\",\"perms\":\"comment:comment:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:12:52', 12);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"影片模块\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"film\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:13:50', 11);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-11-11 12:51:14\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:14:00', 19);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"actor/actor/index\",\"createTime\":\"2023-11-11 13:37:41\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"演员\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2049,\"path\":\"actor\",\"perms\":\"actor:actor:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:14:16', 12);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"film/film/index\",\"createTime\":\"2023-11-11 13:38:23\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"影片\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2049,\"path\":\"film\",\"perms\":\"film:film:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:14:29', 13);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-11-11 12:51:14\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:14:50', 11);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-11-11 12:51:14\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:14:55', 13);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-11-11 12:51:14\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:14:58', 12);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"影院模块\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"cinema\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:15:36', 12);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-11-11 12:51:14\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:15:47', 12);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"cinema/cinema/index\",\"createTime\":\"2023-11-11 13:37:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"影院\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2050,\"path\":\"cinema\",\"perms\":\"cinema:cinema:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:16:00', 12);
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"showtime/showtime/index\",\"createTime\":\"2023-11-11 13:38:48\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2036,\"menuName\":\"放映场次\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2050,\"path\":\"showtime\",\"perms\":\"showtime:showtime:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:16:12', 11);
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"seat/seat/index\",\"createTime\":\"2023-11-11 13:38:40\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"座位\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2050,\"path\":\"seat\",\"perms\":\"seat:seat:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 14:16:20', 11);
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"user/user/index\",\"createTime\":\"2023-11-11 13:39:01\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"用户\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2048,\"path\":\"user\",\"perms\":\"user:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 16:22:32', 12);
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"comment/comment/index\",\"createTime\":\"2023-11-11 13:38:05\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"评论\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2048,\"path\":\"comment\",\"perms\":\"comment:comment:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 16:22:53', 8);
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"order/order/index\",\"createTime\":\"2023-11-11 13:38:33\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"订单\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2048,\"path\":\"order\",\"perms\":\"order:order:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 16:23:04', 9);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"film/film/index\",\"createTime\":\"2023-11-11 13:38:23\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"影片\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2049,\"path\":\"film\",\"perms\":\"film:film:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 16:23:12', 9);
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"actor/actor/index\",\"createTime\":\"2023-11-11 13:37:41\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"演员\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2049,\"path\":\"actor\",\"perms\":\"actor:actor:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 16:23:25', 10);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"cinema/cinema/index\",\"createTime\":\"2023-11-11 13:37:53\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"影院\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2050,\"path\":\"cinema\",\"perms\":\"cinema:cinema:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 16:23:32', 10);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"showtime/showtime/index\",\"createTime\":\"2023-11-11 13:38:48\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2036,\"menuName\":\"放映场次\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2050,\"path\":\"showtime\",\"perms\":\"showtime:showtime:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 16:23:38', 9);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"seat/seat/index\",\"createTime\":\"2023-11-11 13:38:40\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"座位\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2050,\"path\":\"seat\",\"perms\":\"seat:seat:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 16:24:06', 10);
INSERT INTO `sys_oper_log` VALUES (152, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-11 12:51:13\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2048,2042,2043,2044,2045,2046,2047,2012,2013,2014,2015,2016,2017,2024,2025,2026,2027,2028,2029,2049,2018,2019,2020,2021,2022,2023,2000,2001,2002,2003,2004,2005,2050,2006,2007,2008,2009,2010,2011,2036,2037,2038,2039,2040,2041,2030,2031,2032,2033,2034,2035,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 10:37:33', 81);
INSERT INTO `sys_oper_log` VALUES (153, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-11 12:51:13\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2048,2042,2043,2044,2045,2046,2047,2012,2013,2014,2015,2016,2017,2024,2025,2026,2027,2028,2029,2049,2018,2019,2020,2021,2022,2023,2000,2001,2002,2003,2004,2005,2050,2006,2007,2008,2009,2010,2011,2036,2037,2038,2039,2040,2041,2030,2031,2032,2033,2034,2035,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"修改角色\'管理员\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2023-11-18 10:37:56', 5);
INSERT INTO `sys_oper_log` VALUES (154, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-11 12:51:13\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2048,2042,2043,2044,2045,2046,2047,2012,2013,2014,2015,2016,2017,2024,2025,2026,2027,2028,2029,2049,2018,2019,2020,2021,2022,2023,2000,2001,2002,2003,2004,2005,2050,2006,2007,2008,2009,2010,2011,2036,2037,2038,2039,2040,2041,2030,2031,2032,2033,2034,2035,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 10:38:24', 20);
INSERT INTO `sys_oper_log` VALUES (155, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 12:51:13\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"chen\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"chen@qq.com\",\"loginDate\":\"2023-11-11 12:51:13\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"chen\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[],\"remark\":\"管理者\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"chen\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 10:38:51', 18);
INSERT INTO `sys_oper_log` VALUES (156, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'chen', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/12/03/blob_20231203204006A001.png\",\"code\":200}', 0, NULL, '2023-12-03 20:40:07', 129);
INSERT INTO `sys_oper_log` VALUES (157, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'chen', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-11-11 12:51:13\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"FilmBuy\",\"leader\":\"chen\",\"orderNum\":0,\"params\":{\"@type\":\"java.util.HashMap\"},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"chen@qq.com\",\"loginDate\":\"2023-11-18 10:38:59\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"chen\",\"params\":{\"@type\":\"java.util.HashMap\"},\"phonenumber\":\"15666666666\",\"remark\":\"管理者\",\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{\"@type\":\"java.util.HashMap\"},\"permissions\":[\"film:film:add\",\"monitor:druid:list\",\"user:user:list\",\"comment:comment:export\",\"order:order:export\",\"order:order:add\",\"monitor:job:list\",\"comment:comment:add\",\"cinema:cinema:edit\",\"cinema:cinema:query\",\"monitor:job:edit\",\"showtime:showtime:remove\",\"cinema:cinema:list\",\"actor:actor:remove\",\"monitor:job:query\",\"user:user:edit\",\"monitor:online:forceLogout\",\"seat:seat:edit\",\"showtime:showtime:list\",\"monitor:online:query\",\"cinema:cinema:export\",\"monitor:online:list\",\"showtime:showtime:add\",\"seat:seat:list\",\"showtime:showtime:edit\",\"monitor:job:add\",\"comment:comment:remove\",\"order:order:query\",\"seat:seat:query\",\"showtime:showtime:query\",\"actor:actor:add\",\"cinema:cinema:remove\",\"comment:comment:query\",\"seat:seat:remove\",\"showtime:showtime:export\",\"actor:actor:list\",\"comment:comment:edit\",\"order:order:list\",\"actor:actor:export\",\"monitor:online:batchLogout\",\"order:order:edit\",\"monitor:server:list\",\"comment:comment:list\",\"monitor:job:changeStatus\",\"seat:seat:add\",\"actor:actor:query\",\"film:film:list\",\"monitor:job:remove\",\"film:film:query\",\"seat:seat:export\",\"monitor:cache:list\",\"film:film:remove\",\"user:user:add\",\"order:order:remove\",\"user:user:query\",\"film:film:export\",\"user:user:remove\",\"monitor:job:export\",\"cinema:cinema:add\",\"film:film:edit\",\"user:user:export\",\"actor:actor:edit\"],\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-03 20:40:09', 62);
INSERT INTO `sys_oper_log` VALUES (158, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'chen', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-03 20:41:07', 351);
INSERT INTO `sys_oper_log` VALUES (159, 'showtime', 1, 'com.ruoyi.fb.controller.ShowtimeController.add()', 'POST', 1, 'chen', NULL, '/showtime/showtime', '127.0.0.1', '内网IP', '{\"cinemaId\":1,\"createTime\":\"2023-12-17 16:44:40\",\"date\":\"2023-12-20\",\"deleted\":0,\"filmId\":1,\"hour\":\"13:30\",\"name\":\"1\",\"params\":{},\"price\":19}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-17 16:44:40', 75);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-11-11 12:51:13', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-11-11 12:51:13', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-11-11 12:51:13', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-11-11 12:51:13', '', NULL, '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-11-11 12:51:13', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '管理员', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-11-11 12:51:13', 'admin', '2023-11-18 10:38:24', '普通角色');

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
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (2, 2038);
INSERT INTO `sys_role_menu` VALUES (2, 2039);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (2, 2041);
INSERT INTO `sys_role_menu` VALUES (2, 2042);
INSERT INTO `sys_role_menu` VALUES (2, 2043);
INSERT INTO `sys_role_menu` VALUES (2, 2044);
INSERT INTO `sys_role_menu` VALUES (2, 2045);
INSERT INTO `sys_role_menu` VALUES (2, 2046);
INSERT INTO `sys_role_menu` VALUES (2, 2047);
INSERT INTO `sys_role_menu` VALUES (2, 2048);
INSERT INTO `sys_role_menu` VALUES (2, 2049);
INSERT INTO `sys_role_menu` VALUES (2, 2050);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'chen', '00', 'chen@163.com', '15888888888', '1', '/profile/avatar/2023/11/11/blob_20231111125543A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-11-18 10:34:44', 'admin', '2023-11-11 12:51:13', '', '2023-11-18 10:34:43', '管理员');
INSERT INTO `sys_user` VALUES (2, 100, 'chen', 'chen', '00', 'chen@qq.com', '15666666666', '0', '/profile/avatar/2023/12/03/blob_20231203204006A001.png', '$2a$10$g5/wzvjkOPFJmvKlGXwyqughyRyHIiRY81RvSeu2SCCTmbPEHb9ZG', '0', '0', '127.0.0.1', '2023-12-17 16:14:32', 'admin', '2023-11-11 12:51:13', 'admin', '2023-12-17 16:14:32', '管理者');

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

SET FOREIGN_KEY_CHECKS = 1;
