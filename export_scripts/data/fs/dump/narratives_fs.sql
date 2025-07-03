-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: persimmon.hcmc.uvic.ca    Database: narratives_fs
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (0,'[NULL]'),(1,'Hoa'),(2,'Essun'),(3,'Uche'),(4,'The Fulcrum'),(5,'The Emperor'),(6,'The Emperor\'s daughter'),(7,'Alabaster'),(8,'Antimony'),(9,'\"group of young women\"'),(10,'Nassun'),(11,'Jija'),(12,'Tirimo\'s scouts'),(13,'Rask'),(14,'Yumenescenes'),(15,'Lerna'),(16,'Tirimo\'s citizens'),(17,'Tirimo\'s children'),(18,'Tirimo\'s butcher'),(19,'Tirimo\'s baker'),(20,'Makenba'),(21,'Refugees'),(22,'Eran'),(23,'Damaya'),(24,'Muh Dear'),(25,'Damaya\'s mother'),(26,'Schaffa'),(27,'Damaya\'s father'),(28,'Chaga'),(29,'Palela\'s headman'),(30,'Children (in Damaya\'s creche)'),(31,'Damaya\'s cousin'),(32,'Zab'),(33,'Neighbours (in Palela)'),(34,'Schaffa\'s other orogenes'),(35,'Limi'),(36,'Shantare'),(37,'Teachers (from Damaya\'s creche)'),(38,'Muh Dear\'s friends'),(39,'Tirimo\'s guards'),(40,'Oyamar'),(41,'Rask\'s sister'),(42,'Sume\'s citizens'),(43,'Rask\'s father'),(44,'Rask\'s mother'),(45,'Karra'),(46,'Karra\'s children'),(47,'Father (in Tirimo)'),(48,'Little boy (in Tirimo)'),(49,'Syenite'),(50,'Feldspar'),(51,'Allia\'s quartent governor'),(52,'\"fellow juniors\" (in the Fulcrum)'),(53,'\"handful of grits\" (in the Fulcrum)'),(54,'Guardians (at the Fulcrum)'),(55,'\"young junior\" (singing in the Fulcrum)'),(56,'\"audience\" (on the young junior)'),(57,'Syenite\'s roommates');
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
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menExs`
--

LOCK TABLES `menExs` WRITE;
/*!40000 ALTER TABLE `menExs` DISABLE KEYS */;
INSERT INTO `menExs` VALUES (1,0,2,3,1,1,1,1),(2,0,4,5,1,1,3,3),(3,0,4,6,1,1,3,3),(4,0,5,6,1,1,3,3),(5,2,9,9,1,1,4,4),(6,2,9,7,1,1,4,4),(7,2,7,8,1,1,4,6),(8,0,7,4,1,1,6,6),(9,0,2,3,1,1,9,10),(10,0,2,10,1,1,10,10),(11,0,10,3,1,1,10,10),(12,0,11,3,1,1,10,10),(13,0,12,12,1,1,11,12),(14,2,13,12,1,1,11,11),(15,0,7,14,1,1,4,4),(16,0,7,14,1,1,6,7),(17,0,2,3,2,1,15,24),(18,0,2,10,2,1,15,16),(19,0,3,10,2,1,15,16),(20,0,2,15,2,1,15,15),(21,0,2,16,2,1,15,15),(22,0,2,17,2,1,15,15),(23,0,2,18,2,1,15,15),(24,0,2,19,2,1,15,15),(25,0,19,11,2,1,15,15),(26,0,2,11,2,1,15,16),(27,0,2,15,2,1,16,16),(28,2,15,2,2,1,17,24),(29,0,15,20,2,1,17,17),(30,0,2,20,2,1,17,17),(31,0,15,3,2,1,17,17),(32,2,15,16,2,1,18,18),(33,2,16,2,2,0,18,18),(34,0,2,11,2,1,19,19),(35,0,11,3,2,1,19,19),(36,1,15,21,2,1,19,19),(37,0,2,10,2,1,20,22),(38,0,10,3,2,1,20,20),(39,0,15,13,2,1,20,20),(40,0,13,16,2,1,20,20),(41,0,13,12,2,1,20,20),(42,0,15,16,2,1,20,20),(43,0,15,12,2,1,20,20),(44,0,2,11,2,1,21,24),(45,0,15,3,2,1,21,21),(46,0,15,11,2,1,21,21),(47,0,11,3,2,1,21,24),(48,0,11,10,2,1,22,22),(49,0,3,10,2,1,22,22),(50,0,15,3,2,1,23,23),(51,0,2,13,2,1,23,23),(52,0,15,13,2,1,23,23),(53,0,15,22,2,1,23,23),(54,0,13,22,2,1,23,23),(55,0,2,22,2,1,23,23),(56,0,15,16,2,1,23,23),(57,0,2,7,2,1,24,24),(58,2,2,2,2,1,24,24),(59,0,2,10,2,1,24,24),(60,0,11,10,2,1,24,24),(61,0,2,16,2,1,24,24),(62,0,23,24,3,1,25,25),(63,2,25,26,3,1,25,29),(64,0,23,25,3,1,25,25),(65,1,23,26,3,1,25,25),(66,2,25,23,3,1,26,26),(67,0,25,27,3,1,26,26),(68,1,26,23,3,1,26,27),(69,0,23,27,3,1,26,26),(70,0,23,28,3,1,26,26),(71,0,23,29,3,1,26,26),(72,0,23,30,3,1,26,26),(73,0,23,25,3,1,27,27),(74,2,23,25,3,1,28,28),(75,2,23,26,3,1,28,41),(76,2,23,28,3,1,28,28),(77,0,23,27,3,1,28,29),(78,0,28,27,3,1,28,28),(79,0,23,25,3,1,28,30),(80,0,26,25,3,1,30,30),(81,2,26,25,3,1,31,33),(82,0,25,31,3,1,31,31),(83,0,23,31,3,1,31,31),(84,2,23,25,3,1,31,32),(85,0,23,27,3,1,31,31),(86,0,27,25,3,1,31,31),(87,0,26,29,3,1,32,32),(88,0,25,29,3,1,32,32),(89,0,25,32,3,1,32,32),(90,0,23,32,3,1,32,32),(91,0,25,27,3,1,32,33),(92,0,25,28,3,1,32,32),(93,0,27,28,3,1,32,32),(94,0,23,28,3,1,32,32),(95,0,25,33,3,1,32,32),(96,0,23,25,3,1,33,33),(97,0,23,27,3,1,33,33),(98,0,23,24,3,1,33,33),(99,0,26,4,3,1,34,34),(100,0,26,34,3,1,34,35),(101,1,23,34,3,1,35,35),(102,0,26,25,3,1,35,35),(103,0,26,27,3,1,35,35),(104,0,25,27,3,1,35,36),(105,0,25,29,3,1,35,35),(106,0,27,29,3,1,35,35),(107,0,26,29,3,1,25,25),(108,0,23,25,3,1,36,35),(109,0,23,27,3,1,35,36),(110,0,23,28,3,1,35,35),(111,0,27,28,3,1,35,36),(112,0,25,28,3,1,36,36),(113,0,26,28,3,1,36,36),(114,0,23,35,3,1,37,37),(115,2,23,36,3,1,37,37),(116,0,35,36,3,1,37,37),(117,0,23,30,3,1,37,37),(118,0,30,30,3,1,37,37),(119,2,32,23,3,1,37,37),(120,0,32,35,3,1,37,37),(121,0,32,36,3,1,37,37),(122,0,23,25,3,1,38,40),(123,0,23,32,3,1,38,38),(124,0,23,27,3,1,38,40),(125,0,23,28,3,1,38,38),(126,0,25,27,3,1,38,40),(127,0,25,28,3,1,38,38),(128,0,27,28,3,1,38,38),(129,0,26,25,3,1,39,39),(130,2,27,26,3,1,39,40),(131,0,23,37,3,1,40,40),(132,0,23,30,3,1,40,40),(133,0,23,24,3,1,40,40),(134,0,23,38,3,1,40,40),(135,0,24,38,3,1,40,40),(136,0,23,28,3,1,40,40),(137,0,2,3,4,1,42,44),(138,0,2,10,4,1,42,43),(139,0,2,11,4,1,42,45),(140,0,10,11,4,1,42,43),(141,0,2,16,4,1,42,43),(142,0,2,13,4,1,43,45),(143,0,11,3,4,1,43,43),(144,0,10,3,4,1,43,43),(145,0,2,15,4,1,43,44),(146,0,2,39,4,1,46,46),(147,0,2,16,4,1,46,47),(148,0,2,11,4,1,47,51),(149,0,2,3,4,1,47,48),(150,0,16,3,4,1,47,47),(151,0,16,11,4,1,47,47),(152,0,11,3,4,1,47,48),(153,0,2,13,4,1,47,48),(154,0,2,40,4,1,47,48),(155,0,13,40,4,1,47,48),(156,2,2,15,4,1,48,50),(157,0,15,13,4,1,48,48),(158,0,13,11,4,1,48,51),(159,0,13,3,4,1,48,49),(160,2,2,13,4,1,49,57),(161,2,13,15,4,1,49,50),(162,0,13,10,4,1,50,50),(163,0,11,10,4,1,50,50),(164,0,2,10,4,1,50,50),(165,0,15,3,4,1,50,50),(166,0,2,15,4,1,51,51),(167,0,13,41,4,1,51,52),(168,1,2,41,4,1,51,52),(169,0,13,42,4,1,51,52),(170,0,42,41,4,1,51,52),(171,0,13,43,4,1,51,51),(172,0,13,44,4,1,51,51),(173,0,43,44,4,1,51,51),(174,0,43,41,4,1,51,51),(175,0,44,41,4,1,51,51),(176,0,2,42,4,1,52,52),(177,0,2,16,4,1,52,52),(178,0,13,16,4,1,52,52),(179,2,16,16,4,1,52,52),(180,2,13,39,4,1,52,53),(181,0,2,39,4,1,52,56),(182,0,2,45,4,1,53,55),(183,0,2,46,4,1,53,53),(184,0,45,46,4,1,53,53),(185,2,13,45,4,1,53,54),(186,0,2,11,4,1,54,54),(187,0,45,39,4,1,54,54),(188,0,13,11,4,1,54,54),(189,0,2,3,4,1,54,54),(190,0,2,11,4,1,54,54),(191,0,2,10,4,1,54,54),(192,0,11,10,4,1,54,54),(193,0,13,39,4,1,55,55),(194,2,45,39,4,1,55,56),(195,2,2,45,4,1,56,56),(196,2,13,45,4,1,56,56),(197,0,2,3,4,1,57,60),(198,0,2,11,4,1,57,59),(199,0,11,3,4,1,57,59),(200,0,2,16,4,1,57,59),(201,0,2,13,4,1,58,60),(202,0,2,45,4,1,58,60),(203,2,45,39,4,1,58,58),(204,0,2,47,4,1,59,59),(205,0,2,48,4,1,59,59),(206,0,47,48,4,1,59,59),(207,2,49,50,5,1,61,65),(208,0,49,7,5,1,62,64),(209,0,50,7,5,1,62,64),(210,2,50,51,5,1,62,62),(211,1,49,51,5,1,62,62),(212,0,49,52,5,1,65,65),(213,0,49,53,5,1,65,65),(214,0,49,54,5,1,65,66),(215,2,55,56,5,1,65,66),(216,0,54,55,5,1,65,66),(217,0,54,56,5,1,65,66),(218,0,49,55,5,1,65,66),(219,0,49,56,5,1,65,66),(220,0,49,57,5,1,66,66),(221,0,49,50,5,1,66,66),(222,2,49,7,5,1,67,68);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narrContainers`
--

LOCK TABLES `narrContainers` WRITE;
/*!40000 ALTER TABLE `narrContainers` DISABLE KEYS */;
INSERT INTO `narrContainers` VALUES (1,'Prologue: you are here',0,1,14,0,0,0),(2,'1: you, at the end',0,15,24,1,2,0),(3,'2: Damaya, in winters past',0,25,41,0,0,0),(4,'3: you\'re on your way',0,42,60,1,2,0),(5,'4: Syenite, cut and polished',0,61,76,0,0,0),(6,'5: you\'re not alone',0,77,83,1,2,0),(7,'6: Damaya, grinding to a halt',0,84,104,0,0,0),(8,'7: you plus one is two',0,105,115,1,2,0),(9,'8: Syenite on the highroad',0,116,149,0,0,0),(10,'Interlude',0,150,151,0,0,0),(11,'9: Syenite among the enemy',0,152,171,0,0,0),(12,'10: you walk beside the beast',0,172,190,1,2,0),(13,'11: Damaya at the fulcrum of it all',0,191,211,0,0,0),(14,'12: Syenite finds a new toy',0,212,231,0,0,0),(15,'13: you\'re on the trail',0,232,243,1,2,0),(16,'14: Syenite breaks her toys',0,244,263,0,0,0),(17,'15: you\'re among friends',0,264,276,1,2,0),(18,'16: Syen in the hidden land',0,277,296,0,0,0),(19,'17: Damaya, in finality',0,297,331,0,0,0),(20,'18: you discover wonders down below',0,332,343,1,2,0),(21,'19: Syenite on the lookout',0,344,360,0,0,0),(22,'Interlude (361)',0,361,361,1,2,0),(23,'20: Syenite, stretched and snapped back',0,362,387,0,0,0),(24,'21: you\'re getting the band back together',0,388,412,1,2,0),(25,'22: Syenite, fractured',0,413,443,0,0,0),(26,'23: you\'re all you need',0,444,449,1,2,0);
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

-- Dump completed on 2025-07-03  1:30:05
