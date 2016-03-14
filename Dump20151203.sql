-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: ix.cs.uoregon.edu    Database: morgan4
-- ------------------------------------------------------
-- Server version	5.6.13

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
-- Table structure for table `ACTOR`
--

DROP TABLE IF EXISTS `ACTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACTOR` (
  `ACTOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTOR_FNAME` varchar(45) DEFAULT NULL,
  `ACTOR_LNAME` varchar(45) DEFAULT NULL,
  `ACTOR_AGE` int(11) DEFAULT NULL,
  `ACTOR_MOV_NUM` int(11) NOT NULL,
  `ACTOR_GENDER` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ACTOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTOR`
--

LOCK TABLES `ACTOR` WRITE;
/*!40000 ALTER TABLE `ACTOR` DISABLE KEYS */;
INSERT INTO `ACTOR` VALUES (1,'Daniel','Craig',34,28,'M'),(2,'Ralph','Fiennes',39,13,'M'),(3,'Noah','Schnapp',52,18,'M'),(4,'Bill ','Mendez',48,2,'M'),(5,'Hadley Belle','Miller',23,31,'F'),(6,'Jennifer','Lawerence',22,23,'F'),(7,'Josh','Hutcherson',24,32,'M'),(8,'Sam','Califin',26,8,'M'),(9,'Christoph','Waltz',56,65,'M');
/*!40000 ALTER TABLE `ACTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACTOR_has_MOVIE`
--

DROP TABLE IF EXISTS `ACTOR_has_MOVIE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACTOR_has_MOVIE` (
  `ACTOR_ACTOR_ID` int(11) NOT NULL,
  `MOVIE_MOV_ID` int(11) NOT NULL,
  PRIMARY KEY (`ACTOR_ACTOR_ID`,`MOVIE_MOV_ID`),
  KEY `fk_ACTOR_has_MOVIE_MOVIE1_idx` (`MOVIE_MOV_ID`),
  KEY `fk_ACTOR_has_MOVIE_ACTOR1_idx` (`ACTOR_ACTOR_ID`),
  CONSTRAINT `ACTOR_ACTOR_ID` FOREIGN KEY (`ACTOR_ACTOR_ID`) REFERENCES `ACTOR` (`ACTOR_ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_ACTOR_has_MOVIE_ACTOR1` FOREIGN KEY (`ACTOR_ACTOR_ID`) REFERENCES `ACTOR` (`ACTOR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ACTOR_has_MOVIE_MOVIE1` FOREIGN KEY (`MOVIE_MOV_ID`) REFERENCES `MOVIE` (`MOV_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTOR_has_MOVIE`
--

LOCK TABLES `ACTOR_has_MOVIE` WRITE;
/*!40000 ALTER TABLE `ACTOR_has_MOVIE` DISABLE KEYS */;
INSERT INTO `ACTOR_has_MOVIE` VALUES (1,1),(2,1),(9,1),(3,2),(4,2),(5,2),(6,3),(7,3),(8,3);
/*!40000 ALTER TABLE `ACTOR_has_MOVIE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIRECTOR`
--

DROP TABLE IF EXISTS `DIRECTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DIRECTOR` (
  `DIRECTOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DIRECTOR_LNAME` varchar(45) DEFAULT NULL,
  `DIRECTOR_FNAME` varchar(45) DEFAULT NULL,
  `DIRECTOR_LOCATION` varchar(45) DEFAULT NULL,
  `DIRECTOR_MOV_NUM` int(11) NOT NULL,
  `DIRECTOR_GENDER` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DIRECTOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIRECTOR`
--

LOCK TABLES `DIRECTOR` WRITE;
/*!40000 ALTER TABLE `DIRECTOR` DISABLE KEYS */;
INSERT INTO `DIRECTOR` VALUES (1,'Mendes','Sam','California',26,'M'),(2,'Martino','Steve','Oregon',72,'M'),(3,'Lawerence','Francis','New York',2,NULL);
/*!40000 ALTER TABLE `DIRECTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GENRE`
--

DROP TABLE IF EXISTS `GENRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GENRE` (
  `GENRE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GENRE_NAME` varchar(45) NOT NULL,
  `GENRE_DESC` varchar(45) DEFAULT NULL,
  `GENRE_SUB` varchar(45) DEFAULT NULL,
  `GENRE_SUB_DESC` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`GENRE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GENRE`
--

LOCK TABLES `GENRE` WRITE;
/*!40000 ALTER TABLE `GENRE` DISABLE KEYS */;
INSERT INTO `GENRE` VALUES (1,'Action','Films with action','Horror-Action','Films with horror and action'),(2,'Animation','Animated Films','Cartoons','Animated cartoons'),(3,'Adventure','Films with adventure','Action-Adventure',NULL);
/*!40000 ALTER TABLE `GENRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOVIE`
--

DROP TABLE IF EXISTS `MOVIE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MOVIE` (
  `MOV_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MOV_TITLE` varchar(45) NOT NULL,
  `MOV_RELEASE_DATE` datetime DEFAULT NULL,
  `MOV_GENRE` varchar(45) DEFAULT NULL,
  `MOV_LOCATION` varchar(45) DEFAULT NULL,
  `RATING_RATING_ID` int(11) NOT NULL,
  `MOV_SOUNDTRACK` varchar(45) DEFAULT NULL,
  `GENRE_GENRE_ID` int(11) NOT NULL,
  `STUDIO_STUDIO_ID` int(11) NOT NULL,
  `MOV_RUNTIME` time DEFAULT NULL,
  PRIMARY KEY (`MOV_ID`),
  KEY `fk_MOVIE_RATING1_idx` (`RATING_RATING_ID`),
  KEY `fk_MOVIE_GENRE1_idx` (`GENRE_GENRE_ID`),
  KEY `fk_MOVIE_STUDIO1_idx` (`STUDIO_STUDIO_ID`),
  CONSTRAINT `fk_MOVIE_GENRE1` FOREIGN KEY (`GENRE_GENRE_ID`) REFERENCES `GENRE` (`GENRE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MOVIE_RATING1` FOREIGN KEY (`RATING_RATING_ID`) REFERENCES `RATING` (`RATING_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MOVIE_STUDIO1` FOREIGN KEY (`STUDIO_STUDIO_ID`) REFERENCES `STUDIO` (`STUDIO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOVIE`
--

LOCK TABLES `MOVIE` WRITE;
/*!40000 ALTER TABLE `MOVIE` DISABLE KEYS */;
INSERT INTO `MOVIE` VALUES (1,'Spectre','2015-11-06 00:00:00','1',NULL,3,NULL,1,1,'02:28:00'),(2,'The Peanuts Movie','2015-11-06 00:00:00','2',NULL,1,NULL,2,2,'01:33:00'),(3,'The Hunger Games: Mockingjay Part 2','2015-11-20 00:00:00','3',NULL,3,NULL,3,3,'02:16:00');
/*!40000 ALTER TABLE `MOVIE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOVIE_has_DIRECTOR`
--

DROP TABLE IF EXISTS `MOVIE_has_DIRECTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MOVIE_has_DIRECTOR` (
  `MOVIE_MOV_ID` int(11) NOT NULL,
  `DIRECTOR_DIRECTOR_ID` int(11) NOT NULL,
  PRIMARY KEY (`MOVIE_MOV_ID`,`DIRECTOR_DIRECTOR_ID`),
  KEY `fk_MOVIE_has_DIRECTOR_DIRECTOR1_idx` (`DIRECTOR_DIRECTOR_ID`),
  KEY `fk_MOVIE_has_DIRECTOR_MOVIE_idx` (`MOVIE_MOV_ID`),
  CONSTRAINT `fk_MOVIE_has_DIRECTOR_MOVIE` FOREIGN KEY (`MOVIE_MOV_ID`) REFERENCES `MOVIE` (`MOV_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MOVIE_has_DIRECTOR_DIRECTOR1` FOREIGN KEY (`DIRECTOR_DIRECTOR_ID`) REFERENCES `DIRECTOR` (`DIRECTOR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOVIE_has_DIRECTOR`
--

LOCK TABLES `MOVIE_has_DIRECTOR` WRITE;
/*!40000 ALTER TABLE `MOVIE_has_DIRECTOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `MOVIE_has_DIRECTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RATING`
--

DROP TABLE IF EXISTS `RATING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RATING` (
  `RATING_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_LETTER` varchar(45) DEFAULT NULL,
  `RATING_SYMBOL` blob,
  `RATING_DESCRIPTION` varchar(100) DEFAULT NULL,
  `RATING_JUSTIFICATION` varchar(100) NOT NULL,
  `RATING_UNCUT` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RATING_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RATING`
--

LOCK TABLES `RATING` WRITE;
/*!40000 ALTER TABLE `RATING` DISABLE KEYS */;
INSERT INTO `RATING` VALUES (1,'G',NULL,'Safe for children','Content is appropriate for all ages',NULL),(2,'PG',NULL,'Parental guidance','Content may be inappropropriate for young children',NULL),(3,'PG-13',NULL,'Parental guidance 13','Content may be inappropriate for pre-teens',NULL),(4,'R',NULL,'Restricted','Contains adult content',NULL),(5,'NC-17',NULL,'No one under 17','',NULL);
/*!40000 ALTER TABLE `RATING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCREEN`
--

DROP TABLE IF EXISTS `SCREEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCREEN` (
  `SCREEN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SCREEN_DATE` datetime NOT NULL,
  `THEATER_has_MOVIE_THEATER_THEATER_ID` int(11) NOT NULL,
  `THEATER_has_MOVIE_MOVIE_MOV_ID` int(11) NOT NULL,
  `SCREEN_RM_NUM` varchar(45) DEFAULT NULL,
  `SCREEN_SIZE` int(11) DEFAULT NULL,
  `SCREEN_CAP` int(11) DEFAULT NULL,
  `SCREEN_REVENUE` decimal(10,2) NOT NULL,
  PRIMARY KEY (`SCREEN_ID`,`THEATER_has_MOVIE_THEATER_THEATER_ID`,`THEATER_has_MOVIE_MOVIE_MOV_ID`),
  KEY `fk_SCREEN_THEATER_has_MOVIE1_idx` (`THEATER_has_MOVIE_THEATER_THEATER_ID`,`THEATER_has_MOVIE_MOVIE_MOV_ID`),
  CONSTRAINT `fk_SCREEN_THEATER_has_MOVIE1` FOREIGN KEY (`THEATER_has_MOVIE_THEATER_THEATER_ID`, `THEATER_has_MOVIE_MOVIE_MOV_ID`) REFERENCES `THEATER_INFO` (`THEATER_THEATER_ID`, `MOVIE_MOV_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCREEN`
--

LOCK TABLES `SCREEN` WRITE;
/*!40000 ALTER TABLE `SCREEN` DISABLE KEYS */;
INSERT INTO `SCREEN` VALUES (1,'2015-11-21 00:00:00',1,1,'8',240,50,40.00),(2,'2015-11-21 00:00:00',1,2,'3',240,40,30.00),(3,'2015-11-21 00:00:00',2,1,'8',240,60,50.00),(4,'2015-11-21 00:00:00',2,3,'2',240,50,0.00);
/*!40000 ALTER TABLE `SCREEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STUDIO`
--

DROP TABLE IF EXISTS `STUDIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STUDIO` (
  `STUDIO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `STUDIO_NAME` varchar(45) NOT NULL,
  `STUDIO_LOCATION` varchar(45) DEFAULT NULL,
  `STUDIO_OWNER` varchar(45) DEFAULT NULL,
  `STUDIO_PROD_NUM` int(11) DEFAULT NULL,
  PRIMARY KEY (`STUDIO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STUDIO`
--

LOCK TABLES `STUDIO` WRITE;
/*!40000 ALTER TABLE `STUDIO` DISABLE KEYS */;
INSERT INTO `STUDIO` VALUES (1,'Sony / Columbia','California','Michael Jordan',632),(2,'Fox','Oregon','George Bush',128),(3,'Lionsgate','Washington','Justin Bieber',NULL);
/*!40000 ALTER TABLE `STUDIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `THEATER`
--

DROP TABLE IF EXISTS `THEATER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `THEATER` (
  `THEATER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `THEATER_NAME` varchar(45) NOT NULL,
  `THEATER_LOCATION` varchar(45) DEFAULT NULL,
  `THEATER_MANAGER` varchar(45) DEFAULT NULL,
  `THEATER_SIZE` int(11) DEFAULT NULL,
  PRIMARY KEY (`THEATER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `THEATER`
--

LOCK TABLES `THEATER` WRITE;
/*!40000 ALTER TABLE `THEATER` DISABLE KEYS */;
INSERT INTO `THEATER` VALUES (1,'Cinemark 17','Eugene',NULL,200),(2,'Regal Valley River','Eugene',NULL,NULL);
/*!40000 ALTER TABLE `THEATER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `THEATER_INFO`
--

DROP TABLE IF EXISTS `THEATER_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `THEATER_INFO` (
  `THEATER_THEATER_ID` int(11) NOT NULL,
  `MOVIE_MOV_ID` int(11) NOT NULL,
  `THEATER_INFO_REVENUE` decimal(10,2) NOT NULL,
  PRIMARY KEY (`THEATER_THEATER_ID`,`MOVIE_MOV_ID`),
  KEY `fk_THEATER_has_MOVIE_MOVIE1_idx` (`MOVIE_MOV_ID`),
  KEY `fk_THEATER_has_MOVIE_THEATER1_idx` (`THEATER_THEATER_ID`),
  CONSTRAINT `fk_THEATER_has_MOVIE_THEATER1` FOREIGN KEY (`THEATER_THEATER_ID`) REFERENCES `THEATER` (`THEATER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_THEATER_has_MOVIE_MOVIE1` FOREIGN KEY (`MOVIE_MOV_ID`) REFERENCES `MOVIE` (`MOV_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `THEATER_INFO`
--

LOCK TABLES `THEATER_INFO` WRITE;
/*!40000 ALTER TABLE `THEATER_INFO` DISABLE KEYS */;
INSERT INTO `THEATER_INFO` VALUES (1,1,60.00),(1,2,55.00),(2,1,60.00),(2,3,0.00);
/*!40000 ALTER TABLE `THEATER_INFO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-03 12:01:14
