-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant
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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20221220164330_restaurant','6.0.3');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
INSERT INTO `aspnetroles` VALUES ('1058f9d1-15a6-4da9-b6bd-18d9badcc9d1','Admin','ADMIN','fc0b2acb-0537-40af-86c9-f415cbcb67a1'),('2749de9e-fb86-40ab-ad63-c54ce0433eb9','Waiter','WAITER','c73bfea4-0f99-43e5-a3a9-6fc64c5043bc'),('c3692c13-8f23-4bfb-9144-5ed13ff5157b','Cashier','CASHIER','9d20fdb7-58e8-4a54-a6ff-8f4f98f2b8a5'),('f6b1ceb8-d7bc-4416-8f4b-af7a9b228bc3','Manager','MANAGER','a782a5d3-5745-45f9-a66f-494c6720bdf1');
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
INSERT INTO `aspnetuserroles` VALUES ('5fc0342a-5727-450f-ae26-0eede5c0c28b','1058f9d1-15a6-4da9-b6bd-18d9badcc9d1'),('4bdf2399-9ba4-4d1f-96e4-eaf32c16bf49','2749de9e-fb86-40ab-ad63-c54ce0433eb9'),('8169998e-5db4-42ca-887c-c85c68e5c5eb','2749de9e-fb86-40ab-ad63-c54ce0433eb9'),('ab169d87-a803-48a4-84c2-43c7ed250287','2749de9e-fb86-40ab-ad63-c54ce0433eb9'),('e9cc6389-7908-4093-ad6d-b673b6e2475f','2749de9e-fb86-40ab-ad63-c54ce0433eb9'),('b6ce1cc0-f2a8-491d-805c-db1e75146b9d','f6b1ceb8-d7bc-4416-8f4b-af7a9b228bc3');
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EmployeeId` int DEFAULT NULL,
  `UserPassword` varchar(200) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `FirstName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DirectSupervisorName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DirectSupervisorId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LastName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`),
  KEY `user_fk1_idx` (`EmployeeId`),
  CONSTRAINT `user_fk_1` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('03ed5909-03a3-45b3-8078-0de377027137',8,'S@34ameer','Anmol',NULL,NULL,NULL,NULL,'S@34ameer','S@34AMEER','Anmol@gmail.com','ANMOL@GMAIL.COM',0,'AQAAAAEAACcQAAAAEJDqlHDFyk9sxrzXZ6sKx06zNjKFzQ8J6z3Pps/uiTbGy1EtHGJjAZtzOJkc/tmSig==','HUSDUXSF5OHD5BH25PS7UH3EMLETTCZB','77b7a366-04e6-4271-b7ce-0be8547f0c88','0987657612',0,0,NULL,1,0),('4bdf2399-9ba4-4d1f-96e4-eaf32c16bf49',5,'789075','Martin',NULL,NULL,NULL,NULL,'789075','789075','Martin@gmail.com','MARTIN@GMAIL.COM',0,'AQAAAAEAACcQAAAAEFks0asS7jRu4yq/NC/UR6rYXhNhOwC+C1XuhOQI03BfzO1CzHSsFqifGtF1JzPeGg==','6PJHY25TCNOZ7X7MQXW7TKA5U4OFWBH4','ce0f0542-71a2-439e-9474-f619f6c0f2d0','1234567897',0,0,NULL,1,0),('53f7fb76-b848-4c9a-b4a5-cd074ec22d8b',5,'S@3ameer','Sumaira',NULL,NULL,NULL,NULL,'S@3ameer','S@3AMEER','bintameer212@gmail.com','BINTAMEER212@GMAIL.COM',0,'AQAAAAEAACcQAAAAEI/znrK0PzlOZY/Q6GXcByDq/3N0dV//iw/L7jALlYeRuh0jjFxHwhsiEYAc+AddpA==','SRAQJYHMY4M5TZO3XVHHGZMXDTONZBM3','e88a11e8-4c91-4c3f-8b80-a101a00f96e8','1234567891',0,0,NULL,1,0),('5fc0342a-5727-450f-ae26-0eede5c0c28b',6,'78987','Peter',NULL,NULL,NULL,NULL,'78987','78987','Peter@gmail.com','PETER@GMAIL.COM',0,'AQAAAAEAACcQAAAAEItKsa3mKEUbcDLn2YB+AngN/Lp63Y7vpumdyUEflcCxiX3VRIbTT/o+7wUaiYkfpg==','XR2IUQ2BEAGCFOC77USXTLKHY6PT5UD7','4b00754b-5aa0-417a-9385-314ee58ec078','1234567897',0,0,NULL,1,0),('8169998e-5db4-42ca-887c-c85c68e5c5eb',2,'12345','Jasika',NULL,NULL,NULL,NULL,'12345','12345','Jasika@gmail.com','JASIKA@GMAIL.COM',0,'AQAAAAEAACcQAAAAEEHNqBZkGr7aWKFCbBLbWWg1a72aE8GfEHf8Uw7LjnTEqXfLxzojAYxvWNWD8RQODw==','VKEKXMGC56LETFXPFEIEFBSQLUPK6P6K','5c326514-5417-4f44-aaa7-40257e04387e','1234567897',0,0,NULL,1,0),('ab169d87-a803-48a4-84c2-43c7ed250287',3,'1234','Eric',NULL,NULL,NULL,NULL,'1234','1234','Eric@gmail.com','ERIC@GMAIL.COM',0,'AQAAAAEAACcQAAAAENndOFFwC7WsqdJ0/d9uKQQc4zQgwLOmmZf/J3ZMgJ8qD20MpUHaXFBB6z4GvRziiA==','OPM5GFDY7KVLLS522ZXI7UB2B6GTGSH5','1e1d7d3b-6e2d-454d-a648-5b6133de3861','1234567897',0,0,NULL,1,0),('b6ce1cc0-f2a8-491d-805c-db1e75146b9d',4,'7890','John',NULL,NULL,NULL,NULL,'7890','7890','John@gmail.com','JOHN@GMAIL.COM',0,'AQAAAAEAACcQAAAAEOSFr2mBKkb76klhrlYkz/YjjcTr5GMyr5EcSChvkHa465ONO9+LFhHbHEgAwkthAQ==','FXB5Z4NSHVJQOKIKU3DW2ZRVJ7RQJUWR','8c99bf94-102a-4e99-9354-214ec6739592','1234567897',0,0,NULL,1,0),('e9cc6389-7908-4093-ad6d-b673b6e2475f',1,'090078601','Elena',NULL,NULL,NULL,NULL,'090078601','090078601','Elena@gmail.com','ELENA@GMAIL.COM',0,'AQAAAAEAACcQAAAAENM3cAffHTk4GqAwc0a3GzgU8ngqQ1iVmUCKIsrrvkRUsR7Vm2jQPtoDD8DVErBs0g==','LDCJYINXTR3EGC7X4DL4VSPO2BN6T254','e8e2d006-1973-40d7-a32b-c9d14c734d36','1234567897',0,0,NULL,1,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `Id` int NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'ABC','2023-01-26 07:47:16',0,'0001-01-01 00:00:00',0,_binary '\0'),(2,'test','2023-01-26 07:49:07',0,'0001-01-01 00:00:00',0,_binary '\0'),(3,'Testing....','2023-01-26 07:50:56',0,'0001-01-01 00:00:00',0,_binary '\0'),(4,'Branch_1','2023-01-26 07:47:16',0,'0001-01-01 00:00:00',0,_binary ''),(5,'Branch_2','2023-01-26 07:53:06',0,'0001-01-01 00:00:00',0,_binary ''),(6,'Branch_3','2023-01-26 07:53:13',0,'0001-01-01 00:00:00',0,_binary ''),(7,'Branch_4','2023-01-30 00:48:13',0,'0001-01-01 00:00:00',0,_binary ''),(8,'branch5...','2023-01-31 19:00:08',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `Id` int NOT NULL,
  `CategoryName` varchar(45) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Drinks','2022-12-21 17:24:58',0,'2022-12-21 17:24:58',0,_binary '\0'),(2,'FastFood','2022-12-22 05:02:40',0,'2022-12-22 05:02:40',0,_binary ''),(3,'Drinks','2022-12-28 13:10:10',0,'0001-01-01 00:00:00',0,_binary ''),(4,'Dessert','2022-12-28 13:49:54',0,'0001-01-01 00:00:00',0,_binary ''),(5,'Main Dish...','2022-12-28 13:50:01',0,'0001-01-01 00:00:00',0,_binary '\0'),(6,'MyLunch','2022-12-31 13:05:22',0,'0001-01-01 00:00:00',0,_binary '\0'),(7,NULL,'2022-12-31 13:06:21',0,'0001-01-01 00:00:00',0,_binary '\0'),(8,'juises','2022-12-31 13:14:56',0,'0001-01-01 00:00:00',0,_binary '\0'),(9,'Appetizers','2022-12-31 20:41:12',0,'0001-01-01 00:00:00',0,_binary '\0'),(10,'Appetizers','2022-12-31 20:51:57',0,'0001-01-01 00:00:00',0,_binary '\0'),(11,'Abc','2022-12-31 20:52:25',0,'0001-01-01 00:00:00',0,_binary '\0'),(12,'asdkkk','2022-12-31 20:55:29',0,'0001-01-01 00:00:00',0,_binary '\0'),(13,'Appi','2022-12-31 21:12:57',0,'0001-01-01 00:00:00',0,_binary '\0'),(14,'Appetizers...','2022-12-31 21:29:02',0,'0001-01-01 00:00:00',0,_binary '\0'),(15,'Appetizers','2022-12-31 21:34:53',0,'0001-01-01 00:00:00',0,_binary '\0'),(16,'Appetizers...','2022-12-31 21:35:34',0,'0001-01-01 00:00:00',0,_binary '\0'),(17,'Appetizers','2023-01-01 21:10:16',0,'0001-01-01 00:00:00',0,_binary '\0'),(18,'Appi','2023-01-01 21:11:51',0,'0001-01-01 00:00:00',0,_binary '\0'),(19,'Appetizers','2023-01-02 22:24:27',0,'0001-01-01 00:00:00',0,_binary '\0'),(20,'Appi','2023-01-02 22:28:25',0,'0001-01-01 00:00:00',0,_binary '\0'),(21,'Appetizers...','2023-01-02 22:29:01',0,'0001-01-01 00:00:00',0,_binary '\0'),(22,'Appetizers','2023-01-02 22:32:25',0,'0001-01-01 00:00:00',0,_binary '\0'),(23,'Appetizers...','2023-01-02 22:33:19',0,'0001-01-01 00:00:00',0,_binary '\0'),(24,'Appetizers','2023-01-02 22:45:42',0,'0001-01-01 00:00:00',0,_binary '\0'),(25,'Appetizers','2023-01-30 00:09:23',0,'0001-01-01 00:00:00',0,_binary ''),(26,'Salads','2023-01-31 17:37:46',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Id` int NOT NULL,
  `BranchId` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(100) DEFAULT NULL,
  `CNIC` varchar(20) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `Address` varchar(300) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `branch_branchId_fk_idx` (`BranchId`),
  CONSTRAINT `branch_branchId_fk` FOREIGN KEY (`BranchId`) REFERENCES `branch` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,5,'Humaira...','bintameer212@gmail.com...','1234543875....','3660366387328...','Lahore...','Address...','2023-01-26 10:18:24',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `Id` int NOT NULL,
  `SourceId` int DEFAULT NULL,
  `PhoneNo` varchar(100) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Note` varchar(4000) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `delivery_fk_1_idx` (`SourceId`),
  CONSTRAINT `delivery_fk_1` FOREIGN KEY (`SourceId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,1003001,'123456789','CustomerName','Customer Address','write something here','2023-01-27 01:00:59',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dinein`
--

DROP TABLE IF EXISTS `dinein`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dinein` (
  `Id` int NOT NULL,
  `ResId` int DEFAULT NULL,
  `WaiterId` int DEFAULT NULL,
  `TableNo` int DEFAULT NULL,
  `Guest` varchar(100) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `dinein_fk_1_idx` (`WaiterId`),
  CONSTRAINT `dinein_fk_1` FOREIGN KEY (`WaiterId`) REFERENCES `employee` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dinein`
--

LOCK TABLES `dinein` WRITE;
/*!40000 ALTER TABLE `dinein` DISABLE KEYS */;
/*!40000 ALTER TABLE `dinein` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discountkey`
--

DROP TABLE IF EXISTS `discountkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discountkey` (
  `Id` int NOT NULL,
  `DiscountKey` varchar(45) DEFAULT NULL,
  `Value` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discountkey`
--

LOCK TABLES `discountkey` WRITE;
/*!40000 ALTER TABLE `discountkey` DISABLE KEYS */;
INSERT INTO `discountkey` VALUES (1,'dis( 10% )',10,'2023-01-24 22:12:15',0,'0001-01-01 00:00:00',0,_binary ''),(2,'sder( 20% )',20,'2023-01-24 22:12:29',0,'0001-01-01 00:00:00',0,_binary ''),(3,NULL,0,'2023-01-24 22:12:37',0,'0001-01-01 00:00:00',0,_binary '\0'),(4,NULL,0,'2023-01-24 22:12:46',0,'0001-01-01 00:00:00',0,_binary '\0'),(5,NULL,0,'2023-01-24 22:12:48',0,'0001-01-01 00:00:00',0,_binary '\0'),(6,'dis( 30% )',30,'2023-01-30 00:44:04',0,'0001-01-01 00:00:00',0,_binary ''),(7,'dis( 40% )',40,'2023-01-31 18:49:01',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `discountkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discountvouchers`
--

DROP TABLE IF EXISTS `discountvouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discountvouchers` (
  `Id` int NOT NULL,
  `KeyValue` varchar(45) DEFAULT NULL,
  `Value` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discountvouchers`
--

LOCK TABLES `discountvouchers` WRITE;
/*!40000 ALTER TABLE `discountvouchers` DISABLE KEYS */;
INSERT INTO `discountvouchers` VALUES (1,'dis(50)',50,'2023-02-03 02:05:26',0,'0001-01-01 00:00:00',0,_binary ''),(2,'dis(100)',100,'2023-02-03 02:07:36',0,'0001-01-01 00:00:00',0,_binary ''),(3,'hjsdkjas',38,'2023-02-03 02:07:54',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `discountvouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Id` int NOT NULL,
  `BranchId` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Phone` varchar(100) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `Designation` varchar(100) DEFAULT NULL,
  `JoiningDate` datetime DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `branch_branchId_fk_idx` (`BranchId`),
  CONSTRAINT `employee_branch_branchId_fk` FOREIGN KEY (`BranchId`) REFERENCES `branch` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,4,'Elena Manuel','1234543875','FeMale','junior','2023-01-01 19:00:00','2023-01-26 09:43:39',0,'0001-01-01 00:00:00',0,_binary ''),(2,5,'Jasika Kavin','1234543875...','FeMale','junior...','2023-01-18 19:00:00','2023-01-26 09:43:55',0,'0001-01-01 00:00:00',0,_binary ''),(3,4,'Eric Hakan','1234567897','FeMale','des...','2023-01-01 19:00:00','2023-01-26 09:43:39',0,'2023-01-26 09:43:39',0,_binary ''),(4,5,'John Luca','1234567897','Male','des...','2023-01-01 19:00:00','2023-01-26 09:43:39',0,'2023-01-26 09:43:39',0,_binary ''),(5,4,'Martin Thomas','1234567897','Male','des...','2023-01-01 19:00:00','2023-01-26 09:43:39',0,'2023-01-26 09:43:39',0,_binary ''),(6,4,'Peter Mustafa','1234567897','Male','des...','2023-01-01 19:00:00','2023-01-26 09:43:39',0,'2023-01-26 09:43:39',0,_binary ''),(7,5,'Sumaira...','1234543875...',NULL,'junior...','2023-01-11 19:00:00','2023-01-31 18:56:11',0,'0001-01-01 00:00:00',0,_binary '\0'),(8,4,'Sumaira','1234543875','FeMale','junior','2023-01-01 19:00:00','2023-02-03 02:20:47',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumtype`
--

DROP TABLE IF EXISTS `enumtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enumtype` (
  `Id` int NOT NULL,
  `Type` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumtype`
--

LOCK TABLES `enumtype` WRITE;
/*!40000 ALTER TABLE `enumtype` DISABLE KEYS */;
INSERT INTO `enumtype` VALUES (1000,'Permissions'),(1001,'Statuses'),(1002,'Shift'),(1003,'Sources'),(1004,'OrderTypes');
/*!40000 ALTER TABLE `enumtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumvalue`
--

DROP TABLE IF EXISTS `enumvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enumvalue` (
  `Id` int NOT NULL,
  `EnumTypeId` int NOT NULL,
  `Value` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `enumvalue_fk1_idx` (`EnumTypeId`),
  CONSTRAINT `enumvalue_ibfk_1` FOREIGN KEY (`EnumTypeId`) REFERENCES `enumtype` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumvalue`
--

LOCK TABLES `enumvalue` WRITE;
/*!40000 ALTER TABLE `enumvalue` DISABLE KEYS */;
INSERT INTO `enumvalue` VALUES (1000001,1000,'ReadOnly'),(1000002,1000,'FullAccess'),(1000003,1000,'Deny'),(1001001,1001,'Open'),(1001002,1001,'InProgress'),(1001003,1001,'Close'),(1002001,1002,'Morning'),(1002002,1002,'Evening'),(1003001,1003,'Careem'),(1004001,1004,'TakeAway'),(1004002,1004,'DineIn'),(1004003,1004,'Delivery');
/*!40000 ALTER TABLE `enumvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature` (
  `Id` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(8000) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` VALUES (1,'Sale Report',NULL,'2023-01-29 19:42:19',0,'0001-01-01 00:00:00',0,_binary ''),(2,'Manage Role',NULL,'2023-01-15 04:18:09',0,'0001-01-01 00:00:00',0,_binary ''),(3,'Manage User',NULL,'2023-01-29 23:55:39',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floor`
--

DROP TABLE IF EXISTS `floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floor` (
  `Id` int NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floor`
--

LOCK TABLES `floor` WRITE;
/*!40000 ALTER TABLE `floor` DISABLE KEYS */;
INSERT INTO `floor` VALUES (1,'F-1...','2023-02-04 22:49:51',0,'0001-01-01 00:00:00',0,_binary '\0'),(2,'F-1','2023-02-04 23:09:06',0,'0001-01-01 00:00:00',0,_binary '\0'),(3,'F-1','2023-02-04 23:20:54',0,'0001-01-01 00:00:00',0,_binary ''),(4,'F-2','2023-02-06 15:20:16',0,'0001-01-01 00:00:00',0,_binary ''),(5,'F-3','2023-02-06 15:20:28',0,'0001-01-01 00:00:00',0,_binary ''),(6,'F-4','2023-02-06 15:32:50',0,'0001-01-01 00:00:00',0,_binary '\0'),(7,'F-5','2023-02-06 15:32:58',0,'0001-01-01 00:00:00',0,_binary '\0'),(8,'F-6','2023-02-06 15:33:02',0,'0001-01-01 00:00:00',0,_binary '\0'),(9,'F-7','2023-02-06 15:33:08',0,'0001-01-01 00:00:00',0,_binary '\0'),(10,'g','2023-02-06 15:48:49',0,'0001-01-01 00:00:00',0,_binary '\0'),(11,'j','2023-02-06 15:48:52',0,'0001-01-01 00:00:00',0,_binary '\0'),(12,'j','2023-02-06 15:48:56',0,'0001-01-01 00:00:00',0,_binary '\0'),(13,'t','2023-02-06 15:48:59',0,'0001-01-01 00:00:00',0,_binary '\0'),(14,'q','2023-02-06 15:49:03',0,'0001-01-01 00:00:00',0,_binary '\0'),(15,'w','2023-02-06 15:49:07',0,'0001-01-01 00:00:00',0,_binary '\0'),(16,'e','2023-02-06 15:49:10',0,'0001-01-01 00:00:00',0,_binary '\0'),(17,'e','2023-02-06 15:49:38',0,'0001-01-01 00:00:00',0,_binary '\0'),(18,'v','2023-02-06 15:49:42',0,'0001-01-01 00:00:00',0,_binary '\0'),(19,'x','2023-02-06 15:49:45',0,'0001-01-01 00:00:00',0,_binary '\0'),(20,'z','2023-02-06 15:49:49',0,'0001-01-01 00:00:00',0,_binary '\0'),(21,'a','2023-02-06 15:49:52',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `Id` int NOT NULL,
  `CategoryId` int NOT NULL,
  `SubCategoryId` int NOT NULL,
  `ItemCode` varchar(6000) DEFAULT NULL,
  `ItemName` varchar(2000) DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int NOT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`,`ModifiedById`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,2,'code1','Herbal Tea',100,1,'2022-12-21 17:37:31',0,'2022-12-21 17:37:31',0,_binary '\0'),(2,1,2,'code2','Black Tea',100,1,'2022-12-21 17:37:31',0,'2022-12-21 17:37:31',0,_binary '\0'),(3,2,3,'code','CheeseBurger',100,1,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(4,2,3,'code','BeanBurger',100,1,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(5,2,3,'code','Veggie Burger',100,1,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(6,2,3,'code','PortobelloMushroomBurger',100,1,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(7,2,4,'code','Veggie Pizza',100,1,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(8,2,4,'code','Pepperoni Pizza',100,1,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(9,2,4,'code','Meat Pizza',100,1,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(10,2,4,'code','Margherita Pizza',100,1,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(11,2,4,'code','BBQ Chicken Pizza',100,1,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(12,2,4,'code','Hawaiian Pizza',100,1,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(13,2,4,'code','Buffalo Pizza',100,1,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(14,1,1,'Code','Cappuccino',100,1,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary ''),(15,1,1,'Code','Latte',100,1,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary ''),(16,1,1,'Code','Decaf',100,1,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary ''),(17,1,1,'Code','Macchiato',100,1,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary ''),(18,1,1,'Code','Espresso',100,1,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary ''),(19,1,1,'Code','Americano',100,1,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary ''),(20,1,1,'Code','Caramel Macchiato',100,1,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary ''),(21,1,1,'Code','Coffee Coca',100,1,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary ''),(22,1,1,'Code','Doppio',100,1,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(23,1,1,'Code','Long Black',100,1,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary ''),(24,0,5,'1006','Black Tea...',120,1,'2022-12-28 13:16:21',0,'0001-01-01 00:00:00',0,_binary ''),(25,0,6,'Code','Black Tea',90,1,'2022-12-28 13:23:10',0,'0001-01-01 00:00:00',0,_binary ''),(26,0,6,'code','Green Tea',60,1,'2022-12-28 13:23:26',0,'0001-01-01 00:00:00',0,_binary ''),(27,0,7,'code...','Ice Cream',120,1,'2022-12-28 13:50:44',0,'0001-01-01 00:00:00',0,_binary ''),(28,0,7,'code','Sobert',200,1,'2022-12-28 13:50:55',0,'0001-01-01 00:00:00',0,_binary '\0'),(29,0,7,'code','Gelato',90,1,'2022-12-28 13:51:09',0,'0001-01-01 00:00:00',0,_binary ''),(30,0,10,'1001','Potato Chips',100,1,'2022-12-31 20:42:03',0,'0001-01-01 00:00:00',0,_binary ''),(31,0,10,'1002','Corn Chips',80,1,'2022-12-31 20:42:20',0,'0001-01-01 00:00:00',0,_binary '\0'),(32,0,10,'1003','Vegetable Chips...',150,1,'2022-12-31 20:42:39',0,'0001-01-01 00:00:00',0,_binary ''),(33,0,13,'ui','ty',789,1,'2022-12-31 20:56:21',0,'0001-01-01 00:00:00',0,_binary ''),(34,0,16,'1001','Potato Chips..',150,1,'2022-12-31 21:29:59',0,'0001-01-01 00:00:00',0,_binary ''),(35,0,16,'1002','Corn Chips',130,1,'2022-12-31 21:30:14',0,'0001-01-01 00:00:00',0,_binary '\0'),(36,0,21,'1001','Potato Chips',120,1,'2022-12-31 21:36:15',0,'0001-01-01 00:00:00',0,_binary ''),(37,0,21,'1002','Corn Chips',140,1,'2022-12-31 21:36:28',0,'0001-01-01 00:00:00',0,_binary ''),(38,0,21,'1009','Vegetable Chips...',200,1,'2022-12-31 21:36:45',0,'0001-01-01 00:00:00',0,_binary '\0'),(39,0,24,'1001','Potato Chips',120,1,'2023-01-02 22:29:38',0,'0001-01-01 00:00:00',0,_binary ''),(40,0,24,'1002','Corn Chips',130,1,'2023-01-02 22:29:52',0,'0001-01-01 00:00:00',0,_binary ''),(41,0,24,'1004','Vegetable Chips...',200,1,'2023-01-02 22:30:10',0,'0001-01-01 00:00:00',0,_binary '\0'),(42,0,27,'1001','Potato Chips',120,1,'2023-01-02 22:33:49',0,'0001-01-01 00:00:00',0,_binary ''),(43,0,27,'1002','Corn Chips',150,1,'2023-01-02 22:34:03',0,'0001-01-01 00:00:00',0,_binary '\0'),(44,0,27,'1004','Vegetable Chips...',200,1,'2023-01-02 22:34:20',0,'0001-01-01 00:00:00',0,_binary ''),(45,0,30,'1001','Potato Chips',120,1,'2023-01-02 22:46:20',0,'0001-01-01 00:00:00',0,_binary '\0'),(46,0,30,'1005','Corn Chips...',200,1,'2023-01-02 22:46:34',0,'0001-01-01 00:00:00',0,_binary ''),(47,0,30,'1003','Vegetable Chips',130,1,'2023-01-02 22:46:52',0,'0001-01-01 00:00:00',0,_binary ''),(48,0,31,'1001','Vegetable Soup',500,1,'2023-01-30 00:17:45',0,'0001-01-01 00:00:00',0,_binary ''),(49,0,31,'1002','Chili Soup',400,1,'2023-01-30 00:27:24',0,'0001-01-01 00:00:00',0,_binary '\0'),(50,0,31,'1002','Chili Soup',400,1,'2023-01-30 00:37:01',0,'0001-01-01 00:00:00',0,_binary ''),(51,0,36,'1009','green salad',200,1,'2023-01-31 17:41:01',0,'0001-01-01 00:00:00',0,_binary ''),(52,0,36,'1006','Mixed salad',200,1,'2023-01-31 17:41:33',0,'0001-01-01 00:00:00',0,_binary ''),(53,0,37,'18930','Black Cofee',200,1,'2023-02-04 02:10:03',0,'0001-01-01 00:00:00',0,_binary ''),(54,0,32,'82738','Potato Chips',100,1,'2023-02-04 02:11:36',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `Id` int NOT NULL,
  `FeatureId` int DEFAULT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `RoleId` varchar(255) DEFAULT NULL,
  `PermissionValue` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,1,'d0af9b1d-68bf-479a-9831-a4cc9e443969',NULL,1000001,'2023-01-15 04:19:37',0,'0001-01-01 00:00:00',0,_binary ''),(2,2,'d0af9b1d-68bf-479a-9831-a4cc9e443969',NULL,1000001,'2023-01-15 04:19:37',0,'0001-01-01 00:00:00',0,_binary ''),(3,3,'d0af9b1d-68bf-479a-9831-a4cc9e443969',NULL,1000001,'2023-01-15 04:19:37',0,'0001-01-01 00:00:00',0,_binary ''),(4,4,'d0af9b1d-68bf-479a-9831-a4cc9e443969',NULL,1000001,'2023-01-15 04:19:37',0,'0001-01-01 00:00:00',0,_binary ''),(5,1,NULL,'f6b1ceb8-d7bc-4416-8f4b-af7a9b228bc3',1000001,'2023-01-15 04:19:49',0,'0001-01-01 00:00:00',0,_binary ''),(6,2,NULL,'f6b1ceb8-d7bc-4416-8f4b-af7a9b228bc3',1000003,'2023-01-15 04:19:49',0,'0001-01-01 00:00:00',0,_binary ''),(7,3,NULL,'f6b1ceb8-d7bc-4416-8f4b-af7a9b228bc3',1000001,'2023-01-15 04:19:49',0,'0001-01-01 00:00:00',0,_binary ''),(8,4,NULL,'f6b1ceb8-d7bc-4416-8f4b-af7a9b228bc3',1000003,'2023-01-15 04:19:49',0,'0001-01-01 00:00:00',0,_binary ''),(9,1,'e9cc6389-7908-4093-ad6d-b673b6e2475f',NULL,1000002,'2023-01-29 17:58:37',0,'0001-01-01 00:00:00',0,_binary ''),(10,2,'e9cc6389-7908-4093-ad6d-b673b6e2475f',NULL,1000001,'2023-01-29 17:58:37',0,'0001-01-01 00:00:00',0,_binary ''),(11,3,'e9cc6389-7908-4093-ad6d-b673b6e2475f',NULL,1000003,'2023-01-29 17:58:37',0,'0001-01-01 00:00:00',0,_binary ''),(12,4,'e9cc6389-7908-4093-ad6d-b673b6e2475f',NULL,1000002,'2023-01-29 17:58:37',0,'0001-01-01 00:00:00',0,_binary ''),(13,1,NULL,'1058f9d1-15a6-4da9-b6bd-18d9badcc9d1',1000002,'2023-01-29 19:46:15',0,'0001-01-01 00:00:00',0,_binary ''),(14,2,NULL,'1058f9d1-15a6-4da9-b6bd-18d9badcc9d1',1000002,'2023-01-29 19:46:15',0,'0001-01-01 00:00:00',0,_binary ''),(15,3,NULL,'1058f9d1-15a6-4da9-b6bd-18d9badcc9d1',1000002,'2023-01-29 19:46:15',0,'0001-01-01 00:00:00',0,_binary ''),(16,1,'4bdf2399-9ba4-4d1f-96e4-eaf32c16bf49',NULL,1000001,'2023-01-29 19:48:04',0,'0001-01-01 00:00:00',0,_binary ''),(17,2,'4bdf2399-9ba4-4d1f-96e4-eaf32c16bf49',NULL,1000003,'2023-01-29 19:48:04',0,'0001-01-01 00:00:00',0,_binary ''),(18,3,'4bdf2399-9ba4-4d1f-96e4-eaf32c16bf49',NULL,1000003,'2023-01-29 19:48:04',0,'0001-01-01 00:00:00',0,_binary ''),(19,1,NULL,'2749de9e-fb86-40ab-ad63-c54ce0433eb9',1000003,'2023-01-29 19:48:26',0,'0001-01-01 00:00:00',0,_binary ''),(20,2,NULL,'2749de9e-fb86-40ab-ad63-c54ce0433eb9',1000003,'2023-01-29 19:48:26',0,'0001-01-01 00:00:00',0,_binary ''),(21,3,NULL,'2749de9e-fb86-40ab-ad63-c54ce0433eb9',1000003,'2023-01-29 19:48:26',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restauranttable`
--

DROP TABLE IF EXISTS `restauranttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restauranttable` (
  `Id` int NOT NULL,
  `FloorId` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `table_fk_1_idx` (`FloorId`),
  CONSTRAINT `table_fk_1` FOREIGN KEY (`FloorId`) REFERENCES `floor` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restauranttable`
--

LOCK TABLES `restauranttable` WRITE;
/*!40000 ALTER TABLE `restauranttable` DISABLE KEYS */;
INSERT INTO `restauranttable` VALUES (1,1,'T-1...','2023-02-04 23:05:21',0,'0001-01-01 00:00:00',0,_binary '\0'),(2,2,'T-1','2023-02-04 23:12:46',0,'0001-01-01 00:00:00',0,_binary ''),(3,3,'T1','2023-02-04 23:21:02',0,'0001-01-01 00:00:00',0,_binary ''),(4,3,'T2','2023-02-06 15:20:50',0,'0001-01-01 00:00:00',0,_binary ''),(5,3,'T3','2023-02-06 15:21:03',0,'0001-01-01 00:00:00',0,_binary ''),(6,4,'T4','2023-02-06 15:21:14',0,'0001-01-01 00:00:00',0,_binary ''),(7,4,'T5','2023-02-06 15:21:19',0,'0001-01-01 00:00:00',0,_binary ''),(8,4,'T6','2023-02-06 15:21:24',0,'0001-01-01 00:00:00',0,_binary ''),(9,4,'T7','2023-02-06 15:21:30',0,'0001-01-01 00:00:00',0,_binary ''),(10,5,'T9','2023-02-06 15:21:44',0,'0001-01-01 00:00:00',0,_binary ''),(11,5,'T10','2023-02-06 15:21:51',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `restauranttable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saleorder`
--

DROP TABLE IF EXISTS `saleorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saleorder` (
  `Id` int NOT NULL,
  `OrderTypeId` int DEFAULT NULL,
  `SourceId` int DEFAULT NULL,
  `StatusId` int DEFAULT NULL,
  `WaiterId` varchar(255) DEFAULT NULL,
  `CustomerId` int DEFAULT NULL,
  `RestaurantId` int DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `PhoneNo` varchar(200) DEFAULT NULL,
  `Total` int DEFAULT NULL,
  `Guest` varchar(200) DEFAULT NULL,
  `Discount` int DEFAULT NULL,
  `GST` int DEFAULT NULL,
  `TableNo` varchar(200) DEFAULT NULL,
  `Note` varchar(5000) DEFAULT NULL,
  `Service` int DEFAULT NULL,
  `NetTotal` int DEFAULT NULL,
  `PaymentMethod` varchar(45) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `saleorder_fk_1_idx` (`OrderTypeId`),
  KEY `saleorder_fk_2_idx` (`StatusId`),
  KEY `saleorder_fk_3_idx` (`SourceId`),
  KEY `saleorder_fk_4_idx` (`WaiterId`),
  CONSTRAINT `saleorder_fk_1` FOREIGN KEY (`OrderTypeId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saleorder_fk_2` FOREIGN KEY (`StatusId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saleorder_fk_3` FOREIGN KEY (`SourceId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saleorder_ibfk_1` FOREIGN KEY (`WaiterId`) REFERENCES `aspnetusers` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleorder`
--

LOCK TABLES `saleorder` WRITE;
/*!40000 ALTER TABLE `saleorder` DISABLE KEYS */;
INSERT INTO `saleorder` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,600,NULL,60,90,NULL,NULL,10,640,'Card','2022-12-25 01:17:02',0,'0001-01-01 00:00:00',0,1),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,480,NULL,48,81,NULL,NULL,10,523,'Card','2022-12-29 01:43:01',0,'0001-01-01 00:00:00',0,1),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1100,NULL,110,187,NULL,NULL,10,1187,'Card','2022-12-29 01:46:53',0,'0001-01-01 00:00:00',0,1),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500,NULL,0,0,NULL,NULL,0,500,'Cash','2023-01-19 05:37:50',0,'0001-01-01 00:00:00',0,1),(22,1004001,NULL,NULL,NULL,1234,NULL,NULL,NULL,NULL,300,NULL,0,48,NULL,NULL,0,348,'Cash','2023-02-06 19:02:21',0,'0001-01-01 00:00:00',0,1),(23,1004003,1003001,NULL,NULL,NULL,NULL,NULL,'Abc','098765432',200,NULL,0,32,NULL,'Note',0,232,'Cash','2023-02-06 20:11:54',0,'0001-01-01 00:00:00',0,1),(24,1004003,1003001,NULL,NULL,NULL,NULL,NULL,'Abc','098765432',200,NULL,0,32,NULL,'Note',0,232,'Cash','2023-02-06 20:13:49',0,'0001-01-01 00:00:00',0,1),(25,1004001,NULL,NULL,NULL,12341,NULL,NULL,NULL,NULL,300,NULL,0,48,NULL,NULL,0,348,'Cash','2023-02-06 21:23:24',0,'0001-01-01 00:00:00',0,1),(26,1004002,NULL,NULL,'ab169d87-a803-48a4-84c2-43c7ed250287',NULL,NULL,NULL,NULL,NULL,300,NULL,0,48,'F-2 / T5',NULL,0,348,'Cash','2023-02-06 21:25:47',0,'0001-01-01 00:00:00',0,1),(27,1004003,1003001,NULL,NULL,NULL,NULL,NULL,'Address','098765433',100,NULL,0,16,NULL,'note',0,116,'Cash','2023-02-06 22:12:02',0,'0001-01-01 00:00:00',0,1);
/*!40000 ALTER TABLE `saleorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saleorderline`
--

DROP TABLE IF EXISTS `saleorderline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saleorderline` (
  `Id` int NOT NULL,
  `SaleOrderId` int DEFAULT NULL,
  `ItemName` varchar(500) DEFAULT NULL,
  `ItemCode` varchar(5000) DEFAULT NULL,
  `QTY` int DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `LineTotal` int DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `CreatedById` int DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleorderline`
--

LOCK TABLES `saleorderline` WRITE;
/*!40000 ALTER TABLE `saleorderline` DISABLE KEYS */;
INSERT INTO `saleorderline` VALUES (1,1,'Cappuccino','Code',3,100,300,'2022-12-25 01:16:13',0,'0001-01-01 00:00:00',0,1),(2,1,'Black Tea','code2',1,100,100,'2022-12-25 01:16:16',0,'0001-01-01 00:00:00',0,1),(3,1,'BeanBurger','code',1,100,100,'2022-12-25 01:16:20',0,'0001-01-01 00:00:00',0,1),(4,1,'Veggie Pizza','code',1,100,100,'2022-12-25 01:16:22',0,'0001-01-01 00:00:00',0,1),(5,2,'Ice Cream','code...',1,120,120,'2022-12-29 01:42:10',0,'0001-01-01 00:00:00',0,1),(6,2,'BeanBurger','code',1,100,100,'2022-12-29 01:42:16',0,'0001-01-01 00:00:00',0,1),(7,2,'Buffalo Pizza','code',1,100,100,'2022-12-29 01:42:22',0,'0001-01-01 00:00:00',0,1),(8,2,'Coffee Coca','Code',1,100,100,'2022-12-29 01:42:30',0,'0001-01-01 00:00:00',0,1),(9,2,'Green Tea','code',1,60,60,'2022-12-29 01:42:32',0,'0001-01-01 00:00:00',0,1),(10,3,'Black Tea','Code',1,90,90,'2022-12-29 01:46:16',0,'0001-01-01 00:00:00',0,1),(11,3,'Coffee Coca','Code',1,100,100,'2022-12-29 01:46:18',0,'0001-01-01 00:00:00',0,1),(12,3,'Hawaiian Pizza','code',1,100,100,'2022-12-29 01:46:21',0,'0001-01-01 00:00:00',0,1),(13,3,'CheeseBurger','code',6,100,600,'2022-12-29 01:46:23',0,'0001-01-01 00:00:00',0,1),(14,3,'Gelato','code',1,90,90,'2022-12-29 01:46:27',0,'0001-01-01 00:00:00',0,1),(15,3,'Ice Cream','code...',1,120,120,'2022-12-29 01:46:28',0,'0001-01-01 00:00:00',0,1),(16,4,'Green Tea','code',1,60,60,'2023-01-19 03:22:43',0,'0001-01-01 00:00:00',0,1),(17,4,'Black Tea','Code',1,90,90,'2023-01-19 03:22:43',0,'0001-01-01 00:00:00',0,1),(18,4,'Cappuccino','Code',1,100,100,'2023-01-19 03:22:48',0,'0001-01-01 00:00:00',0,1),(19,4,'Coffee Coca','Code',1,100,100,'2023-01-19 03:22:49',0,'0001-01-01 00:00:00',0,1),(20,4,'Macchiato','Code',1,100,100,'2023-01-19 03:22:50',0,'0001-01-01 00:00:00',0,1),(21,4,'Espresso','Code',1,100,100,'2023-01-19 03:22:51',0,'0001-01-01 00:00:00',0,1),(22,4,'Americano','Code',1,100,100,'2023-01-19 03:22:51',0,'0001-01-01 00:00:00',0,1),(23,4,'Pepperoni Pizza','code',1,100,100,'2023-01-19 03:22:55',0,'0001-01-01 00:00:00',0,1),(24,4,'Veggie Pizza','code',1,100,100,'2023-01-19 03:22:55',0,'0001-01-01 00:00:00',0,1),(25,4,'BBQ Chicken Pizza','code',1,100,100,'2023-01-19 03:22:56',0,'0001-01-01 00:00:00',0,1),(26,4,'Hawaiian Pizza','code',1,100,100,'2023-01-19 03:22:57',0,'0001-01-01 00:00:00',0,1),(27,4,'Buffalo Pizza','code',1,100,100,'2023-01-19 03:22:59',0,'0001-01-01 00:00:00',0,1),(28,4,'BeanBurger','code',1,100,100,'2023-01-19 03:23:03',0,'0001-01-01 00:00:00',0,1),(29,4,'Ice Cream','code...',1,120,120,'2023-01-19 03:23:07',0,'0001-01-01 00:00:00',0,1),(30,4,'Gelato','code',1,90,90,'2023-01-19 03:23:08',0,'0001-01-01 00:00:00',0,1),(31,5,'Gelato','code',1,90,90,'2023-01-19 03:23:59',0,'0001-01-01 00:00:00',0,1),(32,5,'Ice Cream','code...',1,120,120,'2023-01-19 03:23:59',0,'0001-01-01 00:00:00',0,1),(33,5,'Gelato','code',1,90,90,'2023-01-19 03:24:01',0,'0001-01-01 00:00:00',0,1),(34,5,'CheeseBurger','code',1,100,100,'2023-01-19 03:24:04',0,'0001-01-01 00:00:00',0,1),(35,5,'BeanBurger','code',1,100,100,'2023-01-19 03:24:04',0,'0001-01-01 00:00:00',0,1),(36,5,'PortobelloMushroomBurger','code',1,100,100,'2023-01-19 03:24:05',0,'0001-01-01 00:00:00',0,1),(37,5,'Veggie Burger','code',1,100,100,'2023-01-19 03:24:06',0,'0001-01-01 00:00:00',0,1),(38,5,'BeanBurger','code',1,100,100,'2023-01-19 03:24:07',0,'0001-01-01 00:00:00',0,1),(39,6,'Ice Cream','code...',1,120,120,'2023-01-19 03:24:17',0,'0001-01-01 00:00:00',0,1),(40,6,'Gelato','code',1,90,90,'2023-01-19 03:24:17',0,'0001-01-01 00:00:00',0,1),(41,6,'BeanBurger','code',1,100,100,'2023-01-19 03:24:21',0,'0001-01-01 00:00:00',0,1),(42,6,'PortobelloMushroomBurger','code',1,100,100,'2023-01-19 03:24:22',0,'0001-01-01 00:00:00',0,1),(43,6,'BBQ Chicken Pizza','code',1,100,100,'2023-01-19 03:24:24',0,'0001-01-01 00:00:00',0,1),(44,6,'Black Tea','Code',1,90,90,'2023-01-19 03:24:28',0,'0001-01-01 00:00:00',0,1),(45,6,'Coffee Coca','Code',1,100,100,'2023-01-19 03:24:30',0,'0001-01-01 00:00:00',0,1),(46,7,'Espresso','Code',1,100,100,'2023-01-19 03:24:37',0,'0001-01-01 00:00:00',0,1),(47,7,'Caramel Macchiato','Code',1,100,100,'2023-01-19 03:24:38',0,'0001-01-01 00:00:00',0,1),(48,7,'Pepperoni Pizza','code',1,100,100,'2023-01-19 03:24:40',0,'0001-01-01 00:00:00',0,1),(49,7,'CheeseBurger','code',1,100,100,'2023-01-19 03:24:42',0,'0001-01-01 00:00:00',0,1),(50,7,'Gelato','code',1,90,90,'2023-01-19 03:24:45',0,'0001-01-01 00:00:00',0,1),(51,7,'Ice Cream','code...',1,120,120,'2023-01-19 03:24:46',0,'0001-01-01 00:00:00',0,1),(52,8,'Gelato','code',1,90,90,'2023-01-19 03:24:52',0,'0001-01-01 00:00:00',0,1),(53,8,'Ice Cream','code...',1,120,120,'2023-01-19 03:24:53',0,'0001-01-01 00:00:00',0,1),(54,8,'CheeseBurger','code',1,100,100,'2023-01-19 03:24:56',0,'0001-01-01 00:00:00',0,1),(55,8,'Veggie Burger','code',1,100,100,'2023-01-19 03:24:56',0,'0001-01-01 00:00:00',0,1),(56,9,'PortobelloMushroomBurger','code',1,100,100,'2023-01-19 03:25:02',0,'0001-01-01 00:00:00',0,1),(57,9,'Veggie Burger','code',1,100,100,'2023-01-19 03:25:03',0,'0001-01-01 00:00:00',0,1),(58,9,'BeanBurger','code',1,100,100,'2023-01-19 03:25:03',0,'0001-01-01 00:00:00',0,1),(59,9,'CheeseBurger','code',1,100,100,'2023-01-19 03:25:04',0,'0001-01-01 00:00:00',0,1),(60,9,'Green Tea','code',1,60,60,'2023-01-19 03:25:07',0,'0001-01-01 00:00:00',0,1),(61,9,'Black Tea','Code',1,90,90,'2023-01-19 03:25:08',0,'0001-01-01 00:00:00',0,1),(62,9,'Caramel Macchiato','Code',1,100,100,'2023-01-19 03:25:11',0,'0001-01-01 00:00:00',0,1),(63,10,'Margherita Pizza','code',1,100,100,'2023-01-19 03:25:21',0,'0001-01-01 00:00:00',0,1),(64,10,'Meat Pizza','code',1,100,100,'2023-01-19 03:25:22',0,'0001-01-01 00:00:00',0,1),(65,10,'Pepperoni Pizza','code',1,100,100,'2023-01-19 03:25:22',0,'0001-01-01 00:00:00',0,1),(66,10,'Veggie Pizza','code',1,100,100,'2023-01-19 03:25:23',0,'0001-01-01 00:00:00',0,1),(67,10,'BBQ Chicken Pizza','code',1,100,100,'2023-01-19 03:25:24',0,'0001-01-01 00:00:00',0,1),(68,10,'Hawaiian Pizza','code',1,100,100,'2023-01-19 03:25:24',0,'0001-01-01 00:00:00',0,1),(69,10,'Buffalo Pizza','code',1,100,100,'2023-01-19 03:25:25',0,'0001-01-01 00:00:00',0,1),(70,11,'Cappuccino','Code',1,100,100,'2023-01-19 05:36:30',0,'0001-01-01 00:00:00',0,1),(71,11,'Latte','Code',1,100,100,'2023-01-19 05:36:31',0,'0001-01-01 00:00:00',0,1),(72,11,'Decaf','Code',1,100,100,'2023-01-19 05:36:32',0,'0001-01-01 00:00:00',0,1),(73,11,'Macchiato','Code',1,100,100,'2023-01-19 05:36:33',0,'0001-01-01 00:00:00',0,1),(74,11,'Espresso','Code',1,100,100,'2023-01-19 05:36:33',0,'0001-01-01 00:00:00',0,1),(75,12,'Cappuccino','Code',1,100,100,'2023-01-19 05:37:46',0,'0001-01-01 00:00:00',0,1),(76,12,'Latte','Code',1,100,100,'2023-01-19 05:37:46',0,'0001-01-01 00:00:00',0,1),(77,12,'Decaf','Code',1,100,100,'2023-01-19 05:37:47',0,'0001-01-01 00:00:00',0,1),(78,12,'Macchiato','Code',1,100,100,'2023-01-19 05:37:47',0,'0001-01-01 00:00:00',0,1),(79,12,'Espresso','Code',1,100,100,'2023-01-19 05:37:48',0,'0001-01-01 00:00:00',0,1),(80,13,'Green Tea','code',1,60,60,'2023-01-19 05:37:56',0,'0001-01-01 00:00:00',0,1),(81,13,'Black Tea','Code',1,90,90,'2023-01-19 05:37:56',0,'0001-01-01 00:00:00',0,1),(82,14,'Coffee Coca','Code',1,100,100,'2023-01-19 05:47:23',0,'0001-01-01 00:00:00',0,1),(83,14,'Macchiato','Code',1,100,100,'2023-01-19 05:47:25',0,'0001-01-01 00:00:00',0,1),(84,14,'Espresso','Code',1,100,100,'2023-01-19 05:47:26',0,'0001-01-01 00:00:00',0,1),(85,14,'Cappuccino','Code',1,100,100,'2023-01-19 05:47:28',0,'0001-01-01 00:00:00',0,1),(86,15,'Green Tea','code',1,60,60,'2023-01-19 05:47:39',0,'0001-01-01 00:00:00',0,1),(87,15,'Black Tea','Code',1,90,90,'2023-01-19 05:47:40',0,'0001-01-01 00:00:00',0,1),(88,15,'CheeseBurger','code',1,100,100,'2023-01-19 05:47:43',0,'0001-01-01 00:00:00',0,1),(89,15,'BeanBurger','code',1,100,100,'2023-01-19 05:47:44',0,'0001-01-01 00:00:00',0,1),(90,15,'Veggie Burger','code',1,100,100,'2023-01-19 05:47:45',0,'0001-01-01 00:00:00',0,1),(91,15,'PortobelloMushroomBurger','code',1,100,100,'2023-01-19 05:47:46',0,'0001-01-01 00:00:00',0,1),(92,16,'BeanBurger','code',1,100,100,'2023-01-19 05:50:19',0,'0001-01-01 00:00:00',0,1),(93,16,'CheeseBurger','code',1,100,100,'2023-01-19 05:50:20',0,'0001-01-01 00:00:00',0,1),(94,16,'BeanBurger','code',1,100,100,'2023-01-19 05:50:21',0,'0001-01-01 00:00:00',0,1),(95,16,'Veggie Burger','code',1,100,100,'2023-01-19 05:50:21',0,'0001-01-01 00:00:00',0,1),(96,16,'PortobelloMushroomBurger','code',1,100,100,'2023-01-19 05:50:22',0,'0001-01-01 00:00:00',0,1),(97,16,'Veggie Burger','code',1,100,100,'2023-01-19 05:50:23',0,'0001-01-01 00:00:00',0,1),(98,16,'CheeseBurger','code',1,100,100,'2023-01-19 05:50:25',0,'0001-01-01 00:00:00',0,1),(99,16,'BeanBurger','code',1,100,100,'2023-01-19 05:50:26',0,'0001-01-01 00:00:00',0,1),(100,16,'Veggie Burger','code',1,100,100,'2023-01-19 05:50:27',0,'0001-01-01 00:00:00',0,1),(101,17,'Cappuccino','Code',1,100,100,'2023-01-19 05:51:32',0,'0001-01-01 00:00:00',0,1),(102,17,'Latte','Code',1,100,100,'2023-01-19 05:51:33',0,'0001-01-01 00:00:00',0,1),(103,17,'Decaf','Code',1,100,100,'2023-01-19 05:51:34',0,'0001-01-01 00:00:00',0,1),(104,17,'Macchiato','Code',1,100,100,'2023-01-19 05:51:34',0,'0001-01-01 00:00:00',0,1),(105,18,'Latte','Code',1,100,100,'2023-01-19 05:51:39',0,'0001-01-01 00:00:00',0,1),(106,18,'Decaf','Code',1,100,100,'2023-01-19 05:51:40',0,'0001-01-01 00:00:00',0,1),(107,18,'Macchiato','Code',1,100,100,'2023-01-19 05:51:41',0,'0001-01-01 00:00:00',0,1),(108,19,'Macchiato','Code',1,100,100,'2023-01-19 05:54:18',0,'0001-01-01 00:00:00',0,1),(109,19,'Decaf','Code',1,100,100,'2023-01-19 05:54:19',0,'0001-01-01 00:00:00',0,1),(110,19,'Latte','Code',1,100,100,'2023-01-19 05:54:19',0,'0001-01-01 00:00:00',0,1),(111,19,'Cappuccino','Code',1,100,100,'2023-01-19 05:54:20',0,'0001-01-01 00:00:00',0,1),(112,19,'Caramel Macchiato','Code',1,100,100,'2023-01-19 05:54:20',0,'0001-01-01 00:00:00',0,1),(113,19,'Coffee Coca','Code',1,100,100,'2023-01-19 05:54:21',0,'0001-01-01 00:00:00',0,1),(114,19,'Long Black','Code',1,100,100,'2023-01-19 05:54:22',0,'0001-01-01 00:00:00',0,1),(115,19,'Espresso','Code',1,100,100,'2023-01-19 05:54:22',0,'0001-01-01 00:00:00',0,1),(116,19,'Americano','Code',1,100,100,'2023-01-19 05:54:23',0,'0001-01-01 00:00:00',0,1),(117,20,'Cappuccino','Code',1,100,100,'2023-01-19 05:54:47',0,'0001-01-01 00:00:00',0,1),(118,20,'Latte','Code',1,100,100,'2023-01-19 05:54:48',0,'0001-01-01 00:00:00',0,1),(119,20,'Decaf','Code',1,100,100,'2023-01-19 05:54:49',0,'0001-01-01 00:00:00',0,1),(120,21,'Caramel Macchiato','Code',1,100,100,'2023-01-19 05:54:54',0,'0001-01-01 00:00:00',0,1),(121,21,'Coffee Coca','Code',1,100,100,'2023-01-19 05:54:55',0,'0001-01-01 00:00:00',0,1),(122,22,'CheeseBurger','code',1,100,100,'2023-02-06 19:01:43',0,'0001-01-01 00:00:00',0,1),(123,22,'BeanBurger','code',1,100,100,'2023-02-06 19:01:45',0,'0001-01-01 00:00:00',0,1),(124,22,'Veggie Burger','code',1,100,100,'2023-02-06 19:01:46',0,'0001-01-01 00:00:00',0,1),(125,23,'Pepperoni Pizza','code',1,100,100,'2023-02-06 20:11:17',0,'0001-01-01 00:00:00',0,1),(126,23,'BBQ Chicken Pizza','code',1,100,100,'2023-02-06 20:11:21',0,'0001-01-01 00:00:00',0,1),(127,24,'Pepperoni Pizza','code',1,100,100,'2023-02-06 20:11:17',0,'0001-01-01 00:00:00',0,1),(128,24,'BBQ Chicken Pizza','code',1,100,100,'2023-02-06 20:11:21',0,'0001-01-01 00:00:00',0,1),(129,25,'Pepperoni Pizza','code',1,100,100,'2023-02-06 21:23:11',0,'0001-01-01 00:00:00',0,1),(130,25,'Buffalo Pizza','code',1,100,100,'2023-02-06 21:23:12',0,'0001-01-01 00:00:00',0,1),(131,25,'BBQ Chicken Pizza','code',1,100,100,'2023-02-06 21:23:14',0,'0001-01-01 00:00:00',0,1),(132,26,'Pepperoni Pizza','code',1,100,100,'2023-02-06 21:23:11',0,'0001-01-01 00:00:00',0,1),(133,26,'Buffalo Pizza','code',1,100,100,'2023-02-06 21:23:12',0,'0001-01-01 00:00:00',0,1),(134,26,'BBQ Chicken Pizza','code',1,100,100,'2023-02-06 21:23:14',0,'0001-01-01 00:00:00',0,1),(135,27,'Pepperoni Pizza','code',1,100,100,'2023-02-06 22:09:40',0,'0001-01-01 00:00:00',0,1);
/*!40000 ALTER TABLE `saleorderline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `Id` int NOT NULL,
  `ShiftValueId` int DEFAULT NULL,
  `FloatingCash` varchar(2000) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `shift_start_k_1_idx` (`ShiftValueId`),
  CONSTRAINT `shift_ibfk_1` FOREIGN KEY (`ShiftValueId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,1002001,'4654758','2023-01-26 12:17:56',0,'0001-01-01 00:00:00',0,_binary ''),(2,1002002,'67868','2023-01-30 03:19:38',0,'0001-01-01 00:00:00',0,_binary ''),(3,1002001,'123645','2023-01-31 16:52:12',0,'0001-01-01 00:00:00',0,_binary ''),(4,1002001,'456476','2023-01-31 17:10:44',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `Id` int NOT NULL,
  `CategoryId` int DEFAULT NULL,
  `SubCategoryName` varchar(45) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,1,'Coffee..','2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(2,1,'Tea','2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(3,2,'Burger','2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(4,2,'Pizza','2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(5,3,'Tea...','2022-12-28 13:15:46',0,'0001-01-01 00:00:00',0,_binary '\0'),(6,1,'Tea','2022-12-28 13:22:53',0,'0001-01-01 00:00:00',0,_binary '\0'),(7,4,'Frozen Dessert','2022-12-28 13:50:14',0,'0001-01-01 00:00:00',0,_binary ''),(8,4,'Baked Dessert','2022-12-28 13:50:25',0,'0001-01-01 00:00:00',0,_binary '\0'),(9,1,'Soft Drinks','2022-12-31 16:52:28',0,'0001-01-01 00:00:00',0,_binary '\0'),(10,9,'Chips & dips','2022-12-31 20:41:28',0,'0001-01-01 00:00:00',0,_binary '\0'),(11,9,'Salads','2022-12-31 20:41:35',0,'0001-01-01 00:00:00',0,_binary '\0'),(12,9,'Soup...','2022-12-31 20:41:42',0,'0001-01-01 00:00:00',0,_binary '\0'),(13,12,'ass','2022-12-31 20:56:07',0,'0001-01-01 00:00:00',0,_binary '\0'),(14,1,'ASD','2022-12-31 21:07:06',0,'0001-01-01 00:00:00',0,_binary '\0'),(15,14,'Salad','2022-12-31 21:29:12',0,'0001-01-01 00:00:00',0,_binary '\0'),(16,14,'Chips & Dips','2022-12-31 21:29:20',0,'0001-01-01 00:00:00',0,_binary '\0'),(17,14,'Soup...','2022-12-31 21:29:29',0,'0001-01-01 00:00:00',0,_binary '\0'),(18,15,'Sa','2022-12-31 21:34:59',0,'0001-01-01 00:00:00',0,_binary '\0'),(19,16,'Salad','2022-12-31 21:35:44',0,'0001-01-01 00:00:00',0,_binary '\0'),(20,16,'Soup','2022-12-31 21:35:51',0,'0001-01-01 00:00:00',0,_binary '\0'),(21,16,'Chips & dips','2022-12-31 21:35:57',0,'0001-01-01 00:00:00',0,_binary '\0'),(22,21,'Soup','2023-01-02 22:29:12',0,'0001-01-01 00:00:00',0,_binary '\0'),(23,21,'Salad','2023-01-02 22:29:19',0,'0001-01-01 00:00:00',0,_binary '\0'),(24,21,'Chips & dips','2023-01-02 22:29:24',0,'0001-01-01 00:00:00',0,_binary '\0'),(25,23,'Soup','2023-01-02 22:33:26',0,'0001-01-01 00:00:00',0,_binary '\0'),(26,23,'Salad','2023-01-02 22:33:30',0,'0001-01-01 00:00:00',0,_binary '\0'),(27,23,'Chips & dips','2023-01-02 22:33:35',0,'0001-01-01 00:00:00',0,_binary '\0'),(28,24,'Soup','2023-01-02 22:45:52',0,'0001-01-01 00:00:00',0,_binary '\0'),(29,24,'Salad','2023-01-02 22:45:59',0,'0001-01-01 00:00:00',0,_binary '\0'),(30,24,'Chips & dips','2023-01-02 22:46:04',0,'0001-01-01 00:00:00',0,_binary '\0'),(31,25,'Soup','2023-01-30 00:13:05',0,'0001-01-01 00:00:00',0,_binary ''),(32,25,'Chips & dips','2023-01-31 17:22:17',0,'0001-01-01 00:00:00',0,_binary ''),(33,25,'stakes','2023-01-31 17:23:13',0,'0001-01-01 00:00:00',0,_binary '\0'),(34,26,'Mixed Salad','2023-01-31 17:38:22',0,'0001-01-01 00:00:00',0,_binary ''),(35,26,'Green Salad...','2023-01-31 17:38:29',0,'0001-01-01 00:00:00',0,_binary ''),(36,25,'Salads','2023-01-31 17:39:29',0,'0001-01-01 00:00:00',0,_binary ''),(37,3,'Coffee','2023-02-04 02:09:25',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takeaway`
--

DROP TABLE IF EXISTS `takeaway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `takeaway` (
  `Id` int NOT NULL,
  `CustomerId` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takeaway`
--

LOCK TABLES `takeaway` WRITE;
/*!40000 ALTER TABLE `takeaway` DISABLE KEYS */;
INSERT INTO `takeaway` VALUES (1,1,'2023-01-27 00:59:19',0,'0001-01-01 00:00:00',0,_binary ''),(2,123,'2023-01-31 17:14:45',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `takeaway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themedata`
--

DROP TABLE IF EXISTS `themedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themedata` (
  `Id` int NOT NULL,
  `Source` varchar(6000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themedata`
--

LOCK TABLES `themedata` WRITE;
/*!40000 ALTER TABLE `themedata` DISABLE KEYS */;
INSERT INTO `themedata` VALUES (1,'Dictionaries/ControlStyles.xaml'),(2,'Dictionaries/DifferentColorsStyle.xaml'),(3,'pack://application:,,,/MahApps.Metro;component/Styles/Themes/Light.Blue.xaml');
/*!40000 ALTER TABLE `themedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_customer`
--

DROP TABLE IF EXISTS `vw_customer`;
/*!50001 DROP VIEW IF EXISTS `vw_customer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer` AS SELECT 
 1 AS `Id`,
 1 AS `BranchId`,
 1 AS `BranchName`,
 1 AS `Name`,
 1 AS `Email`,
 1 AS `Phone`,
 1 AS `CNIC`,
 1 AS `City`,
 1 AS `Address`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_employee`
--

DROP TABLE IF EXISTS `vw_employee`;
/*!50001 DROP VIEW IF EXISTS `vw_employee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_employee` AS SELECT 
 1 AS `Id`,
 1 AS `Gender`,
 1 AS `BranchId`,
 1 AS `BranchName`,
 1 AS `Name`,
 1 AS `Phone`,
 1 AS `Designation`,
 1 AS `JoiningDate`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_permission`
--

DROP TABLE IF EXISTS `vw_permission`;
/*!50001 DROP VIEW IF EXISTS `vw_permission`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_permission` AS SELECT 
 1 AS `Id`,
 1 AS `FeatureId`,
 1 AS `Feature`,
 1 AS `UserId`,
 1 AS `User`,
 1 AS `RoleId`,
 1 AS `Role`,
 1 AS `PermissionValue`,
 1 AS `Permission`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_user`
--

DROP TABLE IF EXISTS `vw_user`;
/*!50001 DROP VIEW IF EXISTS `vw_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_user` AS SELECT 
 1 AS `Id`,
 1 AS `PasswordHash`,
 1 AS `UserPassword`,
 1 AS `Name`,
 1 AS `Email`,
 1 AS `UserPhone`,
 1 AS `EmployeeId`,
 1 AS `EmployeeName`,
 1 AS `UserName`,
 1 AS `RoleId`,
 1 AS `Role`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'restaurant'
--
/*!50003 DROP PROCEDURE IF EXISTS `AlterBranch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterBranch`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from branch
			where
			branch.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update branch set IsActive=1
			where 
			branch.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update branch set IsActive=0
			where
			branch.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterCategory`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from category
			where
			category.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update category set IsActive=1
			where 
			category.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update category set IsActive=0
			where
			category.Id=id; 
            
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterCustomer`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from customer
			where
			customer.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update customer set IsActive=1
			where 
			customer.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update customer set IsActive=0
			where
			customer.Id=id; 
             
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterDelivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterDelivery`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from delivery
			where
			delivery.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update delivery set IsActive=1
			where 
			delivery.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update delivery set IsActive=0
			where
			delivery.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterDineIn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterDineIn`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from dinein
			where
			dinein.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update dinein set IsActive=1
			where 
			dinein.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update dinein set IsActive=0
			where
			dinein.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterDiscountKey` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterDiscountKey`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from discountkey
			where
			discountkey.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update discountkey set IsActive=1
			where 
			discountkey.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update discountkey set IsActive=0
			where
			discountkey.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterDiscountVouchers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterDiscountVouchers`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from discountvouchers
			where
			discountvouchers.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update discountvouchers set IsActive=1
			where 
			discountvouchers.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update discountvouchers set IsActive=0
			where
			discountvouchers.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterEmployee`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from employee
			where
			employee.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update employee set IsActive=1
			where 
			employee.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update employee set IsActive=0
			where
			employee.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterFeature` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterFeature`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from feature
			where
			feature.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update feature set IsActive=1
			where 
			feature.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update feature set IsActive=0
			where
			feature.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterFloor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterFloor`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from floor
			where
			floor.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update floor set IsActive=1
			where 
			floor.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update floor set IsActive=0
			where
			floor.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterItem`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from item
			where
			item.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update item set IsActive=1
			where 
			item.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update item set IsActive=0
			where
			item.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterPermission`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from permissions
			where
			permissions.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update permissions set IsActive=1
			where 
			permissions.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update permissions set IsActive=0
			where
			permissions.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterSaleOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterSaleOrder`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from saleorder
			where
			saleorder.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update saleorder set IsActive=1
			where 
			saleorder.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update saleorder set IsActive=0
			where
			saleorder.Id=id; 
             update saleorderline set IsActive=0
			where
			saleorderline.SaleOrderId=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterSaleOrderLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterSaleOrderLine`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from saleorderline
			where
			saleorderline.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update saleorderline set IsActive=1
			where 
			saleorderline.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update saleorderline set IsActive=0
			where
			saleorderline.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterShift` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterShift`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from shift
			where
			shift.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update shift set IsActive=1
			where 
			shift.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update shift set IsActive=0
			where
			shift.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterSubCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterSubCategory`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from subcategory
			where
			subcategory.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update subcategory set IsActive=1
			where 
			subcategory.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update subcategory set IsActive=0
			where
			subcategory.Id=id; 
              update item set IsActive=0
			where
			item.SubCategoryId=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterTable`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from restauranttable
			where
			restauranttable.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update restauranttable set IsActive=1
			where 
			restauranttable.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update restauranttable set IsActive=0
			where
			restauranttable.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterTakeAway` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterTakeAway`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from takeaway
			where
			takeaway.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update takeaway set IsActive=1
			where 
			takeaway.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update takeaway set IsActive=0
			where
			takeaway.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEnumValues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEnumValues`(
        in enumTypeId int
        )
BEGIN
	select * from enumvalue where enumvalue.EnumTypeId=enumTypeId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMaxId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxId`(IN `prm_TableName` VARCHAR ( 200 ))
BEGIN
	
	SET @QueryStr = 'SELECT COALESCE(MAX(Id), 0) FROM ';
	
	SET @QueryStr = CONCAT( @QueryStr, `prm_TableName` );
	PREPARE stmt1 
	FROM
		@QueryStr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageBranch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageBranch`(in id int,
     
        in Name varchar(200),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into branch (Id,Name, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,name, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update branch set 
                          Name=name,
       
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where branch.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageCategory`(in id int,
        in categoryName varchar(50),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into category (Id,CategoryName, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,categoryName, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update category set 
                         CategoryName=categoryName,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where category.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageCustomer`(in id int,
        in branchId int,
        in name varchar(100),
         in email varchar(100),
        in phone varchar(100),
         in cNIC varchar(20),
         in city varchar(200),
        in address varchar(300),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into customer (Id,BranchId,Name,Email,Phone,CNIC,City,Address, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,branchId,name,email,phone,cNIC,city,address, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update customer set 
                          BranchId=branchId,
                          Name=name,
                          Email=email,
                          Phone=phone,
                          CNIC=cNIC,
                          City=city,
                          Address=address,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where customer.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageDelivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageDelivery`(in id int,
        in phoneNo varchar(100),
        in address varchar(200),
        in sourceId int,
        in note varchar(4000),
        in Name varchar(100),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into delivery (Id,Name,PhoneNo,Address,SourceId,Note, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,name,phoneNo,address,sourceId,note, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update delivery set 
                          Name=name,
       PhoneNo=phoneNo,
       Address=address,
       SourceId=sourceId,
       Note=note,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where delivery.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageDineIn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageDineIn`(in id int,
        in resId int,
        in waiterId int,
        in tableNo int,
        in guest varchar(200),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into dinein (Id,ResId,WaiterId,TableNo,Guest, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,resId,waiterId,tableNo,guest, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update dinein set 
                          ResId=resId,
       WaiterId=waiterId,
       TableNo=tableNo,
       Guest=guest,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where dinein.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageDiscountKey` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageDiscountKey`(in id int,
        in discountKey varchar(45),
         in value int,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into discountkey (Id,DiscountKey,Value, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,discountKey,value, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update discountkey set 
                         DiscountKey=discountKey,
                         Value=value,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where discountkey.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageDiscountVouchers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageDiscountVouchers`(in id int,
        in keyValue varchar(45),
         in value int,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into discountvouchers (Id,KeyValue,Value, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,keyValue,value, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update discountvouchers set 
                         KeyValue=keyValue,
                         Value=value,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where discountvouchers.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageEmployee`(in id int,
        in branchId int,
         in name varchar(100),
         in gender varchar(45),
        in phone varchar(100),
		in designation varchar(100),
        in joiningDate datetime,
          in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into employee (Id,BranchId,Gender,Name,Phone,Designation,JoiningDate, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,branchId,gender,name,phone,designation,joiningDate, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update employee set 
                          BranchId=branchId,
                          Name=name,
                          Gender=gender,
                          Phone=phone,
                          Designation=designation,
                          JoiningDate=joiningDate,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where employee.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageFeature` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageFeature`(in id int,
        in name varchar(50),
        in description varchar(8000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into feature (Id,Name,Description, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,name,description, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
     
          update feature set  
						  Name= name,
                          Description= description,
                          CreatedOn = createdOn,
                          CreatedById =createdById,
                          ModifiedOn = modifiedOn,
                          ModifiedById = modifiedById ,
						  IsActive = isActive 				 
             where feature.Id =id;
      end if;
      
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageFloor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageFloor`(in id int,
     
        in Name varchar(200),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into floor (Id,Name, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,name, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update floor set 
                          Name=name,
       
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where floor.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageItem`(in id int,
        in categoryId int,
        in subCategoryId int,
        in itemCode varchar(6000),
         in qty int,
        in price int,
		in itemName varchar(2000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into item (Id,CategoryId,SubCategoryId,ItemCode,ItemName,Qty,Price, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,categoryId,subCategoryId,itemCode,itemName,qty,price, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update item set 
                          CategoryId=categoryId,
                          SubCategoryId=subCategoryId,
                          ItemCode=itemCode,
                          ItemName=itemName,
                          Qty=qty,
                          Price=price,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where item.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManagePermissions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManagePermissions`( 
        in id int,
        in featureId int,
        in roleId VARCHAR(255),
        in userId VARCHAR(255),
        in permissionValue int,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into permissions (Id,FeatureId,UserId,RoleId,PermissionValue, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,featureId,userId,roleId,permissionValue, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update permissions set 
                          FeatureId=featureId,
                          UserId=userId,
                          RoleId=roleId,
                         PermissionValue=permissionValue,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where permissions.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageSaleOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageSaleOrder`(in id int,
        in orderTypeId int,
        in customerId int,
        in tableNo varchar(200),
         in waiterId varchar(255),
        in restaurantId int,
        in guest varchar(200),
         in phoneNo varchar(200),
        in name varchar(200),
        in address varchar(200),
         in note varchar(5000),
        in sourceId int,
        
        in total int,
        in discount int,
        in gST int,
        in statusId int,
		in service int,
        in netTotal int,
        in paymentMethod varchar(45),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into saleorder (Id,OrderTypeId,CustomerId,TableNo,WaiterId,
           RestaurantId,Guest,PhoneNo,Name,Address,Note,SourceId,
           Total,Discount,GST,StatusId,Service,NetTotal,PaymentMethod ,CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,orderTypeId,customerId,tableNo,waiterId,restaurantId,guest,
           phoneNo,name,address,note,sourceId,
           total,discount,gST,statusId,service,netTotal,paymentMethod, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update saleorder set 
            OrderTypeId=orderTypeId,
            CustomerId=customerId,
            TableNo=tableNo,
            WaiterId=waiterId,
            RestaurantId=restaurantId,
            Guest=guest,
            PhoneNo=phoneNo,
            Name=name,
            Address=address,
            Note=note,
            SourceId=sourceId,
                          Total=total,
                          Discount=discount,
                          GST=gST,
                          StatusId=statusId,
                          Service=service,
                          NetTotal=netTotal,
                 PaymentMethod=paymentMethod,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where saleorder.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageSaleOrderLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageSaleOrderLine`(in id int,
        in saleOrderId int,
        in itemName varchar(500),
        in itemCode varchar(5000),
         in qTY int,
        in price int,
		in lineTotal int,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into saleorderline (Id,SaleOrderId,LineTotal,ItemCode,ItemName,QTY,Price, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,saleOrderId,lineTotal,itemCode,itemName,qTY,price, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update saleorderline set 
                          SaleOrderId=saleOrderId,
                          LineTotal=lineTotal,
                          ItemCode=itemCode,
                          ItemName=itemName,
                          QTY=qTY,
                          Price=price,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where saleorderline.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageShift` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageShift`(in id int,
        in shiftValueId int,
        in floatingCash varchar(2000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into shift (Id,ShiftValueId,FloatingCash, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,shiftValueId,floatingCash, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update shift set 
                          ShiftValueId=shiftValueId,
                          FloatingCash=floatingCash,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where shift.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageSubCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageSubCategory`(in id int,
        in categoryId int,
        in subCategoryName varchar(45),
    
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into subcategory (Id,CategoryId,SubCategoryName, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,categoryId,subCategoryName, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update subcategory set 
                          CategoryId=categoryId,
                          SubCategoryName=subCategoryName,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where subcategory.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageTable`(in id int,
     
        in Name varchar(200),
        in floorId int,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into restauranttable (Id,FloorId,Name, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,floorId,name, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update restauranttable set 
                          Name=name,
       FloorId=floorId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where restauranttable.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageTakeAway` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageTakeAway`(in id int,
     
        in customerId int,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into takeaway (Id,CustomerId, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,customerId, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update takeaway set 
                          CustomerId=customerId,
       
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where takeaway.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageThemeData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageThemeData`(in id int,
        in source varchar(6000),
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
		 
           insert into themedata (Id,Source ) 
           values (id,source );
 end if;   
/*update*/
 if DBoperation ='Delete'
 then
           truncate table themedata;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchBranch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchBranch`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`branch`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCategory`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`category`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCustomer`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_customer`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchDelivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchDelivery`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			delivery  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchDineIn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchDineIn`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			dinein  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchDiscountKey` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchDiscountKey`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`discountkey`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchDiscountVouchers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchDiscountVouchers`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`discountvouchers`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchEmployee`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_employee`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchFeature` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchFeature`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			feature  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchFloor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchFloor`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`floor`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchItem`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`item`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchPermissions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchPermissions`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_permission`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchSaleOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSaleOrder`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`saleorder`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchSaleOrderLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSaleOrderLine`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`saleorderline`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchShift` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchShift`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_shift`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchSubCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSubCategory`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`subcategory`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchTable`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`restauranttable`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchTakeAway` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchTakeAway`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			takeaway  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchThemeData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchThemeData`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`themedata`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUser`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_user`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_customer`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer` AS select `customer`.`Id` AS `Id`,`customer`.`BranchId` AS `BranchId`,`branch`.`Name` AS `BranchName`,`customer`.`Name` AS `Name`,`customer`.`Email` AS `Email`,`customer`.`Phone` AS `Phone`,`customer`.`CNIC` AS `CNIC`,`customer`.`City` AS `City`,`customer`.`Address` AS `Address`,`customer`.`CreatedOn` AS `CreatedOn`,`customer`.`CreatedById` AS `CreatedById`,`customer`.`ModifiedOn` AS `ModifiedOn`,`customer`.`ModifiedById` AS `ModifiedById`,`customer`.`IsActive` AS `IsActive` from (`customer` join `branch` on((`branch`.`Id` = `customer`.`BranchId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_employee`
--

/*!50001 DROP VIEW IF EXISTS `vw_employee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employee` AS select `employee`.`Id` AS `Id`,`employee`.`Gender` AS `Gender`,`employee`.`BranchId` AS `BranchId`,`branch`.`Name` AS `BranchName`,`employee`.`Name` AS `Name`,`employee`.`Phone` AS `Phone`,`employee`.`Designation` AS `Designation`,`employee`.`JoiningDate` AS `JoiningDate`,`employee`.`CreatedOn` AS `CreatedOn`,`employee`.`CreatedById` AS `CreatedById`,`employee`.`ModifiedOn` AS `ModifiedOn`,`employee`.`ModifiedById` AS `ModifiedById`,`employee`.`IsActive` AS `IsActive` from (`employee` join `branch` on((`branch`.`Id` = `employee`.`BranchId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_permission`
--

/*!50001 DROP VIEW IF EXISTS `vw_permission`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_permission` AS select `p`.`Id` AS `Id`,`p`.`FeatureId` AS `FeatureId`,`fea`.`Name` AS `Feature`,`p`.`UserId` AS `UserId`,`us`.`UserName` AS `User`,`p`.`RoleId` AS `RoleId`,`ro`.`Name` AS `Role`,`p`.`PermissionValue` AS `PermissionValue`,`ev`.`Value` AS `Permission`,`p`.`IsActive` AS `IsActive` from ((((`permissions` `p` join `enumvalue` `ev` on((`ev`.`Id` = `p`.`PermissionValue`))) join `feature` `fea` on((`fea`.`Id` = `p`.`FeatureId`))) left join `aspnetusers` `us` on((`p`.`UserId` = `us`.`Id`))) left join `aspnetroles` `ro` on((`p`.`RoleId` = `ro`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_user`
--

/*!50001 DROP VIEW IF EXISTS `vw_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_user` AS select `user`.`Id` AS `Id`,`user`.`PasswordHash` AS `PasswordHash`,`user`.`UserPassword` AS `UserPassword`,`user`.`Name` AS `Name`,`user`.`Email` AS `Email`,`user`.`PhoneNumber` AS `UserPhone`,`user`.`EmployeeId` AS `EmployeeId`,`emp`.`Name` AS `EmployeeName`,`user`.`UserName` AS `UserName`,`urole`.`RoleId` AS `RoleId`,`role`.`Name` AS `Role` from (((`aspnetusers` `user` join `employee` `emp` on((`emp`.`Id` = `user`.`EmployeeId`))) join `aspnetuserroles` `urole` on((`urole`.`UserId` = `user`.`Id`))) join `aspnetroles` `role` on((`urole`.`RoleId` = `role`.`Id`))) */;
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

-- Dump completed on 2023-02-07  0:15:47
