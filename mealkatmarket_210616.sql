-- MySQL dump 10.13  Distrib 8.0.23, for osx10.16 (x86_64)
--
-- Host: localhost    Database: mealkatmarket
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `option_type` varchar(45) NOT NULL,
  `option_id` int NOT NULL,
  `count` int NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_3a9d1785_fk_users_id` (`user_id`),
  CONSTRAINT `carts_user_id_3a9d1785_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'간편요리'),(2,'밥'),(3,'면'),(4,'반찬'),(5,'간식'),(6,'음료');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_foods`
--

DROP TABLE IF EXISTS `categories_foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_foods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint NOT NULL,
  `food_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_foods_food_id_f8a3af9a_fk_foods_id` (`food_id`),
  KEY `categories_foods_category_id_ba7b6ff8_fk_categories_id` (`category_id`),
  CONSTRAINT `categories_foods_category_id_ba7b6ff8_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `categories_foods_food_id_f8a3af9a_fk_foods_id` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_foods`
--

LOCK TABLES `categories_foods` WRITE;
/*!40000 ALTER TABLE `categories_foods` DISABLE KEYS */;
INSERT INTO `categories_foods` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,3,21),(22,3,22),(23,3,23),(24,3,24),(25,3,25),(26,3,26),(27,3,27),(28,3,28),(29,3,29),(30,3,30),(31,4,31),(32,4,32),(33,4,33),(34,4,34),(35,4,35),(36,4,36),(37,4,37),(38,4,38),(39,4,39),(40,4,40),(41,5,41),(42,5,42),(43,5,43),(44,5,44),(45,5,45),(46,5,46),(47,5,47),(48,5,48),(49,5,49),(50,5,50),(51,6,51),(52,6,52),(53,6,53),(54,6,54),(55,6,55),(56,6,56),(57,6,57),(58,6,58),(59,6,59),(60,6,60);
/*!40000 ALTER TABLE `categories_foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'carts','cart'),(1,'contenttypes','contenttype'),(4,'products','category'),(5,'products','categoryfood'),(6,'products','food'),(9,'products','foodimage'),(8,'products','requiredoption'),(7,'products','selectoption'),(2,'sessions','session'),(3,'users','user'),(11,'wishes','wish');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'users','0001_initial','2021-06-15 09:27:43.121642'),(2,'carts','0001_initial','2021-06-15 09:27:43.157011'),(3,'contenttypes','0001_initial','2021-06-15 09:27:43.170263'),(4,'contenttypes','0002_remove_content_type_name','2021-06-15 09:27:43.192472'),(5,'products','0001_initial','2021-06-15 09:27:43.329579'),(6,'products','0002_alter_food_discount','2021-06-15 09:27:43.336160'),(7,'sessions','0001_initial','2021-06-15 09:27:43.351053'),(8,'users','0002_alter_user_password','2021-06-15 09:27:43.370580'),(9,'products','0003_auto_20210615_0928','2021-06-15 09:28:48.460985'),(10,'wishes','0001_initial','2021-06-16 07:21:24.723477');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_images`
--

DROP TABLE IF EXISTS `food_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(200) NOT NULL,
  `food_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_images_food_id_b909bb79_fk_foods_id` (`food_id`),
  CONSTRAINT `food_images_food_id_b909bb79_fk_foods_id` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_images`
--

LOCK TABLES `food_images` WRITE;
/*!40000 ALTER TABLE `food_images` DISABLE KEYS */;
INSERT INTO `food_images` VALUES (1,'https://i.imgur.com/Rhsl56s.png ',1),(2,'https://i.imgur.com/JwbPA82.png',2),(3,'https://i.imgur.com/TidmFYT.png',3),(4,'https://i.imgur.com/DS1buEo.png',4),(5,'https://i.imgur.com/sQtTf3r.png',5),(6,'https://i.imgur.com/r3RShOx.png',6),(7,'https://i.imgur.com/7g3JdQL.png',7),(8,'https://i.imgur.com/0HpccHL.png',8),(9,'https://i.imgur.com/TPk4T2y.png',9),(10,'https://i.imgur.com/CECLlka.png',10),(11,'https://i.imgur.com/qFxqDnN.png',11),(12,'https://i.imgur.com/0m0ZA5b.png',12),(13,'https://i.imgur.com/ZSE4klo.png',13),(14,'https://i.imgur.com/ZY4iX8n.png',14),(15,'https://i.imgur.com/VkQDegm.png',15),(16,'https://i.imgur.com/Agfn192.png',16),(17,'https://i.imgur.com/YmiumFL.png',17),(18,'https://i.imgur.com/o4UWRX5.png',18),(19,'https://i.imgur.com/ljcQNlt.png',19),(20,'https://i.imgur.com/6tczxaL.png',20),(21,'https://i.imgur.com/m16G7ep.png',21),(22,'https://i.imgur.com/tDUZ1Ct.png',22),(23,'https://i.imgur.com/SwiHvRG.png',23),(24,'https://i.imgur.com/vUamptR.png',24),(25,'https://i.imgur.com/vBUgV3s.png',25),(26,'https://i.imgur.com/j5cEMAh.png',26),(27,'https://i.imgur.com/Zxsa3aZ.png',27),(28,'https://i.imgur.com/e6TqL7X.png',28),(29,'https://i.imgur.com/mjVjiL5.png',29),(30,'https://i.imgur.com/Dh0muvn.png',30),(31,'https://i.imgur.com/75bneLO.png',31),(32,'https://i.imgur.com/lgc9RHI.png',32),(33,'https://i.imgur.com/iHRnG60.png',33),(34,'https://i.imgur.com/AcA2rsH.png',34),(35,'https://i.imgur.com/z21goCh.png',35),(36,'https://i.imgur.com/aylXNh7.png',36),(37,'https://i.imgur.com/YjbCdHX.png',37),(38,'https://i.imgur.com/FYd89Dx.png',38),(39,'https://i.imgur.com/dXrDNLl.png',39),(40,'https://i.imgur.com/Yqi5OQt.png',40),(41,'https://i.imgur.com/wgzS1mp.png',41),(42,'https://i.imgur.com/TPCQT4h.png',42),(43,'https://i.imgur.com/zDDx8LZ.png',43),(44,'https://i.imgur.com/6u891sK.png',44),(45,'https://i.imgur.com/UUuasrL.png',45),(46,'https://i.imgur.com/USxkNQc.png',46),(47,'https://i.imgur.com/jfhOBzb.png',47),(48,'https://i.imgur.com/p9G6gyv.png',48),(49,'https://i.imgur.com/wgzS1mp.png',49),(50,'https://i.imgur.com/bE4qSU8.png',50),(51,'https://i.imgur.com/HopYyBA.png',51),(52,'https://i.imgur.com/1p5tNy8.png',52),(53,'https://i.imgur.com/O4EqYco.png',53),(54,'https://i.imgur.com/VN8kqTi.png',54),(55,'https://i.imgur.com/VN8kqTi.png',55),(56,'https://i.imgur.com/slI07Kk.png',56),(57,'https://i.imgur.com/dxzjdbF.png',57),(58,'https://i.imgur.com/dxzjdbF.png',58),(59,'https://i.imgur.com/1qUZE6x.png',59),(60,'https://i.imgur.com/66x0nLa.png',60);
/*!40000 ALTER TABLE `food_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` int unsigned NOT NULL,
  `discounted_price` decimal(10,2) NOT NULL,
  `star_score` decimal(2,1) NOT NULL,
  `review_count` int unsigned NOT NULL,
  `detail_image` varchar(200) NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `foods_chk_1` CHECK ((`discount` >= 0)),
  CONSTRAINT `foods_chk_2` CHECK ((`review_count` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,'간편식 부리또',3900.00,20,3120.00,4.5,230,'https://i.imgur.com/Rhsl56s.png ','2021-06-16 12:42:41.583813','2021-06-16 12:42:41.584021'),(2,'프리미엄 베이컨 치즈 버거',5900.00,20,4720.00,4.9,120,'https://i.imgur.com/JwbPA82.png','2021-06-16 12:42:41.585993','2021-06-16 12:42:41.586027'),(3,'칠리 매콤 닭다리',3000.00,0,3000.00,4.7,170,'https://i.imgur.com/TidmFYT.png','2021-06-16 12:42:41.587101','2021-06-16 12:42:41.587133'),(4,'진한 인도의 커리맛 양고기 커리',7000.00,0,7000.00,3.8,3113,'https://i.imgur.com/DS1buEo.png','2021-06-16 12:42:41.589688','2021-06-16 12:42:41.589719'),(5,'만두 게임 해봄? 만두 만두 만두 만두',6000.00,30,4200.00,4.8,345,'https://i.imgur.com/sQtTf3r.png','2021-06-16 12:42:41.590807','2021-06-16 12:42:41.590837'),(6,'하와이 가봤니? 하와이안 피자',11900.00,0,11900.00,4.5,2056,'https://i.imgur.com/r3RShOx.png','2021-06-16 12:42:41.591884','2021-06-16 12:42:41.591914'),(7,'다이어트에 건강한 샐러드',4900.00,0,4900.00,4.1,1320,'https://i.imgur.com/7g3JdQL.png','2021-06-16 12:42:41.592964','2021-06-16 12:42:41.592994'),(8,'맛집 연어 샐러드',7000.00,0,7000.00,4.4,1198,'https://i.imgur.com/0HpccHL.png','2021-06-16 12:42:41.593925','2021-06-16 12:42:41.593955'),(9,'멕시코의 진한 향 타고',7800.00,0,7800.00,4.6,987,'https://i.imgur.com/TPk4T2y.png','2021-06-16 12:42:41.594931','2021-06-16 12:42:41.594961'),(10,'신선한 토마토 부라타 치즈 샐러드',8800.00,0,8800.00,4.3,1763,'https://i.imgur.com/CECLlka.png','2021-06-16 12:42:41.596010','2021-06-16 12:42:41.596039'),(11,'전주 출신 주방장이 만든 비빔밥',8000.00,20,6400.00,4.3,1024,'https://i.imgur.com/qFxqDnN.png','2021-06-16 12:42:41.597060','2021-06-16 12:42:41.597089'),(12,'노른자 3개 올린 커리',13000.00,33,8710.00,3.3,333,'https://i.imgur.com/0m0ZA5b.png','2021-06-16 12:42:41.598042','2021-06-16 12:42:41.598072'),(13,'볶음밥 위에 고기 추가',9000.00,10,8100.00,4.0,1902,'https://i.imgur.com/ZSE4klo.png','2021-06-16 12:42:41.599072','2021-06-16 12:42:41.599102'),(14,'옆구리 터진 김밥',3000.00,0,3000.00,2.5,119,'https://i.imgur.com/ZY4iX8n.png','2021-06-16 12:42:41.600043','2021-06-16 12:42:41.600073'),(15,'밀켓마켓 김치볶음밥',8000.00,0,8000.00,4.3,2330,'https://i.imgur.com/VkQDegm.png','2021-06-16 12:42:41.600922','2021-06-16 12:42:41.600951'),(16,'김치볶음밥 같아 보이는 해물 볶음밥',8000.00,0,8000.00,4.7,1890,'https://i.imgur.com/Agfn192.png','2021-06-16 12:42:41.601805','2021-06-16 12:42:41.601840'),(17,'새우를 곁들인 매운 인도 카레',8900.00,20,8100.00,4.3,324,'https://i.imgur.com/YmiumFL.png','2021-06-16 12:42:41.602659','2021-06-16 12:42:41.602688'),(18,'굴소스가 들어간 리조또',10800.00,0,10800.00,3.9,561,'https://i.imgur.com/o4UWRX5.png','2021-06-16 12:42:41.603547','2021-06-16 12:42:41.603574'),(19,'고소한 깨가 뿌려진 참치롤',4900.00,0,4900.00,4.8,1679,'https://i.imgur.com/ljcQNlt.png','2021-06-16 12:42:41.604585','2021-06-16 12:42:41.604629'),(20,'일본에서 들여온 방사능 없는 초밥',15600.00,0,15600.00,1.7,2891,'https://i.imgur.com/6tczxaL.png','2021-06-16 12:42:41.605947','2021-06-16 12:42:41.605991'),(21,'담백한 바질 파스타',8000.00,0,8000.00,4.0,10,'https://i.imgur.com/m16G7ep.png','2021-06-16 12:42:41.607112','2021-06-16 12:42:41.607141'),(22,'집에서 즐기는 냉면',7000.00,0,7000.00,4.5,581,'https://i.imgur.com/tDUZ1Ct.png','2021-06-16 12:42:41.608273','2021-06-16 12:42:41.608314'),(23,'버섯 크림 파스타',10000.00,0,10000.00,4.7,1581,'https://i.imgur.com/SwiHvRG.png','2021-06-16 12:42:41.609352','2021-06-16 12:42:41.609380'),(24,'강원도 햇감자로 만든 크림 뇨끼',15000.00,20,8100.00,4.9,87,'https://i.imgur.com/vUamptR.png','2021-06-16 12:42:41.610234','2021-06-16 12:42:41.610264'),(25,'미트볼 가득 파스타',12000.00,0,12000.00,4.9,10321,'https://i.imgur.com/vBUgV3s.png','2021-06-16 12:42:41.611134','2021-06-16 12:42:41.611163'),(26,'육수에 말아먹는 온모밀',11000.00,0,11000.00,4.1,5411,'https://i.imgur.com/j5cEMAh.png','2021-06-16 12:42:41.612052','2021-06-16 12:42:41.612081'),(27,'새우 듬뿍 칼국수',13000.00,0,13000.00,4.2,4572,'https://i.imgur.com/Zxsa3aZ.png','2021-06-16 12:42:41.613069','2021-06-16 12:42:41.613097'),(28,'쿠지라이식 라면',8000.00,0,8000.00,4.6,4222,'https://i.imgur.com/e6TqL7X.png','2021-06-16 12:42:41.614037','2021-06-16 12:42:41.614065'),(29,'진한 육수 일본식 라면',10000.00,0,10000.00,4.8,2987,'https://i.imgur.com/mjVjiL5.png','2021-06-16 12:42:41.615078','2021-06-16 12:42:41.615108'),(30,'매콤한 우동',8000.00,0,8000.00,3.6,1234,'https://i.imgur.com/Dh0muvn.png','2021-06-16 12:42:41.616091','2021-06-16 12:42:41.616120'),(31,'부대찌개 100g',8000.00,23,6160.00,4.7,1891,'https://i.imgur.com/75bneLO.png','2021-06-16 12:42:41.617025','2021-06-16 12:42:41.617055'),(32,'통통살 가라아게',6900.00,0,6900.00,3.8,7617,'https://i.imgur.com/lgc9RHI.png','2021-06-16 12:42:41.617906','2021-06-16 12:42:41.617935'),(33,'고등어 구이',14000.00,0,14000.00,3.2,1384,'https://i.imgur.com/iHRnG60.png','2021-06-16 12:42:41.618721','2021-06-16 12:42:41.618745'),(34,'숯불에 구운 닭갈비',8000.00,0,8000.00,3.3,1891,'https://i.imgur.com/AcA2rsH.png','2021-06-16 12:42:41.619708','2021-06-16 12:42:41.619740'),(35,'감바스 알 아히요',9900.00,0,9900.00,4.0,40617,'https://i.imgur.com/z21goCh.png','2021-06-16 12:42:41.620854','2021-06-16 12:42:41.620881'),(36,'맛있게 잘익은 김치',19900.00,0,19900.00,4.9,1233,'https://i.imgur.com/aylXNh7.png','2021-06-16 12:42:41.621802','2021-06-16 12:42:41.621828'),(37,'참치 김치 찌개',15000.00,20,12000.00,4.8,3211,'https://i.imgur.com/YjbCdHX.png','2021-06-16 12:42:41.623104','2021-06-16 12:42:41.623128'),(38,'제주산 녹차먹은 삼겹살',12000.00,0,12000.00,4.2,12322,'https://i.imgur.com/FYd89Dx.png','2021-06-16 12:42:41.624011','2021-06-16 12:42:41.624034'),(39,'레몬 곁들인 훈제연어',14900.00,0,14900.00,4.3,3221,'https://i.imgur.com/dXrDNLl.png','2021-06-16 12:42:41.625013','2021-06-16 12:42:41.625038'),(40,'국내산 소고기 스테이크',23000.00,0,23000.00,4.5,981,'https://i.imgur.com/Yqi5OQt.png','2021-06-16 12:42:41.625842','2021-06-16 12:42:41.625866'),(41,'본마망 인텐스 프리미엄 자두잼',8400.00,0,8400.00,4.6,2762,'https://i.imgur.com/wgzS1mp.png','2021-06-16 12:42:41.626706','2021-06-16 12:42:41.626729'),(42,'국산 블루베리 100g (특)',8000.00,10,7200.00,4.7,2486,'https://i.imgur.com/TPCQT4h.png','2021-06-16 12:42:41.627697','2021-06-16 12:42:41.627720'),(43,'부드러운 초콜릿 브라우니',5100.00,0,5100.00,4.2,791,'https://i.imgur.com/zDDx8LZ.png','2021-06-16 12:42:41.628519','2021-06-16 12:42:41.628545'),(44,'초콜릿 입은 쿠키 350g',4800.00,0,4800.00,4.6,1292,'https://i.imgur.com/6u891sK.png','2021-06-16 12:42:41.629335','2021-06-16 12:42:41.629378'),(45,'캘리포니아 도넛 5종(플레인/초콜릿/딸기화이트/로투스커피)',17000.00,15,14450.00,4.5,2762,'https://i.imgur.com/UUuasrL.png','2021-06-16 12:42:41.630162','2021-06-16 12:42:41.630187'),(46,'갓 구워 즐기는 커스타드 에그타르트',8700.00,0,8700.00,4.7,273,'https://i.imgur.com/USxkNQc.png','2021-06-16 12:42:41.631165','2021-06-16 12:42:41.631189'),(47,'마카롱 4구 세트',8500.00,0,8500.00,4.6,1233,'https://i.imgur.com/jfhOBzb.png','2021-06-16 12:42:41.632005','2021-06-16 12:42:41.632030'),(48,'유기농 팬케이크 믹스 2종',9500.00,0,9500.00,4.5,982,'https://i.imgur.com/p9G6gyv.png','2021-06-16 12:42:41.632888','2021-06-16 12:42:41.632911'),(49,'전자레인지용 팝콘 (3개입)',3600.00,0,3600.00,4.7,1838,'https://i.imgur.com/wgzS1mp.png','2021-06-16 12:42:41.633730','2021-06-16 12:42:41.633752'),(50,'유기농 딸기 그릭 요거트 2팩 (500g)',11000.00,0,11000.00,4.8,863,'https://i.imgur.com/bE4qSU8.png','2021-06-16 12:42:41.634542','2021-06-16 12:42:41.634565'),(51,'콕크 탄산음료',8000.00,10,7200.00,4.1,232,'https://i.imgur.com/HopYyBA.png','2021-06-16 12:42:41.635436','2021-06-16 12:42:41.635459'),(52,'바닐라 크림 콜드브루',4000.00,0,4000.00,4.6,394,'https://i.imgur.com/1p5tNy8.png','2021-06-16 12:42:41.636384','2021-06-16 12:42:41.636408'),(53,'계피향 가득한 커피',5000.00,0,5000.00,4.1,1199,'https://i.imgur.com/O4EqYco.png','2021-06-16 12:42:41.637217','2021-06-16 12:42:41.637241'),(54,'아이스 아메리카노',3000.00,5,2850.00,4.2,840,'https://i.imgur.com/VN8kqTi.png','2021-06-16 12:42:41.638628','2021-06-16 12:42:41.638653'),(55,'목초 먹인 우유',5500.00,0,5500.00,3.8,259,'https://i.imgur.com/VN8kqTi.png','2021-06-16 12:42:41.639645','2021-06-16 12:42:41.639668'),(56,'상큼한 레모네이드',5000.00,15,4250.00,4.0,892,'https://i.imgur.com/slI07Kk.png','2021-06-16 12:42:41.640621','2021-06-16 12:42:41.640644'),(57,'칵테일과 잘 어울리는 토닉워터',1500.00,0,1500.00,4.7,940,'https://i.imgur.com/dxzjdbF.png','2021-06-16 12:42:41.641463','2021-06-16 12:42:41.641491'),(58,'과즙 가득한 오렌지 주스 500ml',6000.00,0,6000.00,4.3,42,'https://i.imgur.com/dxzjdbF.png','2021-06-16 12:42:41.642300','2021-06-16 12:42:41.642323'),(59,'상큼 톡톡 딸기 주스 500',6000.00,0,6000.00,4.3,420,'https://i.imgur.com/1qUZE6x.png','2021-06-16 12:42:41.643191','2021-06-16 12:42:41.643214'),(60,'향 가득한 티',5000.00,0,5000.00,4.2,1082,'https://i.imgur.com/66x0nLa.png','2021-06-16 12:42:41.644178','2021-06-16 12:42:41.644201');
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `required_options`
--

DROP TABLE IF EXISTS `required_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `required_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `food_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `required_options_food_id_7bfc55e2_fk_foods_id` (`food_id`),
  CONSTRAINT `required_options_food_id_7bfc55e2_fk_foods_id` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`),
  CONSTRAINT `required_options_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `required_options`
--

LOCK TABLES `required_options` WRITE;
/*!40000 ALTER TABLE `required_options` DISABLE KEYS */;
INSERT INTO `required_options` VALUES (1,'간편식 부리또(카레맛)',1000.00,100,1),(2,'간편식 부리또(칠리맛)',1000.00,100,1),(3,'간편식 부리또(치즈추가)',1200.00,100,1),(4,'간편식 부리또(고기추가)',1200.00,100,1),(5,'프리미엄 베이컨 치즈 버거',1000.00,100,2),(6,'칠리 매콤 닭다리',1000.00,100,3),(7,'진한 인도의 커리맛 양고기 커리',1000.00,100,4),(8,'만두 게임 해봄? 만두 만두 만두 만두',1000.00,100,5),(9,'하와이 가봤니? 하와이안 피자',1000.00,100,6),(10,'다이어트에 건강한 샐러드',1000.00,100,7),(11,'맛집 연어 샐러드',1000.00,100,8),(12,'멕시코의 진한 향 타고',1000.00,100,9),(13,'신선한 토마토 부라타 치즈 샐러드',1000.00,100,10),(14,'전주 출신 주방장이 만든 비빔밥',1000.00,100,11),(15,'노른자 3개 올린 커리',1000.00,100,12),(16,'볶음밥 위에 고기 추가',1000.00,100,13),(17,'옆구리 터진 김밥',1000.00,100,14),(18,'밀켓마켓 김치볶음밥',1000.00,100,15),(19,'김치볶음밥 같아 보이는 해물 볶음밥',1000.00,100,16),(20,'새우를 곁들인 매운 인도 카레',1000.00,100,17),(21,'굴소스가 들어간 리조또',1000.00,100,18),(22,'고소한 깨가 뿌려진 참치롤',1000.00,100,19),(23,'일본에서 들여온 방사능 없는 초밥',1000.00,100,20),(24,'담백한 바질 파스타',1000.00,100,21),(25,'집에서 즐기는 냉면',1000.00,100,22),(26,'버섯 크림 파스타',1000.00,100,23),(27,'강원도 햇감자로 만든 크림 뇨끼',1000.00,100,24),(28,'미트볼 가득 파스타',1000.00,100,25),(29,'육수에 말아먹는 온모밀',1000.00,100,26),(30,'새우 듬뿍 칼국수',1000.00,100,27),(31,'쿠지라이식 라면',1000.00,100,28),(32,'진한 육수 일본식 라면',1000.00,100,29),(33,'매콤한 우동',1000.00,100,30),(34,'부대찌개 100g',1000.00,100,31),(35,'통통살 가라아게',1000.00,100,32),(36,'고등어 구이',1000.00,100,33),(37,'숯불에 구운 닭갈비',1000.00,100,34),(38,'감바스 알 아히요',1000.00,100,35),(39,'맛있게 잘익은 김치',1000.00,100,36),(40,'참치 김치 찌개',1000.00,100,37),(41,'제주산 녹차먹은 삼겹살',1000.00,100,38),(42,'레몬 곁들인 훈제연어',1000.00,100,39),(43,'국내산 소고기 스테이크',1000.00,100,40),(44,'본마망 인텐스 프리미엄 자두잼',1000.00,100,41),(45,'국산 블루베리 100g (특)',1000.00,100,42),(46,'부드러운 초콜릿 브라우니',1000.00,100,43),(47,'초콜릿 입은 쿠키 350g',1000.00,100,44),(48,'캘리포니아 도넛 3종(초콜릿/딸기화이트/로투스커피)',1000.00,100,45),(49,'갓 구워 즐기는 커스타드 에그타르트',1000.00,100,46),(50,'마카롱 4구 세트',1000.00,100,47),(51,'유기농 팬케이크 믹스 2종',1000.00,100,48),(52,'전자레인지용 팝콘 (3개입)',1000.00,100,49),(53,'유기농 딸기 그릭 요거트 2팩 (500g)',1000.00,100,50),(54,'콕크 탄산음료',1000.00,100,51),(55,'바닐라 크림 콜드브루',1000.00,100,52),(56,'계피향 가득한 커피',1000.00,100,53),(57,'아이스 아메리카노',1000.00,100,54),(58,'목초 먹인 우유',1000.00,100,55),(59,'상큼한 레모네이드',1000.00,100,56),(60,'칵테일과 잘 어울리는 토닉워터',1000.00,100,57),(61,'과즙 가득한 오렌지 주스 500ml',1000.00,100,58),(62,'상큼 톡톡 딸기 주스 500',1000.00,100,59),(63,'향 가득한 티',1000.00,100,60);
/*!40000 ALTER TABLE `required_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `select_options`
--

DROP TABLE IF EXISTS `select_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `select_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `food_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `select_options_food_id_7681882f_fk_foods_id` (`food_id`),
  CONSTRAINT `select_options_food_id_7681882f_fk_foods_id` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`),
  CONSTRAINT `select_options_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `select_options`
--

LOCK TABLES `select_options` WRITE;
/*!40000 ALTER TABLE `select_options` DISABLE KEYS */;
INSERT INTO `select_options` VALUES (1,'칠리소스',300.00,100,1),(2,'치즈소스',400.00,100,1),(3,'땅콩소스',500.00,100,1),(4,'머스타드',600.00,100,1),(5,'프리미엄 베이컨 치즈 버거',1000.00,100,2),(6,'칠리 매콤 닭다리',1000.00,100,3),(7,'진한 인도의 커리맛 양고기 커리',1000.00,100,4),(8,'만두 게임 해봄? 만두 만두 만두 만두',1000.00,100,5),(9,'하와이 가봤니? 하와이안 피자',1000.00,100,6),(10,'다이어트에 건강한 샐러드',1000.00,100,7),(11,'맛집 연어 샐러드',1000.00,100,8),(12,'멕시코의 진한 향 타고',1000.00,100,9),(13,'신선한 토마토 부라타 치즈 샐러드',1000.00,100,10),(14,'전주 출신 주방장이 만든 비빔밥',1000.00,100,11),(15,'노른자 3개 올린 커리',1000.00,100,12),(16,'볶음밥 위에 고기 추가',1000.00,100,13),(17,'옆구리 터진 김밥',1000.00,100,14),(18,'밀켓마켓 김치볶음밥',1000.00,100,15),(19,'김치볶음밥 같아 보이는 해물 볶음밥',1000.00,100,16),(20,'새우를 곁들인 매운 인도 카레',1000.00,100,17),(21,'굴소스가 들어간 리조또',1000.00,100,18),(22,'고소한 깨가 뿌려진 참치롤',1000.00,100,19),(23,'일본에서 들여온 방사능 없는 초밥',1000.00,100,20),(24,'담백한 바질 파스타',1000.00,100,21),(25,'집에서 즐기는 냉면',1000.00,100,22),(26,'버섯 크림 파스타',1000.00,100,23),(27,'강원도 햇감자로 만든 크림 뇨끼',1000.00,100,24),(28,'미트볼 가득 파스타',1000.00,100,25),(29,'육수에 말아먹는 온모밀',1000.00,100,26),(30,'새우 듬뿍 칼국수',1000.00,100,27),(31,'쿠지라이식 라면',1000.00,100,28),(32,'진한 육수 일본식 라면',1000.00,100,29),(33,'매콤한 우동',1000.00,100,30),(34,'부대찌개 100g',1000.00,100,31),(35,'통통살 가라아게',1000.00,100,32),(36,'고등어 구이',1000.00,100,33),(37,'숯불에 구운 닭갈비',1000.00,100,34),(38,'감바스 알 아히요',1000.00,100,35),(39,'맛있게 잘익은 김치',1000.00,100,36),(40,'참치 김치 찌개',1000.00,100,37),(41,'제주산 녹차먹은 삼겹살',1000.00,100,38),(42,'레몬 곁들인 훈제연어',1000.00,100,39),(43,'국내산 소고기 스테이크',1000.00,100,40),(44,'본마망 인텐스 프리미엄 자두잼',1000.00,100,41),(45,'국산 블루베리 100g (특)',1000.00,100,42),(46,'부드러운 초콜릿 브라우니',1000.00,100,43),(47,'초콜릿 입은 쿠키 350g',1000.00,100,44),(48,'캘리포니아 도넛 3종(초콜릿/딸기화이트/로투스커피)',1000.00,100,45),(49,'갓 구워 즐기는 커스타드 에그타르트',1000.00,100,46),(50,'마카롱 4구 세트',1000.00,100,47),(51,'유기농 팬케이크 믹스 2종',1000.00,100,48),(52,'전자레인지용 팝콘 (3개입)',1000.00,100,49),(53,'유기농 딸기 그릭 요거트 2팩 (500g)',1000.00,100,50),(54,'콕크 탄산음료',1000.00,100,51),(55,'바닐라 크림 콜드브루',1000.00,100,52),(56,'계피향 가득한 커피',1000.00,100,53),(57,'아이스 아메리카노',1000.00,100,54),(58,'목초 먹인 우유',1000.00,100,55),(59,'상큼한 레모네이드',1000.00,100,56),(60,'칵테일과 잘 어울리는 토닉워터',1000.00,100,57),(61,'과즙 가득한 오렌지 주스 500ml',1000.00,100,58),(62,'상큼 톡톡 딸기 주스 500',1000.00,100,59),(63,'향 가득한 티',1000.00,100,60);
/*!40000 ALTER TABLE `select_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(300) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'123@test.com','12345678','123','01011111111','2021-06-16 07:25:40.769789','2021-06-16 07:25:40.769916'),(2,'1234@test.com','12345678','1234','01011111112','2021-06-16 07:25:58.246828','2021-06-16 07:25:58.246891'),(3,'12345@test.com','12345678','5','01011111113','2021-06-16 07:26:19.308696','2021-06-16 07:26:19.308744'),(4,'test@gmail.com','$2b$12$BddEZ4mqKH/AOz0XBTOkC.bPl08Zz0RwiOi4yAHuACTq86fhwuIQy','name','010-1111-1111','2021-06-16 08:31:03.960157','2021-06-16 08:31:03.960187');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishes`
--

DROP TABLE IF EXISTS `wishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `food_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wishes_food_id_cf26539c_fk_foods_id` (`food_id`),
  KEY `wishes_user_id_6a82a6ef_fk_users_id` (`user_id`),
  CONSTRAINT `wishes_food_id_cf26539c_fk_foods_id` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`),
  CONSTRAINT `wishes_user_id_6a82a6ef_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishes`
--

LOCK TABLES `wishes` WRITE;
/*!40000 ALTER TABLE `wishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-16 23:20:36
