-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: cricket_academy
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach` (
  `user_id` varchar(12) NOT NULL,
  `role` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES ('coach001','Bowling Coach'),('coach003','Fielding Coach'),('coach004','All-Rounder Coach'),('coach005','All-Rounder Coach'),('coach006','Wicket Keeping Coach'),('coach007','Batting Coach'),('coach009','All-Rounder Coach'),('coach010','Batting Coach'),('coach011','Bowling Coach');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_players`
--

DROP TABLE IF EXISTS `coach_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach_players` (
  `player_user_id` varchar(12) NOT NULL,
  `coach_user_id` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`player_user_id`),
  KEY `coach_user_id` (`coach_user_id`),
  CONSTRAINT `coach_players_ibfk_1` FOREIGN KEY (`coach_user_id`) REFERENCES `coach` (`user_id`),
  CONSTRAINT `coach_players_ibfk_2` FOREIGN KEY (`player_user_id`) REFERENCES `player` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_players`
--

LOCK TABLES `coach_players` WRITE;
/*!40000 ALTER TABLE `coach_players` DISABLE KEYS */;
INSERT INTO `coach_players` VALUES ('player006','coach001'),('player007','coach004'),('player003','coach005'),('player001','coach006'),('player002','coach007'),('player004','coach010'),('player005','coach010');
/*!40000 ALTER TABLE `coach_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `user_id` varchar(12) NOT NULL,
  `role` varchar(30) DEFAULT NULL,
  `batting_style` varchar(30) DEFAULT NULL,
  `bowling_style` varchar(30) DEFAULT NULL,
  `coach_id` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `coach_id` (`coach_id`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `player_ibfk_2` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('player001','Wicket Keeper Batsman','Right Handed Batsman','None','coach006'),('player002','Batsman','Right Handed Batsman','Righ Arm Offbreak','coach007'),('player003','Batsman','Right Handed Batsman','Left Arm Orthodox','coach005'),('player004','Batsman','Right Handed Batsman','None','coach010'),('player005','Batsman','Right Handed Batsman','Right Arm Medium','coach010'),('player006','Bowler','Right Handed Batsman','Right Arm Medium Fast','coach001'),('player007','All-Rounder','Right Handed Batsman','Right Arm Legbreak','coach004');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `user_id` varchar(12) NOT NULL,
  `designation` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('staff001','Owner'),('staff002','Manager'),('staff003','Ground Cleaner'),('staff004','Umpire'),('staff005','Head of Security');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics` (
  `player_user_id` varchar(12) NOT NULL,
  `innings` int(10) DEFAULT NULL,
  `runs_scored` int(100) DEFAULT NULL,
  `balls_faced` int(100) DEFAULT NULL,
  `batting_average` float DEFAULT NULL,
  `strike_rate` float DEFAULT NULL,
  `dismissals` int(10) DEFAULT NULL,
  `wickets` int(10) DEFAULT NULL,
  `over_bowled` int(10) DEFAULT NULL,
  `runs_conceived` int(100) DEFAULT NULL,
  `economy` float DEFAULT NULL,
  PRIMARY KEY (`player_user_id`),
  UNIQUE KEY `player_user_id` (`player_user_id`),
  CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`player_user_id`) REFERENCES `player` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES ('player001',44,1639,1271,37.25,128.954,38,1,2,22,11),('player002',68,2620,2029,38.5294,129.128,34,4,13,85,6.53846),('player003',58,1253,951,21.6034,131.756,13,0,1,12,12),('player004',19,406,316,21.3684,128.481,12,0,1,6,6),('player005',34,432,320,12.7059,135,23,0,1,9,9),('player006',17,119,63,7,188.889,32,60,179,1359,7.59218),('player007',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(12) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(6) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('coach001','Shoaib Akhtar','coach','pindiexpress123@gmail.com','2001-08-13','Pakistan',20,'0000'),('coach003','Imran Khan','coach','primeministerofpakistan@gmail.com','1952-03-01','Pakistan',69,'0000'),('coach004','Shahid Khan Afridi','coach','lala@gmail.com','1975-03-01','Pakistan',46,'0000'),('coach005','Yuvraj Singh','coach','yuvican@gmail.com','1981-12-12','India',40,'0000'),('coach006','Mahinder Singh Dhoni','coach','captaincool@gmail.com','1981-07-07','India',40,'0000'),('coach007','Ab De Villiars','coach','mr360@yahoo.com','1984-02-17','South Africa',37,'0000'),('coach009','Muhammad Hafeez','coach','professor@cust.edu.pk','1980-10-18','Pakistan',41,'0000'),('coach010','Christopher Henry Gayle','coach','championchampion@gmail.com','1979-10-21','West Indies',42,'0000'),('coach011','Wasim Akram','coach','swingkasultan@gmail.com','1966-06-03','Pakistan',55,'0000'),('player001','Mohammad Rizwan','player','rizwan123@gmail.com','1992-06-01','Pakistan',29,'0000'),('player002','Babar Azam','player','babarsher@gmail.com','1994-10-15','Pakistan',27,'0000'),('player003','Fakhar Zaman','player','fakharchampiontrophy@gmail.com','1990-04-10','Pakistan',31,'0000'),('player004','Haider Ali','player','haider007@gmail.com','2000-10-02','Pakistan',21,'0000'),('player005','Asif Ali','player','AsifaG@gmail.com','1991-10-01','Pakistan',30,'0000'),('player006','Hasan Ali','player','generator@icloud.com','1994-07-02','Pakistan',27,'0000'),('player007','Shadab Khan','player','sheeda@gmail.com','1998-10-04','Pakistan',23,'0000'),('staff001','Muhammad Harris','staff','harris20014@gmail.com','2001-11-24','Pakistan',20,'0000'),('staff002','Umer Ahmed','staff','Umer123@gmail.com','2001-05-26','Pakistan',20,'0000'),('staff003','Zohaib Malik','staff','zohaib234@gmail.com','2001-11-04','Pakistan',20,'0000'),('staff004','Ali Kumail','staff','komal123@gmail.com','2002-07-11','Pakistan',19,'0000'),('staff005','Fouzan Sohail','staff','fouzan21@gmail.com','2001-11-11','Pakistan',20,'0000');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-03 16:02:26
