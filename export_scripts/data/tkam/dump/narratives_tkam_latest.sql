-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: persimmon.hcmc.uvic.ca    Database: narratives_tkam
-- ------------------------------------------------------
-- Server version	8.0.36

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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (0,'[NULL]'),(1,'Test 1'),(2,'Test 2'),(3,'Test 3'),(4,'Test 4'),(5,'Scout Finch'),(6,'Dill Harris'),(7,'Alexandra Finch'),(8,'Jem Finch'),(9,'Atticus Finch'),(10,'Boo Radley'),(11,'Heck Tate'),(13,'General Andrew Jackson'),(14,'Bob Ewell'),(15,'Mayella Ewell'),(16,'Simon Finch'),(17,'Methodists'),(18,'John Wesley'),(19,'God'),(20,'\"Three slaves\"'),(21,'Simon Finch\'s wife'),(22,'John Hale \"Jack\" Finch'),(23,'Jimmy Hancock'),(24,'Calpurnia'),(26,'The Haverfords'),(27,'Three witnesses'),(28,'Maycomb\'s leading blacksmith'),(29,'Mother (of Scout and Jem)'),(30,'Mrs. Dubose'),(31,'Henry Lafayette Dubose'),(32,'Miss Rachel Haverford'),(33,'Dill\'s mother'),(34,'Jesus'),(35,'Dracula'),(36,'Dill\'s father'),(37,'Oliver Optic'),(38,'Victor Appleton'),(39,'Edgar Rice Burroughs'),(40,'Tarzan'),(41,'Mr. Crabtree (The Rover Boys)'),(42,'Mr. Damon (Tom Swift)'),(43,'Merlin'),(44,'Crazy Addie'),(45,'Mrs. Radley'),(46,'Nathan Radley'),(47,'Mr. Radley'),(48,'The Cunninghams'),(49,'Mr. Conner'),(50,'The judge (12)'),(51,'Miss Stephanie Crawford'),(53,'Tom Swift'),(54,'Miss Caroline Fisher'),(55,'Miss Maudie Atkinson'),(56,'Lorenzo Dow'),(57,'Walter Cunningham Jr.'),(58,'Scout\'s classmate'),(59,'Walter Cunningham Sr.'),(60,'Dr. Reynolds'),(61,'Miss Blount'),(62,'The first grade'),(63,'The sixth grade'),(64,'Chuck Little'),(65,'D.C.'),(66,'Burris Ewell'),(67,'\"A N***o\" (11)'),(68,'The Radleys\' neighbours'),(69,'Several people who see Boo'),(70,'Maycomb Town Council'),(71,'John Taylor (Judge)'),(72,'Republicans'),(73,'Professors'),(74,'Farmers'),(75,'Doctors'),(76,'Dentists'),(77,'Lawyers'),(78,'The Radley Place'),(79,'Tom Robinson\'s Trial'),(80,'Tom Robinson'),(81,'Link Deas'),(82,'Old Sarum Bunch'),(83,'\"someone\"'),(84,'Henry W. Grady'),(85,'Mr. Avery'),(86,'Ku Klux Klan'),(87,'Sam Levy'),(88,'The Levy family'),(89,'Mr. Underwood'),(90,'Cousin Joshua St. Clair');
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
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
  `menEx_isReciprocal_id_fk` int NOT NULL,
  `menEx_narrContainer_id_fk` int NOT NULL,
  `menEx_startPage` int NOT NULL,
  `menEx_endPage` int NOT NULL,
  PRIMARY KEY (`menEx_id`),
  KEY `menEx_menOrEx_id_fk` (`menEx_menOrEx_id_fk`),
  KEY `menEx_character1_id_fk` (`menEx_character1_id_fk`),
  KEY `menEx_character2_id_fk` (`menEx_character2_id_fk`),
  KEY `menEx_isReciprocal_id_fk` (`menEx_isReciprocal_id_fk`),
  KEY `menEx_narrContainer_id_fk` (`menEx_narrContainer_id_fk`),
  CONSTRAINT `menExs_ibfk_1` FOREIGN KEY (`menEx_menOrEx_id_fk`) REFERENCES `menOrExs` (`menOrEx_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `menExs_ibfk_2` FOREIGN KEY (`menEx_character1_id_fk`) REFERENCES `characters` (`character_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `menExs_ibfk_3` FOREIGN KEY (`menEx_character2_id_fk`) REFERENCES `characters` (`character_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `menExs_ibfk_4` FOREIGN KEY (`menEx_isReciprocal_id_fk`) REFERENCES `isReciprocals` (`isReciprocal_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `menExs_ibfk_5` FOREIGN KEY (`menEx_narrContainer_id_fk`) REFERENCES `narrContainers` (`narrContainer_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menExs`
--

LOCK TABLES `menExs` WRITE;
/*!40000 ALTER TABLE `menExs` DISABLE KEYS */;
INSERT INTO `menExs` VALUES (1,0,1,2,1,1,6,8),(2,2,3,4,1,1,12,14),(3,2,1,4,1,1,15,15),(4,0,5,6,1,19,193,194),(5,0,5,7,1,19,193,193),(6,2,5,9,1,19,193,193),(7,0,5,8,1,19,193,193),(8,0,6,7,1,19,193,193),(9,0,6,9,1,19,193,193),(10,0,6,8,1,19,193,193),(11,0,7,9,1,19,193,193),(12,0,7,8,1,19,193,193),(13,2,9,8,1,19,193,193),(14,0,6,10,1,19,193,193),(15,0,5,10,1,19,193,193),(16,2,8,11,1,19,193,193),(17,2,5,8,1,5,3,3),(18,0,5,15,1,5,3,3),(19,0,5,14,1,5,3,3),(20,0,8,15,1,5,3,3),(21,0,8,14,1,5,3,3),(22,0,5,6,1,5,3,3),(23,0,8,6,1,5,3,3),(25,0,8,10,1,5,3,3),(26,0,5,10,1,5,3,3),(27,1,6,10,1,5,3,3),(28,1,5,13,0,5,3,3),(29,1,8,13,0,5,3,3),(30,1,5,16,0,5,3,6),(31,1,8,16,0,5,3,3),(32,1,16,13,0,5,3,3),(33,1,9,13,1,5,3,3),(34,0,9,16,1,5,3,6),(35,0,9,6,1,5,3,3),(36,0,9,10,1,5,3,3),(37,0,9,14,1,5,3,3),(38,0,9,15,1,5,3,3),(39,2,5,9,1,5,3,3),(40,2,8,9,1,5,3,3),(41,0,16,17,1,5,4,4),(43,1,5,17,0,5,4,4),(44,1,16,18,0,5,4,4),(45,1,5,18,0,5,4,4),(46,1,16,19,1,5,4,4),(47,1,5,19,1,5,4,4),(48,2,16,20,1,5,4,4),(49,1,5,20,0,5,4,4),(50,1,5,20,0,5,4,4),(51,2,16,21,1,5,4,4),(52,1,5,21,0,5,4,4),(53,0,9,22,1,5,5,6),(54,0,9,7,1,5,5,5),(55,0,7,22,1,5,5,5),(56,0,7,16,1,5,5,5),(57,0,22,16,1,5,5,5),(58,2,7,23,1,5,5,5),(59,0,9,23,1,5,5,5),(60,0,22,23,1,5,5,5),(61,0,5,23,1,5,5,5),(62,2,9,26,1,5,5,5),(63,0,5,7,1,5,5,5),(64,0,5,22,1,5,5,6),(65,0,5,9,1,5,5,7),(66,1,5,26,0,5,5,5),(67,2,26,28,1,5,5,5),(68,1,5,28,0,5,5,5),(69,2,71,26,1,5,5,5),(70,2,9,71,1,5,5,5),(71,1,5,71,1,5,5,5),(72,0,5,8,1,5,6,7),(73,0,5,24,1,5,6,7),(74,0,8,24,1,5,6,7),(75,0,9,0,1,5,6,7),(76,0,9,8,1,5,6,7),(77,0,9,24,1,5,6,7),(78,1,5,29,0,5,7,7),(79,0,8,29,1,5,7,7),(80,0,9,29,1,5,7,7),(81,0,5,30,1,5,7,7),(82,0,8,30,1,5,7,7),(83,0,24,30,1,5,7,7),(84,1,5,10,0,5,7,7),(85,1,8,10,0,5,7,7),(86,0,8,6,1,5,7,7),(87,0,5,6,1,5,7,7),(88,0,8,32,1,5,7,8),(89,0,5,32,1,5,7,8),(90,2,5,8,1,5,8,9),(91,2,5,6,1,5,8,9),(92,2,8,6,1,5,8,9),(93,0,6,32,1,5,8,8),(94,0,6,33,1,5,8,9),(95,1,8,33,0,5,8,9),(96,1,5,33,0,5,8,9),(97,1,6,35,0,5,9,9),(98,1,8,35,0,5,9,9),(99,1,5,35,0,5,9,9),(100,1,6,36,1,5,9,9),(101,1,5,36,0,5,9,9),(102,0,8,36,0,5,9,9),(103,1,5,37,0,5,9,9),(104,1,6,37,0,5,9,9),(105,1,8,37,0,5,9,9),(106,1,5,38,0,5,9,9),(107,1,8,38,0,5,9,9),(108,1,6,38,0,5,9,9),(109,1,5,39,0,5,9,9),(110,1,6,39,0,5,9,9),(111,1,8,39,0,5,9,9),(112,1,5,40,0,5,9,9),(113,1,6,40,0,5,9,9),(114,1,8,40,0,5,9,9),(115,1,6,41,0,5,9,9),(116,1,5,41,0,5,9,9),(117,1,8,41,0,5,9,9),(118,1,5,42,0,5,10,10),(119,1,6,42,0,5,10,10),(120,1,8,42,0,5,10,10),(121,1,5,43,0,5,10,10),(122,1,8,43,0,5,10,10),(123,1,8,10,1,5,10,10),(124,1,5,10,1,5,10,19),(125,1,6,10,1,5,10,10),(126,1,5,44,0,5,10,11),(127,1,5,67,0,5,11,11),(128,1,67,47,1,5,11,11),(129,1,67,45,1,5,11,11),(130,1,67,10,1,5,11,11),(131,0,5,47,1,5,11,13),(132,0,8,47,1,5,11,11),(133,0,5,45,1,5,11,13),(134,0,45,68,1,5,11,11),(135,1,5,68,0,5,11,11),(136,0,45,46,1,5,11,15),(137,0,5,46,1,5,11,15),(138,0,47,46,1,5,11,15),(139,0,10,46,1,5,11,15),(140,0,47,10,1,5,11,15),(141,0,45,10,1,5,11,15),(142,0,47,45,1,5,11,15),(143,0,5,9,1,5,12,12),(144,2,10,48,1,5,12,13),(145,2,10,49,1,5,12,12),(146,2,48,49,1,5,12,12),(147,1,5,48,1,5,12,13),(148,2,10,71,1,5,12,12),(149,2,48,71,1,5,12,12),(150,2,71,49,1,5,12,12),(151,2,47,71,1,5,13,13),(152,0,47,48,1,5,12,13),(153,0,9,47,1,5,13,13),(154,0,9,45,1,5,13,13),(155,0,9,10,1,5,13,13),(156,0,9,46,1,5,13,13),(157,2,69,10,1,5,13,13),(158,1,5,69,0,5,13,13),(159,1,8,69,0,5,13,13),(160,2,8,51,1,5,13,14),(161,0,5,51,1,5,13,13),(162,0,51,47,1,5,13,14),(163,0,51,45,1,5,13,14),(164,0,51,10,1,5,13,14),(165,0,51,46,1,5,13,14),(166,2,47,11,1,5,14,14),(167,2,11,10,1,5,14,14),(168,0,5,11,1,5,14,14),(169,1,8,10,1,5,14,19),(170,0,5,8,1,5,10,14),(171,2,5,8,1,5,15,19),(172,0,8,47,1,5,13,13),(173,2,8,47,1,5,14,14),(174,0,8,47,1,5,15,15),(175,2,5,47,1,5,14,14),(176,0,5,47,1,5,15,15),(177,2,5,51,1,5,14,14),(178,0,5,46,1,5,14,15),(179,0,8,46,1,5,14,15),(180,0,46,47,1,5,14,15),(181,0,46,45,1,5,14,15),(182,0,10,46,1,5,14,15),(183,0,9,47,1,5,15,15),(184,0,24,47,1,5,15,15),(185,2,60,47,1,5,15,15),(186,2,60,45,1,5,15,15),(187,2,60,46,1,5,15,15),(188,2,60,10,1,5,15,15),(189,2,9,24,1,5,15,15),(190,2,5,24,1,5,15,15),(191,2,8,24,1,5,15,15),(192,1,6,47,0,5,15,15),(193,1,6,46,0,5,15,15),(194,1,6,10,0,5,15,19),(195,2,8,6,1,5,15,19),(196,2,5,6,1,5,15,19),(197,2,5,45,0,5,14,14),(198,0,8,45,1,5,13,13),(199,1,6,45,0,5,13,15),(200,0,8,51,1,5,16,16),(201,0,6,51,1,5,16,16),(202,0,5,51,1,5,16,16),(203,0,51,10,1,5,16,16),(204,0,32,10,1,5,16,16),(205,0,5,9,1,5,17,17),(206,0,6,9,1,5,17,17),(207,0,8,9,1,5,17,17),(208,0,5,6,1,6,20,20),(209,0,8,6,1,6,20,20),(210,2,5,8,1,6,20,21),(211,2,5,9,1,6,20,20),(212,2,8,9,1,6,20,20),(213,1,8,40,0,6,20,20),(214,1,5,40,0,6,20,20),(215,1,5,62,0,6,20,21),(216,1,8,62,1,6,20,21),(217,2,5,54,1,6,21,29),(218,2,54,62,1,6,21,29),(219,2,55,54,1,6,21,21),(220,2,5,55,1,6,21,21),(221,2,8,55,1,6,21,21),(222,2,8,54,1,6,21,21),(223,1,62,72,0,6,21,21),(224,1,5,72,0,6,21,21),(225,1,54,72,0,6,21,21),(226,1,5,73,0,6,21,21),(227,1,62,73,0,6,21,21),(228,0,54,9,1,6,22,23),(229,0,5,9,1,6,22,24),(230,0,5,8,1,6,22,22),(231,0,54,8,1,6,22,24),(232,1,62,9,0,6,22,22),(233,1,62,8,1,6,22,24),(234,1,5,56,0,6,23,23),(235,2,5,8,1,6,23,24),(236,2,5,6,0,6,24,24),(237,0,5,24,1,6,24,25),(238,2,54,57,1,6,25,26),(239,2,5,57,1,6,25,26),(240,2,57,62,1,6,25,26),(241,0,5,48,1,6,26,27),(242,1,54,48,0,6,26,26),(243,0,5,59,1,6,26,28),(244,2,9,59,1,6,26,28),(245,0,9,48,1,6,26,27),(246,2,5,8,1,6,27,27),(247,2,5,9,1,6,27,27),(248,0,8,59,1,6,27,28),(249,1,9,74,1,6,27,27),(250,1,5,74,1,6,27,27),(251,1,5,75,1,6,27,27),(252,1,5,76,1,6,27,27),(253,1,5,77,1,6,27,27),(254,1,9,75,1,6,27,27),(255,1,9,76,1,6,27,27),(256,1,9,77,1,6,27,27),(257,2,5,9,1,6,28,28),(258,2,54,57,1,6,28,28),(259,0,9,60,1,6,28,28),(260,0,5,60,1,6,28,28),(261,0,9,8,1,6,28,28),(262,0,5,8,1,6,28,28),(263,2,5,57,1,6,28,29),(264,2,5,62,1,6,28,29),(265,2,5,61,1,6,28,29),(266,2,61,54,1,6,28,29),(267,2,61,62,1,6,28,29),(268,0,61,63,1,6,29,29),(269,0,54,63,1,6,29,29),(270,0,62,63,1,6,29,29),(271,0,5,63,1,6,29,29),(273,2,7,8,1,19,194,195),(274,2,9,11,1,19,194,194),(275,2,11,5,1,19,194,194),(276,0,11,80,1,19,194,194),(277,0,9,80,1,19,194,195),(278,0,9,79,1,19,194,194),(279,2,81,9,1,19,194,195),(280,2,81,11,1,19,194,194),(281,0,81,82,1,19,194,194),(282,0,9,82,1,19,194,194),(283,2,9,83,1,19,194,194),(284,2,9,5,1,19,195,197),(285,2,9,8,1,19,195,196),(286,1,9,84,0,19,195,195),(287,1,8,84,0,19,195,195),(288,2,81,5,1,19,195,195),(289,0,11,81,1,19,195,195),(290,0,11,60,1,19,195,195),(291,0,11,85,1,19,195,195),(292,0,81,60,1,19,195,195),(293,0,81,85,1,19,195,195),(294,0,85,60,1,19,195,195),(295,0,8,11,1,19,196,196),(296,0,8,81,1,19,196,196),(297,0,8,60,1,19,196,196),(298,0,8,85,1,19,196,196),(299,0,9,11,1,19,196,196),(300,0,9,81,1,19,196,196),(301,0,9,60,1,19,196,196),(302,0,9,85,1,19,196,196),(303,1,9,86,0,19,196,196),(304,1,9,87,0,19,196,196),(305,2,86,87,1,19,196,196),(306,0,5,88,1,19,196,196),(307,0,5,6,1,19,196,196),(308,2,9,7,1,19,196,197),(309,2,5,8,1,19,195,197),(310,0,8,9,1,19,197,197),(311,0,8,7,1,19,197,197),(312,1,8,80,0,19,197,197),(313,0,9,80,1,19,197,197),(314,1,7,80,0,19,197,197),(315,0,9,11,1,19,197,197),(316,0,9,89,1,19,197,197),(317,0,11,89,1,19,197,197),(318,0,9,19,1,19,197,197),(319,0,7,9,1,19,198,198),(320,0,7,8,1,19,198,199),(321,0,7,6,1,19,198,198),(322,2,9,8,1,19,198,198),(323,0,9,6,1,19,198,198),(324,0,8,6,1,19,198,198),(325,2,6,5,1,19,198,199),(326,1,6,10,1,19,198,198),(327,1,5,10,1,19,198,198),(328,2,9,5,1,19,198,198),(329,2,8,5,1,19,198,201),(330,2,5,7,1,19,199,199),(331,2,6,8,1,19,199,201),(332,0,5,24,1,19,199,199),(333,0,24,8,1,19,199,199),(334,0,8,30,1,19,199,199),(335,0,6,30,1,19,199,199),(336,0,8,9,1,19,200,201),(337,0,8,89,1,19,200,200),(338,0,9,89,1,19,200,200),(339,2,9,5,1,19,200,200),(340,0,9,90,1,19,200,200),(341,2,6,5,1,19,201,201);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narrContainers`
--

LOCK TABLES `narrContainers` WRITE;
/*!40000 ALTER TABLE `narrContainers` DISABLE KEYS */;
INSERT INTO `narrContainers` VALUES (1,'Test A',0,6,8,1,1,0),(2,'Test B',0,11,17,1,1,0),(3,'Part One',0,1,150,5,5,0),(4,'Part Two',0,151,376,5,5,0),(5,'1',1,3,19,5,5,0),(6,'2',1,20,29,5,5,0),(7,'3',1,30,42,5,5,0),(8,'4',1,43,54,5,5,0),(9,'5',1,55,66,5,5,0),(10,'6',1,67,76,5,5,0),(11,'7',1,77,84,5,5,0),(12,'8',1,85,98,5,5,0),(13,'9',1,99,117,5,5,0),(14,'10',1,118,131,5,5,0),(15,'11',1,132,149,5,5,0),(16,'12',1,153,168,5,5,0),(17,'13',1,169,179,5,5,0),(18,'14',1,180,192,5,5,0),(19,'15',1,193,207,5,5,0),(20,'16',1,208,221,5,5,0),(21,'17',1,222,238,5,5,0),(22,'18',1,239,253,5,5,0),(23,'19',1,254,266,5,5,0),(24,'20',1,267,275,5,5,0),(25,'21',1,276,283,5,5,0),(26,'22',1,284,290,5,5,0),(27,'23',1,291,304,5,5,0),(28,'24',1,305,318,5,5,0),(29,'25',1,319,323,5,5,0),(30,'26',1,324,331,5,5,0),(31,'27',1,332,340,5,5,0),(32,'28',1,341,357,5,5,0),(33,'29',1,358,362,5,5,0),(34,'30',1,363,370,5,5,0),(35,'31',1,371,376,5,5,0);
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

-- Dump completed on 2025-03-12 23:45:04
