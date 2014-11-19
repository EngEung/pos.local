CREATE DATABASE  IF NOT EXISTS `tour_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tour_db`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: tour_db
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
-- Table structure for table `accommodation_addresses`
--

DROP TABLE IF EXISTS `accommodation_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accommodation_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accommodation_id` int(11) DEFAULT NULL,
  `address_id` varchar(255) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation_addresses`
--

LOCK TABLES `accommodation_addresses` WRITE;
/*!40000 ALTER TABLE `accommodation_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `accommodation_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accommodation_amenities`
--

DROP TABLE IF EXISTS `accommodation_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accommodation_amenities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accommodation_id` varchar(45) DEFAULT NULL,
  `amenity_id` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation_amenities`
--

LOCK TABLES `accommodation_amenities` WRITE;
/*!40000 ALTER TABLE `accommodation_amenities` DISABLE KEYS */;
/*!40000 ALTER TABLE `accommodation_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accommodation_contacts`
--

DROP TABLE IF EXISTS `accommodation_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accommodation_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `accommodation_id` int(11) NOT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  `created_by` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation_contacts`
--

LOCK TABLES `accommodation_contacts` WRITE;
/*!40000 ALTER TABLE `accommodation_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accommodation_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accommodation_photos`
--

DROP TABLE IF EXISTS `accommodation_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accommodation_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accommodation_id` varchar(45) DEFAULT NULL,
  `photo_id` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation_photos`
--

LOCK TABLES `accommodation_photos` WRITE;
/*!40000 ALTER TABLE `accommodation_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `accommodation_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accommodation_types`
--

DROP TABLE IF EXISTS `accommodation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accommodation_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation_types`
--

LOCK TABLES `accommodation_types` WRITE;
/*!40000 ALTER TABLE `accommodation_types` DISABLE KEYS */;
INSERT INTO `accommodation_types` VALUES (1,'Guess',NULL,'2014-11-16 06:50:05',NULL,''),(2,'Hotel',NULL,'2014-11-16 06:50:05',NULL,'');
/*!40000 ALTER TABLE `accommodation_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accommodations`
--

DROP TABLE IF EXISTS `accommodations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accommodations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  `accommodation_type_id` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodations`
--

LOCK TABLES `accommodations` WRITE;
/*!40000 ALTER TABLE `accommodations` DISABLE KEYS */;
/*!40000 ALTER TABLE `accommodations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_types`
--

DROP TABLE IF EXISTS `address_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_types`
--

LOCK TABLES `address_types` WRITE;
/*!40000 ALTER TABLE `address_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_type_id` int(11) DEFAULT NULL,
  `street_no` varchar(10) DEFAULT NULL,
  `home_no` varchar(10) DEFAULT NULL,
  `province` varchar(60) DEFAULT NULL,
  `distrinct` varchar(60) DEFAULT NULL,
  `commune` varchar(60) DEFAULT NULL,
  `village` varchar(60) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `adv_position_id` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement`
--

LOCK TABLES `advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_positions`
--

DROP TABLE IF EXISTS `advertisement_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(60) DEFAULT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  `created_by` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_positions`
--

LOCK TABLES `advertisement_positions` WRITE;
/*!40000 ALTER TABLE `advertisement_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertisement_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amenities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amenity_type_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES (1,NULL,'bar','bar','2014-11-11 14:29:23',NULL,0),(2,1,'bar','bar','2014-11-11 14:30:55',NULL,0),(3,1,'bar','bar','2014-11-11 14:34:26',NULL,1),(4,1,'car park','car park','2014-11-11 14:37:09',NULL,1),(5,3,'free Wi-Fi in all rooms','free Wi-Fi in all rooms','2014-11-11 14:43:59',NULL,1),(6,3,'Wi-Fi in public areas','Wi-Fi in public areas','2014-11-11 14:44:13',NULL,1),(7,4,'car park','car park','2014-11-11 14:44:28',NULL,1),(8,1,'elevator','elevator','2014-11-11 14:44:45',NULL,1),(9,1,'luggage storage','luggage storage','2014-11-11 14:45:02',NULL,1),(10,1,'restaurant','restaurant','2014-11-11 14:45:21',NULL,1),(11,1,'shops','shops','2014-11-11 14:45:32',NULL,1),(12,1,'smoking area','smoking area','2014-11-11 14:45:49',NULL,1),(13,1,'babysitting','babysitting','2014-11-11 14:52:00',NULL,1),(14,1,'smoking area','smoking areas','2014-11-11 15:11:31',NULL,1);
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenity_types`
--

DROP TABLE IF EXISTS `amenity_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amenity_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenity_types`
--

LOCK TABLES `amenity_types` WRITE;
/*!40000 ALTER TABLE `amenity_types` DISABLE KEYS */;
INSERT INTO `amenity_types` VALUES (1,'Facilities',NULL,NULL,NULL,1),(2,'Sport and Recreation',NULL,NULL,NULL,1),(3,'Internet',NULL,NULL,NULL,1),(4,'Parking',NULL,NULL,NULL,1),(5,'Language Spoken',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `amenity_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_types`
--

DROP TABLE IF EXISTS `contact_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_types`
--

LOCK TABLES `contact_types` WRITE;
/*!40000 ALTER TABLE `contact_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_type_id` int(11) DEFAULT NULL,
  `phone` varchar(120) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `fax` varchar(120) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `other` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_types`
--

DROP TABLE IF EXISTS `location_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_types`
--

LOCK TABLES `location_types` WRITE;
/*!40000 ALTER TABLE `location_types` DISABLE KEYS */;
INSERT INTO `location_types` VALUES (1,'Country','COUNTRY',NULL,NULL),(2,'Province','PROVINCE',NULL,NULL),(3,'District','DISTRICT',NULL,NULL),(4,'Commune','COMMUNE',NULL,NULL);
/*!40000 ALTER TABLE `location_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `commune` varchar(45) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Cambodia',1,1,0,0,'0','0000-00-00 00:00:00','\n'),(2,'Banteay Meanchey',2,1,1,0,'0','0000-00-00 00:00:00','\n'),(3,'Battambang',2,1,2,0,'0','0000-00-00 00:00:00','\n'),(4,'Kampong Cham',2,1,3,0,'0','0000-00-00 00:00:00','\n'),(5,'Kampong Chhnang',2,1,4,0,'0','0000-00-00 00:00:00','\n'),(6,'Kampong Speu',2,1,5,0,'0','0000-00-00 00:00:00','\n'),(7,'Kampong Thom',2,1,6,0,'0','0000-00-00 00:00:00','\n'),(8,'Kampot',2,1,7,0,'0','0000-00-00 00:00:00','\n'),(9,'Kandal',2,1,8,0,'0','0000-00-00 00:00:00','\n'),(10,'Koh Kong',2,1,9,0,'0','0000-00-00 00:00:00','\n'),(11,'Kratie',2,1,10,0,'0','0000-00-00 00:00:00','\n'),(12,'Mondol Kiri',2,1,11,0,'0','0000-00-00 00:00:00','\n'),(13,'Phnom Penh',2,1,12,0,'0','0000-00-00 00:00:00','\n'),(14,'Preah Vihear',2,1,13,0,'0','0000-00-00 00:00:00','\n'),(15,'Prey Veng',2,1,14,0,'0','0000-00-00 00:00:00','\n'),(16,'Pursat',2,1,15,0,'0','0000-00-00 00:00:00','\n'),(17,'Rattanak Kiri',2,1,16,0,'0','0000-00-00 00:00:00','\n'),(18,'Siem Reap',2,1,17,0,'0','0000-00-00 00:00:00','\n'),(19,'Sihanouk Province',2,1,18,0,'0','0000-00-00 00:00:00','\n'),(20,'Stung Treng',2,1,19,0,'0','0000-00-00 00:00:00','\n'),(21,'Svay Rieng',2,1,20,0,'0','0000-00-00 00:00:00','\n'),(22,'Takeo',2,1,21,0,'0','0000-00-00 00:00:00','\n'),(23,'Otdar Mean Chey',2,1,22,0,'0','0000-00-00 00:00:00','\n'),(24,'Krong Keab',2,1,23,0,'0','0000-00-00 00:00:00','\n'),(25,'Krong Pailin',2,1,24,0,'0','0000-00-00 00:00:00','\n'),(26,'Mongkol Borei',3,1,1,1,'0','0000-00-00 00:00:00','\n'),(27,'Phnum Srok',3,1,1,2,'0','0000-00-00 00:00:00','\n'),(28,'Preah Netr Preah',3,1,1,3,'0','0000-00-00 00:00:00','\n'),(29,'Ou Chrov',3,1,1,4,'0','0000-00-00 00:00:00','\n'),(30,'Serei Saophoan',3,1,1,5,'0','0000-00-00 00:00:00','\n'),(31,'Thma Puok',3,1,1,6,'0','0000-00-00 00:00:00','\n'),(32,'Svay Chek',3,1,1,7,'0','0000-00-00 00:00:00','\n'),(33,'Malai',3,1,1,8,'0','0000-00-00 00:00:00','\n'),(34,'Banan',3,1,2,1,'0','0000-00-00 00:00:00','\n'),(35,'Bat Dambang',3,1,2,2,'0','0000-00-00 00:00:00','\n'),(36,'Svay Pao',3,1,2,3,'0','0000-00-00 00:00:00','\n'),(37,'Bavel',3,1,2,4,'0','0000-00-00 00:00:00','\n'),(38,'Aek Phnum',3,1,2,5,'0','0000-00-00 00:00:00','\n'),(39,'Moung Ruessei',3,1,2,6,'0','0000-00-00 00:00:00','\n'),(40,'Ratanak Mondol',3,1,2,7,'0','0000-00-00 00:00:00','\n'),(41,'Sangkae',3,1,2,8,'0','0000-00-00 00:00:00','\n'),(42,'Samlout',3,1,2,9,'0','0000-00-00 00:00:00','\n'),(43,'Sampov Lun',3,1,2,10,'0','0000-00-00 00:00:00','\n'),(44,'Phnum Proek',3,1,2,11,'0','0000-00-00 00:00:00','\n'),(45,'Kamrieng',3,1,2,12,'0','0000-00-00 00:00:00','\n'),(46,'Keas Kralo',3,1,2,13,'0','0000-00-00 00:00:00','\n'),(47,'Thma Koul',3,1,2,14,'0','0000-00-00 00:00:00','\n'),(48,'Batheay',3,1,3,1,'0','0000-00-00 00:00:00','\n'),(49,'Chamkar Leu',3,1,3,2,'0','0000-00-00 00:00:00','\n'),(50,'Cheung Prey',3,1,3,3,'0','0000-00-00 00:00:00','\n'),(51,'Dambae',3,1,3,4,'0','0000-00-00 00:00:00','\n'),(52,'Kampong Cham',3,1,3,5,'0','0000-00-00 00:00:00','\n'),(53,'Kampong Siem',3,1,3,6,'0','0000-00-00 00:00:00','\n'),(54,'Kang Meas',3,1,3,7,'0','0000-00-00 00:00:00','\n'),(55,'Kaoh Soutin',3,1,3,8,'0','0000-00-00 00:00:00','\n'),(56,'Krouch Chhmar',3,1,3,9,'0','0000-00-00 00:00:00','\n'),(57,'Memot',3,1,3,10,'0','0000-00-00 00:00:00','\n'),(58,'Ou Reang Ov',3,1,3,11,'0','0000-00-00 00:00:00','\n'),(59,'Ponhea Kraek',3,1,3,12,'0','0000-00-00 00:00:00','\n'),(60,'Prey Chhor',3,1,3,13,'0','0000-00-00 00:00:00','\n'),(61,'Srei Santhor',3,1,3,14,'0','0000-00-00 00:00:00','\n'),(62,'Stueng Trang',3,1,3,15,'0','0000-00-00 00:00:00','\n'),(63,'Tboung Khmum',3,1,3,16,'0','0000-00-00 00:00:00','\n'),(64,'Baribour',3,1,4,1,'0','0000-00-00 00:00:00','\n'),(65,'Chol Kiri',3,1,4,2,'0','0000-00-00 00:00:00','\n'),(66,'Kampong Chhnang',3,1,4,3,'0','0000-00-00 00:00:00','\n'),(67,'Kampong Leaeng',3,1,4,4,'0','0000-00-00 00:00:00','\n'),(68,'Kampong Tralach',3,1,4,5,'0','0000-00-00 00:00:00','\n'),(69,'Rolea Bier',3,1,4,6,'0','0000-00-00 00:00:00','\n'),(70,'Sameakki Mean Chey',3,1,4,7,'0','0000-00-00 00:00:00','\n'),(71,'Tuek Phos',3,1,4,8,'0','0000-00-00 00:00:00','\n'),(72,'Basedth',3,1,5,1,'0','0000-00-00 00:00:00','\n'),(73,'Chbar Mon',3,1,5,2,'0','0000-00-00 00:00:00','\n'),(74,'Kong Pisei',3,1,5,3,'0','0000-00-00 00:00:00','\n'),(75,'Aoral',3,1,5,4,'0','0000-00-00 00:00:00','\n'),(76,'Odongk',3,1,5,5,'0','0000-00-00 00:00:00','\n'),(77,'Phnum Sruoch',3,1,5,6,'0','0000-00-00 00:00:00','\n'),(78,'Samraong Tong',3,1,5,7,'0','0000-00-00 00:00:00','\n'),(79,'Thpong',3,1,5,8,'0','0000-00-00 00:00:00','\n'),(80,'Baray',3,1,6,1,'0','0000-00-00 00:00:00','\n'),(81,'Kampong Svay',3,1,6,2,'0','0000-00-00 00:00:00','\n'),(82,'Stueng Saen',3,1,6,3,'0','0000-00-00 00:00:00','\n'),(83,'Prasat Balangk',3,1,6,4,'0','0000-00-00 00:00:00','\n'),(84,'Prasat Sambour',3,1,6,5,'0','0000-00-00 00:00:00','\n'),(85,'Sandan',3,1,6,6,'0','0000-00-00 00:00:00','\n'),(86,'Santuk',3,1,6,7,'0','0000-00-00 00:00:00','\n'),(87,'Stoung',3,1,6,8,'0','0000-00-00 00:00:00','\n'),(88,'Angkor Chey',3,1,7,1,'0','0000-00-00 00:00:00','\n'),(89,'Banteay Meas',3,1,7,2,'0','0000-00-00 00:00:00','\n'),(90,'Chhuk',3,1,7,3,'0','0000-00-00 00:00:00','\n'),(91,'Chum Kiri',3,1,7,4,'0','0000-00-00 00:00:00','\n'),(92,'Dang Tong',3,1,7,5,'0','0000-00-00 00:00:00','\n'),(93,'Kampong Trach',3,1,7,6,'0','0000-00-00 00:00:00','\n'),(94,'Kampot',3,1,7,7,'0','0000-00-00 00:00:00','\n'),(95,'Kampong Bay',3,1,7,8,'0','0000-00-00 00:00:00','\n'),(96,'Kandal Stung',3,1,8,1,'0','0000-00-00 00:00:00','\n'),(97,'Kien Svay',3,1,8,2,'0','0000-00-00 00:00:00','\n'),(98,'Khsach Kandal',3,1,8,3,'0','0000-00-00 00:00:00','\n'),(99,'Koh Thom',3,1,8,4,'0','0000-00-00 00:00:00','\n'),(100,'Leuk Dek',3,1,8,5,'0','0000-00-00 00:00:00','\n'),(101,'Lvea Em',3,1,8,6,'0','0000-00-00 00:00:00','\n'),(102,'Muk Kampul',3,1,8,7,'0','0000-00-00 00:00:00','\n'),(103,'Ang Snuol',3,1,8,8,'0','0000-00-00 00:00:00','\n'),(104,'PorngearLeur',3,1,8,9,'0','0000-00-00 00:00:00','\n'),(105,'Saang',3,1,8,10,'0','0000-00-00 00:00:00','\n'),(106,'Takhmao',3,1,8,11,'0','0000-00-00 00:00:00','\n'),(107,'Botum Sakor',3,1,9,1,'0','0000-00-00 00:00:00','\n'),(108,'Kiri Sakor',3,1,9,2,'0','0000-00-00 00:00:00','\n'),(109,'Kaoh Kong',3,1,9,3,'0','0000-00-00 00:00:00','\n'),(110,'Smach Mean Chey',3,1,9,4,'0','0000-00-00 00:00:00','\n'),(111,'Mondol Seima',3,1,9,5,'0','0000-00-00 00:00:00','\n'),(112,'Srae Ambel',3,1,9,6,'0','0000-00-00 00:00:00','\n'),(113,'Thma Bang',3,1,9,7,'0','0000-00-00 00:00:00','\n'),(114,'Kampong Seila',3,1,9,8,'0','0000-00-00 00:00:00','\n'),(115,'Chhloung',3,1,10,1,'0','0000-00-00 00:00:00','\n'),(116,'Kracheh',3,1,10,2,'0','0000-00-00 00:00:00','\n'),(117,'Preaek Prasab',3,1,10,3,'0','0000-00-00 00:00:00','\n'),(118,'Sambour',3,1,10,4,'0','0000-00-00 00:00:00','\n'),(119,'Snuol',3,1,10,5,'0','0000-00-00 00:00:00','\n'),(120,'Kaev Seima',3,1,11,1,'0','0000-00-00 00:00:00','\n'),(121,'Kaoh Nheaek',3,1,11,2,'0','0000-00-00 00:00:00','\n'),(122,'Ou Reang',3,1,11,3,'0','0000-00-00 00:00:00','\n'),(123,'Pechr Chenda',3,1,11,4,'0','0000-00-00 00:00:00','\n'),(124,'Saen Monourom',3,1,11,5,'0','0000-00-00 00:00:00','\n'),(125,'Chamkarmorn',3,1,12,1,'0','0000-00-00 00:00:00','\n'),(126,'Daun Penh',3,1,12,2,'0','0000-00-00 00:00:00','\n'),(127,'7 Makara',3,1,12,3,'0','0000-00-00 00:00:00','\n'),(128,'Tuol Kork',3,1,12,4,'0','0000-00-00 00:00:00','\n'),(129,'Dangkor',3,1,12,5,'0','0000-00-00 00:00:00','\n'),(130,'Mean Chey',3,1,12,6,'0','0000-00-00 00:00:00','\n'),(131,'Reusseykeo',3,1,12,7,'0','0000-00-00 00:00:00','\n'),(132,'Chet Saen',3,1,13,1,'0','0000-00-00 00:00:00','\n'),(133,'Chhaeb',3,1,13,2,'0','0000-00-00 00:00:00','\n'),(134,'Choam Ksant',3,1,13,3,'0','0000-00-00 00:00:00','\n'),(135,'Kuleaen',3,1,13,4,'0','0000-00-00 00:00:00','\n'),(136,'Rovieng',3,1,13,5,'0','0000-00-00 00:00:00','\n'),(137,'Sangkom Thmei',3,1,13,6,'0','0000-00-00 00:00:00','\n'),(138,'Tbaeng Mean Chey',3,1,13,7,'0','0000-00-00 00:00:00','\n'),(139,'Ba Phnum',3,1,14,1,'0','0000-00-00 00:00:00','\n'),(140,'Kamchay Mear',3,1,14,2,'0','0000-00-00 00:00:00','\n'),(141,'Kampong Trabaek',3,1,14,3,'0','0000-00-00 00:00:00','\n'),(142,'Kanhchriech',3,1,14,4,'0','0000-00-00 00:00:00','\n'),(143,'Me Sang',3,1,14,5,'0','0000-00-00 00:00:00','\n'),(144,'Peam Chor',3,1,14,6,'0','0000-00-00 00:00:00','\n'),(145,'Peam Ro',3,1,14,7,'0','0000-00-00 00:00:00','\n'),(146,'Pea Reang',3,1,14,8,'0','0000-00-00 00:00:00','\n'),(147,'Preah Sdach',3,1,14,9,'0','0000-00-00 00:00:00','\n'),(148,'Prey Veaeng',3,1,14,10,'0','0000-00-00 00:00:00','\n'),(149,'Kampong Leav',3,1,14,11,'0','0000-00-00 00:00:00','\n'),(150,'Sithor Kandal',3,1,14,12,'0','0000-00-00 00:00:00','\n'),(151,'Bakan',3,1,15,1,'0','0000-00-00 00:00:00','\n'),(152,'Kandieng',3,1,15,2,'0','0000-00-00 00:00:00','\n'),(153,'Krakor',3,1,15,3,'0','0000-00-00 00:00:00','\n'),(154,'Phnum Kravanh',3,1,15,4,'0','0000-00-00 00:00:00','\n'),(155,'Sampov Meas',3,1,15,5,'0','0000-00-00 00:00:00','\n'),(156,'Veal Veng',3,1,15,6,'0','0000-00-00 00:00:00','\n'),(157,'Andoung Meas',3,1,16,1,'0','0000-00-00 00:00:00','\n'),(158,'Ban Lung',3,1,16,2,'0','0000-00-00 00:00:00','\n'),(159,'Bar Kaev',3,1,16,3,'0','0000-00-00 00:00:00','\n'),(160,'Koun Mom',3,1,16,4,'0','0000-00-00 00:00:00','\n'),(161,'Lumphat',3,1,16,5,'0','0000-00-00 00:00:00','\n'),(162,'Ou Chum',3,1,16,6,'0','0000-00-00 00:00:00','\n'),(163,'Ou Ya Dav',3,1,16,7,'0','0000-00-00 00:00:00','\n'),(164,'Ta Veaeng',3,1,16,8,'0','0000-00-00 00:00:00','\n'),(165,'Veun Sai',3,1,16,9,'0','0000-00-00 00:00:00','\n'),(166,'Angkor Chum',3,1,17,1,'0','0000-00-00 00:00:00','\n'),(167,'Angkor Thum',3,1,17,2,'0','0000-00-00 00:00:00','\n'),(168,'Banteay Srei',3,1,17,3,'0','0000-00-00 00:00:00','\n'),(169,'Chi Kraeng',3,1,17,4,'0','0000-00-00 00:00:00','\n'),(170,'Kralanh',3,1,17,5,'0','0000-00-00 00:00:00','\n'),(171,'Puok',3,1,17,6,'0','0000-00-00 00:00:00','\n'),(172,'Prasat Bakong',3,1,17,7,'0','0000-00-00 00:00:00','\n'),(173,'Siem Reap',3,1,17,8,'0','0000-00-00 00:00:00','\n'),(174,'Soutr Nikom',3,1,17,9,'0','0000-00-00 00:00:00','\n'),(175,'Srei Snam',3,1,17,10,'0','0000-00-00 00:00:00','\n'),(176,'Svay Leu',3,1,17,11,'0','0000-00-00 00:00:00','\n'),(177,'Varin',3,1,17,12,'0','0000-00-00 00:00:00','\n'),(178,'Sihanouk Ville',3,1,18,1,'0','0000-00-00 00:00:00','\n'),(179,'Prey Nob',3,1,18,2,'0','0000-00-00 00:00:00','\n'),(180,'Stueng Hav',3,1,18,3,'0','0000-00-00 00:00:00','\n'),(181,'Sesan',3,1,19,1,'0','0000-00-00 00:00:00','\n'),(182,'Siem Bouk',3,1,19,2,'0','0000-00-00 00:00:00','\n'),(183,'Siem Pang',3,1,19,3,'0','0000-00-00 00:00:00','\n'),(184,'Stueng Traeng',3,1,19,4,'0','0000-00-00 00:00:00','\n'),(185,'Thala Barivat',3,1,19,5,'0','0000-00-00 00:00:00','\n'),(186,'Chantrea',3,1,20,1,'0','0000-00-00 00:00:00','\n'),(187,'Kampong Rou',3,1,20,2,'0','0000-00-00 00:00:00','\n'),(188,'Rumduol',3,1,20,3,'0','0000-00-00 00:00:00','\n'),(189,'Romeas Haek',3,1,20,4,'0','0000-00-00 00:00:00','\n'),(190,'Svay Chrum',3,1,20,5,'0','0000-00-00 00:00:00','\n'),(191,'Svay Rieng',3,1,20,6,'0','0000-00-00 00:00:00','\n'),(192,'Svay Teab',3,1,20,7,'0','0000-00-00 00:00:00','\n'),(193,'Angkor Borei',3,1,21,1,'0','0000-00-00 00:00:00','\n'),(194,'Bati',3,1,21,2,'0','0000-00-00 00:00:00','\n'),(195,'Bourei Cholsar',3,1,21,3,'0','0000-00-00 00:00:00','\n'),(196,'Kiri Vong',3,1,21,4,'0','0000-00-00 00:00:00','\n'),(197,'Kaoh Andaet',3,1,21,5,'0','0000-00-00 00:00:00','\n'),(198,'Prey Kabbas',3,1,21,6,'0','0000-00-00 00:00:00','\n'),(199,'Samraong',3,1,21,7,'0','0000-00-00 00:00:00','\n'),(200,'Doun Kaev',3,1,21,8,'0','0000-00-00 00:00:00','\n'),(201,'Tram Kak',3,1,21,9,'0','0000-00-00 00:00:00','\n'),(202,'Treang',3,1,21,10,'0','0000-00-00 00:00:00','\n'),(203,'Banteay Ampil',3,1,22,1,'0','0000-00-00 00:00:00','\n'),(204,'Chong Kal',3,1,22,2,'0','0000-00-00 00:00:00','\n'),(205,'Samraong',3,1,22,3,'0','0000-00-00 00:00:00','\n'),(206,'Anlong Veang',3,1,22,4,'0','0000-00-00 00:00:00','\n'),(207,'Trapeang Prasat',3,1,22,5,'0','0000-00-00 00:00:00','\n'),(208,'Damnak Chang aeur',3,1,23,1,'0','0000-00-00 00:00:00','\n'),(209,'Keab',3,1,23,2,'0','0000-00-00 00:00:00','\n'),(210,'Pailin',3,1,24,1,'0','0000-00-00 00:00:00','\n'),(211,'Sala Krau',3,1,24,2,'0','0000-00-00 00:00:00','\n'),(212,'BanteayNeang',4,1,1,1,'1','0000-00-00 00:00:00','\n'),(213,'Bat Trang',4,1,1,1,'2','0000-00-00 00:00:00','\n'),(214,'Chamnaom',4,1,1,1,'3','0000-00-00 00:00:00','\n'),(215,'kouk Ballangk',4,1,1,1,'4','0000-00-00 00:00:00','\n'),(216,'Koy Maeng',4,1,1,1,'5','0000-00-00 00:00:00','\n'),(217,'Ou Prasat',4,1,1,1,'6','0000-00-00 00:00:00','\n'),(218,'Phnum Touch',4,1,1,1,'7','0000-00-00 00:00:00','\n'),(219,'Rohat Tuek',4,1,1,1,'8','0000-00-00 00:00:00','\n'),(220,'Ruessei Kraok',4,1,1,1,'9','0000-00-00 00:00:00','\n'),(221,'Sanbuor',4,1,1,1,'10','0000-00-00 00:00:00','\n'),(222,'Soea',4,1,1,1,'11','0000-00-00 00:00:00','\n'),(223,'Srah Reang',4,1,1,1,'12','0000-00-00 00:00:00','\n'),(224,'Ta lum',4,1,1,1,'13','0000-00-00 00:00:00','\n'),(225,'Lub',4,1,1,1,'14','0000-00-00 00:00:00','\n'),(226,'Nam Tau',4,1,1,2,'1','0000-00-00 00:00:00','\n'),(227,'Paoy Char',4,1,1,2,'2','0000-00-00 00:00:00','\n'),(228,'Ponley',4,1,1,2,'3','0000-00-00 00:00:00','\n'),(229,'Spean Sraeng',4,1,1,2,'4','0000-00-00 00:00:00','\n'),(230,'Srah Chik',4,1,1,2,'5','0000-00-00 00:00:00','\n'),(231,'Phnum Dei',4,1,1,2,'6','0000-00-00 00:00:00','\n'),(232,'Chhuor Nean Chey',4,1,1,3,'1','0000-00-00 00:00:00','\n'),(233,'Chob Veari',4,1,1,3,'2','0000-00-00 00:00:00','\n'),(234,'Phnum Leib',4,1,1,3,'3','0000-00-00 00:00:00','\n'),(235,'Prasat',4,1,1,3,'4','0000-00-00 00:00:00','\n'),(236,'Preah Netr Preah',4,1,1,3,'5','0000-00-00 00:00:00','\n'),(237,'Rohal',4,1,1,3,'6','0000-00-00 00:00:00','\n'),(238,'Tean Kam',4,1,1,3,'7','0000-00-00 00:00:00','\n'),(239,'Tuek Chour',4,1,1,3,'8','0000-00-00 00:00:00','\n'),(240,'Changha',4,1,1,4,'1','0000-00-00 00:00:00','\n'),(241,'Koub',4,1,1,4,'2','0000-00-00 00:00:00','\n'),(242,'Kuttasat',4,1,1,4,'3','0000-00-00 00:00:00','\n'),(243,'Nimitt',4,1,1,4,'4','0000-00-00 00:00:00','\n'),(244,'Samraong',4,1,1,4,'5','0000-00-00 00:00:00','\n'),(245,'Souphi',4,1,1,4,'6','0000-00-00 00:00:00','\n'),(246,'Soengh',4,1,1,4,'7','0000-00-00 00:00:00','\n'),(247,'Paoy Peat',4,1,1,4,'8','0000-00-00 00:00:00','\n'),(248,'Oh Bey Chhan',4,1,1,4,'9','0000-00-00 00:00:00','\n'),(249,'Bos Sbov',4,1,1,5,'1','0000-00-00 00:00:00','\n'),(250,'Kampong Svay',4,1,1,5,'2','0000-00-00 00:00:00','\n'),(251,'Koah Pong Satv',4,1,1,5,'3','0000-00-00 00:00:00','\n'),(252,'Mkak',4,1,1,5,'4','0000-00-00 00:00:00','\n'),(253,'Ou Ambel',4,1,1,5,'5','0000-00-00 00:00:00','\n'),(254,'Phiet',4,1,1,5,'6','0000-00-00 00:00:00','\n'),(255,'Preah Ponlea',4,1,1,5,'7','0000-00-00 00:00:00','\n'),(256,'Tuek Thla',4,1,1,5,'8','0000-00-00 00:00:00','\n'),(257,'Banteay Chhmar',4,1,1,6,'1','0000-00-00 00:00:00','\n'),(258,'Kouk Kakthen',4,1,1,6,'2','0000-00-00 00:00:00','\n'),(259,'Thma Puok',4,1,1,6,'3','0000-00-00 00:00:00','\n'),(260,'Kouk Kakthen',4,1,1,6,'4','0000-00-00 00:00:00','\n'),(261,'Kumru',4,1,1,6,'5','0000-00-00 00:00:00','\n'),(262,'Phum Thmei',4,1,1,6,'6','0000-00-00 00:00:00','\n'),(263,'Phkoam',4,1,1,7,'1','0000-00-00 00:00:00','\n'),(264,'Sarongk',4,1,1,7,'2','0000-00-00 00:00:00','\n'),(265,'Sla Kram',4,1,1,7,'3','0000-00-00 00:00:00','\n'),(266,'Svay Chek',4,1,1,7,'4','0000-00-00 00:00:00','\n'),(267,'Ta Baen',4,1,1,7,'5','0000-00-00 00:00:00','\n'),(268,'Ta Phou',4,1,1,7,'6','0000-00-00 00:00:00','\n'),(269,'Treas',4,1,1,7,'7','0000-00-00 00:00:00','\n'),(270,'Roluos',4,1,1,7,'8','0000-00-00 00:00:00','\n'),(271,'Boeng Beng',4,1,1,8,'1','0000-00-00 00:00:00','\n'),(272,'Malai',4,1,1,8,'2','0000-00-00 00:00:00','\n'),(273,'Ou Sralau',4,1,1,8,'3','0000-00-00 00:00:00','\n'),(274,'Ou Sampoar',4,1,1,8,'4','0000-00-00 00:00:00','\n'),(275,'Toul Pongro',4,1,1,8,'5','0000-00-00 00:00:00','\n'),(276,'Ta Kong',4,1,1,8,'6','0000-00-00 00:00:00','\n'),(277,'Kantueu Muoy',4,1,2,1,'1','0000-00-00 00:00:00','\n'),(278,'Kantueu Pir',4,1,2,1,'2','0000-00-00 00:00:00','\n'),(279,'Bay Domrom',4,1,2,1,'3','0000-00-00 00:00:00','\n'),(280,'Chheu Teal',4,1,2,1,'4','0000-00-00 00:00:00','\n'),(281,'Chaeng Mean Chey',4,1,2,1,'5','0000-00-00 00:00:00','\n'),(282,'Phnom Sampov',4,1,2,1,'6','0000-00-00 00:00:00','\n'),(283,'Snoeng',4,1,2,1,'7','0000-00-00 00:00:00','\n'),(284,'Ta Kream',4,1,2,1,'8','0000-00-00 00:00:00','\n'),(285,'Ta Pung',4,1,2,2,'1','0000-00-00 00:00:00','\n'),(286,'Ta Meun',4,1,2,2,'2','0000-00-00 00:00:00','\n'),(287,'Ou Ta ki',4,1,2,2,'3','0000-00-00 00:00:00','\n'),(288,'Chrey',4,1,2,2,'4','0000-00-00 00:00:00','\n'),(289,'Anlong Run',4,1,2,2,'5','0000-00-00 00:00:00','\n'),(290,'Chrouy Sdau',4,1,2,2,'6','0000-00-00 00:00:00','\n'),(291,'Boeng Pring',4,1,2,2,'7','0000-00-00 00:00:00','\n'),(292,'Kouk Khmum',4,1,2,2,'8','0000-00-00 00:00:00','\n'),(293,'Bansay Traeng',4,1,2,2,'9','0000-00-00 00:00:00','\n'),(294,'Rung Chrey',4,1,2,2,'10','0000-00-00 00:00:00','\n'),(295,'Rotanak',4,1,2,2,'11','0000-00-00 00:00:00','\n'),(296,'Toul Ta Aek',4,1,2,2,'12','0000-00-00 00:00:00','\n'),(297,'Slakaet',4,1,2,2,'13','0000-00-00 00:00:00','\n'),(298,'Watkor',4,1,2,2,'14','0000-00-00 00:00:00','\n'),(299,'Kdul Duntaov',4,1,2,2,'15','0000-00-00 00:00:00','\n'),(300,'Toul Ta Aek',4,1,2,3,'1','0000-00-00 00:00:00','\n'),(301,'Preaek Preah Sdach',4,1,2,3,'2','0000-00-00 00:00:00','\n'),(302,'Ratanak',4,1,2,3,'3','0000-00-00 00:00:00','\n'),(303,'Chamkar Samraong',4,1,2,3,'4','0000-00-00 00:00:00','\n'),(304,'Sla Kaet',4,1,2,3,'5','0000-00-00 00:00:00','\n'),(305,'Kdol Doun Teav',4,1,2,3,'6','0000-00-00 00:00:00','\n'),(306,'Ou Mal',4,1,2,3,'7','0000-00-00 00:00:00','\n'),(307,'Voat Kor',4,1,2,3,'8','0000-00-00 00:00:00','\n'),(308,'Ou Char',4,1,2,3,'9','0000-00-00 00:00:00','\n'),(309,'Svay Pao',4,1,2,3,'10','0000-00-00 00:00:00','\n'),(310,'Bavel',4,1,2,4,'1','0000-00-00 00:00:00','\n'),(311,'Khnach Romeas',4,1,2,4,'2','0000-00-00 00:00:00','\n'),(312,'Lvea',4,1,2,4,'3','0000-00-00 00:00:00','\n'),(313,'Prey Khpos',4,1,2,4,'4','0000-00-00 00:00:00','\n'),(314,'Ampil Pram Daeum',4,1,2,4,'5','0000-00-00 00:00:00','\n'),(315,'Kdol Tahaen',4,1,2,4,'6','0000-00-00 00:00:00','\n'),(316,'Preaek Norint',4,1,2,5,'1','0000-00-00 00:00:00','\n'),(317,'Samraong Knong',4,1,2,5,'2','0000-00-00 00:00:00','\n'),(318,'Preaek Khpob',4,1,2,5,'3','0000-00-00 00:00:00','\n'),(319,'Preaek Luong',4,1,2,5,'4','0000-00-00 00:00:00','\n'),(320,'Peam Aek',4,1,2,5,'5','0000-00-00 00:00:00','\n'),(321,'Prey Chas',4,1,2,5,'6','0000-00-00 00:00:00','\n'),(322,'Kaoh Chiveang',4,1,2,5,'7','0000-00-00 00:00:00','\n'),(323,'Moung',4,1,2,6,'1','0000-00-00 00:00:00','\n'),(324,'Kear',4,1,2,6,'2','0000-00-00 00:00:00','\n'),(325,'Prey Svay',4,1,2,6,'3','0000-00-00 00:00:00','\n'),(326,'Ruessei Krang',4,1,2,6,'4','0000-00-00 00:00:00','\n'),(327,'Chrey',4,1,2,6,'5','0000-00-00 00:00:00','\n'),(328,'Ta Laos',4,1,2,6,'6','0000-00-00 00:00:00','\n'),(329,'Kakaoh',4,1,2,6,'7','0000-00-00 00:00:00','\n'),(330,'Prey Touch',4,1,2,6,'8','0000-00-00 00:00:00','\n'),(331,'Robas Mongkol',4,1,2,6,'9','0000-00-00 00:00:00','\n'),(332,'Thipakdei',4,1,2,6,'10','0000-00-00 00:00:00','\n'),(333,'Preaek Chik',4,1,2,6,'11','0000-00-00 00:00:00','\n'),(334,'Prey Tralach',4,1,2,6,'12','0000-00-00 00:00:00','\n'),(335,'Sdau',4,1,2,7,'1','0000-00-00 00:00:00','\n'),(336,'Andaeuk Haeb',4,1,2,7,'2','0000-00-00 00:00:00','\n'),(337,'Phlov Meas',4,1,2,7,'3','0000-00-00 00:00:00','\n'),(338,'Traeng',4,1,2,7,'4','0000-00-00 00:00:00','\n'),(339,'Anlong Vil',4,1,2,8,'1','0000-00-00 00:00:00','\n'),(340,'Norea',4,1,2,8,'2','0000-00-00 00:00:00','\n'),(341,'Ta pon',4,1,2,8,'3','0000-00-00 00:00:00','\n'),(342,'Roka',4,1,2,8,'4','0000-00-00 00:00:00','\n'),(343,'Kampong Preah',4,1,2,8,'5','0000-00-00 00:00:00','\n'),(344,'Kampong Pring',4,1,2,8,'6','0000-00-00 00:00:00','\n'),(345,'Reang Kesei',4,1,2,8,'7','0000-00-00 00:00:00','\n'),(346,'Ou Dambang Muoy',4,1,2,8,'8','0000-00-00 00:00:00','\n'),(347,'Ou Dambang Pir',4,1,2,8,'9','0000-00-00 00:00:00','\n'),(348,'Voat Ta Muem',4,1,2,8,'10','0000-00-00 00:00:00','\n'),(349,'Samlout',4,1,2,9,'1','0000-00-00 00:00:00','\n'),(350,'Kampong Lpau',4,1,2,9,'2','0000-00-00 00:00:00','\n'),(351,'Song',4,1,2,9,'3','0000-00-00 00:00:00','\n'),(352,'Mean Chey',4,1,2,9,'4','0000-00-00 00:00:00','\n'),(353,'Ta Taok',4,1,2,9,'5','0000-00-00 00:00:00','\n'),(354,'Ou Samrel',4,1,2,9,'6','0000-00-00 00:00:00','\n'),(355,'Ta Sah',4,1,2,9,'7','0000-00-00 00:00:00','\n'),(356,'Angkor Ban',4,1,2,10,'1','0000-00-00 00:00:00','\n'),(357,'Serei Mean Chey',4,1,2,10,'2','0000-00-00 00:00:00','\n'),(358,'Santepheap',4,1,2,10,'3','0000-00-00 00:00:00','\n'),(359,'Ta Sda',4,1,2,10,'4','0000-00-00 00:00:00','\n'),(360,'Sampov Lun',4,1,2,10,'5','0000-00-00 00:00:00','\n'),(361,'Chrey Sema',4,1,2,10,'6','0000-00-00 00:00:00','\n'),(362,'Phnum Proek',4,1,2,11,'1','0000-00-00 00:00:00','\n'),(363,'Barang Thleak',4,1,2,11,'2','0000-00-00 00:00:00','\n'),(364,'Ou Rumdoul',4,1,2,11,'3','0000-00-00 00:00:00','\n'),(365,'Pech Chenda',4,1,2,11,'4','0000-00-00 00:00:00','\n'),(366,'Chak Krey',4,1,2,11,'5','0000-00-00 00:00:00','\n'),(367,'Kamrieng',4,1,2,12,'1','0000-00-00 00:00:00','\n'),(368,'Ou Da',4,1,2,12,'2','0000-00-00 00:00:00','\n'),(369,'Beung Reang',4,1,2,12,'3','0000-00-00 00:00:00','\n'),(370,'Trang',4,1,2,12,'4','0000-00-00 00:00:00','\n'),(371,'Ta Saen',4,1,2,12,'5','0000-00-00 00:00:00','\n'),(372,'Ta Kry',4,1,2,12,'6','0000-00-00 00:00:00','\n'),(373,'Theb Dei',4,1,2,13,'1','0000-00-00 00:00:00','\n'),(374,'Keas Kralo',4,1,2,13,'2','0000-00-00 00:00:00','\n'),(375,'Hob',4,1,2,13,'3','0000-00-00 00:00:00','\n'),(376,'Preah Phos',4,1,2,13,'4','0000-00-00 00:00:00','\n'),(377,'Doun Bar',4,1,2,13,'5','0000-00-00 00:00:00','\n'),(378,'Chnol Mean',4,1,2,13,'6','0000-00-00 00:00:00','\n'),(379,'Chey',4,1,2,14,'2','0000-00-00 00:00:00','\n'),(380,'Ou Taki',4,1,2,14,'3','0000-00-00 00:00:00','\n'),(381,'Anlong Run',4,1,2,14,'4','0000-00-00 00:00:00','\n'),(382,'Ta Poun',4,1,2,14,'5','0000-00-00 00:00:00','\n'),(383,'Ta Muen',4,1,2,14,'6','0000-00-00 00:00:00','\n'),(384,'Chroy Sdau',4,1,2,14,'7','0000-00-00 00:00:00','\n'),(385,'Boeng Pring',4,1,2,14,'8','0000-00-00 00:00:00','\n'),(386,'Kouk Khmom',4,1,2,14,'9','0000-00-00 00:00:00','\n'),(387,'Bansay Traeng',4,1,2,14,'10','0000-00-00 00:00:00','\n'),(388,'Ruong Chrey',4,1,2,14,'11','0000-00-00 00:00:00','\n'),(389,'Batheay',4,1,3,1,'1','0000-00-00 00:00:00','\n'),(390,'Chbar Ampov',4,1,3,1,'2','0000-00-00 00:00:00','\n'),(391,'Chealea',4,1,3,1,'3','0000-00-00 00:00:00','\n'),(392,'Cheung Prey',4,1,3,1,'4','0000-00-00 00:00:00','\n'),(393,'Me Pring',4,1,3,1,'5','0000-00-00 00:00:00','\n'),(394,'Phav',4,1,3,1,'6','0000-00-00 00:00:00','\n'),(395,'Sambour',4,1,3,1,'7','0000-00-00 00:00:00','\n'),(396,'Sandaek',4,1,3,1,'8','0000-00-00 00:00:00','\n'),(397,'Tang Krang',4,1,3,1,'9','0000-00-00 00:00:00','\n'),(398,'Tang Krasang',4,1,3,1,'10','0000-00-00 00:00:00','\n'),(399,'Trab',4,1,3,1,'11','0000-00-00 00:00:00','\n'),(400,'Tomnob',4,1,3,1,'12','0000-00-00 00:00:00','\n'),(401,'Bos Khnaor',4,1,3,2,'1','0000-00-00 00:00:00','\n'),(402,'Chamkar Andoung',4,1,3,2,'2','0000-00-00 00:00:00','\n'),(403,'Cheyyou',4,1,3,2,'3','0000-00-00 00:00:00','\n'),(404,'Lvea Leu',4,1,3,2,'4','0000-00-00 00:00:00','\n'),(405,'Speu',4,1,3,2,'5','0000-00-00 00:00:00','\n'),(406,'Svay Teab',4,1,3,2,'6','0000-00-00 00:00:00','\n'),(407,'Ta Ong',4,1,3,2,'7','0000-00-00 00:00:00','\n'),(408,'Ta Prok',4,1,3,2,'8','0000-00-00 00:00:00','\n'),(409,'Khnor Dambang',4,1,3,3,'1','0000-00-00 00:00:00','\n'),(410,'Kouk Rovieng',4,1,3,3,'2','0000-00-00 00:00:00','\n'),(411,'Phdau Chum',4,1,3,3,'3','0000-00-00 00:00:00','\n'),(412,'Prey Char',4,1,3,3,'4','0000-00-00 00:00:00','\n'),(413,'Pring Chrum',4,1,3,3,'5','0000-00-00 00:00:00','\n'),(414,'Sampong Chey',4,1,3,3,'6','0000-00-00 00:00:00','\n'),(415,'Sdaeung Chey',4,1,3,3,'7','0000-00-00 00:00:00','\n'),(416,'Soutip',4,1,3,3,'8','0000-00-00 00:00:00','\n'),(417,'Srama',4,1,3,3,'9','0000-00-00 00:00:00','\n'),(418,'Trapeang Kor',4,1,3,3,'10','0000-00-00 00:00:00','\n'),(419,'Chong Cheach',4,1,3,4,'1','0000-00-00 00:00:00','\n'),(420,'Dambae',4,1,3,4,'2','0000-00-00 00:00:00','\n'),(421,'Kouk Srok',4,1,3,4,'3','0000-00-00 00:00:00','\n'),(422,'Neang Teut',4,1,3,4,'4','0000-00-00 00:00:00','\n'),(423,'Seda',4,1,3,4,'5','0000-00-00 00:00:00','\n'),(424,'Tuek Chrov',4,1,3,4,'6','0000-00-00 00:00:00','\n'),(425,'Trapeang Pring',4,1,3,4,'7','0000-00-00 00:00:00','\n'),(426,'Boeng Kok',4,1,3,5,'1','0000-00-00 00:00:00','\n'),(427,'Kampong Cham',4,1,3,5,'2','0000-00-00 00:00:00','\n'),(428,'Sambuor Meas',4,1,3,5,'3','0000-00-00 00:00:00','\n'),(429,'Veal Vong',4,1,3,5,'4','0000-00-00 00:00:00','\n'),(430,'Ampil',4,1,3,6,'1','0000-00-00 00:00:00','\n'),(431,'Han Cheay',4,1,3,6,'2','0000-00-00 00:00:00','\n'),(432,'Kien Chrey',4,1,3,6,'3','0000-00-00 00:00:00','\n'),(433,'Kokor',4,1,3,6,'4','0000-00-00 00:00:00','\n'),(434,'Kaoh Mitt',4,1,3,6,'5','0000-00-00 00:00:00','\n'),(435,'Kaoh Roka',4,1,3,6,'6','0000-00-00 00:00:00','\n'),(436,'Kaoh Samraong',4,1,3,6,'7','0000-00-00 00:00:00','\n'),(437,'Kaoh Tontuem',4,1,3,6,'8','0000-00-00 00:00:00','\n'),(438,'Krala',4,1,3,6,'9','0000-00-00 00:00:00','\n'),(439,'Ou Svay',4,1,3,6,'10','0000-00-00 00:00:00','\n'),(440,'Roang ( Field )',4,1,3,6,'11','0000-00-00 00:00:00','\n'),(441,'Rumchek',4,1,3,6,'12','0000-00-00 00:00:00','\n'),(442,'Srak',4,1,3,6,'13','0000-00-00 00:00:00','\n'),(443,'Trean',4,1,3,6,'14','0000-00-00 00:00:00','\n'),(444,'Vihear Thum',4,1,3,6,'15','0000-00-00 00:00:00','\n'),(445,'Angkor Ban',4,1,3,7,'1','0000-00-00 00:00:00','\n'),(446,'Kang Ta Noeng',4,1,3,7,'2','0000-00-00 00:00:00','\n'),(447,'Khchau',4,1,3,7,'3','0000-00-00 00:00:00','\n'),(448,'Peam Chi Kang',4,1,3,7,'4','0000-00-00 00:00:00','\n'),(449,'Preaek Koy',4,1,3,7,'5','0000-00-00 00:00:00','\n'),(450,'Preaek Krabau',4,1,3,7,'6','0000-00-00 00:00:00','\n'),(451,'Reay Pay',4,1,3,7,'7','0000-00-00 00:00:00','\n'),(452,'Rokar Ar',4,1,3,7,'8','0000-00-00 00:00:00','\n'),(453,'Rokar Koy',4,1,3,7,'9','0000-00-00 00:00:00','\n'),(454,'Sdau',4,1,3,7,'10','0000-00-00 00:00:00','\n'),(455,'Sour Kong',4,1,3,7,'11','0000-00-00 00:00:00','\n'),(456,'Kampong Reab',4,1,3,8,'1','0000-00-00 00:00:00','\n'),(457,'Kaoh Soutin',4,1,3,8,'2','0000-00-00 00:00:00','\n'),(458,'Lve',4,1,3,8,'3','0000-00-00 00:00:00','\n'),(459,'Moha Leaph',4,1,3,8,'4','0000-00-00 00:00:00','\n'),(460,'Moha Khnhoung',4,1,3,8,'5','0000-00-00 00:00:00','\n'),(461,'Peam Prathnuoh',4,1,3,8,'6','0000-00-00 00:00:00','\n'),(462,'Pongro',4,1,3,8,'7','0000-00-00 00:00:00','\n'),(463,'Preaek Ta Nong',4,1,3,8,'8','0000-00-00 00:00:00','\n'),(464,'Chhuk',4,1,3,9,'1','0000-00-00 00:00:00','\n'),(465,'Chumnik',4,1,3,9,'2','0000-00-00 00:00:00','\n'),(466,'Kampong Treas',4,1,3,9,'3','0000-00-00 00:00:00','\n'),(467,'Kaoh Pir',4,1,3,9,'4','0000-00-00 00:00:00','\n'),(468,'Krouch Chhmar',4,1,3,9,'5','0000-00-00 00:00:00','\n'),(469,'Peus Muoy',4,1,3,9,'6','0000-00-00 00:00:00','\n'),(470,'Peus Pir',4,1,3,9,'7','0000-00-00 00:00:00','\n'),(471,'Preaek A Chi',4,1,3,9,'8','0000-00-00 00:00:00','\n'),(472,'Roka Khnaor',4,1,3,9,'9','0000-00-00 00:00:00','\n'),(473,'Trea',4,1,3,9,'11','0000-00-00 00:00:00','\n'),(474,'Tuol Snuol',4,1,3,9,'12','0000-00-00 00:00:00','\n'),(475,'Chan Mul',4,1,3,10,'1','0000-00-00 00:00:00','\n'),(476,'Choam',4,1,3,10,'2','0000-00-00 00:00:00','\n'),(477,'Choam Kravien',4,1,3,10,'3','0000-00-00 00:00:00','\n'),(478,'Choam Ta Mau',4,1,3,10,'4','0000-00-00 00:00:00','\n'),(479,'Dar',4,1,3,10,'5','0000-00-00 00:00:00','\n'),(480,'Kampoan',4,1,3,10,'6','0000-00-00 00:00:00','\n'),(481,'Memang',4,1,3,10,'7','0000-00-00 00:00:00','\n'),(482,'Memot',4,1,3,10,'8','0000-00-00 00:00:00','\n'),(483,'Rung',4,1,3,10,'9','0000-00-00 00:00:00','\n'),(484,'Romchek',4,1,3,10,'10','0000-00-00 00:00:00','\n'),(485,'Tromoung',4,1,3,10,'11','0000-00-00 00:00:00','\n'),(486,'Tonlung',4,1,3,10,'12','0000-00-00 00:00:00','\n'),(487,'Treak',4,1,3,10,'13','0000-00-00 00:00:00','\n'),(488,'Kokir',4,1,3,10,'14','0000-00-00 00:00:00','\n'),(489,'Ampil Ta Pok',4,1,3,11,'1','0000-00-00 00:00:00','\n'),(490,'Chak',4,1,3,11,'2','0000-00-00 00:00:00','\n'),(491,'Damrel',4,1,3,11,'3','0000-00-00 00:00:00','\n'),(492,'Kong Chey',4,1,3,11,'4','0000-00-00 00:00:00','\n'),(493,'Mean',4,1,3,11,'5','0000-00-00 00:00:00','\n'),(494,'Preah Theat',4,1,3,11,'6','0000-00-00 00:00:00','\n'),(495,'Tuol Sophi',4,1,3,11,'7','0000-00-00 00:00:00','\n'),(496,'Doun Tei',4,1,3,12,'1','0000-00-00 00:00:00','\n'),(497,'Kak',4,1,3,12,'2','0000-00-00 00:00:00','\n'),(498,'Kandaol Chrum',4,1,3,12,'3','0000-00-00 00:00:00','\n'),(499,'Kaong Kang',4,1,3,12,'4','0000-00-00 00:00:00','\n'),(500,'Kraek',4,1,3,12,'5','0000-00-00 00:00:00','\n'),(501,'Popel',4,1,3,12,'6','0000-00-00 00:00:00','\n'),(502,'Trapeang Phlong',4,1,3,12,'7','0000-00-00 00:00:00','\n'),(503,'Veal Mlu',4,1,3,12,'8','0000-00-00 00:00:00','\n'),(504,'Baray',4,1,3,13,'1','0000-00-00 00:00:00','\n'),(505,'Boeng Nay',4,1,3,13,'2','0000-00-00 00:00:00','\n'),(506,'Chrey Vien',4,1,3,13,'3','0000-00-00 00:00:00','\n'),(507,'Khvet Thum',4,1,3,13,'4','0000-00-00 00:00:00','\n'),(508,'Kor',4,1,3,13,'5','0000-00-00 00:00:00','\n'),(509,'Krouch',4,1,3,13,'6','0000-00-00 00:00:00','\n'),(510,'Lvea',4,1,3,13,'7','0000-00-00 00:00:00','\n'),(511,'Mien',4,1,3,13,'8','0000-00-00 00:00:00','\n'),(512,'Prey Chhor',4,1,3,13,'9','0000-00-00 00:00:00','\n'),(513,'Sour Saen',4,1,3,13,'10','0000-00-00 00:00:00','\n'),(514,'Srange',4,1,3,13,'11','0000-00-00 00:00:00','\n'),(515,'Samraong',4,1,3,13,'12','0000-00-00 00:00:00','\n'),(516,'Thma Pun',4,1,3,13,'13','0000-00-00 00:00:00','\n'),(517,'Tong Rong',4,1,3,13,'14','0000-00-00 00:00:00','\n'),(518,'Trapeang Preah',4,1,3,13,'15','0000-00-00 00:00:00','\n'),(519,'Baray',4,1,3,14,'1','0000-00-00 00:00:00','\n'),(520,'Chi Bal',4,1,3,14,'2','0000-00-00 00:00:00','\n'),(521,'Khnar Sa',4,1,3,14,'3','0000-00-00 00:00:00','\n'),(522,'Kaoh Andaet',4,1,3,14,'4','0000-00-00 00:00:00','\n'),(523,'Mean Chey',4,1,3,14,'5','0000-00-00 00:00:00','\n'),(524,'Pteah Kandal',4,1,3,14,'6','0000-00-00 00:00:00','\n'),(525,'Pram Yam',4,1,3,14,'7','0000-00-00 00:00:00','\n'),(526,'Preaek Dambouk',4,1,3,14,'8','0000-00-00 00:00:00','\n'),(527,'Preaek Pou',4,1,3,14,'9','0000-00-00 00:00:00','\n'),(528,'Preaek Rumdeng',4,1,3,14,'10','0000-00-00 00:00:00','\n'),(529,'Russei Srok',4,1,3,14,'11','0000-00-00 00:00:00','\n'),(530,'Svay Pou',4,1,3,14,'12','0000-00-00 00:00:00','\n'),(531,'Svay Sach Phnum',4,1,3,14,'13','0000-00-00 00:00:00','\n'),(532,'Tong Tralach',4,1,3,14,'14','0000-00-00 00:00:00','\n'),(533,'Areaks Tnaot',4,1,3,15,'1','0000-00-00 00:00:00','\n'),(534,'Dang Kdar',4,1,3,15,'2','0000-00-00 00:00:00','\n'),(535,'Khpob Ta Nguon',4,1,3,15,'3','0000-00-00 00:00:00','\n'),(536,'Me Sa Chrey',4,1,3,15,'4','0000-00-00 00:00:00','\n'),(537,'Ou Mlu',4,1,3,15,'5','0000-00-00 00:00:00','\n'),(538,'Peam Kaoh Sna',4,1,3,15,'6','0000-00-00 00:00:00','\n'),(539,'Preah Andoung',4,1,3,15,'7','0000-00-00 00:00:00','\n'),(540,'Preaek Bak',4,1,3,15,'8','0000-00-00 00:00:00','\n'),(541,'Preaek Kak',4,1,3,15,'9','0000-00-00 00:00:00','\n'),(542,'Soupheas',4,1,3,15,'10','0000-00-00 00:00:00','\n'),(543,'Toul Preah Khleang',4,1,3,15,'11','0000-00-00 00:00:00','\n'),(544,'Tuol Sambuor',4,1,3,15,'12','0000-00-00 00:00:00','\n'),(545,'Anhchaeum',4,1,3,16,'1','0000-00-00 00:00:00','\n'),(546,'Boeng Pruol',4,1,3,16,'2','0000-00-00 00:00:00','\n'),(547,'Chikor',4,1,3,16,'3','0000-00-00 00:00:00','\n'),(548,'Chirou Muoy',4,1,3,16,'4','0000-00-00 00:00:00','\n'),(549,'Chirou Pir',4,1,3,16,'5','0000-00-00 00:00:00','\n'),(550,'Chob',4,1,3,16,'6','0000-00-00 00:00:00','\n'),(551,'Kor',4,1,3,16,'7','0000-00-00 00:00:00','\n'),(552,'Lngieng',4,1,3,16,'8','0000-00-00 00:00:00','\n'),(553,'Moung Riev',4,1,3,16,'9','0000-00-00 00:00:00','\n'),(554,'Peam Chileang',4,1,3,16,'10','0000-00-00 00:00:00','\n'),(555,'Roka Po Pram',4,1,3,16,'11','0000-00-00 00:00:00','\n'),(556,'Sralab',4,1,3,16,'12','0000-00-00 00:00:00','\n'),(557,'Suong',4,1,3,16,'13','0000-00-00 00:00:00','\n'),(558,'Thma Pechr',4,1,3,16,'14','0000-00-00 00:00:00','\n'),(559,'Tonle Bet',4,1,3,16,'15','0000-00-00 00:00:00','\n'),(560,'Vihear Luong',4,1,3,16,'16','0000-00-00 00:00:00','\n'),(561,'Anhchanh Rung',4,1,4,1,'1','0000-00-00 00:00:00','\n'),(562,'Chhnok Tru',4,1,4,1,'2','0000-00-00 00:00:00','\n'),(563,'Chak',4,1,4,1,'3','0000-00-00 00:00:00','\n'),(564,'Khon Rang',4,1,4,1,'4','0000-00-00 00:00:00','\n'),(565,'Kampong Preah Kokir',4,1,4,1,'5','0000-00-00 00:00:00','\n'),(566,'Melum',4,1,4,1,'6','0000-00-00 00:00:00','\n'),(567,'Phsar',4,1,4,1,'7','0000-00-00 00:00:00','\n'),(568,'Pech Changvar',4,1,4,1,'8','0000-00-00 00:00:00','\n'),(569,'Popel',4,1,4,1,'9','0000-00-00 00:00:00','\n'),(570,'Ponley',4,1,4,1,'10','0000-00-00 00:00:00','\n'),(571,'Trapeang Chan',4,1,4,1,'11','0000-00-00 00:00:00','\n'),(572,'Chol Sar',4,1,4,2,'1','0000-00-00 00:00:00','\n'),(573,'Kaoh Thkov',4,1,4,2,'2','0000-00-00 00:00:00','\n'),(574,'Kampong Os',4,1,4,2,'3','0000-00-00 00:00:00','\n'),(575,'Peam Chhaok',4,1,4,2,'4','0000-00-00 00:00:00','\n'),(576,'Prey Kri',4,1,4,2,'5','0000-00-00 00:00:00','\n'),(577,'Phsar Chhnang',4,1,4,3,'1','0000-00-00 00:00:00','\n'),(578,'Kampong Chhnang',4,1,4,3,'2','0000-00-00 00:00:00','\n'),(579,'Pher',4,1,4,3,'3','0000-00-00 00:00:00','\n'),(580,'Khsam',4,1,4,3,'4','0000-00-00 00:00:00','\n'),(581,'Chranouk',4,1,4,4,'1','0000-00-00 00:00:00','\n'),(582,'Dar',4,1,4,4,'2','0000-00-00 00:00:00','\n'),(583,'Kampong Hau',4,1,4,4,'3','0000-00-00 00:00:00','\n'),(584,'Phlov Tuk',4,1,4,4,'4','0000-00-00 00:00:00','\n'),(585,'Pou',4,1,4,4,'5','0000-00-00 00:00:00','\n'),(586,'Pralay Meas',4,1,4,4,'6','0000-00-00 00:00:00','\n'),(587,'Samraong Saen',4,1,4,4,'7','0000-00-00 00:00:00','\n'),(588,'Svay Rumpear',4,1,4,4,'8','0000-00-00 00:00:00','\n'),(589,'Trangel',4,1,4,4,'9','0000-00-00 00:00:00','\n'),(590,'Ampil Tuek',4,1,4,5,'1','0000-00-00 00:00:00','\n'),(591,'Chhuk Sa',4,1,4,5,'2','0000-00-00 00:00:00','\n'),(592,'Chres',4,1,4,5,'3','0000-00-00 00:00:00','\n'),(593,'Kampong Tralach',4,1,4,5,'4','0000-00-00 00:00:00','\n'),(594,'Longveaek',4,1,4,5,'5','0000-00-00 00:00:00','\n'),(595,'Ou Russei',4,1,4,5,'6','0000-00-00 00:00:00','\n'),(596,'Peani',4,1,4,5,'7','0000-00-00 00:00:00','\n'),(597,'Saeb',4,1,4,5,'8','0000-00-00 00:00:00','\n'),(598,'Ta Ches',4,1,4,5,'9','0000-00-00 00:00:00','\n'),(599,'Thma Edth',4,1,4,5,'10','0000-00-00 00:00:00','\n'),(600,'Andoung Snay',4,1,4,6,'1','0000-00-00 00:00:00','\n'),(601,'Banteay Preal',4,1,4,6,'2','0000-00-00 00:00:00','\n'),(602,'Cheung Kreav',4,1,4,6,'3','0000-00-00 00:00:00','\n'),(603,'Chrey Bak',4,1,4,6,'4','0000-00-00 00:00:00','\n'),(604,'Kouk Banteay',4,1,4,6,'5','0000-00-00 00:00:00','\n'),(605,'Krang Leav',4,1,4,6,'6','0000-00-00 00:00:00','\n'),(606,'Pongro',4,1,4,6,'7','0000-00-00 00:00:00','\n'),(607,'Prasneb',4,1,4,6,'8','0000-00-00 00:00:00','\n'),(608,'Prey Mul',4,1,4,6,'9','0000-00-00 00:00:00','\n'),(609,'Rolea Bier',4,1,4,6,'10','0000-00-00 00:00:00','\n'),(610,'Srae Thmei',4,1,4,6,'11','0000-00-00 00:00:00','\n'),(611,'Svay Chrum',4,1,4,6,'12','0000-00-00 00:00:00','\n'),(612,'Tuek Hout',4,1,4,6,'13','0000-00-00 00:00:00','\n'),(613,'Chhean Laeung',4,1,4,7,'1','0000-00-00 00:00:00','\n'),(614,'Khnar Chhmar',4,1,4,7,'2','0000-00-00 00:00:00','\n'),(615,'Krang Lvea',4,1,4,7,'3','0000-00-00 00:00:00','\n'),(616,'Peam',4,1,4,7,'4','0000-00-00 00:00:00','\n'),(617,'Sedthei',4,1,4,7,'5','0000-00-00 00:00:00','\n'),(618,'Svay',4,1,4,7,'6','0000-00-00 00:00:00','\n'),(619,'Svay Chuk',4,1,4,7,'7','0000-00-00 00:00:00','\n'),(620,'Tbaeng Khpos',4,1,4,7,'8','0000-00-00 00:00:00','\n'),(621,'Thlok Vien',4,1,4,7,'9','0000-00-00 00:00:00','\n'),(622,'Akphivoadth',4,1,4,8,'1','0000-00-00 00:00:00','\n'),(623,'Chieb',4,1,4,8,'2','0000-00-00 00:00:00','\n'),(624,'Chaong Maong',4,1,4,8,'3','0000-00-00 00:00:00','\n'),(625,'Kbal Tuek',4,1,4,8,'4','0000-00-00 00:00:00','\n'),(626,'Khlong Popok',4,1,4,8,'5','0000-00-00 00:00:00','\n'),(627,'Krang Skear',4,1,4,8,'6','0000-00-00 00:00:00','\n'),(628,'Tang Krasang',4,1,4,8,'7','0000-00-00 00:00:00','\n'),(629,'Toul Khpos',4,1,4,8,'8','0000-00-00 00:00:00','\n'),(630,'Basedth',4,1,5,1,'1','0000-00-00 00:00:00','\n'),(631,'Kat Phluk',4,1,5,1,'2','0000-00-00 00:00:00','\n'),(632,'Nitean',4,1,5,1,'3','0000-00-00 00:00:00','\n'),(633,'Pheakdei',4,1,5,1,'4','0000-00-00 00:00:00','\n'),(634,'Pheari Mean Chey',4,1,5,1,'5','0000-00-00 00:00:00','\n'),(635,'Phong',4,1,5,1,'6','0000-00-00 00:00:00','\n'),(636,'Pou Angkrang',4,1,5,1,'7','0000-00-00 00:00:00','\n'),(637,'Pou Chamraeun',4,1,5,1,'8','0000-00-00 00:00:00','\n'),(638,'pou Mreal',4,1,5,1,'9','0000-00-00 00:00:00','\n'),(639,'Svay Chacheb',4,1,5,1,'10','0000-00-00 00:00:00','\n'),(640,'Tuol Ampil',4,1,5,1,'11','0000-00-00 00:00:00','\n'),(641,'Tuol Sala',4,1,5,1,'12','0000-00-00 00:00:00','\n'),(642,'Kak',4,1,5,1,'13','0000-00-00 00:00:00','\n'),(643,'Svay Rumpea',4,1,5,1,'14','0000-00-00 00:00:00','\n'),(644,'Preah Khae',4,1,5,1,'15','0000-00-00 00:00:00','\n'),(645,'Chbar Mon',4,1,5,2,'1','0000-00-00 00:00:00','\n'),(646,'Kandaol Dom',4,1,5,2,'2','0000-00-00 00:00:00','\n'),(647,'Roka Thum',4,1,5,2,'3','0000-00-00 00:00:00','\n'),(648,'Sopoar Tep',4,1,5,2,'4','0000-00-00 00:00:00','\n'),(649,'Svay Kravan',4,1,5,2,'5','0000-00-00 00:00:00','\n'),(650,'Angk Popel',4,1,5,3,'1','0000-00-00 00:00:00','\n'),(651,'Chongruk',4,1,5,3,'2','0000-00-00 00:00:00','\n'),(652,'Moha Russei',4,1,5,3,'3','0000-00-00 00:00:00','\n'),(653,'Pechr Muni',4,1,5,3,'4','0000-00-00 00:00:00','\n'),(654,'Preah Nipean',4,1,5,3,'5','0000-00-00 00:00:00','\n'),(655,'Prey Nheat',4,1,5,3,'6','0000-00-00 00:00:00','\n'),(656,'Prey Vihear',4,1,5,3,'7','0000-00-00 00:00:00','\n'),(657,'Roka Kaoh',4,1,5,3,'8','0000-00-00 00:00:00','\n'),(658,'Sdok',4,1,5,3,'9','0000-00-00 00:00:00','\n'),(659,'Snam Krapeu',4,1,5,3,'10','0000-00-00 00:00:00','\n'),(660,'Srang',4,1,5,3,'11','0000-00-00 00:00:00','\n'),(661,'Tuek Lak',4,1,5,3,'12','0000-00-00 00:00:00','\n'),(662,'Veal',4,1,5,3,'13','0000-00-00 00:00:00','\n'),(663,'Haong Samnam',4,1,5,4,'1','0000-00-00 00:00:00','\n'),(664,'Reaksmei Sameakki',4,1,5,4,'2','0000-00-00 00:00:00','\n'),(665,'Trapeang Chour',4,1,5,4,'3','0000-00-00 00:00:00','\n'),(666,'Sangkae Satob',4,1,5,4,'4','0000-00-00 00:00:00','\n'),(667,'Ta Sal',4,1,5,4,'5','0000-00-00 00:00:00','\n'),(668,'Chant Saen',4,1,5,5,'1','0000-00-00 00:00:00','\n'),(669,'Cheung Roas',4,1,5,5,'2','0000-00-00 00:00:00','\n'),(670,'Chumpu Proeks',4,1,5,5,'3','0000-00-00 00:00:00','\n'),(671,'Khsem Khsan',4,1,5,5,'4','0000-00-00 00:00:00','\n'),(672,'Krang Chek',4,1,5,5,'5','0000-00-00 00:00:00','\n'),(673,'Mean Chey',4,1,5,5,'6','0000-00-00 00:00:00','\n'),(674,'Preah Srae',4,1,5,5,'7','0000-00-00 00:00:00','\n'),(675,'Prey Krasang',4,1,5,5,'8','0000-00-00 00:00:00','\n'),(676,'Trach Tong',4,1,5,5,'9','0000-00-00 00:00:00','\n'),(677,'Veal Pung',4,1,5,5,'10','0000-00-00 00:00:00','\n'),(678,'Veang Chas',4,1,5,5,'11','0000-00-00 00:00:00','\n'),(679,'Yutth Sameakki',4,1,5,5,'12','0000-00-00 00:00:00','\n'),(680,'Damnak Riang',4,1,5,5,'13','0000-00-00 00:00:00','\n'),(681,'Peang Lvea',4,1,5,5,'14','0000-00-00 00:00:00','\n'),(682,'Phnum Touch',4,1,5,5,'15','0000-00-00 00:00:00','\n'),(683,'Chambak',4,1,5,6,'1','0000-00-00 00:00:00','\n'),(684,'Choam Sangkae',4,1,5,6,'2','0000-00-00 00:00:00','\n'),(685,'Dambouk Rung',4,1,5,6,'3','0000-00-00 00:00:00','\n'),(686,'Kiri Voan',4,1,5,6,'4','0000-00-00 00:00:00','\n'),(687,'Krang Dei Vay',4,1,5,6,'5','0000-00-00 00:00:00','\n'),(688,'Moha Sang',4,1,5,6,'6','0000-00-00 00:00:00','\n'),(689,'Ou',4,1,5,6,'7','0000-00-00 00:00:00','\n'),(690,'Prey Rumduol',4,1,5,6,'8','0000-00-00 00:00:00','\n'),(691,'Prey Kmeng',4,1,5,6,'9','0000-00-00 00:00:00','\n'),(692,'Tang Samraong',4,1,5,6,'10','0000-00-00 00:00:00','\n'),(693,'Tang Sya',4,1,5,6,'11','0000-00-00 00:00:00','\n'),(694,'Traeng Trayueng',4,1,5,6,'12','0000-00-00 00:00:00','\n'),(695,'Roleang Chak',4,1,5,7,'1','0000-00-00 00:00:00','\n'),(696,'Kaheang',4,1,5,7,'2','0000-00-00 00:00:00','\n'),(697,'khtum Krang',4,1,5,7,'3','0000-00-00 00:00:00','\n'),(698,'Krang Ampil',4,1,5,7,'4','0000-00-00 00:00:00','\n'),(699,'Pneay',4,1,5,7,'5','0000-00-00 00:00:00','\n'),(700,'Roleang Kreul',4,1,5,7,'6','0000-00-00 00:00:00','\n'),(701,'Samraong Tong',4,1,5,7,'7','0000-00-00 00:00:00','\n'),(702,'Sambour',4,1,5,7,'8','0000-00-00 00:00:00','\n'),(703,'Saen Dei',4,1,5,7,'9','0000-00-00 00:00:00','\n'),(704,'Skuh',4,1,5,7,'10','0000-00-00 00:00:00','\n'),(705,'Tiang Krouch',4,1,5,7,'11','0000-00-00 00:00:00','\n'),(706,'Thormda Ar',4,1,5,7,'12','0000-00-00 00:00:00','\n'),(707,'Trapeang Kong',4,1,5,7,'13','0000-00-00 00:00:00','\n'),(708,'Tumpoar Meas',4,1,5,7,'14','0000-00-00 00:00:00','\n'),(709,'Voa Sa',4,1,5,7,'15','0000-00-00 00:00:00','\n'),(710,'Amleang',4,1,5,8,'1','0000-00-00 00:00:00','\n'),(711,'Monourom',4,1,5,8,'2','0000-00-00 00:00:00','\n'),(712,'Prambei Mom',4,1,5,8,'3','0000-00-00 00:00:00','\n'),(713,'Rung Roeang',4,1,5,8,'4','0000-00-00 00:00:00','\n'),(714,'toap Mean',4,1,5,8,'5','0000-00-00 00:00:00','\n'),(715,'Veal Pon',4,1,5,8,'6','0000-00-00 00:00:00','\n'),(716,'Yea Angk',4,1,5,8,'7','0000-00-00 00:00:00','\n'),(717,'Bak Sna',4,1,6,1,'1','0000-00-00 00:00:00','\n'),(718,'Ballangk',4,1,6,1,'2','0000-00-00 00:00:00','\n'),(719,'Baray',4,1,6,1,'3','0000-00-00 00:00:00','\n'),(720,'Boeng',4,1,6,1,'4','0000-00-00 00:00:00','\n'),(721,'Chaeung Daeung',4,1,6,1,'5','0000-00-00 00:00:00','\n'),(722,'Chra Neang',4,1,6,1,'6','0000-00-00 00:00:00','\n'),(723,'Chhuk Khsach',4,1,6,1,'7','0000-00-00 00:00:00','\n'),(724,'Chong Doung',4,1,6,1,'8','0000-00-00 00:00:00','\n'),(725,'Chrolong',4,1,6,1,'9','0000-00-00 00:00:00','\n'),(726,'Kokir Thum',4,1,6,1,'10','0000-00-00 00:00:00','\n'),(727,'Krava',4,1,6,1,'11','0000-00-00 00:00:00','\n'),(728,'Andoung Pou',4,1,6,1,'12','0000-00-00 00:00:00','\n'),(729,'Pongro',4,1,6,1,'13','0000-00-00 00:00:00','\n'),(730,'Sou Young',4,1,6,1,'14','0000-00-00 00:00:00','\n'),(731,'Sralau',4,1,6,1,'15','0000-00-00 00:00:00','\n'),(732,'Svay Phleung',4,1,6,1,'16','0000-00-00 00:00:00','\n'),(733,'Tnaot Chum',4,1,6,1,'17','0000-00-00 00:00:00','\n'),(734,'Treal',4,1,6,1,'18','0000-00-00 00:00:00','\n'),(735,'Chey',4,1,6,2,'1','0000-00-00 00:00:00','\n'),(736,'Damrei Slab',4,1,6,2,'2','0000-00-00 00:00:00','\n'),(737,'Kampong Kou',4,1,6,2,'3','0000-00-00 00:00:00','\n'),(738,'Kampong Svay',4,1,6,2,'4','0000-00-00 00:00:00','\n'),(739,'Ni Pechr',4,1,6,2,'5','0000-00-00 00:00:00','\n'),(740,'Phat Sanday',4,1,6,2,'6','0000-00-00 00:00:00','\n'),(741,'San Kor',4,1,6,2,'7','0000-00-00 00:00:00','\n'),(742,'Tbaeng',4,1,6,2,'8','0000-00-00 00:00:00','\n'),(743,'Trapeang Ruessei',4,1,6,2,'9','0000-00-00 00:00:00','\n'),(744,'Damrei Choan Khla',4,1,6,3,'1','0000-00-00 00:00:00','\n'),(745,'Kampong Thum',4,1,6,3,'2','0000-00-00 00:00:00','\n'),(746,'Kampong Roteh',4,1,6,3,'3','0000-00-00 00:00:00','\n'),(747,'Ou Kanthor',4,1,6,3,'4','0000-00-00 00:00:00','\n'),(748,'Kdei Doung',4,1,6,3,'5','0000-00-00 00:00:00','\n'),(749,'Kampong Krabau',4,1,6,3,'6','0000-00-00 00:00:00','\n'),(750,'Prey Kuy',4,1,6,3,'7','0000-00-00 00:00:00','\n'),(751,'Prey Ta Hu',4,1,6,3,'8','0000-00-00 00:00:00','\n'),(752,'Achar Leak',4,1,6,3,'9','0000-00-00 00:00:00','\n'),(753,'Srayov',4,1,6,3,'10','0000-00-00 00:00:00','\n'),(754,'Tboung Krapeu',4,1,6,3,'11','0000-00-00 00:00:00','\n'),(755,'Doung',4,1,6,4,'1','0000-00-00 00:00:00','\n'),(756,'Kraya',4,1,6,4,'2','0000-00-00 00:00:00','\n'),(757,'Phan Nheum',4,1,6,4,'3','0000-00-00 00:00:00','\n'),(758,'Sa Kream',4,1,6,4,'4','0000-00-00 00:00:00','\n'),(759,'Sala Visai',4,1,6,4,'5','0000-00-00 00:00:00','\n'),(760,'Sameaki',4,1,6,4,'6','0000-00-00 00:00:00','\n'),(761,'Toul Kreul',4,1,6,4,'7','0000-00-00 00:00:00','\n'),(762,'Chhuk',4,1,6,5,'1','0000-00-00 00:00:00','\n'),(763,'Koul',4,1,6,5,'2','0000-00-00 00:00:00','\n'),(764,'Sambour',4,1,6,5,'3','0000-00-00 00:00:00','\n'),(765,'Sraeung',4,1,6,5,'4','0000-00-00 00:00:00','\n'),(766,'Tang Krasau',4,1,6,5,'5','0000-00-00 00:00:00','\n'),(767,'Chheu Teal',4,1,6,6,'1','0000-00-00 00:00:00','\n'),(768,'Dang Kambet',4,1,6,6,'2','0000-00-00 00:00:00','\n'),(769,'Klaeng',4,1,6,6,'3','0000-00-00 00:00:00','\n'),(770,'Maen Ret',4,1,6,6,'4','0000-00-00 00:00:00','\n'),(771,'Mean Chhey',4,1,6,6,'5','0000-00-00 00:00:00','\n'),(772,'Ngan',4,1,6,6,'6','0000-00-00 00:00:00','\n'),(773,'Sandan',4,1,6,6,'7','0000-00-00 00:00:00','\n'),(774,'Sochet',4,1,6,6,'8','0000-00-00 00:00:00','\n'),(775,'Tumring',4,1,6,6,'9','0000-00-00 00:00:00','\n'),(776,'Boeng Lvea',4,1,6,7,'1','0000-00-00 00:00:00','\n'),(777,'Chroab',4,1,6,7,'2','0000-00-00 00:00:00','\n'),(778,'Kampong Thma',4,1,6,7,'3','0000-00-00 00:00:00','\n'),(779,'Kakaoh',4,1,6,7,'4','0000-00-00 00:00:00','\n'),(780,'Kraya',4,1,6,7,'5','0000-00-00 00:00:00','\n'),(781,'Pnov',4,1,6,7,'6','0000-00-00 00:00:00','\n'),(782,'Prasat',4,1,6,7,'7','0000-00-00 00:00:00','\n'),(783,'Tang Krasang',4,1,6,7,'8','0000-00-00 00:00:00','\n'),(784,'Ti Pou',4,1,6,7,'9','0000-00-00 00:00:00','\n'),(785,'Bateay Stoung',4,1,6,8,'1','0000-00-00 00:00:00','\n'),(786,'Chamnar Kraom',4,1,6,8,'2','0000-00-00 00:00:00','\n'),(787,'Chamnar Leu',4,1,6,8,'3','0000-00-00 00:00:00','\n'),(788,'Kampong Chen Cheung',4,1,6,8,'4','0000-00-00 00:00:00','\n'),(789,'Kampong Chen Tboung',4,1,6,8,'5','0000-00-00 00:00:00','\n'),(790,'Msar Krang',4,1,6,8,'6','0000-00-00 00:00:00','\n'),(791,'Peam Krang',4,1,6,8,'7','0000-00-00 00:00:00','\n'),(792,'Popok',4,1,6,8,'8','0000-00-00 00:00:00','\n'),(793,'Pralay',4,1,6,8,'9','0000-00-00 00:00:00','\n'),(794,'Preah Damrei',4,1,6,8,'10','0000-00-00 00:00:00','\n'),(795,'Rung Roeang',4,1,6,8,'11','0000-00-00 00:00:00','\n'),(796,'Sampouch',4,1,6,8,'12','0000-00-00 00:00:00','\n'),(797,'Trea',4,1,6,8,'13','0000-00-00 00:00:00','\n'),(798,'Angkor Phnum Touch',4,1,7,1,'1','0000-00-00 00:00:00','\n'),(799,'Angkor Chey',4,1,7,1,'2','0000-00-00 00:00:00','\n'),(800,'Champei',4,1,7,1,'3','0000-00-00 00:00:00','\n'),(801,'Dambouk Khpos',4,1,7,1,'4','0000-00-00 00:00:00','\n'),(802,'Dan Koum',4,1,7,1,'5','0000-00-00 00:00:00','\n'),(803,'Daeum Doung',4,1,7,1,'6','0000-00-00 00:00:00','\n'),(804,'Mroum',4,1,7,1,'7','0000-00-00 00:00:00','\n'),(805,'Phnum Kong',4,1,7,1,'8','0000-00-00 00:00:00','\n'),(806,'Praphnum',4,1,7,1,'9','0000-00-00 00:00:00','\n'),(807,'Samlanh',4,1,7,1,'10','0000-00-00 00:00:00','\n'),(808,'Tani',4,1,7,1,'11','0000-00-00 00:00:00','\n'),(809,'Banteay Meas Khang Kaeut',4,1,7,2,'1','0000-00-00 00:00:00','\n'),(810,'Banteay Meas Khang Lech',4,1,7,2,'2','0000-00-00 00:00:00','\n'),(811,'Prey Tonle',4,1,7,2,'3','0000-00-00 00:00:00','\n'),(812,'Samraong Kraom',4,1,7,2,'4','0000-00-00 00:00:00','\n'),(813,'Samraong Leu',4,1,7,2,'5','0000-00-00 00:00:00','\n'),(814,'Sdach Kong Khang Cheung',4,1,7,2,'6','0000-00-00 00:00:00','\n'),(815,'Sdach Kong Khang Lech',4,1,7,2,'7','0000-00-00 00:00:00','\n'),(816,'Sdach Kong Khang Tboung',4,1,7,2,'8','0000-00-00 00:00:00','\n'),(817,'Tnaot Chong Srang',4,1,7,2,'9','0000-00-00 00:00:00','\n'),(818,'Trapeang Sala Khang Kaeut',4,1,7,2,'10','0000-00-00 00:00:00','\n'),(819,'Trapeang Sala Khang Lech',4,1,7,2,'11','0000-00-00 00:00:00','\n'),(820,'Tuk Meas Khang kaeut',4,1,7,2,'12','0000-00-00 00:00:00','\n'),(821,'Tuk Meas Khang Lech',4,1,7,2,'13','0000-00-00 00:00:00','\n'),(822,'Voat Angk Khang Cheung',4,1,7,2,'14','0000-00-00 00:00:00','\n'),(823,'Voat Angk Khang Tboung',4,1,7,2,'15','0000-00-00 00:00:00','\n'),(824,'Baniev',4,1,7,3,'1','0000-00-00 00:00:00','\n'),(825,'Takaen',4,1,7,3,'2','0000-00-00 00:00:00','\n'),(826,'Boeg Nimol',4,1,7,3,'3','0000-00-00 00:00:00','\n'),(827,'Chhuk',4,1,7,3,'4','0000-00-00 00:00:00','\n'),(828,'Doun Yay',4,1,7,3,'5','0000-00-00 00:00:00','\n'),(829,'Krang Sbov',4,1,7,3,'6','0000-00-00 00:00:00','\n'),(830,'Krang Snay',4,1,7,3,'7','0000-00-00 00:00:00','\n'),(831,'Lbaeuk',4,1,7,3,'8','0000-00-00 00:00:00','\n'),(832,'Trapeang Pleang',4,1,7,3,'9','0000-00-00 00:00:00','\n'),(833,'Mean Chey',4,1,7,3,'10','0000-00-00 00:00:00','\n'),(834,'Neareay',4,1,7,3,'11','0000-00-00 00:00:00','\n'),(835,'Satv Pong',4,1,7,3,'12','0000-00-00 00:00:00','\n'),(836,'Trapeang Bei',4,1,7,3,'13','0000-00-00 00:00:00','\n'),(837,'Tramaeng',4,1,7,3,'14','0000-00-00 00:00:00','\n'),(838,'Chres',4,1,7,4,'1','0000-00-00 00:00:00','\n'),(839,'Chompou Voin',4,1,7,4,'2','0000-00-00 00:00:00','\n'),(840,'Snay Anhchet',4,1,7,4,'3','0000-00-00 00:00:00','\n'),(841,'Srae Chaeng',4,1,7,4,'4','0000-00-00 00:00:00','\n'),(842,'Srae Knong',4,1,7,4,'5','0000-00-00 00:00:00','\n'),(843,'Srae Samraong',4,1,7,4,'6','0000-00-00 00:00:00','\n'),(844,'Trapeang Reang',4,1,7,4,'7','0000-00-00 00:00:00','\n'),(845,'Damnak Sokram',4,1,7,5,'1','0000-00-00 00:00:00','\n'),(846,'Dang Tong',4,1,7,5,'2','0000-00-00 00:00:00','\n'),(847,'Khcheay Khang Cheung',4,1,7,5,'3','0000-00-00 00:00:00','\n'),(848,'Khcheay Khang Tboung',4,1,7,5,'4','0000-00-00 00:00:00','\n'),(849,'Mean Ritth',4,1,7,5,'5','0000-00-00 00:00:00','\n'),(850,'Srae Chea Khang Cheung',4,1,7,5,'6','0000-00-00 00:00:00','\n'),(851,'Srae Chea Khang Tboung',4,1,7,5,'7','0000-00-00 00:00:00','\n'),(852,'Totung',4,1,7,5,'8','0000-00-00 00:00:00','\n'),(853,'Angkor Meas',4,1,7,5,'9','0000-00-00 00:00:00','\n'),(854,'Lang',4,1,7,5,'10','0000-00-00 00:00:00','\n'),(855,'Boeng Sala Khang Cheung',4,1,7,6,'1','0000-00-00 00:00:00','\n'),(856,'Boeng Sala Khang Tboung',4,1,7,6,'2','0000-00-00 00:00:00','\n'),(857,'Damnak Kantuot Khang Cheung',4,1,7,6,'3','0000-00-00 00:00:00','\n'),(858,'Damnak Kantuot Khang Tbuong',4,1,7,6,'4','0000-00-00 00:00:00','\n'),(859,'Kampong Trach Khang Kaeut',4,1,7,6,'5','0000-00-00 00:00:00','\n'),(860,'Kampong Trach Khang Lech',4,1,7,6,'6','0000-00-00 00:00:00','\n'),(861,'Kanthaor Khang Cheung',4,1,7,6,'7','0000-00-00 00:00:00','\n'),(862,'Kanthaor Khang Kaeut',4,1,7,6,'8','0000-00-00 00:00:00','\n'),(863,'Kanthor Khang Lech',4,1,7,6,'9','0000-00-00 00:00:00','\n'),(864,'Preaek Kroes',4,1,7,6,'10','0000-00-00 00:00:00','\n'),(865,'Ruessei Srok Khang Kaeut',4,1,7,6,'11','0000-00-00 00:00:00','\n'),(866,'Ruessei Srok Khang Lech',4,1,7,6,'12','0000-00-00 00:00:00','\n'),(867,'Svay Tong Khang Cheung',4,1,7,6,'13','0000-00-00 00:00:00','\n'),(868,'Tek Thla',4,1,12,8,'18','0000-00-00 00:00:00','\n'),(869,'Boeng Tuk',4,1,7,7,'1','0000-00-00 00:00:00','\n'),(870,'Chum Kriel',4,1,7,7,'2','0000-00-00 00:00:00','\n'),(871,'Kampong Kraeng',4,1,7,7,'3','0000-00-00 00:00:00','\n'),(872,'Kampong Samraong',4,1,7,7,'4','0000-00-00 00:00:00','\n'),(873,'Kandal',4,1,7,7,'5','0000-00-00 00:00:00','\n'),(874,'Kaoh Touch',4,1,7,7,'6','0000-00-00 00:00:00','\n'),(875,'Koun Satv',4,1,7,7,'7','0000-00-00 00:00:00','\n'),(876,'Meakprang',4,1,7,7,'8','0000-00-00 00:00:00','\n'),(877,'Preaek Tnaot',4,1,7,7,'9','0000-00-00 00:00:00','\n'),(878,'Prey Khmom',4,1,7,7,'10','0000-00-00 00:00:00','\n'),(879,'Prey Thnang',4,1,7,7,'11','0000-00-00 00:00:00','\n'),(880,'Stueng Kaev',4,1,7,7,'12','0000-00-00 00:00:00','\n'),(881,'Thmei',4,1,7,7,'13','0000-00-00 00:00:00','\n'),(882,'Trapeang Pring',4,1,7,7,'14','0000-00-00 00:00:00','\n'),(883,'Trapeang Sangkae',4,1,7,7,'15','0000-00-00 00:00:00','\n'),(884,'Trapeang Thum',4,1,7,7,'16','0000-00-00 00:00:00','\n'),(885,'Kampong Kandal',4,1,7,8,'1','0000-00-00 00:00:00','\n'),(886,'Krang Ampil',4,1,7,8,'2','0000-00-00 00:00:00','\n'),(887,'Kampong Bay',4,1,7,8,'3','0000-00-00 00:00:00','\n'),(888,'Andoung Khmaer',4,1,7,8,'4','0000-00-00 00:00:00','\n'),(889,'Traeuy Kaoh',4,1,7,8,'5','0000-00-00 00:00:00','\n'),(890,'Ampov Prey',4,1,8,1,'1','0000-00-00 00:00:00','\n'),(891,'Anlong Romiet',4,1,8,1,'2','0000-00-00 00:00:00','\n'),(892,'Barku',4,1,8,1,'3','0000-00-00 00:00:00','\n'),(893,'Boeng Khyang',4,1,8,1,'4','0000-00-00 00:00:00','\n'),(894,'Cheung Kaeub',4,1,8,1,'5','0000-00-00 00:00:00','\n'),(895,'Daeum Rues',4,1,8,1,'6','0000-00-00 00:00:00','\n'),(896,'Kandaok',4,1,8,1,'7','0000-00-00 00:00:00','\n'),(897,'Thmei',4,1,8,1,'8','0000-00-00 00:00:00','\n'),(898,'Kouk Trab',4,1,8,1,'9','0000-00-00 00:00:00','\n'),(899,'Kong Noy',4,1,12,5,'10','0000-00-00 00:00:00','\n'),(900,'Preah Putth',4,1,8,1,'11','0000-00-00 00:00:00','\n'),(901,'Preaek Kampis',4,1,12,5,'26','0000-00-00 00:00:00','\n'),(902,'Preaek Roka',4,1,8,1,'13','0000-00-00 00:00:00','\n'),(903,'Preaek Slaeng',4,1,8,1,'14','0000-00-00 00:00:00','\n'),(904,'Rokar',4,1,8,1,'15','0000-00-00 00:00:00','\n'),(905,'Roleang Kaen',4,1,8,1,'16','0000-00-00 00:00:00','\n'),(906,'Rolous',4,1,12,5,'17','0000-00-00 00:00:00','\n'),(907,'Siem Reap',4,1,8,1,'18','0000-00-00 00:00:00','\n'),(908,'Spean Thma',4,1,12,5,'19','0000-00-00 00:00:00','\n'),(909,'Rbaeng',4,1,8,1,'20','0000-00-00 00:00:00','\n'),(910,'Tien',4,1,12,5,'21','0000-00-00 00:00:00','\n'),(911,'Trapeang Veaeng',4,1,8,1,'22','0000-00-00 00:00:00','\n'),(912,'Trea',4,1,8,1,'23','0000-00-00 00:00:00','\n'),(913,'Bateay Daek',4,1,8,2,'1','0000-00-00 00:00:00','\n'),(914,'Chheu Teal',4,1,8,2,'2','0000-00-00 00:00:00','\n'),(915,'Dei Edth',4,1,8,2,'3','0000-00-00 00:00:00','\n'),(916,'Kampong Svay',4,1,8,2,'4','0000-00-00 00:00:00','\n'),(917,'Kbal Kaoh',4,1,12,6,'13','0000-00-00 00:00:00','\n'),(918,'Kokir',4,1,8,2,'6','0000-00-00 00:00:00','\n'),(919,'Kokir Thum',4,1,8,2,'7','0000-00-00 00:00:00','\n'),(920,'Phum Thum',4,1,8,2,'8','0000-00-00 00:00:00','\n'),(921,'Preaek Aeng',4,1,12,6,'9','0000-00-00 00:00:00','\n'),(922,'Preaek Thmei',4,1,12,6,'10','0000-00-00 00:00:00','\n'),(923,'Samraong Thum',4,1,8,2,'11','0000-00-00 00:00:00','\n'),(924,'Veal Sbov',4,1,12,6,'12','0000-00-00 00:00:00','\n'),(925,'Bak Dav',4,1,8,3,'1','0000-00-00 00:00:00','\n'),(926,'Chey Thum',4,1,8,3,'2','0000-00-00 00:00:00','\n'),(927,'Kampong Chamlang',4,1,8,3,'3','0000-00-00 00:00:00','\n'),(928,'Kaoh Chouram',4,1,8,3,'4','0000-00-00 00:00:00','\n'),(929,'Kaoh Oknha Tei',4,1,8,3,'5','0000-00-00 00:00:00','\n'),(930,'Preah Prasab',4,1,8,3,'6','0000-00-00 00:00:00','\n'),(931,'Preah Ampil',4,1,8,3,'7','0000-00-00 00:00:00','\n'),(932,'Preaek Loung',4,1,8,3,'8','0000-00-00 00:00:00','\n'),(933,'Preaek Ta Kov',4,1,8,3,'9','0000-00-00 00:00:00','\n'),(934,'Preaek Ta Meak',4,1,8,3,'10','0000-00-00 00:00:00','\n'),(935,'Puk Ruessei',4,1,8,3,'11','0000-00-00 00:00:00','\n'),(936,'Roka Chonlueng',4,1,8,3,'12','0000-00-00 00:00:00','\n'),(937,'Sanlung',4,1,8,3,'13','0000-00-00 00:00:00','\n'),(938,'Sithor',4,1,8,3,'14','0000-00-00 00:00:00','\n'),(939,'Svay Chrum',4,1,8,3,'15','0000-00-00 00:00:00','\n'),(940,'Svay Romiet',4,1,8,3,'16','0000-00-00 00:00:00','\n'),(941,'Ta Aek',4,1,8,3,'17','0000-00-00 00:00:00','\n'),(942,'Vihear Suork',4,1,8,3,'18','0000-00-00 00:00:00','\n'),(943,'Chheu Khmau',4,1,8,4,'1','0000-00-00 00:00:00','\n'),(944,'Chroy Ta Kaev',4,1,8,4,'2','0000-00-00 00:00:00','\n'),(945,'Kampong Kong',4,1,8,4,'3','0000-00-00 00:00:00','\n'),(946,'Kaoh Thom Ka',4,1,8,4,'4','0000-00-00 00:00:00','\n'),(947,'Kaoh Thom Khar',4,1,8,4,'5','0000-00-00 00:00:00','\n'),(948,'Leuk Dek',4,1,8,4,'6','0000-00-00 00:00:00','\n'),(949,'Pouthi Ban',4,1,8,4,'7','0000-00-00 00:00:00','\n'),(950,'Preaek Chrey',4,1,8,4,'8','0000-00-00 00:00:00','\n'),(951,'Preaek Sdei',4,1,8,4,'9','0000-00-00 00:00:00','\n'),(952,'Preaek Thmei',4,1,8,4,'10','0000-00-00 00:00:00','\n'),(953,'Sampov Lun',4,1,8,4,'11','0000-00-00 00:00:00','\n'),(954,'Kampong Phnum',4,1,8,5,'1','0000-00-00 00:00:00','\n'),(955,'Kam Samnar',4,1,8,5,'2','0000-00-00 00:00:00','\n'),(956,'Khpob Ateav',4,1,8,5,'3','0000-00-00 00:00:00','\n'),(957,'Peam Reang',4,1,8,5,'4','0000-00-00 00:00:00','\n'),(958,'Preaek Dach',4,1,8,5,'5','0000-00-00 00:00:00','\n'),(959,'Preaek Tonloab',4,1,8,5,'6','0000-00-00 00:00:00','\n'),(960,'Sandar',4,1,8,5,'7','0000-00-00 00:00:00','\n'),(961,'Akreiy Ksatr',4,1,8,6,'1','0000-00-00 00:00:00','\n'),(962,'Barong',4,1,8,6,'2','0000-00-00 00:00:00','\n'),(963,'Boeng Krum',4,1,8,6,'3','0000-00-00 00:00:00','\n'),(964,'Kaoh Kaev',4,1,8,6,'4','0000-00-00 00:00:00','\n'),(965,'Kaoh Reah',4,1,8,6,'5','0000-00-00 00:00:00','\n'),(966,'Lvea Sa',4,1,8,6,'6','0000-00-00 00:00:00','\n'),(967,'Peam Oknha Ong',4,1,8,6,'7','0000-00-00 00:00:00','\n'),(968,'Phum Thum',4,1,8,6,'8','0000-00-00 00:00:00','\n'),(969,'Preaek Kmeng',4,1,8,6,'9','0000-00-00 00:00:00','\n'),(970,'Preaek Rey',4,1,8,6,'10','0000-00-00 00:00:00','\n'),(971,'Preaek Ruessei',4,1,8,6,'11','0000-00-00 00:00:00','\n'),(972,'Sambuor',4,1,8,6,'12','0000-00-00 00:00:00','\n'),(973,'Sarikakaev',4,1,8,6,'13','0000-00-00 00:00:00','\n'),(974,'Thmar Kor',4,1,8,6,'14','0000-00-00 00:00:00','\n'),(975,'Tuek Khleang',4,1,8,6,'15','0000-00-00 00:00:00','\n'),(976,'Bak Khaeng',4,1,12,7,'13','0000-00-00 00:00:00','\n'),(977,'Kaoh Dach',4,1,12,7,'14','0000-00-00 00:00:00','\n'),(978,'Preaek Anhchanh',4,1,8,7,'3','0000-00-00 00:00:00','\n'),(979,'Preaek Dambang',4,1,8,7,'4','0000-00-00 00:00:00','\n'),(980,'Roka Kaong Muoy',4,1,8,7,'5','0000-00-00 00:00:00','\n'),(981,'Roka Kaong Pir',4,1,8,7,'6','0000-00-00 00:00:00','\n'),(982,'Ruessei Chrouy',4,1,8,7,'7','0000-00-00 00:00:00','\n'),(983,'Sambour Meas',4,1,8,7,'8','0000-00-00 00:00:00','\n'),(984,'Svay Ampear',4,1,8,7,'9','0000-00-00 00:00:00','\n'),(985,'Baek Chan',4,1,8,8,'1','0000-00-00 00:00:00','\n'),(986,'Beoung Thom',4,1,12,9,'1','0000-00-00 00:00:00','\n'),(987,'Chhak Chheu Neang',4,1,8,8,'3','0000-00-00 00:00:00','\n'),(988,'Damnak Ampil',4,1,8,8,'4','0000-00-00 00:00:00','\n'),(989,'Kambol',4,1,12,9,'4','0000-00-00 00:00:00','\n'),(990,'Kantaok',4,1,12,9,'5','0000-00-00 00:00:00','\n'),(991,'Krang Mkak',4,1,8,8,'7','0000-00-00 00:00:00','\n'),(992,'Lumhach',4,1,8,8,'8','0000-00-00 00:00:00','\n'),(993,'Mkak',4,1,8,8,'9','0000-00-00 00:00:00','\n'),(994,'Ovluk',4,1,12,9,'8','0000-00-00 00:00:00','\n'),(995,'Peuk',4,1,8,8,'11','0000-00-00 00:00:00','\n'),(996,'Ponszang',4,1,12,9,'10','0000-00-00 00:00:00','\n'),(997,'Prey Puoch',4,1,8,8,'13','0000-00-00 00:00:00','\n'),(998,'Samraong Leu',4,1,8,8,'14','0000-00-00 00:00:00','\n'),(999,'Snao',4,1,12,9,'12','0000-00-00 00:00:00','\n'),(1000,'tuol Prech',4,1,8,8,'16','0000-00-00 00:00:00','\n'),(1001,'Chhveang',4,1,8,9,'1','0000-00-00 00:00:00','\n'),(1002,'Chrey Laos',4,1,8,9,'2','0000-00-00 00:00:00','\n'),(1003,'Kampong Luong',4,1,8,9,'3','0000-00-00 00:00:00','\n'),(1004,'Kampong Os',4,1,8,9,'4','0000-00-00 00:00:00','\n'),(1005,'Kaoh Chen',4,1,8,9,'5','0000-00-00 00:00:00','\n'),(1006,'Phnum Bat',4,1,8,9,'6','0000-00-00 00:00:00','\n'),(1007,'PorngearLeur',4,1,8,9,'7','0000-00-00 00:00:00','\n'),(1008,'Porngear Pon',4,1,12,8,'8','0000-00-00 00:00:00','\n'),(1009,'Preaek Phnov',4,1,12,8,'9','0000-00-00 00:00:00','\n'),(1010,'Preaek Ta Teaen',4,1,8,9,'10','0000-00-00 00:00:00','\n'),(1011,'Phsar Daek',4,1,8,9,'11','0000-00-00 00:00:00','\n'),(1012,'Samraong',4,1,12,8,'12','0000-00-00 00:00:00','\n'),(1013,'Tumnob Thum',4,1,8,9,'13','0000-00-00 00:00:00','\n'),(1014,'Vihear Luong',4,1,8,9,'14','0000-00-00 00:00:00','\n'),(1015,'Khpob',4,1,8,10,'1','0000-00-00 00:00:00','\n'),(1016,'Kaoh Anlong Chen',4,1,8,10,'2','0000-00-00 00:00:00','\n'),(1017,'Kaoh Khael',4,1,8,10,'3','0000-00-00 00:00:00','\n'),(1018,'Kaoh Khsach Tonlea',4,1,8,10,'4','0000-00-00 00:00:00','\n'),(1019,'Krang Yov',4,1,8,10,'5','0000-00-00 00:00:00','\n'),(1020,'Prasat',4,1,8,10,'6','0000-00-00 00:00:00','\n'),(1021,'Preaek Ambel',4,1,8,10,'7','0000-00-00 00:00:00','\n'),(1022,'Preaek Koy',4,1,8,10,'8','0000-00-00 00:00:00','\n'),(1023,'Roka Khpos',4,1,8,10,'9','0000-00-00 00:00:00','\n'),(1024,'Sang Phnum',4,1,8,10,'10','0000-00-00 00:00:00','\n'),(1025,'Setbou',4,1,8,10,'11','0000-00-00 00:00:00','\n'),(1026,'Svay Prateal',4,1,8,10,'12','0000-00-00 00:00:00','\n'),(1027,'Svay Rolum',4,1,8,10,'13','0000-00-00 00:00:00','\n'),(1028,'Ta Lon',4,1,8,10,'14','0000-00-00 00:00:00','\n'),(1029,'Traeuy Sla',4,1,8,10,'15','0000-00-00 00:00:00','\n'),(1030,'Tuek Vil',4,1,8,10,'16','0000-00-00 00:00:00','\n'),(1031,'Ta Kdol',4,1,8,11,'1','0000-00-00 00:00:00','\n'),(1032,'Prek Reussey',4,1,8,11,'2','0000-00-00 00:00:00','\n'),(1033,'Deum Mien',4,1,8,11,'3','0000-00-00 00:00:00','\n'),(1034,'Takhmao',4,1,8,11,'4','0000-00-00 00:00:00','\n'),(1035,'Prek Ho',4,1,8,11,'5','0000-00-00 00:00:00','\n'),(1036,'Kampong Samnanh',4,1,8,11,'6','0000-00-00 00:00:00','\n'),(1037,'Andoung Tuek',4,1,9,1,'1','0000-00-00 00:00:00','\n'),(1038,'Kandaol',4,1,9,1,'2','0000-00-00 00:00:00','\n'),(1039,'Ta Nun',4,1,9,1,'3','0000-00-00 00:00:00','\n'),(1040,'Thma Sa',4,1,9,1,'4','0000-00-00 00:00:00','\n'),(1041,'Kaoh Sdach',4,1,9,2,'1','0000-00-00 00:00:00','\n'),(1042,'Phnhi Meas',4,1,9,2,'2','0000-00-00 00:00:00','\n'),(1043,'Preaek Khsach',4,1,9,2,'3','0000-00-00 00:00:00','\n'),(1044,'Chrouy Pras',4,1,9,3,'1','0000-00-00 00:00:00','\n'),(1045,'Kaoh Kapi',4,1,9,3,'2','0000-00-00 00:00:00','\n'),(1046,'Ta Tai Kraom',4,1,9,3,'3','0000-00-00 00:00:00','\n'),(1047,'Trapeang Rung',4,1,9,3,'4','0000-00-00 00:00:00','\n'),(1048,'Smach Mean Chey',4,1,9,4,'1','0000-00-00 00:00:00','\n'),(1049,'Dang Tong',4,1,9,4,'2','0000-00-00 00:00:00','\n'),(1050,'Stueng Veaeng',4,1,9,4,'3','0000-00-00 00:00:00','\n'),(1051,'Bak Khlang',4,1,9,5,'1','0000-00-00 00:00:00','\n'),(1052,'Peam Krasaob',4,1,9,5,'2','0000-00-00 00:00:00','\n'),(1053,'Tuol Kokir',4,1,9,5,'3','0000-00-00 00:00:00','\n'),(1054,'Boeng Preav',4,1,9,6,'1','0000-00-00 00:00:00','\n'),(1055,'Chi Kha Kraom',4,1,9,6,'2','0000-00-00 00:00:00','\n'),(1056,'Chi Kha Leu',4,1,9,6,'3','0000-00-00 00:00:00','\n'),(1057,'Chrouy Svay',4,1,9,6,'4','0000-00-00 00:00:00','\n'),(1058,'Dang Peaeng',4,1,9,6,'5','0000-00-00 00:00:00','\n'),(1059,'Srae Ambel',4,1,9,6,'6','0000-00-00 00:00:00','\n'),(1060,'Pralay',4,1,9,7,'1','0000-00-00 00:00:00','\n'),(1061,'Chumnoab',4,1,9,7,'2','0000-00-00 00:00:00','\n'),(1062,'Ruessei Chrum',4,1,9,7,'3','0000-00-00 00:00:00','\n'),(1063,'Ta Tey Leu',4,1,9,7,'4','0000-00-00 00:00:00','\n'),(1064,'Chi Phat',4,1,9,7,'5','0000-00-00 00:00:00','\n'),(1065,'Thma Doun Pau',4,1,9,7,'6','0000-00-00 00:00:00','\n'),(1066,'Chamkar Luong',4,1,9,8,'1','0000-00-00 00:00:00','\n'),(1067,'Kampong Seila',4,1,9,8,'2','0000-00-00 00:00:00','\n'),(1068,'Ou Bak Roteh',4,1,9,8,'3','0000-00-00 00:00:00','\n'),(1069,'Stueng Chhay',4,1,9,8,'4','0000-00-00 00:00:00','\n'),(1070,'Chhloung',4,1,10,1,'1','0000-00-00 00:00:00','\n'),(1071,'Domrei Phong',4,1,10,1,'2','0000-00-00 00:00:00','\n'),(1072,'Han Chey',4,1,10,1,'3','0000-00-00 00:00:00','\n'),(1073,'Kampong Domrei',4,1,10,1,'4','0000-00-00 00:00:00','\n'),(1074,'Kanhchor',4,1,10,1,'5','0000-00-00 00:00:00','\n'),(1075,'Khsach Andaet',4,1,10,1,'6','0000-00-00 00:00:00','\n'),(1076,'Pongro',4,1,10,1,'7','0000-00-00 00:00:00','\n'),(1077,'Preaek Saman',4,1,10,1,'8','0000-00-00 00:00:00','\n'),(1078,'Bos Leav',4,1,10,2,'1','0000-00-00 00:00:00','\n'),(1079,'ChangKrang',4,1,10,2,'2','0000-00-00 00:00:00','\n'),(1080,'Dar',4,1,10,2,'3','0000-00-00 00:00:00','\n'),(1081,'Kantuot',4,1,10,2,'4','0000-00-00 00:00:00','\n'),(1082,'Kou Loab',4,1,10,2,'5','0000-00-00 00:00:00','\n'),(1083,'Kaoh Chreang',4,1,10,2,'6','0000-00-00 00:00:00','\n'),(1084,'Koah Trong',4,1,10,2,'7','0000-00-00 00:00:00','\n'),(1085,'Krakor',4,1,10,2,'8','0000-00-00 00:00:00','\n'),(1086,'Kracheh',4,1,10,2,'9','0000-00-00 00:00:00','\n'),(1087,'Ou Ruessei',4,1,10,2,'10','0000-00-00 00:00:00','\n'),(1088,'Roka Kandal',4,1,10,2,'11','0000-00-00 00:00:00','\n'),(1089,'Sambok',4,1,10,2,'12','0000-00-00 00:00:00','\n'),(1090,'Thma Andeauk',4,1,10,2,'13','0000-00-00 00:00:00','\n'),(1091,'Thma Kreae',4,1,10,2,'14','0000-00-00 00:00:00','\n'),(1092,'Thmei',4,1,10,2,'15','0000-00-00 00:00:00','\n'),(1093,'Chambak',4,1,10,3,'1','0000-00-00 00:00:00','\n'),(1094,'Chrouy Banteay',4,1,10,3,'2','0000-00-00 00:00:00','\n'),(1095,'Kampong Kor',4,1,10,3,'3','0000-00-00 00:00:00','\n'),(1096,'Kaoh Ta Suy',4,1,10,3,'4','0000-00-00 00:00:00','\n'),(1097,'Preaek Prasab',4,1,10,3,'5','0000-00-00 00:00:00','\n'),(1098,'Ruessei Kaev',4,1,10,3,'6','0000-00-00 00:00:00','\n'),(1099,'Saob',4,1,10,3,'7','0000-00-00 00:00:00','\n'),(1100,'Ta Mau',4,1,10,3,'8','0000-00-00 00:00:00','\n'),(1101,'Boeng Char',4,1,10,4,'1','0000-00-00 00:00:00','\n'),(1102,'Kampong Cham',4,1,10,4,'2','0000-00-00 00:00:00','\n'),(1103,'Kbal Damrei',4,1,10,4,'3','0000-00-00 00:00:00','\n'),(1104,'Kaoh Khnhaer',4,1,10,4,'4','0000-00-00 00:00:00','\n'),(1105,'Ou Krieng',4,1,10,4,'5','0000-00-00 00:00:00','\n'),(1106,'Roluos Mean Chey',4,1,10,4,'6','0000-00-00 00:00:00','\n'),(1107,'Sambuor',4,1,10,4,'7','0000-00-00 00:00:00','\n'),(1108,'Sandan',4,1,10,4,'8','0000-00-00 00:00:00','\n'),(1109,'Srae Chis',4,1,10,4,'9','0000-00-00 00:00:00','\n'),(1110,'Voadthonak',4,1,10,4,'10','0000-00-00 00:00:00','\n'),(1111,'Khsuem',4,1,10,5,'1','0000-00-00 00:00:00','\n'),(1112,'Pir Thnu',4,1,10,5,'2','0000-00-00 00:00:00','\n'),(1113,'Snuol',4,1,10,5,'3','0000-00-00 00:00:00','\n'),(1114,'Srae Char',4,1,10,5,'4','0000-00-00 00:00:00','\n'),(1115,'Svay Chreah',4,1,10,5,'5','0000-00-00 00:00:00','\n'),(1116,'Chong Phlah',4,1,11,1,'1','0000-00-00 00:00:00','\n'),(1117,'Me Mang',4,1,11,1,'2','0000-00-00 00:00:00','\n'),(1118,'Srae Khtuk',4,1,11,1,'3','0000-00-00 00:00:00','\n'),(1119,'Srae Khtum',4,1,11,1,'4','0000-00-00 00:00:00','\n'),(1120,'Srae Preah',4,1,11,1,'5','0000-00-00 00:00:00','\n'),(1121,'Nang Khi Loek',4,1,11,2,'1','0000-00-00 00:00:00','\n'),(1122,'Ou Buon Leu',4,1,11,2,'2','0000-00-00 00:00:00','\n'),(1123,'Roya',4,1,11,2,'3','0000-00-00 00:00:00','\n'),(1124,'Sokh Sant',4,1,11,2,'4','0000-00-00 00:00:00','\n'),(1125,'Srae Huy',4,1,11,2,'5','0000-00-00 00:00:00','\n'),(1126,'Srae Sangkom',4,1,11,2,'6','0000-00-00 00:00:00','\n'),(1127,'Dak Dam',4,1,11,3,'1','0000-00-00 00:00:00','\n'),(1128,'Saen Monourom',4,1,11,3,'2','0000-00-00 00:00:00','\n'),(1129,'Krang Teh',4,1,11,4,'1','0000-00-00 00:00:00','\n'),(1130,'Pou Chrei',4,1,11,4,'2','0000-00-00 00:00:00','\n'),(1131,'Srae Ampum',4,1,11,4,'3','0000-00-00 00:00:00','\n'),(1132,'Bu Sra',4,1,11,4,'4','0000-00-00 00:00:00','\n'),(1133,'Monourom',4,1,11,5,'1','0000-00-00 00:00:00','\n'),(1134,'Sokh Dom',4,1,11,5,'2','0000-00-00 00:00:00','\n'),(1135,'Spean Men Chey',4,1,11,5,'3','0000-00-00 00:00:00','\n'),(1136,'Romonea',4,1,11,5,'4','0000-00-00 00:00:00','\n'),(1137,'Tunle Bassac',4,1,12,1,'1','0000-00-00 00:00:00','\n'),(1138,'Beung Keng Kang I',4,1,12,1,'2','0000-00-00 00:00:00','\n'),(1139,'Beung Keng Kang II',4,1,12,1,'3','0000-00-00 00:00:00','\n'),(1140,'Beung Keng Kang III',4,1,12,1,'4','0000-00-00 00:00:00','\n'),(1141,'Olympic',4,1,12,1,'5','0000-00-00 00:00:00','\n'),(1142,'Tuol Svay Prey I',4,1,12,1,'6','0000-00-00 00:00:00','\n'),(1143,'Tuol Svay Prey II',4,1,12,1,'7','0000-00-00 00:00:00','\n'),(1144,'Tumnup Tek',4,1,12,1,'8','0000-00-00 00:00:00','\n'),(1145,'Tuol Tumpung II',4,1,12,1,'9','0000-00-00 00:00:00','\n'),(1146,'Tuol Tumpung I',4,1,12,1,'10','0000-00-00 00:00:00','\n'),(1147,'Beung Trabek',4,1,12,1,'11','0000-00-00 00:00:00','\n'),(1148,'Phsar Derm Thkov',4,1,12,1,'12','0000-00-00 00:00:00','\n'),(1149,'Phsar Thmei I',4,1,12,2,'1','0000-00-00 00:00:00','\n'),(1150,'Phsar Thmei II',4,1,12,2,'2','0000-00-00 00:00:00','\n'),(1151,'Phsar Thmei III',4,1,12,2,'3','0000-00-00 00:00:00','\n'),(1152,'Beung Raing',4,1,12,2,'4','0000-00-00 00:00:00','\n'),(1153,'Phsar Kandal I',4,1,12,2,'5','0000-00-00 00:00:00','\n'),(1154,'Phsar Kandal II',4,1,12,2,'6','0000-00-00 00:00:00','\n'),(1155,'Chaktomuk',4,1,12,2,'7','0000-00-00 00:00:00','\n'),(1156,'Chey Chumneah',4,1,12,2,'8','0000-00-00 00:00:00','\n'),(1157,'Phsar Chas',4,1,12,2,'9','0000-00-00 00:00:00','\n'),(1158,'Srah Chak',4,1,12,2,'10','0000-00-00 00:00:00','\n'),(1159,'Wat Phnom',4,1,12,2,'11','0000-00-00 00:00:00','\n'),(1160,'Khmuonh',4,1,12,8,'19','0000-00-00 00:00:00','\n'),(1161,'O Reussey I',4,1,12,3,'1','0000-00-00 00:00:00','\n'),(1162,'O Reussey II',4,1,12,3,'2','0000-00-00 00:00:00','\n'),(1163,'O Reussey III',4,1,12,3,'3','0000-00-00 00:00:00','\n'),(1164,'O Reussey IV',4,1,12,3,'4','0000-00-00 00:00:00','\n'),(1165,'Monorom',4,1,12,3,'5','0000-00-00 00:00:00','\n'),(1166,'Mittapheap',4,1,12,3,'6','0000-00-00 00:00:00','\n'),(1167,'Veal Vong',4,1,12,3,'7','0000-00-00 00:00:00','\n'),(1168,'Beung Pralit',4,1,12,3,'8','0000-00-00 00:00:00','\n'),(1169,'Phsar Depo I',4,1,12,4,'1','0000-00-00 00:00:00','\n'),(1170,'Phsar Depo II',4,1,12,4,'2','0000-00-00 00:00:00','\n'),(1171,'Phsar Depo III',4,1,12,4,'3','0000-00-00 00:00:00','\n'),(1172,'Tek Laak I',4,1,12,4,'4','0000-00-00 00:00:00','\n'),(1173,'Tek Laak II',4,1,12,4,'5','0000-00-00 00:00:00','\n'),(1174,'Tek Laak III',4,1,12,4,'6','0000-00-00 00:00:00','\n'),(1175,'Beung Kak I',4,1,12,4,'7','0000-00-00 00:00:00','\n'),(1176,'Beung Kak II',4,1,12,4,'8','0000-00-00 00:00:00','\n'),(1177,'Phsar Deum Kor',4,1,12,4,'9','0000-00-00 00:00:00','\n'),(1178,'Beung Salang',4,1,12,4,'10','0000-00-00 00:00:00','\n'),(1179,'Dangkor',4,1,12,5,'1','0000-00-00 00:00:00','\n'),(1180,'Trapeang Krasaing',4,1,12,9,'13','0000-00-00 00:00:00','\n'),(1181,'Kok Roka',4,1,12,9,'6','0000-00-00 00:00:00','\n'),(1182,'Phleung Chhesrotes',4,1,12,9,'9','0000-00-00 00:00:00','\n'),(1183,'Chom Chao',4,1,12,9,'2','0000-00-00 00:00:00','\n'),(1184,'Kakap',4,1,12,9,'3','0000-00-00 00:00:00','\n'),(1185,'Porng Tek',4,1,12,5,'7','0000-00-00 00:00:00','\n'),(1186,'Prey Veng',4,1,12,5,'8','0000-00-00 00:00:00','\n'),(1187,'Samrong',4,1,12,9,'11','0000-00-00 00:00:00','\n'),(1188,'Prey Sar',4,1,12,5,'24','0000-00-00 00:00:00','\n'),(1189,'Kraing Thnoung',4,1,12,9,'7','0000-00-00 00:00:00','\n'),(1190,'Kraing Pongro',4,1,12,5,'27','0000-00-00 00:00:00','\n'),(1191,'Pratas Lang',4,1,12,5,'13','0000-00-00 00:00:00','\n'),(1192,'Sak Sampov',4,1,12,5,'14','0000-00-00 00:00:00','\n'),(1193,'Cheung Ek',4,1,12,5,'15','0000-00-00 00:00:00','\n'),(1194,'Steung Mean Chey',4,1,12,6,'1','0000-00-00 00:00:00','\n'),(1195,'Beung Tumpun',4,1,12,6,'2','0000-00-00 00:00:00','\n'),(1196,'Prek Pra',4,1,12,6,'3','0000-00-00 00:00:00','\n'),(1197,'Chbar Ampov I',4,1,12,6,'4','0000-00-00 00:00:00','\n'),(1198,'Chbar Ampov II',4,1,12,6,'5','0000-00-00 00:00:00','\n'),(1199,'Chak Angre Leu',4,1,12,6,'6','0000-00-00 00:00:00','\n'),(1200,'Chak Angre Krom',4,1,12,6,'7','0000-00-00 00:00:00','\n'),(1201,'Niroth',4,1,12,6,'8','0000-00-00 00:00:00','\n'),(1202,'Khmuonh',4,1,12,7,'1','0000-00-00 00:00:00','\n'),(1203,'Tuol Sangker',4,1,12,7,'2','0000-00-00 00:00:00','\n'),(1204,'Svay Pak',4,1,12,7,'3','0000-00-00 00:00:00','\n'),(1205,'Kilometer no. 6',4,1,12,7,'4','0000-00-00 00:00:00','\n'),(1206,'Phnom Penh Thmey',4,1,12,7,'5','0000-00-00 00:00:00','\n'),(1207,'Reussey Keo',4,1,12,7,'6','0000-00-00 00:00:00','\n'),(1208,'Tek Thla',4,1,12,7,'7','0000-00-00 00:00:00','\n'),(1209,'Prek Leap',4,1,12,7,'8','0000-00-00 00:00:00','\n'),(1210,'Prek Ta Sek',4,1,12,7,'9','0000-00-00 00:00:00','\n'),(1211,'Chroy Changva',4,1,12,7,'10','0000-00-00 00:00:00','\n'),(1214,'Sang',4,1,13,1,'1','0000-00-00 00:00:00','\n'),(1215,'Tasu',4,1,13,1,'2','0000-00-00 00:00:00','\n'),(1216,'Khyang',4,1,13,1,'3','0000-00-00 00:00:00','\n'),(1217,'Chrach',4,1,13,1,'4','0000-00-00 00:00:00','\n'),(1218,'Thmea',4,1,13,1,'5','0000-00-00 00:00:00','\n'),(1219,'Putrea',4,1,13,1,'6','0000-00-00 00:00:00','\n'),(1220,'Chhaeb Muoy',4,1,13,2,'1','0000-00-00 00:00:00','\n'),(1221,'Chhaeb Pir',4,1,13,2,'2','0000-00-00 00:00:00','\n'),(1222,'Sangkae Muoy',4,1,13,2,'3','0000-00-00 00:00:00','\n'),(1223,'Sangkae Pir',4,1,13,2,'4','0000-00-00 00:00:00','\n'),(1224,'Mlu Prey Muoy',4,1,13,2,'5','0000-00-00 00:00:00','\n'),(1225,'Mlu Prey Pir',4,1,13,2,'6','0000-00-00 00:00:00','\n'),(1226,'Kampong Sralau Muoy',4,1,13,2,'7','0000-00-00 00:00:00','\n'),(1227,'Kampong Sralau Pir',4,1,13,2,'8','0000-00-00 00:00:00','\n'),(1228,'Choam Ksant',4,1,13,3,'1','0000-00-00 00:00:00','\n'),(1229,'Tuek Kraham',4,1,13,3,'2','0000-00-00 00:00:00','\n'),(1230,'Pring Thum',4,1,13,3,'3','0000-00-00 00:00:00','\n'),(1231,'Rumdaoh Srae',4,1,13,3,'4','0000-00-00 00:00:00','\n'),(1232,'Yeang',4,1,13,3,'5','0000-00-00 00:00:00','\n'),(1233,'Kantuot',4,1,13,3,'6','0000-00-00 00:00:00','\n'),(1234,'Kuleaen Tboung',4,1,13,4,'1','0000-00-00 00:00:00','\n'),(1235,'Kuleaen Cheung',4,1,13,4,'2','0000-00-00 00:00:00','\n'),(1236,'Thmei',4,1,13,4,'3','0000-00-00 00:00:00','\n'),(1237,'Phnum Penh',4,1,13,4,'4','0000-00-00 00:00:00','\n'),(1238,'Phnum Tbaeng Pir',4,1,13,4,'5','0000-00-00 00:00:00','\n'),(1239,'Srayang',4,1,13,4,'6','0000-00-00 00:00:00','\n'),(1240,'Robieb',4,1,13,5,'1','0000-00-00 00:00:00','\n'),(1241,'Reaksmei',4,1,13,5,'2','0000-00-00 00:00:00','\n'),(1242,'Rohas',4,1,13,5,'3','0000-00-00 00:00:00','\n'),(1243,'Rung Roeang',4,1,13,5,'4','0000-00-00 00:00:00','\n'),(1244,'Rik Reay',4,1,13,5,'5','0000-00-00 00:00:00','\n'),(1245,'Ruos Roan',4,1,13,5,'6','0000-00-00 00:00:00','\n'),(1246,'Rotanak',4,1,13,5,'7','0000-00-00 00:00:00','\n'),(1247,'Rieb Roy',4,1,13,5,'8','0000-00-00 00:00:00','\n'),(1248,'Reaksa',4,1,13,5,'9','0000-00-00 00:00:00','\n'),(1249,'Rumdaoh',4,1,13,5,'10','0000-00-00 00:00:00','\n'),(1250,'Romtom',4,1,13,5,'11','0000-00-00 00:00:00','\n'),(1251,'Romoniy',4,1,13,5,'12','0000-00-00 00:00:00','\n'),(1252,'Chamraeun',4,1,13,6,'1','0000-00-00 00:00:00','\n'),(1253,'Roang',4,1,13,6,'2','0000-00-00 00:00:00','\n'),(1254,'Phnum Tbaeng Muoy',4,1,13,6,'3','0000-00-00 00:00:00','\n'),(1255,'Sdau',4,1,13,6,'4','0000-00-00 00:00:00','\n'),(1256,'Ronak Ser',4,1,13,6,'5','0000-00-00 00:00:00','\n'),(1257,'Kampong Pranak',4,1,13,7,'1','0000-00-00 00:00:00','\n'),(1258,'Pal Hal',4,1,13,7,'2','0000-00-00 00:00:00','\n'),(1259,'Chhean Mukh',4,1,13,7,'3','0000-00-00 00:00:00','\n'),(1260,'Pou',4,1,13,7,'4','0000-00-00 00:00:00','\n'),(1261,'Prame',4,1,13,7,'5','0000-00-00 00:00:00','\n'),(1262,'Preah Khleang',4,1,13,7,'6','0000-00-00 00:00:00','\n'),(1263,'Boeng Preah',4,1,14,1,'1','0000-00-00 00:00:00','\n'),(1264,'Cheung Phnum',4,1,14,1,'2','0000-00-00 00:00:00','\n'),(1265,'Chheu Kach',4,1,14,1,'3','0000-00-00 00:00:00','\n'),(1266,'Reaks Chey',4,1,14,1,'4','0000-00-00 00:00:00','\n'),(1267,'Roung Damrei',4,1,14,1,'5','0000-00-00 00:00:00','\n'),(1268,'Sdau Kaong',4,1,14,1,'6','0000-00-00 00:00:00','\n'),(1269,'Spueu Ka',4,1,14,1,'7','0000-00-00 00:00:00','\n'),(1270,'Spueu Kha',4,1,14,1,'8','0000-00-00 00:00:00','\n'),(1271,'Theay',4,1,14,1,'9','0000-00-00 00:00:00','\n'),(1272,'Cheach',4,1,14,2,'1','0000-00-00 00:00:00','\n'),(1273,'Doun Koeng',4,1,14,2,'2','0000-00-00 00:00:00','\n'),(1274,'Kranhung',4,1,14,2,'3','0000-00-00 00:00:00','\n'),(1275,'Krabau',4,1,14,2,'4','0000-00-00 00:00:00','\n'),(1276,'Seang Khveang',4,1,14,2,'5','0000-00-00 00:00:00','\n'),(1277,'Smaong Cheung',4,1,14,2,'6','0000-00-00 00:00:00','\n'),(1278,'Smaong Tboung',4,1,14,2,'7','0000-00-00 00:00:00','\n'),(1279,'Trabaek',4,1,14,2,'8','0000-00-00 00:00:00','\n'),(1280,'Ansaong',4,1,14,3,'1','0000-00-00 00:00:00','\n'),(1281,'Cham',4,1,14,3,'2','0000-00-00 00:00:00','\n'),(1282,'Cheang Daek',4,1,14,3,'3','0000-00-00 00:00:00','\n'),(1283,'Chrey',4,1,14,3,'4','0000-00-00 00:00:00','\n'),(1284,'Kansaom Ak',4,1,14,3,'5','0000-00-00 00:00:00','\n'),(1285,'Kou Khchak',4,1,14,3,'6','0000-00-00 00:00:00','\n'),(1286,'Kampong Trabaek',4,1,14,3,'7','0000-00-00 00:00:00','\n'),(1287,'Peam Montear',4,1,14,3,'8','0000-00-00 00:00:00','\n'),(1288,'Prasat',4,1,14,3,'9','0000-00-00 00:00:00','\n'),(1289,'Pratheat',4,1,14,3,'10','0000-00-00 00:00:00','\n'),(1290,'Prey Chhor',4,1,14,3,'11','0000-00-00 00:00:00','\n'),(1291,'Prey Poun',4,1,14,3,'12','0000-00-00 00:00:00','\n'),(1292,'Thkov',4,1,14,3,'13','0000-00-00 00:00:00','\n'),(1293,'Chong Ampil',4,1,14,4,'1','0000-00-00 00:00:00','\n'),(1294,'Kanhchriech',4,1,14,4,'2','0000-00-00 00:00:00','\n'),(1295,'Kdoeang Reay',4,1,14,4,'3','0000-00-00 00:00:00','\n'),(1296,'Kouk Kong Kaeut',4,1,14,4,'4','0000-00-00 00:00:00','\n'),(1297,'Kouk Kong Lech',4,1,14,4,'5','0000-00-00 00:00:00','\n'),(1298,'Preal',4,1,14,4,'6','0000-00-00 00:00:00','\n'),(1299,'Thma Pun',4,1,14,4,'7','0000-00-00 00:00:00','\n'),(1300,'Tnaot',4,1,14,4,'8','0000-00-00 00:00:00','\n'),(1301,'Angkor Sar',4,1,14,5,'1','0000-00-00 00:00:00','\n'),(1302,'Chres',4,1,14,5,'2','0000-00-00 00:00:00','\n'),(1303,'Chi Phoch',4,1,14,5,'3','0000-00-00 00:00:00','\n'),(1304,'Prey Khnes',4,1,14,5,'4','0000-00-00 00:00:00','\n'),(1305,'Prey Rumdeng',4,1,14,5,'5','0000-00-00 00:00:00','\n'),(1306,'Prey Totueng',4,1,14,5,'6','0000-00-00 00:00:00','\n'),(1307,'Svay Chrum',4,1,14,5,'7','0000-00-00 00:00:00','\n'),(1308,'Trapeang Srae',4,1,14,5,'8','0000-00-00 00:00:00','\n'),(1309,'Angkor Angk',4,1,14,6,'1','0000-00-00 00:00:00','\n'),(1310,'Kampong Prasat',4,1,14,6,'2','0000-00-00 00:00:00','\n'),(1311,'Kaoh Chek',4,1,14,6,'3','0000-00-00 00:00:00','\n'),(1312,'Kaoh Roka',4,1,14,6,'4','0000-00-00 00:00:00','\n'),(1313,'Kaoh Sampov',4,1,14,6,'5','0000-00-00 00:00:00','\n'),(1314,'Krang Ta Yang',4,1,14,6,'6','0000-00-00 00:00:00','\n'),(1315,'Preaek Krabau',4,1,14,6,'7','0000-00-00 00:00:00','\n'),(1316,'Preaek Sambuor',4,1,14,6,'8','0000-00-00 00:00:00','\n'),(1317,'Ruessei Srok',4,1,14,6,'9','0000-00-00 00:00:00','\n'),(1318,'Svay Phluoh',4,1,14,6,'10','0000-00-00 00:00:00','\n'),(1319,'Ba Baong',4,1,14,7,'1','0000-00-00 00:00:00','\n'),(1320,'Banlich Prasat',4,1,14,7,'2','0000-00-00 00:00:00','\n'),(1321,'Neak Loeang',4,1,14,7,'3','0000-00-00 00:00:00','\n'),(1322,'Peam Mean Chey',4,1,14,7,'4','0000-00-00 00:00:00','\n'),(1323,'Peam Ro',4,1,14,7,'5','0000-00-00 00:00:00','\n'),(1324,'Preaek Khsay Ka',4,1,14,7,'6','0000-00-00 00:00:00','\n'),(1325,'Preaek Khsay Kha',4,1,14,7,'7','0000-00-00 00:00:00','\n'),(1326,'Preaek  Kandieng',4,1,14,7,'8','0000-00-00 00:00:00','\n'),(1327,'Kampong Popil',4,1,14,8,'1','0000-00-00 00:00:00','\n'),(1328,'Kanhcham',4,1,14,8,'2','0000-00-00 00:00:00','\n'),(1329,'Kampong Prang',4,1,14,8,'3','0000-00-00 00:00:00','\n'),(1330,'Kampong Ruessei',4,1,14,8,'4','0000-00-00 00:00:00','\n'),(1331,'Mesa Prachan',4,1,14,8,'5','0000-00-00 00:00:00','\n'),(1332,'Preaek Ta Sar',4,1,14,8,'6','0000-00-00 00:00:00','\n'),(1333,'Prey Pnov',4,1,14,8,'7','0000-00-00 00:00:00','\n'),(1334,'Prey Sniet',4,1,14,8,'8','0000-00-00 00:00:00','\n'),(1335,'Prey Sralet',4,1,14,8,'9','0000-00-00 00:00:00','\n'),(1336,'Reab',4,1,14,8,'10','0000-00-00 00:00:00','\n'),(1337,'Roka',4,1,14,8,'11','0000-00-00 00:00:00','\n'),(1338,'Angkor Reach',4,1,14,9,'1','0000-00-00 00:00:00','\n'),(1339,'Banteay Chakrei',4,1,14,9,'2','0000-00-00 00:00:00','\n'),(1340,'Boeng Daol',4,1,14,9,'3','0000-00-00 00:00:00','\n'),(1341,'Chey Kampok',4,1,14,9,'4','0000-00-00 00:00:00','\n'),(1342,'Kampong Soeng',4,1,14,9,'5','0000-00-00 00:00:00','\n'),(1343,'Krang Svay',4,1,14,9,'6','0000-00-00 00:00:00','\n'),(1344,'Lvea',4,1,14,9,'7','0000-00-00 00:00:00','\n'),(1345,'Preah Sdach',4,1,14,9,'8','0000-00-00 00:00:00','\n'),(1346,'Reathor',4,1,14,9,'9','0000-00-00 00:00:00','\n'),(1347,'Rumchek',4,1,14,9,'10','0000-00-00 00:00:00','\n'),(1348,'Sena Reach Otdam',4,1,14,9,'11','0000-00-00 00:00:00','\n'),(1349,'Angkor Tret',4,1,14,10,'1','0000-00-00 00:00:00','\n'),(1350,'Chea Khlang',4,1,14,10,'2','0000-00-00 00:00:00','\n'),(1351,'Chrey',4,1,14,10,'3','0000-00-00 00:00:00','\n'),(1352,'Damrei Puon',4,1,14,10,'4','0000-00-00 00:00:00','\n'),(1353,'Me Bon',4,1,14,10,'5','0000-00-00 00:00:00','\n'),(1354,'Pean Roung',4,1,14,10,'6','0000-00-00 00:00:00','\n'),(1355,'Popueus',4,1,14,10,'7','0000-00-00 00:00:00','\n'),(1356,'Prey Khla',4,1,14,10,'8','0000-00-00 00:00:00','\n'),(1357,'Samraong',4,1,14,10,'9','0000-00-00 00:00:00','\n'),(1358,'Svay Antor',4,1,14,10,'10','0000-00-00 00:00:00','\n'),(1359,'Tuek Thla',4,1,14,10,'11','0000-00-00 00:00:00','\n'),(1360,'Baray',4,1,14,11,'1','0000-00-00 00:00:00','\n'),(1361,'Cheung Tuek',4,1,14,11,'2','0000-00-00 00:00:00','\n'),(1362,'Kampong Leav',4,1,14,11,'3','0000-00-00 00:00:00','\n'),(1363,'Pou Rieng',4,1,14,11,'4','0000-00-00 00:00:00','\n'),(1364,'Preaek Anteah',4,1,14,11,'5','0000-00-00 00:00:00','\n'),(1365,'Preaek chrey',4,1,14,11,'6','0000-00-00 00:00:00','\n'),(1366,'Preaek Kanlaong',4,1,14,11,'7','0000-00-00 00:00:00','\n'),(1367,'Ta Kao',4,1,14,11,'8','0000-00-00 00:00:00','\n'),(1368,'Ampil Krau',4,1,14,12,'1','0000-00-00 00:00:00','\n'),(1369,'Chrey Khmum',4,1,14,12,'2','0000-00-00 00:00:00','\n'),(1370,'Lve',4,1,14,12,'3','0000-00-00 00:00:00','\n'),(1371,'Pnaov Ti Muoy',4,1,14,12,'4','0000-00-00 00:00:00','\n'),(1372,'Pnov Ti Pir',4,1,14,12,'5','0000-00-00 00:00:00','\n'),(1373,'Pou Ti',4,1,14,12,'6','0000-00-00 00:00:00','\n'),(1374,'Preaek Changkran',4,1,14,12,'7','0000-00-00 00:00:00','\n'),(1375,'Prey Daeum Thnoeng',4,1,14,12,'8','0000-00-00 00:00:00','\n'),(1376,'Prey Tueng',4,1,14,12,'9','0000-00-00 00:00:00','\n'),(1377,'Rumlech',4,1,14,12,'10','0000-00-00 00:00:00','\n'),(1378,'Ruessei Sanh',4,1,14,12,'11','0000-00-00 00:00:00','\n'),(1379,'Boeng Bat Kandaol',4,1,15,1,'1','0000-00-00 00:00:00','\n'),(1380,'Boeng Khnar',4,1,15,1,'2','0000-00-00 00:00:00','\n'),(1381,'Khnar Totueng',4,1,15,1,'3','0000-00-00 00:00:00','\n'),(1382,'Me Tuek',4,1,15,1,'4','0000-00-00 00:00:00','\n'),(1383,'Ou Ta Paong',4,1,15,1,'5','0000-00-00 00:00:00','\n'),(1384,'Rumlech',4,1,15,1,'6','0000-00-00 00:00:00','\n'),(1385,'Snam Preah',4,1,15,1,'7','0000-00-00 00:00:00','\n'),(1386,'Svay Doun Kaev',4,1,15,1,'8','0000-00-00 00:00:00','\n'),(1387,'Ta Lou',4,1,15,1,'9','0000-00-00 00:00:00','\n'),(1388,'Trapeang Chong',4,1,15,1,'10','0000-00-00 00:00:00','\n'),(1389,'Anlong Vil',4,1,15,2,'1','0000-00-00 00:00:00','\n'),(1390,'Banteay Dei',4,1,15,2,'2','0000-00-00 00:00:00','\n'),(1391,'Kandieng',4,1,15,2,'3','0000-00-00 00:00:00','\n'),(1392,'Kanhchor',4,1,15,2,'4','0000-00-00 00:00:00','\n'),(1393,'Rang Teal',4,1,15,2,'5','0000-00-00 00:00:00','\n'),(1394,'Srae Sdok',4,1,15,2,'6','0000-00-00 00:00:00','\n'),(1395,'Svay Luong',4,1,15,2,'7','0000-00-00 00:00:00','\n'),(1396,'Sya',4,1,15,2,'8','0000-00-00 00:00:00','\n'),(1397,'Veal',4,1,15,2,'9','0000-00-00 00:00:00','\n'),(1398,'Anlong Tnaot',4,1,15,3,'1','0000-00-00 00:00:00','\n'),(1399,'Ansa Chambak',4,1,15,3,'2','0000-00-00 00:00:00','\n'),(1400,'Boeng Kantuot',4,1,15,3,'3','0000-00-00 00:00:00','\n'),(1401,'Chheu Tom',4,1,15,3,'4','0000-00-00 00:00:00','\n'),(1402,'Kampong Luong',4,1,15,3,'5','0000-00-00 00:00:00','\n'),(1403,'Kampong Pou',4,1,15,3,'6','0000-00-00 00:00:00','\n'),(1404,'Kbal Trach',4,1,15,3,'7','0000-00-00 00:00:00','\n'),(1405,'Ou Sandan',4,1,15,3,'8','0000-00-00 00:00:00','\n'),(1406,'Sna Ansa',4,1,15,3,'9','0000-00-00 00:00:00','\n'),(1407,'Svay Sa',4,1,15,3,'10','0000-00-00 00:00:00','\n'),(1408,'Tnaot Chum',4,1,15,3,'11','0000-00-00 00:00:00','\n'),(1409,'Bak Chenhchien',4,1,15,4,'1','0000-00-00 00:00:00','\n'),(1410,'Leach',4,1,15,4,'2','0000-00-00 00:00:00','\n'),(1411,'Phteah Rung',4,1,15,4,'3','0000-00-00 00:00:00','\n'),(1412,'Prongil',4,1,15,4,'4','0000-00-00 00:00:00','\n'),(1413,'Rokat',4,1,15,4,'5','0000-00-00 00:00:00','\n'),(1414,'Santreae',4,1,15,4,'6','0000-00-00 00:00:00','\n'),(1415,'Samraong',4,1,15,4,'7','0000-00-00 00:00:00','\n'),(1416,'Chamraeun Phal',4,1,15,5,'1','0000-00-00 00:00:00','\n'),(1417,'Kaoh Chum',4,1,15,5,'2','0000-00-00 00:00:00','\n'),(1418,'Lolok Sa',4,1,15,5,'3','0000-00-00 00:00:00','\n'),(1419,'Phteah Prey',4,1,15,5,'4','0000-00-00 00:00:00','\n'),(1420,'Prey Gni',4,1,15,5,'5','0000-00-00 00:00:00','\n'),(1421,'Roleab',4,1,15,5,'6','0000-00-00 00:00:00','\n'),(1422,'Svay At',4,1,15,5,'7','0000-00-00 00:00:00','\n'),(1423,'Krapeu Pir',4,1,15,6,'1','0000-00-00 00:00:00','\n'),(1424,'Pramaoy',4,1,15,6,'2','0000-00-00 00:00:00','\n'),(1425,'Ou Saom',4,1,15,6,'3','0000-00-00 00:00:00','\n'),(1426,'Anlong Reap',4,1,15,6,'4','0000-00-00 00:00:00','\n'),(1427,'Thmar Da',4,1,15,6,'5','0000-00-00 00:00:00','\n'),(1428,'Malik',4,1,16,1,'1','0000-00-00 00:00:00','\n'),(1429,'Nhang',4,1,16,1,'3','0000-00-00 00:00:00','\n'),(1430,'Ta Lav',4,1,16,1,'4','0000-00-00 00:00:00','\n'),(1431,'Kachanh',4,1,16,2,'1','0000-00-00 00:00:00','\n'),(1432,'Labansiek',4,1,16,2,'2','0000-00-00 00:00:00','\n'),(1433,'Yeak Laom',4,1,16,2,'3','0000-00-00 00:00:00','\n'),(1434,'Kak',4,1,16,3,'1','0000-00-00 00:00:00','\n'),(1435,'Ke Chong',4,1,16,3,'2','0000-00-00 00:00:00','\n'),(1436,'Laminh',4,1,16,3,'3','0000-00-00 00:00:00','\n'),(1437,'Lung Khung',4,1,16,3,'4','0000-00-00 00:00:00','\n'),(1438,'Saeung',4,1,16,3,'5','0000-00-00 00:00:00','\n'),(1439,'Ting Chak',4,1,16,3,'6','0000-00-00 00:00:00','\n'),(1440,'Serei Mongkol',4,1,16,4,'1','0000-00-00 00:00:00','\n'),(1441,'Srae Angkrong',4,1,16,4,'2','0000-00-00 00:00:00','\n'),(1442,'Ta Ang',4,1,16,4,'3','0000-00-00 00:00:00','\n'),(1443,'Toen',4,1,16,4,'4','0000-00-00 00:00:00','\n'),(1444,'Trapeang Chres',4,1,16,4,'5','0000-00-00 00:00:00','\n'),(1445,'Trapeang Kraham',4,1,16,4,'6','0000-00-00 00:00:00','\n'),(1446,'Chey Otdam',4,1,16,5,'1','0000-00-00 00:00:00','\n'),(1447,'Ka Kaeng',4,1,16,5,'2','0000-00-00 00:00:00','\n'),(1448,'La Bang Muoy',4,1,16,5,'3','0000-00-00 00:00:00','\n'),(1449,'La Bang Pir',4,1,16,5,'4','0000-00-00 00:00:00','\n'),(1450,'Ba Tang',4,1,16,5,'5','0000-00-00 00:00:00','\n'),(1451,'Seda',4,1,16,5,'6','0000-00-00 00:00:00','\n'),(1452,'Cha Ung',4,1,16,6,'1','0000-00-00 00:00:00','\n'),(1453,'Pouy',4,1,16,6,'2','0000-00-00 00:00:00','\n'),(1454,'Aekakpheap',4,1,16,6,'3','0000-00-00 00:00:00','\n'),(1455,'Kalai',4,1,16,6,'4','0000-00-00 00:00:00','\n'),(1456,'Ou Chum',4,1,16,6,'5','0000-00-00 00:00:00','\n'),(1457,'Sameakki',4,1,16,6,'6','0000-00-00 00:00:00','\n'),(1458,'Lak',4,1,16,6,'7','0000-00-00 00:00:00','\n'),(1459,'Bar Kham',4,1,16,7,'1','0000-00-00 00:00:00','\n'),(1460,'Lum Choar',4,1,16,7,'2','0000-00-00 00:00:00','\n'),(1461,'Pak Nhai',4,1,16,7,'3','0000-00-00 00:00:00','\n'),(1462,'Pate',4,1,16,7,'4','0000-00-00 00:00:00','\n'),(1463,'Sesant',4,1,16,7,'5','0000-00-00 00:00:00','\n'),(1464,'Saom Thum',4,1,16,7,'6','0000-00-00 00:00:00','\n'),(1465,'Ya Tung',4,1,16,7,'7','0000-00-00 00:00:00','\n'),(1466,'Ta Veaeng Leu',4,1,16,8,'1','0000-00-00 00:00:00','\n'),(1467,'Ta Veaeng Kraom',4,1,16,8,'2','0000-00-00 00:00:00','\n'),(1468,'Pong',4,1,16,9,'1','0000-00-00 00:00:00','\n'),(1469,'Hat Pok',4,1,16,9,'2','0000-00-00 00:00:00','\n'),(1470,'Ka Choun',4,1,16,9,'3','0000-00-00 00:00:00','\n'),(1471,'Kaoh Pang',4,1,16,9,'4','0000-00-00 00:00:00','\n'),(1472,'Kaoh Peak',4,1,16,9,'5','0000-00-00 00:00:00','\n'),(1473,'Kok Lak',4,1,16,9,'6','0000-00-00 00:00:00','\n'),(1474,'Pak Kalan',4,1,16,9,'7','0000-00-00 00:00:00','\n'),(1475,'Phnum Kok',4,1,16,9,'8','0000-00-00 00:00:00','\n'),(1476,'Veun Sai',4,1,16,9,'9','0000-00-00 00:00:00','\n'),(1477,'Char Chhuk',4,1,17,1,'1','0000-00-00 00:00:00','\n'),(1478,'Doun Peaeng',4,1,17,1,'2','0000-00-00 00:00:00','\n'),(1479,'Kouk Doung',4,1,17,1,'3','0000-00-00 00:00:00','\n'),(1480,'Koul',4,1,17,1,'4','0000-00-00 00:00:00','\n'),(1481,'Nokor Pheas',4,1,17,1,'5','0000-00-00 00:00:00','\n'),(1482,'Srae Khvav',4,1,17,1,'6','0000-00-00 00:00:00','\n'),(1483,'Ta Saom',4,1,17,1,'7','0000-00-00 00:00:00','\n'),(1484,'Chob Ta Trav',4,1,17,2,'1','0000-00-00 00:00:00','\n'),(1485,'Leang Dai',4,1,17,2,'2','0000-00-00 00:00:00','\n'),(1486,'Peak Snaeng',4,1,17,2,'3','0000-00-00 00:00:00','\n'),(1487,'Svay Chek',4,1,17,2,'4','0000-00-00 00:00:00','\n'),(1488,'Khnar Sanday',4,1,17,3,'1','0000-00-00 00:00:00','\n'),(1489,'Khun Ream',4,1,17,3,'2','0000-00-00 00:00:00','\n'),(1490,'Preak Dak',4,1,17,3,'3','0000-00-00 00:00:00','\n'),(1491,'Rumchek',4,1,17,3,'4','0000-00-00 00:00:00','\n'),(1492,'Run Ta Aek',4,1,17,3,'5','0000-00-00 00:00:00','\n'),(1493,'Tbaeng',4,1,17,3,'6','0000-00-00 00:00:00','\n'),(1494,'Anlong Samnar',4,1,17,4,'1','0000-00-00 00:00:00','\n'),(1495,'Chi Kraeng',4,1,17,4,'2','0000-00-00 00:00:00','\n'),(1496,'Kampong Kdei',4,1,17,4,'3','0000-00-00 00:00:00','\n'),(1497,'Khvav',4,1,17,4,'4','0000-00-00 00:00:00','\n'),(1498,'Kouk Thlok Kraom',4,1,17,4,'5','0000-00-00 00:00:00','\n'),(1499,'Kouk Thlok Leu',4,1,17,4,'6','0000-00-00 00:00:00','\n'),(1500,'Lveaeng Ruessei',4,1,17,4,'7','0000-00-00 00:00:00','\n'),(1501,'Pongro Kraom',4,1,17,4,'8','0000-00-00 00:00:00','\n'),(1502,'Pongro Leu',4,1,17,4,'9','0000-00-00 00:00:00','\n'),(1503,'Ruessei Lok',4,1,17,4,'10','0000-00-00 00:00:00','\n'),(1504,'Sangvaeuy',4,1,17,4,'11','0000-00-00 00:00:00','\n'),(1505,'Spean Tnaot',4,1,17,4,'12','0000-00-00 00:00:00','\n'),(1506,'Chonloas Dai',4,1,17,5,'1','0000-00-00 00:00:00','\n'),(1507,'Kampong Thkov',4,1,17,5,'2','0000-00-00 00:00:00','\n'),(1508,'Kralanh',4,1,17,5,'3','0000-00-00 00:00:00','\n'),(1509,'Krouch Kor',4,1,17,5,'4','0000-00-00 00:00:00','\n'),(1510,'Roung Kou',4,1,17,5,'5','0000-00-00 00:00:00','\n'),(1511,'Sambuor',4,1,17,5,'6','0000-00-00 00:00:00','\n'),(1512,'Saen Sokh',4,1,17,5,'7','0000-00-00 00:00:00','\n'),(1513,'Snol',4,1,17,5,'8','0000-00-00 00:00:00','\n'),(1514,'Sranal',4,1,17,5,'9','0000-00-00 00:00:00','\n'),(1515,'Ta An',4,1,17,5,'10','0000-00-00 00:00:00','\n'),(1516,'Sasar Sdam',4,1,17,6,'1','0000-00-00 00:00:00','\n'),(1517,'Doun Kaev',4,1,17,6,'2','0000-00-00 00:00:00','\n'),(1518,'Kdai Run',4,1,17,6,'3','0000-00-00 00:00:00','\n'),(1519,'Kaev Poar',4,1,17,6,'4','0000-00-00 00:00:00','\n'),(1520,'Khnat',4,1,17,6,'5','0000-00-00 00:00:00','\n'),(1521,'Krabei Riel',4,1,17,6,'6','0000-00-00 00:00:00','\n'),(1522,'Lvea',4,1,17,6,'7','0000-00-00 00:00:00','\n'),(1523,'Mukh Paen',4,1,17,6,'8','0000-00-00 00:00:00','\n'),(1524,'Pou Treay',4,1,17,6,'9','0000-00-00 00:00:00','\n'),(1525,'Puok',4,1,17,6,'10','0000-00-00 00:00:00','\n'),(1526,'Prey Chruk',4,1,17,6,'11','0000-00-00 00:00:00','\n'),(1527,'Reul',4,1,17,6,'12','0000-00-00 00:00:00','\n'),(1528,'Samraong Yea',4,1,17,6,'13','0000-00-00 00:00:00','\n'),(1529,'Tuek Vil',4,1,17,6,'14','0000-00-00 00:00:00','\n'),(1530,'Trei Nhoar',4,1,17,6,'15','0000-00-00 00:00:00','\n'),(1531,'Yeang',4,1,17,6,'16','0000-00-00 00:00:00','\n'),(1532,'Ampil',4,1,17,7,'1','0000-00-00 00:00:00','\n'),(1533,'Bakong',4,1,17,7,'2','0000-00-00 00:00:00','\n'),(1534,'Ballang',4,1,17,7,'3','0000-00-00 00:00:00','\n'),(1535,'Kampong Phluk',4,1,17,7,'4','0000-00-00 00:00:00','\n'),(1536,'Kantreang',4,1,17,7,'5','0000-00-00 00:00:00','\n'),(1537,'Kandaek',4,1,17,7,'6','0000-00-00 00:00:00','\n'),(1538,'Mean Chey',4,1,17,7,'7','0000-00-00 00:00:00','\n'),(1539,'Roluos',4,1,17,7,'8','0000-00-00 00:00:00','\n'),(1540,'Trapeang Thum',4,1,17,7,'9','0000-00-00 00:00:00','\n'),(1541,'Sla Kram',4,1,17,8,'1','0000-00-00 00:00:00','\n'),(1542,'Svay Dangkum',4,1,17,8,'2','0000-00-00 00:00:00','\n'),(1543,'Kouk Chak',4,1,17,8,'3','0000-00-00 00:00:00','\n'),(1544,'Sala Kamraeuk',4,1,17,8,'4','0000-00-00 00:00:00','\n'),(1545,'Nokor Thum',4,1,17,8,'5','0000-00-00 00:00:00','\n'),(1546,'Chreav',4,1,17,8,'6','0000-00-00 00:00:00','\n'),(1547,'Chong Khnies',4,1,17,8,'7','0000-00-00 00:00:00','\n'),(1548,'Sambour',4,1,17,8,'8','0000-00-00 00:00:00','\n'),(1549,'Siem Reap',4,1,17,8,'9','0000-00-00 00:00:00','\n'),(1550,'Srangae',4,1,17,8,'10','0000-00-00 00:00:00','\n'),(1551,'Chan Sar',4,1,17,9,'1','0000-00-00 00:00:00','\n'),(1552,'Dam Daek',4,1,17,9,'2','0000-00-00 00:00:00','\n'),(1553,'Dan Run',4,1,17,9,'3','0000-00-00 00:00:00','\n'),(1554,'Kampong Khleang',4,1,17,9,'4','0000-00-00 00:00:00','\n'),(1555,'Kien Sangkae',4,1,17,9,'5','0000-00-00 00:00:00','\n'),(1556,'Khchas',4,1,17,9,'6','0000-00-00 00:00:00','\n'),(1557,'Khnar Pou',4,1,17,9,'7','0000-00-00 00:00:00','\n'),(1558,'Popel',4,1,17,9,'8','0000-00-00 00:00:00','\n'),(1559,'Samraong',4,1,17,9,'9','0000-00-00 00:00:00','\n'),(1560,'Ta Yaek',4,1,17,9,'10','0000-00-00 00:00:00','\n'),(1561,'Chrouy Neang Nguon',4,1,17,10,'1','0000-00-00 00:00:00','\n'),(1562,'Klang Hay',4,1,17,10,'2','0000-00-00 00:00:00','\n'),(1563,'Tram Sasar',4,1,17,10,'3','0000-00-00 00:00:00','\n'),(1564,'Moung',4,1,17,10,'4','0000-00-00 00:00:00','\n'),(1565,'Prei',4,1,17,10,'5','0000-00-00 00:00:00','\n'),(1566,'Slaeng Spean',4,1,17,10,'6','0000-00-00 00:00:00','\n'),(1567,'Boeng Mealea',4,1,17,11,'1','0000-00-00 00:00:00','\n'),(1568,'Kantuot',4,1,17,11,'2','0000-00-00 00:00:00','\n'),(1569,'Khnang  Phnum',4,1,17,11,'3','0000-00-00 00:00:00','\n'),(1570,'Svay Leu',4,1,17,11,'4','0000-00-00 00:00:00','\n'),(1571,'Ta Siem',4,1,17,11,'5','0000-00-00 00:00:00','\n'),(1572,'Prasat',4,1,17,12,'1','0000-00-00 00:00:00','\n'),(1573,'Lvea Krang',4,1,17,12,'2','0000-00-00 00:00:00','\n'),(1574,'Srae Nouy',4,1,17,12,'3','0000-00-00 00:00:00','\n'),(1575,'Svay Sa',4,1,17,12,'4','0000-00-00 00:00:00','\n'),(1576,'Varin',4,1,17,12,'5','0000-00-00 00:00:00','\n'),(1577,'Sangkat Muoy',4,1,18,1,'1','0000-00-00 00:00:00','\n'),(1578,'Sangkat Pir',4,1,18,1,'2','0000-00-00 00:00:00','\n'),(1579,'Sangkat Bei',4,1,18,1,'3','0000-00-00 00:00:00','\n'),(1580,'Sangkat Buon',4,1,18,1,'4','0000-00-00 00:00:00','\n'),(1581,'Kaoh Rung',4,1,18,1,'5','0000-00-00 00:00:00','\n'),(1582,'Andoung Thma',4,1,18,2,'1','0000-00-00 00:00:00','\n'),(1583,'Boeng Ta Prum',4,1,18,2,'2','0000-00-00 00:00:00','\n'),(1584,'Bet Trang',4,1,18,2,'3','0000-00-00 00:00:00','\n'),(1585,'Cheung Kou',4,1,18,2,'4','0000-00-00 00:00:00','\n'),(1586,'Ou Chrov',4,1,18,2,'5','0000-00-00 00:00:00','\n'),(1587,'Ou Oknha Heng',4,1,18,2,'6','0000-00-00 00:00:00','\n'),(1588,'Prey Nob',4,1,18,2,'7','0000-00-00 00:00:00','\n'),(1589,'Ream',4,1,18,2,'8','0000-00-00 00:00:00','\n'),(1590,'Sameakki',4,1,18,2,'9','0000-00-00 00:00:00','\n'),(1591,'Samrong',4,1,18,2,'10','0000-00-00 00:00:00','\n'),(1592,'Tuek Lak',4,1,18,2,'11','0000-00-00 00:00:00','\n'),(1593,'Tuek Thla',4,1,18,2,'12','0000-00-00 00:00:00','\n'),(1594,'Tuol Toetueng',4,1,18,2,'13','0000-00-00 00:00:00','\n'),(1595,'Veal Renh',4,1,18,2,'14','0000-00-00 00:00:00','\n'),(1596,'Kampenh',4,1,18,3,'1','0000-00-00 00:00:00','\n'),(1597,'Ou Treh',4,1,18,3,'2','0000-00-00 00:00:00','\n'),(1598,'Tumnob Rolok',4,1,18,3,'3','0000-00-00 00:00:00','\n'),(1599,'Kampun',4,1,19,1,'1','0000-00-00 00:00:00','\n'),(1600,'Kbal Romeas',4,1,19,1,'2','0000-00-00 00:00:00','\n'),(1601,'Phluk',4,1,19,1,'3','0000-00-00 00:00:00','\n'),(1602,'Samkhuoy',4,1,19,1,'4','0000-00-00 00:00:00','\n'),(1603,'Sdau',4,1,19,1,'5','0000-00-00 00:00:00','\n'),(1604,'Srae Kor',4,1,19,1,'6','0000-00-00 00:00:00','\n'),(1605,'Ta Lat',4,1,19,1,'7','0000-00-00 00:00:00','\n'),(1606,'Kaoh Preah',4,1,19,2,'1','0000-00-00 00:00:00','\n'),(1607,'Kaoh Sampeay',4,1,19,2,'2','0000-00-00 00:00:00','\n'),(1608,'Kaoh Sralay',4,1,19,2,'3','0000-00-00 00:00:00','\n'),(1609,'Ou Mreah',4,1,19,2,'4','0000-00-00 00:00:00','\n'),(1610,'Ou Ruessei Kandal',4,1,19,2,'5','0000-00-00 00:00:00','\n'),(1611,'Siem Bouk',4,1,19,2,'6','0000-00-00 00:00:00','\n'),(1612,'Srae Krasang',4,1,19,2,'7','0000-00-00 00:00:00','\n'),(1613,'Preaek Meas',4,1,19,3,'1','0000-00-00 00:00:00','\n'),(1614,'Sekong',4,1,19,3,'2','0000-00-00 00:00:00','\n'),(1615,'Santepheap',4,1,19,3,'3','0000-00-00 00:00:00','\n'),(1616,'Srae Sambour',4,1,19,3,'4','0000-00-00 00:00:00','\n'),(1617,'Thma Kaev',4,1,19,3,'5','0000-00-00 00:00:00','\n'),(1618,'Stueng Traeng',4,1,19,4,'1','0000-00-00 00:00:00','\n'),(1619,'Srah Ruessei',4,1,19,4,'2','0000-00-00 00:00:00','\n'),(1620,'Preah Bat',4,1,19,4,'3','0000-00-00 00:00:00','\n'),(1621,'Sameakki',4,1,19,4,'4','0000-00-00 00:00:00','\n'),(1622,'Anlong Phe',4,1,19,5,'1','0000-00-00 00:00:00','\n'),(1623,'Chamkar Leu',4,1,19,5,'2','0000-00-00 00:00:00','\n'),(1624,'Kang Cham',4,1,19,5,'3','0000-00-00 00:00:00','\n'),(1625,'Kaoh Snaeng',4,1,19,5,'4','0000-00-00 00:00:00','\n'),(1626,'Anlong Chrey',4,1,19,5,'5','0000-00-00 00:00:00','\n'),(1627,'Ou Rey',4,1,19,5,'6','0000-00-00 00:00:00','\n'),(1628,'Ou Svay',4,1,19,5,'7','0000-00-00 00:00:00','\n'),(1629,'Preah Rumkel',4,1,19,5,'8','0000-00-00 00:00:00','\n'),(1630,'Samang',4,1,19,5,'9','0000-00-00 00:00:00','\n'),(1631,'Srae Ruessei',4,1,19,5,'10','0000-00-00 00:00:00','\n'),(1632,'Thala Barivat',4,1,19,5,'11','0000-00-00 00:00:00','\n'),(1633,'Bati',4,1,20,1,'1','0000-00-00 00:00:00','\n'),(1634,'Bavet',4,1,20,1,'2','0000-00-00 00:00:00','\n'),(1635,'Chantrea',4,1,20,1,'3','0000-00-00 00:00:00','\n'),(1636,'Chres',4,1,20,1,'4','0000-00-00 00:00:00','\n'),(1637,'Me Sa Thngak',4,1,20,1,'5','0000-00-00 00:00:00','\n'),(1638,'Prasat',4,1,20,1,'6','0000-00-00 00:00:00','\n'),(1639,'Prey Angkunh',4,1,20,1,'7','0000-00-00 00:00:00','\n'),(1640,'Prey Kokir',4,1,20,1,'8','0000-00-00 00:00:00','\n'),(1641,'Samraong',4,1,20,1,'9','0000-00-00 00:00:00','\n'),(1642,'Tuol Sdei',4,1,20,1,'10','0000-00-00 00:00:00','\n'),(1643,'Banteay Krang',4,1,20,2,'1','0000-00-00 00:00:00','\n'),(1644,'Nhor',4,1,20,2,'2','0000-00-00 00:00:00','\n'),(1645,'Ksetr',4,1,20,2,'3','0000-00-00 00:00:00','\n'),(1646,'Preah Ponlea',4,1,20,2,'4','0000-00-00 00:00:00','\n'),(1647,'Prey Thum',4,1,20,2,'5','0000-00-00 00:00:00','\n'),(1648,'Reach Montir',4,1,20,2,'6','0000-00-00 00:00:00','\n'),(1649,'Samlei',4,1,20,2,'7','0000-00-00 00:00:00','\n'),(1650,'Samyaong',4,1,20,2,'8','0000-00-00 00:00:00','\n'),(1651,'Svay Ta Yean',4,1,20,2,'9','0000-00-00 00:00:00','\n'),(1652,'Svay Toea',4,1,20,2,'10','0000-00-00 00:00:00','\n'),(1653,'Thmei',4,1,20,2,'11','0000-00-00 00:00:00','\n'),(1654,'Tnaot',4,1,20,2,'12','0000-00-00 00:00:00','\n'),(1655,'Bos Mon',4,1,20,3,'1','0000-00-00 00:00:00','\n'),(1656,'Thmea',4,1,20,3,'2','0000-00-00 00:00:00','\n'),(1657,'Chak',4,1,20,3,'3','0000-00-00 00:00:00','\n'),(1658,'Chrung Popel',4,1,20,3,'4','0000-00-00 00:00:00','\n'),(1659,'Kampong Ampil',4,1,20,3,'5','0000-00-00 00:00:00','\n'),(1660,'Meun Chey',4,1,20,3,'6','0000-00-00 00:00:00','\n'),(1661,'Pong Tuek',4,1,20,3,'7','0000-00-00 00:00:00','\n'),(1662,'Sangkae',4,1,20,3,'8','0000-00-00 00:00:00','\n'),(1663,'Svay Chek',4,1,20,3,'9','0000-00-00 00:00:00','\n'),(1664,'Thnan Thnong',4,1,20,3,'10','0000-00-00 00:00:00','\n'),(1665,'Ampil',4,1,20,4,'1','0000-00-00 00:00:00','\n'),(1666,'Andoung Pou',4,1,20,4,'2','0000-00-00 00:00:00','\n'),(1667,'Andoung Trabaek',4,1,20,4,'3','0000-00-00 00:00:00','\n'),(1668,'Angk Prasrae',4,1,20,4,'4','0000-00-00 00:00:00','\n'),(1669,'Chantrei',4,1,20,4,'5','0000-00-00 00:00:00','\n'),(1670,'Chrey Thum',4,1,20,4,'6','0000-00-00 00:00:00','\n'),(1671,'Doung',4,1,20,4,'7','0000-00-00 00:00:00','\n'),(1672,'Kampong Trach',4,1,20,4,'8','0000-00-00 00:00:00','\n'),(1673,'Kokir',4,1,20,4,'9','0000-00-00 00:00:00','\n'),(1674,'Krasang',4,1,20,4,'10','0000-00-00 00:00:00','\n'),(1675,'Mukh Da',4,1,20,4,'11','0000-00-00 00:00:00','\n'),(1676,'Mream',4,1,20,4,'12','0000-00-00 00:00:00','\n'),(1677,'Sambuor',4,1,20,4,'13','0000-00-00 00:00:00','\n'),(1678,'Sambatt Mean Chey',4,1,20,4,'14','0000-00-00 00:00:00','\n'),(1679,'Trapeng Sdau',4,1,20,4,'15','0000-00-00 00:00:00','\n'),(1680,'Tros',4,1,20,4,'16','0000-00-00 00:00:00','\n'),(1681,'Angk Ta Sou',4,1,20,5,'1','0000-00-00 00:00:00','\n'),(1682,'Basak',4,1,20,5,'2','0000-00-00 00:00:00','\n'),(1683,'Chambak',4,1,20,5,'3','0000-00-00 00:00:00','\n'),(1684,'Chamlang',4,1,20,5,'4','0000-00-00 00:00:00','\n'),(1685,'Ta Suos',4,1,20,5,'5','0000-00-00 00:00:00','\n'),(1686,'Chek',4,1,20,5,'6','0000-00-00 00:00:00','\n'),(1687,'Chheu Teal',4,1,20,5,'7','0000-00-00 00:00:00','\n'),(1688,'Doun Sa',4,1,20,5,'8','0000-00-00 00:00:00','\n'),(1689,'Kouk Pring',4,1,20,5,'9','0000-00-00 00:00:00','\n'),(1690,'Kraol Kou',4,1,20,5,'10','0000-00-00 00:00:00','\n'),(1691,'Kruos',4,1,20,5,'11','0000-00-00 00:00:00','\n'),(1692,'Pouthi Reach',4,1,20,5,'12','0000-00-00 00:00:00','\n'),(1693,'Svay Angk',4,1,20,5,'13','0000-00-00 00:00:00','\n'),(1694,'Svay Chrum',4,1,20,5,'14','0000-00-00 00:00:00','\n'),(1695,'Svay Thum',4,1,20,5,'15','0000-00-00 00:00:00','\n'),(1696,'Svay Yea',4,1,20,5,'16','0000-00-00 00:00:00','\n'),(1697,'Thlok',4,1,20,5,'17','0000-00-00 00:00:00','\n'),(1698,'Svay Rieng',4,1,20,6,'1','0000-00-00 00:00:00','\n'),(1699,'Prey Chhlak',4,1,20,6,'2','0000-00-00 00:00:00','\n'),(1700,'Koy Tabaek',4,1,20,6,'3','0000-00-00 00:00:00','\n'),(1701,'Pou Ta Hao',4,1,20,6,'4','0000-00-00 00:00:00','\n'),(1702,'Chrak Mtes',4,1,20,7,'1','0000-00-00 00:00:00','\n'),(1703,'Kokir Saom',4,1,20,7,'2','0000-00-00 00:00:00','\n'),(1704,'Kandieng Reay',4,1,20,7,'3','0000-00-00 00:00:00','\n'),(1705,'Monourom',4,1,20,7,'4','0000-00-00 00:00:00','\n'),(1706,'Popeaek',4,1,20,7,'5','0000-00-00 00:00:00','\n'),(1707,'Prey Ta Ei',4,1,20,7,'6','0000-00-00 00:00:00','\n'),(1708,'Prasout',4,1,20,7,'7','0000-00-00 00:00:00','\n'),(1709,'Romeang Thkaol',4,1,20,7,'8','0000-00-00 00:00:00','\n'),(1710,'Sambuor',4,1,20,7,'9','0000-00-00 00:00:00','\n'),(1711,'Sangkhoar',4,1,20,7,'10','0000-00-00 00:00:00','\n'),(1712,'Svay Rompea',4,1,20,7,'11','0000-00-00 00:00:00','\n'),(1713,'Angkor Borei',4,1,21,1,'1','0000-00-00 00:00:00','\n'),(1714,'Ba Srae',4,1,21,1,'2','0000-00-00 00:00:00','\n'),(1715,'Kouk Thlok',4,1,21,1,'3','0000-00-00 00:00:00','\n'),(1716,'Ponley',4,1,21,1,'4','0000-00-00 00:00:00','\n'),(1717,'Preaek Phtoul',4,1,21,1,'5','0000-00-00 00:00:00','\n'),(1718,'Prey Phkoam',4,1,21,1,'6','0000-00-00 00:00:00','\n'),(1719,'Chambak',4,1,21,2,'1','0000-00-00 00:00:00','\n'),(1720,'Champei',4,1,21,2,'2','0000-00-00 00:00:00','\n'),(1721,'Doung',4,1,21,2,'3','0000-00-00 00:00:00','\n'),(1722,'Kandoeng',4,1,21,2,'4','0000-00-00 00:00:00','\n'),(1723,'Komar Reachea',4,1,21,2,'5','0000-00-00 00:00:00','\n'),(1724,'Krang Leav',4,1,21,2,'6','0000-00-00 00:00:00','\n'),(1725,'Krang Thnong',4,1,21,2,'7','0000-00-00 00:00:00','\n'),(1726,'Lumpong',4,1,21,2,'8','0000-00-00 00:00:00','\n'),(1727,'Pea Ream',4,1,21,2,'9','0000-00-00 00:00:00','\n'),(1728,'Pot Sar',4,1,21,2,'10','0000-00-00 00:00:00','\n'),(1729,'Souphy',4,1,21,2,'11','0000-00-00 00:00:00','\n'),(1730,'Tang Doung',4,1,21,2,'12','0000-00-00 00:00:00','\n'),(1731,'Tnaot',4,1,21,2,'13','0000-00-00 00:00:00','\n'),(1732,'Trapeang Krasang',4,1,21,2,'14','0000-00-00 00:00:00','\n'),(1733,'Trapeang Sab',4,1,21,2,'15','0000-00-00 00:00:00','\n'),(1734,'Bourei Cholsar',4,1,21,3,'1','0000-00-00 00:00:00','\n'),(1735,'Chey Chouk',4,1,21,3,'2','0000-00-00 00:00:00','\n'),(1736,'Doung Khpos',4,1,21,3,'3','0000-00-00 00:00:00','\n'),(1737,'Kampong Krasang',4,1,21,3,'4','0000-00-00 00:00:00','\n'),(1738,'Kouk Pou',4,1,21,3,'5','0000-00-00 00:00:00','\n'),(1739,'Angk Prasat',4,1,21,4,'1','0000-00-00 00:00:00','\n'),(1740,'Preah Bat Choan Chum',4,1,21,4,'2','0000-00-00 00:00:00','\n'),(1741,'Kamnab',4,1,21,4,'3','0000-00-00 00:00:00','\n'),(1742,'Kampeaeng',4,1,21,4,'4','0000-00-00 00:00:00','\n'),(1743,'Kiri Chong Kaoh',4,1,21,4,'5','0000-00-00 00:00:00','\n'),(1744,'Kouk Prech',4,1,21,4,'6','0000-00-00 00:00:00','\n'),(1745,'Phnum Den',4,1,21,4,'7','0000-00-00 00:00:00','\n'),(1746,'Prey Ampok',4,1,21,4,'8','0000-00-00 00:00:00','\n'),(1747,'Prey Rumdeng',4,1,21,4,'9','0000-00-00 00:00:00','\n'),(1748,'Ream Andaeuk',4,1,21,4,'10','0000-00-00 00:00:00','\n'),(1749,'Saom',4,1,21,4,'11','0000-00-00 00:00:00','\n'),(1750,'Ta Ou',4,1,21,4,'12','0000-00-00 00:00:00','\n'),(1751,'Krapum Chhuk',4,1,21,5,'1','0000-00-00 00:00:00','\n'),(1752,'Pech Sar',4,1,21,5,'2','0000-00-00 00:00:00','\n'),(1753,'Prey Khla',4,1,21,5,'3','0000-00-00 00:00:00','\n'),(1754,'Prey Yuthka',4,1,21,5,'4','0000-00-00 00:00:00','\n'),(1755,'Romenh',4,1,21,5,'5','0000-00-00 00:00:00','\n'),(1756,'Thlea Prachum',4,1,21,5,'6','0000-00-00 00:00:00','\n'),(1757,'Angkanh',4,1,21,6,'1','0000-00-00 00:00:00','\n'),(1758,'Ban Kam',4,1,21,6,'2','0000-00-00 00:00:00','\n'),(1759,'Champa',4,1,21,6,'3','0000-00-00 00:00:00','\n'),(1760,'Char',4,1,21,6,'4','0000-00-00 00:00:00','\n'),(1761,'Kampeaeng',4,1,21,6,'5','0000-00-00 00:00:00','\n'),(1762,'Kampong Reab',4,1,21,6,'6','0000-00-00 00:00:00','\n'),(1763,'Kdanh',4,1,21,6,'7','0000-00-00 00:00:00','\n'),(1764,'Pou Romchak',4,1,21,6,'8','0000-00-00 00:00:00','\n'),(1765,'Prey Kabbas',4,1,21,6,'9','0000-00-00 00:00:00','\n'),(1766,'Prey Lvea',4,1,21,6,'10','0000-00-00 00:00:00','\n'),(1767,'Prey Phdau',4,1,21,6,'11','0000-00-00 00:00:00','\n'),(1768,'Snao',4,1,21,6,'12','0000-00-00 00:00:00','\n'),(1769,'Tang Yab',4,1,21,6,'13','0000-00-00 00:00:00','\n'),(1770,'Boeng Tranh Khang Cheung',4,1,21,7,'1','0000-00-00 00:00:00','\n'),(1771,'Boeng Tranh Khang Tboung',4,1,21,7,'2','0000-00-00 00:00:00','\n'),(1772,'Cheung Kuon',4,1,21,7,'3','0000-00-00 00:00:00','\n'),(1773,'Chumreah Pen',4,1,21,7,'4','0000-00-00 00:00:00','\n'),(1774,'Khvav',4,1,21,7,'5','0000-00-00 00:00:00','\n'),(1775,'Lumchang',4,1,21,7,'6','0000-00-00 00:00:00','\n'),(1776,'Rovieng',4,1,21,7,'7','0000-00-00 00:00:00','\n'),(1777,'Samraong',4,1,21,7,'8','0000-00-00 00:00:00','\n'),(1778,'Soeng',4,1,21,7,'9','0000-00-00 00:00:00','\n'),(1779,'Sla',4,1,21,7,'10','0000-00-00 00:00:00','\n'),(1780,'Trea',4,1,21,7,'11','0000-00-00 00:00:00','\n'),(1781,'Baray',4,1,21,8,'1','0000-00-00 00:00:00','\n'),(1782,'Roka Knong',4,1,21,8,'2','0000-00-00 00:00:00','\n'),(1783,'Roka Krau',4,1,21,8,'3','0000-00-00 00:00:00','\n'),(1784,'Angk Ta Saom',4,1,21,9,'1','0000-00-00 00:00:00','\n'),(1785,'Cheang Tong',4,1,21,9,'2','0000-00-00 00:00:00','\n'),(1786,'Kus',4,1,21,9,'3','0000-00-00 00:00:00','\n'),(1787,'Leay Bour',4,1,21,9,'4','0000-00-00 00:00:00','\n'),(1788,'Nhaeng Nhang',4,1,21,9,'5','0000-00-00 00:00:00','\n'),(1789,'Ou Saray',4,1,21,9,'6','0000-00-00 00:00:00','\n'),(1790,'Trapeang Kranhung',4,1,21,9,'7','0000-00-00 00:00:00','\n'),(1791,'Otdam Souriya',4,1,21,9,'8','0000-00-00 00:00:00','\n'),(1792,'Popel',4,1,21,9,'9','0000-00-00 00:00:00','\n'),(1793,'Samraong',4,1,21,9,'10','0000-00-00 00:00:00','\n'),(1794,'Srae Ronoung',4,1,21,9,'11','0000-00-00 00:00:00','\n'),(1795,'Ta Phem',4,1,21,9,'12','0000-00-00 00:00:00','\n'),(1796,'Tram Kak',4,1,21,9,'13','0000-00-00 00:00:00','\n'),(1797,'Trapeang Thum Khang Cheung',4,1,21,9,'14','0000-00-00 00:00:00','\n'),(1798,'Trapeang Thum Khang Tboung',4,1,21,9,'15','0000-00-00 00:00:00','\n'),(1799,'Angkanh',4,1,21,10,'1','0000-00-00 00:00:00','\n'),(1800,'Angk Khnaor',4,1,21,10,'2','0000-00-00 00:00:00','\n'),(1801,'Chi Khmar',4,1,21,10,'3','0000-00-00 00:00:00','\n'),(1802,'Khvav',4,1,21,10,'4','0000-00-00 00:00:00','\n'),(1803,'Prambei Mom',4,1,21,10,'5','0000-00-00 00:00:00','\n'),(1804,'Angkeov',4,1,21,10,'6','0000-00-00 00:00:00','\n'),(1805,'Prey Sloek',4,1,21,10,'7','0000-00-00 00:00:00','\n'),(1806,'Roneam',4,1,21,10,'8','0000-00-00 00:00:00','\n'),(1807,'Sambuor',4,1,21,10,'9','0000-00-00 00:00:00','\n'),(1808,'Sanlung',4,1,21,10,'10','0000-00-00 00:00:00','\n'),(1809,'Smaong',4,1,21,10,'11','0000-00-00 00:00:00','\n'),(1810,'Srangae',4,1,21,10,'12','0000-00-00 00:00:00','\n'),(1811,'Thlok',4,1,21,10,'13','0000-00-00 00:00:00','\n'),(1812,'Tralach',4,1,21,10,'14','0000-00-00 00:00:00','\n'),(1813,'Ampil',4,1,22,1,'1','0000-00-00 00:00:00','\n'),(1814,'Beng',4,1,22,1,'2','0000-00-00 00:00:00','\n'),(1815,'Kouk Khpos',4,1,22,1,'3','0000-00-00 00:00:00','\n'),(1816,'Kouk Mon',4,1,22,1,'4','0000-00-00 00:00:00','\n'),(1817,'Cheung Tien',4,1,22,2,'1','0000-00-00 00:00:00','\n'),(1818,'Chong Kal',4,1,22,2,'2','0000-00-00 00:00:00','\n'),(1819,'Krasang',4,1,22,2,'3','0000-00-00 00:00:00','\n'),(1820,'Pongro',4,1,22,2,'4','0000-00-00 00:00:00','\n'),(1821,'Bos Sbov',4,1,22,3,'1','0000-00-00 00:00:00','\n'),(1822,'Koun Kreal',4,1,22,3,'2','0000-00-00 00:00:00','\n'),(1823,'Samraong',4,1,22,3,'3','0000-00-00 00:00:00','\n'),(1824,'Bansay Reak',4,1,22,3,'4','0000-00-00 00:00:00','\n'),(1825,'Ou Smach',4,1,22,3,'5','0000-00-00 00:00:00','\n'),(1826,'Anlong Veang',4,1,22,4,'1','0000-00-00 00:00:00','\n'),(1827,'Phlat',4,1,22,4,'2','0000-00-00 00:00:00','\n'),(1828,'Trapeang Prey',4,1,22,4,'3','0000-00-00 00:00:00','\n'),(1829,'Lumtong',4,1,22,4,'4','0000-00-00 00:00:00','\n'),(1830,'Trapeang Tav',4,1,22,4,'5','0000-00-00 00:00:00','\n'),(1831,'Trapeang Prasat',4,1,22,5,'1','0000-00-00 00:00:00','\n'),(1832,'Bak Anloung',4,1,22,5,'2','0000-00-00 00:00:00','\n'),(1833,'Ou Svay',4,1,22,5,'3','0000-00-00 00:00:00','\n'),(1834,'Preah Pralay',4,1,22,5,'4','0000-00-00 00:00:00','\n'),(1835,'Phaov',4,1,22,5,'5','0000-00-00 00:00:00','\n'),(1836,'Tumnob Dach',4,1,22,5,'6','0000-00-00 00:00:00','\n'),(1837,'Angkaol',4,1,23,1,'1','0000-00-00 00:00:00','\n'),(1838,'Or Krasar',4,1,23,1,'2','0000-00-00 00:00:00','\n'),(1839,'Pong Tuek',4,1,23,1,'3','0000-00-00 00:00:00','\n'),(1840,'Kaeb',4,1,23,2,'1','0000-00-00 00:00:00','\n'),(1841,'Prey Thom',4,1,23,2,'2','0000-00-00 00:00:00','\n'),(1842,'Pailin',4,1,24,1,'1','0000-00-00 00:00:00','\n'),(1843,'Ou Ta Vao',4,1,24,1,'2','0000-00-00 00:00:00','\n'),(1844,'Toul Lvea',4,1,24,1,'3','0000-00-00 00:00:00','\n'),(1845,'Ba Yakha',4,1,24,1,'4','0000-00-00 00:00:00','\n'),(1846,'Sala Krau',4,1,24,2,'1','0000-00-00 00:00:00','\n'),(1847,'Stueng Trang',4,1,24,2,'2','0000-00-00 00:00:00','\n'),(1848,'Stueng Kach',4,1,24,2,'3','0000-00-00 00:00:00','\n'),(1849,'Ou Andoung',4,1,24,2,'4','0000-00-00 00:00:00','\n'),(1850,'Chrang chomres 1',4,1,12,7,'11','0000-00-00 00:00:00','\n'),(1851,'Chrang chomres 2',4,1,12,7,'12','0000-00-00 00:00:00','\n'),(1853,'Chamka Samroung',4,1,2,2,'16','0000-00-00 00:00:00','\n'),(1854,'Poi Pet',2,1,25,0,'0','0000-00-00 00:00:00','\n'),(1855,'Balylay',3,1,25,1,'0','0000-00-00 00:00:00','\n'),(1856,'Prey Pring',4,1,12,5,'16','0000-00-00 00:00:00','\n'),(1857,'unspecified',1,242,0,0,'0','0000-00-00 00:00:00','\n'),(1858,'Afghanistan',1,2,0,0,'0','0000-00-00 00:00:00','\n'),(1859,'Aland Islands',1,3,0,0,'0','0000-00-00 00:00:00','\n'),(1860,'Albania',1,4,0,0,'0','0000-00-00 00:00:00','\n'),(1861,'Algeria',1,5,0,0,'0','0000-00-00 00:00:00','\n'),(1862,'American Samoa',1,6,0,0,'0','0000-00-00 00:00:00','\n'),(1863,'Andorra',1,7,0,0,'0','0000-00-00 00:00:00','\n'),(1864,'Angola',1,8,0,0,'0','0000-00-00 00:00:00','\n'),(1865,'Anguilla',1,9,0,0,'0','0000-00-00 00:00:00','\n'),(1866,'Antarctica',1,10,0,0,'0','0000-00-00 00:00:00','\n'),(1867,'Antigua and Barbuda',1,11,0,0,'0','0000-00-00 00:00:00','\n'),(1868,'Argentina',1,12,0,0,'0','0000-00-00 00:00:00','\n'),(1869,'Armenia',1,13,0,0,'0','0000-00-00 00:00:00','\n'),(1870,'Aruba',1,14,0,0,'0','0000-00-00 00:00:00','\n'),(1871,'Australia',1,15,0,0,'0','0000-00-00 00:00:00','\n'),(1872,'Austria',1,16,0,0,'0','0000-00-00 00:00:00','\n'),(1873,'Azerbaijan',1,17,0,0,'0','0000-00-00 00:00:00','\n'),(1874,'Bahamas',1,18,0,0,'0','0000-00-00 00:00:00','\n'),(1875,'Bahrain',1,19,0,0,'0','0000-00-00 00:00:00','\n'),(1876,'Bangladesh',1,20,0,0,'0','0000-00-00 00:00:00','\n'),(1877,'Barbados',1,21,0,0,'0','0000-00-00 00:00:00','\n'),(1878,'Belarus',1,22,0,0,'0','0000-00-00 00:00:00','\n'),(1879,'Belgium',1,23,0,0,'0','0000-00-00 00:00:00','\n'),(1880,'Belize',1,24,0,0,'0','0000-00-00 00:00:00','\n'),(1881,'Benin',1,25,0,0,'0','0000-00-00 00:00:00','\n'),(1882,'Bermuda',1,26,0,0,'0','0000-00-00 00:00:00','\n'),(1883,'Bhutan',1,27,0,0,'0','0000-00-00 00:00:00','\n'),(1884,'Bolivia',1,28,0,0,'0','0000-00-00 00:00:00','\n'),(1885,'Bosnia and Herzegovina',1,29,0,0,'0','0000-00-00 00:00:00','\n'),(1886,'Botswana',1,30,0,0,'0','0000-00-00 00:00:00','\n'),(1887,'Bouvet Island',1,31,0,0,'0','0000-00-00 00:00:00','\n'),(1888,'Brazil',1,32,0,0,'0','0000-00-00 00:00:00','\n'),(1889,'British Indian Ocean Territory',1,33,0,0,'0','0000-00-00 00:00:00','\n'),(1890,'Brunei Darussalam',1,34,0,0,'0','0000-00-00 00:00:00','\n'),(1891,'Bulgaria',1,35,0,0,'0','0000-00-00 00:00:00','\n'),(1892,'Burkina Faso',1,36,0,0,'0','0000-00-00 00:00:00','\n'),(1893,'Burundi',1,37,0,0,'0','0000-00-00 00:00:00','\n'),(1894,'Cameroon',1,38,0,0,'0','0000-00-00 00:00:00','\n'),(1895,'Canada',1,39,0,0,'0','0000-00-00 00:00:00','\n'),(1896,'Cape Verde',1,40,0,0,'0','0000-00-00 00:00:00','\n'),(1897,'Cayman Islands',1,41,0,0,'0','0000-00-00 00:00:00','\n'),(1898,'Central African Republic',1,42,0,0,'0','0000-00-00 00:00:00','\n'),(1899,'Chad',1,43,0,0,'0','0000-00-00 00:00:00','\n'),(1900,'Chile',1,44,0,0,'0','0000-00-00 00:00:00','\n'),(1901,'China',1,45,0,0,'0','0000-00-00 00:00:00','\n'),(1902,'Christmas Island',1,46,0,0,'0','0000-00-00 00:00:00','\n'),(1903,'Cocos (Keeling) Islands',1,47,0,0,'0','0000-00-00 00:00:00','\n'),(1904,'Colombia',1,48,0,0,'0','0000-00-00 00:00:00','\n'),(1905,'Comoros',1,49,0,0,'0','0000-00-00 00:00:00','\n'),(1906,'Congo',1,50,0,0,'0','0000-00-00 00:00:00','\n'),(1907,'Congo, The Democratic Republic of the',1,51,0,0,'0','0000-00-00 00:00:00','\n'),(1908,'Cook Islands',1,52,0,0,'0','0000-00-00 00:00:00','\n'),(1909,'Costa Rica',1,53,0,0,'0','0000-00-00 00:00:00','\n'),(1910,'Cote D&#39;Ivoire',1,54,0,0,'0','0000-00-00 00:00:00','\n'),(1911,'Croatia',1,55,0,0,'0','0000-00-00 00:00:00','\n'),(1912,'Cuba',1,56,0,0,'0','0000-00-00 00:00:00','\n'),(1913,'Cyprus',1,57,0,0,'0','0000-00-00 00:00:00','\n'),(1914,'Czech Republic',1,58,0,0,'0','0000-00-00 00:00:00','\n'),(1915,'Denmark',1,59,0,0,'0','0000-00-00 00:00:00','\n'),(1916,'Djibouti',1,60,0,0,'0','0000-00-00 00:00:00','\n'),(1917,'Dominica',1,61,0,0,'0','0000-00-00 00:00:00','\n'),(1918,'Dominican Republic',1,62,0,0,'0','0000-00-00 00:00:00','\n'),(1919,'Ecuador',1,63,0,0,'0','0000-00-00 00:00:00','\n'),(1920,'Egypt',1,64,0,0,'0','0000-00-00 00:00:00','\n'),(1921,'El Salvador',1,65,0,0,'0','0000-00-00 00:00:00','\n'),(1922,'Equatorial Guinea',1,66,0,0,'0','0000-00-00 00:00:00','\n'),(1923,'Eritrea',1,67,0,0,'0','0000-00-00 00:00:00','\n'),(1924,'Estonia',1,68,0,0,'0','0000-00-00 00:00:00','\n'),(1925,'Ethiopia',1,69,0,0,'0','0000-00-00 00:00:00','\n'),(1926,'Falkland Islands (Malvinas)',1,70,0,0,'0','0000-00-00 00:00:00','\n'),(1927,'Faroe Islands',1,71,0,0,'0','0000-00-00 00:00:00','\n'),(1928,'Fiji',1,72,0,0,'0','0000-00-00 00:00:00','\n'),(1929,'Finland',1,73,0,0,'0','0000-00-00 00:00:00','\n'),(1930,'France',1,74,0,0,'0','0000-00-00 00:00:00','\n'),(1931,'France, Metropolitan',1,75,0,0,'0','0000-00-00 00:00:00','\n'),(1932,'French Guiana',1,76,0,0,'0','0000-00-00 00:00:00','\n'),(1933,'French Polynesia',1,77,0,0,'0','0000-00-00 00:00:00','\n'),(1934,'French Southern Territories',1,78,0,0,'0','0000-00-00 00:00:00','\n'),(1935,'Gabon',1,79,0,0,'0','0000-00-00 00:00:00','\n'),(1936,'Gambia',1,80,0,0,'0','0000-00-00 00:00:00','\n'),(1937,'Georgia',1,81,0,0,'0','0000-00-00 00:00:00','\n'),(1938,'Germany',1,82,0,0,'0','0000-00-00 00:00:00','\n'),(1939,'Ghana',1,83,0,0,'0','0000-00-00 00:00:00','\n'),(1940,'Gibraltar',1,84,0,0,'0','0000-00-00 00:00:00','\n'),(1941,'Greece',1,85,0,0,'0','0000-00-00 00:00:00','\n'),(1942,'Greenland',1,86,0,0,'0','0000-00-00 00:00:00','\n'),(1943,'Grenada',1,87,0,0,'0','0000-00-00 00:00:00','\n'),(1944,'Guadeloupe',1,88,0,0,'0','0000-00-00 00:00:00','\n'),(1945,'Guam',1,89,0,0,'0','0000-00-00 00:00:00','\n'),(1946,'Guatemala',1,90,0,0,'0','0000-00-00 00:00:00','\n'),(1947,'Guinea',1,91,0,0,'0','0000-00-00 00:00:00','\n'),(1948,'Guinea-Bissau',1,92,0,0,'0','0000-00-00 00:00:00','\n'),(1949,'Guyana',1,93,0,0,'0','0000-00-00 00:00:00','\n'),(1950,'Haiti',1,94,0,0,'0','0000-00-00 00:00:00','\n'),(1951,'Heard Island and McDonald Islands',1,95,0,0,'0','0000-00-00 00:00:00','\n'),(1952,'Holy See (Vatican City State)',1,96,0,0,'0','0000-00-00 00:00:00','\n'),(1953,'Honduras',1,97,0,0,'0','0000-00-00 00:00:00','\n'),(1954,'Hong Kong',1,98,0,0,'0','0000-00-00 00:00:00','\n'),(1955,'Hungary',1,99,0,0,'0','0000-00-00 00:00:00','\n'),(1956,'Iceland',1,100,0,0,'0','0000-00-00 00:00:00','\n'),(1957,'India',1,101,0,0,'0','0000-00-00 00:00:00','\n'),(1958,'Indonesia',1,102,0,0,'0','0000-00-00 00:00:00','\n'),(1959,'Iran, Islamic Republic of',1,103,0,0,'0','0000-00-00 00:00:00','\n'),(1960,'Iraq',1,104,0,0,'0','0000-00-00 00:00:00','\n'),(1961,'Ireland',1,105,0,0,'0','0000-00-00 00:00:00','\n'),(1962,'Israel',1,106,0,0,'0','0000-00-00 00:00:00','\n'),(1963,'Italy',1,107,0,0,'0','0000-00-00 00:00:00','\n'),(1964,'Jamaica',1,108,0,0,'0','0000-00-00 00:00:00','\n'),(1965,'Japan',1,109,0,0,'0','0000-00-00 00:00:00','\n'),(1966,'Jordan',1,110,0,0,'0','0000-00-00 00:00:00','\n'),(1967,'Kazakhstan',1,111,0,0,'0','0000-00-00 00:00:00','\n'),(1968,'Kenya',1,112,0,0,'0','0000-00-00 00:00:00','\n'),(1969,'Kiribati',1,113,0,0,'0','0000-00-00 00:00:00','\n'),(1970,'Korea, Democratic People&#39;s Republic of',1,114,0,0,'0','0000-00-00 00:00:00','\n'),(1971,'Korea, Republic of',1,115,0,0,'0','0000-00-00 00:00:00','\n'),(1972,'Kuwait',1,116,0,0,'0','0000-00-00 00:00:00','\n'),(1973,'Kyrgyzstan',1,117,0,0,'0','0000-00-00 00:00:00','\n'),(1974,'Lao People&#39;s Democratic Republic',1,118,0,0,'0','0000-00-00 00:00:00','\n'),(1975,'Latvia',1,119,0,0,'0','0000-00-00 00:00:00','\n'),(1976,'Lebanon',1,120,0,0,'0','0000-00-00 00:00:00','\n'),(1977,'Lesotho',1,121,0,0,'0','0000-00-00 00:00:00','\n'),(1978,'Liberia',1,122,0,0,'0','0000-00-00 00:00:00','\n'),(1979,'Libyan Arab Jamahiriya',1,123,0,0,'0','0000-00-00 00:00:00','\n'),(1980,'Liechtenstein',1,124,0,0,'0','0000-00-00 00:00:00','\n'),(1981,'Lithuania',1,125,0,0,'0','0000-00-00 00:00:00','\n'),(1982,'Luxembourg',1,126,0,0,'0','0000-00-00 00:00:00','\n'),(1983,'Macao',1,127,0,0,'0','0000-00-00 00:00:00','\n'),(1984,'Macedonia, the Former Yugoslav Republic of',1,128,0,0,'0','0000-00-00 00:00:00','\n'),(1985,'Madagascar',1,129,0,0,'0','0000-00-00 00:00:00','\n'),(1986,'Malawi',1,130,0,0,'0','0000-00-00 00:00:00','\n'),(1987,'Malaysia',1,131,0,0,'0','0000-00-00 00:00:00','\n'),(1988,'Maldives',1,132,0,0,'0','0000-00-00 00:00:00','\n'),(1989,'Mali',1,133,0,0,'0','0000-00-00 00:00:00','\n'),(1990,'Malta',1,134,0,0,'0','0000-00-00 00:00:00','\n'),(1991,'Marshall Islands',1,135,0,0,'0','0000-00-00 00:00:00','\n'),(1992,'Martinique',1,136,0,0,'0','0000-00-00 00:00:00','\n'),(1993,'Mauritania',1,137,0,0,'0','0000-00-00 00:00:00','\n'),(1994,'Mauritius',1,138,0,0,'0','0000-00-00 00:00:00','\n'),(1995,'Mayotte',1,139,0,0,'0','0000-00-00 00:00:00','\n'),(1996,'Mexico',1,140,0,0,'0','0000-00-00 00:00:00','\n'),(1997,'Micronesia, Federated States of',1,141,0,0,'0','0000-00-00 00:00:00','\n'),(1998,'Moldova, Republic of',1,142,0,0,'0','0000-00-00 00:00:00','\n'),(1999,'Monaco',1,143,0,0,'0','0000-00-00 00:00:00','\n'),(2000,'Mongolia',1,144,0,0,'0','0000-00-00 00:00:00','\n'),(2001,'Montserrat',1,145,0,0,'0','0000-00-00 00:00:00','\n'),(2002,'Morocco',1,146,0,0,'0','0000-00-00 00:00:00','\n'),(2003,'Mozambique',1,147,0,0,'0','0000-00-00 00:00:00','\n'),(2004,'Myanmar',1,148,0,0,'0','0000-00-00 00:00:00','\n'),(2005,'Namibia',1,149,0,0,'0','0000-00-00 00:00:00','\n'),(2006,'Nauru',1,150,0,0,'0','0000-00-00 00:00:00','\n'),(2007,'Nepal',1,151,0,0,'0','0000-00-00 00:00:00','\n'),(2008,'Netherlands',1,152,0,0,'0','0000-00-00 00:00:00','\n'),(2009,'Netherlands Antilles',1,153,0,0,'0','0000-00-00 00:00:00','\n'),(2010,'New Caledonia',1,154,0,0,'0','0000-00-00 00:00:00','\n'),(2011,'New Zealand',1,155,0,0,'0','0000-00-00 00:00:00','\n'),(2012,'Nicaragua',1,156,0,0,'0','0000-00-00 00:00:00','\n'),(2013,'Niger',1,157,0,0,'0','0000-00-00 00:00:00','\n'),(2014,'Nigeria',1,158,0,0,'0','0000-00-00 00:00:00','\n'),(2015,'Niue',1,159,0,0,'0','0000-00-00 00:00:00','\n'),(2016,'Norfolk Island',1,160,0,0,'0','0000-00-00 00:00:00','\n'),(2017,'Northern Mariana Islands',1,161,0,0,'0','0000-00-00 00:00:00','\n'),(2018,'Norway',1,162,0,0,'0','0000-00-00 00:00:00','\n'),(2019,'Oman',1,163,0,0,'0','0000-00-00 00:00:00','\n'),(2020,'Pakistan',1,164,0,0,'0','0000-00-00 00:00:00','\n'),(2021,'Palau',1,165,0,0,'0','0000-00-00 00:00:00','\n'),(2022,'Palestinian Territory, Occupied',1,166,0,0,'0','0000-00-00 00:00:00','\n'),(2023,'Panama',1,167,0,0,'0','0000-00-00 00:00:00','\n'),(2024,'Papua New Guinea',1,168,0,0,'0','0000-00-00 00:00:00','\n'),(2025,'Paraguay',1,169,0,0,'0','0000-00-00 00:00:00','\n'),(2026,'Peru',1,170,0,0,'0','0000-00-00 00:00:00','\n'),(2027,'Philippines',1,171,0,0,'0','0000-00-00 00:00:00','\n'),(2028,'Pitcairn',1,172,0,0,'0','0000-00-00 00:00:00','\n'),(2029,'Poland',1,173,0,0,'0','0000-00-00 00:00:00','\n'),(2030,'Portugal',1,174,0,0,'0','0000-00-00 00:00:00','\n'),(2031,'Puerto Rico',1,175,0,0,'0','0000-00-00 00:00:00','\n'),(2032,'Qatar',1,176,0,0,'0','0000-00-00 00:00:00','\n'),(2033,'Reunion',1,177,0,0,'0','0000-00-00 00:00:00','\n'),(2034,'Romania',1,178,0,0,'0','0000-00-00 00:00:00','\n'),(2035,'Russian Federation',1,179,0,0,'0','0000-00-00 00:00:00','\n'),(2036,'Rwanda',1,180,0,0,'0','0000-00-00 00:00:00','\n'),(2037,'Saint Helena',1,181,0,0,'0','0000-00-00 00:00:00','\n'),(2038,'Saint Kitts and Nevis',1,182,0,0,'0','0000-00-00 00:00:00','\n'),(2039,'Saint Lucia',1,183,0,0,'0','0000-00-00 00:00:00','\n'),(2040,'Saint Pierre and Miquelon',1,184,0,0,'0','0000-00-00 00:00:00','\n'),(2041,'Saint Vincent and the Grenadines',1,185,0,0,'0','0000-00-00 00:00:00','\n'),(2042,'Samoa',1,186,0,0,'0','0000-00-00 00:00:00','\n'),(2043,'San Marino',1,187,0,0,'0','0000-00-00 00:00:00','\n'),(2044,'Sao Tome and Principe',1,188,0,0,'0','0000-00-00 00:00:00','\n'),(2045,'Saudi Arabia',1,189,0,0,'0','0000-00-00 00:00:00','\n'),(2046,'Senegal',1,190,0,0,'0','0000-00-00 00:00:00','\n'),(2047,'Serbia and Montenegro',1,191,0,0,'0','0000-00-00 00:00:00','\n'),(2048,'Seychelles',1,192,0,0,'0','0000-00-00 00:00:00','\n'),(2049,'Sierra Leone',1,193,0,0,'0','0000-00-00 00:00:00','\n'),(2050,'Singapore',1,194,0,0,'0','0000-00-00 00:00:00','\n'),(2051,'Slovakia',1,195,0,0,'0','0000-00-00 00:00:00','\n'),(2052,'Slovenia',1,196,0,0,'0','0000-00-00 00:00:00','\n'),(2053,'Solomon Islands',1,197,0,0,'0','0000-00-00 00:00:00','\n'),(2054,'Somalia',1,198,0,0,'0','0000-00-00 00:00:00','\n'),(2055,'South Africa',1,199,0,0,'0','0000-00-00 00:00:00','\n'),(2056,'South Georgia and the South Sandwich Islands',1,200,0,0,'0','0000-00-00 00:00:00','\n'),(2057,'Spain',1,201,0,0,'0','0000-00-00 00:00:00','\n'),(2058,'Sri Lanka',1,202,0,0,'0','0000-00-00 00:00:00','\n'),(2059,'Sudan',1,203,0,0,'0','0000-00-00 00:00:00','\n'),(2060,'Suriname',1,204,0,0,'0','0000-00-00 00:00:00','\n'),(2061,'Svalbard and Jan Mayen',1,205,0,0,'0','0000-00-00 00:00:00','\n'),(2062,'Swaziland',1,206,0,0,'0','0000-00-00 00:00:00','\n'),(2063,'Sweden',1,207,0,0,'0','0000-00-00 00:00:00','\n'),(2064,'Switzerland',1,208,0,0,'0','0000-00-00 00:00:00','\n'),(2065,'Syrian Arab Republic',1,209,0,0,'0','0000-00-00 00:00:00','\n'),(2066,'Taiwan, Province of China',1,210,0,0,'0','0000-00-00 00:00:00','\n'),(2067,'Tajikistan',1,211,0,0,'0','0000-00-00 00:00:00','\n'),(2068,'Tanzania, United Republic of',1,212,0,0,'0','0000-00-00 00:00:00','\n'),(2069,'Thailand',1,213,0,0,'0','0000-00-00 00:00:00','\n'),(2070,'Timor-Leste',1,214,0,0,'0','0000-00-00 00:00:00','\n'),(2071,'Togo',1,215,0,0,'0','0000-00-00 00:00:00','\n'),(2072,'Tokelau',1,216,0,0,'0','0000-00-00 00:00:00','\n'),(2073,'Tonga',1,217,0,0,'0','0000-00-00 00:00:00','\n'),(2074,'Trinidad and Tobago',1,218,0,0,'0','0000-00-00 00:00:00','\n'),(2075,'Tunisia',1,219,0,0,'0','0000-00-00 00:00:00','\n'),(2076,'Turkey',1,220,0,0,'0','0000-00-00 00:00:00','\n'),(2077,'Turkmenistan',1,221,0,0,'0','0000-00-00 00:00:00','\n'),(2078,'Turks and Caicos Islands',1,222,0,0,'0','0000-00-00 00:00:00','\n'),(2079,'Tuvalu',1,223,0,0,'0','0000-00-00 00:00:00','\n'),(2080,'Uganda',1,224,0,0,'0','0000-00-00 00:00:00','\n'),(2081,'Ukraine',1,225,0,0,'0','0000-00-00 00:00:00','\n'),(2082,'United Arab Emirates',1,226,0,0,'0','0000-00-00 00:00:00','\n'),(2083,'United Kingdom',1,227,0,0,'0','0000-00-00 00:00:00','\n'),(2084,'United States',1,228,0,0,'0','0000-00-00 00:00:00','\n'),(2085,'United States Minor Outlying Islands',1,229,0,0,'0','0000-00-00 00:00:00','\n'),(2086,'Uruguay',1,230,0,0,'0','0000-00-00 00:00:00','\n'),(2087,'Uzbekistan',1,231,0,0,'0','0000-00-00 00:00:00','\n'),(2088,'Vanuatu',1,232,0,0,'0','0000-00-00 00:00:00','\n'),(2089,'Venezuela',1,233,0,0,'0','0000-00-00 00:00:00','\n'),(2090,'Vietnam',1,234,0,0,'0','0000-00-00 00:00:00','\n'),(2091,'Virgin Islands, British',1,235,0,0,'0','0000-00-00 00:00:00','\n'),(2092,'Virgin Islands, U.S.',1,236,0,0,'0','0000-00-00 00:00:00','\n'),(2093,'Wallis and Futuna',1,237,0,0,'0','0000-00-00 00:00:00','\n'),(2094,'Western Sahara',1,238,0,0,'0','0000-00-00 00:00:00','\n'),(2095,'Yemen',1,239,0,0,'0','0000-00-00 00:00:00','\n'),(2096,'Zambia',1,240,0,0,'0','0000-00-00 00:00:00','\n'),(2097,'Zimbabwe',1,241,0,0,'0','0000-00-00 00:00:00','\n'),(2098,'Sen Sok',3,1,12,8,'0','0000-00-00 00:00:00','\n'),(2099,'Phnom Penh Thmey',4,1,12,8,'17','0000-00-00 00:00:00','\n'),(2100,'Po Sen Chey',3,1,12,9,'0','0000-00-00 00:00:00','\n'),(2101,'Phsa Kandal',3,1,25,0,'0','0000-00-00 00:00:00','\n'),(2102,'Phsa Kandal',4,1,25,0,'0','0000-00-00 00:00:00','\n'),(2103,'Mittakpheap',3,1,18,4,'0','0000-00-00 00:00:00','\n'),(2104,'Ocha',4,1,2,2,'17','0000-00-00 00:00:00','\n'),(2105,'Prek Mahatep',4,1,2,2,'18','0000-00-00 00:00:00','\n'),(2106,'Prek Preahsdach',4,1,2,2,'19','0000-00-00 00:00:00','\n'),(2107,'Svay Tong Khang Tboung',4,1,7,6,'14','0000-00-00 00:00:00','\n');
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
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_roles`
--

LOCK TABLES `menu_roles` WRITE;
/*!40000 ALTER TABLE `menu_roles` DISABLE KEYS */;
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
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_types`
--

LOCK TABLES `menu_types` WRITE;
/*!40000 ALTER TABLE `menu_types` DISABLE KEYS */;
INSERT INTO `menu_types` VALUES (1,'HORIZONTAL_MENU','Horizontal menu type','2014-11-02 16:09:58',NULL,''),(2,'VERTICAL_MENU','Vertical menu type','2014-11-02 16:10:16',NULL,''),(3,'SUB_VERTICAL_MENU','sub vertical menu type','2014-11-02 16:10:46',NULL,'');
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
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `url` varchar(60) DEFAULT NULL,
  `tooltip` varchar(60) DEFAULT NULL,
  `icon_url` varchar(10) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `menu_type_id` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,0,'Setup Management','Setup Mangement',NULL,'0000-00-00',NULL,1,2,'2014-11-02 16:15:46',NULL,''),(2,0,'User Management','User Management',NULL,'0000-00-00',NULL,2,2,'2014-11-02 16:15:46',NULL,''),(3,1,'Location','Location','/admin/location/',NULL,NULL,1,3,'2014-11-02 16:16:38',NULL,''),(4,1,'Amenity','Amenity','/admin/amenity/',NULL,NULL,2,3,'2014-11-02 16:17:02',NULL,''),(5,2,'Add User','Add User','/admin/location/',NULL,NULL,1,3,'2014-11-02 17:36:55',NULL,''),(6,2,'Reset Password','Reset Password','/admin/location/',NULL,NULL,2,3,'2014-11-02 17:36:55',NULL,''),(7,2,'Role','Role','/admin/location/',NULL,NULL,3,3,'2014-11-02 17:36:55',NULL,''),(8,1,'Accomodation','Accomodation','/admin/accomodation/',NULL,NULL,3,3,'2014-11-03 14:17:05',NULL,''),(9,1,'Advertisement','Advertisement','/admin/advertisement/',NULL,NULL,4,3,'2014-11-03 14:17:05',NULL,''),(10,1,'Place Interest','Place Interest','/admin/placeInterest/',NULL,NULL,5,3,'2014-11-03 14:17:05',NULL,''),(11,1,'Trasportation','Trasportation','/admin/transportation/',NULL,NULL,6,3,'2014-11-03 14:17:05',NULL,''),(12,1,'Vehicle','Vehicle','/admin/vehicle/',NULL,NULL,7,3,'2014-11-03 14:17:05',NULL,''),(13,1,'Tour','Tour','/admin/tour/',NULL,NULL,8,3,'2014-11-03 14:17:05',NULL,''),(14,2,'List Users','List Users',NULL,NULL,NULL,4,3,'2014-11-03 14:17:05',NULL,'');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_types`
--

DROP TABLE IF EXISTS `photo_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_types`
--

LOCK TABLES `photo_types` WRITE;
/*!40000 ALTER TABLE `photo_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `photo_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `photo_type_id` varchar(45) DEFAULT NULL,
  `data` binary(1) DEFAULT NULL,
  `path_small` varchar(255) DEFAULT NULL,
  `path_medium` varchar(255) DEFAULT NULL,
  `path_large` varchar(255) DEFAULT NULL,
  `ext` varchar(10) DEFAULT NULL,
  `mime_type` varchar(10) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_interest`
--

DROP TABLE IF EXISTS `place_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_interest`
--

LOCK TABLES `place_interest` WRITE;
/*!40000 ALTER TABLE `place_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_interest_addresses`
--

DROP TABLE IF EXISTS `place_interest_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_interest_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_interest_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_interest_addresses`
--

LOCK TABLES `place_interest_addresses` WRITE;
/*!40000 ALTER TABLE `place_interest_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_interest_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_interest_photos`
--

DROP TABLE IF EXISTS `place_interest_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_interest_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_interest_id` int(11) DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_interest_photos`
--

LOCK TABLES `place_interest_photos` WRITE;
/*!40000 ALTER TABLE `place_interest_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_interest_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_types`
--

DROP TABLE IF EXISTS `room_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_types`
--

LOCK TABLES `room_types` WRITE;
/*!40000 ALTER TABLE `room_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_photos`
--

DROP TABLE IF EXISTS `tour_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_photos`
--

LOCK TABLES `tour_photos` WRITE;
/*!40000 ALTER TABLE `tour_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours`
--

DROP TABLE IF EXISTS `tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `num_day` varchar(10) DEFAULT NULL,
  `num_night` varchar(10) DEFAULT NULL,
  `leave_at` varchar(2) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours`
--

LOCK TABLES `tours` WRITE;
/*!40000 ALTER TABLE `tours` DISABLE KEYS */;
/*!40000 ALTER TABLE `tours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_addresses`
--

DROP TABLE IF EXISTS `transportation_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tranpsortation_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_addresses`
--

LOCK TABLES `transportation_addresses` WRITE;
/*!40000 ALTER TABLE `transportation_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportation_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_contacts`
--

DROP TABLE IF EXISTS `transportation_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tranpsortation_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_contacts`
--

LOCK TABLES `transportation_contacts` WRITE;
/*!40000 ALTER TABLE `transportation_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportation_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_photos`
--

DROP TABLE IF EXISTS `transportation_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tranpsortation_id` int(11) DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_photos`
--

LOCK TABLES `transportation_photos` WRITE;
/*!40000 ALTER TABLE `transportation_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportation_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_types`
--

DROP TABLE IF EXISTS `transportation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_types`
--

LOCK TABLES `transportation_types` WRITE;
/*!40000 ALTER TABLE `transportation_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportation_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_vechicle_dashboard`
--

DROP TABLE IF EXISTS `transportation_vechicle_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation_vechicle_dashboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transportation_id` varchar(45) DEFAULT NULL,
  `vechicle_id` varchar(45) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `from_time` varchar(45) DEFAULT NULL,
  `to_time` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_vechicle_dashboard`
--

LOCK TABLES `transportation_vechicle_dashboard` WRITE;
/*!40000 ALTER TABLE `transportation_vechicle_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportation_vechicle_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportations`
--

DROP TABLE IF EXISTS `transportations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `transport_type_id` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportations`
--

LOCK TABLES `transportations` WRITE;
/*!40000 ALTER TABLE `transportations` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
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
  `username` varchar(120) DEFAULT NULL,
  `password` varchar(220) DEFAULT NULL,
  `salted_password` varchar(220) DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicale_feathures`
--

DROP TABLE IF EXISTS `vehicale_feathures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicale_feathures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vechicale_id` varchar(45) DEFAULT NULL,
  `feathures` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicale_feathures`
--

LOCK TABLES `vehicale_feathures` WRITE;
/*!40000 ALTER TABLE `vehicale_feathures` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicale_feathures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicale_photos`
--

DROP TABLE IF EXISTS `vehicale_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicale_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tranpsortation_id` int(11) DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicale_photos`
--

LOCK TABLES `vehicale_photos` WRITE;
/*!40000 ALTER TABLE `vehicale_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicale_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicales`
--

DROP TABLE IF EXISTS `vehicales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicale_type_id` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicales`
--

LOCK TABLES `vehicales` WRITE;
/*!40000 ALTER TABLE `vehicales` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_types`
--

DROP TABLE IF EXISTS `vehicle_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_types`
--

LOCK TABLES `vehicle_types` WRITE;
/*!40000 ALTER TABLE `vehicle_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-19  7:40:11
