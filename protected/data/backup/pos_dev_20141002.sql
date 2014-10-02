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
INSERT INTO `customer_shipping` VALUES (1,2,'អេង','kompnong change','2014-06-02 13:09:47','0000-00-00 00:00:00','engeung','engeung',0,NULL,NULL,NULL),(2,2,'អេង','កំពង់ឆ្មាំង​​ ផ្សាឆ្មាំង','2014-06-02 13:13:11','0000-00-00 00:00:00','engeung','engeung',0,NULL,NULL,NULL),(3,1,'Eng','Kompong','2014-06-07 13:49:39','0000-00-00 00:00:00','engeung','engeung',1,NULL,NULL,NULL),(4,2,'eng eung','phnom penh','2014-06-07 15:02:34',NULL,'engeung',NULL,0,NULL,NULL,NULL);
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
INSERT INTO `pictures` VALUES (1,'4.jpg',NULL,'����\0JFIF\0\0H\0H\0\0��\0C\0\n\n\n\r\r��\0C		\r\r��\0�|\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0��ɯ�<�1�p�\r\0�n{�\"�E �C�6椁�\Z��	��($B}h���,a⁡>�((\\���a	��3�je-0=i���;�TUɗ�D����E�`��h&��(*�h�Llv7u��;c4��,j�-1:t��,�j\Z%��i1�h��N��Hb�\r��l[���M���)ؠ\0@I��@sL�c[�0BR(Q@���@��\n\0(\0�=(\Z�AAҩ\0S\r\07���@�(\n	\n�=((osT�ŦHb�\rH��А��T1�f�-	�`%\0\r\r=h(CLɦI��R\0h�i���3��0��@���J\0\0�1�R�7 �@�\0�C@!�H��i����4Xvi\0��\ZO�\0���I9�U���4�<�\0x�A,I:R@������\0\0�E��@�P!��4q�j�����T�3��\0���2���ɤM��!�nj�\r wS\ZJ\n���\r��s@E�7m\0�1N�qA�!1hP@	@=1Lc�\0֪CBRc�S@6�A@��@h\0$PU \n`\0�\0�\0R��P*�R�1(\04\r\r��	���M\0޹�R~t1@\r��L��8�\n�(��	�*H��\\�`4�\r\'�P�Ӱ�!4�hi4�n�.;���\0S@�f�������1�9�J��$G�U\Z�F�4@3M��$�s@��(���\nwwb���$Ӱ$5}�x�XpMH�ސ\r�TE�Ls֘�b�L\n�\0����y�`�0m\04\0b�\n\0(\0�bh(	�$&sց�G�1j!�M\r\r�Xcڀ\n\0(�b�\04��qE��)��\0Rbb�B�1�2��֨bP\0{�1��\rj�S\Zf��\\PgN(��y�����~t�J(8�t�!��`h�Ӱ�4X=)�a���i�Ӱ�(n(\0�␁�S@��TPg�Š�����+\0�Ҥ�Viq8��!1�\0:P4%������vw�1s��SEK�h��\r��psH���p+�@�m�j��#=��6P\0\0. n)�c=�\n�m�p\r�\\����PX�h\0\0\Z\0J�\0��@�BP0��f�	�Q�	�sHu\0ڰ\n\0(\0�74\r\r<�!�@s�AV���bJ�}��h(�\0\rҀ@ טx➔\0�‵�j�b�\n8�°f��f��a��74Z4�\Z\nA�Ӹ�\nB��(6\0���E��4���,q�H@ؠ��1J°֦1(\0�hOZ �\0�ژ�<SB�1�N(h@�K�iq�}E\08/5\"o<S�ZcB₈��Қ)\r<}=j�o��$:�;����asHxT`�t��ިˋw�9*�qш!�A�i���+�aujO�m4X,>t#N�<~)XD,6� �#��yN}�����g�<�,\0EK��J`>�\0m��\r#�0\ZW����JӺ�#��f��;��@4�PP1(\0����w\0#�(�0\n\n�P\0x4�z�)!�Hb�\0J\n�P1��ii�c[�2�\0�M\0�\0�3�^a��B�\0�AC�f�X��P�\0gҀ��@N)�����v(Py��\0f���aҨ8�L��%XU�@�=(6��9�A\"P0�����\"��h��Hbb�\r�@�4�1�qJ�(z��bc�Ҹ�\n{��:f�Kk)�d������!b?*�u)&�Ga�|\"�5��s����(��Ϝ��\ny ��\0c�M#UN]MT�8�p��P��]9Գ\\g�4\\���<��L�Dd��\n�+���:=?�����k���BR���d�0�إ�46������3��S[���4�������4{�o&{��% ¼��DF��m����Y�QK��*�ź���U��s[Z,s{�\Z)�͉#m�T�ڪ��>I���oʞ�\r[k11��G��d���FeXF�$�	ŷ7�rD�A��V2�t)F�L�QF��]i�5��8�\r���(�R�<K!�)*�cXTo�A�n6}/B����G�W>mЎ��Rө���dDPDarc��U���YA#d�`�����>�$fm9nld.�-\Zt�� ?f�\'�i�*�P`F�$qQ��Wl���Q���Iq�[6���Z)t�X+0�]�q��C���)=�9���y��\0�C�ɦ��4\0�U�`ҸV�c��i�w\ZV������a�S�PP@4N��0)��֘�%@�&M�a҄a��a� \n\0(�4�S\Zj�h\0�Z\0\r\0tU�8�j�a)1��L\\��![�4h849���	POZ���(�&&!4�!�`PR�i�����@9�h(�P1hc(\Z\n�:P #�\n@�\0\0�S�LL���*I\0<:d���=�w��e5��uH����m] �3��I�0p�$t:��s��\\�;���������٘K$SMe�_}�ȋ�˃	*Wﬀ��\r����6�{-oI�/��g1DV-d��ݛhE3ar]\"��I���M�7m���{�^;�F��#��u�s/����L�|>�(\0��y��\0ֆ�%[W��:���Ε(����>b�H�s�ҝ�/�q�r�fȣ�E&;Z�b�n{[G�@ �c�XBU�Y?w�4i\'�Wi�B�Z%^�r����N���u`�\0(�`�c$%��`h�l��F,�Y�+�M\nWvz�8���N�D������gS �FDy3=˩\'G��ݗA[�DӮg��[x���\"k_�;�L��Wa2���F$�c,v�ܑ�5jq��V�ȸ��iZ�(��<Mv�α��Y�[q�xb, ��ݚ�(j<�V_��ԖR���N�%�w���M#5���]����-$���Wd������ƚ�z�@���\rf���HHn �8\r����8b��Ѫ\"���w�Cɓ�Eg*w�]?�̨I�\\��a�<=������q���7����e���;�:08W/J�Q�N�H|\Zko�?���Z���ҚN�\0y�⿁\Zm����|D#Ky\0H�-�O9\Z�\\���b\Z�(oݸ����M�x����fU��m7FV�g����k�<M�JCo����>�:�2�3ԩ�t�8biI��J�^&��\\�uO���k��<�\0f�B����Zw�9�p[�2��E��f���qM\0�`\0P`�i��44�j�%1��i�R��\ZMQhF�B�\Z�i�=h,(�`�	�441��Ҙ\"�A������j�HU�CR!GJ��n�C\Z��&�1H�CH�hJ�����L�l9�1�����Phh�P0�8\n\06�v�@ؠP!�}�\\	�+��m�r�)��pRz\nW���i\\.H),�q2C���GsI�M�-OS�G��K{{ۻ�ÆAo������u��R�`>�U��B���笎��<��L�{�-�p��/���I]�9T���۸�+h+h�	I�ݚ���Gf�^���$�kTdQy&I���p$�W�\'=k+k�\rFL��S�\\���+��1�%ͻ���,�l+�j�B�kZ7E�r��-_[�H�}>�������<���СA)f/����ʀA�0�ͭ�U7�K�k����$-#̗[m���D	��K�d��ರlZ����th�$���WV�n�u��g����k`�m�w��<����R�0`�;�#iP�֏_��2�ܔm�3������a�ӵ�mzݒ�͡�i)�O�$ج*NԌ��\n\Z����ۏ��߹�5�5�//�|ښ5����A~��3y\"6y; iC0Y��u�w��)Q��t���˒5߻����EܳG�,[�Kwxa���d�-$G$�?�	�����O�9e��k�r9�Ŷtԯ�fi��Ϲ�\'s���H�I�Ǜ?��.�s�j���_յ9e���(C��6��ZM�۱o�<�I̓H�Ks���]�,�J�5VRq����-?��Еn�/�h�t\\i�N�O���m�@i��-�&)$�w3��$G\n��L%5(�jK�Z53��_ki{�[�%���WM\"���[{�!>U��a<��rX�5��n΃�z���v�s��{m5��˪ڲ�����\0�Ka9�T-���\"�G�5&�~^}>OoTzpOD����֛������y��4���m#c��D�c�uU}�#9*��$��b�M5��]^�z�K��\'%�{��z���Oi=͵���Qe���<��XIQ�B��ݷ�3ܚ��U�]�7��P��.����z�¤��1`��T�NH�Gz{�t��k���#���3�z����#<Pl�I���3A�8��(1@	@B��Hb��0\n\0(\0��S@�#4inj��\n\0C�\07�R\ZL��.-\0���H�֘\n�)���+\0�����Lb�\rb�@�f���Ɔ��J�	4�d*���\n�v�9�HWCq�c��p�	����n��PH��\0ZL\0�qI\0�����ۚW����\r�拕pEĀQq�v8�JLth�2�+;�QFK�Z�WS�<	���<w8:����\"2�b~s�C��������u=Z0�1���t���i&�g������$�L����*��ѻ��Tش���h��^kZcE.�.��P�$���bD�rX$8�৆����E���;)a�QZ(�^�\Zh�N&�m�^��U ��68��̧͑�v��>zw9�5=��Sխ���乥��\01���X���SֵX��b��K�#!9x���!\\6H!`�f=�Q|�%��\Z�%�z�x�~�ol���YZjW�yp�C4�\r�)#�i�`����`n�<S�9EΊ�WS��\Z<�5[R�ޟ�ܳ&�k���;�vvpʆ	�F������I*ĩ)������Q	�˖5n�\ZԄ!Rq�{KS>��ÉcK��Yh�2����xɶA�̽JFFS��/k)������gg9M5��[�,|C�6ԧ�<?�Kn�0��MF�i���I)�K(-&W<(7v�#�Tq*�+>��uөMͪqN��\0��_x��pkZn��d���i#��v�i#�r���I���P�h�!z��5�0�aIԭ{��\0�	Uq��t�^H��6�����N�4�O\rA´\Z����a���,*#vv�a�6��8u��I5��穭|=NUkw���ׅ�[ogz������-K_��2�1��*�\0h�>^@*@V�a��\"�o�-Wc8`��U����E��Y�����O��k�ۦ���[L%!�ьL��Hf,�\"��攱W��a�s8��Jlї�ڢ5���:\\���/�j��q;|��]�s\ZL�iRʟ�	�5<S����kS�Zs_̷o�}��E��\0���+cٴ��#�+/ 1�aIZ074y?���q5&�\r���XF�]���5�\rLj6�T�J-.���kI���0���@dI�\0��0(�YF��K����3�S�w��Rե���\'{]L��Ʉ�����\"�I����Z�1��2�+5\'%g��Û��f��N��-�/�.&�D`���4h\0�AR\"<��ӕRV�W����ԭ�c�/x��~�΍4��w�{�\0-��-�$�m�昍��.� l(�0�r�\"w{z�.#\n�\\�d�����=s��Qg{y��+5��dg 3���y��]����	S|�2���ii��j���j��օ	�\Z5H�1Ҙ:Դ\0EP	@zP�@\05�(i��\0(\0\"����AL�\n\0�+�<���P�<P!(��h=i���&��êI\n\0(\0�)�+�&���K@��wG4\r��#�!nGѪ��)�c��1@�\0P@\n4�*�R&;��@�&��!j�1v�S�b��\0�b��3��\'��]���2-��b5m�7R�󎆭+=N�-m>n�=z;�VX��K��Y���Gv��EX���r�p�\0���4zuUMu\'����+����,�sq2�<�U>T�#0;��)(]�nFҩ8ӧy?�ׇ�9I]Z�;.�W��V-\"�Ѵ�2G(�X���{���w�c�Q�y�\\�.K2ܘzJ�uj��z���c\Z+�}?͙~��x�=[D�𫾿����p�V��ϘcC�(A���\'��q�VK\r(��e-Y�S��BR�O��]�B�U�xund�KK���ڄk�󲸗�I���Π(\'�^i����D�G��t8JV�O)]����������y�xGR�u��7�	��Y#`�9k����T.27�,f��_��(���֧Eoq�҃m���\0����g�.���t�E�ҫ8��\Ze�&c�,�Ye�<��D�����ԥ\n�ԕס��Rt�+��ɼ���ir�w���s.����\"��uA���O��:Ɗ2����oVs����K���Xzk��\'��v�\0#N�CѬ/-nt�\Z;��KU��W\r�[�h���FIA0p��s�%I����\0�����1Q��K��՛6gPҳm5�V�g��XBw�b`�\'��G�l;�MF����)+�s�}���H/�u+�n�\Z|1<W�t�;��	\\���P�C�6��^�t�R�~��4�*M�+�_.���^!/q�������]J�񿔬C:#I[8#oަW�u\n4ܟ��9c-����kr˧[��Y��O#3�̭��s��YѲr#gdR5���c�\'�F�z���k��;]��uQm<�G�ZeV+�1������_4��Xm����\0˧����M����Gþ����ҝt�������뼈mnF�t�R��BQHm�I�J�u���fK6�;F�\Z\\��Q�os7�Ozh���|���Y�G:�����( ��(��j�\0-���S�NZ9hO��K�Ci&�{a6�sٙ��t���L����]��ZUl�S�(���������o5��\0���WV�}��ylB8�6rUd���y�<���QR��Q)J:��_��qD�c���*Gt�\n�Y��pnf_� �%\n��:K�?��\\�+�]v8O�*�+8, �k�&\r�[i�hdHń���gH|�T���Ppo۽G�u~�5WNwT��x���*�As�r�HR�o�UIG�H#$�n7�j�%/SΩI�9B��5f0�N�aMh��։�q��V�FO5f�@FM��i�I恋��ր��(�zPXݼt��F((\04�T�84��\n\0�	�y��2�v���!\0��`���c<P-�P@)�����;ip\'4\r;\r\'�2��Ph�)\\wx�DX9�(Z@.�E�6�p-\0+E�i�LA��&��RKw@��z��(�\n1J����P��l���\n\ZB��f\n�X�\0�I]ظ��u:g����\n^ڪ��޴�v^$d��*~�\0w\0���q���=:87;J[���H)�ǧ�����l�@��F.N�+��r°(�$�BS�rG��:?��Y�����//#H��\'�-͜������\Z@�ϖ�d�Q!���ϕ+�\0_��th�����wĚ��>�k�m�.�i/n#W����r�cۅ`�<�7(�\n�����<E[���\0�=,}��:\\���}��Kko��\r�\0�z�����ڿ�\"���̵�\\�$�p��������N� �R:+}��\'*���ӗu�g�xkK�����\r����}�s���Y.�Is��gU�\\+����%<�e��9Ss结��O/���Rя��\0i��o�7r^�X��k14~C����Q���������2�����3�3Kߦ���\0�����!��V������\"�xmR��]:�L/<i�YI��~rQ*\\�#F0W��y��U���\0�$C���L�]��L/T32J�H�����F�$P��WDW�g�夙VO^��ֱ]$:M���ȫvO�\"��BTm!�2 �k�ʾE{��	5d7w�5��ٔ]�hB��ʡ�@�j4jb.�����\\��]Q�Q���$��3�!)#������8�FLC��S$��1�����4��A{��7�\"�+Y�)fY��g���D1ܙDjw$�VV�,�\"�9�n��V�e��*����m�Jе��\"E$�4l|�\'�佌��c&�%ܪ_6������3�+��=qo\Z�\0���k�2-�-*�Z���N��h`�h�!�v��Y��/Bx/n!�`[x���6�b�-��\\Kkm4hM�����C�������I�������b]3Q��,\'��A��.\"�Ԥ����K��F\"�!\0[��\0���)i��l����˯���>C��V� ��F���&k��CZ��C;����h��������@gj�YK�i��\0_���}ȯm���Y\'���7��5��M�w���4��\r��2��+���*P������/��v��ul!���&����Jc̎Fd�����\"I&b	*��\rrURN�SE��f=OQ�������Em�WdhF���4l���e%v�Jp]�8ɓ{ݣ2��I�Raiqn�0�o�fC�]L�S�lk���B>�x\'ʮ�r����m\n��I6ڄn�2��ms\nV_1&�v��\'��P��&膬����Y�KXu\r*��:}�o*9#d�`8���$\0J�k��q�6�zNOGw�1�PP�2)��v�CDL1V�\"a�Z\"���`�\0Z�¨���PPM@��\04�\n�֪�\0i\'4ƈ���@� �ր��>��@y�0��h�4�;�)�U\"���c����&z�J�r�8���5��Sqs@\rn�\0��\0P(%A79�C\ZFi��₇c\"�	�S����B3V��@3R@�ɡ����\\r��j^�?h�_&���1w�;����l��k��qd�2}I �Mv[�ӄ�;G���_\rA�)���{}?Ύ5�B�.fˏ�p�������pޚ����s\r�Q\\��E�i��E͌�6�\"���i�4h��쐡e}��\\����k^Y6��u��ݑ{�A��H�i�_9#�Z%���#��Z�����T����cvJ���v=?�^���3�K#Ko��B���d�dR�n��g��Z�^.��������O��P���~e_�G��n�!��w1\r�Q����($�=�L[�Xƹ#�UAƒ��O�;q��vN�_{~e�t�?��ЏZA��<�˵�ԑ�Rc�3>S?\0g+�֣*��[v>zy��}��]D��L�2Mq�KFk��xH�w�PU��TK0\nI���q���7�ǐ�&�����Э��4\ZT7̆Sl!�NdE�{��0U�h�q�5���\r����fwka�@�%�I[gr�P�,�&�\"� R�Xrz:1b�\\���v\rsy&�n��ɣ{smoҳ������LA��m�#S�-�\0�J1Or��5�H[_1N|����k�<�8t���\0V��t�_�{�W�A\'w��Fv�t�t�p���ˍ�L���j������.�I�B��\n�k��{sk=�۵ԑʭoh���1d��8��o�\ZI$*�!�y%��hZ�Z=H�־]�0�}�/1��ۊ~�Q�����$� %s�y߼�);lU�K�B��\\G�D����Im$�^Z(a\"F�eC��\Z۪�/�q,lT��o�_�^ô�Z	�ƶ$Xg����g�c��O(�K�\ZV)�&tX<ɠ$��qn���-+�\'��N�ⲊФڵ�0���_������r��٢�	#eE2#�!�WBW���)\"��\Z�i���7:�\ZxӢ�T���� ��p�̉e!gR�\n4�$Y����n�{~h-sGK��Ѵh4�/J��G�4�}d�e��kX�.r{�W>c|�E`�����ȶ�U�f6��O}\Z,�sm+[Mi-��	$s$Iv�[��2D��E���1�j\Z�|�}?���FH����oy}mam��^�F#��)�7�Z�3BbGb�)��<o3���F܊�����m�\0��Kh2/,Kp.���!�{v��M:�{��~�H%K�H�����&\rD�~?����V�w��3U6�h���%\"�Ő4��5�� �o-X�U�����8�JڥkZ�f��{��Cba��O�ż�1��g8�,[�\'c��.�ݐs��澡-N?�1Z\\��5�e����e%;�v��eNx���T~\\պm�3j��.�V��R�iqm�,d��\"M����En��b��\\s�H������Ν��O���!�˧j1�L�*�T���	Rʲ*�2��U�mc#R%���H���j�*�N���e\"29���`\'�@��!�a@\\C�P�p��B�b2y��k\na�b�bS)E\0&�\0��<p�h\0�\'�M��P�t�@�p(*�A�q�z���zUXv�5,D�b��]��BP!�L��\0��k���7�ؤ*R$��\"n4��U��\0�p$)�I�x �;c֤�0FN@��r��A�{[][]��?HwC�?i�����v�Ӑ1�R���b�;��Ҝ�_��O�ɩ�64���;o�2�)f�yH\r���,����C]���-�w���x�(��t_���j�J�X��Eah��em�x-�\08,���۴�c��{o\Zi�c\n�\\���24�#���;��mm.��b�l�D�\r����P�\\Vڷ��v�\r�;Z�&��f�� ��E�J$hh��2Ȩ�7�ˈ�(���z�J0�R�������[�i��y�[�K{k�R�X���R�|襆�0߸��h��Q��S߭�G\rS����g���u$���2����e�\\�\Z�t6���v���r+-����ԫ:����l��Zm5��m��O��*�˶6��:�H��	0U�c�,��d�����dϩ��V[k�V�e�H�K\"�(�3 ��\r�<��Y�;VF�b��+�/�]\Z\Zd�ӫI����;+�b�T\0\0!�vI��.BM�DR*��fܱ�]J\ZR�s.��ďʳ�<ǙD0����F����]��F�|������B�ae�F��}ď�e��Qq�L�R�v�v�x��g	�\'`z Y��Z��Gh���f\"�����E%rcm�o����6�X�ť�7������u��R����D�IU*ͺE�m�2��|�g{��l�ko�[�az�+�����{u�c����b5���pA�c��Mܝ����M��C[�Ư<Y>���,n�\'�hF\"�B�Q@`�0q���Q�߲.�б�A��Ai4��$Y�&�G,����yD� �IM΂��9E�kߡcN����u��/*�h�w�g2�bR?�A�6v�q���|̭ 3\'��������m��.����NYe|\")mm�\n�q\n�{�ڊ��\0�~����qK�4�z�#`��\r̖�[����v��B��\"�r XD�A\"(���6\n�g&������k!��E⻉�Mr�6�oݺ� ����-��c��y6D����XشR�\"!)Cߏ��^�wC{ٔ%�o�u\'��O���cy��İDB��Ɠ��	,r<H��LV�����}������3o\Z#Z�6�C%���P�250�c��H���Dl��X�ᰮpƽ�i.�V�Ϧ��`�\0�t�\0�˘o�) A}�C�����.P��gl0��T�-����n�������.Vliy�㉞;�H��f7Mq24��X���]*�O-���J7�vmЌ����k�\r-1�N\Ze��W�C /���$eyBF�U�E�@�����8lF�҂���}�QЦ�w�8մ��aӷ����W�dE��#d�fH�VS��$�*�5(�����3J�RML��q����.u����#���������\0a�n���.9\'�<��������ed��{G\"��̌u��,�&H!q �pN�ϙ6���ӊq�<8�)��q�)����\r0�E\\������5H\0�c������	�(\0��\Zz�YUE�@�\r@Ƒ�T�m1�Z7�J\0���<p��)j4�v�+a(��ڀ��S҂��H�҂����M\0��4��@�3@h,(1M\r�(`���c�A,xP!���\n4r�hbd�T�8}*X�������˃lڤ�c�̊B���I�ix�H�l���ӄ[����F�k���O��5�E�����Q��mM�$Ѩ9p�\0\0Y9�@&�ԒJ���#H:���^�Y�$P�iI�hf�[v_�w���G�8��16���:�FlP$3<r��HL�8�rI$�_�*H��#\r;B��m5��3�p�Z��h�\r;1�K�o�\"�#\0�B1�u2�$�!�r����C�[��<����~�a\0w;3�,o&v�T`�1��N3��U���7�۟���\0�58�}�i��A\0U�	��lD^n V�NI��O����ԫ{\n�]Eem�Hݹ!h�7G\'��nK�%��dRxBĆ��ɵ�ݬwIv�\"\n����������&�������Y\\��0+��d�bh�	��,�YV~\\r[3]E�1eKi��)>`�.�A��+�L�-��B�&������Km$�Fn%�B#���+F�LKk�c��t���c����\0�N�(JJ�lU����\rg@ф�rB�=�ٚ)L�ʭk�Dخ~��eC��Z\'�\\�MM!Fm��34���t��P�,���6W���/\'��A�v��`�4�D���)�ݣ�`������M�.d��u��yVk[�e0<Wv���yfN����\n���)/G�;^\n��T�n����֏�뺴�^���=�Ţ�}�p�4VR���d�+23d��9A���ӧt��z,\\\\��[N�����W�:D?f�^�;6��k�M�qy��sn0H	u^\n�!�J�/-J����F1R�-Z˖��O??2�ǂ.`�������}��;�{{��6�e2��Ï�%�X��p�\'$�����hiWO�WI}��^��w�%�E��\\�Gis�	�Wt�\"�!��}����8�e��BElJ���Z�o�o��飄N��;ݫ��ϳ_3���~�t�7pMs3O��۽�N6:-�Lە%V\"To��8��,$�ו}��|��吩�NoT�������n�s�k�k����̰�H ?&�B�j7\0�JeT�v�E������2�\rJP�4S����X��T������+�4qF$��W�X����c�ȭ���ؒ�Ύ&4����u���8���z��s�,In5-\'R����L[����Y�0�07	�V�4S+4yW\r �J�)b��m��o/��r�g.�=�7\Z���[j����g��ɮ#KwE��0�3�{��n�#��*uub��.�����E77��WZ��>�a�u\r�Ή}�_4~|r�D�+)�G��G�(c�YJ��k�i�.�ۦ�?�ʦ]U+���Nv�k���5�y5+�o��&ӥ�[{�����H���1����Mț�Z�����_�NX�k��Gv�wZ�;�a�A�[y�����f�\"�4R���%��`��F\0h��uU&�֧=Z2��fG�Aq�����^���k������6Y&�I��K([\\�H�\'.�}�o�w~]�O��̕�F��t(�����=*�Y��z%���l����(dB�3�)]���X��	Y{����_יRFe��tY����1��M���{�ʼ�U��e1gk�����*�*e(��~\"�m�.m���K[�A,13���6��$\\��yq�P�{rv1	���1i�xߏ��~k�Z��D2F\"ڧw�Y��[���\0�u�S�Qq՜!{S3�F�DEZe��E�\n}j�\0G��L⁍=h((\0hA!@	ڀj�\ZzP4\"���Z\0*�\r=i�:P11�@�^a���Mcrj�B�\0��\0&\r!���s@�PZe!��h T��D�@\r�J\n|����h{���Kځ\0�b�ȸ�x�LZ���:$:��ou|i6��ܴ�]\\(ϗ�H$�N=��\\U�G~�e�%���=�]�.�<��#�%�Lm���C�?#1�ڤ���R3�֔�8֍�G�T�\n�%�6��%�H����u�ѱ�������h��jH��n`U��q$��Q��g�V�2�[\"��GcIsj��g���۹,���܌��`ɐ�W��_S�Ȼ�v�4�Zș[xU<�iHI�e`�r�0V�h\n\0��$�f{�$�f����Rd��d�Id�r�s\Z��kc闒�)�j���FJM\"��$9x����Xnr77\06ԟ\"�-s�m>F�Ỻi�th��VwVq�)%YX�ܰᰁ�<���K�.͖$�{�)��[Kk��b�(��}Ď���%���SƘvǚ2sSI�~�?�s�Zӏ2Zw��\"��T�a�	d���R�弽U(�B<^c4���,;�f�7ݲ2��U9_��G��u�S*�H�՞;+;h�Q!h4��O�E*�2��d�	d��K�%U(A�gR������c��\Z��tݕ���e�>�mm��R�O��\"e��E��͵ ��A�١,��n�;�Y������~�=jmj�p�����ϳ��yߌt�k�6�5���6���&�N�lᰰʩ3H�Ǻd�Y]z��������q����u\\\rx)8�ek�緯�Χ��U��rw��41�`�o*I (�$g%�e����֒�m��J�&� �}Օ��o�T�[�{�A��X�sg��s,�$�v��lr��]��6q\\�R�j�w��xyE�\0]{k�*k?�<I}i.�}u��s�i��#����e[m�ȁH89l��U��S�lLqN\rM�薖۽����fjw�ȞE����J��P#��ɍ��c�D��	&^@\'5U�_}K�>O�J�?��Ի��ۗ��s[�i-��:{���^\\y�&7\0#��\\���4U�ŻIj��:�b�����I����M�D���m6B(�bK%�����~�p�jO�2�4HY��P�ykLEԍ��������t����}4��_��iڲ�xy���t����l<����$��\\��\Z��x�Ϗ�TT����d��y�s���*N�Zj��w�����e��sj7PGo(�\\�6�Vh0�����H���*�\n��V��J�[+_};�}L]:\n�\'}]�m��C���\"x�=IuU�%�ޤs����`\"����-.Nr\n�V�J�Zs������N�!$�k���od�][A�����58� 6���,�K�.�,�?\0m�?�I&�6�j�u��Κ���S���^��ӵ��u;���.,�{xY�($?�\nB	D�nP?z>d�5�J�g7�-\Z�\Z��F��w�H�M;E�e�;�y~u��-�H�m�B[�\0>7�2�@e�:��\"�75��\0ϩ��75$�.��7���c������-�[]X$1y�d�ct7+m�5S�#�%�(+І6ѭN7A�$�������9��[G*\"���3@�^��Z%�,<���O,˴����F������7��cSF��E$�̰��_��w�1&�d�cY\n\\:�3!r:�5��6)�G\Z�Vz�������So�i���]R�c�U͕��:�ZhZXF� �@�F+@��̫�8�l\n��>gw�G��o�s�����l��Zj�aon�I��V��GZ�uF�\'�v�\03�3��M�Q~[ؤ�̞h���k#���!U���~B��),�l ���z��ȍ��t��akGR�Ģ������[����K�T�0�vP�m�|)c�m��y�U�m/�����4���^.�A=�������s�\Zﺱ�O�n��0f�ez��q�R�����([U��D9>�Hč֨h��5i�\r�P\r#\'4\0�3VXqJ�\\h�1�R$Ld���a��(J�@І��(U \ZƘ��j�T��OC�k�<�%Qoa��@!₄�1�f�D4�\08���m�b��W���,�8t�@��cC\n�w5T��&&J���&���\0\n\0r�z�\r�8�������1P&8.{P�𶈾 ����4V�ə�O�J	v�<ERW6�MU�����G��,����4+%:>��{4�L�K\n\"DP0Ͱ`y�s� 6Z=[���)�0sjЊ���~dQ� ��f��v�g�N�[�Ti��i�o�R4��V�c8��K�G�X�VR����p�>�]A�F�L�L�/�e�Ѿdo5_w�a��E]\'vs�G�ﲛ�����weW+��s��)��1i:s�M_vJ�2,o��a��Z[����O��u���;t�y>b	�9+�Ƒ~O�-���q5��f��i���ˑ\n���DF�!ZuU띭�6��o��U�Bm2xl�Ȗ�GcK�-L^/5E���k�成_i��{���R��)Խ����O�xk��N�Sg;^9Y��U>L�S�ĉc�L`n8�*�ZT��Q��t>�\r���(��ku��|���zs���Ȥ�ᔋ[d-��)%��F,P��6�$璮\"��}�tZk�=:8(ׄ������W��h�/�t�]7�Ҽ1j��\0�5�yX��ݥ\n���jB2H�8¹��U��.�O��w�\Zpk�����^�42�<U��ދ}�D�Q�V=9�\\F�\"J�Ѹ�T\"6�G Q(\'ͫ�\0���a�*��=E�O�[��޵�{�=��ד[\Z�䅒��y��FK[}�����uB�������\',\'RV�����~�S�~6�|]���j�n�巒�1�(�_65Q�.��\Z%\\�pd��C��%��_�S��c��U#Qn�m6�����<Esam���}u!f�o�g�y�oI��x��&F����Ty���\0�zq�%�+�䝖��^��m_M�u\rR�RMs_K6�A�x�(�cE���c�a��V��A��Bs�vW��>V��aS��<�w�Mt_!�Z-������-2��{vY���pJ��\'�\\�8����˖�K��S��MN�-���|��~��[��oM����s$�V\\�o@y�>�[\nwYԩ^QU`�i��B�兜�����G�e�-����\0k�u?ڵqΡr�\0f��[��?��B�v�n�z0���+��C��Ҏ��O��Q��O|j𴺝��s��0K�ɭ��6��2�dh�$IlP�#�EL�	?wo�_M���F8���M��W��%��jy煬��	��o�����X��Sr����>n6��P$+�$/v)ƥZ\n�m�o�����j�%̵��zz�G���<�jëk{k��q�i�p��#D�B#H�&	�	n9Q\\s�J��=��U���_V�\'(��}zvmy�FC�ߥ��E���b��{�Z!�$0E1\nDfI6�U��e�\0۴�QI����=�\n��/o{�ڥ�,����ź=�k�>�Ԭ��\Z��\Z	�ԤM��!��wC�A���B�����۪Ovc�B��\Z��c��[k��7n�mQ:N����S>��G�٢�H\nu��\n�U�2�������ҧ8�J2��|������gQ*U��Z��z��<�ڼ�jz�>U������_�j�\"�\n�v�����JQ�aM]�]u6�Ts�]>�\0��`�?�uf���\n[��co�ċ\0������R]y ��0�\\!R�����Ϙ�.���aᶗz����!��b����)��Xj;$�ky�-��T��LA�}����2�Ul��:Xez�z��������\'�(iկy���1<Yeq���I;$�^�t�ͣ��7+�{�� ���q�z;\r��O���F�\Z�KtqW�*2�Hm�s;J���u��u�Ia��ya�&m�0Q3��Q��Ȁ�]n3�՝����\nU#�������úX�;��K=$��\Zk�K|�tTS�}�%�~7P>dޕe5h�\'�����û�Vz���j��:����}>96e��$��LN�k��f4R\n�&�T�G,U�S����L��^i7���6wP�$�{T����Y�ϙ�#�97A!�0Y�s�%.�z�Չ./)�hVе�$6�4e��K)���d���!\0���[�׿�1��C�<o��?�˭wGx\ZnWPۘ�ѢU�F#9:g=k9]J����Jڣ�e�-Q�&j�*�\nӸ\\i\\�\Z��U\\w\Z¨.3n\r;�w1LB�h)���@\0�ɠ�!�@ƞ�H�n���Ք(<PG^I�W�hwF*�B@�	�Q�@��-B�b�W�@�! v��\0�b�*X��{R$;�!��Ah@�	qI��q��!;� �Ӹ!�b��Rv*Y(z��JZ����O�Ivo��Ji֐����<jAۓ�0hs���g+�h�4�\r�Y�SjwF�j�~�%�{smn�+ $�������F��6�C�N.�����Ks�i���\r:�t�R�sQ��:N6\'��*7�v���ެ��jq�k��Z^Kwo!��ԞV�v���ȹ]�iX�q��2\rf�Զg�#Z�W��wfO\"�p��љؚ+��r[�e~逺k��\r42k6�v34s\\���@��y�&���Im���1eP��:�L�ʮΊ4gY�����p��L�[K3���ZF�i�d�¥���LY��~���Z~딶���,&0��?����nXh\Z~���y�j�Ǜam vKi�da��7B�0�xkםh���6j��k�q�������\0�_�l�/��o�G����{�q*���;?��\nmB�]�]\0r�)F1�*N\Z���]��P�F�h���/K�|�{Zݞ���^�#�r��Fy������7����\n�v�h�lЦ	�F�)TJ�[�U���X�q8�Ա�zI�.�_�ɾ jz~���d^��v��D����b�96.Wj���(J>%�;�Ya��TK������;�KG�_?���[|Q��oQ�R��G�����G̼��#9t���8Q��\'�浟o���S�y5��i�����Ao����r6�.�{�Y4�e�� �֒���>T��+3�9$��ťK\n�n��\"���q�����|�O�s[C��kY�a}?MӀ�i��B��D�$\">��H�Z69!�\'U�0�+ݳ:x*ќ���Mu����w�?x��OԤ��4��i�ề@�9XJI���,��Cd�r\0*�:P���`�*)r��]���ȵ��I-�j�8�c,�����b*ۜ�rdf4�\nA� *Y�:�%\r��v*�\rҥ	)�{�vv��\nm���^����b������0Ƴ�YY�v)Y�U^˨\0�K���{\Z:X��r˯mz�򾽋^��u�\rh�M�XZ@��,�W�kPɵ���RK�����W���N���ݢ*X)R���_�^���t\Z���/�j��uu��q�����1r�p`�L7(�W>dNJ�F*cS^Ѧ�#�y|§��s.i5�oe�����f��Կ���ƿg��-7tW,��ddfKe�lS����U@\0I��q�88��G���_���	ת�|*��.���������1�\'��q���#�}*�����71H`L�����9��1^���A�ݹ�,TaR������3��k�.���j��\\�v�I\nL��ebP��T���g\'p˘B4�E��n���\03��J��a�����:=3LռW��-t�N�I�K+���:C��-�9�͎P��R;��J�:^�r�{y�+���_/��J��r���oc�5�\n����sn�\'�ke�FI\"gic��U��p��*Q����>���別�������|=ᴲ��e�}B��X@�r���m�M��FXH��jgfp*%Uԋ������c�\ZtR��������/�:�������æ���@��m�-���L��\n7(n�B{p`h���Ik�ﶾ�^S��{�_��v׽��\n���&�[����jl#*����0K3��pw�_��>��\\�R�D�e��������o��-���B��5-i���m:i��_8����\r� s\\xL-LL�XF��^���tbkB�7J���������^�\'��\0\Zk\Z����G���$i�Zj�a�cR�.d�E�\'vӸg��Mz��Ng	_u�<��U!�מ�����|O���[�I��o	x���Ie<$,��dD�7�B�F�0<�]�NN�i��EԿ<7����*��W�#�i5������e�m�ֳ[ۦ���������d<�i#%�p\0��ƪr�}�������eR�)+?�-�{��ur-$��/|9um��H���\"@��X����PN�@\0����ԥ�����(�\0[Ϲ��]~�K���{�K�y<��uY�d\n�\"����w�|�Y�W_45�Qj�_����9e~�\'��F�c����|�dx��C�LNƚ�~}�0ew08Y6��\0��\0��5tié�2=���h	i%��=�\r�f �<vȧk/�p	g5ϯ��ʭ��>1�!�uiZ�k�ҝ��#�Ɉ�U���t�s���+01A#vS��0�5W�j�1�������P��P��h�q��i�����oj\Z�)����1�ց� f�q@���yG�!�Ua�m2�j�^:�\'q��W@�=(\Z�\n�!�{�&�\n0E+\0���aXw�XLP0��	�S�I�Ф�Hi���f����〠7�5-�����1��Z�$��y���J��8Mǵ\\R�mF���Au>�Ҽ]k��m�Z�-��ľUŜi�S�\Z`>���&~l\\��M�u%w���NX%��\0�:�j��Kq�j�y��s��!a�O���\0nU��2�x�N+�=R���gu�Ims����(�Iu@Z�+:��7�b*p2I�\0w�sM�xy�x�\\�YX-�*yW�|�7���!��2�*f�\0�si�{�C�X_�^�G�y�T:m�b2A-��s��v��X8cہ��sT���z�L�����piqh���Z\r׬���G�$�6ʊ�\0U\0����^m\\L���U�����(����\0�|׶��n�,�%f-%��1/�䤒�\Z�$�P�U5(�@�@�*x���v��w뵏U��D�]~[��론����s�/���7o	{i�w��+2o6�2���%r*�R���Yu=�&+�=_��w�n�v2/����j�b[g���kK[��et��D��Q1\\�t\0`\0:a�K�R��۩�R�I7JF��k����|?�j�f�^פ�4�8l�M�,\"h��\"V�FĘ��׌)|�[\0(��V�T�nf����\r�k�N�M�{���xn�%棯^���j7�ȭ\n�*ȳ�\'��`�@w�o@}�Mm�\0|~%Nx��M�n���࿇:>��W���N�@���v���g`H\n��u�ĥN	a�x���*K����V�]N�����~������Ө�\Z����2�/�E�;).J<�NC��%l2c�ـ-��泎0�\"���\0\rz�}Ռp��O���5�o�6�����X���ơ>�s���n�gg�5wg(�6��F�U�u����{�T�9��9�X����վM/阺���?_n�L��%�ն/����(K��\\\0��R��Uw0n��E:���˖o�S��T�%8|*�w����w��:W��ë6���4�aD?go���c\"����*Y��-J%.zs�wN�^��XJ�Q|:����$�/x��NO\n�[SҬ���e����Õ��Ͷ`<�r�	FEG.-Ƥ�����tSx�5=�w��w����|J�]�\0����ߙr�ޮ�{�^LZ(��W�H���!�+��\rk<\\���C\Z4$���潼�_���\\xw�W�����Y�|W��X�h�.�.ZP\0�*���0�助wnU�����EM(.n�t��|u����e���3�\'�!�\\�|�Au���ʲ�iS�;ۢ�\03��6�(�ҍ���\0;~[�ׂ>���-���R�_,ܙb�|�1�n���X��>Vch?0�1�T�\nI;o����-ޅ��!�Y\"K�i�du���\"\'��\\0�Co(��>�5�b1q�+�G��t>�����M߮�z�Si�~�}mcs�Z^��-�\\����#JVHZ-�o +�����\0�9iԩB.Q��\0��M\Z8�WH����O���g�!��Ь.u)%[h���t-�Y�vUX��\0�AP\"u8f�+Ԝ�;[�V߽�LE,.�f��v�s���\0�-<�Z�� ���Kb\Z�ċqn�X�1�Ðͱd���h\\W����S[���\0#��b�{(���_�ywЩi�iڭ�x�^K��٘�M[�m���	�H��$f0<�@)<���JK�a�ۻo���<�m	Z�h��Iy~_����ƒk:�į��%�����`m�̑�8�8��+��HX+�H<�f��o�m��)W�8T�z��X��]�+��_:������Q+���C(\0B�(\0�p}]\ZJ�e>v�GR�;Z�{���炼9ᴛW�\\�O:C4W��(Z�ܑ�ˍ��b������O9�U��J������C,�J��޾Nߞ����|q�XIm�#����8.��S��L��j͆e��pX(�ɫ�EN��ӥ+=�(�c��ݫ�%�/��u/�-��5;�s�\Z¥�Z���fl��%`y���U$�$����+B��J�Z�7]$���p�IG+�h��|�>�o\ZhCO�O���--7�\\����T:�I8um��x�8�w���K�ϩ�V��r��t��~F\'�t��Y.n��&�>d�[E�\\�\Z����\0~�6E�G��HU��V\\�g��0�/.�g�蚥��0Iߔ#�����e`��j�Y7=Oː�%u�Q��o��j�[�F���kf�P���c}J\'T	.�|��.fLs��m�֖�������>��|Ae�Zj6�Ep��Ӌ˯-�dI���_���Ie��t�y�EE&�AIsnx���Z^�%��X��T�� pA{\Z���̨V����*�l+A�2U�U��qT4 8�=�4i�Px�j�`#\"����	T4���ހM0qH��+�<�\r�((��a@\\(\0�B�&(���pQ@�m�\0�	�hE�\0�@��b�@\\p�C��&����b����,;mMć���r�l�k�m�	5�K�{V�\\!P���A�mf[,@ǩ��d���\\�	z/=���z7�<5����k(��[Y��$s\n)2�a�β8�2ݲP��F��bk^�=�}M�|���#��f���E����m���!8RɀJ��Ѿ�F�\r�\\Z���L�e�g����E�C25�r��*�0�朝�v�#ݗ��hkv6o���	�x,�+Xw��˱e%�A���#Ȼ�|�8�ʲ�Ϡ��ͻ�ZW���:��؝R��\r,[�������bގ���l�\r����)j�g��;+���\0ßUG[e5�M<�S��⮧am\'��-#$�\\H`S.ӱ�WFR�����\0i\rs�^�*������3ަ����+i�}����]X���%��35������ɧ�!�;�����\"d�+�\"���Mz�\nj����~K��x��\n�+:��*)��\0jݟ�o��V���|7�k�V�_���ۀ�ݥ��~�e�w)��*P�m�~�թ5\r�u-�X|=:�vzo�|�T�n��5�/P���Q��Ż\"D\Z,BylŊ �J�Æ��{���	NN���^[�����+��/�x�YmbӡKX���k��(h�?|<(B����g\0\\�.J�}�w�-�j<�<,o�Z;����|�u�ަ�w��\"�_;�Or������Xgs����ʗ,6������5ܪ��w�>�����+���߉��,ʽ��rIwv�~�q$�5tr�6�ۏ�����>X]3��_B��㣍�W���t8}_������e\Z\\f��@�1(8\Z$J�12��J��_�]����KN��9�KB�T��$���>�s\'T��Ǌ<I������>L�Z���+��oyr:}�v8����s�/~n1���*�Brkg۹���n��������(���%է�/�|��B����J����u9c6���oQb]%\'d��n�M�h<Q��2��<��3����G!��W`�FuW� ���?�#�!Ҕ��)t���)��Vj�Z��~]��?Ś��ĺ�ƽ\Z�+��Ǧi�?d�Ĥo�8��C8�ۗ\rX:ԩϞm��k��xƔ��w�5�}|�г�~��i6�?��w#���\r�DTw�ߵ�j�l�#���yu�,��o��w��a�٪��{�e�ݻ캚6����������Rx��ĸ��\"��ޛcBA*©U�cmgW1������=���ۢK����7~�3���N���	���;��pL��(f�vFY���B�s���u�>f������R� ���ןE����dڕ����Hm��súzIm�m=�&�lIl_-��e��Y�PTnumb��>����L%JI�\'.ڷ�[�W���j�*�t����ڝ��Z���[��y��s0X�fUd.r\0Vg �v�*t�M5��t)J�).V��i$��_��jOx�~����5��HQ�角�c��U���\\�22����5R���<ʕ\'/}�]5��B��~2���h��n�t�x\"H��\0�b��Er����R5�:X(-y��_��VU$�H�-^�履O��x��D�����ǈ���F�Q4X��bB��+�mPX���oB�Jd�#͓��4�}��u���\Z�~:�Y���/��O�<��RDd\ndd��P�)CA+�4sR˩9M�J����\0@���^�.�[���\'�h׺g�5��{�wV�o�併��k�9S0!aE*e`�B0�7��ԯJu��s��F��_�鿯�|��s�66����w�F��>S�*�pέ ��z\0��d����~.U#�j�QJ��?����;U�����_��v��\0�)�l�KkF��,׬�%��\Z�3B� 8]���k�M`�Ռ�z��>�c?}J��ud�ٝ7��x^�@�\Z�W��k�SN��݅�o4m��$�SYgh�qx���^�$�Z|��c���a^�\'-��^����n�?�\r&�Z����\'�w�cy�=�E�Bc�H�����w�c�0�j*�߲�ӷ�1�^�%B^��[��y��mgLҾ�P�7ڍ��uh,<Iy���*g�!��l�����������̪�IM-c}��3\n5!\n<����4�]�l~����W�s�Y����4�u��\0�EyeA��4M�\'��zu��{��\0\r��-|4�/cQۯ{��<�Y���V�}����y�YZj18K���Ie�*�O�}:�����~��ԃ��_C������q���jȫ<f$u�A�˨U���a�n���~Fl�k2�;���,L��}���\'>`c��ěׁ���5II>]��_�\'�9�h���زh\Zі�V��ku`CX��I7���e�+�?���D��82��0EFh��QqZ\"�V����f�\ZF(\rP�6��M\r\r�P�\0�v*��,I������\0�\0�s@\0\0P@\0(\0�\0��I��\0��Ld�*Hl=i�z@(���p���\0�P��J�<\n����>�Q��Wk$&k�N�\Z���/�\n����\Z~ڤ`}	����K[�\r���nn�[�JB2� �\"5�d$�W�H�ч;�}���T)�(�F���-�����yz;���%���Q�B� 	ݸ�=Q�oVxm�Sί.���h������\'RY.RS增��!B�2��%F@�mGr�	M��Vu��X]ܵõ�Νsm���I�<�%��b�!Rۊ>�\r�m�\'��tZ��S�p#|��~��&��kߋ���y�h����OݺΪ�z�Azg!��y�}a�4��;��>���%)��K��\0�<�\0ǚ�Yx~���S��v���+pȑ���:H�2�y��$e$��^�e9?��?���5��J�+����F��;ɍ���/v�#����\0P��3��4��2�H����LdԠ�J�U�K3���N��Z�GFy4���eaj�M/ʨ�wA�h�U��K\0q�qU)�pzk�<�eY�������a��oO�l,.5�,�.����m$�[4���D�/��%p~c�sS�N�彺�g����=���V��M�m5KW�\\���������r�\\k\Z�엒>� �Z(ʤ2[�|��F\"B�db4\'&�x�����V�����~���k�N����W�L��t�>q���\"��1p�\r�����	la#v\0I����<j�vM��\0���W��9ӧ��ɯ\'���|��	���w.���:圮e���ޫ!ڛ��f�\\�*�B�@��)g8zP�)-zv�\0�>>�IZ�IJr��V���\0#:������-R��[��h�E\"��)�UfH�~�~������I�\0���b�N�z[�\\�UJ��������$����x~MsZ���$5��m�̱�� ��\'Rb\0��;K7`~����M���K_q���\\<T��/���\0���i^(��俴�O���Q��l�q�JJF��14�wp�\\�&����ҩ��wz|��i֩f���t������쿣h�a��#�_L?y��F��F�d;F��\"E�g�I�a��Tw�yW��]�����%�cu�-=V��C�����wb/�����\02X��[�>`�x�\Z��Y=G�g��u�o��˭KiQ^��׵�龛������Y��}��7R[i$�OH �efc2�T��ǀ�\0u�]����SJ�����E<-)A�	N����M��և���8�%��ͩ��p-�\0��7��5N�ĪQ�Ƥ7nry �4*Ы.eg����baRQ�$������n�O��D���[?��V�tk�\0\Z_�Je��Hԟ�>d���eY�36�T6W����V�k�7����\0;[��P�\0g����������j�}�^��F�m�x��<-=�j��[��Y�PUw��27H�1;U�8+�\Z��W�M_g�V�����O;Q�i����g����]��,>4��A�c�Mf��b�[}F5e��ѹI61\r��n�IV {50Xz�m�|��\nx��*%���׮�=��ďx��Sյ[�\rE��k�:�TSc\0�)���yo#��>q����\\5ZT��Z讗���W�\'*����W��a�]9t�^����[�x�o[�摌XZ�Q����<�f�3�$\Z�=^���.��׹��8�6V��[���cϵ��f�_�����u�b�K��d������,i\n��\"���fX��W�\Z����z�V��_�S%\Zt�5hY=c�����+�{]�u��V�:O��뛫C�[�~Ѳ/ݯ����3��󗈀�$])�j+)��m�\0��2�Jq�����D�7��k�S�-.�������ܡ�����՚)]Z\'�ј�=�0L|�nHe������������X���t^��^��\n��x��M{������g���N̛�ϖ�0�I7l����q\n��������.ƴ�<59ը�dӵݿ��Z�,\0kzO�-��<s��	7�Z���iTH���>V���1͘Ia�Q�E��l��:0�U0��ɿ�]��#���u�\0��W�g�� ������x��K�p\\�1Hܰ\n�X	�{�W�^�R��g�n����Q�J��.�/�u�\\���+�^�ķ����5}5�Ȗ��)U��I�����YYC�W#nx�Mз�S�]l��\0���4�U_�\Zv��cM֯������slo�Ks)i�1�Ym�%�r�|��y�B����N˷�٫]�p�Tlޚ>��~��&�g�����Z�a��8hl�������$\r:��t����)���˖r�U�^�?��3:�aR<�׫��ӥ��;�Mm�����=�״�i��p����Fm�\\a�2 �;@�Hߌf�\n�Xy¼~\n��d��&yTd��T\'�����v�e{}�K+iϝnx���a\Z����y`v�@3��%��2ף�,���[�\0_#��a�!9[�_�������V�ʱ�B�k�\"�U�#ě\\�9`77\\�z�7�\0���i�J�\\����o2,���3G�X�8*ό��n\0l��M_���ߟ���� �I[�$��Ii+æ�v�YR9G��H���UN�~�\\���1����ya�~�6*�\0PpZ���g��C�#qT� j���U��������)��8�\r��#�440�U(\r\06��LGDzW�yCq@\0\0���\0��@]\r\0��ɠ\0@\r<��T�%^��{�\0�\0q@Т�9jDH��B�<-E�q@�Q �|;ӭ//u!&ŵ��s(eb���I�>��V���t�O�����<G>�ڥ���H!�+J&ڠ��D;�P۷#n{�z����Tud�ȯ/t���nd�A�X!k�7�\0ā(�5�7m}���QV��۲*�@\\\\j3Cu �����Z�ui\Z|�ۂ�h��1�q�%��<]esO��e:�{���u�Y���{��V33�޴d�M�h$�\r\Z+\r�f���r�IK�z���B�^Ϯ�2�z����ڛ���$\r$�,��l��M�G.�܇vF7n|մ�a�O��:���MY%m<�SK��a���F�u��w:,�Ff\r)acg�!|2c��3^�*J1u��R��c��֕Zʋ�ܓ���S�g�d���a��6��_�$��9�h�\0J<�ؖ�H�[�ݵ�\"<:�?�՜�>XGK��oS\\�q�Q��JM]?.��b���u�N�����K$�gFS~��3�;.|訲|�s�*kض��37�s�Ƥl�����9v�����>[�n�^��{9d��-�!����~e,1�WU<,䜛�h���u1���\'g+=�O��kru;ɠ��t	q+�j��G��3K,��6��g���6q��z��KۯcOI�Yϫk��\0�&��P�<�������� ,{��)ܻ\\3��ڵJ�S{�˧��uaJ��^�E�w�znq�=�W��e��6\r.]m�G���y�+�Y�i2JB�yrs�ی��p�l-\ZR��k��S�q�]J��=�����7th4χ��E��Z���X�\0�%Vp���-�rpeh�(!�\\c<eV�>Zq����O�=\Z3xx(х���~����!��/�K��7^:��3�\\�X�\"]2F\n����cd���R!�F��:��).Zq����#��g7yn�O����{%΁�[���S��v��#��\0į�����c2��W!e,K�*ϰ\\�^g<��Ti�߷}����b��ǟ�n�\Z��M֞J��_��(��Ƈg��K�SR{��g����EMʧ�f9��k����V]6��o��6�,%��V���OE�j�6�<�����+��\r�;ท�F��}�4fDlC33C0��F\\�ք���GS̭:��|M�������Z��mb������A~����-��RCظ�H�i���C�lx�73&\n�ד:Q��KN�W�����.U����^����[^���l^��������vy\\��Wx䈙\ZR�D������`�^EE[��ӥ�\0-�=�z�9tox�u�j�N����/�~ֵ�&�\0�k^D�d�\'��&e�U�hN��/�wN����+ATj��Z>�-JV�y�gk�_�ֶ��s�O�گ��Yt�\0�:ݺC)��j�_-����a�%6�\0��q_i�xy^Tcv|�&�U$�l��~ǥ�?��l.� ���˕Q%΂�s��@2�AX�ld|�+�`x�1��YF6I�<$yT}�7�/`�Q�m#M���㿇\Z���=�n,�8CeT���Y�ep~h�*q���:O��߳2�\'Fњ��/멱�>[�Sп�on|;y��[����b$�(��c7\r\"fF^���xϬB�c�z}���.J�$�����J7��cƾ�_�����Ne�M��ʷX�2��1Vگ(}������^�:*k�W\\��������������l���ס������m_�޳��`[��Zȩ-���X���H��B��`�� ���婵8�J+k��;��eMrY�����]�44�׼A����|U��;�xD7�|i,J�P�k��|�ݙ/T�I7\Z�^�=w2�;�a	��{m�\0�=_�a��k�^+��ž/;�\"h�\"Ӌ\\I���x#\0*��d\n����	����hCE�:��\'��F��o�Og��u��j��6:_�c�M���H-�����%�j����	# n��^&O�S���=�����(ʦ\Z\n�Zomw�\'o�����}�zv�q�Io�f�}�[�j%.����2/<�$}$��|O-\\,�w��v��*�k�I�׻��z���\r��`׬���cӥ���!D��:��2�6H|o$l|�2�j�������}>N�R�t��zX����\0��i���=֗5�\\5�������UQ����k觇�eFb�+Z���9�+����Is�|G����y��;��4����\nZ1�7#9e��\0�<�F�	�֍��4z4],g4鴝�������+�n�d��ՐK�=B�G�F�pB���b��I#q�M(VXH�*�і�g��5�A��\0}GJ�}��l����*�U���J��]WJ���Y$El����by���*�ѓ�K�T��������rba��n�����<]�Oy\0��	&IPc����w\n0�N����f `��$�c�M��O��\'��U9�S�y��⯗s5�4�n-��6���*�\0��79\n�xk}��Y����^g�-z��s\r��ۮ�jR�:��ّy�\0/\np��hRx$���F*e���Ӷ�%���j�݈$���?5Rh^�����@$`玕WK��(��pMQ�t�\\��[�^��ڴE�<U1@��1T\0FE���h(oz�� P1�\0�(�*��Oz�(?�\0&3@1@(phE\0-\n4���\n�	��B�\0���z��K��`��hl�EC%� H�2��K)\"�;E,��TI�a���i��Z��̒���W�Z57R,�0.��22�sڻ�?r��npT�%�Z�n�\rޱ�YY�Ya�+ypm28زLFB�s�V�&�,f�\rN��;��/C��W����>�v��n\ZKr�#`Dk�.@�I5�R�����s���Mz���wd��Cb���y,`J�L\'�S�U	�s��ߛ���M�i�n������_giuO^��N�\Z�֋�y��v�\'�6��\\��$h����+#!�gf:� �a)�uo/ӱY�y���ٻ;�>���T�ޝi���4�6kk�\'[{�u\0�%��ĉ ��7���$���ֶ��R���l�������?�O��|�j�\07�����f�o����H.����fr��13���c��(Ea*q\"�\0W�:�aM$�L�Z�$�ׯ�����}_�6^/�����=�YX�[筌D>M�ݒ����w����I����R�g����猞�mG�>^��7n�-��--�ܙ��a	�O��2�ww*6���GT�:�G��-h]=����L->�oxoD�n��c�7�ZEl�y�\\n�\0n�LĜ�\"OLWT�\n5\'8�ɫ7�.Ǖ<�B�����n�o���?I�xN�k�/�5���J��>l���9 ŵ���7��\0�?�d�U���E��s��Xv:��[�����5�Y���]��f����<=���d�B�%�v\'y��5OH=��O���>v�k��z�:j�^�X�ͧ���M��/R�9uSS�����@�UG��k�\"?4��R�:�]4�-��%��~ާv	\Z�Wt��}Q�š�]��<���oK��}~�Ԭ�p�,;����!�\'R\0��NO�SW�Dk^Q��e�w��pگ�c�_�S�\Z����fy#�2�Ah��\0ő�s�����l���0S��-��v#3�F+������w����I�c��t���D�-��#�Y��9�\nŐǣmA�\'��EwK�Rw<�x�5(�$����7�\Z��u��\\�mC��a���r�C.~�0��v\\u�jPVVwW���wМ��-Z��u�K�~�>6�$�\0m�%,���ͼ+�S��2H\n��u�T�iSןoՍԄ#)TVv]�W���y�χ�\0n�\0ZK0����2���.&dhJ9��Fq���d��=��M������!�Ӽ�����w�I��c��}�\0��u�Z���\\f?\'�\Z-�+d\n͆V8X�Nv6A�SSU+�W�z\n�e��\'�ך��~�������~�I9��g�J����}���H<�H�G���O���Nͩ��՜/�F�;>��vq��کl��W���Dz$�$�ş���M����F�\\^$*��m�%�6�*C�1��{�ʛ~����R���m]Y٫k~�_�^}\nv�	&����n|}m-�qyqu�b}�8��F��F�2�;�1��9�}b��OM>bu�S�=���W��vw��ŏ�_<A�B���V�7Qb�O�CpdH��Us���\'�E8����0�ɻ_K��¼)�:mm���_ឤ����<.���\r�sLe�uyD��uy����Um��T�k\\�q1��,��R�^lq�N���OO���_�`������#�f�,�\'��V���V���{4JN�рP9YP�cfPĕ�W0��KYA�F�ͩB*�ۗ�%�W�~7/|U���>��\"�\r�ii���pGb�&12an�,e�:�<���-�ˉQ�����ݜ��Jr��]_��8�=����qG0X�0G�Xd���2`�g�6���(Nk�ڳ�x-�^��n�X���ڵ��1Xj76�Z���5��r���,N\\p	��Z���\'8�S���n׮�3wM���gѮl%�d�k��$I$��)��C���@1�y�+�9sB�k�����-ǒ��K��#�����>���;��F��x{^��5VE{�Q�\0�~�J�+� ��{\ZNs�\\�������8��w��d���M�\r7D�͞�5ܚ߆5Iml��\"A�$��u�n�$�d`s�|ڒ�\"�<`�㬺^g�I,=>J�\\�m[��=���z��ao�j�b��Q�b�!>[���>�L `v����}�� �H+)%����]Yɨo��o��~__i�/�0�:��$�%�8�v/����F0a��l�0�BO�u_�?#l�R����=�Kn�G�Mm%����Ђ������{�.y\'�+J_6���|������^z	N7[�߃l��e�[��VMZ����⺶�Ŭ^��\0Bu���\"�_i�>�:6f��c��C�O6�<%�ߙ^=Լ��w0�R�9F���Eo.���G���f���������A$��c\0��s*�	�2\0\0F�?(`��Uc̖�u{%Ǿ���T�ƛ�iўo�G-�ZGp��ɿ�i���hUw)��a�$T�������g�4_�4����+�%�\"�����G0�����\n��d��`�ŲU��&��׳���}�/Im}�Ks�8]��f��1�o�E�9*�7%\\����^�j���v⃚�lx�H��3V�DG�h�#~�R)\r�T1�\0��\00�\0�6��@&�\Z��C\ZF((6��h�+�<ˡ��)�@u@�u�C�\0�4\0�@Y�@����=EI,Q֐����$!�1�U4�D�P�����>�`�1@��q>�c��n�,-3m@��������lkI^i#�m滽E�[�����,�7L�L�����FҠ��\rz���=|Gq=�>��[�{,)ԟj�.����g;�*F7m��\0��3�Iԕ��쯟M��N#��nd\\���Tr�	7Jg�����<j�U\'o��[��v���Y��9ƂH����)��7I\'����rM���p�a8!��q�W������4�b��N���j��\0C[����c2y���%��g��a���s��hՕ)����(GK�Iy�_�N�t]>��w���ޏ�Y�\0�nY�y�&���������S�\"ވ�xyA{��E�.Y���M�Ⱦ7��E�ī|`v�d�(�_�y�lN�\'9���*t�ۙ��J���8��J�%+���ޟ����j�k��+��4�$T�K���ݬK�AC�7d�rNo��$�J[������T��6�K}��;�\r�[:�7w�I\Z�1_�*��L��>�XF?xw)#k�<�׾�[��֧�ӗ��r�����M�-K�v���>���j�����%��,f���p�g̋%r�\r��� vR�T�3�>X�>+2ZF������-7O��B���J���Y�}�E>�|�}��(.\'ʪ2��_i<��*�3�h���{/�/7�y���N��iV��.����3�mSQk;������h�H��:��+%��!r6i�$�Ǌڌ9`����m�߬�j[�8�}Z�n��/��<e�oD�qc�Ǥ\\ݶ�b�<:D��;\\�\0��:�<�Ƿ�ٵ���r�����dz��ƅ?{}=ջ��|��ߊ:ߍ�E�n���[�\0�\0���8A�����xR���Ln>�&o��\0�����|?�Դ�^�0��#���W�%+#��&���0U.�If\0c����R�����_F5eﴟ�KO���[�2�Hx�m��T\'e�j9�\n�۴\0pO˓��T҂���v^Gmy,=HҎ��W�~�;�[[�ohZI�_1����9c����]���5�i9|[u\\t)��z�_���k�w�GlO�\n��1�Kӯa����F0|�jyuq*�Y=��6��!`���Jٜ�H�l�	�dr��OJE$3s�<�`}��\0\n-q�_sWM׵-\n�;�6���PAZ�Þ0x��UO=���s�\Z��W:)שE�Svg��S�����>�{|� ����>f�H0Ñ��wu�pKN����v=fU9y*%/6���{�\0�_��·�6��,���m$v��%\"ݛz��$	$>c�*��\0\0#��eӓ��{�Zt�{�\\��t�+��Z|�_�t=��-o$rGqo�\r2��H�X�\\@��p��a��7�&�����\"��XXҏ-\r4K_��j)TO��wZ��[�?ֆO�[K������W�}R�����[�E��\\�F�b�c�+�\nr۳\\�)�G�%��Gm���.�<F�����M���\0#ƭ~�F�CE�\0�:[�Q<2��U|��\n�	G������j�_�-5u%��\0�<)`��j�/�����~κט�\Z�����.���0J7�BR�);\n�����**�b��B�`�7$�3^^����O�M/_��C�ؤ�-�)Q�@v�`ۥ�t��8ٰq�0�|��l���g����\0fJW�뮊��\0����6������ĉ��WW�>e�Db���#~�BĮK*�\0�UچkN��5��Ӧ�q�|�t�g�}����wj7�9�Q��>ѥ�\Z{$�a�ӯm i�$�Ǚ�&��b��x���c]e=y��f���^�e�l/#��W�M�m���|5����������?�\Z��bW���;o�Sn[�+��篫V�a��I����]�J5�<�WQ�F��]Σ�^�߇>!G�i���r�D��ݶ]�8��\",F���X`�իAЅ��=R�:9�\ZT*��I�o���lu�\'�|������]�P���{f��$-�S��p	�+�3Ѹ14�p��g����4ú5k*po�[�T���ns�%�nt[�R;in�{�����G\\L�G�).�ɽ	<n\0psSG\Z��E��-u��=�ا���Kg����ӡ�Rx�O�g�l��0�	W�ԭ�ufb��������\")&�jt���8CY-W����|�=��Iz�KY���y&�ỷ��ཹXo�&{io��k�j�c�d����h�h#v�r�O��k�JR���ݯ���|>gAՍ��Zi}~}O3�49`Ԯ,��{��..4$IW�+�rn@A��E\"������������,�qȲ���7���إ�\n;���\n��3��S��������\0�3��q�Z����4���Eo�����D˳�l1f1>ޢ��;j��e+���=V�M7P���b[y\Z\'H=;v&�Z�G�A��J�#n�C�U�4w�(i�@	@\r<�\0�6�\r=hCB*�\0�ր�v���yg�!4Ʒ�l1�!�t��&�H2\r��~t���I\0m���� PR(�ځ1ݪQ#i���1H��d�Q�PH��(����3�jV��u�pON�洎�қ�g����:\"L��V57G�3j`�@�H�2O�����שf�F׼K��{�L�/��+O\Z���l	��7��#inI&�+յ7ߡ��%���r+�I�a�Ս��N�#,�,25�D�l2D�G��qpC`2�Ŀr��������-s��儬��S���Y����sp$��8g��d��%Y~K�,C���,v���ƛq]|����[�*ܯ�-{]���fEp��Y���D��a9S͇r�v\0y\'=�(����n��t8�xŅV��v_+��4�S�Iw�˥YMn�y�moT�Y9���u���2��eN^�Jr۷_�?��]}j������S_D�M��:��m..-��4�QͶH��wJL�g�v���]YH#�ߩZ3���+z>�D��:XIS�_���~&W�Ox����Ϩ���6��я�E����!k��+����Q�\\v#�劼�^˾�r>G/�W�E�i%5{�:y�ڶ��o��5��X�$P�:7��Y��t�b�\'9,�x�>�\r�a��k\'���\0\0��y�{A�)��/?SOR{���;�)4څ�Kg�jR�O%���IBW�#��3�\'�+��R/�~�����+S�NQ�э���5�v���^$��4�!������,�]���ca�˫)y�%�Gb�F���F�*^�������~=�CΆ\"kr������N�\0�RxC���s7�n���uA�Y������$��V��+d�������^��k2\\]��Z������W*Ť8�̣�p8�ҽJpQ\\���+T�i����\03J�-�+ �n~�r���Do�O,3\0����6��g�hs�R����6o�����\0�+Ӽ����+�����`KW�V0�O-c�p���0�2ɂ����MT���J�y�\0���<�f�ZT0���ڵ��k�t�\0�O�}��$M$��˷�|̅�R��{t8�iF)���Zn-��RXj�6l�%YI�\0��֪�j\"����b!g��������r�ntZ_�&��<��;�f�i��?�5uǵ&�F�מ���z�W��q�2;�\n���d���oz��Lk���eo�S�Ҩ��4w�E�L�\'�G�q��4����1�8[i��F�[����@?.�J�%��x;��>\\�4��ѱYLI�A�x!��e)��9�Y���5%��OR�Vw�}���|}��Οw.��ɤ�dvm\"Y�`bw��r�8f�leYC\"y����%M�=W�ܧ�U�e\'�_ÿ�v�w:��et.�9�;{{5��?��>��\0=��<J����2�����~xX�~�M뤬}qm{�W��T��\Z��ޡ�]cT�e�����=��L�[� ��d$}�C��/rX����*�˳���&0���ZtM�M�Z�f�����uk����{�\ZG�(�UZy>i��2���Y%C4V�b�ik}��8l�K݌�-���S@xf�Q��v��O�\'[=yRB�k��Ļ�&��b\\����rQ�k�ͮ�k�^����#�S|�i��kn��f>*�ᴣ��v+/�u9g�լ4Ԏk{MB5\'}��`ev²�np��B������Q�M��}Q��$�I�׋��϶��>���F}o�8��t���hm u;Z1\nĠ��c�\0�7W��n��Ur�d��w>wjЭB�m7����t�|���������E�.bi�V�-���5��#ᗄF6Ś�\n�q������E�Z�hKy^Rv�5|<���/�U�m:�;��)��ωDE�y+�1)*�W���\"�d�ሕ\\Uh��>��Kz��ԨS�K�p�}�~���ٕ�A�M��2�Z������ūۥ�D#��&BRi����j�B~�#�Z�J��w�=�j��v�wR���?��5�+�{�R?x��G��JW��mQ��j2��|�G;�a[s��`G�X+��t(�)ߗ�Iۢ�c��ʝY�IY>�g���cr���k;D��_�[�ڣF6��⳸r[����8�Z��4���i+�.��+�\0J��^+V�������;Ѣ�Q�7����2ߏ4��=�L����@�Q�����;~�	U�*�-�?=��t���2{����������n�\"Vb��dS����ᕶn��>��Z�8-}�Y�$�B ��(����b*���M���r�q�汛��1%~�1��!k��2�sr�X��6���%z��{�nס�H��.�*��u�)�X�U\'z�H�46�V�P޴\0f����1�:S��\0�E^Y�j�;\r�Lb�b�\01@\0�n\r�%)12J�@\n\0v��P��EluIq�Ac�W�L�J��͡���g5$��xڍ��̊��]�9�;�+jJ�F��4�Yk�t�7Mv�\\܇\"I�GU�r�,���9P�\\\0\0\"�	�\Z=�,9���}�<w��r	�(�wu|�����*F�FǏ���`�}��\"sorη����Oi*g6Q�{wJdI��h�d�;�c	�F�����%�i/�S�_��S�+5{���Z�J^\r�5\rj��<���G2B�!�eX�hܳ���C�Ubiӌ�\r9t�~gfu��u[�{.��H�<Gii�{�yR+��r�-&5��C\r��o5�#12�ʌ.H \0���&�)-]�ݱ�ꥋT���eeuk��5�}j�ndy ���h�_��k�3i.U`T䌝�+˫���^�����*Fr�ڷ��|��s�Z;I���V��L�m?gF-$Q�s��l`FA(�W<��˧�EK�����h��P���\0yw���v�s��Z���[ۓie\n�b�Hf0�\0!O����#���V6���\0�>��5K��H�i�Yl�����4����R�W{t�c���6K�]��9\'j���N\nrx�e�O݋�4����RT�$��K�ϣ9#�����:E��iR\\�W����n쌤d��@���~\'�R�U����*~]�9קN\\�����\0;����%ҟQ���j`G,�F�r#V8	\Z��\0����S���ь)�%����Fj��^����s�xr�-V�A����Q�[ܤ��O�C0��Fo�g�X�bj1��z-����9T��������gß\r,4���|�p�9Qw�A݇�_1�PA(���6o���j�ʆ�Y�\0��g�<\n**������^���G�|A��g6�-�Ԭ \'����?��`6ѵD(���Z�*ҏ<՛����+MA�qwK�������|A�_���%���m��\\�.���@1�F�E%�>i;Ɍ��2�����c?خ��<�2�`}�u�\n=�\\�1]f�iWdw���m�0VT$t!���QP�\\R�&��9vt�H�*ޅl|�|m(K��^��i�O��	�����%��x�Z)y�̿ĥ]�Gu��F6z�4_	a���P����\'�A����p}C�3�\\�4)�K]��e����X�K�yr�ͅf��.=R���!:�\0�G��rs��!�8&9��=0=x��j\';�|+��x��ԧM�9ە�O�<�r-CS\']�o4M#��gq�x9�#�^G�����\Z��%��%NU�=j���ztۭCº������eo ��v������L�{S�SVz����>���5���v���7Y���O&�������ɑ�leAV1��-g%���\03鰸�զ�_��z�5-���:�\r����FZY�ږ��ݣ�\rn�\Z�b�+�Y\Z7��1�ؚ1åV�NDޚi�\0~�E��	\'	Rw����9)|�O]��xwQ𖠑���E-<�����7*����T)+\Z��t}{B)|k�O��U:��5]?�)�� ���۝oᧉ��iNt�գ��/.Њ�`܈ye#���f�5CMio=���B�\Z*�	j��m6�}t�x����½Z�iZ�o$���V�f���T�1��L�q����oރv�d���x�$��k��lA��{N�g7�/�%��^Yæk_ً�\Z��w����\r�����r3N�z�����kx�M#�D(�:3�Ĭ���\0��ծ���[K��������s{	��9#,�I;YW��%��a�S�B������e��\0]|F\Zt�(���m��{}�\0���3�.��k�sIf��T���J��F�*\\����RU�T���F`rs�b�N1�Qj��ڜ�,T*�Ӟ��l���	��uo�7��_�L�i���\r�e�I\'�۷���*��0�^.n�8�J�ￓ�o(�9E{�E����O���N��V�y��mro��%H�{��#�f9Lg�%+ΛJ��v��zk�>��JUjn�Z�\0�^�$&{��K�4��ԣ�&����e��[�x���N��FB��B^�ZG�ߢk�i��R�\\ƻi��k�<mi�v�n�I.�nd���o�Ӌ��H��_ii��)�ǡ��ڵ����ٕTR]?S�u{��\\1�S���C�5�!�X+��G�V98��#�U�G��cba1Vsqs-�P����$�|�g�L�A9��������\0]�e����$ӭn�h��#B�櫍��BU�K:\03���nV��U{�8g1�zcD2t��QdF����AL��ց�ij��h\04\0�cB\Zhb\Z`4�\0J���J��y6��Ġ�A@\0!�`Fh@.:�\0:�cEI \r\0:��@�!��P�P��T� <���+J�=�(⠂E�ZV��O�[��Iur-a��i:(-��R\0��tS|����-x�Rk�R[�%f��)����y���v�Wl�	$mm�=*|ֹ��i{4���z˶�a�xr+ŲmNKuy�[��\0���!\\d�\0���P�w��Nu��ʟ�}���i��.W\'��u�J�-3�څ��9�/��m�Ȍ����x����:|��R�y�B*܋��ei��V���ڊWL�\r+@cwkh�g�,�E�1 I\n��\n�۰GQ�F<	U��K������^4�	�{ӧȶ�D�%���:K�{y\'��[[�a�\\\r�#�dP~�����(4�մ��~��[t���G��n�g#����j���.-���4��E��v;G�ٔ&��~��v&1�N4V��S�pU%^��K�OO��K���Z.��C�Γ��[��B�L䠌I*���H�$���c��G�ԅ$����g���GFuj�����3�|)s�o\Z���\\���-�ƳyrQ`��D��U�zmo���a�)��-m��\0�>\r��<�T}��}t^]�/�L�����f{X�U�_��#`�@�pY�Pr~U���Rs��&��H���:�{:P���^��O6f&�k�]!oZ�w`�,��F@�xY��6<���:�7��3�!��i�W�o2���xkQ���\ZŴ�;yp�h�o��I��\Z?��ഘ �6�m$�����_i�������1��ȼ#עk��F2�~\\nXyr	bg��g*��!�쨽�e����Ft����N:��\'���6���+�)5���\"	��Ƨ��p���y0�e���w��̜V+�R��k+z����\r.��G�H���x�D�?�����s���|�8*C��u�z�c����ؐ\\��n�!\r��)ʲC ��$�T��OcK���W�f����!ѝ|�u;{{Ņc`#���\"���\0��$\\q��b�V��.�\Z��a� �.m��_F�P�� 3����2s������oc7��\0ج�>]�~u��>^&�����x�r.��Cд���@��jVѥݳ�%�Y7�\n��}A����us���v&�+� ���ZX�v�1ʒi�$�v��3T�r-5{�nRO-�{�kƏ\n�1s�ʕ,�{N:b��Y�X�0�N�hE�J�D�%>dG;c#xu�Q�dq�i9m\n�����k��K�fe�n!+(���V8�V^���94�����k�\r4ϳ�$yw2�d��|�A�\0����܌�o|$h���@ێA��A��)���Ox{y�1\nv`����3�-\r����{F�)�|��}�G���8�n��{��$�Y��_��㈼���k�����M�$�Fٶ��@�;z)!\'y��3촎��}6��	�u�������7�ۿ\r��i�ޙw�\r\"G,�ʒZ�`�Èe�\'�b$�+��\0U���My�.�d�M��m���/�:�&�R���������v\Z&��kmk�xJ�^��-�J�\'�DR�%��\\4.щ#%	���׍RU��t��{=~]6��S����0�-�w˧����4�\0�\Z��Յ���0��($i�m�ocu�v]�b]��6���z���O\rM��q�}5��<-7^iJ��+Y����9K�ȴ/�.���\Zw��6����(c���Igt�w�%�r��wb�A��ӒW�R�n���Rk�.q�R���l����Z��u��|\'�H���2��ɨZ�U�g�7��W����+��\"�\'*p��~��g�fwU��Xb*+9�ֻ^ߊ<C�~�G���hֶ�֗vz�G-u:��b�(��#Lc\n_���U��x��Z���bSX�r�w���H<m���-V�H�~�g������D�9bg��\r�9D9,���j%������ߙ�t�O��v�U�w��i���|�*��ǆ4C$��\Z��H��\\0+#��ƪ2��}Fl0!�������5��;u��k�yv�\Z���Z[�w\"�7���=z�Y�����n��$�w�$�\"I�W�������giPM�?F��.�m\Zp�{{���7��Ξ�O�[�����Bh̫\"b?ݤ��1D#$�˖�s�F^ªRݥ��lҗ���\r����y��>ҒK#��\"�֒��aM����,@+� �ݯşᦆ+�u5�vA-�/��u��3m%�ta�n�\02$�����kK�՘�-vL4��-�H�����Xl\n4d�\\�T\0��\0�WD�c7us̤3ڤ�i��@Ú�\"	h�	�Zl1�sL�LP[����@\r����֨bP\0zPj�:,��O\"�Mk\n\0(\0��E\0ũ\0#5@&�Lw�R!@��V\Z`\"��(�!av�10hå\0=*=��� x�v=�����_��,�G-��oS\n0b:��<!�kIG���~n��9M��2�7=:��B��9n�$ml�^�h�{t�V55ۈo�!xf�`Ek��Ͻq�L�+}�ا\'�g0^z1���]���kT��҃N�=tv���\r�	Z�\\���Mbo���˅�c���w2��~n�;W�(-c#�1���cU�)k�����4�ZD��/�~�T���)��ȶv���P�̘�ߟ��q4��BVW�v}\n�f�}6Kb]n��\rY�ĭ��-o�Z��:�簁�)��(Ǝ�q����VUa�k�������^T\'mݣ��o�t�\05U�4{Xg��uI�P�̡�0��.	��ԃ��*qp�	��H��֧4������w��[X� x+I�K�����ܡ��c1#Lj�P�sް�u��{&��[�3/o\ZS�����o��-o�mg�\Z��X�5K���B;���͐�K<��f~��X	�\Zu���5�\\ݿ?��Q�V��x��;u��5Vڜɣ�1��Ӯ\Z���;]J�TJ��)��灓��q��^���V�>NS�IGE~�;���N�\Z��kֺ�����<K�8R�h�ep&(���j��\0���)C�./Drbks�\\��l��t�}]�5��a4��Ka#4��4�q$B$��Yd� 8�8���N�ź��E�ꎬ&T�*�����]{ￓ�Ӌ�7?u˨���kom�\"/��2\0�@@\0 ��%:q|��5�%+Ӎ��_�O��mD�{X���6	�_�<�����!�8��3�٣��>\ZA\"��V���,�N�I�;�9A�,�����`A��W&1:\r3���Q�=���9�H�9�0\"V.��$c��.lj~��e���ɹ�� F�UX��y�.�.x�ܯ������^	��)$�1:���#�u���<`Z���_&�{u\nZ�[�,iه���={����5Q�q|7h&�Yb��8wI#(�����r9�G֦漦ݷ�ጮ��N\0Q$-��=�=p\r4��]��\"=��.��r���rNq��զG*Lo��R9 �D�KG��]�� �3�\0ҹ\\�#�C������а��\n�ԡ鞼�l�d�x=$�%��[��\"���>���֖�M�3�\'û{e�FH���O\0�s��P(�qZ�x�\0�2-��$js��`)�q�{F�-�|����\Z�%�.d �����q��jԬL�#��2�gT��t�6��r�I6��T���\0���;T��3��	sE���E�\Z�;ˣow��2�ukrY��v���Uٵ>�O�,�=ZO�`��ߞ�On�hWm�_�O������kv��|;�<Hϲ�ԭ4>kɕ���pW\0�$	�����b)W��⟽��;l��s���)*��k�{n��Mǚ7Ę�ֱag���o.���)uK�FvkyC;/Ȕ�bݜ�Ey8�L/�M�����U�tz�Tq�]��Jǎ�L֡�>!x�S�t:{�:��iK۷8���) g�}F\n2��*�V>WN�\'8E�^�GC�������~�n�e��E��w�g\nN�cn���W?�^�K�.����,VXYh����c������.���i�;���Ȗ9`,�0�tkv9�\n0��!���U5����ی�NZ�^���<�C��W/����_/��x?�qx�@ҵ�ki� ��S�/�;>V�m$(l�5��6	����[�r�]^=o/6�}�v�T�V��nֽ��-޻��>V��.�Й�f@�/�Yڙ-\n�̝�v�����4��U%������c�:�j4��%�w��hZ�^e�l4x\'Χ�K�^�=�nYd������m�A$��.X�J�!Ւ�d�̻�T��].������[�M4A��q�>E��<Q:�4���0�-+:�&8\0���������G����U):�^�z.�Q��$�Ɨ���Ei�r�@,ܖ[̕���F���\\��=Om���7Fr���EhѬ��LEe�^kq�A���xb��n��pb�8딺&sr�>��m�7�Ee$S�����JH.�s�\")N��$��%����}�!�\r=4�z�\"\n����\Z���V$�(�\02�ө�\\�kv8ڲ�9��@C �h���ey�@7?Z`%\05�E��@\r���0�CץP��\0�(@2����0�Ġ��@ŠCA恎hJ�!4�\n��I�ĕ$Y�\Zz�\0��?\'ւG�\0�*D�c\"�����,z\n�\'�8�*H\'��k�� NZY0=�\0:F������w^�,��u��KӞm:��\\��˒8�%H\'�Y��1�-Jt��ﮟ����k�(G���rS���\0�	A|��b���>�l�8�v��&HeT�RR�i�_��\ra���<�y�x��:���f�Q<I+�����TwQ�b	�t|�xi^�Zkt�\0S��ŬE\Z�E$��^F.��a������Fצ��ʫ���A��df�*��T�^��k�C\ZrR�N����M+���\Z�¶�]�2���`�E�E����� ��;��k{~:��������`-������Ew����M۰�\n��8�lWR�����!z�q[GO���?e)�宝����w�m=cLxĳ$�BY$k��$-\n��0@�H$�j��{)h��m?�``��[����|��\0�9�uK���\0A4�O4w��Y�d�(fE\0�ʁ���\n�na\n<�p�ek�����ܿ-�]K��O��Ʒ�?K�\0���uq5Ƭ�!��&H���l-�4,\0!O�Ǘ�Uj�o���f���{\ZoY���:I�\\[�s�1<k�\0\rJ9V?(�@7\r�F�F���r�O�&��ʏ�q��u���\0?�f����;��_]Y�}�I\"�Yo�3�Q�\'.�x�U�\0L�)�S���rF�&I:Ѿ�j�]���\0<!���ZE-��iV�����\r�,�f��N�$qM�nij�)՜�r~��oŭ�w>��_�>�i���[22�.Tu��a��rzԹ�S���\r?���D�ػF���}�1ѕ�q��j\ZGi�i2�D�cj����:��\Z|��\r��n���x�тx�E5!�3B�I�$xw�C!ˬ�$^1׃��Rh�R�����+3�qN��rWҖrC!<<�{�m]|���4��G�$`)j�u#���@�N��P(���_�T�����c����2~�7|�So��{�\r�_��Ka����Ѷ��c.��)d������FO��-��ie$l��\"��r�펼�})6R<���[ĸ	�!g�\"�c:�����WS�<g��0H��dv�d1\0�=3�ϭRf��\\����[K�1F���jjV3�9����\"�����\r�f��+/pI9�*�J��7$�����c��w�~�c�Y��7w\Zu����� /\"ɿ(7���f��o�/��miM|_��8L3���j�z�\0_�����[V�W��Ay��u�0��e|�Q��wT����{f�	f�cO�E���\0����QU�V��ܺ_�6=oÞ����i��D�w5�؏j�fx�\0erQ��[rg��X�EG������u��|Ίt0���l�쮶��\0\0���\n��i>-�~��iR�d��H�r�H�תȢE�r���b�5K�����}��c0���&���ݓ��}O@��|1����c�]f���w,eT�!�f\'�eS��|�&�)U����M������=Ǝ5)���t����|Ox�u+\re���w�6I4�\'�H��|��Qٹd\r+$;���X{:��}?����&8j�*sQ�����hZ���h5O��jX<�Z,�</1[��ݶc������2���.���*-�Jߙ�2հ�[�{��fi���<\r�H�&���+3��_ZHL��BH���p*�����uV�IW���7����E�v�+T$�����\r���H� �v�����2\\f���NI�\\��1F��\\�|�j�\0l��FX9ʊ{mek�7�����b��n��oU�g�\Z(.#����[�v�F&�B!Lp�\0F�z��g.��i���T�>]����ﺴ�Y\n,�[OHJ��m�%X6���Г�b����d�5�7���S6\r��c�HX�S�%��˷o$Hy���k��ə^;Swc��}�ވZ�$��D�f\\���˩q�J�Q����r�i;l��5�7)�\"Z+�ZԴG�U�P�G���\Z6���\"�樠�hQȠc1�V;��W�y(0h�u�C?���c4&0}��P�(:�P�\0?���)\0�s@�\0xZ\0^�11�*�㊑E\0(a��֤L�9�b7<�|[��)*��w����Km&Ѿ�Z�~gC��xoHwRe���b\\I/�^E����V*�%C\r�e*�K�_����{F��7��3��t��smݕ�	���d�ik*J \\�� �\'�,6�*�=B�����������+�?mO�Z[��G�|:��k{x�;�\\D��.�7FB�ct?��m�:\Z�R4�7}%���f5�:�}#�u��C.�[I�Is��ê٦��&؍�D�v(�6����ߑ�k�(�M��|���\n0��E%�E̟�Z��.�\rS�^����+�n/+q���>e�r8�zTb�UN[K��o��烂W��o��߄��<6��+���6��c�Q�X�ͶLpJ�3K9F��V�q���U���ؼi�y��V�,4�e���4i�a�)���*D@��K�z+�Tc�i������X\rJ���V_f={��\0�;�&��{����Ӭ��e0r��+�o�+�!�J�!�|�T���{k5N4�7��_V�~!x�=f{tx�6��W;�v�W���9�I=@���N:>�=��?<筘�=��:Gӿȣ���V���%�+$k��C�0v\"���:�2�t8ԣ�j��������1I�Қ�k�Z�}�@����J�D��i�-4���+0�u����$��$j\n�a�Nk��FJ2�R6���Y�S�(9F��1�]����{ׂ4[=.��TL��G�������cNL��\nFX�4e���?ȃϷ�d�5u�wO3\0b��@��*\\�*gKb�\"�\0�\0��s\Z�_Sr�3�d��ҩ1�\ZqG�pOִ�.=���z�;��� ��oJw�g�w	�|g�BA��s�@�c��x�j��X�c�i����v��~{v�Ʒ2��+H�)�\0?Ƥ����}�)8e�c���TH�;W�?\n���4� \n�\\��*oc�7|B�^ٮI�+����1<�D~�\\����g���v�P.:q[�ZjsԆ�=/�^�5S�%�o�N	v��zH�FG�Vu�s��G�c^n*�־��=�\r^t��[�m��/���m�=J�5K�}.�k\'�i���,[����x����p��~3ꔕZt䝛[X�h㆜�N��z�[��y]j\n���ǥ\\��!IE��o$q�Р���ó�r@�SX�RQ�%ew�[��N��i5՗�%��/��.����}j���GE�m����gF���5i\"X��7Q��#hV�K��o�pi��z1V�g\n���\'������>p�sw�f�mt=�˩��Wd�cW�=�$���P��t��l�~���	C�������\Z�����mr�}6^��h�\0-L�X]�����YO�͔Q)q�Ŏ �e�.����T��Zw�]-�hz�|n�?4����\0L�~\"�X��4;���ݡA=��^B�d�+3��DS+v`��	FURӦ�\0?����q��\0i\ZW����1w�w���Zi�W�v�w����a���cU*���f�W&kB��M�=����+ӯ�(vZ�n�5��~��5��{cp�i���}e�����\r���w+H��ʑ��έ�i�g������g���T����)5k���X�{�\n\rY�Г�+-�m.��e��||\"��\0�g���BU%I�M-�Y�\Z\\����v��\0{<�{kt����c����ȡ\\��Jy���?*v9���v��ѻDQ\\�m���V�o\"��M�^\\w��*��U�*��)���wG4���ơ�_[�,�QZ�s�;Q���2�\n&QW,�`���I5/U��}��h㚓\'ԊA���N�Ew��3TF��@�#43�z��h6���h�\0P@�g@zW�ya��\r\04�\n\nu�\'4&�P��c�2GT��h��h��b����jI:�\0��\01�@Z��$u,�w��4�&�q�\0,��X�0��?�D�w`��1Tך44�B�I��|1���k7�I���P��B��\0�6���� �k��\'%Mwk5���6\"��𘖒�}�9����ox^����.�,f���3��@r�%#\r��\0��;�`	�(*x�҄���N��,D�`�¬\Z�W��|�1����j���gt-�0�)\n�.��c$��:\Zʶ�7���6�\0�v�65��^��n���~���6\ZkYI妟x%E-���<�#��W E\\�V�Z�R\\�Y/�j�:��d��kK�Gt�u�R���ׂ�l<A��ͨ�K����Ud�U66@9��:�=k��֣���W{=N�_�U�k̵;��Z֡�����\'h�Ȓ��L����22�F^#\nA ��\'h<f�k�ia��a�z7��;p�:���X���Ͽ����5��4���^+Kxe9����1�r>���0�c-U�-O?3��ѲW����y���\Ze��xKK��DM���)P��ã��^��e�~{�|���1�U>�Aٽ��\0��6�n�$v��-�S����ᑢ��q��\n�q�r+IT~��_��Q��8mm/��]�Gk�\0�5�gJ]#Piz���16��x���<��Q ��$q�졌��єZj���<Nإ\'$��\'�����~Yh�lh�(�\"�\0��o\\z�����7vf�CҴ�,�G�@�H?�Z�l�(�4�UU@���r�p=95�e�N�@�>�h�4�:�4)�bu*�7mx\"�1Y\ZP����3h����4gbx�\'��6XH�����l�\'�=�]���!���Ni�8\'�ZhL]��H��V��#ϽGB�F{}�\0xdu8T�&f�X�V;wT3D�#[В82�3n�\\t�X���|G�r�A:��e϶���R�H�◄Z?3+��CmG��2-�����O��Wa�IMm��6��Fro#ʐAy�8����Jn����]�j����j��q�OJ�����[іUdRD�����s�r��O��F1�\Z�k}�I��*�?��q>*�f�g��S�F�.mo���2�YY<��̃�H�$`���p�jc�����_��<UZX/�R������:{k�V�\\�����X�I�Cl�k�*F~0��0��`�����q�׿��v�L�-E\ZP���g���N*�Go��t�Mθ��5��d��P.b2Ku����2F��_k���VV����/��>.T}�J�)F����G/�ִ/\rx�-*]>�Q��gO��V�p�\Z���w(�߮�\npaR}l���J�%��yz��<�%jT�)^V�l��_���5]3�σ�\r�\rH�݈�����DY�o)�`����%]nwE;��X��\r٥{v�M<���FT�Qs�׵���y����\Z�m���hQ�փNbh(KI�2�4b�([�|�\0C]X\n�*�P��4��;���<e*T���O]�~o��N�����O�_���4}����ʢ�i��4M��[y����J��Uራx}�uz��w���|%ah�חWu�}~_��i`��<a�|�L��[{&�7�ʨO�IWrd���(=y��#*Uc����_�_��c(,FQW}{+�w�<gSэ��]�*�p�ޢ<%��C�v$�7�q_k�J����*.V���}朙��Ilx��`f!c����E-b��n��tU�q�ݚ�o��S�,����ٳ#2�%1�W<���9���Ѻ��C��G�]Fa�X� ��=AҸ�F^�V�U�dL+Bȏh�)<\Z4����\0�\rz�P1�@&94��J7��;0:������E�.�1G4�P�w��-\0�1��\0�\08P!�R��h@��1�;�p\"��*Ա1�Rb�*B���R�v�Sp��ֆ6����5֡.��!��v�I#21(��\rcR��=���6#��GW>����\0�D� s\Z��p��Tx�A\'����Lj��ۗc�>�Gnm�\0&�G��\'m{�>��GnV[6�����j�>W#��:{)U���dե}��Ζ\'JqO���<�M>�,=�w.��a*�S���<���}4_�+,�N�R��v�\r�բ�Kե�\'���f4��\0� ��z�q�/f�j?3����X��b^�S�gu�<O�\r)�dU����W1�	~#P��Ǟ\0�+�F�����Ӄ�T�zRNɵ�F{m鵽��]�f���\'���sr�#8�g�b�\nr7t��W���>�J���-��N�|L׮|=���l���5y�;f�q$-$�+ 2\rь�$��>����#\r�Yϛ�V_��(I�l�Y�>\Z�\"կZ}�]D&Qq#���<��|��dy+�8����mN:#�2�.���M[��y�����W�wwZ�׬�h\\[�4rL�sF�(*���p��>q��%ѯ\n��^�=ʘ�2�e��U�nz_èo5���/	V8 �I�%P1���\0���(a�$~o���W�T�K�~��դ�|�@�:Q�c�t�C%Md٬Q���(�.�I`�U8�ޓw.;�&��X�\"���j�����LɣF.kTIz>�ڭ#&�Q�j����1©�&��S�K\0F9��e�lc�H�\"9H	�Re$g�1�L��f�z��<��k&j�\'��P�>��Մަ�>n���1ܒ�{����7���ǚ��rvRv�j��Z���c�B�Ö�D�}KG���/#�A�8�tm��@\ZA�0�0�n*�mw��0�%4�����#�M\r<A���:(�].e�P���\nF�����c��|�=ysn�.�k�u�%����\r^��]-���γ�\Z�:Η��5B跖6�\\:�wfx�n�%o��Jn9!��^@�\"��լ�;O������_����q�^�����	�����O�v�D���-���j�Vr�p�\n	��!J�\"�ֆ�l��:��Mn|����������������_�E%� �cU�5�\'���\r�FI����\0�S^�\n���Y3�0�ʼ��Y+_y��9񮙬h��i��gg�2�)m�$Q<���-�EV*�Ć�]k���9{j���~K���%N1�%u+����&��\rg��� ���ҭ��\Z�F���Vl�����C��+��	Q����{����u�k:��&-�]4��3[ţ��hZ��>�S�kxfRE0K\r�+\"Ơ�݃�1�����*�������g/���2�nIғ��*�t�^��>���u�-�g��̌���-����@a$`�$��Y�OZ����~�KO��#)F�.e�O-W��_�6���\"��L%��@��c ��N�v�$y�^�_W�B���aY�ny���{I���%��l�^M��ͻb�������^�;]y=5bx��S������Gz�4�-��#�YP���)���0B�F#\0�i�-Y�W8�\0۵��y�#y����<���x��*;jC�s%������i��DL*�1���Єc4�F�j�7J��A6��kU!�L��AW:#Ҽ��&)�9�q�)��J��д~1@����$Z`H�\094�P1@ɤ��R&�;�KaX�=*^�d�T�	4�;�[���d���J��!�9v�q�s��umx�<������#ʵl�c�Ŭ���n�ڵ��I]��§s���Ą�U��/��u�J鯟�׾�G�i�Ҕ�u�/o�E?�£E!7(_� ��H)���q�$d���_q�ҫ+��z�\0]��_Ŷ\ZDCq\"�]��Xfߌ9�G�O\\��2z(��T���W�a��\\����s�Zn���R��4�ӥ���O5	���O�]x��p������[��a��K�U�_��B��seg:}�U�wh�`F�%�,˲E/���<��^*Nז�h{ԡ$����A�K$�S�n�3J�,����U�w�.�+i7�Q�Gbq��V�J���\0Nǵ�i�S�]��Mz?��>J���\r_��\"�k���)�-����m�g����Aǥ}�O	J�ke_�s�\\v.�c��o�M�ӹ�j\Z$�O�\rʳ��@�Ux�P��Q��x�HU���2rx�?i[�G�U��0��^�������=__�{�b�8�0\"�1\n��8�Ps�99�uԫ�&��S�WOk���τDpD���T\0N}�̔�z0���@��Y\\���rG���O c�ҡ��t�s;q�We$n�9R;�j\r6�%u�޴L�Hֶ�8�kf�i۰�����к�}+D`<0鞵KFKCÏ�\n�X	��(8�֨VB����DE�-�ޑ�0)����e$�s�� �b�f�m��Oc�ڳe%���[�ܧ���4<���[�	��ݳ �JH��>\"��ᦴ��)S������[�E����3h>5��N-a��#H�T�v �A?��U�56���Uv>�ѼL�u���W3C��i+��L�aH�2�P�dgf$�R�_�ù�M���_=�⏡�ץN���=o�����}�^\'�S�j\Z-��Bm�|��h��B���7��I�¾Ʈ\r�B5jF���|]<~+:�`�6�c��V�Ï^x�[}J�U�54Id�^b�]��a�3��s\0��<��:����c�Z���BP���&Qr��F���9�����5k}GG���Ϳ���5f�Sn���(W���2�<��c19�0X�M:s^�z����o��c�R�=ZW��\0�z?���sE�wg�[��ZR\"���.9�h@W|0�ú�ʬ�M\r�����՝wJ�N�ֿ#���q�*���/z����W�W�3�ąc�I�������C+��(\0!v0��g�\0zXW֩�u꿯��>�;E�ѵ����t?o<Wq�kY�c���҆��r�W�,E����9��G��˖\n�o(�G|���#��W�FP�W�s���؇M�wM2��	��~�p��\"�.�܀�efa�\0�s^f\Z0����kծV�\0/��\n��]9I�]}7����|@�� ����\'1��D�	]�\0�6g*<��1\\9\\�9�����0�ڏ2�l|��d:ĒǏ1��$���\'̅�bҸ }���3����2kc����m��-`U$�[��5c�4��[*b��_9�oQ�UTl�?�v3[\\��$�u���C��L�JUI8U���`+˖��7W1��4\0x�����*�a�V���9�r��4�q�P1�P�\0&9��{�\0f�7��&��0�\0�(1�w\0�i�O�\nW����W�;R�@���&\0:��\0PP��&R@3Y�nJ�ސ=I�T2	\0���uV�t[;X�$����#\0\r��6�e�r1��[�2��ka�WXzpRW��j:Ϳ�VDY�դi|���bc���N@0!^2��q�B��������?���W�Gyh��a���P�06�BIm�7B���\n�L%a����/��4����������1�q������������5�R�[ۈde�\'\r�;���Gʋ�y�s�����z�r�.j��o�\0��~ڤ�2�,c�Im!���\n�6���\r��T�FFJ��+�g�B1��8�m�<�����Y\0\Z�VG�ETV��U�I�^w��<�imz���z��,}����m�����3��S���+[�ݑ$����ƛ\Z0���B�:d�VU��P���g��y�kM�w���=S��m!mu�{H��p�2�3\0��*�З1�3��$�Я>uʙ�e�\\e�ֿ�g�Z�爘]A,6��Y��\n�!�y~ae����=� ��)R�������8�i���m�=_���o[ϭ]�j�����r��K��^���b��*:ܽ����z��+�+�;-1v��j/sD��ȟ��W)#���A��l�������ԃBd�t��i�I�m!�1V�*�6�8��\"fѩ�b�L�.����\rh���\"ɖ�j�CV$rNO�A6���0��9�b�B9��89��q8�&q��574Q!y�Ƿj�#D�$|�[5\rܮR�����e%c.�w+v#�y�}ʱ���%Źz������f�ϕ�:�L��K.�ި98�:�\0��8˩�Q�o�a�I�Dʠ�NU�G�]��ʢ���> �����:wٙ.�b�%\"2d\r��#���H8>UL;t�I=w_��R��B�vZ2����k:=������n!��\nY��B���K`\0,p�N3TjF�v�%�?�z�l�Y\Z��Z����\0�S��}?L�5\n��a�$�G*�v��ʳ)��tGt��V���7:�A{��?��mZ�%��Jюɷ�r������=\"�G�����7�������b��#2�rvÖ��5�a�*��_�����sTk\'N\ZEh��[����~Ox����^{i4��rEKv҆�9pģI!�?{��!��10�B���w���~;wh���U�h�W_v׶����9o��B�)�tk����h�7}����\0/�V\\��v\'�z2���R[�޿��;1�9V�ZEYo}M��^\\�-ݍ������sooq2�;�*`bn��j�\0k������;Ư2�=�}�?ݭi8�믒a�[��Q���{��|��ƞs!�T��XcP	n�T�&��Ea�Ѧ��n���|�O-���V�ݾ�K�:yuyu���.��ʍ�¦\'����亀���A�2N<��T�u�M���ؖ�F<ﭟ�hx�������D�\Z7��;���n� .>�h0>lW�a�s��u?%���U����-6��v�h�86�4����7DɈ�\"�ea� n���\0kթV���K:��د��-t[�,T�xUр;���y��׎���\nԽ���~�G0b�#~�S@D�E�=*�i�t���!b���\"�\ZER\0���5�X�A��㊑\0\0��p\Z¨�Á��@�@(�\0h`��x�`(�\0R1@\n(H��cD�޳d؝EM�d�*Y$�R3��|Fm<;�,���:���L1��B@�Bs�+zqud�s�r�R�9)-c����/<ey.�p���3�-��A�2P��B��ߛ\n2��׆\Z�]��,=Ld�*�˦���P������u�(S��6�E$�%m�T�\0n.y��J����߲�\0����Hѣx_OF�_T�.��1A�[\"����/M���`:�FH��\n1���?�J�j�i�T�{����Mak���V�Bϲډ2���]��a%Q����q��qQ�7�j<D_>��}�ϊ�7�\0�C�h[��QI\"/4����2c�\0K*����2�/�k�V����f?T�����&��O3��\r��<K��j���Ӣ.n�.g2-\"�љ���۞�������W�>*�<EgRj�:�~o�����0j� ���g�X���2(`���������|Z�q����Ϯ�EV�%m�MMψ7�\\K�h�ڬ�`��c@��P���\'��p	ǃ��9�R�v_�ά�qp�JQ\\��/_�;�{\"XТ�F+�R��F\'��ˈ�z�b�:N��pFEM�|�Ee�ҝ��7m	�ޞ�7�,����\r��dI�jF�ZtƤ��b�	�F)�5�f\r����򪹛D�6zq�Us7Q/j���7JW[?�i�`ݷ<u��\rg8�J�[�;���,��vy����08�X�,v�z�U�sQM��~e=�c{0��\'�����̪��88�#����R��i\n|_��X^��\n0\'�ֻ� ��G+���-[I�A4P�h�m\r9�ެ:������jkN�<��Fp��uy�\rKP�����0���%�R���@!+l���0U�Qp3�~sI�q���wkt}uz�[�織�!:s���ڿU���V���~~������蓽�/��R۶�)rXn�2���\r���\njI���};�V���y���������,?�!�㼼������-�8\r���N<�>dܮ�+/r�*�J)i��\0O���y��ݛ���_mu�\r�\0x+P����\r�K�k{K�.%�g�i�;0M��x��<����]�	��u�O�K%��w�\0g9R���T���;߷��;�K<Oy��Rb�\Z9���$Ya���,��|�\\����d��q�/���!ʕu��ד}~_��������tۍ��i[O���xͼG���,v^,��lt��kC�$QݖI0�	��9��0q�U�J�iW��4����߁�G\n�T��6�z�k܌]W\\�v��F��j�ڔqo�%�b��\\��eI��D��\n5\'������\0�s�\r������k�_�&��F��\\^F2%��ԥ�s)��\n����\n���ڳp��{���_���9���Z�����.Z�i7���.Z�RB/�eFy�8�I �Z�,�Nq�������6�����}7���Gml��I<	\r��,r|������k�iY�c��lq>4���Yi q%�E1�?|c���q�J�\\cg���%�+���ZlS�h$cU�m�;0���Pb��	��(F4\0�\0L��\0Fj��L\r�^y� 8t��[�\0!��j���\0(�@@@\n\r\0.(�5 0\r\0(�֡��:�D�	ҥ�I��Mɭ�HK��\'S�����G�)&�w7�VT��|�����j�8\"@U�dF��*�*W*K\0~^q��W<��g�Խ��e�֞�滞k��:����Um�g1<�n�Ω�,��\r���9 �S�9z#ǯ��J�������̫c{\r��m�o���5�G,r!^@\r�� �����d�V3��v�*ѭs濫�������V�yw$g��&d��}�L|�!U��|�*�@������[���C��Ն�5m���wW^:���K�Q�3�y|�A�pp1��O\'\"���8a($�K��j�*f�6�={DҢ�G�4�Ӌ渎)�� �����+���\0|~N�yc1\r-�����/��i���լM��#P�Mҭ�m�w���lLT�f�FB�H�)�q[�+RI���k}���pXj�)��e�~��[�s���|M=�0�bokjV8�W*:��@�1�]P�(��z���b\Z�y5��|�R�b2��Q�^�H<�W;5���mp����Mx\"ق*�ԃ�\ns�|S���,q��M���\r�ִB5�;֫`4` Ո���!����dU&CL�����&����Ц~?�\0��~9����\'����Ґ�#\rAdg �\0�-��;pH8�Y1�g\\�v��VRcJ��%�ݞ�湞�C�֬���ea�G�jB���\0�	��K(�\'����!-G\\�O����k��-w�쀝�<6\\��es��ʪF�����X۴�v�u}{/����\\�p����oN�*Q�2�hTJ��sU<E\Z|��˯E���1ѫRV��V���u����x�MM#�zS�v�Eco<q���1�Q���U\\s�� �\r\\��ԥ-��˹���:j���/(��\0�F���h�4{�;C@b���[����W�$*��#2��%�Qŷ�]9y��/�c���:za�v��\'�=R�o��^\r+餓_�����E�jp\"L�G*$B&n	PA\0N�-��{{{�엗��-|��e^��gQ9uZ�ݾ~�.�k4�i��-�ƚtk�����̌@$�dm��4a@Q)�Y�x��Ւ�$��\0�u���5���w&ۓ������ּ�x��ֺ�p?���ڶV2;��$0��P��D2P��;��u>�]ћ���/���qb0��ւ�H�k.�Z_�3�+�;]�f�>�TYO�Cii4@��Ȃ̡1�`�˃���\nqUh��}�&��^���&�8����QIz�~��D[�4�f�g��WJ��%�N�%��*|��m-ʌ�n�W�6�R�־��n��=��N�Ju��W{���?hk)mƳ��@.ѤG�|�;	�9\r�?.1ɯo$���t>/=�����+�-��r��ƒ�����BHn�\0�ʃ��ϿVV������Q�a�k�_֞���`ѫS�c����+9���¨�+w���G4�1�����\"��c�hEXnqTh\0�\04�@*�I������/jLԉ��A#[��=*�Bf���5	Ҁ(hGJ\0?����P�T�9E\0-&ץHɒ��\"t�d��Qbl=[M+t�}�\\�)�j0 I2�,�=\0q��r9�;E5�G��MeW�W���&��\\��-턋30��Xʏ�Q���؀�A� zTjFQ����3\rZ�\"�M���|�-1&�ԯ���#�I@UAa�������d}u��(��́MՕJ�Vt�(�_W�����R��\\�23}�G\0���%.K֒՘f8�y�?u~\'c���Ѷ�\rKVH���66��xIVVYA��<ԑ[��Wv;yy�`��*Z����&L�EV��%�{���m��濶�Ӛ\'V�v��.s��Y�jc?7;3�\"��\n����Z���Os4��M�zM\'������f�<7዇�\0���\ZD�	�	%*�;v�L��U��W�*�y/����|�RXj\n����k���x?D[[8S�\0\0���]�%�Ϛ��_s��kP�v�k�F�#Ӽ36ch\'��C{��D���di�|��v���s\nLڲ��b���$;s��f�����iA�9�@�i�v&��#�)�����5hɢE|Ր���Cղ}����\'�=��F8�~���)�e����T0)�p\\��e\"�3�]ķAX�;�3.P��ny��Ԥ���sj�zs�����y��o\r.��N�C1q[%a)j~|a�Ě.��\"�2�T��5�M�Fm8�A�����^��V:�QF�#ƚ�ɵA���pDY����&�(UN2�^}ly�S�,�����gr����i0Mwiw�mk��\r�C*�(f�Ug\\��d�e�~f�v��yqx�S勲����v��~�_��G\rF�o+&��oK���uo}�v�\r�j������v���g�[�����dYE	ڐ�ĮI	3�%�4�e��p������߽��%�t�Ztߺ����?���|\Z�t=B�T��5�7�&(��fi��S)$`1M�N�	�!O�ϯOFiR����S͖��$�Wkn����>\"�:�n\r�2f��3��0IU\\��ù��uRҮ�QZ�r�\Z�W�͵�[��t���\r��K��k{ueҥ�Xc��P��R��m��2��<|]l<诫�N�����mv�����)V\\�z5��[�������_Xӭm`��ooM�]�/�2�&�`��e2�g��Z��ҍI]MF��O�s��PX\\C���r�6����E��6[­&�<�V���Ģg(��6�\'�$��&���\n1}��m�w�sר�95�ſ��y/��Sw⏇�Ƴ=��G-�=�.�sjJǿQ�}��}&-xЋ����s�ե��ʵH�v���▇�B�}h�>i{c$^Q	�\0=v�3*�i\'Q��{��쿯�~�����}���;zq��6��2v hp|��7}�y��ijx��_��Ch�V����4�J`!\0�1B\Z\ZP���\0i�b�	���ۮ�\r&68\ZD��($c\Zh���H�c�\0���0�)\0�\0�Ҁ\r��@\0(�R�J\0*X�zP�8�b�\Z�Y:�������KE����I�J�&�E���U�Pݺ��]0��%%��\\��U �(�ۏ�sX�5�}�ޡ�G&�f�p3�ߜ��+��W\r���>�Q�����}��9]s�V�B�ֱ�m�#�r!8^;\'xn1�+��	I�Oc����F>Ζ�\0��u?��յ���(:Di\"���_?0�`���&�/��J������K�Mi۹�ɨE�yriR��6�#�pUw�B�+b=������c��T\\[���C��U�	�V�t�9ޘ�m��i(ku��X$������pX����տ#�s:�b�r�漉>#\\�u\rMF2Ot�j2�,��[��\0�?6�`�p]��S��Y/>��1�k��h�[���u�=�E@���2��k\r��\0��;F�;�ڕ�(�K�����I�٪\"c���Ub6w,�Z�����cf��˃V�\'#n�>0Mj�4a��Z��\ZGҵQ�(�4�`�(\\����m�8��\09�CC�J�\Z�G�E\09z��+�P�\ZS#�CE\\�*�sY�;�䌐z��fЮP��p\'�q����b 7~y�.[��`.`ua�A�V�s��/���y�3�q����tӗC�Ok��M��d����\n�=H�G�A%K+�ש�V+g��c�}5g���좽�3<�tX���d]�����&\r��d�\Z��E�)��u��\0�}���tg*U[�}�����P�e�_Nծn�����K;x�7��J�lo�,-�NK���G*��׏J_Ws����馛^�:o&}\"�}r0�(�k%�}u��MV��1�f�����3�ɉ�̺��ξj���.���fl#0$���5<B��ɵѽ�y�����]��n�K/ЃX��߈��Zw�c�6�6�Ω�Y�c�G� ���lU(L�ع�!\0ڝZ�Yʭ$�:&�����bpT14aJk���Y_����5}g�W��{�g��Kv6���d��~Rޤ�p�>��ڇ�-��g��U���Z=4{���]��h���<R4���6�y�\"�H�YeE/�E�U\0?v7v����Ui��VpR�l�����Ue\Z��u�k���(ZOt��$��Y[Y�#l�g���aq����z��*S�1��o�R_���9ҩ)n�_�.�\0���T�/~���v��~Ꝋ��\"�;\r���0zY�������s�L+�.���&�ޏo��k�\\;��9���EP��r�KmۖO�k�+����|[#�S���E�WĲ�Ƴs$��+6�D\0�q�?\n�,Dyfdc��s)��S@DF*���@!��YC�\0�h��L#����\0C�P��qh��c�3@�=((m�v�(JlLQRH�ɠ֓å 4\0�b�+�����C$Z�^iɣ�,j�^���M��A����Nʶ���Ա�98`��=�P�8��Y��t)Nk��ϧ���x��s�݅��t���\r��YМ0a��3��v��^�$\"��s,N>r�P��z_�N5ܛ��E-���<���\Z�t�iD&�ӗs�4\rp���\"G�\"�B�C�?:��2��(Ǯk�R�����Q(�;� ���k�~�m����d���B�,cl��	��vI\"�Z��JU%�z^��o�#ݡ/�Sn�)������yu)5��F���\r����I]�0;��pA��j�*Z3��O��d�2�k?C��-�H��������*d��d��d���US�,6^V�������J������)��	���qz�����W�SY�������1m�tR8;�.�\'�h�f�c�Ӯ�Lk��S�Ã��Q�G5��8��aX1qV�O1�mn$b~UJ��oo�8�@�k�6��t�u*����Re���&\\S)�b��<s֋3J�~(��[bE9��&L��!�ޝ�hd��ZM��ܚ���*��*mrnT�p�U(�g\\(\0�t�p9�p��9�Q����ˠ���LH����=�REƥ����a����C��H�\\bkRi��#�6��9j\r�`�<�f�v��\Zd\n�#���m����rՏ����_/�N����[�;h�m���KO�ߔ+���[�>c��P7�d�x1ta��RkE}4�f�뭎��R�|S^{����o�x�C���A<�T[�gݲvfH� \r��\"���̎F����എ���?ѯKu=jx��b�]�鮞I_��W��M��Ky����}��+G1/��%$��&M��=�C�\n�>x;��^�?Tzt���5gk$�KǺV��?_���0Դ�7�]][�u1�����c������?���VLTe�e��}z3�0���|��nq����<�A\r,�V�մbr�C9�8���w�%8����i{<C���Zzu[}�����5E�	&����`�6\Z\n�b�E�[�f�݋�e׌����p�J�ؽ����GԹ*0^׫�\0۴9_�bOn���\'��v�E�*	�\0�Kנ����)�V�ݤ��c�T����9?�7s����¶�X�vs�������y�s�H���\'/�����Q�kJWk_E���y�P��*��V���znݎ��W\r�w1l��s�ڮ�W>O��C���A$DU1�H�0����B�\0\'�1�6�Ƒ@\0%\0lt�\\G�(4\0��h$(7��P�W&é �q1�ޤ�:c\r�&�&��I��Qp�^� (��!�QI��E+��*�*I\0y�,I�$U$�, ry?�\Z�.RHݻ�?�\'�4�67��0i\\.�O)��rA�c�q����t~�Iԗ��g�{u^�0�~�Bf�J���I�E���~��Egf}�\0r^E�$!�]*�T=�����?c\'g�گFpږ�$Z�Ο��nZ)?�`e_��@ y�UUN\nl�cB|�՞����_C�K�ȋ��G���Hm��P����Q����Lۛ�G���IA�U�g�4�4��\"�t%��ʱF��\0bB��Հ\0��g�&�xI{EVd��}YЋ��3�Q��n�am<���x����;���~c��^qU�R�wWWWR5Rv�K�&�R������������f���r�/=��V�IP�2�g5Y�X������H����q��\0J�z��J�}B�S�@9%N}�2�|�z��\'s��~+�����ϐ�i`t����ں�S	FV��|\'�4)�Ӣʌ�u�\'\n��q��ﹱ���37)ug�xK���\n���E�g�#��c8M��܎H\'�Aҟ*{���=K����H\"y	�0Ѵj��Igu�dg�S��^��i��p�&��W=H�8�=kNT5R�E�NM.U��3�X��G�sQfn�e��6�u4Y2�=y�b�$�s�J�h/��ɠWBo����>��Q(��!�P��+%��<U���\0;p\0}��M��`��G(��q��=�4�3 �\0U(JVЫ=�F���5vG;�8���CY]�q�T�9���\'����Ϟ��o�%����^d(H�&�y�eV\\sԾ)���u��+�[�Y�/�k�)l�ͭ�����\"����\'?�Z���S��:���{�9A������E>dh�����hڔwPH�4y��a���ұ����:�-3�i�_�F�bG�B�@�E���\'e-��GrJ1��7K�6��w}W^�G�B�:nɭ}>��\03\'����}R�e��������s-�j�;<�ˮyd�na�$�J�Vx\\�{UF���vW����>W������\n~���6�|%�9#�k1�,W�)��}��H�=OL�~\'��S�A���М1����-������\Z:�Z�V�m!c;�5Ο\rı�ѓ#��F�F�xC�7b�J�RN�m�g���l}{��rEn�W�x�\0��I<+��[B��g}h9C�*L�� ��8���V��a�?�ߩ��\n�p��қ���zG��_鰴0���Y���f��7!�K�5�}��3�k�(^%�K�k�>��J0�o����9���iXFKv�DX��^Uy>F�\0��z�8�VI��VG�T���9z�m�����k.��C֖�єy!Wg\'qP��J�т��kӭ8ҍ��[�ӹ��3�Tm�v)�t������$F=H���S���5��i��Z#�L�j���x��5Hc\r0j��0��4LSC\ZE0\ZE�@\Z��y��Pn�,8\ZaM\0/N����J��+\0�B�X\\s@l9W<��7��)\\�Av���&�x����K�p9�h� ��(�e�u�Fq�8���:��ԫG�F���`���4F��*�@Hl4a��z��\"w.{g�\Z��P��o3�+a�):�~�������m�����٪���w�\Z_�T��ZIY�r	\nA�t\'�A���CJrU+E�.���#��ľxa�1�9\n�����g�\\c�d�*��TyV�xؼJ��Z��{اX�F,T�+�y�N\0Lp��.0r;u�IE��<�D����l\'��\Z(�^I-�X�U~`S\r����㑁ZNj\n�9�%����zs��^�&	�6Ѭr,��J� 78�3�I��U��Ӓ���6\ZR��7�}�\rO�zl���ðbס!�y���SM��88�����lH�c޼����maIWr����H��S���jmP9��[��L�-m�5��t��Q��ʚׁ�_D�}e�F7:\r��ÑZ-��~)�i�\r4�22���\\�7g�#\0�ݢR���+��$�m�g��S�.�T��nӷwEW�ǽl�d�E������#��Z��fbv�!܁�8���@n��:MltC����~2�>*�5���:0�T��s�V-;luBI����V��u`$Y�uܴ/##9�ҕˋ,G:�8�M\Z=�J�h�6����O+&ZdM1���~�&;7G���Xi��=j�KCN��q��t�$��W\Z�*�1*��	A�\0�8��J��d�{_����a\\��vД\0ɺA�g�N@�Fkd���E��^(���X�B����B��F\"�I�I!��s�Ʒ�R{�2�F�<������\rM���Y,º*Y����˃! ���3P�\'S�^�C�xU�\"��>#Ե)��X��l���[�����b��.}��+X��F��I���\\��3�� ��Liu<�N�m%�������I���BL��_J��\\�?��0��W��Z��.���D��*�!���!�(�;��Td��<z������c�;K�F�����BM���+�ͤ�^�r 3-ʧ��Gǘ�@$����<jF�}?���:uy����V����ۧ�~��\Z\rƝsg�9��,���v�VQk���;w4E�T20�Z��k�i����{�ת<�J*8��x>�;z�G�־*РԖ����i�%X���*]C���9F�����}��mz',NULL,257121,NULL,NULL,NULL,'jpg','image/jpeg',5,'2014-04-28 06:30:04',NULL,NULL,NULL,1);
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
INSERT INTO `province_states` VALUES (1,'PP',' 	Phnom Penh Municipality',1,'2014-03-29 14:16:09',NULL,NULL,NULL,1),(2,'Banteay Meanchey','Banteay Meanchey',1,'2014-03-29 14:16:09',NULL,NULL,NULL,1),(3,'Battambang','Battambang',1,'2014-03-29 14:16:09',NULL,NULL,NULL,1),(4,'Kampong Cham','Kampong Cham',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(5,'Kampong Chhnang','Kampong Chhnang',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(6,'Kampong Speu','Kampong Speu',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(7,'Kampong Thom','Kampong Thom',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(8,'Kampot','Kampot',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(9,'Kandal ','Kandal ',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(10,'Koh Kong ','Koh Kong ',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(11,'Kep','Kep',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(12,'Kratié','Kratié',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(13,'Mondulkiri','Mondulkiri',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(14,'Oddar Meanchey','Oddar Meanchey',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(15,'Pailin','Pailin',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(16,'Preah Sihanouk','Preah Sihanouk',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(17,'Preah Vihear ','Preah Vihear ',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(18,'Pursat','Pursat',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(19,'Prey Veng','Prey Veng',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(20,'Ratanakiri','Ratanakiri',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(21,'Siem Reap','Siem Reap',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(22,'Stung Treng ','Stung Treng ',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(23,'Svay Rieng ','Svay Rieng ',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(24,'Takéo','Takéo',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1),(25,'Tbong Khmum','Tbong Khmum',1,'2014-03-29 14:21:59',NULL,NULL,NULL,1);
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
