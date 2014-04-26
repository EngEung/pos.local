/*
SQLyog Ultimate - MySQL GUI v8.22 
MySQL - 5.5.20-log : Database - pos_dev
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pos_dev` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `pos_dev`;

/*Table structure for table `communes` */

DROP TABLE IF EXISTS `communes`;

CREATE TABLE `communes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `commune_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `communes` */

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `countries` */

insert  into `countries`(`id`,`name`,`descr`,`created_at`,`modified_at`,`created_by`,`modified_by`,`active`) values (1,'KH','Cambodia','2014-03-28 22:39:37',NULL,NULL,NULL,1),(2,'USA','The United States','2014-03-28 22:39:37',NULL,NULL,NULL,1),(3,'CAN','Canada','2014-03-28 22:39:37',NULL,NULL,NULL,1);

/*Table structure for table `customer_types` */

DROP TABLE IF EXISTS `customer_types`;

CREATE TABLE `customer_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `customer_types` */

insert  into `customer_types`(`id`,`name`,`descr`,`created_at`,`modified_at`,`created_by`,`modified_by`,`active`) values (1,'Customer is rural    ',NULL,'2014-04-13 23:10:41',NULL,NULL,NULL,1),(2,'Customer is urban',NULL,'2014-04-13 23:10:41',NULL,NULL,NULL,1);

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `customer_type` int(11) DEFAULT NULL,
  `phone1` varchar(30) DEFAULT NULL,
  `phone2` varchar(30) DEFAULT NULL,
  `email1` varchar(30) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `commune_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `location_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `picture_id` int(11) DEFAULT NULL,
  `fax` varchar(10) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customers` */

/*Table structure for table `districts` */

DROP TABLE IF EXISTS `districts`;

CREATE TABLE `districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `province_state_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

/*Data for the table `districts` */

insert  into `districts`(`id`,`name`,`descr`,`province_state_id`,`created_at`,`modified_at`,`created_by`,`modified_by`,`active`) values (1,'Chamkarmon','Chamkarmon',1,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(2,'Chbar Ampov','Chbar Ampov',1,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(3,'Chroy Changva','Chroy Changva',1,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(4,'Dangkao','Dangkao',1,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(5,'Daun Penh','Daun Penh',1,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(6,'Meanchey','Meanchey',1,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(7,'Prampi Makara','Prampi Makara',1,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(8,'Russey Keo','Russey Keo',1,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(9,'Sen Sok','Sen Sok',1,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(10,'Tuol Kork','Tuol Kork',1,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(11,'Porsenchey','Porsenchey',1,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(12,'Prek Pnov','Prek Pnov',1,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(13,'Mongkol Borey','Mongkol Borey',2,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(14,'Phnom Srok','Phnom Srok',2,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(15,'Preah Net Preah','Preah Net Preah',2,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(16,'Ou Chrov','Ou Chrov',2,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(17,'Serei Saophoan','Serei Saophoan',2,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(18,'Thmar Puok','Thmar Puok',2,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(19,'Svay Chek','Svay Chek',2,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(20,' Malai',' Malai',2,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(21,'Banan','Banan',3,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(22,'Thmar Koul','Thmar Koul',3,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(23,'Battambang','Battambang',3,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(24,'Bavel ','Bavel ',3,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(25,'Aek Phnom','Aek Phnom',3,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(26,'Moung Russei','Moung Russei',3,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(27,'Rotanak Mondul','Rotanak Mondul',3,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(28,'Sangkhae','Sangkhae',3,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(29,'Samlout','Samlout',3,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(30,'Sampov Loun','Sampov Loun',3,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(31,'Phnom Proek','Phnom Proek',3,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(32,'Kamrieng','Kamrieng',3,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(33,'Koas Krala','Koas Krala',3,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(34,'Ruhakiri','Ruhakiri',3,'2014-03-29 21:45:18',NULL,NULL,NULL,1),(35,'Batheay','Batheay',4,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(36,'Chamkar Leu','Chamkar Leu',4,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(37,'Cheung Prey','Cheung Prey',4,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(38,'Kampong Cham','Kampong Cham',4,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(39,'Kampong Siem','Kampong Siem',4,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(40,'Kang Meas','Kang Meas',4,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(41,'Koh Sotin','Koh Sotin',4,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(42,'Prey Chhor','Prey Chhor',4,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(43,'Srey Santhor','Srey Santhor',4,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(44,'Stueng Trang','Stueng Trang',4,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(45,'Baribour','Baribour',5,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(46,'Chol Kiri','Chol Kiri',5,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(47,'Kampong Chhnang','Kampong Chhnang',5,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(48,'Kampong Leng','Kampong Leng',5,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(49,'Kampong Tralach','Kampong Tralach',5,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(50,'Rolea Bier','Rolea Bier',5,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(51,'Samaki Meanchey','Samaki Meanchey',5,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(52,'Tuek Phos','Tuek Phos',5,'2014-03-29 21:57:35',NULL,NULL,NULL,1),(53,'Kong Pisei','Kong Pisei',6,'2014-03-29 21:59:35',NULL,NULL,NULL,1),(54,'Baset','Baset',6,'2014-03-29 21:59:35',NULL,NULL,NULL,1),(55,'Chbar Mon','Chbar Mon',6,'2014-03-29 21:59:35',NULL,NULL,NULL,1),(56,'Aural','Aural',6,'2014-03-29 21:59:35',NULL,NULL,NULL,1),(57,'Udong','Udong',6,'2014-03-29 21:59:35',NULL,NULL,NULL,1),(58,'Phnom Sruoch','Phnom Sruoch',6,'2014-03-29 21:59:35',NULL,NULL,NULL,1),(59,'Samraong Tong','Samraong Tong',6,'2014-03-29 21:59:35',NULL,NULL,NULL,1),(60,'Thpong','Thpong',6,'2014-03-29 21:59:35',NULL,NULL,NULL,1),(61,'Baray','Baray',7,'2014-03-29 22:01:38',NULL,NULL,NULL,1),(62,'Kampong Svay','Kampong Svay',7,'2014-03-29 22:01:38',NULL,NULL,NULL,1),(63,'Stung Sen','Stung Sen',7,'2014-03-29 22:01:38',NULL,NULL,NULL,1),(64,'Prasat Balang','Prasat Balang',7,'2014-03-29 22:01:38',NULL,NULL,NULL,1),(65,'Prasat Sambour','Prasat Sambour',7,'2014-03-29 22:01:38',NULL,NULL,NULL,1),(66,'Sandan','Sandan',7,'2014-03-29 22:01:38',NULL,NULL,NULL,1),(67,'Santuk','Santuk',7,'2014-03-29 22:01:38',NULL,NULL,NULL,1),(68,'Stoung','Stoung',7,'2014-03-29 22:01:38',NULL,NULL,NULL,1);

/*Table structure for table `locations` */

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `locations` */

insert  into `locations`(`id`,`name`,`descr`,`created_at`,`modified_at`,`created_by`,`modified_by`,`active`) values (1,'Kompong Channage',NULL,'2014-04-20 23:00:30',NULL,NULL,NULL,1);

/*Table structure for table `menu_roles` */

DROP TABLE IF EXISTS `menu_roles`;

CREATE TABLE `menu_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `menu_roles` */

insert  into `menu_roles`(`id`,`menu_id`,`role_id`,`descr`,`created_at`,`modified_at`,`created_by`,`modified_by`,`active`) values (1,1,1,NULL,'2014-04-25 23:26:20',NULL,NULL,NULL,1),(2,2,1,NULL,'2014-04-25 23:26:20',NULL,NULL,NULL,1),(3,3,1,NULL,'2014-04-26 14:37:34',NULL,NULL,NULL,1),(4,4,1,NULL,'2014-04-26 16:37:16',NULL,NULL,NULL,1);

/*Table structure for table `menu_types` */

DROP TABLE IF EXISTS `menu_types`;

CREATE TABLE `menu_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `menu_types` */

insert  into `menu_types`(`id`,`name`,`descr`,`created_at`,`modified_at`,`created_by`,`modified_by`,`active`) values (1,'HORIZONTAL_MENU','Horizontal menu type','2014-04-25 20:11:08',NULL,NULL,NULL,1),(2,'VERTICAL_MENU','Vertical menu type','2014-04-25 20:11:08',NULL,NULL,NULL,1),(3,'ACCORDION_MENU','Accordion menu type','2014-04-25 20:11:08',NULL,NULL,NULL,1),(4,'TAB_MENU','Tab menu type','2014-04-25 20:11:08',NULL,NULL,NULL,1),(5,'SUB_MENU','sub menu type','2014-04-25 20:11:08',NULL,NULL,NULL,1),(6,'SUB_HORIZONTAL_MENU','sub horizontal menu type','2014-04-25 20:11:08',NULL,NULL,NULL,1),(7,'SUB_HORIZONTAL_MENU_CHILD','sub horizontal menu child type','2014-04-25 20:11:08',NULL,NULL,NULL,1);

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon_url_data` blob,
  `tooltip` varchar(50) DEFAULT NULL,
  `order_num` int(11) DEFAULT '0',
  `menu_type_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `menus` */

insert  into `menus`(`id`,`parent_id`,`name`,`descr`,`icon_url`,`url`,`icon_url_data`,`tooltip`,`order_num`,`menu_type_id`,`created_at`,`modified_at`,`created_by`,`modified_by`,`active`) values (1,0,'Setup','setup',NULL,NULL,NULL,'Setup',2,1,'2014-04-25 21:32:48',NULL,NULL,NULL,1),(2,0,'Inventory Center','inventoryCenter',NULL,NULL,NULL,'Inventory Center',1,1,'2014-04-25 21:33:34',NULL,NULL,NULL,1),(3,0,'Dashboard','dashboard',NULL,NULL,NULL,'Dashboard',1,1,'2014-04-26 14:35:57',NULL,NULL,NULL,1),(4,1,'Managing Customer','customer',NULL,'/setup/customers',NULL,'Managing Customer',0,6,'2014-04-26 14:36:47',NULL,NULL,NULL,1);

/*Table structure for table `people` */

DROP TABLE IF EXISTS `people`;

CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix` varchar(30) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `nick_name` varchar(30) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `pref_name` varchar(30) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `position` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `people` */

insert  into `people`(`id`,`prefix`,`first_name`,`middle_name`,`last_name`,`nick_name`,`title`,`pref_name`,`gender`,`position`,`age`,`date_of_birth`,`descr`,`created_at`,`modified_at`,`created_by`,`modified_by`,`active`) values (1,NULL,'sith',NULL,'kong',NULL,NULL,NULL,'m',NULL,32,NULL,NULL,'2014-03-27 23:01:26',NULL,NULL,NULL,1),(2,NULL,'amber',NULL,'kong',NULL,NULL,NULL,'f',NULL,19,NULL,NULL,'2014-03-27 23:01:26',NULL,NULL,NULL,1),(3,NULL,'lama',NULL,'kong',NULL,NULL,NULL,'m',NULL,2,NULL,NULL,'2014-03-27 23:01:26',NULL,NULL,NULL,1),(4,NULL,'natasha',NULL,'kong',NULL,NULL,NULL,'f',NULL,1,NULL,NULL,'2014-03-27 23:01:26',NULL,NULL,NULL,1);

/*Table structure for table `picture_types` */

DROP TABLE IF EXISTS `picture_types`;

CREATE TABLE `picture_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `picture_types` */

insert  into `picture_types`(`id`,`name`,`descr`,`created_at`,`modified_at`,`created_by`,`modified_by`,`active`) values (1,'ICON','Icon','2014-04-20 10:56:35',NULL,NULL,NULL,1),(2,'PRODUCT','Product','2014-04-20 10:56:35',NULL,NULL,NULL,1),(3,'IT_COUPON','Coupon','2014-04-20 10:56:35',NULL,NULL,NULL,1),(4,'LOGO','Logo','2014-04-20 10:56:35',NULL,NULL,NULL,1),(5,'PICTURE_FOR_CUSTOMER','Picture for customer','2014-04-20 10:56:35',NULL,NULL,NULL,1);

/*Table structure for table `pictures` */

DROP TABLE IF EXISTS `pictures`;

CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `data` blob,
  `url` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `ratio` float DEFAULT NULL,
  `ext` varchar(10) DEFAULT NULL,
  `mime_type` varchar(20) DEFAULT NULL,
  `picture_type_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pictures` */

/*Table structure for table `province_states` */

DROP TABLE IF EXISTS `province_states`;

CREATE TABLE `province_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `province_states` */

insert  into `province_states`(`id`,`name`,`descr`,`country_id`,`created_at`,`modified_at`,`created_by`,`modified_by`,`active`) values (1,'PP',' 	Phnom Penh Municipality',1,'2014-03-29 21:16:09',NULL,NULL,NULL,1),(2,'Banteay Meanchey','Banteay Meanchey',1,'2014-03-29 21:16:09',NULL,NULL,NULL,1),(3,'Battambang','Battambang',1,'2014-03-29 21:16:09',NULL,NULL,NULL,1),(4,'Kampong Cham','Kampong Cham',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(5,'Kampong Chhnang','Kampong Chhnang',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(6,'Kampong Speu','Kampong Speu',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(7,'Kampong Thom','Kampong Thom',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(8,'Kampot','Kampot',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(9,'Kandal ','Kandal ',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(10,'Koh Kong ','Koh Kong ',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(11,'Kep','Kep',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(12,'Kratié','Kratié',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(13,'Mondulkiri','Mondulkiri',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(14,'Oddar Meanchey','Oddar Meanchey',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(15,'Pailin','Pailin',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(16,'Preah Sihanouk','Preah Sihanouk',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(17,'Preah Vihear ','Preah Vihear ',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(18,'Pursat','Pursat',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(19,'Prey Veng','Prey Veng',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(20,'Ratanakiri','Ratanakiri',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(21,'Siem Reap','Siem Reap',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(22,'Stung Treng ','Stung Treng ',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(23,'Svay Rieng ','Svay Rieng ',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(24,'Takéo','Takéo',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1),(25,'Tbong Khmum','Tbong Khmum',1,'2014-03-29 21:21:59',NULL,NULL,NULL,1);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`descr`,`created_at`,`modified_at`,`created_by`,`modified_by`,`active`) values (1,'R_ADMIN','Administrator','2014-03-27 23:01:26',NULL,NULL,NULL,1),(2,'R_CUSTOMER','Customer','2014-03-27 23:01:26',NULL,NULL,NULL,1),(3,'R_MERCHANT','Merchant','2014-03-27 23:01:26',NULL,NULL,NULL,1),(4,'R_COMPANY','Corporation and Company','2014-03-27 23:01:26',NULL,NULL,NULL,1),(5,'R_EMPLOYEE','Employee','2014-03-27 23:01:26',NULL,NULL,NULL,1),(6,'R_CONTRACTOR','Contractor','2014-03-27 23:01:26',NULL,NULL,NULL,1),(7,'R_SALE_REP','Sale Representative','2014-03-27 23:01:26',NULL,NULL,NULL,1),(8,'R_MARKETING_AGENT','Marketing Agent','2014-03-27 23:01:26',NULL,NULL,NULL,1),(9,'R_CS_REP','Customer Service Representative','2014-03-27 23:01:27',NULL,NULL,NULL,1),(10,'R_TECH_ENGINEER','Technical Engineer','2014-03-27 23:01:27',NULL,NULL,NULL,1),(11,'R_BA','Business Analyst','2014-03-27 23:01:27',NULL,NULL,NULL,1),(12,'R_PRJ_MGR','Project Manager','2014-03-27 23:01:27',NULL,NULL,NULL,1),(13,'R_SE','Software Engineer','2014-03-27 23:01:27',NULL,NULL,NULL,1);

/*Table structure for table `tbl_migration` */

DROP TABLE IF EXISTS `tbl_migration`;

CREATE TABLE `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_migration` */

insert  into `tbl_migration`(`version`,`apply_time`) values ('m121103_133830_create_people',1395936086),('m121103_135251_create_users',1395936086),('m121103_141403_create_roles',1395936087),('m121103_141708_create_user_roles',1395936087),('m140328_135242_create_customer_types',1396016242),('m140328_135256_create_customers',1396016243),('m140328_151047_create_countries',1396021177),('m140328_151101_create_province_states',1396021177),('m140328_151114_create_title',1396021177),('m140328_151133_create_communes',1396021177),('m140328_151141_create_districts',1396021177),('m140329_150250_create_locations',1396106934),('m140420_034536_create_picture_type',1397966195),('m140420_034545_create_pictures',1397966195),('m140425_013231_create_menu_types',1398431468),('m140425_013722_create_menus',1398431468),('m140425_140034_creat_menu_roles',1398434535);

/*Table structure for table `titles` */

DROP TABLE IF EXISTS `titles`;

CREATE TABLE `titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `titles` */

insert  into `titles`(`id`,`name`,`descr`,`created_at`,`modified_at`,`created_by`,`modified_by`,`active`) values (1,'Mr','Adult male','2014-04-03 23:21:03',NULL,NULL,NULL,1),(2,'Mrs','Adult females','2014-04-03 23:21:03',NULL,NULL,NULL,1),(3,'Ms','Adult females','2014-04-03 23:21:03',NULL,NULL,NULL,1),(4,'Miss','Formal title for unmarried females or for female children','2014-04-03 23:21:03',NULL,NULL,NULL,1),(5,'Master','For male children','2014-04-03 23:21:03',NULL,NULL,NULL,1);

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `user_roles` */

insert  into `user_roles`(`id`,`user_id`,`role_id`,`created_at`,`modified_at`,`created_by`,`modified_by`,`active`) values (1,1,1,'2014-03-27 23:01:27',NULL,NULL,NULL,1),(2,2,2,'2014-03-27 23:01:27',NULL,NULL,NULL,1),(3,3,3,'2014-03-27 23:01:27',NULL,NULL,NULL,1),(4,4,4,'2014-03-27 23:01:27',NULL,NULL,NULL,1),(5,1,2,'2014-03-27 23:01:27',NULL,NULL,NULL,1),(6,2,3,'2014-03-27 23:01:27',NULL,NULL,NULL,1),(7,3,4,'2014-03-27 23:01:27',NULL,NULL,NULL,1),(8,4,5,'2014-03-27 23:01:27',NULL,NULL,NULL,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `passwd` varchar(255) NOT NULL,
  `salted_passwd` varchar(255) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `locked_at` datetime DEFAULT NULL,
  `validated` tinyint(1) DEFAULT '0',
  `failed_attempt` int(11) DEFAULT '0',
  `failed_attempt_at` datetime DEFAULT NULL,
  `person_id` int(11) NOT NULL,
  `validation_code` varchar(255) NOT NULL,
  `request_reset_at` datetime DEFAULT NULL,
  `expired` tinyint(1) DEFAULT '0',
  `expired_at` datetime DEFAULT NULL,
  `reset_count` int(11) DEFAULT '0',
  `reset_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `recovery_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `descr` varchar(255) DEFAULT NULL,
  `guid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`username`,`passwd`,`salted_passwd`,`locked`,`locked_at`,`validated`,`failed_attempt`,`failed_attempt_at`,`person_id`,`validation_code`,`request_reset_at`,`expired`,`expired_at`,`reset_count`,`reset_at`,`last_login_at`,`recovery_code`,`created_at`,`modified_at`,`created_by`,`modified_by`,`active`,`descr`,`guid`) values (1,'engeung@gmail.com','engeung','5228ef99f5e71f01b33d2023c016ff9f',NULL,0,NULL,1,0,'2014-04-26 14:25:39',1,'53344b5685b96',NULL,0,NULL,0,NULL,'2014-04-26 16:34:26',NULL,'2014-03-27 23:01:26',NULL,NULL,NULL,1,NULL,'53344b5685ba0'),(2,'amberkong@gmail.com','amberkong','5228ef99f5e71f01b33d2023c016ff9f',NULL,0,NULL,1,0,NULL,2,'53344b568c7a5',NULL,0,NULL,0,NULL,NULL,NULL,'2014-03-27 23:01:26',NULL,NULL,NULL,1,NULL,'53344b568c7b2'),(3,'lamakong@gmail.com','lamakong','5228ef99f5e71f01b33d2023c016ff9f',NULL,0,NULL,1,0,NULL,3,'53344b56933b9',NULL,0,NULL,0,NULL,NULL,NULL,'2014-03-27 23:01:26',NULL,NULL,NULL,1,NULL,'53344b56933c3'),(4,'natashakong@gmail.com','natashakong','5228ef99f5e71f01b33d2023c016ff9f',NULL,0,NULL,1,0,NULL,4,'53344b569a158',NULL,0,NULL,0,NULL,NULL,NULL,'2014-03-27 23:01:26',NULL,NULL,NULL,1,NULL,'53344b569a167');

/*Table structure for table `yii_sessions` */

DROP TABLE IF EXISTS `yii_sessions`;

CREATE TABLE `yii_sessions` (
  `id` char(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `yii_sessions` */

insert  into `yii_sessions`(`id`,`expire`,`data`) values ('5m21lph3pgm47kbe764k3n4fo5',1398507849,''),('ketosks7vadhdgc3ndb23ilj06',1398499333,'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
