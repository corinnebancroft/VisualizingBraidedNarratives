-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: persimmon.hcmc.uvic.ca    Database: narratives_ps
-- ------------------------------------------------------
-- Server version	8.0.44

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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'speaker Abel'),(2,'Sagaween (Laxsgiik)'),(3,'\"Eagle-Raven clan\"'),(4,'Gisk\'aast (\"Killer Whale Clan\")'),(5,'\"Sispagut\" (Gisk\'aast)'),(6,'\"Hladerh\" (Laxgibuu)'),(7,'Oyee (\"Oyai\")'),(8,'railway engineer'),(9,'crew of Indians'),(10,'men walking on Pole of Sagaween'),(11,'\"Indians\" (abstract)'),(12,'residents of Git\'iks'),(13,'Barton (Laxgibuu)'),(14,'real Barbeau'),(15,'fictional Barbeau'),(16,'biographical Abel'),(17,'first \"\'Neesyoq\" (Laxgibuu)'),(18,'second \"\'Neesyoq\" (Laxgibuu)'),(19,'\"\'Neeskyinwaet\" (Laxgibuu)'),(20,'Laxgibuu (\"Wolf clan\")'),(21,'\"Paraet\'Naerhl\"'),(22,'son of \"Paraet\'Naerhl\"'),(23,'Dennis Wood'),(24,'\"man with sea cockle (kal\'own)\"'),(25,'Jordan Abel\'s mother'),(26,'Jordan Abel\'s family'),(27,'\"Yaw\'l\" (Laxgibuu)'),(28,'brothers of \"Yaw\'l\" (Laxgibuu)'),(29,'\"Huge-Belly\"'),(30,'brother of \"Yaw\'l\" who killed \"Huge-Belly\"'),(31,'\"Ksemkaigyet\" (\"female being\")'),(32,'\"Ksemkaigyet\" (old man)'),(33,'Jordan Abel\'s father'),(34,'friends of Abel\'s parents'),(36,'\"Gitrhawn clan\"'),(37,'\"Gunas\" (Laxsgiik)'),(38,'chief of \"Gitrhawn clan\"'),(39,'Thunderbird'),(41,'\"the Spirit Halibut\"'),(42,'Sagaween\'s father (Gisk\'aast)'),(43,'women singing'),(44,'visitors at Sagaween\'s house'),(45,'Vancouver carvers'),(46,'ROM admissions staff member'),(48,'Nisg̱a’a'),(49,'\"glass-nosed spirit\"'),(50,'\"the Spirit\"'),(51,'\"Samedeek\" (Gisk\'ansnaat)'),(53,'blank (missing null option here)'),(54,'\"ancestors of Eagles\"'),(55,'\"ancestors of Wolves\"'),(56,'Caxton Printers'),(57,'Macmillan Company of Canada'),(58,'Pole of Sagaween'),(59,'\"Three Persons Along\" & \"Shaking Pole of Kw’axsuu\"'),(60,'collage photos'),(61,'\"Sperm Whale (hlpoon)\"'),(62,'\"person with ... garment (gyet)\"'),(63,'\"Gyaibelk\" (carved)'),(64,'man on a Nass River pole'),(65,'a Nass River pole'),(66,'child Abel'),(67,'various totem poles in Vancouver'),(68,'totem pole in Vancouver mall'),(69,'\"the Eagle\"'),(71,'cedar bark squid'),(72,'ROM admissions superiors'),(73,'\"His grandson\"'),(74,'academic voice'),(75,'James Deans'),(76,'Queen Charlotte'),(77,'nephews of \"Samedeek\"'),(78,'Haida'),(80,'women related to the \"Coffin House\"');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `containerLevels`
--

LOCK TABLES `containerLevels` WRITE;
/*!40000 ALTER TABLE `containerLevels` DISABLE KEYS */;
INSERT INTO `containerLevels` VALUES (1,'level 2 (sub-section)'),(2,'level 3 (sub-sub-section)'),(3,'level 4 (sub-sub-sub-section)'),(4,'level 5 (sub-sub-sub-sub-section)'),(5,'level 1 (section)');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menExs`
--

LOCK TABLES `menExs` WRITE;
/*!40000 ALTER TABLE `menExs` DISABLE KEYS */;
INSERT INTO `menExs` VALUES (2,0,14,2,9,1,50,59),(3,0,2,3,9,1,50,59),(4,0,2,4,9,1,50,59),(5,0,14,3,9,0,50,59),(6,0,14,4,9,1,50,59),(7,1,14,5,9,0,50,59),(8,1,14,7,9,0,50,59),(9,1,14,6,9,0,50,59),(10,0,2,5,9,1,50,59),(11,2,2,6,9,1,50,59),(12,1,2,7,9,1,50,59),(13,0,3,4,9,1,50,59),(14,0,5,4,9,1,50,59),(15,0,5,6,9,1,50,59),(16,0,5,7,9,1,50,59),(17,0,5,3,9,1,50,59),(18,0,6,3,9,1,50,59),(19,0,6,4,9,1,50,59),(20,1,6,7,9,1,50,59),(21,0,7,4,9,1,50,59),(22,0,6,3,9,1,50,59),(23,1,14,20,9,0,50,59),(24,0,2,20,9,1,50,59),(25,0,20,55,9,1,50,59),(26,0,3,54,9,1,50,59),(27,1,3,55,9,1,50,59),(28,1,20,54,9,1,50,59),(29,0,54,55,9,1,50,59),(30,0,2,55,9,1,50,59),(31,1,2,54,9,0,50,59),(32,0,14,56,9,1,50,59),(33,0,14,57,9,1,50,59),(34,0,1,2,10,0,70,79),(35,0,1,5,10,0,70,79),(36,0,1,14,9,0,70,79),(37,1,14,2,10,0,70,79),(38,1,14,5,10,0,70,79),(39,0,1,14,11,0,90,99),(40,0,1,3,11,0,90,99),(41,0,1,20,11,0,90,99),(42,0,14,3,11,0,90,99),(43,0,14,20,11,0,90,99),(44,0,1,14,12,0,110,119),(45,0,1,14,13,0,130,139),(46,0,1,14,14,0,150,159),(47,0,14,58,17,1,190,199),(48,0,14,8,17,1,190,199),(49,0,14,9,17,1,190,199),(50,0,14,59,17,1,190,199),(51,1,14,10,17,0,190,199),(52,0,8,58,17,1,190,199),(53,0,8,9,17,1,190,199),(54,0,8,59,17,1,190,199),(55,0,9,58,17,1,190,199),(56,0,9,59,17,1,190,199),(57,0,58,59,17,1,190,199),(58,0,10,58,17,1,190,199),(59,0,1,58,18,1,210,219),(60,0,1,14,19,0,230,239),(61,0,1,11,19,0,230,239),(62,0,14,58,19,1,230,239),(63,0,14,11,19,1,230,239),(64,0,1,11,20,0,250,259),(65,0,14,39,24,0,310,319),(66,0,14,58,24,1,310,319),(67,0,14,11,24,1,310,319),(68,0,14,12,24,0,310,319),(70,0,1,58,25,1,330,339),(71,0,1,12,25,0,330,339),(72,0,12,58,25,1,330,339),(73,0,15,13,30,1,430,439),(74,0,15,58,30,1,430,439),(75,1,14,19,33,0,470,479),(76,1,14,17,33,0,470,479),(77,1,14,18,33,0,470,479),(78,1,14,24,33,0,470,479),(79,0,14,20,33,1,470,479),(80,1,14,24,33,0,470,479),(81,1,14,61,33,0,470,479),(82,1,14,62,33,0,470,479),(83,1,14,63,33,0,470,479),(84,0,14,23,33,1,470,479),(85,1,14,21,33,0,470,479),(86,1,14,22,33,0,470,479),(87,0,21,24,33,1,470,479),(88,0,21,61,33,1,470,479),(89,0,21,62,9,1,470,479),(90,0,21,63,33,1,470,479),(91,0,21,22,33,1,470,479),(92,0,21,62,33,1,470,479),(93,0,22,24,33,1,470,479),(94,0,22,61,33,1,470,479),(95,0,22,62,33,1,470,479),(96,0,22,63,33,1,470,479),(97,1,21,17,33,0,470,479),(98,1,22,17,33,0,470,479),(99,0,21,18,33,1,470,479),(100,0,22,18,33,1,470,479),(101,0,17,18,33,1,470,479),(102,1,23,17,33,0,470,479),(103,1,23,18,33,0,470,479),(104,1,23,21,33,0,470,479),(105,1,23,22,33,0,470,479),(106,1,23,24,33,0,470,479),(107,1,23,61,33,0,470,479),(108,1,23,62,33,0,470,479),(109,1,23,63,33,0,470,479),(110,0,24,61,33,1,470,479),(111,0,24,62,33,1,470,479),(112,0,24,63,33,1,470,479),(113,0,61,62,33,1,470,479),(114,0,61,63,33,1,470,479),(115,0,62,63,33,1,470,479),(116,0,1,24,34,0,490,499),(117,0,1,61,34,0,490,499),(118,0,1,62,34,0,490,499),(119,0,1,63,34,0,490,499),(120,0,15,65,37,1,550,559),(121,0,15,64,37,0,550,559),(122,2,15,23,37,1,550,559),(123,0,23,65,37,1,550,559),(124,0,23,64,37,0,550,559),(125,0,16,25,40,1,590,599),(126,0,16,66,40,0,590,599),(127,0,16,58,40,1,590,599),(128,0,16,2,40,0,590,599),(129,0,16,14,40,0,590,599),(130,0,66,25,40,1,590,599),(131,1,66,58,40,1,590,599),(132,2,16,26,42,1,630,639),(133,2,16,25,42,1,630,639),(134,0,25,58,42,1,630,639),(136,1,16,58,42,0,630,639),(137,1,14,27,45,0,670,679),(138,1,14,28,45,0,670,679),(139,1,14,29,45,0,670,679),(140,1,14,30,45,0,670,679),(141,1,14,31,45,0,670,679),(142,0,14,48,45,1,670,679),(143,2,27,30,45,1,670,679),(144,2,27,28,45,1,670,679),(145,2,28,30,45,1,670,679),(146,2,27,29,45,1,670,679),(147,2,27,31,45,1,670,679),(148,0,27,48,45,1,670,679),(149,2,30,29,45,1,670,679),(150,2,30,31,45,1,670,679),(151,0,30,48,45,1,670,679),(152,2,28,29,45,1,670,679),(153,2,28,31,45,1,670,679),(154,0,28,48,45,1,670,679),(155,0,31,48,45,1,670,679),(156,0,1,20,47,1,710,719),(157,0,1,20,48,1,730,739),(158,0,1,48,50,1,770,779),(159,0,1,48,51,1,790,799),(161,0,1,48,49,1,750,759),(162,0,1,20,49,1,750,759),(163,0,1,48,52,1,810,819),(164,0,1,48,53,1,830,839),(165,0,1,32,54,0,850,859),(166,0,1,32,55,0,870,879),(167,0,1,48,55,1,870,879),(168,0,1,48,56,1,890,899),(169,2,32,49,58,1,930,939),(170,0,16,33,61,1,970,979),(171,0,16,25,61,1,970,979),(172,2,16,34,61,1,970,979),(173,0,16,67,61,1,970,979),(174,0,1,68,65,1,1050,1059),(175,0,2,36,68,1,1090,1099),(176,0,2,37,68,0,1090,1099),(177,0,2,38,68,0,1090,1099),(178,0,2,69,68,0,1090,1099),(179,0,2,41,68,0,1090,1099),(181,0,37,38,68,1,1090,1099),(183,2,37,41,68,1,1090,1099),(184,0,37,69,68,1,1090,1099),(187,0,36,69,68,1,1090,1099),(188,0,36,41,68,1,1090,1099),(189,2,38,36,68,1,1090,1099),(190,0,37,36,68,1,1090,1099),(191,0,38,69,68,1,1090,1099),(192,0,38,41,68,1,1090,1099),(193,0,1,50,70,0,1130,1139),(194,0,2,42,76,0,1230,1239),(195,0,2,71,76,1,1230,1239),(196,2,2,44,76,1,1230,1239),(197,2,2,43,76,1,1230,1239),(198,2,44,71,76,1,1230,1239),(199,2,44,43,76,1,1230,1239),(200,0,44,42,76,0,1230,1239),(201,2,43,71,76,1,1230,1239),(202,0,43,42,76,0,1230,1239),(203,0,71,42,76,0,1230,1239),(204,0,1,4,77,0,1250,1259),(205,0,1,33,78,1,1270,1279),(206,0,1,42,78,0,1270,1279),(207,0,1,33,79,1,1290,1299),(208,0,1,42,79,0,1290,1299),(209,0,1,33,80,1,1310,1319),(210,0,1,42,80,0,1310,1319),(211,0,16,66,85,0,1390,1399),(212,0,16,33,85,0,1390,1399),(213,0,16,45,85,0,1390,1399),(214,0,45,19,85,1,1390,1399),(215,0,66,33,85,1,1390,1399),(216,0,16,14,87,0,1430,1439),(217,2,16,46,87,1,1430,1439),(218,1,16,72,87,0,1430,1439),(219,2,16,58,87,1,1430,1439),(220,0,46,72,87,1,1430,1439),(221,1,46,58,87,0,1430,1439),(222,2,15,13,95,1,1630,1639),(223,1,15,73,95,0,1630,1639),(224,0,15,2,95,0,1630,1639),(225,0,13,73,95,0,1630,1639),(226,0,13,2,95,1,1630,1639),(227,1,15,73,97,0,1652,1659),(228,2,15,13,97,1,1652,1659),(229,1,15,13,99,0,1672,1679),(230,1,15,73,98,0,1672,1679),(231,1,15,13,104,0,1712,1719),(232,1,15,13,105,0,1730,1739),(233,1,14,75,109,0,1773,1779),(234,1,14,76,109,0,1773,1779),(235,0,1,2,120,0,1894,1899),(236,0,2,51,121,1,1910,1919),(237,1,2,77,121,0,1910,1919),(238,2,51,77,121,1,1910,1919),(239,0,74,78,128,0,1990,1994),(240,0,60,58,7,0,30,33),(241,0,60,1,7,1,30,33),(242,0,1,58,8,1,34,39),(243,0,1,58,16,1,173,179),(244,0,60,1,15,1,170,172),(246,0,60,58,15,0,170,172),(247,0,1,58,23,1,293,299),(248,0,60,58,22,0,290,292),(249,0,60,1,22,1,290,292),(250,0,1,58,32,1,455,459),(251,0,60,1,31,1,450,454),(252,0,60,58,31,0,450,454),(253,0,60,1,38,1,570,573),(254,0,60,1,43,1,650,652),(255,0,60,1,59,1,950,955),(256,0,60,1,66,1,1070,1077),(257,0,60,2,74,0,1210,1216),(258,0,60,1,74,1,1210,1216),(259,0,1,2,75,0,1217,1219),(260,0,60,58,74,0,1210,1216),(261,0,1,58,75,1,1217,1219),(262,0,60,1,83,1,1370,1375),(263,0,60,1,89,1,1530,1538),(264,0,60,74,100,0,1690,1696),(265,0,60,15,101,1,1690,1696),(266,0,60,1,106,1,1750,1753),(267,0,60,14,108,0,1770,1772),(268,1,60,75,108,0,1770,1772),(269,1,60,76,108,0,1770,1772),(270,0,60,1,113,1,1830,1836),(271,0,60,74,113,0,1830,1836),(272,0,60,2,119,0,1890,1893),(273,0,60,1,119,1,1890,1893),(274,0,1,2,120,0,1894,1899),(275,0,60,74,130,0,2010,2016),(276,0,60,14,130,0,2010,2016),(277,0,60,1,154,1,2370,2378),(278,0,60,1,156,1,2390,2398),(279,0,60,1,158,1,2410,2417),(280,0,60,1,160,1,2430,2436),(281,0,60,1,162,1,2450,2458),(282,0,60,1,164,1,2470,2476),(283,0,60,1,166,1,2490,2493),(284,0,60,1,168,1,2510,2515),(285,0,60,1,170,1,2530,2538),(286,0,60,1,172,1,2550,2557),(288,0,1,20,50,1,770,779),(289,0,14,58,40,1,590,599),(290,1,14,80,109,0,1773,1779),(291,0,1,2,8,0,34,39),(292,0,60,2,7,0,30,33),(293,0,60,2,15,0,170,172),(294,0,58,2,15,1,170,172),(295,0,1,2,16,0,173,179),(296,0,58,2,16,1,173,179),(297,0,14,2,17,1,190,199),(298,1,9,2,17,0,190,199),(299,0,1,2,18,0,210,219),(300,0,58,2,17,1,190,199),(301,0,58,2,18,1,210,219),(302,0,14,2,19,0,230,239),(303,0,1,2,19,0,230,239),(304,0,58,2,19,1,230,239),(305,0,60,2,22,0,290,292),(306,0,1,2,23,0,293,299),(307,0,58,2,23,1,293,299),(308,0,58,2,22,1,290,292),(309,0,11,58,24,1,310,319),(310,0,11,2,24,1,310,319),(311,0,58,39,24,1,310,319),(312,0,12,58,24,1,310,319),(313,0,14,2,24,0,310,319),(314,0,12,2,24,1,310,319),(315,0,58,2,24,1,310,319),(316,0,11,39,24,0,310,319),(317,0,12,39,24,1,310,319),(318,0,12,2,25,1,330,339),(319,0,58,2,25,1,330,339),(320,0,1,2,25,0,330,339),(321,0,1,58,29,1,410,419),(322,0,58,2,29,1,410,419),(323,0,1,2,29,0,410,419),(324,0,1,58,28,1,390,399),(325,0,1,2,28,0,390,399),(326,0,58,2,28,1,390,399),(327,0,15,2,30,0,430,439),(328,0,58,2,30,1,430,439),(330,0,58,2,31,1,450,454),(331,0,1,2,32,0,455,459),(332,0,58,2,32,1,454,459),(333,0,60,2,31,0,450,454),(334,0,64,65,37,1,550,559),(335,0,14,2,40,0,590,599),(336,0,58,2,40,1,590,599),(337,1,25,2,42,0,630,639),(338,0,58,2,42,1,630,639),(339,0,26,25,42,1,630,639),(340,1,16,58,42,0,630,639),(341,0,58,2,74,1,1210,1216),(342,0,58,2,75,1,1217,1219),(343,0,14,2,76,0,1230,1239),(344,1,14,42,76,0,1230,1239),(345,1,14,4,76,0,1230,1239),(346,1,14,44,76,0,1230,1239),(347,1,14,71,76,0,1230,1239),(348,1,14,43,76,0,1230,1239),(349,1,46,2,87,0,1430,1439),(350,0,16,2,87,0,1430,1439),(351,0,58,2,87,1,1430,1439);
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
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narrContainers`
--

LOCK TABLES `narrContainers` WRITE;
/*!40000 ALTER TABLE `narrContainers` DISABLE KEYS */;
INSERT INTO `narrContainers` VALUES (1,'1',5,10,1500,53,53,0),(3,'2a',5,1510,2080,53,53,0),(4,'2b',5,2090,2340,53,53,0),(5,'2c',5,2350,2550,53,53,0),(6,'section 1',1,10,19,53,53,0),(7,'\"afeudoverthispole\" (photo)',1,30,33,60,53,0),(8,'\"afeudoverthispole\" (text)',1,34,39,53,53,0),(9,'\"A feud over this pole.\"',1,50,59,14,2,0),(10,'\"or Sakau\'wan\"',1,70,79,1,53,0),(11,'\"his / new totems\"',1,90,99,1,53,0),(12,'\"an account / or / summary\"',1,110,119,1,53,0),(13,'\"his / his / theirs\"',1,130,139,1,53,0),(14,'\"In summary\"',1,150,159,1,53,0),(15,'\"thepoletransportedtotoronto\" (photo)',1,170,172,60,53,0),(16,'\"thepoletransportedtotoronto\" (text)',1,173,179,53,53,0),(17,'\"The pole transported to Toronto.\"',1,190,199,14,53,0),(18,'\"remove / transfer / shift\"',1,210,219,1,53,0),(19,'\"his totem / the water\"',1,230,239,1,53,0),(20,'\"remove / thousands of / Indians\"',1,250,259,1,53,0),(21,'\"along the coast to Prince Rupert\" (cloud)',1,270,279,1,53,0),(22,'\"removalofthesakauwanpolefromnassriver\" (photo)',1,290,292,60,53,0),(23,'\"removalofthesakauwanpolefromnassriver\" (text)',1,293,299,1,53,0),(24,'\"Removal of the Sakau\'wan pole from Nass River.\"',1,310,319,14,53,0),(25,'\"his / stateliness\"',1,330,339,1,53,0),(26,'\"the Northwest Coast\"',1,350,359,1,53,0),(27,'\"o r / o orr\" (cloud)',1,370,379,1,53,0),(28,'\"hung over / the fire\"',1,390,399,1,53,0),(29,'\"for / the / sight of\"',1,410,419,1,53,0),(30,'\"The anthropologist humbled by beauty and the sleepless moon.\"',1,430,439,15,15,0),(31,'\"thesilhouetteofapoleontheshoreofnassriver\" (photo)',1,450,454,60,53,0),(32,'\"thesilhouetteofapoleontheshoreofnassriver\" (text)',1,455,459,1,53,0),(33,'\"The pole of \'Neesyoq and \'Neeskywinwaet\"',1,470,479,14,53,0),(34,'\"(wilplarhae)\"',1,490,499,1,53,0),(35,'\"( )\" (scatter)',1,510,519,1,53,0),(36,'\"(field )\"',1,530,539,1,53,0),(37,'\"The silhouette of a pole on the shore of Nass River.\"',1,550,559,15,53,0),(38,'\"R. O. M.\" (photo)',1,570,573,60,53,0),(39,'\"R. O. M.\" (text)',1,574,579,1,53,0),(40,'\"13.07.1992 / The poet, deep in a docile state of youth\"',1,590,599,16,16,0),(41,'\"13.07.1992\" overlapping \"25.12.2010\" (scatter)',1,610,619,16,16,0),(42,'\"25.12.2010 / The poet exchanges gifts\"',1,630,639,16,16,0),(43,'\"themythofthedragonfly\" (photo)',1,650,652,60,53,0),(44,'\"themythofthedragonfly\" (text)',1,653,659,1,53,0),(45,'\"The myth of the Dragon-Fly.\"',1,670,679,14,53,0),(46,'\" . \' \" (scatter)',1,690,699,1,53,0),(47,'\"this clan / covered the ground\"',1,710,719,1,53,0),(48,'\"one by one\"',1,730,739,1,53,0),(49,'\"summertime / in a strange country\"',1,750,759,1,53,0),(50,'\"broke n\"',1,770,779,1,53,0),(51,'\"time calling / the / people\"',1,790,799,1,53,0),(52,'\"with sand with blood\"',1,810,819,1,53,0),(53,'\"their inner workings\"',1,830,839,1,53,0),(54,'\"the solitude / opened\"',1,850,859,1,53,0),(55,'\"his work / their working\"',1,870,879,1,53,0),(56,'\"split open\"',1,890,899,1,53,0),(57,'\" . / \' . \" (scatter)',1,910,919,1,53,0),(58,'\"The Tale of the Blacked-Out Sky at Noon.\"',1,930,939,1,53,0),(59,'\"thewoodenspoon\" (photo)',1,950,955,60,53,0),(60,'\"thewoodenspoon\" (text)',1,955,959,1,53,0),(61,'\"12.06.2008\"',1,970,979,16,16,0),(62,'\"12.06.2008 / c \" (scatter)',1,990,999,16,53,0),(63,'\"12.06.2008\" overlapping \"26.06.2008\" (scatter)',1,1010,1019,16,53,0),(64,'\"26.06.2008\" (scatter)',1,1030,1039,16,53,0),(65,'\"26.06.2008\"',1,1050,1059,16,53,0),(66,'illegible collage text (photo)',1,1070,1077,60,53,0),(67,'illegible collage text (text)',1,1070,1079,1,53,0),(68,'\"Myth explaining some of the crests\"',1,1090,1099,14,53,0),(69,'\"follow / the coast\"',1,1110,1119,1,53,0),(70,'\"the / sockeye\"',1,1130,1139,1,53,0),(71,'\"the / remains of / a / head\"',1,1150,1159,1,53,0),(72,'\"account\" (cloud)',1,1170,1179,1,53,0),(73,'\"the / plentiful / day\"',1,1190,1199,1,53,0),(74,'\"totempolesofchiefmountain\" (photo)',1,1210,1216,60,53,0),(75,'\"totempolesofchiefmountain\" (text)',1,1217,1219,1,53,0),(76,'\"Totem Poles of Chief Mountain (Boas)\"',1,1230,1239,14,53,0),(77,'\"the deceased\"',1,1250,1259,1,53,0),(78,'\"meaning / his father\"',1,1270,1279,1,53,0),(79,'\"ground open\"',1,1290,1299,1,53,0),(80,'\"and / sung\"',1,1310,1319,1,53,0),(81,'\"column / clear\"',1,1330,1339,1,53,0),(82,'\"the son or\" (cloud)',1,1350,1359,1,53,0),(83,'\"themilkofhypotheticalhistories\" (photo)',1,1370,1375,60,53,0),(84,'\"themilkofhypotheticalhistories\" (text)',1,1356,1359,1,53,0),(85,'\"21.04.1985\"',1,1390,1399,16,53,0),(86,'\"21.04.1985\" overlapping \"05.08.2011\" \"h r w b\" (scatter)',1,1410,1419,16,53,0),(87,'\"05.08.2011\"',1,1430,1439,16,53,0),(88,'\"21.04.1985\" overlapping \"05.08.2011\" \"w / m t\" (scatter)',1,1450,1499,16,53,0),(89,'\"theplaceofscraps\" (photo)',1,1530,1538,60,53,0),(90,'\"theplaceofscraps\" (text)',1,1539,1539,1,53,0),(91,'\" \" / .\" \"',1,1550,1559,1,53,0),(92,'\"translated / \"shadow / of stars.\"\"',1,1570,1579,1,53,0),(93,'\"an endless / hike\"',1,1590,1599,1,53,0),(94,'\"I trudged on\"',1,1610,1619,1,53,0),(95,'\"The place of scraps.\"',1,1630,1639,15,53,0),(96,'\"Primitive culture circulates\" (academic voice)',1,1650,1651,74,53,0),(97,'\"Primitive culture circulates\" (Fictional Barbeau)',1,1652,1659,15,53,0),(98,'\"In practice, the civilized world\" (academic voice)',1,1670,1672,74,53,0),(99,'\"In practice, the civilized world\" (Fictional Barbeau)',1,1673,1679,15,53,0),(100,'\"Despite efforts to determine meaning\" (photo)',1,1690,1696,60,53,0),(101,'\"Despite efforts to determine meaning\" (academic voice)',1,1697,1698,74,53,0),(102,'\"Despite efforts to determine meaning\" (Fictional Barbeau)',1,1699,1699,15,53,0),(103,'\"Contact is precisely the investigation\" (academic voice)',1,1710,1713,74,53,0),(104,'\"Contact is precisely the investigation\" (Fictional Barbeau) (scatter)',1,1714,1719,15,53,0),(105,'\"culture spirit world\" (scatter)',1,1730,1739,15,53,0),(106,'\"coffinhouseofthefrog\" (photo)',1,1750,1753,60,53,0),(107,'\"coffinhouseofthefrog\" (text)',1,1754,1759,1,53,0),(108,'\"Coffin Hous\" (photo)',1,1770,1772,60,53,0),(109,'\"Coffin Hous\" (text)',1,1773,1779,14,53,0),(110,'\"This story / is a secret\"',1,1790,1799,1,1,0),(111,'\"This story / was / built\" (academic voice)',1,1810,1817,74,53,0),(112,'\"This story / was / built\" (Speaker Abel)',1,1818,1819,1,53,0),(113,'\"the / flat\" (photo)',1,1830,1836,60,53,0),(114,'\"the / flat\" (academic text)',1,1837,1838,74,53,0),(115,'\"the / flat\" (Speaker Abel)',1,1839,1839,1,53,0),(116,'\"This story / is\" (academic voice)',1,1850,1858,74,53,0),(117,'\"This story / is\" (Speaker Abel)',1,1859,1859,1,53,0),(118,'\"Let us proceed\"',1,1870,1879,74,53,0),(119,'\"thedoctrineoftheindianprophet\" (photo)',1,1890,1893,60,53,0),(120,'\"thedoctrineoftheindianprophet\" (text)',1,1894,1899,1,53,0),(121,'\"Had the old Indian been aware\"',1,1910,1919,14,53,0),(122,'\"We have scarcely begun\" (academic voice)',1,1930,1935,74,53,0),(123,'\"We have scarcely begun\" (Real Barbeau: cloud)',1,1936,1939,14,53,0),(124,'\"It is even incorrect\" (academic voice)',1,1950,1953,74,53,0),(125,'\"It is even incorrect\" (Real Barbeau: cloud)',1,1954,1959,14,53,0),(126,'\"Physical actions are expected.\" (academic voice)',1,1970,1974,74,53,0),(127,'\"Physical actions are expected.\" (Real Barbeau: cloud)',1,1975,1979,14,53,0),(128,'\"At least this functions\" (academic voice)',1,1990,1994,74,53,0),(129,'\"At least this functions\" (Real Barbeau: cloud)',1,1995,1999,14,53,0),(130,'\"Economically speaking\" (photo)',1,2010,2016,60,53,0),(131,'\"Economically speaking\" (academic voice)',1,2017,2018,74,53,0),(132,'\"Economically speaking\" (Real Barbeau: cloud)',1,2019,2019,14,53,0),(133,'\"The uncertain fractures\" (academic voice)',1,2030,2037,74,53,0),(134,'\"The uncertain fractures\" (Real Barbeau: cloud)',1,2038,2039,14,53,0),(135,'\"In this way\" (academic voice)',1,2050,2058,74,53,0),(136,'\"In this way\" (Real Barbeau: cloud)',1,2059,2059,14,53,0),(137,'\"Many persons will deny\" (academic voice)',1,2070,2077,74,53,0),(138,'\"Many persons will deny\" (Real Barbeau: cloud)',1,2078,2079,14,53,0),(139,'1 (level 2 container)',1,10,19,53,53,0),(140,'2a (level 2 container)',1,1510,1519,53,53,0),(141,'2b (level 2 container)',1,2090,2099,53,53,0),(142,'\"The poet is artificially replaced\"',1,2110,2119,74,53,0),(143,'\"The cyclicity of these poetics\"',1,2130,2139,74,53,0),(144,'\"Position of classification\"',1,2150,2159,74,53,0),(145,'\"The subject then restores\"',1,2170,2179,74,53,0),(146,'\"There is no duality\"',1,2190,2199,74,53,0),(147,'\"One is tempted to struggle\"',1,2210,2219,74,53,0),(148,'\"A state of primal unity\"',1,2230,2239,74,53,0),(149,'\"The message was always the same\"',1,2250,2259,74,53,0),(150,'\"But the divisions of movement\"',1,2270,2279,74,53,0),(151,'\"Here, science isn\'t just essential\"',1,2290,2299,74,53,0),(152,'\"As before, the notes show\"',1,2310,2319,74,53,0),(153,'\"There is no triumph\"',1,2330,2339,74,53,0),(154,'\"w c n;\" (photo)',1,2370,2378,60,53,0),(155,'\"w c n;\" (text)',1,2379,2379,1,53,0),(156,'\"d  x  l\" (photo)',1,2390,2398,60,53,0),(157,'\"d  x  l\" (text)',1,2399,2399,1,53,0),(158,'\"t m c\" (photo)',1,2410,2417,60,53,0),(159,'\"t m c\" (text)',1,2418,2419,1,53,0),(160,'\"l t g\" (photo)',1,2430,2436,60,53,0),(161,'\"l t g\" (text)',1,2437,2439,1,53,0),(162,'\"s d h\" (photo)',1,2450,2458,60,53,0),(163,'\"s d h\" (text)',1,2459,2459,1,53,0),(164,'\"d n k\" (photo)',1,2470,2476,60,53,0),(165,'\"d n k\" (text)',1,2477,2479,1,53,0),(166,'\"n d s l\" (photo)',1,2490,2493,60,53,0),(167,'\"n d s l\" (text)',1,2494,2499,1,53,0),(168,'\"m s d n\" (photo)',1,2510,2515,60,53,0),(169,'\"m s d n\" (text)',1,2516,2519,1,53,0),(170,'\"x / p / c c r\" (photo)',1,2530,2538,60,53,0),(171,'\"x / p / c c r\" (text)',1,2539,2539,1,53,0),(172,'\"r t t / r v\" (photo)',1,2550,2557,60,53,0),(173,'\"r t t / r v\" (text)',1,2558,2559,1,53,0);
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

-- Dump completed on 2026-03-06  1:30:05
