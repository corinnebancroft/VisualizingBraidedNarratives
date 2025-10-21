-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: persimmon.hcmc.uvic.ca    Database: narratives_hp
-- ------------------------------------------------------
-- Server version	8.0.43

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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (0,'[NULL]'),(1,'Harry Potter'),(4,'Dudley Dursley'),(5,'Petunia Dursley'),(6,'Vernon Dursley'),(7,'Quirrel'),(8,'Severus Snape'),(9,'Hermione Granger'),(10,'Albus Dumbledore'),(11,'Voldemort'),(12,''),(13,'Nicolas Flamel'),(14,'Perenelle Flamel'),(15,'Ronald Weasley'),(17,'Draco Malfoy'),(18,'Percy Weasley'),(19,'Professor McGonagall'),(20,'Neville Longbottom'),(21,'Goyle'),(22,'Fred Weasley'),(23,'Ginny Weasley'),(24,'Molly Weasley'),(25,'Lily Potter'),(26,'James Potter'),(27,'Neighbours (of the Dursleys)'),(28,'cat'),(29,'People in cloaks'),(30,'Fuffy'),(31,'Professor Flitwick'),(32,'man in emerald green cloak'),(33,'five different people'),(34,'Tiny old man'),(35,'Bird Watchers'),(36,'Owls'),(37,'Jim McGuffin'),(38,'Viewers'),(39,'Professor Binns'),(40,'Students in Professor Binns class'),(41,'The Weasley Twins'),(42,'Lee Jordan'),(43,'The Golden Trio'),(44,'Bane'),(45,'Firenze'),(46,'The Fat Lady'),(49,'Argus Filtch'),(50,'Trevor'),(51,'Peeves'),(52,'Mrs. Norris'),(53,'The Bloody Baron'),(54,'Hedwig'),(55,'Norbert'),(56,'Professor Sprout'),(57,'The Muggles'),(58,'Dedalus Diggle'),(59,'Madam Pomfrey'),(60,'People in the Wizarding World'),(62,'People Voldemort has killed'),(63,'Sirius Black'),(64,'Rubeus Hagrid'),(65,'Mrs. Figg'),(66,'Piers Polkiss'),(67,'Harry\'s Headmistress'),(68,'Man with violet top hat'),(69,'Woman dressed in all green'),(70,'Bald man in a purple coat'),(71,'Dennis'),(72,'Malcolm'),(73,'Gordon'),(74,'George Weasley'),(75,'Hogwarts Students'),(76,'Vernon Dursley\'s Secretary'),(77,'Mrs Next Door'),(78,'Mrs Next Door\'s Daughter'),(79,'Ted (News Reader)'),(80,'Bird Experts'),(81,'Tibbies'),(82,'Snowy'),(83,'Mr Paws'),(84,'Tufty'),(85,'Aunt Marge'),(86,'Yvonne'),(87,'Piers Polkiss\' Mother'),(89,'Vernon\'s coworkers'),(90,'the council (24)'),(91,'Motorcyclists'),(92,'Ice Cream Lady'),(93,'Boa Constrictor'),(94,'Reptile House Keeper'),(95,'Zoo Director');
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
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menExs`
--

LOCK TABLES `menExs` WRITE;
/*!40000 ALTER TABLE `menExs` DISABLE KEYS */;
INSERT INTO `menExs` VALUES (1,0,1,4,2,0,107,107),(4,2,6,5,1,1,8,8),(5,2,5,4,1,1,7,8),(6,2,6,4,1,1,8,8),(7,0,5,25,1,1,7,7),(8,0,25,26,1,1,7,7),(9,0,1,25,1,1,7,7),(10,0,1,26,1,1,7,7),(11,0,5,27,1,1,7,7),(12,1,1,11,9,1,191,191),(13,0,6,19,1,1,8,8),(14,0,1,30,9,1,191,191),(15,0,6,29,1,0,8,9),(16,2,29,29,1,1,8,9),(17,0,1,31,9,1,191,191),(18,0,6,32,1,0,8,8),(19,0,1,19,9,1,191,191),(20,2,6,33,1,0,9,9),(21,0,1,20,9,1,191,191),(22,0,1,9,9,1,191,191),(23,0,1,15,9,1,191,191),(24,0,9,15,9,1,191,191),(25,1,29,25,1,0,9,9),(26,1,29,26,1,0,9,9),(27,1,29,1,1,0,9,9),(28,1,9,11,9,1,191,191),(29,1,15,11,9,1,191,191),(30,2,6,34,1,1,9,10),(31,0,1,8,9,1,191,191),(32,0,9,8,9,1,191,191),(33,1,34,11,1,0,10,10),(34,1,15,11,9,1,191,191),(35,2,6,19,1,1,10,10),(36,1,35,36,1,0,9,11),(37,2,37,38,1,1,10,11),(38,2,10,19,1,1,12,17),(39,2,9,1,9,1,192,193),(40,0,1,42,9,1,192,192),(41,0,1,41,9,1,192,192),(42,2,39,40,9,1,192,192),(43,2,15,1,9,1,192,192),(44,0,9,12,9,1,192,192),(45,0,1,12,9,1,192,192),(46,0,8,30,9,1,192,192),(47,0,8,30,9,1,192,192),(48,0,15,64,9,1,192,192),(49,0,1,64,9,1,192,192),(50,0,64,10,9,1,192,192),(51,0,1,10,9,1,192,192),(52,2,15,1,9,1,193,193),(53,2,1,9,9,1,193,193),(54,2,64,43,9,1,193,193),(55,2,15,64,9,1,193,193),(56,2,1,64,9,1,193,193),(57,0,64,30,9,1,193,193),(58,2,1,64,9,1,194,194),(59,2,64,15,9,1,194,194),(60,2,64,9,9,1,194,194),(61,0,1,10,9,1,194,194),(62,1,1,11,9,1,194,194),(63,0,1,30,9,1,194,194),(64,0,1,8,9,1,194,194),(65,2,19,43,9,1,194,194),(66,0,1,44,9,1,194,194),(67,0,1,45,9,1,194,194),(68,0,19,10,9,1,194,194),(69,2,1,19,9,1,195,195),(70,0,1,10,9,1,195,195),(71,2,8,43,9,1,195,195),(72,2,1,9,9,1,195,195),(73,2,8,1,9,1,195,195),(74,2,1,9,9,1,196,196),(75,2,15,9,9,1,196,196),(76,0,15,31,9,1,196,196),(77,0,1,19,9,1,196,196),(78,2,19,43,9,1,196,196),(79,2,46,1,9,1,196,196),(80,0,46,31,9,1,196,196),(81,0,46,8,9,1,196,196),(82,0,9,8,9,1,196,196),(83,2,1,15,9,1,196,196),(84,2,1,9,9,1,196,196),(85,1,1,11,9,1,196,196),(86,1,1,11,9,1,197,197),(87,0,1,5,9,1,197,197),(88,2,9,1,9,1,197,197),(89,0,1,26,9,1,197,197),(90,2,15,1,9,1,197,197),(91,0,9,31,9,1,197,197),(92,0,1,42,9,1,197,197),(93,2,15,1,9,1,197,197),(94,0,1,64,9,1,197,197),(95,0,1,30,9,1,197,197),(96,0,1,49,9,1,197,197),(97,2,20,43,9,1,197,197),(98,2,1,20,9,1,198,198),(99,2,9,20,9,1,198,198),(100,0,1,8,9,1,198,198),(101,0,1,30,9,1,198,198),(102,0,20,50,9,1,198,198),(103,2,1,9,9,1,199,199),(104,2,1,20,9,1,199,199),(105,0,1,51,9,1,199,199),(106,0,1,49,9,1,199,199),(107,0,1,52,9,1,199,199),(108,2,51,43,9,1,199,199),(109,0,51,49,9,1,199,199),(110,0,1,53,9,1,199,199),(111,0,51,53,9,1,199,199),(112,2,15,1,9,1,200,200),(113,0,1,8,9,1,200,200),(114,0,1,30,9,1,200,200),(115,2,9,1,9,1,200,200),(116,0,15,8,9,1,200,200),(117,0,1,64,9,1,200,200),(118,0,1,30,9,1,200,200),(119,2,15,9,9,1,200,200),(120,2,15,1,9,1,200,200),(121,0,1,9,9,1,201,201),(122,2,1,15,9,1,201,201),(123,0,1,54,9,1,201,201),(124,0,15,54,9,1,201,201),(125,2,1,9,9,1,201,201),(126,0,1,10,9,1,201,201),(127,2,15,9,9,1,201,201),(128,0,15,54,9,1,201,201),(129,2,15,9,9,1,202,202),(130,2,1,9,9,1,202,202),(131,0,9,8,9,1,202,202),(132,0,1,55,9,1,202,202),(133,2,15,1,9,1,202,202),(134,2,15,1,9,1,203,203),(135,2,15,9,9,1,203,203),(136,2,1,9,9,1,203,203),(137,2,1,15,9,1,204,204),(138,2,1,9,9,1,204,204),(139,2,15,9,9,1,204,204),(140,2,1,15,9,1,205,205),(141,2,15,9,9,1,205,205),(142,0,15,8,9,1,205,205),(143,0,1,15,9,1,206,206),(144,0,9,15,9,1,206,206),(145,2,9,1,9,1,206,206),(146,0,9,56,9,1,206,206),(147,0,9,31,9,1,206,206),(148,0,9,19,9,1,206,206),(149,0,9,7,9,1,206,206),(150,0,9,8,9,1,206,206),(151,0,1,8,9,1,206,206),(152,0,9,1,9,1,207,207),(153,2,9,1,9,1,207,207),(154,0,1,15,9,1,207,207),(155,0,1,30,9,1,208,208),(156,0,1,54,9,1,208,208),(157,0,1,10,9,1,208,208),(158,2,9,1,9,1,208,208),(159,1,9,11,9,1,208,208),(160,0,1,8,9,1,208,208),(161,0,1,11,9,1,208,208),(162,2,79,19,1,0,13,13),(163,1,10,57,1,0,13,13),(164,0,10,58,1,1,13,13),(165,0,19,11,1,1,13,14),(167,1,60,11,1,1,14,14),(168,1,60,25,1,0,14,14),(169,2,11,1,1,1,15,15),(170,2,11,62,1,1,15,15),(171,0,10,1,1,0,14,16),(174,2,10,1,1,1,18,18),(175,2,5,1,1,0,18,18),(177,2,6,1,11,1,20,20),(178,2,6,4,11,1,21,22),(179,2,5,4,11,1,19,19),(180,2,5,65,11,1,21,21),(181,2,4,66,11,1,24,24),(182,2,67,6,11,1,23,23),(183,2,4,1,11,1,24,24),(184,2,66,1,11,1,26,26),(185,2,68,1,11,0,27,27),(186,2,69,1,11,1,27,27),(187,2,70,1,11,1,27,27),(188,2,4,65,12,0,28,28),(189,0,9,42,9,1,197,197),(190,0,15,42,9,1,197,197),(191,2,1,7,9,1,209,209),(192,2,9,20,9,1,199,199),(193,2,15,20,9,1,199,199),(194,0,9,52,9,1,199,199),(195,0,15,52,9,1,199,199),(196,0,9,30,9,1,200,200),(197,0,15,30,9,1,200,200),(198,0,1,8,10,1,209,209),(199,0,7,8,10,1,209,209),(200,0,7,9,10,1,209,209),(201,0,7,10,10,1,209,209),(202,2,64,4,13,1,39,39),(203,2,7,1,10,1,210,210),(204,0,7,8,10,1,210,210),(205,2,6,64,13,1,40,40),(206,0,7,10,10,1,210,210),(207,0,7,11,10,1,210,210),(208,0,8,26,10,1,210,210),(209,1,7,26,10,0,210,210),(210,2,1,7,10,1,211,211),(211,0,7,11,10,1,211,211),(212,2,7,11,10,1,211,211),(213,0,11,1,10,1,211,211),(214,2,7,1,10,1,212,212),(215,0,1,10,10,1,212,212),(216,2,11,7,10,1,212,212),(217,2,11,1,10,1,212,212),(218,2,11,1,10,1,213,213),(219,0,11,7,10,1,213,213),(220,0,11,26,10,1,213,213),(221,0,11,25,10,1,213,213),(222,2,11,7,10,1,213,213),(223,2,11,1,10,1,214,214),(224,2,64,5,13,1,47,47),(225,0,1,7,10,1,214,214),(226,0,1,11,10,1,214,214),(227,2,10,1,10,1,214,214),(228,0,10,7,10,1,214,214),(229,0,10,59,10,1,214,214),(230,0,10,22,10,1,214,214),(231,1,60,64,13,1,52,52),(232,0,10,74,10,1,214,214),(233,0,10,9,10,1,215,215),(234,0,10,15,10,1,215,215),(235,2,10,1,10,1,215,215),(236,0,10,7,10,1,215,215),(237,1,1,13,10,1,215,215),(238,0,10,13,10,1,215,215),(239,1,1,14,10,1,215,215),(240,0,10,14,10,1,215,215),(241,2,1,10,10,1,216,216),(242,0,1,11,10,1,216,216),(243,0,10,11,10,1,216,216),(244,0,10,7,10,1,216,216),(245,2,1,10,10,1,217,217),(246,0,10,26,10,1,217,217),(247,0,1,7,10,1,217,217),(248,0,1,8,10,1,217,217),(249,0,10,17,10,1,217,217),(250,2,1,59,10,1,218,218),(251,0,1,10,10,1,218,218),(252,0,59,10,10,1,218,218),(253,2,9,1,10,1,218,218),(254,2,15,1,10,1,218,218),(255,0,9,10,10,1,218,218),(256,0,1,7,10,1,218,218),(257,0,15,13,10,1,218,218),(258,2,9,1,10,1,219,219),(259,0,1,10,10,1,219,219),(260,2,15,1,10,1,219,219),(261,0,15,10,10,1,219,219),(262,0,1,11,10,1,219,219),(263,0,1,59,10,1,219,219),(264,0,9,10,10,1,219,219),(265,0,15,59,10,1,219,219),(266,2,59,1,10,1,219,219),(267,2,59,9,10,1,219,219),(268,2,59,15,10,1,219,219),(269,2,1,59,10,1,219,219),(270,0,59,10,10,1,219,219),(271,2,64,1,10,1,219,219),(272,0,64,30,10,1,219,219),(273,0,1,11,10,1,219,219),(274,1,64,11,10,1,219,219),(275,2,1,64,10,1,220,220),(276,0,64,1,10,1,220,220),(277,0,1,26,10,1,220,220),(278,0,1,25,10,1,220,220),(279,0,1,59,10,1,220,220),(280,0,1,10,10,1,220,220),(281,0,1,17,10,1,221,221),(282,2,10,75,10,1,221,221),(283,2,10,15,10,1,221,221),(284,2,18,75,10,1,221,221),(285,0,18,19,10,1,221,221),(286,2,10,9,10,1,221,221),(287,0,1,9,10,1,221,221),(288,2,10,1,10,1,221,221),(289,2,10,20,10,1,221,221),(290,0,1,20,10,1,221,221),(291,0,9,20,10,1,221,221),(292,0,15,20,10,1,221,221),(293,0,1,15,10,1,222,222),(294,0,1,17,10,1,222,222),(295,0,15,17,10,1,222,222),(296,2,10,75,10,1,222,222),(297,0,1,8,10,1,222,222),(298,2,1,19,10,1,222,222),(299,0,1,9,10,1,222,222),(300,0,1,20,10,1,222,222),(301,0,1,21,10,1,222,222),(302,0,1,15,10,1,222,222),(303,2,22,1,10,1,222,222),(304,0,1,64,10,1,222,222),(305,2,15,1,10,1,223,223),(306,0,1,9,10,1,223,223),(307,2,23,24,10,1,223,223),(308,2,24,1,10,1,223,223),(309,2,6,1,10,1,223,223),(310,0,1,5,10,1,223,223),(311,0,4,1,10,1,223,223),(312,2,9,1,10,1,223,223),(313,0,5,26,1,1,7,7),(314,0,6,25,1,1,7,7),(315,0,6,26,1,1,7,7),(316,1,5,1,1,0,7,7),(317,1,6,1,1,0,7,7),(318,0,6,27,1,1,7,7),(319,0,6,4,1,1,7,7),(320,0,29,32,1,1,8,8),(321,2,6,76,1,1,9,9),(322,1,6,1,1,0,9,9),(323,0,6,25,1,1,9,9),(324,0,6,26,1,1,9,9),(325,0,6,5,1,1,9,9),(326,0,5,25,1,1,9,9),(327,1,6,11,1,0,10,10),(328,2,6,5,1,1,10,11),(329,2,5,4,1,1,10,10),(330,2,5,77,1,1,10,10),(331,0,5,78,1,1,10,10),(332,0,77,78,1,1,10,10),(333,1,6,77,1,1,10,10),(334,1,6,78,1,0,10,10),(335,0,6,4,1,1,10,11),(336,2,79,37,1,1,10,11),(337,1,79,35,1,0,10,10),(338,2,79,80,1,1,10,10),(339,0,80,36,1,0,10,10),(340,2,79,38,1,1,10,10),(341,0,6,79,1,0,10,10),(342,0,6,37,1,0,10,11),(343,0,6,36,1,1,10,11),(344,1,6,29,1,0,11,11),(345,0,5,25,1,1,11,12),(346,0,6,25,1,1,11,12),(347,1,5,29,1,0,11,11),(348,0,5,36,1,0,11,11),(349,1,6,1,1,0,11,11),(350,0,5,1,1,0,11,11),(351,0,5,4,1,1,11,11),(352,0,6,19,1,1,11,11),(353,0,6,26,1,1,11,12),(354,0,5,26,1,1,11,12),(355,0,19,57,1,0,13,13),(356,0,19,58,1,1,13,13),(357,0,10,11,1,1,13,14),(358,0,10,59,1,1,14,14),(359,0,19,59,1,1,14,14),(360,1,60,26,1,0,14,14),(361,1,60,1,1,0,14,14),(362,0,19,60,1,1,14,14),(363,0,10,60,1,1,14,14),(364,2,11,25,1,1,14,15),(365,2,11,26,1,1,14,15),(366,0,25,26,1,1,14,17),(367,0,19,25,1,1,14,15),(368,0,19,26,1,1,14,15),(369,0,10,25,1,1,14,15),(370,0,10,26,1,1,14,15),(371,0,25,1,1,1,14,15),(372,0,26,1,1,1,14,15),(373,0,19,1,1,0,14,15),(374,1,19,62,1,0,15,15),(375,1,10,62,1,0,15,15),(376,0,10,64,1,1,15,15),(377,0,19,64,1,1,15,16),(378,0,19,5,1,0,15,15),(379,0,19,6,1,1,15,15),(380,2,10,6,1,1,15,15),(381,2,10,5,1,1,15,15),(382,0,5,6,1,1,15,15),(383,0,19,4,1,0,15,15),(384,1,10,4,1,0,15,15),(385,2,5,4,1,1,15,15),(386,0,6,4,1,1,15,15),(387,0,10,1,1,1,17,17),(388,0,19,1,1,1,16,17),(389,2,19,64,1,1,17,17),(390,2,10,64,1,1,16,17),(391,2,64,63,1,1,16,16),(392,0,10,63,1,1,16,16),(393,0,19,63,1,1,16,16),(394,0,64,57,1,0,16,17),(395,1,10,57,1,0,16,17),(396,1,19,57,1,0,16,17),(397,0,64,1,1,1,16,16),(398,2,64,1,1,1,17,17),(399,0,64,25,1,1,17,17),(400,0,64,26,1,1,17,17),(401,0,10,19,1,1,18,18),(402,2,4,1,1,1,18,18),(403,0,60,1,1,0,18,18),(404,0,1,25,9,1,197,197),(405,2,5,1,11,1,19,20),(406,0,6,1,11,1,19,19),(407,0,5,6,11,1,19,20),(408,0,6,36,11,0,19,19),(409,2,6,4,11,1,19,19),(411,0,1,4,11,1,19,21),(412,0,5,4,11,1,20,20),(413,0,1,25,11,1,20,20),(414,0,1,26,11,1,20,20),(415,0,25,26,11,1,20,20),(416,0,5,25,11,1,20,20),(417,0,5,26,11,1,20,20),(418,2,5,4,11,1,21,22),(419,2,6,5,11,1,21,22),(420,0,6,65,11,1,21,21),(421,0,4,65,11,1,21,21),(422,0,1,65,11,1,21,22),(423,0,65,81,11,1,22,22),(424,0,65,82,11,1,22,22),(425,0,65,83,11,1,22,22),(426,0,65,84,11,1,22,22),(427,0,1,82,11,1,22,22),(428,0,1,81,11,1,22,22),(429,0,1,83,11,1,22,22),(430,0,1,84,11,1,22,22),(431,0,81,82,11,1,22,22),(432,0,81,83,11,1,22,22),(433,0,81,84,11,1,22,22),(434,0,82,83,11,1,22,22),(435,0,82,84,11,1,22,22),(436,0,83,84,11,1,22,22),(437,0,5,85,11,1,22,22),(438,0,6,85,11,1,22,22),(439,0,85,1,11,1,22,22),(440,0,5,86,11,1,22,22),(441,0,6,86,11,1,22,22),(442,0,1,86,11,1,22,22),(443,2,1,5,11,1,22,23),(444,2,1,6,11,1,22,24),(445,2,4,1,11,1,22,23),(446,0,5,66,11,1,22,25),(447,0,6,66,11,1,22,23),(448,0,1,66,11,1,22,23),(449,0,4,66,11,1,22,23),(450,0,66,87,11,1,22,22),(451,0,5,87,11,1,22,22),(452,0,6,87,11,1,22,22),(453,0,4,87,11,1,22,22),(454,0,1,87,11,1,22,22),(455,0,5,6,11,1,23,23),(456,0,4,71,11,1,23,23),(457,2,71,1,11,1,23,23),(458,2,67,5,11,1,23,23),(459,0,1,67,11,1,23,23),(460,0,1,65,11,1,24,24),(461,2,6,5,11,1,24,24),(462,0,6,89,11,1,24,24),(463,0,6,90,11,1,24,24),(464,1,1,89,11,0,24,24),(465,1,1,90,11,0,24,24),(466,0,6,91,11,0,24,24),(467,0,5,91,11,0,24,24),(468,0,1,91,11,1,24,24),(469,0,4,91,11,1,24,24),(470,0,66,91,11,0,24,24),(471,2,6,4,11,1,24,26),(472,2,6,66,11,1,24,24),(473,2,1,66,11,1,24,24),(474,2,1,5,11,1,24,24),(475,2,1,92,11,1,24,24),(476,2,6,92,11,1,24,24),(477,2,5,92,11,1,24,24),(478,0,4,66,11,1,25,25),(479,0,6,66,11,1,25,25),(480,2,1,93,11,1,25,26),(481,2,6,93,11,1,25,25),(482,2,4,93,11,1,25,25),(483,2,66,6,11,1,26,26),(484,2,66,4,11,1,26,26),(485,2,4,1,11,1,26,26),(486,2,94,1,11,1,26,26),(487,2,95,5,11,1,26,26),(488,2,4,5,11,1,26,26),(489,2,66,5,11,1,26,26),(490,0,1,5,11,1,26,26),(491,0,66,93,11,1,25,26),(492,0,5,93,11,1,26,26),(493,0,95,93,11,1,26,26),(494,0,94,93,11,1,26,26),(495,2,5,6,11,1,26,26),(496,2,1,5,11,1,27,27),(497,0,1,6,11,1,27,27),(498,0,1,4,11,1,27,27),(499,0,1,25,11,1,27,27),(500,0,1,26,11,1,27,27),(501,0,25,26,11,1,27,27),(502,0,6,25,11,1,27,27),(503,0,6,26,11,1,27,27),(504,0,5,25,11,1,27,27),(505,0,5,26,11,1,27,27),(506,0,6,5,11,1,27,27),(507,0,6,4,11,1,27,27),(508,0,5,4,11,1,27,27),(509,0,5,68,11,1,27,27),(510,0,68,4,11,1,27,27),(511,0,4,71,11,1,27,27),(512,0,71,1,11,1,27,27),(513,0,1,6,9,1,197,197),(514,0,1,93,12,1,28,28),(515,2,1,4,12,1,28,28),(516,0,1,71,12,1,28,28),(517,0,1,72,12,1,28,28),(518,0,1,73,12,1,28,28),(519,0,1,66,12,1,28,28),(520,0,4,72,11,1,23,23),(521,0,4,73,11,1,23,23),(522,0,4,72,11,1,27,27),(523,0,4,73,11,1,27,27),(524,2,72,1,11,1,23,23),(525,2,73,1,11,1,23,23),(526,0,72,1,11,1,27,27),(527,0,73,1,11,1,27,27),(528,0,4,6,12,1,28,28),(529,0,1,6,12,1,28,28),(530,0,4,66,12,1,28,28),(531,0,4,71,12,1,28,28),(532,0,4,72,12,1,28,28),(533,0,4,73,12,1,28,28),(534,0,66,71,12,1,28,28),(535,0,66,72,12,1,28,28),(536,0,66,73,12,1,28,28),(537,0,71,72,12,1,28,28),(538,0,71,73,12,1,28,28),(539,0,72,73,12,1,28,28),(540,0,66,71,11,1,23,23),(541,0,66,72,11,1,23,23),(542,0,66,73,11,1,23,23),(543,0,71,72,11,1,23,23),(544,0,71,73,11,1,23,23),(545,0,72,73,11,1,23,23),(546,0,66,71,11,1,27,27),(547,0,66,72,11,1,27,27),(548,0,66,73,11,1,27,27),(549,0,71,72,11,1,27,27),(550,0,71,73,11,1,27,27),(551,0,72,73,11,1,27,27),(552,0,5,4,12,1,28,28),(553,0,1,65,12,1,28,29),(554,0,1,82,12,1,28,28),(555,0,1,83,12,1,28,28),(556,0,1,84,12,1,28,28),(557,0,1,81,12,1,28,28),(558,0,65,82,12,1,28,28),(559,0,65,81,12,1,28,28),(560,0,65,83,12,1,28,28),(561,0,65,84,12,1,28,28),(562,2,6,4,12,1,29,30),(563,2,1,5,12,1,29,29),(564,2,5,4,12,1,29,29),(565,2,1,6,12,1,29,29),(566,2,1,4,12,1,29,30),(567,0,1,85,12,1,30,30),(568,2,85,6,12,1,30,30);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narrContainers`
--

LOCK TABLES `narrContainers` WRITE;
/*!40000 ALTER TABLE `narrContainers` DISABLE KEYS */;
INSERT INTO `narrContainers` VALUES (1,'The Boy Who Lived',0,7,18,0,0,0),(2,'The Midnight Duel',0,107,120,0,0,0),(3,'Hallowe\'en',0,121,132,0,0,0),(4,'Quidditch',0,133,142,0,0,0),(5,'The Mirror of Erised',0,143,157,0,0,0),(6,'Nicolas Flamel',0,158,166,0,0,0),(7,'Norbert the Norwegian Ridgeback',0,167,176,0,0,0),(8,'The Forbidden Forest',0,177,190,0,0,0),(9,'Through the Trapdoor',0,191,208,0,0,0),(10,'The Man with Two Faces',0,209,223,0,0,0),(11,'The Vanishing Glass',0,18,27,0,0,0),(12,'The Letters From No One',0,28,38,0,0,0),(13,'The Keeper of the Keys',0,39,48,0,0,0),(14,'Diagon Alley',0,49,66,0,0,0),(15,'The Journey from Platform Nine and Three-Quarters',0,67,84,0,0,0),(16,'The Sorting Hat',0,85,98,0,0,0),(17,'The Potions Master',0,98,106,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
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

-- Dump completed on 2025-10-21  1:30:02
