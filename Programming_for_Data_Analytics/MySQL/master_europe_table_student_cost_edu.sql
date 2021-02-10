CREATE DATABASE  IF NOT EXISTS `master_europe` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `master_europe`;
-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: master_europe
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Table structure for table `table_student_cost_edu`
--

DROP TABLE IF EXISTS `table_student_cost_edu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_student_cost_edu` (
  `country` text,
  `total` bigint(20) DEFAULT NULL,
  `costschool` double DEFAULT NULL,
  `_merge` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_student_cost_edu`
--

LOCK TABLES `table_student_cost_edu` WRITE;
/*!40000 ALTER TABLE `table_student_cost_edu` DISABLE KEYS */;
INSERT INTO `table_student_cost_edu` VALUES ('Brazil',651,1270818.86,'both'),('Mexico',198,482468.83,'both'),('Chile ',49,92594,'both'),('Bolivia',39,92759.99,'both'),('El Salvador',22,66740.3,'both'),('Argentina',22,48828.1,'both'),('Honduras',19,53491.95,'both'),('Unknown',18,29742.66,'both'),('Costa Rica',9,15600,'both'),('Guatemala ',6,16737.02,'both'),('Turkey',5,14740,'both'),('Uruguay',5,15990,'both'),('Panama',5,18006.38,'both'),('Italy',5,10175.41,'both'),('Paraguay',3,5700,'both'),('Malaysia',3,7200,'both'),('Russia',2,4150,'both'),('Mongolia',2,9301,'both'),('South Korea',2,3320,'both'),('Spain',2,2600,'both'),('Spain ',1,0,'both'),('France ',1,0,'both'),('India',1,2470.78,'both'),('Taiwan',1,4280,'both'),('Japan',1,2800,'both'),('Portugal',1,2400,'both'),('France',1,2500,'both'),('Nicaragua ',1,0,'both'),('Colombia',1,3676,'both'),('Venezuela',1,0,'both');
/*!40000 ALTER TABLE `table_student_cost_edu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-27 14:16:34
