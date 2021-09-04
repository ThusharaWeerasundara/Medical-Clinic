-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbms_for_medical_clinic
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `attendent`
--

DROP TABLE IF EXISTS `attendent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendent` (
  `ATT_NIC` char(10) NOT NULL,
  `JOB_TYPE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ATT_NIC`),
  UNIQUE KEY `ATT_NIC_UNIQUE` (`ATT_NIC`),
  CONSTRAINT `ATT_NIC` FOREIGN KEY (`ATT_NIC`) REFERENCES `employee` (`NIC`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendent`
--

LOCK TABLES `attendent` WRITE;
/*!40000 ALTER TABLE `attendent` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chanell`
--

DROP TABLE IF EXISTS `chanell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chanell` (
  `P_NIC` char(10) NOT NULL,
  `D_NIC` char(10) NOT NULL,
  `COND_STATE` varchar(45) DEFAULT NULL,
  `CHAN_DATE` date DEFAULT NULL,
  PRIMARY KEY (`P_NIC`,`D_NIC`),
  KEY `D_NIC_idx` (`D_NIC`),
  CONSTRAINT `D_NIC` FOREIGN KEY (`D_NIC`) REFERENCES `doctor` (`DOC_NIC`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `P_NIC` FOREIGN KEY (`P_NIC`) REFERENCES `patient` (`P_NIC`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chanell`
--

LOCK TABLES `chanell` WRITE;
/*!40000 ALTER TABLE `chanell` DISABLE KEYS */;
INSERT INTO `chanell` VALUES ('097891237V','000000000V','Tooth cavity','2020-06-19');
/*!40000 ALTER TABLE `chanell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DEPT_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DEPT_NO` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ROOM_NO` int(11) DEFAULT NULL,
  `HOTLINE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`DEPT_NO`),
  UNIQUE KEY `DEPT_NO_UNIQUE` (`DEPT_NO`),
  UNIQUE KEY `HOTLINE_UNIQUE` (`HOTLINE`),
  UNIQUE KEY `ROOM_NO_UNIQUE` (`ROOM_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Dental','01',3,'0000112233'),('OPD','02',10,'0812345899'),('Eye Care','03',5,'0812345890');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `department_details`
--

DROP TABLE IF EXISTS `department_details`;
/*!50001 DROP VIEW IF EXISTS `department_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `department_details` AS SELECT 
 1 AS `Department`,
 1 AS `Room_location`,
 1 AS `Contact_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `DOC_NIC` char(10) NOT NULL,
  `SPECIALIZE_IN` varchar(30) DEFAULT NULL,
  `FEE` decimal(6,2) DEFAULT NULL,
  `HOSPITAL` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`DOC_NIC`),
  UNIQUE KEY `DOC_NIC_UNIQUE` (`DOC_NIC`),
  CONSTRAINT `DOC_NIC` FOREIGN KEY (`DOC_NIC`) REFERENCES `employee` (`NIC`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('000000000v','Dentist',500.00,'Kandy'),('000000001v','Fever',900.00,'Peradeniya'),('000000002v','Eye',1000.00,'Kadugannawa');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `FNAME` varchar(30) DEFAULT NULL,
  `MNAME` varchar(30) DEFAULT NULL,
  `LNAME` varchar(30) DEFAULT NULL,
  `NIC` char(10) NOT NULL,
  `PHONE` char(10) DEFAULT NULL,
  `EMER_CONTANCT` char(10) DEFAULT NULL,
  `HOME_NO` varchar(10) DEFAULT NULL,
  `STREET` varchar(45) DEFAULT NULL,
  `TOWN` varchar(45) DEFAULT NULL,
  `DEPT_NO` char(2) DEFAULT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`NIC`),
  UNIQUE KEY `NIC_UNIQUE` (`NIC`),
  KEY `DEPT_NO_idx` (`DEPT_NO`),
  CONSTRAINT `DEPT_NO` FOREIGN KEY (`DEPT_NO`) REFERENCES `department` (`DEPT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('x','y','z','000000000v','1234567890','0987654321','1','s','de','01',1000.00),('a','b','c','000000001v','1234267890','1234567823','3','d','dff','02',5000.00),('d','e','f','000000002v','1231231234','3213213211','45','wsds','sdsdf','03',600.00);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employeeview`
--

DROP TABLE IF EXISTS `employeeview`;
/*!50001 DROP VIEW IF EXISTS `employeeview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeeview` AS SELECT 
 1 AS `Fname`,
 1 AS `Lname`,
 1 AS `Contact_no`,
 1 AS `Dept_name`,
 1 AS `Room_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `guardian`
--

DROP TABLE IF EXISTS `guardian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardian` (
  `FNAME` varchar(20) DEFAULT NULL,
  `LNAME` varchar(20) DEFAULT NULL,
  `P_NIC` char(10) NOT NULL,
  `RELATION` varchar(15) DEFAULT NULL,
  `CON_NO` char(10) DEFAULT NULL,
  PRIMARY KEY (`P_NIC`),
  UNIQUE KEY `P_NIC_UNIQUE` (`P_NIC`),
  CONSTRAINT `PAT_NIC` FOREIGN KEY (`P_NIC`) REFERENCES `patient` (`P_NIC`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian`
--

LOCK TABLES `guardian` WRITE;
/*!40000 ALTER TABLE `guardian` DISABLE KEYS */;
INSERT INTO `guardian` VALUES ('Gayani','Siriwardhane','097891237V','Wife','0912344890'),('Gayan','Chandrasiri','961080193V','Brother','0756612111'),('Pasindu','Samarajeewa','961223198V','Friend','0981234567');
/*!40000 ALTER TABLE `guardian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `NURSE_NIC` char(10) NOT NULL,
  `RANK` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NURSE_NIC`),
  UNIQUE KEY `NURSE_NIC_UNIQUE` (`NURSE_NIC`),
  CONSTRAINT `NURSE_NIC` FOREIGN KEY (`NURSE_NIC`) REFERENCES `employee` (`NIC`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `FNAME` varchar(20) DEFAULT NULL,
  `MNAME` varchar(20) DEFAULT NULL,
  `LNAME` varchar(20) DEFAULT NULL,
  `P_NIC` char(10) NOT NULL,
  `CON_NO` char(10) DEFAULT NULL,
  PRIMARY KEY (`P_NIC`),
  UNIQUE KEY `P_NIC_UNIQUE` (`P_NIC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('Yasitha','Bandara','Herath','097891237V','0812345611'),('Thushara','Bandara','Weerasundara','961080193V','0718033173'),('Manjula','Kumara','Gunarathne','961223198V','0757789123');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patient_details`
--

DROP TABLE IF EXISTS `patient_details`;
/*!50001 DROP VIEW IF EXISTS `patient_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patient_details` AS SELECT 
 1 AS `Patient_Fname`,
 1 AS `Patient_Lname`,
 1 AS `Patient_contact`,
 1 AS `Guardian_Fname`,
 1 AS `Guardian_Lname`,
 1 AS `Guardian_contact`,
 1 AS `Relation`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'dbms_for_medical_clinic'
--

--
-- Dumping routines for database 'dbms_for_medical_clinic'
--
/*!50003 DROP PROCEDURE IF EXISTS `fill_chanell` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fill_chanell`(pNIC char(10), dNIC char(10), con varchar(45))
BEGIN
DECLARE tmpdate date;
set tmpdate = curdate();
INSERT INTO chanell(P_NIC, D_NIC, COND_STATE, CHAN_DATE)
VALUE (pNIC, dNIC, con, tmpdate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fill_doctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fill_doctor`(dNIC char(10), sp_IN varchar(30), fee decimal(6,2), hospital varchar(25))
BEGIN
INSERT INTO doctor(DOC_NIC, SPECIALIZE_IN, FEE, HOSPITAL)
VALUE(dNIC, sp_IN, fee, hospital);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertIntoDepartment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertIntoDepartment`(IN Name VARCHAR(30 ),
										IN ID CHAR(3),
                                        IN ROOM INT,
                                        IN HOTLINE CHAR (10)
                                        
  )
BEGIN
INSERT INTO DEPARTMENT(DEPT_NAME,DEPT_NO,ROOM_NO,HOTLINE)
VALUE(NAME,ID,ROOM,HOTLINE);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertIntoEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertIntoEmployee`(IN FNAME VARCHAR(30),
									IN MNAME VARCHAR(30),
                                    IN LNAME VARCHAR(30),
                                    IN NIC CHAR(10),
                                    IN PHONE CHAR(10),
                                    IN EMERGENCY CHAR(10),
                                    IN HOME_NO VARCHAR(10),
                                    IN STREET VARCHAR(45),
                                    IN TOWN VARCHAR(45),
                                    IN DEPT_NO CHAR(2),
                                    IN SALARY DEC(8,2)
                                    
)
BEGIN
INSERT INTO EMPLOYEE
VALUES(FNAME,LNAME,NIC,PHONE,EMERGENCY,HOME_NO,STREET,TOWN,DEPT_NO,SALARY);





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `department_details`
--

/*!50001 DROP VIEW IF EXISTS `department_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `department_details` AS select `department`.`DEPT_NAME` AS `Department`,`department`.`ROOM_NO` AS `Room_location`,`department`.`HOTLINE` AS `Contact_no` from `department` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employeeview`
--

/*!50001 DROP VIEW IF EXISTS `employeeview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeeview` AS select `employee`.`FNAME` AS `Fname`,`employee`.`LNAME` AS `Lname`,`employee`.`PHONE` AS `Contact_no`,`department`.`DEPT_NAME` AS `Dept_name`,`department`.`ROOM_NO` AS `Room_no` from (`employee` join `department`) where (`employee`.`DEPT_NO` = `department`.`DEPT_NO`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_details`
--

/*!50001 DROP VIEW IF EXISTS `patient_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_details` AS select `patient`.`FNAME` AS `Patient_Fname`,`patient`.`LNAME` AS `Patient_Lname`,`patient`.`CON_NO` AS `Patient_contact`,`guardian`.`FNAME` AS `Guardian_Fname`,`guardian`.`LNAME` AS `Guardian_Lname`,`guardian`.`CON_NO` AS `Guardian_contact`,`guardian`.`RELATION` AS `Relation` from (`patient` join `guardian`) where (`patient`.`P_NIC` = `guardian`.`P_NIC`) */;
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

-- Dump completed on 2020-06-20  1:54:26
