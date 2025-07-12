-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: persimmon.hcmc.uvic.ca    Database: narratives_sh
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `character_id` int NOT NULL AUTO_INCREMENT,
  `character_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`character_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (0,'[NULL]'),(1,'Bobby Mahon'),(2,'Josie Burke'),(3,'Lily'),(4,'Vasya Afanasiev'),(5,'Réaltín'),(6,'Timmy Hanrahan'),(7,'Brian'),(8,'Trevor'),(9,'Bridie'),(10,'Jason'),(11,'Hillary'),(12,'Seanie Shaper'),(13,'Kate'),(14,'Lloyd'),(15,'Rory Slattery'),(16,'Millicent'),(17,'Denis'),(18,'Mags Burke'),(19,'Jim Gildea'),(20,'Frank Mahon'),(21,'Triona'),(22,'Pokey Burke'),(23,'\"big fat cop\" (76)'),(24,'Cops (general)'),(25,'Jason\'s ex-girlfriend'),(26,'\"next prick\" (77)'),(27,'Jason\'s son'),(28,'Jason\'s mother'),(29,'Jason\'s father'),(30,'\"fat nonce\" (77)'),(31,'shitbags in the welfare office'),(32,'mad auld culchie'),(33,'Eugene Penrose'),(34,'some farmer lad'),(35,'Tattoo artist'),(36,'Tattoo shop girl'),(37,'George'),(38,'Dylan (Réaltín\'s son)'),(39,'Tom (Réaltín\'s father)'),(40,'Bridget'),(41,'people at the bridge festival'),(42,'Colin Firth'),(43,'George Clooney'),(44,'Hillary\'s father'),(45,'Hillary\'s grandmother'),(46,'Bobby\'s \"Grandad\"'),(47,'\"the Pope\" (Seán Pól) (10)'),(48,'Eileen Burke'),(49,'Eamonn Burke'),(50,'Mickey Briars'),(51,'\"little blonde girl\" (12)'),(52,'\"the boys\" (who worked for Pokey) (12)'),(53,'\"smart boys\" (12)'),(54,'Bobby\'s Mother'),(55,'the Cunliffes\' son'),(56,'the Penroses'),(57,'the Cunliffes'),(58,'the Cunliffes\' son\'s aunt'),(59,'\"a lad from the village\" (14)'),(60,'Pawsy Rogers'),(61,'King Lear'),(62,'Goneril'),(63,'Regan'),(64,'Cordelia'),(65,'taxman'),(66,'welfare inspectors'),(67,'God'),(68,'Seanie\'s Father'),(69,'Seanie\'s Mother'),(70,'Seanie\'s brothers'),(71,'Seanie\'s sister'),(72,'Ciss Brien'),(73,'Paulie Jackman'),(74,'\"old guard in front of Ciss\'s front bar\" (17)'),(75,'Men (Frank didn\'t like)'),(76,'Women (\"common whores\") (17)'),(77,'Triona\'s friend'),(78,'Actor (playing the husband)'),(79,'Actress (playing the wife)'),(80,'Tibetan Monks'),(81,'\"great big fat fella\" (Josie worked for) (23)'),(82,'\"four or five boys\" (Josie brought with him) (23)'),(84,'Josie Burke Sr.'),(85,'John Cotter'),(86,'\"other teachers\" (26)'),(87,'\"young lads\" (26)'),(88,'Yvonne Burke'),(89,'Yvonne\'s family'),(90,'Jesus'),(91,'Eamonn\'s children'),(92,'\"guards\" (26)'),(93,'Lily\'s fifth child'),(94,'midwife'),(95,'Bernie McDermott'),(96,'Men (who come see Lily)'),(97,'\"old farmers\" (28)'),(98,'fella \"with a toughie English accent\" (28)'),(99,'\"young fella\" (28)'),(100,'John-John'),(101,'Lily\'s children'),(102,'Hughie'),(103,'Hughie\'s wife'),(105,'Lily\'s Mother'),(106,'The McDermotts'),(107,'Lily\'s fifth child\'s girlfriend'),(108,'Lily\'s fifth child\'s girlfriend\'s mother'),(109,'Man (Vasya worked with)'),(110,'Wife (of the man Vasya worked with)'),(111,'Child (of the man Vasya worked with)'),(112,'Vasya\'s Mother'),(113,'Vasya\'s mother\'s mother'),(114,'Vasya\'s family'),(115,'Vasya\'s Father'),(116,'Vasya\'s grandfather'),(117,'The Latvians'),(118,'Russian men'),(119,'Polish men'),(120,'\"foreigners\" (where Vasya is from) (36)'),(121,'Viktor Afanasiev'),(122,'\"men and women...who have no work\" (37)'),(123,'Men (who worked with Vasya and her brother)'),(124,'Vasya\'s boss'),(125,'local militiaman'),(126,'Policeman (who talks to Vasya)'),(127,'Men (who planned to travel to Western Europe)'),(128,'Men (Vasya lives with)'),(129,'Neighbour'),(130,'Neighbour\'s baby'),(131,'Man (inside The Miner\'s Rest)'),(132,'Others (inside The Miner\'s Rest)'),(133,'Auctioneer'),(134,'Réaltín\'s mother'),(135,'camera crew'),(136,'Seanie\'s friends'),(137,'\"floozies\" (45)'),(138,'\"old biddies\" (45)'),(139,'\"apprentices\" (45)'),(140,'\"the cute arses\" (45)'),(141,'Man (who calls George\'s firm)'),(142,'Builders'),(143,'Girlfriend (of the man who calls George\'s firm)'),(144,'\"scumbags\" (46)'),(145,'Men (outside of Réaltín\'s house)'),(146,'\"C2 boys\" (47)');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `containerLevels`
--

DROP TABLE IF EXISTS `containerLevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `containerLevels` (
  `containerLevel_id` int NOT NULL AUTO_INCREMENT,
  `containerLevel_term` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`containerLevel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `containerLevels`
--

LOCK TABLES `containerLevels` WRITE;
/*!40000 ALTER TABLE `containerLevels` DISABLE KEYS */;
INSERT INTO `containerLevels` VALUES (0,'level 1 (section)'),(1,'level 2 (sub-section)'),(2,'level 3 (sub-sub-section)'),(3,'level 4 (sub-sub-sub-section)'),(4,'level 5 (sub-sub-sub-sub-section)');
/*!40000 ALTER TABLE `containerLevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embeddedContainerTypes`
--

DROP TABLE IF EXISTS `embeddedContainerTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `embeddedContainerTypes` (
  `embeddedContainerType_id` int NOT NULL AUTO_INCREMENT,
  `embeddedContainerType_term` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`embeddedContainerType_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embeddedContainerTypes`
--

LOCK TABLES `embeddedContainerTypes` WRITE;
/*!40000 ALTER TABLE `embeddedContainerTypes` DISABLE KEYS */;
INSERT INTO `embeddedContainerTypes` VALUES (0,'[NULL]'),(1,'Diary'),(2,'Letter'),(3,'Novel'),(4,'Oral Story'),(5,'Poem'),(6,'Play'),(7,'Short story'),(8,'Creative non-fiction');
/*!40000 ALTER TABLE `embeddedContainerTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isReciprocals`
--

DROP TABLE IF EXISTS `isReciprocals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `isReciprocals` (
  `isReciprocal_id` int NOT NULL AUTO_INCREMENT,
  `isReciprocal_text` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`isReciprocal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isReciprocals`
--

LOCK TABLES `isReciprocals` WRITE;
/*!40000 ALTER TABLE `isReciprocals` DISABLE KEYS */;
INSERT INTO `isReciprocals` VALUES (0,'FALSE isReciprocal'),(1,'TRUE isReciprocal');
/*!40000 ALTER TABLE `isReciprocals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menExs`
--

DROP TABLE IF EXISTS `menExs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menExs` (
  `menEx_id` int NOT NULL AUTO_INCREMENT,
  `menEx_menOrEx_id_fk` int DEFAULT NULL,
  `menEx_character1_id_fk` int NOT NULL,
  `menEx_character2_id_fk` int NOT NULL,
  `menEx_narrContainer_id_fk` int NOT NULL,
  `menEx_isReciprocal_id_fk` int NOT NULL,
  `menEx_startPage` int NOT NULL,
  `menEx_endPage` int DEFAULT NULL,
  PRIMARY KEY (`menEx_id`),
  KEY `menEx_narrContainer_id_fk` (`menEx_narrContainer_id_fk`),
  KEY `menEx_menOrEx_id_fk` (`menEx_menOrEx_id_fk`),
  KEY `menEx_character1_id_fk` (`menEx_character1_id_fk`),
  KEY `menEx_character2_id_fk` (`menEx_character2_id_fk`),
  KEY `menEx_isReciprocal_id_fk` (`menEx_isReciprocal_id_fk`),
  KEY `menEx_startPage_fk` (`menEx_startPage`),
  KEY `menEx_endPage_fk` (`menEx_endPage`),
  CONSTRAINT `menExs_ibfk_1` FOREIGN KEY (`menEx_menOrEx_id_fk`) REFERENCES `menOrExs` (`menOrEx_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `menExs_ibfk_2` FOREIGN KEY (`menEx_character1_id_fk`) REFERENCES `characters` (`character_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `menExs_ibfk_3` FOREIGN KEY (`menEx_character2_id_fk`) REFERENCES `characters` (`character_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `menExs_ibfk_4` FOREIGN KEY (`menEx_isReciprocal_id_fk`) REFERENCES `isReciprocals` (`isReciprocal_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `menExs_ibfk_5` FOREIGN KEY (`menEx_narrContainer_id_fk`) REFERENCES `narrContainers` (`narrContainer_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menExs`
--

LOCK TABLES `menExs` WRITE;
/*!40000 ALTER TABLE `menExs` DISABLE KEYS */;
INSERT INTO `menExs` VALUES (1,0,1,20,10,1,76,77),(2,0,17,20,10,1,76,76),(3,1,10,17,10,0,76,76),(4,1,10,23,10,1,76,76),(5,2,1,23,10,1,76,76),(6,0,10,24,10,1,76,77),(7,2,10,25,10,1,77,77),(8,0,25,27,10,1,77,77),(9,0,28,29,10,1,77,77),(10,2,10,30,10,1,77,77),(11,2,10,31,10,1,78,78),(12,2,32,33,10,1,78,78),(13,2,10,34,10,1,78,78),(14,2,34,33,10,1,78,78),(15,0,25,27,10,1,79,79),(16,0,35,36,10,1,79,79),(17,2,10,25,10,1,79,79),(18,0,25,24,10,1,79,79),(19,0,25,26,10,1,77,77),(20,0,25,31,10,1,79,79),(21,0,1,20,10,1,80,80),(22,2,1,10,10,1,80,81),(23,0,10,29,10,1,80,80),(24,0,10,31,10,1,80,80),(25,0,1,29,10,1,80,81),(26,0,11,5,11,1,82,82),(27,2,5,37,11,1,82,82),(28,0,5,1,10,1,83,83),(29,0,1,21,11,1,83,83),(30,0,5,21,11,1,83,83),(31,0,5,38,11,1,83,83),(32,0,1,38,11,1,83,83),(33,0,1,20,11,1,83,83),(34,2,5,11,11,1,83,83),(35,0,40,39,11,1,83,83),(36,0,5,39,11,1,83,83),(37,0,5,40,11,1,83,83),(38,1,40,1,11,0,83,83),(39,2,41,40,11,1,83,84),(40,1,5,41,11,0,83,84),(41,1,41,1,11,0,83,84),(42,1,41,21,11,0,84,84),(43,0,39,5,11,1,84,84),(44,1,39,1,11,0,84,84),(45,0,39,38,11,1,84,84),(46,1,11,42,11,0,84,84),(47,1,11,43,11,0,84,84),(48,2,11,39,11,1,84,84),(49,2,5,44,11,1,84,84),(50,0,5,45,11,1,84,84),(51,0,44,45,11,1,84,84),(52,2,1,20,1,1,9,9),(53,0,1,46,1,0,9,9),(54,0,20,46,1,1,9,9),(55,0,1,20,1,1,10,10),(56,0,1,22,1,1,10,11),(57,0,1,2,1,1,10,10),(58,0,22,2,1,1,10,10),(59,1,1,47,1,0,10,10),(60,1,22,47,1,0,10,10),(61,1,2,47,1,0,10,10),(62,0,2,48,1,1,10,10),(63,0,1,48,1,0,10,10),(64,0,22,48,1,1,10,10),(65,1,48,47,1,0,10,10),(66,2,49,22,1,1,10,10),(67,0,2,49,1,1,10,10),(68,0,49,48,1,1,10,10),(69,2,1,50,1,1,10,11),(70,2,50,22,1,1,11,11),(71,2,1,6,1,1,11,11),(72,2,50,6,1,1,11,11),(73,0,1,12,1,1,11,12),(74,2,22,1,1,1,11,11),(75,0,1,6,1,1,12,12),(76,2,1,51,1,1,12,12),(77,0,22,1,1,1,12,13),(78,1,51,22,1,0,12,12),(79,0,1,15,1,1,12,12),(80,0,1,52,1,1,12,12),(81,1,51,12,1,1,12,12),(82,1,51,6,1,1,12,12),(83,1,51,15,1,1,12,12),(84,1,51,52,1,1,12,12),(85,2,52,50,1,1,10,11),(86,2,52,6,1,1,11,11),(87,2,1,21,1,1,12,15),(88,1,1,53,1,0,12,14),(89,2,53,21,1,1,13,13),(90,0,21,20,1,1,13,13),(91,2,1,20,1,1,13,13),(92,0,1,54,1,1,13,13),(93,0,54,20,1,1,13,13),(94,0,52,22,1,1,13,13),(95,1,1,55,1,0,13,14),(96,1,1,33,1,0,13,13),(97,2,33,55,1,0,13,13),(98,1,1,56,1,0,13,13),(99,0,56,33,1,1,13,13),(100,0,57,55,1,1,13,13),(101,1,1,57,1,0,13,13),(102,0,58,55,1,1,13,13),(103,1,1,58,1,0,13,13),(104,1,1,59,1,0,14,14),(105,0,1,60,1,1,14,14),(106,2,59,60,1,1,14,14),(107,1,1,61,1,0,14,14),(108,1,1,62,1,0,14,14),(109,1,1,63,1,0,14,14),(110,0,1,64,1,0,14,14),(111,0,61,62,1,1,14,14),(112,0,61,63,1,1,14,14),(113,0,61,64,1,1,14,14),(114,2,1,2,1,1,14,15),(115,0,1,22,1,1,14,15),(116,0,2,22,1,1,14,14),(117,1,1,65,1,0,15,15),(118,1,1,66,1,0,15,15),(119,0,1,12,1,1,15,16),(120,0,1,15,1,1,15,15),(121,0,21,12,1,1,15,15),(122,0,21,15,1,1,15,15),(123,0,1,67,1,0,15,15),(124,0,1,20,1,1,15,19),(125,0,1,70,1,1,16,16),(126,0,1,68,1,1,16,16),(127,0,1,69,1,1,16,16),(128,0,1,71,1,1,16,16),(129,2,12,70,1,1,16,16),(130,2,12,68,1,1,16,16),(131,2,12,69,1,1,16,16),(132,2,12,71,1,1,16,16),(133,2,70,68,1,1,16,16),(134,2,70,69,1,1,16,16),(135,2,70,71,1,1,16,16),(136,2,68,69,1,1,16,16),(137,2,68,71,1,1,16,16),(138,2,69,71,1,1,16,16),(139,0,1,72,1,0,11,11),(140,2,1,46,1,1,17,18),(141,2,20,46,1,1,17,18),(142,2,73,20,1,1,17,17),(143,2,20,72,1,1,17,17),(144,0,74,20,1,1,17,17),(145,2,20,75,1,1,17,17),(146,2,20,76,1,1,17,17),(147,0,20,54,1,1,18,18),(148,0,1,54,1,1,18,19),(149,2,1,22,1,1,19,19),(150,2,21,1,1,1,19,20),(151,2,21,77,1,1,19,19),(152,0,77,1,1,1,19,19),(153,1,77,20,1,0,19,19),(154,1,77,54,1,0,19,19),(155,1,21,20,1,0,19,19),(156,1,21,54,1,0,19,19),(157,2,22,21,1,1,19,19),(158,0,1,67,1,0,20,20),(159,0,22,1,1,1,20,20),(160,2,78,79,1,1,20,20),(161,2,78,1,1,1,20,20),(162,2,79,1,1,1,20,20),(163,2,78,21,1,0,20,20),(164,2,79,21,1,0,20,20),(165,0,2,49,2,1,21,21),(166,0,2,22,2,1,21,22),(167,0,49,22,2,1,21,21),(168,2,2,1,2,1,21,22),(169,0,1,22,2,1,21,22),(170,2,2,48,2,1,22,24),(171,0,48,22,2,1,22,22),(172,0,2,67,2,0,22,22),(173,2,2,18,2,1,23,23),(174,1,18,80,2,0,23,23),(175,1,2,80,2,0,23,23),(176,0,2,81,2,1,23,23),(177,0,82,2,2,1,23,23),(178,2,2,3,2,1,24,24),(179,2,2,84,2,1,24,24),(180,0,2,22,2,1,24,25),(181,0,22,52,2,1,24,24),(182,0,48,22,2,1,25,25),(183,0,49,22,2,1,25,26),(184,2,2,49,2,1,25,26),(185,2,2,67,2,0,25,25),(186,0,85,2,2,1,25,25),(187,0,49,86,2,1,26,26),(188,0,49,87,2,1,26,26),(189,0,49,88,2,1,26,26),(190,0,49,89,2,1,26,26),(191,0,88,89,2,1,26,26),(192,0,2,90,2,0,26,26),(193,0,2,1,2,1,26,26),(194,0,49,91,2,1,26,26),(195,0,88,91,2,1,26,26),(196,2,2,22,2,1,26,26),(197,0,2,55,2,0,26,26),(198,0,2,57,2,0,26,26),(199,0,57,55,2,1,26,26),(200,0,55,58,2,1,26,26),(201,2,92,55,2,1,26,26),(202,0,2,67,2,0,26,26),(203,0,3,93,3,1,27,27),(204,2,3,94,3,1,27,27),(205,1,94,95,3,0,27,27),(206,1,95,93,3,0,27,27),(207,2,3,95,3,1,27,27),(208,2,3,19,3,1,27,28),(209,2,3,96,3,1,28,29),(210,2,3,97,3,1,28,28),(211,2,3,98,3,1,28,28),(212,2,3,99,3,1,28,29),(213,0,3,100,3,1,29,29),(214,0,3,101,3,1,29,30),(215,2,3,2,3,1,29,30),(216,0,3,97,3,1,29,29),(217,0,2,48,3,1,30,30),(218,0,48,49,3,1,30,30),(219,0,2,49,3,1,30,30),(220,0,2,22,3,1,30,30),(221,0,2,18,3,1,30,30),(222,0,3,96,3,1,30,30),(223,0,3,102,3,1,30,30),(224,0,102,103,3,1,30,30),(225,0,102,16,3,1,30,30),(226,0,103,16,3,1,30,30),(227,1,3,103,3,0,30,30),(228,1,3,16,3,0,30,30),(229,2,3,100,3,1,30,31),(230,0,3,93,3,1,30,30),(231,2,3,1,3,1,31,32),(232,0,1,54,3,1,31,31),(233,0,1,20,3,1,31,31),(234,2,1,21,3,1,32,32),(235,2,3,95,3,1,32,33),(236,0,3,100,3,1,32,34),(237,0,3,101,3,1,32,33),(238,2,3,93,3,1,32,32),(239,2,100,101,3,1,32,32),(240,2,95,100,3,1,32,32),(241,0,105,3,3,1,32,32),(242,0,95,106,3,1,33,33),(243,0,93,95,3,1,33,33),(244,2,93,107,3,1,33,33),(245,2,93,108,3,1,33,33),(246,0,107,108,3,1,33,33),(247,0,3,96,3,1,33,33),(248,0,100,72,3,1,33,34),(249,2,4,109,4,1,35,35),(250,2,4,111,4,1,35,35),(251,2,4,110,4,1,35,35),(252,2,109,110,4,1,35,35),(253,2,109,111,4,1,35,35),(254,2,4,1,4,1,35,36),(255,0,4,112,4,1,35,36),(256,2,4,113,4,1,35,36),(257,0,112,113,4,1,35,36),(258,2,4,114,4,1,36,36),(259,2,4,115,4,1,36,36),(260,0,115,112,4,1,36,36),(261,0,115,113,4,1,36,36),(262,1,4,116,4,0,36,36),(263,2,115,114,4,1,36,36),(264,2,113,114,4,1,36,36),(265,0,117,120,4,1,36,36),(266,2,118,120,4,1,36,36),(267,2,120,119,4,1,36,36),(268,2,4,52,4,1,36,37),(269,2,12,4,4,1,36,37),(270,0,4,115,4,1,37,37),(271,2,4,121,4,1,37,38),(272,2,4,51,4,1,37,37),(273,0,4,22,4,1,37,37),(274,0,51,22,4,0,37,37),(275,2,4,122,4,1,37,37),(276,2,12,122,4,1,37,37),(277,2,4,124,4,1,37,37),(278,2,121,124,4,1,37,38),(279,2,4,123,4,1,37,38),(280,2,121,123,4,1,37,38),(281,2,4,125,4,1,38,38),(282,2,126,4,4,1,38,38),(283,0,125,121,4,1,38,38),(284,0,126,121,4,1,38,38),(285,2,125,126,4,1,38,38),(286,2,4,127,4,1,38,38),(287,0,4,22,4,1,39,39),(288,2,4,1,4,1,39,39),(289,0,4,115,4,1,40,40),(290,0,115,112,4,1,40,40),(291,0,114,4,4,1,40,40),(292,2,4,128,4,1,40,40),(293,2,4,129,4,1,40,40),(294,2,129,128,4,1,40,40),(295,0,129,130,4,1,40,40),(296,1,4,130,4,0,40,40),(297,1,128,130,4,0,40,40),(298,2,4,131,4,1,41,41),(299,2,4,132,4,1,41,41),(300,2,131,132,4,1,41,41),(301,2,4,22,4,1,41,41),(302,0,5,3,5,1,42,43),(303,0,5,39,5,1,42,42),(304,2,5,133,5,1,42,42),(305,2,133,39,5,1,42,42),(306,2,5,39,5,1,43,45),(307,2,5,38,5,1,43,43),(308,0,5,22,5,1,43,44),(309,0,39,22,5,1,43,44),(310,0,22,3,5,1,43,43),(311,2,38,39,5,0,43,43),(312,0,39,134,5,1,43,43),(313,0,5,67,5,0,43,43),(314,0,39,40,5,1,43,44),(315,2,39,2,5,0,44,44),(316,0,2,48,5,1,44,44),(317,0,22,5,5,1,44,44),(318,0,22,48,5,1,44,44),(319,2,135,39,5,1,44,44),(320,0,38,39,5,1,44,44),(321,1,40,134,5,0,44,44),(322,2,5,40,5,1,44,44),(324,2,12,136,5,1,44,44),(325,0,5,90,5,0,44,44),(326,2,12,39,5,1,44,44),(327,2,5,12,5,1,44,44),(328,2,12,38,5,1,44,44),(329,0,39,12,5,1,45,45),(330,2,12,137,5,1,45,45),(331,0,12,38,5,1,45,45),(332,2,5,37,5,1,45,47),(333,0,5,138,5,1,45,45),(334,0,139,5,5,1,45,45),(335,2,5,140,5,1,45,45),(336,2,37,140,5,1,45,45),(337,2,5,11,5,1,45,45),(338,0,11,37,5,1,45,45),(339,0,5,67,5,0,45,45),(341,2,5,141,5,1,46,46),(342,2,141,142,5,1,46,46),(343,0,141,143,5,1,46,46),(344,2,5,144,5,1,46,46),(345,2,37,144,5,1,46,46),(346,0,12,5,5,1,46,46),(347,0,5,134,5,1,46,47),(348,0,5,39,5,1,46,47),(349,0,39,40,5,1,47,47),(350,0,39,134,5,1,47,47),(351,0,5,38,5,1,47,47),(352,0,5,145,5,1,47,48),(353,0,1,145,5,1,47,48),(354,2,1,5,5,1,47,48),(355,0,1,146,5,1,47,48),(356,1,5,146,5,0,47,48),(357,0,5,67,5,0,47,47),(358,2,5,39,5,1,48,48),(359,0,39,1,5,1,48,48),(360,0,1,38,5,1,48,48);
/*!40000 ALTER TABLE `menExs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menOrExs`
--

DROP TABLE IF EXISTS `menOrExs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menOrExs` (
  `menOrEx_id` int NOT NULL AUTO_INCREMENT,
  `menOrEx_text` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`menOrEx_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menOrExs`
--

LOCK TABLES `menOrExs` WRITE;
/*!40000 ALTER TABLE `menOrExs` DISABLE KEYS */;
INSERT INTO `menOrExs` VALUES (0,'Knows'),(1,'Knows of'),(2,'Exchange');
/*!40000 ALTER TABLE `menOrExs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `narrContainers`
--

DROP TABLE IF EXISTS `narrContainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `narrContainers` (
  `narrContainer_id` int NOT NULL AUTO_INCREMENT,
  `narrContainer_title` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `narrContainer_level_id_fk` int NOT NULL,
  `narrContainer_startPage` int NOT NULL,
  `narrContainer_endPage` int NOT NULL,
  `narrContainer_narrator_character_id_fk` int NOT NULL,
  `narrContainer_protagonist_id_fk` int DEFAULT NULL,
  `narrContainer_embeddedContainerType_id_fk` int DEFAULT NULL,
  PRIMARY KEY (`narrContainer_id`),
  KEY `narrContainer_startPage` (`narrContainer_startPage`),
  KEY `narrContainer_endPage` (`narrContainer_endPage`),
  KEY `narrContainer_level_id_fk` (`narrContainer_level_id_fk`),
  KEY `narrContainer_protagonist_id_fk` (`narrContainer_protagonist_id_fk`),
  KEY `narrContainer_narrator_character_id_fk` (`narrContainer_narrator_character_id_fk`),
  CONSTRAINT `narrContainers_ibfk_1` FOREIGN KEY (`narrContainer_level_id_fk`) REFERENCES `containerLevels` (`containerLevel_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `narrContainers_ibfk_2` FOREIGN KEY (`narrContainer_narrator_character_id_fk`) REFERENCES `characters` (`character_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `narrContainers_ibfk_3` FOREIGN KEY (`narrContainer_protagonist_id_fk`) REFERENCES `characters` (`character_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narrContainers`
--

LOCK TABLES `narrContainers` WRITE;
/*!40000 ALTER TABLE `narrContainers` DISABLE KEYS */;
INSERT INTO `narrContainers` VALUES (1,'Bobby',0,9,20,1,0,0),(2,'Josie',0,21,26,2,0,0),(3,'Lily',0,27,34,3,0,0),(4,'Vasya',0,35,41,4,0,0),(5,'Réaltín',0,42,48,5,0,0),(6,'Timmy',0,49,55,6,0,0),(7,'Brian',0,56,61,7,0,0),(8,'Trevor',0,62,67,8,0,0),(9,'Bridie',0,68,75,9,0,0),(10,'Jason',0,76,81,10,0,0),(11,'Hillary',0,82,89,11,0,0),(12,'Seanie',0,90,96,12,0,0),(13,'Kate',0,97,102,13,0,0),(14,'Lloyd',0,103,107,14,0,0),(15,'Rory',0,108,113,15,0,0),(16,'Millicent',0,114,119,16,0,0),(17,'Denis',0,120,125,17,0,0),(18,'Mags',0,126,131,18,0,0),(19,'Jim',0,132,138,19,0,0),(20,'Frank',0,139,145,20,0,0),(21,'Triona',0,146,156,21,0,0);
/*!40000 ALTER TABLE `narrContainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `narratorTypes`
--

DROP TABLE IF EXISTS `narratorTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `narratorTypes` (
  `narratorType_id` int NOT NULL AUTO_INCREMENT,
  `narratorType_term` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`narratorType_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narratorTypes`
--

LOCK TABLES `narratorTypes` WRITE;
/*!40000 ALTER TABLE `narratorTypes` DISABLE KEYS */;
INSERT INTO `narratorTypes` VALUES (0,'Character narrator'),(1,'Non-character narrator');
/*!40000 ALTER TABLE `narratorTypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-12  1:30:05
