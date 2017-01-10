-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: nomina_development
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2016-08-23 17:21:39','2016-08-23 17:21:39');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billingcs`
--

DROP TABLE IF EXISTS `billingcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billingcs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billingcs`
--

LOCK TABLES `billingcs` WRITE;
/*!40000 ALTER TABLE `billingcs` DISABLE KEYS */;
INSERT INTO `billingcs` VALUES (13,'Cuadrilla de campo','','2016-11-29 15:04:29','2016-11-29 15:04:29'),(14,'Obreros agrícolas','','2016-11-29 15:04:46','2016-11-29 15:04:46');
/*!40000 ALTER TABLE `billingcs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nit` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (3,'1','A',NULL,'','','2016-12-05 17:29:41','2016-12-05 17:29:41'),(4,'2','B',NULL,'','','2016-12-05 19:27:01','2016-12-05 19:27:01');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `flag` int(11) DEFAULT NULL,
  `transportAllowance` int(11) DEFAULT NULL,
  `basepay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
INSERT INTO `configs` VALUES (1,'2016-10-10 19:57:54','2016-11-28 17:24:48',NULL,77700,18);
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basepay` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` VALUES (1,2,'2016-09-13 19:59:45','2016-09-13 19:59:45');
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costcs`
--

DROP TABLE IF EXISTS `costcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costcs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `labors` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costcs`
--

LOCK TABLES `costcs` WRITE;
/*!40000 ALTER TABLE `costcs` DISABLE KEYS */;
INSERT INTO `costcs` VALUES (16,NULL,'M1','Lote M1','','2016-09-13 19:59:45','2016-10-14 17:22:26',NULL,NULL),(18,NULL,'M2','Lote M2','','2016-09-14 16:33:58','2016-09-14 16:33:58',NULL,NULL),(22,NULL,'4050','aaaaaa','','2016-11-09 15:33:02','2016-11-09 15:33:02',NULL,NULL);
/*!40000 ALTER TABLE `costcs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numberday` int(11) DEFAULT NULL,
  `numbermonth` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `numberyear` int(11) DEFAULT NULL,
  `completedate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (1,1,1,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'01-01-2017'),(2,9,1,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'09-01-2017'),(3,20,3,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'20-03-2017'),(4,13,4,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'13-04-2017'),(5,14,4,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'14-04-2017'),(6,1,5,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'01-05-2017'),(7,29,5,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'29-05-2017'),(8,19,6,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'19-06-2017'),(9,26,6,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'26-06-2017'),(10,3,7,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'03-07-2017'),(11,20,7,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'20-07-2017'),(12,7,8,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'07-08-2017'),(13,21,8,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'21-08-2017'),(14,16,10,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'16-10-2017'),(15,6,11,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'06-11-2017'),(16,13,11,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'13-11-2017'),(17,8,12,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'08-12-2017'),(18,25,12,'2016-09-13 19:59:45','2016-09-13 19:59:45',2017,'25-12-2017'),(19,8,12,'2016-09-13 19:59:45','2016-09-13 19:59:45',2016,'2016-12-08'),(20,25,12,'2016-09-13 19:59:45','2016-09-13 19:59:45',2016,'2016-12-25');
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_operators`
--

DROP TABLE IF EXISTS `job_operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_operators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_operators`
--

LOCK TABLES `job_operators` WRITE;
/*!40000 ALTER TABLE `job_operators` DISABLE KEYS */;
INSERT INTO `job_operators` VALUES (26,1,13,'2016-12-13 14:22:16','2016-12-13 14:22:16'),(27,1,14,'2016-12-13 14:23:13','2016-12-13 14:23:13'),(28,1,15,'2016-12-13 19:32:07','2016-12-13 19:32:07'),(29,1,16,'2016-12-14 13:52:53','2016-12-14 13:52:53'),(30,10,17,'2016-12-14 14:05:39','2016-12-14 14:05:39'),(31,1,18,'2016-12-14 17:05:04','2016-12-14 17:05:04'),(32,1,19,'2016-12-14 19:22:51','2016-12-14 19:22:51'),(33,1,20,'2016-12-16 21:39:57','2016-12-16 21:39:57'),(34,1,21,'2016-12-16 22:13:24','2016-12-16 22:13:24'),(35,1,22,'2016-12-16 22:22:54','2016-12-16 22:22:54'),(36,1,23,'2016-12-16 22:35:32','2016-12-16 22:35:32'),(37,1,24,'2016-12-19 16:32:33','2016-12-19 16:32:33'),(38,1,25,'2016-12-19 16:39:53','2016-12-19 16:39:53'),(39,1,26,'2016-12-19 16:47:52','2016-12-19 16:47:52'),(40,1,27,'2016-12-19 21:26:22','2016-12-19 21:26:22'),(41,1,32,'2016-12-20 21:38:15','2016-12-20 21:38:15'),(42,1,33,'2016-12-20 21:44:11','2016-12-20 21:44:11'),(43,1,34,'2016-12-20 21:47:40','2016-12-20 21:47:40'),(44,1,35,'2016-12-20 22:00:06','2016-12-20 22:00:06'),(45,1,36,'2016-12-21 16:02:41','2016-12-21 16:02:41'),(46,1,37,'2016-12-22 20:06:21','2016-12-22 20:06:21'),(47,1,38,'2017-01-10 22:17:08','2017-01-10 22:17:08');
/*!40000 ALTER TABLE `job_operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_supervisors`
--

DROP TABLE IF EXISTS `job_supervisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_supervisors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_supervisors`
--

LOCK TABLES `job_supervisors` WRITE;
/*!40000 ALTER TABLE `job_supervisors` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_supervisors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `basepay` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,NULL,'Obrero agrícola','Trabaja en lotes o vivero.','2016-08-25 14:08:24','2016-10-26 16:42:35','Activo',689455,NULL),(3,NULL,'Motosierrista','','2016-09-05 19:31:19','2016-10-26 16:42:16','Activo',750000,NULL),(4,NULL,'Alambrador','Quita y pone postes.','2016-09-07 16:25:47','2016-11-17 20:44:00','Activo',689455,NULL),(5,NULL,'Ayudante de motosierra','','2016-09-13 16:56:56','2016-10-26 16:41:53','Activo',689455,NULL),(6,NULL,'Maestro de obra','','2016-09-13 16:57:03','2016-10-26 16:42:04','Activo',1000000,NULL),(7,NULL,'Ayudante de obra','','2016-09-13 16:57:10','2016-11-22 22:04:26','Activo',689455,0),(10,NULL,'Vigilante','','2016-10-13 20:33:43','2016-10-26 16:42:26','Activo',689455,NULL),(11,NULL,'Supervisor','','2016-11-02 21:27:21','2016-11-02 21:27:21','Activo',1300000,NULL);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labor_costcs`
--

DROP TABLE IF EXISTS `labor_costcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labor_costcs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `costc_id` int(11) DEFAULT NULL,
  `labor_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labor_costcs`
--

LOCK TABLES `labor_costcs` WRITE;
/*!40000 ALTER TABLE `labor_costcs` DISABLE KEYS */;
INSERT INTO `labor_costcs` VALUES (1,5,3,'2016-09-02 19:38:17','2016-09-02 19:38:17'),(2,6,3,'2016-09-02 19:38:56','2016-09-02 19:38:56'),(3,4,3,'2016-09-05 19:48:57','2016-09-05 19:48:57'),(4,6,3,'2016-09-05 19:58:04','2016-09-05 19:58:04'),(5,7,4,'2016-09-05 20:05:20','2016-09-05 20:05:20'),(6,7,3,'2016-09-05 21:04:09','2016-09-05 21:04:09'),(7,7,3,'2016-09-05 21:04:16','2016-09-05 21:04:16'),(8,5,3,'2016-09-07 14:48:48','2016-09-07 14:48:48'),(9,5,4,'2016-09-07 14:48:48','2016-09-07 14:48:48'),(10,5,5,'2016-09-07 14:48:48','2016-09-07 14:48:48'),(11,6,3,'2016-09-07 15:17:57','2016-09-07 15:17:57'),(12,7,3,'2016-09-07 15:21:25','2016-09-07 15:21:25'),(13,8,3,'2016-09-07 15:21:58','2016-09-07 15:21:58'),(14,8,4,'2016-09-07 15:21:58','2016-09-07 15:21:58'),(15,9,3,'2016-09-07 15:40:12','2016-09-07 15:40:12'),(16,9,4,'2016-09-07 15:40:12','2016-09-07 15:40:12'),(17,9,5,'2016-09-07 15:40:12','2016-09-07 15:40:12'),(18,10,3,'2016-09-07 15:41:01','2016-09-07 15:41:01'),(19,11,3,'2016-09-07 15:44:20','2016-09-07 15:44:20'),(20,11,5,'2016-09-07 15:44:20','2016-09-07 15:44:20'),(21,5,3,'2016-09-13 17:12:13','2016-09-13 17:12:13'),(22,5,4,'2016-09-13 17:12:13','2016-09-13 17:12:13'),(23,5,5,'2016-09-13 17:12:13','2016-09-13 17:12:13'),(24,6,3,'2016-09-13 17:22:55','2016-09-13 17:22:55'),(25,6,5,'2016-09-13 17:22:55','2016-09-13 17:22:55'),(26,6,4,'2016-09-13 17:22:55','2016-09-13 17:22:55'),(27,7,3,'2016-09-13 17:23:26','2016-09-13 17:23:26'),(28,8,3,'2016-09-13 17:31:38','2016-09-13 17:31:38'),(29,8,4,'2016-09-13 17:31:38','2016-09-13 17:31:38'),(30,9,3,'2016-09-13 17:31:55','2016-09-13 17:31:55'),(31,10,3,'2016-09-13 17:42:56','2016-09-13 17:42:56'),(32,8,3,'2016-09-13 19:24:37','2016-09-13 19:24:37'),(33,8,4,'2016-09-13 19:24:37','2016-09-13 19:24:37'),(34,8,5,'2016-09-13 19:24:37','2016-09-13 19:24:37'),(35,11,3,'2016-09-13 19:25:47','2016-09-13 19:25:47'),(36,12,3,'2016-09-13 19:28:33','2016-09-13 19:28:33'),(37,13,3,'2016-09-13 19:29:14','2016-09-13 19:29:14'),(38,13,4,'2016-09-13 19:29:14','2016-09-13 19:29:14'),(39,14,3,'2016-09-13 19:29:33','2016-09-13 19:29:33'),(40,14,4,'2016-09-13 19:29:33','2016-09-13 19:29:33'),(41,14,5,'2016-09-13 19:29:33','2016-09-13 19:29:33'),(42,13,3,'2016-09-13 19:29:55','2016-09-13 19:29:55'),(43,15,3,'2016-09-13 19:30:51','2016-09-13 19:30:51'),(44,15,3,'2016-09-13 19:31:43','2016-09-13 19:31:43'),(45,15,4,'2016-09-13 19:31:43','2016-09-13 19:31:43'),(46,15,3,'2016-09-13 19:51:57','2016-09-13 19:51:57'),(47,15,4,'2016-09-13 19:51:57','2016-09-13 19:51:57'),(48,15,5,'2016-09-13 19:51:57','2016-09-13 19:51:57'),(49,14,3,'2016-09-13 19:57:23','2016-09-13 19:57:23'),(89,16,3,'2016-09-15 20:58:09','2016-09-15 20:58:09'),(90,19,3,'2016-09-15 20:58:09','2016-09-15 20:58:09'),(96,18,5,'2016-09-15 21:14:12','2016-09-15 21:14:12'),(104,18,12,'2016-09-15 21:16:27','2016-09-15 21:16:27'),(106,16,13,'2016-09-15 21:38:55','2016-09-15 21:38:55'),(109,20,4,'2016-10-05 14:31:41','2016-10-05 14:31:41'),(110,20,5,'2016-10-05 14:31:41','2016-10-05 14:31:41'),(112,20,12,'2016-10-05 14:31:41','2016-10-05 14:31:41'),(117,18,6,'2016-10-14 15:45:56','2016-10-14 15:45:56'),(118,20,6,'2016-10-14 15:45:56','2016-10-14 15:45:56'),(119,16,14,'2016-10-14 15:48:51','2016-10-14 15:48:51'),(125,16,5,'2016-10-14 17:22:26','2016-10-14 17:22:26'),(126,16,6,'2016-10-14 17:22:26','2016-10-14 17:22:26'),(127,16,12,'2016-10-14 17:22:26','2016-10-14 17:22:26'),(128,21,4,'2016-10-14 17:26:33','2016-10-14 17:26:33'),(139,19,4,'2016-10-19 20:45:05','2016-10-19 20:45:05'),(140,19,5,'2016-10-19 20:45:05','2016-10-19 20:45:05'),(141,16,13,'2016-11-03 13:56:18','2016-11-03 13:56:18'),(142,18,13,'2016-11-03 13:56:18','2016-11-03 13:56:18'),(143,19,13,'2016-11-03 13:56:18','2016-11-03 13:56:18'),(144,16,14,'2016-11-03 13:56:42','2016-11-03 13:56:42'),(145,18,14,'2016-11-03 13:56:42','2016-11-03 13:56:42'),(146,19,14,'2016-11-03 13:56:43','2016-11-03 13:56:43'),(147,16,15,'2016-11-03 13:57:01','2016-11-03 13:57:01'),(148,18,15,'2016-11-03 13:57:02','2016-11-03 13:57:02'),(149,19,15,'2016-11-03 13:57:02','2016-11-03 13:57:02'),(150,20,4,'2016-11-08 13:23:19','2016-11-08 13:23:19'),(151,20,5,'2016-11-08 13:23:19','2016-11-08 13:23:19'),(152,20,6,'2016-11-08 13:23:19','2016-11-08 13:23:19'),(153,20,12,'2016-11-08 13:23:19','2016-11-08 13:23:19'),(154,20,13,'2016-11-08 13:23:19','2016-11-08 13:23:19'),(155,20,14,'2016-11-08 13:23:19','2016-11-08 13:23:19'),(156,21,4,'2016-11-08 13:24:34','2016-11-08 13:24:34'),(157,21,5,'2016-11-08 13:24:34','2016-11-08 13:24:34'),(158,21,6,'2016-11-08 13:24:34','2016-11-08 13:24:34'),(159,21,12,'2016-11-08 13:24:34','2016-11-08 13:24:34'),(160,22,5,'2016-11-09 15:33:03','2016-11-09 15:33:03'),(161,22,6,'2016-11-09 15:33:03','2016-11-09 15:33:03'),(162,16,16,'2016-11-18 15:01:47','2016-11-18 15:01:47'),(163,18,16,'2016-11-18 15:01:47','2016-11-18 15:01:47'),(164,22,16,'2016-11-18 15:01:47','2016-11-18 15:01:47'),(186,16,17,'2016-11-18 16:33:52','2016-11-18 16:33:52'),(187,18,17,'2016-11-18 16:33:52','2016-11-18 16:33:52'),(188,22,17,'2016-11-18 16:33:52','2016-11-18 16:33:52'),(189,16,18,'2016-11-18 16:34:14','2016-11-18 16:34:14'),(190,18,18,'2016-11-18 16:34:14','2016-11-18 16:34:14'),(191,22,18,'2016-11-18 16:34:14','2016-11-18 16:34:14'),(192,16,19,'2016-11-18 16:34:30','2016-11-18 16:34:30'),(193,18,19,'2016-11-18 16:34:30','2016-11-18 16:34:30'),(194,22,19,'2016-11-18 16:34:30','2016-11-18 16:34:30'),(195,16,20,'2016-11-18 16:34:45','2016-11-18 16:34:45'),(196,18,20,'2016-11-18 16:34:45','2016-11-18 16:34:45'),(197,22,20,'2016-11-18 16:34:45','2016-11-18 16:34:45'),(198,16,21,'2016-11-18 16:35:01','2016-11-18 16:35:01'),(199,18,21,'2016-11-18 16:35:01','2016-11-18 16:35:01'),(200,22,21,'2016-11-18 16:35:01','2016-11-18 16:35:01'),(201,16,22,'2016-11-18 16:35:29','2016-11-18 16:35:29'),(202,18,22,'2016-11-18 16:35:29','2016-11-18 16:35:29'),(203,22,22,'2016-11-18 16:35:29','2016-11-18 16:35:29'),(207,16,23,'2016-11-18 16:36:03','2016-11-18 16:36:03'),(208,18,23,'2016-11-18 16:36:03','2016-11-18 16:36:03'),(209,22,23,'2016-11-18 16:36:03','2016-11-18 16:36:03'),(210,16,24,'2016-11-30 16:05:41','2016-11-30 16:05:41'),(211,18,24,'2016-11-30 16:05:41','2016-11-30 16:05:41'),(212,22,24,'2016-11-30 16:05:41','2016-11-30 16:05:41'),(213,16,25,'2016-11-30 16:57:21','2016-11-30 16:57:21'),(214,18,25,'2016-11-30 16:57:21','2016-11-30 16:57:21'),(215,22,25,'2016-11-30 16:57:21','2016-11-30 16:57:21'),(216,16,4,'2016-11-30 21:11:41','2016-11-30 21:11:41'),(217,18,4,'2016-11-30 21:11:41','2016-11-30 21:11:41');
/*!40000 ALTER TABLE `labor_costcs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labor_jobs`
--

DROP TABLE IF EXISTS `labor_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labor_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `labor_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labor_jobs`
--

LOCK TABLES `labor_jobs` WRITE;
/*!40000 ALTER TABLE `labor_jobs` DISABLE KEYS */;
INSERT INTO `labor_jobs` VALUES (4,3,4,'2016-09-15 19:50:26','2016-09-15 19:50:26'),(9,4,9,'2016-10-13 20:33:08','2016-10-13 20:33:08'),(10,5,9,'2016-10-13 20:33:08','2016-10-13 20:33:08'),(11,6,9,'2016-10-13 20:33:08','2016-10-13 20:33:08'),(12,12,9,'2016-10-13 20:33:08','2016-10-13 20:33:08'),(25,4,12,'2016-10-26 16:40:08','2016-10-26 16:40:08'),(28,4,13,'2016-10-26 17:02:02','2016-10-26 17:02:02'),(29,4,4,'2016-11-09 21:32:05','2016-11-09 21:32:05'),(30,6,4,'2016-11-09 21:32:06','2016-11-09 21:32:06'),(31,5,5,'2016-11-09 21:32:12','2016-11-09 21:32:12'),(32,6,5,'2016-11-09 21:32:12','2016-11-09 21:32:12'),(33,12,5,'2016-11-09 21:32:12','2016-11-09 21:32:12'),(34,13,5,'2016-11-09 21:32:12','2016-11-09 21:32:12'),(35,14,5,'2016-11-09 21:32:12','2016-11-09 21:32:12'),(36,15,5,'2016-11-09 21:32:12','2016-11-09 21:32:12'),(37,4,5,'2016-11-09 21:32:12','2016-11-09 21:32:12'),(38,4,7,'2016-11-09 21:32:17','2016-11-09 21:32:17'),(39,5,7,'2016-11-09 21:32:17','2016-11-09 21:32:17'),(40,6,7,'2016-11-09 21:32:17','2016-11-09 21:32:17'),(41,12,7,'2016-11-09 21:32:17','2016-11-09 21:32:17'),(42,4,6,'2016-11-09 21:32:22','2016-11-09 21:32:22'),(43,5,6,'2016-11-09 21:32:22','2016-11-09 21:32:22'),(44,6,6,'2016-11-09 21:32:22','2016-11-09 21:32:22'),(45,12,6,'2016-11-09 21:32:22','2016-11-09 21:32:22'),(46,13,6,'2016-11-09 21:32:22','2016-11-09 21:32:22'),(47,14,6,'2016-11-09 21:32:22','2016-11-09 21:32:22'),(48,4,3,'2016-11-09 21:32:30','2016-11-09 21:32:30'),(49,5,3,'2016-11-09 21:32:30','2016-11-09 21:32:30'),(50,6,3,'2016-11-09 21:32:31','2016-11-09 21:32:31'),(51,12,3,'2016-11-09 21:32:31','2016-11-09 21:32:31'),(59,4,10,'2016-11-09 21:32:47','2016-11-09 21:32:47'),(60,5,10,'2016-11-09 21:32:47','2016-11-09 21:32:47'),(61,6,10,'2016-11-09 21:32:47','2016-11-09 21:32:47'),(62,13,10,'2016-11-09 21:32:47','2016-11-09 21:32:47'),(63,14,10,'2016-11-09 21:32:47','2016-11-09 21:32:47'),(64,15,10,'2016-11-09 21:32:47','2016-11-09 21:32:47'),(65,4,11,'2016-11-15 14:13:51','2016-11-15 14:13:51'),(66,5,11,'2016-11-15 14:13:51','2016-11-15 14:13:51'),(67,6,11,'2016-11-15 14:13:51','2016-11-15 14:13:51'),(68,12,11,'2016-11-15 14:13:51','2016-11-15 14:13:51'),(69,4,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(70,5,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(71,6,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(72,12,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(73,13,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(74,14,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(75,15,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(76,16,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(77,17,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(78,18,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(79,19,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(80,20,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(81,21,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(82,22,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(83,23,1,'2016-11-30 21:51:43','2016-11-30 21:51:43'),(84,24,1,'2016-11-30 21:51:43','2016-11-30 21:51:43');
/*!40000 ALTER TABLE `labor_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labors`
--

DROP TABLE IF EXISTS `labors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `paymentunit` varchar(255) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `flag` int(11) DEFAULT NULL,
  `assistance` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labors`
--

LOCK TABLES `labors` WRITE;
/*!40000 ALTER TABLE `labors` DISABLE KEYS */;
INSERT INTO `labors` VALUES (4,NULL,'950','Licencia remunerada','Jornal',0,'2016-09-05 20:00:11','2016-11-30 21:11:41',NULL,'No'),(5,NULL,'960','Licencia no remunerada','Jornal',0,'2016-09-05 20:00:52','2016-09-15 21:14:12',NULL,'No'),(6,NULL,'201','Zanjeo','Planta',30,'2016-09-15 13:07:12','2016-10-14 15:45:56',NULL,'Si'),(12,NULL,'999','Ajuste','Mes',1,'2016-09-15 21:16:07','2016-09-15 21:16:27',NULL,'No'),(13,NULL,'970','Licencia ambulatoria','Planta',0,'2016-11-03 13:56:18','2016-11-03 13:56:18',NULL,'No'),(14,NULL,'980','Licencia arl','Jornal',0,'2016-11-03 13:56:42','2016-11-03 13:56:42',NULL,'No'),(15,NULL,'990','Falta injustificada','Jornal',0,'2016-11-03 13:57:01','2016-11-03 13:57:01',NULL,'No'),(16,NULL,'940','Licencia soat','Jornal',0,'2016-11-18 15:01:47','2016-11-18 15:01:47',NULL,'No'),(17,NULL,'919','Recargo nocturno','Jornal',1,'2016-11-18 15:02:44','2016-11-18 16:33:52',NULL,'No'),(18,NULL,'920','Recargo festivo diurno','Jornal',1,'2016-11-18 15:03:18','2016-11-18 16:34:14',NULL,'No'),(19,NULL,'921','Recargo festivo nocturno','Jornal',1,'2016-11-18 15:03:44','2016-11-18 16:34:30',NULL,'No'),(20,NULL,'922','Extra ordinaria diurna','Jornal',1,'2016-11-18 15:04:05','2016-11-18 16:34:45',NULL,'No'),(21,NULL,'923','Extra ordinaria nocturna','Jornal',1,'2016-11-18 15:04:45','2016-11-18 16:35:01',NULL,'No'),(22,NULL,'924','Extra festiva diurna','Jornal',1,'2016-11-18 15:05:21','2016-11-18 16:35:29',NULL,'No'),(23,NULL,'925','Extra festiva nocturna','Jornal',1,'2016-11-18 15:05:39','2016-11-18 16:35:43',NULL,'No'),(24,NULL,'918','Turno de vigilancia','Jornal',22000,'2016-11-30 16:05:41','2016-11-30 16:05:41',NULL,'Si');
/*!40000 ALTER TABLE `labors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `novelties`
--

DROP TABLE IF EXISTS `novelties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `novelties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supervisor_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `labor_id` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `wageamount` float DEFAULT NULL,
  `laboramount` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `subtotal` float DEFAULT NULL,
  `registerdate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `novelties`
--

LOCK TABLES `novelties` WRITE;
/*!40000 ALTER TABLE `novelties` DISABLE KEYS */;
/*!40000 ALTER TABLE `novelties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operator_supervisors`
--

DROP TABLE IF EXISTS `operator_supervisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operator_supervisors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supervisor_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operator_supervisors`
--

LOCK TABLES `operator_supervisors` WRITE;
/*!40000 ALTER TABLE `operator_supervisors` DISABLE KEYS */;
/*!40000 ALTER TABLE `operator_supervisors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operators`
--

DROP TABLE IF EXISTS `operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cc` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `dateadmission` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `retirementdate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `transportaid` varchar(255) DEFAULT NULL,
  `feedingAllowance` int(11) DEFAULT NULL,
  `feedingAllowancen` int(11) DEFAULT NULL,
  `sanction` int(11) DEFAULT NULL,
  `childrenLicenseSince` datetime DEFAULT NULL,
  `childrenLicenseUntil` datetime DEFAULT NULL,
  `transportAllowance` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `vehicleAllowance` int(11) DEFAULT NULL,
  `housingAllowance` int(11) DEFAULT NULL,
  `basepay` int(11) DEFAULT NULL,
  `billingc_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `liquidated` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operators`
--

LOCK TABLES `operators` WRITE;
/*!40000 ALTER TABLE `operators` DISABLE KEYS */;
INSERT INTO `operators` VALUES (13,'1','Prueba','2016-12-13 14:22:16','2016-12-13 14:22:16','Operario','2016-12-20 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'Completo',1,NULL,NULL,689455,13,4,NULL),(14,'2','Prueba','2016-12-13 14:23:13','2016-12-13 14:23:35','Retiro','2016-12-13 00:00:00','Reintegrado',NULL,'2016-12-14 00:00:00',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'Mitad',1,NULL,NULL,700000,13,4,NULL),(15,'3','Prueba','2016-12-13 19:32:07','2016-12-13 19:32:07','Mensual','2016-12-01 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'Completo',1,NULL,NULL,689455,13,3,NULL),(16,'4','Prueba','2016-12-14 13:52:53','2016-12-14 13:53:09','Retiro2','2016-12-14 00:00:00','Retirado',NULL,'2016-12-21 00:00:00',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'No aplica',1,NULL,NULL,689455,13,3,NULL),(17,'5','Empleado','2016-12-14 14:05:38','2016-12-14 14:05:38','Vigilante','2016-12-01 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'Completo',1,NULL,NULL,689455,13,4,NULL),(18,'6','Prueba','2016-12-14 17:05:04','2016-12-14 17:05:04','11','2016-11-01 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'Completo',1,NULL,NULL,689455,13,3,NULL),(19,'7','Prueba','2016-12-14 19:22:50','2016-12-14 19:22:50','Anterior','2016-12-01 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'Completo',1,NULL,NULL,689455,13,3,NULL),(20,'8','Prueba','2016-12-16 21:39:57','2016-12-16 21:39:57','Incompleto','2016-12-01 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'Completo',1,NULL,NULL,689455,13,3,NULL),(21,'9','Operario','2016-12-16 22:13:24','2016-12-16 22:17:57','Retiro3','2016-12-01 00:00:00','Retirado',NULL,'2016-12-02 00:00:00',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'No aplica',1,NULL,NULL,689455,13,3,NULL),(22,'10','Operario','2016-12-16 22:22:54','2016-12-16 22:22:54','Inasistencia','2016-12-16 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'No aplica',1,NULL,NULL,689455,13,3,NULL),(23,'11','Operario','2016-12-16 22:35:32','2016-12-16 22:37:25','Retirado4','2016-12-01 00:00:00','Retirado',NULL,'2016-12-02 00:00:00',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'Completo',1,NULL,NULL,689455,13,3,NULL),(24,'12','Prueba','2016-12-19 16:32:33','2016-12-19 16:32:33','31','2016-12-29 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'No aplica',1,NULL,NULL,689455,13,3,NULL),(25,'13','Prueba','2016-12-19 16:39:53','2016-12-19 16:39:53','31coninasistencia','2016-12-29 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'Completo',1,NULL,NULL,689455,13,3,NULL),(26,'14','Prueba','2016-12-19 16:47:51','2016-12-19 16:47:51','Pasando31','2016-12-29 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'Completo',1,NULL,NULL,689455,13,3,NULL),(33,'16','Prueba','2016-12-20 21:44:11','2016-12-20 21:44:11','1solo','2016-12-01 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'Completo',1,NULL,NULL,689455,13,3,NULL),(34,'17','Prueba','2016-12-20 21:47:39','2016-12-20 21:47:39','soloundia31','2016-12-31 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'Completo',1,NULL,NULL,689455,13,3,NULL),(35,'18','Prueba','2016-12-20 22:00:05','2016-12-20 22:00:05','1solodia2','2016-12-01 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'No aplica',1,NULL,NULL,689455,13,3,NULL),(36,'19','Prueba','2016-12-21 16:02:40','2016-12-21 16:02:40','domingo','2016-12-02 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'No aplica',1,NULL,NULL,689455,13,3,NULL),(37,'20','Prueba','2016-12-22 20:06:21','2016-12-22 20:06:21','Mescompleto','2016-12-01 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'No aplica',1,NULL,NULL,689455,13,3,NULL),(38,'1','Prueba','2017-01-10 22:17:08','2017-01-10 22:17:08','Licencia950','2016-12-01 00:00:00','Activo',NULL,NULL,NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,'No aplica',1,NULL,NULL,689455,13,3,NULL);
/*!40000 ALTER TABLE `operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_jobs`
--

DROP TABLE IF EXISTS `record_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `changejobdate` datetime DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_jobs`
--

LOCK TABLES `record_jobs` WRITE;
/*!40000 ALTER TABLE `record_jobs` DISABLE KEYS */;
INSERT INTO `record_jobs` VALUES (12,13,NULL,'2016-12-13 14:22:16','2016-12-13 14:22:16','2016-12-20 00:00:00',1),(13,14,NULL,'2016-12-13 14:23:13','2016-12-13 14:23:13','2016-12-13 00:00:00',1),(14,15,NULL,'2016-12-13 19:32:07','2016-12-13 19:32:07','2016-12-01 00:00:00',1),(15,16,NULL,'2016-12-14 13:52:53','2016-12-14 13:52:53','2016-12-14 00:00:00',1),(16,17,NULL,'2016-12-14 14:05:39','2016-12-14 14:05:39','2016-12-01 00:00:00',10),(17,18,NULL,'2016-12-14 17:05:04','2016-12-14 17:05:04','2016-11-01 00:00:00',1),(18,19,NULL,'2016-12-14 19:22:51','2016-12-14 19:22:51','2016-12-01 00:00:00',1),(19,20,NULL,'2016-12-16 21:39:57','2016-12-16 21:39:57','2016-12-01 00:00:00',1),(20,21,NULL,'2016-12-16 22:13:25','2016-12-16 22:13:25','2016-12-01 00:00:00',1),(21,22,NULL,'2016-12-16 22:22:54','2016-12-16 22:22:54','2016-12-16 00:00:00',1),(22,23,NULL,'2016-12-16 22:35:32','2016-12-16 22:35:32','2016-12-01 00:00:00',1),(23,24,NULL,'2016-12-19 16:32:33','2016-12-19 16:32:33','2016-12-29 00:00:00',1),(24,25,NULL,'2016-12-19 16:39:53','2016-12-19 16:39:53','2016-12-29 00:00:00',1),(25,26,NULL,'2016-12-19 16:47:52','2016-12-19 16:47:52','2016-12-29 00:00:00',1),(26,27,NULL,'2016-12-19 21:26:22','2016-12-19 21:26:22','2016-12-31 00:00:00',1),(27,32,NULL,'2016-12-20 21:38:15','2016-12-20 21:38:15','2016-12-01 00:00:00',1),(28,33,NULL,'2016-12-20 21:44:11','2016-12-20 21:44:11','2016-12-01 00:00:00',1),(29,34,NULL,'2016-12-20 21:47:40','2016-12-20 21:47:40','2016-12-31 00:00:00',1),(30,35,NULL,'2016-12-20 22:00:06','2016-12-20 22:00:06','2016-12-01 00:00:00',1),(31,36,NULL,'2016-12-21 16:02:41','2016-12-21 16:02:41','2016-12-02 00:00:00',1),(32,37,NULL,'2016-12-22 20:06:21','2016-12-22 20:06:21','2016-12-01 00:00:00',1),(33,38,NULL,'2017-01-10 22:17:08','2017-01-10 22:17:08','2016-12-01 00:00:00',1);
/*!40000 ALTER TABLE `record_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_operators`
--

DROP TABLE IF EXISTS `record_operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_operators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_operators`
--

LOCK TABLES `record_operators` WRITE;
/*!40000 ALTER TABLE `record_operators` DISABLE KEYS */;
/*!40000 ALTER TABLE `record_operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `dateadmission` datetime DEFAULT NULL,
  `retirementdate` datetime DEFAULT NULL,
  `reinstatedate` datetime DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (69,NULL,13,'Activo',NULL,'2016-12-13 14:22:16','2016-12-13 14:22:16','2016-12-20 00:00:00',NULL,NULL,NULL),(70,NULL,14,'Activo',NULL,'2016-12-13 14:23:13','2016-12-13 14:23:13','2016-12-13 00:00:00',NULL,NULL,NULL),(71,NULL,14,'Retirado','Retiro 1','2016-12-13 14:23:27','2016-12-13 14:23:27',NULL,'2016-12-14 00:00:00',NULL,NULL),(72,NULL,14,'Reintegrado','','2016-12-13 14:23:35','2016-12-13 14:23:35',NULL,NULL,'2016-12-15 00:00:00',NULL),(73,NULL,15,'Activo',NULL,'2016-12-13 19:32:07','2016-12-13 19:32:07','2016-12-01 00:00:00',NULL,NULL,NULL),(74,NULL,16,'Activo',NULL,'2016-12-14 13:52:53','2016-12-14 13:52:53','2016-12-14 00:00:00',NULL,NULL,NULL),(75,NULL,16,'Retirado','','2016-12-14 13:53:09','2016-12-14 13:53:09',NULL,'2016-12-21 00:00:00',NULL,NULL),(76,NULL,17,'Activo',NULL,'2016-12-14 14:05:39','2016-12-14 14:05:39','2016-12-01 00:00:00',NULL,NULL,NULL),(77,NULL,18,'Activo',NULL,'2016-12-14 17:05:04','2016-12-14 17:05:04','2016-11-01 00:00:00',NULL,NULL,NULL),(78,NULL,19,'Activo',NULL,'2016-12-14 19:22:51','2016-12-14 19:22:51','2016-12-01 00:00:00',NULL,NULL,NULL),(79,NULL,20,'Activo',NULL,'2016-12-16 21:39:57','2016-12-16 21:39:57','2016-12-01 00:00:00',NULL,NULL,NULL),(80,NULL,21,'Activo',NULL,'2016-12-16 22:13:24','2016-12-16 22:13:24','2016-12-01 00:00:00',NULL,NULL,NULL),(81,NULL,21,'Retirado','','2016-12-16 22:17:57','2016-12-16 22:17:57',NULL,'2016-12-02 00:00:00',NULL,NULL),(82,NULL,22,'Activo',NULL,'2016-12-16 22:22:54','2016-12-16 22:22:54','2016-12-16 00:00:00',NULL,NULL,NULL),(83,NULL,23,'Activo',NULL,'2016-12-16 22:35:32','2016-12-16 22:35:32','2016-12-01 00:00:00',NULL,NULL,NULL),(84,NULL,23,'Retirado','','2016-12-16 22:37:25','2016-12-16 22:37:25',NULL,'2016-12-02 00:00:00',NULL,NULL),(85,NULL,24,'Activo',NULL,'2016-12-19 16:32:33','2016-12-19 16:32:33','2016-12-29 00:00:00',NULL,NULL,NULL),(86,NULL,25,'Activo',NULL,'2016-12-19 16:39:53','2016-12-19 16:39:53','2016-12-29 00:00:00',NULL,NULL,NULL),(87,NULL,26,'Activo',NULL,'2016-12-19 16:47:52','2016-12-19 16:47:52','2016-12-29 00:00:00',NULL,NULL,NULL),(88,NULL,27,'Activo',NULL,'2016-12-19 21:26:22','2016-12-19 21:26:22','2016-12-31 00:00:00',NULL,NULL,NULL),(89,NULL,28,'Activo',NULL,'2016-12-20 21:36:40','2016-12-20 21:36:40',NULL,NULL,NULL,NULL),(90,NULL,29,'Activo',NULL,'2016-12-20 21:36:40','2016-12-20 21:36:40',NULL,NULL,NULL,NULL),(91,NULL,30,'Activo',NULL,'2016-12-20 21:36:41','2016-12-20 21:36:41',NULL,NULL,NULL,NULL),(92,NULL,31,'Activo',NULL,'2016-12-20 21:36:41','2016-12-20 21:36:41',NULL,NULL,NULL,NULL),(93,NULL,32,'Activo',NULL,'2016-12-20 21:38:15','2016-12-20 21:38:15','2016-12-01 00:00:00',NULL,NULL,NULL),(94,NULL,33,'Activo',NULL,'2016-12-20 21:44:11','2016-12-20 21:44:11','2016-12-01 00:00:00',NULL,NULL,NULL),(95,NULL,34,'Activo',NULL,'2016-12-20 21:47:40','2016-12-20 21:47:40','2016-12-31 00:00:00',NULL,NULL,NULL),(96,NULL,35,'Activo',NULL,'2016-12-20 22:00:05','2016-12-20 22:00:05','2016-12-01 00:00:00',NULL,NULL,NULL),(97,NULL,36,'Activo',NULL,'2016-12-21 16:02:41','2016-12-21 16:02:41','2016-12-02 00:00:00',NULL,NULL,NULL),(98,NULL,37,'Activo',NULL,'2016-12-22 20:06:21','2016-12-22 20:06:21','2016-12-01 00:00:00',NULL,NULL,NULL),(99,NULL,38,'Activo',NULL,'2017-01-10 22:17:08','2017-01-10 22:17:08','2016-12-01 00:00:00',NULL,NULL,NULL);
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registers`
--

DROP TABLE IF EXISTS `registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleAllowance` int(11) DEFAULT NULL,
  `housingAllowance` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `feedingAllowance` int(11) DEFAULT NULL,
  `feedingAllowancen` int(11) DEFAULT NULL,
  `sanction` int(11) DEFAULT NULL,
  `childrenLicenseSince` datetime DEFAULT NULL,
  `childrenLicenseUntil` datetime DEFAULT NULL,
  `extraLegalAllowance` int(11) DEFAULT NULL,
  `salesCommision` int(11) DEFAULT NULL,
  `customerDiscount` int(11) DEFAULT NULL,
  `transportAllowance` int(11) DEFAULT NULL,
  `registerDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registers`
--

LOCK TABLES `registers` WRITE;
/*!40000 ALTER TABLE `registers` DISABLE KEYS */;
/*!40000 ALTER TABLE `registers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_roles_on_name` (`name`),
  KEY `index_roles_on_name_and_resource_type_and_resource_id` (`name`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160823141807'),('20160823193823'),('20160824193010'),('20160824193342'),('20160825020906'),('20160830141921'),('20160831162019'),('20160831193609'),('20160831204319'),('20160831215728'),('20160831220641'),('20160831220708'),('20160831220737'),('20160901021551'),('20160902163723'),('20160902163746'),('20160902194333'),('20160905221124'),('20160912140532'),('20160912171250'),('20160912192553'),('20160912192628'),('20160912193712'),('20160912193744'),('20160914141027'),('20160914141121'),('20160914150910'),('20160914152809'),('20160914152859'),('20160914183621'),('20160914201134'),('20160915220429'),('20160915220729'),('20160916012502'),('20160916012532'),('20160919141623'),('20160919172513'),('20160920211259'),('20160921163528'),('20160921163608'),('20161004220548'),('20161005163401'),('20161005171501'),('20161007204529'),('20161012032052'),('20161012143627'),('20161012144034'),('20161019202209'),('20161026163322'),('20161103195725'),('20161103195941'),('20161109193930'),('20161110222438'),('20161111151832'),('20161111154024'),('20161115021827'),('20161116132709'),('20161116155921'),('20161116211612'),('20161116211645'),('20161116211848'),('20161121214334'),('20161121214426'),('20161122014621'),('20161122015527'),('20161122022058'),('20161122022126'),('20161122022143'),('20161122022211'),('20161122022258'),('20161128150508'),('20161128164212'),('20161128164508'),('20161128171850'),('20161128171920'),('20161128190130'),('20161128190147'),('20161128220558'),('20161130150550'),('20161130153015'),('20161130153103'),('20161130201020'),('20161201145137'),('20161201145149'),('20161201145537'),('20161201145610'),('20161201192747'),('20161201193810'),('20161202135114'),('20161205152648'),('20161205164711'),('20161205164731'),('20161207193949'),('20161207194420'),('20161223191922'),('20161223191936');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sublots`
--

DROP TABLE IF EXISTS `sublots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sublots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `costc_id` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sublots`
--

LOCK TABLES `sublots` WRITE;
/*!40000 ALTER TABLE `sublots` DISABLE KEYS */;
INSERT INTO `sublots` VALUES (5,'SM1L','Sublote M1 Loma',NULL,'sadasdasd','2016-09-07 13:52:57','2016-10-14 16:51:10',16,NULL),(8,'SM1V','Sublote M1 Vega',NULL,'','2016-09-14 16:23:59','2016-09-14 16:25:55',16,NULL),(9,'SM2V','Sublote M2 Vega',NULL,'','2016-09-14 16:38:43','2016-09-14 16:38:43',18,NULL);
/*!40000 ALTER TABLE `sublots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisors`
--

DROP TABLE IF EXISTS `supervisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `dateadmission` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `retirementdate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `transportaid` varchar(255) DEFAULT NULL,
  `feedingAllowance` int(11) DEFAULT NULL,
  `feedingAllowancen` int(11) DEFAULT NULL,
  `sanction` int(11) DEFAULT NULL,
  `childrenLicenseSince` datetime DEFAULT NULL,
  `childrenLicenseUntil` datetime DEFAULT NULL,
  `transportAllowance` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `vehicleAllowance` int(11) DEFAULT NULL,
  `housingAllowance` int(11) DEFAULT NULL,
  `basepay` int(11) DEFAULT NULL,
  `billingc_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `liquidated` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisors`
--

LOCK TABLES `supervisors` WRITE;
/*!40000 ALTER TABLE `supervisors` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervisors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcriptions`
--

DROP TABLE IF EXISTS `transcriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transcriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supervisor_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `labor_id` int(11) DEFAULT NULL,
  `costc_id` int(11) DEFAULT NULL,
  `sublot_id` int(11) DEFAULT NULL,
  `wageamount` float DEFAULT NULL,
  `laboramount` float DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `area` varchar(255) DEFAULT NULL,
  `registerdate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcriptions`
--

LOCK TABLES `transcriptions` WRITE;
/*!40000 ALTER TABLE `transcriptions` DISABLE KEYS */;
INSERT INTO `transcriptions` VALUES (26,NULL,13,NULL,6,16,5,1,1,30,'2016-12-13 14:44:53','2016-12-13 14:44:53',NULL,'2016-12-20'),(27,NULL,13,NULL,6,16,5,2,2,60,'2016-12-13 14:46:01','2016-12-13 14:46:01',NULL,'2016-12-21'),(28,NULL,13,NULL,6,16,5,3,3,90,'2016-12-13 14:49:25','2016-12-13 14:49:25',NULL,'2016-12-22'),(29,NULL,13,NULL,6,16,5,4,4,120,'2016-12-13 14:50:09','2016-12-13 14:50:09',NULL,'2016-12-23'),(30,NULL,13,NULL,6,16,5,5,5,150,'2016-12-13 15:43:25','2016-12-13 15:43:25',NULL,'2016-12-24'),(31,NULL,13,NULL,6,16,5,6,6,180,'2016-12-13 15:43:38','2016-12-13 15:43:38',NULL,'2016-12-26'),(32,NULL,14,NULL,6,16,5,7,7,210,'2016-12-13 17:21:29','2016-12-13 17:21:29',NULL,'2016-12-13'),(33,NULL,14,NULL,6,18,9,8,8,240,'2016-12-13 17:21:44','2016-12-13 17:21:44',NULL,'2016-12-15'),(34,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:32:32','2016-12-13 19:32:32',NULL,'2016-12-01'),(35,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:32:47','2016-12-13 19:32:47',NULL,'2016-12-02'),(36,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:32:58','2016-12-13 19:32:58',NULL,'2016-12-03'),(37,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:33:35','2016-12-13 19:33:35',NULL,'2016-12-05'),(38,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:33:49','2016-12-13 19:33:49',NULL,'2016-12-06'),(39,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:34:03','2016-12-13 19:34:03',NULL,'2016-12-07'),(41,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:34:48','2016-12-13 19:34:48',NULL,'2016-12-09'),(42,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:35:17','2016-12-13 19:35:17',NULL,'2016-12-12'),(43,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:35:28','2016-12-13 19:35:28',NULL,'2016-12-13'),(44,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:37:30','2016-12-13 19:37:30',NULL,'2016-12-14'),(45,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:37:43','2016-12-13 19:37:43',NULL,'2016-12-15'),(46,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:37:57','2016-12-13 19:37:57',NULL,'2016-12-16'),(47,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:38:10','2016-12-13 19:38:10',NULL,'2016-12-17'),(48,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:38:22','2016-12-13 19:38:22',NULL,'2016-12-19'),(49,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:38:34','2016-12-13 19:38:34',NULL,'2016-12-20'),(50,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:38:48','2016-12-13 19:38:48',NULL,'2016-12-21'),(51,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:39:02','2016-12-13 19:39:02',NULL,'2016-12-22'),(52,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:39:18','2016-12-13 19:39:18',NULL,'2016-12-23'),(53,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:39:30','2016-12-13 19:39:30',NULL,'2016-12-24'),(54,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:39:44','2016-12-13 19:39:44',NULL,'2016-12-26'),(55,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:39:56','2016-12-13 19:39:56',NULL,'2016-12-27'),(56,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:40:10','2016-12-13 19:40:10',NULL,'2016-12-31'),(57,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:40:22','2016-12-13 19:40:22',NULL,'2016-12-29'),(58,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:40:36','2016-12-13 19:40:36',NULL,'2016-12-30'),(59,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 19:40:50','2016-12-13 19:40:50',NULL,'2016-12-28'),(60,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 20:11:54','2016-12-13 20:11:54',NULL,'2017-01-02'),(61,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 20:12:11','2016-12-13 20:12:11',NULL,'2017-01-03'),(62,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 20:12:25','2016-12-13 20:12:25',NULL,'2017-01-04'),(63,NULL,15,NULL,6,16,5,1,1,30,'2016-12-13 20:12:36','2016-12-13 20:12:36',NULL,'2017-01-05'),(64,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:42:12','2016-12-14 17:05:49',NULL,'2016-11-01'),(65,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:43:36','2016-12-14 17:05:57',NULL,'2016-11-02'),(66,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:44:08','2016-12-14 17:06:05',NULL,'2016-11-03'),(68,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:44:41','2016-12-14 17:06:24',NULL,'2016-11-07'),(69,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:44:56','2016-12-14 17:06:32',NULL,'2016-11-08'),(70,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:45:15','2016-12-14 17:06:44',NULL,'2016-11-09'),(71,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:45:37','2016-12-14 17:07:30',NULL,'2016-11-10'),(72,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:45:51','2016-12-14 17:07:37',NULL,'2016-11-11'),(73,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:46:18','2016-12-14 17:07:44',NULL,'2016-11-12'),(74,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:46:33','2016-12-14 17:07:53',NULL,'2016-11-14'),(75,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:46:54','2016-12-14 17:08:08',NULL,'2016-11-15'),(76,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:47:18','2016-12-14 17:08:19',NULL,'2016-11-16'),(77,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:47:30','2016-12-14 17:08:28',NULL,'2016-11-17'),(78,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:47:44','2016-12-14 17:08:41',NULL,'2016-11-18'),(79,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:48:01','2016-12-14 17:08:52',NULL,'2016-11-19'),(80,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:48:13','2016-12-14 17:09:04',NULL,'2016-11-21'),(81,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:48:30','2016-12-14 17:09:15',NULL,'2016-11-22'),(82,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:48:43','2016-12-14 17:09:24',NULL,'2016-11-23'),(83,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:49:00','2016-12-14 17:09:35',NULL,'2016-11-24'),(84,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:49:15','2016-12-14 17:09:45',NULL,'2016-11-25'),(85,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:49:32','2016-12-14 17:09:56',NULL,'2016-11-26'),(86,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:49:48','2016-12-14 17:10:13',NULL,'2016-11-28'),(87,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:50:03','2016-12-14 17:10:42',NULL,'2016-11-29'),(88,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:50:04','2016-12-14 17:10:55',NULL,'2016-11-29'),(89,NULL,18,NULL,6,16,5,1,1,30,'2016-12-14 16:50:22','2016-12-14 17:11:07',NULL,'2016-11-30'),(91,NULL,19,NULL,6,16,5,1,1,30,'2016-12-14 19:23:08','2016-12-14 19:23:08',NULL,'2016-11-30'),(92,NULL,16,NULL,6,16,5,1,1,30,'2016-12-15 13:41:05','2016-12-15 13:41:05',NULL,'2016-12-14'),(93,NULL,20,NULL,6,16,5,1,1,30,'2016-12-16 21:40:22','2016-12-16 21:40:22',NULL,'2016-12-01'),(94,NULL,20,NULL,6,16,5,1,1,30,'2016-12-16 22:04:18','2016-12-16 22:04:18',NULL,'2016-12-02'),(95,NULL,21,NULL,6,16,5,1,1,30,'2016-12-16 22:13:41','2016-12-16 22:13:41',NULL,'2016-12-01'),(96,NULL,21,NULL,6,16,5,1,1,30,'2016-12-16 22:17:19','2016-12-16 22:17:19',NULL,'2016-12-02'),(97,NULL,22,NULL,6,16,5,1,1,30,'2016-12-16 22:23:27','2016-12-16 22:23:27',NULL,'2016-12-16'),(98,NULL,22,NULL,5,16,5,1,1,0,'2016-12-16 22:23:49','2016-12-16 22:23:49',NULL,'2016-12-17'),(99,NULL,22,NULL,6,16,5,1,1,30,'2016-12-16 22:24:57','2016-12-16 22:24:57',NULL,'2016-12-19'),(100,NULL,22,NULL,4,16,5,1,1,0,'2016-12-16 22:25:31','2016-12-16 22:25:31',NULL,'2016-12-20'),(101,NULL,22,NULL,15,16,5,4,4,0,'2016-12-16 22:28:15','2016-12-16 22:28:15',NULL,'2016-12-21'),(102,NULL,23,NULL,4,16,5,1,1,0,'2016-12-16 22:36:19','2016-12-16 22:36:19',NULL,'2016-12-01'),(103,NULL,23,NULL,4,16,5,1,1,0,'2016-12-16 22:37:14','2016-12-16 22:37:14',NULL,'2016-12-02'),(105,NULL,24,NULL,6,16,5,1,1,30,'2016-12-19 16:33:11','2016-12-19 16:33:11',NULL,'2016-12-29'),(106,NULL,24,NULL,6,16,5,1,1,30,'2016-12-19 16:33:30','2016-12-19 16:33:30',NULL,'2016-12-30'),(107,NULL,24,NULL,6,16,5,1,1,30,'2016-12-19 16:33:41','2016-12-19 16:33:41',NULL,'2016-12-31'),(108,NULL,25,NULL,6,16,5,1,1,30,'2016-12-19 16:45:51','2016-12-19 16:45:51',NULL,'2016-12-29'),(109,NULL,25,NULL,6,16,5,1,1,30,'2016-12-19 16:46:17','2016-12-19 16:46:17',NULL,'2016-12-30'),(110,NULL,25,NULL,15,16,5,1,1,0,'2016-12-19 16:46:38','2016-12-19 16:46:38',NULL,'2016-12-31'),(111,NULL,26,NULL,6,16,5,1,1,30,'2016-12-19 16:48:18','2016-12-19 16:48:18',NULL,'2016-12-29'),(112,NULL,26,NULL,15,16,5,4,4,0,'2016-12-19 16:48:39','2016-12-19 16:48:39',NULL,'2016-12-30'),(114,NULL,22,NULL,15,16,5,1,1,0,'2016-12-19 20:19:03','2016-12-19 20:19:03',NULL,'2016-12-26'),(118,NULL,34,NULL,6,16,5,1,1,30,'2016-12-20 21:47:59','2016-12-20 21:47:59',NULL,'2016-12-31'),(119,NULL,33,NULL,6,16,5,1,1,30,'2016-12-20 21:48:14','2016-12-20 21:48:14',NULL,'2016-12-01'),(120,NULL,35,NULL,6,16,5,1,1,30,'2016-12-20 22:00:35','2016-12-20 22:00:35',NULL,'2016-12-02'),(121,NULL,36,NULL,6,16,5,1,1,30,'2016-12-21 16:03:05','2016-12-21 16:03:05',NULL,'2016-12-02'),(122,NULL,36,NULL,6,16,5,1,1,30,'2016-12-21 16:03:31','2016-12-21 16:03:31',NULL,'2016-12-03'),(123,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:06:41','2016-12-22 20:06:41',NULL,'2016-12-01'),(124,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:06:55','2016-12-22 20:06:55',NULL,'2016-12-02'),(125,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:07:10','2016-12-22 20:07:10',NULL,'2016-12-05'),(126,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:07:23','2016-12-22 20:07:23',NULL,'2016-12-06'),(127,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:07:37','2016-12-22 20:07:37',NULL,'2016-12-07'),(128,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:07:51','2016-12-22 20:07:51',NULL,'2016-12-08'),(129,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:08:38','2016-12-22 20:08:38',NULL,'2016-12-09'),(130,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:08:51','2016-12-22 20:08:51',NULL,'2016-12-10'),(131,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:09:09','2016-12-22 20:09:09',NULL,'2016-12-12'),(132,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:09:24','2016-12-22 20:09:24',NULL,'2016-12-13'),(133,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:09:37','2016-12-22 20:09:37',NULL,'2016-12-14'),(134,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:09:57','2016-12-22 20:09:57',NULL,'2016-12-15'),(135,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:10:16','2016-12-22 20:10:16',NULL,'2016-12-16'),(136,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:10:36','2016-12-22 20:10:36',NULL,'2016-12-17'),(137,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:10:49','2016-12-22 20:10:49',NULL,'2016-12-19'),(138,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:11:01','2016-12-22 20:11:01',NULL,'2016-12-20'),(139,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:11:22','2016-12-22 20:11:22',NULL,'2016-12-21'),(140,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:11:35','2016-12-22 20:11:35',NULL,'2016-12-22'),(141,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:11:48','2016-12-22 20:11:48',NULL,'2016-12-23'),(142,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:12:02','2016-12-22 20:12:02',NULL,'2016-12-23'),(143,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:12:14','2016-12-22 20:12:14',NULL,'2016-12-24'),(144,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:12:43','2016-12-22 20:12:43',NULL,'2016-12-26'),(145,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:12:55','2016-12-22 20:12:55',NULL,'2016-12-27'),(146,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:13:09','2016-12-22 20:13:09',NULL,'2016-12-28'),(147,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:13:21','2016-12-22 20:13:21',NULL,'2016-12-29'),(148,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:13:33','2016-12-22 20:13:33',NULL,'2016-12-30'),(149,NULL,37,NULL,6,16,5,1,1,30,'2016-12-22 20:13:46','2016-12-22 20:13:46',NULL,'2016-12-31'),(150,NULL,18,NULL,6,16,5,1,1,30,'2016-12-22 21:37:59','2016-12-22 21:37:59',NULL,'2016-11-04'),(151,NULL,38,NULL,4,16,5,1,1,0,'2017-01-10 22:17:33','2017-01-10 22:17:33',NULL,'2016-12-01');
/*!40000 ALTER TABLE `transcriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'a@a','$2a$11$/eIp4N5iB01vRRVzGisEWuG.crfWfVQhMlRgMpYVwk4PtLtn2CfX2',NULL,NULL,NULL,3,'2016-09-23 17:20:22','2016-09-23 16:10:16','127.0.0.1','127.0.0.1','2016-09-23 16:05:57','2016-09-23 17:20:22'),(2,'b@b','$2a$11$f0OtYyJj4hg6ihAG4395PexiC20UAmPv1AkhLdDU2t/hP0R78F486',NULL,NULL,NULL,2,'2016-09-23 20:40:41','2016-09-23 20:39:08','127.0.0.1','127.0.0.1','2016-09-23 20:39:08','2016-09-23 20:40:41');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  KEY `index_users_roles_on_user_id_and_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-10 17:33:36
