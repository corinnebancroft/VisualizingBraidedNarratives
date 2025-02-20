-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 24, 2024 at 06:21 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33
DROP
DATABASE IF EXISTS `DB_NAME`;
CREATE
DATABASE `DB_NAME`;
USE
`DB_NAME`;
SET
SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET
time_zone = "+00:00";
SET
foreign_key_checks = 0;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DB_NAME`
--

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--
-- INSERT INTO `characters` (`character_id`, `character_name`) VALUES (0, `[NULL]`)
CREATE TABLE `characters`
(
    `character_id`   int(11) NOT NULL AUTO_INCREMENT,
    `character_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `characters` (`character_id`, `character_name`) VALUES
(0,	'[NULL]');

-- --------------------------------------------------------

--
-- Table structure for table `containerLevels`
--

CREATE TABLE `containerLevels`
(
    `containerLevel_id`   int(11) NOT NULL AUTO_INCREMENT,
    `containerLevel_term` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`containerLevel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `containerLevels`
--

INSERT INTO `containerLevels` (`containerLevel_id`, `containerLevel_term`)
VALUES (1, 'level 2 (sub-section)'),
       (2, 'level 3 (sub-sub-section)'),
       (3, 'level 4 (sub-sub-sub-section)'),
       (4, 'level 5 (sub-sub-sub-sub-section)'),
       (0, 'level 1 (section)');

-- --------------------------------------------------------

--
-- Table structure for table `embeddedContainerTypes`
--

CREATE TABLE `embeddedContainerTypes`
(
    `embeddedContainerType_id`   int(11) NOT NULL AUTO_INCREMENT,
    `embeddedContainerType_term` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`embeddedContainerType_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `embeddedContainerTypes`
--

INSERT INTO `embeddedContainerTypes` (`embeddedContainerType_id`, `embeddedContainerType_term`) VALUES
(0,	'[NULL]'),
(1,	'Diary'),
(2,	'Letter'),
(3,	'Novel'),
(4,	'Oral Story'),
(5,	'Poem'),
(6,	'Play'),
(7,	'Short story'),
(8,	'Creative non-fiction');


-- --------------------------------------------------------

--
-- Table structure for table `isReciprocals`
--

CREATE TABLE `isReciprocals`
(
    `isReciprocal_id`   int(11) NOT NULL AUTO_INCREMENT,
    `isReciprocal_text` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`isReciprocal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `isReciprocals`
--

INSERT INTO `isReciprocals` (`isReciprocal_id`, `isReciprocal_text`)
VALUES (0, 'FALSE isReciprocal'),
       (1, 'TRUE isReciprocal');

-- --------------------------------------------------------

--
-- Table structure for table `menExs`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `menExs`
--

-- --------------------------------------------------------

--
-- Table structure for table `menOrExs`
--

CREATE TABLE `menOrExs`
(
    `menOrEx_id`   int(11) NOT NULL,
    `menOrEx_text` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`menOrEx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menOrExs`
--

INSERT INTO `menOrExs` (`menOrEx_id`, `menOrEx_text`)
VALUES (0, 'Knows'),
       (1, 'Knows of'),
       (2, 'Exchange');

-- --------------------------------------------------------

--
-- Table structure for table `narratorTypes`
--

CREATE TABLE `narratorTypes`
(
    `narratorType_id`   int(11) NOT NULL,
    `narratorType_term` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`narratorType_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `narratorTypes`
--

INSERT INTO `narratorTypes` (`narratorType_id`, `narratorType_term`)
VALUES (0, 'Character narrator'),
       (1, 'Non-character narrator');

-- --------------------------------------------------------

--
-- Table structure for table `narrContainers`
--

CREATE TABLE `narrContainers`
(
    `narrContainer_id`                          int(11) NOT NULL AUTO_INCREMENT,
    `narrContainer_title`                       varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
    `narrContainer_level_id_fk`                 int(11) NOT NULL,
    `narrContainer_startPage`                   int(11) NOT NULL,
    `narrContainer_endPage`                     int(11) NOT NULL,
    `narrContainer_narrator_character_id_fk`    int(11) NOT NULL,
    `narrContainer_protagonist_id_fk`           int(11) DEFAULT NULL,
    `narrContainer_embeddedContainerType_id_fk` int(11) DEFAULT NULL,
    PRIMARY KEY (`narrContainer_id`),
    KEY                                         `narrContainer_startPage` (`narrContainer_startPage`),
    KEY                                         `narrContainer_endPage` (`narrContainer_endPage`),
    KEY                                         `narrContainer_level_id_fk` (`narrContainer_level_id_fk`),
    KEY                                         `narrContainer_protagonist_id_fk` (`narrContainer_protagonist_id_fk`),
    KEY                                         `narrContainer_narrator_character_id_fk` (`narrContainer_narrator_character_id_fk`),
    CONSTRAINT `narrContainers_ibfk_1` FOREIGN KEY (`narrContainer_level_id_fk`) REFERENCES `containerLevels` (`containerLevel_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `narrContainers_ibfk_2` FOREIGN KEY (`narrContainer_narrator_character_id_fk`) REFERENCES `characters` (`character_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `narrContainers_ibfk_3` FOREIGN KEY (`narrContainer_protagonist_id_fk`) REFERENCES `characters` (`character_id`) ON DELETE RESTRICT ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



ALTER TABLE `characters`
    MODIFY `character_id` int (11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `containerLevels`
--
ALTER TABLE `containerLevels`
    MODIFY `containerLevel_id` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


--
-- AUTO_INCREMENT for table `menOrExs`
--
ALTER TABLE `menOrExs`
    MODIFY `menOrEx_id` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `narratorTypes`
--
ALTER TABLE `narratorTypes`
    MODIFY `narratorType_id` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


COMMIT;



CREATE USER IF NOT EXISTS 'THE_ADMIN_USER'@'%' IDENTIFIED BY 'THE_ADMIN_USER_PWORD';
CREATE USER IF NOT EXISTS 'THE_READER_USER'@'%' IDENTIFIED BY 'THE_READER_USER_PWORD';

GRANT USAGE, SELECT, LOCK TABLES, SHOW VIEW ON `THE_DB_NAME`.* TO `THE_READER_USER`@`%`; -- also needs LOCK TABLES
GRANT USAGE, SELECT, INSERT, UPDATE, DELETE, INDEX, CREATE TEMPORARY TABLES, CREATE VIEW, SHOW VIEW ON `THE_DB_NAME`.* TO `THE_ADMIN_USER`@`%`;
GRANT GRANT OPTION ON `THE_DB_NAME`.* TO 'THE_ADMIN_USER'@'%';