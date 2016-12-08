/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50548
Source Host           : localhost:3306
Source Database       : carmanage

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2016-12-08 21:03:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_car
-- ----------------------------
DROP TABLE IF EXISTS `t_car`;
CREATE TABLE `t_car` (
  `I_ID` int(11) NOT NULL AUTO_INCREMENT,
  `S_FILENAME` varchar(255) DEFAULT NULL,
  `S_CARTYPE` varchar(255) DEFAULT NULL,
  `S_CAROWNER` varchar(255) DEFAULT NULL,
  `S_ADDRESS` varchar(255) DEFAULT NULL,
  `S_CARNUM` varchar(255) DEFAULT NULL,
  `S_BUSINESSNUM` varchar(255) DEFAULT NULL,
  `S_FACTORYNUM` varchar(255) DEFAULT NULL,
  `S_ENGINENUM` varchar(255) DEFAULT NULL,
  `S_CHASSISNUM` varchar(255) DEFAULT NULL,
  `S_COLOR` varchar(255) DEFAULT NULL,
  `S_PHONENUM` varchar(255) DEFAULT NULL,
  `D_PURCHASEDATE` datetime DEFAULT NULL,
  `I_CAPACITY` int(11) DEFAULT NULL,
  `I_STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`I_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_car
-- ----------------------------
INSERT INTO `t_car` VALUES ('1', '00001', '客运', '刘阳阳', '河南科技学院A407', '豫HLY846', 'G7770', '五菱宏光V', 'LDE', 'CDE', '灰色', '15560236959', '2016-03-17 00:00:00', '7', null);
INSERT INTO `t_car` VALUES ('3', '00003', '货运', '黄佳佳', '河南科技学院0#511', '豫G3760', '654', 'CLEF', 'L3', '23', '215', '15736933138', '2016-04-23 00:00:00', '150', null);
INSERT INTO `t_car` VALUES ('4', '00004', '客运', '凡洋洋', '河南科技学院', '豫GLY846', 'G79983', '一汽奥迪', 'e89', '86', '蓝色', '15560236959', '2016-03-17 00:00:00', '7', null);
INSERT INTO `t_car` VALUES ('5', '00005', '客运', '王石根', '河南科技学院', '豫GLY847', 'G79984', '一汽奥迪', 'e90', '86', '蓝色', '15737313659', '2016-03-18 00:00:00', '8', null);
INSERT INTO `t_car` VALUES ('6', '00006', '客运', '王少峰', '河南科技学院', '豫GLY848', 'G79985', '一汽奥迪', 'e91', '86', '蓝色', '15237306853', '2016-03-17 00:00:01', '9', null);
INSERT INTO `t_car` VALUES ('7', '00007', '客运', '牛洧鹏', '河南科技学院', '豫GLY849', 'G79986', '一汽奥迪', 'e92', '86', '蓝色', '15237312815', '2016-03-18 00:00:01', '10', null);
INSERT INTO `t_car` VALUES ('8', '00008', '客运', '凡羊羊', '河南科技学院', '豫GLY850', 'G79987', '玛莎拉蒂', 'e93', '86', '蓝色', '15839445176', '2016-03-17 00:00:02', '11', null);
INSERT INTO `t_car` VALUES ('9', '00009', '客运', '时帅帅', '河南科技学院', '豫GLY851', 'G79988', '一汽奥迪', 'e94', '86', '蓝色', '15603812829', '2016-03-18 00:00:02', '7', null);
INSERT INTO `t_car` VALUES ('10', '00010', '货运', '赵硕', '河南科技学院', '豫GLY852', 'G79989', '一汽奥迪', 'e95', '86', '蓝色', '15237387732', '2016-03-17 00:00:03', '7', null);
INSERT INTO `t_car` VALUES ('11', '00011', '货运', '王宾宾', '河南科技学院', '豫GLY853', 'G79990', '一汽奥迪', 'e96', '86', '蓝色', '18737306783', '2016-03-18 00:00:03', '7', null);
INSERT INTO `t_car` VALUES ('12', '00012', '客运', '黄佳佳', '河南科技学院', '豫GLY854', 'G79991', '一汽奥迪', 'e97', '86', '蓝色', '15737316628', '2016-03-17 00:00:04', '7', null);
INSERT INTO `t_car` VALUES ('13', '00013', '货运', '陈书梦', '河南科技学院', '豫GLY855', 'G79992', '一汽奥迪', 'e98', '86', '蓝色', '15737315290', '2016-03-18 00:00:04', '7', null);
INSERT INTO `t_car` VALUES ('14', '00014', '客运', '宋子庆', '河南科技学院', '豫GLY856', 'G79993', '一汽奥迪', 'e99', '86', '蓝色', '15737315290', '2016-03-17 00:00:05', '7', null);
INSERT INTO `t_car` VALUES ('15', '00015', '货运', '李亚楠', '河南科技学院', '豫GLY857', 'G79994', '一汽奥迪', 'e100', '86', '蓝色', '15237359183', '2016-03-18 00:00:05', '7', null);
INSERT INTO `t_car` VALUES ('16', '00016', '货运', '刘国坤', '河南科技学院', '豫GLY858', 'G79995', '一汽奥迪', 'e101', '86', '蓝色', '15517373790', '2016-03-17 00:00:06', '7', null);
INSERT INTO `t_car` VALUES ('17', '00017', '客运', '张梦鸽', '河南科技学院', '豫GLY859', 'G79996', '玛莎拉蒂', 'e102', '86', '蓝色', '15737313394', '2016-03-18 00:00:06', '7', null);
INSERT INTO `t_car` VALUES ('18', '00018', '货运', '廖  红', '河南科技学院', '豫GLY860', 'G79997', '一汽奥迪', 'e103', '86', '蓝色', '15737316070', '2016-03-17 00:00:07', '7', null);
INSERT INTO `t_car` VALUES ('19', '00019', '货运', '王孟鸽', '河南科技学院', '豫GLY861', 'G79998', '一汽奥迪', 'e104', '86', '蓝色', '18237315195', '2016-03-18 00:00:07', '7', null);
INSERT INTO `t_car` VALUES ('20', '00020', '客运', '张冰月', '河南科技学院', '豫GLY862', 'G79999', '玛莎拉蒂', 'e105', '86', '蓝色', '15237369630', '2016-03-17 00:00:08', '7', null);
INSERT INTO `t_car` VALUES ('21', '00021', '客运', '李智', '河南科技学院', '豫GLY863', 'G80000', '一汽奥迪', 'e106', '86', '蓝色', '15736975249', '2016-03-18 00:00:08', '7', null);
INSERT INTO `t_car` VALUES ('22', '00022', '货运', '张雪', '河南科技学院', '豫GLY864', 'G80001', '一汽奥迪', 'e107', '86', '蓝色', '15237353570', '2016-03-17 00:00:09', '7', null);
INSERT INTO `t_car` VALUES ('23', '00023', '客运', '王伟', '河南科技学院', '豫GLY865', 'G80002', '玛莎拉蒂', 'e108', '86', '蓝色', '15237331310', '2016-03-18 00:00:09', '7', null);
INSERT INTO `t_car` VALUES ('24', '00024', '货运', '蔡伟', '河南科技学院', '豫GLY866', 'G80003', '一汽奥迪', 'e109', '86', '蓝色', '15237335283', '2016-03-17 00:00:10', '7', null);
INSERT INTO `t_car` VALUES ('25', '00025', '客运', '彩秋放', '河南科技学院', '豫GLY867', 'G80004', '玛莎拉蒂', 'e110', '86', '蓝色', '15736975362', '2016-03-18 00:00:10', '7', null);
INSERT INTO `t_car` VALUES ('26', '00026', '货运', '游婷', '河南科技学院', '豫GLY868', 'G80005', '一汽奥迪', 'e111', '86', '蓝色', '15225951171', '2016-03-17 00:00:11', '7', null);
INSERT INTO `t_car` VALUES ('27', '00027', '货运', '顾艳凤', '河南科技学院', '豫GLY869', 'G80006', '一汽奥迪', 'e112', '86', '蓝色', '15225968863', '2016-03-18 00:00:11', '7', null);
INSERT INTO `t_car` VALUES ('28', '00028', '货运', '卢保', '河南科技学院', '豫GLY870', 'G80007', '一汽奥迪', 'e113', '86', '蓝色', '18737306083', '2016-03-17 00:00:12', '7', null);
INSERT INTO `t_car` VALUES ('29', '00029', '货运', '翟思凡', '河南科技学院', '豫GLY871', 'G80008', '一汽奥迪', 'e114', '86', '蓝色', '15225958033', '2016-03-18 00:00:12', '7', null);
INSERT INTO `t_car` VALUES ('32', '00032', '货运', '123', '123', '123', '123', '123', '123', '123', '123', '123', '2016-04-06 00:00:00', '123', null);
INSERT INTO `t_car` VALUES ('33', '00033', '货运', 'zzzzzzzz', '123', '312', '123', '123', '123', '123', '123', '123', '2016-04-12 00:00:00', '123', null);
INSERT INTO `t_car` VALUES ('34', '00034', '货运', '44', '44', '44', '44', '44', '44', '44', '44', '44', '2016-04-08 00:00:00', '44', null);
INSERT INTO `t_car` VALUES ('35', '00035', '客运', '凡羊羊', '河南新乡', '豫FYY5210', '123344', '122344', '1234', '123', 'red', '1234567', '2016-03-31 00:00:00', '2', null);
INSERT INTO `t_car` VALUES ('36', '00036', '货运', 'sdrgsdfg', 'sdgsd', 'sdgdsfg', 'sdge', 'sdgs', 'sdg', 'sdg', 'sdg', 'sdgsdg', '2016-04-04 00:00:00', '123', null);
INSERT INTO `t_car` VALUES ('37', '00037', '客运', '1234', '1234', '12345', '12345', '1234', '1234', '123', 'q\'we\'r', '儿童', '2016-04-06 00:00:00', '123', null);
INSERT INTO `t_car` VALUES ('38', '00038', '货运', '=-', '-=', '-=', '-=', '=-', '0=', '0=', '0=', 'tyo0ptytpy', '2016-04-06 00:00:00', '45', null);
INSERT INTO `t_car` VALUES ('39', '00039', '货运', 'yr', 'y', 'ty', 'ty', 'yr', 'y', 'yty', 'tyr', 'ui', '2016-04-12 00:00:00', '5', null);
INSERT INTO `t_car` VALUES ('40', '00040', '客运', '123', '123', '3123123', '123', '123', '123', '123', '123', '123', '2016-04-12 00:00:00', '123', null);
INSERT INTO `t_car` VALUES ('41', '00041', '货运', 'asd', 'asd', '234', '234', '123', '123', '12312', '红色', '12312312', '2016-03-29 00:00:00', '123', null);
INSERT INTO `t_car` VALUES ('42', '00042', '货运', 'asd', 'qweqw', '345', '4324', '23423', '23423', '234', '234', '234234', '2016-04-21 00:00:00', '234', null);

-- ----------------------------
-- Table structure for t_repairhistory
-- ----------------------------
DROP TABLE IF EXISTS `t_repairhistory`;
CREATE TABLE `t_repairhistory` (
  `I_ID` int(11) NOT NULL AUTO_INCREMENT,
  `D_REPAIRDATE` datetime DEFAULT NULL,
  `D_NEXTREPAIRDATE` datetime DEFAULT NULL,
  `I_STATUS` int(11) DEFAULT NULL,
  `carId` int(11) DEFAULT NULL,
  `repairManId` int(11) DEFAULT NULL,
  PRIMARY KEY (`I_ID`),
  KEY `FK_da9kfokmfi7qy68y6ffn0l3e5` (`carId`),
  KEY `FK_r0upju54cjh11rh96b30bcc1k` (`repairManId`),
  CONSTRAINT `FK_da9kfokmfi7qy68y6ffn0l3e5` FOREIGN KEY (`carId`) REFERENCES `t_car` (`I_ID`),
  CONSTRAINT `FK_r0upju54cjh11rh96b30bcc1k` FOREIGN KEY (`repairManId`) REFERENCES `t_user` (`I_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_repairhistory
-- ----------------------------
INSERT INTO `t_repairhistory` VALUES ('1', '2016-04-04 00:00:00', '2016-08-02 00:00:00', '0', '1', '2');
INSERT INTO `t_repairhistory` VALUES ('2', '2016-04-04 00:00:00', '2016-08-02 00:00:00', '0', '1', '2');
INSERT INTO `t_repairhistory` VALUES ('3', '2016-04-04 00:00:00', '2016-08-02 00:00:00', '0', '1', '2');
INSERT INTO `t_repairhistory` VALUES ('4', '2016-04-04 00:00:00', '2016-04-20 00:00:00', '0', '1', '2');
INSERT INTO `t_repairhistory` VALUES ('5', '2016-04-04 00:00:00', '2016-08-02 00:00:00', '0', '1', '5');
INSERT INTO `t_repairhistory` VALUES ('6', '2016-04-04 00:00:00', '2016-04-20 00:00:00', '0', '3', '5');
INSERT INTO `t_repairhistory` VALUES ('7', '2016-04-04 00:00:00', '2016-08-02 00:00:00', '0', '1', '62');
INSERT INTO `t_repairhistory` VALUES ('8', '2016-04-04 00:00:00', '2016-08-02 00:00:00', '0', '1', '5');
INSERT INTO `t_repairhistory` VALUES ('9', '2016-04-04 00:00:00', '2016-08-02 00:00:00', '0', '1', '5');
INSERT INTO `t_repairhistory` VALUES ('10', '2016-04-05 00:00:00', '2016-08-03 00:00:00', '0', '6', '5');
INSERT INTO `t_repairhistory` VALUES ('11', '2016-04-05 00:00:00', '2016-04-28 00:00:00', '1', '25', '91');
INSERT INTO `t_repairhistory` VALUES ('12', '2016-04-05 00:00:00', '2016-08-03 00:00:00', '0', '1', '84');
INSERT INTO `t_repairhistory` VALUES ('13', '2016-04-05 00:00:00', '2016-08-03 00:00:00', '1', '21', '5');
INSERT INTO `t_repairhistory` VALUES ('14', '2016-04-08 00:00:00', '2016-08-06 00:00:00', '0', '1', '5');
INSERT INTO `t_repairhistory` VALUES ('17', '2016-04-08 00:00:00', '2016-08-06 00:00:00', '0', '1', '5');
INSERT INTO `t_repairhistory` VALUES ('18', '2016-04-08 00:00:00', '2016-04-15 00:00:00', '0', '1', '5');
INSERT INTO `t_repairhistory` VALUES ('19', '2016-04-08 00:00:00', '2016-08-06 00:00:00', '1', '29', '5');
INSERT INTO `t_repairhistory` VALUES ('20', '2016-04-08 00:00:00', '2016-08-06 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('21', '2016-04-08 00:00:00', '2016-08-06 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('22', '2016-04-08 00:00:00', '2016-08-06 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('23', '2016-04-08 00:00:00', '2016-04-13 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('24', '2016-04-08 00:00:00', '2016-04-13 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('25', '2016-04-08 00:00:00', '2016-04-13 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('26', '2016-04-08 00:00:00', '2016-04-13 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('27', '2016-04-08 00:00:00', '2016-04-10 00:00:00', '1', '1', '84');
INSERT INTO `t_repairhistory` VALUES ('28', '2016-04-08 00:00:00', '2016-04-15 00:00:00', '1', '35', '84');
INSERT INTO `t_repairhistory` VALUES ('29', '2016-04-08 00:00:00', '2016-04-10 00:00:00', '1', '36', '104');
INSERT INTO `t_repairhistory` VALUES ('30', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('31', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '135');
INSERT INTO `t_repairhistory` VALUES ('32', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '135');
INSERT INTO `t_repairhistory` VALUES ('33', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '135');
INSERT INTO `t_repairhistory` VALUES ('34', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '135');
INSERT INTO `t_repairhistory` VALUES ('35', '2016-04-09 00:00:00', '2016-04-13 00:00:00', '1', '41', '135');
INSERT INTO `t_repairhistory` VALUES ('36', '2016-04-04 00:00:00', '2016-04-14 00:00:00', '1', '21', '90');
INSERT INTO `t_repairhistory` VALUES ('37', '2016-04-05 00:00:00', '2016-04-15 00:00:00', '1', '22', '91');
INSERT INTO `t_repairhistory` VALUES ('39', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '91');
INSERT INTO `t_repairhistory` VALUES ('41', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '91');
INSERT INTO `t_repairhistory` VALUES ('43', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '91');
INSERT INTO `t_repairhistory` VALUES ('45', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '91');
INSERT INTO `t_repairhistory` VALUES ('47', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '91');
INSERT INTO `t_repairhistory` VALUES ('49', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '91');
INSERT INTO `t_repairhistory` VALUES ('51', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '91');
INSERT INTO `t_repairhistory` VALUES ('53', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '91');
INSERT INTO `t_repairhistory` VALUES ('54', '2016-04-06 00:00:00', '2016-04-11 00:00:00', '1', '23', '91');
INSERT INTO `t_repairhistory` VALUES ('55', '2016-04-07 00:00:00', '2016-04-12 00:00:00', '1', '24', '91');
INSERT INTO `t_repairhistory` VALUES ('56', '2016-04-08 00:00:00', '2016-04-13 00:00:00', '1', '25', '91');
INSERT INTO `t_repairhistory` VALUES ('57', '2016-04-09 00:00:00', '2016-04-14 00:00:00', '1', '26', '91');
INSERT INTO `t_repairhistory` VALUES ('58', '2016-04-10 00:00:00', '2016-04-15 00:00:00', '1', '27', '96');
INSERT INTO `t_repairhistory` VALUES ('59', '2016-04-11 00:00:00', '2016-04-16 00:00:00', '1', '28', '97');
INSERT INTO `t_repairhistory` VALUES ('60', '2016-04-12 00:00:00', '2016-04-17 00:00:00', '1', '29', '98');
INSERT INTO `t_repairhistory` VALUES ('66', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('67', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('68', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('69', '2016-04-06 00:00:00', '2016-04-11 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('70', '2016-04-07 00:00:00', '2016-04-12 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('71', '2016-04-08 00:00:00', '2016-04-13 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('72', '2016-04-09 00:00:00', '2016-04-14 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('73', '2016-04-10 00:00:00', '2016-04-15 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('74', '2016-04-11 00:00:00', '2016-04-16 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('75', '2016-04-12 00:00:00', '2016-04-17 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('76', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('77', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('78', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('79', '2016-04-06 00:00:00', '2016-04-11 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('80', '2016-04-07 00:00:00', '2016-04-12 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('81', '2016-04-08 00:00:00', '2016-04-13 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('82', '2016-04-09 00:00:00', '2016-04-14 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('83', '2016-04-10 00:00:00', '2016-04-15 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('84', '2016-04-11 00:00:00', '2016-04-16 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('85', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('86', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('87', '2016-04-05 00:00:00', '2016-04-10 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('88', '2016-04-06 00:00:00', '2016-04-11 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('89', '2016-04-07 00:00:00', '2016-04-12 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('90', '2016-04-08 00:00:00', '2016-04-13 00:00:00', '1', '22', '135');
INSERT INTO `t_repairhistory` VALUES ('91', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('92', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('93', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('94', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('95', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('96', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('97', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '4', '5');
INSERT INTO `t_repairhistory` VALUES ('98', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('99', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('100', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('101', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '5');
INSERT INTO `t_repairhistory` VALUES ('102', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '0', '32', '134');
INSERT INTO `t_repairhistory` VALUES ('103', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '1', '4', '5');
INSERT INTO `t_repairhistory` VALUES ('104', '2016-04-09 00:00:00', '2016-08-07 00:00:00', '1', '32', '5');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `I_ID` int(11) NOT NULL AUTO_INCREMENT,
  `S_NAME` varchar(255) DEFAULT NULL,
  `S_LOGINNAME` varchar(255) DEFAULT NULL,
  `S_PASSWORD` varchar(255) DEFAULT NULL,
  `S_PHONENUM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`I_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2', '张三1', 'zhangsan', '202cb962ac59075b964b07152d234b70', '155602369');
INSERT INTO `t_user` VALUES ('5', '超级管理员', 'admin', 'caf1a3dfb505ffed0d024130f58c5cfa', '15560236959');
INSERT INTO `t_user` VALUES ('62', '123', 'jiajia', '202cb962ac59075b964b07152d234b70', '15560236959');
INSERT INTO `t_user` VALUES ('84', '水电费', 'fanyangyang', '202cb962ac59075b964b07152d234b70', '123123');
INSERT INTO `t_user` VALUES ('90', '王宾宾', 'wangbinbin', '202cb962ac59075b964b07152d234b70', '18737306783');
INSERT INTO `t_user` VALUES ('91', '黄佳佳', 'huangjiajia', '202cb962ac59075b964b07152d234b70', '15737316628');
INSERT INTO `t_user` VALUES ('94', '李亚楠', 'liyanan', '202cb962ac59075b964b07152d234b70', '15237359183');
INSERT INTO `t_user` VALUES ('95', '刘国坤', 'liuguokun', '202cb962ac59075b964b07152d234b70', '15517373790');
INSERT INTO `t_user` VALUES ('96', '张梦鸽1', 'zhangmengge', '202cb962ac59075b964b07152d234b70', '15737313394');
INSERT INTO `t_user` VALUES ('97', '廖  红', 'liaohong', '202cb962ac59075b964b07152d234b70', '15737316070');
INSERT INTO `t_user` VALUES ('98', '王孟鸽', 'wangmengge', '202cb962ac59075b964b07152d234b70', '18237315195');
INSERT INTO `t_user` VALUES ('99', '张冰月', 'zhangbingyue', '202cb962ac59075b964b07152d234b70', '15237369630');
INSERT INTO `t_user` VALUES ('100', '李智', 'lizhi', '202cb962ac59075b964b07152d234b70', '15736975249');
INSERT INTO `t_user` VALUES ('101', '张雪', 'zhangxue', '202cb962ac59075b964b07152d234b70', '15237353570');
INSERT INTO `t_user` VALUES ('102', '王伟', 'wangwei', '202cb962ac59075b964b07152d234b70', '15237331310');
INSERT INTO `t_user` VALUES ('103', '蔡伟', 'caiwei', '250cf8b51c773f3f8dc8b4be867a9a02', '15237335283');
INSERT INTO `t_user` VALUES ('104', '彩秋放', 'caiqiufang', '202cb962ac59075b964b07152d234b70', '15736975362');
INSERT INTO `t_user` VALUES ('105', '游婷', 'youting', '202cb962ac59075b964b07152d234b70', '15225951171');
INSERT INTO `t_user` VALUES ('106', '顾艳凤', 'guyanfeng', '202cb962ac59075b964b07152d234b70', '15225968863');
INSERT INTO `t_user` VALUES ('107', '卢保', 'lubao', '202cb962ac59075b964b07152d234b70', '18737306083');
INSERT INTO `t_user` VALUES ('108', '翟思凡', 'zhaisifan', '202cb962ac59075b964b07152d234b70', '15225958033');
INSERT INTO `t_user` VALUES ('109', '焦祥宇', 'jiaoxiangyu', '202cb962ac59075b964b07152d234b70', '18238778968');
INSERT INTO `t_user` VALUES ('110', '郭文锋', 'guowenfeng', '202cb962ac59075b964b07152d234b70', '18238621523');
INSERT INTO `t_user` VALUES ('111', '候文倩', 'houweniqan', '202cb962ac59075b964b07152d234b70', '15138062098');
INSERT INTO `t_user` VALUES ('112', '高猛', 'gaomeng', '202cb962ac59075b964b07152d234b70', '18738386615');
INSERT INTO `t_user` VALUES ('113', '丁赵雷', 'dingzhaolei', '202cb962ac59075b964b07152d234b70', '18238658703');
INSERT INTO `t_user` VALUES ('114', '李芳', 'lifang', '202cb962ac59075b964b07152d234b70', '18738306285');
INSERT INTO `t_user` VALUES ('115', '刘杜娟', 'liudujuan', '202cb962ac59075b964b07152d234b70', '18238775756');
INSERT INTO `t_user` VALUES ('116', ' 尹秀娟', 'yinxiujuan', '202cb962ac59075b964b07152d234b70', '18738397757');
INSERT INTO `t_user` VALUES ('117', '宋民举', 'songminjv', '202cb962ac59075b964b07152d234b70', '18738333673');
INSERT INTO `t_user` VALUES ('118', '张梦思', 'zhangmengsi', '202cb962ac59075b964b07152d234b70', '18238652021');
INSERT INTO `t_user` VALUES ('119', '常亚飞', 'changyafei', '202cb962ac59075b964b07152d234b70', '18238627631');
INSERT INTO `t_user` VALUES ('120', '古文霞', 'guwenxia', '202cb962ac59075b964b07152d234b70', '18238698361');
INSERT INTO `t_user` VALUES ('126', '123', '3123123', 'f5bb0c8de146c67b44babbf4e6584cc0', '123');
INSERT INTO `t_user` VALUES ('130', '123', '123', '202cb962ac59075b964b07152d234b70', '123');
INSERT INTO `t_user` VALUES ('131', '陈书梦', 'chenshumeng', '202cb962ac59075b964b07152d234b70', '15151');
INSERT INTO `t_user` VALUES ('132', '宋子庆', 'songziqing', '202cb962ac59075b964b07152d234b70', null);
INSERT INTO `t_user` VALUES ('133', '0', 'wangshaofeng', '202cb962ac59075b964b07152d234b70', '151321315');
INSERT INTO `t_user` VALUES ('134', '赵硕', 'zhaoshuo', '202cb962ac59075b964b07152d234b70', '110');
INSERT INTO `t_user` VALUES ('135', '牛洧鹏', 'niuweipeng', '202cb962ac59075b964b07152d234b70', '120');
INSERT INTO `t_user` VALUES ('136', '刘阳阳2', 'liuyang2', '202cb962ac59075b964b07152d234b71', '18238698361');
INSERT INTO `t_user` VALUES ('137', '刘阳阳3', 'liuyang3', '202cb962ac59075b964b07152d234b72', '18238698361');
INSERT INTO `t_user` VALUES ('138', '刘阳阳4', 'liuyang4', '202cb962ac59075b964b07152d234b73', '18238698361');
INSERT INTO `t_user` VALUES ('139', '刘阳阳5', 'liuyang5', '202cb962ac59075b964b07152d234b74', '18238698361');
INSERT INTO `t_user` VALUES ('140', '刘阳阳6', 'liuyang6', '202cb962ac59075b964b07152d234b75', '18238698361');
INSERT INTO `t_user` VALUES ('141', '刘阳阳7', 'liuyang7', '202cb962ac59075b964b07152d234b76', '18238698361');
INSERT INTO `t_user` VALUES ('142', '刘阳阳8', 'liuyang8', '202cb962ac59075b964b07152d234b77', '18238698361');
INSERT INTO `t_user` VALUES ('143', '刘阳阳9', 'liuyang9', '202cb962ac59075b964b07152d234b78', '18238698361');
INSERT INTO `t_user` VALUES ('144', '刘阳阳10', 'liuyang10', '202cb962ac59075b964b07152d234b79', '18238698361');
INSERT INTO `t_user` VALUES ('145', '刘阳阳11', 'liuyang11', '202cb962ac59075b964b07152d234b80', '18238698361');
INSERT INTO `t_user` VALUES ('146', '刘阳阳12', 'liuyang12', '202cb962ac59075b964b07152d234b81', '18238698361');
INSERT INTO `t_user` VALUES ('147', '刘阳阳13', 'liuyang13', '202cb962ac59075b964b07152d234b82', '18238698361');
INSERT INTO `t_user` VALUES ('148', '刘阳阳14', 'liuyang14', '202cb962ac59075b964b07152d234b83', '18238698361');
INSERT INTO `t_user` VALUES ('149', '刘阳阳15', 'liuyang15', '202cb962ac59075b964b07152d234b84', '18238698361');
INSERT INTO `t_user` VALUES ('150', '刘阳阳16', 'liuyang16', '202cb962ac59075b964b07152d234b85', '18238698361');
INSERT INTO `t_user` VALUES ('151', '刘阳阳17', 'liuyang17', '202cb962ac59075b964b07152d234b86', '18238698361');
INSERT INTO `t_user` VALUES ('152', '刘阳阳18', 'liuyang18', '202cb962ac59075b964b07152d234b87', '18238698361');
INSERT INTO `t_user` VALUES ('153', '刘阳阳19', 'liuyang19', '202cb962ac59075b964b07152d234b88', '18238698361');
INSERT INTO `t_user` VALUES ('154', '刘阳阳20', 'liuyang20', '202cb962ac59075b964b07152d234b89', '18238698361');
INSERT INTO `t_user` VALUES ('155', '刘阳阳21', 'liuyang21', '202cb962ac59075b964b07152d234b90', '18238698361');
INSERT INTO `t_user` VALUES ('156', '刘阳阳22', 'liuyang22', '202cb962ac59075b964b07152d234b91', '18238698361');
INSERT INTO `t_user` VALUES ('157', '刘阳阳23', 'liuyang23', '202cb962ac59075b964b07152d234b92', '18238698361');
INSERT INTO `t_user` VALUES ('158', '刘阳阳24', 'liuyang24', '202cb962ac59075b964b07152d234b93', '18238698361');
INSERT INTO `t_user` VALUES ('159', '刘阳阳25', 'liuyang25', '202cb962ac59075b964b07152d234b94', '18238698361');
INSERT INTO `t_user` VALUES ('160', '刘阳阳26', 'liuyang26', '202cb962ac59075b964b07152d234b95', '18238698361');
INSERT INTO `t_user` VALUES ('161', '刘阳阳27', 'liuyang27', '202cb962ac59075b964b07152d234b96', '18238698361');
INSERT INTO `t_user` VALUES ('162', '刘阳阳28', 'liuyang28', '202cb962ac59075b964b07152d234b97', '18238698361');
INSERT INTO `t_user` VALUES ('163', '刘阳阳29', 'liuyang29', '202cb962ac59075b964b07152d234b98', '18238698361');
INSERT INTO `t_user` VALUES ('164', '刘阳阳30', 'liuyang30', '202cb962ac59075b964b07152d234b99', '18238698361');
INSERT INTO `t_user` VALUES ('165', '刘阳阳31', 'liuyang31', '202cb962ac59075b964b07152d234b100', '18238698361');
INSERT INTO `t_user` VALUES ('166', '刘阳阳32', 'liuyang32', '202cb962ac59075b964b07152d234b101', '18238698361');
INSERT INTO `t_user` VALUES ('167', '刘阳阳33', 'liuyang33', '202cb962ac59075b964b07152d234b102', '18238698361');
INSERT INTO `t_user` VALUES ('168', '刘阳阳34', 'liuyang34', '202cb962ac59075b964b07152d234b103', '18238698361');
INSERT INTO `t_user` VALUES ('169', '刘阳阳35', 'liuyang35', '202cb962ac59075b964b07152d234b104', '18238698361');
INSERT INTO `t_user` VALUES ('170', '刘阳阳36', 'liuyang36', '202cb962ac59075b964b07152d234b105', '18238698361');
INSERT INTO `t_user` VALUES ('171', '刘阳阳37', 'liuyang37', '202cb962ac59075b964b07152d234b106', '18238698361');
INSERT INTO `t_user` VALUES ('172', '刘阳阳38', 'liuyang38', '202cb962ac59075b964b07152d234b107', '18238698361');
INSERT INTO `t_user` VALUES ('173', '刘阳阳39', 'liuyang39', '202cb962ac59075b964b07152d234b108', '18238698361');
INSERT INTO `t_user` VALUES ('174', '刘阳阳40', 'liuyang40', '202cb962ac59075b964b07152d234b109', '18238698361');
INSERT INTO `t_user` VALUES ('175', '刘阳阳41', 'liuyang41', '202cb962ac59075b964b07152d234b110', '18238698361');
INSERT INTO `t_user` VALUES ('176', '刘阳阳42', 'liuyang42', '202cb962ac59075b964b07152d234b111', '18238698361');
INSERT INTO `t_user` VALUES ('177', '刘阳阳43', 'liuyang43', '202cb962ac59075b964b07152d234b112', '18238698361');
INSERT INTO `t_user` VALUES ('178', '刘阳阳44', 'liuyang44', '202cb962ac59075b964b07152d234b113', '18238698361');
INSERT INTO `t_user` VALUES ('179', '刘阳阳45', 'liuyang45', '202cb962ac59075b964b07152d234b114', '18238698361');
INSERT INTO `t_user` VALUES ('180', '刘阳阳46', 'liuyang46', '202cb962ac59075b964b07152d234b115', '18238698361');
INSERT INTO `t_user` VALUES ('181', '刘阳阳47', 'liuyang47', '202cb962ac59075b964b07152d234b116', '18238698361');
INSERT INTO `t_user` VALUES ('182', '刘阳阳48', 'liuyang48', '202cb962ac59075b964b07152d234b117', '18238698361');
INSERT INTO `t_user` VALUES ('183', '刘阳阳49', 'liuyang49', '202cb962ac59075b964b07152d234b118', '18238698361');
INSERT INTO `t_user` VALUES ('184', '刘阳阳50', 'liuyang50', '202cb962ac59075b964b07152d234b119', '18238698361');
INSERT INTO `t_user` VALUES ('185', '刘阳阳51', 'liuyang51', '202cb962ac59075b964b07152d234b120', '18238698361');
INSERT INTO `t_user` VALUES ('186', '刘阳阳52', 'liuyang52', '202cb962ac59075b964b07152d234b121', '18238698361');
INSERT INTO `t_user` VALUES ('187', '刘阳阳53', 'liuyang53', '202cb962ac59075b964b07152d234b122', '18238698361');
INSERT INTO `t_user` VALUES ('188', '刘阳阳54', 'liuyang54', '202cb962ac59075b964b07152d234b123', '18238698361');
INSERT INTO `t_user` VALUES ('189', '刘阳阳55', 'liuyang55', '202cb962ac59075b964b07152d234b124', '18238698361');
INSERT INTO `t_user` VALUES ('190', '刘阳阳56', 'liuyang56', '202cb962ac59075b964b07152d234b125', '18238698361');
INSERT INTO `t_user` VALUES ('191', '刘阳阳57', 'liuyang57', '202cb962ac59075b964b07152d234b126', '18238698361');
INSERT INTO `t_user` VALUES ('192', '刘阳阳58', 'liuyang58', '202cb962ac59075b964b07152d234b127', '18238698361');
INSERT INTO `t_user` VALUES ('193', '刘阳阳61', 'liuyang61', '202cb962ac59075b964b07152d234b130', '18238698361');
INSERT INTO `t_user` VALUES ('194', '刘阳阳62', 'liuyang62', '202cb962ac59075b964b07152d234b131', '18238698361');
INSERT INTO `t_user` VALUES ('195', '刘阳阳63', 'liuyang63', '202cb962ac59075b964b07152d234b132', '18238698361');
INSERT INTO `t_user` VALUES ('196', '刘阳阳64', 'liuyang64', '202cb962ac59075b964b07152d234b133', '18238698361');
INSERT INTO `t_user` VALUES ('197', '刘阳阳65', 'liuyang65', '202cb962ac59075b964b07152d234b134', '18238698361');
INSERT INTO `t_user` VALUES ('198', '刘阳阳66', 'liuyang66', '202cb962ac59075b964b07152d234b135', '18238698361');
INSERT INTO `t_user` VALUES ('199', '刘阳阳67', 'liuyang67', '202cb962ac59075b964b07152d234b136', '18238698361');
INSERT INTO `t_user` VALUES ('200', '刘阳阳68', 'liuyang68', '202cb962ac59075b964b07152d234b137', '18238698361');
INSERT INTO `t_user` VALUES ('201', '刘阳阳69', 'liuyang69', '202cb962ac59075b964b07152d234b138', '18238698361');
INSERT INTO `t_user` VALUES ('202', '刘阳阳70', 'liuyang70', '202cb962ac59075b964b07152d234b139', '18238698361');
INSERT INTO `t_user` VALUES ('203', '刘阳阳71', 'liuyang71', '202cb962ac59075b964b07152d234b140', '18238698361');
INSERT INTO `t_user` VALUES ('204', '刘阳阳72', 'liuyang72', '202cb962ac59075b964b07152d234b141', '18238698361');
INSERT INTO `t_user` VALUES ('205', '刘阳阳73', 'liuyang73', '202cb962ac59075b964b07152d234b142', '18238698361');
INSERT INTO `t_user` VALUES ('206', '刘阳阳74', 'liuyang74', '202cb962ac59075b964b07152d234b143', '18238698361');
INSERT INTO `t_user` VALUES ('207', '刘阳阳75', 'liuyang75', '202cb962ac59075b964b07152d234b144', '18238698361');
INSERT INTO `t_user` VALUES ('208', '刘阳阳76', 'liuyang76', '202cb962ac59075b964b07152d234b145', '18238698361');
INSERT INTO `t_user` VALUES ('209', '刘阳阳77', 'liuyang77', '202cb962ac59075b964b07152d234b146', '18238698361');
INSERT INTO `t_user` VALUES ('210', '刘阳阳78', 'liuyang78', '202cb962ac59075b964b07152d234b147', '18238698361');
INSERT INTO `t_user` VALUES ('211', '刘阳阳79', 'liuyang79', '202cb962ac59075b964b07152d234b148', '18238698361');
INSERT INTO `t_user` VALUES ('212', '刘阳阳80', 'liuyang80', '202cb962ac59075b964b07152d234b149', '18238698361');
INSERT INTO `t_user` VALUES ('213', '刘阳阳81', 'liuyang81', '202cb962ac59075b964b07152d234b150', '18238698361');
INSERT INTO `t_user` VALUES ('214', '刘阳阳82', 'liuyang82', '202cb962ac59075b964b07152d234b151', '18238698361');
INSERT INTO `t_user` VALUES ('215', '刘阳阳83', 'liuyang83', '202cb962ac59075b964b07152d234b152', '18238698361');
INSERT INTO `t_user` VALUES ('216', '刘阳阳84', 'liuyang84', '202cb962ac59075b964b07152d234b153', '18238698361');
INSERT INTO `t_user` VALUES ('217', '刘阳阳85', 'liuyang85', '202cb962ac59075b964b07152d234b154', '18238698361');
INSERT INTO `t_user` VALUES ('218', '刘阳阳86', 'liuyang86', '202cb962ac59075b964b07152d234b155', '18238698361');
INSERT INTO `t_user` VALUES ('219', '刘阳阳87', 'liuyang87', '202cb962ac59075b964b07152d234b156', '18238698361');
INSERT INTO `t_user` VALUES ('220', '刘阳阳88', 'liuyang88', '202cb962ac59075b964b07152d234b157', '18238698361');
INSERT INTO `t_user` VALUES ('221', '刘阳阳89', 'liuyang89', '202cb962ac59075b964b07152d234b158', '18238698361');
INSERT INTO `t_user` VALUES ('222', '刘阳阳90', 'liuyang90', '202cb962ac59075b964b07152d234b159', '18238698361');
INSERT INTO `t_user` VALUES ('223', '刘阳阳91', 'liuyang91', '202cb962ac59075b964b07152d234b160', '18238698361');
INSERT INTO `t_user` VALUES ('224', '刘阳阳92', 'liuyang92', '202cb962ac59075b964b07152d234b161', '18238698361');
INSERT INTO `t_user` VALUES ('225', '刘阳阳93', 'liuyang93', '202cb962ac59075b964b07152d234b162', '18238698361');
INSERT INTO `t_user` VALUES ('226', '刘阳阳94', 'liuyang94', '202cb962ac59075b964b07152d234b163', '18238698361');
INSERT INTO `t_user` VALUES ('227', '刘阳阳95', 'liuyang95', '202cb962ac59075b964b07152d234b164', '18238698361');
INSERT INTO `t_user` VALUES ('228', '刘阳阳96', 'liuyang96', '202cb962ac59075b964b07152d234b165', '18238698361');
INSERT INTO `t_user` VALUES ('229', '刘阳阳97', 'liuyang97', '202cb962ac59075b964b07152d234b166', '18238698361');
INSERT INTO `t_user` VALUES ('230', '刘阳阳98', 'liuyang98', '202cb962ac59075b964b07152d234b167', '18238698361');
INSERT INTO `t_user` VALUES ('231', '刘阳阳99', 'liuyang99', '202cb962ac59075b964b07152d234b168', '18238698361');
INSERT INTO `t_user` VALUES ('232', '刘阳阳100', 'liuyang100', '202cb962ac59075b964b07152d234b169', '18238698361');
