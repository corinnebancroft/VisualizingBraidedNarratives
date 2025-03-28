-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: persimmon.hcmc.uvic.ca    Database: narratives_de
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (0,'[NULL]'),(1,'Test 1'),(2,'Test 2'),(4,'Test 4'),(5,'Sophia Golosovsky'),(6,'Alyona Golosovsky'),(7,'Ksyusha/Ksenia Adukanov'),(8,'Chegga/Sergei Adukanov'),(9,'Ruslan'),(10,'Nadia/Nadezhda'),(11,'Alla Innokentevna'),(12,'Natasha/Natalia'),(13,'Denis'),(14,'Mila/Ludmila'),(15,'Lilia'),(16,'Revmira'),(17,'Kolya/Nikolai Danilovich'),(18,'Zoya'),(19,'Lev'),(20,'Sasha/Alexandra'),(21,'Yulka/Yulia'),(22,'Oksana'),(23,'Max/Maxim'),(24,'Katya/Ekaterina'),(25,'Diana'),(26,'Yevgeny Pavlovich Kulik'),(27,'Anfisa'),(28,'Lada'),(29,'Olya/Olga'),(30,'Valentina Nikolaevna'),(31,'Yegor Gusakov'),(32,'Marina Alexandrovna'),(33,'Olya\'s Mother (name??)'),(34,'history teacher'),(35,'\"someone\'s girlfriend\" (18)'),(37,'Classmate 1 in picture (18)'),(38,'Classmate 2 in picture (19)'),(40,'\"girl they knew\" (18)'),(41,'men (generally?)'),(42,'Classmate 3 (20)'),(43,'grocery-store cashier (20)'),(44,'\"the nurse giving her an injection\" (20)'),(45,'\"a couple\" (22)'),(46,'Native peoples of Kamchatka'),(47,'migrants (generally)'),(48,'Valentina\'s Husband (name?)'),(49,'\"an old lady\" (27)'),(50,'\"a vendor\" (27)'),(51,'Lenin (27)'),(52,'\"high school boys on their bikes\" (27)'),(53,'crane operators (28)'),(54,'Lieutenant Ryakhovsky'),(56,'the kidnappER'),(57,'the kidnappING'),(58,'\"the townspeople\" (6)'),(59,'\"an older boy in a fitted cap\" (11)'),(60,'\"local teenagers\" (12)'),(61,'\"cruise-ship tourists\" (12)'),(62,'\"a short haired woman\" (12)'),(63,'Maylish (Oksana\'s dog)'),(64,'tourists (generally)'),(65,'Katya\'s \"girlfriends\" (34, 36)'),(66,'Oksana\'s ex-husband (35)'),(67,'Kamchatka police'),(68,'\"news reporter\" (24)'),(69,'\"customs officers\" (36)'),(70,'criminals (generally)'),(71,'[NULL]'),(72,'boring colleague/supervisor (36/37)'),(73,'pregnant colleague (36)'),(74,'\"Tajik\" ethnic group (38)'),(75,'The Nalychevo group (37)'),(76,'Katya\'s mother'),(77,'Katya\'s father'),(78,'Katya\'s brothers'),(79,'\"male coleagues\" (37)'),(80,'\"female colleagues\" (37)'),(81,'Koreans (38)'),(82,'Chukchi ethnic group (38)'),(83,'Putin'),(84,'The Communists'),(85,'Communists'),(86,'\"yet another woman\" (39)'),(87,'\"people at a neighbouring campsite\" (40)'),(88,'volunteers for the search parties'),(89,'\"the women in the school office\" (47)'),(90,'\"the doctor\" (47)'),(91,'Travis Walton'),(92,'Aliens'),(93,'Minister of Defense'),(94,'Jack London'),(95,'\"tabloid reporter\" (41)'),(96,'a bear (44-45)'),(97,'\"children wandering\" (46)'),(98,'\"parents neglecting their duties\" (46)'),(99,'\"the girl at the desk\" (48)'),(100,'Valentina\'s \"colleague\" (48)'),(101,'Golosovskaya girls\' father (name?) (48)'),(102,'\"the principal\" (49)'),(103,'\"her peers\"');
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
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menExs`
--

LOCK TABLES `menExs` WRITE;
/*!40000 ALTER TABLE `menExs` DISABLE KEYS */;
INSERT INTO `menExs` VALUES (7,2,6,5,1,1,3,16),(8,0,6,32,1,1,4,4),(9,1,6,31,1,1,5,5),(10,0,6,32,1,1,9,9),(11,2,6,31,1,1,9,15),(13,2,5,31,1,1,10,13),(14,2,6,5,1,1,14,16),(15,2,31,5,1,1,15,15),(16,2,29,25,2,1,17,17),(17,1,29,30,2,1,17,17),(18,0,29,33,2,1,18,21),(19,1,29,5,2,0,17,17),(20,1,29,6,2,0,17,17),(21,0,29,25,2,1,18,18),(22,2,29,25,2,0,19,20),(23,0,29,34,2,1,18,18),(24,1,29,35,2,0,18,18),(25,0,29,37,2,1,18,18),(26,0,29,40,2,1,18,19),(27,0,29,38,2,1,19,19),(28,0,25,40,2,1,18,19),(29,0,25,37,2,1,18,18),(30,0,25,38,2,1,19,19),(31,0,29,42,2,1,20,21),(32,2,29,44,2,1,20,20),(33,2,29,43,2,1,20,20),(34,2,25,29,2,1,21,21),(35,0,29,25,2,1,21,26),(36,2,30,29,2,1,22,25),(37,1,25,45,2,1,22,22),(38,0,25,37,2,1,23,23),(39,0,30,25,2,1,22,23),(40,1,30,33,2,1,23,23),(41,0,29,33,2,1,24,26),(42,2,30,29,2,1,24,25),(43,2,30,25,2,1,24,24),(44,1,30,6,2,0,24,24),(45,1,30,5,2,0,24,24),(46,1,25,6,2,0,24,24),(47,1,25,5,2,0,24,24),(49,1,29,6,2,0,24,24),(50,1,29,5,2,0,24,24),(51,1,30,47,2,0,24,24),(52,1,30,46,2,0,24,24),(53,1,25,47,2,0,24,24),(54,1,25,46,2,0,24,24),(55,1,29,47,2,0,24,24),(56,1,29,46,2,0,24,24),(57,1,29,32,2,0,24,24),(58,1,30,32,2,0,24,24),(59,1,25,32,2,1,24,24),(60,2,33,25,2,1,25,25),(61,2,29,25,2,0,27,27),(62,1,25,6,2,0,26,26),(63,1,25,5,2,0,26,26),(64,2,25,30,2,1,26,26),(65,2,29,25,2,1,26,26),(66,0,29,30,2,1,26,26),(67,1,29,6,2,0,26,27),(68,1,29,5,2,0,26,27),(69,1,30,33,2,1,26,26),(70,1,49,29,2,1,27,27),(71,1,29,51,2,0,27,28),(72,2,29,50,2,1,27,28),(73,1,29,52,2,0,27,28),(74,1,29,53,2,0,28,28),(75,0,29,25,2,1,28,31),(76,0,29,30,2,1,28,29),(77,0,29,33,2,1,29,31),(78,1,33,56,2,0,20,20),(79,1,29,56,2,0,20,20),(80,1,29,57,2,0,17,17),(81,1,30,57,2,0,24,24),(82,1,25,57,2,0,24,24),(83,1,29,57,2,0,24,24),(84,1,25,57,2,0,26,26),(85,1,29,57,2,0,26,27),(86,2,54,29,2,1,29,30),(87,0,29,57,2,0,29,31),(88,1,29,6,2,0,29,29),(89,1,29,5,2,0,29,29),(90,0,29,30,2,1,28,29),(91,0,5,32,1,1,4,4),(92,1,5,31,1,1,5,5),(93,1,6,58,1,0,5,8),(94,1,5,58,1,0,5,8),(95,1,6,51,1,0,9,9),(96,1,5,51,1,0,9,9),(97,0,5,32,1,1,9,9),(98,1,6,59,1,0,11,12),(99,1,5,59,1,0,11,11),(100,1,6,22,1,1,12,12),(101,1,6,61,1,0,12,12),(102,1,5,61,1,0,12,12),(103,1,6,62,1,0,12,12),(104,1,5,62,1,0,12,12),(105,1,5,22,1,1,12,12),(106,0,6,63,1,0,12,12),(107,1,5,63,1,0,12,12),(108,0,6,32,1,1,13,16),(109,0,5,32,1,1,13,16),(110,1,31,32,1,0,14,14),(111,1,25,57,2,0,17,17),(112,0,29,30,2,1,17,17),(113,1,25,6,2,0,17,17),(114,1,25,5,2,0,17,17),(115,1,29,64,2,0,18,18),(116,1,33,64,2,1,18,18),(117,1,29,64,2,0,18,18),(118,1,54,6,2,0,29,30),(119,1,54,5,2,0,29,30),(120,1,54,57,2,0,29,30),(121,1,54,56,2,0,29,30),(123,1,54,33,2,0,30,30),(124,0,29,30,2,1,31,31),(125,2,23,24,3,1,32,33),(126,1,24,57,3,0,33,33),(127,1,24,6,3,0,33,33),(128,1,24,5,3,0,33,33),(129,0,24,23,3,1,34,34),(130,2,22,24,3,1,34,37),(132,2,65,24,3,1,34,34),(133,2,24,23,3,1,35,37),(134,0,22,23,3,1,34,34),(135,1,65,23,3,1,34,34),(136,0,22,66,3,1,35,35),(137,0,22,63,3,1,35,36),(138,1,29,67,2,0,24,24),(139,1,30,67,1,0,24,24),(140,1,25,67,2,0,24,24),(141,1,30,68,2,0,24,24),(142,1,25,68,2,0,24,24),(143,1,29,68,2,0,24,24),(145,0,22,67,3,1,35,35),(146,1,22,57,3,0,35,38),(147,1,22,6,3,0,35,35),(148,1,22,5,3,0,35,35),(149,1,22,56,3,0,35,38),(150,1,24,57,3,0,35,38),(151,1,67,56,3,0,35,35),(152,1,67,57,3,0,35,35),(153,1,68,6,2,0,24,24),(154,1,68,5,2,0,24,24),(155,1,68,57,2,0,24,24),(156,0,24,65,3,1,36,36),(157,0,24,69,3,1,36,36),(158,1,24,41,3,0,36,36),(159,1,24,70,3,0,36,36),(160,1,24,47,3,0,36,36),(161,0,24,63,3,0,35,36),(162,0,22,72,3,1,36,36),(163,0,22,73,3,1,36,36),(164,1,24,72,3,0,36,36),(165,1,24,73,3,0,36,36),(166,0,22,23,3,1,36,36),(167,2,22,23,3,1,37,37),(168,1,23,56,3,0,37,38),(169,1,23,57,3,0,37,38),(170,1,23,6,3,0,37,38),(171,1,23,5,3,0,37,38),(172,1,72,56,3,0,38,38),(173,1,72,57,3,0,38,38),(174,1,72,6,3,0,38,38),(175,1,72,5,3,0,38,38),(176,1,72,46,3,0,38,38),(177,1,72,74,3,0,38,38),(178,1,73,56,3,0,38,38),(179,1,73,57,3,0,38,38),(180,1,73,6,3,0,38,38),(181,1,73,5,3,0,38,38),(182,1,22,6,3,0,37,38),(183,1,22,5,3,0,37,38),(184,1,24,56,3,0,35,38),(185,1,24,6,3,0,36,38),(186,1,24,5,3,0,36,38),(187,0,24,72,3,1,38,38),(188,0,24,73,3,1,38,38),(189,2,23,22,3,1,37,37),(190,2,72,23,3,1,38,38),(191,2,22,72,3,1,38,38),(192,1,75,57,3,0,37,38),(193,1,75,56,3,0,37,38),(194,1,75,6,3,0,37,38),(195,1,75,5,3,0,37,38),(196,2,23,75,3,1,37,38),(197,0,75,22,3,1,37,38),(198,0,24,75,3,1,37,38),(199,0,24,77,3,1,39,39),(200,0,24,76,3,1,39,39),(201,0,24,78,3,1,39,39),(202,1,23,67,3,0,38,38),(203,1,24,67,3,0,35,35),(204,1,24,67,3,0,38,38),(205,0,24,79,3,1,37,37),(206,1,24,80,3,1,37,37),(208,1,29,67,2,0,29,31),(210,1,22,81,3,0,38,38),(211,1,22,82,3,0,38,38),(212,1,24,83,3,0,39,39),(213,0,24,46,3,0,39,39),(214,1,24,85,3,0,39,39),(215,0,22,66,3,1,39,40),(216,0,24,66,3,1,39,40),(217,0,23,66,3,1,39,40),(218,1,24,86,3,0,39,40),(219,1,22,86,3,0,39,40),(220,0,66,86,3,1,39,40),(221,0,66,86,3,1,39,40),(222,1,24,87,3,0,40,40),(223,1,23,87,3,0,40,40),(224,0,23,88,3,1,38,38),(225,1,24,88,3,1,38,38),(226,1,24,88,3,0,40,41),(227,0,23,88,1,1,40,41),(228,0,23,54,3,1,40,40),(229,1,24,54,3,0,40,41),(230,0,24,80,3,1,40,40),(231,0,24,79,3,1,40,40),(232,0,24,23,3,1,38,38),(233,2,24,23,3,1,39,45),(234,2,54,88,3,1,40,40),(235,1,24,6,3,0,40,41),(236,1,24,5,3,0,40,41),(237,1,23,6,3,0,40,41),(238,1,23,5,3,0,40,41),(239,1,23,57,3,0,40,41),(240,1,23,56,3,0,40,41),(241,1,24,56,3,0,40,41),(242,1,24,57,3,0,40,41),(243,0,24,67,3,0,41,41),(244,0,23,67,3,0,41,41),(245,0,24,22,3,1,41,41),(246,0,23,22,3,1,41,41),(247,1,22,56,3,0,41,41),(248,1,24,56,3,0,44,44),(249,0,30,48,4,1,46,47),(250,0,30,25,4,1,46,47),(251,1,30,6,4,0,46,46),(252,1,30,5,4,0,46,46),(253,1,30,57,4,0,46,46),(254,0,48,25,4,1,46,47),(255,2,30,89,4,1,47,47),(256,2,90,30,4,1,47,48),(257,2,12,13,5,1,107,113),(258,1,12,91,5,0,107,107),(259,1,13,91,5,0,107,107),(260,1,12,92,5,0,107,110),(261,1,13,92,5,0,107,110),(262,2,12,11,5,1,108,110),(263,0,11,13,5,1,108,108),(264,1,13,93,5,0,108,108),(265,1,93,92,5,0,108,108),(266,2,11,19,5,1,108,109),(267,2,11,21,5,1,108,109),(268,2,19,21,5,1,108,110),(269,0,12,19,5,1,108,112),(270,0,12,21,5,1,108,111),(271,1,21,94,5,0,108,108),(272,1,11,94,5,0,108,108),(273,1,12,94,5,0,108,108),(274,1,19,94,5,0,108,108),(275,1,12,93,5,0,108,108),(276,0,19,13,5,1,108,111),(277,0,13,21,5,1,108,111),(278,0,13,15,5,1,109,109),(279,0,12,15,5,1,109,109),(280,0,29,33,2,1,16,16),(281,1,22,46,3,0,41,41),(282,1,23,46,3,0,41,41),(283,1,24,95,3,0,41,41),(284,2,24,96,3,1,44,45),(285,2,23,96,3,1,44,45),(286,1,30,98,4,0,46,46),(287,1,30,97,4,1,46,46),(288,0,30,99,4,1,48,48),(289,2,30,100,4,1,48,49),(290,0,100,54,4,1,48,49),(291,0,30,54,4,1,48,49),(292,1,100,6,4,0,48,48),(293,1,100,5,4,0,48,48),(294,1,30,6,4,0,48,48),(295,1,30,5,4,0,48,48),(296,1,30,101,4,0,48,48),(297,1,100,101,4,0,48,48),(298,1,54,101,4,0,48,48),(299,0,30,102,4,1,49,49),(300,0,30,25,4,1,49,50),(301,0,30,90,4,1,49,49);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narrContainers`
--

LOCK TABLES `narrContainers` WRITE;
/*!40000 ALTER TABLE `narrContainers` DISABLE KEYS */;
INSERT INTO `narrContainers` VALUES (1,'August',0,3,16,0,6,0),(2,'September',0,17,31,0,29,0),(3,'October',0,32,45,0,24,0),(4,'November',0,46,58,0,30,0),(5,'January',0,107,132,0,12,0);
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

-- Dump completed on 2025-03-28  1:30:02
