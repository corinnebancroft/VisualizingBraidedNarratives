-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: persimmon.hcmc.uvic.ca    Database: narratives_utc
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
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (0,'[NULL]'),(3,'Sarah'),(4,'Ruth'),(5,'Silas'),(6,'Tom'),(7,'\"everbody\" (victims of war)'),(8,'\"men\" (soldiers)'),(10,'God'),(11,'gramophone salesman'),(12,'\"buddy\" (of gramophone salesman)'),(13,'Burgess'),(15,'farm hire'),(16,'Aunt Peel'),(17,'\"black and white soldiers\"'),(18,'\"black soldier\"'),(19,'\"white woman\" (accuser of black soldier)'),(22,'\"white men\" (abstract)'),(23,'\"black men\" (abstract)'),(24,'\"black women\" (croppers)'),(26,'figure in nightmare'),(27,'\"white men with pistols and rifles\"'),(28,'white man with gun (155)'),(29,'white man with red can (155)'),(30,'\"white man\" (shot by Silas)'),(31,'Taylor'),(32,'\"the white man\"'),(33,'\"the n*****\"'),(34,'the Reds'),(35,'\"five or six thousand of us\"'),(36,'white woman at desk'),(38,'Hadley'),(39,'Green (Hadley\'s comrade)'),(40,'Jimmy'),(41,'May'),(42,'Taylor\'s mother'),(43,'Taylor\'s father'),(44,'Moses'),(45,'Bess (Taylor\'s mule)'),(46,'Taylor\'s congregation'),(47,'committee from congregation'),(48,'Mayor Bolton'),(49,'Deacon Smith'),(50,'Judas'),(51,'the Devil'),(52,'\"sonny\" (congregation member)'),(53,'\"Sistah\" (congregation member)'),(54,'\"Brother\"  (congregation member)'),(55,'Jesus'),(56,'Chief Bruden'),(57,'Mr. Lowe'),(58,'Sam (Jimmy\'s friend)'),(59,'Pete (Jimmy\'s friend)'),(60,'Bob (Jimmy\'s friend)'),(61,'Jack (Jimmy\'s friend)'),(62,'Jimmy\'s boys'),(63,'Deacon Board'),(64,'the police'),(65,'\"thin black woman\"'),(66,'Sister Harris'),(67,'Sister Davis'),(68,'Sister James'),(69,'children of thin black woman'),(70,'Brother Booker'),(71,'\"mankind\"'),(72,'\"chillun of Israel\"'),(73,'Shadrach, Meshach, and Abednego'),(74,'Jonah'),(75,'“wicked men”'),(76,'Jacob'),(77,'Saul'),(78,'children in the church'),(79,'leaders of organizations'),(80,'\"a crowd\" (of demonstrators)'),(81,'Scott'),(82,'mob (attacked Scott)'),(83,'children in the playground'),(84,'\"bad n*****s\"'),(85,'Chamber of Commerce'),(86,'Deacon Bonds'),(87,'Deacon Williams'),(88,'Red Squad'),(89,'Deacon Hilton'),(90,'Deacon Jones'),(91,'\"poor white folks\"'),(92,'Bob (kidnapper)'),(93,'Ellis (kidnapper)'),(95,'kidnappers'),(96,'Houston'),(97,'\"the dead\"'),(98,'\"white man\" (Houston\'s neighbourhood)'),(99,'\"white boy\" (Houston\'s neighbourhood)'),(100,'\"white woman\" (Houston\'s neighbourhood)'),(101,'Samson'),(102,'policeman (Houston\'s neighbourhood)'),(103,'\"a janitah\"'),(104,'\"Miz Harvey\"'),(105,'\"a doctah\"'),(106,'Deacon Bonds’s children'),(107,'Deacon Bonds’s wife'),(108,'\"black man\" (killed by police)'),(110,'\"Sistah Henry\" (congregation member)'),(111,'\"blue-coated policemen\"'),(112,'people on sidewalks'),(113,'policeman (City Hall)'),(114,'Big Boy'),(115,'Bobo'),(116,'Will'),(117,'Bertha'),(118,'Richard Wright'),(119,'Richard\'s Childhood Gang'),(120,'\"white boys who lived beyond the tracks.\"'),(121,'\"kind neighbor\"'),(122,'Doctor'),(123,'Richard Wright\'s Mother'),(124,'Jim Crow'),(125,'\"white folks\" (abstract)'),(126,'Black preachers, teachers, and clerks (3)'),(127,'Boss of the optical company'),(128,'\"black folks\" (abstract)'),(129,'Pease'),(130,'Morrie'),(131,'\"the folks at home\" (7)'),(132,'Boss of Clothing Store'),(133,'Clothing Store Boss\' Son'),(134,'Woman in the Clothing store'),(135,'Police officer outside clothing store'),(136,'\"fellow negro porters\" (8)'),(137,'Lead White Boy from the car'),(138,'White boy with Whiskey (9)'),(139,'Johnny-Boy'),(140,'Sug'),(141,'\"white and black Communists\" (223)'),(142,'sheriff'),(143,'Bob (Johnny-Boy\'s friend)'),(144,'Sue'),(145,'Sue\'s mother'),(146,'Sue’s husband'),(147,'Reva'),(148,'Lem'),(149,'Reva\'s brother'),(150,'Reva\'s mother'),(151,'\"the rich bosses\"'),(152,'Booker'),(153,'Blattberg'),(154,'Sue\'s neighbours (234)'),(155,'\"n*****s\"'),(156,'\"white men in glistening raincoats\"'),(157,'white man throwing greens'),(158,'white man coming forward'),(159,'Green (Johnny-Boy\'s comrade)'),(160,'Johnson'),(161,'Murphy'),(162,'sheriff\'s men'),(163,'\"two white men with shotguns\"'),(164,'Tim'),(165,'tall man with crowbar'),(166,'\"Jew boy\"'),(167,'Pete (sheriff\'s enforcer)'),(168,'White boys in Car (8)'),(169,'\"Leave him alone\" (9)'),(170,'Policemen (10)'),(171,'Bell-boys'),(172,'\"prostitutes\" (11)'),(173,'\"snowy-skinned Blonde\" (11)'),(174,'\"thick-set man\"'),(175,'\"One of the bell-boys\"'),(176,'\"one of the Negro maids\"'),(177,'Police after the bell-boy'),(178,'The maid\'s baby'),(179,'bell-boy caught with white sex-worker'),(180,'Hall-boys'),(181,'Hotel Management'),(182,'The maid with Richard'),(183,'White night-watchman'),(184,'Library-goers (13)'),(185,'Roman Catholic Library-goer'),(186,'The Librarian'),(187,'Negro Soldiers in France (14)'),(188,'Co-workers at Memphis optical company'),(189,'The Ku Klux Klan'),(190,'\"American White Women\" (abstract)'),(191,'French Women (abstract)'),(192,'Jack Johnson'),(193,'Abraham Lincoln'),(194,'William Sherman'),(195,'Catholics (abstract)'),(196,'The Pope'),(197,'Jews (abstract)'),(198,'The Republican Party'),(199,'Police (abstract)'),(200,'Lynch-mobs (abstract)'),(201,'White men in the elevator (15)'),(202,'Richard\'s friend who ran an elevator (15)'),(203,'white folks who employ Richard\'s mother'),(204,'folks at the store'),(208,'Fellow Negro Porters'),(209,'\"one fellow\" (8)'),(210,'Librarian'),(211,'Main boy (8)'),(212,'Reluctant boy (9)'),(213,'Boss of delivery company'),(214,'townspeople (FC)'),(215,'\"the relief\"');
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
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menExs`
--

LOCK TABLES `menExs` WRITE;
/*!40000 ALTER TABLE `menExs` DISABLE KEYS */;
INSERT INTO `menExs` VALUES (12,1,118,124,3,0,1,15),(13,0,118,123,30,1,1,1),(14,0,118,119,30,1,1,1),(15,2,119,120,30,1,1,2),(16,0,118,125,30,0,1,1),(17,2,118,121,30,1,2,2),(18,2,118,122,30,1,2,2),(19,1,118,125,30,1,2,2),(20,1,123,125,30,0,2,2),(21,1,118,203,30,0,2,2),(22,0,123,203,30,1,2,2),(23,2,118,123,30,1,2,3),(24,1,118,10,30,0,3,3),(25,1,123,10,30,0,3,3),(26,1,118,125,30,1,3,3),(27,1,118,126,30,0,3,3),(28,2,118,127,30,1,3,4),(29,2,127,129,30,1,4,4),(30,2,127,130,30,1,4,4),(31,2,118,130,30,1,4,5),(32,2,118,129,30,1,5,5),(33,0,118,132,30,1,5,5),(34,0,130,129,30,1,4,4),(35,0,130,129,30,1,5,7),(36,2,118,130,30,1,5,7),(37,2,118,129,30,1,5,7),(38,0,118,127,30,1,7,7),(39,2,118,131,30,1,7,7),(40,2,3,4,7,1,125,126),(41,0,3,5,7,1,126,127),(42,0,3,6,7,1,127,128),(44,1,3,7,7,0,127,127),(45,1,3,8,7,0,127,127),(46,0,10,8,7,1,127,127),(47,0,10,7,7,1,127,127),(48,0,7,8,7,1,127,127),(49,0,3,5,7,1,128,129),(50,0,3,6,7,1,129,129),(51,2,3,11,7,1,129,137),(52,0,3,5,7,1,130,130),(53,0,3,4,7,1,130,130),(54,0,3,4,7,1,131,131),(56,0,3,4,7,1,132,132),(57,0,3,10,7,1,132,132),(58,0,11,4,7,0,130,130),(59,0,11,5,7,0,130,130),(60,0,3,4,7,1,133,133),(62,0,11,5,7,0,133,133),(63,1,3,12,7,0,134,134),(64,0,11,12,7,1,134,134),(65,0,3,5,7,1,135,135),(66,0,11,5,7,0,135,135),(67,2,3,11,8,1,138,138),(68,0,11,5,8,0,138,138),(69,0,3,5,8,1,138,138),(70,2,3,5,8,1,139,145),(71,0,5,13,8,1,139,140),(72,0,3,13,8,0,139,140),(73,0,5,125,8,0,140,140),(74,0,3,125,8,0,140,140),(75,0,3,4,8,1,140,140),(76,0,5,4,8,1,140,140),(77,0,3,6,8,1,140,140),(78,0,5,6,8,1,140,140),(79,1,5,204,8,0,140,140),(80,1,3,204,8,0,140,140),(83,0,3,16,8,1,140,140),(84,0,5,16,8,1,140,140),(85,0,5,11,8,0,141,143),(86,0,3,6,8,1,142,142),(87,0,5,6,8,1,142,142),(88,0,5,10,8,0,143,143),(89,0,3,10,8,0,143,143),(90,0,5,125,8,1,143,143),(91,0,3,125,8,1,143,143),(92,0,5,128,8,1,143,143),(93,0,3,128,8,1,143,143),(94,0,3,11,8,1,143,143),(95,0,5,4,8,1,144,144),(96,0,3,4,8,1,144,146),(97,0,3,16,8,1,145,146),(98,0,3,5,8,1,146,146),(99,0,3,6,8,1,146,146),(100,2,3,4,9,1,146,150),(101,0,3,11,9,1,146,146),(102,0,3,6,9,1,147,147),(103,0,3,4,8,1,138,138),(104,1,118,124,31,0,7,7),(105,0,118,132,31,1,7,7),(106,0,118,133,31,1,7,7),(107,0,118,135,31,0,7,7),(108,0,118,134,31,0,7,7),(109,2,132,134,31,1,7,7),(110,2,133,134,31,1,7,7),(111,2,135,134,31,1,7,7),(112,2,132,133,31,1,7,7),(113,0,132,135,31,1,7,7),(114,0,133,135,31,1,7,7),(115,2,133,118,31,1,8,8),(116,2,118,132,31,1,8,8),(117,0,118,134,31,0,8,8),(118,0,132,134,31,1,8,8),(119,0,133,134,31,1,8,8),(120,1,208,132,31,0,8,8),(121,1,208,133,31,0,8,8),(122,1,208,134,31,0,8,8),(123,1,208,135,31,0,8,8),(124,2,118,208,31,1,8,8),(125,2,209,118,31,1,8,8),(126,1,209,132,31,0,8,8),(127,1,209,133,31,0,8,8),(128,1,209,134,31,0,8,8),(129,1,209,135,31,0,8,8),(130,2,118,168,32,1,8,10),(131,2,118,211,32,1,8,10),(132,2,118,212,32,0,8,10),(133,2,118,138,32,1,8,10),(134,0,118,123,32,1,9,9),(135,2,212,211,32,0,9,9),(136,2,3,10,7,1,126,129),(138,0,11,10,7,1,132,132),(139,2,3,10,7,1,136,136),(140,2,3,10,8,1,140,140),(141,2,5,10,8,1,141,143),(142,2,5,10,8,1,145,145),(143,2,3,10,8,1,146,146),(144,2,3,10,9,1,147,149),(145,0,23,22,9,1,147,147),(146,0,3,23,9,0,147,147),(147,0,3,22,9,0,147,147),(148,0,3,5,9,1,147,148),(149,2,3,5,9,1,149,150),(150,1,3,24,9,0,147,147),(151,0,5,125,9,1,147,147),(152,2,5,11,9,1,149,150),(153,2,5,12,9,1,149,150),(154,2,11,12,9,1,149,150),(155,0,3,11,9,1,148,150),(156,0,3,12,9,0,149,150),(157,2,3,5,10,1,150,153),(158,0,5,4,10,1,150,151),(159,2,3,4,10,1,150,150),(160,0,3,4,10,1,151,151),(161,0,3,125,10,1,151,152),(162,0,5,125,10,1,151,153),(163,2,5,10,10,1,151,153),(164,0,3,10,10,1,151,152),(165,0,3,16,10,1,151,151),(166,0,5,16,10,1,151,151),(167,2,5,11,10,0,152,152),(168,0,3,11,10,0,152,152),(169,0,5,128,10,1,152,152),(170,0,3,128,10,1,152,152),(172,0,3,125,10,1,152,152),(173,2,3,4,10,1,153,156),(174,0,3,16,10,1,153,153),(175,0,5,16,10,1,153,153),(176,0,3,22,10,1,153,154),(177,0,3,23,10,1,153,154),(178,2,3,10,10,1,153,153),(179,0,3,5,10,1,154,156),(180,2,5,27,10,1,154,156),(181,0,3,27,10,0,154,156),(182,2,5,30,10,1,154,154),(183,0,3,30,10,0,154,154),(184,2,28,29,10,1,155,155),(185,0,3,28,10,0,155,155),(186,0,3,29,10,0,155,155),(187,2,5,28,10,1,155,155),(188,2,5,29,10,1,155,155),(189,0,31,125,11,1,157,157),(190,0,31,128,11,1,157,157),(191,0,31,34,11,1,157,157),(192,2,31,46,11,1,158,162),(193,2,31,36,11,1,158,158),(194,2,31,10,11,1,158,161),(195,0,36,214,11,1,158,158),(196,0,31,214,11,1,158,158),(197,0,31,38,11,1,158,158),(198,0,31,39,11,1,158,158),(199,0,31,125,12,1,159,160),(200,0,31,41,11,1,159,159),(201,0,31,43,11,1,159,159),(202,0,31,42,11,1,159,159),(203,0,31,40,11,1,159,159),(204,0,31,44,11,0,159,159),(205,0,31,45,11,1,160,161),(207,0,31,38,11,1,160,160),(208,0,31,39,11,1,160,160),(209,0,31,125,11,1,160,161),(210,0,31,41,11,1,161,161),(211,0,31,215,11,1,161,161),(212,1,46,215,11,1,161,161),(213,0,31,47,11,1,161,161),(214,0,47,48,11,1,161,161),(215,0,31,10,11,1,162,162),(216,0,31,49,11,1,161,162),(217,0,31,50,11,0,161,161),(218,2,31,52,11,1,161,162),(219,2,31,53,11,1,162,162),(220,2,31,54,11,1,162,162),(221,0,31,51,11,1,162,162),(222,0,31,55,11,1,162,162),(223,0,31,40,11,1,162,162);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narrContainers`
--

LOCK TABLES `narrContainers` WRITE;
/*!40000 ALTER TABLE `narrContainers` DISABLE KEYS */;
INSERT INTO `narrContainers` VALUES (1,'Long Black Song',0,125,156,0,3,0),(2,'Fire and Cloud',0,157,220,0,31,0),(3,'The Ethics of Living Jim Crow',0,1,15,118,118,8),(4,'Big Boy Leaves Home',0,16,61,0,0,7),(5,'Bright and Morning Star',0,221,263,0,144,0),(6,'Down by the Riverside',0,62,124,0,0,0),(7,'I (LBS)',1,125,137,0,3,0),(8,'II (LBS)',1,138,146,0,3,0),(9,'III (LBS)',1,146,150,0,3,0),(10,'IV (LBS)',1,150,156,0,3,0),(11,'I (FC)',1,157,162,0,31,0),(12,'II (FC)',1,162,165,0,31,0),(13,'III (FC)',1,165,169,0,31,0),(14,'IV (FC)',1,169,172,0,31,0),(15,'V (FC)',1,172,179,0,31,0),(16,'VI (FC)',1,179,187,0,31,0),(17,'VII (FC)',1,187,195,0,31,0),(18,'VIII (FC)',1,195,201,0,31,0),(19,'IX (FC)',1,201,206,0,31,0),(20,'X (FC)',1,206,211,0,31,0),(21,'XI (FC)',1,211,212,0,31,0),(22,'XII (FC)',1,212,214,0,31,0),(23,'XIII (FC)',1,214,220,0,31,0),(24,'I (BMS)',1,221,230,0,144,0),(25,'II  (BMS)',1,230,236,0,144,0),(26,'III (BMS)',1,236,241,0,144,0),(27,'IV (BMS)',1,241,247,0,144,0),(28,'V (BMS)',1,247,254,0,144,0),(29,'VI (BMS)',1,254,263,0,144,0),(30,'I (TELJC)',1,1,7,118,118,8),(31,'II (TELJC)',1,7,8,118,118,8),(32,'III (TELJC)',1,8,10,118,118,8),(33,'IV (TELJC)',1,10,10,118,118,8),(34,'V (TELJC)',1,11,11,118,118,8),(35,'VI (TELJC)',1,11,12,118,118,8),(36,'VII (TELJC)',1,12,12,118,118,8),(37,'VIII (TELJC)',1,12,13,118,118,8),(38,'IX (TELJC)',1,13,15,118,118,8);
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

-- Dump completed on 2025-07-26  1:30:11
