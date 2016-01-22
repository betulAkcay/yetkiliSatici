/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : yetkilisatici

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-12-28 13:38:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kul_adi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `sifre` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'betul', '202cb962ac59075b964b07152d234b70');

-- ----------------------------
-- Table structure for ariza
-- ----------------------------
DROP TABLE IF EXISTS `ariza`;
CREATE TABLE `ariza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `musteri_adi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `musteri_tel` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `cihaz_id` int(11) DEFAULT NULL,
  `arizasi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `durum` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `arama` (`musteri_adi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- ----------------------------
-- Records of ariza
-- ----------------------------
INSERT INTO `ariza` VALUES ('1', 'asdasd', 'aaa', '3', 'aASA', '1');
INSERT INTO `ariza` VALUES ('2', 'qweqwe', 'awed', '6', 'asAXA', '0');
INSERT INTO `ariza` VALUES ('3', 'adfdv', 'sxscs', '6', 'cdcd', '0');

-- ----------------------------
-- Table structure for cihaz
-- ----------------------------
DROP TABLE IF EXISTS `cihaz`;
CREATE TABLE `cihaz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `markasi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `modeli` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `arama` (`adi`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- ----------------------------
-- Records of cihaz
-- ----------------------------
INSERT INTO `cihaz` VALUES ('1', 'denejm', 'as', 'as');
INSERT INTO `cihaz` VALUES ('2', 'deneme', 'as', 'as');
INSERT INTO `cihaz` VALUES ('3', 'asdasd', 'ass', 'asd');
INSERT INTO `cihaz` VALUES ('4', 'dergffvfv', 'ass', 'asd');
INSERT INTO `cihaz` VALUES ('6', 'dendcvc', 'as', 'aa');
INSERT INTO `cihaz` VALUES ('7', 'denem', 'aa', 'a');
INSERT INTO `cihaz` VALUES ('8', 'deny', 'aas', 'aa');
INSERT INTO `cihaz` VALUES ('10', 'deneghf', 'asd', 'aaa');
INSERT INTO `cihaz` VALUES ('15', 'denejm', 'asd', 'as');
INSERT INTO `cihaz` VALUES ('16', 'denejm', 'qweq', 'qqq');
INSERT INTO `cihaz` VALUES ('17', 'denejmer', 'asd', 'aaa');

-- ----------------------------
-- Procedure structure for chzArama
-- ----------------------------
DROP PROCEDURE IF EXISTS `chzArama`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `chzArama`(IN `deger` varchar(200))
BEGIN

SET @data = deger;
select * from ariza inner JOIN cihaz on ariza.cihaz_id = cihaz.id where Match (adi,musteri_adi) AGAINST(@data IN Boolean MODE);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for fullTextAra
-- ----------------------------
DROP PROCEDURE IF EXISTS `fullTextAra`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fullTextAra`(IN `ara` varchar(200))
BEGIN
SET @data = ara;
select * from ariza inner JOIN cihaz  on ariza.cihaz_id = cihaz.id 
where Match (musteri_adi) AGAINST(@data IN Boolean MODE);

END
;;
DELIMITER ;
