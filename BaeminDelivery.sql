drop database BaeminDelivery;
create database BaeminDelivery;

use BaeminDelivery;

-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 13.209.81.40    Database: BaeminDelivery
-- ------------------------------------------------------
-- Server version	8.0.36-2ubuntu3

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
-- Table structure for table `ad`
--

DROP TABLE IF EXISTS `ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad` (
  `ad_id` bigint NOT NULL,
  `seller_id` bigint NOT NULL,
  `ad_title` varchar(20) NOT NULL,
  `ad_content` text NOT NULL,
  `price_per_day` int NOT NULL,
  `date_created` date NOT NULL,
  `date_expired` date NOT NULL,
  PRIMARY KEY (`ad_id`,`seller_id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `ad_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad`
--

LOCK TABLES `ad` WRITE;
/*!40000 ALTER TABLE `ad` DISABLE KEYS */;
INSERT INTO `ad` VALUES (1,1,'할인 이벤트','떡볶이 20% 할인',10000,'2024-01-01','2024-01-31'),(2,2,'신메뉴 출시','순대 10% 할인',8000,'2024-01-02','2024-01-31'),(3,3,'오픈 기념 이벤트','오뎅 15% 할인',9000,'2024-01-03','2024-01-31');
/*!40000 ALTER TABLE `ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyer` (
  `buyer_id` bigint NOT NULL,
  `buyer_name` varchar(20) NOT NULL,
  `address_sido` varchar(10) NOT NULL,
  `address_sigungu` varchar(10) NOT NULL,
  `address_detail` varchar(30) NOT NULL,
  `postal_code` int NOT NULL,
  `buyer_phone` varchar(20) NOT NULL,
  `buyer_email` varchar(30) NOT NULL,
  `date_joined` timestamp NOT NULL,
  `date_modified` timestamp NOT NULL,
  PRIMARY KEY (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES (1,'이영희','서울특별시','종로구','종로1가 1-1',11011,'010-5678-1234','lee@example.com','2024-01-01 00:00:00','2024-01-01 00:00:00'),(2,'김철민','서울특별시','강남구','역삼동 456-78',45678,'010-6789-1234','kim@example.com','2024-01-02 00:00:00','2024-01-02 00:00:00'),(3,'박민준','서울특별시','마포구','마포동 789-10',78910,'010-7890-1234','park@example.com','2024-01-03 00:00:00','2024-01-03 00:00:00');
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `coupon_id` bigint NOT NULL,
  `seller_id` bigint NOT NULL,
  `buyer_id` bigint NOT NULL,
  `discount_amount` int NOT NULL,
  `date_created` date NOT NULL,
  `date_expired` date DEFAULT NULL,
  PRIMARY KEY (`coupon_id`,`seller_id`,`buyer_id`),
  KEY `seller_id` (`seller_id`),
  KEY `buyer_id` (`buyer_id`),
  CONSTRAINT `coupon_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`),
  CONSTRAINT `coupon_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,1,1,2000,'2024-01-01','2024-06-30'),(2,2,2,3000,'2024-01-02','2024-06-30'),(3,3,3,1000,'2024-01-03','2024-06-30');
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_person`
--

DROP TABLE IF EXISTS `delivery_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_person` (
  `dp_id` bigint NOT NULL,
  `delivery_name` varchar(20) DEFAULT NULL,
  `address_sido` varchar(20) NOT NULL,
  `address_sigungu` varchar(20) NOT NULL,
  `address_detail` varchar(20) NOT NULL,
  `postal_code` int DEFAULT NULL,
  `delivery_phone` varchar(20) NOT NULL,
  `delivery_email` varchar(30) NOT NULL,
  `date_joined` timestamp NULL DEFAULT NULL,
  `date_modified` timestamp NOT NULL,
  `address_work` varchar(30) NOT NULL,
  `vehicle_type` varchar(20) NOT NULL,
  `vehicle_number` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`dp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_person`
--

LOCK TABLES `delivery_person` WRITE;
/*!40000 ALTER TABLE `delivery_person` DISABLE KEYS */;
INSERT INTO `delivery_person` VALUES (1,'박지훈','서울특별시','서초구','서초동 456-78',67890,'010-8765-4321','park@example.com','2024-01-01 00:00:00','2024-02-01 00:00:00','서초구','오토바이','서울01가1234'),(2,'이수진','서울특별시','강서구','화곡동 123-45',56789,'010-9876-5432','lee@example.com','2024-01-02 00:00:00','2024-02-01 00:00:00','강서구','자동차','서울02나5678'),(3,'김민재','서울특별시','관악구','신림동 789-10',34567,'010-7654-3210','kim@example.com','2024-01-03 00:00:00','2024-02-01 00:00:00','관악구','자전거','서울03다9101');
/*!40000 ALTER TABLE `delivery_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` bigint NOT NULL,
  `seller_id` bigint NOT NULL,
  `menu_name` varchar(20) NOT NULL,
  `menu_price` int NOT NULL,
  `product_image` text,
  `date_created` timestamp NOT NULL,
  `date_expired` timestamp NOT NULL,
  PRIMARY KEY (`menu_id`,`seller_id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'떡볶이',5000,NULL,'2024-01-01 00:00:00','2024-12-31 23:59:59'),(2,2,'순대',6000,NULL,'2024-01-02 00:00:00','2024-12-31 23:59:59'),(3,3,'오뎅',3000,NULL,'2024-01-03 00:00:00','2024-12-31 23:59:59');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` bigint NOT NULL,
  `seller_id` bigint NOT NULL,
  `buyer_id` bigint NOT NULL,
  `dp_id` bigint NOT NULL,
  `date_ordered` timestamp NOT NULL,
  `address_sido` varchar(10) NOT NULL,
  `address_sigungu` varchar(10) NOT NULL,
  `address_detail` varchar(30) NOT NULL,
  `postal_code` int NOT NULL,
  `order_price` int NOT NULL,
  `minimun_price` int NOT NULL,
  `delivery_time` time NOT NULL,
  `delivery_type` varchar(10) NOT NULL,
  `order_request` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`seller_id`,`buyer_id`,`dp_id`),
  KEY `seller_id` (`seller_id`),
  KEY `buyer_id` (`buyer_id`),
  KEY `dp_id` (`dp_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`dp_id`) REFERENCES `delivery_person` (`dp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,1,1,'2024-01-01 12:00:00','서울특별시','종로구','종로1가 1-1',11011,15000,5000,'12:30:00','문 앞에 두세요','떡볶이 많이 주세요'),(2,2,2,2,'2024-01-02 13:00:00','서울특별시','강남구','역삼동 456-78',45678,20000,10000,'13:30:00','직접 받아요','순대 소스 추가해 주세요'),(3,3,3,3,'2024-01-03 14:00:00','서울특별시','마포구','마포동 789-10',78910,18000,7000,'14:30:00','벨 누르고 주세요','떡볶이 국물 많이 주세요');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `seller_id` bigint NOT NULL,
  `buyer_id` bigint NOT NULL,
  `rank` enum('1','2','3','4','5') NOT NULL,
  `review_title` varchar(40) NOT NULL,
  `review_content` text,
  `date_created` timestamp NOT NULL,
  `date_modified` timestamp NOT NULL,
  PRIMARY KEY (`review_id`,`order_id`,`seller_id`,`buyer_id`),
  KEY `order_id` (`order_id`),
  KEY `seller_id` (`seller_id`),
  KEY `buyer_id` (`buyer_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`),
  CONSTRAINT `review_ibfk_3` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,1,'5','맛있어요!','정말 맛있게 먹었어요.','2024-01-01 12:30:00','2024-01-01 12:30:00'),(2,2,2,2,'4','괜찮아요','무난한 맛이에요.','2024-01-02 13:30:00','2024-01-02 13:30:00'),(3,3,3,3,'5','좋아요','매우 만족합니다.','2024-01-03 14:30:00','2024-01-03 14:30:00');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `seller_id` bigint NOT NULL,
  `seller_name` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `representative_name` varchar(10) NOT NULL,
  `address_sido` varchar(50) NOT NULL,
  `address_sigungu` varchar(50) NOT NULL,
  `address_detail` varchar(100) NOT NULL,
  `postal_code` int NOT NULL,
  `seller_phone` varchar(20) NOT NULL,
  `seller_email` varchar(30) NOT NULL,
  `seller_type` varchar(30) NOT NULL,
  `date_joined` timestamp NOT NULL,
  `date_modified` timestamp NOT NULL,
  `is_joined_ad` tinyint(1) NOT NULL,
  `delivery_local` varchar(300) NOT NULL,
  `operation_time` varchar(200) NOT NULL,
  `store_image` text,
  `review` varchar(200) DEFAULT NULL,
  `zzim` bigint DEFAULT NULL,
  `menu` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'김가네','음식','김철수','서울특별시','강남구','역삼동 123-45',12345,'010-1234-5678','kim@example.com','프랜차이즈','2024-01-01 00:00:00','2024-01-01 00:00:00',1,'강남구, 서초구','09:00-21:00',NULL,'맛있어요!',10,'떡볶이'),(2,'박가네','음식','박영희','서울특별시','종로구','종로3가 234-56',23456,'010-2345-6789','park@example.com','개인','2024-01-02 00:00:00','2024-01-02 00:00:00',0,'종로구, 중구','10:00-22:00',NULL,'친절해요!',5,'순대'),(3,'이가네','음식','이민수','서울특별시','서대문구','홍은동 345-67',34567,'010-3456-7890','lee@example.com','체인점','2024-01-03 00:00:00','2024-01-03 00:00:00',1,'서대문구, 마포구','08:00-20:00',NULL,'맛이 좋아요!',7,'떡볶이');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zzim`
--

DROP TABLE IF EXISTS `zzim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zzim` (
  `zzim_id` bigint NOT NULL,
  `seller_id` bigint NOT NULL,
  `buyer_id` bigint NOT NULL,
  `create_date` timestamp NOT NULL,
  `modified_date` timestamp NOT NULL,
  PRIMARY KEY (`zzim_id`,`seller_id`,`buyer_id`),
  KEY `seller_id` (`seller_id`),
  KEY `buyer_id` (`buyer_id`),
  CONSTRAINT `zzim_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`),
  CONSTRAINT `zzim_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zzim`
--

LOCK TABLES `zzim` WRITE;
/*!40000 ALTER TABLE `zzim` DISABLE KEYS */;
INSERT INTO `zzim` VALUES (1,1,1,'2024-01-01 00:00:00','2024-01-01 00:00:00'),(2,2,2,'2024-01-02 00:00:00','2024-01-02 00:00:00'),(3,3,3,'2024-01-03 00:00:00','2024-01-03 00:00:00');
/*!40000 ALTER TABLE `zzim` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 14:26:45
