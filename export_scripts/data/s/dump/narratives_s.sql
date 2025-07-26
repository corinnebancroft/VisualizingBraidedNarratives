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
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (0,'[NULL]'),(3,'Laura Mitkowski'),(4,'Cory Mitkowski'),(5,'Hina Hassani'),(6,'Jessica (Laura\'s Mom)'),(7,'Clara Jane Donohue'),(8,'Mrs. Kamal'),(9,'Mr. Kamal'),(10,'Sylvie Beaudoin'),(11,'Marie Beaudoin'),(12,'Johnny Beaudoin'),(13,'Mrs Abdul'),(14,'Walk-in clinic receptionist (19)'),(15,'\"a shirtless man\" (20)'),(16,'The doctor (20)'),(17,'Parker'),(18,'Parker\'s mom'),(19,'\"grade three classmates\" (24)'),(20,'Mrs. Falls'),(21,'Mrs. Rhodes'),(22,'\"Indian kids\" (26)'),(23,'Children\'s Aid (25)'),(24,'Mr. George'),(25,'Slutty Christy'),(26,'Michelle'),(27,'Jonathon Beaudoin'),(28,'Bing/Bernard Espiritu'),(29,'Edna Espiritu'),(30,'\"the white lady\" (35)'),(31,'Mrs. Finnegan'),(32,'Vietnamese ladies'),(33,'\"her mother in law\" (36)'),(34,'White people'),(35,'Jesus'),(36,'Saints'),(37,'God'),(38,'Bing\'s Dad'),(39,'Tita Mae'),(40,'Cory\'s boss'),(41,'Geraldine McDonough'),(42,'Ontario Reads facilitators'),(43,'Lily Chan'),(44,'Aiden Chan'),(45,'Jennifer Chan'),(46,'Finnegan Everson'),(47,'Helen Mckay'),(48,'Sebastian Dennis'),(49,'Liam Williams'),(50,'Amina Mohammed'),(51,'Waleed Mohammed'),(52,'\"one elderly woman\" (32)'),(53,'Chloe Smith'),(56,'\"older kids\" (33)'),(57,'parents in the community'),(58,'\"an elderly Asian woman\" (41) / The bowling alley '),(59,'The police'),(60,'Mrs. Khan'),(61,'Mrs Crosby'),(62,'Mrs Landau'),(63,'\"the boys\" (Cory\'s friends) (49)'),(64,'Fern Donahue'),(65,'Paulo Sanchez'),(66,'Kyle Keegan'),(67,'Pamela Roy'),(68,'Evan Roy'),(69,'Yanna Roy'),(70,'Tasha Roy'),(71,'Jane Fulton'),(72,'Oprah Winfrey'),(73,'marketing and development officer of Ontario Reads'),(75,'\"hungry people\" (57)'),(76,'children in the community'),(77,'Clara\'s dad (name?)'),(78,'\"a flurry of children\" (60)'),(79,'\"three toddlers\" (60)'),(80,'\"their parents\" (60)'),(81,'\"the school-agers\" (61)'),(82,'\"the parents\" (61)'),(83,'Principal Sankiewicz'),(84,'Justin Bieber'),(85,'Cole Hester'),(86,'Aiden Redden'),(87,'Mrs Emerson'),(88,'the children on the bus'),(89,'the bus driver'),(90,'\"one of the Vietnamese ladies at the counter\" (67)'),(91,'\"a white lady\" at the nail salon (68)'),(92,'Ivana'),(93,'men who \"come here for tugs\" (69)'),(94,'\"Mitchell next door\" (72)'),(95,'\"his friends who came over\" (72)'),(96,'Victor'),(97,'Richard'),(98,'\"nosy people\" (73)'),(99,'\"old ladies\" (73)'),(100,'\"Maurie, the bus driver\" (74)'),(101,'\"Ada, the palm reader\" (74)'),(102,'\"Cindy, the puppy mill lady\" (74)'),(103,'Eunice (Cindy\'s dog)'),(104,'\"a cop\" (74)'),(105,'\"the people sitting across from him\" (73)'),(106,'an orangutan named Clementine (in story)'),(107,'the orangutan\'s mother (in story)'),(108,'\"white kids\" (77)'),(109,'white kids\' grandparents (77)'),(110,'\"chubby white boy with red hair\" (77)'),(111,'\"his grandma\" (78)'),(112,'\"white lady wearing a muumuu\" (78)'),(113,'\"some man wearing a UFC bandana\" (79)'),(114,'\"smiling black women in shower caps\" (79)'),(115,'the cashier (dollar store)'),(116,'the manager (dollar store)'),(117,'\"a man with a basket of party favours\" (79)'),(118,'\"niece\" (80)'),(119,'\"the rest of the line\" (80)'),(120,'\"the lady in front of us\" (80)'),(121,'Winsum'),(122,'Melvin'),(123,'person on the phone with Winsum'),(124,'n****rs'),(125,'Peter'),(126,'\"four gangly teens\" (84)'),(127,'P*kis/\"towelheads\"'),(128,'\"a few folks\" (84)'),(129,'Cory\'s father'),(130,'\"all the children sitting cross legged\" (85)'),(131,'Laura\'s classmates'),(132,'\"a teacher\" (87)'),(133,'\"several toddlers\" (87)'),(134,'a caregiver'),(135,'a baby'),(136,'Tito Ferdie (Bing\'s uncle)'),(137,'Mother Mary'),(138,'American Idol judges'),(139,'Priests'),(140,'Yanna Knowles'),(141,'Sonia DiSorono'),(142,'Anna Maria De Souza'),(143,'Reese Knowles'),(144,'Luka DiSorono'),(145,'Benjamin Tate'),(146,'Paula Santiago'),(147,'Winston Dunst'),(148,'NDP Party'),(149,'Liberal Party'),(150,'Raj (Hina\'a cousin)'),(151,'Hina\'s family'),(152,'union representative'),(153,'South Asians'),(154,'children\'s choir'),(155,'kids in the gifted program'),(156,'arts kids'),(157,'\"some lawyer on TV\" (103)'),(158,'kids in Mrs. Finnegan\'s class'),(159,'\"spies disguised as waiters\" (on TV)(105)'),(160,'Hakim'),(161,'farmers'),(162,'\"a young girl named Samantha\" (108)'),(163,'\"the zookeeper\" (in story) (108)'),(164,'\"fat kids\" (108)'),(165,'Blackfoot Indigenous group'),(166,'Roy (Christy\'s boyfriend)'),(167,'the Creator'),(168,'\"all the girls on the playground\" (113)'),(169,'\"families with lighter skin\" (113)'),(170,'\"two whole parents with two whole jobs\" (113)'),(171,'\"we the brown kids\" (114)'),(172,'\"our fathers\" (114)'),(173,'\"one and one-half parents\" (114)'),(174,'\"siblings from different dads\" (114)'),(175,'\"our grandmothers\" (114)');
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
) ENGINE=InnoDB AUTO_INCREMENT=618 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menExs`
--

LOCK TABLES `menExs` WRITE;
/*!40000 ALTER TABLE `menExs` DISABLE KEYS */;
INSERT INTO `menExs` VALUES (3,2,6,3,2,1,9,11),(4,0,6,4,2,1,9,9),(5,0,3,4,2,1,9,11),(6,0,3,8,2,1,11,11),(7,0,6,8,2,1,11,11),(8,0,3,9,2,1,11,11),(9,2,8,9,2,1,11,11),(10,0,6,9,2,1,11,11),(11,2,11,10,4,1,19,21),(12,0,10,13,4,1,19,19),(13,0,11,13,4,1,19,19),(14,0,10,12,4,1,19,19),(15,0,11,12,4,1,19,19),(16,2,14,11,4,1,19,20),(17,0,14,12,4,1,19,19),(18,2,15,14,4,1,20,20),(19,1,15,16,4,1,20,20),(20,0,14,16,4,1,20,20),(21,0,10,15,4,1,20,20),(22,0,10,14,4,1,19,20),(23,0,11,15,4,1,20,20),(24,2,18,17,4,1,21,21),(25,0,10,17,4,0,21,21),(26,0,10,18,4,0,21,21),(27,0,11,17,4,0,21,21),(28,0,11,18,4,0,21,21),(29,2,11,16,4,1,22,24),(30,0,16,12,4,1,22,24),(31,2,14,16,4,1,22,23),(32,0,16,15,4,1,22,23),(33,0,10,15,4,0,22,23),(34,0,11,15,4,0,22,23),(35,0,10,14,4,1,22,23),(36,0,11,14,4,1,22,23),(37,0,10,12,4,1,22,24),(38,0,11,12,4,1,22,24),(39,0,10,19,4,1,24,24),(40,0,10,20,4,1,24,24),(41,2,10,11,4,1,25,25),(42,0,10,13,4,1,25,26),(43,0,11,13,4,1,25,25),(44,0,10,21,4,1,25,26),(45,0,10,23,4,0,25,25),(46,0,10,22,4,1,25,25),(47,0,10,11,4,1,26,30),(48,0,10,19,4,1,26,26),(49,0,10,12,4,1,26,26),(50,0,10,24,4,1,26,27),(51,0,11,24,4,1,26,26),(52,2,11,24,4,1,27,27),(53,0,10,12,4,1,27,27),(54,0,10,26,4,1,27,30),(55,0,10,27,4,1,27,30),(56,2,26,27,4,1,27,29),(57,2,26,11,4,1,27,30),(58,0,26,13,4,1,29,29),(59,0,11,13,4,1,29,29),(60,0,10,13,4,1,29,29),(61,2,11,27,4,1,30,30),(62,0,10,24,4,1,30,30),(64,0,10,12,4,1,30,30),(65,2,29,28,6,1,35,40),(66,0,28,31,6,1,35,36),(67,0,28,32,6,0,35,35),(68,0,29,32,6,1,35,35),(69,0,29,30,6,1,35,35),(70,0,29,30,6,1,35,36),(71,2,29,30,6,1,36,36),(72,0,30,33,6,1,36,36),(73,1,28,33,6,0,36,36),(74,1,29,33,6,0,36,36),(75,0,29,34,6,1,36,36),(76,0,28,34,6,1,36,36),(77,1,29,31,6,0,36,36),(78,0,28,35,6,0,37,37),(79,1,28,36,6,0,37,37),(80,0,29,35,6,1,37,37),(81,1,29,36,6,0,37,37),(82,2,29,37,6,1,37,37),(83,0,28,37,6,1,37,37),(84,0,28,38,6,1,39,40),(85,0,29,38,6,1,39,40),(86,0,39,38,6,1,39,39),(87,2,39,28,6,1,39,40),(88,2,39,29,6,1,39,40),(89,2,41,5,8,1,13,15),(90,0,41,42,8,1,14,14),(91,1,5,42,8,0,14,14),(92,0,5,29,5,1,31,31),(93,0,5,28,5,1,31,31),(94,0,5,11,5,1,31,31),(95,0,5,10,5,1,31,31),(96,0,5,12,5,1,31,33),(97,0,5,51,5,1,31,32),(98,0,5,11,5,1,33,33),(99,0,5,28,5,1,33,33),(100,0,5,44,5,1,31,31),(101,0,5,43,5,1,31,31),(102,0,5,47,5,1,31,31),(103,0,5,45,5,1,31,31),(104,0,5,46,5,1,31,31),(105,0,5,48,5,1,31,31),(106,0,5,53,5,1,31,31),(107,0,5,49,5,1,31,31),(108,0,5,50,5,1,31,31),(109,0,5,52,5,1,32,32),(110,0,5,47,5,1,33,33),(112,0,5,57,5,1,32,32),(113,0,4,40,7,1,41,41),(114,2,6,4,7,1,41,41),(115,0,6,3,7,1,41,41),(116,0,4,3,7,1,41,41),(117,2,4,58,7,1,41,42),(118,0,58,6,7,1,41,42),(119,0,58,3,7,1,41,42),(120,2,4,3,7,1,42,42),(121,0,4,6,7,1,42,42),(122,0,3,6,7,1,42,42),(123,1,4,59,7,0,42,42),(124,0,4,28,7,1,43,43),(125,0,4,60,7,1,43,43),(126,0,4,29,7,1,43,43),(127,0,4,40,7,1,44,44),(128,2,4,4,7,1,44,46),(129,2,4,3,7,1,45,45),(130,0,4,28,7,1,45,45),(131,0,4,29,7,1,45,45),(132,0,3,28,7,1,45,45),(133,0,3,29,7,1,45,45),(134,2,3,61,7,1,45,47),(135,0,4,6,7,1,46,46),(136,0,4,3,7,1,43,44),(137,0,4,3,7,1,46,49),(138,1,4,62,7,0,47,47),(139,0,4,5,7,1,47,48),(140,2,5,3,7,1,48,48),(141,0,5,3,7,1,49,49),(142,2,5,4,7,1,49,49),(143,0,4,63,7,1,49,49),(144,0,61,3,7,1,45,47),(145,0,5,4,9,1,50,50),(146,0,5,3,9,1,50,50),(147,0,5,29,9,1,50,50),(148,0,5,28,9,1,50,52),(149,0,5,47,9,1,50,50),(150,0,5,46,9,1,50,50),(151,0,5,49,9,1,50,50),(152,0,5,48,9,1,50,50),(153,0,5,53,9,1,50,50),(154,0,5,50,9,1,50,50),(155,0,5,64,9,1,50,50),(156,0,5,65,9,1,50,50),(157,0,5,66,9,1,50,50),(158,0,5,10,9,1,50,51),(159,0,5,12,9,1,50,50),(160,0,5,68,9,1,50,50),(161,0,5,69,9,1,50,50),(162,0,5,70,9,1,50,50),(163,0,5,44,9,1,50,50),(164,0,5,45,9,1,50,50),(165,0,5,51,9,1,50,50),(166,0,5,11,9,1,50,50),(167,0,5,67,9,1,50,50),(168,0,5,43,9,1,50,50),(169,0,5,31,9,1,52,52),(170,0,28,31,9,1,52,52),(171,0,5,4,9,1,52,52),(172,0,5,3,5,1,52,52),(173,2,71,5,10,1,54,55),(174,2,5,71,9,1,50,53),(175,2,5,71,5,1,31,34),(176,0,71,73,10,1,54,54),(177,1,5,73,10,1,54,54),(178,2,5,71,11,1,55,56),(179,1,71,72,10,0,55,55),(180,1,5,72,10,0,55,55),(181,1,5,42,11,1,55,55),(182,0,71,42,11,1,55,55),(183,0,41,57,8,0,13,14),(184,0,41,76,8,0,13,14),(185,1,5,76,8,0,13,14),(186,1,5,57,8,0,13,14),(187,0,5,76,5,0,31,33),(188,0,5,57,5,1,31,33),(189,0,5,76,9,0,50,51),(190,0,5,57,9,0,50,51),(191,0,5,57,10,0,54,55),(192,0,71,57,10,0,54,55),(193,0,71,76,10,0,54,55),(194,0,5,76,10,0,54,55),(195,0,5,57,11,0,55,56),(196,0,5,76,11,0,55,56),(197,0,71,76,4,0,55,56),(198,0,71,57,11,0,55,56),(199,2,71,5,12,1,56,57),(200,0,71,57,12,0,57,57),(201,0,5,57,12,0,57,57),(202,1,5,75,12,0,57,57),(203,1,71,75,12,0,57,57),(204,1,71,72,12,0,57,57),(205,1,5,72,12,0,57,57),(206,2,7,3,13,1,59,59),(207,2,10,7,13,1,59,60),(208,2,10,3,13,1,59,60),(209,0,10,11,13,1,59,59),(210,1,7,11,13,1,59,59),(211,1,3,11,13,1,59,59),(212,0,7,31,13,1,59,59),(213,0,10,31,13,1,59,59),(214,0,3,31,13,1,59,59),(215,1,10,77,13,0,60,60),(216,0,7,77,13,1,60,60),(217,0,3,78,13,0,60,60),(218,2,5,3,13,1,60,62),(219,0,3,79,13,0,60,60),(220,0,3,80,13,1,60,60),(221,0,5,79,13,1,60,60),(222,0,5,80,13,1,60,60),(223,0,5,81,13,1,61,61),(224,0,5,80,13,1,61,61),(225,0,82,81,13,1,61,61),(226,0,3,81,13,0,61,61),(227,0,3,80,13,0,61,61),(228,0,3,4,13,1,61,61),(229,0,5,4,13,1,61,61),(230,2,83,29,14,1,63,63),(231,2,86,28,14,1,63,63),(232,0,83,86,14,1,63,63),(233,0,83,28,14,1,63,65),(234,0,83,85,14,1,63,63),(235,1,28,84,14,0,63,63),(236,0,28,85,14,1,63,64),(237,0,28,29,14,1,63,63),(238,0,87,88,14,1,63,63),(239,0,28,88,14,1,63,64),(240,1,29,86,14,1,63,64),(241,1,29,85,14,1,63,64),(242,0,28,86,14,1,64,64),(243,2,10,88,14,1,64,64),(244,2,10,28,14,1,64,64),(245,0,28,87,14,1,63,65),(246,2,28,29,14,1,64,64),(247,0,28,89,14,1,64,64),(248,0,28,10,14,1,65,65),(249,0,28,29,14,1,65,65),(250,2,11,10,15,1,67,67),(251,0,10,24,15,1,67,67),(252,0,11,24,15,1,67,67),(253,0,10,27,15,1,67,68),(254,0,10,12,15,1,67,68),(255,0,11,27,15,1,67,67),(256,0,11,12,15,1,67,67),(257,0,10,28,15,1,67,67),(258,2,90,11,15,1,67,67),(259,0,10,90,15,1,67,67),(260,2,29,11,15,1,68,68),(261,0,11,28,15,1,68,68),(262,0,10,29,15,1,67,68),(263,0,10,11,15,1,68,69),(264,2,28,29,15,1,68,68),(265,0,28,91,15,1,68,68),(266,0,10,91,15,1,68,68),(267,0,29,91,15,1,68,68),(268,0,10,92,15,1,68,68),(269,0,28,92,15,1,68,68),(270,2,92,28,15,1,69,69),(271,2,92,10,15,1,69,69),(272,0,92,93,15,1,69,69),(273,2,10,28,15,1,68,68),(274,0,10,28,15,1,69,69),(275,0,10,12,15,1,69,74),(276,2,11,10,15,1,70,72),(277,0,11,12,15,1,70,70),(278,2,11,12,15,1,71,71),(279,0,10,27,15,1,72,72),(280,0,11,12,15,1,72,73),(281,0,11,27,15,1,73,73),(282,0,10,96,15,1,73,73),(283,0,10,94,15,1,72,74),(284,0,10,95,15,0,72,72),(285,0,94,95,15,1,72,72),(286,0,11,94,15,1,72,72),(287,0,10,97,15,1,73,73),(288,2,94,97,15,1,73,73),(289,0,10,59,15,0,73,73),(290,0,59,94,15,1,73,73),(291,0,59,96,15,1,73,73),(292,2,96,12,15,1,73,73),(293,2,11,96,15,1,73,73),(294,0,10,11,15,1,73,73),(295,0,96,99,15,1,73,73),(296,0,10,99,15,1,73,73),(297,0,10,100,15,1,73,74),(298,0,96,100,15,1,73,74),(299,0,96,105,15,1,73,73),(300,0,10,105,15,1,73,73),(301,0,96,101,15,1,74,74),(302,0,10,101,15,1,74,74),(303,2,96,10,15,1,74,74),(304,2,102,96,15,1,74,74),(305,0,10,102,15,1,74,74),(306,0,96,103,15,1,74,74),(307,0,10,103,15,1,74,74),(308,2,102,103,15,1,74,74),(309,0,96,12,15,1,74,74),(310,2,104,96,15,1,74,74),(311,0,96,59,15,1,74,74),(312,0,10,104,15,0,74,74),(313,0,10,59,15,0,74,74),(314,0,10,96,15,1,75,75),(315,2,10,25,15,1,75,77),(316,1,10,106,15,0,76,77),(317,1,25,106,15,0,76,77),(318,1,10,107,15,0,76,77),(319,1,25,107,15,0,76,77),(320,0,10,11,15,1,77,78),(321,0,11,25,15,1,77,77),(322,0,10,24,15,1,77,79),(323,0,10,27,15,1,77,77),(324,1,10,108,15,0,77,77),(325,1,10,109,15,0,77,77),(326,0,110,111,15,1,78,78),(327,0,108,109,15,1,77,77),(328,0,10,111,15,0,78,78),(329,0,10,112,15,0,78,80),(330,0,24,112,15,0,79,80),(331,1,10,114,15,0,79,79),(332,0,10,113,15,0,79,80),(333,0,10,115,15,1,79,80),(334,0,24,113,15,0,79,80),(335,0,24,115,15,1,79,80),(336,2,115,116,15,1,79,79),(337,0,10,59,15,0,79,80),(338,0,24,59,15,0,79,80),(339,2,117,115,15,1,79,80),(340,0,24,117,15,1,79,80),(341,0,10,117,15,1,79,80),(342,2,119,115,15,1,80,80),(343,0,10,119,15,1,80,80),(344,2,116,119,15,1,80,80),(345,2,116,10,15,1,80,80),(346,2,116,24,15,1,80,80),(347,0,24,119,15,1,80,80),(348,0,119,59,15,0,80,80),(349,0,119,112,15,1,80,80),(350,0,119,113,15,1,80,80),(351,0,59,112,15,1,80,80),(352,0,59,113,15,1,80,80),(353,0,117,118,15,1,80,80),(354,1,10,118,15,0,80,80),(355,1,115,118,15,0,80,80),(356,2,120,119,15,1,80,80),(357,2,120,10,15,1,80,80),(358,2,120,24,15,1,80,80),(359,0,115,112,15,1,79,80),(360,0,115,113,15,1,79,80),(361,2,112,113,15,1,79,79),(362,1,24,118,15,0,80,80),(363,0,117,59,15,0,80,80),(364,2,121,4,16,1,81,82),(365,2,121,123,16,1,81,82),(366,0,4,3,16,1,81,82),(367,0,3,121,16,1,81,82),(368,1,4,123,16,0,81,82),(369,1,3,123,16,0,81,82),(370,1,123,122,16,1,82,82),(371,2,122,121,16,1,82,82),(372,0,4,122,16,1,82,82),(373,0,3,122,16,1,82,82),(374,2,3,4,16,1,83,83),(375,1,4,124,16,0,83,83),(376,1,3,124,16,0,83,83),(377,2,5,4,16,1,83,85),(378,0,5,3,16,1,83,85),(379,0,4,3,16,1,84,84),(380,1,4,127,16,0,84,84),(381,0,4,125,16,1,85,85),(382,0,4,128,16,1,84,84),(383,0,125,128,16,1,84,84),(384,0,4,126,16,1,84,84),(385,0,125,126,16,1,84,84),(386,2,125,4,15,1,84,84),(387,0,125,127,16,0,84,84),(388,0,126,127,16,0,84,84),(389,1,4,129,16,1,85,85),(390,2,4,3,16,1,85,85),(391,2,5,130,16,1,85,85),(392,0,4,130,16,1,85,85),(393,0,3,130,16,1,85,85),(394,0,3,131,17,1,87,87),(395,0,3,4,17,1,87,87),(396,0,3,7,17,1,87,87),(397,2,5,3,17,1,87,88),(398,0,3,83,17,1,87,87),(399,0,3,132,17,1,87,87),(400,0,3,133,17,0,87,87),(401,0,134,135,17,1,88,88),(402,0,3,135,17,0,88,88),(403,0,3,134,17,0,88,88),(404,0,28,38,18,1,89,91),(405,0,28,29,18,1,89,90),(406,0,28,37,18,1,89,89),(407,0,29,38,18,1,89,89),(408,0,28,136,18,1,89,89),(409,0,28,137,18,1,89,89),(410,0,28,36,18,0,90,91),(411,0,29,36,18,0,90,91),(412,0,28,138,18,0,91,91),(413,2,29,28,18,1,91,93),(414,0,28,139,18,0,91,91),(415,0,29,139,18,0,91,91),(416,2,28,10,18,1,92,92),(417,1,10,35,18,0,92,92),(418,1,10,37,18,0,92,92),(419,0,28,37,18,1,92,92),(420,0,28,35,18,1,92,92),(421,1,3,35,18,0,92,92),(422,2,3,28,18,1,92,92),(423,0,11,10,18,1,93,93),(424,2,11,3,18,1,93,93),(425,0,28,11,18,1,93,93),(426,0,29,11,18,1,93,93),(427,0,29,3,18,1,93,93),(428,0,29,10,18,1,93,93),(429,0,5,4,19,1,94,94),(430,2,5,71,19,1,94,96),(431,0,5,29,19,1,94,95),(432,0,5,64,19,1,94,94),(433,0,5,47,19,1,94,94),(434,0,5,11,19,1,94,94),(435,0,5,43,19,1,94,95),(436,0,5,140,19,1,94,94),(437,0,5,141,19,1,94,94),(438,0,5,142,19,1,94,94),(439,0,5,67,19,1,94,94),(440,0,5,3,19,1,94,95),(441,0,5,28,19,1,94,95),(442,0,5,46,19,1,94,95),(443,0,5,49,19,1,94,95),(444,0,5,48,19,1,94,95),(445,0,5,53,19,1,94,95),(446,0,5,65,19,1,94,95),(447,0,5,66,19,1,94,95),(448,0,5,10,19,1,94,95),(449,0,5,12,19,1,94,95),(450,0,5,44,19,1,94,95),(451,0,5,69,19,1,94,95),(452,0,5,143,19,1,94,95),(453,0,5,144,19,1,94,95),(454,0,5,145,19,1,94,95),(455,0,5,147,19,1,94,95),(456,0,5,146,19,1,94,95),(457,0,5,68,19,1,94,95),(458,0,5,70,19,1,94,95),(459,0,5,45,19,1,94,95),(460,0,5,21,19,1,95,95),(461,0,21,28,19,1,95,95),(462,0,5,31,19,1,95,95),(463,0,28,31,19,1,95,95),(464,0,10,3,19,1,95,95),(465,0,28,3,19,1,95,95),(466,0,28,10,19,1,95,95),(467,2,71,5,20,1,97,98),(468,1,71,4,20,0,97,97),(469,1,71,29,20,0,97,97),(470,1,71,47,20,0,97,97),(471,1,71,64,20,0,97,97),(472,1,71,11,20,0,97,97),(473,1,71,43,20,0,97,97),(474,1,71,140,20,0,97,97),(475,1,71,141,20,0,97,97),(476,1,71,142,20,0,97,97),(477,1,71,67,20,0,97,97),(478,1,71,3,20,0,97,97),(479,1,71,28,20,0,97,97),(480,1,71,46,20,0,97,97),(481,1,71,49,20,0,97,97),(482,1,71,48,20,0,97,97),(483,1,71,53,20,0,97,97),(484,1,71,65,20,0,97,97),(485,1,71,66,20,0,97,97),(486,1,71,10,20,0,97,97),(487,1,71,12,20,0,97,97),(488,1,71,45,20,0,97,97),(489,1,71,44,20,0,97,97),(490,1,71,143,20,0,97,97),(491,1,71,144,20,0,97,97),(492,1,71,147,20,0,97,97),(493,1,71,145,20,0,97,97),(494,1,71,146,20,0,97,97),(495,1,71,68,20,0,97,97),(496,1,71,69,20,0,97,97),(497,1,71,70,20,0,97,97),(498,1,71,21,19,0,95,95),(499,1,71,31,19,0,95,95),(500,0,71,148,20,0,97,97),(501,0,71,149,20,0,97,97),(502,0,71,76,20,0,98,98),(503,1,71,57,20,0,98,98),(504,1,71,150,20,0,97,97),(505,2,5,71,21,1,98,99),(506,0,5,151,21,1,98,98),(507,0,5,152,21,1,98,98),(508,1,71,151,21,0,98,98),(509,0,5,150,21,1,99,99),(510,1,71,150,21,0,99,99),(511,0,5,76,20,1,97,98),(512,0,5,57,20,1,97,98),(513,1,5,149,20,0,97,97),(514,1,5,148,20,0,97,97),(515,0,150,148,21,1,99,99),(516,1,5,153,21,0,99,99),(517,1,71,153,21,0,99,99),(518,1,71,72,20,0,98,98),(519,1,5,72,20,0,98,98),(520,2,10,28,23,1,103,104),(521,2,31,28,23,1,103,104),(522,0,10,31,23,1,103,103),(523,2,7,10,23,0,103,103),(524,0,7,31,23,1,103,103),(525,0,7,28,23,1,103,103),(526,0,7,77,23,1,103,103),(527,1,10,77,23,0,103,103),(528,1,28,77,23,1,103,103),(529,1,7,154,23,0,103,103),(530,1,7,155,23,0,103,103),(531,0,77,154,23,0,103,103),(532,1,77,155,23,0,103,103),(533,0,10,154,23,0,103,103),(534,1,10,155,23,0,103,1),(535,1,28,154,23,0,103,103),(536,1,28,155,23,0,103,103),(537,1,10,156,23,0,103,103),(538,0,7,156,23,1,103,103),(539,1,28,156,23,0,103,103),(540,0,77,156,23,0,103,103),(541,1,10,157,23,0,103,103),(542,2,158,31,23,1,104,104),(543,2,31,10,23,1,104,104),(544,0,28,29,23,1,104,104),(545,0,10,29,23,1,104,104),(546,0,10,158,23,1,104,104),(547,0,28,158,23,1,104,104),(548,0,10,11,23,1,104,104),(549,0,10,12,23,1,104,105),(550,2,10,7,23,1,105,105),(551,0,11,12,23,1,104,105),(552,1,10,159,23,0,105,105),(553,2,159,159,23,1,105,105),(554,0,10,5,23,1,105,105),(555,2,31,10,23,1,106,107),(556,0,10,28,23,1,106,106),(557,2,31,158,23,1,106,106),(558,2,160,31,23,1,106,106),(559,0,10,158,23,1,106,107),(560,0,10,160,23,1,106,106),(561,2,158,160,23,1,106,106),(562,2,11,10,23,1,105,105),(563,1,160,161,23,0,106,106),(564,1,158,161,23,0,106,107),(565,1,10,161,23,0,106,106),(566,2,10,28,23,1,107,108),(567,0,28,38,23,1,107,108),(568,0,28,29,23,1,107,107),(569,1,10,38,23,0,107,108),(570,0,10,29,23,1,107,107),(571,0,31,161,23,0,106,106),(572,0,29,38,23,1,107,108),(573,0,10,11,23,1,108,108),(574,0,28,31,23,1,108,108),(575,0,10,31,23,1,108,108),(576,2,10,25,23,1,108,112),(577,1,10,106,23,0,108,112),(578,1,25,106,23,0,108,111),(579,1,10,162,23,0,108,109),(580,1,25,162,23,0,108,109),(581,1,10,163,23,0,108,110),(582,1,25,163,23,0,108,109),(583,1,10,107,23,0,108,109),(584,1,25,107,23,0,108,109),(585,0,162,106,23,0,108,109),(586,0,106,107,23,1,108,110),(587,0,163,162,23,1,108,109),(588,0,163,107,23,1,109,110),(589,0,163,106,23,1,108,110),(590,0,10,164,23,0,108,108),(591,0,11,25,23,1,111,111),(592,2,11,10,23,1,111,111),(593,1,10,165,23,1,111,111),(594,1,25,165,23,1,111,111),(595,1,11,165,23,1,111,111),(596,0,25,166,23,1,111,112),(597,1,10,166,23,0,111,112),(598,0,28,160,24,1,113,115),(599,0,25,167,23,1,111,111),(600,1,10,167,23,0,111,111),(601,1,11,167,23,1,111,111),(602,2,7,28,24,1,113,113),(603,0,7,160,24,1,113,113),(604,0,160,168,24,1,113,113),(605,1,28,168,24,1,113,113),(606,0,28,34,24,1,113,113),(607,1,28,169,24,0,113,114),(608,1,28,170,24,0,113,114),(609,0,28,171,24,1,114,114),(610,0,171,172,24,1,114,114),(611,0,171,173,24,1,114,114),(612,0,171,174,24,1,114,114),(613,0,171,175,24,1,114,114),(614,1,28,173,24,0,114,114),(615,1,28,172,24,0,114,114),(616,1,28,174,24,0,114,114),(617,1,28,175,24,0,114,114);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narrContainers`
--

LOCK TABLES `narrContainers` WRITE;
/*!40000 ALTER TABLE `narrContainers` DISABLE KEYS */;
INSERT INTO `narrContainers` VALUES (2,'Laura (1) I',0,9,11,3,3,0),(3,'Fall',0,16,99,0,0,0),(4,'Sylvie (1) I',1,19,30,10,10,0),(5,'Daily Report: September 14, 2011',1,31,34,5,0,2),(6,'Bing (1) I',1,35,40,28,28,0),(7,'Cory (1) I',1,41,49,0,4,0),(8,'Ontario Reads Literacy Program, June 6, 2011',0,13,15,41,0,2),(9,'Daily Report: September 22, 2011',1,50,53,5,0,2),(10,'Jane Fulton <jfulton@ontarioreads.ca> September 22, 2011, 1:15 a.m.',1,54,55,71,0,2),(11,'Me <hhassani@ontarioreads.ca> September 22, 2011, 11:50 a.m.',1,55,56,5,0,2),(12,'Jane Fulton <jfulton@ontarioreads.ca> September 22, 2011, 2:30 p.m.',1,56,57,71,0,2),(13,'Laura (1) II',1,59,62,0,3,0),(14,'Bing (1) II',1,63,66,28,28,0),(15,'Sylvie (1) II',1,67,80,10,10,0),(16,'Cory (1) II',1,81,85,0,4,0),(17,'Laura (1) III',1,87,88,0,3,0),(18,'Bing (1) III',1,89,93,28,28,0),(19,'Daily Report: October 31st, 2011',1,94,96,5,5,2),(20,'Jane Fulton <jfulton@ontarioreads.ca> November 1st, 2011, 10:22am',1,97,98,71,0,2),(21,'Me <hhassani@ontarioreads.ca> November 1, 2011, 1:15pm',1,98,99,5,0,2),(22,'Winter',0,101,190,0,0,0),(23,'Sylvie (2) I',1,103,112,10,10,0),(24,'Bing (2) I',1,113,115,28,28,0);
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
