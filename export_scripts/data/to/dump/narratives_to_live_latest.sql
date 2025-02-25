-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: persimmon.hcmc.uvic.ca    Database: narratives_to
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
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (0,'[NULL]'),(62,'RW_TestCharacter_1'),(63,'RW_TestCharacter_2'),(64,'EA_TestCharacter_1'),(65,'EA_TestCharacter_2'),(66,'Rafaela Cortes'),(68,'Manzanar Murakami'),(69,'Gabriel Balboa'),(70,'Arcangel'),(71,'People in Traffic (34)'),(72,'Emi'),(73,'Terry'),(74,'Editor One (38)'),(75,'Editor Two (38)'),(76,'Editor Three (38)'),(77,'Editor Four (38)'),(78,'God'),(79,'mothers of gang-bangers (38)'),(80,'Rubén Salazar'),(81,'Bob the Weatherman'),(82,'Surfers (40)'),(83,'Gabriel Balboa\'s mother'),(84,'Gabriel Balboa\'s mother\'s priest'),(85,'Gabriel Balboa\'s family'),(86,'Beth'),(87,'Buzzworm'),(88,'Folks in the bridge rafters (41)'),(89,'Cross-dresser (41)'),(90,'Leonard Bernstein'),(91,'Esa-Pekka Solanen'),(92,'Seji Ozawa'),(93,'East L.A. boy'),(94,'Webb reporter in San Jose'),(95,'Corazon Juarez'),(96,'workers at Gabriel\'s house'),(97,'Gabriel Balboa\'s friends'),(98,'Bobby Ngu'),(99,'Carmen Miranda'),(100,'Cantiflas'),(101,'Ronald Reagan'),(102,'\"the masses\" (48)'),(103,'Che in Bolivia'),(104,'Eva Péron'),(105,'Pelé'),(106,'Pinochet'),(107,'Allende'),(108,'El General Stroessner'),(109,'Pablo Escobar'),(110,'The DEA'),(111,'Noriega'),(112,'Vargas Llosa'),(113,'Fujimori'),(114,'Somoza'),(115,'Sandino'),(116,'Borges'),(117,'Neruda'),(118,'Archbishop Romero'),(119,'Porfirio Díaz'),(120,'Fidel Castro'),(121,'Arcangel\'s torturers'),(122,'Arcangel\'s inmates'),(123,'Gabriel Garcia Márquez'),(124,'performance goer (48)'),(125,'Christopher Columbus'),(126,'John Cabot'),(127,'Pedro Alvares Cabral'),(128,'Ferdinand Magellan'),(129,'Hernán Cortés'),(130,'\"young man\" (50)'),(131,'Giovanni da Verrazano'),(132,'Jacques Cartier'),(133,'Vasco Núñez de Balboa'),(134,'Juan Rodriguez Cabrillo'),(135,'Sebastian Viscaíno'),(136,'Henry Hudson'),(137,'the Pilgrims (51)'),(138,'E.T.'),(139,'\"children and passerby\" (51)'),(141,'Uma Thurman (127)'),(142,'Quentin Tarantino (127)'),(143,'Doña Maria'),(144,'L.C. Tibbets'),(145,'Sol'),(146,'Pepe'),(147,'Mike Davis'),(148,'Rafaela\'s Mother'),(149,'Rodriguez'),(150,'Pancho Villa'),(151,'Gabriel\'s Grandmother'),(152,'Gabriel\'s Grandfather'),(154,'Rafaela\'s Father'),(155,'Rafaela\'s Great-Great-Grandfather'),(156,'Lupe'),(157,'Benito'),(158,'Hernando'),(159,'Car Jacker (mentioned in Bobby\'s intro)'),(160,'Bruce Lee'),(161,'Bobby\'s Brother'),(162,'Bobby\'s Father'),(163,'Bobby\'s Mother'),(164,'Refugees'),(165,'Americans (in the abstract)'),(166,'Refugee Camp Guards'),(167,'Bobby\'s Sisters'),(168,'Bicycle Factory Workers'),(169,'Bobby\'s Nephews and Nieces'),(170,'Raymond Chandler'),(171,'Alfred Hitchcock'),(172,'Roman Polanski'),(173,'Robert Altman'),(174,'Robert Zemeckis'),(175,'Roger Rabbit'),(176,'Waiters'),(177,'Cocktail Hostess'),(178,'Restaurant Clientele'),(179,'Lupe'),(180,'David Hockney'),(181,'Montel Williams'),(182,'Rikki Lake'),(183,'Sally Jesse Raphael'),(184,'Emi\'s Mother'),(185,'Emi\'s Father'),(186,'Emi\'s Siblings and Cousins'),(187,'Philip Marlowe'),(188,'Nicholas Meyer'),(189,'Unnamed Members of L.A. Underclass'),(190,'Cisco'),(191,'Cisco\'s dealer'),(192,'LAPD'),(193,'Papa John Creach'),(194,'Buzzworm\'s friend Kwon'),(195,'U.S. Surgeon General'),(196,'L.A. Suburbanites'),(197,'Cisco\'s Old man'),(198,'L.A. City Crew'),(199,'Joan Didion'),(200,'NewsNow Van Guys'),(201,'Astor Piazzolla'),(202,'Gabriel\'s Cousin Joe');
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
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menExs`
--

LOCK TABLES `menExs` WRITE;
/*!40000 ALTER TABLE `menExs` DISABLE KEYS */;
INSERT INTO `menExs` VALUES (186,1,68,71,89,0,34,35),(187,2,69,72,90,1,38,41),(188,2,69,73,90,1,38,38),(189,0,69,74,90,1,38,38),(190,0,69,75,90,1,38,38),(191,0,69,76,90,1,38,38),(192,2,69,77,90,1,38,38),(193,0,69,78,90,0,38,38),(194,0,69,79,90,1,38,38),(195,1,69,80,90,0,39,39),(196,0,72,81,90,1,39,39),(197,0,69,81,90,0,39,39),(198,1,72,82,90,0,40,40),(199,1,69,82,90,0,40,40),(200,0,69,85,90,1,40,40),(201,0,83,84,90,1,40,40),(202,0,69,86,90,1,41,41),(203,2,69,87,90,1,41,44),(204,0,87,88,90,0,41,41),(205,0,87,89,90,1,41,42),(206,0,87,78,90,0,42,42),(207,0,89,78,90,1,42,42),(208,0,87,68,90,1,42,42),(209,1,87,90,90,0,42,42),(210,1,87,91,90,0,42,42),(211,1,87,92,90,0,42,42),(212,2,87,68,90,1,43,43),(213,0,87,93,90,1,44,44),(214,0,87,94,90,0,44,44),(215,0,87,68,90,1,44,44),(216,1,87,95,90,0,44,44),(217,0,69,66,90,1,44,44),(218,2,69,66,90,1,45,45),(219,0,66,96,90,1,45,45),(220,0,69,97,90,1,45,45),(221,2,69,72,90,1,45,45),(222,0,66,98,90,1,45,45),(223,0,69,87,90,1,46,46),(224,0,69,68,90,0,46,46),(225,0,70,99,91,1,47,47),(226,0,70,100,91,1,47,47),(227,2,70,102,91,1,48,48),(228,2,70,103,91,1,48,48),(229,2,70,104,91,1,48,48),(230,2,70,105,91,1,48,48),(231,2,70,106,91,1,48,48),(232,2,70,107,91,1,48,48),(233,2,70,108,91,1,48,48),(234,2,70,109,91,1,48,48),(235,2,70,110,91,1,48,48),(236,2,70,111,91,1,48,48),(237,2,70,112,91,1,48,48),(238,2,70,113,91,1,48,48),(239,2,70,115,91,1,48,48),(240,2,70,114,91,1,48,48),(241,2,70,116,91,1,48,48),(242,2,70,117,91,1,48,48),(243,2,70,118,91,1,48,48),(244,2,70,119,91,1,48,48),(245,2,70,120,91,1,48,48),(246,2,70,121,91,1,48,48),(247,2,70,122,91,1,48,48),(248,2,70,123,91,1,48,48),(249,2,124,123,91,0,48,48),(250,1,124,70,91,1,48,48),(251,1,70,125,91,0,49,49),(252,1,70,126,91,0,49,49),(253,1,70,127,91,0,50,50),(254,1,70,128,91,0,50,50),(255,1,70,129,91,0,50,50),(256,2,70,130,91,1,50,50),(257,2,70,139,91,1,51,51),(258,0,66,69,85,1,4,4),(259,0,66,98,85,1,4,4),(260,2,66,69,85,1,4,7),(261,2,66,143,85,1,7,9),(263,2,143,145,85,1,7,9),(264,0,66,143,85,1,7,7),(265,0,66,146,85,1,7,7),(266,0,69,145,85,1,7,7),(267,0,69,98,85,1,5,7),(268,1,69,146,85,0,7,7),(269,2,66,145,85,1,7,13),(270,0,69,149,85,1,4,5),(271,2,66,149,85,1,4,5),(272,1,96,150,85,1,5,5),(273,1,69,150,85,1,5,5),(274,1,69,151,85,0,5,6),(275,1,69,152,85,1,6,6),(276,0,151,152,85,1,6,6),(277,0,152,150,85,1,5,5),(278,0,66,148,85,1,7,8),(279,1,69,148,85,1,7,7),(280,1,143,148,85,0,8,8),(281,1,143,154,85,0,8,8),(282,1,143,155,85,0,8,8),(284,0,66,154,85,1,8,8),(285,1,66,155,85,0,8,8),(286,2,143,156,85,1,8,8),(287,0,66,156,85,1,8,8),(288,0,143,157,85,1,9,9),(289,1,66,157,85,1,9,9),(290,1,66,158,85,0,9,9),(291,0,143,158,85,1,9,9),(292,1,66,144,85,0,11,11),(293,2,98,159,86,1,14,14),(294,0,98,159,86,1,14,14),(295,1,98,160,86,1,14,14),(296,0,98,161,86,1,15,15),(297,0,98,162,86,1,15,15),(298,0,98,163,86,1,15,15),(299,2,98,162,86,1,15,15),(300,1,98,164,86,1,15,16),(301,1,98,165,86,1,15,15),(302,0,98,166,86,1,15,15),(303,2,98,166,86,1,16,16),(304,2,161,166,86,1,16,16),(305,2,98,162,86,1,16,16),(306,2,98,161,86,1,16,16),(307,0,98,167,86,1,16,16),(308,0,161,167,86,1,16,16),(309,0,98,66,86,1,16,16),(310,2,98,66,86,1,17,17),(311,0,98,145,86,1,17,17),(312,0,161,163,86,1,17,17),(313,1,98,168,86,0,17,17),(314,1,98,168,86,0,18,18),(315,0,98,169,86,1,18,18),(316,0,72,69,87,1,18,18),(317,2,72,69,87,1,18,25),(318,1,72,176,87,0,18,18),(319,1,72,177,87,1,18,18),(320,1,72,178,87,0,18,18),(321,1,72,170,87,0,18,18),(322,1,72,171,87,0,18,18),(323,1,72,172,87,0,19,19),(324,1,72,173,87,1,19,19),(325,1,72,174,87,0,19,19),(326,1,72,175,87,0,19,19),(327,1,69,171,87,0,18,18),(328,1,69,172,87,0,19,19),(329,1,69,173,87,0,19,19),(330,1,69,174,87,0,19,19),(331,1,69,175,87,0,19,19),(332,1,69,177,87,1,18,18),(333,1,69,176,85,0,18,18),(334,1,69,178,85,0,18,18),(335,1,69,170,87,0,18,18),(336,1,69,171,85,0,18,18),(337,1,69,173,87,0,19,19),(338,1,69,172,87,0,19,19),(339,1,69,174,87,0,19,19),(340,1,69,175,87,1,19,19),(341,1,72,180,87,0,19,19),(342,2,72,184,87,1,21,22),(343,0,72,184,87,1,21,21),(344,0,184,69,87,1,21,21),(345,0,72,185,87,1,21,21),(346,0,184,185,87,1,21,21),(347,0,184,186,87,1,21,21),(348,0,185,186,87,1,21,21),(349,1,72,181,87,0,21,21),(350,1,184,181,87,0,21,21),(351,1,72,182,87,0,21,21),(352,1,184,182,87,0,21,21),(353,0,69,186,87,1,21,21),(354,0,69,185,87,1,21,21),(355,1,72,183,87,0,21,21),(356,1,184,183,87,0,21,21),(357,1,72,187,87,0,22,22),(358,1,69,187,87,0,22,22),(359,1,72,188,87,0,24,24),(360,1,69,188,87,0,24,24),(361,2,87,189,88,1,25,26),(362,1,87,192,88,1,27,27),(363,2,87,189,88,1,27,29),(364,0,87,190,88,1,28,28),(365,1,87,191,88,0,28,28),(366,2,190,191,88,1,28,28),(367,0,190,197,88,1,28,28),(368,0,191,197,88,1,28,28),(369,1,87,197,88,0,28,28),(370,1,87,193,88,0,29,29),(371,2,87,194,88,1,29,29),(372,1,87,195,88,0,30,30),(373,2,87,196,88,1,30,31),(374,1,87,198,88,0,32,32),(375,2,87,189,88,1,32,33),(376,1,72,199,93,0,58,58),(377,1,69,199,93,0,58,58),(378,2,72,69,93,1,58,59),(379,2,72,200,93,1,59,60),(380,1,72,201,93,0,60,60),(381,1,69,201,93,0,60,60),(382,2,72,69,93,1,60,62),(383,0,69,87,93,1,61,61),(384,1,72,87,93,0,61,61),(385,0,72,83,93,1,61,61),(386,2,72,83,93,1,61,61),(387,1,72,151,93,0,61,61),(388,1,72,202,93,0,61,61),(389,1,72,150,93,0,61,61),(390,0,69,202,93,1,61,61),(391,2,66,145,85,1,4,4),(392,0,66,96,85,1,5,5),(393,0,69,96,85,1,5,5),(394,0,96,152,85,1,5,5),(395,0,69,145,85,1,6,6),(396,0,66,145,85,1,6,6),(397,0,98,145,85,1,6,6),(398,0,143,98,85,1,7,8),(399,0,148,154,85,1,8,8),(400,0,66,98,85,1,8,8),(401,0,143,156,85,1,9,9),(402,0,66,156,85,1,9,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narrContainers`
--

LOCK TABLES `narrContainers` WRITE;
/*!40000 ALTER TABLE `narrContainers` DISABLE KEYS */;
INSERT INTO `narrContainers` VALUES (73,'RW_TestContainer_1',0,1,4,62,62,0),(74,'RW_TestContainer_2',1,2,3,63,63,3),(75,'EA_TestContainer_1',0,1,5,64,65,0),(76,'EA_TestContainer_2',1,1,3,65,0,4),(79,'Tuesday / Diamond Lane',0,53,94,0,0,0),(80,'Wednesday / Cultural Diversity',0,95,134,0,0,0),(81,'Thursday / The Eternal Buzz',0,135,172,0,0,0),(82,'Friday / Artificial Intelligence',0,173,208,0,0,0),(83,'Saturday / Queen of Angels',0,209,240,0,0,0),(84,'Sunday / Pacific Rim',0,241,268,0,0,0),(85,'1: Midday - Not Too Far from Mazatlán',1,3,13,0,66,0),(86,'2: Benefits - Koreatown',1,14,18,0,0,0),(87,'3: Weather Report - Westside',1,18,25,0,0,0),(88,'4: Station ID - Jefferson & Normandie',1,25,33,0,0,0),(89,'5: Traffic Window - Harbor Freeway',1,33,37,0,68,0),(90,'6: Coffee Break - Downtown',1,37,46,69,0,0),(91,'7: To Wake - The Marketplace',1,46,51,0,70,0),(92,'8: Rideshare - Downtown Interchange',1,55,57,0,0,0),(93,'9: NewsNow - Hollywood South',1,58,62,0,0,0),(94,'10: Morning - En México',1,62,70,0,0,0),(95,'11: To Wash - On The Tropic',1,70,75,0,0,0),(96,'12: Car Payment Due - Tijuana via Singapore',1,76,80,0,0,0),(97,'13: Oldies - This Old Hood',1,80,86,0,0,0),(98,'14: Budgets - Skirting Downtown',1,86,93,0,0,0),(99,'15: Second Mortgage - Chinatown',1,97,102,0,0,0),(100,'16: LA X - Margarita\'s Corner',1,102,107,0,0,0),(101,'17: The Interview - Manzanar',1,107,114,0,0,0),(102,'18: Daylight - The Cornfield',1,114,119,0,0,0),(103,'19: Hour of the Trucks - The Freeway Canyon',1,119,123,0,0,0),(104,'20: Disaster Movie Week - Hiro\'s Sushi',1,123,129,0,0,0),(105,'21: To Eat - La Cantina de Miseria y Hambre',1,130,134,0,0,0),(106,'22: You Give us 22 Minutes - The World',1,137,141,0,0,0),(107,'23: To Labor - East & West Forever',1,141,148,0,0,0),(108,'24: Dusk - To the Border',1,148,154,0,0,0),(109,'25: Time & a Half - Limousine Way',1,154,158,0,0,0),(110,'26: Life Insurance - L.A./T.J.',1,158,162,0,0,0),(111,'27: Live on Air - El A',1,162,168,0,0,0),(112,'28: Lane Change - Avoiding the Harbor',1,168,171,0,0,0),(113,'29: Promos - World Wide Web',1,175,180,0,0,0),(114,'30: Dawn - The Other Side',1,181,186,0,0,0),(115,'31: AM/FM - FreeZone',1,186,192,0,0,0),(116,'32: Overtime - El Zócalo',1,192,196,0,0,0),(117,'33: To Dream - America',1,196,201,0,0,0),(118,'34: Visa Card - Final Destination',1,201,204,0,0,0),(119,'35: Jam - Greater L.A.',1,204,207,0,0,0),(120,'36: To Perform - Angel\'s Flight',1,211,214,0,0,0),(121,'37: The Car Show - Front Line',1,214,220,0,0,0),(122,'38: Nightfall - Aztlán',1,220,222,0,0,0),(123,'39: Working Weekend - Dirt Shoulder',1,222,228,0,0,0),(124,'40: Social Security - I-5',1,228,233,0,0,0),(125,'41: Prime Time - Last Stop',1,234,237,0,0,0),(126,'42: Drive-By - Virtually Everywhere',1,237,240,0,0,0),(127,'43: Deadline - Over the Net',1,243,249,0,0,0),(128,'44: Commercial Break - The Big Sleep',1,249,252,0,0,0),(129,'45: Midnight - The Line',1,252,254,0,0,0),(130,'46: SigAlert - The Rim',1,254,256,0,0,0),(131,'47: To Die - Pacific Rim Auditorium',1,256,263,0,0,0),(132,'48: Hour 25 - Into the Boxes',1,263,265,0,0,0),(133,'49: American Express - Mi Casa/Su Casa',1,266,268,0,0,0),(134,'Monday / Summer Solstice',0,1,52,0,0,0);
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

-- Dump completed on 2025-02-25  0:00:04
