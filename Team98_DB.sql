CREATE DATABASE  IF NOT EXISTS `team98` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `team98`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: team98
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`username`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('cool_class4400');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `comName` varchar(40) NOT NULL,
  PRIMARY KEY (`comName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('4400 Theater Company'),('AI Theater Company'),('Awesome Theater Company'),('EZ Theater Company');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('calcultron'),('calcultron2'),('calcwizard'),('clarinetbeast'),('cool_class4400'),('DNAhelix'),('does2Much'),('eeqmcsquare'),('entropyRox'),('fullMetal'),('georgep'),('ilikemoney$$'),('imready'),('isthisthekrustykrab'),('notFullMetal'),('programerAAL'),('RitzLover28'),('thePiGuy3.14'),('theScienceGuy');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customercreditcard`
--

DROP TABLE IF EXISTS `customercreditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customercreditcard` (
  `creditCardNum` char(16) NOT NULL,
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`creditCardNum`),
  KEY `username` (`username`),
  CONSTRAINT `customercreditcard_ibfk_1` FOREIGN KEY (`username`) REFERENCES `customer` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customercreditcard_chk_1` CHECK ((length(`creditCardNum`) = 16))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customercreditcard`
--

LOCK TABLES `customercreditcard` WRITE;
/*!40000 ALTER TABLE `customercreditcard` DISABLE KEYS */;
INSERT INTO `customercreditcard` VALUES ('1111111111000000','calcultron'),('1111111100000000','calcultron2'),('1111111110000000','calcultron2'),('1111111111100000','calcwizard'),('2222222222000000','cool_class4400'),('2220000000000000','DNAhelix'),('2222222200000000','does2Much'),('2222222222222200','eeqmcsquare'),('2222222222200000','entropyRox'),('2222222222220000','entropyRox'),('1100000000000000','fullMetal'),('1111111111110000','georgep'),('1111111111111000','georgep'),('1111111111111100','georgep'),('1111111111111110','georgep'),('1111111111111111','georgep'),('2222222222222220','ilikemoney$$'),('2222222222222222','ilikemoney$$'),('9000000000000000','ilikemoney$$'),('1111110000000000','imready'),('1110000000000000','isthisthekrustykrab'),('1111000000000000','isthisthekrustykrab'),('1111100000000000','isthisthekrustykrab'),('1000000000000000','notFullMetal'),('2222222000000000','programerAAL'),('3333333333333300','RitzLover28'),('2222222220000000','thePiGuy3.14'),('2222222222222000','theScienceGuy');
/*!40000 ALTER TABLE `customercreditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerviewmovie`
--

DROP TABLE IF EXISTS `customerviewmovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerviewmovie` (
  `creditCardNum` char(16) NOT NULL,
  `thName` varchar(30) NOT NULL,
  `comName` varchar(30) NOT NULL,
  `movName` varchar(200) NOT NULL,
  `movReleaseDate` date NOT NULL,
  `movPlayDate` date NOT NULL,
  PRIMARY KEY (`creditCardNum`,`thName`,`comName`,`movName`,`movReleaseDate`,`movPlayDate`),
  KEY `thName` (`thName`,`comName`,`movName`,`movReleaseDate`,`movPlayDate`),
  CONSTRAINT `customerviewmovie_ibfk_1` FOREIGN KEY (`creditCardNum`) REFERENCES `customercreditcard` (`creditCardNum`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customerviewmovie_ibfk_2` FOREIGN KEY (`thName`, `comName`, `movName`, `movReleaseDate`, `movPlayDate`) REFERENCES `movieplay` (`thName`, `comName`, `movName`, `movReleaseDate`, `movPlayDate`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customerviewmovie_chk_1` CHECK ((length(`creditCardNum`) = 16))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerviewmovie`
--

LOCK TABLES `customerviewmovie` WRITE;
/*!40000 ALTER TABLE `customerviewmovie` DISABLE KEYS */;
INSERT INTO `customerviewmovie` VALUES ('1111111111111111','Cinema Star','4400 Theater Company','How to Train Your Dragon','2010-03-21','2010-04-02'),('1111111111111111','Main Movies','EZ Theater Company','How to Train Your Dragon','2010-03-21','2010-03-22'),('1111111111111111','Main Movies','EZ Theater Company','How to Train Your Dragon','2010-03-21','2010-03-23'),('1111111111111100','Star Movies','EZ Theater Company','How to Train Your Dragon','2010-03-21','2010-03-25');
/*!40000 ALTER TABLE `customerviewmovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `username` varchar(30) NOT NULL,
  `employeeType` varchar(30) NOT NULL,
  KEY `username` (`username`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('cool_class4400','Admin'),('entropyRox','Manager'),('fatherAI','Manager'),('georgep','Manager'),('calcultron','Manager'),('imbatman','Manager'),('ghcghc','Manager'),('radioactivePoRa','Manager'),('manager1','Manager'),('manager2','Manager'),('manager3','Manager'),('manager4','Manager');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `username` varchar(30) NOT NULL,
  `comName` varchar(30) NOT NULL,
  `manStreet` varchar(30) NOT NULL,
  `manCity` varchar(30) NOT NULL,
  `manState` char(2) NOT NULL,
  `manZipcode` char(5) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `manStreet` (`manStreet`,`manCity`,`manState`,`manZipcode`),
  KEY `comName` (`comName`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`username`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manager_ibfk_2` FOREIGN KEY (`comName`) REFERENCES `company` (`comName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('calcultron','EZ Theater Company','123 Peachtree St','Atlanta','GA','30308'),('entropyRox','4400 Theater Company','200 Cool Place','San Francisco','CA','94016'),('fatherAI','EZ Theater Company','456 Main St','New York','NY','10001'),('georgep','4400 Theater Company','10 Pearl Dr','Seattle','WA','98105'),('ghcghc','AI Theater Company','100 Pi St','Pallet Town','KS','31415'),('imbatman','Awesome Theater Company','800 Color Dr','Austin','TX','78653'),('manager1','4400 Theater Company','123 Ferst Drive','Atlanta','GA','30332'),('manager2','AI Theater Company','456 Ferst Drive','Atlanta','GA','30332'),('manager3','4400 Theater Company','789 Ferst Drive','Atlanta','GA','30332'),('manager4','4400 Theater Company','000 Ferst Drive','Atlanta','GA','30332'),('radioactivePoRa','4400 Theater Company','100 Blu St','Sunnyvale','CA','94088');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `movName` varchar(200) NOT NULL,
  `movReleaseDate` date NOT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`movName`,`movReleaseDate`),
  CONSTRAINT `movie_chk_1` CHECK ((`duration` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES ('4400 The Movie','2019-08-12',130),('Avengers: Endgame','2019-04-26',181),('Calculus Returns: A ML Story','2019-09-19',314),('George P Burdell\'s Life Story','1927-08-12',100),('Georgia Tech The Movie','1985-08-13',100),('How to Train Your Dragon','2010-03-21',98),('Spaceballs','1987-06-24',96),('Spider-Man: Into the Spider-Verse','2018-12-01',117),('The First Pokemon Movie','1998-07-19',75),('The King\'s Speech','2010-11-26',119);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movieplay`
--

DROP TABLE IF EXISTS `movieplay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movieplay` (
  `thName` varchar(30) NOT NULL,
  `comName` varchar(30) NOT NULL,
  `movName` varchar(200) NOT NULL,
  `movReleaseDate` date NOT NULL,
  `movPlayDate` date NOT NULL,
  PRIMARY KEY (`thName`,`comName`,`movName`,`movReleaseDate`,`movPlayDate`),
  KEY `comName` (`comName`,`thName`),
  KEY `movName` (`movName`,`movReleaseDate`),
  CONSTRAINT `movieplay_ibfk_1` FOREIGN KEY (`comName`, `thName`) REFERENCES `theater` (`comName`, `thName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movieplay_ibfk_2` FOREIGN KEY (`movName`, `movReleaseDate`) REFERENCES `movie` (`movName`, `movReleaseDate`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movieplay`
--

LOCK TABLES `movieplay` WRITE;
/*!40000 ALTER TABLE `movieplay` DISABLE KEYS */;
INSERT INTO `movieplay` VALUES ('Cinema Star','4400 Theater Company','4400 The Movie','2019-08-12','2019-09-12'),('Cinema Star','4400 Theater Company','George P Burdell\'s Life Story','1927-08-12','2010-05-20'),('Cinema Star','4400 Theater Company','Georgia Tech The Movie','1985-08-13','2019-09-30'),('Cinema Star','4400 Theater Company','How to Train Your Dragon','2010-03-21','2010-04-02'),('Cinema Star','4400 Theater Company','Spaceballs','1987-06-24','2000-02-02'),('Cinema Star','4400 Theater Company','The King\'s Speech','2010-11-26','2019-12-20'),('ML Movies','AI Theater Company','Calculus Returns: A ML Story','2019-09-19','2019-10-10'),('ML Movies','AI Theater Company','Calculus Returns: A ML Story','2019-09-19','2019-12-30'),('ML Movies','AI Theater Company','Spaceballs','1987-06-24','2010-04-02'),('ML Movies','AI Theater Company','Spaceballs','1987-06-24','2023-01-23'),('ML Movies','AI Theater Company','Spider-Man: Into the Spider-Verse','2018-12-01','2019-09-30'),('ABC Theater','Awesome Theater Company','4400 The Movie','2019-08-12','2019-10-12'),('ABC Theater','Awesome Theater Company','Georgia Tech The Movie','1985-08-13','1985-08-13'),('ABC Theater','Awesome Theater Company','The First Pokemon Movie','1998-07-19','2018-07-19'),('Main Movies','EZ Theater Company','George P Burdell\'s Life Story','1927-08-12','2019-07-14'),('Main Movies','EZ Theater Company','George P Burdell\'s Life Story','1927-08-12','2019-10-22'),('Main Movies','EZ Theater Company','How to Train Your Dragon','2010-03-21','2010-03-22'),('Main Movies','EZ Theater Company','How to Train Your Dragon','2010-03-21','2010-03-23'),('Main Movies','EZ Theater Company','Spaceballs','1987-06-24','1999-06-24'),('Main Movies','EZ Theater Company','The King\'s Speech','2010-11-26','2019-12-20'),('Star Movies','EZ Theater Company','4400 The Movie','2019-08-12','2019-08-12'),('Star Movies','EZ Theater Company','How to Train Your Dragon','2010-03-21','2010-03-25');
/*!40000 ALTER TABLE `movieplay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater` (
  `thName` varchar(30) NOT NULL,
  `comName` varchar(30) NOT NULL,
  `capacity` int(11) NOT NULL,
  `thStreet` varchar(30) NOT NULL,
  `thCity` varchar(30) NOT NULL,
  `thState` char(2) NOT NULL,
  `thZipcode` char(5) NOT NULL,
  `manUsername` varchar(30) NOT NULL,
  PRIMARY KEY (`comName`,`thName`),
  UNIQUE KEY `manUsername` (`manUsername`),
  CONSTRAINT `theater_ibfk_1` FOREIGN KEY (`comName`) REFERENCES `company` (`comName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `theater_ibfk_2` FOREIGN KEY (`manUsername`) REFERENCES `manager` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `theater_chk_1` CHECK ((`Capacity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES ('Cinema Star','4400 Theater Company',4,'100 Cool Place','San Francisco','CA','94016','entropyRox'),('Jonathan\'s Movies','4400 Theater Company',2,'67 Pearl Dr','Seattle','WA','98101','georgep'),('Star Movies','4400 Theater Company',5,'4400 Rocks Ave','Boulder','CA','80301','radioactivePoRa'),('ML Movies','AI Theater Company',3,'314 Pi St','Pallet Town','KS','31415','ghcghc'),('ABC Theater','Awesome Theater Company',5,'880 Color Dr','Austin','TX','73301','imbatman'),('Main Movies','EZ Theater Company',3,'123 Main St','New York','NY','10001','fatherAI'),('Star Movies','EZ Theater Company',2,'745 GT St','Atlanta','GA','30332','calcultron');
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `status` enum('Pending','Declined','Approved') NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `userType` varchar(30) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `user_chk_1` CHECK ((length(`password`) > 7))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('calcultron','Approved','333333333','Dwight','Schrute','Employee, Customer'),('calcultron2','Approved','444444444','Jim','Halpert','Customer'),('calcwizard','Approved','222222222','Issac','Newton','Customer'),('clarinetbeast','Declined','999999999','Squidward','Tentacles','Customer'),('cool_class4400','Approved','333333333','A. TA','Washere','Employee, Customer'),('DNAhelix','Approved','777777777','Rosalind','Franklin','Customer'),('does2Much','Approved','1212121212','Carl','Gauss','Customer'),('eeqmcsquare','Approved','111111110','Albert','Einstein','Customer'),('entropyRox','Approved','999999999','Claude','Shannon','Employee, Customer'),('fatherAI','Approved','222222222','Alan','Turing','Employee'),('fullMetal','Approved','111111100','Edward','Elric','Customer'),('gdanger','Declined','555555555','Gary','Danger','User'),('georgep','Approved','111111111','George P.','Burdell','Employee, Customer'),('ghcghc','Approved','666666666','Grace','Hopper','Employee'),('ilikemoney$$','Approved','111111110','Eugene','Krabs','Customer'),('imbatman','Approved','666666666','Bruce','Wayne','Employee'),('imready','Approved','777777777','Spongebob','Squarepants','Customer'),('isthisthekrustykrab','Approved','888888888','Patrick','Star','Customer'),('manager1','Approved','1122112211','Manager','One','Employee'),('manager2','Approved','3131313131','Manager','Two','Employee'),('manager3','Approved','8787878787','Three','Three','Employee'),('manager4','Approved','5755555555','Four','Four','Employee'),('notFullMetal','Approved','111111100','Alphonse','Elric','Customer'),('programerAAL','Approved','3131313131','Ada','Lovelace','Customer'),('radioactivePoRa','Approved','1313131313','Marie','Curie','Employee'),('RitzLover28','Approved','444444444','Abby','Normal','Customer'),('smith_j','Pending','333333333','John','Smith','User'),('texasStarKarate','Declined','111111110','Sandy','Cheeks','User'),('thePiGuy3.14','Approved','1111111111','Archimedes','Syracuse','Customer'),('theScienceGuy','Approved','999999999','Bill','Nye','Customer');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uservisittheater`
--

DROP TABLE IF EXISTS `uservisittheater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uservisittheater` (
  `visitID` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `thName` varchar(30) NOT NULL,
  `comName` varchar(30) NOT NULL,
  `visitDate` date NOT NULL,
  PRIMARY KEY (`visitID`),
  KEY `username` (`username`),
  KEY `comName` (`comName`,`thName`),
  CONSTRAINT `uservisittheater_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uservisittheater_ibfk_2` FOREIGN KEY (`comName`, `thName`) REFERENCES `theater` (`comName`, `thName`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uservisittheater`
--

LOCK TABLES `uservisittheater` WRITE;
/*!40000 ALTER TABLE `uservisittheater` DISABLE KEYS */;
INSERT INTO `uservisittheater` VALUES (1,'georgep','Main Movies','EZ Theater Company','2010-03-22'),(2,'calcwizard','Main Movies','EZ Theater Company','2010-03-22'),(3,'calcwizard','Star Movies','EZ Theater Company','2010-03-22'),(4,'imready','Star Movies','EZ Theater Company','2010-03-22'),(5,'calcwizard','ML Movies','AI Theater Company','2010-03-22');
/*!40000 ALTER TABLE `uservisittheater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'team98'
--

--
-- Dumping routines for database 'team98'
--
/*!50003 DROP PROCEDURE IF EXISTS `admin_approve_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_approve_user`(IN i_username VARCHAR(30))
BEGIN
UPDATE User SET status = "Approved" 
WHERE username = i_username AND status != "Approved";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_create_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_create_mov`(IN i_movName VARCHAR(200), 
									IN i_movDuration INT,
									IN i_movReleaseDate DATE)
BEGIN
INSERT INTO Movie(movName,movReleaseDate,duration) 
VALUES (i_movName,i_movReleaseDate,i_movDuration);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_create_theater` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_create_theater`(IN i_thName VARCHAR(50), 
										IN i_comName VARCHAR(50),
										IN i_thStreet VARCHAR(50), 
                                        IN i_thCity VARCHAR(50), 
                                        IN i_thState CHAR(2),
                                        IN i_thZipcode CHAR(5), 
										IN i_capacity int, 
                                        IN i_managerUsername VARCHAR(50))
proc_label: BEGIN
	IF (i_managerUsername not in (select username from manager where comName = i_comName)) 
    THEN 
    SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Only manager working in the company is assigned';
    LEAVE proc_label;
    end if;
	INSERT INTO Theater (thName,comName, capacity, thStreet, thCity, thState, thZipcode, manUsername)
	VALUES (i_thName,i_comName, i_capacity, i_thStreet, i_thCity, i_thState, i_thZipcode, i_managerUsername);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_decline_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_decline_user`(IN i_username VARCHAR(30))
BEGIN
UPDATE User 
SET status = "Declined" 
WHERE username = i_username AND status = "Pending";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_filter_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_filter_company`(IN i_comName VARCHAR(50), IN i_minCity int, IN i_maxCity int, IN i_minTheater int, IN i_maxTheater int, 
IN i_minEmployee int, IN i_maxEmployee int, IN i_sortBy VARCHAR(50), IN i_sortDirection VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS AdFilterCom;
    IF (i_minCity is Null) THEN set i_minCity = 0; end if;
	IF (i_minTheater is Null) THEN set i_minTheater = 0; end if;    
	IF (i_minEmployee is Null) THEN set i_minEmployee = 0; end if;    
	IF (i_maxCity is Null) THEN set i_maxCity = 100000; end if;    
	IF (i_maxTheater is Null) THEN set i_maxTheater = 100000; end if;    
	IF (i_maxEmployee is Null) THEN set i_maxEmployee = 100000; end if;
	IF (i_comName = "") THEN set i_comName = "All"; end if;
    
    CREATE TABLE AdFilterCom
	select distinct(a.comName), b.numCityCover, c.numTheater, d.numEmployee from theater as a
	join (select comName, count(distinct thCity,thState,comName) as numCityCover 
			from theater group by comName having numCityCover between i_minCity and i_maxCity) as b on a.comName = b.comName 
	join (select comName, count(thName) as numTheater 
			from theater group by comName having numTheater between i_minTheater and i_maxTheater) as c on a.comName = c.comName 
	join (select comName, count(*) as numEmployee 
			from Manager group by comName having numEmployee between i_minEmployee and i_maxEmployee) as d on a.comName = d.comName
    WHERE 
        (a.comName = i_comName OR i_comName = "ALL" ) AND
        (b.comName = i_comName OR i_comName = "ALL" ) AND
        (c.comName = i_comName OR i_comName = "ALL" ) AND
        (d.comName = i_comName OR i_comName = "ALL" )
	
	Order by  
		(case when i_sortBy = "comName" and i_sortDirection = "ASC" then a.comName end) ASC,
		(case when i_sortBy = "numCityCover" and i_sortDirection = "ASC" then b.numCityCover end) ASC,
		(case when i_sortBy = "numTheater" and i_sortDirection = "ASC" then c.numTheater end) ASC,
		(case when i_sortBy = "numEmployee" and i_sortDirection = "ASC" then d.numEmployee end) ASC,
        (case when i_sortBy = "" and i_sortDirection = "ASC" then a.comName	end) ASC,
	
		(case when i_sortBy = "comName" and (i_sortDirection = "DESC" or i_sortDirection = "") then a.comName end) DESC,
		(case when i_sortBy = "numCityCover" and (i_sortDirection = "DESC" or i_sortDirection = "") then b.numCityCover end) DESC,
		(case when i_sortBy = "numTheater" and (i_sortDirection = "DESC" or i_sortDirection = "") then c.numTheater end) DESC,
		(case when i_sortBy = "numEmployee" and (i_sortDirection = "DESC" or i_sortDirection = "") then d.numEmployee end) DESC,
		(case when i_sortBy = "" and (i_sortDirection = "DESC" or i_sortDirection = "") then a.comName end) DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_filter_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_filter_user`(IN i_username VARCHAR(30), 
									IN i_status ENUM ("Approved", "Pending", "Declined", "ALL"), 
                                    IN i_sortBy VARCHAR(30), 
                                    IN i_sortDirection VARCHAR(30))
BEGIN
	DROP TABLE IF EXISTS AdFilterUser;
	CREATE TABLE AdFilterUser
	SELECT username, (select count(*) 
    FROM customercreditcard
    WHERE (customercreditcard.username = i_username OR (i_username = "" AND customercreditcard.username = user.username))) AS creditCardCount, 
    (CASE WHEN userType = "Employee, Customer" AND (Select employeeType from employee where user.username = employee.username) = "Admin" AND username = (Select username from employee where user.username = employee.username) THEN "CustomerAdmin"
    WHEN userType = "Employee, Customer" AND (Select employeeType from employee where user.username = employee.username) = "Manager" AND username = (Select username from employee where user.username = employee.username) THEN "CustomerManager"
    WHEN userType = "User" THEN "User"
	WHEN userType = "Customer" THEN "Customer"
    WHEN userType = "Employee" AND (Select employeeType from employee where user.username = employee.username) = "Manager" THEN "Manager"
    WHEN userType = "Employee" AND (Select employeeType from employee where user.username = employee.username) = "Admin" THEN "Admin"
    END) AS userType, status
	FROM user
    Where (user.username = i_username OR (i_username = "" AND username = username)) AND (status = i_status OR (i_status = "ALL" AND status = status))
    ORDER BY 
    (CASE WHEN i_sortBy = "creditCardCount" AND i_sortDirection = "ASC" THEN creditCardCount END) ASC,
    (CASE WHEN i_sortBy = "creditCardCount" AND i_sortDirection = "DESC" THEN creditCardCount END) DESC,
    (CASE WHEN i_sortBy = "username" AND i_sortDirection = "ASC" THEN user.username END) ASC,
    (CASE WHEN i_sortBy = "username" AND i_sortDirection = "DESC" THEN user.username END) DESC,
    (CASE WHEN i_sortBy = "userType" AND i_sortDirection = "ASC" THEN userType END) ASC,
    (CASE WHEN i_sortBy = "userType" AND i_sortDirection = "DESC" THEN userType END) DESC,
    (CASE WHEN i_sortBy = "status" AND i_sortDirection = "ASC" THEN status END) ASC,
    (CASE WHEN i_sortBy = "status" AND i_sortDirection = "DESC" THEN status END) DESC,
    (CASE WHEN i_sortBy = "" AND i_sortDirection = "ASC" THEN user.username END) ASC,
    (CASE WHEN i_sortBy = "" AND i_sortDirection = "DESC" THEN user.username END) DESC,
    (CASE WHEN i_sortBy = "" AND i_sortDirection = "" THEN user.username END) DESC,
    (CASE WHEN i_sortBy = "creditCardCount" AND i_sortDirection = "" THEN creditCardCount END) DESC,
    (CASE WHEN i_sortBy = "username" AND i_sortDirection = "" THEN user.username END) DESC,
    (CASE WHEN i_sortBy = "userType" AND i_sortDirection = "" THEN userType END) DESC,
    (CASE WHEN i_sortBy = "status" AND i_sortDirection = "" THEN status END) DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_view_comDetail_emp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_view_comDetail_emp`(IN i_comName VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS AdComDetailEmp;
    IF (i_comName = "") THEN set i_comName = "All"; end if;
    CREATE TABLE AdComDetailEmp
	SELECT firstname as empFirstname, lastname as empLastname
    FROM user where username in
   (SELECT username FROM manager where (comName = i_comName OR i_comName = "ALL"));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_view_comDetail_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_view_comDetail_th`(IN i_comName VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS AdComDetailTh;
    IF (i_comName = "") THEN set i_comName = "All"; end if;
    CREATE TABLE AdComDetailTh
	SELECT thName, manUsername as thManagerUsername, thCity, thState, capacity as thCapacity
    FROM theater WHERE (comName = i_comName OR i_comName = "ALL");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_add_creditcard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_add_creditcard`(IN i_username VARCHAR(30),
										 IN i_creditCardNum CHAR(16))
BEGIN
INSERT INTO CustomerCreditCard (creditCardNum, username)
SELECT i_creditCardNum as creditCardNum, i_username as username
From CustomerCreditCard
Where username = i_username
Having COUNT(*) < 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_filter_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_filter_mov`(IN i_movName VARCHAR(200), 
                                       IN i_comName VARCHAR(30), 
									   IN i_city VARCHAR(30), 
                                       IN i_state VARCHAR(3), 
                                       IN i_minMovPlayDate DATE, 
                                       IN i_maxMovPlayDate DATE)
BEGIN
	DROP TABLE IF EXISTS CosFilterMovie;
	CREATE TABLE CosFilterMovie
	SELECT m.movName, m.thName, t.thStreet, t.thCity, t.thState, 
		   t.thZipcode, t.comName, m.movPlayDate, m.movReleaseDate
	FROM MoviePlay as m, Theater as t
	WHERE
        t.thName = m.thName AND
        t.comName = m.comName AND
		(m.movName = i_movName OR i_movName = 'ALL') AND
		(t.comName = i_comName OR i_comName = 'ALL') AND	
        (thCity = i_city OR i_city = '') AND
        (thState = i_state OR i_state = '') AND
        (i_minMovPlayDate IS NULL OR movPlayDate >= i_minMovPlayDate) AND
 		(i_maxMovPlayDate IS NULL OR movPlayDate <= i_maxMovPlayDate) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_only_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_only_register`(IN i_username VARCHAR(30), 
										IN i_password VARCHAR(60), 
                                        IN i_firstname VARCHAR(30), 
                                        IN i_lastname VARCHAR(30))
BEGIN
INSERT INTO user(username, status, password, firstname, lastname, userType) 
VALUES (i_username, 'Pending', MD5(i_password), i_firstname, i_lastname, "Customer");
INSERT INTO customer(username) 
VALUES(i_username);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_view_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_view_history`(IN i_cusUsername VARCHAR(30))
BEGIN
	DROP TABLE IF EXISTS CosViewHistory;
	CREATE TABLE CosViewHistory
	SELECT movName, thName, comName, creditCardNum, movPlayDate
	FROM CustomerViewMovie WHERE creditCardNum in 
    (SELECT creditCardNum FROM CustomerCreditCard WHERE username= i_cusUsername);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_view_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_view_mov`(IN i_creditCardNum CHAR(16),
									 IN i_movName VARCHAR(200), 
									 IN i_movReleaseDate DATE, 
									 IN i_thName VARCHAR(30), 
									 IN i_comName VARCHAR(30), 
                                     IN i_movPlayDate DATE)
BEGIN
if (select count(*) from customerviewmovie where (movPlayDate = i_movPlayDate) and exists
(select creditCardNum from customercreditcard where username = (select username from customercreditcard where creditCardnum = i_creditCardNum))) < 3
then
	INSERT INTO CustomerViewMovie (creditCardNum, movName, movReleaseDate, thName, comName, movPlayDate)
	VALUES (i_creditCardNum, i_movName, i_movReleaseDate, i_thName, i_comName, i_movPlayDate);
else
		SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Customer cannot watch more than 3 movies per day';
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_customer_add_creditcard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_customer_add_creditcard`(IN i_username VARCHAR(30), 
												  IN i_creditCardNum CHAR(16))
BEGIN
INSERT INTO CustomerCreditCard (creditCardNum, username)
SELECT i_creditCardNum as creditCardNum, i_username as username
From CustomerCreditCard
Where username = i_username
Having Count(*) < 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_customer_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_customer_register`(IN i_username VARCHAR(30), 
										   IN i_password VARCHAR(60), 
                                           IN i_firstname VARCHAR(30), 
                                           IN i_lastname VARCHAR(30), 
                                           i_comName VARCHAR(30), 
                                           i_empStreet VARCHAR(30), 
                                           i_empCity VARCHAR(30), 
                                           i_empState CHAR(2), 
                                           i_empZipcode CHAR(5))
BEGIN
INSERT INTO user(username, password, firstname, lastname,userType) 
VALUES (i_username, MD5(i_password), i_firstname, i_lastname, "Employee, Customer");
INSERT INTO employee(username, employeeType)
VALUES (i_username, "Manager");
INSERT INTO manager(username, comName, manStreet, manCity, manState, manZipcode) 
VALUES (i_username, i_comName, i_empStreet, i_empCity, i_empState, i_empZipcode);
INSERT INTO customer(username) 
VALUES (i_username);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_filter_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_filter_th`(IN i_manUsername VARCHAR(30),IN i_movName VARCHAR(200),IN i_minMovDuration INT,
IN i_maxMovDuration INT,IN i_minMovReleaseDate DATE,IN i_maxMovReleaseDate DATE,IN i_minMovPlayDate DATE,IN i_maxMovPlayDate DATE,IN i_includeNotPlayed BOOLEAN)
BEGIN
DROP TABLE IF EXISTS ManFilterTh;
if (i_minMovDuration is null) then set i_minMovDuration = 0; end if;
if (i_minMovPlayDate is null) then set i_minMovPlayDate = "1000-01-01"; end if;
if (i_minMovReleaseDate is null) then set i_minMovReleaseDate = "1000-01-01"; end if;

if (i_maxMovDuration is null) then set i_maxMovDuration = 100000; end if;
if (i_maxMovPlayDate is null) then set i_maxMovPlayDate = "9999-12-31"; end if;
if (i_maxMovReleaseDate is null) then set i_maxMovReleaseDate = "9999-12-31"; end if;
if (i_movName = "") then set i_movName = "All"; end if;
if (i_includeNotPlayed is null) then set i_includeNotPlayed = false; end if;


if i_includeNotPlayed is false 
then
create table ManFilterTh
select a.movName, b.duration as movDuration, a.movReleaseDate, a.movPlayDate from movieplay as a join movie as b on a.movName = b.movName and a.movReleaseDate = b.movReleaseDate
where (a.movName = i_movName or i_movName = "all") and
(b.movName = i_movName or i_movName = "all") and
a.thName in (select thName from theater where manUsername = i_manUsername) and
(a.movPlayDate between i_minMovPlayDate and i_maxMovPlayDate ) and 
(a.movReleaseDate between i_minMovReleaseDate and i_maxMovReleaseDate) and 
(b.duration between i_minMovDuration and i_maxMovDuration)
union
select c.movName, c.duration, c.movReleaseDate, null as movPlayDate from movie as c 
where
c.movName not in (select movName from movieplay where thName = (select thName from theater where manUsername = i_manUsername)) and
(c.movName = i_movName or i_movName = "all") and
(c.movReleaseDate between i_minMovReleaseDate and i_maxMovReleaseDate) and
(c.duration between i_minMovDuration and i_maxMovDuration);
end if;

if i_includeNotPlayed is true
then
create table ManFilterTh
select c.movName, c.duration, c.movReleaseDate, null as movPlayDate from movie as c 
where
c.movName not in (select movName from movieplay where thName = (select thName from theater where manUsername = i_manUsername)) and
(c.movName = i_movName or i_movName = "all") and
(c.movReleaseDate between i_minMovReleaseDate and i_maxMovReleaseDate) and
(c.duration between i_minMovDuration and i_maxMovDuration);
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_only_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_only_register`(IN i_username VARCHAR(30), 
									   IN i_password VARCHAR(60), 
                                       IN i_firstname VARCHAR(30), 
                                       IN i_lastname VARCHAR(30), 
                                       i_comName VARCHAR(30), 
                                       i_empStreet VARCHAR(30), 
                                       i_empCity VARCHAR(30), 
                                       i_empState CHAR(2), 
                                       i_empZipcode CHAR(5))
BEGIN
INSERT INTO user(username, password, firstname, lastname, userType) 
	VALUES (i_username, MD5(i_password), i_firstname, i_lastname, "Employee");
INSERT INTO employee(username, employeeType)
	VALUES (i_username, "Manager");
INSERT INTO manager(username, comName, manStreet, manCity, manState, manZipcode)
	VALUES (i_username, i_comName, i_empStreet, i_empCity, i_empState, i_empZipcode);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_schedule_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_schedule_mov`(IN i_manUsername VARCHAR(30), 
									  IN i_movName VARCHAR(200), 
									  IN i_movReleaseDate DATE,
									  IN i_movPlayDate DATE)
BEGIN	 
DECLARE l_thName VARCHAR(30) ; 
DECLARE l_comName VARCHAR(30) ;
SELECT thName,comName into l_thName,l_comName
FROM Theater 
WHERE (manUsername = i_manUsername) AND (i_movReleaseDate < i_movPlayDate);
	INSERT INTO MoviePlay (thName, comName, movName, movReleaseDate, movPlayDate)
	VALUES (l_thName,l_comName,i_movName,i_movReleaseDate,i_movPlayDate);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_filter_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_filter_th`(IN i_thName VARCHAR(50), 
								  IN i_comName VARCHAR(50), 
                                  IN i_city VARCHAR(50), 
                                  IN i_state VARCHAR(3))
BEGIN
   DROP TABLE IF EXISTS UserFilterTh;
   CREATE TABLE UserFilterTh
SELECT thName, thStreet, thCity, thState, thZipcode, comName
   FROM Theater
   WHERE
(thName = i_thName OR i_thName = "ALL" OR i_thName = "") AND
       (comName = i_comName OR i_comName = "ALL" OR i_comName = "") AND
       (thCity = i_city OR i_city = "" OR i_city = "ALL") AND
       (thState = i_state OR i_state = "" or i_state = "ALL");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_filter_visitHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_filter_visitHistory`(IN i_username VARCHAR(30), 
											IN i_minVisitDate DATE, 
                                            IN i_maxVisitDate DATE)
BEGIN
   DROP TABLE IF EXISTS UserVisitHistory;
   CREATE TABLE UserVisitHistory
SELECT thName, thStreet, thCity, thState, thZipcode, comName, visitDate
   FROM UserVisitTheater
NATURAL JOIN
	Theater
WHERE
	(username = i_username) AND
	(i_minVisitDate IS NULL OR visitDate >= i_minVisitDate) AND
	(i_maxVisitDate IS NULL OR visitDate <= i_maxVisitDate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_login`(IN i_username VARCHAR(30),IN i_password VARCHAR(60))
BEGIN
DROP TABLE IF EXISTS UserLogin;
CREATE TABLE UserLogin
SELECT username, status, 
(CASE WHEN username in (SELECT username FROM customer where username = i_username) THEN 1 ELSE 0 END) AS isCustomer,
(CASE WHEN username in (SELECT username FROM admin where username = i_username) THEN 1 ELSE 0 END) AS isAdmin,
(CASE WHEN username in (SELECT username FROM manager where username = i_username) THEN 1 ELSE 0 END) AS isManager
FROM User 
WHERE username = i_username and (password) = MD5(i_password);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_register`(IN i_username VARCHAR(30), 
							   IN i_password VARCHAR(60), 
                               IN i_firstname VARCHAR(30), 
                               IN i_lastname VARCHAR(30))
BEGIN
INSERT INTO user(username, password, firstname, lastname, userType)
VALUES (i_username, MD5(i_password),i_firstname, i_lastname, "User");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_visit_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_visit_th`(IN i_thName VARCHAR(50), 
								 IN i_comName VARCHAR(50),
								 IN i_visitDate DATE, 
                                 IN i_username VARCHAR(50))
BEGIN
   INSERT INTO UserVisitTheater (thName, comName, visitDate, username)
   VALUES (i_thName, i_comName, i_visitDate, i_username);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-28 19:58:34
