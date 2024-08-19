CREATE DATABASE  IF NOT EXISTS `restaurant` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurant`;
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
INSERT INTO `aspnetuserroles` VALUES ('5fc0342a-5727-450f-ae26-0eede5c0c28b','1058f9d1-15a6-4da9-b6bd-18d9badcc9d1'),('4bdf2399-9ba4-4d1f-96e4-eaf32c16bf49','2749de9e-fb86-40ab-ad63-c54ce0433eb9'),('8169998e-5db4-42ca-887c-c85c68e5c5eb','2749de9e-fb86-40ab-ad63-c54ce0433eb9'),('ab169d87-a803-48a4-84c2-43c7ed250287','2749de9e-fb86-40ab-ad63-c54ce0433eb9'),('e9cc6389-7908-4093-ad6d-b673b6e2475f','2749de9e-fb86-40ab-ad63-c54ce0433eb9'),('03ed5909-03a3-45b3-8078-0de377027137','c3692c13-8f23-4bfb-9144-5ed13ff5157b'),('03ed5909-03a3-45b3-8078-0de377027137','f6b1ceb8-d7bc-4416-8f4b-af7a9b228bc3'),('b6ce1cc0-f2a8-491d-805c-db1e75146b9d','f6b1ceb8-d7bc-4416-8f4b-af7a9b228bc3');
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
INSERT INTO `aspnetusers` VALUES ('03ed5909-03a3-45b3-8078-0de377027137',8,'S@34ameer','Anmol',NULL,NULL,NULL,NULL,'S@34ameer','S@34AMEER','Anmol@gmail.com','ANMOL@GMAIL.COM',0,'AQAAAAEAACcQAAAAEJDqlHDFyk9sxrzXZ6sKx06zNjKFzQ8J6z3Pps/uiTbGy1EtHGJjAZtzOJkc/tmSig==','HUSDUXSF5OHD5BH25PS7UH3EMLETTCZB','46752993-4867-4ce9-bbd5-4009828e4845','0987657612',0,0,NULL,1,0),('4bdf2399-9ba4-4d1f-96e4-eaf32c16bf49',5,'789075','Martin',NULL,NULL,NULL,NULL,'789075','789075','Martin@gmail.com','MARTIN@GMAIL.COM',0,'AQAAAAEAACcQAAAAEFks0asS7jRu4yq/NC/UR6rYXhNhOwC+C1XuhOQI03BfzO1CzHSsFqifGtF1JzPeGg==','6PJHY25TCNOZ7X7MQXW7TKA5U4OFWBH4','ce0f0542-71a2-439e-9474-f619f6c0f2d0','1234567897',0,0,NULL,1,0),('53f7fb76-b848-4c9a-b4a5-cd074ec22d8b',5,'S@3ameer','Sumaira',NULL,NULL,NULL,NULL,'S@3ameer','S@3AMEER','bintameer212@gmail.com','BINTAMEER212@GMAIL.COM',0,'AQAAAAEAACcQAAAAEI/znrK0PzlOZY/Q6GXcByDq/3N0dV//iw/L7jALlYeRuh0jjFxHwhsiEYAc+AddpA==','SRAQJYHMY4M5TZO3XVHHGZMXDTONZBM3','e88a11e8-4c91-4c3f-8b80-a101a00f96e8','1234567891',0,0,NULL,1,0),('5fc0342a-5727-450f-ae26-0eede5c0c28b',6,'78987','Peter',NULL,NULL,NULL,NULL,'78987','78987','Peter@gmail.com','PETER@GMAIL.COM',0,'AQAAAAEAACcQAAAAEItKsa3mKEUbcDLn2YB+AngN/Lp63Y7vpumdyUEflcCxiX3VRIbTT/o+7wUaiYkfpg==','XR2IUQ2BEAGCFOC77USXTLKHY6PT5UD7','4b00754b-5aa0-417a-9385-314ee58ec078','1234567897',0,0,NULL,1,0),('8169998e-5db4-42ca-887c-c85c68e5c5eb',2,'12345','Jasika',NULL,NULL,NULL,NULL,'12345','12345','Jasika@gmail.com','JASIKA@GMAIL.COM',0,'AQAAAAEAACcQAAAAEEHNqBZkGr7aWKFCbBLbWWg1a72aE8GfEHf8Uw7LjnTEqXfLxzojAYxvWNWD8RQODw==','VKEKXMGC56LETFXPFEIEFBSQLUPK6P6K','5c326514-5417-4f44-aaa7-40257e04387e','1234567897',0,0,NULL,1,0),('ab169d87-a803-48a4-84c2-43c7ed250287',3,'1234','Eric',NULL,NULL,NULL,NULL,'1234','1234','Eric@gmail.com','ERIC@GMAIL.COM',0,'AQAAAAEAACcQAAAAENndOFFwC7WsqdJ0/d9uKQQc4zQgwLOmmZf/J3ZMgJ8qD20MpUHaXFBB6z4GvRziiA==','OPM5GFDY7KVLLS522ZXI7UB2B6GTGSH5','1e1d7d3b-6e2d-454d-a648-5b6133de3861','1234567897',0,0,NULL,1,0),('b6ce1cc0-f2a8-491d-805c-db1e75146b9d',4,'7890','John',NULL,NULL,NULL,NULL,'7890','7890','John@gmail.com','JOHN@GMAIL.COM',0,'AQAAAAEAACcQAAAAEOSFr2mBKkb76klhrlYkz/YjjcTr5GMyr5EcSChvkHa465ONO9+LFhHbHEgAwkthAQ==','FXB5Z4NSHVJQOKIKU3DW2ZRVJ7RQJUWR','8c99bf94-102a-4e99-9354-214ec6739592','1234567897',0,0,NULL,1,0),('e9cc6389-7908-4093-ad6d-b673b6e2475f',1,'090078601','Elena',NULL,NULL,NULL,NULL,'090078601','090078601','Elena@gmail.com','ELENA@GMAIL.COM',0,'AQAAAAEAACcQAAAAENM3cAffHTk4GqAwc0a3GzgU8ngqQ1iVmUCKIsrrvkRUsR7Vm2jQPtoDD8DVErBs0g==','LDCJYINXTR3EGC7X4DL4VSPO2BN6T254','e8e2d006-1973-40d7-a32b-c9d14c734d36','1234567897',0,0,NULL,1,0);
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
  `BranchId` int DEFAULT NULL,
  `ChartAccountId` int DEFAULT NULL,
  `Name` varchar(2000) DEFAULT NULL,
  `BranchCode` varchar(1000) DEFAULT NULL,
  `Type` varchar(1000) DEFAULT NULL,
  `Location` varchar(2000) DEFAULT NULL,
  `UploadStatus` bit(1) DEFAULT NULL,
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
INSERT INTO `branch` VALUES (1,NULL,NULL,'ABC',NULL,NULL,NULL,NULL,'2023-01-26 07:47:16',0,'0001-01-01 00:00:00',0,_binary '\0'),(2,NULL,NULL,'test',NULL,NULL,NULL,NULL,'2023-01-26 07:49:07',0,'0001-01-01 00:00:00',0,_binary '\0'),(3,NULL,NULL,'Testing....',NULL,NULL,NULL,NULL,'2023-01-26 07:50:56',0,'0001-01-01 00:00:00',0,_binary '\0'),(4,NULL,NULL,'Branch_1',NULL,NULL,NULL,NULL,'2023-01-26 07:47:16',0,'0001-01-01 00:00:00',0,_binary ''),(5,NULL,NULL,'Branch_2',NULL,NULL,NULL,NULL,'2023-01-26 07:53:06',0,'0001-01-01 00:00:00',0,_binary ''),(6,NULL,NULL,'Branch_3',NULL,NULL,NULL,NULL,'2023-01-26 07:53:13',0,'0001-01-01 00:00:00',0,_binary ''),(7,6,NULL,'Branch_4','code','type','location',_binary '','2023-01-30 00:48:13',0,'0001-01-01 00:00:00',0,_binary ''),(8,NULL,NULL,'branch5...',NULL,NULL,NULL,NULL,'2023-01-31 19:00:08',0,'0001-01-01 00:00:00',0,_binary '\0'),(9,7,NULL,'Testing','code','type','loc',_binary '','2023-03-07 19:59:33',0,'0001-01-01 00:00:00',0,_binary '\0'),(10,0,NULL,'test','code',NULL,NULL,_binary '\0','2023-03-07 20:10:57',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_obsolete`
--

DROP TABLE IF EXISTS `category_obsolete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_obsolete` (
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
-- Dumping data for table `category_obsolete`
--

LOCK TABLES `category_obsolete` WRITE;
/*!40000 ALTER TABLE `category_obsolete` DISABLE KEYS */;
INSERT INTO `category_obsolete` VALUES (1,'Drinks','2022-12-21 17:24:58',0,'2022-12-21 17:24:58',0,_binary '\0'),(2,'FastFood','2022-12-22 05:02:40',0,'2022-12-22 05:02:40',0,_binary ''),(3,'Drinks','2022-12-28 13:10:10',0,'0001-01-01 00:00:00',0,_binary ''),(4,'Dessert','2022-12-28 13:49:54',0,'0001-01-01 00:00:00',0,_binary ''),(5,'Main Dish...','2022-12-28 13:50:01',0,'0001-01-01 00:00:00',0,_binary '\0'),(6,'MyLunch','2022-12-31 13:05:22',0,'0001-01-01 00:00:00',0,_binary '\0'),(7,NULL,'2022-12-31 13:06:21',0,'0001-01-01 00:00:00',0,_binary '\0'),(8,'juises','2022-12-31 13:14:56',0,'0001-01-01 00:00:00',0,_binary '\0'),(9,'Appetizers','2022-12-31 20:41:12',0,'0001-01-01 00:00:00',0,_binary '\0'),(10,'Appetizers','2022-12-31 20:51:57',0,'0001-01-01 00:00:00',0,_binary '\0'),(11,'Abc','2022-12-31 20:52:25',0,'0001-01-01 00:00:00',0,_binary '\0'),(12,'asdkkk','2022-12-31 20:55:29',0,'0001-01-01 00:00:00',0,_binary '\0'),(13,'Appi','2022-12-31 21:12:57',0,'0001-01-01 00:00:00',0,_binary '\0'),(14,'Appetizers...','2022-12-31 21:29:02',0,'0001-01-01 00:00:00',0,_binary '\0'),(15,'Appetizers','2022-12-31 21:34:53',0,'0001-01-01 00:00:00',0,_binary '\0'),(16,'Appetizers...','2022-12-31 21:35:34',0,'0001-01-01 00:00:00',0,_binary '\0'),(17,'Appetizers','2023-01-01 21:10:16',0,'0001-01-01 00:00:00',0,_binary '\0'),(18,'Appi','2023-01-01 21:11:51',0,'0001-01-01 00:00:00',0,_binary '\0'),(19,'Appetizers','2023-01-02 22:24:27',0,'0001-01-01 00:00:00',0,_binary '\0'),(20,'Appi','2023-01-02 22:28:25',0,'0001-01-01 00:00:00',0,_binary '\0'),(21,'Appetizers...','2023-01-02 22:29:01',0,'0001-01-01 00:00:00',0,_binary '\0'),(22,'Appetizers','2023-01-02 22:32:25',0,'0001-01-01 00:00:00',0,_binary '\0'),(23,'Appetizers...','2023-01-02 22:33:19',0,'0001-01-01 00:00:00',0,_binary '\0'),(24,'Appetizers','2023-01-02 22:45:42',0,'0001-01-01 00:00:00',0,_binary '\0'),(25,'Appetizers','2023-01-30 00:09:23',0,'0001-01-01 00:00:00',0,_binary ''),(26,'Salads','2023-01-31 17:37:46',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `category_obsolete` ENABLE KEYS */;
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
-- Table structure for table `delivery_obsolete`
--

DROP TABLE IF EXISTS `delivery_obsolete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_obsolete` (
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
  CONSTRAINT `delivery_fk_1` FOREIGN KEY (`SourceId`) REFERENCES `enumline` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_obsolete`
--

LOCK TABLES `delivery_obsolete` WRITE;
/*!40000 ALTER TABLE `delivery_obsolete` DISABLE KEYS */;
INSERT INTO `delivery_obsolete` VALUES (1,1003001,'123456789','CustomerName','Customer Address','write something here','2023-01-27 01:00:59',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `delivery_obsolete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dinein_obsolete`
--

DROP TABLE IF EXISTS `dinein_obsolete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dinein_obsolete` (
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
-- Dumping data for table `dinein_obsolete`
--

LOCK TABLES `dinein_obsolete` WRITE;
/*!40000 ALTER TABLE `dinein_obsolete` DISABLE KEYS */;
/*!40000 ALTER TABLE `dinein_obsolete` ENABLE KEYS */;
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
INSERT INTO `employee` VALUES (1,4,'Elena Manuel','1234543875','FeMale','junior','2023-01-01 19:00:00','2023-01-26 09:43:39',0,'0001-01-01 00:00:00',0,_binary ''),(2,5,'Jasika Kavin','1234543875...','FeMale','junior...','2023-01-18 19:00:00','2023-01-26 09:43:55',0,'0001-01-01 00:00:00',0,_binary ''),(3,4,'Eric Hakan','1234567897','Male','des...','2023-01-01 19:00:00','2023-01-26 09:43:39',0,'2023-01-26 09:43:39',0,_binary ''),(4,5,'John Luca','1234567897','Male','des...','2023-01-01 19:00:00','2023-01-26 09:43:39',0,'2023-01-26 09:43:39',0,_binary ''),(5,4,'Martin Thomas','1234567897','Male','des...','2023-01-01 19:00:00','2023-01-26 09:43:39',0,'2023-01-26 09:43:39',0,_binary ''),(6,4,'Peter Mustafa','1234567897','Male','des...','2023-01-01 19:00:00','2023-01-26 09:43:39',0,'2023-01-26 09:43:39',0,_binary ''),(7,5,'Sumaira...','1234543875...',NULL,'junior...','2023-01-11 19:00:00','2023-01-31 18:56:11',0,'0001-01-01 00:00:00',0,_binary '\0'),(8,4,'Sumaira','1234543875','FeMale','junior','2023-01-01 19:00:00','2023-02-03 02:20:47',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumline`
--

DROP TABLE IF EXISTS `enumline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enumline` (
  `Id` int NOT NULL,
  `EnumTypeId` int NOT NULL,
  `ParentId` int DEFAULT NULL,
  `KeyCode` varchar(2000) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  `IsSystemDefined` bit(1) DEFAULT NULL,
  `UploadStatus` bit(1) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `enumvalue_fk1_idx` (`EnumTypeId`),
  CONSTRAINT `enumline_ibfk_1` FOREIGN KEY (`EnumTypeId`) REFERENCES `enums` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumline`
--

LOCK TABLES `enumline` WRITE;
/*!40000 ALTER TABLE `enumline` DISABLE KEYS */;
INSERT INTO `enumline` VALUES (1000001,1000,0,'Permissions_ReadOnly','ReadOnly',NULL,_binary '',_binary '','2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1000002,1000,0,'Permissions_FullAccess','FullAccess',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1000003,1000,0,'Permissions_Deny','Deny',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1001001,1001,0,'Statuses_Open','Open',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1001002,1001,0,'Statuses_InProgress','InProgress',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1001003,1001,0,'Statuses_Close','Close',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1001004,1001,0,'Statuses_Dispatched','Dispatched',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1001005,1001,0,'Statuses_Delivered','Delivered',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1002001,1002,0,'Shift_Morning','Morning',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1002002,1002,0,'Shift_Evening','Evening',NULL,_binary '',_binary '\0','2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1003001,1003,NULL,'Sources_Careem','Careem',NULL,_binary '\0',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1004001,1004,0,'OrderTypes_TakeAway','TakeAway',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1004002,1004,0,'OrderTypes_DineIn','DineIn',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1004003,1004,0,'OrderTypes_Delivery','Delivery',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1005001,1005,0,'DiscountTypes_DiscountVoucher','DiscountVoucher',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1005002,1005,0,'DiscountTypes_DiscountKey','DiscountKey',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1006001,1006,NULL,'-8126464','Mehron',NULL,_binary '',NULL,'2023-03-04 23:11:48',0,NULL,NULL,_binary ''),(1006002,1006,NULL,'-8978343','Purple',NULL,_binary '',NULL,'2023-03-04 23:11:48',0,NULL,NULL,_binary ''),(1006003,1006,NULL,'-16759672','Navy Blue',NULL,_binary '',NULL,'2023-03-04 23:11:48',0,NULL,NULL,_binary ''),(1006004,1006,NULL,'-16743292','C Green',NULL,_binary '',NULL,'2023-03-04 23:11:49',0,NULL,NULL,_binary ''),(1006005,1006,NULL,'-14781184','Green',NULL,_binary '',NULL,'2023-03-04 23:11:49',0,NULL,NULL,_binary ''),(1006006,1006,NULL,'-9342720','Mehndi',NULL,_binary '',NULL,'2023-03-04 23:11:49',0,NULL,NULL,_binary ''),(1006007,1006,NULL,'-8963072','Red Wine',NULL,_binary '',NULL,'2023-03-04 23:11:49',0,NULL,NULL,_binary ''),(1006008,1006,NULL,'-12895429','Red Grey',NULL,_binary '',NULL,'2023-03-04 23:11:49',0,NULL,NULL,_binary ''),(1006009,1006,NULL,'-5220352','DarkOrange',NULL,_binary '',NULL,'2023-03-04 23:11:49',0,NULL,NULL,_binary ''),(1006010,1006,NULL,'-16777216','Black',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006011,1006,NULL,'-1','White',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006012,1006,NULL,'-4144960','Silver',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006013,1006,NULL,'-1197159','Liver',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006014,1006,NULL,'2822177','Light Sky',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006015,1006,NULL,'-1978646','Light Purp',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006016,1006,NULL,'-533393','Light Yellow',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006017,1006,NULL,'-8011287','Light Sky Hard',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006018,1006,NULL,'-4343956','Dark Khaki',NULL,_binary '',NULL,'2023-03-04 23:11:51',0,NULL,NULL,_binary ''),(1006019,1006,NULL,'-29532','Light Red',NULL,_binary '',NULL,'2023-03-04 23:11:51',0,NULL,NULL,_binary ''),(1006020,1006,NULL,'-4063386','Greeny Yellow',NULL,_binary '',NULL,'2023-03-04 23:11:51',0,NULL,NULL,_binary ''),(1007001,1007,NULL,'N/A','N/A',NULL,_binary '',NULL,'2023-03-05 21:43:08',0,NULL,NULL,_binary ''),(1008001,1008,NULL,'Ltr','Ltr',NULL,_binary '',NULL,'2023-03-05 21:55:22',0,NULL,NULL,_binary ''),(1008002,1008,NULL,'Kg','Kg',NULL,_binary '',NULL,'2023-03-05 21:55:23',0,NULL,NULL,_binary ''),(1008003,1008,NULL,'Pcs','Pcs',NULL,_binary '',NULL,'2023-03-05 21:55:23',0,NULL,NULL,_binary ''),(1008004,1008,NULL,'ml','ml',NULL,_binary '',NULL,'2023-03-05 21:55:24',0,NULL,NULL,_binary ''),(1008005,1008,NULL,'gm','gm',NULL,_binary '',NULL,'2023-03-05 21:55:24',0,NULL,NULL,_binary ''),(1008006,1008,NULL,'Chicken_Bucket','Chicken Bucket',NULL,_binary '',NULL,'2023-03-05 21:55:25',0,NULL,NULL,_binary ''),(1010001,1010,NULL,'Small','Small',NULL,_binary '',NULL,'2023-03-05 22:35:04',0,NULL,NULL,_binary ''),(1010002,1010,NULL,'Medium','Medium',NULL,_binary '',NULL,'2023-03-05 22:35:05',0,NULL,NULL,_binary ''),(1010003,1010,NULL,'Large','Large',NULL,_binary '',NULL,'2023-03-05 22:35:05',0,NULL,NULL,_binary ''),(1012001,1012,NULL,'Raw_Item','Raw Item',NULL,_binary '',NULL,'2023-03-05 23:03:55',0,NULL,NULL,_binary ''),(1012002,1012,NULL,'Menu_Item','Menu Item',NULL,_binary '',NULL,'2023-03-05 23:03:56',0,NULL,NULL,_binary ''),(1014001,1014,1022001,'Menu_Category_Burger','Burger',NULL,_binary '\0',_binary '\0','2023-03-06 02:22:52',0,'0001-01-01 00:00:00',0,_binary ''),(1014002,1014,1022001,'Menu_Category_Pizza','Pizza',NULL,_binary '\0',_binary '\0','2023-03-06 02:23:08',0,'0001-01-01 00:00:00',0,_binary ''),(1014003,1014,1022002,'Menu_Category_Tea','Tea',NULL,_binary '\0',_binary '\0','2023-03-06 02:24:19',0,'0001-01-01 00:00:00',0,_binary ''),(1014004,1014,1022002,'Menu_Category_Coffee','Coffee',NULL,_binary '\0',_binary '\0','2023-03-13 01:31:31',0,'0001-01-01 00:00:00',0,_binary ''),(1014005,1014,1022002,'Menu_Category_Milk_Shakes','Milk Shakes',NULL,_binary '\0',_binary '\0','2023-03-13 01:42:34',0,'0001-01-01 00:00:00',0,_binary ''),(1015001,1015,1023001,'Item_Sub_Category_Cooking_Kitchen','Cooking Kitchen',NULL,_binary '\0',_binary '\0','2023-03-12 19:33:03',0,'0001-01-01 00:00:00',0,_binary ''),(1015002,1015,1023001,'Item_Sub_Category_Packing_Kitchen','Packing Kitchen',NULL,_binary '\0',_binary '\0','2023-03-12 19:37:38',0,'0001-01-01 00:00:00',0,_binary ''),(1016001,1016,0,'Floor_Floor_1','Floor 1',NULL,_binary '\0',_binary '\0','2023-03-07 20:16:14',0,'0001-01-01 00:00:00',0,_binary ''),(1016002,1016,0,'Floor_Floor_2','Floor 2',NULL,_binary '\0',_binary '\0','2023-03-07 20:16:24',0,'0001-01-01 00:00:00',0,_binary ''),(1016003,1016,0,'Floor_Floor_3','Floor 3',NULL,_binary '\0',_binary '\0','2023-03-07 20:17:01',0,'0001-01-01 00:00:00',0,_binary ''),(1017001,1017,1016001,'Table_T1','T1',NULL,_binary '\0',_binary '\0','2023-03-07 20:17:50',0,'0001-01-01 00:00:00',0,_binary ''),(1017002,1017,1016001,'Table_T2','T2',NULL,_binary '\0',_binary '\0','2023-03-07 20:18:14',0,'0001-01-01 00:00:00',0,_binary ''),(1017003,1017,1016002,'Table_T3','T3',NULL,_binary '\0',_binary '\0','2023-03-07 20:18:27',0,'0001-01-01 00:00:00',0,_binary ''),(1017004,1017,1016003,'Table_T4','T4',NULL,_binary '\0',_binary '\0','2023-03-07 20:18:39',0,'0001-01-01 00:00:00',0,_binary ''),(1017005,1017,1016003,'Table_T5','T5',NULL,_binary '\0',_binary '\0','2023-03-07 20:18:51',0,'0001-01-01 00:00:00',0,_binary ''),(1017006,1017,1016003,'Table_T6','T6',NULL,_binary '\0',_binary '\0','2023-03-07 20:19:05',0,'0001-01-01 00:00:00',0,_binary ''),(1018001,1018,0,'Back_Office_Settings','Settings',NULL,_binary '',_binary '\0','2023-03-10 09:21:57',0,'0001-01-01 00:00:00',0,_binary ''),(1018002,1018,0,'Back_Office_Inventory','Inventory',NULL,_binary '',_binary '\0','2023-03-10 09:22:11',0,'0001-01-01 00:00:00',0,_binary ''),(1018003,1018,0,'Back_Office_Reports','Reports',NULL,_binary '',_binary '\0','2023-03-11 00:04:50',0,'0001-01-01 00:00:00',0,_binary ''),(1018004,1018,0,'Back_Office_Accounts','Accounts',NULL,_binary '',_binary '\0','2023-03-11 19:44:07',0,'0001-01-01 00:00:00',0,_binary ''),(1018005,1018,0,'Back_Office_Downloads','Downloads',NULL,_binary '',_binary '\0','2023-03-11 19:44:25',0,'0001-01-01 00:00:00',0,_binary ''),(1018006,1018,0,'Back_Office_Others','Others',NULL,_binary '',_binary '\0','2023-03-11 00:05:54',0,'0001-01-01 00:00:00',0,_binary ''),(1019001,1019,1018001,'/backOffice/items','1. Product',NULL,_binary '',_binary '\0','2023-03-10 09:22:54',0,'0001-01-01 00:00:00',0,_binary ''),(1019002,1019,1018001,'/backOffice/sale','2. Sale',NULL,_binary '',_binary '\0','2023-03-10 09:23:10',0,'0001-01-01 00:00:00',0,_binary ''),(1019005,1019,1018003,'/restaurant/saleReport','Sale Report',NULL,_binary '\0',_binary '\0','2023-03-11 00:05:25',0,'0001-01-01 00:00:00',0,_binary ''),(1019006,1019,1018006,'http://localhost:4200/#/items/manageSetting?type=1016','Floor',NULL,_binary '\0',_binary '\0','2023-03-11 00:07:02',0,'0001-01-01 00:00:00',0,_binary ''),(1019007,1019,1018006,'http://localhost:4200/#/items/manageSetting?type=1017','Table',NULL,_binary '\0',_binary '\0','2023-03-11 00:07:21',0,'0001-01-01 00:00:00',0,_binary ''),(1019008,1019,1018006,'/restaurant/manageRider','Rider',NULL,_binary '\0',_binary '\0','2023-03-11 00:07:54',0,'0001-01-01 00:00:00',0,_binary ''),(1019010,1019,1018001,'/backOffice/companyProfile','3. Company Profile',NULL,_binary '',_binary '\0','2023-03-11 19:34:00',0,'0001-01-01 00:00:00',0,_binary ''),(1019011,1019,1018001,'/backOffice/employeeManagement','4. Emp Management',NULL,_binary '',_binary '\0','2023-03-11 19:37:53',0,'0001-01-01 00:00:00',0,_binary ''),(1019012,1019,1018001,'/backOffice/deals','5. Deals',NULL,_binary '',_binary '\0','2023-03-11 19:39:12',0,'0001-01-01 00:00:00',0,_binary ''),(1019013,1019,1018002,'/restaurant/rawItemList','1. Add Raw Item',NULL,_binary '',_binary '\0','2023-03-11 19:50:22',0,'0001-01-01 00:00:00',0,_binary ''),(1019014,1019,1018002,'/restaurant/commingSoon','2. Purchase Order',NULL,_binary '',_binary '\0','2023-03-11 19:50:43',0,'0001-01-01 00:00:00',0,_binary ''),(1019015,1019,1018002,'/restaurant/commingSoon','3. Purchase Item',NULL,_binary '',_binary '\0','2023-03-11 19:51:03',0,'0001-01-01 00:00:00',0,_binary ''),(1019016,1019,1018002,'/restaurant/commingSoon','4. Purchase Return',NULL,_binary '',_binary '\0','2023-03-11 19:51:57',0,'0001-01-01 00:00:00',0,_binary ''),(1019017,1019,1018002,'/restaurant/commingSoon','5. Demand',NULL,_binary '',_binary '\0','2023-03-11 19:52:27',0,'0001-01-01 00:00:00',0,_binary ''),(1019018,1019,1018002,'/restaurant/commingSoon','6. Issue Stock',NULL,_binary '',_binary '\0','2023-03-11 19:52:49',0,'0001-01-01 00:00:00',0,_binary ''),(1019019,1019,1018002,'/restaurant/commingSoon','7. Inventory Transfer',NULL,_binary '',_binary '\0','2023-03-11 19:53:21',0,'0001-01-01 00:00:00',0,_binary ''),(1019020,1019,1018002,'/restaurant/commingSoon','8. Complete Waste',NULL,_binary '',_binary '\0','2023-03-11 19:54:01',0,'0001-01-01 00:00:00',0,_binary ''),(1019021,1019,1018002,'/restaurant/commingSoon','9. Critical Inventory',NULL,_binary '',_binary '\0','2023-03-11 19:54:43',0,'0001-01-01 00:00:00',0,_binary ''),(1019022,1019,1018002,'/restaurant/commingSoon','10. Kitchen Demand',NULL,_binary '',_binary '\0','2023-03-11 19:55:24',0,'0001-01-01 00:00:00',0,_binary ''),(1019023,1019,1018002,'/restaurant/commingSoon','11. Kitchen Insurance',NULL,_binary '',_binary '\0','2023-03-11 19:56:33',0,'0001-01-01 00:00:00',0,_binary ''),(1019024,1019,1018002,'/restaurant/commingSoon','12. Stock Estimation',NULL,_binary '',_binary '\0','2023-03-11 19:57:03',0,'0001-01-01 00:00:00',0,_binary ''),(1019025,1019,1018006,'/restaurant/commingSoon','Vendor',NULL,_binary '',_binary '\0','2023-03-12 23:52:48',0,'0001-01-01 00:00:00',0,_binary ''),(1020001,1020,1019001,'http://localhost:4200/#/items/manageSetting?type=1021','1.1 Group',NULL,_binary '',_binary '\0','2023-03-10 09:25:17',0,'0001-01-01 00:00:00',0,_binary ''),(1020002,1020,1019001,'http://localhost:4200/#/items/manageSetting?type=1023','1.2 Category',NULL,_binary '',_binary '\0','2023-03-10 23:57:57',0,'0001-01-01 00:00:00',0,_binary ''),(1020003,1020,1019001,'http://localhost:4200/#/items/manageSetting?type=1015','1.3 Sub Category',NULL,_binary '',_binary '\0','2023-03-10 23:58:14',0,'0001-01-01 00:00:00',0,_binary ''),(1020006,1020,1019001,'/stakeholder/supplierList','1.4 Supplier','',_binary '',_binary '\0','2023-03-10 10:14:55',0,'0001-01-01 00:00:00',0,_binary ''),(1020008,1020,1019001,'http://localhost:4200/#/items/manageSetting?type=1007','1.5 Brand',NULL,_binary '',_binary '\0','2023-03-11 22:51:03',0,'0001-01-01 00:00:00',0,_binary ''),(1020009,1020,1019001,'/items/manageStore','1.6 Srore',NULL,_binary '',_binary '\0','2023-03-10 23:40:28',0,'0001-01-01 00:00:00',0,_binary ''),(1020011,1020,1019001,'/restaurant/manageBranch','1.7 Branch',NULL,_binary '',_binary '\0','2023-03-10 23:49:45',0,'0001-01-01 00:00:00',0,_binary ''),(1020013,1020,1019001,'http://localhost:4200/#/items/manageSetting?type=1010','1.8 Size',NULL,_binary '',_binary '\0','2023-03-10 23:56:21',0,'0001-01-01 00:00:00',0,_binary ''),(1020014,1020,1019001,'http://localhost:4200/#/items/manageSetting?type=1006','1.9 Color',NULL,_binary '',_binary '\0','2023-03-10 23:56:53',0,'0001-01-01 00:00:00',0,_binary ''),(1020022,1020,1019010,'/restaurant/commingSoon','3.1 Company Info',NULL,_binary '',_binary '\0','2023-03-11 20:28:11',0,'0001-01-01 00:00:00',0,_binary ''),(1020023,1020,1019010,'/restaurant/commingSoon','3.2 Expenses',NULL,_binary '',_binary '\0','2023-03-11 20:30:44',0,'0001-01-01 00:00:00',0,_binary ''),(1020024,1020,1019011,'/restaurant/commingSoon','4.1 Users',NULL,_binary '',_binary '\0','2023-03-11 20:32:09',0,'0001-01-01 00:00:00',0,_binary ''),(1020025,1020,1019012,'/restaurant/commingSoon','5.1 Deal Head',NULL,_binary '',_binary '\0','2023-03-11 20:50:23',0,'0001-01-01 00:00:00',0,_binary ''),(1020026,1020,1019012,'/restaurant/commingSoon','5.2 Deals',NULL,_binary '',_binary '\0','2023-03-11 20:50:48',0,'0001-01-01 00:00:00',0,_binary ''),(1020027,1020,1019012,'/restaurant/commingSoon','5.3 Attach Menu',NULL,_binary '',_binary '\0','2023-03-11 20:51:23',0,'0001-01-01 00:00:00',0,_binary ''),(1020028,1020,1019011,'/restaurant/commingSoon','4.2 Staff',NULL,_binary '',_binary '\0','2023-03-11 20:53:49',0,'0001-01-01 00:00:00',0,_binary ''),(1020029,1020,1019011,'/restaurant/commingSoon','4.3 Employees Sale',NULL,_binary '',_binary '\0','2023-03-11 20:54:28',0,'0001-01-01 00:00:00',0,_binary ''),(1020030,1020,1019011,'/stakeholder/empList','4.4 Employees',NULL,_binary '',_binary '\0','2023-03-11 20:55:24',0,'0001-01-01 00:00:00',0,_binary ''),(1020031,1020,1019011,'/restaurant/commingSoon','4.5 Employees Salary',NULL,_binary '',_binary '\0','2023-03-11 20:56:02',0,'0001-01-01 00:00:00',0,_binary ''),(1020032,1020,1019011,'/restaurant/commingSoon','4.6 Attendance',NULL,_binary '',_binary '\0','2023-03-11 20:56:30',0,'0001-01-01 00:00:00',0,_binary ''),(1020033,1020,1019011,'/restaurant/commingSoon','4.7 Employee Statement',NULL,_binary '',_binary '\0','2023-03-11 20:57:05',0,'0001-01-01 00:00:00',0,_binary ''),(1020034,1020,1019001,'http://localhost:4200/#/items/manageSetting?type=1008','1.10 UOM',NULL,_binary '',_binary '\0','2023-03-11 22:52:33',0,'0001-01-01 00:00:00',0,_binary ''),(1020035,1020,1019001,'/items/manageUOMConvrsn','1.11 UOM Conversion',NULL,_binary '',_binary '\0','2023-03-11 22:52:57',0,'0001-01-01 00:00:00',0,_binary ''),(1020036,1020,1019001,'/items/manageSetting','Item Settings',NULL,_binary '',_binary '\0','2023-03-11 22:59:11',0,'0001-01-01 00:00:00',0,_binary ''),(1020037,1020,1019002,'http://localhost:4200/#/items/manageSetting?type=1022','2.1 Menu Group',NULL,_binary '',_binary '\0','2023-03-11 23:09:57',0,'0001-01-01 00:00:00',0,_binary ''),(1020038,1020,1019002,'http://localhost:4200/#/items/manageSetting?type=1014','2.3 Menu Category',NULL,_binary '',_binary '\0','2023-03-13 01:08:06',0,'0001-01-01 00:00:00',0,_binary ''),(1020039,1020,1019002,'/restaurant/itemList','2.2 Menu Item',NULL,_binary '',_binary '\0','2023-03-11 23:10:30',0,'0001-01-01 00:00:00',0,_binary ''),(1020040,1020,1019002,'/restaurant/commingSoon','2.4 MOP',NULL,_binary '',_binary '\0','2023-03-11 23:11:04',0,'0001-01-01 00:00:00',0,_binary ''),(1020041,1020,1019002,'/restaurant/commingSoon','2.5 Printer Setting',NULL,_binary '',_binary '\0','2023-03-11 23:11:29',0,'0001-01-01 00:00:00',0,_binary ''),(1020042,1020,1019002,'/restaurant/commingSoon','2.6 Recipe Modifier',NULL,_binary '',_binary '\0','2023-03-11 23:12:48',0,'0001-01-01 00:00:00',0,_binary ''),(1020043,1020,1019002,'/restaurant/commingSoon','2.7 GST',NULL,_binary '',_binary '\0','2023-03-11 23:13:05',0,'0001-01-01 00:00:00',0,_binary ''),(1020044,1020,1019002,'/restaurant/commingSoon','2.8 Device Setting',NULL,_binary '',_binary '\0','2023-03-11 23:13:27',0,'0001-01-01 00:00:00',0,_binary ''),(1020045,1020,1019002,'/restaurant/commingSoon','2.9 Online DB Setting',NULL,_binary '',_binary '\0','2023-03-11 23:14:33',0,'0001-01-01 00:00:00',0,_binary ''),(1020046,1020,1019002,'/restaurant/commingSoon','2.10 Layout Setting',NULL,_binary '',_binary '\0','2023-03-11 23:14:53',0,'0001-01-01 00:00:00',0,_binary ''),(1020047,1020,1019002,'/restaurant/commingSoon','2.11 KOT Setting',NULL,_binary '',_binary '\0','2023-03-11 23:15:12',0,'0001-01-01 00:00:00',0,_binary ''),(1020048,1020,1019002,'/stakeholder/custList','2.12 Costumer Info',NULL,_binary '',_binary '\0','2023-03-11 23:15:41',0,'0001-01-01 00:00:00',0,_binary ''),(1020049,1020,1019002,'/restaurant/commingSoon','2.13 Member Point Setting',NULL,_binary '',_binary '\0','2023-03-11 23:16:08',0,'0001-01-01 00:00:00',0,_binary ''),(1020050,1020,1019002,'/restaurant/commingSoon','2.14  Modifier',NULL,_binary '',_binary '\0','2023-03-11 23:16:54',0,'0001-01-01 00:00:00',0,_binary ''),(1020051,1020,1019002,'/restaurant/discountKey','2.15 Discount Keys',NULL,_binary '',_binary '\0','2023-03-11 23:17:30',0,'0001-01-01 00:00:00',0,_binary ''),(1020052,1020,1019002,'http://localhost:4200/#/items/manageSetting?type=1002','2.16 Shift',NULL,_binary '',_binary '\0','2023-03-11 23:17:52',0,'0001-01-01 00:00:00',0,_binary ''),(1020053,1020,1019002,'/restaurant/commingSoon','2.17 Service Charges',NULL,_binary '',_binary '\0','2023-03-11 23:18:15',0,'0001-01-01 00:00:00',0,_binary ''),(1020054,1020,1019002,'/restaurant/commingSoon','2.18 Banks',NULL,_binary '',_binary '\0','2023-03-11 23:18:57',0,'0001-01-01 00:00:00',0,_binary ''),(1020055,1020,1019002,'/restaurant/manageLoyaltyCard','2.19 Loyalty Card',NULL,_binary '',_binary '\0','2023-03-11 23:19:18',0,'0001-01-01 00:00:00',0,_binary ''),(1020056,1020,1019002,'/restaurant/commingSoon','2.20 Print Type',NULL,_binary '',_binary '\0','2023-03-11 23:19:42',0,'0001-01-01 00:00:00',0,_binary ''),(1020057,1020,1019002,'/restaurant/commingSoon','2.21 Discount Compaign ',NULL,_binary '',_binary '\0','2023-03-11 23:21:00',0,'0001-01-01 00:00:00',0,_binary ''),(1020058,1020,1019002,'/restaurant/commingSoon','2.22 Order Source',NULL,_binary '',_binary '\0','2023-03-11 23:21:21',0,'0001-01-01 00:00:00',0,_binary ''),(1020059,1020,1019002,'/restaurant/commingSoon','2.23 Sub Items',NULL,_binary '',_binary '\0','2023-03-11 23:21:58',0,'0001-01-01 00:00:00',0,_binary ''),(1020060,1020,1019002,'/restaurant/vouchersDiscount','2.24 Vouchers',NULL,_binary '',_binary '\0','2023-03-11 23:22:17',0,'0001-01-01 00:00:00',0,_binary ''),(1020061,1020,1019002,'/restaurant/commingSoon','2.25 Table Design',NULL,_binary '',_binary '\0','2023-03-11 23:22:42',0,'0001-01-01 00:00:00',0,_binary ''),(1020062,1020,1019002,'/restaurant/commingSoon','2.26 Attach Menu',NULL,_binary '',_binary '\0','2023-03-11 23:23:32',0,'0001-01-01 00:00:00',0,_binary ''),(1020063,1020,1019002,'/restaurant/commingSoon','2.27 Currency',NULL,_binary '',_binary '\0','2023-03-13 01:11:53',0,'0001-01-01 00:00:00',0,_binary ''),(1021001,1021,0,'Item_Group_Kitchen','Kitchen',NULL,_binary '',_binary '\0','2023-03-12 18:59:14',0,'0001-01-01 00:00:00',0,_binary ''),(1022001,1022,0,'Menu_Item_Group_Fast_Food','Fast Food',NULL,_binary '\0',_binary '\0','2023-03-12 19:11:02',0,'0001-01-01 00:00:00',0,_binary ''),(1022002,1022,0,'Menu_Item_Group_Drinks','Drinks',NULL,_binary '\0',_binary '\0','2023-03-12 19:11:45',0,'0001-01-01 00:00:00',0,_binary ''),(1022003,1022,0,'Menu_Item_Group_Dessert','Dessert',NULL,_binary '\0',_binary '\0','2023-03-12 19:11:54',0,'0001-01-01 00:00:00',0,_binary ''),(1023001,1023,1021001,'Item_Category_Pizza_Kitchen','Pizza Kitchen',NULL,_binary '\0',_binary '\0','2023-03-12 19:32:17',0,'0001-01-01 00:00:00',0,_binary ''),(1023002,1023,1021001,'Item_Category_Juices_Kitchen_Bar','Juices Kitchen Bar',NULL,_binary '\0',_binary '\0','2023-03-12 19:37:15',0,'0001-01-01 00:00:00',0,_binary ''),(1024001,1024,0,'KDS_Main_KDS','Main KDS',NULL,_binary '',_binary '\0','2023-03-13 00:27:16',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `enumline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enums`
--

DROP TABLE IF EXISTS `enums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enums` (
  `Id` int NOT NULL,
  `ParentId` int DEFAULT NULL,
  `KeyCode` varchar(2000) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  `IsSystemDefined` bit(1) DEFAULT NULL,
  `UploadStatus` bit(1) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enums`
--

LOCK TABLES `enums` WRITE;
/*!40000 ALTER TABLE `enums` DISABLE KEYS */;
INSERT INTO `enums` VALUES (1000,NULL,'Permissions','Permissions',NULL,_binary '',_binary '','2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1001,NULL,'Statuses','Statuses',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1002,NULL,'Shift','Shift',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1003,NULL,'Sources','Sources',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1004,NULL,'OrderTypes','OrderTypes',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1005,NULL,'DiscountTypes','DiscountTypes',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1006,0,'Colors','Colors',NULL,_binary '',NULL,'2023-03-04 23:11:48',0,'0001-01-01 00:00:00',0,_binary ''),(1007,0,'Brands','Brands',NULL,_binary '',NULL,'2023-03-05 21:43:08',0,'0001-01-01 00:00:00',0,_binary ''),(1008,0,'UOM','UOM',NULL,_binary '',NULL,'2023-03-05 21:55:22',0,'0001-01-01 00:00:00',0,_binary ''),(1009,NULL,'Branch','Branch',NULL,_binary '\0',_binary '\0','2023-03-05 22:07:21',0,'0001-01-01 00:00:00',0,_binary '\0'),(1010,0,'Sizes','Sizes',NULL,_binary '',NULL,'2023-03-05 22:35:04',0,'0001-01-01 00:00:00',0,_binary ''),(1011,0,'Stores','Stores',NULL,_binary '\0',_binary '\0','2023-03-05 22:40:17',0,'0001-01-01 00:00:00',0,_binary '\0'),(1012,NULL,'Item_Types','Item Types',NULL,_binary '',_binary '\0','2023-03-05 23:03:55',0,'0001-01-01 00:00:00',0,_binary ''),(1013,0,'Group','Group',NULL,_binary '',NULL,'2023-03-06 01:08:58',0,'0001-01-01 00:00:00',0,_binary ''),(1014,1022,'Menu_Category','Menu Category',NULL,_binary '',_binary '\0','2023-03-06 01:23:21',0,'0001-01-01 00:00:00',0,_binary ''),(1015,1023,'Item_Sub_Category','Item Sub Category',NULL,_binary '',_binary '\0','2023-03-06 01:23:38',0,'0001-01-01 00:00:00',0,_binary ''),(1016,0,'Floor','Floor',NULL,_binary '',_binary '\0','2023-03-07 20:15:25',0,'0001-01-01 00:00:00',0,_binary ''),(1017,1016,'Table','Table',NULL,_binary '',_binary '\0','2023-03-07 20:15:46',0,'0001-01-01 00:00:00',0,_binary ''),(1018,0,'Back_Office','Back Office',NULL,_binary '',_binary '\0','2023-03-10 09:16:15',0,'0001-01-01 00:00:00',0,_binary ''),(1019,1018,'/sideMenu','Side Menu',NULL,_binary '',_binary '\0','2023-03-10 09:21:21',0,'0001-01-01 00:00:00',0,_binary ''),(1020,1019,'Side_SubMenu','Side SubMenu',NULL,_binary '',_binary '\0','2023-03-10 09:21:40',0,'0001-01-01 00:00:00',0,_binary ''),(1021,1013,'Item_Group','Item Group',NULL,_binary '',_binary '\0','2023-03-12 18:03:09',0,'0001-01-01 00:00:00',0,_binary ''),(1022,1013,'Menu_Item_Group','Menu Item Group',NULL,_binary '',_binary '\0','2023-03-12 18:11:38',0,'0001-01-01 00:00:00',0,_binary ''),(1023,1021,'Item_Category','Item Category',NULL,_binary '',_binary '\0','2023-03-12 19:25:38',0,'0001-01-01 00:00:00',0,_binary ''),(1024,0,'KDS','KDS',NULL,_binary '',_binary '\0','2023-03-13 00:26:50',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `enums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `Id` int NOT NULL,
  `SupplierId` int DEFAULT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Terminal` varchar(1000) DEFAULT NULL,
  `Amount` varchar(1000) DEFAULT NULL,
  `Comments` varchar(3000) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `UserId` (`UserId`),
  KEY `SupplierId` (`SupplierId`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`SupplierId`) REFERENCES `supplier` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,2,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d','2023-02-20 00:58:18',NULL,'3460','Comments','2023-02-20 00:58:18',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
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
-- Table structure for table `floor_obsolete`
--

DROP TABLE IF EXISTS `floor_obsolete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floor_obsolete` (
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
-- Dumping data for table `floor_obsolete`
--

LOCK TABLES `floor_obsolete` WRITE;
/*!40000 ALTER TABLE `floor_obsolete` DISABLE KEYS */;
INSERT INTO `floor_obsolete` VALUES (1,'F-1...','2023-02-04 22:49:51',0,'0001-01-01 00:00:00',0,_binary '\0'),(2,'F-1','2023-02-04 23:09:06',0,'0001-01-01 00:00:00',0,_binary '\0'),(3,'F-1','2023-02-04 23:20:54',0,'0001-01-01 00:00:00',0,_binary ''),(4,'F-2','2023-02-06 15:20:16',0,'0001-01-01 00:00:00',0,_binary ''),(5,'F-3','2023-02-06 15:20:28',0,'0001-01-01 00:00:00',0,_binary ''),(6,'F-4','2023-02-06 15:32:50',0,'0001-01-01 00:00:00',0,_binary '\0'),(7,'F-5','2023-02-06 15:32:58',0,'0001-01-01 00:00:00',0,_binary '\0'),(8,'F-6','2023-02-06 15:33:02',0,'0001-01-01 00:00:00',0,_binary '\0'),(9,'F-7','2023-02-06 15:33:08',0,'0001-01-01 00:00:00',0,_binary '\0'),(10,'g','2023-02-06 15:48:49',0,'0001-01-01 00:00:00',0,_binary '\0'),(11,'j','2023-02-06 15:48:52',0,'0001-01-01 00:00:00',0,_binary '\0'),(12,'j','2023-02-06 15:48:56',0,'0001-01-01 00:00:00',0,_binary '\0'),(13,'t','2023-02-06 15:48:59',0,'0001-01-01 00:00:00',0,_binary '\0'),(14,'q','2023-02-06 15:49:03',0,'0001-01-01 00:00:00',0,_binary '\0'),(15,'w','2023-02-06 15:49:07',0,'0001-01-01 00:00:00',0,_binary '\0'),(16,'e','2023-02-06 15:49:10',0,'0001-01-01 00:00:00',0,_binary '\0'),(17,'e','2023-02-06 15:49:38',0,'0001-01-01 00:00:00',0,_binary '\0'),(18,'v','2023-02-06 15:49:42',0,'0001-01-01 00:00:00',0,_binary '\0'),(19,'x','2023-02-06 15:49:45',0,'0001-01-01 00:00:00',0,_binary '\0'),(20,'z','2023-02-06 15:49:49',0,'0001-01-01 00:00:00',0,_binary '\0'),(21,'a','2023-02-06 15:49:52',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `floor_obsolete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gst`
--

DROP TABLE IF EXISTS `gst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gst` (
  `Id` int NOT NULL,
  `GST` int DEFAULT NULL,
  `ReceiptTitle` varchar(45) DEFAULT NULL,
  `PaymentTypeId` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `foreign_key_1_idx` (`PaymentTypeId`),
  CONSTRAINT `gst_ibfk_1` FOREIGN KEY (`PaymentTypeId`) REFERENCES `enumline` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gst`
--

LOCK TABLES `gst` WRITE;
/*!40000 ALTER TABLE `gst` DISABLE KEYS */;
/*!40000 ALTER TABLE `gst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `Id` int NOT NULL,
  `ItemTypeId` int DEFAULT NULL,
  `CategoryId` int DEFAULT NULL,
  `SubCategoryId` int DEFAULT NULL,
  `GroupId` int DEFAULT NULL,
  `ColorId` int DEFAULT NULL,
  `KDSId` int DEFAULT NULL,
  `BranchId` int DEFAULT NULL,
  `UOMId` int DEFAULT NULL,
  `SizeId` int DEFAULT NULL,
  `SupplierId` int DEFAULT NULL,
  `StoreId` int DEFAULT NULL,
  `BrandId` int DEFAULT NULL,
  `FontColorId` int DEFAULT NULL,
  `VendorId` int DEFAULT NULL,
  `KDSId2` int DEFAULT NULL,
  `ItemCode` varchar(6000) DEFAULT NULL,
  `BarCode` varchar(5000) DEFAULT NULL,
  `ItemName` varchar(2000) DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `FontSize` varchar(45) DEFAULT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  `PackingName` varchar(45) DEFAULT NULL,
  `Target` float DEFAULT NULL,
  `CurrentMargin` float DEFAULT NULL,
  `ProposedMargin` float DEFAULT NULL,
  `MinOrderLevel` varchar(45) DEFAULT NULL,
  `MaxOrderLevel` varchar(45) DEFAULT NULL,
  `PackingQty` int DEFAULT NULL,
  `TotalItemsAllowed` int DEFAULT NULL,
  `IsCritical` bit(1) DEFAULT NULL,
  `OptionalModifier` bit(1) DEFAULT NULL,
  `ManualQty` bit(1) DEFAULT NULL,
  `MakingTime` varchar(45) DEFAULT NULL,
  `AlarmTime` varchar(45) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,NULL,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code1',NULL,'Herbal Tea',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-21 17:37:31',0,'2022-12-21 17:37:31',0,_binary '\0'),(2,NULL,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code2',NULL,'Black Tea',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-21 17:37:31',0,'2022-12-21 17:37:31',0,_binary '\0'),(3,NULL,2,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'CheeseBurger',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary '\0'),(4,NULL,2,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'BeanBurger',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary '\0'),(5,NULL,2,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'Veggie Burger',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary '\0'),(6,NULL,2,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'PortobelloMushroomBurger',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary '\0'),(7,NULL,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'Veggie Pizza',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary '\0'),(8,NULL,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'Pepperoni Pizza',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary '\0'),(9,NULL,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'Meat Pizza',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary '\0'),(10,NULL,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'Margherita Pizza',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary '\0'),(11,NULL,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'BBQ Chicken Pizza',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary '\0'),(12,NULL,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'Hawaiian Pizza',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary '\0'),(13,NULL,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'Buffalo Pizza',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary '\0'),(14,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Code',NULL,'Cappuccino',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(15,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Code',NULL,'Latte',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(16,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Code',NULL,'Decaf',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(17,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Code',NULL,'Macchiato',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(18,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Code',NULL,'Espresso',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(19,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Code',NULL,'Americano',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(20,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Code',NULL,'Caramel Macchiato',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(21,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Code',NULL,'Coffee Coca',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(22,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Code',NULL,'Doppio',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(23,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Code',NULL,'Long Black',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(24,NULL,0,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1006',NULL,'Black Tea...',120,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-28 13:16:21',0,'0001-01-01 00:00:00',0,_binary '\0'),(25,NULL,0,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Code',NULL,'Black Tea',90,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-28 13:23:10',0,'0001-01-01 00:00:00',0,_binary '\0'),(26,NULL,0,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'Green Tea',60,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-28 13:23:26',0,'0001-01-01 00:00:00',0,_binary '\0'),(27,NULL,0,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code...',NULL,'Ice Cream',120,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-28 13:50:44',0,'0001-01-01 00:00:00',0,_binary '\0'),(28,NULL,0,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'Sobert',200,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-28 13:50:55',0,'0001-01-01 00:00:00',0,_binary '\0'),(29,NULL,0,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'Gelato',90,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-28 13:51:09',0,'0001-01-01 00:00:00',0,_binary '\0'),(30,NULL,0,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1001',NULL,'Potato Chips',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-31 20:42:03',0,'0001-01-01 00:00:00',0,_binary '\0'),(31,NULL,0,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1002',NULL,'Corn Chips',80,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-31 20:42:20',0,'0001-01-01 00:00:00',0,_binary '\0'),(32,NULL,0,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1003',NULL,'Vegetable Chips...',150,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-31 20:42:39',0,'0001-01-01 00:00:00',0,_binary '\0'),(33,NULL,0,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'ui',NULL,'ty',789,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-31 20:56:21',0,'0001-01-01 00:00:00',0,_binary '\0'),(34,NULL,0,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1001',NULL,'Potato Chips..',150,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-31 21:29:59',0,'0001-01-01 00:00:00',0,_binary '\0'),(35,NULL,0,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1002',NULL,'Corn Chips',130,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-31 21:30:14',0,'0001-01-01 00:00:00',0,_binary '\0'),(36,NULL,0,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1001',NULL,'Potato Chips',120,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-31 21:36:15',0,'0001-01-01 00:00:00',0,_binary '\0'),(37,NULL,0,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1002',NULL,'Corn Chips',140,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-31 21:36:28',0,'0001-01-01 00:00:00',0,_binary '\0'),(38,NULL,0,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1009',NULL,'Vegetable Chips...',200,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-31 21:36:45',0,'0001-01-01 00:00:00',0,_binary '\0'),(39,NULL,0,24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1001',NULL,'Potato Chips',120,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-02 22:29:38',0,'0001-01-01 00:00:00',0,_binary '\0'),(40,NULL,0,24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1002',NULL,'Corn Chips',130,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-02 22:29:52',0,'0001-01-01 00:00:00',0,_binary '\0'),(41,NULL,0,24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1004',NULL,'Vegetable Chips...',200,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-02 22:30:10',0,'0001-01-01 00:00:00',0,_binary '\0'),(42,NULL,0,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1001',NULL,'Potato Chips',120,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-02 22:33:49',0,'0001-01-01 00:00:00',0,_binary '\0'),(43,NULL,0,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1002',NULL,'Corn Chips',150,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-02 22:34:03',0,'0001-01-01 00:00:00',0,_binary '\0'),(44,NULL,0,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1004',NULL,'Vegetable Chips...',200,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-02 22:34:20',0,'0001-01-01 00:00:00',0,_binary '\0'),(45,NULL,0,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1001',NULL,'Potato Chips',120,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-02 22:46:20',0,'0001-01-01 00:00:00',0,_binary '\0'),(46,NULL,0,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1005',NULL,'Corn Chips...',200,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-02 22:46:34',0,'0001-01-01 00:00:00',0,_binary '\0'),(47,NULL,0,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1003',NULL,'Vegetable Chips',130,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-02 22:46:52',0,'0001-01-01 00:00:00',0,_binary '\0'),(48,NULL,0,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1001',NULL,'Vegetable Soup',500,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-30 00:17:45',0,'0001-01-01 00:00:00',0,_binary '\0'),(49,NULL,0,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1002',NULL,'Chili Soup',400,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-30 00:27:24',0,'0001-01-01 00:00:00',0,_binary '\0'),(50,NULL,0,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1002',NULL,'Chili Soup',400,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-30 00:37:01',0,'0001-01-01 00:00:00',0,_binary '\0'),(51,NULL,0,36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1009',NULL,'green salad',200,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-31 17:41:01',0,'0001-01-01 00:00:00',0,_binary '\0'),(52,NULL,0,36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1006',NULL,'Mixed salad',200,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-31 17:41:33',0,'0001-01-01 00:00:00',0,_binary '\0'),(53,NULL,0,37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'18930',NULL,'Black Cofee',200,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-04 02:10:03',0,'0001-01-01 00:00:00',0,_binary '\0'),(54,NULL,0,32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'82738',NULL,'Potato Chips',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-04 02:11:36',0,'0001-01-01 00:00:00',0,_binary '\0'),(55,NULL,1005028,1005031,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'code',NULL,'MyPizza',200,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 02:37:13',0,'0001-01-01 00:00:00',0,_binary '\0'),(56,NULL,1005028,1005032,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'MyBurger',NULL,'MyBurger',300,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 02:40:08',0,'0001-01-01 00:00:00',0,_binary '\0'),(57,NULL,1005028,1005031,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Meat_Pizza',NULL,'Meat Pizza',300,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 02:52:46',0,'0001-01-01 00:00:00',0,_binary '\0'),(58,NULL,1005028,1005032,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Veggie_Burger',NULL,'Veggie Burger',100,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 10:22:58',0,'0001-01-01 00:00:00',0,_binary '\0'),(59,1012002,1012005,1012008,1012004,1006001,0,1009001,1008006,1010002,1,1011001,1007001,1006011,NULL,NULL,'Chicken_Burger12',NULL,'Chicken Burger12',300,1,'10','des',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-06 01:30:53',0,'0001-01-01 00:00:00',0,_binary '\0'),(63,1012002,1014002,1015004,1013002,0,0,0,0,0,0,0,0,0,NULL,NULL,'Black_coffee',NULL,'Black coffee',200,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-07 11:12:10',0,'0001-01-01 00:00:00',0,_binary '\0'),(64,1012002,1014001,0,1022001,1006001,1024001,5,0,1010001,1,1,1007001,1006002,0,0,'Zinger_Burger','0','Zinger Burger',200,1,'12','des','0',NULL,0,0,'0','0001-01-01 00:00:00',0,0,NULL,_binary '\0',NULL,NULL,NULL,'0001-01-01 00:00:00',NULL,'2023-03-13 00:36:53',0,'0001-01-01 00:00:00',0,_binary ''),(65,1012001,1023001,1015002,1021001,0,0,0,1008002,0,0,0,0,0,0,0,'Flour','1','Flour',45678,1,NULL,'des','Packing Name',0,0,0,'1','2',3,0,_binary '',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,'2023-03-13 00:55:45',0,'0001-01-01 00:00:00',0,_binary ''),(66,1012002,1014001,0,1022001,0,0,0,0,0,0,0,0,0,0,0,'Regular_Burger','0','Regular Burger',200,1,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,NULL,'2023-03-13 01:13:45',0,'0001-01-01 00:00:00',0,_binary ''),(67,1012002,1014002,0,1022001,0,0,0,0,0,0,0,0,0,0,0,'Tikka_Pizza','0','Tikka Pizza',700,1,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,NULL,'2023-03-13 01:16:15',0,'0001-01-01 00:00:00',0,_binary ''),(68,1012002,1014002,0,1022001,0,0,0,0,0,0,0,0,0,0,0,'Chicken_Pizza','0','Chicken Pizza',600,1,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,NULL,'2023-03-13 01:16:49',0,'0001-01-01 00:00:00',0,_binary ''),(69,1012002,1014003,0,1022002,0,0,0,0,0,0,0,0,0,0,0,'Black_Tea','0','Black Tea',100,1,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,NULL,'2023-03-13 01:17:20',0,'0001-01-01 00:00:00',0,_binary ''),(70,1012002,1014003,0,1022002,0,0,0,0,0,0,0,0,0,0,0,'Green_Tea','0','Green Tea',80,1,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,NULL,'2023-03-13 01:17:40',0,'0001-01-01 00:00:00',0,_binary ''),(71,1012002,1014001,0,1022001,0,0,0,0,0,0,0,0,0,0,0,'Signature_Burger','0','Signature Burger',150,1,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,NULL,'2023-03-13 01:44:24',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyaltycard`
--

DROP TABLE IF EXISTS `loyaltycard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyaltycard` (
  `Id` int NOT NULL,
  `CardNo` varchar(500) DEFAULT NULL,
  `DiscountPercentage` varchar(100) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `PhoneNo` varchar(255) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyaltycard`
--

LOCK TABLES `loyaltycard` WRITE;
/*!40000 ALTER TABLE `loyaltycard` DISABLE KEYS */;
INSERT INTO `loyaltycard` VALUES (1,'11223','20','Ibtaha','0987654325','2023-02-24 01:15:09',0,'0001-01-01 00:00:00',0,1),(2,'45','7','g','g','2023-02-24 01:16:42',0,'0001-01-01 00:00:00',0,0),(3,'12345','10','Walli','0987654325','2023-02-24 01:24:16',0,'0001-01-01 00:00:00',0,1),(4,'1122...','30','Humaira...','09876543258','2023-02-24 19:27:21',0,'0001-01-01 00:00:00',0,0),(5,'112235','10','Humaira','0987654325','2023-02-24 20:33:01',0,'0001-01-01 00:00:00',0,0),(6,'112239','10','Humaira','0987654325','2023-02-24 20:34:25',0,'0001-01-01 00:00:00',0,0);
/*!40000 ALTER TABLE `loyaltycard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberpoints`
--

DROP TABLE IF EXISTS `memberpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberpoints` (
  `Id` int NOT NULL,
  `MinSale` int DEFAULT NULL,
  `MaxSale` int DEFAULT NULL,
  `Points` float DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberpoints`
--

LOCK TABLES `memberpoints` WRITE;
/*!40000 ALTER TABLE `memberpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `memberpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onlinedbsetting`
--

DROP TABLE IF EXISTS `onlinedbsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `onlinedbsetting` (
  `Id` int NOT NULL,
  `ServerName` varchar(45) DEFAULT NULL,
  `DatabaseName` varchar(45) DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlinedbsetting`
--

LOCK TABLES `onlinedbsetting` WRITE;
/*!40000 ALTER TABLE `onlinedbsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `onlinedbsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersource`
--

DROP TABLE IF EXISTS `ordersource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordersource` (
  `Id` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `PriceIncreament` float DEFAULT NULL,
  `PrintInvoice` bit(1) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersource`
--

LOCK TABLES `ordersource` WRITE;
/*!40000 ALTER TABLE `ordersource` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordersource` ENABLE KEYS */;
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
-- Table structure for table `restauranttable_obsolete`
--

DROP TABLE IF EXISTS `restauranttable_obsolete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restauranttable_obsolete` (
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
  CONSTRAINT `table_fk_1` FOREIGN KEY (`FloorId`) REFERENCES `floor_obsolete` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restauranttable_obsolete`
--

LOCK TABLES `restauranttable_obsolete` WRITE;
/*!40000 ALTER TABLE `restauranttable_obsolete` DISABLE KEYS */;
INSERT INTO `restauranttable_obsolete` VALUES (1,1,'T-1...','2023-02-04 23:05:21',0,'0001-01-01 00:00:00',0,_binary '\0'),(2,2,'T-1','2023-02-04 23:12:46',0,'0001-01-01 00:00:00',0,_binary ''),(3,3,'T1','2023-02-04 23:21:02',0,'0001-01-01 00:00:00',0,_binary ''),(4,3,'T2','2023-02-06 15:20:50',0,'0001-01-01 00:00:00',0,_binary ''),(5,3,'T3','2023-02-06 15:21:03',0,'0001-01-01 00:00:00',0,_binary ''),(6,4,'T4','2023-02-06 15:21:14',0,'0001-01-01 00:00:00',0,_binary ''),(7,4,'T5','2023-02-06 15:21:19',0,'0001-01-01 00:00:00',0,_binary ''),(8,4,'T6','2023-02-06 15:21:24',0,'0001-01-01 00:00:00',0,_binary ''),(9,4,'T7','2023-02-06 15:21:30',0,'0001-01-01 00:00:00',0,_binary ''),(10,5,'T9','2023-02-06 15:21:44',0,'0001-01-01 00:00:00',0,_binary ''),(11,5,'T10','2023-02-06 15:21:51',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `restauranttable_obsolete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rider`
--

DROP TABLE IF EXISTS `rider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rider` (
  `Id` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `PhoneNo` varchar(255) DEFAULT NULL,
  `Email` varchar(1000) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rider`
--

LOCK TABLES `rider` WRITE;
/*!40000 ALTER TABLE `rider` DISABLE KEYS */;
INSERT INTO `rider` VALUES (1,'Aaftab','09876543498','Aaftab@gmail.com','2023-02-24 01:04:00',0,'0001-01-01 00:00:00',0,1),(2,'abc','345678',NULL,'2023-02-24 01:04:41',0,'0001-01-01 00:00:00',0,0),(3,'Urhan','0987654323','urhan@gmail.com','2023-02-24 01:05:11',0,'0001-01-01 00:00:00',0,1);
/*!40000 ALTER TABLE `rider` ENABLE KEYS */;
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
  `ShiftId` int DEFAULT NULL,
  `SourceId` int DEFAULT NULL,
  `StatusId` int DEFAULT NULL,
  `WaiterId` varchar(255) DEFAULT NULL,
  `CustomerId` varchar(255) DEFAULT NULL,
  `RestaurantId` int DEFAULT NULL,
  `DiscountTypeId` int DEFAULT NULL,
  `RiderId` int DEFAULT NULL,
  `BillTitle` varchar(500) DEFAULT NULL,
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
  `DispatchedTime` datetime DEFAULT NULL,
  `DeliveryTime` datetime DEFAULT NULL,
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
  KEY `saleorder_ibfk_2_idx` (`ShiftId`),
  KEY `saleorder_ibfk_3_idx` (`DiscountTypeId`),
  CONSTRAINT `saleorder_fk_1` FOREIGN KEY (`OrderTypeId`) REFERENCES `enumline` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saleorder_fk_2` FOREIGN KEY (`StatusId`) REFERENCES `enumline` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saleorder_fk_3` FOREIGN KEY (`SourceId`) REFERENCES `enumline` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saleorder_ibfk_1` FOREIGN KEY (`WaiterId`) REFERENCES `aspnetusers` (`Id`),
  CONSTRAINT `saleorder_ibfk_2` FOREIGN KEY (`ShiftId`) REFERENCES `enumline` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saleorder_ibfk_3` FOREIGN KEY (`DiscountTypeId`) REFERENCES `enumline` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleorder`
--

LOCK TABLES `saleorder` WRITE;
/*!40000 ALTER TABLE `saleorder` DISABLE KEYS */;
INSERT INTO `saleorder` VALUES (1,1004002,1002001,NULL,1001002,'ab169d87-a803-48a4-84c2-43c7ed250287',NULL,NULL,1005001,0,'F-2 / T5',NULL,NULL,NULL,300,NULL,8,16,'F-2 / T5',NULL,0,324,'Cash',NULL,NULL,'2023-02-24 16:28:06',0,'0001-01-01 00:00:00',0,1),(2,1004002,1002001,NULL,1001002,'4bdf2399-9ba4-4d1f-96e4-eaf32c16bf49',NULL,NULL,NULL,0,'Floor 1 / T1',NULL,NULL,NULL,1487,NULL,10,0,'Floor 1 / T1',NULL,0,1339,'Card',NULL,NULL,'2023-02-24 16:28:06',0,'0001-01-01 00:00:00',0,1),(4,1004003,1002001,1003001,1001005,NULL,NULL,NULL,NULL,1,'D-ABC','ABC','address','0987654345',280,NULL,10,16,NULL,NULL,0,296,'Cash','2023-02-25 11:39:31','2023-02-25 13:14:40','2023-02-25 11:38:50',0,'0001-01-01 00:00:00',0,1),(5,1004003,1002001,1003001,1001005,NULL,NULL,NULL,NULL,3,'D-Mahad','Mahad','Address','0987654334',500,NULL,10,16,NULL,NULL,0,530,'Cash','2023-02-25 11:51:26','2023-02-25 11:52:02','2023-02-25 11:49:01',0,'0001-01-01 00:00:00',0,1),(6,1004003,1002001,1003001,1001005,NULL,NULL,NULL,NULL,1,'D-Sulman','Sulman','Address','0987654325',100,NULL,0,16,NULL,NULL,0,116,'Cash','2023-02-25 13:17:11','2023-03-13 12:01:20','2023-02-25 13:00:24',0,'0001-01-01 00:00:00',0,1),(7,1004001,1002001,NULL,1001003,NULL,'999',NULL,NULL,0,'999',NULL,NULL,NULL,400,NULL,0,16,NULL,NULL,0,464,'Cash',NULL,NULL,'2023-02-25 18:24:08',0,'0001-01-01 00:00:00',0,1),(9,1004002,1002001,NULL,1001003,'8169998e-5db4-42ca-887c-c85c68e5c5eb',NULL,NULL,NULL,0,'F-2 / T5',NULL,NULL,NULL,200,NULL,0,16,'F-2 / T5',NULL,0,232,'Card',NULL,NULL,'2023-02-28 07:37:05',0,'0001-01-01 00:00:00',0,1),(10,1004001,1002001,NULL,1001003,NULL,'11223',NULL,NULL,0,'11223',NULL,NULL,NULL,200,NULL,0,16,NULL,NULL,0,232,'Cash',NULL,NULL,'2023-02-28 15:15:02',0,'0001-01-01 00:00:00',0,1),(11,1004003,1002001,1003001,1001005,NULL,NULL,NULL,NULL,1,'D-Asghar','Asghar','addess','098765432',210,NULL,0,5,NULL,NULL,0,220,'Card','2023-02-28 15:36:54','2023-03-13 12:01:09','2023-02-28 15:18:05',0,'0001-01-01 00:00:00',0,1),(12,1004003,1002001,1003001,1001005,NULL,NULL,NULL,NULL,3,'D-Farhan','Farhan','Address','09876543234',300,NULL,0,16,NULL,NULL,0,348,'Cash','2023-02-28 15:43:20','2023-02-28 15:50:24','2023-02-28 15:40:32',0,'0001-01-01 00:00:00',0,1),(14,1004002,1002001,NULL,1001003,'4bdf2399-9ba4-4d1f-96e4-eaf32c16bf49',NULL,NULL,NULL,0,'F-2 / T7',NULL,NULL,NULL,400,NULL,0,5,'F-2 / T7',NULL,0,420,'Card',NULL,NULL,'2023-03-01 14:15:58',0,'0001-01-01 00:00:00',0,1),(15,1004001,1002002,NULL,1001002,NULL,'5555',NULL,1005001,0,'5555',NULL,NULL,NULL,300,NULL,17,16,NULL,NULL,0,298,'Cash',NULL,NULL,'2023-03-07 01:50:25',0,'0001-01-01 00:00:00',0,1),(16,1004002,1002002,NULL,1001002,'ab169d87-a803-48a4-84c2-43c7ed250287',NULL,NULL,NULL,0,'F-2 / T5',NULL,NULL,NULL,2400,NULL,0,16,'F-2 / T5',NULL,0,2784,'Cash',NULL,NULL,'2023-03-07 09:26:33',0,'0001-01-01 00:00:00',0,1),(17,1004001,1002001,NULL,1001002,NULL,'456',NULL,NULL,0,'456',NULL,NULL,NULL,430,NULL,0,16,NULL,NULL,0,498,'Cash',NULL,NULL,'2023-03-13 09:27:02',0,'0001-01-01 00:00:00',0,1);
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
INSERT INTO `saleorderline` VALUES (1,1,'Pepperoni Pizza','code',1,100,100,'2023-02-24 16:28:00',0,'0001-01-01 00:00:00',0,1),(2,1,'Hawaiian Pizza','code',2,100,200,'2023-02-24 16:28:01',0,'0001-01-01 00:00:00',0,1),(4,2,'Gelato','code',2,90,180,'2023-02-24 16:28:29',0,'0001-01-01 00:00:00',0,1),(5,3,'Pepperoni Pizza','code',1,100,100,'2023-02-25 11:17:49',0,'0001-01-01 00:00:00',0,1),(6,3,'Black Cofee','18930',1,200,200,'2023-02-25 11:17:53',0,'0001-01-01 00:00:00',0,1),(7,3,'Ice Cream','code...',1,120,120,'2023-02-25 11:17:56',0,'0001-01-01 00:00:00',0,1),(8,3,'Gelato','code',1,90,0,'2023-02-25 11:17:57',0,'0001-01-01 00:00:00',0,1),(10,4,'Pepperoni Pizza','code',1,100,100,'2023-02-25 11:38:27',0,'0001-01-01 00:00:00',0,1),(11,4,'Hawaiian Pizza','code',1,80,80,'2023-02-25 11:38:28',0,'0001-01-01 00:00:00',0,1),(12,4,'Buffalo Pizza','code',1,100,100,'2023-02-25 11:38:31',0,'0001-01-01 00:00:00',0,1),(13,5,'Potato Chips','82738',1,100,100,'2023-02-25 11:48:10',0,'0001-01-01 00:00:00',0,1),(14,5,'Mixed salad','1006',2,200,400,'2023-02-25 11:48:12',0,'0001-01-01 00:00:00',0,1),(16,6,'Pepperoni Pizza','code',1,100,100,'2023-02-25 12:59:37',0,'0001-01-01 00:00:00',0,1),(17,6,'Buffalo Pizza','code',1,100,0,'2023-02-25 12:59:37',0,'0001-01-01 00:00:00',0,1),(19,7,'Pepperoni Pizza','code',1,100,100,'2023-02-25 18:23:55',0,'0001-01-01 00:00:00',0,1),(20,7,'Buffalo Pizza','code',1,100,100,'2023-02-25 18:23:58',0,'0001-01-01 00:00:00',0,1),(21,7,'BBQ Chicken Pizza','code',2,100,200,'2023-02-25 18:23:59',0,'0001-01-01 00:00:00',0,1),(22,9,'Hawaiian Pizza','code',1,100,100,'2023-02-28 07:36:53',0,'0001-01-01 00:00:00',0,1),(23,9,'Margherita Pizza','code',1,100,100,'2023-02-28 07:36:54',0,'0001-01-01 00:00:00',0,1),(24,10,'BeanBurger','code',1,100,100,'2023-02-28 15:14:49',0,'0001-01-01 00:00:00',0,1),(25,10,'PortobelloMushroomBurger','code',1,100,100,'2023-02-28 15:14:53',0,'0001-01-01 00:00:00',0,1),(26,11,'Gelato','code',1,90,90,'2023-02-28 15:17:16',0,'0001-01-01 00:00:00',0,1),(27,11,'Ice Cream','code...',1,120,120,'2023-02-28 15:17:17',0,'0001-01-01 00:00:00',0,1),(28,12,'Hawaiian Pizza','code',1,100,100,'2023-02-28 15:40:03',0,'0001-01-01 00:00:00',0,1),(29,12,'BBQ Chicken Pizza','code',1,100,100,'2023-02-28 15:40:04',0,'0001-01-01 00:00:00',0,1),(30,12,'Meat Pizza','code',1,100,100,'2023-02-28 15:40:09',0,'0001-01-01 00:00:00',0,1),(31,13,'Black Cofee','18930',1,200,200,'2023-02-28 15:47:29',0,'0001-01-01 00:00:00',0,0),(33,14,'Potato Chips','82738',3,100,300,'2023-03-01 14:15:38',0,'0001-01-01 00:00:00',0,1),(34,14,'Hawaiian Pizza','code',1,100,100,'2023-03-01 14:16:57',0,'0001-01-01 00:00:00',0,1),(35,15,'Chiken Pizza','Chiken_Pizza',1,300,300,'2023-03-07 01:49:37',0,'0001-01-01 00:00:00',0,1),(36,16,'Black Coffee','Black_Coffee',1,2300,2300,'2023-03-07 09:26:18',0,'0001-01-01 00:00:00',0,1),(37,16,'Black tea','Black_tea',1,100,100,'2023-03-07 09:26:20',0,'0001-01-01 00:00:00',0,1),(38,17,'Regular Burger','Regular_Burger',1,200,200,'2023-03-13 09:25:23',0,'0001-01-01 00:00:00',0,1),(39,17,'Signature Burger','Signature_Burger',1,150,150,'2023-03-13 09:25:26',0,'0001-01-01 00:00:00',0,1),(40,17,'Green Tea','Green_Tea',1,80,80,'2023-03-13 09:25:34',0,'0001-01-01 00:00:00',0,1),(41,2,'Tikka Pizza','Tikka_Pizza',1,567,567,'2023-03-13 09:36:39',0,'0001-01-01 00:00:00',0,1),(42,2,'Chicken Pizza','Chicken_Pizza',1,540,540,'2023-03-13 09:36:41',0,'0001-01-01 00:00:00',0,1),(43,2,'Regular Burger','Regular_Burger',1,200,200,'2023-03-13 09:36:48',0,'0001-01-01 00:00:00',0,1),(44,18,'Meat Pizza','code',1,100,100,'2023-02-25 14:13:25',0,'0001-01-01 00:00:00',0,1),(46,20,'green salad','1009',1,200,200,'2023-02-25 11:48:13',0,'0001-01-01 00:00:00',0,1);
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
  `UserId` varchar(255) DEFAULT NULL,
  `ShiftValueId` int DEFAULT NULL,
  `FloatingCash` varchar(2000) DEFAULT NULL,
  `ShiftEndCash` varchar(2000) DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `shift_start_k_1_idx` (`ShiftValueId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `shift_ibfk_1` FOREIGN KEY (`ShiftValueId`) REFERENCES `enumline` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shift_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'7890',NULL,'2023-02-28 00:00:00','2023-02-28 20:43:00','2023-02-28 20:41:18',0,'0001-01-01 00:00:00',0,_binary ''),(2,'8169998e-5db4-42ca-887c-c85c68e5c5eb',1002001,'87654',NULL,'2023-02-28 00:00:00',NULL,'2023-02-28 20:43:13',0,'0001-01-01 00:00:00',0,_binary ''),(3,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'567',NULL,'2023-03-01 00:00:00',NULL,'2023-03-01 14:10:26',0,'0001-01-01 00:00:00',0,_binary ''),(4,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002002,'1234',NULL,'2023-03-07 00:00:00',NULL,'2023-03-07 01:39:49',0,'0001-01-01 00:00:00',0,_binary ''),(5,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'12345',NULL,'2023-03-13 00:00:00',NULL,'2023-03-13 09:11:19',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `Id` int NOT NULL,
  `BranchId` int DEFAULT NULL,
  `StoreName` varchar(1000) DEFAULT NULL,
  `StoreCode` varchar(1000) DEFAULT NULL,
  `UploadStatus` bit(1) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `foreign_key_1_idx` (`BranchId`),
  CONSTRAINT `foreign_key_1` FOREIGN KEY (`BranchId`) REFERENCES `branch` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,5,'Gully Tea Bar','1009',_binary '','2023-03-09 08:03:13',0,'0001-01-01 00:00:00',0,_binary ''),(2,4,'test','test',_binary '','2023-03-09 08:21:57',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory_obsolete`
--

DROP TABLE IF EXISTS `subcategory_obsolete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory_obsolete` (
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
-- Dumping data for table `subcategory_obsolete`
--

LOCK TABLES `subcategory_obsolete` WRITE;
/*!40000 ALTER TABLE `subcategory_obsolete` DISABLE KEYS */;
INSERT INTO `subcategory_obsolete` VALUES (1,1,'Coffee..','2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(2,1,'Tea','2022-12-22 17:52:57',0,'2022-12-22 17:52:57',0,_binary '\0'),(3,2,'Burger','2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(4,2,'Pizza','2022-12-22 06:07:50',0,'2022-12-22 06:07:50',0,_binary ''),(5,3,'Tea...','2022-12-28 13:15:46',0,'0001-01-01 00:00:00',0,_binary '\0'),(6,1,'Tea','2022-12-28 13:22:53',0,'0001-01-01 00:00:00',0,_binary '\0'),(7,4,'Frozen Dessert','2022-12-28 13:50:14',0,'0001-01-01 00:00:00',0,_binary ''),(8,4,'Baked Dessert','2022-12-28 13:50:25',0,'0001-01-01 00:00:00',0,_binary '\0'),(9,1,'Soft Drinks','2022-12-31 16:52:28',0,'0001-01-01 00:00:00',0,_binary '\0'),(10,9,'Chips & dips','2022-12-31 20:41:28',0,'0001-01-01 00:00:00',0,_binary '\0'),(11,9,'Salads','2022-12-31 20:41:35',0,'0001-01-01 00:00:00',0,_binary '\0'),(12,9,'Soup...','2022-12-31 20:41:42',0,'0001-01-01 00:00:00',0,_binary '\0'),(13,12,'ass','2022-12-31 20:56:07',0,'0001-01-01 00:00:00',0,_binary '\0'),(14,1,'ASD','2022-12-31 21:07:06',0,'0001-01-01 00:00:00',0,_binary '\0'),(15,14,'Salad','2022-12-31 21:29:12',0,'0001-01-01 00:00:00',0,_binary '\0'),(16,14,'Chips & Dips','2022-12-31 21:29:20',0,'0001-01-01 00:00:00',0,_binary '\0'),(17,14,'Soup...','2022-12-31 21:29:29',0,'0001-01-01 00:00:00',0,_binary '\0'),(18,15,'Sa','2022-12-31 21:34:59',0,'0001-01-01 00:00:00',0,_binary '\0'),(19,16,'Salad','2022-12-31 21:35:44',0,'0001-01-01 00:00:00',0,_binary '\0'),(20,16,'Soup','2022-12-31 21:35:51',0,'0001-01-01 00:00:00',0,_binary '\0'),(21,16,'Chips & dips','2022-12-31 21:35:57',0,'0001-01-01 00:00:00',0,_binary '\0'),(22,21,'Soup','2023-01-02 22:29:12',0,'0001-01-01 00:00:00',0,_binary '\0'),(23,21,'Salad','2023-01-02 22:29:19',0,'0001-01-01 00:00:00',0,_binary '\0'),(24,21,'Chips & dips','2023-01-02 22:29:24',0,'0001-01-01 00:00:00',0,_binary '\0'),(25,23,'Soup','2023-01-02 22:33:26',0,'0001-01-01 00:00:00',0,_binary '\0'),(26,23,'Salad','2023-01-02 22:33:30',0,'0001-01-01 00:00:00',0,_binary '\0'),(27,23,'Chips & dips','2023-01-02 22:33:35',0,'0001-01-01 00:00:00',0,_binary '\0'),(28,24,'Soup','2023-01-02 22:45:52',0,'0001-01-01 00:00:00',0,_binary '\0'),(29,24,'Salad','2023-01-02 22:45:59',0,'0001-01-01 00:00:00',0,_binary '\0'),(30,24,'Chips & dips','2023-01-02 22:46:04',0,'0001-01-01 00:00:00',0,_binary '\0'),(31,25,'Soup','2023-01-30 00:13:05',0,'0001-01-01 00:00:00',0,_binary ''),(32,25,'Chips & dips','2023-01-31 17:22:17',0,'0001-01-01 00:00:00',0,_binary ''),(33,25,'stakes','2023-01-31 17:23:13',0,'0001-01-01 00:00:00',0,_binary '\0'),(34,26,'Mixed Salad','2023-01-31 17:38:22',0,'0001-01-01 00:00:00',0,_binary ''),(35,26,'Green Salad...','2023-01-31 17:38:29',0,'0001-01-01 00:00:00',0,_binary ''),(36,25,'Salads','2023-01-31 17:39:29',0,'0001-01-01 00:00:00',0,_binary ''),(37,3,'Coffee','2023-02-04 02:09:25',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `subcategory_obsolete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `Id` int NOT NULL,
  `AccountId` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Code` varchar(500) DEFAULT NULL,
  `CreditDays` int DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(100) DEFAULT NULL,
  `CNIC` varchar(20) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `Area` varchar(500) DEFAULT NULL,
  `Address` varchar(300) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,NULL,'Murtaza',NULL,5,'Murtaza@gmail.com','1234543877','3660366387329','Lahore...',NULL,'Address...','2023-02-18 20:22:59',0,'0001-01-01 00:00:00',0,_binary ''),(2,NULL,'Cash Purchase',NULL,NULL,NULL,'0987654323',NULL,NULL,NULL,NULL,'2023-02-18 20:27:14',0,'0001-01-01 00:00:00',0,_binary ''),(3,NULL,'Sumaira',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-18 20:27:46',0,'0001-01-01 00:00:00',0,_binary '\0'),(4,0,'Asim..','code...',8,'abc@gmail.com..','0988765423...','098765432345678..','Lahore..','Area...','Address...','2023-03-09 10:11:28',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takeaway_obsolete`
--

DROP TABLE IF EXISTS `takeaway_obsolete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `takeaway_obsolete` (
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
-- Dumping data for table `takeaway_obsolete`
--

LOCK TABLES `takeaway_obsolete` WRITE;
/*!40000 ALTER TABLE `takeaway_obsolete` DISABLE KEYS */;
INSERT INTO `takeaway_obsolete` VALUES (1,1,'2023-01-27 00:59:19',0,'0001-01-01 00:00:00',0,_binary ''),(2,123,'2023-01-31 17:14:45',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `takeaway_obsolete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `test`
--

DROP TABLE IF EXISTS `test`;
/*!50001 DROP VIEW IF EXISTS `test`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `test` AS SELECT 
 1 AS `ItemName`,
 1 AS `count(*)`,
 1 AS `sum(Price)`*/;
SET character_set_client = @saved_cs_client;

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
-- Table structure for table `uomconversion`
--

DROP TABLE IF EXISTS `uomconversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uomconversion` (
  `Id` int NOT NULL,
  `UOMId` int DEFAULT NULL,
  `ConvertedUOMId` int DEFAULT NULL,
  `QTY` int DEFAULT NULL,
  `ConversionRate` varchar(1000) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `foreign_key_1_idx` (`UOMId`,`ConvertedUOMId`),
  KEY `foreign_key_2_idx` (`ConvertedUOMId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uomconversion`
--

LOCK TABLES `uomconversion` WRITE;
/*!40000 ALTER TABLE `uomconversion` DISABLE KEYS */;
INSERT INTO `uomconversion` VALUES (1,1008001,1008004,1,'1000','2023-03-09 08:04:29',0,'0001-01-01 00:00:00',0,_binary ''),(2,1008001,1008002,17,'10000','2023-03-09 08:22:24',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `uomconversion` ENABLE KEYS */;
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
-- Temporary view structure for view `vw_expense`
--

DROP TABLE IF EXISTS `vw_expense`;
/*!50001 DROP VIEW IF EXISTS `vw_expense`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_expense` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `UserName`,
 1 AS `SupplierId`,
 1 AS `SupplierName`,
 1 AS `Date`,
 1 AS `Terminal`,
 1 AS `Amount`,
 1 AS `Comments`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_gst`
--

DROP TABLE IF EXISTS `vw_gst`;
/*!50001 DROP VIEW IF EXISTS `vw_gst`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_gst` AS SELECT 
 1 AS `Id`,
 1 AS `GST`,
 1 AS `ReceiptTitle`,
 1 AS `PaymentTypeId`,
 1 AS `PaymentType`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_item`
--

DROP TABLE IF EXISTS `vw_item`;
/*!50001 DROP VIEW IF EXISTS `vw_item`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_item` AS SELECT 
 1 AS `Id`,
 1 AS `ItemTypeId`,
 1 AS `ItemType`,
 1 AS `GroupId`,
 1 AS `Description`,
 1 AS `Group`,
 1 AS `CategoryId`,
 1 AS `Category`,
 1 AS `SubCategoryId`,
 1 AS `SubCategory`,
 1 AS `KDSId`,
 1 AS `KDS`,
 1 AS `UOMId`,
 1 AS `UOM`,
 1 AS `StoreId`,
 1 AS `Store`,
 1 AS `SizeId`,
 1 AS `Size`,
 1 AS `ColorId`,
 1 AS `Color`,
 1 AS `FontColorId`,
 1 AS `FontColor`,
 1 AS `BranchId`,
 1 AS `Branch`,
 1 AS `BrandId`,
 1 AS `Brand`,
 1 AS `SupplierId`,
 1 AS `Supplier`,
 1 AS `ItemName`,
 1 AS `ItemCode`,
 1 AS `FontSize`,
 1 AS `Price`,
 1 AS `QTY`,
 1 AS `KDSId2`,
 1 AS `KDS2`,
 1 AS `MakingTime`,
 1 AS `AlarmTime`,
 1 AS `TotalItemsAllowed`,
 1 AS `StartDate`,
 1 AS `ProposedMargin`,
 1 AS `BarCode`,
 1 AS `Target`,
 1 AS `OptionalModifier`,
 1 AS `EndDate`,
 1 AS `ManualQty`,
 1 AS `VendorId`,
 1 AS `IsCritical`,
 1 AS `MinOrderLevel`,
 1 AS `PackingQty`,
 1 AS `MaxOrderLevel`,
 1 AS `PackingName`,
 1 AS `CurrentMargin`,
 1 AS `Address`,
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
-- Temporary view structure for view `vw_saleorder`
--

DROP TABLE IF EXISTS `vw_saleorder`;
/*!50001 DROP VIEW IF EXISTS `vw_saleorder`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_saleorder` AS SELECT 
 1 AS `Id`,
 1 AS `OrderTypeId`,
 1 AS `OrderType`,
 1 AS `BillTitle`,
 1 AS `RiderId`,
 1 AS `ShiftId`,
 1 AS `Shift`,
 1 AS `SourceId`,
 1 AS `StatusId`,
 1 AS `Status`,
 1 AS `WaiterId`,
 1 AS `CustomerId`,
 1 AS `RestaurantId`,
 1 AS `Name`,
 1 AS `Address`,
 1 AS `PhoneNo`,
 1 AS `Total`,
 1 AS `Guest`,
 1 AS `Discount`,
 1 AS `GST`,
 1 AS `TableNo`,
 1 AS `Note`,
 1 AS `Service`,
 1 AS `NetTotal`,
 1 AS `PaymentMethod`,
 1 AS `DispatchedTime`,
 1 AS `DeliveryTime`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_settings`
--

DROP TABLE IF EXISTS `vw_settings`;
/*!50001 DROP VIEW IF EXISTS `vw_settings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_settings` AS SELECT 
 1 AS `Id`,
 1 AS `EnumTypeId`,
 1 AS `Name`,
 1 AS `SettingType`,
 1 AS `TypeKeyCode`,
 1 AS `ParentId`,
 1 AS `ParentName`,
 1 AS `Description`,
 1 AS `KeyCode`,
 1 AS `IsSystemDefined`,
 1 AS `UploadStatus`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_settingstype`
--

DROP TABLE IF EXISTS `vw_settingstype`;
/*!50001 DROP VIEW IF EXISTS `vw_settingstype`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_settingstype` AS SELECT 
 1 AS `Id`,
 1 AS `Name`,
 1 AS `ParentId`,
 1 AS `ParentName`,
 1 AS `KeyCode`,
 1 AS `IsSystemDefined`,
 1 AS `UploadStatus`,
 1 AS `Description`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_shift`
--

DROP TABLE IF EXISTS `vw_shift`;
/*!50001 DROP VIEW IF EXISTS `vw_shift`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_shift` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `UserName`,
 1 AS `Role`,
 1 AS `StartTime`,
 1 AS `EndTime`,
 1 AS `FloatingCash`,
 1 AS `ShiftEndCash`,
 1 AS `ShiftValueId`,
 1 AS `Shift`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_store`
--

DROP TABLE IF EXISTS `vw_store`;
/*!50001 DROP VIEW IF EXISTS `vw_store`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_store` AS SELECT 
 1 AS `Id`,
 1 AS `StoreName`,
 1 AS `StoreCode`,
 1 AS `BranchId`,
 1 AS `Branch`,
 1 AS `UploadStatus`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_uomconversion`
--

DROP TABLE IF EXISTS `vw_uomconversion`;
/*!50001 DROP VIEW IF EXISTS `vw_uomconversion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_uomconversion` AS SELECT 
 1 AS `Id`,
 1 AS `UOMId`,
 1 AS `UOM`,
 1 AS `ConvertedUOMId`,
 1 AS `ConvertedUOM`,
 1 AS `QTY`,
 1 AS `ConversionRate`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
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
-- Dumping events for database 'restaurant'
--

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
/*!50003 DROP PROCEDURE IF EXISTS `AlterExpenses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterExpenses`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from expenses
			where
			expenses.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update expenses set IsActive=1
			where 
			expenses.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update expenses set IsActive=0
			where
			expenses.Id=id; 
           
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
/*!50003 DROP PROCEDURE IF EXISTS `AlterLoyaltyCard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterLoyaltyCard`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from loyaltycard
			where
			loyaltycard.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update loyaltycard set IsActive=1
			where 
			loyaltycard.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update loyaltycard set IsActive=0
			where
			loyaltycard.Id=id; 
           
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
/*!50003 DROP PROCEDURE IF EXISTS `AlterRider` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterRider`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from rider
			where
			rider.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update rider set IsActive=1
			where 
			rider.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update rider set IsActive=0
			where
			rider.Id=id; 
           
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
/*!50003 DROP PROCEDURE IF EXISTS `AlterSupplier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterSupplier`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from supplier
			where
			supplier.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update supplier set IsActive=1
			where 
			supplier.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update supplier set IsActive=0
			where
			supplier.Id=id; 
           
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
     in branchCode varchar(2000),
     in type varchar(1000),
     in location varchar(2000),
     in uploadStatus bit,
      in branchId int,
       in chartAccountId int,
        in name varchar(200),
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
    
           insert into branch (Id,Name,BranchCode,Type,Location,UploadStatus,BranchId,ChartAccountId,
           CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,name,branchCode,type,location,uploadStatus,branchId,chartAccountId,
           createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update branch set 
                          Name=name,
       BranchCode=branchCode,
       Type=type,
       Location=location,
       UploadStatus=uploadStatus,
       BranchId=branchId,
       ChartAccountId=chartAccountId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where branch.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from branch
			where
			branch.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update branch set IsActive=1
			where 
			branch.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
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
   IF DBoperation = 'Delete'
    then
            delete from category
			where
			category.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update category set IsActive=1
			where 
			category.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
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
   IF DBoperation = 'Delete'
    then
            delete from customer
			where
			customer.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update customer set IsActive=1
			where 
			customer.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
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
   IF DBoperation = 'Delete'
    then
            delete from discountkey
			where
			discountkey.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update discountkey set IsActive=1
			where 
			discountkey.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
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
   IF DBoperation = 'Delete'
    then
            delete from discountvouchers
			where
			discountvouchers.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update discountvouchers set IsActive=1
			where 
			discountvouchers.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
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
   IF DBoperation = 'Delete'
    then
            delete from employee
			where
			employee.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update employee set IsActive=1
			where 
			employee.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageExpenses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageExpenses`(in id int,
        in userId varchar(255),
        in supplierId int,
         in date datetime,
        in amount varchar(1000),
         in terminal varchar(1000),
         in comments varchar(3000),
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
    
           insert into expenses (Id,UserId,SupplierId,Date,Amount,Terminal,Comments,CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,userId,supplierId,date,amount,terminal,comments, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update expenses set 
                          UserId=userId,
                          SupplierId=supplierId,
                          Date=date,
                          Amount=amount,
                          Terminal=terminal,
                          Comments=comments,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where expenses.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from expenses
			where
			expenses.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update expenses set IsActive=1
			where 
			expenses.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update expenses set IsActive=0
			where
			expenses.Id=id; 
           
        END if;
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
   IF DBoperation = 'Delete'
    then
            delete from floor
			where
			floor.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update floor set IsActive=1
			where 
			floor.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageGST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageGST`(in id int,
        in gST int,
        in paymentTypeId int,
        in receiptTitle varchar(45),
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
    
           insert into gst (Id,GST,PaymentTypeId,ReceiptTitle, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,gST,paymentTypeId,receiptTitle, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
 if DBoperation ='Update'
 then
            update gst set 
                          PaymentTypeId=paymentTypeId,
                          GST=gST,
                          ReceiptTitle=receiptTitle,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where gst.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from gst
			where
			gst.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update gst set IsActive=1
			where 
			gst.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update gst set IsActive=0
			where
			gst.Id=id; 
           
        END if;
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
        in kDSId2 int,
		in makingTime varchar(45),
        in alarmTime varchar(45),
        in totalItemsAllowed int,
		in startDate datetime,
        in currentMargin float,
		in proposedMargin float,
        in barCode varchar(5000),
        in target float,
		in optionalModifier bit,
        in endDate datetime,
		in manualQty bit,
        in vendorId int,
        in isCritical bit,
		in minOrderLevel varchar(45),
        in packingQty int,
		in maxOrderLevel varchar(45),
        in packingName varchar(45),

        in groupId int,
		in itemTypeId int,
        in brandId int,
		in uOMId int,
        in sizeId int,
		in storeId int,
        in colorId int,
		in fontColorId int,
        in branchId int,
		in supplierId int,
        in kDSId int,
		in categoryId int,
        in subCategoryId int,
        in fontSize varchar(45),
		in description varchar(3000),
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
           insert into item (Id,ItemTypeId,GroupId,StoreId,BranchId,BrandId,UOMId,KDSId,SupplierId,
           SizeId,ColorId,FontColorId,Description,FontSize,
           KDSId2,MakingTime,AlarmTime,TotalItemsAllowed,StartDate,CurrentMargin,
           ProposedMargin,BarCode,Target,OptionalModifier,EndDate,ManualQty,
           VendorId,IsCritical,MinOrderLevel,PackingQty,MaxOrderLevel,PackingName,
           CategoryId,SubCategoryId,ItemCode,ItemName,Qty,Price, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,itemTypeId,groupId,storeId,branchId,brandId,uOMId,kDSId,supplierId,
           sizeId,colorId,fontColorId,description,fontSize,
           kDSId2,makingTime,alarmTime,totalItemsAllowed,startDate,currentMargin,
           vendorId,isCritical,minOrderLevel,packingQty,maxOrderLevel,packingName,
           proposedMargin,barCode,target,optionalModifier,endDate,manualQty,
           categoryId,subCategoryId,itemCode,itemName,qty,price, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update item set 
            KDSId2=kDSId2,
            IsCritical=isCritical,
            PackingQty=packingQty,
            MaxOrderLevel=maxOrderLevel,
            PackingName=packingName,
            MakingTime=makingTime,
            MinOrderLevel=minOrderLevel,
            VendorId=vendorId,
            AlarmTime=alarmTime,
            OptionalModifier=optionalModifier,
            EndDate=endDate,
            TotalItemsAllowed=totalItemsAllowed,
            ManualQty=manualQty,
            StartDate=startDate,
            Target=target,
            CurrentMargin=currentMargin,
            ProposedMargin=proposedMargin,
            BarCode=barCode,
            ItemTypeId=itemTypeId,
            GroupId=groupId,
            StoreId=storeId,
            BranchId=branchId,
            BrandId=brandId,
            UOMId=uOMId,
            KDSId=kDSId,
            SupplierId=supplierId,
            SizeId=sizeId,
            ColorId=colorId,
            FontColorId=fontColorId,
            Description=description,
            FontSize=fontSize,
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
   IF DBoperation = 'Delete'
    then
            delete from item
			where
			item.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update item set IsActive=1
			where 
			item.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageLoyaltyCard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageLoyaltyCard`(in id int,
        in cardNo varchar(500),
        in phoneNo varchar(255),
        in discountPercentage varchar(100),
        in name varchar(255),
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
    
           insert into loyaltycard (Id,CardNo,PhoneNo,DiscountPercentage,Name, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,cardNo,phoneNo,discountPercentage,name, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
 if DBoperation ='Update'
 then
            update loyaltycard set 
                          Name=name,
                          CardNo=cardNo,
                          PhoneNo=phoneNo,
						  DiscountPercentage=discountPercentage,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where loyaltycard.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from loyaltycard
			where
			loyaltycard.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update loyaltycard set IsActive=1
			where 
			loyaltycard.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update loyaltycard set IsActive=0
			where
			loyaltycard.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageMemberPoints` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageMemberPoints`(in id int,
        in minSale int,
        in maxSale int,
        in points float,
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
    
           insert into memberpoints (Id,MinSale,MaxSale,Points, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,minSale,maxSale,points, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
 if DBoperation ='Update'
 then
            update memberpoints set 
                          MinSale=minSale,
                          MaxSale=maxSale,
                          Points=points,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where memberpoints.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from memberpoints
			where
			memberpoints.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update memberpoints set IsActive=1
			where 
			memberpoints.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update memberpoints set IsActive=0
			where
			memberpoints.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageOnlineDBSetting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageOnlineDBSetting`(in id int,
        in serverName varchar(45),
        in databaseName varchar(45),
        in userName varchar(45),
		in password varchar(45),
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
    
           insert into onlinedbsetting (Id,ServerName,DatabaseName,UserName,Password, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,serverName,databaseName,userName,password, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
 if DBoperation ='Update'
 then
            update onlinedbsetting set 
                          ServerName=serverName,
                          DatabaseName=databaseName,
                          UserName=userName,
                          Password=password,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where onlinedbsetting.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from onlinedbsetting
			where
			onlinedbsetting.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update onlinedbsetting set IsActive=1
			where 
			onlinedbsetting.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update onlinedbsetting set IsActive=0
			where
			onlinedbsetting.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageOrderSource` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageOrderSource`(in id int,
        in name int,
        in priceIncreament float,
        in printInvoice bit,
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
    
           insert into ordersource (Id,Name,PriceIncreament,PrintInvoice, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,name,priceIncreament,printInvoice, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
 if DBoperation ='Update'
 then
            update ordersource set 
                          Name=name,
                          PriceIncreament=priceIncreament,
                          PrintInvoice=printInvoice,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where ordersource.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from ordersource
			where
			ordersource.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update ordersource set IsActive=1
			where 
			ordersource.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update ordersource set IsActive=0
			where
			ordersource.Id=id; 
           
        END if;
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageRider` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageRider`(in id int,
     in email varchar(100),
     in phoneNo varchar(255),
     in name varchar(255),
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
    
           insert into rider (Id,Email,PhoneNo,Name, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,email,phoneNo,name, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update rider set 
                          Name=name,
       Email=email,
       PhoneNo=phoneNo,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where rider.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from rider
			where
			rider.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update rider set IsActive=1
			where 
			rider.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update rider set IsActive=0
			where
			rider.Id=id; 
           
        END if;
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
        in customerId varchar(255),
        in discountTypeId int,
        in tableNo varchar(200),
         in waiterId varchar(255),
        in restaurantId int,
        in guest varchar(200),
         in phoneNo varchar(200),
        in name varchar(200),
        in address varchar(200),
		in note varchar(5000),
        in sourceId int,
        in billTitle varchar(500),
        in riderId int,
         in shiftId int,
        in total int,
        in discount int,
        in gST int,
        in statusId int,
		in service int,
        in netTotal int,
        in paymentMethod varchar(45),
        in dispatchedTime datetime,
        in deliveryTime datetime,
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
           BillTitle,RiderId,ShiftId,DiscountTypeId,
           RestaurantId,Guest,PhoneNo,Name,Address,Note,SourceId,DispatchedTime,DeliveryTime,
           Total,Discount,GST,StatusId,Service,NetTotal,PaymentMethod ,CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,orderTypeId,customerId,tableNo,waiterId,
           billTitle,riderId,shiftId,discountTypeId,restaurantId,guest,
           phoneNo,name,address,note,sourceId,dispatchedTime,deliveryTime,
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
            DiscountTypeId=discountTypeId,
            BillTitle=billTitle,
            RiderId=riderId,
            ShiftId=shiftId,
            WaiterId=waiterId,
            RestaurantId=restaurantId,
            Guest=guest,
            PhoneNo=phoneNo,
            Name=name,
            Address=address,
            Note=note,
            SourceId=sourceId,
            DispatchedTime=dispatchedTime,
            DeliveryTime=deliveryTime,
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
   IF DBoperation = 'Delete'
    then
            delete from saleorder
			where
			saleorder.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update saleorder set IsActive=1
			where 
			saleorder.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
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
   IF DBoperation = 'Delete'
    then
            delete from saleorderline
			where
			saleorderline.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update saleorderline set IsActive=1
			where 
			saleorderline.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageSettings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageSettings`(in id int,
        in enumTypeId int,
        in parentId int,
        in uploadStatus bit,
        in keyCode varchar(2000),
        in isSystemDefined bit,
        in name varchar(500),
        in description varchar(5000),
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
    
           insert into enumline (Id,KeyCode,IsSystemDefined,UploadStatus,EnumTypeId,ParentId,Name,Description, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,keyCode,isSystemDefined,uploadStatus,enumTypeId,parentId,name,description, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
if DBoperation ='Update'
 then
            update enumline set 
            KeyCode=keyCode,
            IsSystemDefined=isSystemDefined,
            UploadStatus=uploadStatus,
						  EnumTypeId=enumTypeId,
                          ParentId=parentId,
                          Name=name,
                          Description=description,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where enumline.Id =id;
   end if;
IF DBoperation = 'Delete'
    then
            delete from enumline
			where
			enumline.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update enumline set IsActive=1
			where 
			enumline.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update enumline set IsActive=0
			where
			enumline.Id=id;            
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageSettingsType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageSettingsType`(in id int,
        in parentId int,
        in name varchar(500),
		in keyCode varchar(2000),
        in isSystemDefined bit,
         in uploadStatus bit,
        in description varchar(5000),
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
    
           insert into enums (Id,KeyCode,IsSystemDefined,UploadStatus,ParentId,Name,Description, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,keyCode,isSystemDefined,uploadStatus,parentId,name,description, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update enums set 
                          KeyCode=keyCode,
						UploadStatus=uploadStatus,
                          IsSystemDefined=isSystemDefined,
                          ParentId=parentId,
                          Name=name,
                          Description=description,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where enums.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from enums
			where
			enums.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update enums set IsActive=1
			where 
			enums.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update enums set IsActive=0
			where
			enums.Id=id; 
        END if;
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
        in shiftEndCash varchar(2000),
         in floatingCash varchar(2000),
          in userId varchar(255),
        in startTime datetime,
        in endTime datetime,
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
    
           insert into shift (Id,ShiftEndCash,UserId,EndTime,StartTime,
           ShiftValueId,FloatingCash, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,shiftEndCash,userId,endTime,startTime,
           shiftValueId,floatingCash, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update shift set 
            ShiftEndCash=shiftEndCash,
            UserId=userId,
            EndTime=endTime,
            StartTime=startTime,
                          ShiftValueId=shiftValueId,
                          FloatingCash=floatingCash,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where shift.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from shift
			where
			shift.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update shift set IsActive=1
			where 
			shift.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageStore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageStore`(in id int,
     in storeCode varchar(1000),
     in storeName varchar(1000),
     in uploadStatus bit,
      in branchId int,
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
    
           insert into store (Id,StoreCode,StoreName,UploadStatus,BranchId,
           CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,storeCode,storeName,uploadStatus,branchId,
           createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update store set 
                          StoreCode=storeCode,
       StoreName=storeName,
       UploadStatus=uploadStatus,
       BranchId=branchId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where store.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from store
			where
			store.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update store set IsActive=1
			where 
			store.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update store set IsActive=0
			where
			store.Id=id;            
        END if;

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
   IF DBoperation = 'Delete'
    then
            delete from subcategory
			where
			subcategory.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update subcategory set IsActive=1
			where 
			subcategory.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update subcategory set IsActive=0
			where
			subcategory.Id=id; 
                     END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageSupplier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageSupplier`(in id int,
in accountId int,
in creditDays int,
  in code varchar(500),
    in area varchar(500),
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
    
           insert into supplier (Id,AccountId,CreditDays,Code,Area,Name,Email,Phone,CNIC,City,Address, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,accountId,creditDays,code,area,name,email,phone,cNIC,city,address, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update supplier set 
                          Name=name,
                          AccountId=accountId,
                          CreditDays=creditDays,
                          Code=code,
                          Area=area,
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
             where supplier.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from supplier
			where
			supplier.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update supplier set IsActive=1
			where 
			supplier.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update supplier set IsActive=0
			where
			supplier.Id=id; 
           
        END if;
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
   IF DBoperation = 'Delete'
    then
            delete from restauranttable
			where
			restauranttable.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update restauranttable set IsActive=1
			where 
			restauranttable.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageUOMConversion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageUOMConversion`(in id int,
     in uOMId int,
     in convertedUOMId int,
     in qTY int,
     in conversionRate  varchar(1000),
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
           insert into uomconversion (Id,UOMId,ConvertedUOMId,QTY,ConversionRate,
           CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,uOMId,convertedUOMId,qTY,conversionRate,
           createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update uomconversion set 
                          UOMId=uOMId,
       ConvertedUOMId=convertedUOMId,
       QTY=qTY,
       ConversionRate=conversionRate,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where uomconversion.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from uomconversion
			where
			uomconversion.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update uomconversion set IsActive=1
			where 
			uomconversion.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update uomconversion set IsActive=0
			where
			uomconversion.Id=id;            
        END if;
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchExpenses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchExpenses`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_expense`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchGST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchGST`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_gst`  ';
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
			`vw_item`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchLoyaltyCard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchLoyaltyCard`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`loyaltycard`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchMemberPoints` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchMemberPoints`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`memberpoints`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchOnlineDBSetting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchOnlineDBSetting`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`onlinedbsetting`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchOrderSource` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchOrderSource`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`ordersource`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchRider` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchRider`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`rider`  ';
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
			`vw_saleorder`';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchSettings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSettings`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_settings`';
           
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchSettingsType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSettingsType`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_settingstype`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchStore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchStore`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_store`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchSupplier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSupplier`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`supplier`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchUOMConversion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUOMConversion`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_uomconversion`  ';
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
-- Final view structure for view `test`
--

/*!50001 DROP VIEW IF EXISTS `test`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `test` AS select `item`.`ItemName` AS `ItemName`,count(0) AS `count(*)`,sum(`item`.`Price`) AS `sum(Price)` from `item` group by `item`.`ItemName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
-- Final view structure for view `vw_expense`
--

/*!50001 DROP VIEW IF EXISTS `vw_expense`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_expense` AS select `expenses`.`Id` AS `Id`,`expenses`.`UserId` AS `UserId`,`user`.`Name` AS `UserName`,`expenses`.`SupplierId` AS `SupplierId`,`supplier`.`Name` AS `SupplierName`,`expenses`.`Date` AS `Date`,`expenses`.`Terminal` AS `Terminal`,`expenses`.`Amount` AS `Amount`,`expenses`.`Comments` AS `Comments`,`expenses`.`CreatedOn` AS `CreatedOn`,`expenses`.`CreatedById` AS `CreatedById`,`expenses`.`ModifiedOn` AS `ModifiedOn`,`expenses`.`ModifiedById` AS `ModifiedById`,`expenses`.`IsActive` AS `IsActive` from ((`expenses` join `aspnetusers` `user` on((`user`.`Id` = `expenses`.`UserId`))) join `supplier` on((`supplier`.`Id` = `expenses`.`SupplierId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_gst`
--

/*!50001 DROP VIEW IF EXISTS `vw_gst`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_gst` AS select `gst`.`Id` AS `Id`,`gst`.`GST` AS `GST`,`gst`.`ReceiptTitle` AS `ReceiptTitle`,`gst`.`PaymentTypeId` AS `PaymentTypeId`,`line`.`Name` AS `PaymentType`,`gst`.`CreatedOn` AS `CreatedOn`,`gst`.`CreatedById` AS `CreatedById`,`gst`.`ModifiedOn` AS `ModifiedOn`,`gst`.`ModifiedById` AS `ModifiedById`,`gst`.`IsActive` AS `IsActive` from (`gst` join `enumline` `line` on((`line`.`Id` = `gst`.`PaymentTypeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_item`
--

/*!50001 DROP VIEW IF EXISTS `vw_item`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_item` AS select `item`.`Id` AS `Id`,`item`.`ItemTypeId` AS `ItemTypeId`,`itemtype`.`Name` AS `ItemType`,`item`.`GroupId` AS `GroupId`,`item`.`Description` AS `Description`,`group`.`Name` AS `Group`,`item`.`CategoryId` AS `CategoryId`,`category`.`Name` AS `Category`,`item`.`SubCategoryId` AS `SubCategoryId`,`subcategory`.`Name` AS `SubCategory`,`item`.`KDSId` AS `KDSId`,`kds`.`Name` AS `KDS`,`item`.`UOMId` AS `UOMId`,`uom`.`Name` AS `UOM`,`item`.`StoreId` AS `StoreId`,`store`.`StoreName` AS `Store`,`item`.`SizeId` AS `SizeId`,`size`.`Name` AS `Size`,`item`.`ColorId` AS `ColorId`,`color`.`Name` AS `Color`,`item`.`FontColorId` AS `FontColorId`,`fontcolor`.`Name` AS `FontColor`,`item`.`BranchId` AS `BranchId`,`branch`.`Name` AS `Branch`,`item`.`BrandId` AS `BrandId`,`brand`.`Name` AS `Brand`,`item`.`SupplierId` AS `SupplierId`,`supplier`.`Name` AS `Supplier`,`item`.`ItemName` AS `ItemName`,`item`.`ItemCode` AS `ItemCode`,`item`.`FontSize` AS `FontSize`,`item`.`Price` AS `Price`,`item`.`Qty` AS `QTY`,`item`.`KDSId2` AS `KDSId2`,`kds2`.`Name` AS `KDS2`,`item`.`MakingTime` AS `MakingTime`,`item`.`AlarmTime` AS `AlarmTime`,`item`.`TotalItemsAllowed` AS `TotalItemsAllowed`,`item`.`StartDate` AS `StartDate`,`item`.`ProposedMargin` AS `ProposedMargin`,`item`.`BarCode` AS `BarCode`,`item`.`Target` AS `Target`,`item`.`OptionalModifier` AS `OptionalModifier`,`item`.`EndDate` AS `EndDate`,`item`.`ManualQty` AS `ManualQty`,`item`.`VendorId` AS `VendorId`,`item`.`IsCritical` AS `IsCritical`,`item`.`MinOrderLevel` AS `MinOrderLevel`,`item`.`PackingQty` AS `PackingQty`,`item`.`MaxOrderLevel` AS `MaxOrderLevel`,`item`.`PackingName` AS `PackingName`,`item`.`CurrentMargin` AS `CurrentMargin`,`item`.`Description` AS `Address`,`item`.`CreatedOn` AS `CreatedOn`,`item`.`CreatedById` AS `CreatedById`,`item`.`ModifiedOn` AS `ModifiedOn`,`item`.`ModifiedById` AS `ModifiedById`,`item`.`IsActive` AS `IsActive` from ((((((((((((((`item` left join `enumline` `itemtype` on((`itemtype`.`Id` = `item`.`ItemTypeId`))) left join `enumline` `kds2` on((`kds2`.`Id` = `item`.`KDSId2`))) left join `enumline` `group` on((`group`.`Id` = `item`.`GroupId`))) left join `enumline` `category` on((`category`.`Id` = `item`.`CategoryId`))) left join `enumline` `subcategory` on((`subcategory`.`Id` = `item`.`SubCategoryId`))) left join `store` on((`store`.`Id` = `item`.`StoreId`))) left join `enumline` `color` on((`color`.`Id` = `item`.`ColorId`))) left join `enumline` `fontcolor` on((`fontcolor`.`Id` = `item`.`FontColorId`))) left join `enumline` `size` on((`size`.`Id` = `item`.`SizeId`))) left join `enumline` `kds` on((`kds`.`Id` = `item`.`KDSId`))) left join `enumline` `uom` on((`uom`.`Id` = `item`.`UOMId`))) left join `supplier` on((`supplier`.`Id` = `item`.`SupplierId`))) left join `branch` on((`branch`.`Id` = `item`.`BranchId`))) left join `enumline` `brand` on((`brand`.`Id` = `item`.`BrandId`))) */;
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
/*!50001 VIEW `vw_permission` AS select `p`.`Id` AS `Id`,`p`.`FeatureId` AS `FeatureId`,`fea`.`Name` AS `Feature`,`p`.`UserId` AS `UserId`,`us`.`UserName` AS `User`,`p`.`RoleId` AS `RoleId`,`ro`.`Name` AS `Role`,`p`.`PermissionValue` AS `PermissionValue`,`ev`.`Name` AS `Permission`,`p`.`IsActive` AS `IsActive` from ((((`permissions` `p` join `enumline` `ev` on((`ev`.`Id` = `p`.`PermissionValue`))) join `feature` `fea` on((`fea`.`Id` = `p`.`FeatureId`))) left join `aspnetusers` `us` on((`p`.`UserId` = `us`.`Id`))) left join `aspnetroles` `ro` on((`p`.`RoleId` = `ro`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_saleorder`
--

/*!50001 DROP VIEW IF EXISTS `vw_saleorder`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_saleorder` AS select `saleorder`.`Id` AS `Id`,`saleorder`.`OrderTypeId` AS `OrderTypeId`,`enumv`.`Name` AS `OrderType`,`saleorder`.`BillTitle` AS `BillTitle`,`saleorder`.`RiderId` AS `RiderId`,`saleorder`.`ShiftId` AS `ShiftId`,`shiftev`.`Name` AS `Shift`,`saleorder`.`SourceId` AS `SourceId`,`saleorder`.`StatusId` AS `StatusId`,`ev`.`Name` AS `Status`,`saleorder`.`WaiterId` AS `WaiterId`,`saleorder`.`CustomerId` AS `CustomerId`,`saleorder`.`RestaurantId` AS `RestaurantId`,`saleorder`.`Name` AS `Name`,`saleorder`.`Address` AS `Address`,`saleorder`.`PhoneNo` AS `PhoneNo`,`saleorder`.`Total` AS `Total`,`saleorder`.`Guest` AS `Guest`,`saleorder`.`Discount` AS `Discount`,`saleorder`.`GST` AS `GST`,`saleorder`.`TableNo` AS `TableNo`,`saleorder`.`Note` AS `Note`,`saleorder`.`Service` AS `Service`,`saleorder`.`NetTotal` AS `NetTotal`,`saleorder`.`PaymentMethod` AS `PaymentMethod`,`saleorder`.`DispatchedTime` AS `DispatchedTime`,`saleorder`.`DeliveryTime` AS `DeliveryTime`,`saleorder`.`CreatedOn` AS `CreatedOn`,`saleorder`.`CreatedById` AS `CreatedById`,`saleorder`.`ModifiedOn` AS `ModifiedOn`,`saleorder`.`ModifiedById` AS `ModifiedById`,`saleorder`.`IsActive` AS `IsActive` from (((`saleorder` join `enumline` `ev` on((`ev`.`Id` = `saleorder`.`StatusId`))) join `enumline` `shiftev` on((`shiftev`.`Id` = `saleorder`.`ShiftId`))) join `enumline` `enumv` on((`enumv`.`Id` = `saleorder`.`OrderTypeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_settings`
--

/*!50001 DROP VIEW IF EXISTS `vw_settings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_settings` AS select `settings`.`Id` AS `Id`,`settings`.`EnumTypeId` AS `EnumTypeId`,`settings`.`Name` AS `Name`,`type`.`Name` AS `SettingType`,`type`.`KeyCode` AS `TypeKeyCode`,`settings`.`ParentId` AS `ParentId`,`parent`.`Name` AS `ParentName`,`settings`.`Description` AS `Description`,`settings`.`KeyCode` AS `KeyCode`,`settings`.`IsSystemDefined` AS `IsSystemDefined`,`settings`.`UploadStatus` AS `UploadStatus`,`settings`.`CreatedOn` AS `CreatedOn`,`settings`.`CreatedById` AS `CreatedById`,`settings`.`ModifiedOn` AS `ModifiedOn`,`settings`.`ModifiedById` AS `ModifiedById`,`settings`.`IsActive` AS `IsActive` from ((`enumline` `settings` join `enums` `type` on((`type`.`Id` = `settings`.`EnumTypeId`))) left join `enumline` `parent` on((`parent`.`Id` = `settings`.`ParentId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_settingstype`
--

/*!50001 DROP VIEW IF EXISTS `vw_settingstype`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_settingstype` AS select `settings`.`Id` AS `Id`,`settings`.`Name` AS `Name`,`settings`.`ParentId` AS `ParentId`,`parent`.`Name` AS `ParentName`,`settings`.`KeyCode` AS `KeyCode`,`settings`.`IsSystemDefined` AS `IsSystemDefined`,`settings`.`UploadStatus` AS `UploadStatus`,`settings`.`Description` AS `Description`,`settings`.`CreatedOn` AS `CreatedOn`,`settings`.`CreatedById` AS `CreatedById`,`settings`.`ModifiedOn` AS `ModifiedOn`,`settings`.`ModifiedById` AS `ModifiedById`,`settings`.`IsActive` AS `IsActive` from (`enums` `settings` left join `enums` `parent` on((`parent`.`Id` = `settings`.`ParentId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_shift`
--

/*!50001 DROP VIEW IF EXISTS `vw_shift`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_shift` AS select `shift`.`Id` AS `Id`,`shift`.`UserId` AS `UserId`,`user`.`Name` AS `UserName`,`role`.`Name` AS `Role`,`shift`.`StartTime` AS `StartTime`,`shift`.`EndTime` AS `EndTime`,`shift`.`FloatingCash` AS `FloatingCash`,`shift`.`ShiftEndCash` AS `ShiftEndCash`,`shift`.`ShiftValueId` AS `ShiftValueId`,`ev`.`Name` AS `Shift`,`shift`.`CreatedOn` AS `CreatedOn`,`shift`.`CreatedById` AS `CreatedById`,`shift`.`ModifiedOn` AS `ModifiedOn`,`shift`.`ModifiedById` AS `ModifiedById`,`shift`.`IsActive` AS `IsActive` from ((((`shift` join `aspnetusers` `user` on((`user`.`Id` = `shift`.`UserId`))) join `aspnetuserroles` `urole` on((`urole`.`UserId` = `user`.`Id`))) join `aspnetroles` `role` on((`urole`.`RoleId` = `role`.`Id`))) join `enumline` `ev` on((`ev`.`Id` = `shift`.`ShiftValueId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_store`
--

/*!50001 DROP VIEW IF EXISTS `vw_store`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_store` AS select `store`.`Id` AS `Id`,`store`.`StoreName` AS `StoreName`,`store`.`StoreCode` AS `StoreCode`,`store`.`BranchId` AS `BranchId`,`branch`.`Name` AS `Branch`,`store`.`UploadStatus` AS `UploadStatus`,`store`.`CreatedOn` AS `CreatedOn`,`store`.`CreatedById` AS `CreatedById`,`store`.`ModifiedOn` AS `ModifiedOn`,`store`.`ModifiedById` AS `ModifiedById`,`store`.`IsActive` AS `IsActive` from (`store` left join `branch` on((`branch`.`Id` = `store`.`BranchId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_uomconversion`
--

/*!50001 DROP VIEW IF EXISTS `vw_uomconversion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_uomconversion` AS select `uomconversion`.`Id` AS `Id`,`uomconversion`.`UOMId` AS `UOMId`,`uom`.`Name` AS `UOM`,`uomconversion`.`ConvertedUOMId` AS `ConvertedUOMId`,`cuom`.`Name` AS `ConvertedUOM`,`uomconversion`.`QTY` AS `QTY`,`uomconversion`.`ConversionRate` AS `ConversionRate`,`uomconversion`.`CreatedOn` AS `CreatedOn`,`uomconversion`.`CreatedById` AS `CreatedById`,`uomconversion`.`ModifiedOn` AS `ModifiedOn`,`uomconversion`.`ModifiedById` AS `ModifiedById`,`uomconversion`.`IsActive` AS `IsActive` from ((`uomconversion` join `enumline` `uom` on((`uom`.`Id` = `uomconversion`.`UOMId`))) join `enumline` `cuom` on((`cuom`.`Id` = `uomconversion`.`ConvertedUOMId`))) */;
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

-- Dump completed on 2023-03-15 20:51:31
