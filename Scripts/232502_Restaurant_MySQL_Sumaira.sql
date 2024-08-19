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
INSERT INTO `enumvalue` VALUES (1000001,1000,'ReadOnly'),(1000002,1000,'FullAccess'),(1000003,1000,'Deny'),(1001001,1001,'Open'),(1001002,1001,'InProgress'),(1001003,1001,'Close'),(1001004,1001,'Dispatched'),(1001005,1001,'Delivered'),(1002001,1002,'Morning'),(1002002,1002,'Evening'),(1003001,1003,'Careem'),(1004001,1004,'TakeAway'),(1004002,1004,'DineIn'),(1004003,1004,'Delivery');
/*!40000 ALTER TABLE `enumvalue` ENABLE KEYS */;
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
  CONSTRAINT `saleorder_fk_1` FOREIGN KEY (`OrderTypeId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saleorder_fk_2` FOREIGN KEY (`StatusId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saleorder_fk_3` FOREIGN KEY (`SourceId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saleorder_ibfk_1` FOREIGN KEY (`WaiterId`) REFERENCES `aspnetusers` (`Id`),
  CONSTRAINT `saleorder_ibfk_2` FOREIGN KEY (`ShiftId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleorder`
--

LOCK TABLES `saleorder` WRITE;
/*!40000 ALTER TABLE `saleorder` DISABLE KEYS */;
INSERT INTO `saleorder` VALUES (1,1004002,1002001,NULL,1001002,'ab169d87-a803-48a4-84c2-43c7ed250287',NULL,NULL,0,'F-2 / T5',NULL,NULL,NULL,200,NULL,0,16,'F-2 / T5',NULL,0,232,'Cash',NULL,NULL,'2023-02-24 16:28:06',0,'0001-01-01 00:00:00',0,1),(2,1004001,1002001,NULL,1001002,NULL,'1122',NULL,0,'1122  I',NULL,NULL,NULL,90,NULL,0,16,NULL,NULL,0,104,'Cash',NULL,NULL,'2023-02-24 16:28:06',0,'0001-01-01 00:00:00',0,1),(3,1004003,1002001,1003001,1001005,NULL,NULL,NULL,0,'D-Ali','Ali','address','09876543456',420,NULL,0,16,NULL,NULL,0,487,'Cash',NULL,NULL,'2023-02-25 11:18:24',0,'0001-01-01 00:00:00',0,1),(4,1004003,1002001,1003001,1001005,NULL,NULL,NULL,1,'D-ABC','ABC','address','0987654345',380,NULL,10,16,NULL,NULL,0,402,'Cash','2023-02-25 11:39:31','2023-02-25 13:14:40','2023-02-25 11:38:50',0,'0001-01-01 00:00:00',0,1),(5,1004003,1002001,1003001,1001005,NULL,NULL,NULL,3,'D-Mahad','Mahad','Address','0987654334',700,NULL,10,16,NULL,NULL,0,742,'Cash','2023-02-25 11:51:26','2023-02-25 11:52:02','2023-02-25 11:49:01',0,'0001-01-01 00:00:00',0,1),(6,1004003,1002001,1003001,1001005,NULL,NULL,NULL,1,'D-Sulman','Sulman','Address','0987654325',200,NULL,0,16,NULL,NULL,0,232,'Cash','2023-02-25 13:17:11','2023-02-25 13:18:03','2023-02-25 13:00:24',0,'0001-01-01 00:00:00',0,1),(7,1004001,1002001,NULL,1001002,NULL,'999',NULL,0,'999',NULL,NULL,NULL,400,NULL,0,16,NULL,NULL,0,464,'Cash',NULL,NULL,'2023-02-25 18:24:08',0,'0001-01-01 00:00:00',0,1);
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
INSERT INTO `saleorderline` VALUES (1,1,'Pepperoni Pizza','code',1,100,100,'2023-02-24 16:28:00',0,'0001-01-01 00:00:00',0,1),(2,1,'Hawaiian Pizza','code',1,100,100,'2023-02-24 16:28:01',0,'0001-01-01 00:00:00',0,1),(4,2,'Gelato','code',1,90,90,'2023-02-24 16:28:29',0,'0001-01-01 00:00:00',0,1),(5,3,'Pepperoni Pizza','code',1,100,100,'2023-02-25 11:17:49',0,'0001-01-01 00:00:00',0,1),(6,3,'Black Cofee','18930',1,200,200,'2023-02-25 11:17:53',0,'0001-01-01 00:00:00',0,1),(7,3,'Ice Cream','code...',1,120,120,'2023-02-25 11:17:56',0,'0001-01-01 00:00:00',0,1),(8,3,'Gelato','code',1,90,0,'2023-02-25 11:17:57',0,'0001-01-01 00:00:00',0,1),(10,4,'Pepperoni Pizza','code',1,100,100,'2023-02-25 11:38:27',0,'0001-01-01 00:00:00',0,1),(11,4,'Hawaiian Pizza','code',1,80,80,'2023-02-25 11:38:28',0,'0001-01-01 00:00:00',0,1),(12,4,'Buffalo Pizza','code',1,100,100,'2023-02-25 11:38:31',0,'0001-01-01 00:00:00',0,1),(13,5,'Potato Chips','82738',1,100,100,'2023-02-25 11:48:10',0,'0001-01-01 00:00:00',0,1),(14,5,'Mixed salad','1006',2,200,400,'2023-02-25 11:48:12',0,'0001-01-01 00:00:00',0,1),(15,5,'green salad','1009',1,200,200,'2023-02-25 11:48:13',0,'0001-01-01 00:00:00',0,1),(16,6,'Pepperoni Pizza','code',1,100,100,'2023-02-25 12:59:37',0,'0001-01-01 00:00:00',0,1),(17,6,'Buffalo Pizza','code',1,100,100,'2023-02-25 12:59:37',0,'0001-01-01 00:00:00',0,1),(18,4,'Meat Pizza','code',1,100,100,'2023-02-25 14:13:25',0,'0001-01-01 00:00:00',0,1),(19,7,'Pepperoni Pizza','code',1,100,100,'2023-02-25 18:23:55',0,'0001-01-01 00:00:00',0,1),(20,7,'Buffalo Pizza','code',1,100,100,'2023-02-25 18:23:58',0,'0001-01-01 00:00:00',0,1),(21,7,'BBQ Chicken Pizza','code',2,100,200,'2023-02-25 18:23:59',0,'0001-01-01 00:00:00',0,1);
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
  CONSTRAINT `shift_ibfk_1` FOREIGN KEY (`ShiftValueId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shift_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'13570','10000','2023-02-20 00:00:00','2023-02-20 00:00:00','2023-02-20 20:09:04',0,'0001-01-01 00:00:00',0,_binary ''),(2,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002002,'1234','12345','2023-02-20 00:00:00','2023-02-20 00:00:00','2023-02-20 20:16:59',0,'0001-01-01 00:00:00',0,_binary ''),(3,'8169998e-5db4-42ca-887c-c85c68e5c5eb',1002001,'12345',NULL,'2023-02-20 00:00:00',NULL,'2023-02-20 20:21:55',0,'0001-01-01 00:00:00',0,_binary ''),(4,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'98760','900','2023-02-21 00:00:00','2023-02-21 00:00:00','2023-02-21 02:06:17',0,'0001-01-01 00:00:00',0,_binary ''),(5,'8169998e-5db4-42ca-887c-c85c68e5c5eb',1002002,'4655','890','2023-02-21 00:00:00','2023-02-21 00:00:00','2023-02-21 02:16:52',0,'0001-01-01 00:00:00',0,_binary ''),(6,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002002,'12456',NULL,'2023-02-21 00:00:00',NULL,'2023-02-21 23:36:01',0,'0001-01-01 00:00:00',0,_binary ''),(7,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'7980',NULL,'2023-02-22 00:00:00',NULL,'2023-02-22 00:03:02',0,'0001-01-01 00:00:00',0,_binary ''),(8,'8169998e-5db4-42ca-887c-c85c68e5c5eb',1002001,'12000',NULL,'2023-02-22 00:00:00',NULL,'2023-02-22 20:26:41',0,'0001-01-01 00:00:00',0,_binary ''),(9,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'1345',NULL,'2023-02-23 00:00:00',NULL,'2023-02-23 00:24:22',0,'0001-01-01 00:00:00',0,_binary ''),(10,'8169998e-5db4-42ca-887c-c85c68e5c5eb',1002002,'890',NULL,'2023-02-23 00:00:00',NULL,'2023-02-23 00:45:12',0,'0001-01-01 00:00:00',0,_binary ''),(11,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'12345',NULL,'2023-02-24 00:00:00',NULL,'2023-02-24 16:23:54',0,'0001-01-01 00:00:00',0,_binary ''),(12,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'1234',NULL,'2023-02-25 00:00:00',NULL,'2023-02-25 07:48:23',0,'0001-01-01 00:00:00',0,_binary '');
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
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `Id` int NOT NULL,
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
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Murtaza','Murtaza@gmail.com','1234543877','3660366387329','Lahore...','Address...','2023-02-18 20:22:59',0,'0001-01-01 00:00:00',0,_binary ''),(2,'Cash Purchase',NULL,NULL,NULL,NULL,NULL,'2023-02-18 20:27:14',0,'0001-01-01 00:00:00',0,_binary ''),(3,'Sumaira',NULL,NULL,NULL,NULL,NULL,'2023-02-18 20:27:46',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
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
           BillTitle,RiderId,ShiftId,
           RestaurantId,Guest,PhoneNo,Name,Address,Note,SourceId,DispatchedTime,DeliveryTime,
           Total,Discount,GST,StatusId,Service,NetTotal,PaymentMethod ,CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,orderTypeId,customerId,tableNo,waiterId,billTitle,riderId,shiftId,restaurantId,guest,
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
    
           insert into supplier (Id,Name,Email,Phone,CNIC,City,Address, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,name,email,phone,cNIC,city,address, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update supplier set 
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
             where supplier.Id =id;
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
/*!50001 VIEW `vw_saleorder` AS select `saleorder`.`Id` AS `Id`,`saleorder`.`OrderTypeId` AS `OrderTypeId`,`enumv`.`Value` AS `OrderType`,`saleorder`.`BillTitle` AS `BillTitle`,`saleorder`.`RiderId` AS `RiderId`,`saleorder`.`ShiftId` AS `ShiftId`,`shiftev`.`Value` AS `Shift`,`saleorder`.`SourceId` AS `SourceId`,`saleorder`.`StatusId` AS `StatusId`,`ev`.`Value` AS `Status`,`saleorder`.`WaiterId` AS `WaiterId`,`saleorder`.`CustomerId` AS `CustomerId`,`saleorder`.`RestaurantId` AS `RestaurantId`,`saleorder`.`Name` AS `Name`,`saleorder`.`Address` AS `Address`,`saleorder`.`PhoneNo` AS `PhoneNo`,`saleorder`.`Total` AS `Total`,`saleorder`.`Guest` AS `Guest`,`saleorder`.`Discount` AS `Discount`,`saleorder`.`GST` AS `GST`,`saleorder`.`TableNo` AS `TableNo`,`saleorder`.`Note` AS `Note`,`saleorder`.`Service` AS `Service`,`saleorder`.`NetTotal` AS `NetTotal`,`saleorder`.`PaymentMethod` AS `PaymentMethod`,`saleorder`.`DispatchedTime` AS `DispatchedTime`,`saleorder`.`DeliveryTime` AS `DeliveryTime`,`saleorder`.`CreatedOn` AS `CreatedOn`,`saleorder`.`CreatedById` AS `CreatedById`,`saleorder`.`ModifiedOn` AS `ModifiedOn`,`saleorder`.`ModifiedById` AS `ModifiedById`,`saleorder`.`IsActive` AS `IsActive` from (((`saleorder` join `enumvalue` `ev` on((`ev`.`Id` = `saleorder`.`StatusId`))) join `enumvalue` `shiftev` on((`shiftev`.`Id` = `saleorder`.`ShiftId`))) join `enumvalue` `enumv` on((`enumv`.`Id` = `saleorder`.`OrderTypeId`))) */;
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
/*!50001 VIEW `vw_shift` AS select `shift`.`Id` AS `Id`,`shift`.`UserId` AS `UserId`,`user`.`Name` AS `UserName`,`role`.`Name` AS `Role`,`shift`.`StartTime` AS `StartTime`,`shift`.`EndTime` AS `EndTime`,`shift`.`FloatingCash` AS `FloatingCash`,`shift`.`ShiftEndCash` AS `ShiftEndCash`,`shift`.`ShiftValueId` AS `ShiftValueId`,`ev`.`Value` AS `Shift`,`shift`.`CreatedOn` AS `CreatedOn`,`shift`.`CreatedById` AS `CreatedById`,`shift`.`ModifiedOn` AS `ModifiedOn`,`shift`.`ModifiedById` AS `ModifiedById`,`shift`.`IsActive` AS `IsActive` from ((((`shift` join `aspnetusers` `user` on((`user`.`Id` = `shift`.`UserId`))) join `aspnetuserroles` `urole` on((`urole`.`UserId` = `user`.`Id`))) join `aspnetroles` `role` on((`urole`.`RoleId` = `role`.`Id`))) join `enumvalue` `ev` on((`ev`.`Id` = `shift`.`ShiftValueId`))) */;
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

-- Dump completed on 2023-02-25 22:33:16
