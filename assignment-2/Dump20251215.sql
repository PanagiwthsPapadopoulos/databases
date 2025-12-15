-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: filmclubsauthdb
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `active_club_members`
--

DROP TABLE IF EXISTS `active_club_members`;
/*!50001 DROP VIEW IF EXISTS `active_club_members`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `active_club_members` AS SELECT 
 1 AS `member_name`,
 1 AS `roleName`,
 1 AS `phoneNumber`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `actorID` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `TMDBLink` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`actorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'Divine','https://www.themoviedb.org/person/12052-divine'),(2,'Tab Hunter','https://www.themoviedb.org/person/3057-tab-hunter'),(3,'Edith Massey','https://www.themoviedb.org/person/12053-edith-massey'),(4,'Andrzej Seweryn','https://www.themoviedb.org/person/55196-andrzej-seweryn'),(5,'Jerzy Trela','https://www.themoviedb.org/person/92494-jerzy-trela'),(6,'Krystyna Janda','https://www.themoviedb.org/person/55198-krystyna-janda'),(7,'Graham Chapman','https://www.themoviedb.org/person/1064-graham-chapman'),(8,'John Cleese','https://www.themoviedb.org/person/1061-john-cleese'),(9,'Eric Idle','https://www.themoviedb.org/person/1062-eric-idle'),(10,'Michael Palin','https://www.themoviedb.org/person/383-michael-palin'),(11,'Sumi Shimamoto','https://www.themoviedb.org/person/19586-sumi-shimamoto'),(12,'Goro Naya','https://www.themoviedb.org/person/19587-goro-naya'),(13,'Yoji Matsuda','https://www.themoviedb.org/person/19588-yoji-matsuda'),(14,'Mink Stole','https://www.themoviedb.org/person/12054-mink-stole'),(15,'Yoshiko Sakakibara','https://www.themoviedb.org/person/19589-yoshiko-sakakibara');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `belongs_to`
--

DROP TABLE IF EXISTS `belongs_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `belongs_to` (
  `memberID` int NOT NULL,
  `clubID` int NOT NULL,
  `roleName` varchar(45) NOT NULL,
  `isActive` tinyint NOT NULL,
  PRIMARY KEY (`memberID`,`clubID`,`roleName`),
  KEY `fk_Member_has_FilmClub_FilmClub1_idx` (`clubID`),
  KEY `fk_Member_has_FilmClub_Member1_idx` (`memberID`),
  CONSTRAINT `fk_Member_has_FilmClub_FilmClub1` FOREIGN KEY (`clubID`) REFERENCES `filmclub` (`clubID`),
  CONSTRAINT `fk_Member_has_FilmClub_Member1` FOREIGN KEY (`memberID`) REFERENCES `member` (`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belongs_to`
--

LOCK TABLES `belongs_to` WRITE;
/*!40000 ALTER TABLE `belongs_to` DISABLE KEYS */;
INSERT INTO `belongs_to` VALUES (1,1,'Casual member',0),(1,4,'Social media management',1),(2,1,'Casual member',0),(2,2,'Treasurer',0),(4,2,'IT',1),(5,3,'Treasurer',1),(6,4,'Treasurer',1),(7,5,'Casual member',1);
/*!40000 ALTER TABLE `belongs_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cast_list`
--

DROP TABLE IF EXISTS `cast_list`;
/*!50001 DROP VIEW IF EXISTS `cast_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cast_list` AS SELECT 
 1 AS `film_title`,
 1 AS `actor_name`,
 1 AS `characterName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentID` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'ECE'),(2,'MATH'),(3,'FILM'),(4,'PSY'),(5,'AGRO'),(6,'BIO'),(7,'POLSCI');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directed`
--

DROP TABLE IF EXISTS `directed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directed` (
  `directorID` int NOT NULL,
  `filmID` int NOT NULL,
  PRIMARY KEY (`directorID`,`filmID`),
  KEY `fk_Director_has_Film_Film1_idx` (`filmID`),
  KEY `fk_Director_has_Film_Director1_idx` (`directorID`),
  CONSTRAINT `fk_Director_has_Film_Director1` FOREIGN KEY (`directorID`) REFERENCES `director` (`directorID`),
  CONSTRAINT `fk_Director_has_Film_Film1` FOREIGN KEY (`filmID`) REFERENCES `film` (`filmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directed`
--

LOCK TABLES `directed` WRITE;
/*!40000 ALTER TABLE `directed` DISABLE KEYS */;
INSERT INTO `directed` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `directed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `directorID` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `TMDBLink` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`directorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Terry Gilliam','https://www.themoviedb.org/person/280-terry-gilliam'),(2,'John Waters','https://www.themoviedb.org/person/10367-john-waters'),(3,'Andrzej Å»uÅ‚awski','https://www.themoviedb.org/person/32082-andrzej-zulawski'),(4,'Terry Jones','https://www.themoviedb.org/person/10707-terry-jones'),(5,'Hayao Miyazaki','https://www.themoviedb.org/person/608');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `equipmentID` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `isPrivate` tinyint DEFAULT NULL,
  PRIMARY KEY (`equipmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'Projector 500 PRO',0),(2,'Chromebook A7',1),(3,'Speakers T2',0),(4,'Speakers S9',1),(5,'Popcorn machine',1);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `filmID` int NOT NULL,
  `TMDBLink` varchar(100) DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL,
  `year` smallint DEFAULT NULL,
  PRIMARY KEY (`filmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'https://www.themoviedb.org/movie/14269-polyester','Polyester',1981),(2,'https://www.themoviedb.org/movie/27072-na-srebrnym-globie','On The Silver Globe',1989),(3,'https://www.themoviedb.org/movie/762-monty-python-and-the-holy-grail','Monty Python and the Holy Grail',1975),(4,'https://www.themoviedb.org/movie/81','NausicaÃ¤ of the Valley of the Wind',1984),(5,'https://www.themoviedb.org/movie/99-todo-sobre-mi-madre','All About My Mother',1999);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filmclub`
--

DROP TABLE IF EXISTS `filmclub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filmclub` (
  `clubID` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `foundingDate` date NOT NULL,
  `isActive` tinyint DEFAULT NULL,
  `emailAddress` varchar(32) DEFAULT NULL,
  `instagramHandle` varchar(15) DEFAULT NULL,
  `facebookHandle` varchar(32) DEFAULT NULL,
  `departmentID` int NOT NULL,
  PRIMARY KEY (`clubID`),
  KEY `fk_FilmClub_Department1_idx` (`departmentID`),
  CONSTRAINT `fk_FilmClub_Department1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filmclub`
--

LOCK TABLES `filmclub` WRITE;
/*!40000 ALTER TABLE `filmclub` DISABLE KEYS */;
INSERT INTO `filmclub` VALUES (1,'11 kare','2011-01-01',0,'11.kare@proton.me','11ka.re','11kare Club',2),(2,'CineF.Hl','2015-01-01',1,'cinefhl@gmail.com','cinefhl','cinefhl',1),(3,'Nyxterides','2021-01-01',1,'cinematicbatts@gmail.com','cinematicbats','CinematicBats',3),(4,'Kin.O.Ge','2017-01-01',1,'','kin.o.ge','kinoyeah',5),(5,'CinePolsci','2006-01-01',1,'cinepolsci@yahoo.com','cinepolsci','CinePolsci',7);
/*!40000 ALTER TABLE `filmclub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `full_schedule`
--

DROP TABLE IF EXISTS `full_schedule`;
/*!50001 DROP VIEW IF EXISTS `full_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `full_schedule` AS SELECT 
 1 AS `screening_date`,
 1 AS `film_title`,
 1 AS `venue_name`,
 1 AS `club_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `languageID` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`languageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'English'),(2,'Polish'),(3,'Japanese'),(4,'Spanish');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `memberID` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `phoneNumber` char(10) DEFAULT NULL,
  `instagramHandle` varchar(15) DEFAULT NULL,
  `facebookHandle` varchar(15) DEFAULT NULL,
  `departmentID` int NOT NULL,
  PRIMARY KEY (`memberID`),
  KEY `fk_Member_Department1_idx` (`departmentID`),
  CONSTRAINT `fk_Member_Department1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'Kapetanios Antonis','6901234567','','',1),(2,'Kargiotis Alexandros','6970123456','','',1),(3,'Papadopoulos Panagiotis','6967012345','','',1),(4,'SpongeBob SquarePants','','bob_l_eponge','bob.a.la.mer',2),(5,'Squidward Tentacles','6956701234','c.tentacule','squid.ward1977',6),(6,'John Doe',NULL,NULL,NULL,3),(7,'Jane Doe',NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owns`
--

DROP TABLE IF EXISTS `owns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owns` (
  `clubID` int NOT NULL,
  `equipmentID` int NOT NULL,
  PRIMARY KEY (`clubID`,`equipmentID`),
  KEY `fk_FilmClub_has_Equipment_Equipment1_idx` (`equipmentID`),
  KEY `fk_FilmClub_has_Equipment_FilmClub1_idx` (`clubID`),
  CONSTRAINT `fk_FilmClub_has_Equipment_Equipment1` FOREIGN KEY (`equipmentID`) REFERENCES `equipment` (`equipmentID`),
  CONSTRAINT `fk_FilmClub_has_Equipment_FilmClub1` FOREIGN KEY (`clubID`) REFERENCES `filmclub` (`clubID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owns`
--

LOCK TABLES `owns` WRITE;
/*!40000 ALTER TABLE `owns` DISABLE KEYS */;
INSERT INTO `owns` VALUES (1,1),(3,2),(4,3),(5,3),(2,4),(3,4),(5,5);
/*!40000 ALTER TABLE `owns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `played_in`
--

DROP TABLE IF EXISTS `played_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `played_in` (
  `actorID` int NOT NULL,
  `filmID` int NOT NULL,
  `characterName` varchar(30) NOT NULL,
  PRIMARY KEY (`actorID`,`filmID`,`characterName`),
  KEY `fk_Actor_has_Film_Film1_idx` (`filmID`),
  KEY `fk_Actor_has_Film_Actor1_idx` (`actorID`),
  CONSTRAINT `fk_Actor_has_Film_Actor1` FOREIGN KEY (`actorID`) REFERENCES `actor` (`actorID`),
  CONSTRAINT `fk_Actor_has_Film_Film1` FOREIGN KEY (`filmID`) REFERENCES `film` (`filmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `played_in`
--

LOCK TABLES `played_in` WRITE;
/*!40000 ALTER TABLE `played_in` DISABLE KEYS */;
INSERT INTO `played_in` VALUES (1,1,'Francine Fishpaw'),(2,1,'Todd Tomorrow'),(3,1,'Cuddles Kovinsky'),(14,1,'Sandra Sullivan'),(4,2,'Marek'),(5,2,'Jerzy'),(6,2,'Aza'),(7,3,'King Arthur'),(8,3,'Sir Lancelot the Brave'),(9,3,'Sir Robin'),(10,3,'Sir Galahad the Pure'),(11,4,'NausicaÃ¤'),(12,4,'Lord Yupa'),(13,4,'Asbel'),(15,4,'Kushana');
/*!40000 ALTER TABLE `played_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `postID` int NOT NULL,
  `postLink` varchar(64) DEFAULT NULL,
  `platform` varchar(30) DEFAULT NULL,
  `screeningID` int NOT NULL,
  PRIMARY KEY (`postID`),
  KEY `fk_Post_Screening1_idx` (`screeningID`),
  CONSTRAINT `fk_Post_Screening1` FOREIGN KEY (`screeningID`) REFERENCES `screening` (`screeningID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,NULL,NULL,1),(2,'https://www.facebook.com/events/755358554836683','Facebook',2),(3,'https://www.facebook.com/events/633610693729895','Facebook',3),(4,'https://www.facebook.com/events/2463886400367375','Facebook',4),(5,'https://www.facebook.com/events/1163365242132480','Facebook',4);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `clubID` int NOT NULL,
  `screeningID` int NOT NULL,
  PRIMARY KEY (`clubID`,`screeningID`),
  KEY `fk_FilmClub_has_Screening_Screening1_idx` (`screeningID`),
  KEY `fk_FilmClub_has_Screening_FilmClub1_idx` (`clubID`),
  CONSTRAINT `fk_FilmClub_has_Screening_FilmClub1` FOREIGN KEY (`clubID`) REFERENCES `filmclub` (`clubID`),
  CONSTRAINT `fk_FilmClub_has_Screening_Screening1` FOREIGN KEY (`screeningID`) REFERENCES `screening` (`screeningID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (2,1),(1,2),(3,3),(4,3),(5,4),(2,5);
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screening`
--

DROP TABLE IF EXISTS `screening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screening` (
  `screeningID` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `venueID` int NOT NULL,
  PRIMARY KEY (`screeningID`),
  KEY `fk_Screening_Venue1_idx` (`venueID`),
  CONSTRAINT `fk_Screening_Venue1` FOREIGN KEY (`venueID`) REFERENCES `venue` (`venueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screening`
--

LOCK TABLES `screening` WRITE;
/*!40000 ALTER TABLE `screening` DISABLE KEYS */;
INSERT INTO `screening` VALUES (1,'2019-03-22 20:00:00',2),(2,'2019-04-10 22:00:00',3),(3,'2019-10-01 21:30:00',3),(4,'2019-10-03 00:00:00',1),(5,'2019-10-07 21:00:00',5);
/*!40000 ALTER TABLE `screening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows` (
  `screeningID` int NOT NULL,
  `filmID` int NOT NULL,
  PRIMARY KEY (`screeningID`,`filmID`),
  KEY `fk_Screening_has_Film_Film1_idx` (`filmID`),
  KEY `fk_Screening_has_Film_Screening1_idx` (`screeningID`),
  CONSTRAINT `fk_Screening_has_Film_Film1` FOREIGN KEY (`filmID`) REFERENCES `film` (`filmID`),
  CONSTRAINT `fk_Screening_has_Film_Screening1` FOREIGN KEY (`screeningID`) REFERENCES `screening` (`screeningID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES (1,1),(3,2),(2,4),(4,5),(5,5);
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spoken_in`
--

DROP TABLE IF EXISTS `spoken_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spoken_in` (
  `languageID` int NOT NULL,
  `filmID` int NOT NULL,
  PRIMARY KEY (`languageID`,`filmID`),
  KEY `fk_Language_has_Film_Film1_idx` (`filmID`),
  KEY `fk_Language_has_Film_Language1_idx` (`languageID`),
  CONSTRAINT `fk_Language_has_Film_Film1` FOREIGN KEY (`filmID`) REFERENCES `film` (`filmID`),
  CONSTRAINT `fk_Language_has_Film_Language1` FOREIGN KEY (`languageID`) REFERENCES `language` (`languageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spoken_in`
--

LOCK TABLES `spoken_in` WRITE;
/*!40000 ALTER TABLE `spoken_in` DISABLE KEYS */;
INSERT INTO `spoken_in` VALUES (1,1),(2,2),(1,3),(3,4),(4,5);
/*!40000 ALTER TABLE `spoken_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uses`
--

DROP TABLE IF EXISTS `uses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uses` (
  `equipmentID` int NOT NULL,
  `screeningID` int NOT NULL,
  PRIMARY KEY (`equipmentID`,`screeningID`),
  KEY `fk_Equipment_has_Screening_Screening1_idx` (`screeningID`),
  KEY `fk_Equipment_has_Screening_Equipment1_idx` (`equipmentID`),
  CONSTRAINT `fk_Equipment_has_Screening_Equipment1` FOREIGN KEY (`equipmentID`) REFERENCES `equipment` (`equipmentID`),
  CONSTRAINT `fk_Equipment_has_Screening_Screening1` FOREIGN KEY (`screeningID`) REFERENCES `screening` (`screeningID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uses`
--

LOCK TABLES `uses` WRITE;
/*!40000 ALTER TABLE `uses` DISABLE KEYS */;
INSERT INTO `uses` VALUES (4,1),(1,2),(2,3),(4,3),(2,4),(5,5);
/*!40000 ALTER TABLE `uses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue` (
  `venueID` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `details` text,
  `departmentID` int NOT NULL,
  PRIMARY KEY (`venueID`),
  KEY `fk_Venue_Department1_idx` (`departmentID`),
  CONSTRAINT `fk_Venue_Department1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES (1,'Valenti','Faculty of Engineering 1 st wing 1st floor.',1),(2,'Arch Amphitheatre','Faculty of Engineering 1 st wing 3rd floor.',2),(3,'A5','Faculty of Engineering 3 rd wing 2nd floor.',1),(4,'Engineering patio','Faculty of Engineering.',1),(5,'Amphitheatre C','',7);
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `active_club_members`
--

/*!50001 DROP VIEW IF EXISTS `active_club_members`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `active_club_members` AS select `m`.`name` AS `member_name`,`b`.`roleName` AS `roleName`,`m`.`phoneNumber` AS `phoneNumber` from ((`member` `m` join `belongs_to` `b` on((`m`.`memberID` = `b`.`memberID`))) join `filmclub` `fc` on((`b`.`clubID` = `fc`.`clubID`))) where (`b`.`isActive` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cast_list`
--

/*!50001 DROP VIEW IF EXISTS `cast_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cast_list` AS select `f`.`title` AS `film_title`,`a`.`name` AS `actor_name`,`p`.`characterName` AS `characterName` from ((`film` `f` join `played_in` `p` on((`f`.`filmID` = `p`.`filmID`))) join `actor` `a` on((`p`.`actorID` = `a`.`actorID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `full_schedule`
--

/*!50001 DROP VIEW IF EXISTS `full_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `full_schedule` AS select `s`.`date` AS `screening_date`,`f`.`title` AS `film_title`,`v`.`name` AS `venue_name`,`fc`.`name` AS `club_name` from (((((`screening` `s` join `venue` `v` on((`s`.`venueID` = `v`.`venueID`))) join `shows` `sh` on((`s`.`screeningID` = `sh`.`screeningID`))) join `film` `f` on((`sh`.`filmID` = `f`.`filmID`))) join `schedules` `sch` on((`s`.`screeningID` = `sch`.`screeningID`))) join `filmclub` `fc` on((`sch`.`clubID` = `fc`.`clubID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-15 20:26:00
