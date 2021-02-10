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
-- Table structure for table `table_student_roomsharing`
--

DROP TABLE IF EXISTS `table_student_roomsharing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_student_roomsharing` (
  `0` double DEFAULT NULL,
  `1` double DEFAULT NULL,
  `2` double DEFAULT NULL,
  `3` double DEFAULT NULL,
  `4` double DEFAULT NULL,
  `5` double DEFAULT NULL,
  `6` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_student_roomsharing`
--

LOCK TABLES `table_student_roomsharing` WRITE;
/*!40000 ALTER TABLE `table_student_roomsharing` DISABLE KEYS */;
INSERT INTO `table_student_roomsharing` VALUES (17,2,0,2,1,0,0),(33,0,2,2,2,0,0),(442,28,107,33,37,4,0),(36,3,5,4,1,0,0),(1,0,0,0,0,0,0),(7,1,1,0,0,0,0),(17,1,3,1,0,0,0),(1,0,0,0,0,0,0),(1,0,0,0,0,0,0),(5,0,1,0,0,0,0),(11,0,5,3,0,0,0),(0,1,0,0,0,0,0),(3,0,1,0,0,1,0),(0,0,1,0,0,0,0),(3,0,0,0,0,0,0),(153,6,23,13,1,0,2),(2,0,0,1,0,0,0),(1,0,0,0,0,0,0),(2,0,1,1,1,0,0),(3,0,0,0,0,0,0),(0,0,0,0,1,0,0),(2,0,0,0,0,0,0),(2,0,0,0,0,0,0),(1,0,0,1,0,0,0),(1,0,0,0,0,0,0),(1,0,0,0,0,0,0),(2,1,2,0,0,0,0),(14,0,0,1,3,0,0),(5,0,0,0,0,0,0),(1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `table_student_roomsharing` ENABLE KEYS */;
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
