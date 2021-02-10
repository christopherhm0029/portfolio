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
-- Table structure for table `table_student_homesharing`
--

DROP TABLE IF EXISTS `table_student_homesharing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_student_homesharing` (
  `0` double DEFAULT NULL,
  `1` double DEFAULT NULL,
  `2` double DEFAULT NULL,
  `3` double DEFAULT NULL,
  `4` double DEFAULT NULL,
  `5` double DEFAULT NULL,
  `6` double DEFAULT NULL,
  `7` double DEFAULT NULL,
  `8` double DEFAULT NULL,
  `9` double DEFAULT NULL,
  `10` double DEFAULT NULL,
  `11` double DEFAULT NULL,
  `12` double DEFAULT NULL,
  `13` double DEFAULT NULL,
  `14` double DEFAULT NULL,
  `15` double DEFAULT NULL,
  `16` double DEFAULT NULL,
  `17` double DEFAULT NULL,
  `18` double DEFAULT NULL,
  `19` double DEFAULT NULL,
  `20` double DEFAULT NULL,
  `22` double DEFAULT NULL,
  `23` double DEFAULT NULL,
  `24` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_student_homesharing`
--

LOCK TABLES `table_student_homesharing` WRITE;
/*!40000 ALTER TABLE `table_student_homesharing` DISABLE KEYS */;
INSERT INTO `table_student_homesharing` VALUES (1,2,0,6,5,2,2,0,1,1,0,0,2,0,0,0,0,0,0,0,0,0,0,0),(3,2,3,4,8,4,2,2,1,0,3,2,3,1,0,1,0,0,0,0,0,0,0,0),(24,61,66,107,92,70,78,50,34,10,16,2,8,6,3,3,7,4,2,0,5,0,1,2),(1,3,5,5,7,7,7,1,5,2,2,0,1,0,2,0,0,0,0,0,0,1,0,0),(0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(1,1,0,1,0,2,1,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0),(4,0,4,2,5,3,1,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,0,0,0,1,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(1,1,0,0,3,1,3,3,2,0,1,0,2,0,1,0,0,0,0,0,0,1,0,0),(0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,2,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0),(1,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(12,22,22,24,20,18,26,22,9,0,7,3,7,2,0,1,0,1,0,2,0,0,0,0),(3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(0,0,0,0,1,0,0,1,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0),(0,2,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0),(1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(0,0,1,1,0,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,1,1,4,0,1,2,2,2,0,1,0,1,0,0,1,0,0,0,0,0,0,0,0),(0,0,1,1,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `table_student_homesharing` ENABLE KEYS */;
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
