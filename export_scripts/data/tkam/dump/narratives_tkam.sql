-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: persimmon.hcmc.uvic.ca    Database: narratives_tkam
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
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (0,'[NULL]'),(1,'Test 1'),(2,'Test 2'),(3,'Test 3'),(4,'Test 4'),(5,'Scout Finch'),(6,'Dill Harris'),(7,'Alexandra Finch'),(8,'Jem Finch'),(9,'Atticus Finch'),(10,'Boo Radley'),(11,'Heck Tate'),(13,'General Andrew Jackson'),(14,'Bob Ewell'),(15,'Mayella Ewell'),(16,'Simon Finch'),(17,'Methodists'),(18,'John Wesley'),(19,'God'),(20,'\"Three slaves\"'),(21,'Simon Finch\'s wife'),(22,'John Hale \"Jack\" Finch'),(23,'Jimmy Hancock'),(24,'Calpurnia'),(26,'The Haverfords'),(27,'Three witnesses'),(28,'Maycomb\'s leading blacksmith'),(29,'Mother (of Scout and Jem)'),(30,'Mrs. Dubose'),(31,'Henry Lafayette Dubose'),(32,'Miss Rachel Haverford'),(33,'Dill\'s mother'),(34,'Jesus'),(35,'Dracula'),(36,'Dill\'s father'),(37,'Oliver Optic'),(38,'Victor Appleton'),(39,'Edgar Rice Burroughs'),(40,'Tarzan'),(41,'Mr. Crabtree (The Rover Boys)'),(42,'Mr. Damon (Tom Swift)'),(43,'Merlin'),(44,'Crazy Addie'),(45,'Mrs. Radley'),(46,'Nathan Radley'),(47,'Mr. Radley'),(48,'The Cunninghams'),(49,'Mr. Conner'),(50,'The judge (12)'),(51,'Miss Stephanie Crawford'),(53,'Tom Swift'),(54,'Miss Caroline Fisher'),(55,'Miss Maudie Atkinson'),(56,'Lorenzo Dow'),(57,'Walter Cunningham Jr.'),(58,'Scout\'s classmate'),(59,'Walter Cunningham Sr.'),(60,'Dr. Reynolds'),(61,'Miss Blount'),(62,'The first grade'),(63,'The sixth grade'),(64,'Chuck Little'),(65,'D.C.'),(66,'Burris Ewell'),(67,'\"A N***o\" (11)'),(68,'The Radleys\' neighbours'),(69,'Several people who see Boo'),(70,'Maycomb Town Council'),(71,'John Taylor (Judge)'),(72,'Republicans'),(73,'Professors'),(74,'Farmers'),(75,'Doctors'),(76,'Dentists'),(77,'Lawyers'),(78,'The Radley Place'),(79,'Tom Robinson\'s Trial'),(80,'Tom Robinson'),(81,'Link Deas'),(82,'Old Sarum Bunch'),(83,'\"someone\"'),(84,'Henry W. Grady'),(85,'Mr. Avery'),(86,'Ku Klux Klan'),(87,'Sam Levy'),(88,'The Levy family'),(89,'Mr. Underwood'),(90,'Cousin Joshua St. Clair'),(91,'Mr. Underwood\'s father'),(92,'Braxton Bragg (Confederate general)'),(93,'Mr. Dolphus Raymond'),(94,'Mennonites'),(95,'Mr. X Billups'),(96,'Mr. X Billups\' clerk'),(97,'Mr. X Billups\' parents'),(98,'Mr. Tensaw Jones'),(99,'Miss Emily Davis'),(100,'Mr. Byron Waller'),(101,'Mr. Jake Slade'),(102,'Foot-washers'),(103,'Foot-washers\' driver'),(104,'William Jennings Bryan'),(105,'Tom Robinson\'s jury'),(106,'Crowd (at the trial)'),(107,'Mr. Dolphus Raymond\'s wife'),(108,'Mr. Dolphus Raymond\'s children'),(109,'A Spencer lady'),(110,'Mixed child (delivers for the drugstore)'),(111,'Black woman (at the trial)'),(112,'Black child (at the trial)'),(113,'Tax assessor'),(114,'Tax collector'),(115,'County clerk'),(116,'County solicitor'),(117,'Circuit clerk'),(118,'Judge of Probate'),(119,'Idlers\' Club'),(120,'Chief Justice'),(121,'Reverend Sykes'),(122,'\"Four N*****s\" (219)'),(123,'Mr. Gilmer'),(124,'Mr. Whitley'),(125,'Judge Taylor'),(126,'The Coninghams'),(127,'Jeems Cunningham'),(128,'Jeems Cunningham\'s mother'),(129,'Mrs. Taylor'),(130,'Court reporter'),(131,'Maycomb\'s mayor'),(132,'Garbage collector'),(133,'Maycomb\'s Black community'),(134,'Mayella Ewell\'s mother'),(135,'Sherlock Holmes'),(136,'Mayella Ewell\'s siblings'),(137,'Mr. Jingle'),(138,'Social worker'),(139,'Tom Robinson\'s wife'),(140,'Tom Robinson\'s children'),(141,'Man (Tom Robinson fought)'),(142,'Thomas Jefferson'),(143,'Yankees'),(144,'American Executive Branch'),(145,'\"[P]eople\" (who run public education)'),(146,'\"[C]hildren\"'),(147,'The Rockefeller family'),(148,'Albert Einstein');
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
) ENGINE=InnoDB AUTO_INCREMENT=922 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menExs`
--

LOCK TABLES `menExs` WRITE;
/*!40000 ALTER TABLE `menExs` DISABLE KEYS */;
INSERT INTO `menExs` VALUES (1,0,1,2,1,1,6,8),(2,2,3,4,1,1,12,14),(3,2,1,4,1,1,15,15),(4,0,5,6,1,19,193,194),(5,0,5,7,1,19,193,193),(6,2,5,9,1,19,193,193),(7,0,5,8,1,19,193,193),(8,0,6,7,1,19,193,193),(9,0,6,9,1,19,193,193),(10,0,6,8,1,19,193,193),(11,0,7,9,1,19,193,193),(12,0,7,8,1,19,193,193),(13,2,9,8,1,19,193,193),(14,0,6,10,1,19,193,193),(15,0,5,10,1,19,193,193),(16,2,8,11,1,19,193,193),(17,2,5,8,1,5,3,3),(18,0,5,15,1,5,3,3),(19,0,5,14,1,5,3,3),(20,0,8,15,1,5,3,3),(21,0,8,14,1,5,3,3),(22,0,5,6,1,5,3,3),(23,0,8,6,1,5,3,3),(25,0,8,10,1,5,3,3),(26,0,5,10,1,5,3,3),(27,1,6,10,1,5,3,3),(28,1,5,13,0,5,3,3),(29,1,8,13,0,5,3,3),(30,1,5,16,0,5,3,6),(31,1,8,16,0,5,3,3),(32,1,16,13,0,5,3,3),(33,1,9,13,1,5,3,3),(34,0,9,16,1,5,3,6),(35,0,9,6,1,5,3,3),(36,0,9,10,1,5,3,3),(37,0,9,14,1,5,3,3),(38,0,9,15,1,5,3,3),(39,2,5,9,1,5,3,3),(40,2,8,9,1,5,3,3),(41,0,16,17,1,5,4,4),(43,1,5,17,0,5,4,4),(44,1,16,18,0,5,4,4),(45,1,5,18,0,5,4,4),(46,1,16,19,1,5,4,4),(47,1,5,19,1,5,4,4),(48,2,16,20,1,5,4,4),(49,1,5,20,0,5,4,4),(50,1,5,20,0,5,4,4),(51,2,16,21,1,5,4,4),(52,1,5,21,0,5,4,4),(53,0,9,22,1,5,5,6),(54,0,9,7,1,5,5,5),(55,0,7,22,1,5,5,5),(56,0,7,16,1,5,5,5),(57,0,22,16,1,5,5,5),(58,2,7,23,1,5,5,5),(59,0,9,23,1,5,5,5),(60,0,22,23,1,5,5,5),(61,0,5,23,1,5,5,5),(62,2,9,26,1,5,5,5),(63,0,5,7,1,5,5,5),(64,0,5,22,1,5,5,6),(65,0,5,9,1,5,5,7),(66,1,5,26,0,5,5,5),(67,2,26,28,1,5,5,5),(68,1,5,28,0,5,5,5),(69,2,71,26,1,5,5,5),(70,2,9,71,1,5,5,5),(71,1,5,71,1,5,5,5),(72,0,5,8,1,5,6,7),(73,0,5,24,1,5,6,7),(74,0,8,24,1,5,6,7),(75,0,9,0,1,5,6,7),(76,0,9,8,1,5,6,7),(77,0,9,24,1,5,6,7),(78,1,5,29,0,5,7,7),(79,0,8,29,1,5,7,7),(80,0,9,29,1,5,7,7),(81,0,5,30,1,5,7,7),(82,0,8,30,1,5,7,7),(83,0,24,30,1,5,7,7),(84,1,5,10,0,5,7,7),(85,1,8,10,0,5,7,7),(86,0,8,6,1,5,7,7),(87,0,5,6,1,5,7,7),(88,0,8,32,1,5,7,8),(89,0,5,32,1,5,7,8),(90,2,5,8,1,5,8,9),(91,2,5,6,1,5,8,9),(92,2,8,6,1,5,8,9),(93,0,6,32,1,5,8,8),(94,0,6,33,1,5,8,9),(95,1,8,33,0,5,8,9),(96,1,5,33,0,5,8,9),(97,1,6,35,0,5,9,9),(98,1,8,35,0,5,9,9),(99,1,5,35,0,5,9,9),(100,1,6,36,1,5,9,9),(101,1,5,36,0,5,9,9),(102,0,8,36,0,5,9,9),(103,1,5,37,0,5,9,9),(104,1,6,37,0,5,9,9),(105,1,8,37,0,5,9,9),(106,1,5,38,0,5,9,9),(107,1,8,38,0,5,9,9),(108,1,6,38,0,5,9,9),(109,1,5,39,0,5,9,9),(110,1,6,39,0,5,9,9),(111,1,8,39,0,5,9,9),(112,1,5,40,0,5,9,9),(113,1,6,40,0,5,9,9),(114,1,8,40,0,5,9,9),(115,1,6,41,0,5,9,9),(116,1,5,41,0,5,9,9),(117,1,8,41,0,5,9,9),(118,1,5,42,0,5,10,10),(119,1,6,42,0,5,10,10),(120,1,8,42,0,5,10,10),(121,1,5,43,0,5,10,10),(122,1,8,43,0,5,10,10),(123,1,8,10,1,5,10,10),(124,1,5,10,1,5,10,19),(125,1,6,10,1,5,10,10),(126,1,5,44,0,5,10,11),(127,1,5,67,0,5,11,11),(128,1,67,47,1,5,11,11),(129,1,67,45,1,5,11,11),(130,1,67,10,1,5,11,11),(131,0,5,47,1,5,11,13),(132,0,8,47,1,5,11,11),(133,0,5,45,1,5,11,13),(134,0,45,68,1,5,11,11),(135,1,5,68,0,5,11,11),(136,0,45,46,1,5,11,15),(137,0,5,46,1,5,11,15),(138,0,47,46,1,5,11,15),(139,0,10,46,1,5,11,15),(140,0,47,10,1,5,11,15),(141,0,45,10,1,5,11,15),(142,0,47,45,1,5,11,15),(143,0,5,9,1,5,12,12),(144,2,10,48,1,5,12,13),(145,2,10,49,1,5,12,12),(146,2,48,49,1,5,12,12),(147,1,5,48,1,5,12,13),(148,2,10,71,1,5,12,12),(149,2,48,71,1,5,12,12),(150,2,71,49,1,5,12,12),(151,2,47,71,1,5,13,13),(152,0,47,48,1,5,12,13),(153,0,9,47,1,5,13,13),(154,0,9,45,1,5,13,13),(155,0,9,10,1,5,13,13),(156,0,9,46,1,5,13,13),(157,2,69,10,1,5,13,13),(158,1,5,69,0,5,13,13),(159,1,8,69,0,5,13,13),(160,2,8,51,1,5,13,14),(161,0,5,51,1,5,13,13),(162,0,51,47,1,5,13,14),(163,0,51,45,1,5,13,14),(164,0,51,10,1,5,13,14),(165,0,51,46,1,5,13,14),(166,2,47,11,1,5,14,14),(167,2,11,10,1,5,14,14),(168,0,5,11,1,5,14,14),(169,1,8,10,1,5,14,19),(170,0,5,8,1,5,10,14),(171,2,5,8,1,5,15,19),(172,0,8,47,1,5,13,13),(173,2,8,47,1,5,14,14),(174,0,8,47,1,5,15,15),(175,2,5,47,1,5,14,14),(176,0,5,47,1,5,15,15),(177,2,5,51,1,5,14,14),(178,0,5,46,1,5,14,15),(179,0,8,46,1,5,14,15),(180,0,46,47,1,5,14,15),(181,0,46,45,1,5,14,15),(182,0,10,46,1,5,14,15),(183,0,9,47,1,5,15,15),(184,0,24,47,1,5,15,15),(185,2,60,47,1,5,15,15),(186,2,60,45,1,5,15,15),(187,2,60,46,1,5,15,15),(188,2,60,10,1,5,15,15),(189,2,9,24,1,5,15,15),(190,2,5,24,1,5,15,15),(191,2,8,24,1,5,15,15),(192,1,6,47,0,5,15,15),(193,1,6,46,0,5,15,15),(194,1,6,10,0,5,15,19),(195,2,8,6,1,5,15,19),(196,2,5,6,1,5,15,19),(197,2,5,45,0,5,14,14),(198,0,8,45,1,5,13,13),(199,1,6,45,0,5,13,15),(200,0,8,51,1,5,16,16),(201,0,6,51,1,5,16,16),(202,0,5,51,1,5,16,16),(203,0,51,10,1,5,16,16),(204,0,32,10,1,5,16,16),(205,0,5,9,1,5,17,17),(206,0,6,9,1,5,17,17),(207,0,8,9,1,5,17,17),(208,0,5,6,1,6,20,20),(209,0,8,6,1,6,20,20),(210,2,5,8,1,6,20,21),(211,2,5,9,1,6,20,20),(212,2,8,9,1,6,20,20),(213,1,8,40,0,6,20,20),(214,1,5,40,0,6,20,20),(215,1,5,62,0,6,20,21),(216,1,8,62,1,6,20,21),(217,2,5,54,1,6,21,29),(218,2,54,62,1,6,21,29),(219,2,55,54,1,6,21,21),(220,2,5,55,1,6,21,21),(221,2,8,55,1,6,21,21),(222,2,8,54,1,6,21,21),(223,1,62,72,0,6,21,21),(224,1,5,72,0,6,21,21),(225,1,54,72,0,6,21,21),(226,1,5,73,0,6,21,21),(227,1,62,73,0,6,21,21),(228,0,54,9,1,6,22,23),(229,0,5,9,1,6,22,24),(230,0,5,8,1,6,22,22),(231,0,54,8,1,6,22,24),(232,1,62,9,0,6,22,22),(233,1,62,8,1,6,22,24),(234,1,5,56,0,6,23,23),(235,2,5,8,1,6,23,24),(236,2,5,6,0,6,24,24),(237,0,5,24,1,6,24,25),(238,2,54,57,1,6,25,26),(239,2,5,57,1,6,25,26),(240,2,57,62,1,6,25,26),(241,0,5,48,1,6,26,27),(242,1,54,48,0,6,26,26),(243,0,5,59,1,6,26,28),(244,2,9,59,1,6,26,28),(245,0,9,48,1,6,26,27),(246,2,5,8,1,6,27,27),(247,2,5,9,1,6,27,27),(248,0,8,59,1,6,27,28),(249,1,9,74,1,6,27,27),(250,1,5,74,1,6,27,27),(251,1,5,75,1,6,27,27),(252,1,5,76,1,6,27,27),(253,1,5,77,1,6,27,27),(254,1,9,75,1,6,27,27),(255,1,9,76,1,6,27,27),(256,1,9,77,1,6,27,27),(257,2,5,9,1,6,28,28),(258,2,54,57,1,6,28,28),(259,0,9,60,1,6,28,28),(260,0,5,60,1,6,28,28),(261,0,9,8,1,6,28,28),(262,0,5,8,1,6,28,28),(263,2,5,57,1,6,28,29),(264,2,5,62,1,6,28,29),(265,2,5,61,1,6,28,29),(266,2,61,54,1,6,28,29),(267,2,61,62,1,6,28,29),(268,0,61,63,1,6,29,29),(269,0,54,63,1,6,29,29),(270,0,62,63,1,6,29,29),(271,0,5,63,1,6,29,29),(273,2,7,8,1,19,194,195),(274,2,9,11,1,19,194,194),(275,2,11,5,1,19,194,194),(276,0,11,80,1,19,194,194),(277,0,9,80,1,19,194,195),(278,0,9,79,1,19,194,194),(279,2,81,9,1,19,194,195),(280,2,81,11,1,19,194,194),(281,0,81,82,1,19,194,194),(282,0,9,82,1,19,194,194),(283,2,9,83,1,19,194,194),(284,2,9,5,1,19,195,197),(285,2,9,8,1,19,195,196),(286,1,9,84,0,19,195,195),(287,1,8,84,0,19,195,195),(288,2,81,5,1,19,195,195),(289,0,11,81,1,19,195,195),(290,0,11,60,1,19,195,195),(291,0,11,85,1,19,195,195),(292,0,81,60,1,19,195,195),(293,0,81,85,1,19,195,195),(294,0,85,60,1,19,195,195),(295,0,8,11,1,19,196,196),(296,0,8,81,1,19,196,196),(297,0,8,60,1,19,196,196),(298,0,8,85,1,19,196,196),(299,0,9,11,1,19,196,196),(300,0,9,81,1,19,196,196),(301,0,9,60,1,19,196,196),(302,0,9,85,1,19,196,196),(303,1,9,86,0,19,196,196),(304,1,9,87,0,19,196,196),(305,2,86,87,1,19,196,196),(306,0,5,88,1,19,196,196),(307,0,5,6,1,19,196,196),(308,2,9,7,1,19,196,197),(309,2,5,8,1,19,195,197),(310,0,8,9,1,19,197,197),(311,0,8,7,1,19,197,197),(312,1,8,80,0,19,197,197),(313,0,9,80,1,19,197,197),(314,1,7,80,0,19,197,197),(315,0,9,11,1,19,197,197),(316,0,9,89,1,19,197,197),(317,0,11,89,1,19,197,197),(318,0,9,19,1,19,197,197),(319,0,7,9,1,19,198,198),(320,0,7,8,1,19,198,199),(321,0,7,6,1,19,198,198),(322,2,9,8,1,19,198,198),(323,0,9,6,1,19,198,198),(324,0,8,6,1,19,198,198),(325,2,6,5,1,19,198,199),(326,1,6,10,1,19,198,198),(327,1,5,10,1,19,198,198),(328,2,9,5,1,19,198,198),(329,2,8,5,1,19,198,202),(330,2,5,7,1,19,199,199),(331,2,6,8,1,19,199,202),(332,0,5,24,1,19,199,199),(333,0,24,8,1,19,199,199),(334,0,8,30,1,19,199,199),(335,0,6,30,1,19,199,199),(336,0,8,9,1,19,200,201),(337,0,8,89,1,19,200,200),(338,0,9,89,1,19,200,200),(339,2,9,5,1,19,200,207),(340,0,9,90,1,19,200,200),(341,2,6,5,1,19,201,201),(342,0,9,11,1,19,202,202),(343,0,59,11,1,19,202,202),(344,2,9,59,1,19,202,202),(345,2,9,82,1,19,202,204),(346,2,59,82,1,19,202,203),(347,0,6,8,1,19,203,203),(348,2,5,82,1,19,203,204),(349,0,5,11,1,19,203,203),(350,0,5,85,1,19,203,203),(351,0,5,89,1,19,203,203),(352,0,9,6,1,19,203,203),(353,2,9,8,1,19,203,204),(354,2,82,8,1,19,203,204),(355,2,5,59,1,19,204,206),(356,0,5,57,1,19,205,206),(357,0,57,59,1,19,205,206),(358,0,5,8,1,19,205,205),(359,0,9,8,1,19,205,205),(360,0,9,57,1,19,205,205),(361,0,8,57,1,19,205,205),(362,2,5,82,1,19,205,206),(363,2,59,82,1,19,206,206),(364,2,80,9,1,19,206,206),(365,2,89,9,1,19,206,207),(366,2,80,5,1,19,206,206),(367,2,89,5,1,19,206,206),(368,2,6,9,1,19,206,206),(369,0,9,8,1,19,207,207),(370,2,5,8,1,20,208,208),(371,0,5,9,1,20,208,208),(372,0,8,9,1,20,208,208),(373,0,5,7,1,20,208,208),(374,0,8,7,1,20,208,208),(375,0,9,7,1,20,208,209),(376,2,9,5,1,20,209,211),(377,2,9,8,1,20,209,211),(378,2,9,7,1,20,209,211),(379,2,7,5,1,20,209,209),(380,2,7,8,1,20,209,209),(381,0,7,89,1,20,209,209),(382,0,9,89,1,20,209,209),(383,0,89,91,1,20,209,209),(384,0,89,92,1,20,209,209),(385,0,91,92,1,20,209,209),(386,0,9,92,1,20,209,209),(387,2,24,7,1,20,209,209),(388,2,24,5,1,20,209,209),(389,0,9,24,1,20,209,209),(390,0,7,24,1,20,210,210),(391,0,5,59,1,20,210,210),(392,0,9,59,1,20,210,210),(393,0,8,57,1,20,210,210),(394,0,5,57,1,20,211,211),(395,0,9,57,1,20,211,211),(396,2,6,5,1,20,211,211),(397,2,6,8,1,16,211,211),(398,2,6,9,1,20,211,211),(399,2,6,7,1,20,211,211),(400,0,7,48,1,20,211,211),(401,2,7,8,1,20,211,211),(402,2,8,5,1,20,211,211),(404,0,8,93,1,20,211,211),(405,0,6,93,1,20,211,211),(406,0,8,94,1,20,211,212),(407,0,6,94,1,20,211,212),(408,2,6,8,1,20,211,213),(409,0,8,95,1,20,212,212),(410,0,6,95,1,20,212,212),(411,1,8,96,0,20,212,212),(412,1,6,96,0,20,212,212),(413,2,95,96,1,20,212,212),(414,1,8,97,0,20,212,212),(415,1,6,97,0,20,212,212),(416,0,95,97,1,20,212,212),(417,0,8,98,1,20,212,212),(418,0,6,98,1,20,212,212),(419,0,8,99,1,20,212,212),(420,0,6,99,1,20,212,212),(421,0,8,100,1,20,212,212),(422,0,6,100,1,20,212,212),(423,0,8,101,1,20,212,212),(424,0,6,101,1,20,212,212),(425,0,8,55,1,20,212,212),(426,0,6,55,1,20,212,212),(427,2,102,55,1,20,212,213),(428,0,103,55,1,20,212,213),(429,0,102,103,1,20,212,213),(430,0,8,102,1,20,212,212),(431,0,6,102,1,20,212,212),(432,0,8,103,1,20,212,212),(433,0,6,103,1,20,212,212),(434,2,8,55,1,20,213,213),(435,2,6,55,1,20,213,213),(436,2,5,55,1,20,213,213),(437,0,55,80,1,20,213,213),(438,0,5,80,1,20,213,213),(439,2,51,55,1,20,213,213),(440,0,51,104,1,20,213,213),(441,0,51,9,1,20,213,213),(442,2,9,5,1,20,214,214),(443,2,9,8,1,20,214,214),(444,0,9,105,1,20,214,214),(445,1,5,105,1,20,214,214),(446,1,8,105,1,20,214,214),(447,2,8,6,1,20,214,216),(448,0,8,106,1,20,214,214),(449,0,6,106,1,20,214,214),(450,0,8,93,1,20,214,216),(451,0,6,93,1,20,214,216),(452,0,93,106,1,20,214,214),(453,1,8,107,0,20,214,215),(454,1,8,108,0,20,214,215),(455,0,107,108,1,20,214,214),(456,0,93,107,1,20,214,215),(457,0,93,108,1,20,214,215),(458,2,8,5,1,20,215,216),(459,0,93,109,1,20,215,215),(460,1,8,109,1,20,215,215),(461,0,8,110,1,20,215,215),(462,0,5,110,1,20,215,215),(463,0,8,111,1,20,215,215),(464,0,8,112,1,20,215,216),(465,0,111,112,1,20,215,215),(466,0,6,112,1,20,216,216),(467,2,22,8,1,20,216,216),(468,0,8,106,1,20,216,216),(469,0,6,106,1,20,216,216),(470,0,8,9,1,20,216,216),(471,1,5,113,0,20,217,217),(472,1,5,114,0,20,217,217),(473,1,5,115,0,20,217,217),(474,1,5,116,0,20,217,217),(475,1,5,117,0,20,217,217),(476,1,5,118,0,20,217,217),(477,0,5,8,1,20,217,217),(478,0,5,6,1,20,217,217),(479,0,8,6,1,20,217,218),(481,0,9,119,1,20,217,218),(482,2,9,5,1,20,217,217),(483,0,9,120,1,20,217,217),(484,2,119,119,1,20,218,218),(485,2,119,5,1,20,218,218),(486,0,119,80,1,20,218,218),(487,0,9,80,1,20,218,218),(488,2,119,106,1,20,218,218),(489,0,8,119,1,20,218,218),(490,0,6,119,1,20,218,218),(491,2,8,5,1,20,218,219),(492,2,121,5,1,20,219,219),(493,2,121,8,1,20,219,219),(494,2,121,6,1,20,219,219),(495,0,122,8,1,20,219,219),(496,0,122,6,1,20,219,219),(497,0,5,105,1,20,219,219),(498,0,123,9,1,20,219,219),(499,0,123,80,1,20,219,219),(500,0,9,80,1,20,219,219),(501,2,125,124,1,20,220,220),(502,0,125,48,1,20,220,220),(503,0,125,126,1,20,220,220),(504,2,125,127,1,20,220,220),(505,0,125,128,1,20,220,220),(506,0,48,126,1,20,220,220),(507,0,48,127,1,20,220,220),(508,0,48,128,1,20,220,220),(509,0,126,127,1,20,220,220),(510,0,126,128,1,20,220,220),(511,0,127,128,1,20,220,220),(512,2,125,48,1,20,221,221),(513,2,125,126,1,20,221,221),(514,2,9,5,1,20,221,221),(515,0,9,125,1,20,221,221),(516,0,9,129,1,20,221,221),(517,0,125,129,1,20,221,221),(518,0,125,11,1,20,221,221),(519,0,55,79,1,20,213,213),(520,0,8,79,1,20,213,221),(521,0,6,79,1,20,213,221),(522,0,9,79,1,20,214,221),(523,0,105,79,1,20,214,214),(524,0,106,79,1,20,214,221),(525,0,93,79,1,20,214,216),(526,0,111,79,1,20,215,215),(527,0,112,79,1,20,215,216),(528,0,119,79,1,20,217,218),(529,0,121,79,1,20,219,221),(530,0,122,79,1,20,219,221),(531,0,105,79,1,20,219,221),(532,0,123,79,1,20,219,221),(533,0,80,79,1,20,219,221),(534,0,125,79,1,20,220,221),(535,0,11,79,1,20,221,221),(536,0,5,14,1,21,222,222),(537,0,5,15,1,21,222,222),(538,0,14,15,1,21,222,222),(539,2,5,8,1,21,222,222),(540,0,8,11,1,21,222,222),(541,2,123,11,1,21,222,223),(542,0,8,123,1,21,222,222),(543,0,123,105,1,21,223,223),(544,0,11,105,1,21,223,223),(545,2,11,14,1,21,223,224),(546,0,11,80,1,21,223,223),(547,2,11,15,1,21,223,224),(548,0,14,80,1,21,223,223),(549,0,14,15,1,21,223,223),(550,0,80,15,1,21,223,223),(551,2,125,9,1,21,223,224),(552,2,9,11,1,21,224,226),(553,0,9,15,1,21,224,226),(554,0,125,11,1,21,224,224),(555,2,5,8,1,21,224,224),(556,0,6,121,1,21,224,224),(557,0,11,15,1,21,225,226),(558,0,11,80,1,21,225,225),(559,2,9,130,1,21,225,225),(560,0,130,15,1,21,225,225),(561,0,130,11,1,21,225,225),(562,2,9,80,1,21,226,226),(563,2,9,123,1,21,226,226),(564,2,123,125,1,21,226,226),(565,2,125,11,1,21,226,226),(566,0,5,106,1,21,226,226),(567,0,5,122,1,21,226,226),(568,2,6,121,1,21,226,226),(569,0,106,125,1,21,226,226),(570,0,8,125,1,21,226,227),(571,2,117,14,1,21,227,227),(572,0,117,106,1,21,227,227),(573,0,14,19,1,21,227,227),(574,0,5,55,1,21,228,228),(575,1,5,15,0,21,228,228),(576,2,131,5,1,21,228,228),(577,2,131,8,1,21,228,228),(578,2,131,9,1,21,228,228),(579,0,9,8,1,21,228,229),(580,0,131,132,1,21,228,228),(581,0,14,133,1,21,229,229),(582,0,8,133,1,21,229,229),(583,0,9,133,1,21,229,229),(584,2,14,123,1,21,229,231),(585,0,9,123,1,21,229,230),(586,0,123,15,1,21,230,231),(587,0,14,15,1,21,230,231),(588,0,14,134,1,21,230,230),(589,0,15,134,1,21,230,230),(590,2,125,14,1,21,230,234),(591,0,125,15,1,21,230,230),(592,2,125,123,1,21,230,230),(593,2,123,8,1,21,230,230),(594,0,14,34,1,21,231,231),(595,2,14,80,1,21,231,231),(596,0,80,15,1,21,231,231),(597,2,125,106,1,21,231,232),(598,2,9,125,1,21,231,231),(599,2,11,106,1,21,231,231),(600,2,122,122,1,21,231,231),(601,2,121,8,1,21,231,232),(602,0,121,6,1,21,231,231),(603,2,8,5,1,21,231,232),(604,2,8,6,1,21,231,231),(605,0,121,9,1,21,232,232),(606,0,121,5,1,21,232,232),(607,0,121,6,1,21,232,232),(608,0,8,6,1,21,232,232),(609,0,9,8,1,21,232,232),(610,0,9,6,1,21,232,232),(611,0,14,106,1,21,232,232),(612,2,9,5,1,21,232,232),(613,0,9,125,1,21,232,232),(614,0,9,129,1,21,232,232),(615,0,125,129,1,21,232,232),(616,2,125,123,1,21,232,232),(617,2,9,123,1,21,233,233),(618,0,125,80,1,21,233,233),(619,0,125,15,1,21,233,233),(620,0,80,15,1,21,233,233),(621,0,14,15,1,21,233,233),(622,0,14,80,1,21,233,234),(623,0,5,106,1,21,233,233),(624,2,9,80,1,21,233,233),(625,2,123,14,1,21,233,234),(626,0,123,80,1,21,233,233),(627,2,14,15,1,21,234,234),(628,0,14,11,1,21,234,234),(629,0,14,133,1,21,234,234),(630,2,9,14,1,21,234,237),(631,0,125,106,1,21,234,234),(632,0,9,15,1,21,234,235),(633,0,9,11,1,21,234,236),(634,0,14,11,1,21,235,237),(635,2,9,123,1,21,235,236),(636,0,11,15,1,21,235,235),(637,2,9,130,1,21,235,236),(638,0,130,11,1,21,235,235),(639,0,130,15,1,21,235,235),(640,0,14,15,1,21,236,236),(641,2,123,125,1,21,236,236),(642,0,123,14,1,21,236,237),(643,2,9,125,1,21,236,236),(644,0,14,106,1,21,236,236),(645,0,9,105,1,21,237,237),(646,0,14,105,1,21,237,237),(647,2,14,125,1,21,237,237),(648,0,14,34,1,21,237,237),(649,0,14,80,1,21,237,237),(650,2,123,14,1,21,238,238),(651,2,8,5,1,21,238,238),(652,0,8,14,1,21,238,238),(653,0,9,14,1,21,238,238),(654,0,9,15,1,21,238,238),(655,0,14,15,1,21,238,238),(656,0,5,135,1,21,238,238),(657,0,5,80,1,21,238,238),(658,0,5,11,1,21,238,238),(659,2,117,106,1,22,239,239),(660,0,117,15,1,22,239,239),(661,0,15,19,1,22,239,239),(662,0,5,14,1,22,239,239),(663,2,123,15,1,22,239,242),(664,0,123,105,1,22,239,239),(665,0,15,105,1,22,239,239),(666,2,125,15,1,22,240,240),(667,0,15,9,1,22,240,241),(668,0,125,9,1,22,240,240),(669,0,15,14,1,22,240,241),(670,0,14,9,1,22,240,240),(671,2,5,8,1,22,240,240),(672,0,8,15,1,22,240,240),(673,0,8,125,1,22,240,240),(674,2,15,80,1,22,241,241),(675,0,123,130,1,22,241,241),(676,2,15,14,1,22,242,242),(677,0,15,11,1,22,242,242),(678,0,123,80,1,22,242,242),(679,0,15,80,1,22,242,242),(680,0,123,9,1,22,242,242),(681,2,125,123,1,22,242,242),(682,0,125,15,1,22,242,242),(683,0,125,9,1,22,242,243),(684,0,125,80,1,22,242,242),(685,0,9,80,1,22,242,242),(686,2,9,15,1,22,242,251),(687,2,15,125,1,22,243,243),(688,2,125,130,1,22,243,243),(689,0,15,136,1,22,244,244),(690,0,5,66,1,22,244,244),(691,1,9,134,0,22,244,244),(692,0,15,134,1,22,244,244),(693,0,15,14,1,22,244,246),(694,0,5,137,0,22,244,244),(695,0,9,123,1,22,244,244),(696,0,9,105,1,22,244,244),(697,0,15,105,1,22,244,244),(698,0,105,14,1,22,244,245),(699,0,105,136,0,22,244,244),(700,0,14,136,1,22,244,244),(701,0,15,136,1,22,244,245),(702,2,15,138,1,22,245,245),(703,1,9,138,0,22,245,245),(704,1,105,138,0,22,245,245),(705,0,138,14,1,22,245,245),(706,0,9,14,1,22,245,246),(707,0,15,130,1,22,246,246),(708,2,125,15,1,22,246,246),(709,0,9,80,1,22,246,247),(710,2,15,80,1,22,246,246),(711,1,15,133,1,22,247,247),(712,0,5,11,1,22,247,247),(713,0,15,123,1,22,247,247),(714,2,125,15,1,22,248,248),(715,2,9,125,1,22,248,248),(716,2,8,5,1,22,248,248),(717,2,8,121,1,22,248,249),(718,0,8,80,1,22,248,248),(719,0,121,80,1,22,249,249),(720,0,121,93,1,22,249,249),(721,0,80,93,1,22,249,249),(722,2,9,80,1,22,248,248),(723,0,9,80,1,22,249,251),(724,0,15,80,1,22,247,251),(725,2,123,125,1,22,249,249),(726,0,123,9,1,22,249,249),(727,0,123,15,1,22,249,249),(728,0,125,15,1,22,249,252),(729,0,125,9,1,22,249,249),(730,2,125,9,1,22,250,250),(731,1,9,136,0,22,250,250),(732,0,15,136,1,22,250,250),(733,0,9,14,1,22,251,251),(734,0,15,14,1,22,251,251),(735,2,123,15,1,22,251,251),(736,0,9,123,1,22,252,253),(737,0,15,9,1,22,252,252),(738,2,123,125,1,22,252,252),(739,2,121,5,1,22,252,252),(740,2,8,6,1,22,252,252),(741,0,8,121,1,22,252,252),(742,0,6,121,1,22,252,252),(743,0,5,89,1,22,252,252),(744,2,5,8,1,22,252,252),(745,0,8,9,1,22,252,252),(746,0,89,9,1,22,252,252),(747,2,9,5,1,22,252,253),(748,0,9,125,1,22,252,252),(749,2,5,6,1,22,253,253),(750,0,6,125,0,22,253,253),(751,0,5,119,1,22,253,253),(752,0,5,11,1,22,253,253),(753,2,125,9,1,22,253,253),(754,0,80,117,1,23,254,254),(755,2,125,80,1,23,254,254),(756,2,9,80,1,23,254,261),(757,2,9,106,1,23,254,254),(758,0,80,139,1,23,254,254),(759,0,80,140,1,23,254,254),(760,0,9,139,1,23,254,254),(761,0,9,140,1,23,254,254),(762,0,139,140,1,23,254,254),(763,0,106,80,1,23,254,254),(764,0,106,139,1,23,254,254),(765,0,106,140,1,23,254,254),(766,0,80,141,1,23,254,254),(767,1,9,141,0,23,254,254),(768,2,6,8,1,23,254,255),(769,0,6,9,1,23,254,254),(770,0,8,9,1,23,255,255),(771,0,8,105,1,23,255,255),(772,0,8,80,0,23,255,255),(773,0,9,105,1,23,255,255),(774,0,9,15,1,23,255,255),(775,2,80,15,1,23,255,256),(776,0,80,81,1,23,255,255),(777,0,125,106,1,23,256,256),(778,0,80,14,1,23,256,256),(779,0,80,136,1,23,256,256),(780,0,15,14,1,23,256,256),(781,0,15,136,1,23,256,256),(782,1,9,136,0,23,256,257),(783,0,5,10,1,23,256,256),(784,2,9,15,1,23,256,256),(785,2,5,8,1,23,256,256),(786,0,15,133,1,23,256,256),(787,0,93,133,1,23,257,257),(788,0,80,15,1,23,257,257),(789,2,15,5,1,23,257,257),(790,0,9,15,1,23,257,257),(791,0,9,14,1,23,257,257),(792,2,9,106,1,23,257,257),(793,2,80,106,1,23,257,257),(794,2,9,133,1,23,257,257),(795,2,80,133,1,23,257,257),(796,2,80,15,1,23,258,260),(797,0,80,136,1,23,258,258),(798,0,15,136,1,23,258,258),(799,0,80,19,1,23,259,259),(800,0,80,105,1,23,259,259),(801,0,80,89,1,23,259,259),(802,2,125,80,1,23,259,259),(803,0,9,15,1,23,260,260),(804,0,15,14,1,23,260,260),(805,2,14,80,1,23,260,261),(806,0,9,14,1,23,260,261),(807,0,80,106,1,23,260,260),(808,0,9,105,1,23,260,260),(809,2,14,15,1,23,260,261),(810,2,9,5,1,23,260,260),(811,0,80,15,1,23,261,261),(812,0,123,80,1,23,261,261),(813,2,81,106,1,23,261,261),(814,0,81,80,1,23,261,261),(815,2,81,125,1,23,261,261),(816,0,125,9,1,23,261,261),(817,2,9,5,1,23,262,262),(818,2,8,5,1,23,262,262),(819,0,8,105,0,23,262,262),(820,0,8,81,1,23,262,262),(821,2,125,130,1,23,262,262),(822,2,125,80,1,23,262,262),(823,2,80,130,1,23,262,262),(824,0,80,9,1,23,262,262),(825,0,130,9,1,23,262,262),(826,2,125,105,1,23,262,262),(827,0,125,81,1,23,262,262),(828,2,125,123,1,23,262,262),(829,2,123,80,1,23,262,266),(830,1,123,141,0,23,262,262),(831,0,80,141,1,23,262,262),(832,2,9,125,1,23,262,262),(833,2,125,80,1,23,262,262),(834,0,123,105,1,23,262,263),(835,0,123,15,1,23,262,263),(836,0,80,15,1,23,262,263),(837,0,123,14,1,23,263,264),(838,1,123,136,1,23,263,263),(839,0,80,14,1,23,264,264),(840,0,80,136,1,23,264,264),(841,0,80,106,1,23,264,264),(842,2,80,15,1,23,264,264),(843,2,123,15,1,23,264,264),(844,0,9,80,1,23,264,264),(845,0,123,15,1,23,265,266),(846,0,80,15,1,23,265,265),(847,2,8,5,1,23,265,265),(848,0,8,6,1,23,265,265),(849,2,121,5,1,23,265,265),(850,2,5,6,1,23,265,266),(851,2,81,5,1,23,265,265),(852,0,6,123,0,23,265,266),(853,0,6,80,0,23,265,265),(854,0,6,14,0,23,266,266),(855,0,6,15,0,23,266,266),(856,0,6,105,1,23,266,266),(857,0,123,14,1,23,266,266),(858,0,6,80,1,23,266,266),(859,0,123,105,1,23,266,266),(860,2,9,15,1,23,266,266),(861,2,9,14,1,23,266,266),(862,0,6,9,1,23,266,266),(863,2,5,55,1,23,266,266),(864,0,55,9,1,23,266,266),(865,2,93,6,1,23,266,266),(866,2,93,6,1,24,267,269),(867,0,9,93,1,24,267,267),(868,0,7,42,1,24,267,267),(869,2,5,6,1,24,267,269),(870,2,93,5,1,24,267,269),(871,0,93,108,1,24,268,268),(872,0,93,9,1,24,269,269),(873,0,5,123,1,24,269,269),(874,0,121,6,1,24,269,269),(875,0,123,130,1,24,270,270),(876,2,9,105,1,24,270,275),(877,0,9,80,1,24,270,270),(878,2,5,8,1,24,270,270),(879,0,8,9,1,24,270,270),(880,2,9,125,1,24,270,270),(881,0,5,8,1,24,271,271),(882,0,9,123,1,24,271,271),(883,0,9,80,1,24,271,273),(884,0,9,14,1,24,271,273),(885,0,9,15,1,24,271,273),(886,0,123,80,1,24,271,271),(887,0,123,15,1,24,271,271),(888,0,15,80,1,24,271,273),(889,0,14,15,1,24,272,272),(890,0,9,19,1,24,272,272),(891,0,80,14,1,24,273,273),(892,0,9,123,1,24,273,273),(893,0,14,123,1,24,273,273),(894,0,15,123,1,24,273,273),(895,0,11,123,1,24,273,273),(896,0,9,11,1,24,273,273),(897,0,14,105,1,24,273,273),(898,0,15,105,1,24,273,273),(899,0,11,105,1,24,273,273),(900,2,142,9,0,24,273,274),(901,2,143,9,0,24,274,274),(902,2,144,9,0,24,274,274),(903,1,9,145,0,24,274,274),(904,1,9,146,0,24,274,274),(905,0,145,146,1,24,274,274),(906,1,9,147,0,24,274,274),(907,1,9,148,0,24,274,274),(908,0,9,80,1,24,275,275),(909,1,9,139,1,24,275,275),(910,1,9,140,1,24,275,275),(911,0,80,139,1,24,275,275),(912,0,80,140,1,24,275,275),(913,0,139,140,1,24,275,275),(914,0,9,19,1,24,275,275),(915,2,5,8,1,24,275,275),(916,2,9,8,0,24,275,275),(917,0,8,19,1,24,275,275),(918,0,8,80,1,24,275,275),(919,2,6,8,1,24,275,275),(920,0,6,24,1,24,275,275),(921,0,8,24,1,24,275,275);
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

-- Dump completed on 2025-03-28  1:30:05
