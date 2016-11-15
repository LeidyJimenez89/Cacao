-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operators`
--

LOCK TABLES `operators` WRITE;
/*!40000 ALTER TABLE `operators` DISABLE KEYS */;
INSERT INTO `operators` VALUES (6,'213123','sadasd','2016-08-30 13:51:02','2016-09-12 18:35:48','dassdadasda','0012-12-12 00:00:00','Reintegrado',1,'2016-11-17 17:17:00',NULL,NULL),(8,'213123','saasdasd','2016-09-12 14:36:27','2016-09-12 18:36:05','asdasdasd','2016-09-12 14:36:00','Reintegrado',3,'2016-09-12 17:26:00',NULL,NULL),(9,'324234','dsfsdf','2016-09-12 15:06:20','2016-09-12 18:47:38','dsfsdfsd','2016-09-12 15:17:00','Reintegrado',1,'2016-09-12 18:48:00',NULL,NULL),(10,'435345','ewfrwe','2016-09-12 16:38:34','2016-09-12 18:48:05','fwefwef','2016-09-12 16:29:00','Reintegrado',1,'2016-09-12 18:36:00',NULL,NULL),(11,'345345','dsfsdf','2016-09-12 18:41:29','2016-09-12 18:47:55','sdfsdfsd','2016-09-12 18:41:00','Reintegrado',4,'2016-09-12 18:46:00',NULL,NULL),(12,'56456','fgdfg','2016-09-12 18:46:50','2016-09-12 19:16:28','dfgdfg','2016-09-12 18:46:00','Reintegrado',3,'2016-09-12 18:47:00',NULL,NULL),(13,'32423','sdasdasd','2016-09-12 18:58:34','2016-09-13 16:55:27','asdasdas','2016-09-12 18:58:00','Reintegrado',4,'2016-09-12 18:58:00','',NULL),(14,'21323','asdasd','2016-09-14 14:44:44','2016-09-14 14:44:44','asdasd','2016-09-14 14:44:00','Activo',1,NULL,NULL,'Masculino');
/*!40000 ALTER TABLE `operators` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-14 16:39:59
