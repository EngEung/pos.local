CREATE DATABASE  IF NOT EXISTS `pos_dev` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pos_dev`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: pos_dev
-- ------------------------------------------------------
-- Server version	5.5.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `code` varchar(60) NOT NULL,
  `descr` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Posion','0001','','2014-07-19 17:10:15',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communes`
--

DROP TABLE IF EXISTS `communes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communes`
--

LOCK TABLES `communes` WRITE;
/*!40000 ALTER TABLE `communes` DISABLE KEYS */;
/*!40000 ALTER TABLE `communes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'KH','Cambodia','2014-03-28 15:39:37',NULL,NULL,NULL,1),(2,'USA','The United States','2014-03-28 15:39:37',NULL,NULL,NULL,1),(3,'CAN','Canada','2014-03-28 15:39:37',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exchange_rate` varchar(60) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `code` varchar(255) NOT NULL,
  `local_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_shipping`
--

DROP TABLE IF EXISTS `customer_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `shipping_to` varchar(65) COLLATE utf8_bin NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `modified_by` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `note` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `primary` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_shipping__customers` (`customer_id`),
  CONSTRAINT `fk_customer_shipping__customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_shipping`
--

LOCK TABLES `customer_shipping` WRITE;
/*!40000 ALTER TABLE `customer_shipping` DISABLE KEYS */;
INSERT INTO `customer_shipping` VALUES (1,2,'á¢áŸá„','kompnong change','2014-06-02 13:09:47','0000-00-00 00:00:00','engeung','engeung',0,NULL,NULL,NULL),(2,2,'á¢áŸá„','á€áŸ†á–á„áŸ‹á†áŸ’á˜á¶áŸ†á„â€‹â€‹ á•áŸ’áŸá¶á†áŸ’á˜á¶áŸ†á„','2014-06-02 13:13:11','0000-00-00 00:00:00','engeung','engeung',0,NULL,NULL,NULL),(3,1,'Eng','Kompong','2014-06-07 13:49:39','0000-00-00 00:00:00','engeung','engeung',1,NULL,NULL,NULL),(4,2,'eng eung','phnom penh','2014-06-07 15:02:34',NULL,'engeung',NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `customer_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_types`
--

DROP TABLE IF EXISTS `customer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_types`
--

LOCK TABLES `customer_types` WRITE;
/*!40000 ALTER TABLE `customer_types` DISABLE KEYS */;
INSERT INTO `customer_types` VALUES (1,'Customer is rural    ',NULL,'2014-04-13 16:10:41',NULL,NULL,NULL,1),(2,'Customer is urban',NULL,'2014-04-13 16:10:41',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `customer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'eng','eung','1',1,'(092) 302-605','(010) 577-246','',NULL,NULL,NULL,NULL,'2014-04-28 06:30:04',NULL,NULL,NULL,1,1,'Kompong ',1,NULL,NULL),(2,'enngsdf','la','1',1,'(092) 302-605','(010) 577-246',NULL,NULL,NULL,NULL,NULL,'2014-04-29 07:32:30',NULL,NULL,NULL,1,1,'Kompong ',1,NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Chamkarmon','Chamkarmon',1,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(2,'Chbar Ampov','Chbar Ampov',1,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(3,'Chroy Changva','Chroy Changva',1,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(4,'Dangkao','Dangkao',1,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(5,'Daun Penh','Daun Penh',1,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(6,'Meanchey','Meanchey',1,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(7,'Prampi Makara','Prampi Makara',1,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(8,'Russey Keo','Russey Keo',1,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(9,'Sen Sok','Sen Sok',1,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(10,'Tuol Kork','Tuol Kork',1,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(11,'Porsenchey','Porsenchey',1,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(12,'Prek Pnov','Prek Pnov',1,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(13,'Mongkol Borey','Mongkol Borey',2,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(14,'Phnom Srok','Phnom Srok',2,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(15,'Preah Net Preah','Preah Net Preah',2,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(16,'Ou Chrov','Ou Chrov',2,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(17,'Serei Saophoan','Serei Saophoan',2,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(18,'Thmar Puok','Thmar Puok',2,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(19,'Svay Chek','Svay Chek',2,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(20,' Malai',' Malai',2,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(21,'Banan','Banan',3,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(22,'Thmar Koul','Thmar Koul',3,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(23,'Battambang','Battambang',3,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(24,'Bavel ','Bavel ',3,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(25,'Aek Phnom','Aek Phnom',3,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(26,'Moung Russei','Moung Russei',3,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(27,'Rotanak Mondul','Rotanak Mondul',3,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(28,'Sangkhae','Sangkhae',3,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(29,'Samlout','Samlout',3,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(30,'Sampov Loun','Sampov Loun',3,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(31,'Phnom Proek','Phnom Proek',3,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(32,'Kamrieng','Kamrieng',3,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(33,'Koas Krala','Koas Krala',3,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(34,'Ruhakiri','Ruhakiri',3,'2014-03-29 14:45:18',NULL,NULL,NULL,1),(35,'Batheay','Batheay',4,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(36,'Chamkar Leu','Chamkar Leu',4,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(37,'Cheung Prey','Cheung Prey',4,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(38,'Kampong Cham','Kampong Cham',4,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(39,'Kampong Siem','Kampong Siem',4,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(40,'Kang Meas','Kang Meas',4,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(41,'Koh Sotin','Koh Sotin',4,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(42,'Prey Chhor','Prey Chhor',4,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(43,'Srey Santhor','Srey Santhor',4,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(44,'Stueng Trang','Stueng Trang',4,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(45,'Baribour','Baribour',5,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(46,'Chol Kiri','Chol Kiri',5,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(47,'Kampong Chhnang','Kampong Chhnang',5,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(48,'Kampong Leng','Kampong Leng',5,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(49,'Kampong Tralach','Kampong Tralach',5,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(50,'Rolea Bier','Rolea Bier',5,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(51,'Samaki Meanchey','Samaki Meanchey',5,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(52,'Tuek Phos','Tuek Phos',5,'2014-03-29 14:57:35',NULL,NULL,NULL,1),(53,'Kong Pisei','Kong Pisei',6,'2014-03-29 14:59:35',NULL,NULL,NULL,1),(54,'Baset','Baset',6,'2014-03-29 14:59:35',NULL,NULL,NULL,1),(55,'Chbar Mon','Chbar Mon',6,'2014-03-29 14:59:35',NULL,NULL,NULL,1),(56,'Aural','Aural',6,'2014-03-29 14:59:35',NULL,NULL,NULL,1),(57,'Udong','Udong',6,'2014-03-29 14:59:35',NULL,NULL,NULL,1),(58,'Phnom Sruoch','Phnom Sruoch',6,'2014-03-29 14:59:35',NULL,NULL,NULL,1),(59,'Samraong Tong','Samraong Tong',6,'2014-03-29 14:59:35',NULL,NULL,NULL,1),(60,'Thpong','Thpong',6,'2014-03-29 14:59:35',NULL,NULL,NULL,1),(61,'Baray','Baray',7,'2014-03-29 15:01:38',NULL,NULL,NULL,1),(62,'Kampong Svay','Kampong Svay',7,'2014-03-29 15:01:38',NULL,NULL,NULL,1),(63,'Stung Sen','Stung Sen',7,'2014-03-29 15:01:38',NULL,NULL,NULL,1),(64,'Prasat Balang','Prasat Balang',7,'2014-03-29 15:01:38',NULL,NULL,NULL,1),(65,'Prasat Sambour','Prasat Sambour',7,'2014-03-29 15:01:38',NULL,NULL,NULL,1),(66,'Sandan','Sandan',7,'2014-03-29 15:01:38',NULL,NULL,NULL,1),(67,'Santuk','Santuk',7,'2014-03-29 15:01:38',NULL,NULL,NULL,1),(68,'Stoung','Stoung',7,'2014-03-29 15:01:38',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_codes`
--

DROP TABLE IF EXISTS `item_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catgory_id` varchar(64) DEFAULT NULL,
  `item_type_id` varchar(64) DEFAULT NULL,
  `item_code` varchar(64) DEFAULT NULL,
  `descr` varchar(128) DEFAULT NULL,
  `barcode` varchar(25) DEFAULT NULL,
  `unit_group_code` varchar(16) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_codes`
--

LOCK TABLES `item_codes` WRITE;
/*!40000 ALTER TABLE `item_codes` DISABLE KEYS */;
INSERT INTO `item_codes` VALUES (1,'1','1','1','1','1','1',NULL,'2014-09-30 17:43:21',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `item_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_size_details`
--

DROP TABLE IF EXISTS `item_size_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_size_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty_per_unit` varchar(20) DEFAULT NULL,
  `unit_code` varchar(10) DEFAULT NULL,
  `size_group_code` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_size_details`
--

LOCK TABLES `item_size_details` WRITE;
/*!40000 ALTER TABLE `item_size_details` DISABLE KEYS */;
INSERT INTO `item_size_details` VALUES (3,'5','Pkg','5x10','2014-09-18 18:22:29',NULL,NULL,NULL,1),(4,'10','Unit','5x10','2014-09-18 18:22:29',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `item_size_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_size_groups`
--

DROP TABLE IF EXISTS `item_size_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_size_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `descr` varchar(65) DEFAULT NULL,
  `unit_group_code` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_size_groups`
--

LOCK TABLES `item_size_groups` WRITE;
/*!40000 ALTER TABLE `item_size_groups` DISABLE KEYS */;
INSERT INTO `item_size_groups` VALUES (3,'5x10','5x10','Ctn','2014-09-18 18:22:29',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `item_size_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_types`
--

DROP TABLE IF EXISTS `item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `code` varchar(65) NOT NULL,
  `descr` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_item_types__categories` (`category_id`),
  CONSTRAINT `fk_item_types__categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_types`
--

LOCK TABLES `item_types` WRITE;
/*!40000 ALTER TABLE `item_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_unit_details`
--

DROP TABLE IF EXISTS `item_unit_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_unit_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `descr` varchar(50) DEFAULT NULL,
  `unit_group_code` varchar(20) DEFAULT NULL,
  `main_unit` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_unit_details`
--

LOCK TABLES `item_unit_details` WRITE;
/*!40000 ALTER TABLE `item_unit_details` DISABLE KEYS */;
INSERT INTO `item_unit_details` VALUES (28,'Pkg','Pkg','Ctn',1,'2014-09-18 16:17:54',NULL,'53344b5685ba0',NULL,1),(29,'Unit','Unit','Ctn',0,'2014-09-18 16:17:54',NULL,'53344b5685ba0',NULL,1);
/*!40000 ALTER TABLE `item_unit_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_unit_groups`
--

DROP TABLE IF EXISTS `item_unit_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_unit_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(60) DEFAULT NULL,
  `descr` varchar(65) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_unit_groups`
--

LOCK TABLES `item_unit_groups` WRITE;
/*!40000 ALTER TABLE `item_unit_groups` DISABLE KEYS */;
INSERT INTO `item_unit_groups` VALUES (20,'Ctn','Ctn','2014-09-18 16:17:53',NULL,'53344b5685ba0',NULL,1);
/*!40000 ALTER TABLE `item_unit_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Kompong Channage',NULL,'2014-04-20 16:00:30',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_roles`
--

DROP TABLE IF EXISTS `menu_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_roles`
--

LOCK TABLES `menu_roles` WRITE;
/*!40000 ALTER TABLE `menu_roles` DISABLE KEYS */;
INSERT INTO `menu_roles` VALUES (1,1,1,NULL,'2014-04-25 16:26:20',NULL,NULL,NULL,1),(2,2,1,NULL,'2014-04-25 16:26:20',NULL,NULL,NULL,1),(3,3,1,NULL,'2014-04-26 07:37:34',NULL,NULL,NULL,1),(4,4,1,NULL,'2014-04-26 09:37:16',NULL,NULL,NULL,1),(5,5,1,NULL,'2014-04-27 02:19:44',NULL,NULL,NULL,1),(6,6,1,NULL,'2014-04-28 04:54:48',NULL,NULL,NULL,1),(7,7,1,NULL,'2014-04-28 04:54:49',NULL,NULL,NULL,1),(8,8,1,NULL,'2014-04-28 06:25:42',NULL,NULL,NULL,1),(9,9,1,NULL,'2014-06-14 16:15:20',NULL,NULL,NULL,1),(10,10,1,NULL,'2014-07-05 16:15:25',NULL,NULL,NULL,1),(11,11,1,NULL,'2014-07-19 15:55:22',NULL,NULL,NULL,1),(12,12,1,NULL,'2014-07-19 15:55:22',NULL,NULL,NULL,1),(13,13,1,NULL,'2014-07-24 15:51:08',NULL,NULL,NULL,1),(14,14,1,NULL,'2014-07-26 14:57:53',NULL,NULL,NULL,1),(15,15,1,NULL,'2014-09-26 15:42:58',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `menu_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_types`
--

DROP TABLE IF EXISTS `menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_types`
--

LOCK TABLES `menu_types` WRITE;
/*!40000 ALTER TABLE `menu_types` DISABLE KEYS */;
INSERT INTO `menu_types` VALUES (1,'HORIZONTAL_MENU','Horizontal menu type','2014-04-25 13:11:08',NULL,NULL,NULL,1),(2,'VERTICAL_MENU','Vertical menu type','2014-04-25 13:11:08',NULL,NULL,NULL,1),(3,'ACCORDION_MENU','Accordion menu type','2014-04-25 13:11:08',NULL,NULL,NULL,1),(4,'TAB_MENU','Tab menu type','2014-04-25 13:11:08',NULL,NULL,NULL,1),(5,'SUB_MENU','sub menu type','2014-04-25 13:11:08',NULL,NULL,NULL,1),(6,'SUB_HORIZONTAL_MENU','sub horizontal menu type','2014-04-25 13:11:08',NULL,NULL,NULL,1),(7,'SUB_HORIZONTAL_MENU_CHILD','sub horizontal menu child type','2014-04-25 13:11:08',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `menu_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,0,'Setup','DefaultController',NULL,'/setup/',NULL,'Setup',2,1,'2014-04-25 14:32:48',NULL,NULL,NULL,1),(2,0,'Inventory Center','inventoryCenter',NULL,NULL,NULL,'Inventory Center',1,1,'2014-04-25 14:33:34',NULL,NULL,NULL,1),(3,0,'Dashboard','dashboard',NULL,'/dashboard/',NULL,'Dashboard',1,1,'2014-04-26 07:35:57',NULL,NULL,NULL,1),(4,2,'Managing Customer','CustomersController',NULL,'/inventorycenter/customers',NULL,'Managing Customer',0,6,'2014-04-26 07:36:47',NULL,NULL,NULL,1),(5,2,'Purcharse Order','po',NULL,NULL,NULL,'Purcharse Order',0,6,'2014-04-27 02:19:27',NULL,NULL,NULL,1),(6,4,'Customer Lists','index',NULL,'/setup/customers/',NULL,'Customer Lists',0,2,'2014-04-28 03:11:38',NULL,NULL,NULL,1),(7,4,'Customer Shipping','shipping',NULL,'/setup/customers/shipping/',NULL,'Customer Shipping',2,2,'2014-04-28 03:12:58',NULL,NULL,NULL,1),(8,4,'New Customer','create',NULL,'/setup/customers/create/',NULL,NULL,1,2,'2014-04-28 06:24:27',NULL,NULL,NULL,1),(9,2,'Managing Supplier','SupplierController',NULL,'/inventorycenter/supplier/',NULL,'Managin Supplier',1,6,'2014-06-14 16:15:05',NULL,NULL,NULL,1),(10,1,'Currencies','CurrencyController',NULL,'/setup/currency/',NULL,'Currencies',1,2,'2014-07-05 16:11:45',NULL,NULL,NULL,1),(11,1,'Categories','CategoryController',NULL,'/setup/category/',NULL,'Categories',1,2,'2014-07-14 13:09:05',NULL,NULL,NULL,1),(12,1,'Item Types','ItemTypeController',NULL,'/setup/itemType/',NULL,'Item Types',2,2,'2014-07-14 13:09:05',NULL,NULL,NULL,1),(13,1,'Item Unit','UnitController',NULL,'/setup/unit',NULL,'Item Unit',1,2,'2014-07-24 15:50:53',NULL,NULL,NULL,1),(14,1,'Item Size','SizeController',NULL,'/setup/size/',NULL,'Item Size',1,2,'2014-07-26 14:57:35',NULL,NULL,NULL,1),(15,1,'Item Code','ItemCodeController',NULL,'/setup/itemCode/',NULL,'Item Code',1,2,'2014-09-26 15:42:06',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,NULL,'sith',NULL,'kong',NULL,NULL,NULL,'m',NULL,32,NULL,NULL,'2014-03-27 16:01:26',NULL,NULL,NULL,1),(2,NULL,'amber',NULL,'kong',NULL,NULL,NULL,'f',NULL,19,NULL,NULL,'2014-03-27 16:01:26',NULL,NULL,NULL,1),(3,NULL,'lama',NULL,'kong',NULL,NULL,NULL,'m',NULL,2,NULL,NULL,'2014-03-27 16:01:26',NULL,NULL,NULL,1),(4,NULL,'natasha',NULL,'kong',NULL,NULL,NULL,'f',NULL,1,NULL,NULL,'2014-03-27 16:01:26',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture_types`
--

DROP TABLE IF EXISTS `picture_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture_types`
--

LOCK TABLES `picture_types` WRITE;
/*!40000 ALTER TABLE `picture_types` DISABLE KEYS */;
INSERT INTO `picture_types` VALUES (1,'ICON','Icon','2014-04-20 03:56:35',NULL,NULL,NULL,1),(2,'PRODUCT','Product','2014-04-20 03:56:35',NULL,NULL,NULL,1),(3,'IT_COUPON','Coupon','2014-04-20 03:56:35',NULL,NULL,NULL,1),(4,'LOGO','Logo','2014-04-20 03:56:35',NULL,NULL,NULL,1),(5,'PICTURE_FOR_CUSTOMER','Picture for customer','2014-04-20 03:56:35',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `picture_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (1,'4.jpg',NULL,'ÿØÿà\0JFIF\0\0H\0H\0\0ÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÀ\0„|\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0üøÉ¯”<‘1špĞ\r\0„n{Õ\"„E óCÉ6æ¤À\Z×	Î($B}h¼öª,aâ¡>î((\\Ğôa	âØ3Ÿje-0=i¡‘í;³TUÉ—ŠD±²ŒšEØ` ±h&Á(*ÈhëLlv7uâ–À;c4×,jÓ-1:t§¸,‡j\Z% Æi1€hâØNşõHbóŠ\r«Šl[‘¸éM†ƒ)Ø \0@I¦€@sL c[¥0BR(Q@˜¢@‚€\n\0(\0 =(\ZƒAAÒ©\0S\r\07‚„Û@Å(\n	\n„=((osT„Å¦Hb\rH˜”ĞÖéT1„fš-	Š`%\0\r\r=h(CLÉ¦IÁ¦R\0hèi¡¤3£¯0ñ…İ@„ ¡J\0\0æ1àR¹7 Ğ@”\0´C@!µH¡Œi”ÂÙ4Xvi\0¤â€\ZOÿ\0ª©ÃI9¦U†“Ï4…<š\0xëA,I:R@ˆÇ™ §¥\0\0ñE†æ@ĞP!¸É4q…j®€ÅìàTˆ3Ô\0ÕàÕ2ƒ© É¤M…Í!nj\r wS\ZJ\nôĞ\r¦s@EÆ7m\0Å1N´qAÍ!1hP@	@=1Lc©\0ÖªCBRcºS@6™A@Àñ@h\0$PU \n`\0”\0´\0RŒ¼P*îRĞ1(\04\r\r ¡	Á¦éM\0Ş¹¦R~t1@\rÁ³Lå8í´\nâ(™ 	*H¸´\\ş`4\r\'ó¦PœÓ°¬!4Ñhi4ÀnÚ.;Š´€\0S@†f¨¡´šã€æ1Ê9íJâ®$GŒU\ZØFÍ4@3M$†s@ ı(‚Š\nwwb•„Ä$Ó°$5}éŒxêXpMHãŞ\rëTEÀLsÖ˜Ğb‹L\n \0´®ãy§`­0m\04\0b€\n\0(\0 bh(	â$&sÖˆG½1j!éM\r\r¦XcÚ€\n\0(¤bš\04îqEÀÅ)€´\0Rbb“B†1Å2ĞÃÖ¨bP\0{Ğ1§­\rj¤S\ZfÜ\\PgN(¤Íy§ˆŠ°„~tĞJ(8t©!  `hÜÓ°Ã4X=)•a¦ØiàÓ°ì(n(\0öâúS@ˆ³TPg‚Å ‘İè£µ+\0­Ò¤ÃViq8úĞ!1Š\0:P4%°½¨†‘Švw¦1sÅ SEK»h¸‚\r¤ÑpsH›†Úp+‘@ÆmÇj¡ #=©Œ6P\0\0. n)€c=¨\nĞm§p\r´\\‘Íö¦PXÒh\0\0\Z\0J«\0‡¥@™BP0 €f˜	œQ¸	sHu\0Ú°\n\0(\0 74\r\r<Õ!‰@séAVŒö bJ¤}©h(¥\0\rÒ€@ ×˜xâ”\0Üâ€µÀjÇb\n8¢Â°f€°f•…aæ˜ì74Z4œ\Z\nAŒÓ¸À\nB¸½(6\0¦ÇE¡¸4Ë¢‘,q H@Ø «Ş1JÂ°Ö¦1(\0 hOZ  \0ƒÚ˜Ä<SBÍ1ŠN(h@ÍKáiqÁ}E\08/5\"o<S¸ZcBâ‚ˆñœñÒš)\r<}=j€o˜‡$:;çøÓåasHxT`»t»ÖŞ¨Ë‹wä9*„qÑˆ!¼AÆiò±Ùö+ÏaujOm4X,>t#Nò<~)XD,6± #‘ÆyN}¨µ·‚ägÓ<š,\0EK‰J`>Ô\0m©¸\r#­0\ZWŠ«ãJÓºÄ#¨„f€­;€•@4ĞPP1(\0 €Œšw\0#÷(°0\n\n°P\0x4ˆzÓ)!•Hbš\0J\n¸P1´ÀiiÜc[¥2„\0M\0Š\0é3í^aãØBÇ\0ÓACÔf‚X¤ûP´\0gÒ€€Ğ@N) °ÒÀšv(Py¤©\0f€°ÆaÒ¨8éL¤®%XUë@…=(6…9íA\"P0 Öô¦†\"ƒhĞ‘Hbb€\r´@¸4î1àqJà(zŒÒbc‚Ò¸…\n{ÒÀ:fšKk)ïdòíà–áó±!b?*»u)&öGa¡|\"×5©Œsµ¶ü(ŠñÏœÌÙ\ny õÆ\0cÑM#UN]MTø8šp†ïP–ö]9Ô³\\gŠ4\\†Á<¥–LãDdŸœ\né…+–©÷:=?áï†¬íÅ÷ök¼°×BRÒËåd¸0–Ø¥46¨Ï÷¤˜3ŠİS[É¬Ô4˜¢Óíå½Óí4{”o&{ˆ¥% Â¼—òDF½¼mº‡ÈÌY¨QK¡§*ÜÅº½½ûUÍÄs[Z,s{Ø\Z)¼Í‰#mùTÚÚªª£>I“¼àoÊŒ\r[k11‰å¶Gº†d¶šÂFeXFé$	Å·7ŸrD»AÂó¸V2÷t)FæLÖQFğÚ]i±5ÌÆ8í ¾\r—ŒÌ(¥Rñ<K!Ï)*ŒcXToùAÅn6}/B¾±‘ÓG‚W>mĞòÒRÓ©¯ÚdDPDarc¶‰UÒÅYA#dåª`â‘Ëøƒá>›$fm9nld.Š-\Ztó ?f„\'Şiå*ÌP`Fƒ$qQìÛWlÉÓêQø¬ÙIqä[6£ÊóZ)tùX+0õ]Çq‘ÅCŒÕ)=µ9Áƒ÷yíÿ\0CĞÉ¦·â 4\0„U€`Ò¸Všc¸›iÜw\ZVÀŒŠ«—a¤S„PP@4NÀ€0)€ÓÖ˜ì%@Í&MÅaÒ„aÊØaÕ \n\0(”4ĞS\ZjŠh\0ÇZ\0\r\0tUæ8Òj‡a)1¤L\\äĞ![¥4h849¤š	POZ†•æ©(Å&&!4Á!š`PRÜi ¶ é@9 h(€P1hc(\Z\nŠ:P #š\n@Å\0\0åSšLL“œı*I\0<:d’ô=ÆwŞøe5àóuH¦„›m] Œ3÷êIÚ0p§$t:¨ésª’\\Ó;ŞîÆîÒÚÊÔÙ˜K$SMe¤_}¶È‹€Ëƒ	*Wï¬€ıì\rš®÷6æ{-oI/´Ég1DV-díİ›hE3ar]\"òœäI³†¦Mµ7m­ôÅ{¹^;FŞì‰#Èu¹s/ÊÑ–L•|>ù(\0˜’yŞÿ\0Ö†–%[Wº·:­½½Î•(•¶°µ>b²HÊs‚ÒÍ/˜q—rÃfÈ£­E&;Zøbın{[G@ ‘c†XBïˆ±UY?w‡4i\'˜WišBÒZ%^¨r­ÅÜÛN—°Åu` \0(¢`°c$%ÎÅ`h£l±F,®Y»+—M\nWvz”8³™ÌN“D¨¦ÚÈıÖgS ¶FDy3=Ë©\'GÈÒİ—A[”DÓ®g‚Ú[x‚éò‰\"k_;‡L–ŞWa2¤“³F$‹c,vøÜ‘í5jq½ÙVĞÈ¸³¾iZş(ÅË<Mv—Î±·”Yş[q‹xb,  ™İš§(j<’V_×õÔ–RšòûNÓ%ówÚÀ–M#5ÍÙû]µœŒæ-$‘Æ×Wdà‚Âœ²£€Æš‹z‡@´‚î\rfÖòëHHn –8\r”Œ«8b¶ˆÑª\"­½wÜCÉ“’Eg*w‹]?¯Ì¨IÂ\\ÑÜaÕ<=ã³Åõ¥¶»q¥¶ª7ªù³ùeüø„;£:08W/J•QæN•H|\Zkoø?£ûÏZŸ±¬ÒšNÿ\0y…â¿\Zm•åøÒ|D#Ky\0H¯-ŞO9\ZÜ\\Æñ˜Áb\ZÌ(oİ¸ÁÛÎëM¥xŞı¾î¾fUòêm7FV×g®Ÿ¡ÊkŸ<M£JCo©¬«½>Ã:»2í3Ô©¤tÍ8biIò»§æJ™^&ö‘\\ÉuOôĞák©é£<„\0f‘B… ‹ZwÒ9§p[‘2õªE¡„f¨¡¤qM\0Ê`\0P`ıiÜ¤44j†%1Š½iÇR½É\ZMQhFéB„\Z i =h,(¤`Ó	Å441ÊÒ˜\"A †¼ÃÉİj‘HUëCR!GJÀšnµC\Z£&1H CH hJ©€ÃõïLÑl9¦1 ”†æØPhhÍP0 8\n\06Ğvó@Ø P!Û}é\\	Å+Šâm§r®)ŠèpRz\nWŠ©êi\\.H),ïq2C—‘ÎGsI‚M»-OSğG—K{{Û»õÃ†Ao†‚§ª‘óu¿æR„`>â£UÑéBŠ¤¹ç¬¾î<¦‹L´{Ÿ-¤p–‚/³•óI]ò9T´ƒ¹Û¸è+h+hô	IÉİš¶ššGf’^½¾$ñ¸kTdQy&I˜ù›p$Wæ\'=k+kİ\rFLŠÏSß\\®¡¨+½º1û%Í»¢…†,¯l+€j’B£kZ7Eªr½-_[ƒH°}>ÎÊÚòÙæû<×ÊíĞ¡A)f/´€î®ØÊ€Aù0±Í­ÍU7±K¹k¨·òÅ$-#Ì—[mğˆáƒD	ùK’dˆ¤à²°lZ÷¬–‡thÁ$ÚÔáWVñnuöèg°°¶šk`ºm¬wêÌ<Õó™ùR±0`Ø;©#iP¢Ö_¸Ö2Ü”m÷3¤ÑïôÕÔa±Óµ¥mzİ’¡Í¡Éi)òOœ$Ø¬*NÔŒØ\n\Z¸¤ª¤Ûºúß¹·5­5ï//¸|Úš5¦›áíA~Àò3y\"6y; iC0Y™Òuówõ„)Qó™åt›î¿¯ĞË’5ß»¸ğö¢EÜ³GÙ,[ÒKwxaÌûÄd—-$G$Ÿ?Ì	óìòÆËO£9eƒ©k¥r9ôÅ¶tÔ¯—fiÖóÏ¹¸\'sì²ªH¥IİÇ›?ÈŸ.¡s´j¾é_Õµ9e¤µ(C¦ë6·—ZMëÛ±o¶<ÒIÌ“H€Ks—™§]î©,JÂ5VRqÕí¢ãË-?¯ÃĞ•nˆ/¡ht\\iÑNÃO¹¼Òm†@i¼É-­&)$×w3“‰$G\n íL%5(ÍjK‹Z53©Ş_ki{§[Í%äé¦ÇWM\"ùªÆ[{‘!>Uµ¼a<ØğrXé5ºĞnÎƒÃz´“èºv¯sªÉ{m5¢ßËªÚ²‰Ö¦Äÿ\0»Ka9T-œÛÏ\"G›5&”~^}>OoTzpODı®ÆÖ›¥­¦¨Ïy¥Ô4ë–Òïm#c»Dìc—uU}É#9*“ì$„ábÛM5ğé¯]^şzŸK€”\'%õ{±çz×ÃûOi=Íµ®¦Qe³’Ä<¦âXIQæBÁ€İ·‚3Üšô¡U«]İ7ÃPŒß.îçŠëzúÂ¤¡Š1`¬ÊTåNHìGz{×t’²k©óÕ#ËÖ÷3êz‰¶#<PlµI•æ­3AŒ8«Â(1@	@BõHbŸ¥0\n\0(\0úĞS@Ä#4injŠ€\n\0CÍ\07½R\ZL¡ .-\0ĞµæHÓÖ˜\n½)°ñÍ+\0€Ğæ€´€Lb€\rb“@„f€°”Æ†ôËJã	4Çd*œûŠ\nØvÒ9íHWCqšcèÅp 	‡ ÏnÔÇPH£š\0ZL\0¦qI\0ª¸¡‰»ÛšW‹²•É\rœæ‹•pEÄ€QqÜv8¤JLthÒ2¢+;±QFKÀZ¤WS×<	á¡Ç<w8:¤ì‘ÈÉ\"2Ãb~sÏC‘Á®ˆÅu=Z0ö1ç’Õìt³ßÅi&Ÿg¤œ±¸ë$óL›²¢*îÆÑ»ç—ëTØ´œähÛÙ^kZcE..ÆÃP×$·µ‚bDùrX$8Æà§†ÉÀçœáEİËäµ;)aåQZ(‡^ñ\Zh·N&Õmî^âáU Òì68ıâÌ§Í‘•v‡æ>zw9š5=¯ÁSÕ­…•¹ä¹¥²ÿ\01º³X³ËSÖµXá±Ób¿–K™#!9xíá€!\\6H!`Áf=ñQ|ú%Ôä\ZÕ%Óz³xø~ÉolôŸŞYZjWòypÙC4í\rË)#Ëiç`‹Ä°`nä°<S­9EÎŠ÷WS¾\Z<Ê5[R¾ŞŸçÜ³&‘k«›«;‡vvpÊ†	üF—–Öûà™I*Ä©)…Îà¡ÛQ	ÉË–5nû\ZÔ„!Rq²{KS>ŞÓÃ‰cK¢ØYhâ2í¯ø’ÜÂxÉ¶A»Ì½JFFSØë/k)¤Ÿ½ÙŸægg9M5ëş[ú,|Cá6Ô§Ò<?¢KnÑ0šæMFøi¶öåI)çK(-&W<(7vÉ#–Tq*­+>–êuÓ©MÍªqNİÿ\0®…_x§ÄpkZnád³Æi#¹ûv“i#ÍröíI®·ÌP…h‡!z²–5¤0ôaIÔ­{¾ÿ\0ğ	Uqªªtô^HÚñ6·®ø²×NÓ4»O\rAÂ´\ZŒšİÙa´à,*#vvàa°6äÖ8uÉÎI5Úßç©­|=NUkwÔÎğ×…ü[ogz½¶òİí–-K_¹¸2Í1‰È*ÿ\0hÀ>^@*@VËa‹\"›oÙ-Wc8`éüU¦¿áÇEğ÷Y°·Üø‹Oµ³k–Û¦´öà[L%!ÑŒL¡•Hf,­\"üøæ”±W“”a¯s8àğ›JlÑ—ÁÚ¢5õÌ÷:\\ÆÆÂ/´jèÁq;|ÙÌ]Ûs\ZLçiRÊŸÄ	Ç5<SÒÉëäkS„Zs_Ì·oà}ÃÖE©ÿ\0ÄÂú+cÙ´¦Š#Ë+/ 1aIZ074y?¼§Öq5&ã\r™Êğ¸XFé]•­¼5¡\rLj6ÚTöJ-.´ËËkI…Îõ0‘Ùã@dI’\0Êğ0(òYF­ÖK“››ª3‘Sƒwµ¬RÕ¥³Òõ\'{]L¥îÉ„¡º¶’í\"†I²™ÜÀZò1æ2…+5\'%g§úÃ›ò´”ïf‹³Nº¡-è³/µ.&‚D`ª·4h\0¤AR\"<»’Ó•RVåW·õøšÔ­ícï/xóï‹~ÒÎ4—šwö{Å\0-¼€-ä$–mãæ˜¤³.Ö l(ô0Ór—\"w{z.#\nÜ\\ãdŸôÏÖü=sáùQg{yÑÀ+5¬dg 3ƒŒyú×]ÓØğç	S|²2À ÌiiŒjÈÙjÑÖ…	Œ\Z5H¡1Ò˜:Ô´\0EP	@zPĞ@\05¨(iªÚ\0(\0\"€Šˆê‘AL€\n\0è+Í<‘§­PÃ<P!(ÀÒh=i”•Ã&•‚ÃªI\n\0(\0Î)+&š†æ™K@ÛÅwG4\r«#å©!nGÑª‹è) cŠ†1@ƒ\0P@\n4˜*ñR&; ‘@Å&ÀÅ!j¤1väS¤bØ\0‡b¯3«ğ\'„Û]®å2-¤ªb5mò7Rûó†­+=Nì-m>n‘=z;¸VX–ÖK‰ŞY¥†è¤Gv””EXùÀºr÷pø\0¨©4zuUMu\'ÓôÓâ+ô‚ÊÊå,à¸sq2È<ÖU>T#0;¬Ä)(]ãnFÒ©8Ó§y?ë±×‡¡9I]Zı;.æWüV-\"´Ñ´í·2G(†XÒåŞ{«‚ŒwàcÌQŒy›\\».K2Ü˜zJ£ujõüz£ú¤c\Z+š}?Í™~ğÒx¦=[D½ğ«¾¿—º¶·pşVœ™Ï˜cC»(AÀ•\'•ÆqÛVK\r(´ôe-YæS‹ÅBRŸO´ú]BğU‚xund†KKáÃëÚ„k—ó²¸—ÉIˆİñ°Î (\'§^i¤¯·D—GŞÇt8JVÛO)]õùù”ÚâÓÀ‘Ãy£xGRÔuÛíª—7·	öÔY#`§9k˜€„ÆT.27ç,fš•_âÍ(«ŞßÖ§EoqòÒƒm¤îÿ\0®„ÖÚg‰.ôø¨téEÄÒ«8¹¸\Ze„&cå,íYe’<ªDˆ…Š®¨Ô¥\n¼Ô•×¡œ¡Rt¹+ÎİÉ¼á†ğ„ir÷wú®£s.ö»±³\"îŞuAû¯´Oş¬:ÆŠ2©ó¹ÓoVsªıšŠKçúÆXzk™·\'Öıvÿ\0#NÓCÑ¬/-ntí\Z;ûÔKUÔæW\r»[ÏhÛçóFIA0pä°Øs§%I¦æİÿ\0ù™ƒÇÂ1Q¤’K¶ïÕ›6gPÒ³m5ÑV½g†èXBwÊb`Ï\'–²G²l;”MF“æœé)+´s¬}¬ÎH/îu+ènŒ\Z|1<WËt±;Ãæ	\\ˆ¹P¡CÆ6‡^¶tÜR”~îÇ4±*Mó+_.¦Ã^!/qö¥··´¶Œ]JŠñ¿”¬C:#I[8#oŞ¦WÌu\n4ÜŸ¼¬9c-²¹š÷krË§[êÓYŞÛO#3»Ì­±ŒsˆYÑ²r#gdR5öĞÍcª\'¢F¤z˜–İk«á;]¼ûuQm<òGèZeV+É1‘£™–œ_4¡ÊXm•¿áÿ\0Ë§ù±ÒæM¤Ù‘®GÃ¾³»¾½Òtø£±¹»»¶ë¼ˆmnFætò§RÖøBQHmİIĞJíuş¯şfK6‚;F¾\Z\\éQéos7‘Ozh®ÊĞ|ğçÊYÜG:·—‚Ëå( Ğé(ûÉjÿ\0-¿¥ÜSÄNZ9hO£ÜK£Ci&ƒ{a6‘sÙ™¬¿t…¡óL¬Çˆ]êÛZUl•S…(¿Ÿ™ÊåÌîÙ§o5µÿ\0“…ÌWVÓ}’ÚylB8–6rUdòây£<à‚ÎQR²ŸQ)J:¢Ò_éì–qDÉcæÈÓ*Gt·\nÎYÁ‰pnf_— ‡%\n“Å:Kİ?ë¹Û\\¡+É]v8Oø*â+8, ²k&\rò[iÉhdHÅ„€¤›gH|åT’¥şPpoÛ½Gïu~‡5WNwTã§âxÏÄê*ğAsr¢HRóoUIGÚH#$…n7jã%/SÎ©IÓ9B¼ş5f0 NåŒaMh‰—Ö‰•q˜ÅVàFO5f@FM•Ài¦Iæ‹šÁÖ€°´(¤zPXİ¼tª¸F((\04ëTŠ84Æ€\n\0è	Åy§’2¨v¶•Ä!\0”Ç` µ c<P-µP@)€İŞÔì;ip\'4\r;\r\'­2˜”Phê)\\wxˆDX9ª(Z@.ÓEÀ6Ñp-\0+EÀiéLA­&£ƒRKw@‡æ“zš(¸\n1Jà¹íøP†‰l´éµ‘\n\ZB¥¾f\n’X\0µI]Ø¸«ìu:g¼øá\n^Úª¬ÒŞ´Æv^$dŒ±*~ñ\0w\0°ìöqŠ÷·=:87;J[‹¥ãH)¥Ç§µ¥£§™l…@šéF.NÖ+’£rÂ°(ı$ÏBSrGúõ:?ìåY»ÓîÇÚ//#Hîí\'Ã-Íœ›İÑÙÕé\Z@ªÏ–dŠQ!ÜÙÙÏ•+ÿ\0_Öæthº¯›ú¹wÄš„Ú>ŸkÈmî.âi/n#W†åí÷rÎcÛ…`<‚7(Ò\n¼âó<E[Çä¼ÿ\0­=,}–:\\ª®×}–úKkoââ\rÿ\0Ãz•¦­¨Ú¿Ù\"µ½ÌµŠ\\‘$p±¹»®¹ÇãÛN” ãR:+}èñ\'*õëóÓ—uòg­xkKñ†‘ı—\r‘ ø}ŒsşöşY.õIs¼ÎgUó\\+©ùÑÈ%<Ìe‡Ÿ9Ssç»“é¦ÇO/²¤£RÑçÿ\0iÍáoê7r^İXØŞk14~C´¢×¾Qıö˜ íÔáñ¹à2‡¶ÙËİ33Kß¦½îÿ\0•¿à—ï!º‡V ·¸°Ó\"´xmRÊŞ]:ÑL/<i™YIÊÈ~rQ*\\#F0W·êy“ÇU©­ÿ\0¯$C½½”LÚ]½¬L/T32J´HÁğæÛFÀ$P…WDWÚgœå¤™VO^ŞéÖ±]$:MÔÎòÈ«vO—\"ŞÂBTm!ƒ2 Ék¶Ê¾E{Çş	5d7wú5©şÙ”]ÃhB¡ÜÊ¡@“j4jb.’±ö©±\\†İ]QŒQ†Ÿ$±é3•!)#‚Íââ‘‚8–FLC„ÜS$·“1æœ —Â4îîA{©ê7×\"Î+YÒ)fYŒ¾g˜‘‚D1Ü™Djw$•VVŠ,¾\"’9·n©åVºeõ±*úœÛêšm¬JĞµ¼–\"E$³4l|¡\'–ä½ŒáÎc&Ş%Üª_6‰­ı¯“µ3µ+ëû=qo\Zÿ\0í±¨k´2-Ø-*·Z„±¬N¥h`ÆhË!vŒëY¦‘/Bx/n!Ğ`[x¬å·6ˆb-ïä\\Kkm4hM¬¯åÆÂCåÎìÈêšÎIİËú¿õùíb]3Q¹Ò,\'ŸûA‘í.\"µÔ¤†Òö‹K™ØF\"Õ!\0[İá\0ıì“É)i”ìlí–¿ÖË¯—õ©>C¦ÓVÉ ÓßF¶µ&k ÔCZÜÙC;”Šğßh–ÙçùãšŞ¶ù@gj“YKŞiÅÿ\0_çëÜ}È¯mÕæ°Y\'¹²¹7êÑ5´¤Mí–w³„É4Çæ\rğÏ2ÆË+¸ÁÎ*Pµš×ü‚÷/øÃví§Ëul!¶²”&’ÑÕÙJcÌFdòäòğß\"I&b	*¹ò\rrURNËSEÊÙf=OQšÁ­ ÒïÜEm°WdhFé÷À4l¥œ¸e%vˆJp]¨8É“{İ£2ÂÎIîRaiqnÙ0ÍoöfCµ]L»Sålkº¨B>ôx\'Ê®˜r§©âm\nÆóI6Ú„nö2³´ms\nV_1&ÕvÜå\'ÎáP£ß&è†¬¬Ïñ—ÂYôKXu\r*èê:}Áo*9#dœ`8Úø‚$\0JµkÏêqÎ6ÕzNOGwƒ1¤PPÒ2)ÜØvªCDL1VŠ\"a“Z\"†çÇ`š\0Z‘Â¨š„äPPM@‚\04Š\n¸ÖªÚ\0i\'4ÆˆûÕó@ì ëÖ€°¹>”Ç@y¯0ñÃhõ4î;Š)ñŒU\"’¸Êcµ‚€¶&zñJÅr€8¢ÁÊ5ºäSqs@\rn´\0£š\0P(%A79ĞC\ZFi”†â‚‡c\"	œS°ÅŠ€B3V¯“@3R@áÉ¡€ê¤Ø\\rŒj^€?hÇ_Â‘&¯‡¼1wâ;°¯•lŒ¢k©÷qd€2}I ïMv[šÓ„ª;Gşêô_\rAâ)ìàŠ{}?Î5’B….fË¾p¹«Œàà’»pŞšµ¬îÏs\r†Q\\õ‡E§iñèºEÍŒé6›\"íšÚÚi‘4h·ªì¡e}Ãç\\«ˆ®â®k^Y6¤ÂuÔİ‘{ÛA´ëHài¤_9#‰Z%ª‰#ŞŞZ¡—»ÆT£åÁcvJìÂæv=?Â^´ğÜ3ßK#KoŸ‘B¨’Ìd»dR€nÙögûÃZä^.»—îã×úş½O¯ÀP½¤º~e_øGõënÔ!€èw1\räQÛüµ($Š=ÊL[•XÆ¹#‘UAÆ’²ÖOğ;q•£vNĞ_{~e¸t½?ÃöĞZA÷Ä<ÓËµÔ‘†Rcò¶3>S?\0g+ƒÖ£*õ[v>zy‚Œ}Ù]DÒüL×2MqöKFk—xH¢wšPUŒªTK0\nIˆÊqƒóî©7¶Çç&îÙš™³Ğ­¢û4\ZT7Ì†Sl!ûNdE{´0U‰hÛq5¤Ê\rıŠ“»fwkağ@Æ%ÔI[grÇPŠ,­&\"Ì RæXrz:1b•\\°½…v\rsy&•nÂîÉ£{smoÒ³„•¢Œ€…LA†ìm‘#S™-à\0¸J1OrËÒ5¬H[_1N|¿ô˜µk—<²8t›—ÿ\0V‘°tÈ_ô{‰W÷A\'w¨¶Fv§tútê«pÇ¡“ËÕL›³»j„¥÷şë.¤I¶Bê’İ\nì½k¶‘{sk=ËÛµÔ‘Ê­oh“î1d‰°8İço\ZI$*!¿y%½ÁhZÔZ=H´Ö¾]Š0œ}™/1æ²ÈÛŠ~íQ–´«¢ó$“ %s”yß¼µ);lU´KBæĞ\\G¨D±½½²Im$Ò^Z(a\"F‚eC€Ï\ZÛªà/Ëq,lT¶Ñoı_ ^Ã´½Z	îÆ¶$Xg³¹ÏgˆcÒO(ÈKÆ\ZV)Æ&tX<É $îÛqnÉÅÀ-+î\'ˆôNÅâ²ŠĞ¤ÚµÃ0†òÚ_ìû’ÀùŞr¢›Ù¢•	#eE2#–!³WBWëşä)\"–«\ZÉi§”»7:Ü\ZxÓ¢‹TÖ«¡ ıæ›pñÌ‰e!gR‰\n4Ò$YÈ±£²nı{~h-sGK°³Ñ´h4½/J‘ì„G‡4}dûe¹°kX¬.r{éW>c|E`½öäŸüëÈ¶¹U¬f6¦O}\Z,Ësm+[Mi-ÌÒ	$s$Iv°[†¶2Dò¥E·™Ú1»j\Zé|Ë}?®ûşFH¿§¦¥oy}mamªß^ÚF#»†)æ7ĞZÇ3BbGbÒ)‹<o3ÛşêFÜŠ•½ëËmÿ\0¯éKh2/,Kp.šÜÉ!{v¶M:í{Š~ÎH%K¥H§™•œ&\rD©~?×õ¦£VÜw‡õ3U6úhšÕí¢%\"‹OÌ‹4ˆæ5’Ù o-XÇU¶¬ùÀ8ç©JÚ¥kZêf•æŸ{ ßCbaßO¿Å¼·1—·g8‰,[¦\'cìŒñ¸.ßİsŠºæ¾¡-N?í1Z\\¶…5†e˜“İe%;™v”ÚeNxÆÈT~\\Õºmõ3júŞ.ğV•âR‹iqm¨,d‹ˆ\"M¤¢²EnÁÏb„†\\sH˜§­¾ïé˜ÎÏñO…¯ü!«Ë§j1²L™*şT‘¬ª	RÊ²*¶2äÅUŒmc#R%±ŒµH¤ÈÙj“*äN¾•¢e\"29ªÆãŠ`\'ë@ÅÏ! a@\\CúP§p B”b2yª”k\na¤b¨bS)E\0&ê\0è«Ì<pìh\0 \'M§¥PÀt @¬p(*ãAÍqzš†’zUXv‡5,D€b¦ä]‹šBP!­L¨î\0ĞËk°Å”7ÓØ¤*R$ÛÅ\"n4©ÍUÊĞ\0¥p$)ÇIˆx É;cÖ¤‘0FN@¹£rÇAğ{[][]›û?HwCå©?i•à  œvÎÓ1ÍR‹”¹bµ;¨áœÒœô_‰ÖO§É©è64µÑü;oÉ2Å)f¹yH\r‚‡†,üÛC]´©ª-ëwù¼£x©(òÅt_©±¬j‡JµXöÚEah­ÌemÄx-ÿ\08,…†Û´•còå—{o\Zi·c\n•\\½Ôô24È#¹³;ëÈmm.ÌÎbò¤l€D‘\rù‘ºîP€\\VÚ·¡Ìv¿\r¼;ZÇ&¢±fÛ¯ ˜‚E£J$hh×å2È¨Ç7²Ëˆ©(ÆĞêz¸J0çR©·¡ßøµ¥[«i´ôyâ[¦K{k°RXù­„RÓ|è¥†åª0ß¸•ñháåQûëSß­˜G\rSÜÈ×õgÖïËu$ó¹›Û2ù„îóe…\\Ï\Zt6ãø²vúÔèr+-¿®§ÉÔ«:’æ“Ôçl—ûZm5ê™mÒæOİÃ*‚Ë¶6·:åH‘¢	0UÜc“,«×d—»¹šódÏ©ÆÅV[kØVÍe³HÊK\"Ü(3 ¬’\rê<©ãYÁ;VF¸bÑí+Å/ë ]\Z\Zd¶Ó«Iö—À;+ÃbùT\0\0!vI´».BM’DR*¯œfÜ±Ğ]J\ZRËs.ÈüÄÊ³™<Ç™D0É£¸ŞFâÉ¾Å]¢ÖF‘|Ààô¸Ú×Bæ»ae¢F®º}ÄËeÉò™Qq¹L¹RívÚvÉxÁ…g	§\'`z YçŠîZÖŞGh£âf\"åÁ‹Í¹E%rcmàoØÑÅÍ6ĞXËÅ¥¼7‰£Ç½©u¿¸R©¥€–DóIU*ÍºEÀmÙ2ƒò˜|Ïg{ƒìlÇko [Áaz†+¨æıôæ{ucŠßÌÈb5ØÀåpA»c¨ÍMÜ–‚ºêM¤øC[°Æ¯<Y>Ë´Ï,nÒ\'™hF\"ÜB„Q@`ä0q¶±©QÁß².×Ğ±¢A£ÜAi4ĞÎ$Yí&ŠG,åÎöÒyD† ùIMÎ‚§Ú9E÷kß¡cN¸¶²Ôuˆ¢/*‹hŒwŸg2íbR?ŞAó6vÈqº€’|Ì­ 3\'Ï¦…Ş×ĞËÕm¼.âæÊãNYe|\")mmî\nÄq\n¼{âÚŠİè\0«~éö¤ÆqK°4ÙzÂ#`——\rÌ–[µ½íÄvìñBÈÂ\"¯r XD’A\"(‘•İ6\n®g&š—ËúüÇk!ºêEâ»‰´Mrê6šoİºÍ •¡Şê-ÃÈcòæy6DğÎÂæXØ´RÈ\"!)Cßõş^wC{Ù”%Òoîu\'–×O–ıïcyïÄ°DBˆïÆ“—Š	,r<H’ªLV®¢å»çı}ú–ÌËÓô3o\Z#Zê6’C%­¼ÚP†250Æc’êHíãûDl°°X÷á°®pÆ½ªi.»V×Ï¦Ê`É\0Ğtÿ\0íË˜o–) A}ªCöˆ¥êÈ.î•Pö“gl0’TÊ-ğ¨½n´ş»Áù‰Ù.Vliyƒã‰;ûH¢f7Mq24¦ÚXƒÅæ]*´O-ªÁJ7–vmĞŒš÷ìôk­\r-1ä›N\Ze…ÔW¾C /¦•’$eyBFŞU™EŒ@°’Èü”8lFêœÒ‚½íı}ãQĞ¦¶wÒ8Õ´µÖaÓ·çìö–W¿dEÌ#dÈfHãVS…Ü$É*ù5(è ÒÛşõ3JÏRML¤‹q¨µÓ.uèğÉ©#ª³«—š¸ìÜù\0a·nÅ¢Ô.9\'»<ßÇŞ‚óÀ·«edÚ{G\"˜áƒÌŒuÜÒ,ò»«&H!q êpNÜÏ™6÷ş»ÓŠqº<8û)œÏq¬)¡‘²Õ\r0ªE\\ºš²ˆÏ5H\0Šc¸…°”	†(\0Å€\ZzĞYUEë@ì\r@Æ‘‘T€m1¡Z7ŸJ\0èëÌ<p š)j4úvª+a(„Ú€´ØSÒ‚†ĞH‡Ò‚™ ÆM\0Øõ4˜‰@©3@h,(1M\r(`Å‡céA,xP!¹ «\n4r®hbd€T’8}*XãœÜÒÌï¼àËƒlÚ¤ºcßÌŠBòŒäI·ixèHÀlŒ›Ó„[÷‘ßF‹k­ëOğŸÚ5ÕE·ö…ü—QımM÷$Ñ¨9p¼\0\0Y9…@&ºÔ’JšĞö#H:Œ±¨^ºY«$PùiIöhf†[v_‰wú²ÀG†8ÆÜ16’¹Å:FlP$3<rßáHLæ8ÌrI$Ø_”*H‘¨#\r;B…Ëm5½“3±pé—Z”hñ\r;1™K…o„\"Æ#\0¹B1‹u2–$õ!¹rŒØĞüC®[Æñ<Áï­æò~Ía\0w;3ä,o&v¨T`Ä1¹çN3ÔèU¦•“7µÛŸ·™ÿ\0´58Ÿ}°iøîA\0U„	¥ŠlD^n V°NI¨¥O•¥±ïÔ«{\nß]Eem¶Hİ¹!hÚ7G\'ÈënK»%µ™dRxBÄ†èƒêÉµ†İ¬wIvû\"\n’„»«½î&‰™·ìÛö…Y\\äÃ0+½Üd´bh	®î,¦YV~\\r[3]E”1eKiªÒ)>`Ü.·Aµ”+¦L-¸ßB´&µ‚îÖö²Km$İFn%B# ’+F–LKk¹c¤şt€ºc¦—Äÿ\0¯N¥(JJélU³Öíõ\rg@Ñ„ÖrB=Ùš)L«Ê­käDØ®~ò³¿îeCŸºZ\'¤\\ßMM!Fm¤ô34û«ût´‡P‘,®¥°6Wº¬×/\'—’Aòv˜Š`Ÿ4éµDˆ…¥)Åİ£µ`¼Òş¼MÃ.d´óu¦ŠyVk[˜e0<Wv¬££yfN€ò„Êù\nóªÉİ)/G£;^\n“TånúÚş¦Ö ëº´š^•¢İ=íÅ¢Ë}¦p‚4VR³ÌÒdç+23dáŞ9A˜”«Ó§tŞız,\\\\šÑ[N¾†æ•ğëW²:D?f•^Ò;6´–kMŒqyƒsn0H	u^\nî!•Jà/-Jğœ´×şé¥F1RÚ-ZË–÷¿O??2½Ç‚.`¸±¶¹şÌå}¢Ö;ë‡{{Ó6öe2ÄÅÃ”%ØXÊ¶pÄ\'$ÕßéëıhiWO–WI}Êş^¤Úw€%ÓEİë\\ÚGis±	î®Wt\"!”¹}í´¨‰—8eÁŞBElJåöZ§oøoÏşé£„N²Ã;İ«éÛÏ³_3¡¿ğ~¥t÷7pMs3OÛ›Û½‘N6:-¼LÛ•%V\"To”–8ß·,$›×•}×ı|Íêå©’NoTµ½¼û÷ñnœsök›k…„ÇäÌ°ÛH ?&€B¾j7\0‰JeT«vÏE¸ÅÊ×üÏ2–\rJP‡4SµÕßôX­ŸT°³‘íÃÅ+Ë4qF$²–W°X™ĞùˆcÊÈ­Œª¡Ø’§Î&4çÌİîuÔÊã8ÊœzîµîsŞ,In5-\'R¹µ²ƒL[¤¶ÕåYç¹0Ï07	¾VÔ4S+4yW\r ÇJõ)b“‚m½×o/¼ò¥–r®g.Æ=Ü7\Z£¯[j‰¡©™g¸†É®#KwE·€03ó–{‚ÒnŞ#’¸*uub¢ª.ŸõÀŸ¨E77ùšWZ«>»aæ¯u\rªÎ‰}©_4~|r’D­+)GŞGœ(cÁYJüÄkÓiŞ.öÛ¦İ?ÈÊ¦]U+¦šüNvÒk«›¸5»y5+™oŞÚ&Ó¥Š[{«¦òÜ€H‘ÖÜ1˜¢˜¦MÈ›Â×ZââŞËú_ğNXàkÍİGvÊwZö;ÅaªA¾[yõ£šşf‹\"Ë4R¼’‰%œÛ`ù°F\0hª•uU&´Ö§=Z2¢ÜfG¨Aq¨ßßÏÒ^…¸»k¸®Òşææ6Y&—I¤„K([\\‚Hæ\'.¾}¨o£w~]¿OëäÌ•şF÷ˆt(¯§¸‡û=*ÖY„×z%¥¢¤l¶û‰¥(dBÒ3²)]¡™£X³Ë	Y{Îşş_×™RFe¨tYµ†µòŸ1ˆÓM¶º‚{˜Ê¼U¢µe1gkÛåòÎä*û*e(§ı~\"“mİ.mìîŞK[‹A,13Äö×6Æ$\\‘€yq¶PÃ{rv1	ËÏó1i´xß¾ê~k½Z–ëD2F\"Ú§w”YŠ®[ÁÈÏ\0•u·SQqÕœ!{S3êFÂÆDEZe°«EŒ\n}jî\0GçïLâ=h((\0hA!@	Ú€j‹\ZzP4\"õ ¡Z\0*\r=i:P11ï@ë^aã‹ÓëMcrjŠB”\0ƒ¥\0&\r!ÙÅ†s@ŒPZe!Š½h T²êD‹@\rÇJ\n|ÔÂíã¦h{Ğ»ĞKÚ\0Çb•È¸ğ´€xâ LZŸÀ:$:µou|i6æÜ´Š]\\(Ï—µH$·N=µ\\UôG~íeÏ%î§øö=—]×.ï<©™#û%ÌLm¢‰ÓC”?#1ËÚ¤îşèR3ÔÖ”é8ÖöGÔT­\n”%Ë6íò%»H´¯Ùéºu½Ñ±‰€¸hù×jH«œn`Uƒ·q$šïQ¼›gV§2å[\"­ªGcIsjñâgöŒÛ¹,ƒËä¸ÜŒ±¼`É¡W©»_SŸÈ»¼vË4ÉZÈ™[xU<§iHI¦e`ªrÖ0Vçh\n\0Øé$éf{˜$·f¥ÄÀíšRdåŒËd…IdàrÇs\Z–ïkcé—’ê)äj¬±ªFJM\"©”$9xÀÎÆÁXnr77\06ÔŸ\"Ğ-s°m>FÒá»ºiàth ·VwVqÂ)%YXœÜ°á°<ü²ÓKõ.Í–$»{›)¡–[Kk´‘bš(¡û}Ä‘—Ñ%œ˜ŒSÆ˜vÇš2sSIï~ß?ës®ZÓ2ZwÛó\"·›Ta’	d½†ÑRÕå¼½U(ŒB<^c4çÊÛ,;Òf•7İ²2‹ŠU9_»ÁG—šuËS*ÃH»Õ;+;hÕQ!h4¨šO¶E*Ã2Åœd’	dÙK¶%U(AgR«Š¼¿¯øc²†\Zçtİ•ÓØëeğ>‰mmªRãO·¹\"e¸†EãÍµ ÛÈA‘Ù¡,Ï”nÑ;‘Y¼ê˜ô§·ı~–=jmj‘p“²ÒöÒÏ³ò³èyßŒt½kÃ6‰5¾¾6ÓôÁ&N¡lá°°Ê©3HÑÇºdšY]z¶èáÜÍåŒú´qç¤ıÖúu\\\rx)8§ek·ç·¯©Î§‰¼UáírwÛÃ41À`–o*I (ò$g%€eÛÎÒÂÖ’m¥¹J&œ §}Õ•ÎoÚT¸[Ë{ŸA–ŞX¢sgªÏs,®$vå‹lrÀ]Éó6q\\¿Rƒj£wŠ³xyEÿ\0]{k²*k?î<I}i.±}u ÏsÓi·’#ŒÊÄÊe[mñÈH89l©çU‚„SŒlLqN\rMÁè––Û½»·½ÎfjwÚÈEŠ‹µ„J‰öP#›ÉÉ¥ÁcåDŒ›	&^@\'5U„_}K†>OİJÚ?ÇúÔ»©ëÛ—÷šs[Ûi-¬—:{¨ËÇ^\\y©&7\0#–Ç\\‚¸Ê4UêÅ»Ij»èµ:ªb¥Š‚ÃÕI¸´”—MôD¹¹·m6B(®bK%ˆµõ´¬~ÏpöjO–2¦4HY”¹PÙykLEÔ’¶·ÓÊûœ˜tğÕù¥}4ôÛ_™ÖiÚ²Şxyõ‘îtÙ™†âl<’†ŒË$ò£\\ïÙ\Z•xÏÏ¥TTš³¶ëdºÙyÛsî°õ£*N¼Zjö·wæü»íüeüsj7PGo(û\\‚6ŠVh0±ºŸ‘‹Hà’Ä*©\nÀ²VËªJŠ[+_};}L]:\n­\'}]¥mµ×C¢Ñş\"x=IuU×%ˆŞ¤s½Ìäã`\"ÆéÎù-.Nr\nV®JØZsº’ÛñşºN¹!$´kä¿ÌÛod†][A°¾·¸Ş58ï 6—Ï‡,ÅK”.Å,¬?\0m¯?êI&¡6¶jÛuôüÎš—„£Sº’×^‹¡Óµş†u;Á‡ì®.,¾{xYÂ($?ë\nB	D¼nP?z>dÉ5ÅJµg7Í-\Zù\Z×ÀF¡äŸwşHÓM;Eñe•Í¾Ÿy~u“ı-ÒHåºmí½B[î\0>7–2¡@eó:Š\"­75½ÿ\0Ï©†75$—.ÖÙ7®²ícûÀú•’Á-¢[]X$1yádÚct7+mÂ5SÇ#É%(+Ğ†6Ñ­N7Aé$ì·òûû˜ß¼9«§[G*\"¬ú¡3@ê^ŞáZ%Ÿ,<åÚÈO,Ë´ãœí…ÄFƒéúœ˜Œ7¶„cSFşó‘E$úÌ°ÛÜ_Ç×w—1&ød•cY\n\\:Ü3!r:€5±”6)ŸG\Z—Vzöş´Øù™á«So•i¯ÎÅ]RÒcšUÍ•¦¥:ßZhZXFó¤“ ˆ@³F+@ŒªÌ«²8”l\n¢£>gwÓGøïoëséóİËl‰ªZjaon—I©èV÷ğGZ©uF”\'–v•\03Œ3šÊMüQ~[Ø¤ÖÌh®£´k#¦˜–!U€Üù~B¶Ó),òl ²ÛzÄïÈ”Â½tïşakGR­Ä¢íŞÊÂÚî[¥×ÉK‡Tó0¥vP¤mš|)cm“Èy”U“m/»úíø˜4š±ä^.øA=®‘ı«¡ÚêsÃ\Zïº±—O¸n¤œ0fŒezäòqÅR–¼¯‘Ë([U±æD9>•HÄÖ¨h…‡5iš\rÅP\r#\'4\0Ò3VXqJå\\h¦1ÀR$LdÓ‡Ša»¨(J @Ğ†±(U \ZÆ˜ĞŞjŠTˆèOCkÍ<„%Qoa§“@!â‚„1Àf‚D4¥\08‘Š†m b… W€¸õ,†8t¤@ÍŠcC\nšw5TƒÍ&&JÁŒî&Üğ å \0\n\0ràzş\rî8ƒÁÏô÷©à1P&8.{P×ğ¶ˆ¾ ñ„²4VòÉ™äO½J	v‡<ERW6£MU¨©·¹ôG…®,®õ˜­4+%:>¾{4‰LÓK\n\"DP0Í°`yès… 6Z=[±ö´)Â0sjĞŠÓÍ÷~dQû ¹×f»·v´gN¼[…TiŸÍiæoÂR4ØØVÃc8ôáK—GıXñªVRŠåßÃpê>]A´FîªLòLÙ/•eòÑ¾do5_wÜaÅE]\'vsëGÖï²›ˆ­¶Ì©weW+µËsÄ)•Ë1i:sM_vJò2,o¬¬ašÌZ[ÂÑ×OöuÎèå„;tãy>b	à9+êÆ‘~O´-åş£q5®¥fîêiœı³Ë‘\n£®à·DFÒ!ZuUë­·6ÒÛoëäUŸBm2xlşÈ–²GcKê-L^/5Eˆ•Ókçæˆ_iÀ·{ÛşéRÁ»)Ô½»•¤O­xkÃÃNµSg;^9Y ŠU>L’SÄÄ‰cÒL`n8¯*¥ZTæåQëıt>‡\r‡“´(ÂÚku­½|ËézsÇö»È¤šá”‹[d-‚†)%Â“¼æF,PäÊ6í$ç’®\"¢”}ŒtZkó=:8(×„½´›•›üWáİh‡/‹t«]7ÍÒ¼1jÖÿ\0¿5—yXÖÚİ¥\nÏæ»ÄjB2H«8Â¹¬äªU—½.‹O›ìwÃ\Zpk»Õü­ù^ı42ï<UªßŞ‹}°D·Q˜V=9é˜\\F‹\"JÊÑ¸ÀT\"6ÜG Q(\'Í«ÿ\0€ÎØaé*‘•=E§Oë[˜úŞµ™{­=Üè×“[\Zâä…’ãÌyğçFK[}ó¾—ŸœŒuB‹«Ëì¾í¿¯™\',\'RVÚÖêõÙ~îSÃ~6Ô|]¬ë±ÁjÅn•å·’Î1¶(£_65Qæ.Äó\Z%\\”pd†¯C†%¾ï_ëSÁÀc¥ŠU#QnîŸm6õíØÜÒ<EsamÛÚÁ}u!f•o¦gŞy±oIä‹÷x“&FÑò»–Tyï¢ÿ\0‚zq­%ï+íä–¿ƒ^§âm_M‘u\rRûRMs_K6¶AÈx(åcE“æåc”a€VÖèAõéBs÷vWÓî>V¤éaS¨Ÿ<šw¿Mt_!—Z-¦©±üù¢-2Ëö{vYáÜêpJ‚É\'ï\\ê8àÖ¬©Ë–×K©ëSÂÃMNî-´íı|Ëú~‡á[¦ĞoMÃßÍs$ŞVÂ\\o@yÃ>Ö[\nwYÔ©^QU`»i÷—B†å…œ“µìï¾ÏGşe-çÃßÿ\0kÅu?ÚµqÎ¡rÿ\0f•š[Ş?×Bê®v»nz0³úÍ+¿ëCÂÆÒ¿²OİüQè‰àO|jğ´º¾Ÿs ß0K‹É­Œ×6¶ò”2¬dhá$IlPÒ#ä¼EL¥	?woË_MüÎçF8…¿‹M–¯W£ï%¦»jyç…¬õŸ	ø®oŞËÒù²X¥Sr‘´ğÏ>n6ŒP$+È$/v)Æ¥Z\nûmêo€—³­ìj»%ÌµóızzG€ ×<¯jÃ«k{k¨¼qÜi·pËÚ#DÌB#H±&	Ü	n9Q\\s­Jº=â×UçĞë_V”\'(û÷}zvmyºFCİß¥„ºE½ıÄbÚÃ{²Z!‘$0E1\nDfI6íUİóe‹\0Û´­QIÅÁ¦’=¬\n´¡/o{ÊÚ¥ç²,ÛèÂûÅº=»k—>µÔ¬¤±\ZÃÈ\Z	ïÔ¤M¼©!ğ‡wC´A¬éÍBŒ”£ÌÓÛªOvc˜B¢«\ZÑ÷cŞï[k÷ö7nâmQ:N©ı¶S> ÎG–Ù¢šH\nuåÈ\nêU‚2†Œ…àšóêÒ§8ûJ2ÑÙ|ÕşãÕÂãgQ*U ÓZüºzØî<¡Ú¼’jzœ>U´‰–—ì±Ç_ùj±\"î\n¨v‚¼‚äšñ«JQ„aM]õ]u6ÅTs“]>ÿ\0øæ`ë?¯uf¹Òô\n[¹¤coãÄ‹\0îÁÌ›æR]y Œõ0ù\\!R¼ôŞËüÏ˜.¤êòaá¶—zëåĞè!×üb­Ÿ‹¼)¨ÜXj;$†kyƒ-£˜T¬ŞLA‹}ÆóÛó2íUlƒÏ:Xez˜zòèúü ë\'Ë(iÕ¯yıïô1<Yeq¢İÛI;$ú^µtöÍ£¼¶7+³{‰À ªÁq¿z;\råİO«ƒÄF¼\ZûKtqW¥*2Hm¿s;J¼òõu¹‡u±Iaì¢yaŞ&m¿0Q3ÆşQÈÚÈ€İ]n3å²Õ¿®ìã«\nU#¥Ñùù”›ÃºX;‹ËK=$²Ê\Zk›K|„tTSæ}Ÿ%¾~7P>dŞ•e5h¿\'¹áÖÃÔÃ»ÔVzÛşÍjúŒ:¹½´¼}>96eÁ$¶LNëkµ‚f4R\nŒ&âT§G,U”SµÌ›ÖL©¨^i7ÀÎ×6wPÇ$‚{T¼³¹ÜY§Ï™#å97A!°0YŒsÉ%.ºz…Õ‰./)çhVĞµ·$64eœÈK)ü–d‡Œí!\0’¡Î[ï×¿ü1Œ—CÌ<oàË?ìË­wGx\ZnWPÛ˜óÑ¢UF#9:g=k9]JÒş¿šJÚ£€eÍ-Q‘&j“*ã\nÓ¸\\i\\Ó\Z´úU\\w\ZÂ¨.3n\r;Üw1LBh)Â‘•@\0ÓÉ ¤!ë@ÆµH˜n†‚ÆÕ”(<PG^IâˆWŠhwF*ŠB@Ã	Q@ƒ­-Bâb™W@¬! v Í\0Çb*X˜à{R$;Ğ!œæƒAh@ 	qI™±qÈÍ!;” àÓ¸!Àb¤Rv*Y(zÀJZ½ğOÁIvoµJiÖùÒÀÉ<jAÛ“Œ0hså‰ïå˜g+Ôhì4ï\rÚYé—SjwFĞjû~×%ğ{smnÒ+ $©Ú¸Âƒ¸œŸF­6CãN.®ş‡»Ks«iÑÚÙ\r:Ët¨RÂ„ósQ´“:N6\'îØ*7œvÖĞñ®Ş¬¿ªjqÜk’ÜZ^Kwo!™¾ÔVÉvùˆ‘È¹]¬iXqû°2\rföÔ¶gß#ZêWã÷wfO\"ëp‹íÑ™Øš+ˆ¹r[ïe~é€ºkĞÅ\r42k6öv34s\\Ã÷@•Ây&ô¶–Im§¶1eP¨¤:ŒLçÊ®ÎŠ4gYòÀÑğÄpı˜L“[K3¼©äZFíiçdàÂ¥–êLY”ª~øëÅZ~ë”¶ÓÔú,&0š…?õíènXh\Z~öÉyÜjûÇ›am vKi¥da–ç—7Bå0”xk×hşîÊ6jıÏk„qªÜõ•ïùÿ\0Ã_Èl/¾ñ®…o«G¨ìæŞ{»q*¬©Ì;?ï×\nmB™]•]\0rí®)F1«*N\Zšı]‘ïP¡FhÔÖÚ/K©|ı{Zİ¿áí^ñ#ørÊÃFy­µ»¼’7˜ñÊË\nùvå¤hÌlĞ¦	¯F”)TJ”[¼UÛíıXóq8ªÔ±òzIÙ.÷_•É¾ jz~áÍd^ºÉvîşDç÷’ÊbŠ96.Wj¬ª·(J>%É;ñYa êTK¯ÏşíÆâ;“KGª_?ÏşÈ[|Q·•oQÓRîâGšêì®§GÌ¼şó#9tÚïÀ8Qšõ\'ƒæµŸoÊÇÌSÍy5ÍiÖÊ÷³îAo¨ø‹Ær6§.Ÿ{¬Y4¦e’Ê –Ö’ù³>Tª–+3¨9$ËÅ¥K\nœn•·\"³­q«¬¹¶Ù|—O»s[Cøâ›kYía}?MÓ€†iŒ÷Bã‘æD—$\">øÔHÛZ69!É\'UÌ0é+İ³:x*Ñœ½œ’Muëİˆ»wû?x¦óOÔ¤³Õ4éæi•á»@–9XJIŒÆÏ,›İCdár\0*í:P²œê`°*)rÎë»]²ù¯Èµì·âI-ãŒjö8†c,–‚Îêåb*Ûœ“rdf4ê\nAç *Y:•%\r—Ív*®\rÒ¥	)¹{Úvvóı\nmğÇâ^¥ûˆ­b’¹§»‘â0Æ³ÛYYÑv)Y¤U^Ë¨\0K„Š»{\Z:XºrË¯mzôò¾½‹^ıuË\rhÜM«XZ@¶,ÎWÍkPÉµŒ±–RKìäà€W‹ÌéN‹¿İ¢*X)R¨œä¹_Ï^¶óìt\Z™à/Şjºçˆuuñµqş’Ë±–1råp`€L7(¶W>dNJ‚F*cS^Ñ¦¹#úy|Â§³¡s.i5óoeÌûõ²ôfÕíÔ¿±£ğÆ¿gàë-7tW,ûÖddfKeˆlSµ¤™U@\0IåÅqŞ88¿¬G™Éİ_Ïşì£	×ª|*ÎÉ.š·¯’¾ºØàş1Ü\'ƒ¼q¥éè#½}*ÊÎÕíÌ71H`LÅÆĞûì9ÆĞ1^“­Aßİ¹ç,TaRûëÛñíè3á³ŞkÚ.©ı£j·±\\êvêI\nL¤›ebP”ªT³¢³g\'pË˜B4ëEÁënµÿ\03èòJÒÄa§íîú÷:=3LÕ¼Wâù-t½N×I¿K+³¶«:Cî­–-å9çÍP…RÍ¾³¥J•:^úr»{y÷+Œ­í_/º’Jïç·r³¥ï†ocĞ5ı\nÚ¹±snì\'‚keÀFI\"gic‰µU”pÙæ*Q‹—·£>¶ĞÖåˆ¥ìªÓìõşº”|=á´²¾Óe·}BŞêX@Ìrº”ŞmÁM£îFXH±ãjgfp*%UÔ‹ƒ¶ïßúc\ZtRª¯­í¯õ¾Èõ/‹:¶™àß¥…“Ã¦»ªÛ@¶×m†-À½ÌLÁå\n7(nŠB{p`hº•İIk÷ï¶¾^S‡²{Ë_–év×½Çü\n²û†&¸[É¦íäjl#*ö’ìÌ0K3¡pw‡_¾¦>ü\\ÒR•D­eÓÌëÁ´©ûÏoÁú-ÍøûBğ‘¸Ò5-i´û‰Â—m:iåË_8ù´Ã\rÁ s\\xL-LLÕXFë®é^ıúètbkB7J§»Úö½¼’êß^Ç\'áÿ\0\Zk\Zö˜¶úGˆôË$iæZjèaÔcRò.dEò¦\'vÓ¸gÂğMzòÁÂ•Ng	_uª<µŠU!½×ğÔËÕ|O ø[—Iêo	x˜ùÖIe<$,Ÿ»dDó7²B£Fê0<¥]ÅNNÔi×ÃEÔ¿<7Şïúò*¤éWŒ#Ëi5»ÑŸÌÖñŸ‡eûm¼Ö³[Û¦Ù·–²´‰ã‘Õød<çi#%•p\0‚ÄÆªrë}¿Ïüü‹Æá­eRî)+?Õ-ı{œ™ur-$‘¬/|9um²ÚHÖêô\"@Š¡Xª—şPNÙ@\0Ÿ „Ô¥£¹ñ•ğõ(ÿ\0[Ï¹‹â]~óKÔŞÒ{µKûy<ˆí¯uYäd\n’\"¬°Şw†|®Y‰W_45ÓQjë_—üëî9e~‡\'©´FÊc“µæ|©dx¢ûCºLNÆšÑ~}î0ew08Y6ÿ\0ğÿ\0¤5tiÃ©©2=Ìåáh	i%Ø=Ä\rçf ·<vÈ§k/Ìp	g5Ï¯ù“Ê­©ä>1Ñ!ÒuiZËkéÒğ”È#ÈÉˆ±Uù”ät¥sœ’+01A#vS¸î0¯5WÆj†1–ªàˆ±Š¤P‡¥PÄÆhÃqÔiæš§´Àoj\Zİ) ¨¡1×Ö f©q@ö¢äyG!éUaØm2„j…^:Ğ\'qÙ W@Ä=(\Zš\nĞ!ê{Ğ&\n0E+\0»€¥aXwXLP0 ”	SIĞ¤ñHiõ ìf€š‹Šã€ 7£5-ŠÆ÷‚´1âÚZ²$±«y¯´J‘Ú8MÇµ\\RêmFœªÍAu>ƒÒ¼]k¤è¶m§ZÉ-İíÄ¾UÅœi¶S–\Z`>ú‚Ï&~l\\ƒ‘MÑu%wĞû˜NX%İÿ\0Ù:‚jñØKq¦j‘y—ís¤«!a²OõŠÌ\0nUŞ2¿xN+•=R«¨Ûgu¦Imsœ»ô«(¤Iu@Z³+:å…7„b*p2Ià\0wésM¨xyôx˜\\ßYX-Ò*yW²|Š7˜¤²!Šä2¯*fè\0Ôsi±{èC¦X_Ü^ØG¦yºT:m¾b2A-š•s¸ v„™X8cÛòã­sTª¢ìzØL¬¹å¤­‹piqhúÁ¤Z\r×¬ğÜÜG•$‚6Â€ÊŠÛ\0U\0ª”Èé^m\\Lå›ÖÛU‡ËæàÕ(û©êÿ\0Ì|×¶şÓnî,í%f-%Üì¢1/•ä¤’É\Z»$›P°U5(â@Æ@–*xÇïİvş»wëµUÂûD“]~[éÕë¡ ’¦®Ús¨/­¯Í7o	{i§wÇæ+2o6â2Äà’%r*£R½ÖÚYu=&+Ù=_Êİwínv2/­½§jöb[g’ÖîkK[ë“êet‡ÍD¨¦Q1\\õt\0`\0:aËK–RòéÛ©ÇRI7JF»kçĞÓÑ|?¬jøfÏ^×¤Õ4»8lÓMÓ,\"h¢‘\"V‚FÄ˜ış×Œ)|Ş[\0(©­VçT£nfïóÔÇ\r†kÙN«MÅ{¿çèxn»%æ£¯^ı¤¢j7±È­\n±*È³É\'– `Æ@wÂÃo@}ÓMmÿ\0|~%Nx‰ÂMßn»•à¿‡:>‹¥WÅ¢ÛNµ@öö¢v·óäg`H\nÊÅu¼Ä¥N	axõñõ*KÙá»êÏV]NŠæÄöÑ~îéÑú øÓ¨ë\Z–‡¡ø2Ê/¢Eö;).J<ÑNC¬¥%l2cµÙ€-Øæ³0¾\"¼®ÿ\0\rzı}ÕŒpÔôOôÙù5İo±6¥àŸø‡XÓÄÚÆ¡>s²¦£néggò˜5wg(Ú6ÉêFÀUÆu„èÆ¡{ÛTÛ9¤«9ÊX©´š½Õ¾M/é˜º¯€õ?_nğL×ş%ğÕ¶/ÕÍË(K»ˆ\\\0¡ÁR¥äUw0n¤×E:ô´öË–o§S‡ÙT„%8|*ÖwÜÙÒüwá¿è:Wˆ´Ã«6—¼4aD?go»¼ c\"‡µãØ*Y˜×-J%.zs²wNë^¨í…XJ§Q|:¯•Ÿã»$‚/xÆçNO\nø[SÒ¬’áí¬eµ¹º¾Ã•ãÜÍ¶`<Îr¸	FEG.-Æ¤”›ééätSx˜5=“wõëwå÷“é|J¾]ÿ\0Œµµğß™ròŞ®©{ç^LZ(ÒŞWŒHıßÉ!ã+†Æ\rk<\\å¥ÛËC\Z4$¢œ´æ½¼û_µ¿á†\\xwáW‡¬–âóYÔ|W¼ÙXÚh§.é.ZP\0©*„áŒå¶0´åŠ©wnUç«ùœ¸‡EM(.nït½Ó|uÑíáğ¦‡e¡ÄÒ3È\'ã!Ø\\’|ŠAußó¹Ê²ïiSŸ;Û¢ÿ\03¦¦6”(¸ÒÛêÿ\0;~[œ×‚>İøµ-§†ÓR½_,Ü™b¶|´1²n‘¾éXŒ®>Vch?0µ1¥î¾†Tğ®\nI;o§¡èğ-Ş…¥˜!ŠY\"K›i®du”ÄÓ\"\'™ä‡\\0ùCo(Éó’>é5àb1q«+ÏGÓÍt>ã„†š¥Mß®ızšSiú~£}mcs§Z^Ï‹-³\\™ÌĞË#JVHZ-’o +şı°˜í\0‚9iÔ©B.QÖÿ\0ğŒM\Z8·WH¦›óßOŸ‘‡gá!¬£Ğ¬.u)%[h‹´ït-‘Y¡vUXòÊ\0ÚAP\"u8f¼+Ôœ­;[²Vß½LE,.Ÿfú½vísºğÿ\0†-<¢Zêş ¹ŞKb\ZİÄ‹qnÈX¹1ÍÃÍ±dÆÕãh\\Wö•ªÉS[ïòÿ\0#ÌÆbé{(Åì»Ù_ÍywĞ©i®iÚ­âx»^K¿ÛÙ˜“M[Ûm¶ìä	‚HƒÏ$f0<Æ@)<åºı•JKØaİÛ»oú×õ<Ÿm	Z­hŞöIy~_ŸğËÆ’k:ŸÄ¯İÇ%ÅğŞé`mˆÌ‘Ã8ˆ8™œ+˜ÄHX+µH<âŒfØÓoºmù²)W•8T”zíıXùã]ñ+ø›_:åõÌ×æîQ+ÊÌ”C(\0Bà(\0Œp}]\ZJe>v­GR¯;Z¶{¬¿³ç‚¼9á´›Wñ\\O:C4W¢î(Z×Ü‘¨Ë¡€bÀŒƒ´ƒòO9ÄU­ËJÒõğÇÕC,£J“”Ş¾Nß ¾»×|q¤XImñ#Á¥ã–Ş8.–ËSµ…L€´jÍ†eØ€pX(ùÉ«…ENº¨Ó¥+=ş(¯cÉ§İ«¹%ê/†ïu/éš-Ÿ‰5;sÂ\ZÂ¥´Z„öfl®£%`y«U$$Ş¹¬+BœêJ¦Z¤7]$ºúp›IG+©hí|º>…o\ZhCOÔOÛÒØ--7Û\\Âº¹•T:°I8umùÁxÎ8Åwáñ¯KšÏ©çVÃÚrŒãtûş~F\'ˆtÛíY.náºÔ&½>dĞ[E¨\\“\Zåö’‘\0~ê6EŒG•ÏHUôéV\\¶gËâ0ò£/.gªèš¥œ·0Iß”#ŒºÃ¤¨e`÷§j°Y7=OË­%uÆQ•­oÀàjÅ[FîÚâkf—Pâ™c}J\'T	.Ù|¶ó.fLsœ¸m˜Ö–›²×ĞÉê>âİ|Ae¨Zj6—Ep€ùÓ‹Ë¯-dIâÜÙ_õ±ÛIe£t›yªEE&¿AIsnxî£¥İé’Z^Á%½ÌXİˆTôÈ pA{\ZÅÚúÌ¨VÂÀŒ­*äl+A‘2U¦UÈØqT4 8¦=Ä4iäPxç®j‡`#\"‚†”Ğ	T4‚‰Ş€M0qH„ğ+Í<›\rª((¸ a@\\(\0 Bš&(ÛÅpQ@‡m®\0˜	hE¨\0Ğ@˜ b@\\p C€Í&ô¤€¨b¸ñÀ ,;mMÄ‡ôõ£rløkámü	5å¸K½{V‚\\!PÆÖ…AÔmf[,@Ç©ùd“Øú\\·	z/=Şßæz7…<5ŸŒ–÷k(µ€[YÜÇ$s\n)2Ìa»Î²8Ş2İ²P‘éFîï¸bk^Ê=›}M®|ÖÑí#ÓÒf¦EÈà—m¼ª¨!8RÉ€J…çÑ¾çFƒ\r­\\Z½öLše¡g–êéEÙC25–rÁ”*ã0Œæœ£vÍ#İ—õèhkv6o¨ÚØ	ôx,Ò+XwˆíË±e%œAˆ¤Œ#È»Š|Î8çÊ²µÏ ÂåÍ»ÕZWş»›:µËØRŞÀ\r,[¥½šÀÊÈêbŞŠİŒlÀ\rûĞØà)jógˆ…;+Şúÿ\0ÃŸUG[e5·M<—S›ıâ®§am\'Øí-#$Ü\\H`S.Ó±’WFR­¸¬À·\0i\rsò^Õ*«»ôş¯ı3Ş¦½Ÿîé+iª}÷¿ù]XéÓë¾%‡Ä35†¡éö×É§Í!;›ŠÊÒ\"dç+²\"º©îMzç§\njŠ¼¤Ú~Kúîx˜‡\nõ+:ÍÆ*)Úÿ\0jİŸİo˜ºV¨¾Ò|7ªk×V_–¶ÒÛ€’İ¥ˆŠ~êew)€*PŒmë~ÉÕ©5\r­u-×X|=:“vzoù|TÔn¡Ñ5í/P³ŸÃQé‹§Å»\"D\Z,BylÅŠ £JàÃ†‘ë{¢¾³	NN”’^[î¿àÄÛ+˜¼/©x‰YmbÓ¡KXàœ†k©‹(hä?|<(B£œŒ«g\0\\Ø.J•}“wı-ıj<Ó<,o¾Z;õóôè|×u«Ş¦»w¨É\"ß_;İOrÁŒ’ïıæXgsÎéŠúõÊ—,6·Èü÷ÚÊ5Üª·«wó>’ø‘­ø+âƒµß‰¤Ó,Ê½ä‘í‰rIwv‘~éq$†5trŒ6íÛ“ÃÇ„©>X]3ê«ı_BœÕã£õWìúút8}_Áß¬™¼e\Z\\f‘­@¹1(8\Z$J’12¯ÎJ±¾_»]Ë‹«ËKNÏó9åKB¤T¥ï$õïÙ>Ïs\'T²ğÇŠ<I‹£øçÆ>L’ZÛÀ×+ÎÛoyr:}Ğv8Â€Äàšs/~n1¾çã*ÉBrkgÛ¹Õëšnô˜³à˜´ë(ªéŞ%Õ§Ä/ò|ÉÜB«”åJåçÖç‡u9c6Ûê—êoQb]%\'dŸãnçMàh<Q£è2É‹<à†3Çåé°ØG!‡ÌW`ùFuW ãæó?›#†!Ò”õ§)t¿ è)Â“µVjşZôù~]¦ø?ÅšåÕÄºŸÆ½\ZÊ+œÚÇ¦i·?dŒÄ¤oŠ8£ÚC8ŞÛ—\rX:Ô©ÏmæôküxÆ”æåwÙ5ó}|›Ğ³§~Ç×i6‚?Í¡w#¥»¬\r‰DTwÁßµ—j–l…#æ¿´yuŒ,¼íoŸõwĞİaéÙª½{ëeÚİ»ìºš6Ÿ²¿„îìßÜø‡Rxì£ÅÄ¸‚÷\"ÆØŞ›cBA*Â©UäcmgW1¨¾¾ïêß=ËÃà©Û¢K¥õ¾½7~‰3¶àîƒ NÍáï	èó¤Ë;Ï¯pL¡‹(fÊvFYò†åB»s“Äñuê>fôôüü¾ãµR„ “–½×ŸEÒëşŞdÚ•§Š®ŞHmôsÃºzIm¶m=¬&µlIl_-‘£eÙóY¾PTnumbèÆ>÷¼¾íL%JI¹\'.Ú·Û[­W­‘Åj*ÖtÙí÷ÇÚòZ¸»Ÿ[ğ•Ìy†ßs0X‰fUd.r\0Vg •v§*tªM5ıàt)J).V£Ñi$¼û_æÎjOx½~ÔŞñ‚5¯±HQôè§’Ìc‹ïUå£Ú\\ç22éìğé5Rœ’ò<Ê•\'/}Ë]5§»B¾¬~2´·šh·Ñnç³t¶x\"H‰·\0óbË’Er²ÊìR5…:X(-y¶Û_ë¡ÕVU$ÕHÉ-^­ï§ŸO‘ÍxªÃDğıùºñÇˆ¥×üF¬Q4X¿ÑbBşô+·mPX…İñ‚¹oB¢Jd”#Í“Œß4µ}ûúuü´Ä\Zçˆ~:ëYÙùº/‡á•O“<òùRDd\nddÊPÇ)CA+ß4sRË©9MóJÛèİÿ\0@âë^É.É[ğÕş\'¨h×ºg…5ïø{ÃwVÑo’ä½µµÑkÁ9S0!aE*e`œB0Ä7Ëá¸Ô¯Juª§s¹ÍF·²_ºé¿¯â|óñsÁ66š€×ôwšF¼÷>SÃ*´pÎ­ ¸ˆz\0Á‚dòäô™~.U#ìjüQJş?ÍÆà•;U§ğ½Ÿõù_Äıvˆÿ\0¼)«l¹KkFû¡,×¬Ğ%âÇ\ZŒ3Bø 8]¬Œåk‡M`ëÕŒ·z®í>Åc?}Jœ¯ud¯Ù7‡¾x^ß@»\ZüWñ‘ökSN™®İ…İo4m¼£$ˆSYghóqxÚôë^œ$´Z|õéc×Áàa^\'-¥×^­º–n¼?ã\r&ÜZİÚÃñ\'Âw¬cy‰=ûE±Bc™HÚùÁÎÒwÅcí0µj*´ß²©Ó·ü1Ó^Œ%B^ôú[Ê×yámgLÒ¾éPê7Ú÷…uh,<Iyû›*gÎ!¸Ûl‘íÂÈÙ†ÆõéÕúÌªÑIM-c}üâ¿3\n5!\n<µ›¶­4µ]“l~±¡ÜèWés Yà‰‡™4ÉuÆê\0EÂ–yeA·º4MÈ\'¢zu’­{íÿ\0\rÖÇ-|4ª/cQÛ¯{Ãõ<çYğµ½åôVš}ıÃÃçy°YZj18K«…¸IeŸ*ÈOô}:—™¿Í~‡ÄÔƒŒÜ_C‘ºµ†Æ×qµ·ÓjÈ«<f$u‘AºË¨UÂçıa™nñ½íı~Fl†k2¯;½—‘,L¬Ó}‘¤Û\'>`cí–ÙÄ›×‰—5II>]ïó_ä\'«9ïhÏıŸØ²h\ZÑ–ÚVÂku`CXÈÌI7Íş÷eÇ+ó?ø¡…D“º82½¨0EFhŠ¤QqZ\"‘Vˆ¡”Êf€\ZF(\rPî6‚†M\r\rªP”\0Úv*Áš,IÑ•æØò†Ó\0 \0òs@\0\0P@\0(\0´\0´¬IÁ¦\0§šLdª*Hl=iˆz@( ¤Àp¤´\0ñPŒ‘Jà<\n±©á­>ßQÖí¢¼Wk$&k„N¯\ZŒ”ï/ü\n´§¹µ\Z~Ú¤`}	á’ÊúK[³\r¤÷Šnnà[°JB2Â ç\"5ùd$WHÎÑ‡;æ}­ÄÕT)û(Fµ­Î-£±‚ââyz;şñã%”ıÔQB† 	İ¸·=Q‹oVxmßSÎ¯.¯µëh®­¦«™\'RY.RSå¢åä!B£2„Ç%F@êmGrá	M¨ÇVuş€X]ÜµÃµõÎsm²ŞÖI•<¹%ØŞbÍ!RÛŠ>ì\r¼mä\'ˆÑtZıëSëp#|ÚÉ~Óó&ñæ§kß‹˜–ây£h¢²ÊïOİºÎªÅz‚Azg!‰ÍyÄ}aÆ4–;ßò>£€%)ÖİKúÿ\0†<ÿ\0Çš«Yx~Şãì‡S¼ºv½Ú+pÈ‘ ‰Ã:H¤2«yƒ‚$e$îÅ^Œe9?†Ú?™èæ5¾«Jş+¦×ÈîF™ö;É½¾¦/v®#ŠÛËÔ\0P¤È3²â4™2Hµ‹´”LdÔ ªJËU×K3™»ğN™âŸZŞGFy4÷âeaj÷M/Ê¨ìwA–hİUÎÒK\0q‚qU)Ópzkø<¥eY¤ãËÓïâía´­oOÕl,.5™,î.¦–Ûìm$·[4›æÂ€’D/Í€%p~c®sS©N£å½ºígÓÔâÍ=§´£V’»Mém5KWı\\èôíúïÆú­r±\\k\Zì—’>— ‰Z(Ê¤2[‚|¹ãF\"B²db4\'&¦x„¡ìãöV¤ÒÀª~ıÓækÏNËóÔöW“L°‰tÕ>qµ·\"¶–1p²\r‘úË	la#v\0I¯‹—<jÔvM»ÿ\0À±ÓWšµ9Ó§åÓÉ¯\'´¼ş|ç¦ü	ñˆüw.£­ê:åœ®ešå¯äŒŞ«!Ú›ç‡fÕ\\°*¡B‚@Èû)g8zPŒ)-zvÿ\0‡>>–IZµIJr¶½V·ôÿ\0#:×àº´Û-RòĞ[˜ háE\"êú)¢UfHØ~ì~õœìƒ¹IÀ\0«˜¯bÚNşz[üÂ\\§UJşîİï÷‘éŞ$ğ‡ÃÏx~MsZğæë$5½£mƒÌ±²Æ Œ¶\'Rb\0’ø;K7`~ŠÆâ§ËM´»ÛK_qîâ°Ø\\<T¥¯/£»ÿ\0æ†Ûi^(×ìä¿´’O„ŞºQ¢ÅlËq¨JJF¢‚14¬wp \\î&»Ÿ°¤Ò©ïÍwz|™ŒiÖ©f·¶‹t›·½Ù¿ì¿£h÷a®ü#â_L?yöFöÛF‰d;FÂ’“É\"Eœg€I¬aŒÄTwŒyW¥¿]§…ÂÁ%ícuë-=V—ßC¤²ø¢ëwb/†ºå®ÿ\02X´Ÿ[>`îx³\Z·ŞY=Gıgïuëo¿üË­KiQ^ÚŞ×µ»é¾›™—³æ‘áËYşÉ}®ø7R[i$‚OH †efc2í²TıÌÇ€ÿ\0u]µ´±µSJ®‹ïş¬E<-)Aº	NÏì¶ÚÓM¼Ö‡â…8ğ%ŸÍ©é’ùp-ÿ\0†ä7ğÙ5NÜÄªQÊÆ¤7nry ú4*Ğ«.egò¿õ©çbaRQ•$š“»÷½×n¶O¥Dğ‡ô[?„ÃVÓtkÿ\0\Z_ÜJe»‹HÔŸÏ>dØ„eY36ÅT6W‘‰œêVäk–7³ôóÿ\0;[±êPÿ\0g…“µ•ÕÖşîûjÜ}‡^†÷Føm¨x’×<-=¤jÏ[½ûY·PUwµ«27HÉ1;U8+·\ZÒå©WÙM_góVé×ÕŞıO;QÓiÅ÷‹·gçÑ÷·]š,>4øÃA×cMfá—ìbÖ[}F5eŒ®Ñ¹I61\r„ãnĞIV {50XzÑm­|¿­\nxŠÔ*%‡·õ×®·=“á§ÄxŠÃSÕµ[Ï\rEá™åk:ÃTSc\0°)›‚®yo#ùŸ>qÀãæñ¸\\5ZTÓæZè®—ÈôéW«\'*Õ–ßğWò±a½]9tı^ÒÆòÊ[ôx´o[ˆæ‘ŒXZêQ·›‚€<˜fÚ3»$\Z£=^®öŞ.ëç×¹œã8Î6VßÏ[é×ÓcÏµßøfÏ_½‡Äßï´u¹b±Káùd½³™˜ùÍ,i\nˆ÷\"Úå„fXòÃW¥\Z•êÂØzŠVŞë_ëS%\Ztß5hY=c²ëİêô+ø{]øu¤êV÷:O„õë›«C¦[É~Ñ²/İ¯Ú¯òÂ3¡ó—ˆ€Ê$])âj+)¤Ÿmÿ\0Ëî2…Jqø£­ôÓD½7Ñk¼Sâ-.ŞçÃş¹ûŠÜ¡º±¸¸’Õš)]Z\'ÆÑ˜Ò=¤0L|¡nHe´¢ùêÎöŞÖòîüˆX©Ç÷tî›¿^šô^¦Â\nÏá‹x÷ÅM{ı££îã€ÆgšŠ„NÌ›£Ï–¦0ŒI7lòÀÌâq\n¬éá°ö’º½¿.Æ´è<59Õ¨ùdÓµİ¿à²„Zü,\0kzO‰-„Ú<s¥ä	7šZ€ìÄiTHâ¾ò>VóÇÊ1Í˜Ia±Q«EûİlºÁ:0ªU0Ê–É¿Å]ıú#’ğï€uÿ\0øƒWğgˆ® ³ÒõøÕï¦xÚØKÌp\\å˜1HÜ°\n’X	Æ{«W£^ÄRø¡gçn©üŒ¨QJ›Ö.ı/¯uù\\îäñ+ê^‡Ä·Úë¼5}5ÂÈ–÷Ñ)UšÄI°¢ù€©YYC‰W#nxò•MĞ·¹SŞ]lûÿ\0™Ôê4ãU_š\Zv½¾cMÖ¯Ÿ¦ø»Á‹slo´Ks)i¦1±Ym¤%Èr|Àßy£BÊ”éÂNË·æ½Ù«]âpÎTlŞš>ºõ~¶ş&Ëg¤ÚÛëÓZÇa©é8hlµ¤™‚Ï˜ğ$\r:Íßt³ÆÊÄ)ÁÔÃË–r¼Uù^î?ğû3:”aR<Ñ×«»²Ó¥–ç;áMmµùõßÍ=Ñ×´˜iÓêp¨¿º´FmĞ\\aÈ2 À;@ÉHßŒf½\nğXyÂ¼~\n›Ûdûù&yTdêÂT\'¬£ª¾švóe{}ŞK+iÏnx¾Ñöa\Z³Êò–y`v@3±Ø%ˆÛ2×£í¹,Ÿëò[ÿ\0_#ÆÄa!9[Ş_ü‹ñ¥¤ú¬°V²Ê±¢Búk\"©U˜#Ä›\\—9`77\\äzª7ÿ\0™ó²ÊişJİ\\­œ­o2,–’ä3Gå…XÜ8*ÏŒ¡Ën\0lôÚM_šÏÖßŸõ¹›² ›I[¸$³ÂIi+Ã¦»v‰YR9G ÉHˆø¸UNŞ~¦\\Êı1ºµ’Öya~ö6*ÿ\0PpZÁ»êg¡ÉCÅ#qTŠ jÑˆ˜U¢Ãôª†€ğ) 8æ˜\rÅ#­440ŒU(\r\06©áLGDzW˜yCq@\0\0‚€€\0 Û@]\r\0ÚóÉ \0@\r<Ğ”T°%^´‰{\0 \0q@Ğ¢“9jDH£šBè<-EÅq@¤Q Û|;Ó­//u!&Åµ¤ƒs(eb«»I>ÍøV°Œ¯tO©º“Ù²<G>‚Ú¥¾ì¢H!ó+J&Ú ³„D;ãPÛ·#n{µz•êTudäÈ¯/tİêéndŒAšX!k•7º\0Ä(’5Ü7m}æÎåQV•ÅÛ²*ø@\\\\j3Cu •ÄñÚÆZÒui\Z|¬Û‚©h‚†1óq»%€®<]esO•àe:–{¿ÀèußYèÒß{‘»V33ÜŞ´d´M¿h$…\r\Z+\rÀfìÕóªrÄIKùz¢ĞÁB„^Ï®Ç2·zåÌ÷Ú›İÜÏ$\r$÷,ìŞl›ÖMÆG.™Ü‡vF7n|Õ´”aëOëğ:¡áËMY%m<¿SK¹í¯a°µÒF£u¬éw:,Ff\r)acg—!|2c€3^*J1u¬“RõÓcÀÇÖ•ZÊ‹Ü“¦«SÒgñdğîa¢Û6µâ_È$ŠÒ9çhŞ\0J<»Ø–H[åİµÛ\"<:?¬Õœê>XGKùïoS\\Âq¥Q£ïJM]?.¥­bîæáu¼N¶ú¥ÀK$·gFS~ğÀ3£;.|è¨²|¤s—*kØ¶ãç¿37ÁsÙÆ¤l“ÛËËò9vñˆ·Õí­ôÍ>[©n¯^Òæ{9dšÏ-Ú!‘Î˜ğ¬¬~e,1œWU<,äœ›Ùh¼´¹u1Œá\'g+=´Oş¹kru;É ºt	q+Íj±²G–ò3K,‰ó6òñ³g¸¬î’º6q»özßËKÛ¯cOÂ’I¤YÏ«kÚÿ\0ö&¬PÛ<‹µÄÅÕüÈ× ,{Âä)Ü»\\3êÇÚµJŒS{¾Ë§üŠuaJõª^ïEıwòznqŞ=ñWüe­è–6\r.]m˜G ÛÜy÷+…Yi2JBªyrs—ÛŒ±ôpØl-\ZRœµk¯è—Sçq¬]Jğ„=Ûêí¥­Õö7th4Ï‡ŠïEçZñ†»í»¼ŠXÿ\0´%Vpóù¹-ÜrpehĞ(!±\\c<eVª>ZqéÛËÎOğ=\Z3xx(Ñ…äÓ×~»·Ğè¼!ğ²Ş/ÛK¨é7^:ø™3Ü\\ÛXÆ\"]2F\nÊÁˆ­cd³íR!’F²Ä:°”).ZqûÙÍì#†œg7ynßO›ü—Ş{%Î¬[ø®×S¹ñv—¡#»ÿ\0Ä¯Ã×­Äòc2Æ÷W!e,K¡*Ï°\\‘^g<½šTiùß·}öùübœ¨ÇŸënİ\Z²·MÖJıÆ_èµ(ÅÅÆ‡g­åŠKSR{‰ßgıÔ±’EMÊ§ıf9Üêk²ŒªõV]6óùoÜã©6ß,%®®VâôOEÕjÏ6×<£¼ĞÉá+ÛÏ\ré;à¸—ûFº·}²4fDlC33C0Î×F\\çÖ„“…ªGSÌ­:Ôê|Mµü·ÛÕèşZ¹ámbò×áùÒüA~ÓëÒÇ-¯ÛRCØ¸–Hãi‡ÊÌCªlx²73&\n£×“:Q¦ÛKNWÛúûÎÚ.UåÆÑÕ^ö×Ò×[^éú­l^ğ…¼º¿¿·vy\\¯ïWxäˆ™\ZR“D‰ˆó›åøÄ`ã“^EE[•ôÓ¥ÿ\0-÷=õz©9tox§uİjßNÊú¾Å/‰~Öµ&ÿ\0şk^D•dš\'†â&eóUÚhN×ì/¹wNíÀÖÔ+ATj¢ºZ>º-JVŒyçgkÅ_ÎÖ¶ë¯õsäO‰Ú¯šYtÿ\0ë:İºC)”Ûj¦_-÷®ÒÙa–%6ÿ\0ÛÔq_i…xy^Tcv|¾&…U$êl–Ÿ~Ç¥é?¼l.î Õõ‹Ë•Q%Î‚ës´ş@2ğªAXÀld|Ù+æ`xÕ1µİYF6I<$yT}ôî—™7‹/`øQám#MÔôãã¿‡\Z¸ˆØ=ë˜n,’8CeTÇÜY°ep~hÅ*qúÜå:O–¢ß³2«\'FÑšµ¿/ë©±ˆ>[øSĞ¿µon|;yûË[û¢÷–b$ó(ò”c7\r\"fF^¼³çºxÏ¬B´cïz}íúô.JŸ$¹öİùôJ7í×cÆ¾ê¿_ìê‘ÜÚéNeƒM¹ŸÊ·X÷2¤à1VÚ¯(}«‡£“^ö:*kÛW\\·İùù¯‘Áöõ¥ì©ûÍl¬Ÿ“×¡ßø¯ö‰†m_ğŞ³àı`[ÍÑZÈ©-¶ø¤XşÏ©HÑËB›Ø`– –áÃå©µ8ÍJ+këò;«âeMrY«ïİôÖ]½44å×¼AªËµ |UÑõ;ÇxD7º|i,JŞPÉküğ¬|¯İ™/TáI7\Z´^Ÿ=w2;Œa	´Ò{mÿ\0=_æaÏğkÄ^+Ôå—Å¾/;î\"hí\"Ó‹\\I±œ¹x#\0*¯Êd\nåÜ¨å›	æ°ğŒhCEò:èá\'¥FÛïoÎOgØë¼uàjÏÀ6:_‚c›M–Ùå’H-®¾Æ×º%Œj¥˜»È	# nÆÛ^&OëS©ŠÕ=®¶ò±íã(Ê¦\Z\n‹Zomwï\'oÀóø÷á}Åzv­q¦Ioöf³}¾[¤j%.À‡“2/<¿$}$°Ø|O-\\,’w¾Ÿv§Í*ò‚”kÅIÚ×»éèz‡ƒõ\rÅÚ`×¬Õä±ÖcÓ¥åìï!DÛ—:‡•2¿6H|o$l|Ş2µjı”åªÛúóì}>N­R”tİızXñÄ×ß\0ü¬iš†™=Ö—5Â\\5ª©ıê£‚æã†UQóœÁÁèkè§‡†eFbí+Zû«Ë9Å+¦ôØí¼Is¤|G°¸ñƒyûË;µÔ4‚¬†Û\nZ1ò7#9e€\0€<ØF¶	ªÖèú4z4],g4é´µï¸©â·Ä+ÙnÖd°ñÕK«=BĞGªF°pB±º„bÄîI#qM(VXHû*šÑ––gşò5«Aâÿ\0}GJ‘}·älÛßÅã*ëU¶·J×ì]WJ¶¿¾Y$El“ş¬¸by†Äù*¥Ñ“ÃKÙT•àşëÓúïærbaí¢¥nºéçØá<]«Oy\0•õ	&IPc¾¶„‹w\n0áNØÀÀÈf `²î$c£M¸ÇO½Ÿ\'‹U9ŸSÏyš­â¯—s5»4…n-´ç‰6‰›æ*ù\0´¤79\nÌxk}ËìYÚßçı^g•-z‘Ås\rõ»Û®ŸjRÔ:¼¿Ù‘yÿ\0/\npÎ›hRx$´“ F*eèşğÓ¶ç%ñÀÛj±İˆ$·Šò?5Rh^ÈÙÁû¬@$`ç•Â’WK¡Ë(œ£pMQ™t \\õª[ˆ^­ˆÚ´E¢<U1@ÜĞ1T\0FE¸ÃÇh(oz±  P1´\0Ò(¸*ÀèOzó(?…\0&3@1@(phE\0-\n4õ Ñ\n´	 B´\0õ©Øzıê–K„š`À hl‘EC% H¿2š–K)\"£;E,äáTIíŠa¹êÒi±èZ­œÌ’·‡¬WÆZ57R, 0.­å€22ÀsÚ»è?rıÏnpT£%ªZn—\rŞ±¯YYÜYaçˆ+ypm28Ø²LFB”s‚VÂ&º,f\rNãí;¡Ò/C‹ËWŠÚêÙ>Çv‘ùn\ZKrŠ#`Dk¸.@ÎI5ÏRª‚¼‹sßÀáMz¿Á¡wdº³Cb®Š¯y,`JòL\'ÌSÌU	ØsµÆß›šğêMÕiÏn‹úûÏĞğ_giuO^¿ğNÆ\ZÖ‹áyšŞv²\'Ê6ÊÓ\\¯”$h‹²«+#!Îgf:í öa)Æuo/Ó±Y•yĞÃËÙ»;«>›ùîTğŞi¢ø•4½6kk«\'[{¹u\0Ò%½¥Ä‰ •‘7°ˆ°$«¼‘Ö¶®åR´”lõù«èõû?ËOéÓ|Ñjÿ\07¿¥í¡èúfoâ¥…âH.®¯£Òfrƒí13Ë˜İcû³(Ea*q\"†\0W“:•aM$öLúZê$·×¯›ôµ¿}_Ç6^/ñô¶—=«YXÚ[ç­ŒD>Mùİ’¤±“»wŞÉ×£IÓÁ§²Râgƒ“ªçŒòmGü>^¤—7n¶-¬¡--ÊÜ™­¤a	OîÖ2ûww*6Á™GTİ:šGÈ÷-h]=µş¿­L->ÖoxoDÓnƒÁc÷7ÑZEl¯y©\\nÀ\0nšLÄœâ\"OLWTç\n5\'8»É«7Ñ.Ç•<ëBŸ´‰·nşoúÔô?I£xNˆkË/“5ÄÂ×JÓå>lÀ…ğ9 Åµ™„ˆ7“‚\0¯?âdÔU’µßE¯ãs§Xv:ßï¿[œ¯ŠµÙ5‹Yõøí]¶¶f³ğ “ÉÓ<=ÙğdB§%‰v\'yÁí¡5OH=åÖO²íò>v½k¨ÔzÎ:jö^äXğÍ§ö˜ÔM– /Rò9uSS¸¡şÙ@ØUG˜–kÕ\"?4ùÁR˜:õ]4—-šÑ%Óş~Ş§v	\ZÏWtîÛ}QÚÅ¡éº]¶±<š£øoKš‚}~âÔ¬Ópò,;î”ÀŸ!Œ\'R\0©¥NO–SW×Dk^Q…ãeßwÓäpÚ¯ícá_‡Sê\Z†ô¥Öfy#2Ah –\0Å‘€sû×ËïÉl’ãŒ0Sª¯-Ÿùv#3§F+™«ìôÖÏw½‡ŸIûcø²tµ†ßDÒ-ü˜#³Y¯›9Ù\nÅÇ£mAÏ\'§÷EwK·Rw<êx©5(ò$Ÿ¯¯æ7ş\ZÛâuõû\\ØmC…•a†Ïìr¥C.~è0¢äv\\u¬jPVVwW×úîwĞœäå-ZÑÙuîK¥~Ó>6û$ÿ\0mÕ%,¶ÆœÍ¼+‡Sö™2H\n¡‡uÊT›iS×ŸoÕÔ„#)TVv]½W–‰úy¢Ï‡ÿ\0nÿ\0ZK0¾–Úâ2èË¶.&dhJ9áÛFqŒÒdüÇ=“ÁM¥®»ßĞò!šÓ¼¹£¦¶·wşIßåc¯ø}ÿ\0³‚u‡ZğÌú\\f?\'í\Z-Ë+d\nÍ†V8XâNv6AßSSU+ÂWòz\ne‡©\'í¢×š×ğ~¯ú±éŞı·~êI9»ÕgÑJÏöÕû}ª¼‘H<±HÁGú¼±O˜íNÍ©€ªÕœ/×F·;>¹†vq©®Ú©lîßWóõ¿Dz$¾$ğ¿ÅŸé¦ŞãMñ¤—‚F\\^$*Êİm%·6ß*C†1µÀ{ÃÊ›~Íò·òüRŒ “m]YÙ«k~í_ñ^}\nv¿	&Òìá¶ğ§Šn|}m-›qyqu§b}‚8ü™Fø¤F’2î;1¤å9©}bõOM>bu¨Sœ=š³WëçªvwùçÅ†_<A¡B·öºV¹7QbßO¸CpdHÊîUs¹÷Á\'ËE8Éáá«á0ÍÉ»_K¿ÈÂ¼)û:mm²õ¹_á¤š·ÂÙ<.³ñ\rüsLeÑuyD¨–uy¼ä‘Umğ×T¦k\\¹q1«í,»­Rõ^lqÃNåÍ¶OOËÊİ_ê`èÚÁéŞ#ÒfÔ,¼\'­ÛV¹½µV¸´“{4JNıÑ€P9YPcfPÄ•§W0¤éKYAßF¬Í©B*ÍÛ—™%­îµ³WÙ~7/|UÑîï>êŞ\"ñ\r­iiçÛêpGbê&12an,eŠ:ä”<®êÓ-¯Ë‰Q£”ÍíİœÅJrÒÉ]_îù8Ú=¬·—qG0Xí„0G‰Xdşõ2`›gÜ6¡÷(NkìÚ³êx-Ú^ëÛnºXšÓÆÚµ„·1Xj76®Z˜ÄÆ5¹™rÄÉü,N\\p	ÈÏZÉá¨É\'8¦SÄâÜn×®¿3wMøÑãgÑ®l%Öd½k‚Í$I$›Ë)ÎàCîÎî@1Ôyï+Â9sB¿k«‡ö–-Ç’£»K¶ß#ÒÓÄ×ú>áÍ;ÇúF™«x{^€Ä5VE{ˆQ£\0‰~ÌJå+· ñà{\ZNs–\\²†ñÜöœë8Ãëwå’Ód¯òüM›\r7DğÍ‘5Üšß†5Iml´™\"A’$‘‡ué»nõ$d`sÎ|Ú’\"¯<`Ôã¬º^gµI,=>J’\\¯m[ÓÑ=øÓÅz†·ao£jûbúÛQ•bÕ!>[ºà¦Â>áL `v†œõÅ}¾„ H+)%éÜø¬]YÉ¨o«éoÌè~__iş/°0 :Ä×$Æ%’8Àv/¸ğ‹ìF0aô®lÎ0«BO¬u_ğ?#lºR£ˆº=õKn¾G¡Mm%¿‰î¢şĞ‚Úîæ‚æÒ{ß.y\'ï+J_6òÀà|àîÉçåİ^z	N7[Şßƒlû¯eË[ÚÂVMZÍİşïˆâº¶ÕÅ¬^Îÿ\0Bu¶ñÆ\"±_i’>ß:6fÆè™cºáCç€O6§<%‡ß™^=Ô¼ü»w0ÆR9F¯Ã¿Eo.·¾şGœøûf‹ªÍö«¡¶ÒæA$’Éc\0ås*»	Á2\0\0Fä?(`Òå²UcÌ–úu{%Ç¾çÁçTİÆ›ùiÑo©G-šZGp‘»É¿Îi…œùhUw)ıäa¢$T‘¼çèÏñgÍ4_Ó4¥»½’+ˆ%Ô\"‰İ¶££G0Œ€«óğ\n¹‚d‘£`–Å²UØ©&•ã×³ş¿á…}Ì/Im}á¤Ksß8]ÄÊfŸ1…o’EÃ9*å˜7%\\ŒãŠÓ^ôŒj¥ĞóvâƒšÄlx H‰3VŠDG½hŠ#~¥R)\rëT1§\0‡¥\00Õ\0”6ˆ@&š\ZÕC\ZF((6“Îh +Ï<Ë¡ ”)é@u@Àu Cè\0 4\0@Yé@… ­è=EI,QÖ‡šÂã­$!Í1 U4™D©PÌØú”’>©`É1@Ãq>µc¡‰nä”,-3m@ı‹¸ª¯ïlkI^i#Ñmæ»½Eå[Ëù×í·ó,7LÌL¯´‚FÒ °î\rz‘¶–=|Gq=ä>³º[Û{,)ÔŸj‘.£û¬„g;€*F7mÜÊ\0Àº3¯IÔ•ÚÑì¯ŸMµûN#²Õnd\\¼´Tr 	7Jgœ’±û¾<j³U\'o²»[øè¹vİöYüö9Æ‚H ¸ˆù)µ·7I\'•óù‡rMµÔÊpÇa8!‚’q¿W·õÚçÒò4œb¬×NßÜøjŞÿ\0C[„¶¶Îc2y‘İÀ%¶»gŒ”a¿©ÁsœãhÕ•)óï÷õ(GKÙIyÛ_ëNƒt]>çáw‡®æŞ­Yÿ\0¤nYyù&…„¼’œƒçSë•\"ŞˆÂ•åxyA{ÒßE».YéğãMñÈ¾7·šE¥Ä«|`vódò£€(•_¦y™lNß\'9ç¤Ö*té¨Û™ÚŞJïúõ8îğ¸Jµ%+èõîŞŸ±ğâjÅk¦ø+ûÎ4Ø$TºK’‘¶İ¬K‚ACÎ7dàrNoƒŒ$ñJ[µ¡æäøÙT§õ6µK}íò;ï\rø[:Œ7wäI\Z´1_Ë*ùŒLŠĞ>ó±XF?xw)#kå²<©×¾[ş¿Ö§ÕÓ—³ŠrŞ×õò×MŒ-Kâvƒ¤>ÛÀújëúõûŞ%µ¼,fÔåpägÌ‹%rŒ\r«“Á vRÀT—3Å>X«>+2ZF•¤õôùù-7O¹“B×õJâîÛYñ}¢E>§|Ç}‹(Â.\'Êª2Æ‚_i<±ô*Â3„h¨òÓ{/µ/7Ùy¾‡ƒN¬İiV”¯.¯¢ôó3ç½mSQk;»—µ¼™âhõH¾×:ˆ“+%Úî!r6i…$‚ÇŠÚŒ9`¥ºšmè»ß¬Œj[Ú8í}Zünüû/¼î<eñoDøqc¤Ç¤\\İ¶¡b<:D¨;\\†\0ŞŞ:œ<íˆÇ·æÙµ²£…r›”ºõè—dz“ÅÆ…?{}=Õ»õì|¯ãßŠ:ßŞEÔn‹Æğ[ \0ò\0¨»8Aœ‘º½êxRˆùLn>¦&o™ÿ\0•¿®¥ß|?ºÔ´Í^ã0£‚#šãåWÊ%+#ü„&ø÷³0U.ŠIf\0c‰©ÈÔRş¿¯™¾_F5eï´Ÿ›KOŸõĞ[Í2ßHx¬mí¢½ºT\'eÌj9ó\n±Û´\0pOË“¸TÒ‚ö—“v^Gmy,=HÒ®İWù~Œ;Ÿ[[¬ohZIÈ_1º²Ÿ›9cÜîÁÇ]ŠÄç5¼i9|[u\\t)»Ózù_™‰ªk·wĞGlO•\n™œ1ÎKÓ¯aÀô­áF0|Éjyuq*®Y=´ë6Ì²!`Øã¨¦JÙœ¶H¬lš	Ìdr¡‡OJE$3s¼<œ`}ıÿ\0\n-qó_sWM×µ-\næ;Í6öâÂPAZ¾Ã0xàUO=ÔÀÖs§\ZŠÓW:)×©EóSvg±øSöÁñç†ì>Ç{|¾ ¶Òù>f…H0Ã‘•ùwuÅpKN÷‡»ıv=fU9y*%/6¬şô{ÿ\0Ã_ÚçÂ·ú6‘¥,·¾Õm$v†Ñ%\"İ›zâóŸ$	$>cÀ*´À\0\0#ÄÅeÓ“÷£{õZtì{ø\\ÇÛtß+¶ÒZ|ú_Õt=Æş-o$rGqoâ\r2ÚâH£XÔ\\@²¼p’ãaŠâ7’&²¯ïòÆ\"ÇËXXÒ-\r4K_Õôj)TO´›wZê÷[ü?Ö†OÅ[KŠ¾±°›W²}RÍÒîÒç[ÔEÎÓ\\²F¾bÚc”+†\nrÛ³\\ø)ıGç%îÏGm—Ëõ.…<F–•ï¥£Mëäÿ\0#Æ­~üFÖCEÿ\0î³:[´Q<2ÈåU|ÍÛ\nò	G™•şøÀÀjú_í-5u%òÿ\0†<)`ª·j­/Ÿõ¹½¤~Îº×˜—\Z±¡§Í.ÏôÏ0J7ÊBR’);\n•Èûª**æ”bµ¿B©`ç7$—3^^×ŞOÀM/_œÛCâØ¤Ô-â)Qí@vØ`Û¥“t‘’8Ù°q¾0™|ºålà”ågù™êÿ\0fJîœ·Wóë®Šıÿ\0Äßõ6ÆîîÆò×Ä‰´—WWÑ>ešDb®±¡#~ÅBÄ®K*¶\0ÁUÚ†kN¬í5ËÛÓ¦¿q|¦té¯gª}÷û•ìwj7Ş9øQ£è¥>Ñ¥\Z{$·aæÓ¯m i­$€Ç™³&ÓÀbÀĞxü°Ãc]e=y–f¥ºù^çel/#…ÓWºMµm¾óÎ|5¬›‚º”‘ÚÙê?Ø\Zå¥übWÉä;oÆSn[Ë+‘ò»Œç¯«V„a˜ÆI´å—]J5¥<ƒWQŸF“ô]Î£Ç^ğß‡>!Gâ¯i·§ë»r×D±İ¶]æ–8Îé\",Fò§‚ƒÉX`ªÕ«AĞ…ıİ=Rè½:9…\ZT*ªòIóo­ÚùluÚ\'‹|©êğËáë]ßP¶Ï{f³¸$-’SÌèp	È+˜3Ñ¸14±p¦İg£Úİö4Ãº5k*po›[¾T•­ınsş%Önt[ıR;inÒ{‹¿±ØÁG\\LÒG˜).ŒÉ½	<n\0psSG\Zğ„EÖú-u×ï=šØ§†Œ«Kg¢µ¼´Ó¡êRxOñg„lïõ0‹	W³Ô­¥ufb–Œåç€Á‰Ù\")&¾jt§†Ä8CY-W›ŞéĞ|ô=èÙIzÛKYÉöêy&¥á»··Ñà½¹Xoí&{ioŞ¹k¡jÁc—d€™™âh›h#vòr©OØák¨JR†ÎÎİ¯¯àî|>gAÕ›»Zi}~}O3Õ49`Ô®,¾Ï{´‡..4$IWï+“rn@AÉÇE\"¾Šœ¹ãÏúŸôĞÇÖ,ì qÈ²¶’å¶7Ûí§ÁØ¥ä\n;™Îò\nöÌ3¹ÔSƒ“º¶‹Óúÿ\0‡3­qöZ­µä’Á4™³Eoª´ÁÙıDË³…l1f1>Ş¢²;jßàe+ËÈó=VÂM7P¹´˜b[y\Z\'H=;v&²ZêG¡A…J°#nµC±U”4w«(ië@	@\r<Õ\0”6˜\r=hCB*†\0Ö€œvª¢Åyg!4Æ·™l1š!â€t  &€H2\r° ~t˜…ÛI\0m¡€¸¤ PR(áÚ1İªQ#i²à1Hô©d²QƒPHôÒ(“¤’æ“3ÛjV’£u•pON¸æ´¬Ò›å’g²èÑÃ:\"LéV57GŸ3j`€@ÜHğ2OëÔÙ‚»×©fæF×¼K§¤{ßLŒ/›¥+O\Z»ül	ë‘7ü£#inI&¸+Õµ7ß¡õø%¬’¿r+ıIüaÍÕ”²Nï#,Ë,25¸D‚l2DòG“ÀqpC`2‘Ä¿rıı¼õõóü-sì¡Óå„¬ú­S·—êY¾¶ÔÉsp$´·8g‚ñd‰â%Y~K…,C§”Ø,vïÁ©Æ›q]|¶û¼Ï[Û*Ü¯í-{]×åğ¥ºfEpºÒYï‚ÆÑD¯¼a9SÍ‡rğv\0y\'=´(º÷çønşût8±xÅ…V³v_+õò4üS¦Iw¤Ë¥YMny˜moT«Y9óÔçu«’ 2¸çµeN^ÆJrÛ·_ø?™Ñ]}j”éÅÙ÷é§S_D‡MƒÃ:‰Ôm..-şÇ4—QÍ¶H’áwJLñgå—vı¸ù]YH#Ÿß©Z3¦íï+z>ŞDâÕ:XISš_©÷İ~&WÃOxÁöÓÏ¨ÛÚé6—¶Ñí­EÃıÕ!k‹ƒ+‘öˆØQæ½\\v#‰åŠ¼œ^Ë¾ßr>G/ÃWÁEÊi%5{ş:y™Ú¶«âoŸ5µšXô$P°:7“§Y†¦tÈbï\'9,îxô>Ë\r”a¹ªk\'÷·ÿ\0\0á„ñyÕ{AÚ)­ú/?SOR{êÒø;Ã)4Ú…ÚKg«jR¢O%¥šÈIBWä#€ì3…\'¾+†­R/ˆ~îœ±Úíş¨õ+S¡NQÃÑ¤¯Í5Ñvùœä^$²Ñ4¨!°°ŠâàÏ,ú]š¶ècaµË«)y¤%€GbŒF«Ë·F¦*^ô¬¾ÓëşÙ~=ßCÎ†\"kr«¾Ÿü—™Nÿ\0ÆRxC¾µ³s7ˆnßÍÔuA†Y·İø°Êç$¸ûV’Ò+dŸ°‹–õ­ô^‡k2\\]İÜZÎêòÇş²W*Å¤8ÇÌ£äp8àÒ½JpQ\\ÖĞğ+T•iòÃïÿ\03Jğ-´+ Õn~Çr±—Do‰O,3\0«æÌ6ª©ghsìR¡ËîÊ6oÒÚüÎÿ\0Ä+Ó¼ğîÊÂ+ˆîï¯Òå`KWV0ÆO-c‘p±«…0¨2É‚ˆ•MT¯ˆæJÉyÿ\0–ş<f­ZT0ŞÍêÚµ¬µk¯tÿ\0­Oû}ôÍ$M$­Ë·˜|Ì…¹RİÆ{t8¯iF)Üù—Zn-ÚèRXj—6l£%YIÆ\0ÁÏÖªæj\"éºº˜‡b!g˜Àßï™üÀ¥rùntZ_…&ºĞ<ø“;ãfçiÀÈ?ğ5uÇµ&ÁFä×ë£z’WËŞqë2;óŠ\nåĞådğÃÇoz÷¢Lk³¸Àeo¡SÇÒ¨—À4wŸEŠLË\'–G¾qş®4Œû1Ò8[i¸üFÔ[›ğÊ@?.ëJå%¹×x;âç‰>\\Â4ë­ÖÑ±YLIŠA‡x!“‰e)óõ9®YáéÍ5%¹ÙOR›Vw·}¯ş|}±ñÎŸw.“¨É¤ê¿dvm\"Y`bwº‘r±8f¼leYC\"y‰»æñ%Mµ=WüÜ§ˆUœe\'§_Ã¿ävÖw:¿et.¼9â;{{5Ü?„´>âÿ\0=»³<J¤•åÚ2Èëò¢¾~xXÓ~ãMë¤¬}qm{³W½ŒT†ö\Z…ÍŞ¡â]cTÔe„¬ğŞİ=Œ·Lò[™ „¼d$}æC¸á/rX¹¤©Â*ÏË³·æÌ&0“““ZtMõMöZØf™â‡—­uk¦·±…{Ù\ZG´(…UZy>i»«2‚»„Y%C4VÃbãik}¿à8lÁKİŒ­-ßë¢×S@xf‡Q»ğv±‡O’\'[=yRB£k‚œÄ»‹&Àåb\\‚àïærQ´kÂÍ®·kÏ^ı¿Èô#ˆS|‰iŞékn«¢f>*›á´£ÅÖv+/‡u9g³Õ¬4Ôk{MB5\'}¾à»`evÂ²änp¼ÏB¤±ÖÃÉÚQ³M¯³}Qäâ$ğIÎ×‹ÒÜÏ¶ş>§øF}oÃ8Ñít´İÜhm u;Z1\nÄ çæcÿ\0’7W¿nœèUrød•½w>wjĞ­B×m7¦ú–´t|´¸¹´»¶¸²ÓEä.biîV×-—à5¼“#á—„F6Åšã§\n”qíÁ¥µäßEêZ¥hKy^Rvì´5|<¾ğ„/üUám:î;¿³)„ŞÏ‰DE—y+´1)*‘W‚Ç\"ãd€áˆ•\\Uhàê>¿Kzş¦Ô¨S¡Këp‚}·~·×úÙ•üA¦M®ø2ßZ°–ÒÜÜÙÅ«Û¥ÃD#¶ò&BRiâû“j‚B~æ#ÈZÉJ«ºwİ=öjËşvîwRö˜Œ?´§5ï+Û{ßR?xÅüGâ«íJW³³mQ Âj2¿Ù|ñG;Éa[sŒ†`GÎX+›†t(Æ)ß—²IÛ¢¿cĞÂÊYÍIY>ïgÕÛ×crÒúÒk;D¸’_Û[ÁÚ£F6Êåâ³¸r[¡‰³›8ùZù‡4¹¦ãi+İ.¶Ş+ÿ\0JÍ^+V¢âöòó±å;Ñ¢ƒQ¹7¶–±ê2ß4¦™=ÆL œ–@¢Q´¹§¹;~§	UÎ*Û-¶?=ÅÑtª´Î2{¨¼¢ñÜÛé±Ç“˜nî\"VbÌÈdS´«‘á•¶n¥Á>úZ÷8-}ÇYİ$òB ¾’(²¦®b*‚€ïMÁ•Ærãqóæ±›Ëø1%~§1ãÛ!k«Å2Çsr†XÕ6’ü¸%z½{×n×¡…Hò¾ç.İ*Œˆu­)µXÆU\'z¤Hæ˜46¨VĞPŞ´\0f˜ĞÓÍ1ˆ:S§­\0ìE^Yäj¬;\rïLbĞb€\01@\0 n\r”%)12J’@\n\0v‰øP¡EluIq“Ac¨WŠL–J§šÍ¡©Ág5$—ôxÚªÇÌŠûø]İ9Î;ı+jJòF´×4YkØt7Mvˆ\\Ü‡\"IÒGU›r‡,ˆãÌ9PÛ\\\0\0\"½	½\Z=œ,9ª­ğ}‚<w——r	í¯¤(wu|ÍÀ¼ÛÇ*FàFÇ‰©¬`º}€\"sorÎ·âÄÒüOi*g6QÍ{wJdI•¡hâ¶d÷;Äc	áFÙÃĞç á%£i/¿S³_ÙÖS§+5{ëÒÛZİJ^\rÖ5\rj¼Ö<ë—ÔàG2Bë!ŠeXŒhÜ³óÀÎCïUbiÓŒï\r9tõ~gfu¥íu[ï{.ŸğH¯<Giiâ{ËyR+»ırÂ-&5·ÊC\r¹¹o5Ÿ#12íÊŒ.H \0¸­•&é)-]ßİ±Œê¥‹T·”£eeukïò5ã¶}jíndy »¸µh‰_’òk3i.U`TäŒÊ+Ë«îû©^Ïä—ùô*Fr¿Ú·Îı|Ÿ¡sÅZ;IğÄ×VñÈL¯m?gF-$Qæªsƒl`FA(ÎW<ŠéË§­EKÍşñóßh°²Pêíÿ\0ywŠåñv­s£éZ˜¹û[Û“ie\nâbHf0ÿ\0!O´Õôô#…¦¥V6²İÿ\0Á>¼ñ•¥5KŞÖHôiõYl–ÛÀÁ4ö»µRŞW{tcıóÇ6Ká]ˆ9\'jüµáN\nrxÜeÚOİ‹ü4óĞú…RT£$íïK·Ï£9#«é–ÖÓé:E³ŞiR\\¬W—À¢nìŒ¤d•@³œ~\'¡R©Uª•¥Ñ*~]Î9×§N\\´ÕãÕÿ\0;íè¿­ç‰%ÒŸQ®¡ªj`G,êFÕr#V8	\Zıÿ\0”ü£©Sò¶üœÑŒ)»%øùú™FjŒ¥^ª¼Ÿàsóxræ-VÇA´ÅïŠõQœ[Ü¤†ÜO·C0’¢Foõg‚X¯bj1ö“z-¿Ìñå9T¨éÓù£¢øgÃŸ\r,4ã®ÙÁ|÷p9QwÆAİ‡¸_1„PA(ù“í6oàúÍjÜÊ†©Yÿ\0Àóg£<\n**¶èõ¿£^¾¶òG—|Aïg6ú-ÉÔ¬ \'¸òö£?ñŒ`6ÑµD(ªZ½*Ò<Õ›ş¿Äò+MAªqwK­’ş™à™|A¦_ÜİÍ%ÅÇÚm”İ\\ò.äõä@1èFÓE%É>i;ÉŒ´ğ2ßèú ¥c?Ø®îå<û2•`}˜uî\n=—\\ğ1]fÊiWdw–ÁÊmÎ0VT$t!Ñ×ëQPä\\R±&ƒà9vtˆH‹*Ş…l|á|m(K˜®^§¦iŸOö¯	³•¢´Ô%·’x°Z)yˆÌ¿Ä¥]Gu¤ØF6z4_	ašêÛP²¶š\'‘Aµ•ü·p}Cˆ3÷\\ö4)—K]Ã™e¹µ’ÎX˜Kåyr®Í…fÒà.=R˜¹è¿!:©\0¸G—írsÈÅ!ò8&9¢“=0=x£˜j\';«|+šÚxìí•Ô§M¬9Û•ÚO <Òr-CS\']øo4M#˜ùgqùx9¸#¯^GµÀà™ç\Z—‡%å%NUò=j”ÉöztÛ­CÂº•¶¥¦ÜËeo –‹vÚèàõÔŸL€{S“SVz™¤âî·>³øñµ5ù´»vğø7Y¦¶¶O&Öî·îÃşèÉ‘ÛleAV1Á-g%îôÿ\03é°¸¨Õ¦©_Şîzç†5-Ä÷—:«\r¯‰ôûFZYëÚ–÷–İ£“\rní\Z™b¨+Y\Z7ù²1óØš1Ã¥VNDŞšiÿ\0~ºE‡©	\'	Rw²¼’º9)|àO]ÈÒxwQğ– ‘™àƒE-<ŠüˆÊÇ7*±³€ÁT)+\Z“Üt}{B)|kÏO¸ÖU:­É5]?ó)Øü ¹ÑôÛoá§‰®–iNtÉÕ£¸•/.ĞŠ¾`Üˆye#‰fë5CMio=ÙåıB¦\Z*­	jÛím6»}t©x¢×âßÂ½Z÷iZí¦’o$ÓÒÉVÚf…„‚T‘1ƒóLŒqĞÅÂoŞƒv¿dô°çˆx¼$é´ïkïılA¢ø{Nøg7Ã/Û%ÊÛ^YÃ¦k_Ù‹™\ZâéwÁÀ•\r°¨Àûñr3N¥z˜õˆÃÉkxßM#æD(Ç:3¿Ä¬õïÿ\0ØÊÕ®µËâ[K‹ÅÕäğ®§³·¶s{	”æ9#,­I;YWæ÷%ÊöaêSÄBœ­Ëí·şeúÿ\0]|F\Zt§(Úü½m¥­{}ÿ\0‘Çü3ñ.âkısIfšŞTıÏJ¸¿F·*\\ºşùÎRUÈT‘÷ºF`rsébèN1§QjÖîÚœØ,T*©Ó—Ùl¾ã¹ø	½Ğuoê7ĞØ_ÙLÑi–šœ\r±eÂI\'Û·ç®§*»È0“^.ní8ÔJñ·¼ï¿“ıo(½9E{ËE¯§•ßOÀ¾úN¤—VÏy¿Ÿmroïî%H×{Èî#‡f9Lgß%+Î›J•§v•½zkò>–JUjnôZÿ\0Á^¦$&{…‡KÓ4´¸Ô£€&£¤Íåeó’[åx£’³N€¶FBÙîB^ÒZG£ß¢kæ›iùãR´\\Æ»i¥íkú<miöv‘nµI.ìndµòÑo¤Ó‹÷HØù_iiÉî­)şÇ¡‚¨Úµ»ô¹ñÙ•TR]?SÍu{³®\\1‹SüĞC™5ã!óX+ŒåGİV98Éö#î­UşG„“cba1Vsqs-ÀPçÙï¹$«|ÜgïL½A9÷˜¼×ùÿ\0]Çe©‘ãë$Ó­nä¶h§É#B©æ«ÁBU†K:\03µËnVÑÍU{×8g1ñŸzcD2tõ­QdF¯ ÁALÓ§ÖÜijŠh\04\0ÚcB\Zhb\Z`4Š\0J±ØèJòìy6°ßÂ˜Ä  A@\0! `Fh@.:Ğ\0:ÒcEI \r\0:‚Û@î!àĞP PÄÇT’ <ô Ğ+J†=‘(â ‚EçZV»øO£[êšÃIur-aˆîi:(-ŸR\0öÍtS|©æ-x«RkR[é%f´–)·¸“y„—vÕWl‚	$mm¸=*|Ö¹îái{4äú›zË¶™a¦xr+Å²mNKuy[ı˜\0ÎÀî!\\d©\0Ÿ˜¿PÇw—óNu¤¯ÊŸŞ}š’Œiáã.W\'Üåu½Jî-3ÆÚ…ÜË9Ö/¿²mÈŒ‹‚¬xÊäğÌ:|ÕêRŒyéB*Ü‹™eiÏÙV”İùÚŠWLô\r+@cwkh®gÖ,ãE«1 I\nÉÉ\nÌÛ°GQèF<	U³æKİßü«Ã^4ã	¯{Ó§È¶¾D¾%Èæ:KÃ{y\'–’[[¬aä\\\r³#”dP~÷¸«›©(4¾Õ´óï~‡[t¨ûÏGõënŞg#ğøÍãjºíô.-ÌéÜ4¨E·Ív;GîÙ”&×Ç~ƒ·v&1¡N4Vı¯SçpU%^´ëKáOOÔ÷KÄÃÃZ.µâCµÎ“§Ù[ÜòBÜLä ŒI*ÊààH™$ª¤cÁ¥GÛÔ…$ıæíşgĞâëGFuj«¤¶ş¿3Ä|)sâo\ZØø‡\\µµë—-µÆ³yrQ`¶‘DÛ÷UØzmo¬¬èa¹)ÍÙ-mİÿ\0Á>\ríñ<ÕT}æí}t^]¬/‰Lğı¬¾Ğf{X¬Uß_ñ¤#`´@ÁpYÀPr~UìäóRsªÖ&²ßHÇõô:«{:Pú¥¢^ô¿O6f&­ká]!oZÇw`Ó,×íF@êxY‚³6<¸Î:§7Éñ3š!ºÍi´Wëo2†“åxkQÔÒíµ\ZÅ´Å;ypÃhàoãI†ù\Z?º à´˜ €6ªm$½ÏÌà•_ißÄßôí×ó1´‹È¼#×¢k™áF2¼~\\nXyr	bgìÄg*çä!øì¨½¬e³ş¯şFt­…¨ªN:ô×\'Øî£Šïã6³ ¶+¼)5´Š¬\"	°ĞÆ§²€p«ıŞy0øe†‹‹w»¿ÌœV+ëRŒ­k+z¯ƒ¾\r.ÚûG»H¤½´x­D¢?¬¹’Âsˆå|—8*C¨Íu¹zc¨ğÂØ\\é—Ën—!\r¬ê¹)Ê²C ìÁ$‰TƒOcK›¡£WÔf›ğ¸Úê¾!Ñ|Èu;{{Å…c`#”±Ù\"÷Æÿ\0”ã$\\qŠbœVèï.¾\Z†Óa× ….m•¶_FÊP„ 3•••2s÷ĞÃ¶ú‰oc7Ãÿ\0Ø¬î„>]Ü~u½Â>^&Úî†Ãµ±Æx¨r.İÏCĞ´ìÏÈ@ˆÚjVÑ¥İ³¬%Y7ç\n²}Aàğ¹ÇËus¬´øv&Š+© „­èZXÙvÈ1Ê’iÁ$œv¤˜3Tør-5{¸nRO-ã{»kÆ\nÀ1s¿Ê•,Œ{N:b®ĞY‘Xü0ƒN½hE¬JŒDŠ%>dG;c#xu€QœdqÆi9m\nºŸÂÅûk‹‹K•fe‘n!+(×çV8ÉV^˜ÉÎ94¹‹Š±Ïkß\r4Ï³¼$yw2»dŒ |ÆAÿ\0€ôç­ÆÜŒğo|$hì¶–@ÛAÉÏAÁı)©òOx{yÛ1\nv`‡¿óªç3•-\rìî´ÛÔ{F’)ã|ÆÑ}àGúãß8­n¤š{ö”$œYõÁ_‹¯ãˆ¼»ø‹kö‘²ÈóMˆ$ÜFÙ¶†Ü@É;z)!\'yüŞ3ì´Ïæ}6¤±	ßu¥¼¿­¿ºñ7ÅÛ¿\rÛÛiºŞ™wã\r\"G,óÊ’ZÉ`ÅÃˆeŸ\'Ìb$ˆ+¡ÿ\0Uå¬îMy‹.d¥MòÉm­ùŸ/ó:Ş&®R’ö»²²ºÓæv\Z&› kmk¯xJü^ı‚-ÃJ‚\'DR®%ƒÍ\\4.Ñ‰#%	ø×RU©ÊtñŞ{=~]6¹ìS­íèÆ0·-íwË§¯Øæ4ÿ\0è\Zñ¿‹ÅÕ…­•0‚Ò($iİm­ocuŠv]Ûb]í°ƒ’6õÀÜzêâëO\rMÇŞq»}5ç<-7^iJÜú+Yèşï»ñ9K›È´/ƒ.±¿¶\Zw‹ü6¶ş‘‰(c¸‚üIgt w®%°r¤ğwb½AÔÆÓ’W§RïnêÎçRkê.q“R¦û­lôÓñ½ËZÔÚuŸˆ|\'â½HÜÛé2ÑşÉ¨Z‹UÚg•7ó¤ÁW˜‹ +€á—\"„\'*pĞÃ~ëÛgøfwU¨•Xb*+9ï­Ö»^ßŠ<CÅ~›Gø«hÖ¶÷Ö—vz›G-u:îØbÃ(‹Œ#Lc\n_¯ÃUö¸xÍõZş§ÆbSX™rôwÑ¥öH<m®Íâ-V‡Hñ~ŸgäİÛéáŒD‚9bgÆ£\rá—9D9,²Šñj%†‡²«Áë¶ß™ôtêOïÓv”Uµw½úiÓÌè|ñ*ûáÇ†4C$Ñë\ZıêH³İ\\0+#†ÊÆª2 ù}Fl0!«ÀÃåğÇâª5îÂ;uüÏkyvœ\Z¼§»Z[îw\"ñ7‡­õ=zÓY¸·µ¿Ôn¬™$Šw¿$´\"IÂWæ“ÁÈûÃgiPMÙ?F¬¿.§m\Zpå{{ÏÖÍ7çØÎÚOè—[ùÀ¤²ùBhÌ«\"b?İ¤­œ1D#$ÈË–Ús×F^ÂªRİ¥ÜùlÒ—´„§\r“ş´èy‡ˆ>Ò’K#á²\"öÖ’È£aMÄíÈ¹,@+é Óİ¯ÅŸá¦†+Ãu5ÈvA-Û/šÉu¼‰3m%ˆta¸n¸\02$‹ïòìÓkKÛÕ˜½-vL4×Ö-µH´ ²ÉäXl\n4dä„\\¹T\0©á\0úWD c7usÌ¤3Ú¤çi¦î@Ãš¤\"	h	ëZl1¤sLÀLP[Š¢ÆĞ@\r¦‡°ÓÖ¨bP\0zPj‹:,ŠóO\"ãMk\n\0(\0 ÆE\0Å©\0#5@&ÚLwƒR!@  V\Z`\"‚…(µ!avĞ10hÃ¥\0=*=‰€¨ x v=£ÀÚø_©ë,òG-æÉoS\n0b:ä‘Ó<!âkIG¹ôÙ~n››9M¾Í27=:ª‚B¡ç9nÌ$ml°^»hî{tÖV55Ûˆo¾!xfÌ`EkóÛÏ½q°LÇ+}ÕØ§\'Ôg0^z1äÂÎ]ÚĞõkT‹ÅÒƒNé=tvĞåÄ\rà	Zİ\\§ÙõMbo¶Œ‰Ë…Ãc€§ów2›~nù;W­(-c#1”°ôcUé)k¦ßğç ü4ñZD÷ş/Ô~ÒTßı)¡ŒÈ¶vàüìPÌ˜İßŸ¨ñq4ùíBVW·v}\nñ½f÷}6Kb]nâê\rYŠÄ­œ·-o¡Z€ë:Ãç°Ú)—Ÿ(Æ»q¸ÙçŠVUaïkÉüµÛÔêÇ^T\'mİ£÷»oètÿ\05UÓ4{XgºÕuI„PùÌ¡í0Ñì.	äÇÔƒÀ¶*qp­	¹ôHäÁÖ§4£«ĞÍø™wö¿[Xê— x+I³KËèÁŒµÜ¡ü«c1#Lj„PîsŞ°Âu ¿{&Òô[²3/o\ZS»Š»îßoøê-oõmgÃ\Z˜·X´5K‚ ´B;¤±ò“ÍÂK<¸ƒf~êÊX	µ\Zu¢åï5ó\\İ¿?™èQ¥V½¡x­û;uòù5VÚœÉ£é1ÄŞÓ®\Zõ¶£;]J¬TJùÉ)´¨ç“Ïôq„á^£ıãVô>NSIGE~í;»îßNÄ\Z£ÙkÖºÜö³ßÜ<Kö8RåhÒep&(‹½Ÿj®Ü\0‘»Ô)Cš./DrbksÔ\\Ÿğlº›tô}]Ö5·a4¶æKa#4¦ç4‡q$B$‘™Ydâ 8Æ8ºòŒáNŸÅº¿—Eëê¬&T§*•Ÿºô“]{ï¿“ÔÓ‹Á7?uË¨…›komÂ\"/´Œ2\0Ä@@\0 ƒ½%:q|îíœ5Ü%+Ó‘é_şOáímD‚{X˜»6	á_¼<¼üÏœí!—8Á·3›Ù£Üî>\ZA\"ØêVèÉå,N±Iº;›9AÈ,¸û­µÔ`AàŠW&1:\r3ÁÓÃQº=Ì¾9ã”Hê²9—0\"V.§§$cÈ.lj~µÖeÓõ‹É¹Œí FÊUXşõyä.ó¸.xÀÜ¯¨ã•‘Ğé^	šÊ)$·1:Îğ£†ï#£u‡Üç<`ZÕÌË_&›{u\nZ”[—,iÙ‡¦îã={œš‹÷5Q¹q|7h&‚YbÌñ8wI#(­ƒÈår9êGÖ¦æ¼¦İ·‡áŒ®ÈÌN\0Q$-µˆ==p\r4ÅÊ]şÃ\"=ñÏ.èÛr©†àrNqĞäÕ¦G*LoöÚR9 ´DÚKGİé†]‡  3Á\0Ò¹\\–#ŸC³º£òäšĞ°İ–\n“Ô¡é¼ÒlµdÜx=$Œ%µš[¢\"åç‚>èúóÖ–ûMÏ3ñ\'Ã»{eÄFHçóO\0ğªs•ä¯P(¿qZçˆxÿ\0á2-¼’$js˜Ô`)àq’{F…-ì|ëâÏ\Zå%³.d …””Ïq½jÔ¬Lé©#‰³2øgTÓït÷6÷örîI6îT©ÈØ\0İø§;T‹‹3¦	sEûàßEñ\ZÊ;Ë£ow¨Ã2ÏukrY²áv›“™UÙµ>ìˆOæ¹,¾=ZO¹`ì—ÎßıOnhWmÍ_¿O–ØßÖşkvÁ¯|;†<HÏ²ğÔ­4>kÉ•–¹·pW\0Æ$	´¹¹éb)WŒ¨âŸ½®ú;l—¯s›‡)*”‹kë{nİÍMÇš7Ä˜ÅÖ±ag§ŞÏo.‘­Ù)uK‹FvkyC;/È””bİœğEy8ÜL/»M¶•¥ÙÛUçtz¸Tqš]¬öJÇüLÖ¡×>!x·S±t:{Ş:ËöiKÛ·8©Úß) g¥}F\n2†œ*üV>WNõ\'8Eò^ŞGCğãÉø‰ ê~ÕnÕe›E¿w›g\nNÒcn±ßW?›^ÚK‰.¨öòÙ,VXYhÖÎËñ¿cšñ¡¶•§.©¦İiŞ;ÑãşÈ–9`,—0¡tkv9Í\n0Œã!£ïU5êáâùÛŒ¯NZ¯^şó<ŒCŠ„W/¼•¯_/‘Ôx?Ãqxƒ@Òµßkiş ²–Sô‹/Ÿ;>Vàm$(l5‚á6	º¬˜Ã[’r§]^=o/6ú}Çv‹TãV‹³nÖ½¯É-Ş»şÒ>V•áµ.¬Ğ™íf@±/œYÚ™-\nÌ¡vğÈàùù4“©U%£†«úûíc£:§j4›İ%ßwçıhZø^eñ‡l4x\'Î§¥Kå¢^ß=¼nYdóËù¶ÆÀmÎA$”.XêJ†!Õ’÷dÌ»ç‡Tùõ].ßéøô»–[ÛM4Aş‡q÷>E•›<Q:»4ÖÊ†0©-+:Ï&8\0×³ƒ¨÷‹¶¯§GåÛäüU):^ì“z.½Qæş$ÒÆ—©ŞÛEi¾rÏ@,Ü–[Ì•²ÌÁFÜ´¨\\á¹ú=OmÜüæ­7FrŒ‘ÎEhÑ¬‚ãLEe•^kq§AæÀÇxbíãn÷äpbî8ë”º&sr¦>ÂÑmš7œEe$SŒ³éÑùJH.¨s¹\")N„ô$Äí%¢¹ÏË}Ç!ã\r=4ızé\"\n³´‰\ZÆÑìV$…(ÿ\02ÓÓ©ë\\Ëkv8Ú²ô9÷«@C ­h‡Õeyª@7?Z`%\05¹E‘‘@\rÅØÅ0ÜC×¥PÃÔ\0Œ(@2¬³ ¯0ñÄ  ï@Å CAæhJÀ!4Æ\nÜóIÄ•$Y…\ZzĞ\0‚¬?\'Ö‚G”\0ª*DÇc\"„ ââ“,z\n–\'±8Î*H\'³¶k»¨ NZY0=É\0:F±ä£Üöw^ò­,ô«uÓKÓm:Şâ\\ “Ë’8ä%H\'™Y¹ì1Á-JtÕùï®ŸŠ¹÷Økò(Gá¿å§ærSÀ–ÿ\0Ú	A|øåb Ëó>õlì8Øv‘Œ&HeTîRRŠiİ_×ü\raª¸­<y±xÓÃ:•ìßfŠQ<I+Á’²TwQÁb	ãt|÷xi^…Zktÿ\0SÓÄÅ¬E\ZE$ÖŞ^F.†éaáíÖæ¶ŸF×¦µšÊ«ü¯êAÉ dfº*¦ëTœ^“Šk×C\ZrR¡Nœ–°“M+í©Ğø\Z›Â¶‰]¡2ÆÂõ`˜EæE€§‡óç… õÇ;ªók{~:í‡ôÛÔŞ`-†ˆš¬óÛEw­¬šÃMÛ°ù\n8ÃlWR£åİØõ!z“q[GOëÈÇ?e)½å®à—ä¹ğwÃm=cLxÄ³$òBY$k˜ƒ$-\n‚0@ËH$äjä±Ù{)hºùm?«``êÃ[íçäı|ŒÏ\0ü9ÔuKû«ÿ\0A4ÓO4wâÎYÛdó(fE\0îÊä©ä\nŒna\n<´pËek®‰öüÎÜ¿-©]Kˆæ·OŸ¦Æ·Å?Kÿ\0ÜÑÃuq5Æ¬‰!ò×&HŒ…ºl-¶4,\0!OÕÇ—ÑUjóµ¤o¯™èfµç‡Ã{\ZoYè•şı:I¬\\[øsÃ1<kÿ\0\rJ9V?(à@7\rÁFìF ä¬r½OÒ&ëÕÊ”q¹uœ´ÿ\0?Ñf—ğ‚é¼;¨Ş_]YÁ}¥I\"ùYo³3’QÌ\'.‡xŞU¸\0Lñ”)ÍS‹ßærF†&I:Ñ¾ë¢jŞ]¼Ëÿ\0<!¬ø¼ZE-ÓŞiV€­½Á\rº,çfĞÛNô$qMÆnij÷)Õœéªr~êÛoÅ­şw>¨ğ_„>ÁiÀ[22ù.TuÆòa×ãrzÔ¹ßSŸô\r?À±ŞD»Ø»FÁ•å}î1Ñ•Çqøã¦j\ZGi£i2’D„cj´ú’:÷à\Z|Åò\r¶nÑì–ßxÆÑ‚xÆE5!ò3BÓI’$xw»C!Ë¬˜$^1×ƒõ«Rh—RŞÁ£òÉ+3œqNéËrWÒ–rC!<<Ñ{—m]|Ğîö4¬G¦$`)jœu#óõ©@îN–¡P(âØß_ãT™œ£¨Ãcƒû´ó2~ë7|ûSo°Ô{’\r¢_•ÎKaó¹úûÑ¶£¿c.òÔ)d”˜ıî FOúÒ-¾»ie$lªĞ\"—Ìr í¼ú})6R<ÇÄş[Ä¸	“!g’\"¾c:×ô¨¹¬WSÀ<gğî0HíÆdv˜d1\0=3ƒÏ­Rfüº\\ùãÅş[K¦1FÃÀÇjjV3œ9‘Éèş\"»ğ³å°\rä¸f„œ+/pI9Á*ÀJ°È7$¦½ã–ò¦ïcë‡wº~¡c¦YÚê7w\Zuü±¢¼Í /\"É¿(7‡Œ¶f”Üo‰/ËãmiM|_¡õ8L3«¤’jÚzÿ\0_Ñêô­[VƒW¼´Ay¨Åu²0Šáe|¥QÇwT‘¶œå{f¼	f•cOÙEè¬âÿ\0¯Ôõã•QUV´ÚÜº_ä6=oÃ¶µğÓiö¦Dw5¥Øj„fxÛ\0erQ—€[rg¡“XÌEG‰„š’ÒúuéÙ|ÎŠt0ê””lÕì®¶ïÿ\0\0ñ‰\n´ği>-ğ~ óiR•dóÒHár¹H™×ªÈ¢EÎr¯¯ÀbŞ5Kˆ¥•ú}çÇc0¿Ùò&Œ½İİ“¶¾}O@¶Ğ|1ñƒÃÑêcÄ]f‘­¿w,eT™!šf\'äeS»’|ã&)U¯–ÔöMéæ·ôôş·=Æ5)µ£×t–Ÿ¥|Ox•u+\re¡’’w´6I4é\'˜HıÂ|¤ˆQÙ¹d\r+$;¥X{:Ñô}?­¿áÏ&8j”*sQ•½òïıhZø÷áh5O‡ójX<÷Z,É</1[ˆãİ¶cµù™àõâ2à¶Æ›.©ìñ*-üJß™®2Õ°ò[ß{ü¬fi¾Òï<\ráHû&ãÛ+3¨Ø_ZHL³İBH®Ã—p*Ã£û§uVÅIW›«İ7Êô¾Eıvõ+T$½ä¯ü«ş\rŠïâHş évšıõ­œ2\\fŞãûNIÙ\\Çü1FœÆ\\ş|çjÆ\0lŠã©FX9ÊŠ{mek¯7Ô÷°˜˜bèİn÷»oUşgñ\Z(.#´¹àº[¸v£F&’B!Lp«\0Fâzô¯g.›’iŸœÒT«>]òŞ³ïº´†Y\n,ˆ[OHJ¨ËmŸ%X6ŸàÛĞ“ŸbÉí¡ó÷d‘5”7ğìäS6\r¦ÈcšHXòSÊ%”Ë·o$Hyœ”­kÛÌÉ™^;Swc§İ}¨ŞˆZ‰$¼ûD€f\\’‹ò°Ë©qÏJÊQ´šïärµi;lÎÇ5¢7)­\"Z+·ZÔ´GœUÂP†GµÏ¨\Z6ˆã\"šæ¨ îhQÈ c1íV;›äW˜y(0h u C?Š‚‡c4&0}èÀP(:ĞPÍ\0?¥’Å)\0„s@Š\0xZ\0^´11Ê*‡ãŠ‘E\0(aëÛÖ¤L™9©b7<µ|[¢³)*·‘wƒ‡­Km&Ñ¾·ZÍ~gCÜóxoHwRe–æé‰b\\I/š^EÈÉù¾V*©%C\râºe*’K¢_Šş¿Í{F£§7çø3´Ôt‹smİ•â	¤¶‰d–ik*J \\•È ç\'ç,6í*Ş=B¡ûºõ§õ©ô¸Œ+­?mOªZ[æGŠ|:·Şk{x–;Ë\\D’«.Á7FBäct?òÌmÂ:\Zí£R4ë7}%§­öf5©:˜}#¬uµŸC.ö[I¼Is©”ÃªÙ¦­ë&ØÂDÊv(æ6Œœà–ß‘ÅkÍ(ÒMÛÜ|¯Òú\n0ııE%¥EÌŸšZïò.ø\rSÄ^¹ÓäŠÎ+‹n/+q‘¡¹>eÁr8îzTb¡UN[Kğèo—Ôçƒ‚W·İoÍÍß„ôÉ<6©ã+©ô6¹šcç¹Q…X€Í¶LpJ©3K9F¢öVŒqêœãÍUè™ƒáØ¼iâyõ½VÙ,4õeÂú4iµa†)—çã*D@«K¾z+‰Tcìi»¶ıçòØX\rJ¯ÛÔV_f={İÿ\0Á;ˆ&ö{Ëéîæ·Ó¬¡óe0rÊî+üo¸+«!ÎJ¯!Í|ôTáËµ{k5N4å7Øğ­_VÔ~!xâ=f{tx­6”µW;¨vÁWÂåç9õI=@¯¯§N:>É=÷õ?<ç­˜â=»û:GÓ¿È£æ•âˆVú¯ˆ%Š+$käƒóC‰0v\"ÌÅ:®2ç­t8Ô£‡j’¼¿ÏÔç”èâ1I×ÒšÑkşZë}Ï@¿‡şíJÏDæiô-4µÅÌ+0“uì˜óìÚ$òĞ$j\näaNkÍÂFJ2«R6“ÚÛYŸS¯(9FŞ1Ó]úéçä{×‚4[=.Æ·TL½GüÀŠë”úcNLõ½\nFXÔ4e”÷¥?ÈƒÏ·½dä5uöwO3\0bÀÏ@Àı*\\Å*gKbÄ\"®\0€\0ş´s\Z¨_SrÒ3ŒdäóÒ©1¸\ZqGópOÖ´¹.=‹¨ z¥;™¸’ ÛÇoJw‰gšw	ö|g€BAÆÒsé@‰c‹¦xêj‘İXcîi…ŠòÄvá×~{v¤Æ·2î¬Â+Hà)íŒ\0?Æ¤Ñµ£}¢)8e…cÔûûTHÚ;Wã?\n™ –4Œ \n¿\\Ÿ¦*oc¡7|Bğ^Ù®I‹+’¥ˆä1<şD~´\\¦š¼g¡¶vÊP.:q[ÆZjsÔ†·=/à^ª5SÓ%…o“N	v–î¬zH…FGÜVuØs™GŞc^n*üÖ¾ëğ=¬\r^t©¹[çm¢/µ«ñmâ=JÎ5Kë}.æk\'»ißìé,[âã÷¸xÑËù†p¥ğ~3ê”•Ztä›[Xúhã†œ“NÎızİ[Òûy]j\nºÕÒÇ¥\\ø’!IEôÉo$qÄĞ áßæÃ³ó€r@ÁSXÔRQ÷%ew§[ëÛNˆŠi5Õ—½%¦»/™.¤øª}jÎÆ­GE×m¤²½ògFŠÆâ5i\"Xã€7QØã#hV«KÙÎo–piöºz1V„g\n”¥ï\'¢¾¶û·õ>pøswâfÖmt=ØË©©–Wd™cWŠ=«$“”›Püßt¨Èlµ~ƒˆ	CÚÖÙé·ë¡ùí\Z•éÏØÒmrë}6^§²hÿ\0-LĞX]éú‘¨YO•Í”Q)qó¶Å Ée”.ÑãÔÀT’¼ZwÛ]-ıhzø|nÛ?4Ûòùÿ\0Lä~\"üX±×4;«¬÷İ¡A=¥¡^Bîdˆ+3ÁëƒDS+v`²ç	FURÓ¦ÿ\0?ëÏÈóq¸ÿ\0i\ZWÕêî—ü1wàw‰´ßZiöWÖv‹wáñ¶°a…çcU*Íó‰±fŒW&kB­åMé=®èêË+Ó¯­(vZÛn½5ûÉ~èÑ5®£{cpĞiÚö­}e°‘¬Ş\rÆ²¹w+H„¨Ê‘ ®Î­”iµg¦ïÖûúôg¡”ÆTæêêã)5k¯éüX²{ı\n\rY¾Ğ“Ë+-äm.–²e‰‹||\"®Ş\0ıgğ°æ²ÌBU%I¿M-øYö\Z\\‘œ–±vŞÿ\0{<’{kt·š÷ÈcŒÉ¶öÈ¡\\äæJyù•Ç?*v9¯¨»v‰ğ®Ñ»DQ\\ÏmåËÌV·o\"ˆîMÌ^\\w€ó*ğ‚U*õÆ)´¤ùwG4‡ø­Æ¡¤_[Ç,×QZ¬s;Q·¸û2\n&QW,ì`¼ãÆI5/UÔÊ}úhãš“\'ÔŠAÀô«NÃEwšÕ3TF«@„#43§z¡ˆh6‚€ŠhÕ\0P@ g@zWya¥ò\r\04Š\n\nu\'4&ìPƒÍcé2GT€»h¸®h b¨¡‰jI:Ô\0£Š\01“@Z’Ñ$u,ƒwÁğ4¾&Óqÿ\0,åóX0«É?•Dşw`¡í1T×š44íBßI¸Ô|1­›‹k7–I ¤P™¾Bàÿ\0Ë6ù‡ƒÈ €k²¤\'%Mwk5ßşû6\"š”ğ˜–’æº}ü9Ûø‚òox^ÚşÚí.í,fÚòÉ3Éæ@r¬%#\r¼ˆ\0çÊ;€`	ó(*xŠÒ„ãÊßNÌú,Dë`¨Â¬\Z”W›Õ|¿1¾ø¥júœ‰gt-ï0Ò)\nÄ.£¼c$ıÂ:\ZÊ¶®7’Òı6ÿ\0€vá³65òÂ^õ¶nßğæ~ªŸÙ6\ZkYIå¦Ÿx%E-±È<™#ÉôW E\\úV´Z«R\\ËY/Åj¿:°ä„d‘kKßGt×u¹RçÂÚ×‚îl<A¢éÍ¨ÛK¤¶–UdU66@9Çı:€=kÓÃÖ£‹¦èW{=N¾_ˆUèkÌµ;íÁZÖ¡ı—¬ø¦\'hôÈ’æßL‘™¾×22ŞF^#\nA ¯Ş\'h<f¹kâiaàèa÷z7Ûõ;p˜:˜º¿XÄè–ËÏ¿ù“5ÌÅ4–òÜ^+Kxe9íâæÛ1Èr>éÏï0Üc-Uó-O?3ì°êÑ²W·ËğêyïÄï\ZeéĞxKK¸ûDMÌïÓ)P¬ÜÃ£ À^Õíeø~{âª|–Ï1òU>¡AÙ½úÿ\0Ãú6—nš$v—‹-”S…‘¤Šá‘¢‹÷q¿•\nqÜr+IT~Öë_ëóQäÃ8mm/çş]ıGkÿ\0í5gJ]#Piz‰¸»16èäxÚáÚ<ûÈQ ·•$qŠì¡Œö¼Ñ”ZjÛúÀ<NØ¥\'$ù»\'øß‘ô~Yhúlh¶(²\"ÿ\0¬“o\\zà õ¥7vfCÒ´¯,€G—@ˆH?ŸZælŞ(í4»UU@»Àêrìp=95›eòN˜@à>hæ4å:4)Çbu*Ö7mx\"­1Y\ZPõö­“3h´£§½4gbxÓ\'Š£6XHùúŠ´ˆl\'¶=…]ˆ¸¢!“‘’NiÙ8\'·ZhL]€®HüVâ¹ #Ï½GBÑF{}ÿ\0xdu8T›&fŞX†V;wT3DÎ#[Ğ’82ä3nÇ\\téX³¢ç|GğrİA:ˆùeÏ¶îÇùR¹Hùâ—„Z?3+‚¬CmGùâ®2-¤ÑåşÖO¼Wa©IMmÃí6àÒFro#ÊAy¥8ª‹••Jn‹ç§øŸ]øjæãÅÑj±ÏqÍOJ»¹áÏ[Ñ–UdRD ïİû¾s¹r„íO•¯F1©\Z©k}ÄIĞö*Ö?ëæq>*ñf­gğ‹SñF.mo¥±Ñ2ÑYY<¡ëÌƒ¾H‡$`†ÈûÂœpÔjc©áªê½ï“İ_±Ï<UZX/¬RŞößÏúô:{kıVß\\±¿ûı¨X–IŞCl–kæ*F~0ÁÙ0Ãï`àœù©Æq×¿ôvùLú-E\ZP‚ŞÏg×êİN*ÓGoëŸïtˆMÎ¸×Ñ5©šdÀP.b2KuÆ¼±·2F¹ú_kí¨ááVVí÷/òò>.T}•JÕ)Fí¾©ş¿ÓG/ñÖ´/\rx®-*]>ïQ¶ŠgO³„VµpÍ\Zıíêw(òß®Õ\npaR}l»šJ”%ğ§ıyz¯ó<Ì%jTë)^VÕl¾ë_ĞÖÒ5]3àÏƒô\ræ\rHŞİˆ®¯ÉòÖDYšo)£`¨–ìè…%]nwE;æªÆXÚî\rÙ¥{v×M<÷ôóFTÃQsÒ×µÒ×Íy¥µÑçŸ\Z¼má¿ÙŞhQ·ÖƒNbh(KI´24bÃ([ä|ÿ\0C]X\nõ*ÂP­¼4ş½;õûÎ<e*TåÑÑO]õ~oüNğ÷ƒõéO¥_İÛÊ4}ú¬’ÛÊ¢·i¢4M‰[y·‚çøJçæ±Uáˆ«x}¯uz¤î¾wÓĞú|%ahÆ×—Wu²}~_…Íi`½•<a¥|³LÛä[{&Ö7´Ê¨OÎIWrdÉù(=y±œ#*Uc¢ÛÎÛ_ï_‰ìc(,FQW}{+ùwõ<gSÑ¼’]İ*Ãp˜Ş¢<%ÂîC¾v$Œ7Êq_kÊJËõıÉ*.Vï¹ÆË}æœ™‘ŒIlxïÆ`f!c‘Š®ÅE-bÄôn‡§tU¤qÉİšoöí¤SË,“°“ÂÙ³#2–%1W<ıòÎ9¬êÂÑºßæC¼“G]FaXÛ ÆÅ=AÒ¸·F^¥VïUĞdL+BÈhª)<\Z4Õ†ô\0”\rzúP1ª@&94ÅÔJ7¯¥;0:µæÜò‡EÍ.¥1G4ĞP w –-\0†1 ¡\0Í\08P!ëRÉh@µ1Í;•p\"Æ*Ô±1àRb³*BÖ½«RÀvÃSp¸øÖ†6ÎÇáæ—5Ö¡. ¬!‚Õv‰I#21(õë’\rcRü¶=¼¦Ÿ6#ôGW>“¦ë±ÿ\0§D‹ s\ZüûpÙ’TxÚA\'ƒ¿¶ìLjÕÃÛ—cî>¯Gnmÿ\0&ãGÕü\'m{¢>µ¦GnV[6—÷±·—j>W#ÚÌ:{)U¡ˆ”dÕ¥}û˜Î–\'JqOš¥õ<–M>î,=¼w.±¡a*îS‘Ø<‘Ü¥}4_»+,©N›R‚äv\rñ¡Õ¢›KÕ¥ó\'•ˆ†f4¥ˆ\0Ï úŸzğq¸/fÕj?3ìòÌÊX„èb^½SÜguÕ<O©\r)­dUÑìÚêW1È	~#PÃ€Ç\0à+‹Fœ©«³±ÓƒÅT©zRNÉµËF{méµ½¹‹]ófº€Á\'Ùìí¾srª#8Œgäb˜\nr7tãÃWµ­«>«JÒäÑ-›é¯Nç|L×®|=à‹ÉlİãÕ5yÒ;fŠq$-$§+ 2\rÑŒ†$óç>šÄâ#\rãYÏ›âV_…©(I©l½Yâ>\ZÑ\"Õ¯Z}“]D&Qq#ÇÉ<£²|»şdy+³8¾¼ÔmN:#á2ê.«úÅM[ïÑyµ†«áWÃwwZŒ×¬¶h\\[Ü4rLçsF (*äâåpÉæ>qŸ%Ñ¯\nç^ö=Ê˜Ú2§eÓ×Uınz_Ã¨o5›öÖ/	V8 ŞI‚%P1“ \0õ«…(a×$~o¿™çWÄTÅK~‹ÉÕ¤Ü|¡@ì:QÌcÈt¶C%MdÙ¬QÑéÜ(©.ÇI`™U8íŞ“w.;&ÛXÔ\"š¹¿jÀƒüâµLÉ£F.kTIz>£Ú­#&ËQj»“¨­1Â©Å&˜ÔSèK\0F9¡ÄeşlcƒHÕ\"9H	ŒRe$gÎ1ÇLõ¨f©z¸<‘Æk&j\'ÄúP>™¯Õ„Ş¦Ñ>nøµà¥1Ü’Ÿ{§´âĞ7ĞøóÇšé×rvRväjİ³ZğcÆB÷Ã–öD›}KGº†á/#…A8›tm¿š@\ZAÎ0Î0¾n*ŒmwÔô0Õ%4âÕÒş¿#©M\r<AğÃÅ:(Ó].ePŠÓì¨\nF±¨»¸c¾|Û=ysn.kéuı%³¶Ş×\r^ö]-¥öµÎ³Â\Zœ:Î—àë5Bè·–6Ò\\:ùwfx÷nŞ%o˜áJn9!¤É^@¯\"¶ØÕ¬ê;O™ÛÏÓü_‹ŒèÓqş^êş®Ëş	áú÷õOüvñDö¶Ë-³Ïåj¶Vr†pÆ\n	èÊ!Jô\"¾Ö†lº:’é§Mn|±“£›¤®–ö»ÛÔÈø£ã_ŞE%– ÓcUŠ5\'îÁŒ\rÎFIÜ»°¤\0”S^†\n°±×Y3‡0ÄÊ¼ÛÙY+_y×ü9ñ®™¬hïáiöïgg¤2°)m±$Q<Š…·-¶EV*ŒÄ†]k—…9{jÕïı~KüÎÌ%N1§%u+ßôõ¹&½â»\rgâïƒî ¹´¸Ò­Ì¡\Z³F…Vl³¶ÔÂåC•+š•	QÂÔÒÒ{­ßßıuîk:ª¾&-ê¶]4¾ß3[Å£ÄóhZ®™>›SßkxfRE0K\rì+\"Æ íİƒäŸ1ğëŠó°ô¨*¨’Š›Óg/ù†2½nIÒ“»¿*×tõ^¢Ø>¤Úç…uŸ-Ègå¥ÍÌŒ°´ë-°—ÊÇ@a$`à±$úY¨OZœÜÖ~KO¼õ#)F­.e¿O-WàÎ_â6Šºô…\"ØÓL%óË@€c ÈäNĞv¨$yë^¾_WÛBçÁæ¸aYÙny‡ˆâ{I¤ºß%…ÑlÈ^Mª‚Í»b¨áÙÎÀÄé^ı;]y=5bxïS¹ŠúÖÔİGzÍ4…-­®#šYP´…‚)“öÙ0B²F#\0ÓiÙ-YšW8ÿ\0Ûµ³y«#y„ñÏ<ıÎİx˜¯*;jCs%›š´‚ÃÎiŞÃDL*î1˜ª¸Ğ„c4ÆFİj†7JÄëA6ØkU!‰LñëAW:#Ò¼ÃÆ&) 9§q¡)áJäˆÂ˜ĞĞ´~1@®˜Øå©$Z`H›\094Âš€P1@É¤ÂöR&î;ëKaX‘=*^¢dãœT½	4®;ß[ÂŞ¶dˆ¼²JñÙ!É9váqÆsÀãumxÂ<ìú¬²“”#ÊµlècğÅ¬¶–×nòÚµ¼ÂI]šØÂ§s»Ä„³UÖã/—ÖuåJé¯Ÿõ×¾ŸGõiÆÒ”¹uù/oÜE?ÚÂ£E!7(_” ÙH)»Îäq…$d’ºù_qîÒ«+òÉzÿ\0]Œ½_Å¶\ZDCq\"‡]Ç÷XfßŒ9ØGÌO\\ñ“Î2z(áëTšåÑWÅa¨Â\\ö¿¥ÎsÀZnâıRÆñ4·Ó¥·¸ŠO5	ÚÈ¨Oë]xš•pëÙóŞç•[úÄaÊã·KŸUß_ıƒBÑseg:}£U¿wh`FŒ%Ä,Ë²E/òù‰<œ^*N×–ºh{Ô¡$Şû•¼AâK$›SÔnû3J,à–úİUáw¹.¿+i7ïQGbqŠ§V£JŸÄÿ\0NÇµíiáS]®ßMz?ëî>JñÏÄ\r_ÆŞ\"’kÙäŠÒ)®-¢ÆØm˜g’€“İAÇ¥}¶O	Jéke_øsò\\v.®cŠöoáMÛÓ¹Ój\Z$šO…\rÊ³«Ü@âUxœP¡™Q•ÀxÙHUÈÂå²2rxá?i[–GÑU§ì0²œ^¶·õù¾Ñõ=__µ{øb†8“0\"Æ1\nçÆ8ÈPsß99ÍuÔ«Ÿ&§ÏS£WOk§‘ôÏ„DpD±¢€T\0N}«Ì”®z0‰ßé@®ÑY\\è±ÖØrGµO c‘Ò¡²¬tºs;qŠWe$nÚ9R;j\r6í%uİŞ´LÎHÖ¶›8ÍkfâiÛ°ÂúÖèæ’Ğº„}+D`<0éµKFKCÃ­\nÄX	âÆ(8éÖ¨VB±ãñ¢ÃDE-íŞ‘©0)ÀëúÒe$Ês÷È úb²f†mÊáOcÛÚ³e%¡…©[‡Ü§©ãƒ4<»Çş[ë	•€İ³ ŸJH–Ú>\"ø¹á¦´â)S ƒãÛé[ÆE£Éşë3h>5´„N-a¹#HÅTä©v áA?îàU—56í©¦£¥Uv>•Ñ¼Lºuî­åéW3C£Éi+¼¾LŒaHÌ2…PÊdgf$…Ré_ŠÃ¹¨MÎÜ×_=×â¡Ã×¥N¤ğÎ=oë×úÔğ}Æ^\'øS¯j\Z-¥ÚBm¯|‰£hüÇB’Ÿ™7°³IäÂ¾Æ®\r˜B5jFîÉî|]<~+:”`ì½6íc²ğV±Ã^xæ[}JëUÕ54Id…^b‚]°ïaò«3“¸s\0’ƒ<•ã:øˆá ÔcşZü‘ÙBP¡…–&Qr”ßF÷ş·9¯Šş²Ò5k}GG¿¶şÍ¿™ßû5fŠSnÁŸÌ(WåòÁ2‚<¶€c19õ0X©M:s^ôz÷ş¿ào¡äcğ¼“RÙ=ZW²ÿ\0€z?ÂßøsEøwg¯[£ZR\"½º¶.9£h@W|0Ãº¿Ê¬²M\r®¿“ÄÕwJ—NÖ¿#ÙËğqö*¬–ú/zÖó·ùWñWÀ3øÄ…c¸I¬¯İæåíŞC+à•(\0!v0òØgÌ\0zXWÖ©©uê¿¯¼ó±”>­;EéÑµÓñş¬t?o<WqàkYìc²¾şÒ†ñçrŞWŠ,E•ŸáÀ9ÆğGŞãË–\n•o(ÏG|›Ôõ#Œ­WØFPÚWÛs¡ñ¥íØ‡M»wM2Íõ	ãÔ~ÕpÊÈ\"™.ã·Ü€•efaÀ\0‰s^f\Z0ƒ«¯¢kÕ®Vÿ\0/¸ú\n¼Õ]9IÛ]}7¶Ÿ‘Ó|@î ³º…Ú\'1—ŠDÚ	]á\0Ê6g*<õÎ1\\9\\Õ9òùØâÏ0ŞÚ2İl|ñâ‹d:Ä’Ç1¤‰$‘Äß\'Ì…¤bÒ¸ }À 3Ğ¾¦×2kcòù®†m­œ-`U$†[‹Ï5c’4ó„¬Ê[*bØÙ_9ƒoQÈUTlõ?‰v3[\\Áñ$Ëu¨½ÊCºÌL‹JUI8Uç Ï`+Ë–¢7W1±Í4\0x˜°÷ªê*€aïV†Â9§r„Ç4Çq¤P1¤PÍ\0&9¦˜{Õ\0f€7óšó&ÂĞ0 \0ò(1íšw\0ÆiîOÊ\nWÃ¢àšWà;Rƒ@‡ƒÅ&\0:Òô\0PPÍ&R@3Y²nJ«Ş=IT2	\0©­ÑuVÓt[;Xí$¾»»¿#\0\r±í6î er1•í[ª2­§ka–WXzpRW¹İj:Í¿†VDYÒÕ¤i|”˜ìbcùùÎN@0!^2®çqçBŒª»¥µ—ßı?ÀúÉW§Gyhõİa«ø§Pñ06šBImÄ7B²€è\n¤L%aòØìË/Îô4°ğÃûÒ×ú¹óõ1µq’å¢ì›ôòû‹«ğúÎÆ5›Rš[Ûˆde’\'\r‰;¨ÁÆGÊ‹€y•sËö¦´èzôr‹.jîíoÿ\0Ğï~Ú¤¾2Ò,c‚Im!Û÷\nŸ6ÕÇÊ\rƒ‚TFFJñä¥+ÎgÕB1¤•8ìmÖ<•·’§Y\0\Z VGíETV‰¾UŞIÁ^wõÆ<Ïimzôş¬z°,}¤—ë÷m±ó×ÇïŠ3ø‡S½ğå»+[Øİ‘$³€ÒÆ›\Z0„òªÃB®:dıVUöPúÄ÷gÀçyœkMá©w×Îİ=SÜâ´m!mu‹{HÇÛpñ2Ü3\0åä*­Ğ—1¦3°ô$ãĞ¯>uÊ™çeô\\eÎÖ¿‰gÅZí½çˆ˜]A,6–äY¢É\nÇ!€y~aeÉùßç=ó» “Ò)Rå¢ÚİïäÍñ8iˆŠ”mş=_ãÜõo[Ï­]Üjúƒ´÷—r´„KÔá^ØÂàb¼æ”*:Ü½¤œ™ìz„+ì+Í;-1v‘ıj/sDšÈŸ—ŠW)#¡³ÎAù¨lÖÈèôæÎÑÔƒBd´tÅiæI§m!Ü1V¶*Ú6î8÷­\"fÑ© b·Lç’.¤ÙÉÏ\rh™ƒ‰\"É–üj®CV$rNOãA6ÍÀÍ0°Ó9é§b”B9ÈÈ89÷§q8¢&qœã574Q!y“Ç·j‡#Dˆ$|[5\rÜ®R¤íƒ×µ“e%c.ñw+v#¦yæ±}Ê±Èëğ%Å¹z‚§´®fÕÏ•ş:øLÜÛK.ÏŞ¨98î:ÿ\0Ÿ¥8Ë©¬Qño‰a“IÖDÊ ¼NUºGá]ğÔÊ¢±ìö> ‚­ÄÄ×:wÙ™.“b³%\"2d\rŒ¡#œˆH8>UL;tçI=w_™ÕR½ªB¼vZ2·‹¾Ük:=õş‘²ëÚn!Õì\nY¡‰B‹¸•K`\0,p¥N3TjF…v”%ğ¿?åzÃlY\ZôåZ†êÍÿ\0™Sá§Ä}?LĞ5\nø®a‡$‹G*“võ¥Ê³)€ƒtGtƒıVÆô±7:«A{ı­?àmZ%†ÄJÑÉ·×r×Å‰‹ñâ=\"ÊG°Óü…×7ğÁîÈòÀbˆÙ#2®rvÃ–Œ¦5ÃaŞ*“Ö_¯¯å÷îsTk\'N\ZEh­[·™Õø~OxÃÃĞø^{i4¬¶rEKvÒ†‹9pÄ£I!è?{˜ò!’¸10©B£ÄÓw¿õ÷~;whõğíUŒhÔW_v×¶êı—²9oòB)Òtk•¹³h­7}‡÷Á“\0/¨V\\—v\'†z2ØÎ¥R[¶Ş¿×ô;1•9VŠZEYo}M¯^\\ú-İ¨¸Óõ®sooq2°;ì*`bn§jÿ\0kÇËù½¥ê;Æ¯2ô=¬}?İ­i8»ë¯’a¬[øËQ´ğÃ{­Í|°ÙÆs!†TÊÙXcP	n»Tç&°­EaªÑ¦ìínû¾|O-­õ¨V«İ¾Kî:yuyu™ôØ.ˆ„ÊîÂ¦\'óí¢º²äº€ùİÆAÎ2N<¨ÓTÜuê¾M§øØ–êF<ï­ŸÍhxŸŒô÷ÓÍğ¹D\Z7‘Á;Š¬nİ .>äh0>lWŞaªs¨Éu?%ÅÒöU§Òçá-6ãÄvšh‚86Å4‰®Ú7DÉˆá\"Úea× nİÆÜ\0kÕ©V®ÙÅK:ÏİØ¯âı-t[¨,T«xUÑ€;‘Œyäú×§í’\nÔ½•¢~´G0b€#~œS@DÕE=*€i¦tªŸ!b \"€\ZER\0ÁÀŞ5çXòAÍ‡ãŠ‘\0\0 §p\ZÂ¨¡ÃŠ‚@ó@(Ç\0h`Ğ•x©`(ëŠ\0R1@\n(Hâ€ÒcD«Ş³dØEMÈd¨*Y$‹R3«Ğ|Fm<;­,¶Öñ:“³–L1ç²îB@ÆBs€+zqud¡sérÜR…9)-c·¡§‡/<ey.©pöÜ3ù-«¶A2PÛBËÆß›\n2®™×†\Z‘]­,=Ld§*®Ë¦ßÖÇP¶ğéğÈúu’(S»ì6ÒE$ˆ%mÅTÿ\0n.yéœğJ¤êÔå—ß²ÿ\0‡ÜúªHÑ£x_OFÎ_TÖ.¥á¡1A°[\"¬ÆÊÀ/M»¶Œ`:ğFHéÑ\n1‡®ı?àJ«jíi·Tş{¿ìó©Mak¨ø‘VBÏ²Ú‰2ñÈã]”‹a%QÀ†¬qñäqQõ7Ëj<D_>®í}ÅÏŠ7ÿ\0„CÁh[çóQI\"/4›¦€â2cï\0K*É÷åŒ2ì/ÖkûV­»—f?T£ìâıé&’ÓO3Èü\ráù<K©ßjŸ¼¶Ó¢.nÙ.g2-\"Ñ™øùÁÛµôøºê”—üWò>*Â<EgRjê:ë³~o¥ÎãÁö0jŞ ¾œÙgX­½¡2(`»ÂÊòí…åÉéÙ|Z³q§¾ıüÏ®¥EVÄ%m¿MMÏˆ7‘\\K¤h“Ú¬¾`’âc@‘…P¡Ùà°\'åùp	Çƒ„ã9ÔR¼v_ÕÎ¬Öqp§JQ\\Ûú/_ó;´{\"XĞ¢ŒF+¢R¹âF\'©èËˆÔzûb¹:NÅpFEMÙ|§EeÛÒÂÖ7m	çŞã7ì,¾ô³\r¹«dI©jFáZtÆ¤Œúb­	£F)²5²f\r£œ‡òª¹›DË6zqëUs7Q/jˆ°ï7JW[?i—`İ·<u¢ö\rg8ëJâ[;ƒñ¨,…›vy¥¸Êó08¬X÷,vŸz†UÎsQMìÊ~e=c{0µÏ\'øáï¶ÙÌª¥88ç#§éÇáR¥©i\n|_ğ‹X^ÎÅ\n0\'Ö»¡ ’æG+á‰§á-[I¹A4PâhØm\r9ŞŞ¬:ç†ãéÎíÚjkN‡<£ÍFpí©ìuyµ\rKP¸Òæ×Ä0¥»Ë%ÄRËı¡@!+lŠà0UùQp3’~sIÓq„Õáwkt}uzÛ[ıç¹”â!:s”´—Ú¿UĞÔñV…àï‰~~·«ÙêÚ±è“½¤/›¾RÛ¶Û)rXn¸2ÚØÛ\rˆÄà£\njI÷¿ç};™VÊéãyñö¶Òúôş®,?¼!á™ã¼¼¿»·ïæÅ-Ä8\rÃüùN<©>dÜ®ğ’+/rÌ*ÔJ)iÕÿ\0OñõìyÑËİ›Šî·ù_muü\rÿ\0x+P³¸Šƒ\r¼K²k{KÙ.%¹g‡i‡;0Mêæxãû<Œà‡¿]­	òÛuòO×K%ùêwÿ\0g9RöµÏT–º½;ß·™ç;øK<OyáıRbÕ\Z9¼©î$Ya…áÌ,®á|Ù\\¤Œ¹™dŒãq/¥‡Ì!Ê•uÊİ×“}~_¯¡â×ËêŞØtÛÖi[O™³§xÍ¼G éš£,v^,ºÔlt‰ÖkCæ$Qİ–I0Ê	”©9ûÄ0qçUÃJ•iW§­4œ•»ÚßßG\nTªé6ÒzëkÜŒ]W\\ñv›şF«j–Ú”qoİ%èb¥—\\«ºeI úDÜá\n5\'¬¢šùÆÿ\0Ÿs³\rª•éÅû²k¿_ø&¾–F¡¤\\^F2%µıÔ¥şs)²’\nøö¸À\n„·¼Ú³p–{¥÷ß_¼ôù9©»«ZÍıÖĞà¾.ZÇi7‰ìÈ.ZæRB/ÊeFyÀ8øI ÇZú,ºNq§ÀæğäÄ6úœ¿ÃÇ}7ÂÖó³GmlÜÎI<	\r’Ø,r|±ÁùøÁõk¾iYêc„Ñlq>4¹ŠëYi q%¹E1¸?|c†éúqJå„\\cg¹äâ%Í+œñëZlSÓh$cUìmÅ;0ôªÜPbÁ	ŒÓ(F4\0Ú\0LàĞ\0FjÑL\rÁ^yå 8t¤Ğ[­\0! ÆjÊÔ¥\0(ë@@@\n\r\0.(°5 0\r\0(¤Ö¡Œš:†D‹	Ò¥IŠ†MÉ­¦HK¨’\'S±á”ıGã)&œw7£VT¤§|»®¨õ½jÖ8\"@UädFŒÉ*©*W*K\0~^qÀäW<¦î¾gëÔ½ŒáeÊÖŸæ»kªê:„ú§ØUm¯g1<nÑÎ©É,­Œ\rŒ°À9 ïS„9z#Ç¯‰­J³§›óÒëÊÌ«c{\rÀ‘mào´íİ5›G,r!^@\r¼î “ƒàdÑV3‡Ävá*Ñ­sæ¿«Íğ·ÄöğVŸyw$g¶Õ&d–Æ}ÒL|Å!Uñó|¿*å@Îãõãã©Ï[’–¯C×ÁÕ†‡5m§ŒëwW^:ñœ¤KİQá†3œy|ìA¸pp1“€O\'\"¾–8a($¶Kşøjõ*f¿6ô={DÒ¢ğG„4ğÓ‹æ¸)îÛ ÛÁ·˜™+´\0|~N¥yc1\r-º ĞÂÇ/¡öi»½üÕ¬Màı#PŸMÒ­®míŒw­ûë…lLT‡fİFBìŒHØ)ùq[â+RI¶íËk}öûÍpXjÉ)´œe£~ºú[§s–Š×|M=Ü0ìbokjV8ÕW*:ª–@ì1ï]P¼(¤÷z¿™ãb\Zy5²Ñ|Rğ¬b2šæ“Që^ŒH<äW;5ØììmpÛøš’Mx\"Ù‚*€Ôƒå\ns|S¸ÍË,qÏåM¦ı›\r£Ö´B5í;Ö«`4` Õˆ¹í¢!«–£˜dU&CL±Ÿşª³&‰„ØÕĞ¦~?•\0å~9æš‡ïÏ\'šˆİÇÒ·#\rAdg ÿ\0-€­;pH8íY1¤g\\ÈvãùVRcJÎæ%Øİøæ¹æ«C›Ö¬£º·ea’G¾jBÇËÿ\0¼	æÚK(‹\'“†º!-G\\ùOÃ÷’økÅë-wÀì€¹<6\\İúes‘İÊªFÄßÙËÕXÛ´ğv³u}{/†¦’Û\\Óp­º·ïoNæ*Q²2¤hTJ‘ÕsU<E\Z|«ğË¯Eëóı1Ñ«RV¡¼V¾ŸæuøÁ§x›MM#ÅzSÍv±Eco<qÊÆˆ1™Q£›ˆU\\s‘Á §\r\\¨ÉÔ¥-®ï¯Ë¹éáó:jŒ£Ë/(ïÿ\0ïF©ğçhÔ4{½;C@bÖÒØ[¬ª‘ÆWÈ$*¨•#2íù%…QÅ·Ë]9yï÷/ë·cÑúı:zaÚvÚí\'Ñ=Réo¾å½^\r+é¤“_¾»‰æ’äE¨jp\"LÓG*$B&n	PA\0NŠ-ÉÙ{{{´ì——åø-|¼Îe^š´gQ9uZ¾İ¾~‚.“k4Ğiú„-öÆštkËøĞÊâÌŒ@$Êdmª£4a@Q)®Yºx‡ÌÕ’Ñ$¼ÿ\0ÉuéêÊ5—°©w&Û“ó·ßåå÷œÖ¼“xËÂÖºüp?èößÚ¶V2;åå$0¶ŞP³«D2P‘–;¸ºu>«]Ñ›ıÜß/£³üqb0½Ö‚µH®k.×Z_º3µ+;]ñf¹>†TYO£Cii4@öÈ‚Ì¡1Á`ŒËƒÀÃœ\nqUhá©û}ã&ßø^Ÿ¡•&±8ªÍüQIz§~D[˜4fÎgµ…WJ²Ó%„N·%ÜÏ*|¬˜m-ÊŒ’n„W™6¥RœÖ¾ôŸn‰õ=‰§NJušŒW{»Øä?hk)mÆ³¨í@.Ñ¤Gˆ|¤;	Ç9\rÇ?.1É¯o$¨§Át>/=¡ÊÜŞÇ+á˜-“ÃrÉæÆ’°‰áòÔBHn°\0ÜÊƒÒÀÏ¿VV•¿¯ëäıQäaíkù_ÖŒò»Å`Ñ«S£c“Œä+9»»£Â¨ö+w ÆàG4„1ªÀ»Õ\"ÊcĞhEXnqTh\0Å\04ñ@*I¢å½«€ò/jLÔ‰€ëA#[­=*‘Bf˜Çã5	Ò€(hGJ\0?Š€€ĞP T’9E\0-&×¥HÉ’¡‘\"t¨dƒQbl=[M+tº}ê\\é)·j0 I2Ÿ,ç=\0q¸r9È;E5ªGéùMeWÎW¶†&¿§\\Úİ-í„‹30ò˜XÊ‚Q¶¸ïØ€êAÈ zTjFQä’ß×õ3\rZ\"›M®öÕ|Œ-1&¿Ô¯®¤#–I@UAa†ûÀü¤ƒÜd}u®ã(§¡ÍMÕ•J‹Vt(×_W°´µŠæR¶š\\î23}ĞG\0ëÇæŒ%.KÖ’Õ˜f8yû?u~\'cğßáÑ¶Š\rKVH­§66›¸xIVVYAûŒ<Ô‘[¡Wv;yy` İ*Z§¹ô¹&LëEV¬­%¬{ÛúêmøÕæ¿¶´Óš\'VÄv³ä.s´¡YÄjc?7;3Ï\"¼ì\n‚›¨¶ZşŸğOs4”åM¿zM\'½íéÜŞñf¢<7á‹‡†\0ºŒ©\ZDæ	Õ	%*Ç;vÈL¬ªUôÙWË*õy/¢ô¾İ|‹RXj\n»í¦ö×kô¹Ïx?D[[8S€\0\0úóï]µ%­ÏšŠÑ_sÑôkP¥vğkFé#Ó¼36ch\'¸›C{íŒD§ ¦di¤|ŒŠv–¢s\nLÚ²ˆäb­ÍÛ$;sŠÑfµ²ô­®iAÓ9«@ËiÏv&ã×#¶)‰»–Èö5hÉ¢E|Õ÷÷ CÕ²}ı¨ÁÈ\'=è®F8Î~¹¦Ñ)©eˆÀ¼ûT0)İp\\öÅe\"“3§]Ä·AX´;ô3.P±Ïny¬­Ô¤ô±—sj®zsô©¶¡Ìy×Äo\r.¡¦N¥C1q[%a)j~|ağÄš.¸ò\"²2¾TÇ5×MÛFm8óAµ¹­à^ïìV:„QFé#ÆšƒÉµAŠ‰°pDYéÇÊÊ&½(UN2ù^}lyÓS,—Ïüüşgrš¦…¯i0Mwiwªmk†Ù\rÃC*Ü(fUg\\˜ÌdÈe~fÜvşí‹yqxŠSå‹²Ò÷µ’v²í~–_©éG\rF¬o+&ş«oK¶úÙuo}‹vß\rşjº¶£§ë÷v‘ÅŸg’[©£ˆ”‰dYE	ÚùÄ®I	3°%4–eŠƒp©ÛìÛÒöß½úÁ%åtêZtßº¼’¾?ÌóÏ|\ZÖt=B÷TÓİ5í7í&(–Õfi‘ÑS)$`1M Nâ	·!OÜÏ¯OFiR—ºßëSÍ–œë$ÜWkn¿ÈÊÑ>\"ë:¥n\rÃ2fŠí­‚3¤0IU\\™Ã¹°¬uRÒ®ƒQZêrÃ\ZãW÷Íµ§[³Ùt¯Úë\rˆôKˆÚk{ueÒ¥¹XcòÒPîóRÈÀmËã2ù<|]l<è¯«ÖN×ø­³émvü½Ãâ)V\\ğz5µï§[œ¾•¦Ááí_XÓ­m`¼ĞooMÚ]É/î„2Ú&Å`¼„e2ä®gÕßZ³ÄÒI]MFÖóOøsÏÃPX\\C¦’årı6¹½£ÛE¨ù6[Â­&<—V°”€Ä¢g(‹6ì\'¹$’Ù&¼©Ş\n1}¦¾m¥wës×¨ï95ÑÅ¿ëäy/üSwâ‡šÆ³=¤G-Ë=¬.»sjJÇ¿QÏ}ÇÅ}&-xĞ‹¾šúësâ±Õ¥ŠÃÊµHõvôèşâ–‡¥B‹}h÷>i{c$^Q	ÿ\0=v³3*úi\'Qœ{”ì¿¯ë²~§‡ø¯}—õı;zq¯²6¤æ2v hp|Øê7}ìy¬’ijx•¦_­ÆCh¯V€‰ºÕ4J`!\0Â1B\Z\ZPÃÀŠ\0iĞb˜	ùşÀÛ®Ë\r&68\ZDÎ($c\Zh¡¹â™H cÿ\0† 0½)\0´\0áÒ€\r¹í@\0(ëRJ\0*XÇzPŠ8©bœ\Z’Y:œš’õ¨ÔKEµ¥œñIåJ÷&ÖE˜„ªU¤PİºñÏ]0÷¡%%¦û\\ûU £(½ÛásXé5Ú}­Ş¡âœG&ğf²p3ÈßœõÎ+€W\r·ùö>ÎQŒÕãóÛ}´õ9]sÄVğBöÖ±…m¡#Úr!8^;\'xn1’+º•	IóOcÅÅâéF>Î–ÿ\0—Üu?¼ºÕµ­¬(:Di\"É§™_?0Á`€ÜÃ&–/¨®JØçÀåóÄKÛMiÛ¹êÉ¨E¬yriRùÖ6è#pUw•B¯+b=¥²„²ƒ…c’T\\[ö½ÏCõ¼UË	ÃVºtô9Ş˜¼m¥Ái(ku°X$ªÀ¿¶ªpX–êò”Õ¿#æs:©béªr¿æ¼‰>#\\Äu\rMF2Otòj2Ÿ,¢¬[ÊÄ\0É?6ì`Šp]ğŠSç«ÑY/>ïî1ÍkÂ˜hï¿[ö·Şuú=€E@ª¦Ï2íôk\rØÜ\0ú×;F×;ßÚ•(éK”›ş›I…Ùª\"c§ëUb6w,ÛZºø£”®cfÊÇËƒV¢\'#nÖ>0Mj¢4aˆZ¥ó\ZGÒµQË(¸4í`¹(\\”ÚÇmÇ8âÿ\09¦CC‡J \Z‚GE\09z÷ +øPÑ\ZS#¥CE\\«*œsY´;”äŒzŸ¥fĞ®P¹ƒp\'ó¨q¸ùŒùb 7~yÅ.[æ¯`.`uaAëV…sã¿Ú/ÀÁ–yÖ3Æqòô­êtÓ—CçOkáíM­ï‹dÏû»”\n…=HGã‚A%K+îµ×©ÏV+gÔícº}5g¶¹™ì¢½3<¯tXÍ¸òd]Êû¼­¦&\r¸ğdÉ\Zô•EÆ)¸ùuëÿ\0ï}ˆÂÖtg*U[ä}¿áÎÃPÑe×_NÕ®nôûé µK;x®7ÀÒJŞlo»,-šNK•ÌÀG*ŠÀ×J_Ws¤“Öí·é¦›^İ:o&}\"Ä}r0«(¥k%Û}uíßMV‹¹1Ôf´ğåõæ•3½É‰íÌºŒòÎ¾jÅòÇ.ôóäfl#0$˜€Ã5<BŒ×ÉµÑ½ûyúõ½ŸÕ]ìınïK/ĞƒXÓôßˆ¶–Zw‰cû6©6ÙÎ©§YÊc„G’ ŒÉólU(L•Ø¹É!\0ÚZØYÊ­$Ü:&õó—™æbpT14aJkŞİÙY_·õØó5}gàWç{›g‰ÒKv6ÑÉËdƒ~RŞ¤ğpÃ>¼•Ú‡¹-µôgËÂUòªüÒZ=4{£Ôü]©Úhú¶…<R4±ê÷6³y\"‡H’YeE/ŒE±U\0?v7v¯›ÃÂUiÔæVpRül¶óĞúœUe\Z”ÜuækÏñô(ZOtŞ×$ÌY[Y‘#lìgİØaq¹˜íÎz÷â*SŒ1á“oğR_‘Ğê9Ò©)nÒ_.ÿ\0‰ÇüT/~İÍ¬v±‰~êŠ©¡\"Ú;\r„óİ0zY»‰³ÓÔùÌs•L+Ÿ.×ü&ğŞo¬Ïk§\\;­¢9š÷ÈEP±ªrÇKmÛ–Oñkê+ÏÙÁÉ|[#ã©Sö³·E©WÄ²½Æ³s$¨©+6æD\0qø?\nãÂ,Dyfdcš´s)ŠãS@DF*Š¸@!§¥YC \0Šh‘íL#‚†‘š\0CÔPĞÅqh£­c¨3@„=((mÜv©(JlLQRHáÉ Ö“Ã¥ 4\0 b€+€´®šC$Z‘^iÉ£™,j‹^ùéïM«AÑ®ŸªNÊ¶±¤ÛÔ±Û98`ãœŠ=«P•8ï¡úY„öt)Nk¤ŸÏ§àÙÊxƒÆsßİ…¶’t…­Ò\r’íYĞœ0a’3·Êv¼^Å$\"µïs,N>r“PÚÖz_ğN5Ü›…–E-¹·ã<õõı\ZôtåiD&ÔÓ—sŞ4\rp¿‡í\"G‰\"ŠBÊC×?:²2Îß(Ç®kåªR¼¹èıQ(Ú;€ ·¶»k¨~Ãm¼í»ùdˆ’B,cl‘™	ÈÆvI\"äZåÄJU%µz^ß×oÅ#İ¡/«Snê)»«÷ê´ûÎyu)5¿FùÒæ\r‚å¤ÃîI]„0;‰ÂpAÉÉjí •*Z3ÆÆOëŞdî’2ôk?Cö÷-¨H¥¥œ·’»·*d÷Ãdàœd¹®éUS,6^V¿™óêŒÜêJíüí«Ğö­)‚Æ	ãçÍqz¶‚ÂáÕWŸSY¨ÜÑÊÈîô1m—tR8;Ü.§\'­h¢fåc¹Ó®íLkş“SÀÃƒ“øQÊG5Íû8£aX1qV¢O1¡mn$b~UJ‘§oo€8â©@kš6ñştùu*æŒ ªìReèÇì&\\S)ŒbÃ<sÖ‹3JÃ~(‡ª[bE9úĞ&L¦š!Ş‰hdÆZM®ËÜš–€¯*õı*mrnTp¼U(äg\\(\0Œt¨p9—pÆÙ9ÓQ°œøË ‹ıáŒLHÎÖòÉ=­REÆ¥™ùûã›a§ê²ÆøC¸åHÅ\\bkRi›×#ñ6‘—9j\r²`Û<äf¢vè\Zd\n«#µü™m×úü¤rÕ¶…ºù_/éN…¨ë·[Ë;hîmšæâKO´ß”+Ü[Â>c‘åP7Œd•x1ta‰ÒRkE}4×fûë­¼²RÂ|S^{¦¿Êço¡xÓCø™A<İT[˜gİ²vfHà \r²–\"Ÿ½òÌFôò¼Éáªà´İú¿?Ñ¯Ku=jx¸âbÜ]’é®I_ñèWºÑM¾±Kyíîå–}¦—+G1/—¹%$€Æ&MùÊ=¿Cæ\n…>x;è¯Ö^½?Tztæäï5gk$‘KÇºV£ã?_éÓÇ0Ô´ç7ñ]][›u1¬öççc”‰¢Âàº?€šÏVLTeöe¥¯}z3Ÿ0ÁË…|›­nqŸõäÖ<šA\r,úV±Õ´br¤C9ä8‘œçwÊ%8ûÕëãi{<C¬¶œZzu[}èù¬º¯5Eï	&µéÔí`¸6\Z\nbÚE’[¨fšİ‹¶eï‡‘×Œ‚ÙÉ¯p•J¯Ø½“·şşGÔ¹*0^×«ÿ\0Û´9_êbOn¹˜Ä\'¿vùEÊ*	˜\0òK× äçèá)òVåİ¤¾÷cç«Tö´œú9?¹7s•¾Öã‹Â¶°X¤vs±¶·¶†Øá‰yˆsóHİòÇ\'/˜‚Ã×Q½kJWk_E§õèyîP†Î*×÷VŸ¾­znİÅëW\rw1l€síÚ®äW>Oñ™ëC‰‹ïA$DU1ÇHÍ0¬±¸ëBÅ\0\'­1¦6˜Æ‘@\0%\0ltë\\Gš(4\0¥¨h$(7ŒĞPêW&Ã© §q1ÃŞ¤‘:c\r¥&&‡I€ QpÜ^• ( Å!QIˆ‘E+‘±*ğ*I\0y ,I‰$U$…, ry?•\ZÆ.RHİ»Õ?á\'×4í67ÙÉ0i\\.åO)‹rAØcÏq¹®Êt~¯IÔ—Åşgß{u^´0Ğ~ìBfÛJ¸¼‡I¸E‚ıÕ~ÌèEgf}‡\0r^Eã$!]*•T=ªÕÖÃá¥?c\'gÒÚ¯FpÚ–‰$ZÕÎŸı£nZ)?ç¤`e_‘¹@ y¯UUN\nlğcB|î“ÕÅğòÁ_C†K»È‹À’Gå¡HmÙèP‘ƒ»§QƒšùìLÛ›åGÙà¤ãIAîUñg4è4»­\"Ût%®‹Ê±F¬›\0bBàáÕ€\0ç“óg &ğxI{EVdæ¸ø}YĞ‹÷®3ÀQ¥Ón‚am<‘‡‚xÙÒäì;ŠõÚ~cŸ^qUŒR‚wWWWR5Rv’Kò&ÑRñşª–²½ÄÜÈ»—fÜëórœ/=ÔúV©IP‡2³g5YÂXš“º¹ê°HğÁòòqĞÿ\0Jãz–™Jæ}Bè„S¹@9%N}Š2¶|z¸Ù\'sóÂ~+»ıõ¼ìÏÅi`täçôïÚºS	FVÜé|\'Š4)¼Ó¢ÊŒ¤u‰\'\n½şq±ñï¹±ÏÕÙ37)ug¥xKã­ö‡\nÁªŞEŞg–#¸Æc8MìÊÜH\'¯AÒŸ*{¹´õ=KÂ´©H\"y	0Ñ´jƒ¦IguãœdgéSÈÑ^Öç²išœpÇ&ğ®W=Hã8Ç=kNT5Ræ´EùNM.UĞÖ3îXˆåG¯sQfnše¨î6ãu4Y2Î=y¥bÓ$óséJÅh/™éÉ WBoã†ñè>´€Q(õî!âPõ¦+%ÈÇ<UĞÿ\0;p\0}ª¬M„’`ƒëG(„qã=©4ê3 ä±\0U(JVĞ«=ÊF¬˜5vG;“8øöÛCY]åqÖT9íó¯\'š—æÏüñoÉ%–Šú¢^d(Hƒ&ÒyÉeV\\sÔ¾)¨Øçu™å+ø[ñY³/ªk÷)léÍ­¬‰€à³\"ŒŸö¹\'?Z²µ¿SçŸü:Öô¦{Á9A÷²³±üÎE>dh¤í¹¡ŞİhÚ”wPHÉ4yêa—±£Ò±š±½:-3êiú_‹FšbG“BÔ@ûE¥º™\'e-–ŒGrJ1Şˆ7Kæ6§µw}W^şG½B¥:nÉ­}>öÿ\03\'â×Áë›}Rñe†¨òİÛÙÛÏs-œjË;<ÙË®ydàna½$ØJœVx\\Å{UF¢ë÷vWê¬ä”é>W­–íÚ÷ğ\n~ñö«6¶|%â›9#–k1§,W)£Á}²ìHò¤=OLç~\'„ŒS¯AìîöĞœ1ÊÔêÅ-·×ş‘Òé\Z:éZÔVŒm!c;Ú5ÎŸ\rÄ±ÅÑ“#¬ŒFŞFŠxC7b¼J²RN£m¥g­–Ûl}{•èrEn¶Wêxÿ\0„´I<+ãí[B¼«g}h9CÜ*Lœò¤ Àõ8¯©ÅVúÖaİ?–ß©ùÎ\n”p¸ÙÒ›è×êzGˆœ_é°´0­¹›Yµ¹Úféâ7!ÉKâ5à}ÒÊ3kç(^%úKòkõ>¿ÕJ0«oåüÓı9øæŸiXFKv¹DX¥ù^Uy>F¨\0õ­zø8¥VIïşVGÎTœ½Œ9zşm·úœ®k.­«CÖ–ÈÑ”y!Wg\'qPää¦J‘Ñ‚ŒkÓ­8Ò–[íÓ¹çÆ3ÄTm¿v)Ût®õÓĞÁñ$F=HŒ“”S“ôœ5‰ó˜µi™ñZ#„Lğj˜˜Òx Æ5Hc\r0j‹½0õ 4LSC\ZE0\ZEƒ@\ZÕÄy¡ĞPn ,8\ZaM\0/N‚‡áJÀ­+\0úBX\\s@l9W<ÒÜ7¦â)\\¤AvĞ…æ€&x©ÇŠ–KÔp9 h‰ ç(eäuFqÉ8ªŠ»:¨ÁÔ«G«F·‰´`»¸Ô4F…‹*Ü@Hl4a˜áz²á\"w.{g…\Z¼ñP«×o3ë+a):”~Ëû¿áÌäñm½åâİßÙªŞÂ‰wÜ\Z_T÷•ZIYr	\nAâµt\'¸AèûšCJrU+E©.Û—¾#µ›Ä¾xaö1†9\n€Á¸àg…\\cœdã*ıƒTyVãxØ¼J›ÑZÃá{Ø§XÖF,T…+óyªN\0LpàŒ.0r;uÑIE­µ<üD§Şúìl\'¼Ô\Z(Ù^I-åXãU~`S\r‘Œ°ã‘ZNj\nìÂ•9â%ËÎËÃzsİÚ^¬&	å6Ñ¬r,ÍŠJ® 78‚3’IÀæUª¢Ó’Ğúœ6\ZR„Õ7ï}İ\rOƒzl˜‘äÃ°b×¡!°yúŠ¬SM«¸88ÆÏÌö¸lHˆcŞ¼³½–ìmaIWrƒƒÈÇHÁËS½Ñá‡jmP9íé[ÅÊLì­-mš5ù€t­¹QÎäÊš×ô_DÉ}eÎF7:\rãèÃ‘Z-ç±å~)øiì\r4ˆ22Á\\İ7g¿#\0Õİ¢RÜóË+ßü$Ômæ‚g±²Så.ŞT€ğ¾nÓ·wEWÈÇ½l¹d¬Eå¡íŞı¯#ó’ÃZ¶fbv”!ÜÉ8Èéè@nüÔ:MltC¾Ñô„~2è>*„5âÊ:0“Tû‚súV-;luBIê™ÛÚëV÷”u`$YìuÜ´/##9ßÒ•Ë‹,G:±8ïM\Z=‹JÃhç­6ˆ¸ŒáO+&ZdM1¤¡¢~´&;7G©ª¸Xi¾¾=jîKCN¦¨q»œtÅ$ÌÊW\Zô*æ1*³€	AÉ\0ô8÷çJ´ÌdÎ{_ø¯¡øa\\ŞêvĞ”\0ÉºAòŒgŸN@êFkd›ØæE©ä^(ı²ôXç‡B°¿ñÈBŸ±F\"‰IÆI!õäsÆ·öR{œ2ÅFö<÷ö‰ñ·Ä\rMíôËY,Âº*Yø»Ëƒ! àƒ€3Pâ¢\'S›^‡C xU™\"›Ä>#Ôµ)“æXŒÄlŸœ’[æäıÜÜb¦Æ.}ê+X£ŒF‘¬I×œŸ\\úÒ3·Ê òéšLiu<ãN“m%´³ùöôÏ•I´•µBLØÇ_J››\\ô?Ş0ŠÓW“ÃZ£Ë.•©†D‹Í*©!ûØÇ!œ(Á;ÑŞTdæ­—<zŞ­¥ìå×cê;K­Fòâ²ÃãBM”Öé+ûÍ¤Û^´r 3-Ê§”ñGÇ˜¬@$Œø¸œ<jFë}?¥Øú:uy¢õ³VşËïÚÛ§¿~¶ğ¿Œ\Z\rÆsgâ9¤û,¶†Æv·VQkĞÌ;w4E†T20àZéËkÂiáêéÍ{õ×ª<ÜÂ•J*8›¾x>ı;z›GÄÖ¾*Ğ Ô–­ÌÍãi®%X†á‡*]C³Œñ±9FÌú¼°Õ}ïmz',NULL,257121,NULL,NULL,NULL,'jpg','image/jpeg',5,'2014-04-28 06:30:04',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province_states`
--

DROP TABLE IF EXISTS `province_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province_states`
--

LOCK TABLES `province_states` WRITE;
/*!40000 ALTER TABLE `province_states` DISABLE KEYS */;
INSERT INTO `province_states` VALUES (1,'PP',' 	Phnom Penh Municipality',1,'2014-03-29 14:16:09',NULL,NULL,NULL,1),(2,'Banteay Meanchey','Banteay Meanchey',1,'2014-03-29 14:16:09',NULL,NULL,NULL,1),(3,'Battambang','Battambang',1,'2014-03-29 14:16:09',NULL,NULL,NULL,1),(4,'Kampong Cham','Kampong Cham',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(5,'Kampong Chhnang','Kampong Chhnang',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(6,'Kampong Speu','Kampong Speu',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(7,'Kampong Thom','Kampong Thom',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(8,'Kampot','Kampot',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(9,'Kandal ','Kandal ',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(10,'Koh Kong ','Koh Kong ',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(11,'Kep','Kep',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(12,'KratiÃ©','KratiÃ©',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(13,'Mondulkiri','Mondulkiri',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(14,'Oddar Meanchey','Oddar Meanchey',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(15,'Pailin','Pailin',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(16,'Preah Sihanouk','Preah Sihanouk',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(17,'Preah Vihear ','Preah Vihear ',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(18,'Pursat','Pursat',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(19,'Prey Veng','Prey Veng',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(20,'Ratanakiri','Ratanakiri',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(21,'Siem Reap','Siem Reap',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(22,'Stung Treng ','Stung Treng ',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(23,'Svay Rieng ','Svay Rieng ',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(24,'TakÃ©o','TakÃ©o',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(25,'Tbong Khmum','Tbong Khmum',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `province_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'R_ADMIN','Administrator','2014-03-27 16:01:26',NULL,NULL,NULL,1),(2,'R_CUSTOMER','Customer','2014-03-27 16:01:26',NULL,NULL,NULL,1),(3,'R_MERCHANT','Merchant','2014-03-27 16:01:26',NULL,NULL,NULL,1),(4,'R_COMPANY','Corporation and Company','2014-03-27 16:01:26',NULL,NULL,NULL,1),(5,'R_EMPLOYEE','Employee','2014-03-27 16:01:26',NULL,NULL,NULL,1),(6,'R_CONTRACTOR','Contractor','2014-03-27 16:01:26',NULL,NULL,NULL,1),(7,'R_SALE_REP','Sale Representative','2014-03-27 16:01:26',NULL,NULL,NULL,1),(8,'R_MARKETING_AGENT','Marketing Agent','2014-03-27 16:01:26',NULL,NULL,NULL,1),(9,'R_CS_REP','Customer Service Representative','2014-03-27 16:01:27',NULL,NULL,NULL,1),(10,'R_TECH_ENGINEER','Technical Engineer','2014-03-27 16:01:27',NULL,NULL,NULL,1),(11,'R_BA','Business Analyst','2014-03-27 16:01:27',NULL,NULL,NULL,1),(12,'R_PRJ_MGR','Project Manager','2014-03-27 16:01:27',NULL,NULL,NULL,1),(13,'R_SE','Software Engineer','2014-03-27 16:01:27',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `address1` varchar(120) DEFAULT NULL,
  `address2` varchar(120) NOT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state_province_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  `account_number` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `fax` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `min_order_amount` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT NULL,
  `created_by` varchar(30) NOT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'engeunge','w','1','w','w','11',1,1,'11','1212','0','0000-00-00 00:00:00','111','11',NULL,'2014-07-04 17:20:18','2014-07-05 23:37:39','',NULL,0,NULL),(2,'engeunge','00979','1','ewe','w','11',1,1,'11','1212','(092) 302-605','0000-00-00 00:00:00','111','11',NULL,'2014-07-04 18:11:42','2014-07-05 21:33:35','',NULL,1,NULL),(3,'engeunge','00979','1','ewe','w','11',1,1,'11','1212','(092) 302-605','0000-00-00 00:00:00','111','11',NULL,'2014-07-04 18:11:54','2014-07-05 21:13:03','',NULL,1,NULL),(4,'engeunge','00979','Eng ','kompon Chhang','kompng chhange','Kkompong chhange',1,1,'11','SU-020200','(092) 302-605','0000-00-00 00:00:00','111','11',NULL,'2014-07-04 18:12:52','2014-07-05 21:05:38','',NULL,1,NULL),(5,'dsdfds','3242','2','2','2','2',2,2,'2','2','(222) 222-2222','0000-00-00 00:00:00','2222','2222',NULL,'2014-07-05 16:45:36',NULL,'',NULL,1,'22222');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_migration`
--

DROP TABLE IF EXISTS `tbl_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_migration`
--

LOCK TABLES `tbl_migration` WRITE;
/*!40000 ALTER TABLE `tbl_migration` DISABLE KEYS */;
INSERT INTO `tbl_migration` VALUES ('m121103_133830_create_people',1395936086),('m121103_135251_create_users',1395936086),('m121103_141403_create_roles',1395936087),('m121103_141708_create_user_roles',1395936087),('m140328_135242_create_customer_types',1396016242),('m140328_135256_create_customers',1396016243),('m140328_151047_create_countries',1396021177),('m140328_151101_create_province_states',1396021177),('m140328_151114_create_title',1396021177),('m140328_151133_create_communes',1396021177),('m140328_151141_create_districts',1396021177),('m140329_150250_create_locations',1396106934),('m140419_162409_add_customers',1398434535),('m140420_034536_create_picture_type',1397966195),('m140420_034545_create_pictures',1397966195),('m140424_155356_create_menus',1398572597),('m140424_155639_create_menu_types',1398572597),('m140425_013231_create_menu_types',1398431468),('m140425_013722_create_menus',1398431468),('m140425_140034_creat_menu_roles',1398434535),('m140426_092448_create_customer_shipping',1398572597),('m140529_102102_alter_customer_shipping',1402204740),('m140614_130349_create_suppliers',1402761953),('m140630_083235_create_currecy',1404580079),('m140713_155928_create_categories',1405267895),('m140713_161526_create_item_types',1405268396),('m140721_175500_item_unit_groups',1405268397),('m140721_175509_item_unit_details',1405268398),('m140721_175520_item_size_groups',1405268399),('m140721_175540_item_size_details',1405268400),('m140929_145223_create_item_codes',1412004182);
/*!40000 ALTER TABLE `tbl_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES (1,'Mr','Adult male','2014-04-03 16:21:03',NULL,NULL,NULL,1),(2,'Mrs','Adult females','2014-04-03 16:21:03',NULL,NULL,NULL,1),(3,'Ms','Adult females','2014-04-03 16:21:03',NULL,NULL,NULL,1),(4,'Miss','Formal title for unmarried females or for female children','2014-04-03 16:21:03',NULL,NULL,NULL,1),(5,'Master','For male children','2014-04-03 16:21:03',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1,1,'2014-03-27 16:01:27',NULL,NULL,NULL,1),(2,2,2,'2014-03-27 16:01:27',NULL,NULL,NULL,1),(3,3,3,'2014-03-27 16:01:27',NULL,NULL,NULL,1),(4,4,4,'2014-03-27 16:01:27',NULL,NULL,NULL,1),(5,1,2,'2014-03-27 16:01:27',NULL,NULL,NULL,1),(6,2,3,'2014-03-27 16:01:27',NULL,NULL,NULL,1),(7,3,4,'2014-03-27 16:01:27',NULL,NULL,NULL,1),(8,4,5,'2014-03-27 16:01:27',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'engeung@gmail.com','engeung','5228ef99f5e71f01b33d2023c016ff9f',NULL,0,NULL,1,0,'2014-07-19 23:00:28',1,'53344b5685b96',NULL,0,NULL,0,NULL,'2014-10-01 22:01:43',NULL,'2014-03-27 16:01:26',NULL,NULL,NULL,1,NULL,'53344b5685ba0'),(2,'amberkong@gmail.com','amberkong','5228ef99f5e71f01b33d2023c016ff9f',NULL,0,NULL,1,0,NULL,2,'53344b568c7a5',NULL,0,NULL,0,NULL,NULL,NULL,'2014-03-27 16:01:26',NULL,NULL,NULL,1,NULL,'53344b568c7b2'),(3,'lamakong@gmail.com','lamakong','5228ef99f5e71f01b33d2023c016ff9f',NULL,0,NULL,1,0,NULL,3,'53344b56933b9',NULL,0,NULL,0,NULL,NULL,NULL,'2014-03-27 16:01:26',NULL,NULL,NULL,1,NULL,'53344b56933c3'),(4,'natashakong@gmail.com','natashakong','5228ef99f5e71f01b33d2023c016ff9f',NULL,0,NULL,1,0,NULL,4,'53344b569a158',NULL,0,NULL,0,NULL,NULL,NULL,'2014-03-27 16:01:26',NULL,NULL,NULL,1,NULL,'53344b569a167');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii_sessions`
--

DROP TABLE IF EXISTS `yii_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii_sessions` (
  `id` char(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii_sessions`
--

LOCK TABLES `yii_sessions` WRITE;
/*!40000 ALTER TABLE `yii_sessions` DISABLE KEYS */;
INSERT INTO `yii_sessions` VALUES ('ldijtln6qdbvo0rj5vfihd7jv2',1412180057,'flag|i:1;first_name|s:4:\"Sith\";last_name|s:4:\"Kong\";full_name|s:9:\"Sith Kong\";is_authenticated|b:1;guid|s:13:\"53344b5685ba0\";roles|s:4:\"1, 2\";');
/*!40000 ALTER TABLE `yii_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-02  7:03:15
