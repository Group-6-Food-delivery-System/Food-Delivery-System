CREATE DATABASE  IF NOT EXISTS `food_delivery_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `food_delivery_system`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: food_delivery_system
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `idaddress` int NOT NULL AUTO_INCREMENT,
  `Number` int DEFAULT NULL,
  `Street` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `ZipCode` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`idaddress`),
  KEY `CustomerID2_idx` (`CustomerID`),
  CONSTRAINT `CustomerID2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='					';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (2,400,'W Main st','Los Angeles','CA',90007,1),(4,200,'S Boradway st','Los Angeles','CA',90008,2),(5,34,'S Olive St','Los Angeles','CA',90006,4),(6,345,'W Washington Blvd','Los Angeles','CA',90015,5),(7,45,'Harvard Blvd','Temecula','CA',90071,6),(8,23,'main st','Los Angeles','CA',90007,7),(9,1620,'W 3rd st','Los Angeles','CA',90007,15),(10,45,'W 6th st','Los Angeles','CA',90008,16),(11,100,'S 4th St','Los Angeles','CA',90005,17);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcardinfo`
--

DROP TABLE IF EXISTS `creditcardinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcardinfo` (
  `ccid` int NOT NULL AUTO_INCREMENT,
  `CardNumber` varchar(20) DEFAULT NULL,
  `Expiration` date DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`ccid`),
  KEY `CustID_idx` (`CustomerID`),
  CONSTRAINT `custID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcardinfo`
--

LOCK TABLES `creditcardinfo` WRITE;
/*!40000 ALTER TABLE `creditcardinfo` DISABLE KEYS */;
INSERT INTO `creditcardinfo` VALUES (1,'5467938465286483','2025-08-07',1),(2,'6543210','2021-06-08',2),(3,'6543210','2021-06-08',2),(4,'6543210','2021-06-08',3),(5,'6543210','2021-06-08',5),(6,'876890876','2030-09-09',6),(7,'123456','2022-06-04',7),(8,'564216789','2040-04-07',15),(9,'4564789864729','2023-06-05',16),(10,'4345728593048574','2026-09-06',17);
/*!40000 ALTER TABLE `creditcardinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `PhoneNumber` varchar(10) DEFAULT NULL,
  `EmailAddress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'abc','123456','abc@gmail.com'),(2,'defg','78910','def@gmail.com'),(3,'Harry Potter','123456','hp@hogwarts.com'),(4,'Sam','87654321','sk@gmail.com'),(5,'Steve Jobs','2134577384','sjobs@apple.com'),(6,'Test1','21345678','test1@gmai.com'),(7,'demo1','213456372','demo1@gmail.com'),(8,'Samia','948690369','sam@gmail.com'),(9,'Kamal','6364839','sk@yahoo.com'),(10,'Kamal','6364839','sk@yahoo.com'),(11,'Kamal','6364839','sk@yahoo.com'),(12,'sam','34566','sam@yahoo'),(13,'some person','93735482','sp@gmail.com'),(14,'','',''),(15,'testing','0000997654','test@yahoo.com'),(16,'test person2','213453793','tp2@gmail.com'),(17,'Testing Demo','323456387','td@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `DriverNumberID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `PhoneNumber` int DEFAULT NULL,
  `RegisteredCar` varchar(45) DEFAULT NULL,
  `LicenseID` varchar(45) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `AvailableHours` varchar(45) DEFAULT NULL,
  `TotalEarnings` decimal(5,2) DEFAULT NULL,
  `TotalRating` double DEFAULT NULL,
  PRIMARY KEY (`DriverNumberID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'John','123 Main St',2345678,'Toyota Prius','abc789',25,'Mon to Fri',15.00,3.4),(2,'Smith','345 S Broadway',3234567,'Honda Accord','f8349766',26,'Fri to Sat',15.00,3.25),(3,'Samia Kamal',' 21 s Harvard Dr',2125274829,'Honda Civic','F84879305',25,'Mon to Fri',0.00,0);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderDate` date DEFAULT NULL,
  `Amount` decimal(5,2) DEFAULT NULL,
  `Status` tinyint DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID_idx` (`CustomerID`),
  CONSTRAINT `CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2021-05-08',100.00,1,1),(2,'2021-05-09',50.00,1,1),(3,'2021-05-05',400.00,0,1),(4,'2021-05-09',45.00,0,1),(5,'2021-05-09',43.00,0,1),(6,'2021-06-07',70.00,0,2),(7,'2021-04-07',150.00,1,2),(8,'2021-05-11',50.00,0,1),(9,'2021-11-05',80.00,0,7),(10,'2021-11-05',45.00,1,16),(11,'2021-05-11',75.00,1,17);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_by_restaurant`
--

DROP TABLE IF EXISTS `order_by_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_by_restaurant` (
  `OrderID` int NOT NULL,
  `RestaurantID` int NOT NULL,
  PRIMARY KEY (`OrderID`,`RestaurantID`),
  KEY `RestaurantID_idx` (`RestaurantID`),
  CONSTRAINT `OrderID2` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RestaurantID` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`StoreID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_by_restaurant`
--

LOCK TABLES `order_by_restaurant` WRITE;
/*!40000 ALTER TABLE `order_by_restaurant` DISABLE KEYS */;
INSERT INTO `order_by_restaurant` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1);
/*!40000 ALTER TABLE `order_by_restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `StoreID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `BusinessHours` varchar(45) DEFAULT NULL,
  `Ratings` int DEFAULT NULL,
  PRIMARY KEY (`StoreID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'The Cheesecake Factory','1200 S Olympic','Mon to Sun',5);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `ReviewID` int NOT NULL AUTO_INCREMENT,
  `Comment` varchar(150) DEFAULT NULL,
  `Rating` double DEFAULT NULL,
  `DriverID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `DriverID2_idx` (`DriverID`),
  KEY `CustomerID_idx` (`CustomerID`),
  CONSTRAINT `custid2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `driverid2` FOREIGN KEY (`DriverID`) REFERENCES `driver` (`DriverNumberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (2,'jnsqidiqk',4,1,2),(3,'Good Service',5,1,1),(4,'Ok ',3,1,1),(5,'excellent',1,1,1),(6,'Good service',2,2,1),(7,'Good service',3,2,1),(8,'demo comment',5,2,2),(9,'comment1',3,2,1),(10,'Positive',4,1,17);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `TrackingNo` int NOT NULL AUTO_INCREMENT,
  `TimeSent` time DEFAULT NULL,
  `TimeArrive` time DEFAULT NULL,
  `Cost` decimal(5,2) DEFAULT NULL,
  `OrderID` int DEFAULT NULL,
  `DriverID` int DEFAULT NULL,
  PRIMARY KEY (`TrackingNo`),
  KEY `OrderID_idx` (`OrderID`),
  KEY `DriverID_idx` (`DriverID`),
  CONSTRAINT `DriverID` FOREIGN KEY (`DriverID`) REFERENCES `driver` (`DriverNumberID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OrderID` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1235,'02:19:00','03:00:00',100.00,1,1),(1236,'04:00:00','05:00:00',50.00,2,1),(1237,'05:00:00','05:45:00',400.00,3,1),(1239,'04:00:00','05:00:00',150.00,7,1),(1240,'04:00:00','05:00:00',50.00,8,1),(1241,'04:00:00','05:00:00',80.00,9,1),(1242,'04:00:00','05:00:00',45.00,10,1),(1243,'04:00:00','05:00:00',75.00,11,1);
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-14 20:10:25
