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
-- Table structure for table `table_english_level`
--

DROP TABLE IF EXISTS `table_english_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_english_level` (
  `0` double DEFAULT NULL,
  `Elementary` double DEFAULT NULL,
  `Intermediate` double DEFAULT NULL,
  `Unknown` double DEFAULT NULL,
  `Upper/Advanced` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_english_level`
--

LOCK TABLES `table_english_level` WRITE;
/*!40000 ALTER TABLE `table_english_level` DISABLE KEYS */;
INSERT INTO `table_english_level` VALUES (0,2,6,0,9),(0,12,12,1,13),(11,174,164,3,194),(1,25,26,0,21),(0,0,2,0,1),(0,3,6,0,6),(0,3,4,0,7),(0,0,0,0,1),(0,5,6,0,5),(0,1,1,0,1),(0,0,0,0,1),(0,0,1,0,0),(0,0,1,0,0),(1,40,42,3,62),(0,0,1,0,0),(0,0,1,0,0),(0,0,0,0,1),(0,0,1,0,0),(0,0,1,0,1),(0,0,0,0,2),(0,0,1,0,0),(0,0,1,0,1),(0,0,0,0,1),(0,1,4,5,1),(0,2,1,0,5);
/*!40000 ALTER TABLE `table_english_level` ENABLE KEYS */;
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
