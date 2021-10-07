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

-- Dump completed on 2019-11-28 20:03:11
