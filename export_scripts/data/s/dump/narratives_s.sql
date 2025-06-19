-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: persimmon.hcmc.uvic.ca    Database: narratives_s
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (0,'[NULL]'),(3,'Laura Mitkowski'),(4,'Cory Mitkowski'),(5,'Hina Hassani'),(6,'Jessica (Laura\'s Mom)'),(7,'Clara Jane Donohue'),(8,'Mrs. Kamal'),(9,'Mr. Kamal'),(10,'Sylvie Beaudoin'),(11,'Marie Beaudoin'),(12,'Johnny Beaudoin'),(13,'Mrs. Abdul'),(14,'Walk-in clinic receptionist (19)'),(15,'\"a shirtless man\" (20)'),(16,'The doctor (20)'),(17,'Parker'),(18,'Parker\'s mom'),(19,'\"grade three classmates\" (24)'),(20,'Mrs. Falls'),(21,'Mrs. Rhodes'),(22,'\"Indian kids\" (26)'),(23,'Children\'s Aid (25)'),(24,'Mr. George'),(25,'Slutty Christy'),(26,'Michelle'),(27,'Jonathon Beaudoin'),(28,'Bing/Bernard Espiritu'),(29,'Edna Espiritu'),(30,'\"the white lady\" (35)'),(31,'Mrs. Finnegan'),(32,'Vietnamese ladies'),(33,'\"her mother in law\" (36)'),(34,'White people'),(35,'Jesus'),(36,'Saints'),(37,'God'),(38,'Bing\'s Dad'),(39,'Tita Mae'),(40,'Cory\'s boss'),(41,'Geraldine McDonough'),(42,'Ontario Reads facilitators'),(43,'Lily Chan'),(44,'Aiden Chan'),(45,'Jennifer Chan'),(46,'Finnegan Everson'),(47,'Helen Mckay'),(48,'Sebastian Dennis'),(49,'Liam Williams'),(50,'Amina Mohammed'),(51,'Waleed Mohammed'),(52,'\"one elderly woman\" (32)'),(53,'Chloe Smith'),(56,'\"older kids\" (33)'),(57,'parents in the community'),(58,'\"an elderly Asian woman\" (41) / The bowling alley '),(59,'The police'),(60,'Mrs. Khan'),(61,'Mrs. Crosby'),(62,'Mrs Landau'),(63,'\"the boys\" (Cory\'s friends) (49)'),(64,'Fern Donahue'),(65,'Paulo Sanchez'),(66,'Kyle Keegan'),(67,'Pamela Roy'),(68,'Evan Roy'),(69,'Yanna Roy'),(70,'Tasha Roy'),(71,'Jane Fulton'),(72,'Oprah Winfrey'),(73,'marketing and development officer of Ontario Reads'),(75,'\"hungry people\" (57)'),(76,'children in the community');
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
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menExs`
--

LOCK TABLES `menExs` WRITE;
/*!40000 ALTER TABLE `menExs` DISABLE KEYS */;
INSERT INTO `menExs` VALUES (3,2,6,3,2,1,9,11),(4,0,6,4,2,1,9,9),(5,0,3,4,2,1,9,11),(6,0,3,8,2,1,11,11),(7,0,6,8,2,1,11,11),(8,0,3,9,2,1,11,11),(9,2,8,9,2,1,11,11),(10,0,6,9,2,1,11,11),(11,2,11,10,4,1,19,21),(12,0,10,13,4,1,19,19),(13,0,11,13,4,1,19,19),(14,0,10,12,4,1,19,19),(15,0,11,12,4,1,19,19),(16,2,14,11,4,1,19,20),(17,0,14,12,4,1,19,19),(18,2,15,14,4,1,20,20),(19,1,15,16,4,1,20,20),(20,0,14,16,4,1,20,20),(21,0,10,15,4,1,20,20),(22,0,10,14,4,1,19,20),(23,0,11,15,4,1,20,20),(24,2,18,17,4,1,21,21),(25,0,10,17,4,0,21,21),(26,0,10,18,4,0,21,21),(27,0,11,17,4,0,21,21),(28,0,11,18,4,0,21,21),(29,2,11,16,4,1,22,24),(30,0,16,12,4,1,22,24),(31,2,14,16,4,1,22,23),(32,0,16,15,4,1,22,23),(33,0,10,15,4,0,22,23),(34,0,11,15,4,0,22,23),(35,0,10,14,4,1,22,23),(36,0,11,14,4,1,22,23),(37,0,10,12,4,1,22,24),(38,0,11,12,4,1,22,24),(39,0,10,19,4,1,24,24),(40,0,10,20,4,1,24,24),(41,2,10,11,4,1,25,25),(42,0,10,13,4,1,25,26),(43,0,11,13,4,1,25,25),(44,0,10,21,4,1,25,26),(45,0,10,23,4,0,25,25),(46,0,10,22,4,1,25,25),(47,0,10,11,4,1,26,30),(48,0,10,19,4,1,26,26),(49,0,10,12,4,1,26,26),(50,0,10,24,4,1,26,27),(51,0,11,24,4,1,26,26),(52,2,11,24,4,1,27,27),(53,0,10,12,4,1,27,27),(54,0,10,26,4,1,27,30),(55,0,10,27,4,1,27,30),(56,2,26,27,4,1,27,29),(57,2,26,11,4,1,27,30),(58,0,26,13,4,1,29,29),(59,0,11,13,4,1,29,29),(60,0,10,13,4,1,29,29),(61,2,11,27,4,1,30,30),(62,0,10,24,4,1,30,30),(64,0,10,12,4,1,30,30),(65,2,29,28,6,1,35,40),(66,0,28,31,6,1,35,36),(67,0,28,32,6,0,35,35),(68,0,29,32,6,1,35,35),(69,0,29,30,6,1,35,35),(70,0,29,30,6,1,35,36),(71,2,29,30,6,1,36,36),(72,0,30,33,6,1,36,36),(73,1,28,33,6,0,36,36),(74,1,29,33,6,0,36,36),(75,0,29,34,6,1,36,36),(76,0,28,34,6,1,36,36),(77,1,29,31,6,0,36,36),(78,0,28,35,6,0,37,37),(79,1,28,36,6,0,37,37),(80,0,29,35,6,1,37,37),(81,1,29,36,6,0,37,37),(82,2,29,37,6,1,37,37),(83,0,28,37,6,1,37,37),(84,0,28,38,6,1,39,40),(85,0,29,38,6,1,39,40),(86,0,39,38,6,1,39,39),(87,2,39,28,6,1,39,40),(88,2,39,29,6,1,39,40),(89,2,41,5,8,1,13,15),(90,0,41,42,8,1,14,14),(91,1,5,42,8,0,14,14),(92,0,5,29,5,1,31,31),(93,0,5,28,5,1,31,31),(94,0,5,11,5,1,31,31),(95,0,5,10,5,1,31,31),(96,0,5,12,5,1,31,33),(97,0,5,51,5,1,31,32),(98,0,5,11,5,1,33,33),(99,0,5,28,5,1,33,33),(100,0,5,44,5,1,31,31),(101,0,5,43,5,1,31,31),(102,0,5,47,5,1,31,31),(103,0,5,45,5,1,31,31),(104,0,5,46,5,1,31,31),(105,0,5,48,5,1,31,31),(106,0,5,53,5,1,31,31),(107,0,5,49,5,1,31,31),(108,0,5,50,5,1,31,31),(109,0,5,52,5,1,32,32),(110,0,5,47,5,1,33,33),(112,0,5,57,5,1,32,32),(113,0,4,40,7,1,41,41),(114,2,6,4,7,1,41,41),(115,0,6,3,7,1,41,41),(116,0,4,3,7,1,41,41),(117,2,4,58,7,1,41,42),(118,0,58,6,7,1,41,42),(119,0,58,3,7,1,41,42),(120,2,4,3,7,1,42,42),(121,0,4,6,7,1,42,42),(122,0,3,6,7,1,42,42),(123,1,4,59,7,0,42,42),(124,0,4,28,7,1,43,43),(125,0,4,60,7,1,43,43),(126,0,4,29,7,1,43,43),(127,0,4,40,7,1,44,44),(128,2,4,4,7,1,44,46),(129,2,4,3,7,1,45,45),(130,0,4,28,7,1,45,45),(131,0,4,29,7,1,45,45),(132,0,3,28,7,1,45,45),(133,0,3,29,7,1,45,45),(134,2,3,61,7,1,45,47),(135,0,4,6,7,1,46,46),(136,0,4,3,7,1,43,44),(137,0,4,3,7,1,46,49),(138,1,4,62,7,0,47,47),(139,0,4,5,7,1,47,48),(140,2,5,3,7,1,48,48),(141,0,5,3,7,1,49,49),(142,2,5,4,7,1,49,49),(143,0,4,63,7,1,49,49),(144,0,61,3,7,1,45,47),(145,0,5,4,9,1,50,50),(146,0,5,3,9,1,50,50),(147,0,5,29,9,1,50,50),(148,0,5,28,9,1,50,52),(149,0,5,47,9,1,50,50),(150,0,5,46,9,1,50,50),(151,0,5,49,9,1,50,50),(152,0,5,48,9,1,50,50),(153,0,5,53,9,1,50,50),(154,0,5,50,9,1,50,50),(155,0,5,64,9,1,50,50),(156,0,5,65,9,1,50,50),(157,0,5,66,9,1,50,50),(158,0,5,10,9,1,50,51),(159,0,5,12,9,1,50,50),(160,0,5,68,9,1,50,50),(161,0,5,69,9,1,50,50),(162,0,5,70,9,1,50,50),(163,0,5,44,9,1,50,50),(164,0,5,45,9,1,50,50),(165,0,5,51,9,1,50,50),(166,0,5,11,9,1,50,50),(167,0,5,67,9,1,50,50),(168,0,5,43,9,1,50,50),(169,0,5,31,9,1,52,52),(170,0,28,31,9,1,52,52),(171,0,5,4,9,1,52,52),(172,0,5,3,5,1,52,52),(173,2,71,5,10,1,54,55),(174,2,5,71,9,1,50,53),(175,2,5,71,5,1,31,34),(176,0,71,73,10,1,54,54),(177,1,5,73,10,1,54,54),(178,2,5,71,11,1,55,56),(179,1,71,72,10,0,55,55),(180,1,5,72,10,0,55,55),(181,1,5,42,11,1,55,55),(182,0,71,42,11,1,55,55),(183,0,41,57,8,0,13,14),(184,0,41,76,8,0,13,14),(185,1,5,76,8,0,13,14),(186,1,5,57,8,0,13,14),(187,0,5,76,5,0,31,33),(188,0,5,57,5,1,31,33),(189,0,5,76,9,0,50,51),(190,0,5,57,9,0,50,51),(191,0,5,57,10,0,54,55),(192,0,71,57,10,0,54,55),(193,0,71,76,10,0,54,55),(194,0,5,76,10,0,54,55),(195,0,5,57,11,0,55,56),(196,0,5,76,11,0,55,56),(197,0,71,76,4,0,55,56),(198,0,71,57,11,0,55,56),(199,2,71,5,12,1,56,57),(200,0,71,57,12,0,57,57),(201,0,5,57,12,0,57,57),(202,1,5,75,12,0,57,57),(203,1,71,75,12,0,57,57),(204,1,71,72,12,0,57,57),(205,1,5,72,12,0,57,57);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narrContainers`
--

LOCK TABLES `narrContainers` WRITE;
/*!40000 ALTER TABLE `narrContainers` DISABLE KEYS */;
INSERT INTO `narrContainers` VALUES (2,'Laura I',0,9,11,3,3,0),(3,'Fall',0,16,99,0,0,0),(4,'Sylvie',1,19,30,10,10,0),(5,'Daily Report: September 14, 2011',1,31,34,5,0,2),(6,'Bing',1,35,40,28,28,0),(7,'Cory',1,41,49,0,4,0),(8,'June 6, 2011',0,13,15,41,0,2),(9,'Daily Report: September 22, 2011',1,50,53,5,0,2),(10,'Jane Fulton <jfulton@ontarioreads.ca> September 22, 2011, 1:15 a.m.',1,54,55,71,0,2),(11,'Me <hhassani@ontarioreads.ca> September 22, 2011, 11:50 a.m.',0,55,56,5,0,2),(12,'Jane Fulton <jfulton@ontarioreads.ca> September 22, 2011, 2:30 p.m.',1,56,57,71,0,2);
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

-- Dump completed on 2025-06-19  1:30:06
