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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='영화 배우 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'황정민'),(2,'이정재'),(3,'박정민'),(4,'박소이'),(5,'엄정화'),(6,'박성웅'),(7,'이상윤'),(8,'배정남'),(9,'이선빈'),(10,'박영남'),(11,'김환진'),(12,'강희선'),(13,'여민정'),(14,'정유미'),(15,'정우성'),(16,'곽도원'),(17,'유연석'),(18,'앵거스 맥페이든'),(19,'강동원'),(20,'이정현'),(21,'엠마 스톤'),(22,'라이언 고슬링'),(23,'제니퍼 러브 휴잇'),(24,'폴 니콜스'),(25,'히이라기 루미'),(26,'이리노 미유'),(27,'키이라 나이틀리'),(28,'마크 러팔로'),(29,'헤일리 스테인펠드'),(30,'애덤리바인'),(31,'조정석'),(32,'윤아'),(33,'조세핀 랭포드'),(34,'히어로 파인즈 티핀'),(35,'조지 맥케이'),(36,'딘-찰스 채프먼'),(37,'심규혁'),(38,'다이고 코타로'),(39,'김유림'),(40,'모리 나나'),(41,'최한'),(42,'오구리 슌'),(43,'강은애'),(44,'혼다 츠바사'),(45,'이장원'),(46,'히라이즈미 세이'),(47,'후쿠시 소우타'),(48,'고마츠 나나'),(49,'공유'),(50,'마동석'),(51,'김수안'),(52,'김의성'),(53,'최우식'),(54,'안소희'),(55,'에밀리아 클라크'),(56,'샘 클라플린'),(57,'송강호'),(58,'이선균'),(59,'조여정'),(60,'최우식'),(61,'박소담'),(62,'이정은'),(63,'장혜진'),(64,'이주영'),(65,'문소리'),(66,'구교환'),(67,'천우희'),(68,'지창욱'),(69,'김소현'),(70,'이레'),(71,'카미키 류노스케'),(72,'카미시라이시 모네'),(73,'타니 카논'),(74,'크리스틴 벨'),(75,'이디나 멘젤'),(76,'레오나르도 디카프리오'),(77,'짐 브로드벤트'),(78,'레슬리 맨빌'),(79,'러스 쉰');
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='코인 구매 내역 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_coin_list`
--

LOCK TABLES `buy_coin_list` WRITE;
/*!40000 ALTER TABLE `buy_coin_list` DISABLE KEYS */;
INSERT INTO `buy_coin_list` VALUES (1,'2020-07-07 00:00:00',50000,1),(2,'2020-09-08 00:00:00',30000,1),(3,'2020-09-09 00:00:00',1000,1);
/*!40000 ALTER TABLE `buy_coin_list` ENABLE KEYS */;
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
  `is_watched` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '시청 판별',
  `price` int NOT NULL COMMENT '구입했을 당시 가격',
  `coupon_used` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '쿠폰을 이용해 구매한 제품인지 판별해주는 컬럼',
  `user_no` int DEFAULT NULL,
  `movie_no` int DEFAULT NULL,
  PRIMARY KEY (`buy_movie_list_no`),
  KEY `fk_buy_movie_list_user1_idx` (`user_no`),
  KEY `fk_buy_movie_list_movie1_idx` (`movie_no`),
  CONSTRAINT `fk_buy_movie_list_movie1` FOREIGN KEY (`movie_no`) REFERENCES `movie` (`movie_no`),
  CONSTRAINT `fk_buy_movie_list_user1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='영화 구매 내역 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_movie_list`
--

LOCK TABLES `buy_movie_list` WRITE;
/*!40000 ALTER TABLE `buy_movie_list` DISABLE KEYS */;
INSERT INTO `buy_movie_list` VALUES (1,'2020-07-07 00:00:00','N','N',16000,'N',1,1),(2,'2020-07-08 00:00:00','D','Y',4400,'N',1,2),(3,'2020-09-08 00:00:00','N','Y',7000,'N',1,3),(4,'2020-09-09 00:00:00','N','N',1000,'N',1,4),(5,'2020-09-07 00:00:00','Y','Y',2750,'N',1,6),(6,'2020-09-09 12:00:00','N','N',1540,'Y',1,8);
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
  `type` enum('G','C','P') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'G = 장르, C = 제작사, P = 상품별',
  `icon` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '아이콘 url',
  PRIMARY KEY (`category_type_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COMMENT='카테고리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_type`
--

LOCK TABLES `category_type` WRITE;
/*!40000 ALTER TABLE `category_type` DISABLE KEYS */;
INSERT INTO `category_type` VALUES (1,'액션','G','assets/img/action_icon.png'),(2,'코미디','G','assets/img/comedy_icon.png'),(3,'드라마','G','assets/img/drama_icon.png'),(4,'멜로','G','assets/img/melo_icon.png'),(5,'공포/스릴러','G','assets/img/horror_icon.png'),(6,'SF/판타지','G','assets/img/sf_icon.png'),(7,'애니메이션','G','assets/img/animation_icon.png'),(8,'다큐멘터리','G','assets/img/dacumentary_icon.png'),(100,'디즈니','C','assets/img/disney_icon.png'),(101,'워너브러더스','C','assets/img/wb_icon.png'),(102,'소니픽쳐스','C','assets/img/sony_icon.png'),(103,'NBC 유니버셜','C','assets/img/nbc_icon.png'),(104,'20세기 폭스','C','assets/img/fox_icon.png'),(105,'파라마운트','C','assets/img/paramount_icon.png'),(1000,'할인 영화관','P','assets/img/sale_icon.png'),(1001,'추천 영화','P','assets/img/recommend_icon.png'),(1002,'최신 영화','P','assets/img/new_icon.png');
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
/*!40000 ALTER TABLE `comment_appraisal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `coupon_no` int NOT NULL AUTO_INCREMENT COMMENT '발급할 쿠폰의 프라이머리 키',
  `price` int NOT NULL COMMENT '쿠폰의 할인 코인',
  `period` date NOT NULL COMMENT '쿠폰 기간',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '쿠폰의 제목',
  PRIMARY KEY (`coupon_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,3000,'2020-09-25','1주년 기념 이벤트 쿠폰'),(2,4000,'2020-09-23','여름 기념 이벤트 쿠폰'),(3,5000,'2025-09-25','고객 감사 이벤트 쿠폰');
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest`
--

LOCK TABLES `interest` WRITE;
/*!40000 ALTER TABLE `interest` DISABLE KEYS */;
INSERT INTO `interest` VALUES (10,1,10);
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
  `type` enum('B','R') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'B' COMMENT '영화 구매 타입 ( B = 구매, R = 대여 )',
  `director` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '영화 감독',
  `price` int NOT NULL DEFAULT '0' COMMENT '영화 코인 가격',
  `sale` int NOT NULL DEFAULT '0' COMMENT '영화 할인율 (%)',
  `thumbnail` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '영화 썸네일 경로',
  `preview` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '영화 예고편 링크',
  `summary` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '영화 줄거리',
  `runtime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '영화 관람 시간',
  `release_date` date NOT NULL,
  `age` enum('12','15','19') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '영화 나이 등급',
  `period` date DEFAULT NULL COMMENT '무료 영화 기간',
  PRIMARY KEY (`movie_no`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='영화 정보 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'다만 악에서 구하소서','B','홍원찬',16000,0,'https://movie-phinf.pstatic.net/20200706_191/1594001490577tifkl_JPEG/movie_image.jpg?type=f148_202','예고편 주소','태국에서 충격적인 납치사건이 발생하고 마지막 청부살인 미션을 끝낸 암살자 인남(황정민)은 그것이 자신과 관계된 것임을 알게 된다. 인남은 곧바로 태국으로 향하고, 조력자 유이(박정민)를 만나 사건을 쫓기 시작한다. 한편, 자신의 형제가 인남에게 암살당한 것을 알게 된 레이(이정재). 무자비한 복수를 계획한 레이는 인남을 추격하기 위해 태국으로 향하는데... 처절한 암살자 VS 무자비한 추격자 멈출 수 없는 두 남자의 지독한 추격이 시작된다!','108분','2020-08-05','15',NULL),(2,'반도','R','연상호',10000,0,'https://movie-phinf.pstatic.net/20200624_137/15929908359489lOON_JPEG/movie_image.jpg?type=f200_286','예고편 주소','[전대미문의 재난 그 후 4년 폐허의 땅으로 다시 들어간다!] 4년 전, 나라 전체를 휩쓸어버린 전대미문의 재난에서 가까스로 탈출했던 ‘정석’(강동원). 바깥세상으로부터 철저히 고립된 반도에 다시 들어가야 하는 피할 수 없는 제안을 받는다. 제한 시간 내에 지정된 트럭을 확보해 반도를 빠져 나와야 하는 미션을 수행하던 중 인간성을 상실한 631부대와 4년 전보다 더욱 거세진 대규모 좀비 무리가 정석 일행을 습격한다. 절체절명의 순간, 폐허가 된 땅에서 살아남은 ‘민정’(이정현) 가족의 도움으로 위기를 가까스로 모면하고 이들과 함께 반도를 탈출할 수 있는 마지막 기회를 잡기로 한다. 되돌아온 자, 살아남은 자 그리고 미쳐버린 자 필사의 사투가 시작된다!','100분','2020-07-15','15',NULL),(3,'강철비2: 정상회담','B','양우석',7000,0,'https://movie-phinf.pstatic.net/20200703_48/1593739617223iuD2b_JPEG/movie_image.jpg?type=f148_202','예고편 주소','북미 평화협정 체결을 위한 대한민국 대통령(정우성), 북한의 최고지도자인 위원장(유연석)과 미국 대통령(앵거스 맥페이든)간의 남북미 정상회담이 북한 원산에서 열린다. 북미 사이 좀처럼 이견이 좁혀지지 않는 가운데, 핵무기 포기와 평화체제 수립에 반발하는 북 호위총국장(곽도원)의 쿠데타가 발생하고, 납치된 세 정상은 북한 핵잠수함에 인질로 갇힌다. 그리고, 좁디 좁은 함장실 안, 예기치 못한 진정한 정상회담이 벌어지게 되는데…  동북아시아의 운명이 핵잠수함에 갇혔다! 과연, 남북미 세 지도자는 전쟁 위기를 막을 수 있을 것인가?','131분','2020-07-29','15',NULL),(4,'라라랜드','B','다미엔 차젤레',1000,50,'https://movie-phinf.pstatic.net/20161123_188/1479862185516tYkKO_JPEG/movie_image.jpg?type=f102_138','예고편 주소','꿈을 꾸는 사람들을 위한 별들의 도시 ‘라라랜드’. 재즈 피아니스트 ‘세바스찬’(라이언 고슬링)과 배우 지망생 ‘미아’(엠마 스톤), 인생에서 가장 빛나는 순간 만난 두 사람은 미완성인 서로의 무대를 만들어가기 시작한다.','127분','2016-12-07','12',NULL),(5,'이프 온리','B','길 정거',1500,0,'https://movie-phinf.pstatic.net/20171121_75/1511230561589Rvq85_JPEG/movie_image.jpg?type=f102_138','예고편 주소','눈앞에서 사랑하는 연인을 잃은 남자는 다음 날 아침, 자신의 옆에서 자고 있는 연인을 보고 소스라치게 놀란다.  기쁨도 잠시, 정해진 운명은 바꿀 수 없단 것을 깨달은 그는 더 늦기 전에 자신의 진정한 사랑을 전하기로 마음먹는데…  네가 아니었다면 난 영영 사랑을 몰랐을 거야 사랑하는 법을 알게 해줘서 고마워, 사랑받는 법도.','95분','2004-10-29','15',NULL),(6,'센과 치히로의 행방불명','R','미야자키 하야오',2750,0,'https://movie-phinf.pstatic.net/20150113_96/1421113909808LPjqA_JPEG/movie_image.jpg?type=f102_138','예고편 주소','금지된 세계의 문이 열렸다!   이사 가던 날, 수상한 터널을 지나자 인간에게는 금지된 신들의 세계로 오게 된 치히로.. 신들의 음식을 먹은 치히로의 부모님은 돼지로 변해버린다.    “걱정마, 내가 꼭 구해줄게…”  겁에 질린 치히로에게 다가온 정체불명의 소년 하쿠. 그의 따뜻한 말에 힘을 얻은 치히로는 인간 세계로 돌아가기 위해 사상 초유의 미션을 시작하는데…','124분','2002-06-28',NULL,NULL),(7,'비긴 어게인','B','존 카니',2000,11,'https://movie-phinf.pstatic.net/20140721_155/1405929648411y5t2g_JPEG/movie_image.jpg?type=f102_138','예고편 주소','싱어송라이터인 ‘그레타’(키이라 나이틀리)는 남자친구 ‘데이브’(애덤 리바인)가 메이저 음반회사와 계약을 하게 되면서 뉴욕으로 오게 된다. 그러나 행복도 잠시, 오랜 연인이자 음악적 파트너로서 함께 노래를 만들고 부르는 것이 좋았던 그레타와 달리 스타가 된 데이브의 마음은 어느새 변해버린다.   스타 음반프로듀서였지만 이제는 해고된 ‘댄’(마크 러팔로)은 미치기 일보직전 들른 뮤직바에서 그레타의 자작곡을 듣게 되고 아직 녹슬지 않은 촉을 살려 음반제작을 제안한다. 거리 밴드를 결성한 그들은 뉴욕의 거리를 스튜디오 삼아 진짜로 부르고 싶었던 노래를 만들어가는데…  ','104분','2014-08-13','15',NULL),(8,'엑시트','R','이상근',1540,0,'https://movie-phinf.pstatic.net/20190724_161/1563931152464tk11A_JPEG/movie_image.jpg?type=f102_138','예고편 주소','대학교 산악 동아리 에이스 출신이지만 졸업 후 몇 년째 취업 실패로 눈칫밥만 먹는 용남은 온 가족이 참석한 어머니의 칠순 잔치에서 연회장 직원으로 취업한 동아리 후배 의주를 만난다 어색한 재회도 잠시, 칠순 잔치가 무르익던 중 의문의 연기가 빌딩에서 피어 오르며 피할 새도 없이 순식간에 도심 전체는 유독가스로 뒤덮여 일대혼란에 휩싸이게 된다. 용남과 의주는 산악 동아리 시절 쌓아 뒀던 모든 체력과 스킬을 동원해 탈출을 향한 기지를 발휘하기 시작하는데…','103분','2019-07-31','12',NULL),(9,'애프터','R','제니 게이지',2500,0,'https://movie-phinf.pstatic.net/20190722_82/1563757210874ln6LL_JPEG/movie_image.jpg?type=f102_138','예고편 주소','첫 끌림 대학 입학 후 첫 파티에 초대 받게 된 신입생 ‘테사’는 진실게임을 하던 중 키스 벌칙에 걸리고 만다. 상대는 학교에서 유명한 반항아 ‘하딘’. 키스를 앞둔 0.1초 전, 모두가 주목하는 그 순간 ‘테사’는 ‘하딘’의 입술을 거절하고 만다.  첫 사랑 강렬했던 첫 만남 이후, 마치 새로운 세상을 발견한 듯 한번도 경험한 적 없던 감정에 눈을 뜨게 된 두 사람. ‘하딘’은 자신의 비밀 장소로 ‘테사’를 초대하고 이제 두 사람은 서로를 모르기 전으로 절대 되돌아 갈 수 없음을 알게 되는데…  첫 경험 그리고 <애프터>','105분','2019-08-22','15',NULL),(10,'1917','R','샘 멘데스',2500,100,'https://movie-phinf.pstatic.net/20200212_161/1581489520959v0cjn_JPEG/movie_image.jpg?type=f102_138','예고편 주소','제1차 세계대전이 한창인 1917년. 독일군에 의해 모든 통신망이 파괴된 상황 속에서 영국군 병사 \'스코필드\'(조지 맥케이)와 \'블레이크\'(딘-찰스 채프먼)에게 하나의 미션이 주어졌다.  함정에 빠진 영국군 부대의 수장 \'매켄지\' 중령(베네딕트 컴버배치)에게 \'에린무어\' 장군(콜린 퍼스)의 공격 중지 명령을 전하는 것!  둘은 1600명의 아군과 \'블레이크\'의 형(리차드 매든)을 구하기 위해 전쟁터 한복판을 가로지르며 사투를 이어가는데...','119분','2020-02-19','15','2020-09-10'),(11,'날씨의 아이','B','신카이 마코토',5000,0,'https://movie-phinf.pstatic.net/20200515_153/1589521029136pyDNk_JPEG/movie_image.jpg?type=f102_138','예고편 주소','비가 그치지 않던 어느 여름날, 가출 소년 ‘호다카’는 수상한 잡지사에 취직하게 되고 비밀스러운 소녀 ‘히나’를 우연히 만난다.  “지금부터 하늘이 맑아질 거야”  그녀의 기도에 거짓말 같이 빗줄기는 멈추고, 사람들의 얼굴에 환한 빛이 내려온다.  “신기해, 날씨 하나에 사람들의 감정이 이렇게나 움직이다니”  하지만, 맑음 뒤 흐림이 찾아오듯 두 사람은 엄청난 세계의 비밀을 마주하게 되는데…  흐리기만 했던 세상이 빛나기 시작했고, 그 끝에는 네가 있었다.','112분','2019-10-30','15',NULL),(12,'나는 내일, 어제의 너와 만난다','B','미키 타카히로',1500,0,'https://movie-phinf.pstatic.net/20170906_281/1504661660780autBq_JPEG/movie_image.jpg?type=f102_138','예고편 주소','스무 살의 ‘타카토시’는 지하철에서 우연히 만난 ‘에미’를 보고 순식간에 마음을 빼앗긴다.   운명 같은 끌림을 느낀 타카토시의 고백으로 두 사람은 연인이 되고, 매일 만나 행복한 데이트를 한다.  하지만, 왠지 종종 의미를 알 수 없는 눈물을 보이던 에미로부터 믿을 수 없는 비밀을 듣게 된 타카토시는 큰 혼란에 빠진다.  그 비밀은 바로 타카토시와 에미의 시간은 서로 반대로 흐르고 있고, 교차되는 시간 속에서 함께 할 수 있는 시간은 오직 30일뿐이라는 것.  30일 후에도, 이 사랑은 계속될 수 있을까?','110분','2017-10-12','12',NULL),(13,'부산행','B','연상호',1200,0,'https://movie-phinf.pstatic.net/20200612_248/1591937633750Vvyr6_JPEG/movie_image.jpg?type=f102_138','예고편 주소','정체불명의 바이러스가 전국으로 확산되고 대한민국 긴급재난경보령이 선포된 가운데, 열차에 몸을 실은 사람들은 단 하나의 안전한 도시 부산까지 살아가기 위한 치열한 사투를 벌이게 된다. 서울에서 부산까지의 거리 442KM 지키고 싶은, 지켜야만 하는 사람들의 극한의 사투!','118분','2016-07-20','15',NULL),(14,'미 비포 유','R','테아 샤록',1300,100,'https://movie-phinf.pstatic.net/20160520_45/14637112153058xJx0_JPEG/movie_image.jpg?type=f102_138','예고편 주소','이별을 준비하는 마지막에 나타난 짜증나는 여자 내 평생 최고의 6개월을 선물했다  6년 동안이나 일하던 카페가 문을 닫는 바람에 백수가 된 루이자(에밀리아 클라크)는 새 직장을 찾던 중 촉망 받던 젊은 사업가였던 전신마비 환자 윌(샘 클라플린)의 6개월 임시 간병인이 된다.  루이자의 우스꽝스러운 옷, 썰렁한 농담들, 속마음을 그대로 드러내는 얼굴 표정이 신경 쓰이는 윌. 말만 하면 멍청이 보듯 두 살짜리처럼 취급하고 개망나니처럼 구는 윌이 치사하기만 한 루이자.  그렇게 둘은 서로의 인생을 향해 차츰 걸어 들어가는데...  ','110분','2016-06-01','12','2020-09-12'),(15,'기생충','R','봉준호',1540,5,'https://movie-phinf.pstatic.net/20190528_36/1559024198386YVTEw_JPEG/movie_image.jpg?type=f102_138','예고편 주소','전원백수로 살 길 막막하지만 사이는 좋은 기택(송강호) 가족. 장남 기우(최우식)에게 명문대생 친구가 연결시켜 준 고액 과외 자리는 모처럼 싹튼 고정수입의 희망이다. 온 가족의 도움과 기대 속에 박사장(이선균) 집으로 향하는 기우. 글로벌 IT기업 CEO인 박사장의 저택에 도착하자 젊고 아름다운 사모님 연교(조여정)가 기우를 맞이한다.  그러나 이렇게 시작된 두 가족의 만남 뒤로, 걷잡을 수 없는 사건이 기다리고 있었으니…','131분','2019-05-30','15',NULL),(16,'메기','B','이옥섭',1200,0,'https://movie-phinf.pstatic.net/20190903_89/1567472276429VUl4Y_JPEG/movie_image.jpg?type=f102_138','예고편 주소','이 곳은 마리아 사랑병원. 오늘은 민망한 엑스레이 사진 한 장으로 병원이 발칵 뒤집혔어요! 세상에! 저를 가장 좋아하는 간호사 윤영 씨는 소문의 주인공이 자신과 남자친구일지도 모른다고 의심하고 있어요  과연 윤영 씨는 이 의심의 구덩이에서 빠져나올 수 있을까요?  아, 제 소개가 늦었네요. 저는 메기입니다.','88분','2019-09-26','15',NULL),(17,'너의 이름은','B','신카이 마코토',1200,100,'https://movie-phinf.pstatic.net/20171222_70/1513920001726sikUX_JPEG/movie_image.jpg?type=f102_138','예고편 주소','꿈 속에서 몸이 뒤바뀐 도시 소년 ‘타키’와 시골 소녀 ‘미츠하’, 만난 적 없는 두 사람이 만들어가는 기적과 사랑에 관한 이야기 <너의 이름은.>  잊고 싶지 않은 사람 잊으면 안 되는 사람 너의 이름은?','106분','2017-01-04','12','2020-09-14'),(18,'겨울왕국 2','R','크리스 벅, 제니퍼 리',2750,0,'https://movie-phinf.pstatic.net/20191121_221/1574298335357mqgLk_JPEG/movie_image.jpg?type=f102_138','예고편 주소','어느 날 부턴가 의문의 목소리가 엘사를 부르고, 평화로운 아렌델 왕국을 위협한다. 트롤은 모든 것은 과거에서 시작되었음을 알려주며 엘사의 힘의 비밀과 진실을 찾아 떠나야한다고 조언한다.   위험에 빠진 아렌델 왕국을 구해야만 하는 엘사와 안나는 숨겨진 과거의 진실을 찾아 크리스토프, 올라프 그리고 스벤과 함께 위험천만한 놀라운 모험을 떠나게 된다. 자신의 힘을 두려워했던 엘사는 이제 이 모험을 헤쳐나가기에 자신의 힘이 충분하다고 믿어야만 하는데…  두려움을 깨고 새로운 운명을 만나다!','103분','2019-11-21',NULL,NULL),(19,'인셉션','R','크리스토퍼 놀런',1300,0,'https://movie-phinf.pstatic.net/20200114_147/1578963901287frmdl_JPEG/movie_image.jpg?type=f102_138','예고편 주소','드림머신이라는 기계로 타인의 꿈과 접속해 생각을 빼낼 수 있는 미래사회.‘돔 코브’(레오나르도 디카프리오)는 생각을 지키는 특수보안요원이면서 또한 최고의 실력으로 생각을 훔치는 도둑이다. 우연한 사고로 국제적인 수배자가 된 그는 기업간의 전쟁 덕에 모든 것을 되찾을 수 있는 기회를 얻게 된다. 하지만 임무는 머릿속의 정보를 훔쳐내는 것이 아니라, 반대로 머릿속에 정보를 입력시켜야 하는 것! 그는 ‘인셉션’이라 불리는 이 작전을 성공시키기 위해 최강의 팀을 조직한다. 불가능에 가까운 게임, 하지만 반드시 이겨야만 한다!','147분','2010-07-21','12',NULL),(20,'세상의 모든 계절','B','마이크 리',1000,0,'https://movie-phinf.pstatic.net/20111223_224/1324634377920dWrz3_JPEG/movie_image.jpg?type=f102_138','예고편 주소','런던에 사는 노부부 톰과 제리는 소박하지만 행복한 일상을 보낸다. 과거의 잘못된 선택과 그로 이한 상처로 힘들어하는 제리의 직장동료 메리, 퇴직을 앞두로 삶의 기쁨을 찾지 못하는 톰의 친구 켄 등 부부는 주위의 가족과 친구들의 외로움과 슬픔, 기쁨과 행복을 함께하는 벗이 되어 준다. 그러던 어느날 아들 조이가 여자친구 케이티를 소개하는 자리에 갑자기 메리가 찾아오고, 그녀는 그간 말하지 않았던 자시의 속마음을 드러내는데...','129분','2011-03-24','12',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='영화와 배우를 이어주는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_actor`
--

LOCK TABLES `movie_actor` WRITE;
/*!40000 ALTER TABLE `movie_actor` DISABLE KEYS */;
INSERT INTO `movie_actor` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(21,19,2),(22,20,2),(23,15,3),(24,16,3),(25,17,3),(26,18,3),(27,21,4),(28,22,4),(29,23,5),(30,24,5),(31,25,6),(32,26,6),(33,27,7),(34,28,7),(35,29,7),(36,30,7),(37,31,8),(38,32,8),(39,33,9),(40,34,9),(41,35,10),(42,36,10),(43,37,11),(44,38,11),(45,39,11),(46,40,11),(47,41,11),(48,42,11),(49,43,11),(50,44,11),(51,45,11),(52,46,11),(53,47,12),(54,48,12),(55,49,13),(56,50,13),(57,51,13),(58,52,13),(59,53,13),(60,54,13),(61,14,13),(62,55,14),(63,56,14),(64,57,15),(65,58,15),(66,59,15),(67,60,15),(68,61,15),(69,62,15),(70,63,15),(71,64,16),(72,65,16),(73,66,16),(74,67,16),(75,68,17),(76,69,17),(77,70,17),(78,71,17),(79,72,17),(80,73,17),(81,74,18),(82,75,18),(83,76,19),(84,77,20),(85,78,20),(86,79,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='카테고리와 영화를 이어주는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_category`
--

LOCK TABLES `movie_category` WRITE;
/*!40000 ALTER TABLE `movie_category` DISABLE KEYS */;
INSERT INTO `movie_category` VALUES (1,1,1),(2,1,2),(3,1,3),(4,3,4),(5,2,5),(6,7,6),(7,2,7),(8,1,8),(9,3,9),(10,1,10),(11,7,11),(12,6,12),(13,1,13),(14,4,14),(15,101,14),(16,3,15),(17,2,16),(18,7,17),(19,7,18),(20,100,18),(21,1,19),(22,3,20),(23,1000,2),(24,1000,12),(25,1000,16);
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
/*!40000 ALTER TABLE `movie_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_like`
--

DROP TABLE IF EXISTS `movie_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_like` (
  `movie_like_no` int NOT NULL AUTO_INCREMENT,
  `movie_no` int DEFAULT NULL,
  `user_no` int DEFAULT NULL,
  PRIMARY KEY (`movie_like_no`),
  KEY `user_no_idx` (`user_no`),
  KEY `movie_no_idx` (`movie_no`),
  CONSTRAINT `movie_no` FOREIGN KEY (`movie_no`) REFERENCES `movie` (`movie_no`),
  CONSTRAINT `user_no` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_like`
--

LOCK TABLES `movie_like` WRITE;
/*!40000 ALTER TABLE `movie_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_like` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='회원 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'master001','master001','주영아','F','1994-07-20','2020-06-02','master001@naver.com','Y',10000,'1234123412341234');
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
  `coupon_no` int DEFAULT NULL,
  PRIMARY KEY (`user_coupon_no`),
  KEY `fk_user_coupon_user1_idx` (`user_no`),
  KEY `fk_user_coupon_coupon_list1_idx` (`coupon_no`),
  CONSTRAINT `fk_user_coupon_coupon_list1` FOREIGN KEY (`coupon_no`) REFERENCES `coupon` (`coupon_no`),
  CONSTRAINT `fk_user_coupon_user1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='쿠폰과 회원을 연결해주는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_coupon`
--

LOCK TABLES `user_coupon` WRITE;
/*!40000 ALTER TABLE `user_coupon` DISABLE KEYS */;
INSERT INTO `user_coupon` VALUES (1,'Y',1,1),(2,'N',1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='장바구니';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish_list`
--

LOCK TABLES `wish_list` WRITE;
/*!40000 ALTER TABLE `wish_list` DISABLE KEYS */;
INSERT INTO `wish_list` VALUES (1,1,18),(2,1,19);
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

-- Dump completed on 2020-09-09 20:47:44
