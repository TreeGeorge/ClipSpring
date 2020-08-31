-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: clip
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `actor_no` int NOT NULL AUTO_INCREMENT COMMENT '영화 배우 프라이머리 키',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '배우 이름',
  PRIMARY KEY (`actor_no`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='영화 배우 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'황정민'),(2,'이정재'),(3,'박정민'),(4,'박소이'),(5,'엄정화'),(6,'박성웅'),(7,'이상윤'),(8,'배정남'),(9,'이선빈'),(10,'박영남'),(11,'김환진'),(12,'강희선'),(13,'여민정'),(14,'정유미'),(15,'정우성'),(16,'곽도원'),(17,'유연석'),(18,'앵거스 맥페이든'),(19,'강동원'),(20,'이정현');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy_coin_list`
--

DROP TABLE IF EXISTS `buy_coin_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy_coin_list` (
  `buy_coin_list_no` int NOT NULL AUTO_INCREMENT COMMENT '코인 구매 내역 프라이머리 키',
  `date` datetime NOT NULL COMMENT '코인 충전 시각',
  `price` int NOT NULL COMMENT '코인 충전 금액(현금)',
  `user_no` int DEFAULT NULL,
  PRIMARY KEY (`buy_coin_list_no`),
  KEY `fk_buy_coin_list_user1_idx` (`user_no`),
  CONSTRAINT `fk_buy_coin_list_user1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='코인 구매 내역 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_coin_list`
--

LOCK TABLES `buy_coin_list` WRITE;
/*!40000 ALTER TABLE `buy_coin_list` DISABLE KEYS */;
INSERT INTO `buy_coin_list` VALUES (1,'2020-07-24 00:00:00',50000,1),(2,'2020-07-24 00:00:00',10000,2),(3,'2020-07-24 00:00:00',250000,3),(4,'2020-07-24 00:00:00',250000,3),(5,'2020-07-24 00:00:00',4000,4);
/*!40000 ALTER TABLE `buy_coin_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy_count`
--

DROP TABLE IF EXISTS `buy_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy_count` (
  `buy_count_no` int NOT NULL AUTO_INCREMENT COMMENT '영화 구매수 프라이머리키',
  `movie_no` int DEFAULT NULL,
  `date` date NOT NULL COMMENT '기간별 영화 구매 수를 구하기 위한 영화 구매 날자 로그',
  PRIMARY KEY (`buy_count_no`),
  KEY `fk_buy_count_movie1_idx` (`movie_no`),
  CONSTRAINT `fk_buy_count_movie1` FOREIGN KEY (`movie_no`) REFERENCES `movie` (`movie_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='영화 구매 수 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_count`
--

LOCK TABLES `buy_count` WRITE;
/*!40000 ALTER TABLE `buy_count` DISABLE KEYS */;
INSERT INTO `buy_count` VALUES (1,1,'2020-08-12'),(2,2,'2020-08-12'),(3,2,'2020-08-12'),(4,3,'2020-08-12'),(5,4,'2020-08-12'),(6,5,'2020-08-12');
/*!40000 ALTER TABLE `buy_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy_movie_list`
--

DROP TABLE IF EXISTS `buy_movie_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy_movie_list` (
  `buy_movie_list_no` int NOT NULL AUTO_INCREMENT COMMENT '영화 구매 내역 프라이머리 키',
  `date` datetime NOT NULL COMMENT '영화 구매 시간',
  `is_delete` enum('Y','N','D') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '내 영화의 상태\nN = 내영상, Y = 휴지통, D = 내영상과 휴지통 모두 존재하지 않음(완전삭제, 하지만 구매내역은 남는다)',
  `user_no` int DEFAULT NULL,
  `movie_no` int DEFAULT NULL,
  PRIMARY KEY (`buy_movie_list_no`),
  KEY `fk_buy_movie_list_user1_idx` (`user_no`),
  KEY `fk_buy_movie_list_movie1_idx` (`movie_no`),
  CONSTRAINT `fk_buy_movie_list_movie1` FOREIGN KEY (`movie_no`) REFERENCES `movie` (`movie_no`),
  CONSTRAINT `fk_buy_movie_list_user1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='영화 구매 내역 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_movie_list`
--

LOCK TABLES `buy_movie_list` WRITE;
/*!40000 ALTER TABLE `buy_movie_list` DISABLE KEYS */;
INSERT INTO `buy_movie_list` VALUES (1,'2020-08-12 00:00:00','Y',3,2),(2,'2020-08-12 00:00:00','N',4,4),(3,'2020-08-12 00:00:00','N',4,5),(4,'2020-08-12 00:00:00','D',4,2),(5,'2020-08-12 00:00:00','Y',2,3),(6,'2020-08-12 00:00:00','N',2,1);
/*!40000 ALTER TABLE `buy_movie_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_type`
--

DROP TABLE IF EXISTS `category_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_type` (
  `category_type_no` int NOT NULL AUTO_INCREMENT COMMENT '카테고리 프라이머리 키',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '카테고리 이름[장르(x번대), 제작사(xx번대)]',
  `type` enum('G','C') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'G = 장르, C = 제작사',
  PRIMARY KEY (`category_type_no`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='카테고리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_type`
--

LOCK TABLES `category_type` WRITE;
/*!40000 ALTER TABLE `category_type` DISABLE KEYS */;
INSERT INTO `category_type` VALUES (1,'액션','G'),(2,'코미디','G'),(3,'드라마','G'),(4,'멜로','G'),(5,'공포','G'),(6,'스릴러','G'),(7,'SF','G'),(8,'판타지','G'),(9,'애니메이션','G'),(10,'다큐멘터리','G'),(100,'디즈니','C'),(101,'워너브러더스','C'),(102,'소니픽쳐서','C'),(103,'NBC 유니버셜','C'),(104,'20세기 폭스','C'),(105,'파라마운트','C');
/*!40000 ALTER TABLE `category_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_appraisal`
--

DROP TABLE IF EXISTS `comment_appraisal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_appraisal` (
  `appraisal_no` int NOT NULL AUTO_INCREMENT COMMENT '댓글 좋아요 프라이머리 키',
  `answer` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '댓글 좋아요 or 싫어요',
  `user_no` int DEFAULT NULL,
  `movie_comment_no` int DEFAULT NULL,
  PRIMARY KEY (`appraisal_no`),
  KEY `fk_comment_appraisal_user1_idx` (`user_no`),
  KEY `fk_comment_appraisal_movie_comment1_idx` (`movie_comment_no`),
  CONSTRAINT `fk_comment_appraisal_movie_comment1` FOREIGN KEY (`movie_comment_no`) REFERENCES `movie_comment` (`movie_comment_no`),
  CONSTRAINT `fk_comment_appraisal_user1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='댓글 좋아요, 싫어요 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_appraisal`
--

LOCK TABLES `comment_appraisal` WRITE;
/*!40000 ALTER TABLE `comment_appraisal` DISABLE KEYS */;
INSERT INTO `comment_appraisal` VALUES (1,'Y',3,1),(2,'N',4,1),(3,'Y',3,2),(4,'Y',4,2),(5,'N',5,1),(6,'N',1,3);
/*!40000 ALTER TABLE `comment_appraisal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_list`
--

DROP TABLE IF EXISTS `coupon_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_list` (
  `coupon_list_no` int NOT NULL AUTO_INCREMENT COMMENT '발급할 쿠폰의 프라이머리 키',
  `price` int NOT NULL COMMENT '쿠폰의 할인 코인',
  `period` date NOT NULL COMMENT '쿠폰 기간',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '쿠폰의 제목',
  PRIMARY KEY (`coupon_list_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_list`
--

LOCK TABLES `coupon_list` WRITE;
/*!40000 ALTER TABLE `coupon_list` DISABLE KEYS */;
INSERT INTO `coupon_list` VALUES (1,3000,'2020-09-25','1주년 기념 이벤트 쿠폰'),(2,4000,'2020-09-23','여름 기념 이벤트 쿠폰');
/*!40000 ALTER TABLE `coupon_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest`
--

DROP TABLE IF EXISTS `interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interest` (
  `interest_no` int NOT NULL AUTO_INCREMENT COMMENT '관심 영화 프라이머리 키',
  `user_no` int DEFAULT NULL,
  `movie_no` int DEFAULT NULL,
  PRIMARY KEY (`interest_no`),
  KEY `fk_interest_user1_idx` (`user_no`),
  KEY `fk_interest_movie1_idx` (`movie_no`),
  CONSTRAINT `fk_interest_movie1` FOREIGN KEY (`movie_no`) REFERENCES `movie` (`movie_no`),
  CONSTRAINT `fk_interest_user1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest`
--

LOCK TABLES `interest` WRITE;
/*!40000 ALTER TABLE `interest` DISABLE KEYS */;
INSERT INTO `interest` VALUES (1,1,4),(2,1,5),(3,2,1),(4,3,2),(5,4,3),(6,5,4);
/*!40000 ALTER TABLE `interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `movie_no` int NOT NULL AUTO_INCREMENT COMMENT '영화 프라이머리 키',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '영화 제목',
  `is_buy` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '영화의 구매 타입 ( 구매 )',
  `is_rent` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '영화의 구매 타입 ( 대여 )',
  `director` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '영화 감독',
  `price` int NOT NULL DEFAULT '0' COMMENT '영화 코인 가격',
  `sale` int NOT NULL DEFAULT '0' COMMENT '영화 할인율 (%)',
  `thumbnail` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '영화 썸네일 경로',
  `preview` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '영화 예고편 링크',
  `summary` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '영화 줄거리',
  `runtime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '영화 관람 시간',
  `age` enum('12','15','19') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '영화 나이 등급',
  `period` date DEFAULT NULL COMMENT '무료 영화 기간',
  PRIMARY KEY (`movie_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='영화 정보 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'다만 악에서 구하소서','Y','N','홍원찬',2000,100,'썸네일 주소','예고편 주소','줄거리 ~~','108분','15','2020-09-25'),(2,'오케이 마담','Y','Y','이철하',3000,0,'썸네일 주소','예고편 주소','줄거리 ~~','100분','15',NULL),(3,'극장판 짱구는 못말려 : 신혼여행 허리케인~ 사라진 아빠!','N','Y','하시모토 마사카즈',4000,20,'썸네일 주소','예고편 주소','줄거리 ~~','100분',NULL,NULL),(4,'강철비2 : 정상회담','Y','Y','양우석',5000,30,'썸네일 주소','예고편 주소','줄거리 ~~','131분','15',NULL),(5,'반도','Y','N','연상호',6000,40,'썸네일 주소','예고편 주소','줄거리 ~~','116분','15',NULL);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_actor`
--

DROP TABLE IF EXISTS `movie_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_actor` (
  `movie_actor_no` int NOT NULL AUTO_INCREMENT COMMENT '각 영화의 출연 배우 프라이머리 키',
  `actor_no` int DEFAULT NULL,
  `movie_no` int DEFAULT NULL,
  PRIMARY KEY (`movie_actor_no`),
  KEY `fk_movie_actor_actor1_idx` (`actor_no`),
  KEY `fk_movie_actor_movie1_idx` (`movie_no`),
  CONSTRAINT `fk_movie_actor_actor1` FOREIGN KEY (`actor_no`) REFERENCES `actor` (`actor_no`),
  CONSTRAINT `fk_movie_actor_movie1` FOREIGN KEY (`movie_no`) REFERENCES `movie` (`movie_no`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='영화와 배우를 이어주는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_actor`
--

LOCK TABLES `movie_actor` WRITE;
/*!40000 ALTER TABLE `movie_actor` DISABLE KEYS */;
INSERT INTO `movie_actor` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,2),(6,6,2),(7,7,2),(8,8,2),(9,9,2),(10,10,3),(11,11,3),(12,12,3),(13,13,3),(14,14,3),(15,15,4),(16,16,4),(17,17,4),(18,18,4),(19,19,5),(20,20,5);
/*!40000 ALTER TABLE `movie_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_category`
--

DROP TABLE IF EXISTS `movie_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_category` (
  `movie_category_no` int NOT NULL AUTO_INCREMENT COMMENT '각 영화의 장르 및 제작사 프라이머리 키',
  `category_type_no` int DEFAULT NULL,
  `movie_no` int DEFAULT NULL,
  PRIMARY KEY (`movie_category_no`),
  KEY `fk_movie_category_category_type1_idx` (`category_type_no`),
  KEY `fk_movie_category_movie1_idx` (`movie_no`),
  CONSTRAINT `fk_movie_category_category_type1` FOREIGN KEY (`category_type_no`) REFERENCES `category_type` (`category_type_no`),
  CONSTRAINT `fk_movie_category_movie1` FOREIGN KEY (`movie_no`) REFERENCES `movie` (`movie_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='카테고리와 영화를 이어주는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_category`
--

LOCK TABLES `movie_category` WRITE;
/*!40000 ALTER TABLE `movie_category` DISABLE KEYS */;
INSERT INTO `movie_category` VALUES (1,1,1),(2,6,1),(3,1,2),(4,2,2),(5,9,3),(6,1,4),(7,3,4),(8,1,5),(9,3,5);
/*!40000 ALTER TABLE `movie_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_comment`
--

DROP TABLE IF EXISTS `movie_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_comment` (
  `movie_comment_no` int NOT NULL AUTO_INCREMENT COMMENT '영화 댓글 프라이머리 키',
  `editdate` datetime NOT NULL COMMENT '댓글 등록 시간',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '댓글 내용',
  `userid` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '회원이 삭제됐을때를 대비하여 따로 아이디 값을 저장',
  `user_no` int DEFAULT NULL,
  `movie_no` int DEFAULT NULL,
  PRIMARY KEY (`movie_comment_no`),
  KEY `fk_movie_comment_movie1_idx` (`movie_no`),
  KEY `fk_movie_comment_user1_idx` (`user_no`),
  CONSTRAINT `fk_movie_comment_movie1` FOREIGN KEY (`movie_no`) REFERENCES `movie` (`movie_no`),
  CONSTRAINT `fk_movie_comment_user1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='영화 댓글 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_comment`
--

LOCK TABLES `movie_comment` WRITE;
/*!40000 ALTER TABLE `movie_comment` DISABLE KEYS */;
INSERT INTO `movie_comment` VALUES (1,'2020-08-12 00:00:00','너무 재밌어요~','master001',1,1),(2,'2020-08-12 00:00:00','개노잼;','master001',1,2),(3,'2020-08-12 00:00:00','빨리 보고 싶어요','master002',2,3);
/*!40000 ALTER TABLE `movie_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star_rating`
--

DROP TABLE IF EXISTS `star_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `star_rating` (
  `star_rating_number` int NOT NULL AUTO_INCREMENT COMMENT '별점 프라이머리 키',
  `score` double NOT NULL DEFAULT '0' COMMENT '영화 별점 점수',
  `user_no` int DEFAULT NULL,
  `movie_no` int DEFAULT NULL,
  PRIMARY KEY (`star_rating_number`),
  KEY `fk_star_rating_user_idx` (`user_no`),
  KEY `fk_star_rating_movie1_idx` (`movie_no`),
  CONSTRAINT `fk_star_rating_movie1` FOREIGN KEY (`movie_no`) REFERENCES `movie` (`movie_no`),
  CONSTRAINT `fk_star_rating_user` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='영화 별점 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star_rating`
--

LOCK TABLES `star_rating` WRITE;
/*!40000 ALTER TABLE `star_rating` DISABLE KEYS */;
INSERT INTO `star_rating` VALUES (1,4,1,1),(2,2.5,1,2),(3,3,1,3),(4,5,2,4),(5,0,2,5),(6,1,3,1),(7,1.5,4,2),(8,4.5,5,3),(9,2,5,4);
/*!40000 ALTER TABLE `star_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_no` int NOT NULL AUTO_INCREMENT COMMENT '회원번호 프라이머리키',
  `id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '회원 아이디',
  `pw` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '회원 비밀번호',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '회원 이름',
  `gender` enum('M','F') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'M' COMMENT '회원 성별',
  `birthdate` date NOT NULL COMMENT '회원 생일',
  `editdate` date NOT NULL COMMENT '회원 가입날짜',
  `email` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '회원 이메일',
  `is_sendagree` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '회원 이메일 수신 동의',
  `coin` int NOT NULL DEFAULT '0' COMMENT '회원 보유 코인',
  `card` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '회원 카드 번호',
  PRIMARY KEY (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='회원 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'master001','master001','조지환','M','1994-07-20','2020-06-02','master001@naver.com','Y',50000,'4567456745674567'),(2,'master002','master001','이세빈','M','1994-07-20','2020-06-02','master002@naver.com','Y',10000,'3456345634563456'),(3,'master003','master001','김태희','M','1994-07-20','2020-06-02','master003@naver.com','Y',500000,'2345234523452345'),(4,'master004','master001','김채현','M','1994-07-20','2020-06-02','master004@naver.com','Y',2000,'1234123412341234'),(5,'master005','master001','이재건','M','1994-07-20','2020-06-02','master005@naver.com','N',0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_coupon`
--

DROP TABLE IF EXISTS `user_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_coupon` (
  `user_coupon_no` int NOT NULL AUTO_INCREMENT COMMENT '유저의 보유 쿠폰 프라이머리 키',
  `is_used` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '쿠폰의 사용 여부',
  `user_no` int DEFAULT NULL,
  `coupon_list_no` int DEFAULT NULL,
  PRIMARY KEY (`user_coupon_no`),
  KEY `fk_user_coupon_user1_idx` (`user_no`),
  KEY `fk_user_coupon_coupon_list1_idx` (`coupon_list_no`),
  CONSTRAINT `fk_user_coupon_coupon_list1` FOREIGN KEY (`coupon_list_no`) REFERENCES `coupon_list` (`coupon_list_no`),
  CONSTRAINT `fk_user_coupon_user1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='쿠폰과 회원을 연결해주는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_coupon`
--

LOCK TABLES `user_coupon` WRITE;
/*!40000 ALTER TABLE `user_coupon` DISABLE KEYS */;
INSERT INTO `user_coupon` VALUES (1,'Y',1,1),(2,'N',1,2),(3,'N',2,2),(4,'N',3,1),(5,'Y',4,1),(6,'N',4,2),(7,'N',5,1);
/*!40000 ALTER TABLE `user_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wish_list`
--

DROP TABLE IF EXISTS `wish_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish_list` (
  `wish_list_no` int NOT NULL AUTO_INCREMENT COMMENT '장바구니 프라이머리 키',
  `user_no` int DEFAULT NULL,
  `movie_no` int DEFAULT NULL,
  PRIMARY KEY (`wish_list_no`),
  KEY `fk_wish_list_user1_idx` (`user_no`),
  KEY `fk_wish_list_movie1_idx` (`movie_no`),
  CONSTRAINT `fk_wish_list_movie1` FOREIGN KEY (`movie_no`) REFERENCES `movie` (`movie_no`),
  CONSTRAINT `fk_wish_list_user1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='장바구니';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish_list`
--

LOCK TABLES `wish_list` WRITE;
/*!40000 ALTER TABLE `wish_list` DISABLE KEYS */;
INSERT INTO `wish_list` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,3,1),(6,3,5);
/*!40000 ALTER TABLE `wish_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-30 22:52:44
