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
INSERT INTO `aspnetroles` VALUES ('1058f9d1-15a6-4da9-b6bd-18d9badcc9d1','Admin','ADMIN','788148b6-1920-41f5-a6b9-5254c7097ad7'),('2749de9e-fb86-40ab-ad63-c54ce0433eb9','Waiter','WAITER','c73bfea4-0f99-43e5-a3a9-6fc64c5043bc'),('c3692c13-8f23-4bfb-9144-5ed13ff5157b','Cashier','CASHIER','9d20fdb7-58e8-4a54-a6ff-8f4f98f2b8a5'),('f6b1ceb8-d7bc-4416-8f4b-af7a9b228bc3','Manager','MANAGER','a782a5d3-5745-45f9-a66f-494c6720bdf1');
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
  `BranchId` int DEFAULT NULL,
  `FatherName` varchar(255) DEFAULT NULL,
  `CNIC` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `MSCardNo` varchar(255) DEFAULT NULL,
  `DiscountLimit` int DEFAULT NULL,
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
INSERT INTO `aspnetusers` VALUES ('03ed5909-03a3-45b3-8078-0de377027137',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'S@34ameer','Anmol',NULL,NULL,NULL,NULL,'S@34ameer','S@34AMEER','Anmol@gmail.com','ANMOL@GMAIL.COM',0,'AQAAAAEAACcQAAAAEGwxxXz71CkCp1LXrmVUMLDUQv03CUm2AfTYSYHyR6fkegxd40bLIpu3Oqdd4t+1SA==','HUSDUXSF5OHD5BH25PS7UH3EMLETTCZB','f476d500-ad30-4832-b294-c7a6eb2a29b0','0987657612',0,0,NULL,1,0),('2117c8e3-3ded-40e6-a522-fc2be72fbd9b',1,5,'Akhtar','1234567899876','Address','Designation...','1102',20,'123456789','Bint-e-Ameer','Sumaira',NULL,NULL,NULL,'123456789','123456789','bintameer213@gmail.com','BINTAMEER213@GMAIL.COM',0,'AQAAAAEAACcQAAAAELeADoalWBGOsJKE5h7tRXT0IbPrh2zoMSfe/kj9nmpKwYGzd5yUaSNehddGMjyi3g==','VAGVULI3YMWNJ4UEMP4PZPXTORJBMX5O','7c7aa02e-947c-497e-9da2-e97ef239d377','12345678919',0,0,NULL,1,0),('4bdf2399-9ba4-4d1f-96e4-eaf32c16bf49',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'789075','Martin',NULL,NULL,NULL,NULL,'789075','789075','Martin@gmail.com','MARTIN@GMAIL.COM',0,'AQAAAAEAACcQAAAAEFks0asS7jRu4yq/NC/UR6rYXhNhOwC+C1XuhOQI03BfzO1CzHSsFqifGtF1JzPeGg==','6PJHY25TCNOZ7X7MQXW7TKA5U4OFWBH4','ce0f0542-71a2-439e-9474-f619f6c0f2d0','1234567897',0,0,NULL,1,0),('53f7fb76-b848-4c9a-b4a5-cd074ec22d8b',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'S@3ameer','Sumaira',NULL,NULL,NULL,NULL,'S@3ameer','S@3AMEER','bintameer212@gmail.com','BINTAMEER212@GMAIL.COM',0,'AQAAAAEAACcQAAAAEI/znrK0PzlOZY/Q6GXcByDq/3N0dV//iw/L7jALlYeRuh0jjFxHwhsiEYAc+AddpA==','SRAQJYHMY4M5TZO3XVHHGZMXDTONZBM3','e88a11e8-4c91-4c3f-8b80-a101a00f96e8','1234567891',0,0,NULL,1,0),('5fc0342a-5727-450f-ae26-0eede5c0c28b',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'78987','Peter',NULL,NULL,NULL,NULL,'78987','78987','Peter@gmail.com','PETER@GMAIL.COM',0,'AQAAAAEAACcQAAAAEItKsa3mKEUbcDLn2YB+AngN/Lp63Y7vpumdyUEflcCxiX3VRIbTT/o+7wUaiYkfpg==','XR2IUQ2BEAGCFOC77USXTLKHY6PT5UD7','4b00754b-5aa0-417a-9385-314ee58ec078','1234567897',0,0,NULL,1,0),('8169998e-5db4-42ca-887c-c85c68e5c5eb',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12345','Jasika',NULL,NULL,NULL,NULL,'12345','12345','Jasika@gmail.com','JASIKA@GMAIL.COM',0,'AQAAAAEAACcQAAAAEEHNqBZkGr7aWKFCbBLbWWg1a72aE8GfEHf8Uw7LjnTEqXfLxzojAYxvWNWD8RQODw==','VKEKXMGC56LETFXPFEIEFBSQLUPK6P6K','5c326514-5417-4f44-aaa7-40257e04387e','1234567897',0,0,NULL,1,0),('8673fc06-398a-420a-8555-ae2b3f9f772c',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sumaira','SUMAIRA','bintameer212@gmail.com','BINTAMEER212@GMAIL.COM',0,'AQAAAAEAACcQAAAAELnVp4Zbb6j7EXUHyHBG2flR/KaK3DrReV0Gj4mf0nok+yJ0ilvyN6n7FfxmhdRMRw==','ZXQ2EEQPO72CJRWHRHWL5U24GCUQBEP7','4ffcb322-fcb4-4e44-9bc3-d8af1aba562a','09876543',0,0,NULL,1,0),('ab169d87-a803-48a4-84c2-43c7ed250287',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1234','Eric',NULL,NULL,NULL,NULL,'1234','1234','Eric@gmail.com','ERIC@GMAIL.COM',0,'AQAAAAEAACcQAAAAENndOFFwC7WsqdJ0/d9uKQQc4zQgwLOmmZf/J3ZMgJ8qD20MpUHaXFBB6z4GvRziiA==','OPM5GFDY7KVLLS522ZXI7UB2B6GTGSH5','1e1d7d3b-6e2d-454d-a648-5b6133de3861','1234567897',0,0,NULL,1,0),('b6ce1cc0-f2a8-491d-805c-db1e75146b9d',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7890','John',NULL,NULL,NULL,NULL,'7890','7890','John@gmail.com','JOHN@GMAIL.COM',0,'AQAAAAEAACcQAAAAEOSFr2mBKkb76klhrlYkz/YjjcTr5GMyr5EcSChvkHa465ONO9+LFhHbHEgAwkthAQ==','FXB5Z4NSHVJQOKIKU3DW2ZRVJ7RQJUWR','8c99bf94-102a-4e99-9354-214ec6739592','1234567897',0,0,NULL,1,0),('e9cc6389-7908-4093-ad6d-b673b6e2475f',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'090078601','Elena',NULL,NULL,NULL,NULL,'090078601','090078601','Elena@gmail.com','ELENA@GMAIL.COM',0,'AQAAAAEAACcQAAAAENM3cAffHTk4GqAwc0a3GzgU8ngqQ1iVmUCKIsrrvkRUsR7Vm2jQPtoDD8DVErBs0g==','LDCJYINXTR3EGC7X4DL4VSPO2BN6T254','e8e2d006-1973-40d7-a32b-c9d14c734d36','1234567897',0,0,NULL,1,0);
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
-- Table structure for table `assignaccount`
--

DROP TABLE IF EXISTS `assignaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignaccount` (
  `Id` int NOT NULL,
  `BranchId` int DEFAULT NULL,
  `AccountTypeId` int DEFAULT NULL,
  `AccountId` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignaccount`
--

LOCK TABLES `assignaccount` WRITE;
/*!40000 ALTER TABLE `assignaccount` DISABLE KEYS */;
INSERT INTO `assignaccount` VALUES (1,5,1035002,1035002,'2023-04-11 16:44:35',0,'2023-04-11 16:44:35',0,_binary ''),(2,6,1035001,1035002,'2023-04-11 17:10:10',0,'2023-04-11 17:10:10',0,_binary '\0');
/*!40000 ALTER TABLE `assignaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachsubitem`
--

DROP TABLE IF EXISTS `attachsubitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachsubitem` (
  `Id` int NOT NULL,
  `GroupId` int DEFAULT NULL,
  `ItemId` int DEFAULT NULL,
  `ModifierId` int DEFAULT NULL,
  `SubItemId` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachsubitem`
--

LOCK TABLES `attachsubitem` WRITE;
/*!40000 ALTER TABLE `attachsubitem` DISABLE KEYS */;
INSERT INTO `attachsubitem` VALUES (1,1022001,71,94,1033001,1,'2023-04-05 20:26:52',0,'2023-04-05 20:26:52',0,_binary '');
/*!40000 ALTER TABLE `attachsubitem` ENABLE KEYS */;
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
  `BranchEnumTypeId` int DEFAULT NULL,
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
INSERT INTO `branch` VALUES (4,NULL,1044001,NULL,'Branch_1','code',NULL,NULL,NULL,'2023-01-26 07:47:16',0,'0001-01-01 00:00:00',0,_binary ''),(5,NULL,1044002,NULL,'Branch_2','code',NULL,NULL,NULL,'2023-01-26 07:53:06',0,'0001-01-01 00:00:00',0,_binary ''),(6,NULL,1044003,NULL,'Branch_3','code',NULL,NULL,NULL,'2023-01-26 07:53:13',0,'0001-01-01 00:00:00',0,_binary ''),(7,6,1044004,NULL,'Branch_4','code','type','location',_binary '','2023-01-30 00:48:13',0,'0001-01-01 00:00:00',0,_binary ''),(8,0,1009001,NULL,'ABC','code',NULL,NULL,_binary '\0','2023-06-06 12:24:45',0,'2023-06-06 12:24:45',0,_binary '\0'),(9,0,1009001,NULL,'test','code',NULL,NULL,_binary '\0','2023-06-06 12:26:00',0,'2023-06-06 12:26:00',0,_binary '\0'),(10,0,1009001,NULL,'test','code',NULL,NULL,_binary '\0','2023-06-06 12:26:42',0,'2023-06-06 12:26:42',0,_binary '\0'),(11,0,1044005,NULL,'test','code',NULL,NULL,_binary '\0','2023-06-06 12:28:56',0,'2023-06-06 12:28:56',0,_binary '\0'),(12,0,1044005,NULL,'test','code',NULL,NULL,_binary '\0','2023-06-06 12:32:06',0,'2023-06-06 12:32:06',0,_binary '\0'),(13,0,1044006,NULL,'tset','code',NULL,NULL,_binary '\0','2023-06-06 12:34:31',0,'2023-06-06 12:34:31',0,_binary '\0'),(14,0,1044007,NULL,'test','code',NULL,NULL,_binary '\0','2023-06-06 12:36:29',0,'2023-06-06 12:36:29',0,_binary '\0'),(15,0,1044008,NULL,'ABC','code',NULL,NULL,_binary '\0','2023-06-06 12:49:52',0,'2023-06-06 12:49:52',0,_binary '\0'),(16,0,1044005,NULL,'test...','code',NULL,NULL,_binary '\0','2023-06-06 12:55:36',0,'2023-06-06 12:55:36',0,_binary '\0');
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
-- Table structure for table `chartaccountcode`
--

DROP TABLE IF EXISTS `chartaccountcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chartaccountcode` (
  `Id` int NOT NULL,
  `AccountTypeId` int DEFAULT NULL,
  `Code` varchar(200) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chartaccountcode`
--

LOCK TABLES `chartaccountcode` WRITE;
/*!40000 ALTER TABLE `chartaccountcode` DISABLE KEYS */;
INSERT INTO `chartaccountcode` VALUES (1,1035002,'1002','2023-04-11 16:31:17',0,'2023-04-11 16:31:17',0,_binary '');
/*!40000 ALTER TABLE `chartaccountcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyinfo`
--

DROP TABLE IF EXISTS `companyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companyinfo` (
  `Id` int NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `PhoneNo` varchar(200) DEFAULT NULL,
  `Address` varchar(5000) DEFAULT NULL,
  `BillNote` varchar(5000) DEFAULT NULL,
  `LogoBase64Path` longtext,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyinfo`
--

LOCK TABLES `companyinfo` WRITE;
/*!40000 ALTER TABLE `companyinfo` DISABLE KEYS */;
INSERT INTO `companyinfo` VALUES (1,'FTech','09876543258','Garden Town Lahore ','Bill Note',NULL,'2023-03-18 00:30:20',0,'0001-01-01 00:00:00',0,_binary ''),(2,'Abcs','0987654325s','asdffgn11','12',NULL,'2023-03-18 00:31:39',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `companyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completewaste`
--

DROP TABLE IF EXISTS `completewaste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `completewaste` (
  `Id` int NOT NULL,
  `GroupId` int DEFAULT NULL,
  `KeyWord` varchar(200) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completewaste`
--

LOCK TABLES `completewaste` WRITE;
/*!40000 ALTER TABLE `completewaste` DISABLE KEYS */;
INSERT INTO `completewaste` VALUES (1,1022001,'Key Word....','2023-04-13 19:00:00','2023-04-05 00:18:35',0,'2023-04-05 00:18:35',0,_binary '');
/*!40000 ALTER TABLE `completewaste` ENABLE KEYS */;
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
-- Table structure for table `deliveryprice`
--

DROP TABLE IF EXISTS `deliveryprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryprice` (
  `Id` int NOT NULL,
  `ItemId` int DEFAULT NULL,
  `SizeId` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryprice`
--

LOCK TABLES `deliveryprice` WRITE;
/*!40000 ALTER TABLE `deliveryprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveryprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demand`
--

DROP TABLE IF EXISTS `demand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demand` (
  `Id` int NOT NULL,
  `BranchId` int DEFAULT NULL,
  `ItemId` int DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demand`
--

LOCK TABLES `demand` WRITE;
/*!40000 ALTER TABLE `demand` DISABLE KEYS */;
INSERT INTO `demand` VALUES (1,4,64,'2023-04-13 19:00:00','2023-04-05 00:16:22',0,'2023-04-05 00:16:22',0,_binary '');
/*!40000 ALTER TABLE `demand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicesetting`
--

DROP TABLE IF EXISTS `devicesetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devicesetting` (
  `Id` int NOT NULL,
  `DeviceId` int DEFAULT NULL,
  `ScreenNo` int DEFAULT NULL,
  `Terminal` varchar(300) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `devicesetting_ibfk_1_idx` (`DeviceId`),
  CONSTRAINT `devicesetting_ibfk_1` FOREIGN KEY (`DeviceId`) REFERENCES `enumline` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicesetting`
--

LOCK TABLES `devicesetting` WRITE;
/*!40000 ALTER TABLE `devicesetting` DISABLE KEYS */;
INSERT INTO `devicesetting` VALUES (1,1031001,2,'Terminal','2023-03-18 19:25:16',0,'0001-01-01 00:00:00',0,_binary ''),(2,1031004,8,'Terminal','2023-03-18 19:25:29',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `devicesetting` ENABLE KEYS */;
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
-- Table structure for table `discountcampaign`
--

DROP TABLE IF EXISTS `discountcampaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discountcampaign` (
  `Id` int NOT NULL,
  `TypeId` int DEFAULT NULL,
  `MenuGroupId` int DEFAULT NULL,
  `Discount` float DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `StartTime` varchar(200) DEFAULT NULL,
  `EndTime` varchar(200) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `TillDayEnd` bit(1) DEFAULT NULL,
  `Monday` bit(1) DEFAULT NULL,
  `Tuesday` bit(1) DEFAULT NULL,
  `Wednesday` bit(1) DEFAULT NULL,
  `Thursday` bit(1) DEFAULT NULL,
  `Friday` bit(1) DEFAULT NULL,
  `Saturday` bit(1) DEFAULT NULL,
  `Sunday` bit(1) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `discountcampaign_ibfk_1_idx` (`TypeId`),
  KEY `discountcampaign_ibfk_2_idx` (`MenuGroupId`),
  CONSTRAINT `discountcampaign_ibfk_1` FOREIGN KEY (`TypeId`) REFERENCES `enumline` (`Id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `discountcampaign_ibfk_2` FOREIGN KEY (`MenuGroupId`) REFERENCES `enumline` (`Id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discountcampaign`
--

LOCK TABLES `discountcampaign` WRITE;
/*!40000 ALTER TABLE `discountcampaign` DISABLE KEYS */;
INSERT INTO `discountcampaign` VALUES (1,1034001,1022006,10,'Azadi Discount','16:20','03:30','2023-04-29 00:00:00','2023-04-30 00:00:00',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '',_binary '',_binary '\0',_binary '\0','2023-04-02 23:11:48',0,'2023-04-02 23:11:48',0,_binary ''),(2,1034001,1022005,20,'Sumaira Ameer','2023-04-03 00:00:00','0001-01-01 00:00:00','2023-03-20 19:00:00','2023-03-30 19:00:00',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','2023-04-03 00:15:46',0,'2023-04-03 00:15:46',0,_binary '\0'),(3,1034001,1022005,10,'Sumaira','2023-04-03 00:00:00','0001-01-01 00:00:00','2023-03-20 19:00:00','2023-03-22 19:00:00',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','2023-04-03 00:21:47',0,'2023-04-03 00:21:47',0,_binary '\0'),(4,1034002,1022005,12,'ABC','2023-04-03 00:00:00','0001-01-01 00:00:00','2023-04-02 20:54:44','2023-04-02 20:54:44',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '','2023-04-03 01:55:17',0,'2023-04-03 01:55:17',0,_binary '\0'),(5,1034001,1022005,10,'Sumaira','2023-04-03 00:00:00','0001-01-01 00:00:00','2023-04-02 21:23:17','2023-04-02 21:23:17',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','2023-04-03 02:23:40',0,'2023-04-03 02:23:40',0,_binary '\0'),(6,1034001,1022003,10,'Sumaira','2023-04-03 18:23:43','0001-01-01 00:00:00','2023-04-02 21:52:23','2023-04-02 21:52:23',_binary '\0',_binary '\0',_binary '',_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0','2023-04-03 02:52:43',0,'2023-04-03 02:52:43',0,_binary '\0'),(7,1034001,1022004,12,'Sumaira','2023-04-03 10:20:14','0001-01-01 00:00:00','2023-04-02 22:10:50','2023-04-02 22:10:50',_binary '',_binary '\0',_binary '',_binary '',_binary '',_binary '\0',_binary '\0',_binary '\0','2023-04-03 03:11:14',0,'2023-04-03 03:11:14',0,_binary '\0'),(8,1034001,1022005,12,'Testing','2023-04-03 10:30:27','2023-04-03 00:00:00','2023-04-02 22:15:43','2023-04-26 19:00:00',_binary '\0',_binary '\0',_binary '',_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0','2023-04-03 03:16:10',0,'2023-04-03 03:16:10',0,_binary '\0'),(9,1034001,1022005,10,'Testing','21:45','15:29','2023-04-04 00:00:00','2023-04-04 13:02:45',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','2023-04-04 18:03:07',0,'2023-04-04 18:03:07',0,_binary ''),(10,1034001,1022005,10,'Testing','10:40','14:29','2023-04-04 00:00:00','2023-04-04 13:08:51',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','2023-04-04 18:09:24',0,'2023-04-04 18:09:24',0,_binary '\0'),(11,1034001,1022005,10,'Test','23:30','16:25','2023-04-12 00:00:00','2023-04-13 00:00:00',_binary '\0',_binary '\0',_binary '',_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0','2023-04-11 17:33:25',0,'2023-04-11 17:33:25',0,_binary '\0'),(12,1034001,1022003,10,'Eid Discount','22:45','03:30','2023-04-12 00:00:00','2023-04-12 00:00:00',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '','2023-04-12 18:09:09',0,'2023-04-12 18:09:09',0,_binary '');
/*!40000 ALTER TABLE `discountcampaign` ENABLE KEYS */;
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
-- Table structure for table `employeeattendance`
--

DROP TABLE IF EXISTS `employeeattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeattendance` (
  `Id` int NOT NULL,
  `EmployeeId` int DEFAULT NULL,
  `Days` int DEFAULT NULL,
  `Month` datetime DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeattendance`
--

LOCK TABLES `employeeattendance` WRITE;
/*!40000 ALTER TABLE `employeeattendance` DISABLE KEYS */;
INSERT INTO `employeeattendance` VALUES (1,2,24,'2023-03-01 00:00:00','2023-03-28 18:50:40',0,'0001-01-01 00:00:00',0,1),(2,3,20,'2021-02-28 19:00:00','2023-03-28 20:48:27',0,'0001-01-01 00:00:00',0,1),(3,4,30,'2015-12-31 19:00:00','2023-03-28 20:49:04',0,'0001-01-01 00:00:00',0,1);
/*!40000 ALTER TABLE `employeeattendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeesalary`
--

DROP TABLE IF EXISTS `employeesalary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeesalary` (
  `Id` int NOT NULL,
  `EmployeeId` int DEFAULT NULL,
  `Amount` varchar(2000) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `EmployeeId` (`EmployeeId`),
  CONSTRAINT `employeesalary_ibfk_1` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeesalary`
--

LOCK TABLES `employeesalary` WRITE;
/*!40000 ALTER TABLE `employeesalary` DISABLE KEYS */;
INSERT INTO `employeesalary` VALUES (1,2,'20000','2023-03-18 00:00:00','2023-03-17 22:32:15',0,'0001-01-01 00:00:00',0,_binary ''),(2,8,'10000','2022-02-14 19:00:00','2023-03-17 23:28:15',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `employeesalary` ENABLE KEYS */;
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
INSERT INTO `enumline` VALUES (1000001,1000,0,'Permissions_ReadOnly','ReadOnly','',_binary '',_binary '','2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1000002,1000,0,'Permissions_FullAccess','FullAccess',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1000003,1000,0,'Permissions_Deny','Deny',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1001001,1001,0,'Statuses_Open','Open',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1001002,1001,0,'Statuses_InProgress','InProgress',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1001003,1001,0,'Statuses_Close','Close',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1001004,1001,0,'Statuses_Dispatched','Dispatched',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1001005,1001,0,'Statuses_Delivered','Delivered',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1002001,1002,0,'Shift_Morning','Morning',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1002002,1002,0,'Shift_Evening','Evening',NULL,_binary '',_binary '\0','2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1003001,1003,NULL,'Sources_Careem','Careem',NULL,_binary '\0',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1004001,1004,0,'OrderTypes_TakeAway','TakeAway',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1004002,1004,0,'OrderTypes_DineIn','DineIn',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1004003,1004,0,'OrderTypes_Delivery','Delivery',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1005001,1005,0,'DiscountTypes_DiscountVoucher','DiscountVoucher',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1005002,1005,0,'DiscountTypes_DiscountKey','DiscountKey',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1006001,1006,NULL,'-8126464','Mehron',NULL,_binary '',NULL,'2023-03-04 23:11:48',0,NULL,NULL,_binary ''),(1006002,1006,NULL,'-8978343','Purple',NULL,_binary '',NULL,'2023-03-04 23:11:48',0,NULL,NULL,_binary ''),(1006003,1006,NULL,'-16759672','Navy Blue',NULL,_binary '',NULL,'2023-03-04 23:11:48',0,NULL,NULL,_binary ''),(1006004,1006,NULL,'-16743292','C Green',NULL,_binary '',NULL,'2023-03-04 23:11:49',0,NULL,NULL,_binary ''),(1006005,1006,NULL,'-14781184','Green',NULL,_binary '',NULL,'2023-03-04 23:11:49',0,NULL,NULL,_binary ''),(1006006,1006,NULL,'-9342720','Mehndi',NULL,_binary '',NULL,'2023-03-04 23:11:49',0,NULL,NULL,_binary ''),(1006007,1006,NULL,'-8963072','Red Wine',NULL,_binary '',NULL,'2023-03-04 23:11:49',0,NULL,NULL,_binary ''),(1006008,1006,NULL,'-12895429','Red Grey',NULL,_binary '',NULL,'2023-03-04 23:11:49',0,NULL,NULL,_binary ''),(1006009,1006,NULL,'-5220352','DarkOrange',NULL,_binary '',NULL,'2023-03-04 23:11:49',0,NULL,NULL,_binary ''),(1006010,1006,NULL,'-16777216','Black',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006011,1006,NULL,'-1','White',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006012,1006,NULL,'-4144960','Silver',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006013,1006,NULL,'-1197159','Liver',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006014,1006,NULL,'2822177','Light Sky',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006015,1006,NULL,'-1978646','Light Purp',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006016,1006,NULL,'-533393','Light Yellow',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006017,1006,NULL,'-8011287','Light Sky Hard',NULL,_binary '',NULL,'2023-03-04 23:11:50',0,NULL,NULL,_binary ''),(1006018,1006,NULL,'-4343956','Dark Khaki',NULL,_binary '',NULL,'2023-03-04 23:11:51',0,NULL,NULL,_binary ''),(1006019,1006,NULL,'-29532','Light Red',NULL,_binary '',NULL,'2023-03-04 23:11:51',0,NULL,NULL,_binary ''),(1006020,1006,NULL,'-4063386','Greeny Yellow',NULL,_binary '',NULL,'2023-03-04 23:11:51',0,NULL,NULL,_binary ''),(1007001,1007,NULL,'N/A','N/A',NULL,_binary '',NULL,'2023-03-05 21:43:08',0,NULL,NULL,_binary ''),(1008001,1008,NULL,'Ltr','Ltr',NULL,_binary '',NULL,'2023-03-05 21:55:22',0,NULL,NULL,_binary ''),(1008002,1008,NULL,'Kg','Kg',NULL,_binary '',NULL,'2023-03-05 21:55:23',0,NULL,NULL,_binary ''),(1008003,1008,NULL,'Pcs','Pcs',NULL,_binary '',NULL,'2023-03-05 21:55:23',0,NULL,NULL,_binary ''),(1008004,1008,NULL,'ml','ml',NULL,_binary '',NULL,'2023-03-05 21:55:24',0,NULL,NULL,_binary ''),(1008005,1008,NULL,'gm','gm',NULL,_binary '',NULL,'2023-03-05 21:55:24',0,NULL,NULL,_binary ''),(1008006,1008,NULL,'Chicken_Bucket','Chicken Bucket',NULL,_binary '',NULL,'2023-03-05 21:55:25',0,NULL,NULL,_binary ''),(1010001,1010,NULL,'Small','Small',NULL,_binary '',NULL,'2023-03-05 22:35:04',0,NULL,NULL,_binary ''),(1010002,1010,NULL,'Medium','Medium',NULL,_binary '',NULL,'2023-03-05 22:35:05',0,NULL,NULL,_binary ''),(1010003,1010,NULL,'Large','Large',NULL,_binary '',NULL,'2023-03-05 22:35:05',0,NULL,NULL,_binary ''),(1010004,1010,0,'N/A','N/A',NULL,_binary '',_binary '\0','2023-04-20 15:33:35',0,'2023-04-20 15:33:35',0,_binary ''),(1012001,1012,NULL,'Raw_Item','Raw Item',NULL,_binary '',NULL,'2023-03-05 23:03:55',0,NULL,NULL,_binary ''),(1012002,1012,NULL,'Menu_Item','Menu Item',NULL,_binary '',NULL,'2023-03-05 23:03:56',0,NULL,NULL,_binary ''),(1015001,1015,1023001,'Item_Sub_Category_Cooking_Kitchen','Cooking Kitchen',NULL,_binary '\0',_binary '\0','2023-03-12 19:33:03',0,'0001-01-01 00:00:00',0,_binary ''),(1015002,1015,1023001,'Item_Sub_Category_Packing_Kitchen','Packing Kitchen',NULL,_binary '\0',_binary '\0','2023-03-12 19:37:38',0,'0001-01-01 00:00:00',0,_binary ''),(1016001,1016,0,'Floor_Floor_1','Floor 1',NULL,_binary '\0',_binary '\0','2023-03-07 20:16:14',0,'0001-01-01 00:00:00',0,_binary ''),(1016002,1016,0,'Floor_Floor_2','Floor 2',NULL,_binary '\0',_binary '\0','2023-03-07 20:16:24',0,'0001-01-01 00:00:00',0,_binary ''),(1016003,1016,0,'Floor_Floor_3','Floor 3',NULL,_binary '\0',_binary '\0','2023-03-07 20:17:01',0,'0001-01-01 00:00:00',0,_binary ''),(1017001,1017,1016001,'Table_T1','T1',NULL,_binary '\0',_binary '\0','2023-03-07 20:17:50',0,'0001-01-01 00:00:00',0,_binary ''),(1017002,1017,1016001,'Table_T2','T2',NULL,_binary '\0',_binary '\0','2023-03-07 20:18:14',0,'0001-01-01 00:00:00',0,_binary ''),(1017003,1017,1016002,'Table_T3','T3',NULL,_binary '\0',_binary '\0','2023-03-07 20:18:27',0,'0001-01-01 00:00:00',0,_binary ''),(1017004,1017,1016003,'Table_T4','T4',NULL,_binary '\0',_binary '\0','2023-03-07 20:18:39',0,'0001-01-01 00:00:00',0,_binary ''),(1017005,1017,1016003,'Table_T5','T5',NULL,_binary '\0',_binary '\0','2023-03-07 20:18:51',0,'0001-01-01 00:00:00',0,_binary ''),(1017006,1017,1016003,'Table_T6','T6',NULL,_binary '\0',_binary '\0','2023-03-07 20:19:05',0,'0001-01-01 00:00:00',0,_binary ''),(1018001,1018,0,'/settings','Item Settings',NULL,_binary '',_binary '\0','2023-03-10 09:21:57',0,'0001-01-01 00:00:00',0,_binary ''),(1018002,1018,0,'/inventory','Inventory',NULL,_binary '',_binary '\0','2023-03-10 09:22:11',0,'0001-01-01 00:00:00',0,_binary ''),(1018003,1018,0,'/backOffice','Reports',NULL,_binary '',_binary '\0','2023-03-11 00:04:50',0,'0001-01-01 00:00:00',0,_binary ''),(1018004,1018,0,'/backOffice','Accounts',NULL,_binary '',_binary '\0','2023-03-11 19:44:07',0,'0001-01-01 00:00:00',0,_binary ''),(1018005,1018,0,'/backOffice','Downloads',NULL,_binary '',_binary '\0','2023-03-11 19:44:25',0,'0001-01-01 00:00:00',0,_binary ''),(1018006,1018,0,'/others','Others',NULL,_binary '',_binary '\0','2023-03-11 00:05:54',0,'0001-01-01 00:00:00',0,_binary ''),(1018007,1018,0,'/restaurant/deals','Deals',NULL,_binary '',_binary '\0','2023-03-30 22:17:13',0,'2023-03-30 22:17:13',0,_binary ''),(1018008,1018,0,'/catalog/manageSetting','Settings',NULL,_binary '',_binary '\0','2023-06-02 23:23:06',0,'2023-06-02 23:23:06',0,_binary ''),(1019001,1019,1018001,'/settings/items','1. Product',NULL,_binary '',_binary '\0','2023-03-10 09:22:54',0,'0001-01-01 00:00:00',0,_binary ''),(1019002,1019,1018001,'/settings/sale','2. Sale',NULL,_binary '',_binary '\0','2023-03-10 09:23:10',0,'0001-01-01 00:00:00',0,_binary ''),(1019005,1019,1018003,'/restaurant/saleReport','Sale Report',NULL,_binary '\0',_binary '\0','2023-03-11 00:05:25',0,'0001-01-01 00:00:00',0,_binary ''),(1019008,1019,1018006,'/restaurant/manageRider','Rider',NULL,_binary '\0',_binary '\0','2023-03-11 00:07:54',0,'0001-01-01 00:00:00',0,_binary ''),(1019010,1019,1018001,'/settings/empManagement','3. Company Profile',NULL,_binary '',_binary '\0','2023-03-11 19:34:00',0,'0001-01-01 00:00:00',0,_binary ''),(1019011,1019,1018001,'/settings/employeeManagement','4. Emp Management',NULL,_binary '',_binary '\0','2023-03-11 19:37:53',0,'0001-01-01 00:00:00',0,_binary ''),(1019012,1019,1018001,'/backOffice/deals','5. Deals',NULL,_binary '',_binary '\0','2023-03-11 19:39:12',0,'0001-01-01 00:00:00',0,_binary '\0'),(1019013,1019,1018002,'/restaurant/rawItemList','1. Add Raw Item',NULL,_binary '',_binary '\0','2023-03-11 19:50:22',0,'0001-01-01 00:00:00',0,_binary ''),(1019014,1019,1018002,'/restaurant/commingSoon','2. Purchase Order',NULL,_binary '',_binary '\0','2023-03-11 19:50:43',0,'0001-01-01 00:00:00',0,_binary ''),(1019015,1019,1018002,'/restaurant/commingSoon','3. Purchase Item',NULL,_binary '',_binary '\0','2023-03-11 19:51:03',0,'0001-01-01 00:00:00',0,_binary ''),(1019016,1019,1018002,'/inventory/purchaseReturnList','4. Purchase Return',NULL,_binary '',_binary '\0','2023-03-11 19:51:57',0,'0001-01-01 00:00:00',0,_binary ''),(1019017,1019,1018002,'/inventory/demand','5. Demand',NULL,_binary '',_binary '\0','2023-03-11 19:52:27',0,'0001-01-01 00:00:00',0,_binary ''),(1019018,1019,1018002,'/restaurant/commingSoon','6. Issue Stock',NULL,_binary '',_binary '\0','2023-03-11 19:52:49',0,'0001-01-01 00:00:00',0,_binary ''),(1019019,1019,1018002,'/inventory/inventoryTransfer','7. Inventory Transfer',NULL,_binary '',_binary '\0','2023-03-11 19:53:21',0,'0001-01-01 00:00:00',0,_binary ''),(1019020,1019,1018002,'/inventory/completeWaste','8. Complete Waste',NULL,_binary '',_binary '\0','2023-03-11 19:54:01',0,'0001-01-01 00:00:00',0,_binary ''),(1019021,1019,1018002,'/restaurant/commingSoon','9. Critical Inventory',NULL,_binary '',_binary '\0','2023-03-11 19:54:43',0,'0001-01-01 00:00:00',0,_binary ''),(1019022,1019,1018002,'/inventory/kitchenDemand','10. Kitchen Demand',NULL,_binary '',_binary '\0','2023-03-11 19:55:24',0,'0001-01-01 00:00:00',0,_binary ''),(1019023,1019,1018002,'/inventory/kitchenIssuance','11. Kitchen Insurance',NULL,_binary '',_binary '\0','2023-03-11 19:56:33',0,'0001-01-01 00:00:00',0,_binary ''),(1019024,1019,1018002,'/inventory/stockEstimation','12. Stock Estimation',NULL,_binary '',_binary '\0','2023-03-11 19:57:03',0,'0001-01-01 00:00:00',0,_binary ''),(1019025,1019,1018004,'/account/accountCode','Account Code',NULL,_binary '',_binary '\0','2023-03-20 21:35:39',0,'0001-01-01 00:00:00',0,_binary ''),(1019026,1019,1018004,'/account/assignAccount','Assign Account',NULL,_binary '',_binary '\0','2023-04-11 16:43:11',0,'2023-04-11 16:43:11',0,_binary ''),(1020001,1020,1019001,'/restaurant/enumLineFields?type=1021','1.1 Group',NULL,_binary '',_binary '\0','2023-03-10 09:25:17',0,'0001-01-01 00:00:00',0,_binary ''),(1020002,1020,1019001,'/restaurant/enumLineFields?type=1023','1.2 Category',NULL,_binary '',_binary '\0','2023-03-10 23:57:57',0,'0001-01-01 00:00:00',0,_binary ''),(1020003,1020,1019001,'/restaurant/enumLineFields?type=1015','1.3 Sub Category',NULL,_binary '',_binary '\0','2023-03-10 23:58:14',0,'0001-01-01 00:00:00',0,_binary ''),(1020006,1020,1019001,'/stakeholder/supplierList','1.4 Supplier','',_binary '',_binary '\0','2023-03-10 10:14:55',0,'0001-01-01 00:00:00',0,_binary ''),(1020008,1020,1019001,'/restaurant/enumLineFields?type=1007','1.5 Brand',NULL,_binary '',_binary '\0','2023-03-11 22:51:03',0,'0001-01-01 00:00:00',0,_binary ''),(1020009,1020,1019001,'/restaurant/manageStore','1.6 Srore',NULL,_binary '',_binary '\0','2023-03-10 23:40:28',0,'0001-01-01 00:00:00',0,_binary ''),(1020011,1020,1019001,'/restaurant/manageBranch','1.7 Branch',NULL,_binary '',_binary '\0','2023-03-10 23:49:45',0,'0001-01-01 00:00:00',0,_binary ''),(1020013,1020,1019001,'/restaurant/enumLineFields?type=1010','1.8 Size',NULL,_binary '',_binary '\0','2023-03-10 23:56:21',0,'0001-01-01 00:00:00',0,_binary ''),(1020014,1020,1019001,'/restaurant/enumLineFields?type=1006','1.9 Color',NULL,_binary '',_binary '\0','2023-03-10 23:56:53',0,'0001-01-01 00:00:00',0,_binary ''),(1020022,1020,1019010,'/restaurant/cInfoList','3.1 Company Info',NULL,_binary '',_binary '\0','2023-03-11 20:28:11',0,'0001-01-01 00:00:00',0,_binary ''),(1020023,1020,1019010,'/restaurant/manageExpenses','3.2 Expenses',NULL,_binary '',_binary '\0','2023-03-11 20:30:44',0,'0001-01-01 00:00:00',0,_binary ''),(1020024,1020,1019011,'/security/users','4.1 Users',NULL,_binary '',_binary '\0','2023-03-11 20:32:09',0,'0001-01-01 00:00:00',0,_binary ''),(1020025,1020,1019012,'/restaurant/commingSoon','5.1 Deal Head',NULL,_binary '',_binary '\0','2023-03-11 20:50:23',0,'0001-01-01 00:00:00',0,_binary ''),(1020026,1020,1019012,'/restaurant/commingSoon','5.2 Deals',NULL,_binary '',_binary '\0','2023-03-11 20:50:48',0,'0001-01-01 00:00:00',0,_binary ''),(1020027,1020,1019012,'/restaurant/commingSoon','5.3 Attach Menu',NULL,_binary '',_binary '\0','2023-03-11 20:51:23',0,'0001-01-01 00:00:00',0,_binary ''),(1020028,1020,1019011,'/restaurant/commingSoon','4.2 Staff',NULL,_binary '',_binary '\0','2023-03-11 20:53:49',0,'0001-01-01 00:00:00',0,_binary ''),(1020029,1020,1019011,'/restaurant/commingSoon','4.3 Employees Sale',NULL,_binary '',_binary '\0','2023-03-11 20:54:28',0,'0001-01-01 00:00:00',0,_binary ''),(1020030,1020,1019011,'/stakeholder/empList','4.4 Employees',NULL,_binary '',_binary '\0','2023-03-11 20:55:24',0,'0001-01-01 00:00:00',0,_binary ''),(1020031,1020,1019011,'/empManagement/manageEmpSal','4.5 Employees Salary',NULL,_binary '',_binary '\0','2023-03-11 20:56:02',0,'0001-01-01 00:00:00',0,_binary ''),(1020032,1020,1019011,'/empManagement/attendance','4.6 Attendance',NULL,_binary '',_binary '\0','2023-03-11 20:56:30',0,'0001-01-01 00:00:00',0,_binary ''),(1020033,1020,1019011,'/restaurant/commingSoon','4.7 Employee Statement',NULL,_binary '',_binary '\0','2023-03-11 20:57:05',0,'0001-01-01 00:00:00',0,_binary ''),(1020034,1020,1019001,'/restaurant/enumLineFields?type=1008','1.10 UOM',NULL,_binary '',_binary '\0','2023-03-11 22:52:33',0,'0001-01-01 00:00:00',0,_binary ''),(1020035,1020,1019001,'/restaurant/manageUOMConvrsn','1.11 UOM Conversion',NULL,_binary '',_binary '\0','2023-03-11 22:52:57',0,'0001-01-01 00:00:00',0,_binary ''),(1020037,1020,1019002,'/restaurant/enumLineFields?type=1022','2.1 Menu Group',NULL,_binary '\0',_binary '\0','2023-03-11 23:09:57',0,'0001-01-01 00:00:00',0,_binary ''),(1020038,1020,1019002,'/restaurant/itemList','2.2 Menu Item',NULL,_binary '',_binary '\0','2023-03-13 01:08:06',0,'0001-01-01 00:00:00',0,_binary ''),(1020039,1020,1019002,'/restaurant/enumLineFields?type=1026','2.3 Currency',NULL,_binary '',_binary '\0','2023-03-11 23:10:30',0,'0001-01-01 00:00:00',0,_binary ''),(1020040,1020,1019002,'/restaurant/enumLineFields?type=1025','2.4 MOP',NULL,_binary '',_binary '\0','2023-03-11 23:11:04',0,'0001-01-01 00:00:00',0,_binary ''),(1020041,1020,1019002,'/restaurant/mngPrinterSetting','2.5 Printer Setting',NULL,_binary '',_binary '\0','2023-03-11 23:11:29',0,'0001-01-01 00:00:00',0,_binary ''),(1020042,1020,1019002,'/restaurant/commingSoon','2.6 Recipe Modifier',NULL,_binary '',_binary '\0','2023-03-11 23:12:48',0,'0001-01-01 00:00:00',0,_binary ''),(1020043,1020,1019002,'/restaurant/manageGST','2.7 GST',NULL,_binary '',_binary '\0','2023-03-11 23:13:05',0,'0001-01-01 00:00:00',0,_binary ''),(1020044,1020,1019002,'/restaurant/mngDeviceSetting','2.8 Device Setting',NULL,_binary '',_binary '\0','2023-03-11 23:13:27',0,'0001-01-01 00:00:00',0,_binary ''),(1020045,1020,1019002,'/security/onlineDB','2.9 Online DB Setting',NULL,_binary '',_binary '\0','2023-03-11 23:14:33',0,'0001-01-01 00:00:00',0,_binary ''),(1020046,1020,1019002,'/restaurant/commingSoon','2.10 Layout Setting',NULL,_binary '',_binary '\0','2023-03-11 23:14:53',0,'0001-01-01 00:00:00',0,_binary ''),(1020047,1020,1019002,'/restaurant/mngKOTSetting','2.11 KOT Setting',NULL,_binary '',_binary '\0','2023-03-11 23:15:12',0,'0001-01-01 00:00:00',0,_binary ''),(1020048,1020,1019002,'/stakeholder/custList','2.12 Costumer Info',NULL,_binary '',_binary '\0','2023-03-11 23:15:41',0,'0001-01-01 00:00:00',0,_binary ''),(1020049,1020,1019002,'/restaurant/managePoints','2.13 Member Points',NULL,_binary '',_binary '\0','2023-03-11 23:16:08',0,'0001-01-01 00:00:00',0,_binary ''),(1020050,1020,1019002,'/restaurant/modifier','2.14  Modifier',NULL,_binary '',_binary '\0','2023-03-11 23:16:54',0,'0001-01-01 00:00:00',0,_binary ''),(1020051,1020,1019002,'/restaurant/discountKey','2.15 Discount Keys',NULL,_binary '',_binary '\0','2023-03-11 23:17:30',0,'0001-01-01 00:00:00',0,_binary ''),(1020052,1020,1019002,'/restaurant/enumLineFields?type=1002','2.16 Shift',NULL,_binary '',_binary '\0','2023-03-11 23:17:52',0,'0001-01-01 00:00:00',0,_binary ''),(1020053,1020,1019002,'/restaurant/enumLineFields?type=1027','2.17 Service Charges',NULL,_binary '',_binary '\0','2023-03-11 23:18:15',0,'0001-01-01 00:00:00',0,_binary ''),(1020054,1020,1019002,'/restaurant/enumLineFields?type=1028','2.18 Banks',NULL,_binary '',_binary '\0','2023-03-11 23:18:57',0,'0001-01-01 00:00:00',0,_binary ''),(1020055,1020,1019002,'/restaurant/manageLoyaltyCard','2.19 Loyalty Card',NULL,_binary '',_binary '\0','2023-03-11 23:19:18',0,'0001-01-01 00:00:00',0,_binary ''),(1020056,1020,1019002,'/restaurant/mngPrintType','2.20 Print Type',NULL,_binary '',_binary '\0','2023-03-11 23:19:42',0,'0001-01-01 00:00:00',0,_binary ''),(1020057,1020,1019002,'/restaurant/campaignList','2.21 Discount Compaign ',NULL,_binary '',_binary '\0','2023-03-11 23:21:00',0,'0001-01-01 00:00:00',0,_binary ''),(1020058,1020,1019002,'/restaurant/manageSource','2.22 Order Source',NULL,_binary '',_binary '\0','2023-03-11 23:21:21',0,'0001-01-01 00:00:00',0,_binary ''),(1020059,1020,1019002,'/restaurant/enumLineFields?type=1033','2.23 Sub Items',NULL,_binary '',_binary '\0','2023-03-11 23:21:58',0,'0001-01-01 00:00:00',0,_binary ''),(1020060,1020,1019002,'/restaurant/vouchersDiscount','2.24 Vouchers',NULL,_binary '',_binary '\0','2023-03-11 23:22:17',0,'0001-01-01 00:00:00',0,_binary ''),(1020061,1020,1019002,'/restaurant/enumLineFields?type=1017','2.25 Table Design',NULL,_binary '',_binary '\0','2023-03-11 23:22:42',0,'0001-01-01 00:00:00',0,_binary ''),(1020062,1020,1019002,'/restaurant/commingSoon','2.26 Attach Menu',NULL,_binary '',_binary '\0','2023-03-11 23:23:32',0,'0001-01-01 00:00:00',0,_binary ''),(1020064,1020,1019002,'/restaurant/enumLineFields?type=1016','2.27 Floor',NULL,_binary '',_binary '\0','2023-03-18 19:41:13',0,'0001-01-01 00:00:00',0,_binary ''),(1021001,1021,0,'Item_Group_Kitchen','Kitchen',NULL,_binary '',_binary '\0','2023-03-12 18:59:14',0,'0001-01-01 00:00:00',0,_binary ''),(1021002,1021,0,NULL,'KDS Kitchen',NULL,_binary '\0',_binary '\0','2023-06-06 11:11:49',0,'2023-06-06 11:11:49',0,_binary ''),(1022001,1022,0,'Menu__Group_Burger..','Burger','des',_binary '\0',_binary '\0','2023-03-12 19:11:02',0,'0001-01-01 00:00:00',0,_binary ''),(1022002,1022,0,'Menu_Item_Group_Shakes','Shakes','des',_binary '\0',_binary '\0','2023-03-12 19:11:45',0,'0001-01-01 00:00:00',0,_binary ''),(1022003,1022,0,'Menu_Item_Group_Dessert','Dessert','des...',_binary '\0',_binary '\0','2023-03-12 19:11:54',0,'0001-01-01 00:00:00',0,_binary ''),(1022004,1022,0,'Menu_Item_Group_Tea','Tea',NULL,_binary '\0',_binary '\0','2023-03-23 20:22:18',0,'0001-01-01 00:00:00',0,_binary ''),(1022005,1022,0,'Menu_Item_Group_Pizza','Pizza',NULL,_binary '\0',_binary '\0','2023-03-23 20:22:35',0,'0001-01-01 00:00:00',0,_binary ''),(1022006,1022,0,'Menu_Item_Group_Sandwich','Sandwich',NULL,_binary '\0',_binary '\0','2023-03-23 20:23:13',0,'0001-01-01 00:00:00',0,_binary ''),(1022007,1022,0,'Menu_Item_Group_Fries','Fries',NULL,_binary '\0',_binary '\0','2023-03-23 20:23:21',0,'0001-01-01 00:00:00',0,_binary ''),(1022008,1022,0,'Menu_Item_Group_Fried_Chicken','Fried Chicken',NULL,_binary '\0',_binary '\0','2023-03-23 20:24:58',0,'0001-01-01 00:00:00',0,_binary ''),(1022009,1022,0,NULL,'Deals','des',_binary '\0',_binary '\0','2023-06-06 09:51:18',0,'2023-06-06 09:51:18',0,_binary ''),(1022010,1022,0,NULL,'Group','des',_binary '\0',_binary '\0','2023-06-06 11:06:53',0,'2023-06-06 11:06:53',0,_binary ''),(1023001,1023,1021001,'Item_Category_Kitchen','Kitchen',NULL,_binary '\0',_binary '\0','2023-03-12 19:32:17',0,'0001-01-01 00:00:00',0,_binary ''),(1024001,1024,0,'KDS_Main_KDS','Main KDS',NULL,_binary '',_binary '\0','2023-03-13 00:27:16',0,'0001-01-01 00:00:00',0,_binary ''),(1024002,1024,0,'KDS_KDS_Kitchen','KDS Kitchen',NULL,_binary '',_binary '\0','2023-05-03 11:43:19',0,'2023-05-03 11:43:19',0,_binary ''),(1025001,1025,0,'MOP_Cash','Cash',NULL,_binary '',_binary '\0','2023-03-16 01:41:41',0,'0001-01-01 00:00:00',0,_binary ''),(1025002,1025,0,'MOP_Card','Card',NULL,_binary '',_binary '\0','2023-03-16 01:41:57',0,'0001-01-01 00:00:00',0,_binary ''),(1026001,1026,0,'Currency_USD','USD','283.38',_binary '',_binary '\0','2023-03-16 02:17:50',0,'0001-01-01 00:00:00',0,_binary ''),(1026002,1026,0,'Currency_ERU','ERU','299.80',_binary '',_binary '\0','2023-03-16 02:18:04',0,'0001-01-01 00:00:00',0,_binary ''),(1026003,1026,0,'Currency_JPY','JPY','2.12',_binary '',_binary '\0','2023-03-16 02:18:20',0,'0001-01-01 00:00:00',0,_binary ''),(1026004,1026,0,'Currency_PKR','PKR','1',_binary '',_binary '\0','2023-03-16 02:20:28',0,'0001-01-01 00:00:00',0,_binary ''),(1027001,1027,0,'Service_Charges_10','10',NULL,_binary '',_binary '\0','2023-03-16 02:22:36',0,'0001-01-01 00:00:00',0,_binary ''),(1028001,1028,0,'Banks_Mezan_Bank','Mezan Bank',NULL,_binary '',_binary '\0','2023-03-16 02:22:50',0,'0001-01-01 00:00:00',0,_binary ''),(1029001,1029,0,'Printers_Receipt','Receipt',NULL,_binary '',_binary '\0','2023-03-18 19:19:53',0,'0001-01-01 00:00:00',0,_binary ''),(1029002,1029,0,'Printers_Kitchen','Kitchen',NULL,_binary '',_binary '\0','2023-03-18 19:20:05',0,'0001-01-01 00:00:00',0,_binary ''),(1030001,1030,0,'Printer_Types_Generic','Generic',NULL,_binary '',_binary '\0','2023-03-18 19:18:39',0,'0001-01-01 00:00:00',0,_binary ''),(1030002,1030,0,'Printer_Types_OPOS','OPOS',NULL,_binary '',_binary '\0','2023-03-18 19:18:52',0,'0001-01-01 00:00:00',0,_binary ''),(1030003,1030,0,'Printer_Types_Report','Report',NULL,_binary '',_binary '\0','2023-03-18 19:19:03',0,'0001-01-01 00:00:00',0,_binary ''),(1030004,1030,0,'Printer_Types_rdlc','rdlc',NULL,_binary '',_binary '\0','2023-03-18 19:19:16',0,'0001-01-01 00:00:00',0,_binary ''),(1031001,1031,0,'Devices_KOT','KOT',NULL,_binary '',_binary '\0','2023-03-18 19:16:36',0,'0001-01-01 00:00:00',0,_binary ''),(1031002,1031,0,'Devices_Customer_Display','Customer Display',NULL,_binary '',_binary '\0','2023-03-18 19:17:00',0,'0001-01-01 00:00:00',0,_binary ''),(1031003,1031,0,'Devices_KDS','KDS',NULL,_binary '',_binary '\0','2023-03-18 19:17:12',0,'0001-01-01 00:00:00',0,_binary ''),(1031004,1031,0,'Devices_Print_Kitchen','Print Kitchen',NULL,_binary '',_binary '\0','2023-03-18 19:17:29',0,'0001-01-01 00:00:00',0,_binary ''),(1032001,1032,0,'RecipeOrderTypes_Both','Both',NULL,_binary '',_binary '\0','2023-03-22 03:22:02',0,'0001-01-01 00:00:00',0,_binary ''),(1032002,1032,0,'RecipeOrderTypes_Dine_In','Dine In',NULL,_binary '',_binary '\0','2023-03-22 03:22:22',0,'0001-01-01 00:00:00',0,_binary ''),(1032003,1032,0,'RecipeOrderTypes_Take_Away','Take Away',NULL,_binary '',_binary '\0','2023-03-22 03:22:38',0,'0001-01-01 00:00:00',0,_binary ''),(1033001,1033,0,'Sub_Items_Soft_Drink','Soft Drink',NULL,_binary '\0',_binary '\0','2023-03-23 16:05:44',0,'0001-01-01 00:00:00',0,_binary ''),(1033002,1033,0,'Sub_Items_Petty','Petty',NULL,_binary '\0',_binary '\0','2023-03-23 16:09:34',0,'0001-01-01 00:00:00',0,_binary ''),(1034001,1034,0,'Discount_Campaign_Types_Overall','Overall',NULL,_binary '',_binary '\0','2023-04-02 19:25:11',0,'2023-04-02 19:25:11',0,_binary ''),(1034002,1034,0,'Discount_Campaign_Types_Individual','Individual',NULL,_binary '',_binary '\0','2023-04-02 19:25:33',0,'2023-04-02 19:25:33',0,_binary ''),(1035001,1035,0,'Account_Type_Sale_Account','Sale Account',NULL,_binary '\0',_binary '\0','2023-04-10 19:23:36',0,'2023-04-10 19:23:36',0,_binary ''),(1035002,1035,0,'Account_Type_Cash_Account','Cash Account',NULL,_binary '\0',_binary '\0','2023-04-10 19:23:47',0,'2023-04-10 19:23:47',0,_binary ''),(1036001,1036,0,'Modifier_Types_Both','Both',NULL,_binary '',_binary '\0','2023-05-31 20:56:06',0,'2023-05-31 20:56:06',0,_binary ''),(1036002,1036,0,'Modifier_Types_Take_Away','Take Away',NULL,_binary '',_binary '\0','2023-05-31 20:56:17',0,'2023-05-31 20:56:17',0,_binary ''),(1036003,1036,0,'Modifier_Types_Dine_In','Dine In',NULL,_binary '',_binary '\0','2023-05-31 20:56:27',0,'2023-05-31 20:56:27',0,_binary ''),(1038001,1038,0,'DropDownList_Print','Print',NULL,_binary '',_binary '\0','2023-06-03 02:23:44',0,'2023-06-03 02:23:44',0,_binary ''),(1038002,1038,0,'DropDownList_Not_Print','Not Print',NULL,_binary '',_binary '\0','2023-06-03 02:23:55',0,'2023-06-03 02:23:55',0,_binary ''),(1041001,1041,0,'-16777216','Black',NULL,_binary '',_binary '\0','2023-06-06 11:01:59',0,'2023-06-06 11:01:59',0,_binary ''),(1041002,1041,0,'DropDownList_White','White',NULL,_binary '',_binary '\0','2023-06-06 11:02:14',0,'2023-06-06 11:02:14',0,_binary ''),(1042001,1042,0,'DropDownList_10','10',NULL,_binary '',_binary '\0','2023-06-06 11:03:52',0,'2023-06-06 11:03:52',0,_binary ''),(1042002,1042,0,'DropDownList_11','11',NULL,_binary '',_binary '\0','2023-06-06 11:03:59',0,'2023-06-06 11:03:59',0,_binary ''),(1042003,1042,0,'DropDownList_12','12',NULL,_binary '',_binary '\0','2023-06-06 11:04:08',0,'2023-06-06 11:04:08',0,_binary ''),(1042004,1042,0,'DropDownList_13','13',NULL,_binary '',_binary '\0','2023-06-06 11:04:16',0,'2023-06-06 11:04:16',0,_binary ''),(1042005,1042,0,'DropDownList_14','14',NULL,_binary '',_binary '\0','2023-06-06 11:04:24',0,'2023-06-06 11:04:24',0,_binary ''),(1042006,1042,0,'DropDownList_15','15',NULL,_binary '',_binary '\0','2023-06-06 11:04:31',0,'2023-06-06 11:04:31',0,_binary ''),(1044001,1044,0,'Branch_1','Branch_1',NULL,_binary '\0',_binary '\0','2023-06-06 12:20:49',0,'2023-06-06 12:20:49',0,_binary ''),(1044002,1044,0,'Branch_2','Branch_2',NULL,_binary '\0',_binary '\0','2023-06-06 12:20:58',0,'2023-06-06 12:20:58',0,_binary ''),(1044003,1044,0,'Branch_3','Branch_3',NULL,_binary '\0',_binary '\0','2023-06-06 12:21:17',0,'2023-06-06 12:21:17',0,_binary ''),(1044004,1044,0,'DropDownList_Branch_4','Branch_4',NULL,_binary '\0',_binary '\0','2023-06-06 12:21:27',0,'2023-06-06 12:21:27',0,_binary ''),(1044005,1044,16,'test...','test...',NULL,_binary '\0',_binary '\0','2023-06-06 12:55:36',0,'2023-06-06 12:55:36',0,_binary '\0');
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
INSERT INTO `enums` VALUES (1000,NULL,'Permissions','Permissions',NULL,_binary '',_binary '','2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1001,NULL,'Statuses','Statuses',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1002,NULL,'Shift','Shift',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1003,NULL,'Sources','Sources',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1004,NULL,'OrderTypes','OrderTypes',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1005,NULL,'DiscountTypes','DiscountTypes',NULL,_binary '',NULL,'2023-01-01 19:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(1006,1037,'DropDownList','Menu Group Color',NULL,_binary '',_binary '\0','2023-03-04 23:11:48',0,'0001-01-01 00:00:00',0,_binary ''),(1007,0,'Brands','Brands',NULL,_binary '',NULL,'2023-03-05 21:43:08',0,'0001-01-01 00:00:00',0,_binary ''),(1008,0,'UOM','UOM',NULL,_binary '',NULL,'2023-03-05 21:55:22',0,'0001-01-01 00:00:00',0,_binary ''),(1009,NULL,'Branch','Branch',NULL,_binary '\0',_binary '\0','2023-03-05 22:07:21',0,'0001-01-01 00:00:00',0,_binary '\0'),(1010,0,'Sizes','Sizes',NULL,_binary '',NULL,'2023-03-05 22:35:04',0,'0001-01-01 00:00:00',0,_binary ''),(1011,0,'Stores','Stores',NULL,_binary '\0',_binary '\0','2023-03-05 22:40:17',0,'0001-01-01 00:00:00',0,_binary '\0'),(1012,NULL,'Item_Types','Item Types',NULL,_binary '',_binary '\0','2023-03-05 23:03:55',0,'0001-01-01 00:00:00',0,_binary ''),(1013,0,'Group','Group',NULL,_binary '',NULL,'2023-03-06 01:08:58',0,'0001-01-01 00:00:00',0,_binary ''),(1015,1023,'Item_Sub_Category','Item Sub Category',NULL,_binary '',_binary '\0','2023-03-06 01:23:38',0,'0001-01-01 00:00:00',0,_binary ''),(1016,0,'Floor','Floor',NULL,_binary '',_binary '\0','2023-03-07 20:15:25',0,'0001-01-01 00:00:00',0,_binary ''),(1017,1016,'Table','Table',NULL,_binary '',_binary '\0','2023-03-07 20:15:46',0,'0001-01-01 00:00:00',0,_binary ''),(1018,0,'Back_Office','Back Office',NULL,_binary '',_binary '\0','2023-03-10 09:16:15',0,'0001-01-01 00:00:00',0,_binary ''),(1019,1018,'/sideMenu','Side Menu',NULL,_binary '',_binary '\0','2023-03-10 09:21:21',0,'0001-01-01 00:00:00',0,_binary ''),(1020,1019,'Side_SubMenu','Side SubMenu',NULL,_binary '',_binary '\0','2023-03-10 09:21:40',0,'0001-01-01 00:00:00',0,_binary ''),(1021,1013,'Item_Group','Item Group',NULL,_binary '',_binary '\0','2023-03-12 18:03:09',0,'0001-01-01 00:00:00',0,_binary ''),(1022,1013,'Menu__Group','Menu  Group',NULL,_binary '',_binary '\0','2023-03-12 18:11:38',0,'0001-01-01 00:00:00',0,_binary ''),(1023,1021,'Item_Category','Item Category',NULL,_binary '',_binary '\0','2023-03-12 19:25:38',0,'0001-01-01 00:00:00',0,_binary ''),(1024,0,'KDS','KDS',NULL,_binary '',_binary '\0','2023-03-13 00:26:50',0,'0001-01-01 00:00:00',0,_binary ''),(1025,0,'MOP','MOP',NULL,_binary '',_binary '\0','2023-03-16 01:41:10',0,'0001-01-01 00:00:00',0,_binary ''),(1026,0,'Currency','Currency',NULL,_binary '',_binary '\0','2023-03-16 02:13:06',0,'0001-01-01 00:00:00',0,_binary ''),(1027,0,'Service_Charges','Service Charges',NULL,_binary '',_binary '\0','2023-03-16 02:13:16',0,'0001-01-01 00:00:00',0,_binary ''),(1028,0,'Banks','Banks',NULL,_binary '',_binary '\0','2023-03-16 02:13:25',0,'0001-01-01 00:00:00',0,_binary ''),(1029,0,'Printers','Printers',NULL,_binary '',_binary '\0','2023-03-18 19:14:26',0,'0001-01-01 00:00:00',0,_binary ''),(1030,0,'Printer_Types','Printer Types',NULL,_binary '',_binary '\0','2023-03-18 19:14:41',0,'0001-01-01 00:00:00',0,_binary ''),(1031,0,'Devices','Devices',NULL,_binary '',_binary '\0','2023-03-18 19:14:48',0,'0001-01-01 00:00:00',0,_binary ''),(1032,0,'RecipeOrderTypes','RecipeOrderTypes',NULL,_binary '',_binary '\0','2023-03-22 03:21:42',0,'0001-01-01 00:00:00',0,_binary ''),(1033,0,'Sub_Items','Sub Items',NULL,_binary '',_binary '\0','2023-03-23 14:25:55',0,'0001-01-01 00:00:00',0,_binary ''),(1034,0,'Discount_Campaign_Types','Discount Campaign Types',NULL,_binary '',_binary '\0','2023-03-30 23:09:57',0,'2023-03-30 23:09:57',0,_binary ''),(1035,0,'Account_Type','Account Type',NULL,_binary '',_binary '\0','2023-04-10 19:23:11',0,'2023-04-10 19:23:11',0,_binary ''),(1036,0,'Modifier_Types','Modifier Types',NULL,_binary '',_binary '\0','2023-05-31 20:55:49',0,'2023-05-31 20:55:49',0,_binary ''),(1037,1022,'Menu_Group_Fields','Menu Group Fields',NULL,_binary '',_binary '\0','2023-06-03 00:03:19',0,'2023-06-03 00:03:19',0,_binary ''),(1038,1037,'DropDownList','Print kitchen',NULL,_binary '',_binary '\0','2023-06-03 02:11:31',0,'2023-06-03 02:11:31',0,_binary ''),(1039,1037,'TextBox','Sub Group',NULL,_binary '',_binary '\0','2023-06-03 02:12:06',0,'2023-06-03 02:12:06',0,_binary ''),(1040,1037,'DropDownList','Menu Group Color',NULL,_binary '\0',_binary '\0','2023-06-06 10:28:21',0,'2023-06-06 10:28:21',0,_binary '\0'),(1041,1037,'DropDownList','Font Color',NULL,_binary '',_binary '\0','2023-06-06 10:28:50',0,'2023-06-06 10:28:50',0,_binary ''),(1042,1037,'DropDownList','Font Size',NULL,_binary '',_binary '\0','2023-06-06 10:30:42',0,'2023-06-06 10:30:42',0,_binary ''),(1044,1037,'DropDownList','Branch',NULL,_binary '',_binary '\0','2023-06-06 10:32:45',0,'2023-06-06 10:32:45',0,_binary '');
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
  `Name` varchar(500) DEFAULT NULL,
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
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,2,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d','ABC','2023-02-19 19:00:00',NULL,'3460','Comments','2023-02-20 00:58:18',0,'0001-01-01 00:00:00',0,_binary ''),(2,0,NULL,'testjkl','2023-03-03 19:00:00',NULL,'30000j',NULL,'2023-03-18 00:41:25',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extrafielddata`
--

DROP TABLE IF EXISTS `extrafielddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extrafielddata` (
  `Id` int NOT NULL,
  `EnumLineId` int NOT NULL,
  `FieldName` varchar(200) DEFAULT NULL,
  `FieldValue` varchar(200) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`,`EnumLineId`),
  KEY `enumlinefielddata_ibfk_1_idx` (`EnumLineId`),
  CONSTRAINT `extrafielddata_ibfk_1` FOREIGN KEY (`EnumLineId`) REFERENCES `enumline` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extrafielddata`
--

LOCK TABLES `extrafielddata` WRITE;
/*!40000 ALTER TABLE `extrafielddata` DISABLE KEYS */;
INSERT INTO `extrafielddata` VALUES (1,1022001,'Menu Group Color','','2023-06-06 13:01:37',0,'2023-06-06 13:01:37',0,_binary ''),(1,1022002,'Menu Group Color','','2023-06-06 13:01:41',0,'2023-06-06 13:01:41',0,_binary ''),(1,1022003,'Menu Group Color','','2023-06-06 13:01:45',0,'2023-06-06 13:01:45',0,_binary ''),(1,1022004,'Menu Group Color','','2023-06-06 13:01:49',0,'2023-06-06 13:01:49',0,_binary ''),(1,1022005,'Menu Group Color','','2023-06-06 13:01:54',0,'2023-06-06 13:01:54',0,_binary ''),(1,1022006,'Menu Group Color','','2023-06-06 13:02:00',0,'2023-06-06 13:02:00',0,_binary ''),(1,1022007,'Menu Group Color','','2023-06-06 13:02:07',0,'2023-06-06 13:02:07',0,_binary ''),(1,1022008,'Menu Group Color','','2023-06-06 13:02:12',0,'2023-06-06 13:02:12',0,_binary ''),(1,1022009,'Menu Group Color','','2023-06-06 13:02:18',0,'2023-06-06 13:02:18',0,_binary ''),(1,1022010,'Menu Group Color','Mehron','2023-06-06 13:25:18',0,'2023-06-06 13:25:18',0,_binary ''),(2,1022001,'Print kitchen','','2023-06-06 13:01:37',0,'2023-06-06 13:01:37',0,_binary ''),(2,1022002,'Print kitchen','','2023-06-06 13:01:41',0,'2023-06-06 13:01:41',0,_binary ''),(2,1022003,'Print kitchen','','2023-06-06 13:01:45',0,'2023-06-06 13:01:45',0,_binary ''),(2,1022004,'Print kitchen','','2023-06-06 13:01:49',0,'2023-06-06 13:01:49',0,_binary ''),(2,1022005,'Print kitchen','','2023-06-06 13:01:54',0,'2023-06-06 13:01:54',0,_binary ''),(2,1022006,'Print kitchen','','2023-06-06 13:02:00',0,'2023-06-06 13:02:00',0,_binary ''),(2,1022007,'Print kitchen','','2023-06-06 13:02:07',0,'2023-06-06 13:02:07',0,_binary ''),(2,1022008,'Print kitchen','','2023-06-06 13:02:12',0,'2023-06-06 13:02:12',0,_binary ''),(2,1022009,'Print kitchen','','2023-06-06 13:02:18',0,'2023-06-06 13:02:18',0,_binary ''),(2,1022010,'Print kitchen','Print','2023-06-06 13:25:18',0,'2023-06-06 13:25:18',0,_binary ''),(3,1022001,'Sub Group','','2023-06-06 13:01:37',0,'2023-06-06 13:01:37',0,_binary ''),(3,1022002,'Sub Group','','2023-06-06 13:01:41',0,'2023-06-06 13:01:41',0,_binary ''),(3,1022003,'Sub Group','','2023-06-06 13:01:45',0,'2023-06-06 13:01:45',0,_binary ''),(3,1022004,'Sub Group','','2023-06-06 13:01:49',0,'2023-06-06 13:01:49',0,_binary ''),(3,1022005,'Sub Group','','2023-06-06 13:01:54',0,'2023-06-06 13:01:54',0,_binary ''),(3,1022006,'Sub Group','','2023-06-06 13:02:00',0,'2023-06-06 13:02:00',0,_binary ''),(3,1022007,'Sub Group','','2023-06-06 13:02:07',0,'2023-06-06 13:02:07',0,_binary ''),(3,1022008,'Sub Group','','2023-06-06 13:02:12',0,'2023-06-06 13:02:12',0,_binary ''),(3,1022009,'Sub Group','','2023-06-06 13:02:18',0,'2023-06-06 13:02:18',0,_binary ''),(3,1022010,'Sub Group','Sub Group','2023-06-06 13:25:18',0,'2023-06-06 13:25:18',0,_binary ''),(4,1022001,'Font Color','','2023-06-06 13:01:37',0,'2023-06-06 13:01:37',0,_binary ''),(4,1022002,'Font Color','','2023-06-06 13:01:41',0,'2023-06-06 13:01:41',0,_binary ''),(4,1022003,'Font Color','','2023-06-06 13:01:45',0,'2023-06-06 13:01:45',0,_binary ''),(4,1022004,'Font Color','','2023-06-06 13:01:49',0,'2023-06-06 13:01:49',0,_binary ''),(4,1022005,'Font Color','','2023-06-06 13:01:54',0,'2023-06-06 13:01:54',0,_binary ''),(4,1022006,'Font Color','','2023-06-06 13:02:00',0,'2023-06-06 13:02:00',0,_binary ''),(4,1022007,'Font Color','','2023-06-06 13:02:07',0,'2023-06-06 13:02:07',0,_binary ''),(4,1022008,'Font Color','','2023-06-06 13:02:12',0,'2023-06-06 13:02:12',0,_binary ''),(4,1022009,'Font Color','','2023-06-06 13:02:18',0,'2023-06-06 13:02:18',0,_binary ''),(4,1022010,'Font Color','Black','2023-06-06 13:25:18',0,'2023-06-06 13:25:18',0,_binary ''),(5,1022001,'Font Size','','2023-06-06 13:01:37',0,'2023-06-06 13:01:37',0,_binary ''),(5,1022002,'Font Size','','2023-06-06 13:01:41',0,'2023-06-06 13:01:41',0,_binary ''),(5,1022003,'Font Size','','2023-06-06 13:01:45',0,'2023-06-06 13:01:45',0,_binary ''),(5,1022004,'Font Size','','2023-06-06 13:01:49',0,'2023-06-06 13:01:49',0,_binary ''),(5,1022005,'Font Size','','2023-06-06 13:01:54',0,'2023-06-06 13:01:54',0,_binary ''),(5,1022006,'Font Size','','2023-06-06 13:02:00',0,'2023-06-06 13:02:00',0,_binary ''),(5,1022007,'Font Size','','2023-06-06 13:02:07',0,'2023-06-06 13:02:07',0,_binary ''),(5,1022008,'Font Size','','2023-06-06 13:02:12',0,'2023-06-06 13:02:12',0,_binary ''),(5,1022009,'Font Size','','2023-06-06 13:02:18',0,'2023-06-06 13:02:18',0,_binary ''),(5,1022010,'Font Size','14','2023-06-06 13:25:18',0,'2023-06-06 13:25:18',0,_binary ''),(6,1022001,'Branch','','2023-06-06 13:01:37',0,'2023-06-06 13:01:37',0,_binary ''),(6,1022002,'Branch','','2023-06-06 13:01:41',0,'2023-06-06 13:01:41',0,_binary ''),(6,1022003,'Branch','','2023-06-06 13:01:45',0,'2023-06-06 13:01:45',0,_binary ''),(6,1022004,'Branch','','2023-06-06 13:01:49',0,'2023-06-06 13:01:49',0,_binary ''),(6,1022005,'Branch','','2023-06-06 13:01:54',0,'2023-06-06 13:01:54',0,_binary ''),(6,1022006,'Branch','','2023-06-06 13:02:00',0,'2023-06-06 13:02:00',0,_binary ''),(6,1022007,'Branch','','2023-06-06 13:02:07',0,'2023-06-06 13:02:07',0,_binary ''),(6,1022008,'Branch','','2023-06-06 13:02:12',0,'2023-06-06 13:02:12',0,_binary ''),(6,1022009,'Branch','','2023-06-06 13:02:18',0,'2023-06-06 13:02:18',0,_binary ''),(6,1022010,'Branch','Branch_1','2023-06-06 13:25:18',0,'2023-06-06 13:25:18',0,_binary '');
/*!40000 ALTER TABLE `extrafielddata` ENABLE KEYS */;
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
-- Table structure for table `flavorsize`
--

DROP TABLE IF EXISTS `flavorsize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flavorsize` (
  `Id` int NOT NULL,
  `GroupId` int DEFAULT NULL,
  `ItemId` int DEFAULT NULL,
  `KDSId` int DEFAULT NULL,
  `SizeName` varchar(300) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `ActualPrice` float DEFAULT NULL,
  `Tax` float DEFAULT NULL,
  `Cost` float DEFAULT NULL,
  `SuggestedPrice` float DEFAULT NULL,
  `CurrentMargin` float DEFAULT NULL,
  `SuggestedMargin` float DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fflavorsize_ibfk_1_idx` (`GroupId`),
  KEY `flavorsize_ibfk_2_idx` (`ItemId`),
  KEY `flavorsize_ibfk_3_idx` (`KDSId`),
  CONSTRAINT `flavorsize_ibfk_1` FOREIGN KEY (`GroupId`) REFERENCES `enumline` (`Id`),
  CONSTRAINT `flavorsize_ibfk_2` FOREIGN KEY (`ItemId`) REFERENCES `item` (`Id`),
  CONSTRAINT `flavorsize_ibfk_3` FOREIGN KEY (`KDSId`) REFERENCES `enumline` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flavorsize`
--

LOCK TABLES `flavorsize` WRITE;
/*!40000 ALTER TABLE `flavorsize` DISABLE KEYS */;
INSERT INTO `flavorsize` VALUES (1,1022001,64,1024001,'Small',600,517.241,82.7586,NULL,NULL,NULL,NULL,'2023-03-22 01:00:42',0,'0001-01-01 00:00:00',0,_binary ''),(2,1022001,64,NULL,'Large',900,775.862,124.138,700,900,200,300,'2023-03-22 01:50:24',0,'0001-01-01 00:00:00',0,_binary ''),(3,1022001,67,NULL,'Medium',400,344.828,55.1724,NULL,NULL,NULL,NULL,'2023-03-23 17:10:27',0,'0001-01-01 00:00:00',0,_binary ''),(4,1022003,75,NULL,'Regular',300,258.621,41.3793,NULL,NULL,NULL,NULL,'2023-03-23 20:38:58',0,'0001-01-01 00:00:00',0,_binary ''),(5,1022003,75,NULL,'Medium',500,431.034,68.9655,NULL,NULL,NULL,NULL,'2023-03-23 20:39:21',0,'0001-01-01 00:00:00',0,_binary ''),(6,1022005,67,NULL,'Large',1200,1034.48,165.517,NULL,NULL,NULL,NULL,'2023-03-23 20:41:44',0,'0001-01-01 00:00:00',0,_binary ''),(7,1022001,72,1024001,'Large',1000,862.069,137.931,NULL,NULL,NULL,NULL,'2023-04-17 14:42:29',0,'2023-04-17 14:42:29',0,_binary ''),(8,1022001,72,NULL,'Small',500,431.034,68.9655,NULL,NULL,NULL,NULL,'2023-04-17 14:43:11',0,'2023-04-17 14:43:11',0,_binary ''),(17,1022001,71,NULL,'Small',500,431.034,68.9655,NULL,NULL,NULL,NULL,'2023-04-17 19:17:52',0,'2023-04-17 19:17:52',0,_binary '');
/*!40000 ALTER TABLE `flavorsize` ENABLE KEYS */;
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
INSERT INTO `gst` VALUES (1,16,'Title',1025001,'2023-03-16 01:43:37',0,'0001-01-01 00:00:00',0,_binary ''),(2,5,'tilte',1025002,'2023-03-16 01:45:20',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `gst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventorytransfer`
--

DROP TABLE IF EXISTS `inventorytransfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventorytransfer` (
  `Id` int NOT NULL,
  `BranchId` int DEFAULT NULL,
  `KeyWord` varchar(200) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventorytransfer`
--

LOCK TABLES `inventorytransfer` WRITE;
/*!40000 ALTER TABLE `inventorytransfer` DISABLE KEYS */;
INSERT INTO `inventorytransfer` VALUES (1,4,'KeyWord','2023-04-13 19:00:00','2023-04-05 00:17:10',0,'2023-04-05 00:17:10',0,_binary '');
/*!40000 ALTER TABLE `inventorytransfer` ENABLE KEYS */;
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
  `StageId` int DEFAULT NULL,
  `BranchId` int DEFAULT NULL,
  `UOMId` int DEFAULT NULL,
  `SizeId` int DEFAULT NULL,
  `SupplierId` int DEFAULT NULL,
  `StoreId` int DEFAULT NULL,
  `ParentId` int DEFAULT NULL,
  `BrandId` int DEFAULT NULL,
  `FontColorId` int DEFAULT NULL,
  `TypeId` int DEFAULT NULL,
  `VendorId` int DEFAULT NULL,
  `KDSId2` int DEFAULT NULL,
  `ItemCode` varchar(6000) DEFAULT NULL,
  `BarCode` varchar(5000) DEFAULT NULL,
  `ItemName` varchar(2000) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `FontSize` varchar(45) DEFAULT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  `Tax` float DEFAULT NULL,
  `ActualPrice` float DEFAULT NULL,
  `ProposedPrice` float DEFAULT NULL,
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
  `IsDealItem` bit(1) DEFAULT NULL,
  `StageQty` int DEFAULT NULL,
  `MenuItemId` int DEFAULT NULL,
  `ImageName` text,
  `ImageSize` text,
  `Base64FilePath` longtext,
  `EndDate` text,
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
INSERT INTO `item` VALUES (65,1012001,1023001,1015001,1021001,0,0,0,0,1008002,0,2,0,0,0,0,0,2,0,'Flour','1','Flour',100,1,NULL,'des',NULL,NULL,NULL,'Packing Name',0,0,0,'1','2',3,0,_binary '',_binary '\0',_binary '\0',NULL,NULL,NULL,_binary '\0',0,0,NULL,NULL,NULL,NULL,'2023-03-13 00:55:45',0,'0001-01-01 00:00:00',0,_binary ''),(66,1012002,1014001,0,1022001,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Regular_Burger','0','Regular Burger',200,1,NULL,NULL,27.5862,172.414,NULL,'0',0,0,0,'0',NULL,0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,_binary '\0',0,66,NULL,NULL,NULL,NULL,'2023-03-13 01:13:45',0,'0001-01-01 00:00:00',0,_binary ''),(67,1012002,1014002,0,1022005,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Tikka_Pizza','0','Tikka Pizza',0,1,NULL,NULL,0,0,NULL,'0',0,0,0,'0',NULL,0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-13 01:16:15',0,'0001-01-01 00:00:00',0,_binary ''),(68,1012002,1014002,0,1022005,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Chicken_Pizza','0','Chicken Pizza',600,1,NULL,NULL,82.7586,517.241,NULL,'0',0,0,0,'0',NULL,0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,_binary '\0',0,68,NULL,NULL,NULL,NULL,'2023-03-13 01:16:49',0,'0001-01-01 00:00:00',0,_binary ''),(69,1012002,1014003,0,1022004,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Black_Tea','0','Black Tea',100,1,NULL,NULL,13.7931,86.2069,NULL,'0',0,0,0,'0',NULL,0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-13 01:17:20',0,'0001-01-01 00:00:00',0,_binary ''),(70,1012002,1014003,0,1022004,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Green_Tea','0','Green Tea',80,1,NULL,NULL,11.0345,68.9655,NULL,'0',0,0,0,'0',NULL,0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,_binary '\0',0,70,NULL,NULL,NULL,NULL,'2023-03-13 01:17:40',0,'0001-01-01 00:00:00',0,_binary ''),(71,1012002,1014001,0,1022001,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Signature_Burger','0','Signature Burger',150,1,NULL,NULL,20.6897,129.31,NULL,'0',0,0,0,'0',NULL,0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-13 01:44:24',0,'0001-01-01 00:00:00',0,_binary ''),(72,1012002,1014001,0,1022001,0,1024001,0,0,0,0,0,0,0,0,0,0,0,1024001,'Cheese_Burger','0','Cheese Burger',250,1,NULL,'des',34.4828,215.517,100,'0',2,30,10,'0','2023-03-21 22:23:05',0,0,_binary '\0',_binary '',_binary '','20','10','2023-04-27 00:00:00',_binary '\0',0,0,NULL,NULL,NULL,'2023-03-31 00:00:00','2023-03-22 03:28:37',0,'0001-01-01 00:00:00',0,_binary ''),(73,1012001,1023001,1015002,1021001,0,0,0,0,1008003,0,0,0,0,0,0,0,0,0,'Boxes','0','Boxes',50,1,NULL,NULL,NULL,NULL,NULL,'0',0,0,0,'0','9',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,_binary '\0',0,0,NULL,NULL,NULL,NULL,'2023-03-23 17:27:04',0,'0001-01-01 00:00:00',0,_binary ''),(74,1012002,0,0,1022002,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Mango_Shake','0','Mango Shake',150,1,NULL,NULL,20.6897,129.31,NULL,'0',0,0,0,'0','2023-03-23 15:35:49',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 20:36:06',0,'0001-01-01 00:00:00',0,_binary ''),(75,1012002,0,0,1022003,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Mango_Ice_Cream','0','Mango Ice Cream',0,1,NULL,NULL,0,0,NULL,'0',NULL,0,0,'0','2023-03-23 15:36:07',0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 20:37:41',0,'0001-01-01 00:00:00',0,_binary ''),(76,1012002,0,0,1022006,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Grilled_Chicken_Sandwich','0','Grilled Chicken Sandwich',200,1,NULL,NULL,27.5862,172.414,NULL,'0',0,0,0,'0','2023-03-23 15:42:57',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 20:44:40',0,'0001-01-01 00:00:00',0,_binary ''),(77,1012002,0,0,1022006,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Ham_Sandwich','0','Ham Sandwich',150,1,NULL,NULL,20.6897,129.31,NULL,'0',0,0,0,'0','2023-03-23 15:44:40',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 20:45:07',0,'0001-01-01 00:00:00',0,_binary ''),(78,1012002,0,0,1022006,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Nutella_Sandwich','0','Nutella Sandwich',200,1,NULL,NULL,27.5862,172.414,NULL,'0',0,0,0,'0','2023-03-23 15:45:08',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 20:45:31',0,'0001-01-01 00:00:00',0,_binary ''),(79,1012002,0,0,1022006,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Seafood_Sandwich','0','Seafood Sandwich',220,1,NULL,NULL,30.3448,189.655,NULL,'0',0,0,0,'0','2023-03-23 15:45:31',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 20:45:54',0,'0001-01-01 00:00:00',0,_binary ''),(80,1012002,0,0,1022006,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Corn_Cheese_Sandwich','0','Corn Cheese Sandwich',160,1,NULL,NULL,22.069,137.931,NULL,'0',0,0,0,'0','2023-03-23 15:45:55',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 20:46:29',0,'0001-01-01 00:00:00',0,_binary ''),(81,1012002,0,0,1022007,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Curly_Fries','0','Curly Fries',100,1,NULL,NULL,13.7931,86.2069,NULL,'0',0,0,0,'0','2023-03-23 15:50:36',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 20:51:04',0,'0001-01-01 00:00:00',0,_binary ''),(82,1012002,0,0,1022007,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Steak_Fries','0','Steak Fries',200,1,NULL,NULL,27.5862,172.414,NULL,'0',0,0,0,'0','2023-03-23 15:51:04',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 20:51:24',0,'0001-01-01 00:00:00',0,_binary ''),(83,1012002,0,0,1022008,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Crispy_Fried_Chicken','0','Crispy Fried Chicken',700,1,NULL,NULL,96.5517,603.448,NULL,'0',0,0,0,'0','2023-03-23 15:51:24',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 20:52:36',0,'0001-01-01 00:00:00',0,_binary ''),(84,1012002,0,0,1022009,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Black_Coffee','0','Black Coffee',120,1,NULL,NULL,16.5517,103.448,NULL,'0',0,0,0,'0','2023-03-23 15:52:37',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 20:56:35',0,'0001-01-01 00:00:00',0,_binary '\0'),(85,1012002,0,0,1022009,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Cappuccino_','0','Cappuccino ',150,1,NULL,NULL,20.6897,129.31,NULL,'0',0,0,0,'0','2023-03-23 15:56:35',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 20:57:00',0,'0001-01-01 00:00:00',0,_binary '\0'),(86,1012002,0,0,1022009,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Latte_Coffe','0','Latte Coffe',130,1,NULL,NULL,17.931,112.069,NULL,'0',0,0,0,'0','2023-03-23 15:57:00',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 20:57:23',0,'0001-01-01 00:00:00',0,_binary '\0'),(87,1012002,0,0,1022009,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Expresso_Coffe','0','Expresso Coffe',170,1,NULL,NULL,23.4483,146.552,NULL,'0',0,0,0,'0','2023-03-23 15:57:23',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 20:57:53',0,'0001-01-01 00:00:00',0,_binary '\0'),(88,1012002,0,0,1022002,0,0,NULL,0,0,0,0,0,NULL,0,0,NULL,0,0,'Banana_Shake','0','Banana Shake',120,1,NULL,NULL,16.5517,103.448,NULL,'0',0,0,0,'0','2023-03-23 17:31:43',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-23 22:32:08',0,'0001-01-01 00:00:00',0,_binary ''),(89,1012002,0,0,1022010,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Student_Deal','0','Student Deal',2000,1,NULL,NULL,275.862,1724.14,NULL,'0',0,0,0,'0','2023-03-30 17:39:48',0,5,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,'2023-03-22 19:00:00',_binary '\0',0,0,NULL,NULL,NULL,'2023-04-02 19:00:00','2023-03-30 22:40:42',0,'2023-03-30 22:40:42',0,_binary '\0'),(90,0,0,0,0,0,1024001,1,0,0,0,0,0,89,0,0,0,0,1024001,NULL,'0','Zinger Burger',0,2,NULL,NULL,NULL,NULL,NULL,'0',0,0,0,'0','2023-03-30 18:21:55',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,_binary '',2,89,NULL,NULL,NULL,NULL,'2023-03-30 23:22:11',0,'2023-03-30 23:22:11',0,_binary ''),(91,0,0,0,0,0,0,2,0,0,0,0,0,89,0,0,0,0,0,NULL,'0','Tikka Pizza',0,1,NULL,NULL,NULL,NULL,NULL,'0',0,0,0,'0','2023-03-30 18:22:11',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,_binary '',1,89,NULL,NULL,NULL,NULL,'2023-03-30 23:22:34',0,'2023-03-30 23:22:34',0,_binary ''),(92,0,0,0,0,0,0,3,0,0,0,0,0,89,0,0,0,0,0,NULL,'0','Steak Fries',0,2,NULL,NULL,NULL,NULL,NULL,'0',0,0,0,'0','2023-03-30 18:22:34',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,_binary '',2,89,NULL,NULL,NULL,NULL,'2023-03-30 23:23:00',0,'2023-03-30 23:23:00',0,_binary '\0'),(93,1012002,0,0,1022010,0,0,3,0,0,0,0,0,0,0,0,0,0,0,'Classic_Deal','0','Classic Deal',1500,1,NULL,NULL,206.897,1293.1,NULL,'0',0,0,0,'0','2023-03-30 19:32:16',0,3,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,'2023-03-30 19:00:00',_binary '\0',0,0,NULL,NULL,NULL,'2023-04-07 19:00:00','2023-03-31 00:32:39',0,'2023-03-31 00:32:39',0,_binary '\0'),(94,0,0,0,0,0,0,1,0,0,0,0,0,93,0,0,0,0,0,NULL,'0','Chicken Pizza',0,2,NULL,NULL,NULL,NULL,NULL,'0',0,0,0,'0','2023-03-30 19:40:20',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,_binary '',2,93,NULL,NULL,NULL,NULL,'2023-03-31 00:40:36',0,'2023-03-31 00:40:36',0,_binary ''),(95,0,0,0,0,0,0,1034001,0,0,0,0,0,70,0,0,0,0,0,NULL,'0',NULL,0,1,NULL,NULL,NULL,NULL,NULL,'0',0,0,0,'0','2023-03-30 19:44:10',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,_binary '',0,93,NULL,NULL,NULL,NULL,'2023-03-31 00:44:46',0,'2023-03-31 00:44:46',0,_binary '\0'),(96,0,0,0,0,0,0,2,0,0,0,0,0,93,0,0,0,0,0,NULL,'0','Ham Sandwich',0,1,NULL,NULL,NULL,NULL,NULL,'0',0,0,0,'0','2023-03-30 20:35:52',0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,_binary '',1,93,NULL,NULL,NULL,NULL,'2023-03-31 01:36:16',0,'2023-03-31 01:36:16',0,_binary ''),(97,1012002,0,0,1022010,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Family_Deal','0','Family Deal',4000,1,NULL,NULL,551.724,3448.28,NULL,'0',0,0,0,'0','2023-04-06 19:00:00',0,7,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,'2023-03-30 19:00:00',_binary '\0',0,0,NULL,NULL,NULL,'2023-04-07 19:00:00','2023-04-01 03:06:10',0,'2023-04-01 03:06:10',0,_binary '\0'),(98,0,0,0,0,0,0,1,0,0,0,0,0,97,0,0,0,0,0,NULL,'0','Regular Burger',0,4,NULL,NULL,NULL,NULL,NULL,'0',0,0,0,'0',NULL,0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,_binary '',4,0,NULL,NULL,NULL,NULL,'2023-04-01 03:09:53',0,'2023-04-01 03:09:53',0,_binary ''),(99,0,0,0,0,0,0,2,0,0,0,0,0,97,0,0,0,0,0,NULL,'0','Chicken Pizza',0,2,NULL,NULL,NULL,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,_binary '',2,0,NULL,NULL,NULL,NULL,'2023-04-01 03:10:10',0,'2023-04-01 03:10:10',0,_binary ''),(100,1012001,1023001,1015001,1021001,0,0,0,0,1008002,0,0,0,0,0,0,0,0,0,'Sugar','0','Sugar',150,1,NULL,NULL,NULL,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,_binary '\0',0,0,NULL,NULL,NULL,NULL,'2023-04-14 22:38:56',0,'2023-04-14 22:38:56',0,_binary ''),(101,1012001,1023001,1015001,1021001,0,0,0,0,1008001,0,0,0,0,0,0,0,0,0,'Milk','0','Milk',200,1,NULL,NULL,NULL,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,_binary '\0',0,0,NULL,NULL,NULL,NULL,'2023-04-14 22:39:21',0,'2023-04-14 22:39:21',0,_binary ''),(102,1012001,1023001,1015001,1021001,0,0,0,0,1008002,0,0,0,0,0,0,0,0,0,'Oil','0','Oil',700,1,NULL,NULL,NULL,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,_binary '\0',0,0,NULL,NULL,NULL,NULL,'2023-04-14 22:39:44',0,'2023-04-14 22:39:44',0,_binary ''),(103,1012001,1023001,0,1021001,0,0,0,0,1008002,0,0,0,0,0,0,0,0,0,'abc','0','abc',100,1,NULL,NULL,NULL,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,_binary '\0',0,0,NULL,NULL,NULL,NULL,'2023-04-18 15:09:30',0,'2023-04-18 15:09:30',0,_binary '\0'),(104,0,0,0,0,0,0,3,0,0,0,0,0,89,0,0,0,0,0,NULL,'0','Steak Fries',0,2,NULL,NULL,NULL,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,_binary '',2,0,NULL,NULL,NULL,NULL,'2023-04-18 19:18:51',0,'2023-04-18 19:18:51',0,_binary ''),(105,1012002,0,0,1022001,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,'0','Chili Burger',200,1,NULL,NULL,NULL,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,_binary '\0',0,0,NULL,NULL,NULL,NULL,'2023-04-20 18:15:09',0,'2023-04-20 18:15:09',0,_binary ''),(106,1012002,0,0,1022001,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,'0','Chili Burger',200,1,NULL,NULL,NULL,NULL,NULL,'0',0,0,0,'0',NULL,0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,_binary '\0',0,106,NULL,NULL,NULL,NULL,'2023-04-20 18:17:21',0,'2023-04-20 18:17:21',0,_binary ''),(107,1012002,0,0,0,0,0,0,0,0,1010004,0,0,0,0,0,0,0,0,NULL,'0','i',0,1,NULL,NULL,NULL,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,_binary '\0',0,0,NULL,NULL,NULL,NULL,'2023-04-20 18:25:01',0,'2023-04-20 18:25:01',0,_binary '\0'),(108,1012002,0,0,1022001,0,0,0,0,0,1010001,0,0,0,0,0,0,0,0,NULL,'0','Simple Burger',100,1,NULL,NULL,NULL,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,_binary '\0',0,0,NULL,NULL,NULL,NULL,'2023-04-20 21:29:18',0,'2023-04-20 21:29:18',0,_binary '\0'),(109,1012002,0,0,1022001,0,0,0,0,0,1010001,0,0,0,0,0,0,0,0,NULL,'0','Simple Burger',100,1,NULL,NULL,NULL,NULL,NULL,'0',NULL,0,0,'0',NULL,0,0,NULL,_binary '\0',NULL,NULL,NULL,NULL,_binary '\0',0,0,NULL,NULL,NULL,NULL,'2023-04-20 21:30:59',0,'2023-04-20 21:30:59',0,_binary '\0'),(110,1012002,0,0,1022001,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,'0','Simple Burger...',200,1,NULL,NULL,NULL,NULL,NULL,'0',0,0,0,'0',NULL,0,0,_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,_binary '\0',0,110,NULL,NULL,NULL,NULL,'2023-04-20 21:33:57',0,'2023-04-20 21:33:57',0,_binary ''),(111,1012002,0,0,1022009,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Family_Deal','0','Family Deal',1740,1,NULL,NULL,240,1500,NULL,'0',NULL,0,0,'0','2023-06-06 00:00:00',0,4,NULL,_binary '\0',NULL,NULL,NULL,'2023-06-06 00:00:00',_binary '\0',0,0,NULL,NULL,NULL,NULL,'2023-06-06 10:01:55',0,'2023-06-06 10:01:55',0,_binary '');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemrecipe`
--

DROP TABLE IF EXISTS `itemrecipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemrecipe` (
  `GroupId` int DEFAULT NULL,
  `ItemId` int NOT NULL,
  `RawItemId` int NOT NULL,
  `SizeId` int NOT NULL,
  `UOM` varchar(300) DEFAULT NULL,
  `QTY` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`ItemId`,`RawItemId`,`SizeId`),
  KEY `recipie_ibfk_1_idx` (`GroupId`),
  KEY `recipie_ibfk_2_idx` (`ItemId`),
  KEY `recipie_ibfk_4_idx` (`RawItemId`),
  CONSTRAINT `itemrecipe_ibfk_1` FOREIGN KEY (`GroupId`) REFERENCES `enumline` (`Id`),
  CONSTRAINT `itemrecipe_ibfk_2` FOREIGN KEY (`ItemId`) REFERENCES `item` (`Id`),
  CONSTRAINT `itemrecipe_ibfk_4` FOREIGN KEY (`RawItemId`) REFERENCES `item` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemrecipe`
--

LOCK TABLES `itemrecipe` WRITE;
/*!40000 ALTER TABLE `itemrecipe` DISABLE KEYS */;
INSERT INTO `itemrecipe` VALUES (1022001,64,65,1,'gm',12,100,1.2,'2023-05-04 23:05:34',0,'2023-05-04 23:05:34',0,_binary ''),(1022001,64,100,1,'gm',1,150,0.15,'2023-05-05 00:06:57',0,'2023-05-05 00:06:57',0,_binary ''),(1022001,64,101,1,'ml',12,200,2.4,'2023-05-05 00:09:24',0,'2023-05-05 00:09:24',0,_binary ''),(1022001,66,65,0,'gm',1,100,0.1,'2023-05-04 22:05:42',0,'2023-05-04 22:05:42',0,_binary ''),(1022001,66,100,0,'gm',1,150,0.15,'2023-05-04 22:10:32',0,'2023-05-04 22:10:32',0,_binary ''),(1022001,66,101,0,'ml',1,200,0.2,'2023-05-04 22:12:21',0,'2023-05-04 22:12:21',0,_binary ''),(1022004,70,100,0,'gm',1,150,0.15,'2023-05-29 22:19:53',0,'2023-05-29 22:19:53',0,_binary '');
/*!40000 ALTER TABLE `itemrecipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitchendemand`
--

DROP TABLE IF EXISTS `kitchendemand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kitchendemand` (
  `Id` int NOT NULL,
  `CategoryId` int DEFAULT NULL,
  `KitchenId` int DEFAULT NULL,
  `Item` varchar(200) DEFAULT NULL,
  `DemandNo` int DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchendemand`
--

LOCK TABLES `kitchendemand` WRITE;
/*!40000 ALTER TABLE `kitchendemand` DISABLE KEYS */;
INSERT INTO `kitchendemand` VALUES (1,1023001,1024001,'Item Name',100,'2023-04-17 19:00:00','2023-04-05 19:46:49',0,'2023-04-05 19:46:49',0,_binary '');
/*!40000 ALTER TABLE `kitchendemand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitchenissuance`
--

DROP TABLE IF EXISTS `kitchenissuance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kitchenissuance` (
  `Id` int NOT NULL,
  `StoreId` int DEFAULT NULL,
  `BranchId` int DEFAULT NULL,
  `KitchenId` int DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `KeyWord` varchar(200) DEFAULT NULL,
  `DemandNo` varchar(45) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchenissuance`
--

LOCK TABLES `kitchenissuance` WRITE;
/*!40000 ALTER TABLE `kitchenissuance` DISABLE KEYS */;
INSERT INTO `kitchenissuance` VALUES (1,1,6,1024002,'2023-04-21 19:00:00','KeyWord.....',NULL,'2023-04-17 19:47:20',0,'2023-04-17 19:47:20',0,_binary ''),(2,1,5,1024001,'2023-05-03 06:53:51','keyword',NULL,'2023-05-03 11:54:03',0,'2023-05-03 11:54:03',0,_binary ''),(3,1,5,1024001,'2023-05-03 06:53:51','keyword',NULL,'2023-05-03 11:54:13',0,'2023-05-03 11:54:13',0,_binary ''),(4,1,5,1024001,'2023-05-03 06:53:51','keyword',NULL,'2023-05-03 11:55:32',0,'2023-05-03 11:55:32',0,_binary ''),(5,1,6,1024001,'2023-05-03 06:57:29','testing',NULL,'2023-05-03 11:57:44',0,'2023-05-03 11:57:44',0,_binary '\0'),(6,1,4,1024002,'2023-05-09 15:13:52','test',NULL,'2023-05-09 20:14:09',0,'2023-05-09 20:14:09',0,_binary '');
/*!40000 ALTER TABLE `kitchenissuance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kotsetting`
--

DROP TABLE IF EXISTS `kotsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kotsetting` (
  `Id` int NOT NULL,
  `KDSName` varchar(300) DEFAULT NULL,
  `PrinterId` int DEFAULT NULL,
  `KitchenBell` bit(1) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `kotsetting_ibfk_1_idx` (`PrinterId`),
  CONSTRAINT `kotsetting_ibfk_1` FOREIGN KEY (`PrinterId`) REFERENCES `enumline` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kotsetting`
--

LOCK TABLES `kotsetting` WRITE;
/*!40000 ALTER TABLE `kotsetting` DISABLE KEYS */;
INSERT INTO `kotsetting` VALUES (1,'KDS Name',1029001,_binary '','2023-03-18 19:23:35',0,'0001-01-01 00:00:00',0,_binary ''),(2,'Kds 3',1029002,_binary '\0','2023-03-18 19:24:41',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `kotsetting` ENABLE KEYS */;
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
INSERT INTO `memberpoints` VALUES (1,12,25,17,'2023-03-16 02:05:12',0,'0001-01-01 00:00:00',0,_binary ''),(2,1,2,9,'2023-03-16 02:05:40',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `memberpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modifier`
--

DROP TABLE IF EXISTS `modifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modifier` (
  `Id` int NOT NULL,
  `RawItemId` int DEFAULT NULL,
  `KDSId` int DEFAULT NULL,
  `ModifierName` varchar(200) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modifier`
--

LOCK TABLES `modifier` WRITE;
/*!40000 ALTER TABLE `modifier` DISABLE KEYS */;
INSERT INTO `modifier` VALUES (1,73,1024001,'Modifier name....',200.98,12,'2023-04-08 15:15:10',0,'2023-04-08 15:15:10',0,_binary ''),(2,65,1024001,'TESTING',987.4,1,'2023-04-08 15:17:14',0,'2023-04-08 15:17:14',0,_binary '\0');
/*!40000 ALTER TABLE `modifier` ENABLE KEYS */;
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
INSERT INTO `onlinedbsetting` VALUES (1,'Srv Name','Db Name','User A','13579','2023-03-16 02:01:38',0,'0001-01-01 00:00:00',0,_binary ''),(2,'Srvs Name','DB Name','abc','13579','2023-03-16 02:05:58',0,'0001-01-01 00:00:00',0,_binary '\0'),(3,'CVBN','FGH','GFHJ','CVB','2023-03-16 02:12:07',0,'0001-01-01 00:00:00',0,_binary '\0');
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
INSERT INTO `ordersource` VALUES (1,'Careem',19,_binary '','2023-03-16 02:07:51',0,'0001-01-01 00:00:00',0,_binary ''),(2,'Sumaira Ameerio',180,_binary '\0','2023-03-16 02:08:06',0,'0001-01-01 00:00:00',0,_binary '\0');
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
-- Table structure for table `printersetting`
--

DROP TABLE IF EXISTS `printersetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `printersetting` (
  `Id` int NOT NULL,
  `PrinterId` int DEFAULT NULL,
  `TypeId` int DEFAULT NULL,
  `NoofPrints` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `printersetting_ibfk_1_idx` (`PrinterId`),
  KEY `printersetting_ibfk_2_idx` (`TypeId`),
  CONSTRAINT `printersetting_ibfk_1` FOREIGN KEY (`PrinterId`) REFERENCES `enumline` (`Id`),
  CONSTRAINT `printersetting_ibfk_2` FOREIGN KEY (`TypeId`) REFERENCES `enumline` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printersetting`
--

LOCK TABLES `printersetting` WRITE;
/*!40000 ALTER TABLE `printersetting` DISABLE KEYS */;
INSERT INTO `printersetting` VALUES (1,1029001,1030002,5,'2023-03-18 19:35:18',0,'0001-01-01 00:00:00',0,_binary ''),(2,1029001,1030003,9,'2023-03-18 19:35:30',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `printersetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printtype`
--

DROP TABLE IF EXISTS `printtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `printtype` (
  `Id` int NOT NULL,
  `PrinterId` int DEFAULT NULL,
  `TypeId` int DEFAULT NULL,
  `Terminal` varchar(300) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `printtype_ibfk_1_idx` (`PrinterId`),
  KEY `printype_ibfk_2_idx` (`TypeId`),
  CONSTRAINT `printtype_ibfk_1` FOREIGN KEY (`PrinterId`) REFERENCES `enumline` (`Id`),
  CONSTRAINT `printype_ibfk_2` FOREIGN KEY (`TypeId`) REFERENCES `enumline` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printtype`
--

LOCK TABLES `printtype` WRITE;
/*!40000 ALTER TABLE `printtype` DISABLE KEYS */;
INSERT INTO `printtype` VALUES (1,1029002,1030002,'Terminal...','2023-03-18 19:22:17',0,'0001-01-01 00:00:00',0,_binary ''),(2,1029002,1030001,'terminal','2023-03-18 19:23:18',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `printtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseitems`
--

DROP TABLE IF EXISTS `purchaseitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseitems` (
  `Id` int NOT NULL,
  `BranchId` int DEFAULT NULL,
  `ItemId` int DEFAULT NULL,
  `SupplierId` int DEFAULT NULL,
  `GroupId` int DEFAULT NULL,
  `StoreId` int DEFAULT NULL,
  `PurchaseTypeId` int DEFAULT NULL,
  `NoofPackages` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `GRNNO` int DEFAULT NULL,
  `TotalQty` int DEFAULT NULL,
  `TotalAmount` float DEFAULT NULL,
  `PricePerItem` float DEFAULT NULL,
  `PONo` int DEFAULT NULL,
  `InvoiceNo` int DEFAULT NULL,
  `ExpectedAmount` float DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Description` varchar(2000) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseitems`
--

LOCK TABLES `purchaseitems` WRITE;
/*!40000 ALTER TABLE `purchaseitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchaseitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorder`
--

DROP TABLE IF EXISTS `purchaseorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorder` (
  `Id` int NOT NULL,
  `PODate` datetime DEFAULT NULL,
  `PONo` int DEFAULT NULL,
  `DemandNo` int DEFAULT NULL,
  `SupplierId` int DEFAULT NULL,
  `BranchId` int DEFAULT NULL,
  `ItemId` int DEFAULT NULL,
  `ItemsPerPkg` int DEFAULT NULL,
  `NoOfPkg` int DEFAULT NULL,
  `TotalQty` int DEFAULT NULL,
  `PricePerPkg` float DEFAULT NULL,
  `TotalAmount` double DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `CreatedById` int DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorder`
--

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasereturn`
--

DROP TABLE IF EXISTS `purchasereturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchasereturn` (
  `Id` int NOT NULL,
  `BranchId` int DEFAULT NULL,
  `SupplierId` int DEFAULT NULL,
  `InvoiceNo` int DEFAULT NULL,
  `ReturnDate` datetime DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasereturn`
--

LOCK TABLES `purchasereturn` WRITE;
/*!40000 ALTER TABLE `purchasereturn` DISABLE KEYS */;
INSERT INTO `purchasereturn` VALUES (2,4,4,12,'2023-04-29 00:00:00','2023-04-05 00:14:56',0,'2023-04-05 00:14:56',0,_binary ''),(3,4,1,23,'2023-05-24 00:00:00','2023-05-30 00:29:18',0,'2023-05-30 00:29:18',0,_binary ''),(4,4,1,12,'2023-06-05 00:00:00','2023-06-05 14:16:26',0,'2023-06-05 14:16:26',0,_binary ''),(5,5,1,89,'2023-06-05 00:00:00','2023-06-05 14:26:12',0,'2023-06-05 14:26:12',0,_binary ''),(6,4,1,78,'2023-06-05 00:00:00','2023-06-05 15:23:40',0,'2023-06-05 15:23:40',0,_binary '');
/*!40000 ALTER TABLE `purchasereturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasereturnline`
--

DROP TABLE IF EXISTS `purchasereturnline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchasereturnline` (
  `Id` int NOT NULL,
  `PRId` int NOT NULL,
  `ItemId` int DEFAULT NULL,
  `UOMId` int DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `TotalItems` int DEFAULT NULL,
  `PricePerItem` decimal(10,0) DEFAULT NULL,
  `TotalAmt` decimal(10,0) DEFAULT NULL,
  `ReturnQty` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`,`PRId`),
  KEY `purchasereturnline_ibfk_1_idx` (`UOMId`),
  KEY `purchasereturnline_ibfk_2_idx` (`ItemId`),
  CONSTRAINT `purchasereturnline_ibfk_1` FOREIGN KEY (`UOMId`) REFERENCES `enumline` (`Id`),
  CONSTRAINT `purchasereturnline_ibfk_2` FOREIGN KEY (`ItemId`) REFERENCES `item` (`Id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasereturnline`
--

LOCK TABLES `purchasereturnline` WRITE;
/*!40000 ALTER TABLE `purchasereturnline` DISABLE KEYS */;
INSERT INTO `purchasereturnline` VALUES (1,2,65,1008002,NULL,89,78,6942,78,'2023-05-30 02:14:24',0,'2023-05-30 02:14:24',0,_binary ''),(1,3,100,1008002,'2023-05-29 19:26:30',23,32,736,2,'2023-05-30 00:29:18',0,'2023-05-30 00:29:18',0,_binary ''),(1,4,65,1008002,NULL,12,45,540,1,'2023-06-05 14:16:26',0,'2023-06-05 14:16:26',0,_binary ''),(1,5,73,1008003,NULL,89,78,6942,8,'2023-06-05 14:26:12',0,'2023-06-05 14:26:12',0,_binary ''),(1,6,65,1008002,NULL,89,65,5785,7,'2023-06-05 15:23:40',0,'2023-06-05 15:23:40',0,_binary ''),(2,3,101,1008001,NULL,8,8,64,9,'2023-05-30 01:20:04',0,'2023-05-30 01:20:04',0,_binary ''),(2,6,73,1008003,NULL,89,56,4984,9,'2023-06-05 15:23:40',0,'2023-06-05 15:23:40',0,_binary ''),(3,6,101,1008001,NULL,89,76,6764,1,'2023-06-05 15:25:26',0,'2023-06-05 15:25:26',0,_binary ''),(4,6,73,1008003,NULL,87,56,4872,77,'2023-06-05 15:25:26',0,'2023-06-05 15:25:26',0,_binary ''),(5,6,100,1008002,NULL,89,76,6764,56,'2023-06-05 15:26:54',0,'2023-06-05 15:26:54',0,_binary '');
/*!40000 ALTER TABLE `purchasereturnline` ENABLE KEYS */;
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
INSERT INTO `rider` VALUES (1,'Aaftab','09876543498...','Aaftab@gmail.com...','2023-02-24 01:04:00',0,'0001-01-01 00:00:00',0,1),(2,'abc','345678',NULL,'2023-02-24 01:04:41',0,'0001-01-01 00:00:00',0,0),(3,'Urhan','0987654323','urhan@gmail.com','2023-02-24 01:05:11',0,'0001-01-01 00:00:00',0,1);
/*!40000 ALTER TABLE `rider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runtimemodifier`
--

DROP TABLE IF EXISTS `runtimemodifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `runtimemodifier` (
  `Id` int NOT NULL,
  `MenuItemId` int DEFAULT NULL,
  `RawItemId` int DEFAULT NULL,
  `KDSId` int DEFAULT NULL,
  `KDS2Id` int DEFAULT NULL,
  `TypeId` int DEFAULT NULL,
  `ModifierName` varchar(200) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `StageId` int DEFAULT NULL,
  `StageQtyAllowed` int DEFAULT NULL,
  `ImageBase64Path` longtext,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runtimemodifier`
--

LOCK TABLES `runtimemodifier` WRITE;
/*!40000 ALTER TABLE `runtimemodifier` DISABLE KEYS */;
INSERT INTO `runtimemodifier` VALUES (1,66,65,0,0,1036001,'burger',0,0,1,1,NULL,'2023-06-05 21:55:04',0,'2023-06-05 21:55:04',0,_binary ''),(2,66,0,0,0,1036001,'Pizaa',100,0,2,3,NULL,'2023-06-05 21:56:53',0,'2023-06-05 21:56:53',0,_binary ''),(3,66,0,0,0,1036001,'Pizza 2',0,0,2,3,NULL,'2023-06-05 21:57:05',0,'2023-06-05 21:57:05',0,_binary ''),(4,66,0,0,0,1036001,'Pizza3',0,0,2,3,NULL,'2023-06-05 21:57:20',0,'2023-06-05 21:57:20',0,_binary ''),(5,66,0,0,0,1036001,'Pizza4',0,0,2,3,NULL,'2023-06-05 21:57:36',0,'2023-06-05 21:57:36',0,_binary ''),(6,66,0,0,0,1036001,'Burger 1',0,0,1,1,NULL,'2023-06-05 21:58:06',0,'2023-06-05 21:58:06',0,_binary ''),(7,111,0,0,0,1036001,'Beef',0,0,1,1,NULL,'2023-06-06 10:03:51',0,'2023-06-06 10:03:51',0,_binary ''),(8,111,0,0,0,1036001,'Chicken',0,0,1,1,NULL,'2023-06-06 10:04:07',0,'2023-06-06 10:04:07',0,_binary ''),(9,111,0,0,0,1036001,'Chilli Garlic Sauce',0,0,2,3,NULL,'2023-06-06 10:04:32',0,'2023-06-06 10:04:32',0,_binary ''),(10,111,0,0,0,1036001,'Garlic Sauce',0,0,2,3,NULL,'2023-06-06 10:05:06',0,'2023-06-06 10:05:06',0,_binary '');
/*!40000 ALTER TABLE `runtimemodifier` ENABLE KEYS */;
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
  `PaymentMethodId` int DEFAULT NULL,
  `RiderId` int DEFAULT NULL,
  `BillTitle` varchar(500) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `PhoneNo` varchar(200) DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `Guest` varchar(200) DEFAULT NULL,
  `Discount` float DEFAULT NULL,
  `DiscountValue` float DEFAULT NULL,
  `GST` float DEFAULT NULL,
  `GSTValue` float DEFAULT NULL,
  `TableNo` varchar(200) DEFAULT NULL,
  `Note` varchar(5000) DEFAULT NULL,
  `Service` float DEFAULT NULL,
  `NetTotal` float DEFAULT NULL,
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
  KEY `saleorder_ibfk_4_idx` (`PaymentMethodId`),
  CONSTRAINT `saleorder_fk_1` FOREIGN KEY (`OrderTypeId`) REFERENCES `enumline` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saleorder_fk_2` FOREIGN KEY (`StatusId`) REFERENCES `enumline` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saleorder_fk_3` FOREIGN KEY (`SourceId`) REFERENCES `enumline` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saleorder_ibfk_1` FOREIGN KEY (`WaiterId`) REFERENCES `aspnetusers` (`Id`),
  CONSTRAINT `saleorder_ibfk_2` FOREIGN KEY (`ShiftId`) REFERENCES `enumline` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saleorder_ibfk_3` FOREIGN KEY (`DiscountTypeId`) REFERENCES `enumline` (`Id`),
  CONSTRAINT `saleorder_ibfk_4` FOREIGN KEY (`PaymentMethodId`) REFERENCES `enumline` (`Id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleorder`
--

LOCK TABLES `saleorder` WRITE;
/*!40000 ALTER TABLE `saleorder` DISABLE KEYS */;
INSERT INTO `saleorder` VALUES (1,1004001,1002002,NULL,1001002,NULL,'1122',NULL,1005001,1025002,NULL,'1122',NULL,NULL,NULL,1120.69,NULL,4.46154,50,5,61.4224,NULL,NULL,0,1132.11,NULL,NULL,'2023-03-26 00:33:16',0,'0001-01-01 00:00:00',0,1),(2,1004001,1002001,NULL,1001003,NULL,'321',NULL,NULL,1025001,NULL,'321',NULL,NULL,NULL,431.034,NULL,0,0,16,0,NULL,NULL,0,499.999,NULL,NULL,'2023-06-03 16:10:42',0,'0001-01-01 00:00:00',0,1),(3,1004001,1002001,NULL,1001002,NULL,'8899',NULL,NULL,1025001,NULL,'8899',NULL,NULL,NULL,1698.27,NULL,0,0,16,271.724,NULL,NULL,0,1970,NULL,NULL,'2023-06-05 20:58:01',0,'0001-01-01 00:00:00',0,1),(4,1004001,1002001,NULL,1001002,NULL,'789',NULL,NULL,1025001,NULL,'789',NULL,NULL,NULL,0,NULL,0,0,0,0,NULL,NULL,0,0,NULL,NULL,'2023-06-05 21:05:22',0,'0001-01-01 00:00:00',0,1),(5,1004002,1002001,NULL,1001002,'ab169d87-a803-48a4-84c2-43c7ed250287',NULL,NULL,1005002,1025001,NULL,'Floor 3 / T4',NULL,NULL,NULL,344.828,NULL,10,34.4828,16,55.1725,'Floor 3 / T4',NULL,0,365.518,NULL,NULL,'2023-06-05 23:39:23',0,'0001-01-01 00:00:00',0,1),(6,1004002,1002001,NULL,1001002,'ab169d87-a803-48a4-84c2-43c7ed250287',NULL,NULL,1005002,1025001,NULL,'Floor 3 / T4  I',NULL,NULL,NULL,0,NULL,10,0,16,0,'Floor 3 / T4',NULL,0,0,NULL,NULL,'2023-06-05 23:39:23',0,'0001-01-01 00:00:00',0,1);
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
  `Price` float DEFAULT NULL,
  `LineTotal` float DEFAULT NULL,
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
INSERT INTO `saleorderline` VALUES (1,1,'Regular Burger','Regular_Burger',1,172.41,172.41,'2023-03-26 00:33:22',0,'0001-01-01 00:00:00',0,1),(2,1,'Cheese Burger','Cheese_Burger',1,155.174,155.174,'2023-03-26 00:33:40',0,'0001-01-01 00:00:00',0,1),(3,1,'Chicken Pizza','Chicken_Pizza',1,517.24,517.24,'2023-03-26 00:33:44',0,'0001-01-01 00:00:00',0,1),(4,1,'Medium Tikka Pizza',NULL,1,275.864,275.864,'2023-03-26 00:33:46',0,'0001-01-01 00:00:00',0,1),(5,2,'Small Cheese Burger',NULL,1,431.034,431.034,'2023-06-03 16:10:46',0,'0001-01-01 00:00:00',0,1),(6,3,'Mango Shake',NULL,1,129.31,129.31,'2023-06-05 20:58:09',0,'0001-01-01 00:00:00',0,1),(7,3,'Banana Shake',NULL,1,103.448,103.448,'2023-06-05 20:58:11',0,'0001-01-01 00:00:00',0,1),(8,3,'Zinger Burger',NULL,1,0,0,'2023-06-05 20:58:13',0,'0001-01-01 00:00:00',0,1),(9,3,'Regular Burger',NULL,1,172.414,172.414,'2023-06-05 20:58:17',0,'0001-01-01 00:00:00',0,1),(10,3,'Small Signature Burger',NULL,1,431.034,431.034,'2023-06-05 20:58:27',0,'0001-01-01 00:00:00',0,1),(11,3,'Large Cheese Burger',NULL,1,862.069,862.069,'2023-06-05 20:58:35',0,'0001-01-01 00:00:00',0,1),(12,4,'Zinger Burger',NULL,1,0,0,'2023-06-05 21:05:28',0,'0001-01-01 00:00:00',0,1),(13,5,'Regular Burger',NULL,2,172.414,344.828,'2023-06-05 23:39:28',0,'0001-01-01 00:00:00',0,1),(14,5,'burger',NULL,3,0,0,'2023-06-05 23:39:29',0,'0001-01-01 00:00:00',0,1),(17,5,'Pizza4',NULL,1,0,0,'2023-06-05 23:39:38',0,'0001-01-01 00:00:00',0,1),(18,6,'Pizza 2',NULL,1,0,0,'2023-06-05 23:39:36',0,'0001-01-01 00:00:00',0,1),(19,6,'Pizza3',NULL,1,0,0,'2023-06-05 23:39:37',0,'0001-01-01 00:00:00',0,1);
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
INSERT INTO `shift` VALUES (1,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'890',NULL,'2023-04-01 00:00:00',NULL,'2023-04-01 02:38:36',0,'0001-01-01 00:00:00',0,_binary ''),(2,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'1234567',NULL,'2023-04-16 00:00:00',NULL,'2023-04-16 19:21:01',0,'0001-01-01 00:00:00',0,_binary ''),(3,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'123',NULL,'2023-05-31 00:00:00',NULL,'2023-05-31 23:48:16',0,'0001-01-01 00:00:00',0,_binary ''),(4,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002002,'678',NULL,'2023-06-01 00:00:00',NULL,'2023-06-01 00:01:55',0,'0001-01-01 00:00:00',0,_binary ''),(5,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'6789',NULL,'2023-06-03 00:00:00',NULL,'2023-06-03 16:08:26',0,'0001-01-01 00:00:00',0,_binary ''),(6,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'7890',NULL,'2023-06-05 00:00:00',NULL,'2023-06-05 20:49:05',0,'0001-01-01 00:00:00',0,_binary ''),(7,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002002,'7890',NULL,'2023-06-06 00:00:00',NULL,'2023-06-06 00:01:34',0,'0001-01-01 00:00:00',0,_binary ''),(8,'b6ce1cc0-f2a8-491d-805c-db1e75146b9d',1002001,'7890',NULL,'2023-06-08 00:00:00',NULL,'2023-06-08 14:12:22',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockestimation`
--

DROP TABLE IF EXISTS `stockestimation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockestimation` (
  `Id` int NOT NULL,
  `GroupId` int DEFAULT NULL,
  `Item` varchar(200) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `OrderNo` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockestimation`
--

LOCK TABLES `stockestimation` WRITE;
/*!40000 ALTER TABLE `stockestimation` DISABLE KEYS */;
INSERT INTO `stockestimation` VALUES (1,1022001,'Item Name','2023-03-07 19:00:00',100,'2023-04-05 19:49:54',0,'2023-04-05 19:49:54',0,_binary '');
/*!40000 ALTER TABLE `stockestimation` ENABLE KEYS */;
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
-- Table structure for table `subitem`
--

DROP TABLE IF EXISTS `subitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subitem` (
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
-- Dumping data for table `subitem`
--

LOCK TABLES `subitem` WRITE;
/*!40000 ALTER TABLE `subitem` DISABLE KEYS */;
INSERT INTO `subitem` VALUES (1,'Testing...','2023-04-03 19:29:46',0,'2023-04-03 19:29:46',0,_binary '\0');
/*!40000 ALTER TABLE `subitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subrecipe`
--

DROP TABLE IF EXISTS `subrecipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subrecipe` (
  `Id` int NOT NULL,
  `GroupId` int DEFAULT NULL,
  `SubItemId` int DEFAULT NULL,
  `FlavorSizeId` int(10) unsigned zerofill DEFAULT NULL,
  `ItemId` int DEFAULT NULL,
  `QTY` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `subrecipe_ibfk_1_idx` (`GroupId`),
  KEY `subrecipe_ibfk_2_idx` (`SubItemId`),
  KEY `subrecipe_ibfk_3_idx` (`FlavorSizeId`),
  KEY `subrecipe_ibfk_4_idx` (`ItemId`),
  CONSTRAINT `subrecipe_ibfk_1` FOREIGN KEY (`GroupId`) REFERENCES `enumline` (`Id`),
  CONSTRAINT `subrecipe_ibfk_2` FOREIGN KEY (`SubItemId`) REFERENCES `enumline` (`Id`),
  CONSTRAINT `subrecipe_ibfk_4` FOREIGN KEY (`ItemId`) REFERENCES `item` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subrecipe`
--

LOCK TABLES `subrecipe` WRITE;
/*!40000 ALTER TABLE `subrecipe` DISABLE KEYS */;
INSERT INTO `subrecipe` VALUES (1,1022005,1033001,0000000006,67,2,'2023-03-23 16:27:58',0,'0001-01-01 00:00:00',0,_binary ''),(2,1022002,1033001,0000000001,69,2,'2023-03-23 16:30:47',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `subrecipe` ENABLE KEYS */;
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
INSERT INTO `supplier` VALUES (1,NULL,'Murtaza','Code',5,'Murtaza@gmail.com','1234543877','3660366387329','Lahore...','Area','Address...','2023-02-18 20:22:59',0,'0001-01-01 00:00:00',0,_binary ''),(2,NULL,'Cash Purchase',NULL,NULL,'abc@gmail.com','0987654323',NULL,NULL,NULL,NULL,'2023-02-18 20:27:14',0,'0001-01-01 00:00:00',0,_binary ''),(3,NULL,'Sumaira',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-18 20:27:46',0,'0001-01-01 00:00:00',0,_binary '\0'),(4,0,'Asim..','code...',8,'abc@gmail.com..','0988765423...','098765432345678..','Lahore..','Area...','Address...','2023-03-09 10:11:28',0,'0001-01-01 00:00:00',0,_binary '');
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
INSERT INTO `uomconversion` VALUES (1,1008001,1008004,1,'1000','2023-03-09 08:04:29',0,'0001-01-01 00:00:00',0,_binary ''),(2,1008001,1008002,17,'10000','2023-03-09 08:22:24',0,'0001-01-01 00:00:00',0,_binary '\0'),(3,1008002,1008005,1,'1000','2023-03-23 16:54:32',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `uomconversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_accountcode`
--

DROP TABLE IF EXISTS `vw_accountcode`;
/*!50001 DROP VIEW IF EXISTS `vw_accountcode`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_accountcode` AS SELECT 
 1 AS `Id`,
 1 AS `code`,
 1 AS `AccountTypeId`,
 1 AS `AccountType`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_assignaccount`
--

DROP TABLE IF EXISTS `vw_assignaccount`;
/*!50001 DROP VIEW IF EXISTS `vw_assignaccount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_assignaccount` AS SELECT 
 1 AS `Id`,
 1 AS `AccountId`,
 1 AS `Account`,
 1 AS `AccountTypeId`,
 1 AS `AccountType`,
 1 AS `BranchId`,
 1 AS `Branch`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_attachsubitem`
--

DROP TABLE IF EXISTS `vw_attachsubitem`;
/*!50001 DROP VIEW IF EXISTS `vw_attachsubitem`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_attachsubitem` AS SELECT 
 1 AS `Id`,
 1 AS `GroupId`,
 1 AS `ItemId`,
 1 AS `SubItemId`,
 1 AS `ModifierId`,
 1 AS `Qty`,
 1 AS `Group`,
 1 AS `SubItem`,
 1 AS `Item`,
 1 AS `Modifier`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_branch`
--

DROP TABLE IF EXISTS `vw_branch`;
/*!50001 DROP VIEW IF EXISTS `vw_branch`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_branch` AS SELECT 
 1 AS `Id`,
 1 AS `BranchId`,
 1 AS `ChartAccountId`,
 1 AS `BranchCode`,
 1 AS `Type`,
 1 AS `Location`,
 1 AS `UploadStatus`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`,
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

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
-- Temporary view structure for view `vw_deliveryprice`
--

DROP TABLE IF EXISTS `vw_deliveryprice`;
/*!50001 DROP VIEW IF EXISTS `vw_deliveryprice`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_deliveryprice` AS SELECT 
 1 AS `Id`,
 1 AS `ItemId`,
 1 AS `SizeId`,
 1 AS `Price`,
 1 AS `Item`,
 1 AS `Size`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_devicesetting`
--

DROP TABLE IF EXISTS `vw_devicesetting`;
/*!50001 DROP VIEW IF EXISTS `vw_devicesetting`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_devicesetting` AS SELECT 
 1 AS `Id`,
 1 AS `ScreenNo`,
 1 AS `Terminal`,
 1 AS `DeviceId`,
 1 AS `Device`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_discountcampaign`
--

DROP TABLE IF EXISTS `vw_discountcampaign`;
/*!50001 DROP VIEW IF EXISTS `vw_discountcampaign`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_discountcampaign` AS SELECT 
 1 AS `Id`,
 1 AS `Name`,
 1 AS `Discount`,
 1 AS `StartTime`,
 1 AS `EndTime`,
 1 AS `StartDate`,
 1 AS `EndDate`,
 1 AS `TillDayEnd`,
 1 AS `TypeId`,
 1 AS `Type`,
 1 AS `MenuGroupId`,
 1 AS `Group`,
 1 AS `Monday`,
 1 AS `Tuesday`,
 1 AS `Wednesday`,
 1 AS `Thursday`,
 1 AS `Friday`,
 1 AS `Saturday`,
 1 AS `Sunday`,
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
-- Temporary view structure for view `vw_employeeattendance`
--

DROP TABLE IF EXISTS `vw_employeeattendance`;
/*!50001 DROP VIEW IF EXISTS `vw_employeeattendance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_employeeattendance` AS SELECT 
 1 AS `Id`,
 1 AS `Month`,
 1 AS `Days`,
 1 AS `EmployeeId`,
 1 AS `Employee`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_employeesalary`
--

DROP TABLE IF EXISTS `vw_employeesalary`;
/*!50001 DROP VIEW IF EXISTS `vw_employeesalary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_employeesalary` AS SELECT 
 1 AS `Id`,
 1 AS `Amount`,
 1 AS `Date`,
 1 AS `EmployeeId`,
 1 AS `Employee`,
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
 1 AS `Name`,
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
-- Temporary view structure for view `vw_flavorsize`
--

DROP TABLE IF EXISTS `vw_flavorsize`;
/*!50001 DROP VIEW IF EXISTS `vw_flavorsize`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_flavorsize` AS SELECT 
 1 AS `Id`,
 1 AS `GroupId`,
 1 AS `Group`,
 1 AS `ItemId`,
 1 AS `Item`,
 1 AS `ItemCode`,
 1 AS `KDSId`,
 1 AS `KDS`,
 1 AS `SizeName`,
 1 AS `Price`,
 1 AS `ActualPrice`,
 1 AS `Tax`,
 1 AS `Cost`,
 1 AS `SuggestedPrice`,
 1 AS `CurrentMargin`,
 1 AS `SuggestedMargin`,
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
 1 AS `ParentId`,
 1 AS `ImageName`,
 1 AS `ImageSize`,
 1 AS `Base64FilePath`,
 1 AS `MenuItemId`,
 1 AS `MenuItem`,
 1 AS `DealName`,
 1 AS `IsDealItem`,
 1 AS `TypeId`,
 1 AS `StageQty`,
 1 AS `StageId`,
 1 AS `ItemTypeId`,
 1 AS `ProposedPrice`,
 1 AS `Tax`,
 1 AS `ActualPrice`,
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
-- Temporary view structure for view `vw_itemrecipe`
--

DROP TABLE IF EXISTS `vw_itemrecipe`;
/*!50001 DROP VIEW IF EXISTS `vw_itemrecipe`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_itemrecipe` AS SELECT 
 1 AS `GroupId`,
 1 AS `Group`,
 1 AS `ItemId`,
 1 AS `MenuItem`,
 1 AS `RawItemId`,
 1 AS `RawItem`,
 1 AS `SizeId`,
 1 AS `Size`,
 1 AS `QTY`,
 1 AS `UOM`,
 1 AS `Price`,
 1 AS `Amount`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_kitchenissuance`
--

DROP TABLE IF EXISTS `vw_kitchenissuance`;
/*!50001 DROP VIEW IF EXISTS `vw_kitchenissuance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_kitchenissuance` AS SELECT 
 1 AS `Id`,
 1 AS `BranchId`,
 1 AS `Branch`,
 1 AS `StoreId`,
 1 AS `Store`,
 1 AS `KitchenId`,
 1 AS `Kitchen`,
 1 AS `Date`,
 1 AS `KeyWord`,
 1 AS `DemandNo`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_kotsetting`
--

DROP TABLE IF EXISTS `vw_kotsetting`;
/*!50001 DROP VIEW IF EXISTS `vw_kotsetting`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_kotsetting` AS SELECT 
 1 AS `Id`,
 1 AS `KDSName`,
 1 AS `KitchenBell`,
 1 AS `PrinterId`,
 1 AS `Printer`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_modifier`
--

DROP TABLE IF EXISTS `vw_modifier`;
/*!50001 DROP VIEW IF EXISTS `vw_modifier`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_modifier` AS SELECT 
 1 AS `Id`,
 1 AS `ModifierName`,
 1 AS `Price`,
 1 AS `RawItemId`,
 1 AS `Qty`,
 1 AS `RawItem`,
 1 AS `KDSId`,
 1 AS `KDS`,
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
-- Temporary view structure for view `vw_printersetting`
--

DROP TABLE IF EXISTS `vw_printersetting`;
/*!50001 DROP VIEW IF EXISTS `vw_printersetting`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_printersetting` AS SELECT 
 1 AS `Id`,
 1 AS `PrinterId`,
 1 AS `Printer`,
 1 AS `TypeId`,
 1 AS `Type`,
 1 AS `NoofPrints`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_printtype`
--

DROP TABLE IF EXISTS `vw_printtype`;
/*!50001 DROP VIEW IF EXISTS `vw_printtype`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_printtype` AS SELECT 
 1 AS `Id`,
 1 AS `PrinterId`,
 1 AS `Printer`,
 1 AS `TypeId`,
 1 AS `Terminal`,
 1 AS `Type`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_purchasereturn`
--

DROP TABLE IF EXISTS `vw_purchasereturn`;
/*!50001 DROP VIEW IF EXISTS `vw_purchasereturn`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_purchasereturn` AS SELECT 
 1 AS `Id`,
 1 AS `BranchId`,
 1 AS `SupplierId`,
 1 AS `InvoiceNo`,
 1 AS `ReturnDate`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`,
 1 AS `Branch`,
 1 AS `Supplier`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_purchasereturnline`
--

DROP TABLE IF EXISTS `vw_purchasereturnline`;
/*!50001 DROP VIEW IF EXISTS `vw_purchasereturnline`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_purchasereturnline` AS SELECT 
 1 AS `Id`,
 1 AS `PRId`,
 1 AS `ItemId`,
 1 AS `UOMId`,
 1 AS `Date`,
 1 AS `TotalItems`,
 1 AS `PricePerItem`,
 1 AS `TotalAmt`,
 1 AS `ReturnQty`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`,
 1 AS `UOM`,
 1 AS `Item`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_runtimemodifier`
--

DROP TABLE IF EXISTS `vw_runtimemodifier`;
/*!50001 DROP VIEW IF EXISTS `vw_runtimemodifier`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_runtimemodifier` AS SELECT 
 1 AS `Id`,
 1 AS `MenuItemId`,
 1 AS `RawItemId`,
 1 AS `KDSId`,
 1 AS `KDS2Id`,
 1 AS `TypeId`,
 1 AS `ModifierName`,
 1 AS `Price`,
 1 AS `Qty`,
 1 AS `StageId`,
 1 AS `StageQtyAllowed`,
 1 AS `ImageBase64Path`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`,
 1 AS `RawItem`,
 1 AS `MenuItem`,
 1 AS `Type`,
 1 AS `KDS`,
 1 AS `KDS2`*/;
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
 1 AS `GSTValue`,
 1 AS `DiscountValue`,
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
 1 AS `PaymentMethodId`,
 1 AS `DiscountTypeId`,
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
 1 AS `TypeParentId`,
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
 1 AS `PParentId`,
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
-- Temporary view structure for view `vw_subrecipe`
--

DROP TABLE IF EXISTS `vw_subrecipe`;
/*!50001 DROP VIEW IF EXISTS `vw_subrecipe`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_subrecipe` AS SELECT 
 1 AS `Id`,
 1 AS `GroupId`,
 1 AS `Group`,
 1 AS `SubItemId`,
 1 AS `SubItem`,
 1 AS `FlavorSizeId`,
 1 AS `Size`,
 1 AS `ItemId`,
 1 AS `Item`,
 1 AS `QTY`,
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
 1 AS `FirstName`,
 1 AS `CNIC`,
 1 AS `Address`,
 1 AS `Designation`,
 1 AS `DiscountLimit`,
 1 AS `BranchId`,
 1 AS `Branch`,
 1 AS `FatherName`,
 1 AS `MSCardNo`,
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
/*!50003 DROP PROCEDURE IF EXISTS `GetMaxLineId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxLineId`(IN `prm_TableName` VARCHAR ( 200 ) ,
								IN `prm_HeaderId` int ,
                                IN `prm_ColumnName` varchar(200))
BEGIN
	
	SET @QueryStr = 'SELECT COALESCE(MAX(Id), 0) FROM ';
	SET @QueryStr = CONCAT( @QueryStr, `prm_TableName` , ' where ' ,`prm_ColumnName`, ' = ' ,`prm_HeaderId` );
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageAccountCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageAccountCode`(in id int,
        in accountTypeId int,
        in code varchar(200),
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
    
           insert into chartaccountcode (Id,AccountTypeId,Code, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,accountTypeId,code, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update chartaccountcode set 
                          AccountTypeId=accountTypeId,
                          Code=code,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where chartaccountcode.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from chartaccountcode
			where
			chartaccountcode.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update chartaccountcode set IsActive=1
			where 
			chartaccountcode.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update chartaccountcode set IsActive=0
			where
			chartaccountcode.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageAssignAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageAssignAccount`(in id int,
        in branchId int,
        in accountTypeId int,
        in accountId int,
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
    
           insert into assignaccount (Id,BranchId,AccountTypeId,AccountId, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,branchId,accountTypeId,accountId, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update assignaccount set 
                          BranchId=branchId,
                          AccountTypeId=accountTypeId,
                          AccountId=accountId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where assignaccount.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from assignaccount
			where
			assignaccount.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update assignaccount set IsActive=1
			where 
			assignaccount.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update assignaccount set IsActive=0
			where
			assignaccount.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageAttachSubItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageAttachSubItem`(in id int,
	    in groupId int,
        in itemId int,
		in subItemId int,
        in qty int,
		in modifierId int,
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
           insert into attachsubitem (Id,GroupId,Qty,ItemId,ModifierId,SubItemId,
           CreatedOn, CreatedById,ModifiedOn, ModifiedById, IsActive ) 
           values (id,groupId,qty,itemId,modifierId,subItemId,createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update attachsubitem set 
                          GroupId=groupId,
                          ItemId=itemId,
						  Qty=qty,
                          ModifierId=modifierId,
                          SubItemId=subItemId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where attachsubitem.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from attachsubitem
			where
			attachsubitem.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update attachsubitem set IsActive=1
			where 
			attachsubitem.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update attachsubitem set IsActive=0
			where
			attachsubitem.Id=id; 
        END if;
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
        in branchEnumTypeId int,
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
    
           insert into branch (Id,branchEnumTypeId,Name,BranchCode,Type,Location,UploadStatus,BranchId,ChartAccountId,
           CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,branchEnumTypeId,name,branchCode,type,location,uploadStatus,branchId,chartAccountId,
           createdOn, createdById, modifiedOn,
           modifiedById, isActive );
           
            insert into enumline (Id,KeyCode,IsSystemDefined,UploadStatus,EnumTypeId,ParentId,Name,Description, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (branchEnumTypeId,name,false,uploadStatus,1044,id,name,null, createdOn, createdById, modifiedOn,
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
             update enumline set
              Name=name,
			  KeyCode=name
              where enumline.Id= branchEnumTypeId;
   end if;
   IF DBoperation = 'Delete'
    then
    delete from enumline  where enumline.ParentId=Id ;
            delete from branch
			where
			branch.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update enumline set IsActive=1
			where 
			enumline.ParentId=Id ;
             update branch set IsActive=1
			where 
			branch.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update enumline set IsActive=0
			where 
			enumline.ParentId=Id ;
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageCompanyInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageCompanyInfo`(in id int,
        in phoneNo varchar(200),
        in address varchar(5000),
        in billNote varchar(5000),
        in logoBase64Path longtext,
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
           insert into companyinfo (Id,Name,PhoneNo,Address,BillNote,LogoBase64Path,
           CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,name,phoneNo,address,billNote,logoBase64Path,
           createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update companyinfo set 
                          Name=name,
                          PhoneNo=phoneNo,
                          Address=address,
                          BillNote=billNote,
                          LogoBase64Path=logoBase64Path,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where companyinfo.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from companyinfo
			where
			companyinfo.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update companyinfo set IsActive=1
			where 
			companyinfo.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update companyinfo set IsActive=0
			where
			companyinfo.Id=id;            
        END if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageCompleteWaste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageCompleteWaste`(in id int,
        in groupId int,
        in keyWord varchar(200),
        in date datetime,
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
    
           insert into completewaste (Id,GroupId,KeyWord,Date, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,groupId,keyWord,date, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update completewaste set 
                          GroupId=groupId,
                          KeyWord=keyWord,
                          Date=date,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where completewaste.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from completewaste
			where
			completewaste.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update completewaste set IsActive=1
			where 
			completewaste.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update completewaste set IsActive=0
			where
			completewaste.Id=id; 
           
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageDeliveryPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageDeliveryPrice`(in id int,
	    in itemId int,
        in sizeId int,
		in price float,
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
           insert into deliveryprice (Id,Price,SizeId,ItemId,
           CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,price,sizeId,itemId,
           createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update deliveryprice set 
                          ItemId=itemId,
       SizeId=sizeId,
       Price=price,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where deliveryprice.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from deliveryprice
			where
			deliveryprice.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update recipe set IsActive=1
			where 
			recipe.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update deliveryprice set IsActive=0
			where
			deliveryprice.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageDemand` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageDemand`(in id int,
        in branchId int,
        in itemId int,
        in date datetime,
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
    
           insert into demand (Id,BranchId,ItemId,Date, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,branchId,itemId,date, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update demand set 
                          BranchId=branchId,
                          ItemId=itemId,
                          Date=date,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where demand.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from demand
			where
			demand.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update demand set IsActive=1
			where 
			demand.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update demand set IsActive=0
			where
			demand.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageDeviceSetting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageDeviceSetting`(in id int,
        in deviceId int,
        in screenNo int,
        in terminal varchar(300),
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
    
           insert into devicesetting (Id,DeviceId,ScreenNo,Terminal, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,deviceId,screenNo,terminal, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update devicesetting set 
                          Terminal=terminal,
                          DeviceId=deviceId,
                          ScreenNo=screenNo,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where devicesetting.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from devicesetting
			where
			devicesetting.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update devicesetting set IsActive=1
			where 
			devicesetting.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update devicesetting set IsActive=0
			where
			devicesetting.Id=id; 
           
        END if;
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageDiscountCampaign` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageDiscountCampaign`(in id int,
        in typeId int,
        in menuGroupId int,
		in discount float,
        in name varchar(200),
        in tillDayEnd bit,
        in monday bit,
        in tuesday bit,
        in wednesday bit,
        in thursday bit,
        in friday bit,
        in saturday bit,
        in sunday bit,
		in startTime VARCHAR(200),
		in endTime VARCHAR(200),
        in startDate datetime,
		in endDate datetime,
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
           insert into discountcampaign (Id,MenuGroupId,TypeId,Name,StartTime,EndTime,
           Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday,
           StartDate,EndDate,TillDayEnd,Discount,CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,menuGroupId,typeId,name,startTime,endTime,
           monday,tuesday,wednesday,thursday,friday,saturday,sunday,
           startDate,endDate,tillDayEnd,discount, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update discountcampaign set 
                          MenuGroupId=menuGroupId,
                          Monday=monday,
                          Tuesday=tuesday,
                          Wednesday=wednesday,
                          Thursday=thursday,
                          Friday=friday,
                          Saturday=saturday,
                          Sunday=sunday,
                          Name=name,
                          Discount=discount,
                          StartTime=startTime,
                          EndTime=endTime,
                          StartDate=startDate,
                          EndDate=endDate,
                          TillDayEnd=tillDayEnd,
                          TypeId=typeId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where discountcampaign.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from discountcampaign
			where
			discountcampaign.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update discountcampaign set IsActive=1
			where 
			discountcampaign.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update discountcampaign set IsActive=0
			where
			discountcampaign.Id=id; 
           
        END if;
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageEmployeeAttendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageEmployeeAttendance`(in id int,
	    in employeeId int,
        in days int,
		in month datetime,
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
           insert into employeeattendance (Id,EmployeeId,Days,Month,
           CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,employeeId,days,month,
           createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update employeeattendance set 
                          EmployeeId=employeeId,
                          Days=days,
                          Month=month,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where employeeattendance.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from employeeattendance
			where
			employeeattendance.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update employeeattendance set IsActive=1
			where 
			employeeattendance.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update employeeattendance set IsActive=0
			where
			employeeattendance.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageEmployeeSalary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageEmployeeSalary`(in id int,
        in employeeId int,
        in amount varchar(2000),
        in date datetime,
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
    
           insert into employeesalary (Id,EmployeeId,Amount,Date,
           CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,employeeId,amount,date,
           createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update employeesalary set 
                          EmployeeId=employeeId,
						  Amount=amount,
                          Date=date,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where employeesalary.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from employeesalary
			where
			employeesalary.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update employeesalary set IsActive=1
			where 
			employeesalary.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update employeesalary set IsActive=0
			where
			employeesalary.Id=id; 
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
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageExpenses`(in id int,
        in userId varchar(255),
        in name varchar(500),
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
    
           insert into expenses (Id,Name,UserId,SupplierId,Date,Amount,Terminal,Comments,CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,name,userId,supplierId,date,amount,terminal,comments, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update expenses set 
                          Name=name,
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageExtraFieldData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageExtraFieldData`(in id int,
        in enumLineId int,
        in fieldName varchar(200),
        in fieldValue varchar(200),
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
           insert into extrafielddata (Id,EnumLineId,FieldName,FieldValue,
           CreatedOn, CreatedById,ModifiedOn, ModifiedById, IsActive ) 
           values (id,enumLineId,fieldName,fieldValue,
           createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update extrafielddata set 
                          
                          FieldName=fieldName,
                          FieldValue=fieldValue,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where extrafielddata.Id =id and extrafielddata.EnumLineId=enumLineId;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from extrafielddata
			where extrafielddata.Id =id and extrafielddata.EnumLineId=enumLineId;
        END if;
IF DBoperation = 'Activate'
        then
            update extrafielddata set IsActive=1
			where extrafielddata.Id =id and extrafielddata.EnumLineId=enumLineId;
        END if;
IF DBoperation = 'DeActivate'
        then
            update extrafielddata set IsActive=0
			where extrafielddata.Id =id and extrafielddata.EnumLineId=enumLineId;            
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageFlavorSize` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageFlavorSize`(in id int,
	    in groupId int,
        in itemId int,
		in kdsId int,
        in sizeName varchar(300),
               in price float,
               in actualPrice float,
               in tax float,
               in cost float,
               in suggestedPrice float,
               in currentMargin float,
               in suggestedMargin float,
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
           insert into flavorsize (Id,GroupId,KDSId,ItemId,SizeName,Price,ActualPrice,Tax,Cost,
           SuggestedPrice,CurrentMargin,SuggestedMargin,
           CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,groupId,kdsId,itemId,sizeName,price,actualPrice,tax,cost,
           suggestedPrice,currentMargin,suggestedMargin,
           createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update flavorsize set 
                          GroupId=groupId,
       ItemId=itemId,
       KDSId=kdsId,
       SizeName=sizeName,
       Price=price,
       ActualPrice=actualPrice,
       Tax=tax,
       Cost=cost,
       SuggestedPrice=suggestedPrice,
       CurrentMargin=currentMargin,
       SuggestedMargin=suggestedMargin,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where flavorsize.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from flavorsize
			where
			flavorsize.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update flavorsize set IsActive=1
			where 
			flavorsize.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update flavorsize set IsActive=0
			where
			flavorsize.Id=id; 
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageInventoryTransfer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageInventoryTransfer`(in id int,
        in branchId int,
        in keyWord varchar(200),
        in date datetime,
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
    
           insert into inventorytransfer (Id,BranchId,KeyWord,Date, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,branchId,keyWord,date, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update inventorytransfer set 
                          BranchId=branchId,
                          KeyWord=keyWord,
                          Date=date,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where inventorytransfer.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from inventorytransfer
			where
			inventorytransfer.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update inventorytransfer set IsActive=1
			where 
			inventorytransfer.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update inventorytransfer set IsActive=0
			where
			inventorytransfer.Id=id; 
           
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
		in menuItemId int,
		in makingTime varchar(45),
        in alarmTime varchar(45),
        in totalItemsAllowed int,
		in startDate datetime,
        in currentMargin float,
		in tax float,
		in actualPrice float,
	    in proposedPrice float,
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
        in parentId int,
        in isDealItem bit,
        in typeId int,
        in stageQty int,
        in stageId int,
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
        in price float,
		in itemName varchar(2000),
        in imageName text,
        in imageSize text,
		in base64FilePath longtext,
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
           SizeId,ColorId,FontColorId,Description,FontSize,Tax,ActualPrice,ProposedPrice,
           KDSId2,MakingTime,AlarmTime,TotalItemsAllowed,StartDate,CurrentMargin,
           ParentId,StageId,StageQty,TypeId,IsDealItem,MenuItemId,
           ProposedMargin,BarCode,Target,OptionalModifier,EndDate,ManualQty,
           VendorId,IsCritical,MinOrderLevel,PackingQty,MaxOrderLevel,PackingName,
           CategoryId,SubCategoryId,ItemCode,ItemName,Qty,Price,
           ImageName,ImageSize,Base64FilePath,CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,itemTypeId,groupId,storeId,branchId,brandId,uOMId,kDSId,supplierId,
           sizeId,colorId,fontColorId,description,fontSize,tax,actualPrice,proposedPrice,
           kDSId2,makingTime,alarmTime,totalItemsAllowed,startDate,currentMargin,
            parentId,stageId,stageQty,typeId,isDealItem,menuItemId,
           vendorId,isCritical,minOrderLevel,packingQty,maxOrderLevel,packingName,
           proposedMargin,barCode,target,optionalModifier,endDate,manualQty,
           categoryId,subCategoryId,itemCode,itemName,qty,price,imageName,imageSize,
           base64FilePath,createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update item set 
            ImageName=imageName,
            ImageSize=imageSize,
            Base64FilePath=base64FilePath,
            KDSId2=kDSId2,
			ParentId=parentId,
            StageId=stageId,
            MenuItemId=menuItemId,
            StageQty=stageQty,
            TypeId=typeId,
            IsDealItem=isDealItem,
            Tax=tax,
            ActualPrice=actualPrice,
            ProposedPrice=proposedPrice,
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageItemRecipe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageItemRecipe`(
		in groupId int,
        in itemId int,
	    in rawItemId int,
		in sizeId int,
        in uom varchar(300),
		in qty int,
		in price float,
		in amount float,
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
           insert into itemrecipe (GroupId,ItemId,RawItemId,SizeId,QTY,UOM,
           Price,Amount,CreatedOn, CreatedById,ModifiedOn, ModifiedById, IsActive ) 
           values (groupId,itemId,rawItemId,sizeId,qty,uom,price,amount,
           createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
 if DBoperation ='Update'
 then
            update itemrecipe set 
                          GroupId=groupId,
						  QTY=qty,
                          UOM=uom,
                          Price=price,
                          Amount=amount,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where itemrecipe.ItemId =itemId and 
                   itemrecipe.RawItemId=rawItemId and
                   itemrecipe.SizeId=sizeId;
end if;
IF DBoperation = 'Delete'
    then
            delete from itemrecipe
		    where itemrecipe.ItemId =itemId and 
                   itemrecipe.RawItemId=rawItemId and
                   itemrecipe.SizeId=sizeId;
        END if;
IF DBoperation = 'Activate'
        then
            update itemrecipe set IsActive=1
			 where itemrecipe.ItemId =itemId and 
                   itemrecipe.RawItemId=rawItemId and
                   itemrecipe.SizeId=sizeId;
        END if;
IF DBoperation = 'DeActivate'
        then
            update itemrecipe set IsActive=0
			 where itemrecipe.ItemId =itemId and 
                   itemrecipe.RawItemId=rawItemId and
                   itemrecipe.SizeId=sizeId;
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageKitchenDemand` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageKitchenDemand`(in id int,
	    in categoryId int,
        in kitchenId int,
		in item varchar(200),
        in demandNo int,
		in date datetime,
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
           insert into kitchendemand (Id,CategoryId,KitchenId,Item,DemandNo,Date,
           CreatedOn, CreatedById,ModifiedOn, ModifiedById, IsActive ) 
           values (id,categoryId,kitchenId,item,demandNo,date,createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update kitchendemand set 
                          CategoryId=categoryId,
                          Item=item,
						  KitchenId=kitchenId,
                          DemandNo=demandNo,
                          Date=date,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where kitchendemand.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from kitchendemand
			where
			kitchendemand.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update kitchendemand set IsActive=1
			where 
			kitchendemand.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update kitchendemand set IsActive=0
			where
			kitchendemand.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageKitchenIssuance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageKitchenIssuance`(in id int,
        in storeId int,
        in branchId int,
        in kitchenId int,
        in date datetime,
        in keyword varchar(200),
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
    
           insert into kitchenissuance (Id,StoreId,BranchId,KitchenId,Date,KeyWord, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,storeId,branchId,kitchenId,date,keyWord, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update kitchenissuance set 
						  StoreId=storeId,
                          BranchId=branchId,
                          KitchenId=kitchenId,
                          Date=date,
                          KeyWord=keyWord,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where kitchenissuance.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from kitchenissuance
			where
			kitchenissuance.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update kitchenissuance set IsActive=1
			where 
			kitchenissuance.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update kitchenissuance set IsActive=0
			where
			kitchenissuance.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageKOTSetting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageKOTSetting`(in id int,
        in kDSName varchar(300),
        in printerId int,
        in kitchenBell bit,
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
    
           insert into kotsetting (Id,PrinterId,KDSName,KitchenBell, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,printerId,kDSName,kitchenBell, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update kotsetting set 
                          KDSName=kDSName,
                          PrinterId=printerId,
                          KitchenBell=kitchenBell,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where kotsetting.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from kotsetting
			where
			kotsetting.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update kotsetting set IsActive=1
			where 
			kotsetting.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update kotsetting set IsActive=0
			where
			kotsetting.Id=id; 
           
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageModifier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageModifier`(in id int,
        in qty int,
        in price float,
        in kDSId int,
        in rawItemId int,
        in modifierName varchar(200),
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
           insert into modifier (Id,modifierName,rawItemId,kDSId,price,qty,
           CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,modifierName,rawItemId,kDSId,price,qty,
           createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update modifier set 
                          modifierName=modifierName,
                          rawItemId=rawItemId,
                          kDSId=kDSId,
                          price=price,
                          qty=qty,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where modifier.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from modifier
			where
			modifier.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update modifier set IsActive=1
			where 
			modifier.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update modifier set IsActive=0
			where
			modifier.Id=id; 
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
        in name varchar(45),
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
/*!50003 DROP PROCEDURE IF EXISTS `ManagePrinterSetting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManagePrinterSetting`(in id int,
        in printerId int,
        in typeId int,
        in noofPrints int,
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
    
           insert into printersetting (Id,PrinterId,TypeId,NoofPrints, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,printerId,typeId,noofPrints, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update printersetting set 
                          NoofPrints=noofPrints,
                          PrinterId=printerId,
                          TypeId=typeId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where printersetting.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from printersetting
			where
			printersetting.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update printersetting set IsActive=1
			where 
			printersetting.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update printersetting set IsActive=0
			where
			printersetting.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManagePrintType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManagePrintType`(in id int,
        in printerId int,
        in typeId int,
        in terminal varchar(300),
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
    
           insert into printtype (Id,PrinterId,TypeId,Terminal, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,printerId,typeId,terminal, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update printtype set 
                          Terminal=terminal,
                          PrinterId=printerId,
                          TypeId=typeId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where printtype.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from printtype
			where
			printtype.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update printtype set IsActive=1
			where 
			printtype.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update printtype set IsActive=0
			where
			printtype.Id=id; 
           
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManagePRLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManagePRLine`(in id int,
        in pRId int,
		in itemId int,
		in uOMId int,
        in totalItems int,
		in pricePerItem decimal,
		in totalAmt int,
		in returnQty int,
        in date datetime,
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
           insert into purchasereturnline (Id,PRId,ItemId,UOMId,TotalItems,PricePerItem,
           TotalAmt,ReturnQty,CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive ) 
           values 
           (id,pRId,itemId,uOMId,totalItems,pricePerItem,totalAmt,returnQty,
           createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
 if DBoperation ='Update'
       then     
          update purchasereturnline set  
                          ItemId=itemId,
                          UOMId=uOMId,
                          TotalItems=totalItems,
                          PricePerItem=pricePerItem,
                          TotalAmt=totalAmt,
                          ReturnQty=returnQty,
                          CreatedOn = createdOn,
                          CreatedById =createdById,
                          ModifiedOn = modifiedOn,
                          ModifiedById = modifiedById ,
						  IsActive = isActive 				 
             where purchasereturnline.Id =id and purchasereturnline.PRId=pRId;
      end if;
IF DBoperation = 'Delete'
       then
            delete from purchasereturnline
			 where purchasereturnline.Id =id and purchasereturnline.PRId=pRId;
        END if;
IF DBoperation = 'Activate'
        then
            update purchasereturnline set IsActive=1
			 where purchasereturnline.Id =id and purchasereturnline.PRId=pRId;
        END if;
IF DBoperation = 'DeActivate'
        then
            update purchasereturnline set IsActive=0
			 where purchasereturnline.Id =id and purchasereturnline.PRId=pRId;
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManagePurchaseReturn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManagePurchaseReturn`(in id int,
        in branchId int,
        in supplierId int,
		in invoiceNo int,
        in returnDate datetime,
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
    
           insert into purchasereturn (Id,BranchId,SupplierId,InvoiceNo,ReturnDate, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,branchId,supplierId,invoiceNo,returnDate, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update purchasereturn set 
                          BranchId=branchId,
                          SupplierId=supplierId,
                          InvoiceNo=invoiceNo,
                          ReturnDate=returnDate,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where purchasereturn.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
     delete from purchasereturnline
			where
			purchasereturnline.PRId=id ; 
            delete from purchasereturn
			where
			purchasereturn.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update purchasereturn set IsActive=1
			where 
			purchasereturn.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update purchasereturn set IsActive=0
			where
			purchasereturn.Id=id; 
           
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageRuntimeModifier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageRuntimeModifier`(in id int,
        in menuItemId int,
        in rawItemId int,
		in kDSId int,
		in kDS2Id int,
        in typeId int,
		in modifierName varchar(200),
        in price float,
        in qty int,
        in stageId int,
        in stageQtyAllowed int,
        in imageBase64Path longtext,
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
           insert into runtimemodifier (Id,MenuItemId,RawItemId,KDSId,KDS2Id,TypeId,ModifierName,
           Price,Qty,StageId,StageQtyAllowed,ImageBase64Path, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,menuItemId,rawItemId,kDSId,kDS2Id,typeId,modifierName,price,qty,
           stageId,stageQtyAllowed,imageBase64Path,createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update runtimemodifier set 
                          MenuItemId=menuItemId,
                          RawItemId=rawItemId,
                          KDSId=kDSId,
                          KDS2Id=kDS2Id,
                          TypeId=typeId,
                          ModifierName=modifierName,
                          Price=price,
                          Qty=qty,
                          StageId=stageId,
                          StageQtyAllowed=stageQtyAllowed,
                          ImageBase64Path=imageBase64Path,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where runtimemodifier.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from runtimemodifier
			where
			runtimemodifier.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update runtimemodifier set IsActive=1
			where 
			runtimemodifier.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update runtimemodifier set IsActive=0
			where
			runtimemodifier.Id=id;              
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
        in total float,
        in discount float,
         in gSTValue float,
          in discountValue float,
        in gST float,
        in statusId int,
		in service float,
        in netTotal float,
        in paymentMethodId int,
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
           BillTitle,RiderId,ShiftId,DiscountTypeId,GSTValue,DiscountValue,
           RestaurantId,Guest,PhoneNo,Name,Address,Note,SourceId,DispatchedTime,DeliveryTime,
           Total,Discount,GST,StatusId,Service,NetTotal,PaymentMethodId ,CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,orderTypeId,customerId,tableNo,waiterId,
           billTitle,riderId,shiftId,discountTypeId,gSTValue,discountValue,
           restaurantId,guest,
           phoneNo,name,address,note,sourceId,dispatchedTime,deliveryTime,
           total,discount,gST,statusId,service,netTotal,paymentMethodId, createdOn, createdById, modifiedOn,
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
            GSTValue=gSTValue,
            DiscountValue=discountValue,
                          Total=total,
                          Discount=discount,
                          GST=gST,
                          StatusId=statusId,
                          Service=service,
                          NetTotal=netTotal,
                 PaymentMethodId=paymentMethodId,
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
        in price float,
		in lineTotal float,
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
    delete from extrafielddata where extrafielddata.EnumLineId=id;
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageStockEstimation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageStockEstimation`(in id int,
	    in groupId int,
        in item varchar(200),
		in date datetime,
		in orderNo int,
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
           insert into stockestimation (Id,GroupId,Item,Date,orderNo,
           CreatedOn, CreatedById,ModifiedOn, ModifiedById, IsActive ) 
           values (id,groupId,item,date,orderNo,createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update stockestimation set 
                          GroupId=groupId,
                          Item=item,
						  Date=date,
                          orderNo=orderNo,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where stockestimation.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from stockestimation
			where
			stockestimation.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update stockestimation set IsActive=1
			where 
			stockestimation.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update stockestimation set IsActive=0
			where
			stockestimation.Id=id; 
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageSubItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageSubItem`(in id int,
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
    
           insert into subitem (Id,Name, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive ) 
           values 
           (id,name, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
     
          update subitem set  
						  Name= name,
                          CreatedOn = createdOn,
                          CreatedById =createdById,
                          ModifiedOn = modifiedOn,
                          ModifiedById = modifiedById ,
						  IsActive = isActive 				 
             where subitem.Id =id;
      end if;
      IF DBoperation = 'Delete'
    then
            delete from subitem
			where
			subitem.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update subitem set IsActive=1
			where 
			subitem.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update subitem set IsActive=0
			where
			subitem.Id=id; 
        END if;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageSubRecipe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageSubRecipe`(in id int,
        in groupId int,
        in subItemId int,
        in flavorSizeId int,
        in itemId int,
        in qty int,
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
           insert into subrecipe (Id,GroupId,SubItemId,FlavorSizeId,ItemId,QTY, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,groupId,subItemId,flavorSizeId,itemId,qty, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
 if DBoperation ='Update'
 then
            update subrecipe set 
                          GroupId=groupId,
                          SubItemId=subItemId,
                          FlavorSizeId=flavorSizeId,
                          ItemId=itemId,
                          QTY=qty,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where subrecipe.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from subrecipe
			where
			subrecipe.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update subrecipe set IsActive=1
			where 
			subrecipe.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update subrecipe set IsActive=0
			where
			subrecipe.Id=id;            
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchAccountCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAccountCode`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_accountcode`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchAssignAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAssignAccount`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`ve_assignaccount`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchAttachSubItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAttachSubItem`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_attachsubitem`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchCompanyInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCompanyInfo`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			companyinfo  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchCompleteWaste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCompleteWaste`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`completewaste`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchDeliveryPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchDeliveryPrice`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_deliveryprice`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchDemand` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchDemand`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`demand`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchDeviceSetting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchDeviceSetting`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_devicesetting`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchDiscountCampaign` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchDiscountCampaign`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_discountcampaign`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchEmployeeAttendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchEmployeeAttendance`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_employeeattendance`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchEmployeeSalary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchEmployeeSalary`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			vw_employeesalary  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchExtraFieldData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchExtraFieldData`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`extrafielddata`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchFlavorSize` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchFlavorSize`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_flavorsize`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchInventoryTransfer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchInventoryTransfer`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`inventorytransfer`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchItemRecipe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchItemRecipe`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_itemrecipe`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchKitchenDemand` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchKitchenDemand`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`kitchendemand`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchKitchenissuance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchKitchenissuance`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_kitchenissuance`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchKOTSetting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchKOTSetting`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_kotsetting`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchModifier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchModifier`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			vw_modifier  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchPrinterSetting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchPrinterSetting`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_printersetting`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchPrintType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchPrintType`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_printtype`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchPurchaseReturn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchPurchaseReturn`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_purchasereturn`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchPurchaseReturnLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchPurchaseReturnLine`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_purchasereturnline`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchRuntimeModifier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchRuntimeModifier`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_runtimemodifier`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchStockEstimation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchStockEstimation`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`stockestimation`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchSubItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSubItem`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`subitem`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchSubRecipe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSubRecipe`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			vw_subrecipe  ';
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
-- Final view structure for view `vw_accountcode`
--

/*!50001 DROP VIEW IF EXISTS `vw_accountcode`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_accountcode` AS select `code`.`Id` AS `Id`,`code`.`Code` AS `code`,`code`.`AccountTypeId` AS `AccountTypeId`,`line`.`Name` AS `AccountType`,`code`.`CreatedOn` AS `CreatedOn`,`code`.`CreatedById` AS `CreatedById`,`code`.`ModifiedOn` AS `ModifiedOn`,`code`.`ModifiedById` AS `ModifiedById`,`code`.`IsActive` AS `IsActive` from (`chartaccountcode` `code` join `enumline` `line` on((`line`.`Id` = `code`.`AccountTypeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_assignaccount`
--

/*!50001 DROP VIEW IF EXISTS `vw_assignaccount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_assignaccount` AS select `assignaccount`.`Id` AS `Id`,`assignaccount`.`AccountId` AS `AccountId`,`account`.`Name` AS `Account`,`assignaccount`.`AccountTypeId` AS `AccountTypeId`,`line`.`Name` AS `AccountType`,`assignaccount`.`BranchId` AS `BranchId`,`branch`.`Name` AS `Branch`,`assignaccount`.`CreatedOn` AS `CreatedOn`,`assignaccount`.`CreatedById` AS `CreatedById`,`assignaccount`.`ModifiedOn` AS `ModifiedOn`,`assignaccount`.`ModifiedById` AS `ModifiedById`,`assignaccount`.`IsActive` AS `IsActive` from (((`assignaccount` join `enumline` `line` on((`line`.`Id` = `assignaccount`.`AccountTypeId`))) join `enumline` `account` on((`account`.`Id` = `assignaccount`.`AccountId`))) join `branch` on((`branch`.`Id` = `assignaccount`.`BranchId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_attachsubitem`
--

/*!50001 DROP VIEW IF EXISTS `vw_attachsubitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_attachsubitem` AS select `attachsubitem`.`Id` AS `Id`,`attachsubitem`.`GroupId` AS `GroupId`,`attachsubitem`.`ItemId` AS `ItemId`,`attachsubitem`.`SubItemId` AS `SubItemId`,`attachsubitem`.`ModifierId` AS `ModifierId`,`attachsubitem`.`Qty` AS `Qty`,`group`.`Name` AS `Group`,`subitem`.`Name` AS `SubItem`,`item`.`ItemName` AS `Item`,`modifier`.`ItemName` AS `Modifier`,`attachsubitem`.`CreatedOn` AS `CreatedOn`,`attachsubitem`.`CreatedById` AS `CreatedById`,`attachsubitem`.`ModifiedOn` AS `ModifiedOn`,`attachsubitem`.`ModifiedById` AS `ModifiedById`,`attachsubitem`.`IsActive` AS `IsActive` from ((((`attachsubitem` left join `enumline` `group` on((`group`.`Id` = `attachsubitem`.`GroupId`))) left join `enumline` `subitem` on((`subitem`.`Id` = `attachsubitem`.`SubItemId`))) left join `item` on((`item`.`Id` = `attachsubitem`.`ItemId`))) left join `item` `modifier` on((`modifier`.`Id` = `attachsubitem`.`ModifierId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_branch`
--

/*!50001 DROP VIEW IF EXISTS `vw_branch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_branch` AS select `branch`.`Id` AS `Id`,`branch`.`BranchId` AS `BranchId`,`branch`.`ChartAccountId` AS `ChartAccountId`,`branch`.`BranchCode` AS `BranchCode`,`branch`.`Type` AS `Type`,`branch`.`Location` AS `Location`,`branch`.`UploadStatus` AS `UploadStatus`,`branch`.`CreatedOn` AS `CreatedOn`,`branch`.`CreatedById` AS `CreatedById`,`branch`.`ModifiedOn` AS `ModifiedOn`,`branch`.`ModifiedById` AS `ModifiedById`,`branch`.`IsActive` AS `IsActive`,`enumline`.`Name` AS `Name` from ((`branch` left join `branch` `branch2` on((`branch2`.`Id` = `branch`.`BranchId`))) left join `enumline` on((`enumline`.`Id` = `branch`.`Id`))) */;
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
-- Final view structure for view `vw_deliveryprice`
--

/*!50001 DROP VIEW IF EXISTS `vw_deliveryprice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_deliveryprice` AS select `dprice`.`Id` AS `Id`,`dprice`.`ItemId` AS `ItemId`,`dprice`.`SizeId` AS `SizeId`,`dprice`.`Price` AS `Price`,`item`.`ItemName` AS `Item`,`size`.`SizeName` AS `Size`,`dprice`.`CreatedOn` AS `CreatedOn`,`dprice`.`CreatedById` AS `CreatedById`,`dprice`.`ModifiedOn` AS `ModifiedOn`,`dprice`.`ModifiedById` AS `ModifiedById`,`dprice`.`IsActive` AS `IsActive` from ((`deliveryprice` `dprice` join `item` on((`item`.`Id` = `dprice`.`ItemId`))) left join `flavorsize` `size` on((`size`.`Id` = `dprice`.`SizeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_devicesetting`
--

/*!50001 DROP VIEW IF EXISTS `vw_devicesetting`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_devicesetting` AS select `devicesetting`.`Id` AS `Id`,`devicesetting`.`ScreenNo` AS `ScreenNo`,`devicesetting`.`Terminal` AS `Terminal`,`devicesetting`.`DeviceId` AS `DeviceId`,`line`.`Name` AS `Device`,`devicesetting`.`CreatedOn` AS `CreatedOn`,`devicesetting`.`CreatedById` AS `CreatedById`,`devicesetting`.`ModifiedOn` AS `ModifiedOn`,`devicesetting`.`ModifiedById` AS `ModifiedById`,`devicesetting`.`IsActive` AS `IsActive` from (`devicesetting` join `enumline` `line` on((`line`.`Id` = `devicesetting`.`DeviceId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_discountcampaign`
--

/*!50001 DROP VIEW IF EXISTS `vw_discountcampaign`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_discountcampaign` AS select `discountcampaign`.`Id` AS `Id`,`discountcampaign`.`Name` AS `Name`,`discountcampaign`.`Discount` AS `Discount`,`discountcampaign`.`StartTime` AS `StartTime`,`discountcampaign`.`EndTime` AS `EndTime`,`discountcampaign`.`StartDate` AS `StartDate`,`discountcampaign`.`EndDate` AS `EndDate`,`discountcampaign`.`TillDayEnd` AS `TillDayEnd`,`discountcampaign`.`TypeId` AS `TypeId`,`type`.`Name` AS `Type`,`discountcampaign`.`MenuGroupId` AS `MenuGroupId`,`group`.`Name` AS `Group`,`discountcampaign`.`Monday` AS `Monday`,`discountcampaign`.`Tuesday` AS `Tuesday`,`discountcampaign`.`Wednesday` AS `Wednesday`,`discountcampaign`.`Thursday` AS `Thursday`,`discountcampaign`.`Friday` AS `Friday`,`discountcampaign`.`Saturday` AS `Saturday`,`discountcampaign`.`Sunday` AS `Sunday`,`discountcampaign`.`CreatedOn` AS `CreatedOn`,`discountcampaign`.`CreatedById` AS `CreatedById`,`discountcampaign`.`ModifiedOn` AS `ModifiedOn`,`discountcampaign`.`ModifiedById` AS `ModifiedById`,`discountcampaign`.`IsActive` AS `IsActive` from ((`discountcampaign` left join `enumline` `type` on((`type`.`Id` = `discountcampaign`.`TypeId`))) left join `enumline` `group` on((`group`.`Id` = `discountcampaign`.`MenuGroupId`))) */;
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
-- Final view structure for view `vw_employeeattendance`
--

/*!50001 DROP VIEW IF EXISTS `vw_employeeattendance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employeeattendance` AS select `employeeattendance`.`Id` AS `Id`,`employeeattendance`.`Month` AS `Month`,`employeeattendance`.`Days` AS `Days`,`employeeattendance`.`EmployeeId` AS `EmployeeId`,`employee`.`Name` AS `Employee`,`employeeattendance`.`CreatedOn` AS `CreatedOn`,`employeeattendance`.`CreatedById` AS `CreatedById`,`employeeattendance`.`ModifiedOn` AS `ModifiedOn`,`employeeattendance`.`ModifiedById` AS `ModifiedById`,`employeeattendance`.`IsActive` AS `IsActive` from (`employeeattendance` join `employee` on((`employee`.`Id` = `employeeattendance`.`EmployeeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_employeesalary`
--

/*!50001 DROP VIEW IF EXISTS `vw_employeesalary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employeesalary` AS select `eslry`.`Id` AS `Id`,`eslry`.`Amount` AS `Amount`,`eslry`.`Date` AS `Date`,`eslry`.`EmployeeId` AS `EmployeeId`,`emp`.`Name` AS `Employee`,`eslry`.`CreatedOn` AS `CreatedOn`,`eslry`.`CreatedById` AS `CreatedById`,`eslry`.`ModifiedOn` AS `ModifiedOn`,`eslry`.`ModifiedById` AS `ModifiedById`,`eslry`.`IsActive` AS `IsActive` from (`employeesalary` `eslry` join `employee` `emp` on((`emp`.`Id` = `eslry`.`EmployeeId`))) */;
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
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_expense` AS select `expenses`.`Id` AS `Id`,`expenses`.`Name` AS `Name`,`expenses`.`UserId` AS `UserId`,`user`.`Name` AS `UserName`,`expenses`.`SupplierId` AS `SupplierId`,`supplier`.`Name` AS `SupplierName`,`expenses`.`Date` AS `Date`,`expenses`.`Terminal` AS `Terminal`,`expenses`.`Amount` AS `Amount`,`expenses`.`Comments` AS `Comments`,`expenses`.`CreatedOn` AS `CreatedOn`,`expenses`.`CreatedById` AS `CreatedById`,`expenses`.`ModifiedOn` AS `ModifiedOn`,`expenses`.`ModifiedById` AS `ModifiedById`,`expenses`.`IsActive` AS `IsActive` from ((`expenses` left join `aspnetusers` `user` on((`user`.`Id` = `expenses`.`UserId`))) left join `supplier` on((`supplier`.`Id` = `expenses`.`SupplierId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_flavorsize`
--

/*!50001 DROP VIEW IF EXISTS `vw_flavorsize`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_flavorsize` AS select `size`.`Id` AS `Id`,`size`.`GroupId` AS `GroupId`,`group`.`Name` AS `Group`,`size`.`ItemId` AS `ItemId`,`item`.`ItemName` AS `Item`,`item`.`ItemCode` AS `ItemCode`,`size`.`KDSId` AS `KDSId`,`kds`.`Name` AS `KDS`,`size`.`SizeName` AS `SizeName`,`size`.`Price` AS `Price`,`size`.`ActualPrice` AS `ActualPrice`,`size`.`Tax` AS `Tax`,`size`.`Cost` AS `Cost`,`size`.`SuggestedPrice` AS `SuggestedPrice`,`size`.`CurrentMargin` AS `CurrentMargin`,`size`.`SuggestedMargin` AS `SuggestedMargin`,`size`.`CreatedOn` AS `CreatedOn`,`size`.`CreatedById` AS `CreatedById`,`size`.`ModifiedOn` AS `ModifiedOn`,`size`.`ModifiedById` AS `ModifiedById`,`size`.`IsActive` AS `IsActive` from (((`flavorsize` `size` join `enumline` `group` on((`group`.`Id` = `size`.`GroupId`))) left join `enumline` `kds` on((`kds`.`Id` = `size`.`KDSId`))) join `item` on((`item`.`Id` = `size`.`ItemId`))) */;
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
/*!50001 VIEW `vw_item` AS select `item`.`Id` AS `Id`,`item`.`ParentId` AS `ParentId`,`item`.`ImageName` AS `ImageName`,`item`.`ImageSize` AS `ImageSize`,`item`.`Base64FilePath` AS `Base64FilePath`,`item`.`MenuItemId` AS `MenuItemId`,`menuitem`.`ItemName` AS `MenuItem`,`dealitem`.`ItemName` AS `DealName`,`item`.`IsDealItem` AS `IsDealItem`,`item`.`TypeId` AS `TypeId`,`item`.`StageQty` AS `StageQty`,`item`.`StageId` AS `StageId`,`item`.`ItemTypeId` AS `ItemTypeId`,`item`.`ProposedPrice` AS `ProposedPrice`,`item`.`Tax` AS `Tax`,`item`.`ActualPrice` AS `ActualPrice`,`itemtype`.`Name` AS `ItemType`,`item`.`GroupId` AS `GroupId`,`item`.`Description` AS `Description`,`group`.`Name` AS `Group`,`item`.`CategoryId` AS `CategoryId`,`category`.`Name` AS `Category`,`item`.`SubCategoryId` AS `SubCategoryId`,`subcategory`.`Name` AS `SubCategory`,`item`.`KDSId` AS `KDSId`,`kds`.`Name` AS `KDS`,`item`.`UOMId` AS `UOMId`,`uom`.`Name` AS `UOM`,`item`.`StoreId` AS `StoreId`,`store`.`StoreName` AS `Store`,`item`.`SizeId` AS `SizeId`,`size`.`SizeName` AS `Size`,`item`.`ColorId` AS `ColorId`,`color`.`Name` AS `Color`,`item`.`FontColorId` AS `FontColorId`,`fontcolor`.`Name` AS `FontColor`,`item`.`BranchId` AS `BranchId`,`branch`.`Name` AS `Branch`,`item`.`BrandId` AS `BrandId`,`brand`.`Name` AS `Brand`,`item`.`SupplierId` AS `SupplierId`,`supplier`.`Name` AS `Supplier`,`item`.`ItemName` AS `ItemName`,`item`.`ItemCode` AS `ItemCode`,`item`.`FontSize` AS `FontSize`,`item`.`Price` AS `Price`,`item`.`Qty` AS `QTY`,`item`.`KDSId2` AS `KDSId2`,`kds2`.`Name` AS `KDS2`,`item`.`MakingTime` AS `MakingTime`,`item`.`AlarmTime` AS `AlarmTime`,`item`.`TotalItemsAllowed` AS `TotalItemsAllowed`,`item`.`StartDate` AS `StartDate`,`item`.`ProposedMargin` AS `ProposedMargin`,`item`.`BarCode` AS `BarCode`,`item`.`Target` AS `Target`,`item`.`OptionalModifier` AS `OptionalModifier`,`item`.`EndDate` AS `EndDate`,`item`.`ManualQty` AS `ManualQty`,`item`.`VendorId` AS `VendorId`,`item`.`IsCritical` AS `IsCritical`,`item`.`MinOrderLevel` AS `MinOrderLevel`,`item`.`PackingQty` AS `PackingQty`,`item`.`MaxOrderLevel` AS `MaxOrderLevel`,`item`.`PackingName` AS `PackingName`,`item`.`CurrentMargin` AS `CurrentMargin`,`item`.`Description` AS `Address`,`item`.`CreatedOn` AS `CreatedOn`,`item`.`CreatedById` AS `CreatedById`,`item`.`ModifiedOn` AS `ModifiedOn`,`item`.`ModifiedById` AS `ModifiedById`,`item`.`IsActive` AS `IsActive` from ((((((((((((((((`item` left join `enumline` `itemtype` on((`itemtype`.`Id` = `item`.`ItemTypeId`))) left join `item` `dealitem` on((`dealitem`.`Id` = `item`.`ParentId`))) left join `item` `menuitem` on((`menuitem`.`Id` = `item`.`MenuItemId`))) left join `enumline` `kds2` on((`kds2`.`Id` = `item`.`KDSId2`))) left join `enumline` `group` on((`group`.`Id` = `item`.`GroupId`))) left join `enumline` `category` on((`category`.`Id` = `item`.`CategoryId`))) left join `enumline` `subcategory` on((`subcategory`.`Id` = `item`.`SubCategoryId`))) left join `store` on((`store`.`Id` = `item`.`StoreId`))) left join `enumline` `color` on((`color`.`Id` = `item`.`ColorId`))) left join `enumline` `fontcolor` on((`fontcolor`.`Id` = `item`.`FontColorId`))) left join `flavorsize` `size` on((`size`.`Id` = `item`.`SizeId`))) left join `enumline` `kds` on((`kds`.`Id` = `item`.`KDSId`))) left join `enumline` `uom` on((`uom`.`Id` = `item`.`UOMId`))) left join `supplier` on((`supplier`.`Id` = `item`.`SupplierId`))) left join `branch` on((`branch`.`Id` = `item`.`BranchId`))) left join `enumline` `brand` on((`brand`.`Id` = `item`.`BrandId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_itemrecipe`
--

/*!50001 DROP VIEW IF EXISTS `vw_itemrecipe`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_itemrecipe` AS select `recipe`.`GroupId` AS `GroupId`,`group`.`Name` AS `Group`,`recipe`.`ItemId` AS `ItemId`,`item`.`ItemName` AS `MenuItem`,`recipe`.`RawItemId` AS `RawItemId`,`rawitem`.`ItemName` AS `RawItem`,`recipe`.`SizeId` AS `SizeId`,`size`.`SizeName` AS `Size`,`recipe`.`QTY` AS `QTY`,`recipe`.`UOM` AS `UOM`,`recipe`.`Price` AS `Price`,`recipe`.`Amount` AS `Amount`,`recipe`.`CreatedOn` AS `CreatedOn`,`recipe`.`CreatedById` AS `CreatedById`,`recipe`.`ModifiedOn` AS `ModifiedOn`,`recipe`.`ModifiedById` AS `ModifiedById`,`recipe`.`IsActive` AS `IsActive` from ((((`itemrecipe` `recipe` join `enumline` `group` on((`group`.`Id` = `recipe`.`GroupId`))) join `item` on((`item`.`Id` = `recipe`.`ItemId`))) join `item` `rawitem` on((`rawitem`.`Id` = `recipe`.`RawItemId`))) left join `flavorsize` `size` on((`size`.`Id` = `recipe`.`SizeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_kitchenissuance`
--

/*!50001 DROP VIEW IF EXISTS `vw_kitchenissuance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_kitchenissuance` AS select `kitchenissuance`.`Id` AS `Id`,`kitchenissuance`.`BranchId` AS `BranchId`,`branch`.`Name` AS `Branch`,`kitchenissuance`.`StoreId` AS `StoreId`,`store`.`StoreName` AS `Store`,`kitchenissuance`.`KitchenId` AS `KitchenId`,`kitchen`.`Name` AS `Kitchen`,`kitchenissuance`.`Date` AS `Date`,`kitchenissuance`.`KeyWord` AS `KeyWord`,`kitchenissuance`.`DemandNo` AS `DemandNo`,`kitchenissuance`.`CreatedOn` AS `CreatedOn`,`kitchenissuance`.`CreatedById` AS `CreatedById`,`kitchenissuance`.`ModifiedOn` AS `ModifiedOn`,`kitchenissuance`.`ModifiedById` AS `ModifiedById`,`kitchenissuance`.`IsActive` AS `IsActive` from (((`kitchenissuance` left join `branch` on((`branch`.`Id` = `kitchenissuance`.`BranchId`))) left join `store` on((`store`.`Id` = `kitchenissuance`.`StoreId`))) left join `enumline` `kitchen` on((`kitchen`.`Id` = `kitchenissuance`.`KitchenId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_kotsetting`
--

/*!50001 DROP VIEW IF EXISTS `vw_kotsetting`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_kotsetting` AS select `kotsetting`.`Id` AS `Id`,`kotsetting`.`KDSName` AS `KDSName`,`kotsetting`.`KitchenBell` AS `KitchenBell`,`kotsetting`.`PrinterId` AS `PrinterId`,`line`.`Name` AS `Printer`,`kotsetting`.`CreatedOn` AS `CreatedOn`,`kotsetting`.`CreatedById` AS `CreatedById`,`kotsetting`.`ModifiedOn` AS `ModifiedOn`,`kotsetting`.`ModifiedById` AS `ModifiedById`,`kotsetting`.`IsActive` AS `IsActive` from (`kotsetting` join `enumline` `line` on((`line`.`Id` = `kotsetting`.`PrinterId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_modifier`
--

/*!50001 DROP VIEW IF EXISTS `vw_modifier`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_modifier` AS select `modifier`.`Id` AS `Id`,`modifier`.`ModifierName` AS `ModifierName`,`modifier`.`Price` AS `Price`,`modifier`.`RawItemId` AS `RawItemId`,`modifier`.`Qty` AS `Qty`,`item`.`ItemName` AS `RawItem`,`modifier`.`KDSId` AS `KDSId`,`kds`.`Name` AS `KDS`,`modifier`.`CreatedOn` AS `CreatedOn`,`modifier`.`CreatedById` AS `CreatedById`,`modifier`.`ModifiedOn` AS `ModifiedOn`,`modifier`.`ModifiedById` AS `ModifiedById`,`modifier`.`IsActive` AS `IsActive` from ((`modifier` join `enumline` `kds` on((`kds`.`Id` = `modifier`.`KDSId`))) join `item` on((`item`.`Id` = `modifier`.`RawItemId`))) */;
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
-- Final view structure for view `vw_printersetting`
--

/*!50001 DROP VIEW IF EXISTS `vw_printersetting`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_printersetting` AS select `printersetting`.`Id` AS `Id`,`printersetting`.`PrinterId` AS `PrinterId`,`printerline`.`Name` AS `Printer`,`printersetting`.`TypeId` AS `TypeId`,`line`.`Name` AS `Type`,`printersetting`.`NoofPrints` AS `NoofPrints`,`printersetting`.`CreatedOn` AS `CreatedOn`,`printersetting`.`CreatedById` AS `CreatedById`,`printersetting`.`ModifiedOn` AS `ModifiedOn`,`printersetting`.`ModifiedById` AS `ModifiedById`,`printersetting`.`IsActive` AS `IsActive` from ((`printersetting` join `enumline` `line` on((`line`.`Id` = `printersetting`.`TypeId`))) join `enumline` `printerline` on((`printerline`.`Id` = `printersetting`.`PrinterId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_printtype`
--

/*!50001 DROP VIEW IF EXISTS `vw_printtype`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_printtype` AS select `printtype`.`Id` AS `Id`,`printtype`.`PrinterId` AS `PrinterId`,`printerline`.`Name` AS `Printer`,`printtype`.`TypeId` AS `TypeId`,`printtype`.`Terminal` AS `Terminal`,`line`.`Name` AS `Type`,`printtype`.`CreatedOn` AS `CreatedOn`,`printtype`.`CreatedById` AS `CreatedById`,`printtype`.`ModifiedOn` AS `ModifiedOn`,`printtype`.`ModifiedById` AS `ModifiedById`,`printtype`.`IsActive` AS `IsActive` from ((`printtype` join `enumline` `line` on((`line`.`Id` = `printtype`.`TypeId`))) join `enumline` `printerline` on((`printerline`.`Id` = `printtype`.`PrinterId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_purchasereturn`
--

/*!50001 DROP VIEW IF EXISTS `vw_purchasereturn`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_purchasereturn` AS select `preturn`.`Id` AS `Id`,`preturn`.`BranchId` AS `BranchId`,`preturn`.`SupplierId` AS `SupplierId`,`preturn`.`InvoiceNo` AS `InvoiceNo`,`preturn`.`ReturnDate` AS `ReturnDate`,`preturn`.`CreatedOn` AS `CreatedOn`,`preturn`.`CreatedById` AS `CreatedById`,`preturn`.`ModifiedOn` AS `ModifiedOn`,`preturn`.`ModifiedById` AS `ModifiedById`,`preturn`.`IsActive` AS `IsActive`,`branch`.`Name` AS `Branch`,`supplier`.`Name` AS `Supplier` from ((`purchasereturn` `preturn` left join `branch` on((`branch`.`Id` = `preturn`.`BranchId`))) left join `supplier` on((`supplier`.`Id` = `preturn`.`SupplierId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_purchasereturnline`
--

/*!50001 DROP VIEW IF EXISTS `vw_purchasereturnline`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_purchasereturnline` AS select `prline`.`Id` AS `Id`,`prline`.`PRId` AS `PRId`,`prline`.`ItemId` AS `ItemId`,`prline`.`UOMId` AS `UOMId`,`prline`.`Date` AS `Date`,`prline`.`TotalItems` AS `TotalItems`,`prline`.`PricePerItem` AS `PricePerItem`,`prline`.`TotalAmt` AS `TotalAmt`,`prline`.`ReturnQty` AS `ReturnQty`,`prline`.`CreatedOn` AS `CreatedOn`,`prline`.`CreatedById` AS `CreatedById`,`prline`.`ModifiedOn` AS `ModifiedOn`,`prline`.`ModifiedById` AS `ModifiedById`,`prline`.`IsActive` AS `IsActive`,`enumline`.`Name` AS `UOM`,`item`.`ItemName` AS `Item` from ((`purchasereturnline` `prline` left join `enumline` on((`enumline`.`Id` = `prline`.`UOMId`))) left join `item` on((`item`.`Id` = `prline`.`ItemId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_runtimemodifier`
--

/*!50001 DROP VIEW IF EXISTS `vw_runtimemodifier`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_runtimemodifier` AS select `rm`.`Id` AS `Id`,`rm`.`MenuItemId` AS `MenuItemId`,`rm`.`RawItemId` AS `RawItemId`,`rm`.`KDSId` AS `KDSId`,`rm`.`KDS2Id` AS `KDS2Id`,`rm`.`TypeId` AS `TypeId`,`rm`.`ModifierName` AS `ModifierName`,`rm`.`Price` AS `Price`,`rm`.`Qty` AS `Qty`,`rm`.`StageId` AS `StageId`,`rm`.`StageQtyAllowed` AS `StageQtyAllowed`,`rm`.`ImageBase64Path` AS `ImageBase64Path`,`rm`.`CreatedOn` AS `CreatedOn`,`rm`.`CreatedById` AS `CreatedById`,`rm`.`ModifiedOn` AS `ModifiedOn`,`rm`.`ModifiedById` AS `ModifiedById`,`rm`.`IsActive` AS `IsActive`,`rawitem`.`ItemName` AS `RawItem`,`menuitem`.`ItemName` AS `MenuItem`,`type`.`Name` AS `Type`,`kds`.`Name` AS `KDS`,`kds2`.`Name` AS `KDS2` from (((((`runtimemodifier` `rm` left join `item` `rawitem` on((`rawitem`.`Id` = `rm`.`RawItemId`))) left join `item` `menuitem` on((`menuitem`.`Id` = `rm`.`MenuItemId`))) left join `enumline` `type` on((`type`.`Id` = `rm`.`TypeId`))) left join `enumline` `kds` on((`kds`.`Id` = `rm`.`KDSId`))) left join `enumline` `kds2` on((`kds2`.`Id` = `rm`.`KDS2Id`))) */;
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
/*!50001 VIEW `vw_saleorder` AS select `saleorder`.`Id` AS `Id`,`saleorder`.`OrderTypeId` AS `OrderTypeId`,`enumv`.`Name` AS `OrderType`,`saleorder`.`BillTitle` AS `BillTitle`,`saleorder`.`GSTValue` AS `GSTValue`,`saleorder`.`DiscountValue` AS `DiscountValue`,`saleorder`.`RiderId` AS `RiderId`,`saleorder`.`ShiftId` AS `ShiftId`,`shiftev`.`Name` AS `Shift`,`saleorder`.`SourceId` AS `SourceId`,`saleorder`.`StatusId` AS `StatusId`,`ev`.`Name` AS `Status`,`saleorder`.`WaiterId` AS `WaiterId`,`saleorder`.`CustomerId` AS `CustomerId`,`saleorder`.`RestaurantId` AS `RestaurantId`,`saleorder`.`Name` AS `Name`,`saleorder`.`Address` AS `Address`,`saleorder`.`PhoneNo` AS `PhoneNo`,`saleorder`.`Total` AS `Total`,`saleorder`.`Guest` AS `Guest`,`saleorder`.`Discount` AS `Discount`,`saleorder`.`GST` AS `GST`,`saleorder`.`TableNo` AS `TableNo`,`saleorder`.`Note` AS `Note`,`saleorder`.`Service` AS `Service`,`saleorder`.`NetTotal` AS `NetTotal`,`saleorder`.`PaymentMethodId` AS `PaymentMethodId`,`saleorder`.`DiscountTypeId` AS `DiscountTypeId`,`mop`.`Name` AS `PaymentMethod`,`saleorder`.`DispatchedTime` AS `DispatchedTime`,`saleorder`.`DeliveryTime` AS `DeliveryTime`,`saleorder`.`CreatedOn` AS `CreatedOn`,`saleorder`.`CreatedById` AS `CreatedById`,`saleorder`.`ModifiedOn` AS `ModifiedOn`,`saleorder`.`ModifiedById` AS `ModifiedById`,`saleorder`.`IsActive` AS `IsActive` from ((((`saleorder` join `enumline` `ev` on((`ev`.`Id` = `saleorder`.`StatusId`))) left join `enumline` `shiftev` on((`shiftev`.`Id` = `saleorder`.`ShiftId`))) join `enumline` `enumv` on((`enumv`.`Id` = `saleorder`.`OrderTypeId`))) join `enumline` `mop` on((`mop`.`Id` = `saleorder`.`PaymentMethodId`))) */;
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
/*!50001 VIEW `vw_settings` AS select `settings`.`Id` AS `Id`,`settings`.`EnumTypeId` AS `EnumTypeId`,`settings`.`Name` AS `Name`,`type`.`Name` AS `SettingType`,`type`.`KeyCode` AS `TypeKeyCode`,`type`.`ParentId` AS `TypeParentId`,`settings`.`ParentId` AS `ParentId`,`parent`.`Name` AS `ParentName`,`settings`.`Description` AS `Description`,`settings`.`KeyCode` AS `KeyCode`,`settings`.`IsSystemDefined` AS `IsSystemDefined`,`settings`.`UploadStatus` AS `UploadStatus`,`settings`.`CreatedOn` AS `CreatedOn`,`settings`.`CreatedById` AS `CreatedById`,`settings`.`ModifiedOn` AS `ModifiedOn`,`settings`.`ModifiedById` AS `ModifiedById`,`settings`.`IsActive` AS `IsActive` from ((`enumline` `settings` join `enums` `type` on((`type`.`Id` = `settings`.`EnumTypeId`))) left join `enumline` `parent` on((`parent`.`Id` = `settings`.`ParentId`))) */;
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
/*!50001 VIEW `vw_settingstype` AS select `settings`.`Id` AS `Id`,`settings`.`Name` AS `Name`,`settings`.`ParentId` AS `ParentId`,`parent`.`Name` AS `ParentName`,`parent`.`ParentId` AS `PParentId`,`settings`.`KeyCode` AS `KeyCode`,`settings`.`IsSystemDefined` AS `IsSystemDefined`,`settings`.`UploadStatus` AS `UploadStatus`,`settings`.`Description` AS `Description`,`settings`.`CreatedOn` AS `CreatedOn`,`settings`.`CreatedById` AS `CreatedById`,`settings`.`ModifiedOn` AS `ModifiedOn`,`settings`.`ModifiedById` AS `ModifiedById`,`settings`.`IsActive` AS `IsActive` from (`enums` `settings` left join `enums` `parent` on((`parent`.`Id` = `settings`.`ParentId`))) */;
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
-- Final view structure for view `vw_subrecipe`
--

/*!50001 DROP VIEW IF EXISTS `vw_subrecipe`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_subrecipe` AS select `subrecipe`.`Id` AS `Id`,`subrecipe`.`GroupId` AS `GroupId`,`group`.`Name` AS `Group`,`subrecipe`.`SubItemId` AS `SubItemId`,`subitem`.`Name` AS `SubItem`,`subrecipe`.`FlavorSizeId` AS `FlavorSizeId`,`size`.`SizeName` AS `Size`,`subrecipe`.`ItemId` AS `ItemId`,`item`.`ItemName` AS `Item`,`subrecipe`.`QTY` AS `QTY`,`subrecipe`.`CreatedOn` AS `CreatedOn`,`subrecipe`.`CreatedById` AS `CreatedById`,`subrecipe`.`ModifiedOn` AS `ModifiedOn`,`subrecipe`.`ModifiedById` AS `ModifiedById`,`subrecipe`.`IsActive` AS `IsActive` from ((((`subrecipe` join `enumline` `group` on((`group`.`Id` = `subrecipe`.`GroupId`))) left join `flavorsize` `size` on((`size`.`Id` = `subrecipe`.`FlavorSizeId`))) join `item` on((`item`.`Id` = `subrecipe`.`ItemId`))) join `enumline` `subitem` on((`subitem`.`Id` = `subrecipe`.`SubItemId`))) */;
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
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_user` AS select `user`.`Id` AS `Id`,`user`.`PasswordHash` AS `PasswordHash`,`user`.`UserPassword` AS `UserPassword`,`user`.`Name` AS `Name`,`user`.`FirstName` AS `FirstName`,`user`.`CNIC` AS `CNIC`,`user`.`Address` AS `Address`,`user`.`Designation` AS `Designation`,`user`.`DiscountLimit` AS `DiscountLimit`,`user`.`BranchId` AS `BranchId`,`branch`.`Name` AS `Branch`,`user`.`FatherName` AS `FatherName`,`user`.`MSCardNo` AS `MSCardNo`,`user`.`Email` AS `Email`,`user`.`PhoneNumber` AS `UserPhone`,`user`.`EmployeeId` AS `EmployeeId`,`emp`.`Name` AS `EmployeeName`,`user`.`UserName` AS `UserName`,`urole`.`RoleId` AS `RoleId`,`role`.`Name` AS `Role` from ((((`aspnetusers` `user` left join `employee` `emp` on((`emp`.`Id` = `user`.`EmployeeId`))) left join `branch` on((`branch`.`Id` = `user`.`BranchId`))) left join `aspnetuserroles` `urole` on((`urole`.`UserId` = `user`.`Id`))) left join `aspnetroles` `role` on((`urole`.`RoleId` = `role`.`Id`))) */;
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

-- Dump completed on 2023-06-08 14:44:34