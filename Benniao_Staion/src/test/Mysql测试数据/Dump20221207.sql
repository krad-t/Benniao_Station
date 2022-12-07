CREATE DATABASE  IF NOT EXISTS `benniao` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `benniao`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: benniao
-- ------------------------------------------------------
-- Server version	8.0.30

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
  `aid` varchar(36) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone` varchar(11) NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `username` (`username`),
  KEY `admin_phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('04d90352-4bdc-4ed8-9962-c56a6c9bcc97','韦文博','nGEZI','18232394986'),('04d90352-4bdc-4ed8-9962-c56a6c9bxc97','魏钰轩','5j','15542815113'),('09492235-35ad-4ca8-8392-b118bdd8x76e','史烨伟','MAA','17047620546'),('0949f235-35ad-4ca8-8392-b118bdd8976e','邹远航','lFWR','15347354679'),('0949f235-35ad-4ca8-8392-b118bdd8976f','傅子骞','s6A','17150346619'),('212641dd-f050-49bf-a0bb-71688035xe7a','卢晟睿','duH1j','18153731776'),('2126482d-f050-49bf-a0bb-71688035xe7a','谢博文','Qjj','15232911018'),('212648dd-f050-49bf-a0bb-71688035be7a','袁荣轩','Vf6','17290187294'),('212648dd-f050-49bf-a0bb-71688035xe7a','金子默','QViO','15938275556'),('7d204bc5-3798-4bcd-91ee-36f885e5a853','黎健雄','k4BEe','13055545630'),('8506b114-8117-4fcd-975e-12919cad6155','袁昊然','UyyY','17101019661'),('8506b114-8117-4fcd-975e-12919cadx155','陆振家','S59J0','15263010277'),('9388994a-33a9-4719-bbd1-a9677f4ac391','郭凯瑞','aqOk','15347848692'),('9388994a-33a9-4719-bbd1-a9677f4ac392','admin','admin','12322332233'),('c9863f8b-58cd-4e5a-87fa-912580d06d7b','曾鹏飞','N80JU','15524846417'),('c9863f8b-58cd-4e5a-87fa-912580d0xd9a','孔思聪','6Jo6','14725994017'),('c9863f8b-58cd-4e5a-87fa-912580d16d9a','邓昊然','55MH','15376799290'),('c9863f8b-58cd-4e5a-87fa-912580d1xd9a','蔡哲瀚','KH0W','15808718549'),('e655d637-ed11-458c-a4a7-0fe394440138','毛晓博','x8Z','14573886680'),('f2b3d1e5-59b6-4a03-a9b6-a0d4bbc41d48','田鸿煊','uqZ','15775217002');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcel`
--

DROP TABLE IF EXISTS `parcel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parcel` (
  `eid` varchar(36) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `user_phone` varchar(11) DEFAULT NULL,
  `company` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `int_time` datetime DEFAULT NULL,
  `out_time` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `admin_phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `user_phone` (`user_phone`),
  KEY `admin_phone` (`admin_phone`),
  CONSTRAINT `parcel_ibfk_1` FOREIGN KEY (`user_phone`) REFERENCES `user` (`phone`),
  CONSTRAINT `parcel_ibfk_2` FOREIGN KEY (`admin_phone`) REFERENCES `admin` (`phone`),
  CONSTRAINT `parcel_chk_1` CHECK (((`status` = 0) or (`status` = 1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcel`
--

LOCK TABLES `parcel` WRITE;
/*!40000 ALTER TABLE `parcel` DISABLE KEYS */;
INSERT INTO `parcel` VALUES ('04d20352-4bdc-4ed8-9962-c56v6a9bcc97','苏煜城','13335322357','德邦物流','a01-5','2022-03-12 14:54:11','2022-02-04 04:08:58',1,'15938275556'),('0919f235-35ad-4ca8-8392-b118bdd8976e','郝子轩','15737704789','申通快递','e17-2','2022-09-29 20:48:59','2022-01-03 19:15:45',1,'15524846417'),('0949f235-35ad-4ca8-8392-b118bad8976e','root','12322332233','韵达快递','d36-0','2022-10-18 03:32:01','2022-02-08 08:26:35',0,'15542815113'),('0949f235-35ad-4ca8-8392-b118bdd8976e','贾潇然','17323736335','京东物流','a61-3','2022-10-15 21:32:20','2022-01-28 09:39:42',1,'15376799290'),('0949f235-35ad-4ca8-8392-b11vbad8976e','root','12322332233','圆通速递','c32-3','2022-11-18 06:50:18','2022-12-17 14:50:01',1,'15263010277'),('1388994a-33a9-4719-bbd1-a9677f4ac391','覃雨泽','17605316913','申通快递','a9-5','2022-12-11 06:33:32','2022-06-08 02:02:42',1,'18232394986'),('212648dd-f050-49bf-a0bb-71688035be7a','邹文','14768767199','申通快递','b26-7','2022-10-30 01:27:29','2022-11-18 08:25:52',0,'17150346619'),('212648dd-f050-49bf-a0bb-71688a35be7a','root','12322332233','国通快递','b00-5','2022-06-11 02:01:25','2022-08-20 15:44:36',1,'15775217002'),('7d204bc5-3798-4bcd-91ee-36f88ae5a853','root','12322332233','韵达快递','d48-6','2022-09-28 06:24:14','2022-01-25 00:45:28',1,'17101019661'),('8506b114-8117-4fcd-975e-12919cad6155','李修洁','17150717588','天天快递','f08-5','2022-10-19 21:52:06','2022-06-22 18:15:05',1,'15347354679'),('9388994a-33a9-4719-bbd1-a9677a4ac391','root','12322332233','德邦物流','d16-9','2022-11-22 02:53:39','2022-09-16 06:15:25',1,'15808718549'),('9388994a-33a9-4719-bbd1-a9677f4ac391','傅伟祺','18289732298','圆通速递','b1-0','2022-05-20 19:33:13','2022-10-15 14:05:07',0,'15347848692'),('9c863c8b-58cd-4e5a-87fa-912580d16d9a','苏煜城','13335322357','顺丰速运','d66-4','2022-02-05 02:56:38','2022-02-23 22:41:20',1,'13055545630'),('c9863f8b-58cd-4e5a-87fa-912580d16d9a','root','12322332233','韵达快递','d70-4','2022-01-11 14:29:50','2022-01-13 22:24:40',1,'12322332233'),('e615d637-ed11-458c-a4a7-0fev9a440138','root','12322332233','韵达快递','e30-6','2022-11-25 12:32:18','2022-10-21 18:37:21',0,'14725994017'),('e655d637-ed11-458c-a4a7-0fe394440138','曹博涛','14778936630','百世汇通','g8-8','2022-01-12 04:05:27','2022-12-08 03:32:33',0,'14573886680'),('e655d637-ed11-458c-a4a7-0fev9a440131','覃雨泽','17605316913','天天快递','f65-4','2022-10-25 16:31:49','2022-03-01 09:23:28',1,'15232911018'),('e655d637-ed11-458c-a4a7-0fev9a440138','贾潇然','17323736335','申通快递','c5-2','2022-10-11 17:33:58','2022-07-31 23:06:40',1,'18153731776'),('f2b3d1e5-59b6-4a03-a9b6-a0d4bbc41d48','孙苑博','15907588768','德邦物流','e45-7','2022-04-22 18:43:56','2022-10-05 20:22:01',1,'17290187294');
/*!40000 ALTER TABLE `parcel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` varchar(36) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone` varchar(11) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `user_phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('0949f235-35ad-4ca8-8392-b118bdd8976e','郝子轩','hS','15737704789'),('0949f235-35ad-4ca8-8392-b118bdd8976f','root','root','12322332233'),('212648dd-f050-49bf-a0bb-71688035be7a','陈烨伟','idv','17533223469'),('7d204bc5-3798-4bcd-91ee-36f885e5a853','苏煜城','oyrc','13335322357'),('8506b114-8117-4fcd-975e-12919cad6155','傅伟祺','gBUP','18289732298'),('9388994a-33a9-4719-bbd1-a9677f4ac391','孙苑博','eYBQ','15907588768'),('c9863f8b-58cd-4e5a-87fa-912580d16d9a','李修洁','TR','17150717588'),('e655d637-ed11-458c-a4a7-0fe394440132','曹博涛','PBN','14778936630'),('e655d637-ed11-458c-a4a7-0fe394440138','邹文','8E8','14768767199'),('e655d637-ed11-458c-a4a7-0fe394440139','贾潇然','cMm','17323736335'),('f2b3d1e5-59b6-4a03-a9b6-a0d4bbc41d48','覃雨泽','nHX','17605316913');
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

-- Dump completed on 2022-12-07 20:00:33
