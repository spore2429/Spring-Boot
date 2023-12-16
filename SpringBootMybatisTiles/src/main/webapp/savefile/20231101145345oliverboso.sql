CREATE DATABASE  IF NOT EXISTS `coffee` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `coffee`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: coffee
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `idx` smallint NOT NULL AUTO_INCREMENT,
  `num` int DEFAULT NULL,
  `chu` int NOT NULL DEFAULT '0',
  `bchu` int NOT NULL DEFAULT '0',
  `myid` varchar(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `star` smallint DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `myid` (`myid`),
  KEY `num` (`num`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`myid`) REFERENCES `member_table` (`mem_id`) ON DELETE CASCADE,
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`num`) REFERENCES `movie_table` (`mv_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (2,14,3,5,'sleepysudal','',1,'2023-09-21 18:45:23'),(9,14,2,0,'joony','',5,'2023-09-21 18:50:53'),(10,14,0,0,'joony','',5,'2023-09-21 18:51:33'),(11,14,0,0,'hwan','',5,'2023-09-21 18:52:58'),(12,14,0,0,'hwan','',5,'2023-09-21 18:53:04'),(13,14,2,0,'hwan','3',1,'2023-09-21 18:54:24'),(15,14,8,0,'jinbbang','',5,'2023-09-21 18:54:56'),(16,14,15,0,'hwan','1. ',2,'2023-09-21 18:55:09'),(35,14,1,1,NULL,'',1,'2023-09-21 22:34:07'),(36,14,2,1,'test','',4,'2023-09-22 14:28:05'),(40,14,0,0,NULL,'',5,'2023-09-23 22:47:55'),(41,14,0,0,NULL,'dfadsfas',5,'2023-09-25 09:41:16'),(42,14,0,0,NULL,'이성신짱',5,'2023-09-25 11:16:33'),(43,14,0,0,NULL,'김영준 사고',5,'2023-09-25 11:16:45'),(44,14,0,0,NULL,'제목 , 줄거리 안나옴 ㅠㅠㅠㅠ',1,'2023-09-25 11:28:29'),(45,14,28,0,NULL,'줄거리도 안나오는데 영화를 어떻게 보라는거야???????',1,'2023-09-25 11:28:43');
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carmember`
--

DROP TABLE IF EXISTS `carmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carmember` (
  `num` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `hp` varchar(20) DEFAULT NULL,
  `addr` varchar(20) DEFAULT NULL,
  `gaipday` datetime DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carmember`
--

LOCK TABLES `carmember` WRITE;
/*!40000 ALTER TABLE `carmember` DISABLE KEYS */;
INSERT INTO `carmember` VALUES (2,'호슥머쓱12','0101234567812','아르테일ㅇㄴㅁㄹ','2023-10-12 12:44:19'),(3,'김영환','01011112222','서울시 강남구 논현동','2023-10-12 11:21:01'),(4,'ㅁㅇㄹ','21312321','12321321','2023-10-12 11:51:43'),(5,'바트성슨','01011112222','한독빌딩','2023-10-12 12:07:07');
/*!40000 ALTER TABLE `carmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `num` smallint NOT NULL AUTO_INCREMENT,
  `myid` varchar(20) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `photoname` varchar(50) DEFAULT NULL,
  `chu` smallint DEFAULT '0',
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (9,'hwan','dfaas',NULL,120,'2023-08-28 09:15:34'),(11,'seongsin','dsfas',NULL,0,'2023-09-08 10:27:30'),(12,'seongsin','dsfas',NULL,0,'2023-09-08 10:27:37');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idx`
--

DROP TABLE IF EXISTS `idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idx` (
  `num` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `id` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idx`
--

LOCK TABLES `idx` WRITE;
/*!40000 ALTER TABLE `idx` DISABLE KEYS */;
INSERT INTO `idx` VALUES (1,'김영환','hwan','a1234');
/*!40000 ALTER TABLE `idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `num` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `id` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `hp` varchar(20) DEFAULT NULL,
  `addr` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `gaipday` date DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (6,'알파메일성신','seongsin','1234','010-2222-3333','쌍용 7강의실 휴게실','dsaflafkd122@gmail.com','2023-08-24'),(8,'관리자','admin','1234','010-0000-0000','알수없음','unknown@naver.com','2023-08-24'),(10,'김영환','hwan','1234','010-2222-3333','서울시 강남구','asdg@naver.com','2023-08-28');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_table`
--

DROP TABLE IF EXISTS `member_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_table` (
  `mem_no` int NOT NULL AUTO_INCREMENT,
  `mem_id` varchar(50) DEFAULT NULL,
  `mem_pass` varchar(100) DEFAULT NULL,
  `mem_name` varchar(50) DEFAULT NULL,
  `mem_gender` varchar(30) DEFAULT NULL,
  `mem_birth` varchar(50) DEFAULT NULL,
  `mem_ph` varchar(100) DEFAULT NULL,
  `mem_email` varchar(100) DEFAULT NULL,
  `mem_regdate` date DEFAULT NULL,
  `mem_addr` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`mem_no`),
  UNIQUE KEY `mem_id_fk` (`mem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_table`
--

LOCK TABLES `member_table` WRITE;
/*!40000 ALTER TABLE `member_table` DISABLE KEYS */;
INSERT INTO `member_table` VALUES (32,'admin','1','','','2023-09-01','02-3482-4632','sist@gmail.com','2023-09-01','(06235)'),(34,'hwan','1','','','1999-04-08','010-9463-8567','nice_view99@naver.com','2023-09-01','(02581)'),(35,'joony','1','','','1997-12-03','010-8649-6857','cute_joony@naver.com','2023-09-01','(12700)'),(36,'tiger','1','','','1997-09-28','010-2443-2170','strong_boy@naver.com','2023-09-01','(14743)'),(38,'jinbbang','1','','','1997-12-26','010-4621-1989','QpyungEpyung@naver.com','2023-09-01','(14709)'),(39,'sleepysudal','1','','','1996-02-26','010-9434-3997','mincho_jonmat@naver.com','2023-09-01','(02844)'),(94,'3025893380',NULL,'','',NULL,NULL,'jas719@kakao.com','2023-09-22',NULL),(95,'wlwlgoyo@naver.com',NULL,'','',NULL,NULL,'wlwlgoyo@naver.com','2023-09-22',NULL),(96,'test','1','test','','2023-09-07','010-1111-2222','dfdwd@gmail.com','2023-09-22','(16515)');
/*!40000 ALTER TABLE `member_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minisanswer`
--

DROP TABLE IF EXISTS `minisanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `minisanswer` (
  `idx` int NOT NULL,
  `num` int NOT NULL,
  `myid` varchar(20) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minisanswer`
--

LOCK TABLES `minisanswer` WRITE;
/*!40000 ALTER TABLE `minisanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `minisanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_table`
--

DROP TABLE IF EXISTS `movie_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_table` (
  `mv_no` int NOT NULL AUTO_INCREMENT,
  `mv_title` varchar(100) DEFAULT NULL,
  `mv_poster` varchar(100) DEFAULT NULL,
  `mv_director` varchar(60) DEFAULT NULL,
  `mv_st` longtext,
  `mv_trailer` varchar(100) DEFAULT NULL,
  `mv_opendate` varchar(30) DEFAULT NULL,
  `mv_info` varchar(100) DEFAULT NULL,
  `mv_regdate` date DEFAULT NULL,
  `mv_genre` varchar(60) DEFAULT NULL,
  `mv_name` varchar(200) DEFAULT NULL,
  `mv_adult` int DEFAULT NULL,
  `mv_teen` int DEFAULT NULL,
  `mv_child` int DEFAULT NULL,
  PRIMARY KEY (`mv_no`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_table`
--

LOCK TABLES `movie_table` WRITE;
/*!40000 ALTER TABLE `movie_table` DISABLE KEYS */;
INSERT INTO `movie_table` VALUES (14,'','upload/Oppenheimer23.jpg','ũ','','https://www.youtube.com/watch?v=oSqK_v6zPoM','2023-08-15','15','2023-08-29','','ų',14000,11000,8000),(15,'','upload/concrete.jpg','','\"','https://www.youtube.com/watch?v=hAO9a1xSo3M','2023-08-09','15','2023-08-29','','',14000,11000,8000),(16,'','upload/HoneySweet.jpg','','Ÿ','https://www.youtube.com/watch?v=-fGrhOQ2Jjw','2023-08-15','12','2023-08-29','','',14000,11000,8000),(18,'','upload/Milsu.png','','','https://www.youtube.com/watch?v=rWIIXz-F43w','2023-07-26','15','2023-08-29','','',14000,11000,8000),(19,'','upload/elemental.jpg','','','https://www.youtube.com/watch?v=BOqFRHCrN-k','2023-06-14','','2023-08-29','','',14000,11000,8000),(20,'','upload/Maya.jpg','','ȯ','https://www.youtube.com/watch?v=H5A0Mc4HVg8','2023-08-24','','2023-08-29','','',14000,11000,8000),(21,'','upload/mega.jpg','','','https://www.youtube.com/watch?v=RPqnot8mMyQ','2023-08-15','12','2023-08-30','','',14000,11000,8000),(22,'','upload/Mission.jpg','ũ','','https://www.youtube.com/watch?v=F40MAXyXaac','2023-07-12','15','2023-08-30','','',14000,11000,8000),(23,'','upload/Conan1.jpg','Ÿġī','','https://www.youtube.com/watch?v=AjkqN8tA_Sw','2023-07-20','12','2023-08-30','','-',14000,11000,8000),(38,'ġġġ ġŲ','upload/chicken2.jpg','','\"','https://www.youtube.com/watch?v=91bP1ebIxv4','2023-08-24','','2023-09-21','','-',14000,11000,8000);
/*!40000 ALTER TABLE `movie_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mycar`
--

DROP TABLE IF EXISTS `mycar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mycar` (
  `num` smallint NOT NULL AUTO_INCREMENT,
  `carname` varchar(30) DEFAULT NULL,
  `carprice` int DEFAULT NULL,
  `carcolor` varchar(30) DEFAULT NULL,
  `carguip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mycar`
--

LOCK TABLES `mycar` WRITE;
/*!40000 ALTER TABLE `mycar` DISABLE KEYS */;
INSERT INTO `mycar` VALUES (4,'꼬마자동차',500000,'#0440f6','2023-10-06'),(5,'호스기',21341,'#eaee17','2023-10-27'),(6,'영차54',123123,'#ec0909','2023-10-25');
/*!40000 ALTER TABLE `mycar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myinfo`
--

DROP TABLE IF EXISTS `myinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myinfo` (
  `num` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `driver` varchar(20) DEFAULT NULL,
  `addr` varchar(30) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `gaipday` datetime DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myinfo`
--

LOCK TABLES `myinfo` WRITE;
/*!40000 ALTER TABLE `myinfo` DISABLE KEYS */;
INSERT INTO `myinfo` VALUES (8,'이민규','있음','쌍용화장실','20231013172845_good.jpg','2023-10-13 15:12:57'),(9,'최익현','없음','범죄도시','20231013151500_song.jpg','2023-10-13 15:15:00'),(14,'김영환','없음','서울시 강남구 논현동','20231016092216_bin.jpg','2023-10-13 16:40:19'),(15,'김영환','있음','사고시 사고동','20231013171106_캡처.PNG','2023-10-13 17:11:06'),(16,'홍박사(조주봉)','없음','오타시 오타동','20231013171203_12.jpg','2023-10-13 17:12:03');
/*!40000 ALTER TABLE `myinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizboard`
--

DROP TABLE IF EXISTS `quizboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizboard` (
  `q_num` int NOT NULL AUTO_INCREMENT,
  `writer` varchar(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `imgname` varchar(50) DEFAULT NULL,
  `readcount` int DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`q_num`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizboard`
--

LOCK TABLES `quizboard` WRITE;
/*!40000 ALTER TABLE `quizboard` DISABLE KEYS */;
INSERT INTO `quizboard` VALUES (2,'김영환','ㅁㄶㅁㄶㄴㅁㅇㅀㅁㄴㅇㅎ','ㅁㄱㅇㅎㅁㄱ롬ㄷ솜ㄷ솜ㄷㅅ','../upload/b1.png',0,'2023-08-22 14:31:27'),(3,'김영환','asdf','adsfa','../upload/b1.png',0,'2023-08-22 15:03:34'),(4,'김영환','123','edas','../upload/b11.png',0,'2023-08-22 15:06:51'),(5,'adsf','afd','asdfasd','../upload/b12.png',11,'2023-08-22 15:07:44'),(6,'김영환','12312','sdafsagasdg','../upload/b2.png',11,'2023-08-22 15:48:41'),(7,'김영환임','이미지','ㅁㅇㅎㅁㄴㅇㅎㅁ','../upload/b111.png',0,'2023-08-22 15:58:10'),(8,'김영준','ㅁㅎㅁㄴㅇㅎ','ㅁㅇㅎㅁㄴㅇㅎ','../upload/b8.png',0,'2023-08-22 15:58:29'),(9,'asdgsadjgl1231','asdghsdagadsg','sadgsadg','../upload/b9.png',1,'2023-08-22 15:59:15'),(10,'안녕하세요','ㅎㅇ','ㅎㅇㅀㅇㄴㅁㅎ','../upload/b10.png',1,'2023-08-22 16:18:19'),(11,'1','1','1','../이미지/Other_img/noimg.jpg',0,'2023-08-22 16:39:21'),(12,'1','1','1','../이미지/Other_img/noimg.jpg',0,'2023-08-22 16:39:23'),(13,'1','1','1','../이미지/Other_img/noimg.jpg',0,'2023-08-22 16:39:25'),(14,'1','1','1','../이미지/Other_img/noimg.jpg',0,'2023-08-22 16:39:28'),(15,'1','1','1','../이미지/Other_img/noimg.jpg',0,'2023-08-22 16:39:32'),(16,'1','1','1','../이미지/Other_img/noimg.jpg',0,'2023-08-22 16:39:34'),(17,'1','1','1','../이미지/Other_img/noimg.jpg',0,'2023-08-22 16:39:36'),(18,'1','1','1','../이미지/Other_img/noimg.jpg',0,'2023-08-22 16:39:39'),(19,'1','1','1','../이미지/Other_img/noimg.jpg',0,'2023-08-22 16:39:41'),(20,'1','1','1','../이미지/Other_img/noimg.jpg',0,'2023-08-22 16:39:43'),(21,'1','1','1','../이미지/Other_img/noimg.jpg',0,'2023-08-22 16:39:46'),(22,'1','1','1','../이미지/Other_img/noimg.jpg',16,'2023-08-22 16:39:49');
/*!40000 ALTER TABLE `quizboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reanswer`
--

DROP TABLE IF EXISTS `reanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reanswer` (
  `idx` smallint NOT NULL AUTO_INCREMENT,
  `num` smallint DEFAULT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `num` (`num`),
  CONSTRAINT `reanswer_ibfk_1` FOREIGN KEY (`num`) REFERENCES `reboard` (`num`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reanswer`
--

LOCK TABLES `reanswer` WRITE;
/*!40000 ALTER TABLE `reanswer` DISABLE KEYS */;
INSERT INTO `reanswer` VALUES (12,19,'시온킹','1','dd','2023-10-18 12:09:49'),(13,19,'d','1','afds','2023-10-18 12:12:28'),(14,19,'ㅇ','112','dfadsf','2023-10-18 17:12:20');
/*!40000 ALTER TABLE `reanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reboard`
--

DROP TABLE IF EXISTS `reboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reboard` (
  `num` smallint NOT NULL AUTO_INCREMENT,
  `writer` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `regroup` smallint DEFAULT NULL,
  `restep` smallint DEFAULT NULL,
  `relevel` smallint DEFAULT NULL,
  `readcount` smallint DEFAULT '0',
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reboard`
--

LOCK TABLES `reboard` WRITE;
/*!40000 ALTER TABLE `reboard` DISABLE KEYS */;
INSERT INTO `reboard` VALUES (1,'올리버쌤','1','안녕하세요','올리버쌤입니다~ 와','no',1,0,0,-3,'2023-10-16 16:42:16'),(11,'올리버쌤','1','adfs','adsf','20231017160954-bin.jpg',11,0,0,3,'2023-10-17 16:09:54'),(12,'올리버쌤','1','안녕하세요','dsaf','20231017163418-bin.jpg,20231017163418-board.jpg,20231017163418-horius.jpg',12,0,0,7,'2023-10-17 16:34:18'),(13,'ds','1','dsf','afds','20231017163519-bin.jpg,20231017163519-board.jpg,20231017163519-horius.jpg,20231017163519-minq.jpg,20231017163519-moon.png,20231017163519-mov.png',13,0,0,2,'2023-10-17 16:35:19'),(14,'올리버쌤','1','ads','adsf','20231017163704-bin.jpg,20231017163704-board.jpg,20231017163704-horius.jpg,20231017163704-hosugi.jpg',14,0,0,1,'2023-10-17 16:37:04'),(15,'s','1','dsaf','sdaf','20231017163716-bin.jpg,20231017163716-board.jpg,20231017163716-horius.jpg,20231017163716-minq.jpg,20231017163716-moon.png,20231017163716-mov.png',15,0,0,2,'2023-10-17 16:37:16'),(16,'dsf','1','dsf','asdf','20231017163736-bin.jpg,20231017163736-board.jpg,20231017163736-horius.jpg',16,0,0,1,'2023-10-17 16:37:36'),(17,'adfs','1','adsf','asdf','20231017163828-bin.jpg,20231017163828-board.jpg',17,0,0,2,'2023-10-17 16:38:28'),(18,'dsf','1','dzsf','sdf','20231017163915-bin.jpg,20231017163915-board.jpg,20231017163915-horius.jpg,20231017163915-minq.jpg,20231017163915-moon.png,20231017163915-mov.png',18,0,0,14,'2023-10-17 16:39:15'),(19,'11','11','11','dsdsasad\r\nasda\r\nasdad\r\ngdkld\r\n\r\n하이!','20231017164017-pro.jpg,20231017164017-sin.png,20231017164017-war.jpg,20231017164017-wow.jpg',19,0,0,334,'2023-10-17 16:40:17'),(22,'올리버쌤','1','안녕하세요','ㅇ','no',19,3,2,2,'2023-10-18 09:29:57'),(23,'ㄴ','1','ㅇㄴㅁㄹ','ㅁㄴㅇㄹ','no',19,2,1,1,'2023-10-18 09:30:10'),(24,'ㅁㅊ','1','ㅁㅊ','ㅁㅊ','no',19,1,3,2,'2023-10-18 09:31:06');
/*!40000 ALTER TABLE `reboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `rev_no` int NOT NULL AUTO_INCREMENT,
  `mv_no` int NOT NULL DEFAULT '0',
  `mem_id` varchar(50) DEFAULT NULL,
  `rev_title` varchar(100) DEFAULT NULL,
  `rev_poster` varchar(100) DEFAULT NULL,
  `rev_age` varchar(50) DEFAULT NULL,
  `rev_name` varchar(50) DEFAULT NULL,
  `rev_date` varchar(50) DEFAULT NULL,
  `rev_place` varchar(50) DEFAULT NULL,
  `rev_regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`rev_no`),
  KEY `mem_id` (`mem_id`),
  KEY `mv_no` (`mv_no`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`mem_id`) REFERENCES `member_table` (`mem_id`) ON DELETE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`mv_no`) REFERENCES `movie_table` (`mv_no`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (38,19,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/elemental.jpg\" style=\"width:200px;height:250px;\">','image/all.png','','2023.9.1(','2','2023-09-15 02:17:10'),(39,14,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/Oppenheimer2.jpg\" style=\"width:200px;height:250px;\">','image/15.png','','2023.9.6(','4','2023-09-15 02:18:18'),(40,14,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/Oppenheimer2.jpg\" style=\"width:200px;height:250px;\">','image/15.png','','2023.9.4(','3','2023-09-18 01:08:53'),(41,15,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/concrete.jpg\" style=\"width:200px;height:250px;\">','image/15.png','','2023.9.8(','2','2023-09-19 05:08:38'),(42,15,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/concrete.jpg\" style=\"width:200px;height:250px;\">','image/15.png','','2023.9.8(','2','2023-09-19 05:08:39'),(43,15,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/concrete.jpg\" style=\"width:200px;height:250px;\">','image/15.png','','2023.9.8(','2','2023-09-19 05:08:41'),(44,20,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/Maya.jpg\" style=\"width:200px;height:250px;\">','image/all.png','','2023.9.3(','5','2023-09-19 05:11:10'),(45,15,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/concrete.jpg\" style=\"width:200px;height:250px;\">','image/15.png','','2023.9.3(','4','2023-09-19 05:20:40'),(46,14,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/Oppenheimer2.jpg\" style=\"width:200px;height:250px;\">','image/15.png','','2023.9.3(','5','2023-09-19 05:40:11'),(47,14,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/Oppenheimer2.jpg\" style=\"width:200px;height:250px;\">','image/15.png','','2023.9.9(','1','2023-09-19 06:15:10'),(48,16,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/HoneySweet.jpg\" style=\"width:200px;height:250px;\">','image/12.png','','2023.9.2(','1','2023-09-19 06:32:09'),(49,15,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/concrete.jpg\" style=\"width:200px;height:250px;\">','image/15.png','','2023.9.2(','5','2023-09-19 06:55:14'),(50,16,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/HoneySweet.jpg\" style=\"width:200px;height:250px;\">','image/12.png','','2023.9.3(','1','2023-09-19 06:59:01'),(51,19,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/elemental.jpg\" style=\"width:200px;height:250px;\">','image/all.png','','2023.9.14(','5','2023-09-19 07:19:41'),(52,21,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/mega.jpg\" style=\"width:200px;height:250px;\">','image/12.png','','2023.9.2(','4','2023-09-19 07:26:59'),(53,20,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/Maya.jpg\" style=\"width:200px;height:250px;\">','image/all.png','','2023.9.3(','5','2023-09-19 07:36:04'),(56,19,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/elemental.jpg\" style=\"width:200px;height:250px;\">','image/all.png','','2023.9.20(','1','2023-09-20 06:44:13'),(57,19,'joony','\n   &nbsp;&nbsp;','<img src=\"upload/elemental.jpg\" style=\"width:200px;height:250px;\">','image/all.png','','2023.9.20(','2','2023-09-20 08:28:37'),(58,18,NULL,'\n   &nbsp;&nbsp;','<img src=\"upload/Milsu.png\" style=\"width:200px;height:250px;\">','image/15.png','','2023.9.25(','5','2023-09-22 00:15:41'),(59,18,NULL,'\n   &nbsp;&nbsp;','<img src=\"upload/Milsu.png\" style=\"width:200px;height:250px;\">','image/15.png','','2023.9.22(','1','2023-09-22 00:23:13'),(60,14,'wlwlgoyo@naver.com','\n   &nbsp;&nbsp;','<img src=\"upload/Oppenheimer23.jpg\" style=\"width:200px;height:250px;\">','image/15.png','','2023.9.23(','3','2023-09-22 05:19:46'),(61,14,'test','\n   &nbsp;&nbsp;','<img src=\"upload/Oppenheimer23.jpg\" style=\"width:200px;height:250px;\">','image/15.png','','2023.9.24(','3','2023-09-22 05:31:04'),(63,14,NULL,'\n   &nbsp;&nbsp;','<img src=\"upload/Oppenheimer23.jpg\" style=\"width:200px;height:250px;\">','image/15.png','','2023.9.27(','5','2023-09-25 00:26:47');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_table`
--

DROP TABLE IF EXISTS `seat_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_table` (
  `seat_no` int NOT NULL AUTO_INCREMENT,
  `rev_no` int DEFAULT NULL,
  `adultCnt` int DEFAULT NULL,
  `teenCnt` int DEFAULT NULL,
  `childCnt` int DEFAULT NULL,
  `seat_name` varchar(100) DEFAULT NULL,
  `totalPrice` int DEFAULT NULL,
  PRIMARY KEY (`seat_no`),
  KEY `rev_no` (`rev_no`),
  CONSTRAINT `seat_table_ibfk_1` FOREIGN KEY (`rev_no`) REFERENCES `reservation` (`rev_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_table`
--

LOCK TABLES `seat_table` WRITE;
/*!40000 ALTER TABLE `seat_table` DISABLE KEYS */;
INSERT INTO `seat_table` VALUES (14,38,1,0,0,'F5',14000),(15,40,1,0,0,'G5',14000),(16,47,2,1,0,'F3,F4,F5',39000),(18,51,2,0,0,'F1,F2',28000),(19,51,1,0,0,'G1',14000),(22,56,1,1,0,'H4,H5',25000),(23,57,1,1,0,'G5,G6',25000),(25,59,1,1,0,'F4,F5',25000),(26,60,2,1,0,'E3,E4,E5',39000),(27,61,2,2,1,'H3,H4,H5,H6,H7',58000),(29,63,2,0,0,'D5,D6',28000);
/*!40000 ALTER TABLE `seat_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `shop_num` int NOT NULL AUTO_INCREMENT,
  `shop_category` varchar(10) NOT NULL,
  `shop_sangpum` varchar(20) NOT NULL,
  `shop_detail` varchar(100) DEFAULT NULL,
  `shop_photo` varchar(30) NOT NULL,
  `shop_price` int NOT NULL,
  `shop_ipgoday` date NOT NULL,
  PRIMARY KEY (`shop_num`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (1,'','\'3\'CINE ','','1.png',10000,'2023-09-12'),(2,'','\'3\'','','2.png',34000,'2023-09-12'),(3,'','','','3.png',5500,'2023-09-12'),(4,'','','','4.png',5000,'2023-09-12'),(5,'','','','5.png',6500,'2023-09-12'),(6,'','','','6.png',6000,'2023-09-12'),(7,'','','','7.png',6500,'2023-09-12'),(8,'','','','8.png',6000,'2023-09-12'),(9,'','','','10.png',6500,'2023-09-12'),(10,'','','','9.png',6000,'2023-09-12'),(11,'','','','11.png',13000,'2023-09-12'),(12,'','','','12.png',15000,'2023-09-12'),(13,'','\'3\'CINE ','','13.png',61000,'2023-09-12'),(14,'','','','14.png',4500,'2023-09-12'),(15,'','','','15.png',3500,'2023-09-12'),(16,'','ź','ź','16.png',2500,'2023-09-12'),(17,'','','','17.png',5000,'2023-09-12');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simpleboard`
--

DROP TABLE IF EXISTS `simpleboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simpleboard` (
  `num` int NOT NULL AUTO_INCREMENT,
  `writer` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `story` varchar(2000) DEFAULT NULL,
  `readcount` int DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simpleboard`
--

LOCK TABLES `simpleboard` WRITE;
/*!40000 ALTER TABLE `simpleboard` DISABLE KEYS */;
INSERT INTO `simpleboard` VALUES (1,'dd','1234','dsaf','dd',4,'2023-08-21 12:11:39'),(2,'dd','1234','dsfa','dd',0,'2023-08-21 12:12:59'),(3,'dsfasfasd','1234','dsafgasdg','dsfasfasd',0,'2023-08-21 12:15:56'),(4,'sdafds','1234','dsaf','sdafds',0,'2023-08-21 12:16:21'),(5,'sdafds','1234','dsaf','sdafds',0,'2023-08-21 12:16:53'),(6,'sdafds','1234','dsaf','sdafds',0,'2023-08-21 12:16:56'),(7,'dsaf','1234','dsaf','dsaf',0,'2023-08-21 12:17:04'),(8,'adsf','1234','adssdg','adsf',0,'2023-08-21 12:18:23'),(9,'dsafads','1234','dsafads','dsafads',0,'2023-08-21 12:19:52'),(10,'dd','1234','dsaf','dd',0,'2023-08-21 12:22:15'),(11,'dd','1234','dsaf','dd',0,'2023-08-21 12:23:13'),(12,'dd','1234','dsaf','dd',1,'2023-08-21 12:23:15'),(13,'dd','1234','daf','dd',1,'2023-08-21 12:31:10'),(14,'dd','1234','daf','dd',0,'2023-08-21 12:31:26'),(15,'dd','1234','daf','dd',3,'2023-08-21 12:31:30'),(27,'김영환','1234','ㅁㅇㄶㅁㄴㅇㅎㄴㅁ','김영환',0,'2023-08-22 09:18:27'),(28,'김영환12312','1234','adsgsdga','김영환12312',0,'2023-08-22 09:18:35'),(29,'dd','1234','fgdsagsa','dd',0,'2023-08-22 09:18:46'),(30,'asdg65sdg','1234','azgsdg','asdg65sdg',0,'2023-08-22 09:18:55'),(31,'sdafds123','1234','adsfadsg','sdafds123',0,'2023-08-22 09:19:05');
/*!40000 ALTER TABLE `simpleboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simpleguest`
--

DROP TABLE IF EXISTS `simpleguest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simpleguest` (
  `num` smallint NOT NULL AUTO_INCREMENT,
  `image` varchar(20) DEFAULT NULL,
  `nick` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `story` varchar(1000) DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simpleguest`
--

LOCK TABLES `simpleguest` WRITE;
/*!40000 ALTER TABLE `simpleguest` DISABLE KEYS */;
INSERT INTO `simpleguest` VALUES (28,'1','adsfas','1234','dafdsf','2023-08-11 17:45:07');
/*!40000 ALTER TABLE `simpleguest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smartanswer`
--

DROP TABLE IF EXISTS `smartanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smartanswer` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `num` int DEFAULT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `num` (`num`),
  CONSTRAINT `smartanswer_ibfk_1` FOREIGN KEY (`num`) REFERENCES `smartboard` (`num`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartanswer`
--

LOCK TABLES `smartanswer` WRITE;
/*!40000 ALTER TABLE `smartanswer` DISABLE KEYS */;
INSERT INTO `smartanswer` VALUES (3,25,'dsfsdf','sdfsdf','2023-08-31 11:12:53'),(4,28,'dsf','af','2023-08-31 11:17:24'),(6,26,'sadfad','fasdfadsf','2023-08-31 13:51:04'),(7,26,'ㅁ','ㅇㄻㅎㅁ','2023-08-31 14:11:18'),(8,26,'ㅇㄶㅇㄴㅁㅎㄴㅁ','ㅇㅎㅁㄴㅇㅎㅁㄴㅇ','2023-08-31 14:11:21'),(9,28,'ㅇㅁㄻㅇ','ㄻㅇㄴㄹㅇ','2023-08-31 16:25:12'),(10,28,'ㄴㄴㄴㄴ','ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ','2023-08-31 16:25:15'),(11,28,'최성현','응 너 겜 개못해 ㅋㅋ','2023-08-31 16:29:12'),(12,28,'김영환','죄송합니다...','2023-08-31 16:29:28'),(13,28,'ㅗ','ㅗ','2023-08-31 16:30:10'),(14,28,'뭐가 돼!','되긴 뭐가 돼 !!','2023-08-31 16:31:10'),(15,26,'김영준','안녕하세요','2023-09-06 12:26:46'),(16,28,'ㄴㅇㅁㄹㄴㅁㅇ','ㄴㅇㄻㄴㅇㄹ','2023-09-06 15:08:48');
/*!40000 ALTER TABLE `smartanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smartboard`
--

DROP TABLE IF EXISTS `smartboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smartboard` (
  `num` int NOT NULL AUTO_INCREMENT,
  `writer` varchar(20) DEFAULT NULL,
  `subject` varchar(1000) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `readcount` int DEFAULT '0',
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartboard`
--

LOCK TABLES `smartboard` WRITE;
/*!40000 ALTER TABLE `smartboard` DISABLE KEYS */;
INSERT INTO `smartboard` VALUES (25,'dddddd','ddddddddddddd','dddddddddddddddddd',88,'2023-08-30 11:56:58'),(26,'dddddd','dddddddddddd','ddddddddddddddddd',271,'2023-08-30 11:57:02'),(27,'ss','sssssssssss','sssssssssssssssssssss',12,'2023-08-30 11:57:06'),(28,'김영환','sssss','sssssssssssssssssss',223,'2023-08-30 11:57:37'),(29,'ㄴㄴㄴ','ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ','<img src=\"/JspMiniProject/save/2023_08_31_141328.png\"><br>',1,'2023-08-31 14:13:29');
/*!40000 ALTER TABLE `smartboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spmember`
--

DROP TABLE IF EXISTS `spmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spmember` (
  `num` smallint NOT NULL AUTO_INCREMENT,
  `id` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `hp` varchar(20) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `gaip` date DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spmember`
--

LOCK TABLES `spmember` WRITE;
/*!40000 ALTER TABLE `spmember` DISABLE KEYS */;
INSERT INTO `spmember` VALUES (18,'asd3','123','김영환','010-2222-3333','../upload/b5.png','2023-08-16'),(19,'asd4','1234','지렸어','010-1111-5555','../upload/b9.png','2023-08-16');
/*!40000 ALTER TABLE `spmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test01`
--

DROP TABLE IF EXISTS `test01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test01` (
  `num` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `age` smallint DEFAULT NULL,
  `height` decimal(5,1) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `ipsaday` date DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test01`
--

LOCK TABLES `test01` WRITE;
/*!40000 ALTER TABLE `test01` DISABLE KEYS */;
/*!40000 ALTER TABLE `test01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test1`
--

DROP TABLE IF EXISTS `test1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test1` (
  `num` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `age` smallint DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `ipsaday` date DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test1`
--

LOCK TABLES `test1` WRITE;
/*!40000 ALTER TABLE `test1` DISABLE KEYS */;
INSERT INTO `test1` VALUES (1,'이영자',22,'2023-08-10 14:33:20','2023-08-10'),(2,'이효리',25,'1988-07-23 00:00:00','2022-11-11'),(5,'김영철',NULL,'1978-07-13 00:00:00',NULL);
/*!40000 ALTER TABLE `test1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'coffee'
--

--
-- Dumping routines for database 'coffee'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-18 17:42:56
