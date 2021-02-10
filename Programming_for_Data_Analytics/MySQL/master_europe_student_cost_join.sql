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
-- Table structure for table `student_cost_join`
--

DROP TABLE IF EXISTS `student_cost_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_cost_join` (
  `country` text,
  `total` bigint(20) DEFAULT NULL,
  `costschool` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_cost_join`
--

LOCK TABLES `student_cost_join` WRITE;
/*!40000 ALTER TABLE `student_cost_join` DISABLE KEYS */;
INSERT INTO `student_cost_join` VALUES ('Brazil',651,1270818.86),('Mexico',198,482468.83),('Chile ',49,92594),('Bolivia',39,92759.99),('El Salvador',22,66740.3),('Argentina',22,48828.1),('Honduras',19,53491.95),('Unknown',18,29742.66),('Costa Rica',9,15600),('Guatemala ',6,16737.02),('Turkey',5,14740),('Uruguay',5,15990),('Panama',5,18006.38),('Italy',5,10175.41),('Paraguay',3,5700),('Malaysia',3,7200),('Russia',2,4150),('Mongolia',2,9301),('South Korea',2,3320),('Spain',2,2600),('Spain ',1,0),('France ',1,0),('India',1,2470.78),('Taiwan',1,4280),('Japan',1,2800),('Portugal',1,2400),('France',1,2500),('Nicaragua ',1,0),('Colombia',1,3676),('Venezuela',1,0);
/*!40000 ALTER TABLE `student_cost_join` ENABLE KEYS */;
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
