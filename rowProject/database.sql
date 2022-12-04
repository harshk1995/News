-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: ultranew_v2
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'Deufmee2nG7jwVWzMgdwNgtSiEqkwhZS',1,'2022-10-15 13:57:00','2022-10-15 13:57:00','2022-10-15 13:57:00');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,'Header ads','2023-10-15 00:00:00','header-ads','ZCZAZM99DZ','banners/image-3.jpg','https://thesky9.com/',0,1,'published','2022-10-15 13:57:01','2022-10-15 13:57:01'),(2,'Panel ads','2023-10-15 00:00:00','panel-ads','WYNM6NEEOS','banners/image-3.jpg','https://thesky9.com/',0,1,'published','2022-10-15 13:57:01','2022-10-15 13:57:01'),(3,'Top sidebar ads','2023-10-15 00:00:00','top-sidebar-ads','FIKWYFMDJC','banners/image-1.jpg','https://thesky9.com/',0,2,'published','2022-10-15 13:57:01','2022-10-15 13:57:01'),(4,'Bottom sidebar ads','2023-10-15 00:00:00','bottom-sidebar-ads','RBFTK7QYWM','banners/image-2.jpg','https://thesky9.com/',0,3,'published','2022-10-15 13:57:01','2022-10-15 13:57:01'),(5,'Custom ads 1','2023-10-15 00:00:00','custom-1','0VBA9PEJTN','banners/image-4.jpg','https://thesky9.com/',0,4,'published','2022-10-15 13:57:01','2022-10-15 13:57:01');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int unsigned NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comment_likes`
--

DROP TABLE IF EXISTS `bb_comment_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comment_likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bb_comment_likes_comment_id_index` (`comment_id`),
  KEY `bb_comment_likes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comment_likes`
--

LOCK TABLES `bb_comment_likes` WRITE;
/*!40000 ALTER TABLE `bb_comment_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bb_comment_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comment_recommends`
--

DROP TABLE IF EXISTS `bb_comment_recommends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comment_recommends` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bb_comment_recommends_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comment_recommends`
--

LOCK TABLES `bb_comment_recommends` WRITE;
/*!40000 ALTER TABLE `bb_comment_recommends` DISABLE KEYS */;
/*!40000 ALTER TABLE `bb_comment_recommends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comment_users`
--

DROP TABLE IF EXISTS `bb_comment_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comment_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `avatar_id` int unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bb_comment_users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comment_users`
--

LOCK TABLES `bb_comment_users` WRITE;
/*!40000 ALTER TABLE `bb_comment_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `bb_comment_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comments`
--

DROP TABLE IF EXISTS `bb_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `like_count` int NOT NULL DEFAULT '0',
  `reply_count` int NOT NULL DEFAULT '0',
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comments`
--

LOCK TABLES `bb_comments` WRITE;
/*!40000 ALTER TABLE `bb_comments` DISABLE KEYS */;
INSERT INTO `bb_comments` VALUES (1,'I\'ve had such a new idea to Alice, and she was now the right way to hear her try and say \"How doth.',1,'Botble\\Blog\\Models\\Post','241.93.246.177',6,'published',0,1,0,'2022-09-29 15:46:13','2022-10-15 13:57:15'),(2,'Alice. \'Stand up and rubbed its eyes: then it watched the Queen put on his slate with one eye, How.',1,'Botble\\Blog\\Models\\Post','178.64.218.75',3,'published',0,0,0,'2022-09-16 19:49:47','2022-10-15 13:57:15'),(3,'White Rabbit, \'but it doesn\'t mind.\' The table was a very curious to know what you mean,\' the.',1,'Botble\\Blog\\Models\\Post','74.212.94.109',8,'published',0,1,0,'2022-09-29 13:54:50','2022-10-15 13:57:15'),(4,'Tortoise because he taught us,\' said the Cat. \'--so long as I tell you, you coward!\' and at once.',1,'Botble\\Blog\\Models\\Post','116.72.172.161',5,'published',0,0,0,'2022-10-12 01:28:15','2022-10-15 13:57:15'),(5,'Alice had learnt several things of this sort in her hands, wondering if anything would EVER happen.',1,'Botble\\Blog\\Models\\Post','147.119.238.149',5,'published',0,0,0,'2022-10-14 21:46:08','2022-10-15 13:57:15'),(6,'MINE,\' said the Cat; and this was his first remark, \'It was much pleasanter at home,\' thought poor.',1,'Botble\\Blog\\Models\\Post','84.156.179.22',4,'published',0,0,0,'2022-10-10 09:33:31','2022-10-15 13:57:15'),(7,'Rabbit\'s--\'Pat! Pat! Where are you?\' And then a great crash, as if she had asked it aloud; and in.',1,'Botble\\Blog\\Models\\Post','116.77.72.63',5,'published',0,0,3,'2022-10-15 05:54:23','2022-10-15 13:57:15'),(8,'I--\' \'Oh, don\'t bother ME,\' said the Queen, pointing to the puppy; whereupon the puppy jumped into.',1,'Botble\\Blog\\Models\\Post','149.7.4.236',9,'published',0,0,1,'2022-10-05 15:27:06','2022-10-15 13:57:15'),(9,'Mock Turtle. \'No, no! The adventures first,\' said the Rabbit just under the window, I only knew.',2,'Botble\\Blog\\Models\\Post','33.63.147.100',7,'published',0,0,0,'2022-10-01 13:58:17','2022-10-15 13:57:15'),(10,'I should like to be patted on the stairs. Alice knew it was indeed: she was appealed to by all.',2,'Botble\\Blog\\Models\\Post','133.196.92.71',3,'published',0,0,0,'2022-09-30 13:45:51','2022-10-15 13:57:15'),(11,'Mock Turtle a little worried. \'Just about as she could see, as they were playing the Queen put on.',2,'Botble\\Blog\\Models\\Post','204.76.44.182',7,'published',0,0,0,'2022-09-20 12:44:58','2022-10-15 13:57:15'),(12,'I\'m not particular as to size,\' Alice hastily replied; \'at least--at least I mean what I should.',2,'Botble\\Blog\\Models\\Post','242.179.61.179',8,'published',0,1,0,'2022-09-30 18:00:40','2022-10-15 13:57:15'),(13,'I eat or drink under the hedge. In another minute the whole place around her became alive with the.',2,'Botble\\Blog\\Models\\Post','129.71.50.151',7,'published',0,1,0,'2022-10-07 19:22:37','2022-10-15 13:57:15'),(14,'Majesty!\' the soldiers had to leave it behind?\' She said the White Rabbit, jumping up and picking.',2,'Botble\\Blog\\Models\\Post','35.152.12.192',9,'published',0,0,0,'2022-10-11 03:41:58','2022-10-15 13:57:15'),(15,'Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you like the look of the room. The cook.',2,'Botble\\Blog\\Models\\Post','160.170.125.43',2,'published',0,0,12,'2022-10-10 05:21:02','2022-10-15 13:57:15'),(16,'King exclaimed, turning to the company generally, \'You are not attending!\' said the Cat, \'a dog\'s.',2,'Botble\\Blog\\Models\\Post','64.68.234.174',8,'published',0,0,13,'2022-10-01 15:59:22','2022-10-15 13:57:15'),(17,'Ma!\' said the Hatter. He came in sight of the crowd below, and there she saw in another moment.',3,'Botble\\Blog\\Models\\Post','106.58.208.63',5,'published',0,0,0,'2022-09-17 16:01:40','2022-10-15 13:57:15'),(18,'Soup of the sort,\' said the White Rabbit, who said in a pleased tone. \'Pray don\'t trouble yourself.',3,'Botble\\Blog\\Models\\Post','178.36.145.154',6,'published',0,1,0,'2022-09-25 20:39:51','2022-10-15 13:57:16'),(19,'Cat. \'I don\'t know what to do, so Alice ventured to say. \'What is it?\' \'Why,\' said the Hatter. \'I.',3,'Botble\\Blog\\Models\\Post','228.51.221.196',10,'published',0,0,0,'2022-10-13 10:23:35','2022-10-15 13:57:16'),(20,'Alice, \'and why it is you hate--C and D,\' she added aloud. \'Do you take me for a minute, trying to.',3,'Botble\\Blog\\Models\\Post','251.110.167.35',1,'published',0,0,0,'2022-10-09 08:05:14','2022-10-15 13:57:16'),(21,'Pigeon. \'I\'m NOT a serpent!\' said Alice to herself, \'after such a very deep well. Either the well.',3,'Botble\\Blog\\Models\\Post','206.150.20.187',7,'published',0,1,0,'2022-10-13 11:39:35','2022-10-15 13:57:16'),(22,'Queen was to get out of a treacle-well--eh, stupid?\' \'But they were IN the well,\' Alice said very.',3,'Botble\\Blog\\Models\\Post','240.26.246.226',4,'published',0,0,0,'2022-10-09 17:23:51','2022-10-15 13:57:16'),(23,'Ann! Mary Ann!\' said the Caterpillar contemptuously. \'Who are YOU?\' Which brought them back again.',3,'Botble\\Blog\\Models\\Post','56.178.184.177',2,'published',0,0,18,'2022-10-05 05:19:01','2022-10-15 13:57:16'),(24,'Hatter: \'but you could manage it?) \'And what are YOUR shoes done with?\' said the Caterpillar.',3,'Botble\\Blog\\Models\\Post','147.61.164.227',8,'published',0,0,21,'2022-10-04 13:48:02','2022-10-15 13:57:16'),(25,'Gryphon, with a sigh: \'he taught Laughing and Grief, they used to do:-- \'How doth the little--\"\'.',21,'Botble\\Blog\\Models\\Post','243.180.219.165',10,'published',0,1,0,'2022-10-04 06:33:40','2022-10-15 13:57:16'),(26,'I\'m not looking for eggs, as it was a table in the middle, nursing a baby; the cook till his eyes.',21,'Botble\\Blog\\Models\\Post','250.81.227.113',9,'published',0,0,0,'2022-09-24 19:57:21','2022-10-15 13:57:16'),(27,'Lizard, who seemed to be a comfort, one way--never to be told so. \'It\'s really dreadful,\' she.',21,'Botble\\Blog\\Models\\Post','184.37.82.90',1,'published',0,1,0,'2022-09-24 10:12:57','2022-10-15 13:57:16'),(28,'However, everything is to-day! And yesterday things went on again: \'Twenty-four hours, I THINK; or.',21,'Botble\\Blog\\Models\\Post','25.104.174.51',6,'published',0,0,0,'2022-10-04 17:58:31','2022-10-15 13:57:16'),(29,'One,\' said Alice. \'Exactly so,\' said Alice. \'Why not?\' said the King. \'It began with the other.',21,'Botble\\Blog\\Models\\Post','53.242.105.24',7,'published',0,0,0,'2022-09-27 01:17:57','2022-10-15 13:57:16'),(30,'English!\' said the Hatter. Alice felt that it seemed quite dull and stupid for life to go among.',21,'Botble\\Blog\\Models\\Post','248.168.3.98',9,'published',0,0,0,'2022-09-18 21:01:40','2022-10-15 13:57:16'),(31,'Dormouse shall!\' they both sat silent and looked into its face was quite a chorus of \'There goes.',21,'Botble\\Blog\\Models\\Post','72.25.133.159',7,'published',0,0,25,'2022-10-08 05:28:00','2022-10-15 13:57:16'),(32,'I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, with oh.',21,'Botble\\Blog\\Models\\Post','253.113.226.8',7,'published',0,0,27,'2022-10-03 12:16:41','2022-10-15 13:57:16'),(33,'She stretched herself up on to her usual height. It was the Cat said, waving its tail when I\'m.',22,'Botble\\Blog\\Models\\Post','214.200.173.237',9,'published',0,0,0,'2022-09-21 21:11:32','2022-10-15 13:57:16'),(34,'IN the well,\' Alice said nothing: she had hoped) a fan and gloves--that is, if I shall fall right.',22,'Botble\\Blog\\Models\\Post','253.205.168.110',1,'published',0,1,0,'2022-10-14 00:35:45','2022-10-15 13:57:16'),(35,'Now I growl when I\'m angry. Therefore I\'m mad.\' \'I call it purring, not growling,\' said Alice. The.',22,'Botble\\Blog\\Models\\Post','194.109.40.52',1,'published',0,1,0,'2022-09-29 00:16:53','2022-10-15 13:57:16'),(36,'Alice as he spoke, and the Dormouse again, so violently, that she was out of the legs of the.',22,'Botble\\Blog\\Models\\Post','79.140.97.169',10,'published',0,0,0,'2022-10-09 04:09:08','2022-10-15 13:57:16'),(37,'Mock Turtle went on saying to her great disappointment it was sneezing and howling alternately.',22,'Botble\\Blog\\Models\\Post','152.44.122.130',3,'published',0,0,0,'2022-10-11 19:25:17','2022-10-15 13:57:16'),(38,'No room!\' they cried out when they liked, and left foot, so as to size,\' Alice hastily replied.',22,'Botble\\Blog\\Models\\Post','188.23.159.10',10,'published',0,0,0,'2022-09-27 00:20:54','2022-10-15 13:57:16'),(39,'Alice; \'I must be removed,\' said the Mock Turtle\'s Story \'You can\'t think how glad I am in the.',22,'Botble\\Blog\\Models\\Post','2.166.212.17',10,'published',0,0,34,'2022-10-10 22:15:46','2022-10-15 13:57:16'),(40,'Alice could not think of anything else. CHAPTER V. Advice from a Caterpillar The Caterpillar was.',22,'Botble\\Blog\\Models\\Post','32.17.232.90',8,'published',0,0,35,'2022-10-02 08:11:34','2022-10-15 13:57:16'),(41,'King, \'unless it was the first position in which case it would all come wrong, and she heard a.',23,'Botble\\Blog\\Models\\Post','10.12.25.100',4,'published',0,1,0,'2022-09-27 16:49:14','2022-10-15 13:57:16'),(42,'The Hatter opened his eyes were looking up into a graceful zigzag, and was a dead silence.',23,'Botble\\Blog\\Models\\Post','230.178.194.222',9,'published',0,0,0,'2022-09-21 06:17:55','2022-10-15 13:57:16'),(43,'Queen was close behind her, listening: so she turned the corner, but the Rabbit asked. \'No, I give.',23,'Botble\\Blog\\Models\\Post','255.248.4.56',4,'published',0,0,0,'2022-10-13 18:42:44','2022-10-15 13:57:16'),(44,'King added in a natural way again. \'I wonder how many miles I\'ve fallen by this time, and was.',23,'Botble\\Blog\\Models\\Post','66.129.95.224',6,'published',0,0,0,'2022-09-21 21:12:59','2022-10-15 13:57:16'),(45,'Said the mouse to the croquet-ground. The other side will make you a present of everything I\'ve.',23,'Botble\\Blog\\Models\\Post','42.49.86.6',10,'published',0,1,0,'2022-10-10 11:48:54','2022-10-15 13:57:16'),(46,'In a little ledge of rock, and, as there was nothing else to say it over) \'--yes, that\'s about the.',23,'Botble\\Blog\\Models\\Post','8.114.42.176',1,'published',0,0,0,'2022-09-21 15:21:35','2022-10-15 13:57:16'),(47,'I\'m Mabel, I\'ll stay down here with me! There are no mice in the same size for going through the.',23,'Botble\\Blog\\Models\\Post','131.94.148.85',1,'published',0,0,45,'2022-10-08 10:32:28','2022-10-15 13:57:16'),(48,'Hatter. He had been of late much accustomed to usurpation and conquest. Edwin and Morcar, the.',23,'Botble\\Blog\\Models\\Post','140.48.252.142',6,'published',0,0,41,'2022-10-15 02:52:28','2022-10-15 13:57:16');
/*!40000 ALTER TABLE `bb_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Design',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-10-15 13:57:12','2022-10-15 13:57:12'),(2,'Lifestyle',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-10-15 13:57:12','2022-10-15 13:57:12'),(3,'Travel Tips',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-10-15 13:57:12','2022-10-15 13:57:12'),(4,'Healthy',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-10-15 13:57:12','2022-10-15 13:57:12'),(5,'Fashion',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-10-15 13:57:12','2022-10-15 13:57:12'),(6,'Hotel',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-10-15 13:57:12','2022-10-15 13:57:12'),(7,'Nature',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-10-15 13:57:12','2022-10-15 13:57:12');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
INSERT INTO `categories_translations` VALUES ('vi',1,'Phong cách sống',NULL),('vi',2,'Sức khỏe',NULL),('vi',3,'Món ngon',NULL),('vi',4,'Sách',NULL),('vi',5,'Mẹo du lịch',NULL),('vi',6,'Khách sạn',NULL),('vi',7,'Thiên nhiên',NULL);
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Dr. Verna Von PhD','daugherty.cicero@example.org','361.345.5626','33810 Rafaela Knolls\nLake Ernie, WI 43206','Rem animi sint maiores eos.','Sit consequatur error praesentium delectus nihil est. Quis autem velit facilis aut. Sed velit delectus rerum vitae quidem qui. Eius quaerat alias ullam consequatur temporibus commodi. Eligendi fuga assumenda id corporis enim dignissimos est. Et dignissimos animi ullam mollitia. Natus corporis sit doloribus odit quaerat et ut. Vel aut libero est placeat distinctio.','read','2022-10-15 13:57:03','2022-10-15 13:57:03'),(2,'Mr. Toy Brown','west.adriana@example.com','+1 (803) 302-2530','7459 Haag Mountains\nWest Gretchen, NV 19243','Voluptates aperiam architecto perspiciatis.','Nulla enim eaque nam ab iure nihil. Corrupti laborum est tenetur. Quidem perspiciatis adipisci expedita enim architecto soluta. Laudantium consectetur eveniet qui est non alias quibusdam necessitatibus. Enim fuga maxime rem facilis. Exercitationem dolores repudiandae vero error. Mollitia dolor ut possimus. Tempora quia et nulla eum neque. Soluta distinctio fugiat ipsam minima dolorum est et.','read','2022-10-15 13:57:03','2022-10-15 13:57:03'),(3,'Tyrel Barton','rusty.jacobi@example.com','+1-281-331-9036','161 Hadley Spring Apt. 185\nLake Sarai, IL 15348-5462','Optio sapiente sequi a iure deserunt.','Aut repudiandae quo tempora fuga. Ea vitae in alias. Asperiores iure dolorem maxime earum vero iusto. Est et cupiditate porro repellendus eos enim aut. Ut voluptatum beatae molestiae iste rerum ex culpa. Consectetur eos reiciendis sed sit. Quis ipsam rerum quas aut itaque provident omnis laudantium. Laboriosam molestias aut qui at vitae voluptate dolores. Repellat sit aut in alias expedita. Vitae quo facilis quia assumenda repellendus et a ipsa.','read','2022-10-15 13:57:03','2022-10-15 13:57:03'),(4,'Mr. Cleveland Kertzmann DVM','bobbie48@example.org','1-660-405-6461','2995 Lueilwitz Streets\nPort Bruceside, CT 51278-8417','Qui qui ut rerum.','Ea porro dicta sapiente. Quidem aliquid officia quidem ipsam sit quod. Laudantium ipsum asperiores optio dignissimos quas autem. Corrupti harum et accusamus laborum. Et laboriosam et ad. Praesentium at velit aut ipsa praesentium voluptas voluptas. Debitis voluptatibus et ut. Dolore doloribus sapiente fugiat adipisci commodi. Expedita minima minus qui accusamus. Et explicabo laudantium eum quod ut doloremque odit.','unread','2022-10-15 13:57:03','2022-10-15 13:57:03'),(5,'Raven Jaskolski','kattie.morissette@example.org','+1-845-775-1084','7010 Gustave Neck Suite 018\nLake Oralburgh, VA 04993-0048','Et molestiae impedit veniam accusamus aspernatur.','Et sapiente doloremque amet qui sint. Sapiente aliquam est sint quasi blanditiis qui. Maiores magnam et quaerat animi ab aspernatur dignissimos. Deleniti perspiciatis magni accusamus nihil eveniet occaecati. Rem nam voluptas suscipit accusantium ut minima perspiciatis. Nihil sequi facilis veniam et saepe eligendi sit quaerat. Quaerat reiciendis fuga qui placeat. Ex nulla eligendi est vitae eius.','unread','2022-10-15 13:57:03','2022-10-15 13:57:03'),(6,'Emory Robel','jaiden.jacobs@example.org','(234) 298-1679','18968 Ledner Passage Apt. 934\nDevonland, MO 57841','Adipisci molestiae sit laborum non.','Quis qui unde non. Ut sed est culpa ipsam maxime tenetur dolor. Ad aut quia molestiae aperiam et non. Ut nemo est amet dolorem dolorum. Voluptatum provident et delectus aut explicabo. Eum temporibus debitis fugit tempore vel qui inventore. Blanditiis magnam similique dolor quo occaecati optio nisi. Illo sint iste illo sit blanditiis molestias eum. Velit quisquam veniam et ut velit molestias. Consequatur dicta quae autem et quis officiis et. Iure fuga et quo quod.','read','2022-10-15 13:57:04','2022-10-15 13:57:04'),(7,'Erwin Frami','janick47@example.com','+1.248.853.0597','34600 Karine Harbors\nEast Deonteberg, AL 12395','Mollitia tempore fugit sunt vel modi.','Magnam a fugit corrupti fugiat similique expedita consequatur corrupti. Doloremque occaecati suscipit quo dolorum iure aspernatur et. Hic cum vel a natus sed. Veniam vel vitae accusantium quas accusamus natus accusamus. Iusto hic corrupti voluptas ab. Qui facilis corrupti sed minus. Vel ipsam itaque quisquam tenetur inventore veritatis cumque est. Veniam consectetur quo ab culpa. Eius soluta odit veniam soluta ut. Saepe quis ut laborum deserunt.','read','2022-10-15 13:57:04','2022-10-15 13:57:04'),(8,'Miss Cynthia Bahringer','wuckert.leopold@example.org','+1-551-763-2152','500 Waters Plaza\nJaunitaburgh, SD 66756','Et non sit sunt sed omnis.','Quae rerum voluptas sunt sint. Aspernatur dolorem illo odit consequatur ut. Dignissimos impedit beatae autem magni at sed et. Perspiciatis voluptatem impedit ad distinctio vitae et aut. Voluptate dolore in rerum temporibus. Sint blanditiis sunt ut dolores sunt soluta. Sed quis consequuntur nulla exercitationem molestiae possimus dolor.','unread','2022-10-15 13:57:04','2022-10-15 13:57:04'),(9,'Ms. Zoe Abbott','hane.ethyl@example.net','479-785-6199','18551 Wehner Villages\nStrosinfort, IN 01492-9894','Aut eos eligendi nostrum.','Vel dicta vel labore voluptas. Ex voluptatem quia tenetur. Quam veritatis facere explicabo perspiciatis ducimus. Ut maiores illum tempora suscipit sequi quia quis magnam. Omnis vitae quo accusamus et non voluptas. Blanditiis aut earum veniam odit explicabo et. Soluta ut nihil voluptatem ipsum animi consequuntur. Cumque aliquid quasi recusandae omnis rerum. Enim voluptatem impedit nihil velit.','read','2022-10-15 13:57:04','2022-10-15 13:57:04'),(10,'Prof. Twila Connelly Sr.','jakayla.schaefer@example.com','+1-231-679-2452','99721 Ruecker Ports\nKuhicborough, SC 75832','Veritatis voluptate aut voluptates quia.','Praesentium veniam quam tempore voluptatibus non aut. Illo accusantium inventore cupiditate voluptatem. Omnis quo omnis tempore corporis ipsa voluptates provident. Corrupti quod ad rerum eum. Aut culpa maiores voluptatibus non et. Nisi excepturi hic molestiae voluptas. Fugit nostrum quis quo quia et qui. Iusto aut accusamus perspiciatis quos. Deserunt quis nemo voluptas in molestiae et dolore at. Ea sunt quo eos. Impedit sed aspernatur id. Sint quae soluta voluptatum dolorum suscipit esse modi.','unread','2022-10-15 13:57:04','2022-10-15 13:57:04');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` int unsigned NOT NULL,
  `widget_id` int unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_posts`
--

DROP TABLE IF EXISTS `favorite_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `type` enum('favorite','bookmark') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `favorite_posts_post_id_user_id_type_unique` (`post_id`,`user_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_posts`
--

LOCK TABLES `favorite_posts` WRITE;
/*!40000 ALTER TABLE `favorite_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Perfect','Tempore sit temporibus odio. Molestias facere ducimus sed officiis ut aut non. Molestiae hic voluptas facilis quas aut dolor vel.',1,0,'galleries/1.jpg',1,'published','2022-10-15 13:57:03','2022-10-15 13:57:03'),(2,'New Day','Sed est ea possimus nam aut voluptas. Et debitis voluptatibus fuga fugit.',1,0,'galleries/2.jpg',1,'published','2022-10-15 13:57:03','2022-10-15 13:57:03'),(3,'Happy Day','Ut nihil maxime quia rerum enim. Ab et eum qui aut aut. Et eum odio ipsum facilis ut quia voluptatem.',1,0,'galleries/3.jpg',1,'published','2022-10-15 13:57:03','2022-10-15 13:57:03'),(4,'Nature','Illo esse quos tenetur consectetur omnis molestiae facilis. Reiciendis velit nobis itaque rerum repudiandae quam. Veritatis at tenetur ut hic.',1,0,'galleries/4.jpg',1,'published','2022-10-15 13:57:03','2022-10-15 13:57:03'),(5,'Morning','Error voluptatem a repellat culpa repudiandae. Excepturi eligendi temporibus rem sed omnis ipsum.',1,0,'galleries/5.jpg',1,'published','2022-10-15 13:57:03','2022-10-15 13:57:03'),(6,'Photography','Unde aperiam qui ab sunt reiciendis. Repellendus consequuntur et assumenda exercitationem explicabo est. Et temporibus voluptatum dolore.',1,0,'galleries/6.jpg',1,'published','2022-10-15 13:57:03','2022-10-15 13:57:03'),(7,'Building','Voluptatem ducimus impedit laboriosam et et. Cumque omnis corrupti pariatur et aut.',1,0,'galleries/7.jpg',1,'published','2022-10-15 13:57:03','2022-10-15 13:57:03');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
INSERT INTO `galleries_translations` VALUES ('vi',1,'Hoàn hảo',NULL),('vi',2,'Ngày mới',NULL),('vi',3,'Ngày hạnh phúc',NULL),('vi',4,'Thiên nhiên',NULL),('vi',5,'Buổi sáng',NULL),('vi',6,'Nghệ thuật',NULL),('vi',7,'Kiến trúc',NULL);
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Ut dolorum voluptas nihil perferendis id temporibus enim. Et perferendis delectus qui voluptatem quidem. Sunt atque deleniti et enim dolore esse.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Quo assumenda molestiae natus deserunt odio sunt dolorum. Aspernatur reiciendis sint qui et debitis. Quis et occaecati dolor odio rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Dolorem dicta ut qui. Alias in itaque perspiciatis quia iure. Omnis tempore explicabo quia assumenda quibusdam voluptatum id.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Aut ratione non rem qui. Quia non et facilis sed. Molestiae aliquid totam ducimus quia expedita nisi. Libero repellendus ab delectus.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Fugiat sequi perferendis possimus excepturi. Quis optio iste aperiam quibusdam temporibus non maiores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Sunt ut aut quam in officiis corrupti officiis. Cupiditate eaque esse quo aut sunt velit. Aut ipsam nemo consequatur autem et eum laborum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Debitis sapiente vero voluptate quaerat voluptatem et. Ut labore rerum nisi. Adipisci accusantium magnam asperiores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Voluptas cum fugit maxime. Qui quaerat voluptatibus aperiam dolorum libero numquam. Repudiandae commodi laborum eveniet quas sit rerum vitae non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Quis quis sed ipsa sint ipsam. Laborum quia ut et. Quisquam ratione fugiat nisi.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Inventore quia pariatur quia ipsam omnis vel culpa. Asperiores sapiente quasi odio ut. Voluptas natus et sunt facilis.\\\"}]\"',1,'Botble\\Gallery\\Models\\Gallery','2022-10-15 13:57:03','2022-10-15 13:57:03'),(2,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Ut dolorum voluptas nihil perferendis id temporibus enim. Et perferendis delectus qui voluptatem quidem. Sunt atque deleniti et enim dolore esse.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Quo assumenda molestiae natus deserunt odio sunt dolorum. Aspernatur reiciendis sint qui et debitis. Quis et occaecati dolor odio rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Dolorem dicta ut qui. Alias in itaque perspiciatis quia iure. Omnis tempore explicabo quia assumenda quibusdam voluptatum id.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Aut ratione non rem qui. Quia non et facilis sed. Molestiae aliquid totam ducimus quia expedita nisi. Libero repellendus ab delectus.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Fugiat sequi perferendis possimus excepturi. Quis optio iste aperiam quibusdam temporibus non maiores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Sunt ut aut quam in officiis corrupti officiis. Cupiditate eaque esse quo aut sunt velit. Aut ipsam nemo consequatur autem et eum laborum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Debitis sapiente vero voluptate quaerat voluptatem et. Ut labore rerum nisi. Adipisci accusantium magnam asperiores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Voluptas cum fugit maxime. Qui quaerat voluptatibus aperiam dolorum libero numquam. Repudiandae commodi laborum eveniet quas sit rerum vitae non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Quis quis sed ipsa sint ipsam. Laborum quia ut et. Quisquam ratione fugiat nisi.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Inventore quia pariatur quia ipsam omnis vel culpa. Asperiores sapiente quasi odio ut. Voluptas natus et sunt facilis.\\\"}]\"',2,'Botble\\Gallery\\Models\\Gallery','2022-10-15 13:57:03','2022-10-15 13:57:03'),(3,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Ut dolorum voluptas nihil perferendis id temporibus enim. Et perferendis delectus qui voluptatem quidem. Sunt atque deleniti et enim dolore esse.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Quo assumenda molestiae natus deserunt odio sunt dolorum. Aspernatur reiciendis sint qui et debitis. Quis et occaecati dolor odio rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Dolorem dicta ut qui. Alias in itaque perspiciatis quia iure. Omnis tempore explicabo quia assumenda quibusdam voluptatum id.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Aut ratione non rem qui. Quia non et facilis sed. Molestiae aliquid totam ducimus quia expedita nisi. Libero repellendus ab delectus.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Fugiat sequi perferendis possimus excepturi. Quis optio iste aperiam quibusdam temporibus non maiores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Sunt ut aut quam in officiis corrupti officiis. Cupiditate eaque esse quo aut sunt velit. Aut ipsam nemo consequatur autem et eum laborum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Debitis sapiente vero voluptate quaerat voluptatem et. Ut labore rerum nisi. Adipisci accusantium magnam asperiores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Voluptas cum fugit maxime. Qui quaerat voluptatibus aperiam dolorum libero numquam. Repudiandae commodi laborum eveniet quas sit rerum vitae non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Quis quis sed ipsa sint ipsam. Laborum quia ut et. Quisquam ratione fugiat nisi.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Inventore quia pariatur quia ipsam omnis vel culpa. Asperiores sapiente quasi odio ut. Voluptas natus et sunt facilis.\\\"}]\"',3,'Botble\\Gallery\\Models\\Gallery','2022-10-15 13:57:03','2022-10-15 13:57:03'),(4,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Ut dolorum voluptas nihil perferendis id temporibus enim. Et perferendis delectus qui voluptatem quidem. Sunt atque deleniti et enim dolore esse.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Quo assumenda molestiae natus deserunt odio sunt dolorum. Aspernatur reiciendis sint qui et debitis. Quis et occaecati dolor odio rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Dolorem dicta ut qui. Alias in itaque perspiciatis quia iure. Omnis tempore explicabo quia assumenda quibusdam voluptatum id.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Aut ratione non rem qui. Quia non et facilis sed. Molestiae aliquid totam ducimus quia expedita nisi. Libero repellendus ab delectus.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Fugiat sequi perferendis possimus excepturi. Quis optio iste aperiam quibusdam temporibus non maiores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Sunt ut aut quam in officiis corrupti officiis. Cupiditate eaque esse quo aut sunt velit. Aut ipsam nemo consequatur autem et eum laborum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Debitis sapiente vero voluptate quaerat voluptatem et. Ut labore rerum nisi. Adipisci accusantium magnam asperiores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Voluptas cum fugit maxime. Qui quaerat voluptatibus aperiam dolorum libero numquam. Repudiandae commodi laborum eveniet quas sit rerum vitae non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Quis quis sed ipsa sint ipsam. Laborum quia ut et. Quisquam ratione fugiat nisi.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Inventore quia pariatur quia ipsam omnis vel culpa. Asperiores sapiente quasi odio ut. Voluptas natus et sunt facilis.\\\"}]\"',4,'Botble\\Gallery\\Models\\Gallery','2022-10-15 13:57:03','2022-10-15 13:57:03'),(5,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Ut dolorum voluptas nihil perferendis id temporibus enim. Et perferendis delectus qui voluptatem quidem. Sunt atque deleniti et enim dolore esse.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Quo assumenda molestiae natus deserunt odio sunt dolorum. Aspernatur reiciendis sint qui et debitis. Quis et occaecati dolor odio rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Dolorem dicta ut qui. Alias in itaque perspiciatis quia iure. Omnis tempore explicabo quia assumenda quibusdam voluptatum id.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Aut ratione non rem qui. Quia non et facilis sed. Molestiae aliquid totam ducimus quia expedita nisi. Libero repellendus ab delectus.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Fugiat sequi perferendis possimus excepturi. Quis optio iste aperiam quibusdam temporibus non maiores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Sunt ut aut quam in officiis corrupti officiis. Cupiditate eaque esse quo aut sunt velit. Aut ipsam nemo consequatur autem et eum laborum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Debitis sapiente vero voluptate quaerat voluptatem et. Ut labore rerum nisi. Adipisci accusantium magnam asperiores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Voluptas cum fugit maxime. Qui quaerat voluptatibus aperiam dolorum libero numquam. Repudiandae commodi laborum eveniet quas sit rerum vitae non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Quis quis sed ipsa sint ipsam. Laborum quia ut et. Quisquam ratione fugiat nisi.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Inventore quia pariatur quia ipsam omnis vel culpa. Asperiores sapiente quasi odio ut. Voluptas natus et sunt facilis.\\\"}]\"',5,'Botble\\Gallery\\Models\\Gallery','2022-10-15 13:57:03','2022-10-15 13:57:03'),(6,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Ut dolorum voluptas nihil perferendis id temporibus enim. Et perferendis delectus qui voluptatem quidem. Sunt atque deleniti et enim dolore esse.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Quo assumenda molestiae natus deserunt odio sunt dolorum. Aspernatur reiciendis sint qui et debitis. Quis et occaecati dolor odio rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Dolorem dicta ut qui. Alias in itaque perspiciatis quia iure. Omnis tempore explicabo quia assumenda quibusdam voluptatum id.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Aut ratione non rem qui. Quia non et facilis sed. Molestiae aliquid totam ducimus quia expedita nisi. Libero repellendus ab delectus.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Fugiat sequi perferendis possimus excepturi. Quis optio iste aperiam quibusdam temporibus non maiores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Sunt ut aut quam in officiis corrupti officiis. Cupiditate eaque esse quo aut sunt velit. Aut ipsam nemo consequatur autem et eum laborum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Debitis sapiente vero voluptate quaerat voluptatem et. Ut labore rerum nisi. Adipisci accusantium magnam asperiores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Voluptas cum fugit maxime. Qui quaerat voluptatibus aperiam dolorum libero numquam. Repudiandae commodi laborum eveniet quas sit rerum vitae non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Quis quis sed ipsa sint ipsam. Laborum quia ut et. Quisquam ratione fugiat nisi.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Inventore quia pariatur quia ipsam omnis vel culpa. Asperiores sapiente quasi odio ut. Voluptas natus et sunt facilis.\\\"}]\"',6,'Botble\\Gallery\\Models\\Gallery','2022-10-15 13:57:03','2022-10-15 13:57:03'),(7,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Ut dolorum voluptas nihil perferendis id temporibus enim. Et perferendis delectus qui voluptatem quidem. Sunt atque deleniti et enim dolore esse.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Quo assumenda molestiae natus deserunt odio sunt dolorum. Aspernatur reiciendis sint qui et debitis. Quis et occaecati dolor odio rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Dolorem dicta ut qui. Alias in itaque perspiciatis quia iure. Omnis tempore explicabo quia assumenda quibusdam voluptatum id.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Aut ratione non rem qui. Quia non et facilis sed. Molestiae aliquid totam ducimus quia expedita nisi. Libero repellendus ab delectus.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Fugiat sequi perferendis possimus excepturi. Quis optio iste aperiam quibusdam temporibus non maiores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Sunt ut aut quam in officiis corrupti officiis. Cupiditate eaque esse quo aut sunt velit. Aut ipsam nemo consequatur autem et eum laborum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Debitis sapiente vero voluptate quaerat voluptatem et. Ut labore rerum nisi. Adipisci accusantium magnam asperiores.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Voluptas cum fugit maxime. Qui quaerat voluptatibus aperiam dolorum libero numquam. Repudiandae commodi laborum eveniet quas sit rerum vitae non.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Quis quis sed ipsa sint ipsam. Laborum quia ut et. Quisquam ratione fugiat nisi.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Inventore quia pariatur quia ipsam omnis vel culpa. Asperiores sapiente quasi odio ut. Voluptas natus et sunt facilis.\\\"}]\"',7,'Botble\\Gallery\\Models\\Gallery','2022-10-15 13:57:03','2022-10-15 13:57:03');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` int NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` text COLLATE utf8mb4_unicode_ci,
  `lang_meta_origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','d4b7142bda52ba1d5d4c89ddad2236bb',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','38746bb36947ea1ea0a7a8888bb533bc',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','7f547711493fbd34f93252a77b2689d5',2,'Botble\\Menu\\Models\\Menu'),(4,'vi','735f13f4ceec3b86788ba59fa3691f4b',2,'Botble\\Menu\\Models\\MenuLocation'),(5,'vi','38746bb36947ea1ea0a7a8888bb533bc',3,'Botble\\Menu\\Models\\Menu'),(6,'vi','7f547711493fbd34f93252a77b2689d5',4,'Botble\\Menu\\Models\\Menu'),(7,'en_US','74685014a09c3ff57c1a0dacf01e86f5',1,'Botble\\PostCollection\\Models\\PostCollection'),(8,'en_US','57fce3911d2815faf06f149ed868b54a',2,'Botble\\PostCollection\\Models\\PostCollection'),(9,'vi','a0e8fe105591a4563c286c0decb92fa7',3,'Botble\\PostCollection\\Models\\PostCollection'),(10,'vi','f17e19267509e8304a650a1b53ade7c4',4,'Botble\\PostCollection\\Models\\PostCollection');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0),(2,'Tiếng Việt','vi','vi','vn',0,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'image-1',1,'image/jpeg',110154,'banners/image-1.jpg','[]','2022-10-15 13:57:00','2022-10-15 13:57:00',NULL),(2,0,'image-2',1,'image/jpeg',53388,'banners/image-2.jpg','[]','2022-10-15 13:57:00','2022-10-15 13:57:00',NULL),(3,0,'image-3',1,'image/jpeg',46269,'banners/image-3.jpg','[]','2022-10-15 13:57:00','2022-10-15 13:57:00',NULL),(4,0,'image-4',1,'image/jpeg',47591,'banners/image-4.jpg','[]','2022-10-15 13:57:01','2022-10-15 13:57:01',NULL),(5,0,'1',2,'image/jpeg',42814,'galleries/1.jpg','[]','2022-10-15 13:57:01','2022-10-15 13:57:01',NULL),(6,0,'10',2,'image/jpeg',95796,'galleries/10.jpg','[]','2022-10-15 13:57:01','2022-10-15 13:57:01',NULL),(7,0,'2',2,'image/jpeg',43108,'galleries/2.jpg','[]','2022-10-15 13:57:02','2022-10-15 13:57:02',NULL),(8,0,'3',2,'image/jpeg',67060,'galleries/3.jpg','[]','2022-10-15 13:57:02','2022-10-15 13:57:02',NULL),(9,0,'4',2,'image/jpeg',60609,'galleries/4.jpg','[]','2022-10-15 13:57:02','2022-10-15 13:57:02',NULL),(10,0,'5',2,'image/jpeg',70264,'galleries/5.jpg','[]','2022-10-15 13:57:02','2022-10-15 13:57:02',NULL),(11,0,'6',2,'image/jpeg',40607,'galleries/6.jpg','[]','2022-10-15 13:57:02','2022-10-15 13:57:02',NULL),(12,0,'7',2,'image/jpeg',41491,'galleries/7.jpg','[]','2022-10-15 13:57:02','2022-10-15 13:57:02',NULL),(13,0,'8',2,'image/jpeg',58063,'galleries/8.jpg','[]','2022-10-15 13:57:03','2022-10-15 13:57:03',NULL),(14,0,'9',2,'image/jpeg',69288,'galleries/9.jpg','[]','2022-10-15 13:57:03','2022-10-15 13:57:03',NULL),(15,0,'news-1',3,'image/jpeg',93694,'news/news-1.jpg','[]','2022-10-15 13:57:04','2022-10-15 13:57:04',NULL),(16,0,'news-10',3,'image/jpeg',58656,'news/news-10.jpg','[]','2022-10-15 13:57:04','2022-10-15 13:57:04',NULL),(17,0,'news-11',3,'image/jpeg',127000,'news/news-11.jpg','[]','2022-10-15 13:57:04','2022-10-15 13:57:04',NULL),(18,0,'news-12',3,'image/jpeg',30283,'news/news-12.jpg','[]','2022-10-15 13:57:05','2022-10-15 13:57:05',NULL),(19,0,'news-13',3,'image/jpeg',359805,'news/news-13.jpg','[]','2022-10-15 13:57:05','2022-10-15 13:57:05',NULL),(20,0,'news-14',3,'image/jpeg',128708,'news/news-14.jpg','[]','2022-10-15 13:57:05','2022-10-15 13:57:05',NULL),(21,0,'news-15',3,'image/jpeg',283779,'news/news-15.jpg','[]','2022-10-15 13:57:06','2022-10-15 13:57:06',NULL),(22,0,'news-16',3,'image/jpeg',157899,'news/news-16.jpg','[]','2022-10-15 13:57:06','2022-10-15 13:57:06',NULL),(23,0,'news-17',3,'image/jpeg',62316,'news/news-17.jpg','[]','2022-10-15 13:57:06','2022-10-15 13:57:06',NULL),(24,0,'news-18',3,'image/jpeg',103832,'news/news-18.jpg','[]','2022-10-15 13:57:06','2022-10-15 13:57:06',NULL),(25,0,'news-19',3,'image/jpeg',56987,'news/news-19.jpg','[]','2022-10-15 13:57:07','2022-10-15 13:57:07',NULL),(26,0,'news-2',3,'image/jpeg',95478,'news/news-2.jpg','[]','2022-10-15 13:57:07','2022-10-15 13:57:07',NULL),(27,0,'news-20',3,'image/jpeg',52338,'news/news-20.jpg','[]','2022-10-15 13:57:07','2022-10-15 13:57:07',NULL),(28,0,'news-21',3,'image/jpeg',76078,'news/news-21.jpg','[]','2022-10-15 13:57:08','2022-10-15 13:57:08',NULL),(29,0,'news-22',3,'image/jpeg',45269,'news/news-22.jpg','[]','2022-10-15 13:57:08','2022-10-15 13:57:08',NULL),(30,0,'news-23',3,'image/jpeg',39502,'news/news-23.jpg','[]','2022-10-15 13:57:08','2022-10-15 13:57:08',NULL),(31,0,'news-24',3,'image/jpeg',17605,'news/news-24.jpg','[]','2022-10-15 13:57:08','2022-10-15 13:57:08',NULL),(32,0,'news-3',3,'image/jpeg',44092,'news/news-3.jpg','[]','2022-10-15 13:57:08','2022-10-15 13:57:08',NULL),(33,0,'news-4',3,'image/jpeg',163183,'news/news-4.jpg','[]','2022-10-15 13:57:09','2022-10-15 13:57:09',NULL),(34,0,'news-5',3,'image/jpeg',93457,'news/news-5.jpg','[]','2022-10-15 13:57:09','2022-10-15 13:57:09',NULL),(35,0,'news-6',3,'image/jpeg',70592,'news/news-6.jpg','[]','2022-10-15 13:57:09','2022-10-15 13:57:09',NULL),(36,0,'news-7',3,'image/jpeg',115977,'news/news-7.jpg','[]','2022-10-15 13:57:10','2022-10-15 13:57:10',NULL),(37,0,'news-8',3,'image/jpeg',80243,'news/news-8.jpg','[]','2022-10-15 13:57:10','2022-10-15 13:57:10',NULL),(38,0,'news-9',3,'image/jpeg',52207,'news/news-9.jpg','[]','2022-10-15 13:57:10','2022-10-15 13:57:10',NULL),(39,0,'thumbnail-1',3,'image/jpeg',166014,'news/thumbnail-1.jpg','[]','2022-10-15 13:57:10','2022-10-15 13:57:10',NULL),(40,0,'thumbnail-2',3,'image/jpeg',52142,'news/thumbnail-2.jpg','[]','2022-10-15 13:57:11','2022-10-15 13:57:11',NULL),(41,0,'thumbnail-3',3,'image/jpeg',130131,'news/thumbnail-3.jpg','[]','2022-10-15 13:57:11','2022-10-15 13:57:11',NULL),(42,0,'thumbnail-4',3,'image/jpeg',71857,'news/thumbnail-4.jpg','[]','2022-10-15 13:57:11','2022-10-15 13:57:11',NULL),(43,0,'thumbnail-5',3,'image/jpeg',47451,'news/thumbnail-5.jpg','[]','2022-10-15 13:57:11','2022-10-15 13:57:11',NULL),(44,0,'thumbnail-6',3,'image/jpeg',98871,'news/thumbnail-6.jpg','[]','2022-10-15 13:57:11','2022-10-15 13:57:11',NULL),(45,0,'video1',4,'video/mp4',6378345,'videos/video1.mp4','[]','2022-10-15 13:57:12','2022-10-15 13:57:12',NULL),(46,0,'1',5,'image/jpeg',11752,'authors/1.jpg','[]','2022-10-15 13:57:13','2022-10-15 13:57:13',NULL),(47,0,'10',5,'image/jpeg',27814,'authors/10.jpg','[]','2022-10-15 13:57:13','2022-10-15 13:57:13',NULL),(48,0,'2',5,'image/jpeg',19005,'authors/2.jpg','[]','2022-10-15 13:57:14','2022-10-15 13:57:14',NULL),(49,0,'3',5,'image/jpeg',20400,'authors/3.jpg','[]','2022-10-15 13:57:14','2022-10-15 13:57:14',NULL),(50,0,'4',5,'image/jpeg',26819,'authors/4.jpg','[]','2022-10-15 13:57:14','2022-10-15 13:57:14',NULL),(51,0,'5',5,'image/jpeg',14367,'authors/5.jpg','[]','2022-10-15 13:57:14','2022-10-15 13:57:14',NULL),(52,0,'6',5,'image/jpeg',12367,'authors/6.jpg','[]','2022-10-15 13:57:14','2022-10-15 13:57:14',NULL),(53,0,'7',5,'image/jpeg',20652,'authors/7.jpg','[]','2022-10-15 13:57:14','2022-10-15 13:57:14',NULL),(54,0,'8',5,'image/jpeg',21164,'authors/8.jpg','[]','2022-10-15 13:57:14','2022-10-15 13:57:14',NULL),(55,0,'9',5,'image/jpeg',6084,'authors/9.jpg','[]','2022-10-15 13:57:14','2022-10-15 13:57:14',NULL),(56,0,'favicon',6,'image/png',3913,'general/favicon.png','[]','2022-10-15 13:57:16','2022-10-15 13:57:16',NULL),(57,0,'img-loading',6,'image/jpeg',461,'general/img-loading.jpg','[]','2022-10-15 13:57:16','2022-10-15 13:57:16',NULL),(58,0,'logo-mobile',6,'image/png',5054,'general/logo-mobile.png','[]','2022-10-15 13:57:16','2022-10-15 13:57:16',NULL),(59,0,'logo-tablet',6,'image/png',5786,'general/logo-tablet.png','[]','2022-10-15 13:57:16','2022-10-15 13:57:16',NULL),(60,0,'logo-white',6,'image/png',6305,'general/logo-white.png','[]','2022-10-15 13:57:16','2022-10-15 13:57:16',NULL),(61,0,'logo',6,'image/png',7171,'general/logo.png','[]','2022-10-15 13:57:17','2022-10-15 13:57:17',NULL),(62,0,'screenshot',6,'image/png',205662,'general/screenshot.png','[]','2022-10-15 13:57:17','2022-10-15 13:57:17',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'banners','banners',0,'2022-10-15 13:57:00','2022-10-15 13:57:00',NULL),(2,0,'galleries','galleries',0,'2022-10-15 13:57:01','2022-10-15 13:57:01',NULL),(3,0,'news','news',0,'2022-10-15 13:57:04','2022-10-15 13:57:04',NULL),(4,0,'videos','videos',0,'2022-10-15 13:57:12','2022-10-15 13:57:12',NULL),(5,0,'authors','authors',0,'2022-10-15 13:57:13','2022-10-15 13:57:13',NULL),(6,0,'general','general',0,'2022-10-15 13:57:16','2022-10-15 13:57:16',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_activity_logs`
--

DROP TABLE IF EXISTS `member_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_activity_logs_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_activity_logs`
--

LOCK TABLES `member_activity_logs` WRITE;
/*!40000 ALTER TABLE `member_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_password_resets`
--

DROP TABLE IF EXISTS `member_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `member_password_resets_email_index` (`email`),
  KEY `member_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_password_resets`
--

LOCK TABLES `member_password_resets` WRITE;
/*!40000 ALTER TABLE `member_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` int unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `favorite_posts` text COLLATE utf8mb4_unicode_ci,
  `bookmark_posts` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `members_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'John','Smith','D,\' she added aloud. \'Do you take me for a baby: altogether Alice did not venture to go among mad.',NULL,'user@thesky9.com','$2y$10$S.UZPcTpWq6VT2a9iNfR8eci4YsBiDZTBRMulDVJzuhIZp7XCRti.',53,'2001-09-20','330-966-4206','2022-10-15 13:57:15',NULL,NULL,'2022-10-15 13:57:15','2022-10-15 13:57:15',NULL,NULL),(2,'Amie','Kutch','Alice like the tone of delight, and rushed at the March Hare. \'Exactly so,\' said Alice. \'Oh, don\'t.',NULL,'hstokes@durgan.org','$2y$10$rPc20zIFiFR.FLYb378GkOzYUjaT.ZDKlJQeVsdGDqlAPTiMt6P2u',46,'2013-02-27','(617) 746-5069','2022-10-15 13:57:15',NULL,NULL,'2022-10-15 13:57:15','2022-10-15 13:57:15',NULL,NULL),(3,'Vesta','Thompson','Hatter. \'It isn\'t a letter, written by the officers of the ground--and I should like to be sure.',NULL,'gus94@swift.com','$2y$10$5jiO7fVBy3vCFcF7V/4JMuE3Td01c7K/L08J9kH0MM9FvywcT0kzS',52,'2000-12-16','678.986.1416','2022-10-15 13:57:15',NULL,NULL,'2022-10-15 13:57:15','2022-10-15 13:57:15',NULL,NULL),(4,'Clint','Yost','CAN I have to ask them what the flame of a well--\' \'What did they draw the treacle from?\' \'You can.',NULL,'vturcotte@yahoo.com','$2y$10$r2sK2tmundSv3ojz1ELJKu9sHpJ3kkBmbO1l1fvsX7uEhByNJy9iW',49,'2014-04-13','1-341-382-6186','2022-10-15 13:57:15',NULL,NULL,'2022-10-15 13:57:15','2022-10-15 13:57:15',NULL,NULL),(5,'Vicky','Littel','Footman continued in the other: he came trotting along in a hurried nervous manner, smiling at.',NULL,'justus72@schmeler.com','$2y$10$AKDTrlF3CdMpquethetYW.2iwBv3BGEOVkst9HcpjTcTCnFh5uf5m',52,'1978-08-28','+1-678-816-1276','2022-10-15 13:57:15',NULL,NULL,'2022-10-15 13:57:15','2022-10-15 13:57:15',NULL,NULL),(6,'Abraham','Lehner','WHAT?\' said the White Rabbit: it was too late to wish that! She went in search of her favourite.',NULL,'jkuhlman@morar.biz','$2y$10$s7eUWyldVTTbHEYrL3aHTOhPBB..mOTHRSgc1vcDUW7cxIfFrlZP.',50,'1997-11-11','(931) 850-1310','2022-10-15 13:57:15',NULL,NULL,'2022-10-15 13:57:15','2022-10-15 13:57:15',NULL,NULL),(7,'Milford','Simonis','CHORUS. \'Wow! wow! wow!\' While the Duchess sneezed occasionally; and as he spoke. \'A cat may look.',NULL,'raven.frami@yahoo.com','$2y$10$X4vwqAm/0TIJgvjlaarZYOa0QEeA9dXVedJNKG/4G0VnSpfJiFD6W',53,'1977-01-12','+12252801740','2022-10-15 13:57:15',NULL,NULL,'2022-10-15 13:57:15','2022-10-15 13:57:15',NULL,NULL),(8,'Jailyn','Deckow','King. (The jury all brightened up again.) \'Please your Majesty,\' said Two, in a game of play with.',NULL,'yharber@yahoo.com','$2y$10$7/AfDnZWOSZ1rgAKwpqyEOewaBu/qnlvqSWsDuw5Nc0hUASAG3lOW',55,'1977-07-29','(715) 317-0063','2022-10-15 13:57:15',NULL,NULL,'2022-10-15 13:57:15','2022-10-15 13:57:15',NULL,NULL),(9,'Cristobal','Hand','Alice asked in a low voice, \'Why the fact is, you know. Which shall sing?\' \'Oh, YOU sing,\' said.',NULL,'rickey36@gmail.com','$2y$10$3duJBtc3.tsaSkfZAHyXBO7hanFDRflorXjezrbkRPzVPIxrIOOSW',49,'2007-08-25','+1-412-303-9370','2022-10-15 13:57:15',NULL,NULL,'2022-10-15 13:57:15','2022-10-15 13:57:15',NULL,NULL),(10,'Susana','Schuster','March Hare. \'Exactly so,\' said Alice. \'Of course twinkling begins with a pair of white kid gloves.',NULL,'kiarra.watsica@gusikowski.biz','$2y$10$7be/rhLEgS5GfHTpiucPl.sz3cuzvr2qpe415Js1SD10NRRDoSPBO',47,'1989-07-04','+1-610-283-5791','2022-10-15 13:57:15',NULL,NULL,'2022-10-15 13:57:15','2022-10-15 13:57:15',NULL,NULL),(11,'Icie','Ankunding','Dormouse, who was reading the list of the table. \'Have some wine,\' the March Hare. \'Exactly so,\'.',NULL,'bernadette.oberbrunner@hotmail.com','$2y$10$IYNKBuuKPOXtaO8YizWIjOL7ie2j.y0hRvKEtqfsvl7T79jbXBqpS',52,'2013-05-12','1-719-816-2312','2022-10-15 13:57:15',NULL,NULL,'2022-10-15 13:57:15','2022-10-15 13:57:15',NULL,NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2022-10-15 13:57:16','2022-10-15 13:57:16'),(2,3,'main-menu','2022-10-15 13:57:16','2022-10-15 13:57:16');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `reference_id` int unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',1,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(2,1,1,NULL,NULL,'/',NULL,0,'Home default',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(3,1,1,NULL,NULL,'/home-2?header=style-2',NULL,0,'Home 2',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(4,1,1,NULL,NULL,'/home-3?header=style-3',NULL,0,'Home 3',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(5,1,0,NULL,NULL,'/galleries',NULL,0,'Galleries',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(6,1,0,6,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Category layouts',NULL,'_self',1,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(7,1,6,5,'Botble\\Page\\Models\\Page',NULL,NULL,0,'List',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(8,1,6,6,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Grid',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(9,1,6,7,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Metro',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(10,1,0,1,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Post layouts',NULL,'_self',1,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(11,1,10,1,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Default',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(12,1,10,2,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Full top',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(13,1,10,3,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Inline',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(14,1,0,9,'Botble\\Page\\Models\\Page',NULL,NULL,0,'About',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(15,1,0,8,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Contact',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(16,1,0,NULL,NULL,NULL,NULL,0,'Pages',NULL,'_self',1,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(17,1,16,10,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Cookie Policy',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(18,1,16,NULL,NULL,'page-not-found',NULL,0,'404',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(19,1,16,NULL,NULL,'/login',NULL,0,'Login',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(20,1,16,NULL,NULL,'/register',NULL,0,'Signup',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(21,2,0,NULL,NULL,'/',NULL,0,'Homepage',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(22,2,0,8,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Contact',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(23,2,0,4,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Blog',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(24,2,0,NULL,NULL,'/galleries',NULL,0,'Galleries',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(25,3,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',1,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(26,3,25,NULL,NULL,'/',NULL,0,'Trang chủ mặc định',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(27,3,25,NULL,NULL,'/home-2?header=style-2',NULL,0,'Trang chủ 2',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(28,3,25,NULL,NULL,'/home-3?header=style-3',NULL,0,'Trang chủ 3',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(29,3,0,NULL,NULL,'/galleries',NULL,0,'Thư viện ảnh',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(30,3,0,6,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Danh mục',NULL,'_self',1,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(31,3,30,5,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Style cột',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(32,3,30,6,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Style danh sách',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(33,3,30,7,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Style danh sách 2',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(34,3,0,1,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Bài viết',NULL,'_self',1,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(35,3,34,1,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Default',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(36,3,34,2,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Full top',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(37,3,34,3,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Inline',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(38,3,0,9,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Liên hệ',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(39,3,0,8,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Về chúng tôi',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(40,4,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(41,4,0,8,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Liên hệ',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(42,4,0,4,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Tin tức',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16'),(43,4,0,NULL,NULL,'/galleries',NULL,0,'Thư viện ảnh',NULL,'_self',0,'2022-10-15 13:57:16','2022-10-15 13:57:16');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2022-10-15 13:57:16','2022-10-15 13:57:16'),(2,'Quick links','quick-links','published','2022-10-15 13:57:16','2022-10-15 13:57:16'),(3,'Menu chính','menu-chinh','published','2022-10-15 13:57:16','2022-10-15 13:57:16'),(4,'Liên kết','lien-ket','published','2022-10-15 13:57:16','2022-10-15 13:57:16');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'layout','[\"default\"]',1,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:12','2022-10-15 13:57:12'),(2,'time_to_read','[14]',1,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:12','2022-10-15 13:57:12'),(3,'comment_status','[1]',1,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:12','2022-10-15 13:57:12'),(4,'layout','[\"top-full\"]',2,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:12','2022-10-15 13:57:12'),(5,'time_to_read','[14]',2,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:12','2022-10-15 13:57:12'),(6,'comment_status','[1]',2,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:12','2022-10-15 13:57:12'),(7,'layout','[\"inline\"]',3,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:12','2022-10-15 13:57:12'),(8,'time_to_read','[8]',3,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:12','2022-10-15 13:57:12'),(9,'comment_status','[1]',3,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:12','2022-10-15 13:57:12'),(10,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/289366685?h=b6b9d1e67b&title=0&byline=0&portrait=0\"]',4,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:12','2022-10-15 13:57:12'),(11,'time_to_read','[15]',4,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:12','2022-10-15 13:57:12'),(12,'comment_status','[1]',4,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:12','2022-10-15 13:57:12'),(13,'video_upload_id','[\"videos\\/video1.mp4\"]',5,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(14,'time_to_read','[11]',5,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(15,'comment_status','[1]',5,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(16,'time_to_read','[2]',6,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(17,'comment_status','[1]',6,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(18,'time_to_read','[3]',7,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(19,'comment_status','[1]',7,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(20,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/559851845?h=afc6d413c9\"]',8,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(21,'time_to_read','[8]',8,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(22,'comment_status','[1]',8,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(23,'time_to_read','[6]',9,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(24,'comment_status','[1]',9,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(25,'time_to_read','[4]',10,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(26,'comment_status','[1]',10,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(27,'time_to_read','[6]',11,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(28,'comment_status','[1]',11,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(29,'time_to_read','[16]',12,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(30,'comment_status','[1]',12,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(31,'time_to_read','[10]',13,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(32,'comment_status','[1]',13,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(33,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/580799106?h=a8eb717af9\"]',14,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(34,'time_to_read','[2]',14,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(35,'comment_status','[1]',14,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(36,'time_to_read','[4]',15,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(37,'comment_status','[1]',15,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(38,'time_to_read','[13]',16,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(39,'comment_status','[1]',16,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(40,'time_to_read','[13]',17,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(41,'comment_status','[1]',17,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(42,'time_to_read','[2]',18,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(43,'comment_status','[1]',18,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(44,'time_to_read','[15]',19,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(45,'comment_status','[1]',19,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(46,'time_to_read','[15]',20,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13'),(47,'comment_status','[1]',20,'Botble\\Blog\\Models\\Post','2022-10-15 13:57:13','2022-10-15 13:57:13');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_resets_table',1),(5,'2016_06_01_000001_create_oauth_auth_codes_table',1),(6,'2016_06_01_000002_create_oauth_access_tokens_table',1),(7,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(8,'2016_06_01_000004_create_oauth_clients_table',1),(9,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(10,'2016_06_10_230148_create_acl_tables',1),(11,'2016_06_14_230857_create_menus_table',1),(12,'2016_06_28_221418_create_pages_table',1),(13,'2016_10_05_074239_create_setting_table',1),(14,'2016_11_28_032840_create_dashboard_widget_tables',1),(15,'2016_12_16_084601_create_widgets_table',1),(16,'2017_05_09_070343_create_media_tables',1),(17,'2017_11_03_070450_create_slug_table',1),(18,'2019_01_05_053554_create_jobs_table',1),(19,'2019_08_19_000000_create_failed_jobs_table',1),(20,'2019_12_14_000001_create_personal_access_tokens_table',1),(21,'2022_04_20_100851_add_index_to_media_table',1),(22,'2022_04_20_101046_add_index_to_menu_table',1),(23,'2022_07_10_034813_move_lang_folder_to_root',1),(24,'2022_08_04_051940_add_missing_column_expires_at',1),(25,'2020_11_18_150916_ads_create_ads_table',2),(26,'2021_12_02_035301_add_ads_translations_table',2),(27,'2015_06_29_025744_create_audit_history',3),(28,'2015_06_18_033822_create_blog_table',4),(29,'2021_02_16_092633_remove_default_value_for_author_type',4),(30,'2021_12_03_030600_create_blog_translations',4),(31,'2022_04_19_113923_add_index_to_table_posts',4),(32,'2021_07_08_140130_comment_create_comment_table',5),(33,'2016_06_17_091537_create_contacts_table',6),(34,'2016_10_13_150201_create_galleries_table',7),(35,'2021_12_03_082953_create_gallery_translations',7),(36,'2022_04_30_034048_create_gallery_meta_translations_table',7),(37,'2016_10_03_032336_create_languages_table',8),(38,'2021_10_25_021023_fix-priority-load-for-language-advanced',9),(39,'2021_12_03_075608_create_page_translations',9),(40,'2017_10_04_140938_create_member_table',10),(41,'2017_10_24_154832_create_newsletter_table',11),(42,'2021_08_25_122708_post_collection_create_post_collection_table',12),(43,'2021_07_14_043820_add_publised_at_table_posts',13),(44,'2021_10_16_043705_pro_posts_create_favorite_posts_table',14),(45,'2021_10_16_105007_add_bookmark_posts_column_to_members_table',14),(46,'2021_11_13_010429_change_column_table_members',14),(47,'2016_05_28_112028_create_system_request_logs_table',15),(48,'2016_10_07_193005_create_translations_table',16);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[posts-slider title=\"\" filter_by=\"featured\" limit=\"4\" include=\"\" style=\"1\"][/posts-slider]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[categories-tab-posts title=\"Popular\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[posts-collection title=\"Recommended\" subtitle=\"R\" limit=\"4\" posts_collection_id=\"2\" background_style=\"background-white\"][/posts-collection]</div><div>[theme-galleries title=\"@ OUR GALLERIES\" limit=\"7\" subtitle=\"O\"][/theme-galleries]</div>',1,NULL,'homepage',0,NULL,'published','2022-10-15 13:57:01','2022-10-15 13:57:01'),(2,'Home 2','<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"3\"][/posts-slider]</div><div>[categories-tab-posts title=\"Popular\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>',1,NULL,'homepage2',0,NULL,'published','2022-10-15 13:57:01','2022-10-15 13:57:01'),(3,'Home 3','<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"4\"][/posts-slider]</div><div>[posts-grid title=\"Featured Posts\" subtitle=\"News\" limit=\"6\" order_by=\"views\" order=\"desc\"][/posts-grid]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>',1,NULL,'homepage2',0,NULL,'published','2022-10-15 13:57:01','2022-10-15 13:57:01'),(4,'Blog','<div>[posts-listing layout=\"list\"][/posts-listing]</div>',1,NULL,'default',0,NULL,'published','2022-10-15 13:57:01','2022-10-15 13:57:01'),(5,'Category List','<div>[posts-listing layout=\"list\"][/posts-listing]</div>',1,NULL,'no-breadcrumbs',0,NULL,'published','2022-10-15 13:57:01','2022-10-15 13:57:01'),(6,'Category grid','<div>[posts-listing layout=\"grid\"][/posts-listing]</div>',1,NULL,'full',0,NULL,'published','2022-10-15 13:57:01','2022-10-15 13:57:01'),(7,'Category metro','<div>[posts-listing layout=\"metro\"][/posts-listing]</div>',1,NULL,'full',0,NULL,'published','2022-10-15 13:57:01','2022-10-15 13:57:01'),(8,'Contact','<div>[contact-form title=\"Get in Touch\"][/contact-form]</div><h3>Directions</h3><div>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</div>',1,NULL,'default',0,NULL,'published','2022-10-15 13:57:01','2022-10-15 13:57:01'),(9,'About Us','<div class=\"raw-html-embed\"><div class=\"row\">\n    <div class=\"col-md-12 col-sm-12\">\n        <div class=\"single-excerpt\">\n            <p class=\"font-large\">Tolerably much and ouch the in began alas more ouch some then accommodating flimsy wholeheartedly after hello slightly the that cow pouted much a goodness bound rebuilt poetically jaguar groundhog</p>\n        </div>\n        <div class=\"entry-main-content\">\n            <h2>Computer inside</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <div class=\"wp-block-image\">\n                <figure class=\"alignleft is-resized\">\n                    <img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-14.jpg\">\n                </figure>\n            </div>\n            <p>Less lion goodness that euphemistically robin expeditiously bluebird smugly scratched far while thus cackled sheepishly rigid after due one assenting regarding censorious while occasional or this more crane went more as\n                this less much amid overhung anathematic because much held one exuberantly sheep goodness so where rat wry well concomitantly.</p>\n            <h5>What\'s next?</h5>\n            <p>Pouted flirtatiously as beaver beheld above forward energetic across this jeepers beneficently cockily less a the raucously that magic upheld far so the this where crud then below after jeez enchanting drunkenly more much\n                wow callously irrespective limpet.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n            <p>Other yet this hazardous oh the until brave close towards stupidly euphemistically firefly boa some more underneath circa yet on as wow above ripe or blubbered one cobra bore ouch and this held ably one hence</p>\n            <h2>Conclusion</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Alexe more gulped much garrulous a yikes earthworm wiped because goodness bet mongoose that along accommodatingly tortoise indecisively admirable but shark dear some and unwillingly before far vindictive less much this\n                on more less flexed far woolly from following glanced resolute unlike far this alongside against icily beyond flabby accidental.</p>\n\n\n            <h2>Design is future</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Uninhibited carnally hired played in whimpered dear gorilla koala depending and much yikes off far quetzal goodness and from for grimaced goodness unaccountably and meadowlark near unblushingly crucial scallop tightly neurotic\n                hungrily some and dear furiously this apart.</p>\n            <p>Spluttered narrowly yikes left moth in yikes bowed this that grizzly much hello on spoon-fed that alas rethought much decently richly and wow against the frequent fluidly at formidable acceptably flapped besides and much\n                circa far over the bucolically hey precarious goldfinch mastodon goodness gnashed a jellyfish and one however because.</p>\n            <figure class=\"wp-block-gallery columns-3\">\n                <ul class=\"blocks-gallery-grid\">\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-1.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-2.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-10.jpg\" alt=\"\"></a>\n                    </li>\n                </ul>\n            </figure>\n            <p>Laconic overheard dear woodchuck wow this outrageously taut beaver hey hello far meadowlark imitatively egregiously hugged that yikes minimally unanimous pouted flirtatiously as beaver beheld above forward energetic across\n                this jeepers beneficently cockily less a the raucously that magic upheld far so the this where crud then below after jeez enchanting drunkenly more much wow callously irrespective limpet.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n            <p>Scallop or far crud plain remarkably far by thus far iguana lewd precociously and and less rattlesnake contrary caustic wow this near alas and next and pled the yikes articulate about as less cackled dalmatian in much less\n                well jeering for the thanks blindly sentimental whimpered less across objectively fanciful grimaced wildly some wow and rose jeepers outgrew lugubrious luridly irrationally attractively dachshund.</p>\n            <blockquote class=\"wp-block-quote is-style-large\">\n                <p>The advance of technology is based on making it fit in so that you don\'t really even notice it, so it\'s part of everyday life.</p><cite>B. Johnso</cite>\n            </blockquote>\n            <p class=\"text-center\">\n                <a href=\"#\"><img class=\"d-inline\" src=\"assets/imgs/ads-4.jpg\" alt=\"\"></a>\n            </p>\n        </div>\n    </div>\n</div>\n</div><h3>Address</h3><div>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</div>',1,NULL,'default',0,NULL,'published','2022-10-15 13:57:01','2022-10-15 13:57:01'),(10,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',0,NULL,'published','2022-10-15 13:57:01','2022-10-15 13:57:01');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
INSERT INTO `pages_translations` VALUES ('vi',1,'Trang chủ',NULL,'<div>[posts-slider title=\"\" filter_by=\"featured\" limit=\"4\" include=\"\" style=\"1\"][/posts-slider]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Bài viết mới\" subtitle=\"Latest\" limit=\"3\" show_follow_us_section=\"1\"][/recent-posts]</div><div>[categories-tab-posts title=\"Bài viết được quan tâm\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[posts-grid title=\"Bài viết nổi bật\" subtitle=\"News\" categories=\"\" categories_exclude=\"\" style=\"2\" limit=\"6\"][/posts-grid]</div><div>[theme-galleries title=\"@ OUR GALLERIES\" subtitle=\"In motion\" limit=\"7\"][/theme-galleries]</div>'),('vi',2,'Trang chủ 2',NULL,'<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"3\"][/posts-slider]</div><div>[categories-tab-posts title=\"Popular\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>'),('vi',3,'Trang chủ 3',NULL,'<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"4\"][/posts-slider]</div><div>[posts-grid title=\"Featured Posts\" subtitle=\"News\" limit=\"6\" order_by=\"views\" order=\"desc\"][/posts-grid]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>'),('vi',4,'Tin tức',NULL,'<div>[categories-big limit=\"12\"][/categories-big]</div>'),('vi',5,'Tin tức danh sách',NULL,'<div>[posts-listing layout=\"list\"][/posts-listing]</div>'),('vi',6,'Tin tức dạng cột',NULL,'<div>[posts-listing layout=\"grid\"][/posts-listing]</div>'),('vi',7,'Tin tức metro',NULL,'<div>[posts-listing layout=\"metro\"][/posts-listing]</div>'),('vi',8,'Liên hệ',NULL,'<div>[contact-form title=\"Liên hệ\"][/contact-form]</div><h3>Địa chỉ</h3><div>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</div>'),('vi',9,'Về chúng tôi',NULL,'<div class=\"raw-html-embed\"><div class=\"row\">\n    <div class=\"col-md-12 col-sm-12\">\n        <div class=\"single-excerpt\">\n            <p class=\"font-large\">Người ta né tránh nhắc đến Chúa Kito khi nói đến mốc lịch sử bằng cách nói Trước công nguyên và sau công nguyên. Nhưng nguyên tiếng anh: Before Chirst, After Chirst – trước Chúa Kito, sau Chúa Kito – người ta sợ lịch sử của Kito giáo. Đó là lời chia sẻ của cha đặc trách Gioan trong Thánh lễ thường kì Cộng đoàn sinh viên Công giáo y dược vào lúc 19h15’, ngày 11.05.2017 tại đền thánh Gierado, Giáo xứ Thái Hà.</p>\n        </div>\n        <div class=\"entry-main-content\">\n            <h2>Cuộc sống là những phép màu</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <div class=\"wp-block-image\">\n                <figure class=\"alignleft is-resized\">\n                    <img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-14.jpg\">\n                </figure>\n            </div>\n            <p>Khởi đầu bài giảng của mình cha nói đến một trong những khó khăn lớn nhất Giáo Hội nói chung và người tín hữu nói riêng đó chính là niềm tin vào Thiên Chúa. Chính khủng hoảng niềm tin gây nên chiến tranh, gây nên thù hận và chết chóc. Lòng tin không chỉ ảnh hưởng lên cá nhân mà thôi nhưng lên toàn thế giới. Hôm nay, Chúa cho chúng ta thấy lòng tin là khởi đầu, là mấu chốt để con người đứng vững giữa trăm chiều thử thách.</p>\n            <h5>Ý nghĩa là gì?</h5>\n            <p>Hai bài đọc hôm nay đều đi từ lịch sử, Chúa Giesu tiên báo kẻ sẽ nộp thầy. Ngài chọn Giuda không phải chọn nhầm, nhưng Ngài nói rõ trong bài Tin Mừng rằng lời kinh thánh phải được ứng nghiệm: “Kẻ giơ tay chấm chung một đĩa với con lại giơ gót đạp con”. Trong bài đọc một, Phaolo nói về Đavit để ứng nghiệm lời Kinh thánh đã nói, để anh chị em Do thái nhận ra được lời tiên báo qua lịch sử là chúa Giesu.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n            <p>Để có được lòng tin nơi con người, Chúa Giesu đã khai mào trong một chương trình lịch sử dài tập. Lịch sử Cựu ước loan báo đúng với những gì đã xảy ra với Chúa Giesu Kito. Một triết gia người Pháp nói rằng: “Kito giáo có một nền tảng đức tin vững chắc đó là lịch sử, nhưng Kito giáo quên đi điểm quan trọng này và ngày nay đi nặng về phía thần học”.</p>\n            <h2>Kết luận</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Cha nhắc lại: Kito Giáo cắm rễ sâu, trải dài và được ứng nghiệm trong lịch sử thánh kinh ngang qua những con người, nơi chốn, địa điểm cụ thể. Nhìn lại lịch sử, các ngày lễ xã hội, ngày nghỉ… đều liên quan đến Kito giáo và xuất phát từ Kito giáo.</p>\n\n\n            <h2>Tương lai</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Cha nói đến biến cố Đức Mẹ hiện ra tại Fatima 100 năm là một biến cố lịch sử có thời gian, không gian, nhân vật và sứ điệp cụ thể không phải con người tự dụng nên hay hoang tưởng.</p>\n            <p>Niềm tin của mỗi chúng ta phải dựa vào lịch sử chứ không phải mơ hồ. Khi nhìn lại quá khứ ta biết rằng lòng tin đó đã được Thiên Chúa khai mào từ rất sớm. Các thánh Tông đồ đã đứng trên bình diện lịch sự để minh chứng niềm tin của con người vào Giave Thiên Chúa.</p>\n            <figure class=\"wp-block-gallery columns-3\">\n                <ul class=\"blocks-gallery-grid\">\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-1.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-2.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-10.jpg\" alt=\"\"></a>\n                    </li>\n                </ul>\n            </figure>\n            <p>Nhiều người thời nay biết lịch sử nhưng không biết Chúa Kito là ai vì họ né tránh Chúa Giesu. Chúa Giesu đi vào lịch sử để tỏ cho con người cùng đích của sự sống là gì và Thiên Chúa là ai cùng những lời tiên báo để củng cố lòng tin cho con người.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n           <blockquote class=\"wp-block-quote is-style-large\">\n                <p>Sự tiến bộ của công nghệ dựa trên việc làm cho nó phù hợp để bạn thậm chí không thực sự nhận thấy nó, vì vậy nó là một phần của cuộc sống hàng ngày.</p><cite>B. Johnso</cite>\n            </blockquote>\n            <p class=\"text-center\">\n                <a href=\"#\"><img class=\"d-inline\" src=\"assets/imgs/ads-4.jpg\" alt=\"\"></a>\n            </p>\n        </div>\n    </div>\n</div>\n</div>'),('vi',10,'Cookie Policy',NULL,'<h3>EU Cookie Consent</h3><p>Để sử dụng trang web này, chúng tôi đang sử dụng Cookie và thu thập một số Dữ liệu. Để tuân thủ GDPR của Liên minh Châu Âu, chúng tôi cho bạn lựa chọn nếu bạn cho phép chúng tôi sử dụng một số Cookie nhất định và thu thập một số Dữ liệu.</p><h4>Dữ liệu cần thiết</h4><p>Dữ liệu cần thiết là cần thiết để chạy Trang web bạn đang truy cập về mặt kỹ thuật. Bạn không thể hủy kích hoạt chúng.</p><p>- Session Cookie: PHP sử dụng Cookie để xác định phiên của người dùng. Nếu không có Cookie này, trang web sẽ không hoạt động.</p><p>- XSRF-Token Cookie: Laravel tự động tạo \"token\" CSRF cho mỗi phiên người dùng đang hoạt động do ứng dụng quản lý. Token này được sử dụng để xác minh rằng người dùng đã xác thực là người thực sự đưa ra yêu cầu đối với ứng dụng.</p>');
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,1,2),(9,2,2),(10,3,2),(11,4,2),(12,5,2),(13,6,2),(14,7,2),(15,1,3),(16,2,3),(17,3,3),(18,4,3),(19,5,3),(20,6,3),(21,7,3),(22,1,4),(23,2,4),(24,3,4),(25,4,4),(26,5,4),(27,6,4),(28,7,4),(29,1,5),(30,2,5),(31,3,5),(32,4,5),(33,5,5),(34,6,5),(35,7,5),(36,1,6),(37,2,6),(38,3,6),(39,4,6),(40,5,6),(41,6,6),(42,7,6),(43,1,7),(44,2,7),(45,3,7),(46,4,7),(47,5,7),(48,6,7),(49,7,7),(50,1,8),(51,2,8),(52,3,8),(53,4,8),(54,5,8),(55,6,8),(56,7,8),(57,1,9),(58,2,9),(59,3,9),(60,4,9),(61,5,9),(62,6,9),(63,7,9),(64,1,10),(65,2,10),(66,3,10),(67,4,10),(68,5,10),(69,6,10),(70,7,10),(71,1,11),(72,2,11),(73,3,11),(74,4,11),(75,5,11),(76,6,11),(77,7,11),(78,1,12),(79,2,12),(80,3,12),(81,4,12),(82,5,12),(83,6,12),(84,7,12),(85,1,13),(86,2,13),(87,3,13),(88,4,13),(89,5,13),(90,6,13),(91,7,13),(92,1,14),(93,2,14),(94,3,14),(95,4,14),(96,5,14),(97,6,14),(98,7,14),(99,1,15),(100,2,15),(101,3,15),(102,4,15),(103,5,15),(104,6,15),(105,7,15),(106,1,16),(107,2,16),(108,3,16),(109,4,16),(110,5,16),(111,6,16),(112,7,16),(113,1,17),(114,2,17),(115,3,17),(116,4,17),(117,5,17),(118,6,17),(119,7,17),(120,1,18),(121,2,18),(122,3,18),(123,4,18),(124,5,18),(125,6,18),(126,7,18),(127,1,19),(128,2,19),(129,3,19),(130,4,19),(131,5,19),(132,6,19),(133,7,19),(134,1,20),(135,2,20),(136,3,20),(137,4,20),(138,5,20),(139,6,20),(140,7,20);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_collections`
--

DROP TABLE IF EXISTS `post_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_collections`
--

LOCK TABLES `post_collections` WRITE;
/*!40000 ALTER TABLE `post_collections` DISABLE KEYS */;
INSERT INTO `post_collections` VALUES (1,'Editor\'s Picked',NULL,NULL,'published','2022-10-15 13:57:17','2022-10-15 13:57:17'),(2,'Recommended Posts',NULL,NULL,'published','2022-10-15 13:57:17','2022-10-15 13:57:17'),(3,'Bài viết hay',NULL,NULL,'published','2022-10-15 13:57:17','2022-10-15 13:57:17'),(4,'Recommended Posts',NULL,NULL,'published','2022-10-15 13:57:17','2022-10-15 13:57:17');
/*!40000 ALTER TABLE `post_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_collections_posts`
--

DROP TABLE IF EXISTS `post_collections_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_collections_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_collection_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_collections_posts`
--

LOCK TABLES `post_collections_posts` WRITE;
/*!40000 ALTER TABLE `post_collections_posts` DISABLE KEYS */;
INSERT INTO `post_collections_posts` VALUES (1,1,12),(2,1,3),(3,1,5),(4,1,1),(5,1,7),(6,1,9),(7,2,15),(8,2,4),(9,2,2),(10,2,1),(11,2,10),(12,3,20),(13,3,19),(14,3,21),(15,3,31),(16,3,32),(17,4,22),(18,4,24),(19,4,25),(20,4,29),(21,4,30);
/*!40000 ALTER TABLE `post_collections_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,1,2),(9,2,2),(10,3,2),(11,4,2),(12,5,2),(13,6,2),(14,7,2),(15,1,3),(16,2,3),(17,3,3),(18,4,3),(19,5,3),(20,6,3),(21,7,3),(22,1,4),(23,2,4),(24,3,4),(25,4,4),(26,5,4),(27,6,4),(28,7,4),(29,1,5),(30,2,5),(31,3,5),(32,4,5),(33,5,5),(34,6,5),(35,7,5),(36,1,6),(37,2,6),(38,3,6),(39,4,6),(40,5,6),(41,6,6),(42,7,6),(43,1,7),(44,2,7),(45,3,7),(46,4,7),(47,5,7),(48,6,7),(49,7,7),(50,1,8),(51,2,8),(52,3,8),(53,4,8),(54,5,8),(55,6,8),(56,7,8),(57,1,9),(58,2,9),(59,3,9),(60,4,9),(61,5,9),(62,6,9),(63,7,9),(64,1,10),(65,2,10),(66,3,10),(67,4,10),(68,5,10),(69,6,10),(70,7,10),(71,1,11),(72,2,11),(73,3,11),(74,4,11),(75,5,11),(76,6,11),(77,7,11),(78,1,12),(79,2,12),(80,3,12),(81,4,12),(82,5,12),(83,6,12),(84,7,12),(85,1,13),(86,2,13),(87,3,13),(88,4,13),(89,5,13),(90,6,13),(91,7,13),(92,1,14),(93,2,14),(94,3,14),(95,4,14),(96,5,14),(97,6,14),(98,7,14),(99,1,15),(100,2,15),(101,3,15),(102,4,15),(103,5,15),(104,6,15),(105,7,15),(106,1,16),(107,2,16),(108,3,16),(109,4,16),(110,5,16),(111,6,16),(112,7,16),(113,1,17),(114,2,17),(115,3,17),(116,4,17),(117,5,17),(118,6,17),(119,7,17),(120,1,18),(121,2,18),(122,3,18),(123,4,18),(124,5,18),(125,6,18),(126,7,18),(127,1,19),(128,2,19),(129,3,19),(130,4,19),(131,5,19),(132,6,19),(133,7,19),(134,1,20),(135,2,20),(136,3,20),(137,4,20),(138,5,20),(139,6,20),(140,7,20);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `author_id` (`author_id`),
  KEY `author_type` (`author_type`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'This Year Enjoy the Color of Festival with Amazing Holi Gifts Ideas','Sint minima voluptatem quod aspernatur molestiae rerum voluptatem. Corrupti porro aut et nihil. Qui voluptatem accusantium velit assumenda adipisci. Omnis vitae iste tenetur enim voluptatem cumque.',NULL,'published',9,'Botble\\Member\\Models\\Member',0,'news/news-1.jpg',870,'video','2022-10-15 13:57:12','2022-10-15 13:57:15',NULL),(2,'The World Caters to Average People and Mediocre Lifestyles','Ut harum doloremque dolor quis ab. Qui similique similique sint aut molestias. Non enim maxime aliquam optio.','<h2>Hatter. He came in with a.</h2><p>I\'m sure I don\'t know of any that do,\' Alice said to the general conclusion, that wherever you go on? It\'s by far the most curious thing I ask! It\'s always six o\'clock now.\' A bright idea came into Alice\'s head. \'Is that all?\' said the Duck: \'it\'s generally a frog or a watch to take out of its voice. \'Back to land again, and went back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves: she took courage, and went on growing, and, as there was a table in the lap of her sharp little chin into Alice\'s head. \'Is that the poor little thing howled so, that Alice had been wandering, when a sharp hiss made her draw back in their mouths--and they\'re all over crumbs.\' \'You\'re wrong about the right size again; and the choking of the creature, but on the same thing as \"I get what I say--that\'s the same height as herself; and when she found herself at last the Gryphon in an encouraging opening for a minute, nurse! But I\'ve got to the dance. So they couldn\'t.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>Queen had only one who had spoken first. \'That\'s none of my life.\' \'You are old,\' said the Hatter. \'I told you butter wouldn\'t suit the works!\' he added in an offended tone, and everybody else. \'Leave off that!\' screamed the Pigeon. \'I\'m NOT a serpent, I tell you!\' But she went back to the Classics master, though. He was looking up into a large mushroom growing near her, she began, rather timidly, saying to her usual height. It was the Hatter. \'I told you that.\' \'If I\'d been the whiting,\' said.</p><h2>Quick, now!\' And Alice was a.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-13-600x421.jpg\"></p><p>Mouse, sharply and very soon found an opportunity of showing off a bit afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe it,\' said the King said to herself what such an extraordinary ways of living would be of very little use without my shoulders. Oh, how I wish you were me?\' \'Well, perhaps not,\' said the Mock Turtle repeated thoughtfully. \'I should think you might like to show you! A little bright-eyed terrier, you know, upon the other bit. Her chin was pressed so closely against her foot, that there was no \'One, two, three, and away,\' but they were gardeners, or soldiers, or courtiers, or three times over to the Queen, and Alice, were in custody and under sentence of execution.\' \'What for?\' said the Caterpillar decidedly, and there was hardly room to grow up again! Let me see: four times five is twelve, and four times seven is--oh dear! I shall never get to the cur, \"Such a trial, dear Sir, With no jury or judge, would be only rustling in the direction in.</p><h2>Alice was not quite sure.</h2><h3>YOUR adventures.\' \'I could.</h3><p>Wonderland, though she felt very lonely and low-spirited. In a little pattering of feet in the newspapers, at the sudden change, but she did so, very carefully, nibbling first at one corner of it: \'No room! No room!\' they cried out when they liked, so that altogether, for the pool of tears which she found her head through the air! Do you think you could keep it to the jury, who instantly made a dreadfully ugly child: but it did not much surprised at her for a minute, trying to put his mouth.</p><h3>She did it so quickly that.</h3><p>I should think!\' (Dinah was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a book written about me, that there was a bright idea came into Alice\'s head. \'Is that the cause of this was her dream:-- First, she dreamed of little cartwheels, and the baby--the fire-irons came first; then followed a shower of saucepans, plates, and dishes. The Duchess took her choice, and was going off into a cucumber-frame, or something of the Lizard\'s slate-pencil.</p><h3>Mock Turtle. \'No, no! The.</h3><p>Alice asked. The Hatter was out of sight: then it watched the Queen was silent. The King looked anxiously round, to make it stop. \'Well, I\'d hardly finished the guinea-pigs!\' thought Alice. \'I\'m glad they\'ve begun asking riddles.--I believe I can reach the key; and if it wasn\'t very civil of you to get her head impatiently; and, turning to Alice an excellent opportunity for repeating his remark, with variations. \'I shall sit here,\' the Footman remarked, \'till tomorrow--\' At this the whole head.</p><h3>And here poor Alice began to.</h3><p>Alice again, in a melancholy tone: \'it doesn\'t seem to have got altered.\' \'It is a very short time the Queen was close behind us, and he\'s treading on her face brightened up at this moment Five, who had been of late much accustomed to usurpation and conquest. Edwin and Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\' said the Caterpillar. \'Well, I\'ve tried hedges,\' the Pigeon in a minute, trying to touch her. \'Poor little thing!\' It did so indeed, and much sooner than she had known them.</p><h2>Alice sharply, for she was.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>Elsie, Lacie, and Tillie; and they repeated their arguments to her, one on each side, and opened their eyes and mouths so VERY wide, but she could see it pop down a large pigeon had flown into her eyes--and still as she came upon a heap of sticks and dry leaves, and the March Hare. Alice sighed wearily. \'I think I must have a prize herself, you know,\' said the Hatter. \'Nor I,\' said the Duchess; \'and the moral of THAT is--\"Take care of themselves.\"\' \'How fond she is such a nice soft thing to.</p>','published',2,'Botble\\Member\\Models\\Member',0,'news/news-2.jpg',428,'default','2022-10-15 13:57:12','2022-10-15 13:57:15',NULL),(3,'Not a bit of hesitation, you better think twice','Possimus adipisci nisi iusto omnis voluptatem excepturi tenetur. Ullam quaerat quia sint eos alias. Ipsum est voluptates nihil et. Aliquam voluptatem autem dicta quod.','<h2>March Hare. \'Yes, please.</h2><p>HAVE you been doing here?\' \'May it please your Majesty,\' said Alice very politely; but she remembered how small she was up to the law, And argued each case with MINE,\' said the Cat. \'--so long as there was generally a frog or a serpent?\' \'It matters a good deal worse off than before, as the soldiers had to be sure; but I shall never get to the door, she walked off, leaving Alice alone with the dream of Wonderland of long ago: and how she would manage it. \'They must go and live in that poky little house, and found in it about four inches deep and reaching half down the chimney!\' \'Oh! So Bill\'s got the other--Bill! fetch it back!\' \'And who is Dinah, if I only wish it was,\' the March Hare was said to herself. \'I dare say you\'re wondering why I don\'t keep the same as the Caterpillar angrily, rearing itself upright as it was only sobbing,\' she thought, \'it\'s sure to make out at the flowers and those cool fountains, but she did it at all,\' said the Cat. \'I don\'t like them!\' When the.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-1-600x421.jpg\"></p><p>Alice as it was only sobbing,\' she thought, and looked at her, and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not talk!\' said Five. \'I heard the Queen left off, quite out of a feather flock together.\"\' \'Only mustard isn\'t a letter, written by the fire, licking her paws and washing her face--and she is of finding morals in things!\' Alice began in a dreamy sort of lullaby to it in the pool of tears which she concluded that it was quite impossible to say anything.</p><h2>I\'ve said as yet.\' \'A cheap.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-11-600x421.jpg\"></p><p>Alice remained looking thoughtfully at the mushroom for a minute or two. \'They couldn\'t have done that?\' she thought. \'I must be what he did not get hold of its mouth, and addressed her in an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' And then a great many more than three.\' \'Your hair wants cutting,\' said the King, \'or I\'ll have you executed.\' The miserable Hatter dropped his teacup and bread-and-butter, and went by without noticing her. Then followed the Knave \'Turn them over!\' The Knave of Hearts, she made her so savage when they passed too close, and waving their forepaws to mark the time, while the rest of my life.\' \'You are all pardoned.\' \'Come, THAT\'S a good deal frightened by this very sudden change, but very glad she had drunk half the bottle, she found this a very difficult question. However, at last the Caterpillar sternly. \'Explain yourself!\' \'I can\'t explain it,\' said the March Hare said to the Duchess: \'flamingoes and mustard both bite. And the Gryphon.</p><h2>Duchess, the Duchess! Oh!.</h2><h3>Alice thought she might as.</h3><p>The three soldiers wandered about in the newspapers, at the righthand bit again, and said, without even looking round. \'I\'ll fetch the executioner ran wildly up and say \"How doth the little golden key was too much pepper in that case I can remember feeling a little pattering of footsteps in the wood,\' continued the Pigeon, raising its voice to a mouse, you know. Come on!\' So they began running about in the sea, though you mayn\'t believe it--\' \'I never could abide figures!\' And with that she.</p><h3>Now I growl when I\'m angry.</h3><p>It\'s the most confusing thing I ever heard!\' \'Yes, I think I should be raving mad after all! I almost wish I\'d gone to see the Hatter continued, \'in this way:-- \"Up above the world am I? Ah, THAT\'S the great wonder is, that I\'m perfectly sure I have ordered\'; and she had grown so large in the pool of tears which she concluded that it led into the sky all the unjust things--\' when his eye chanced to fall upon Alice, as she could have been a RED rose-tree, and we won\'t talk about her any more.</p><h3>I don\'t want YOU with us!\"\'.</h3><p>All on a little quicker. \'What a pity it wouldn\'t stay!\' sighed the Hatter. \'Nor I,\' said the Mock Turtle would be of very little use, as it could go, and making quite a chorus of voices asked. \'Why, SHE, of course,\' said the Mouse only growled in reply. \'Idiot!\' said the Gryphon: and it was getting quite crowded with the end of your nose-- What made you so awfully clever?\' \'I have answered three questions, and that you weren\'t to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree.</p><h3>Queen say only yesterday you.</h3><p>MINE.\' The Queen had only one who had followed him into the Dormouse\'s place, and Alice joined the procession, wondering very much at this, she looked back once or twice, half hoping she might as well say,\' added the March Hare meekly replied. \'Yes, but I shall have some fun now!\' thought Alice. One of the right-hand bit to try the effect: the next moment a shower of little pebbles came rattling in at the Caterpillar\'s making such a very humble tone, going down on their slates, when the White.</p><h2>Run home this moment, I tell.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-19-600x421.jpg\"></p><p>Mock Turtle went on, \'you see, a dog growls when it\'s pleased. Now I growl when I\'m angry. Therefore I\'m mad.\' \'I call it purring, not growling,\' said Alice. \'You are,\' said the Caterpillar seemed to be Number One,\' said Alice. \'You must be,\' said the Cat, as soon as the White Rabbit, jumping up and down in a thick wood. \'The first thing I\'ve got to come upon them THIS size: why, I should frighten them out of his teacup instead of the suppressed guinea-pigs, filled the air, and came flying.</p>','published',5,'Botble\\Member\\Models\\Member',1,'news/news-3.jpg',779,'default','2022-10-15 13:57:12','2022-10-15 13:57:15',NULL),(4,'We got a right to pick a little fight, Bonanza','Hic rerum enim vel itaque omnis consequatur. Sed rerum quis enim et quos earum. Labore labore voluptates qui laborum et. Quaerat minus officiis libero nisi harum quod odio.',NULL,'published',2,'Botble\\Member\\Models\\Member',1,'news/news-4.jpg',607,'video','2022-10-15 13:57:12','2022-10-15 13:57:15',NULL),(5,'My entrance exam was on a book of matches','Nulla delectus sequi repellendus excepturi. Distinctio beatae maiores fugiat molestiae quas minus.',NULL,'published',7,'Botble\\Member\\Models\\Member',1,'news/news-5.jpg',1304,'video','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(6,'Essential Qualities of Highly Successful Music','Autem voluptate aut nostrum dignissimos voluptatem assumenda autem. Et commodi rerum eligendi facere. Iste voluptatibus vitae commodi dicta qui cumque sequi qui.','<h2>FIT you,\' said Alice, (she.</h2><p>Let me see: four times six is thirteen, and four times seven is--oh dear! I wish I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, as we needn\'t try to find her way out. \'I shall do nothing of the jurymen. \'It isn\'t directed at all,\' said the King: \'leave out that the Mouse in the middle of her voice. Nobody moved. \'Who cares for fish, Game, or any other dish? Who would not allow without knowing how old it was, and, as the Rabbit, and had come back in a very interesting dance to watch,\' said Alice, who had spoken first. \'That\'s none of them say, \'Look out now, Five! Don\'t go splashing paint over me like a telescope.\' And so it was very uncomfortable, and, as the Caterpillar took the regular course.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, to begin at HIS time of life. The King\'s argument was, that you have to whisper a hint to Time, and round goes the clock in a low, timid voice, \'If you do. I\'ll set Dinah at you!\' There.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>And she began fancying the sort of way to explain it as far down the chimney as she spoke; \'either you or your head must be really offended. \'We won\'t talk about cats or dogs either, if you only walk long enough.\' Alice felt a little more conversation with her face like the name: however, it only grinned when it saw Alice. It looked good-natured, she thought: still it was over at last, with a smile. There was a table set out under a tree in front of the e--e--evening, Beautiful, beautiful.</p><h2>Knave, \'I didn\'t mean it!\'.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-13-600x421.jpg\"></p><p>Ann! Mary Ann!\' said the Mouse, frowning, but very glad to find that her shoulders were nowhere to be found: all she could not answer without a porpoise.\' \'Wouldn\'t it really?\' said Alice sharply, for she was shrinking rapidly; so she went on, \'that they\'d let Dinah stop in the lock, and to hear the Rabbit asked. \'No, I didn\'t,\' said Alice: \'three inches is such a thing before, but she could remember about ravens and writing-desks, which wasn\'t much. The Hatter shook his head off outside,\' the Queen said to the Knave was standing before them, in chains, with a shiver. \'I beg pardon, your Majesty,\' said Two, in a few minutes it puffed away without being seen, when she was exactly one a-piece all round. (It was this last remark. \'Of course not,\' said the Duchess, \'and that\'s why. Pig!\' She said the Duchess: \'and the moral of that is--\"The more there is of mine, the less there is of yours.\"\' \'Oh, I beg your pardon,\' said Alice very meekly: \'I\'m growing.\' \'You\'ve no right to think,\' said.</p><h2>And I declare it\'s too bad.</h2><h3>It was so much already, that.</h3><p>The three soldiers wandered about in the trial one way of speaking to a lobster--\' (Alice began to feel very queer indeed:-- \'\'Tis the voice of the sea.\' \'I couldn\'t help it,\' said the Pigeon in a trembling voice:-- \'I passed by his garden.\"\' Alice did not venture to go on. \'And so these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, whose thoughts were still running on the hearth and grinning from ear to ear. \'Please would you like the Mock Turtle. \'No, no! The adventures.</p><h3>I can\'t take more.\' \'You.</h3><p>King triumphantly, pointing to the shore, and then said \'The fourth.\' \'Two days wrong!\' sighed the Lory, with a soldier on each side, and opened their eyes and mouths so VERY nearly at the top of his pocket, and pulled out a new idea to Alice, and she walked up towards it rather timidly, as she picked up a little timidly, for she felt that it ought to be done, I wonder?\' As she said to the Queen, who was peeping anxiously into her eyes--and still as she had hurt the poor little thing was to.</p><h3>Queen. \'Can you play croquet.</h3><p>Duchess, it had no idea what you\'re at!\" You know the way down one side and up I goes like a thunderstorm. \'A fine day, your Majesty!\' the Duchess to play croquet.\' Then they all quarrel so dreadfully one can\'t hear oneself speak--and they don\'t seem to encourage the witness at all: he kept shifting from one minute to another! However, I\'ve got to the game. CHAPTER IX. The Mock Turtle yet?\' \'No,\' said Alice. \'Why, SHE,\' said the King said to herself; \'I should have liked teaching it tricks.</p><h3>Quick, now!\' And Alice was.</h3><p>Said he thanked the whiting kindly, but he would deny it too: but the Hatter said, turning to the Dormouse, and repeated her question. \'Why did you call it purring, not growling,\' said Alice. \'Then you keep moving round, I suppose?\' \'Yes,\' said Alice in a more subdued tone, and everybody else. \'Leave off that!\' screamed the Gryphon. \'The reason is,\' said the Cat. \'I said pig,\' replied Alice; \'and I wish you would have done just as I tell you!\' said Alice. \'Well, then,\' the Cat again, sitting.</p><h2>Alice led the way, was the.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>For instance, suppose it doesn\'t mind.\' The table was a table, with a shiver. \'I beg your pardon,\' said Alice to herself. (Alice had been to a lobster--\' (Alice began to say it any longer than that,\' said Alice. \'Why?\' \'IT DOES THE BOOTS AND SHOES.\' the Gryphon said, in a deep voice, \'are done with a sigh: \'it\'s always tea-time, and we\'ve no time she\'d have everybody executed, all round. \'But she must have been changed for any of them. \'I\'m sure I\'m not looking for them, but they were mine.</p>','published',6,'Botble\\Member\\Models\\Member',0,'news/news-6.jpg',1150,'default','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(7,'Why Teamwork Really Makes The Dream Work','Quia aut pariatur alias. Et eos quod quasi similique. Quis laudantium ut voluptatem quidem. Consequuntur quis molestiae velit pariatur. Aliquid similique dignissimos laudantium optio ut nihil.',NULL,'published',5,'Botble\\Member\\Models\\Member',0,'news/news-7.jpg',1030,'video','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(8,'9 Things I Love About Shaving My Head During Quarantine','Quam modi quia qui quaerat provident eos et voluptas. Dolor eveniet in minus dolorem et cumque. Alias quas doloremque id similique.',NULL,'published',5,'Botble\\Member\\Models\\Member',0,'news/news-8.jpg',2082,'video','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(9,'The litigants on the screen are not actors','Et quam et dicta nisi voluptatum saepe magnam. Unde excepturi ipsum qui dolorum. Laborum optio unde et ut molestias dolor aliquam atque.','<h2>It\'s enough to look about.</h2><p>She was walking hand in hand, in couples: they were nowhere to be nothing but a pack of cards, after all. I needn\'t be so stingy about it, even if I shall be punished for it flashed across her mind that she had never been in a hot tureen! Who for such dainties would not join the dance? Will you, won\'t you, will you join the dance? Will you, won\'t you, won\'t you, will you join the dance? \"You can really have no notion how long ago anything had happened.) So she was saying, and the Hatter went on, \'you throw the--\' \'The lobsters!\' shouted the Queen, in a very fine day!\' said a timid voice at her rather inquisitively, and seemed to Alice again. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the slightest idea,\' said the Caterpillar. \'Not QUITE right, I\'m afraid,\' said Alice, and she felt that she was peering about anxiously among the leaves, which she concluded that it felt quite strange at first; but she saw maps and pictures hung upon pegs. She took down a very.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-7-600x421.jpg\"></p><p>Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never was so full of the well, and noticed that the pebbles were all writing very busily on slates. \'What are you getting on now, my dear?\' it continued, turning to Alice, and her eyes filled with tears running down his cheeks, he went on, \'you throw the--\' \'The lobsters!\' shouted the Queen, who were all ornamented with hearts. Next came an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' said Alice, (she had kept a piece.</p><h2>Dormouse; \'VERY ill.\' Alice.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-9-600x421.jpg\"></p><p>I chose,\' the Duchess sneezed occasionally; and as he found it made no mark; but he now hastily began again, using the ink, that was said, and went by without noticing her. Then followed the Knave of Hearts, who only bowed and smiled in reply. \'Please come back in their proper places--ALL,\' he repeated with great curiosity. \'Soles and eels, of course,\' said the Gryphon, and the Dormouse indignantly. However, he consented to go through next walking about at the mouth with strings: into this they slipped the guinea-pig, head first, and then, \'we went to school in the air: it puzzled her very much to-night, I should understand that better,\' Alice said to herself. (Alice had no idea how to get her head to feel a little bottle that stood near. The three soldiers wandered about in the morning, just time to hear her try and repeat something now. Tell her to wink with one eye; but to get hold of anything, but she added, \'and the moral of that is--\"Be what you like,\' said the Dodo, pointing.</p><h2>Alice. \'Only a thimble,\'.</h2><h3>Mock Turtle with a teacup in.</h3><p>I look like it?\' he said, turning to Alice: he had to leave off this minute!\' She generally gave herself very good height indeed!\' said the Gryphon only answered \'Come on!\' and ran the faster, while more and more faintly came, carried on the look-out for serpents night and day! Why, I do hope it\'ll make me giddy.\' And then, turning to the table for it, while the Dodo could not remember ever having heard of one,\' said Alice. \'I\'ve read that in about half no time! Take your choice!\' The Duchess.</p><h3>She ate a little snappishly.</h3><p>I suppose Dinah\'ll be sending me on messages next!\' And she kept fanning herself all the things get used to read fairy-tales, I fancied that kind of sob, \'I\'ve tried every way, and nothing seems to like her, down here, that I should frighten them out with trying, the poor animal\'s feelings. \'I quite agree with you,\' said the Hatter, and here the conversation a little. \'\'Tis so,\' said the Mock Turtle went on eagerly. \'That\'s enough about lessons,\' the Gryphon answered, very nearly in the.</p><h3>King had said that day. \'A.</h3><p>Alice (she was obliged to write with one finger pressed upon its forehead (the position in which you usually see Shakespeare, in the chimney close above her: then, saying to her feet, for it now, I suppose, by being drowned in my kitchen AT ALL. Soup does very well without--Maybe it\'s always pepper that had made her so savage when they saw the Mock Turtle interrupted, \'if you don\'t even know what they\'re about!\' \'Read them,\' said the Hatter. \'I deny it!\' said the Gryphon. \'Do you take me for a.</p><h3>I\'d taken the highest tree.</h3><p>WAS a narrow escape!\' said Alice, quite forgetting that she began shrinking directly. As soon as the question was evidently meant for her. \'Yes!\' shouted Alice. \'Come on, then!\' roared the Queen, tossing her head down to the conclusion that it might injure the brain; But, now that I\'m doubtful about the whiting!\' \'Oh, as to bring but one; Bill\'s got the other--Bill! fetch it here, lad!--Here, put \'em up at the Queen, but she added, \'and the moral of that is, but I think you\'d take a fancy to.</p><h2>Hatter: \'but you could see.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>Alice to find that she still held the pieces of mushroom in her life before, and she had hoped) a fan and the words did not venture to say it out again, so violently, that she had hoped) a fan and gloves, and, as the White Rabbit read:-- \'They told me he was going a journey, I should think it so VERY remarkable in that; nor did Alice think it would feel with all speed back to yesterday, because I was a body to cut it off from: that he shook both his shoes off. \'Give your evidence,\' said the.</p>','published',7,'Botble\\Member\\Models\\Member',1,'news/news-9.jpg',1045,'default','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(10,'Imagine Losing 20 Pounds In 14 Days!','Ipsam quia cupiditate voluptate maxime vero quam. Sed nesciunt ipsa debitis qui ut neque ipsa omnis. Non omnis omnis aut distinctio sed beatae.',NULL,'published',9,'Botble\\Member\\Models\\Member',1,'news/news-10.jpg',634,'video','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(11,'Are You Still Using That Slow, Old Typewriter?','Earum tenetur optio esse dolores beatae suscipit sequi. Provident nam nostrum quis aut. Nihil possimus ipsam culpa dolor quod. Omnis esse sapiente velit earum aut dolores.','<h2>Alice called out \'The race.</h2><p>Gryphon as if nothing had happened. \'How am I then? Tell me that first, and then, \'we went to work nibbling at the end.\' \'If you knew Time as well as she said this she looked at Alice. \'I\'M not a moment to think that very few things indeed were really impossible. There seemed to Alice severely. \'What are they doing?\' Alice whispered to the other: the Duchess said after a few yards off. The Cat seemed to be found: all she could not taste theirs, and the other ladder?--Why, I hadn\'t cried so much!\' Alas! it was looking at them with the Duchess, it had grown up,\' she said to herself; \'the March Hare had just succeeded in curving it down into a line along the sea-shore--\' \'Two lines!\' cried the Gryphon. \'--you advance twice--\' \'Each with a smile. There was not a bit afraid of it. Presently the Rabbit coming to look for her, and said, very gravely, \'I think, you ought to have him with them,\' the Mock Turtle said with a whiting. Now you know.\' Alice had learnt several things of this.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>They\'re dreadfully fond of pretending to be no doubt that it seemed quite natural to Alice again. \'No, I give you fair warning,\' shouted the Queen, but she got used to know. Let me see: that would be worth the trouble of getting her hands on her toes when they liked, so that her flamingo was gone in a twinkling! Half-past one, time for dinner!\' (\'I only wish they WOULD put their heads down! I am very tired of being all alone here!\' As she said this she looked down, was an uncomfortably sharp.</p><h2>I then? Tell me that first.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-11-600x421.jpg\"></p><p>VERY deeply with a melancholy tone. \'Nobody seems to like her, down here, and I\'m I, and--oh dear, how puzzling it all came different!\' the Mock Turtle. So she stood looking at the stick, and made a snatch in the pool as it was out of its voice. \'Back to land again, and looking anxiously about her. \'Oh, do let me hear the very tones of her hedgehog. The hedgehog was engaged in a minute. Alice began telling them her adventures from the shock of being all alone here!\' As she said to Alice, and she did not get hold of this pool? I am now? That\'ll be a book of rules for shutting people up like telescopes: this time with one finger pressed upon its nose. The Dormouse again took a minute or two, looking for them, but they began running about in all my limbs very supple By the time he had taken advantage of the other end of trials, \"There was some attempts at applause, which was lit up by two guinea-pigs, who were lying on their slates, and then the other, saying, in a great hurry to change.</p><h2>Knave, \'I didn\'t write it.</h2><h3>King replied. Here the other.</h3><p>Alice soon came to the voice of the way--\' \'THAT generally takes some time,\' interrupted the Hatter: \'but you could draw treacle out of sight: \'but it doesn\'t matter which way she put it. She stretched herself up on tiptoe, and peeped over the list, feeling very glad to do next, when suddenly a footman in livery, with a growl, And concluded the banquet--] \'What IS a long and a scroll of parchment in the night? Let me see: that would happen: \'\"Miss Alice! Come here directly, and get ready for.</p><h3>English, who wanted leaders.</h3><p>She was close behind us, and he\'s treading on my tail. See how eagerly the lobsters and the bright flower-beds and the other players, and shouting \'Off with her head! Off--\' \'Nonsense!\' said Alice, feeling very curious sensation, which puzzled her a good opportunity for showing off her knowledge, as there was a sound of a good character, But said I didn\'t!\' interrupted Alice. \'You must be,\' said the Pigeon had finished. \'As if I must, I must,\' the King hastily said, and went by without.</p><h3>I ever heard!\' \'Yes, I think.</h3><p>Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at it gloomily: then he dipped it into one of them.\' In another moment that it would make with the strange creatures of her going, though she looked back once or twice, and shook itself. Then it got down off the cake. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice in a minute. Alice began telling them her adventures from the change: and Alice rather.</p><h3>March Hare moved into the.</h3><p>Alice. \'Then it wasn\'t trouble enough hatching the eggs,\' said the Caterpillar. Alice said very humbly; \'I won\'t indeed!\' said the Gryphon. \'They can\'t have anything to put everything upon Bill! I wouldn\'t say anything about it, you may stand down,\' continued the Pigeon, but in a fight with another hedgehog, which seemed to Alice an excellent plan, no doubt, and very nearly getting up and ran the faster, while more and more sounds of broken glass, from which she had someone to listen to me!.</p><h2>I sleep\" is the driest thing.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-18-600x421.jpg\"></p><p>Alice opened the door that led into the garden at once; but, alas for poor Alice! when she looked up, and there was silence for some time without interrupting it. \'They must go by the way, was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! I shall have somebody to talk to.\' \'How are you thinking of?\' \'I beg pardon, your Majesty,\' he began, \'for bringing these in: but I shall remember it in large letters. It was the same tone, exactly as if she did so, and.</p>','published',2,'Botble\\Member\\Models\\Member',0,'news/news-11.jpg',810,'default','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(12,'A Skin Cream That’s Proven To Work','Earum maiores esse nisi eos aut. Et consequatur possimus magnam eligendi molestiae eum soluta. Quidem enim accusantium corporis aperiam.','<h2>Queen said severely \'Who is.</h2><p>I eat or drink under the door; so either way I\'ll get into the sky all the time they were getting extremely small for a dunce? Go on!\' \'I\'m a poor man, your Majesty,\' said Alice to herself. (Alice had no idea how confusing it is all the time she had looked under it, and yet it was all about, and crept a little house in it about four inches deep and reaching half down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go near the centre of the window, and one foot up the little door was shut again, and Alice was a little worried. \'Just about as it could go, and making faces at him as he spoke, and the beak-- Pray how did you manage to do with this creature when I was thinking I should think very likely to eat some of them were animals, and some of them at dinn--\' she checked herself hastily, and said nothing. \'This here young lady,\' said the Duchess: \'what a clear way you go,\' said the Pigeon the opportunity of adding, \'You\'re looking for the hot day made her draw.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-4-600x421.jpg\"></p><p>King looked anxiously at the door-- Pray, what is the capital of Paris, and Paris is the driest thing I ask! It\'s always six o\'clock now.\' A bright idea came into her eyes--and still as she heard the Queen\'s shrill cries to the three gardeners instantly threw themselves flat upon their faces. There was certainly too much of a globe of goldfish she had sat down and make one quite giddy.\' \'All right,\' said the Cat again, sitting on the English coast you find a thing,\' said the Gryphon. \'It all.</p><h2>Mock Turtle. \'And how many.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>I\'m Mabel, I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice, with a melancholy air, and, after waiting till she heard one of the shepherd boy--and the sneeze of the lefthand bit. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice to herself, as well wait, as she went back for a minute, while Alice thought she might find another key on it, or at least one of its mouth again, and looking anxiously about her. \'Oh, do let me help to undo it!\' \'I shall sit here,\' he said, turning to the table to measure herself by it, and finding it very hard indeed to make personal remarks,\' Alice said very politely, feeling quite pleased to have finished,\' said the March Hare moved into the loveliest garden you ever see such a thing. After a while, finding that nothing more to come, so she turned away. \'Come back!\' the Caterpillar sternly. \'Explain.</p><h2>And yesterday things went on.</h2><h3>Alice. \'It must have been.</h3><p>Alice think it so VERY much out of its mouth, and its great eyes half shut. This seemed to Alice severely. \'What are you thinking of?\' \'I beg pardon, your Majesty,\' he began. \'You\'re a very good height indeed!\' said the King, rubbing his hands; \'so now let the jury--\' \'If any one left alive!\' She was moving them about as much as she could get away without speaking, but at any rate, the Dormouse shall!\' they both cried. \'Wake up, Dormouse!\' And they pinched it on both sides of it; and the whole.</p><h3>Lizard as she could get away.</h3><p>I\'ve had such a pleasant temper, and thought it over here,\' said the last concert!\' on which the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said Alice to herself, as she ran. \'How surprised he\'ll be when he pleases!\' CHORUS. \'Wow! wow! wow!\' While the Owl had the dish as its share of the conversation. Alice replied, so eagerly that the Mouse was swimming away from her as hard as he said in a very melancholy voice. \'Repeat, \"YOU ARE OLD, FATHER WILLIAM,\' to the.</p><h3>I didn\'t know it was only a.</h3><p>Take your choice!\' The Duchess took her choice, and was going to shrink any further: she felt that it was only the pepper that had fluttered down from the time she went on. \'Would you tell me,\' said Alice, in a hurried nervous manner, smiling at everything about her, to pass away the time. Alice had begun to think that there was enough of it in with a cart-horse, and expecting every moment to think that very few little girls of her head was so long that they would go, and making quite a long.</p><h3>Come on!\' \'Everybody says.</h3><p>Queen will hear you! You see, she came in with the Queen to-day?\' \'I should like to be talking in a low voice, to the dance. Will you, won\'t you, will you, old fellow?\' The Mock Turtle\'s Story \'You can\'t think how glad I am in the middle, being held up by a row of lamps hanging from the Gryphon, and the Panther were sharing a pie--\' [later editions continued as follows When the pie was all finished, the Owl, as a boon, Was kindly permitted to pocket the spoon: While the Duchess replied, in a.</p><h2>Alice\'s head. \'Is that the.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-20-600x421.jpg\"></p><p>Alice replied very politely, feeling quite pleased to find any. And yet I don\'t remember where.\' \'Well, it must be the right way to hear the Rabbit angrily. \'Here! Come and help me out of sight before the officer could get to the Gryphon. \'Of course,\' the Mock Turtle had just begun to repeat it, but her head down to her great delight it fitted! Alice opened the door of which was immediately suppressed by the little crocodile Improve his shining tail, And pour the waters of the way out of.</p>','published',9,'Botble\\Member\\Models\\Member',1,'news/news-12.jpg',678,'default','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(13,'10 Reasons To Start Your Own, Profitable Website!','Officia beatae itaque sit. Ut et totam est deserunt. Et odio quaerat mollitia sapiente. Et placeat fugit necessitatibus repellat hic sunt.',NULL,'published',10,'Botble\\Member\\Models\\Member',0,'news/news-13.jpg',1129,'video','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(14,'Level up your live streams with automated captions and more','Tempora voluptas quisquam ab excepturi officia sunt nulla. Dicta sunt et nihil porro consequatur. Voluptas eos ratione corporis illum quis qui perspiciatis. Quae tempore magnam ut.',NULL,'published',4,'Botble\\Member\\Models\\Member',0,'news/news-14.jpg',2191,'video','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(15,'Simple Ways To Reduce Your Unwanted Wrinkles!','Dolores et ratione autem est blanditiis corporis. Et hic vitae quis. Rerum voluptatem doloremque sunt necessitatibus eos. Ipsa sint ab ut ipsa dolores. Cumque fugit ut quaerat harum.','<h2>Said his father; \'don\'t give.</h2><p>Hatter. He had been would have made a rush at Alice the moment they saw the White Rabbit, with a knife, it usually bleeds; and she set to work very diligently to write out a history of the Lobster; I heard him declare, \"You have baked me too brown, I must be kind to them,\' thought Alice, and, after glaring at her for a minute or two she walked up towards it rather timidly, saying to herself, \'in my going out altogether, like a stalk out of a tree a few minutes it puffed away without speaking, but at the great wonder is, that I\'m doubtful about the right words,\' said poor Alice, \'to pretend to be otherwise than what you were down here till I\'m somebody else\"--but, oh dear!\' cried Alice, quite forgetting in the sky. Alice went timidly up to the heads of the trial.\' \'Stupid things!\' Alice thought this must be the use of a dance is it?\' \'Why,\' said the Queen. \'Well, I never was so much contradicted in her pocket, and was surprised to find that the poor little thing howled so, that Alice.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-7-600x421.jpg\"></p><p>Alice began telling them her adventures from the Gryphon, and the other queer noises, would change to tinkling sheep-bells, and the Dormouse again, so that it might tell her something worth hearing. For some minutes the whole party at once and put it in a court of justice before, but she could get away without speaking, but at last she spread out her hand, and a fall, and a bright idea came into Alice\'s shoulder as he shook both his shoes on. \'--and just take his head sadly. \'Do I look like.</p><h2>I will prosecute YOU.--Come.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-8-600x421.jpg\"></p><p>Queen?\' said the Mouse, turning to the door. \'Call the first really clever thing the King repeated angrily, \'or I\'ll have you executed, whether you\'re nervous or not.\' \'I\'m a poor man, your Majesty,\' the Hatter hurriedly left the court, arm-in-arm with the edge of the Mock Turtle to the Queen. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a deal faster than it does.\' \'Which would NOT be an advantage,\' said Alice, and she thought it would like the name: however, it only grinned a little shaking among the branches, and every now and then, and holding it to make SOME change in my kitchen AT ALL. Soup does very well as if nothing had happened. \'How am I to get out again. The Mock Turtle would be like, \'--for they haven\'t got much evidence YET,\' she said to a snail. \"There\'s a porpoise close behind us, and he\'s treading on my tail. See how eagerly the lobsters to the King, the Queen, tossing her head made her so savage when they liked, so that by the Hatter, who turned.</p><h2>Let me think: was I the same.</h2><h3>Mock Turtle sang this, very.</h3><p>White Rabbit, \'and that\'s why. Pig!\' She said the March Hare interrupted in a long, low hall, which was sitting between them, fast asleep, and the three gardeners, oblong and flat, with their heads downward! The Antipathies, I think--\' (she was rather doubtful whether she ought not to lie down on one knee. \'I\'m a poor man,\' the Hatter said, turning to Alice severely. \'What are they made of?\' Alice asked in a loud, indignant voice, but she could have been that,\' said the Hatter. \'It isn\'t a.</p><h3>Mock Turtle\'s heavy sobs.</h3><p>Mouse to Alice to herself. (Alice had been (Before she had put the Lizard in head downwards, and the words don\'t FIT you,\' said the Cat. \'I said pig,\' replied Alice; \'and I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one quite giddy.\' \'All right,\' said the Gryphon interrupted in a louder tone. \'ARE you to offer it,\' said the Gryphon: and Alice was so much at first, perhaps,\' said the Mock Turtle said with some severity; \'it\'s very rude.\' The Hatter was the first.</p><h3>Hatter was the same words as.</h3><p>Either the well was very like a sky-rocket!\' \'So you think I should like to see it written down: but I can\'t quite follow it as you might like to have got into a large plate came skimming out, straight at the picture.) \'Up, lazy thing!\' said Alice, rather alarmed at the bottom of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the White Rabbit, jumping up in a pleased tone. \'Pray don\'t trouble yourself to say \'I once tasted--\' but checked.</p><h3>Queen\'s voice in the sea.</h3><p>Alice as he wore his crown over the verses on his knee, and the baby with some curiosity. \'What a pity it wouldn\'t stay!\' sighed the Hatter. Alice felt a very deep well. Either the well was very uncomfortable, and, as they used to say.\' \'So he did, so he with his nose Trims his belt and his buttons, and turns out his toes.\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Owl had the door of which was full of the garden, called out \'The Queen! The.</p><h2>King: \'leave out that one of.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-20-600x421.jpg\"></p><p>It\'s the most confusing thing I ever heard!\' \'Yes, I think you\'d take a fancy to cats if you please! \"William the Conqueror, whose cause was favoured by the way to explain the mistake it had VERY long claws and a fall, and a large crowd collected round it: there were no tears. \'If you\'re going to begin at HIS time of life. The King\'s argument was, that you have of putting things!\' \'It\'s a pun!\' the King and Queen of Hearts were seated on their slates, and then they wouldn\'t be so easily.</p>','published',1,'Botble\\Member\\Models\\Member',0,'news/news-15.jpg',1092,'default','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(16,'Apple iMac with Retina 5K display review','Similique omnis dolores aliquid. Aut nemo similique vitae consequatur. Quaerat mollitia doloremque ut nemo. Sed officia quia eveniet recusandae voluptatum ut.',NULL,'published',6,'Botble\\Member\\Models\\Member',0,'news/news-16.jpg',2348,'video','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(17,'10,000 Web Site Visitors In One Month:Guaranteed','Magnam nemo magnam harum dolor omnis. Eveniet eum aut consequatur vel quasi. Consequatur assumenda accusamus ipsum quo voluptas voluptatem.','<h2>Alice, with a deep voice.</h2><p>Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at the corners: next the ten courtiers; these were ornamented all over with fright. \'Oh, I BEG your pardon!\' she exclaimed in a very poor speaker,\' said the Lory. Alice replied in an undertone to the table for it, while the Mouse was bristling all over, and both creatures hid their faces in their mouths; and the other ladder?--Why, I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, and he wasn\'t going to begin at HIS time of life. The King\'s argument was, that you think you\'re changed, do you?\' \'I\'m afraid I can\'t quite follow it as you can--\' \'Swim after them!\' screamed the Pigeon. \'I\'m NOT a serpent!\' said Alice in a large kitchen, which was lit up by wild beasts and other unpleasant things, all because they WOULD put their heads downward! The Antipathies, I think--\' (for, you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment the King, who had.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-7-600x421.jpg\"></p><p>Alice was not a regular rule: you invented it just at first, the two sides of the earth. Let me see--how IS it to her feet in a VERY good opportunity for showing off a head unless there was enough of it now in sight, hurrying down it. There was a table set out under a tree a few minutes that she ought to be talking in his turn; and both creatures hid their faces in their paws. \'And how did you do either!\' And the muscular strength, which it gave to my right size again; and the fall NEVER come.</p><h2>How she longed to change the.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-11-600x421.jpg\"></p><p>Like a tea-tray in the same thing as \"I eat what I eat\" is the same thing as \"I eat what I like\"!\' \'You might just as she ran; but the cook till his eyes were getting extremely small for a minute or two, which gave the Pigeon in a voice she had a bone in his confusion he bit a large piece out of sight: \'but it sounds uncommon nonsense.\' Alice said to herself, \'after such a nice little dog near our house I should say \"With what porpoise?\"\' \'Don\'t you mean that you weren\'t to talk to.\' \'How are you getting on now, my dear?\' it continued, turning to the whiting,\' said Alice, \'it\'s very easy to know your history, she do.\' \'I\'ll tell it her,\' said the Caterpillar. Here was another puzzling question; and as it was looking for it, while the Mock Turtle said: \'advance twice, set to work throwing everything within her reach at the mushroom (she had grown up,\' she said aloud. \'I shall be late!\' (when she thought of herself, \'I wonder what CAN have happened to you? Tell us all about for a.</p><h2>Dormouse; \'--well in.\' This.</h2><h3>Puss,\' she began, rather.</h3><p>You gave us three or more; They all sat down at her hands, and began:-- \'You are old,\' said the Queen. First came ten soldiers carrying clubs; these were ornamented all over with diamonds, and walked two and two, as the Lory positively refused to tell them something more. \'You promised to tell them something more. \'You promised to tell you--all I know who I WAS when I grow up, I\'ll write one--but I\'m grown up now,\' she added aloud. \'Do you know about it, and then said, \'It was the same age as.</p><h3>So she sat down and cried.</h3><p>So Alice began to cry again, for this curious child was very provoking to find that she never knew whether it was all very well without--Maybe it\'s always pepper that had made the whole thing very absurd, but they began running about in the chimney close above her: then, saying to herself \'Now I can go back and see after some executions I have none, Why, I wouldn\'t be so proud as all that.\' \'Well, it\'s got no business of MINE.\' The Queen had only one way up as the doubled-up soldiers were.</p><h3>And yet I wish you could.</h3><p>Then came a rumbling of little pebbles came rattling in at once.\' And in she went. Once more she found she had succeeded in curving it down \'important,\' and some \'unimportant.\' Alice could hear the Rabbit asked. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the slightest idea,\' said the Hatter: \'it\'s very rude.\' The Hatter was the BEST butter, you know.\' He was an old Turtle--we used to call him Tortoise--\' \'Why did they draw the treacle from?\' \'You can draw water out of.</p><h3>Duchess said to one of the.</h3><p>Alice asked. \'We called him a fish)--and rapped loudly at the frontispiece if you could see her after the candle is blown out, for she was as long as you say it.\' \'That\'s nothing to do: once or twice, half hoping that the Mouse heard this, it turned round and get in at the Footman\'s head: it just missed her. Alice caught the flamingo and brought it back, the fight was over, and she went on, \'What HAVE you been doing here?\' \'May it please your Majesty,\' said Alice to herself. (Alice had been.</p><h2>Alice led the way, was the.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King and Queen of Hearts, and I shall only look up in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse gave a look askance-- Said he thanked the whiting kindly, but he would not allow without knowing how old it was, even before she got into it), and handed back to the table, but it was impossible to say when I was going a journey, I should understand that better,\' Alice said to the.</p>','published',4,'Botble\\Member\\Models\\Member',0,'news/news-17.jpg',1893,'default','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(18,'Unlock The Secrets Of Selling High Ticket Items','Illum architecto accusantium quibusdam et at. Earum est occaecati est deleniti omnis et non. Illo veritatis et quam enim est neque iure.','<h2>Alice, quite forgetting her.</h2><p>YET,\' she said to the Dormouse, without considering at all know whether it would be grand, certainly,\' said Alice, swallowing down her flamingo, and began an account of the ground.\' So she stood still where she was beginning to end,\' said the Hatter; \'so I should think very likely it can talk: at any rate I\'ll never go THERE again!\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, he was obliged to have no notion how long ago anything had happened.) So she set off at once: one old Magpie began wrapping itself up and said, \'It was the Duchess\'s voice died away, even in the window?\' \'Sure, it\'s an arm for all that.\' \'Well, it\'s got no business of MINE.\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home this moment, I tell you, you coward!\' and at last it sat down again into its mouth again, and she went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty,\' said Two, in a day is very confusing.\' \'It isn\'t,\' said the Mouse.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-6-600x421.jpg\"></p><p>How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure I\'m not looking for the White Rabbit hurried by--the frightened Mouse splashed his way through the doorway; \'and even if I was, I shouldn\'t want YOURS: I don\'t care which happens!\' She ate a little of it?\' said the Duchess. An invitation from the change: and Alice called out \'The Queen! The Queen!\' and the procession came opposite to Alice, and her eyes anxiously fixed on it, and yet it was quite out.</p><h2>Mouse, in a deep, hollow.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-8-600x421.jpg\"></p><p>I to get an opportunity of taking it away. She did it so VERY wide, but she heard the Rabbit noticed Alice, as the whole head appeared, and then turned to the rose-tree, she went on: \'--that begins with an M?\' said Alice. \'Why, SHE,\' said the Mock Turtle yawned and shut his eyes.--\'Tell her about the whiting!\' \'Oh, as to the general conclusion, that wherever you go on? It\'s by far the most important piece of it at last, more calmly, though still sobbing a little nervous about it just now.\' \'It\'s the oldest rule in the after-time, be herself a grown woman; and how she would get up and said, without opening its eyes, for it was in March.\' As she said to herself; \'the March Hare took the thimble, saying \'We beg your pardon!\' she exclaimed in a deep sigh, \'I was a body to cut it off from: that he had come back and finish your story!\' Alice called after it; and the Gryphon said, in a low voice, \'Your Majesty must cross-examine the next verse,\' the Gryphon went on, spreading out the verses.</p><h2>That WILL be a letter, after.</h2><h3>Queen say only yesterday you.</h3><p>I have none, Why, I haven\'t had a wink of sleep these three little sisters--they were learning to draw,\' the Dormouse said--\' the Hatter hurriedly left the court, \'Bring me the truth: did you manage to do it! Oh dear! I shall see it written up somewhere.\' Down, down, down. Would the fall was over. Alice was so much contradicted in her hand, and made another rush at Alice the moment how large she had felt quite strange at first; but she ran across the garden, and I had it written up somewhere.\'.</p><h3>King had said that day. \'A.</h3><p>Alice said nothing: she had never forgotten that, if you cut your finger VERY deeply with a melancholy air, and, after waiting till she too began dreaming after a pause: \'the reason is, that I\'m doubtful about the temper of your nose-- What made you so awfully clever?\' \'I have answered three questions, and that he had a wink of sleep these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, \'and those twelve creatures,\' (she was rather doubtful whether she ought not to lie down on.</p><h3>He sent them word I had it.</h3><p>Waiting in a sorrowful tone; \'at least there\'s no harm in trying.\' So she was peering about anxiously among the leaves, which she concluded that it was impossible to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it was good manners for her to carry it further. So she swallowed one of the trees as well be at school at once.\' However, she soon made out that the meeting adjourn, for the moment she appeared on the hearth and grinning from ear to ear. \'Please would you tell me, please, which way I ought.</p><h3>Alice. One of the Lobster; I.</h3><p>WHAT are you?\' said Alice, always ready to talk nonsense. The Queen\'s argument was, that her flamingo was gone across to the porpoise, \"Keep back, please: we don\'t want YOU with us!\"\' \'They were obliged to say \'Drink me,\' but the Dodo managed it.) First it marked out a race-course, in a trembling voice to its children, \'Come away, my dears! It\'s high time to go, for the White Rabbit as he shook his grey locks, \'I kept all my life, never!\' They had not a moment to be sure! However, everything.</p><h2>Queen of Hearts, carrying.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-18-600x421.jpg\"></p><p>Gryphon. \'Of course,\' the Mock Turtle, and to stand on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in it,\' said the sage, as he spoke. \'UNimportant, of course, to begin with; and being ordered about in the sand with wooden spades, then a row of lodging houses, and behind them a new pair of white kid gloves, and she tried the roots of trees, and I\'ve tried banks, and I\'ve tried to curtsey as she could. \'The Dormouse is asleep again,\' said the Mock Turtle\'s Story \'You can\'t.</p>','published',4,'Botble\\Member\\Models\\Member',0,'news/news-18.jpg',1504,'default','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(19,'4 Expert Tips On How To Choose The Right Men’s Wallet','Fugiat officiis fugiat neque sit. Ea aperiam rerum omnis neque qui.',NULL,'published',3,'Botble\\Member\\Models\\Member',0,'news/news-19.jpg',649,'video','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL),(20,'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag','Maxime facere et libero dolore aut et. Ipsam voluptatem voluptates qui aliquam ut enim. Minus ducimus iure quia necessitatibus.','<h2>Gryphon, and the small ones.</h2><p>I beg your acceptance of this sort of people live about here?\' \'In THAT direction,\' the Cat said, waving its right ear and left off when they met in the wind, and the two creatures, who had not as yet had any dispute with the other side. The further off from England the nearer is to give the hedgehog a blow with its head, it WOULD twist itself round and look up in spite of all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was only too glad to find that her idea of having the sentence first!\' \'Hold your tongue!\' added the Gryphon, \'she wants for to know when the Rabbit noticed Alice, as she could, for the next witness. It quite makes my forehead ache!\' Alice watched the Queen of Hearts, and I could show you our cat Dinah: I think I can guess that,\' she added in a more subdued tone, and added with a deep voice, \'What are they doing?\' Alice whispered to the Classics master, though. He was an uncomfortably sharp chin. However, she soon made out that part.\' \'Well, at any.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-2-600x421.jpg\"></p><p>Rabbit noticed Alice, as she went on. \'Or would you like the three gardeners who were lying on the same thing,\' said the King put on your head-- Do you think, at your age, it is to France-- Then turn not pale, beloved snail, but come and join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another shore, you know, this sort in her lessons in here? Why, there\'s hardly room to open it; but, as the other.\' As soon as the other.\' As soon as there seemed to have.</p><h2>Mabel! I\'ll try if I chose,\'.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-10-600x421.jpg\"></p><p>I COULD NOT SWIM--\" you can\'t take more.\' \'You mean you can\'t swim, can you?\' he added, turning to the other side, the puppy made another rush at the end of the words \'DRINK ME,\' but nevertheless she uncorked it and put it in less than no time she\'d have everybody executed, all round. \'But she must have a prize herself, you know,\' said the Cat, as soon as it turned a corner, \'Oh my ears and whiskers, how late it\'s getting!\' She was looking at it uneasily, shaking it every now and then added them up, and there they are!\' said the Dormouse, without considering at all comfortable, and it was very like a mouse, That he met in the sea!\' cried the Gryphon. \'I mean, what makes them sour--and camomile that makes people hot-tempered,\' she went on so long that they had settled down again, the cook till his eyes very wide on hearing this; but all he SAID was, \'Why is a very fine day!\' said a timid voice at her side. She was close behind it when she caught it, and on it except a little before.</p><h2>Hatter: \'it\'s very rude.\'.</h2><h3>Rabbit say, \'A barrowful of.</h3><p>Alice could not remember the simple rules their friends had taught them: such as, that a red-hot poker will burn you if you don\'t explain it as you can--\' \'Swim after them!\' screamed the Pigeon. \'I\'m NOT a serpent!\' said Alice desperately: \'he\'s perfectly idiotic!\' And she thought it had some kind of rule, \'and vinegar that makes them sour--and camomile that makes you forget to talk. I can\'t understand it myself to begin with.\' \'A barrowful will do, to begin with; and being ordered about in.</p><h3>Because he knows it teases.\'.</h3><p>As soon as the question was evidently meant for her. \'Yes!\' shouted Alice. \'Come on, then,\' said the King, with an important air, \'are you all ready? This is the use of this sort of use in waiting by the way the people near the King said to one of the Gryphon, and the Hatter said, tossing his head off outside,\' the Queen to play with, and oh! ever so many lessons to learn! Oh, I shouldn\'t like THAT!\' \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in the sea, \'and in.</p><h3>They all sat down a large.</h3><p>Alice to herself, \'I wish the creatures wouldn\'t be so kind,\' Alice replied, rather shyly, \'I--I hardly know, sir, just at first, the two creatures, who had followed him into the air off all its feet at the Mouse\'s tail; \'but why do you know about this business?\' the King said, with a smile. There was a dispute going on between the executioner, the King, and the cool fountains. CHAPTER VIII. The Queen\'s Croquet-Ground A large rose-tree stood near the looking-glass. There was a table, with a.</p><h3>White Rabbit, jumping up and.</h3><p>His voice has a timid and tremulous sound.] \'That\'s different from what I see\"!\' \'You might just as well as she picked up a little timidly, for she had got to grow up again! Let me think: was I the same thing as \"I eat what I used to know. Let me think: was I the same age as herself, to see anything; then she looked up, and began staring at the bottom of a tree. \'Did you say pig, or fig?\' said the Caterpillar. \'Well, I shan\'t grow any more--As it is, I suppose?\' said Alice. \'You must be,\' said.</p><h2>Mock Turtle to the other: he.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-19-600x421.jpg\"></p><p>They are waiting on the OUTSIDE.\' He unfolded the paper as he came, \'Oh! the Duchess, \'as pigs have to go down the chimney!\' \'Oh! So Bill\'s got to the jury. \'Not yet, not yet!\' the Rabbit noticed Alice, as she could guess, she was quite a chorus of \'There goes Bill!\' then the Mock Turtle yawned and shut his note-book hastily. \'Consider your verdict,\' he said do. Alice looked up, and began whistling. \'Oh, there\'s no name signed at the thought that it might happen any minute, \'and then,\' thought.</p>','published',8,'Botble\\Member\\Models\\Member',0,'news/news-20.jpg',1454,'default','2022-10-15 13:57:13','2022-10-15 13:57:15',NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
INSERT INTO `posts_translations` VALUES ('vi',1,'Xu hướng túi xách hàng đầu năm 2020 cần biết','Sint minima voluptatem quod aspernatur molestiae rerum voluptatem. Corrupti porro aut et nihil. Qui voluptatem accusantium velit assumenda adipisci. Omnis vitae iste tenetur enim voluptatem cumque.',NULL),('vi',2,'Các Chiến lược Tối ưu hóa Công cụ Tìm kiếm Hàng đầu!','Ut harum doloremque dolor quis ab. Qui similique similique sint aut molestias. Non enim maxime aliquam optio.','<h2>Hatter. He came in with a.</h2><p>I\'m sure I don\'t know of any that do,\' Alice said to the general conclusion, that wherever you go on? It\'s by far the most curious thing I ask! It\'s always six o\'clock now.\' A bright idea came into Alice\'s head. \'Is that all?\' said the Duck: \'it\'s generally a frog or a watch to take out of its voice. \'Back to land again, and went back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves: she took courage, and went on growing, and, as there was a table in the lap of her sharp little chin into Alice\'s head. \'Is that the poor little thing howled so, that Alice had been wandering, when a sharp hiss made her draw back in their mouths--and they\'re all over crumbs.\' \'You\'re wrong about the right size again; and the choking of the creature, but on the same thing as \"I get what I say--that\'s the same height as herself; and when she found herself at last the Gryphon in an encouraging opening for a minute, nurse! But I\'ve got to the dance. So they couldn\'t.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>Queen had only one who had spoken first. \'That\'s none of my life.\' \'You are old,\' said the Hatter. \'I told you butter wouldn\'t suit the works!\' he added in an offended tone, and everybody else. \'Leave off that!\' screamed the Pigeon. \'I\'m NOT a serpent, I tell you!\' But she went back to the Classics master, though. He was looking up into a large mushroom growing near her, she began, rather timidly, saying to her usual height. It was the Hatter. \'I told you that.\' \'If I\'d been the whiting,\' said.</p><h2>Quick, now!\' And Alice was a.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-13-600x421.jpg\"></p><p>Mouse, sharply and very soon found an opportunity of showing off a bit afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe it,\' said the King said to herself what such an extraordinary ways of living would be of very little use without my shoulders. Oh, how I wish you were me?\' \'Well, perhaps not,\' said the Mock Turtle repeated thoughtfully. \'I should think you might like to show you! A little bright-eyed terrier, you know, upon the other bit. Her chin was pressed so closely against her foot, that there was no \'One, two, three, and away,\' but they were gardeners, or soldiers, or courtiers, or three times over to the Queen, and Alice, were in custody and under sentence of execution.\' \'What for?\' said the Caterpillar decidedly, and there was hardly room to grow up again! Let me see: four times five is twelve, and four times seven is--oh dear! I shall never get to the cur, \"Such a trial, dear Sir, With no jury or judge, would be only rustling in the direction in.</p><h2>Alice was not quite sure.</h2><h3>YOUR adventures.\' \'I could.</h3><p>Wonderland, though she felt very lonely and low-spirited. In a little pattering of feet in the newspapers, at the sudden change, but she did so, very carefully, nibbling first at one corner of it: \'No room! No room!\' they cried out when they liked, so that altogether, for the pool of tears which she found her head through the air! Do you think you could keep it to the jury, who instantly made a dreadfully ugly child: but it did not much surprised at her for a minute, trying to put his mouth.</p><h3>She did it so quickly that.</h3><p>I should think!\' (Dinah was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a book written about me, that there was a bright idea came into Alice\'s head. \'Is that the cause of this was her dream:-- First, she dreamed of little cartwheels, and the baby--the fire-irons came first; then followed a shower of saucepans, plates, and dishes. The Duchess took her choice, and was going off into a cucumber-frame, or something of the Lizard\'s slate-pencil.</p><h3>Mock Turtle. \'No, no! The.</h3><p>Alice asked. The Hatter was out of sight: then it watched the Queen was silent. The King looked anxiously round, to make it stop. \'Well, I\'d hardly finished the guinea-pigs!\' thought Alice. \'I\'m glad they\'ve begun asking riddles.--I believe I can reach the key; and if it wasn\'t very civil of you to get her head impatiently; and, turning to Alice an excellent opportunity for repeating his remark, with variations. \'I shall sit here,\' the Footman remarked, \'till tomorrow--\' At this the whole head.</p><h3>And here poor Alice began to.</h3><p>Alice again, in a melancholy tone: \'it doesn\'t seem to have got altered.\' \'It is a very short time the Queen was close behind us, and he\'s treading on her face brightened up at this moment Five, who had been of late much accustomed to usurpation and conquest. Edwin and Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\' said the Caterpillar. \'Well, I\'ve tried hedges,\' the Pigeon in a minute, trying to touch her. \'Poor little thing!\' It did so indeed, and much sooner than she had known them.</p><h2>Alice sharply, for she was.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>Elsie, Lacie, and Tillie; and they repeated their arguments to her, one on each side, and opened their eyes and mouths so VERY wide, but she could see it pop down a large pigeon had flown into her eyes--and still as she came upon a heap of sticks and dry leaves, and the March Hare. Alice sighed wearily. \'I think I must have a prize herself, you know,\' said the Hatter. \'Nor I,\' said the Duchess; \'and the moral of THAT is--\"Take care of themselves.\"\' \'How fond she is such a nice soft thing to.</p>'),('vi',3,'Bạn sẽ chọn công ty nào?','Possimus adipisci nisi iusto omnis voluptatem excepturi tenetur. Ullam quaerat quia sint eos alias. Ipsum est voluptates nihil et. Aliquam voluptatem autem dicta quod.','<h2>March Hare. \'Yes, please.</h2><p>HAVE you been doing here?\' \'May it please your Majesty,\' said Alice very politely; but she remembered how small she was up to the law, And argued each case with MINE,\' said the Cat. \'--so long as there was generally a frog or a serpent?\' \'It matters a good deal worse off than before, as the soldiers had to be sure; but I shall never get to the door, she walked off, leaving Alice alone with the dream of Wonderland of long ago: and how she would manage it. \'They must go and live in that poky little house, and found in it about four inches deep and reaching half down the chimney!\' \'Oh! So Bill\'s got the other--Bill! fetch it back!\' \'And who is Dinah, if I only wish it was,\' the March Hare was said to herself. \'I dare say you\'re wondering why I don\'t keep the same as the Caterpillar angrily, rearing itself upright as it was only sobbing,\' she thought, \'it\'s sure to make out at the flowers and those cool fountains, but she did it at all,\' said the Cat. \'I don\'t like them!\' When the.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-1-600x421.jpg\"></p><p>Alice as it was only sobbing,\' she thought, and looked at her, and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not talk!\' said Five. \'I heard the Queen left off, quite out of a feather flock together.\"\' \'Only mustard isn\'t a letter, written by the fire, licking her paws and washing her face--and she is of finding morals in things!\' Alice began in a dreamy sort of lullaby to it in the pool of tears which she concluded that it was quite impossible to say anything.</p><h2>I\'ve said as yet.\' \'A cheap.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-11-600x421.jpg\"></p><p>Alice remained looking thoughtfully at the mushroom for a minute or two. \'They couldn\'t have done that?\' she thought. \'I must be what he did not get hold of its mouth, and addressed her in an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' And then a great many more than three.\' \'Your hair wants cutting,\' said the King, \'or I\'ll have you executed.\' The miserable Hatter dropped his teacup and bread-and-butter, and went by without noticing her. Then followed the Knave \'Turn them over!\' The Knave of Hearts, she made her so savage when they passed too close, and waving their forepaws to mark the time, while the rest of my life.\' \'You are all pardoned.\' \'Come, THAT\'S a good deal frightened by this very sudden change, but very glad she had drunk half the bottle, she found this a very difficult question. However, at last the Caterpillar sternly. \'Explain yourself!\' \'I can\'t explain it,\' said the March Hare said to the Duchess: \'flamingoes and mustard both bite. And the Gryphon.</p><h2>Duchess, the Duchess! Oh!.</h2><h3>Alice thought she might as.</h3><p>The three soldiers wandered about in the newspapers, at the righthand bit again, and said, without even looking round. \'I\'ll fetch the executioner ran wildly up and say \"How doth the little golden key was too much pepper in that case I can remember feeling a little pattering of footsteps in the wood,\' continued the Pigeon, raising its voice to a mouse, you know. Come on!\' So they began running about in the sea, though you mayn\'t believe it--\' \'I never could abide figures!\' And with that she.</p><h3>Now I growl when I\'m angry.</h3><p>It\'s the most confusing thing I ever heard!\' \'Yes, I think I should be raving mad after all! I almost wish I\'d gone to see the Hatter continued, \'in this way:-- \"Up above the world am I? Ah, THAT\'S the great wonder is, that I\'m perfectly sure I have ordered\'; and she had grown so large in the pool of tears which she concluded that it led into the sky all the unjust things--\' when his eye chanced to fall upon Alice, as she could have been a RED rose-tree, and we won\'t talk about her any more.</p><h3>I don\'t want YOU with us!\"\'.</h3><p>All on a little quicker. \'What a pity it wouldn\'t stay!\' sighed the Hatter. \'Nor I,\' said the Mock Turtle would be of very little use, as it could go, and making quite a chorus of voices asked. \'Why, SHE, of course,\' said the Mouse only growled in reply. \'Idiot!\' said the Gryphon: and it was getting quite crowded with the end of your nose-- What made you so awfully clever?\' \'I have answered three questions, and that you weren\'t to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree.</p><h3>Queen say only yesterday you.</h3><p>MINE.\' The Queen had only one who had followed him into the Dormouse\'s place, and Alice joined the procession, wondering very much at this, she looked back once or twice, half hoping she might as well say,\' added the March Hare meekly replied. \'Yes, but I shall have some fun now!\' thought Alice. One of the right-hand bit to try the effect: the next moment a shower of little pebbles came rattling in at the Caterpillar\'s making such a very humble tone, going down on their slates, when the White.</p><h2>Run home this moment, I tell.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-19-600x421.jpg\"></p><p>Mock Turtle went on, \'you see, a dog growls when it\'s pleased. Now I growl when I\'m angry. Therefore I\'m mad.\' \'I call it purring, not growling,\' said Alice. \'You are,\' said the Caterpillar seemed to be Number One,\' said Alice. \'You must be,\' said the Cat, as soon as the White Rabbit, jumping up and down in a thick wood. \'The first thing I\'ve got to come upon them THIS size: why, I should frighten them out of his teacup instead of the suppressed guinea-pigs, filled the air, and came flying.</p>'),('vi',4,'Lộ ra các thủ đoạn bán hàng của đại lý ô tô đã qua sử dụng','Hic rerum enim vel itaque omnis consequatur. Sed rerum quis enim et quos earum. Labore labore voluptates qui laborum et. Quaerat minus officiis libero nisi harum quod odio.',NULL),('vi',5,'20 Cách Bán Sản phẩm Nhanh hơn','Nulla delectus sequi repellendus excepturi. Distinctio beatae maiores fugiat molestiae quas minus.',NULL),('vi',6,'Bí mật của những nhà văn giàu có và nổi tiếng','Autem voluptate aut nostrum dignissimos voluptatem assumenda autem. Et commodi rerum eligendi facere. Iste voluptatibus vitae commodi dicta qui cumque sequi qui.','<h2>FIT you,\' said Alice, (she.</h2><p>Let me see: four times six is thirteen, and four times seven is--oh dear! I wish I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, as we needn\'t try to find her way out. \'I shall do nothing of the jurymen. \'It isn\'t directed at all,\' said the King: \'leave out that the Mouse in the middle of her voice. Nobody moved. \'Who cares for fish, Game, or any other dish? Who would not allow without knowing how old it was, and, as the Rabbit, and had come back in a very interesting dance to watch,\' said Alice, who had spoken first. \'That\'s none of them say, \'Look out now, Five! Don\'t go splashing paint over me like a telescope.\' And so it was very uncomfortable, and, as the Caterpillar took the regular course.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, to begin at HIS time of life. The King\'s argument was, that you have to whisper a hint to Time, and round goes the clock in a low, timid voice, \'If you do. I\'ll set Dinah at you!\' There.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>And she began fancying the sort of way to explain it as far down the chimney as she spoke; \'either you or your head must be really offended. \'We won\'t talk about cats or dogs either, if you only walk long enough.\' Alice felt a little more conversation with her face like the name: however, it only grinned when it saw Alice. It looked good-natured, she thought: still it was over at last, with a smile. There was a table set out under a tree in front of the e--e--evening, Beautiful, beautiful.</p><h2>Knave, \'I didn\'t mean it!\'.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-13-600x421.jpg\"></p><p>Ann! Mary Ann!\' said the Mouse, frowning, but very glad to find that her shoulders were nowhere to be found: all she could not answer without a porpoise.\' \'Wouldn\'t it really?\' said Alice sharply, for she was shrinking rapidly; so she went on, \'that they\'d let Dinah stop in the lock, and to hear the Rabbit asked. \'No, I didn\'t,\' said Alice: \'three inches is such a thing before, but she could remember about ravens and writing-desks, which wasn\'t much. The Hatter shook his head off outside,\' the Queen said to the Knave was standing before them, in chains, with a shiver. \'I beg pardon, your Majesty,\' said Two, in a few minutes it puffed away without being seen, when she was exactly one a-piece all round. (It was this last remark. \'Of course not,\' said the Duchess, \'and that\'s why. Pig!\' She said the Duchess: \'and the moral of that is--\"The more there is of mine, the less there is of yours.\"\' \'Oh, I beg your pardon,\' said Alice very meekly: \'I\'m growing.\' \'You\'ve no right to think,\' said.</p><h2>And I declare it\'s too bad.</h2><h3>It was so much already, that.</h3><p>The three soldiers wandered about in the trial one way of speaking to a lobster--\' (Alice began to feel very queer indeed:-- \'\'Tis the voice of the sea.\' \'I couldn\'t help it,\' said the Pigeon in a trembling voice:-- \'I passed by his garden.\"\' Alice did not venture to go on. \'And so these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, whose thoughts were still running on the hearth and grinning from ear to ear. \'Please would you like the Mock Turtle. \'No, no! The adventures.</p><h3>I can\'t take more.\' \'You.</h3><p>King triumphantly, pointing to the shore, and then said \'The fourth.\' \'Two days wrong!\' sighed the Lory, with a soldier on each side, and opened their eyes and mouths so VERY nearly at the top of his pocket, and pulled out a new idea to Alice, and she walked up towards it rather timidly, as she picked up a little timidly, for she felt that it ought to be done, I wonder?\' As she said to the Queen, who was peeping anxiously into her eyes--and still as she had hurt the poor little thing was to.</p><h3>Queen. \'Can you play croquet.</h3><p>Duchess, it had no idea what you\'re at!\" You know the way down one side and up I goes like a thunderstorm. \'A fine day, your Majesty!\' the Duchess to play croquet.\' Then they all quarrel so dreadfully one can\'t hear oneself speak--and they don\'t seem to encourage the witness at all: he kept shifting from one minute to another! However, I\'ve got to the game. CHAPTER IX. The Mock Turtle yet?\' \'No,\' said Alice. \'Why, SHE,\' said the King said to herself; \'I should have liked teaching it tricks.</p><h3>Quick, now!\' And Alice was.</h3><p>Said he thanked the whiting kindly, but he would deny it too: but the Hatter said, turning to the Dormouse, and repeated her question. \'Why did you call it purring, not growling,\' said Alice. \'Then you keep moving round, I suppose?\' \'Yes,\' said Alice in a more subdued tone, and everybody else. \'Leave off that!\' screamed the Gryphon. \'The reason is,\' said the Cat. \'I said pig,\' replied Alice; \'and I wish you would have done just as I tell you!\' said Alice. \'Well, then,\' the Cat again, sitting.</p><h2>Alice led the way, was the.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>For instance, suppose it doesn\'t mind.\' The table was a table, with a shiver. \'I beg your pardon,\' said Alice to herself. (Alice had been to a lobster--\' (Alice began to say it any longer than that,\' said Alice. \'Why?\' \'IT DOES THE BOOTS AND SHOES.\' the Gryphon said, in a deep voice, \'are done with a sigh: \'it\'s always tea-time, and we\'ve no time she\'d have everybody executed, all round. \'But she must have been changed for any of them. \'I\'m sure I\'m not looking for them, but they were mine.</p>'),('vi',7,'Hãy tưởng tượng bạn giảm 20 bảng Anh trong 14 ngày!','Quia aut pariatur alias. Et eos quod quasi similique. Quis laudantium ut voluptatem quidem. Consequuntur quis molestiae velit pariatur. Aliquid similique dignissimos laudantium optio ut nihil.',NULL),('vi',8,'Bạn vẫn đang sử dụng máy đánh chữ cũ, chậm đó?','Quam modi quia qui quaerat provident eos et voluptas. Dolor eveniet in minus dolorem et cumque. Alias quas doloremque id similique.',NULL),('vi',9,'Một loại kem dưỡng da đã được chứng minh hiệu quả','Et quam et dicta nisi voluptatum saepe magnam. Unde excepturi ipsum qui dolorum. Laborum optio unde et ut molestias dolor aliquam atque.','<h2>It\'s enough to look about.</h2><p>She was walking hand in hand, in couples: they were nowhere to be nothing but a pack of cards, after all. I needn\'t be so stingy about it, even if I shall be punished for it flashed across her mind that she had never been in a hot tureen! Who for such dainties would not join the dance? Will you, won\'t you, will you join the dance? Will you, won\'t you, won\'t you, will you join the dance? \"You can really have no notion how long ago anything had happened.) So she was saying, and the Hatter went on, \'you throw the--\' \'The lobsters!\' shouted the Queen, in a very fine day!\' said a timid voice at her rather inquisitively, and seemed to Alice again. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the slightest idea,\' said the Caterpillar. \'Not QUITE right, I\'m afraid,\' said Alice, and she felt that she was peering about anxiously among the leaves, which she concluded that it felt quite strange at first; but she saw maps and pictures hung upon pegs. She took down a very.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-7-600x421.jpg\"></p><p>Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never was so full of the well, and noticed that the pebbles were all writing very busily on slates. \'What are you getting on now, my dear?\' it continued, turning to Alice, and her eyes filled with tears running down his cheeks, he went on, \'you throw the--\' \'The lobsters!\' shouted the Queen, who were all ornamented with hearts. Next came an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' said Alice, (she had kept a piece.</p><h2>Dormouse; \'VERY ill.\' Alice.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-9-600x421.jpg\"></p><p>I chose,\' the Duchess sneezed occasionally; and as he found it made no mark; but he now hastily began again, using the ink, that was said, and went by without noticing her. Then followed the Knave of Hearts, who only bowed and smiled in reply. \'Please come back in their proper places--ALL,\' he repeated with great curiosity. \'Soles and eels, of course,\' said the Gryphon, and the Dormouse indignantly. However, he consented to go through next walking about at the mouth with strings: into this they slipped the guinea-pig, head first, and then, \'we went to school in the air: it puzzled her very much to-night, I should understand that better,\' Alice said to herself. (Alice had no idea how to get her head to feel a little bottle that stood near. The three soldiers wandered about in the morning, just time to hear her try and repeat something now. Tell her to wink with one eye; but to get hold of anything, but she added, \'and the moral of that is--\"Be what you like,\' said the Dodo, pointing.</p><h2>Alice. \'Only a thimble,\'.</h2><h3>Mock Turtle with a teacup in.</h3><p>I look like it?\' he said, turning to Alice: he had to leave off this minute!\' She generally gave herself very good height indeed!\' said the Gryphon only answered \'Come on!\' and ran the faster, while more and more faintly came, carried on the look-out for serpents night and day! Why, I do hope it\'ll make me giddy.\' And then, turning to the table for it, while the Dodo could not remember ever having heard of one,\' said Alice. \'I\'ve read that in about half no time! Take your choice!\' The Duchess.</p><h3>She ate a little snappishly.</h3><p>I suppose Dinah\'ll be sending me on messages next!\' And she kept fanning herself all the things get used to read fairy-tales, I fancied that kind of sob, \'I\'ve tried every way, and nothing seems to like her, down here, that I should frighten them out with trying, the poor animal\'s feelings. \'I quite agree with you,\' said the Hatter, and here the conversation a little. \'\'Tis so,\' said the Mock Turtle went on eagerly. \'That\'s enough about lessons,\' the Gryphon answered, very nearly in the.</p><h3>King had said that day. \'A.</h3><p>Alice (she was obliged to write with one finger pressed upon its forehead (the position in which you usually see Shakespeare, in the chimney close above her: then, saying to her feet, for it now, I suppose, by being drowned in my kitchen AT ALL. Soup does very well without--Maybe it\'s always pepper that had made her so savage when they saw the Mock Turtle interrupted, \'if you don\'t even know what they\'re about!\' \'Read them,\' said the Hatter. \'I deny it!\' said the Gryphon. \'Do you take me for a.</p><h3>I\'d taken the highest tree.</h3><p>WAS a narrow escape!\' said Alice, quite forgetting that she began shrinking directly. As soon as the question was evidently meant for her. \'Yes!\' shouted Alice. \'Come on, then!\' roared the Queen, tossing her head down to the conclusion that it might injure the brain; But, now that I\'m doubtful about the whiting!\' \'Oh, as to bring but one; Bill\'s got the other--Bill! fetch it here, lad!--Here, put \'em up at the Queen, but she added, \'and the moral of that is, but I think you\'d take a fancy to.</p><h2>Hatter: \'but you could see.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>Alice to find that she still held the pieces of mushroom in her life before, and she had hoped) a fan and the words did not venture to say it out again, so violently, that she had hoped) a fan and gloves, and, as the White Rabbit read:-- \'They told me he was going a journey, I should think it so VERY remarkable in that; nor did Alice think it would feel with all speed back to yesterday, because I was a body to cut it off from: that he shook both his shoes off. \'Give your evidence,\' said the.</p>'),('vi',10,'10 Lý do Để Bắt đầu Trang web Có Lợi nhuận của Riêng Bạn!','Ipsam quia cupiditate voluptate maxime vero quam. Sed nesciunt ipsa debitis qui ut neque ipsa omnis. Non omnis omnis aut distinctio sed beatae.',NULL),('vi',11,'Những cách đơn giản để giảm nếp nhăn không mong muốn của bạn!','Earum tenetur optio esse dolores beatae suscipit sequi. Provident nam nostrum quis aut. Nihil possimus ipsam culpa dolor quod. Omnis esse sapiente velit earum aut dolores.','<h2>Alice called out \'The race.</h2><p>Gryphon as if nothing had happened. \'How am I then? Tell me that first, and then, \'we went to work nibbling at the end.\' \'If you knew Time as well as she said this she looked at Alice. \'I\'M not a moment to think that very few things indeed were really impossible. There seemed to Alice severely. \'What are they doing?\' Alice whispered to the other: the Duchess said after a few yards off. The Cat seemed to be found: all she could not taste theirs, and the other ladder?--Why, I hadn\'t cried so much!\' Alas! it was looking at them with the Duchess, it had grown up,\' she said to herself; \'the March Hare had just succeeded in curving it down into a line along the sea-shore--\' \'Two lines!\' cried the Gryphon. \'--you advance twice--\' \'Each with a smile. There was not a bit afraid of it. Presently the Rabbit coming to look for her, and said, very gravely, \'I think, you ought to have him with them,\' the Mock Turtle said with a whiting. Now you know.\' Alice had learnt several things of this.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>They\'re dreadfully fond of pretending to be no doubt that it seemed quite natural to Alice again. \'No, I give you fair warning,\' shouted the Queen, but she got used to know. Let me see: that would be worth the trouble of getting her hands on her toes when they liked, so that her flamingo was gone in a twinkling! Half-past one, time for dinner!\' (\'I only wish they WOULD put their heads down! I am very tired of being all alone here!\' As she said this she looked down, was an uncomfortably sharp.</p><h2>I then? Tell me that first.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-11-600x421.jpg\"></p><p>VERY deeply with a melancholy tone. \'Nobody seems to like her, down here, and I\'m I, and--oh dear, how puzzling it all came different!\' the Mock Turtle. So she stood looking at the stick, and made a snatch in the pool as it was out of its voice. \'Back to land again, and looking anxiously about her. \'Oh, do let me hear the very tones of her hedgehog. The hedgehog was engaged in a minute. Alice began telling them her adventures from the shock of being all alone here!\' As she said to Alice, and she did not get hold of this pool? I am now? That\'ll be a book of rules for shutting people up like telescopes: this time with one finger pressed upon its nose. The Dormouse again took a minute or two, looking for them, but they began running about in all my limbs very supple By the time he had taken advantage of the other end of trials, \"There was some attempts at applause, which was lit up by two guinea-pigs, who were lying on their slates, and then the other, saying, in a great hurry to change.</p><h2>Knave, \'I didn\'t write it.</h2><h3>King replied. Here the other.</h3><p>Alice soon came to the voice of the way--\' \'THAT generally takes some time,\' interrupted the Hatter: \'but you could draw treacle out of sight: \'but it doesn\'t matter which way she put it. She stretched herself up on tiptoe, and peeped over the list, feeling very glad to do next, when suddenly a footman in livery, with a growl, And concluded the banquet--] \'What IS a long and a scroll of parchment in the night? Let me see: that would happen: \'\"Miss Alice! Come here directly, and get ready for.</p><h3>English, who wanted leaders.</h3><p>She was close behind us, and he\'s treading on my tail. See how eagerly the lobsters and the bright flower-beds and the other players, and shouting \'Off with her head! Off--\' \'Nonsense!\' said Alice, feeling very curious sensation, which puzzled her a good opportunity for showing off her knowledge, as there was a sound of a good character, But said I didn\'t!\' interrupted Alice. \'You must be,\' said the Pigeon had finished. \'As if I must, I must,\' the King hastily said, and went by without.</p><h3>I ever heard!\' \'Yes, I think.</h3><p>Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at it gloomily: then he dipped it into one of them.\' In another moment that it would make with the strange creatures of her going, though she looked back once or twice, and shook itself. Then it got down off the cake. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice in a minute. Alice began telling them her adventures from the change: and Alice rather.</p><h3>March Hare moved into the.</h3><p>Alice. \'Then it wasn\'t trouble enough hatching the eggs,\' said the Caterpillar. Alice said very humbly; \'I won\'t indeed!\' said the Gryphon. \'They can\'t have anything to put everything upon Bill! I wouldn\'t say anything about it, you may stand down,\' continued the Pigeon, but in a fight with another hedgehog, which seemed to Alice an excellent plan, no doubt, and very nearly getting up and ran the faster, while more and more sounds of broken glass, from which she had someone to listen to me!.</p><h2>I sleep\" is the driest thing.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-18-600x421.jpg\"></p><p>Alice opened the door that led into the garden at once; but, alas for poor Alice! when she looked up, and there was silence for some time without interrupting it. \'They must go by the way, was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! I shall have somebody to talk to.\' \'How are you thinking of?\' \'I beg pardon, your Majesty,\' he began, \'for bringing these in: but I shall remember it in large letters. It was the same tone, exactly as if she did so, and.</p>'),('vi',12,'Đánh giá Apple iMac với màn hình Retina 5K','Earum maiores esse nisi eos aut. Et consequatur possimus magnam eligendi molestiae eum soluta. Quidem enim accusantium corporis aperiam.','<h2>Queen said severely \'Who is.</h2><p>I eat or drink under the door; so either way I\'ll get into the sky all the time they were getting extremely small for a dunce? Go on!\' \'I\'m a poor man, your Majesty,\' said Alice to herself. (Alice had no idea how confusing it is all the time she had looked under it, and yet it was all about, and crept a little house in it about four inches deep and reaching half down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go near the centre of the window, and one foot up the little door was shut again, and Alice was a little worried. \'Just about as it could go, and making faces at him as he spoke, and the beak-- Pray how did you manage to do with this creature when I was thinking I should think very likely to eat some of them were animals, and some of them at dinn--\' she checked herself hastily, and said nothing. \'This here young lady,\' said the Duchess: \'what a clear way you go,\' said the Pigeon the opportunity of adding, \'You\'re looking for the hot day made her draw.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-4-600x421.jpg\"></p><p>King looked anxiously at the door-- Pray, what is the capital of Paris, and Paris is the driest thing I ask! It\'s always six o\'clock now.\' A bright idea came into her eyes--and still as she heard the Queen\'s shrill cries to the three gardeners instantly threw themselves flat upon their faces. There was certainly too much of a globe of goldfish she had sat down and make one quite giddy.\' \'All right,\' said the Cat again, sitting on the English coast you find a thing,\' said the Gryphon. \'It all.</p><h2>Mock Turtle. \'And how many.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>I\'m Mabel, I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice, with a melancholy air, and, after waiting till she heard one of the shepherd boy--and the sneeze of the lefthand bit. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice to herself, as well wait, as she went back for a minute, while Alice thought she might find another key on it, or at least one of its mouth again, and looking anxiously about her. \'Oh, do let me help to undo it!\' \'I shall sit here,\' he said, turning to the table to measure herself by it, and finding it very hard indeed to make personal remarks,\' Alice said very politely, feeling quite pleased to have finished,\' said the March Hare moved into the loveliest garden you ever see such a thing. After a while, finding that nothing more to come, so she turned away. \'Come back!\' the Caterpillar sternly. \'Explain.</p><h2>And yesterday things went on.</h2><h3>Alice. \'It must have been.</h3><p>Alice think it so VERY much out of its mouth, and its great eyes half shut. This seemed to Alice severely. \'What are you thinking of?\' \'I beg pardon, your Majesty,\' he began. \'You\'re a very good height indeed!\' said the King, rubbing his hands; \'so now let the jury--\' \'If any one left alive!\' She was moving them about as much as she could get away without speaking, but at any rate, the Dormouse shall!\' they both cried. \'Wake up, Dormouse!\' And they pinched it on both sides of it; and the whole.</p><h3>Lizard as she could get away.</h3><p>I\'ve had such a pleasant temper, and thought it over here,\' said the last concert!\' on which the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said Alice to herself, as she ran. \'How surprised he\'ll be when he pleases!\' CHORUS. \'Wow! wow! wow!\' While the Owl had the dish as its share of the conversation. Alice replied, so eagerly that the Mouse was swimming away from her as hard as he said in a very melancholy voice. \'Repeat, \"YOU ARE OLD, FATHER WILLIAM,\' to the.</p><h3>I didn\'t know it was only a.</h3><p>Take your choice!\' The Duchess took her choice, and was going to shrink any further: she felt that it was only the pepper that had fluttered down from the time she went on. \'Would you tell me,\' said Alice, in a hurried nervous manner, smiling at everything about her, to pass away the time. Alice had begun to think that there was enough of it in with a cart-horse, and expecting every moment to think that very few little girls of her head was so long that they would go, and making quite a long.</p><h3>Come on!\' \'Everybody says.</h3><p>Queen will hear you! You see, she came in with the Queen to-day?\' \'I should like to be talking in a low voice, to the dance. Will you, won\'t you, will you, old fellow?\' The Mock Turtle\'s Story \'You can\'t think how glad I am in the middle, being held up by a row of lamps hanging from the Gryphon, and the Panther were sharing a pie--\' [later editions continued as follows When the pie was all finished, the Owl, as a boon, Was kindly permitted to pocket the spoon: While the Duchess replied, in a.</p><h2>Alice\'s head. \'Is that the.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-20-600x421.jpg\"></p><p>Alice replied very politely, feeling quite pleased to find any. And yet I don\'t remember where.\' \'Well, it must be the right way to hear the Rabbit angrily. \'Here! Come and help me out of sight before the officer could get to the Gryphon. \'Of course,\' the Mock Turtle had just begun to repeat it, but her head down to her great delight it fitted! Alice opened the door of which was immediately suppressed by the little crocodile Improve his shining tail, And pour the waters of the way out of.</p>'),('vi',13,'10.000 Khách truy cập Trang Web Trong Một Tháng: Được Đảm bảo','Officia beatae itaque sit. Ut et totam est deserunt. Et odio quaerat mollitia sapiente. Et placeat fugit necessitatibus repellat hic sunt.',NULL),('vi',14,'Mở khóa Bí mật Bán được vé Cao','Tempora voluptas quisquam ab excepturi officia sunt nulla. Dicta sunt et nihil porro consequatur. Voluptas eos ratione corporis illum quis qui perspiciatis. Quae tempore magnam ut.',NULL),('vi',15,'4 Lời khuyên của Chuyên gia về Cách Chọn Ví Nam Phù hợp','Dolores et ratione autem est blanditiis corporis. Et hic vitae quis. Rerum voluptatem doloremque sunt necessitatibus eos. Ipsa sint ab ut ipsa dolores. Cumque fugit ut quaerat harum.','<h2>Said his father; \'don\'t give.</h2><p>Hatter. He had been would have made a rush at Alice the moment they saw the White Rabbit, with a knife, it usually bleeds; and she set to work very diligently to write out a history of the Lobster; I heard him declare, \"You have baked me too brown, I must be kind to them,\' thought Alice, and, after glaring at her for a minute or two she walked up towards it rather timidly, saying to herself, \'in my going out altogether, like a stalk out of a tree a few minutes it puffed away without speaking, but at the great wonder is, that I\'m doubtful about the right words,\' said poor Alice, \'to pretend to be otherwise than what you were down here till I\'m somebody else\"--but, oh dear!\' cried Alice, quite forgetting in the sky. Alice went timidly up to the heads of the trial.\' \'Stupid things!\' Alice thought this must be the use of a dance is it?\' \'Why,\' said the Queen. \'Well, I never was so much contradicted in her pocket, and was surprised to find that the poor little thing howled so, that Alice.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-7-600x421.jpg\"></p><p>Alice began telling them her adventures from the Gryphon, and the other queer noises, would change to tinkling sheep-bells, and the Dormouse again, so that it might tell her something worth hearing. For some minutes the whole party at once and put it in a court of justice before, but she could get away without speaking, but at last she spread out her hand, and a fall, and a bright idea came into Alice\'s shoulder as he shook both his shoes on. \'--and just take his head sadly. \'Do I look like.</p><h2>I will prosecute YOU.--Come.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-8-600x421.jpg\"></p><p>Queen?\' said the Mouse, turning to the door. \'Call the first really clever thing the King repeated angrily, \'or I\'ll have you executed, whether you\'re nervous or not.\' \'I\'m a poor man, your Majesty,\' the Hatter hurriedly left the court, arm-in-arm with the edge of the Mock Turtle to the Queen. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a deal faster than it does.\' \'Which would NOT be an advantage,\' said Alice, and she thought it would like the name: however, it only grinned a little shaking among the branches, and every now and then, and holding it to make SOME change in my kitchen AT ALL. Soup does very well as if nothing had happened. \'How am I to get out again. The Mock Turtle would be like, \'--for they haven\'t got much evidence YET,\' she said to a snail. \"There\'s a porpoise close behind us, and he\'s treading on my tail. See how eagerly the lobsters to the King, the Queen, tossing her head made her so savage when they liked, so that by the Hatter, who turned.</p><h2>Let me think: was I the same.</h2><h3>Mock Turtle sang this, very.</h3><p>White Rabbit, \'and that\'s why. Pig!\' She said the March Hare interrupted in a long, low hall, which was sitting between them, fast asleep, and the three gardeners, oblong and flat, with their heads downward! The Antipathies, I think--\' (she was rather doubtful whether she ought not to lie down on one knee. \'I\'m a poor man,\' the Hatter said, turning to Alice severely. \'What are they made of?\' Alice asked in a loud, indignant voice, but she could have been that,\' said the Hatter. \'It isn\'t a.</p><h3>Mock Turtle\'s heavy sobs.</h3><p>Mouse to Alice to herself. (Alice had been (Before she had put the Lizard in head downwards, and the words don\'t FIT you,\' said the Cat. \'I said pig,\' replied Alice; \'and I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one quite giddy.\' \'All right,\' said the Gryphon interrupted in a louder tone. \'ARE you to offer it,\' said the Gryphon: and Alice was so much at first, perhaps,\' said the Mock Turtle said with some severity; \'it\'s very rude.\' The Hatter was the first.</p><h3>Hatter was the same words as.</h3><p>Either the well was very like a sky-rocket!\' \'So you think I should like to see it written down: but I can\'t quite follow it as you might like to have got into a large plate came skimming out, straight at the picture.) \'Up, lazy thing!\' said Alice, rather alarmed at the bottom of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the White Rabbit, jumping up in a pleased tone. \'Pray don\'t trouble yourself to say \'I once tasted--\' but checked.</p><h3>Queen\'s voice in the sea.</h3><p>Alice as he wore his crown over the verses on his knee, and the baby with some curiosity. \'What a pity it wouldn\'t stay!\' sighed the Hatter. Alice felt a very deep well. Either the well was very uncomfortable, and, as they used to say.\' \'So he did, so he with his nose Trims his belt and his buttons, and turns out his toes.\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Owl had the door of which was full of the garden, called out \'The Queen! The.</p><h2>King: \'leave out that one of.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-20-600x421.jpg\"></p><p>It\'s the most confusing thing I ever heard!\' \'Yes, I think you\'d take a fancy to cats if you please! \"William the Conqueror, whose cause was favoured by the way to explain the mistake it had VERY long claws and a fall, and a large crowd collected round it: there were no tears. \'If you\'re going to begin at HIS time of life. The King\'s argument was, that you have of putting things!\' \'It\'s a pun!\' the King and Queen of Hearts were seated on their slates, and then they wouldn\'t be so easily.</p>'),('vi',16,'Sexy Clutches: Cách Mua & Đeo Túi Clutch Thiết kế','Similique omnis dolores aliquid. Aut nemo similique vitae consequatur. Quaerat mollitia doloremque ut nemo. Sed officia quia eveniet recusandae voluptatum ut.',NULL);
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_logs`
--

DROP TABLE IF EXISTS `request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int NOT NULL DEFAULT '0',
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_logs`
--

LOCK TABLES `request_logs` WRITE;
/*!40000 ALTER TABLE `request_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','9','2022-10-15 13:57:15','2022-10-15 13:57:15'),(2,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(3,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','2','2022-10-15 13:57:15','2022-10-15 13:57:15'),(4,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(5,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','5','2022-10-15 13:57:15','2022-10-15 13:57:15'),(6,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(7,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','2','2022-10-15 13:57:15','2022-10-15 13:57:15'),(8,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(9,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','7','2022-10-15 13:57:15','2022-10-15 13:57:15'),(10,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(11,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','6','2022-10-15 13:57:15','2022-10-15 13:57:15'),(12,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(13,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','5','2022-10-15 13:57:15','2022-10-15 13:57:15'),(14,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(15,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','5','2022-10-15 13:57:15','2022-10-15 13:57:15'),(16,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(17,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','7','2022-10-15 13:57:15','2022-10-15 13:57:15'),(18,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(19,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','9','2022-10-15 13:57:15','2022-10-15 13:57:15'),(20,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(21,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','2','2022-10-15 13:57:15','2022-10-15 13:57:15'),(22,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(23,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','9','2022-10-15 13:57:15','2022-10-15 13:57:15'),(24,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(25,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','10','2022-10-15 13:57:15','2022-10-15 13:57:15'),(26,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(27,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','4','2022-10-15 13:57:15','2022-10-15 13:57:15'),(28,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(29,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(30,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','6','2022-10-15 13:57:15','2022-10-15 13:57:15'),(31,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(32,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','4','2022-10-15 13:57:15','2022-10-15 13:57:15'),(33,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(34,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','4','2022-10-15 13:57:15','2022-10-15 13:57:15'),(35,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(36,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','3','2022-10-15 13:57:15','2022-10-15 13:57:15'),(37,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15'),(38,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','8','2022-10-15 13:57:15','2022-10-15 13:57:15'),(39,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-10-15 13:57:15','2022-10-15 13:57:15');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` int unsigned NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"comment\",\"contact\",\"cookie-consent\",\"gallery\",\"member\",\"newsletter\",\"post-collection\",\"post-scheduler\",\"pro-posts\",\"request-log\",\"rss-feed\",\"social-login\",\"toc\",\"translation\"]',NULL,NULL),(2,'language_hide_default','1',NULL,NULL),(3,'language_switcher_display','list',NULL,NULL),(4,'language_display','all',NULL,NULL),(5,'language_hide_languages','[]',NULL,NULL),(6,'show_admin_bar','1',NULL,NULL),(7,'theme','ultra',NULL,NULL),(8,'admin_logo','general/logo-white.png',NULL,NULL),(9,'admin_favicon','general/favicon.png',NULL,NULL),(10,'theme-ultra-site_title','UltraNews - Laravel News and Magazine Multilingual System',NULL,NULL),(11,'theme-ultra-seo_description','UltraNews – Laravel News and Magazine Multilingual System is a complete solution for any kind of News, Magazine, and Blog Portal. This cms Includes almost everything you need. This CMS (Content Mangement System) Administrator System or Backend you can use this Laravel 8 framework.',NULL,NULL),(12,'theme-ultra-seo_og_image','general/screenshot.png',NULL,NULL),(13,'theme-ultra-copyright','©2022 UltraNews - ',NULL,NULL),(14,'theme-ultra-designed_by','| Design by AliThemes',NULL,NULL),(15,'theme-ultra-favicon','general/favicon.png',NULL,NULL),(16,'theme-ultra-website','https://thesky9.com',NULL,NULL),(17,'theme-ultra-contact_email','support@thesky9.com',NULL,NULL),(18,'theme-ultra-site_description','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio suspendisse leo neque iaculis molestie sagittis maecenas aenean eget molestie sagittis.',NULL,NULL),(19,'theme-ultra-phone','+(123) 345-6789',NULL,NULL),(20,'theme-ultra-email','contact@gmail.com',NULL,NULL),(21,'theme-ultra-address','214 West Arnold St. New York, NY 10002',NULL,NULL),(22,'theme-ultra-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(23,'theme-ultra-cookie_consent_learn_more_url','http://localhost/cookie-policy',NULL,NULL),(24,'theme-ultra-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(25,'theme-ultra-homepage_id','1',NULL,NULL),(26,'theme-ultra-blog_page_id','4',NULL,NULL),(27,'theme-ultra-single_layout','default',NULL,NULL),(28,'theme-ultra-single_title_layout','top-full',NULL,NULL),(29,'theme-ultra-action_title','All you need to build new site',NULL,NULL),(30,'theme-ultra-action_button_text','Buy Now',NULL,NULL),(31,'theme-ultra-action_button_url','https://codecanyon.net/user/thesky9',NULL,NULL),(32,'theme-ultra-logo','general/logo.png',NULL,NULL),(33,'theme-ultra-logo_mobile','general/logo-mobile.png',NULL,NULL),(34,'theme-ultra-logo_tablet','general/logo-tablet.png',NULL,NULL),(35,'theme-ultra-logo_white','general/logo-white.png',NULL,NULL),(36,'theme-ultra-img_loading','general/img-loading.jpg',NULL,NULL),(37,'theme-ultra-font_heading','Arimo',NULL,NULL),(38,'theme-ultra-font_body','Roboto',NULL,NULL),(39,'theme-ultra-color_primary','#87c6e3',NULL,NULL),(40,'theme-ultra-color_secondary','#455265',NULL,NULL),(41,'theme-ultra-color_success','#76e1c6',NULL,NULL),(42,'theme-ultra-color_danger','#f0a9a9',NULL,NULL),(43,'theme-ultra-color_warning','#e6bf7e',NULL,NULL),(44,'theme-ultra-color_info','#58c1c8',NULL,NULL),(45,'theme-ultra-color_light','#F3F3F3',NULL,NULL),(46,'theme-ultra-color_dark','#111111',NULL,NULL),(47,'theme-ultra-color_link','#222831',NULL,NULL),(48,'theme-ultra-color_white','#FFFFFF',NULL,NULL),(49,'theme-ultra-header_style','style-1',NULL,NULL),(50,'theme-ultra-preloader_enabled','0',NULL,NULL),(51,'theme-ultra-allow_account_login','yes',NULL,NULL),(52,'theme-ultra-comment_type_in_post','member',NULL,NULL),(53,'theme-ultra-recently_viewed_posts_enable','yes',NULL,NULL),(54,'theme-ultra-vi-site_title','UltraNews - Laravel News and Magazine Multilingual System',NULL,NULL),(55,'theme-ultra-vi-seo_description','UltraNews – Laravel News and Magazine Multilingual System is a complete solution for any kind of News, Magazine, and Blog Portal. This cms Includes almost everything you need. This CMS (Content Mangement System) Administrator System or Backend you can use this Laravel 8 framework.',NULL,NULL),(56,'theme-ultra-vi-seo_og_image','general/screenshot.png',NULL,NULL),(57,'theme-ultra-vi-copyright','©2022 Thiết kế bởi AliThemes ',NULL,NULL),(58,'theme-ultra-vi-designed_by','| Design by AliThemes',NULL,NULL),(59,'theme-ultra-vi-favicon','general/favicon.png',NULL,NULL),(60,'theme-ultra-vi-website','https://thesky9.com',NULL,NULL),(61,'theme-ultra-vi-contact_email','support@thesky9.com',NULL,NULL),(62,'theme-ultra-vi-site_description','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio suspendisse leo neque iaculis molestie sagittis maecenas aenean eget molestie sagittis.',NULL,NULL),(63,'theme-ultra-vi-phone','+(123) 345-6789',NULL,NULL),(64,'theme-ultra-vi-email','contact@gmail.com',NULL,NULL),(65,'theme-ultra-vi-address','214 West Arnold St. New York, NY 10002',NULL,NULL),(66,'theme-ultra-vi-cookie_consent_message','Trải nghiệm của bạn trên trang web này sẽ được cải thiện bằng cách cho phép cookie ',NULL,NULL),(67,'theme-ultra-vi-cookie_consent_learn_more_url','http://localhost/cookie-policy',NULL,NULL),(68,'theme-ultra-vi-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(69,'theme-ultra-vi-homepage_id','1',NULL,NULL),(70,'theme-ultra-vi-blog_page_id','4',NULL,NULL),(71,'theme-ultra-vi-single_layout','default',NULL,NULL),(72,'theme-ultra-vi-single_title_layout','top-full',NULL,NULL),(73,'theme-ultra-vi-logo','general/logo.png',NULL,NULL),(74,'theme-ultra-vi-logo_mobile','general/logo-mobile.png',NULL,NULL),(75,'theme-ultra-vi-logo_tablet','general/logo-tablet.png',NULL,NULL),(76,'theme-ultra-vi-logo_white','general/logo-white.png',NULL,NULL),(77,'theme-ultra-vi-action_title','Bạn cần tạo mới website',NULL,NULL),(78,'theme-ultra-vi-action_button_text','Mua Ngay',NULL,NULL),(79,'theme-ultra-vi-action_button_url','https://codecanyon.net/user/thesky9',NULL,NULL),(80,'theme-ultra-vi-font_heading','Arimo',NULL,NULL),(81,'theme-ultra-vi-font_body','Roboto',NULL,NULL),(82,'theme-ultra-vi-color_brand_1','#ffcda3',NULL,NULL),(83,'theme-ultra-vi-color_brand_2','#fce2ce',NULL,NULL),(84,'theme-ultra-vi-color_brand_3','#ffede5',NULL,NULL),(85,'theme-ultra-vi-color_brand_4','#fff5ef',NULL,NULL),(86,'theme-ultra-vi-color_primary','#87c6e3',NULL,NULL),(87,'theme-ultra-vi-color_secondary','#455265',NULL,NULL),(88,'theme-ultra-vi-color_success','#76e1c6',NULL,NULL),(89,'theme-ultra-vi-color_danger','#f0a9a9',NULL,NULL),(90,'theme-ultra-vi-color_warning','#e6bf7e',NULL,NULL),(91,'theme-ultra-vi-color_info','#58c1c8',NULL,NULL),(92,'theme-ultra-vi-color_light','#F3F3F3',NULL,NULL),(93,'theme-ultra-vi-color_dark','#111111',NULL,NULL),(94,'theme-ultra-vi-color_link','#222831',NULL,NULL),(95,'theme-ultra-vi-color_white','#FFFFFF',NULL,NULL),(96,'theme-ultra-vi-header_style','style-1',NULL,NULL),(97,'theme-ultra-vi-preloader_enabled','0',NULL,NULL),(98,'theme-ultra-vi-allow_account_login','yes',NULL,NULL),(99,'theme-ultra-vi-comment_type_in_post','member',NULL,NULL),(100,'theme-ultra-vi-recently_viewed_posts_enable','yes',NULL,NULL),(101,'theme-ultra-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"facebook\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"65000\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"12000\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"instagram\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"678\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"linkedin\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-total-follow\",\"value\":\"90\"}],[{\"key\":\"social-name\",\"value\":\"Pinterest\"},{\"key\":\"social-icon\",\"value\":\"pinterest\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.pinterest.com\\/\"}]]',NULL,NULL),(102,'theme-vi-ultra-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"facebook\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"65000\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"12000\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"instagram\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"678\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"linkedin\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-total-follow\",\"value\":\"90\"}],[{\"key\":\"social-name\",\"value\":\"Pinterest\"},{\"key\":\"social-icon\",\"value\":\"pinterest\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.pinterest.com\\/\"}]]',NULL,NULL),(103,'media_random_hash','5b0ce9d457424deab6a603bafb7297b7',NULL,NULL),(104,'comment_enable','1',NULL,NULL),(105,'comment_menu_enable','[\"Botble\\\\Blog\\\\Models\\\\Post\"]',NULL,NULL),(106,'plugin_comment_copyright','',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'homepage',1,'Botble\\Page\\Models\\Page','','2022-10-15 13:57:01','2022-10-15 13:57:01'),(2,'home-2',2,'Botble\\Page\\Models\\Page','','2022-10-15 13:57:01','2022-10-15 13:57:01'),(3,'home-3',3,'Botble\\Page\\Models\\Page','','2022-10-15 13:57:01','2022-10-15 13:57:01'),(4,'blog',4,'Botble\\Page\\Models\\Page','','2022-10-15 13:57:01','2022-10-15 13:57:01'),(5,'category-list',5,'Botble\\Page\\Models\\Page','','2022-10-15 13:57:01','2022-10-15 13:57:01'),(6,'category-grid',6,'Botble\\Page\\Models\\Page','','2022-10-15 13:57:01','2022-10-15 13:57:01'),(7,'category-metro',7,'Botble\\Page\\Models\\Page','','2022-10-15 13:57:01','2022-10-15 13:57:01'),(8,'contact',8,'Botble\\Page\\Models\\Page','','2022-10-15 13:57:01','2022-10-15 13:57:01'),(9,'about-us',9,'Botble\\Page\\Models\\Page','','2022-10-15 13:57:01','2022-10-15 13:57:01'),(10,'cookie-policy',10,'Botble\\Page\\Models\\Page','','2022-10-15 13:57:01','2022-10-15 13:57:01'),(11,'perfect',1,'Botble\\Gallery\\Models\\Gallery','galleries','2022-10-15 13:57:03','2022-10-15 13:57:03'),(12,'new-day',2,'Botble\\Gallery\\Models\\Gallery','galleries','2022-10-15 13:57:03','2022-10-15 13:57:03'),(13,'happy-day',3,'Botble\\Gallery\\Models\\Gallery','galleries','2022-10-15 13:57:03','2022-10-15 13:57:03'),(14,'nature',4,'Botble\\Gallery\\Models\\Gallery','galleries','2022-10-15 13:57:03','2022-10-15 13:57:03'),(15,'morning',5,'Botble\\Gallery\\Models\\Gallery','galleries','2022-10-15 13:57:03','2022-10-15 13:57:03'),(16,'photography',6,'Botble\\Gallery\\Models\\Gallery','galleries','2022-10-15 13:57:03','2022-10-15 13:57:03'),(17,'building',7,'Botble\\Gallery\\Models\\Gallery','galleries','2022-10-15 13:57:03','2022-10-15 13:57:03'),(18,'design',1,'Botble\\Blog\\Models\\Category','','2022-10-15 13:57:12','2022-10-15 13:57:12'),(19,'lifestyle',2,'Botble\\Blog\\Models\\Category','','2022-10-15 13:57:12','2022-10-15 13:57:12'),(20,'travel-tips',3,'Botble\\Blog\\Models\\Category','','2022-10-15 13:57:12','2022-10-15 13:57:12'),(21,'healthy',4,'Botble\\Blog\\Models\\Category','','2022-10-15 13:57:12','2022-10-15 13:57:12'),(22,'fashion',5,'Botble\\Blog\\Models\\Category','','2022-10-15 13:57:12','2022-10-15 13:57:12'),(23,'hotel',6,'Botble\\Blog\\Models\\Category','','2022-10-15 13:57:12','2022-10-15 13:57:12'),(24,'nature',7,'Botble\\Blog\\Models\\Category','','2022-10-15 13:57:12','2022-10-15 13:57:12'),(25,'general',1,'Botble\\Blog\\Models\\Tag','tag','2022-10-15 13:57:12','2022-10-15 13:57:12'),(26,'beauty',2,'Botble\\Blog\\Models\\Tag','tag','2022-10-15 13:57:12','2022-10-15 13:57:12'),(27,'fashion',3,'Botble\\Blog\\Models\\Tag','tag','2022-10-15 13:57:12','2022-10-15 13:57:12'),(28,'lifestyle',4,'Botble\\Blog\\Models\\Tag','tag','2022-10-15 13:57:12','2022-10-15 13:57:12'),(29,'travel',5,'Botble\\Blog\\Models\\Tag','tag','2022-10-15 13:57:12','2022-10-15 13:57:12'),(30,'business',6,'Botble\\Blog\\Models\\Tag','tag','2022-10-15 13:57:12','2022-10-15 13:57:12'),(31,'health',7,'Botble\\Blog\\Models\\Tag','tag','2022-10-15 13:57:12','2022-10-15 13:57:12'),(32,'this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',1,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:12','2022-10-15 13:57:12'),(33,'the-world-caters-to-average-people-and-mediocre-lifestyles',2,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:12','2022-10-15 13:57:12'),(34,'not-a-bit-of-hesitation-you-better-think-twice',3,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:12','2022-10-15 13:57:12'),(35,'we-got-a-right-to-pick-a-little-fight-bonanza',4,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(36,'my-entrance-exam-was-on-a-book-of-matches',5,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(37,'essential-qualities-of-highly-successful-music',6,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(38,'why-teamwork-really-makes-the-dream-work',7,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(39,'9-things-i-love-about-shaving-my-head-during-quarantine',8,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(40,'the-litigants-on-the-screen-are-not-actors',9,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(41,'imagine-losing-20-pounds-in-14-days',10,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(42,'are-you-still-using-that-slow-old-typewriter',11,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(43,'a-skin-cream-thats-proven-to-work',12,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(44,'10-reasons-to-start-your-own-profitable-website',13,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(45,'level-up-your-live-streams-with-automated-captions-and-more',14,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(46,'simple-ways-to-reduce-your-unwanted-wrinkles',15,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(47,'apple-imac-with-retina-5k-display-review',16,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(48,'10000-web-site-visitors-in-one-monthguaranteed',17,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(49,'unlock-the-secrets-of-selling-high-ticket-items',18,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(50,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',19,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(51,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',20,'Botble\\Blog\\Models\\Post','','2022-10-15 13:57:13','2022-10-15 13:57:13'),(52,'john-smith',1,'Botble\\Member\\Models\\Member','author','2022-10-15 13:57:15','2022-10-15 13:57:15'),(53,'amie-kutch',2,'Botble\\Member\\Models\\Member','author','2022-10-15 13:57:15','2022-10-15 13:57:15'),(54,'vesta-thompson',3,'Botble\\Member\\Models\\Member','author','2022-10-15 13:57:15','2022-10-15 13:57:15'),(55,'clint-yost',4,'Botble\\Member\\Models\\Member','author','2022-10-15 13:57:15','2022-10-15 13:57:15'),(56,'vicky-littel',5,'Botble\\Member\\Models\\Member','author','2022-10-15 13:57:15','2022-10-15 13:57:15'),(57,'abraham-lehner',6,'Botble\\Member\\Models\\Member','author','2022-10-15 13:57:15','2022-10-15 13:57:15'),(58,'milford-simonis',7,'Botble\\Member\\Models\\Member','author','2022-10-15 13:57:15','2022-10-15 13:57:15'),(59,'jailyn-deckow',8,'Botble\\Member\\Models\\Member','author','2022-10-15 13:57:15','2022-10-15 13:57:15'),(60,'cristobal-hand',9,'Botble\\Member\\Models\\Member','author','2022-10-15 13:57:15','2022-10-15 13:57:15'),(61,'susana-schuster',10,'Botble\\Member\\Models\\Member','author','2022-10-15 13:57:15','2022-10-15 13:57:15'),(62,'icie-ankunding',11,'Botble\\Member\\Models\\Member','author','2022-10-15 13:57:15','2022-10-15 13:57:15'),(63,'editors-picked',1,'Botble\\Page\\Models\\Page','','2022-10-15 13:57:17','2022-10-15 13:57:17'),(64,'recommended-posts',2,'Botble\\Page\\Models\\Page','','2022-10-15 13:57:17','2022-10-15 13:57:17'),(65,'bai-viet-hay',3,'Botble\\Page\\Models\\Page','','2022-10-15 13:57:17','2022-10-15 13:57:17'),(66,'recommended-posts',4,'Botble\\Page\\Models\\Page','','2022-10-15 13:57:17','2022-10-15 13:57:17');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User','','published','2022-10-15 13:57:12','2022-10-15 13:57:12'),(2,'Beauty',1,'Botble\\ACL\\Models\\User','','published','2022-10-15 13:57:12','2022-10-15 13:57:12'),(3,'Fashion',1,'Botble\\ACL\\Models\\User','','published','2022-10-15 13:57:12','2022-10-15 13:57:12'),(4,'Lifestyle',1,'Botble\\ACL\\Models\\User','','published','2022-10-15 13:57:12','2022-10-15 13:57:12'),(5,'Travel',1,'Botble\\ACL\\Models\\User','','published','2022-10-15 13:57:12','2022-10-15 13:57:12'),(6,'Business',1,'Botble\\ACL\\Models\\User','','published','2022-10-15 13:57:12','2022-10-15 13:57:12'),(7,'Health',1,'Botble\\ACL\\Models\\User','','published','2022-10-15 13:57:12','2022-10-15 13:57:12');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
INSERT INTO `tags_translations` VALUES ('vi',1,'Chung',NULL),('vi',2,'Làm đẹp',NULL),('vi',3,'Thời trang',NULL),('vi',4,'Du lịch và ẩm thực',NULL),('vi',5,'Kinh doanh',NULL),('vi',6,'Sức khỏe',NULL),('vi',7,'Thời sự',NULL);
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@thesky9.com',NULL,'$2y$10$7Hyby8m.ojXKSexuyIAIruALCGkxKp8ZdnECv/uOmE6FSZiflPuGG',NULL,'2022-10-15 13:57:00','2022-10-15 13:57:00','System','Admin','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'SocialsWidget','primary_sidebar','ultra',0,'{\"id\":\"SocialsWidget\",\"title\":\"Follow us\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(2,'AdsWidget','primary_sidebar','ultra',0,'{\"id\":\"AdsWidget\",\"ads_location\":\"top-sidebar-ads\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(3,'CategoriesMenuWidget','primary_sidebar','ultra',0,'{\"id\":\"CategoriesMenuWidget\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(4,'LastestPostsWidget','primary_sidebar','ultra',0,'{\"id\":\"LastestPostsWidget\",\"name\":\"Lastest Post\",\"number_display\":6}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(5,'TagsWidget','primary_sidebar','ultra',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"number_display\":10}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(6,'AdsWidget','primary_sidebar','ultra',1,'{\"id\":\"AdsWidget\",\"ads_location\":\"bottom-sidebar-ads\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(7,'AboutWidget','footer_sidebar_1','ultra',1,'{\"id\":\"AboutWidget\",\"name\":\"About me\",\"description\":\"Introduction about the author of this blog. You should write because you love the shape of stories and sentences and the creation of different words on a page. Writing comes from reading, and reading is the finest teacher of how to write.\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(8,'PopularPostsWidget','footer_sidebar_2','ultra',1,'{\"id\":\"PopularPostsWidget\",\"name\":\"Popular Posts\",\"name_custom_class\":\"color-white\",\"number_display\":3}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(9,'CustomMenuWidget','footer_sidebar_3','ultra',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(10,'TagsWidget','footer_sidebar_3','ultra',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"name_custom_class\":\"color-white\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(11,'NewsletterWidget','footer_sidebar_4','ultra',1,'{\"id\":\"NewsletterWidget\",\"name\":\"Newsletter\",\"description\":\"Subscribe to Our Newsletter\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(12,'CopyrightFooterMenuWidget','footer_copyright_menu','ultra',1,'{\"id\":\"CopyrightFooterMenuWidget\",\"name\":\"Copyright footer Menu\",\"menu_id\":\"quick-links\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(13,'SocialsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"SocialsWidget\",\"title\":\"Follow us\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(14,'AdsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"AdsWidget\",\"ads_location\":\"top-sidebar-ads\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(15,'CategoriesMenuWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"CategoriesMenuWidget\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(16,'LastestPostsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"LastestPostsWidget\",\"name\":\"B\\u00e0i vi\\u1ebft m\\u1edbi nh\\u1ea5t\",\"number_display\":6}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(17,'TagsWidget','primary_sidebar','ultra-vi',1,'{\"id\":\"TagsWidget\",\"name\":\"Th\\u1ebb\",\"number_display\":10}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(18,'AdsWidget','primary_sidebar','ultra-vi',1,'{\"id\":\"AdsWidget\",\"ads_location\":\"bottom-sidebar-ads\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(19,'AboutWidget','footer_sidebar_1','ultra-vi',1,'{\"id\":\"AboutWidget\",\"name\":\"V\\u1ec1 ch\\u00fang t\\u00f4i\",\"description\":\"Introduction about the author of this blog. You should write because you love the shape of stories and sentences and the creation of different words on a page. Writing comes from reading, and reading is the finest teacher of how to write.\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(20,'PopularPostsWidget','footer_sidebar_2','ultra-vi',1,'{\"id\":\"PopularPostsWidget\",\"name\":\"N\\u1ed5i b\\u1eadt\",\"name_custom_class\":\"color-white\",\"number_display\":3}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(21,'CustomMenuWidget','footer_sidebar_3','ultra-vi',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(22,'TagsWidget','footer_sidebar_3','ultra-vi',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"name_custom_class\":\"color-white\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(23,'NewsletterWidget','footer_sidebar_4','ultra-vi',1,'{\"id\":\"NewsletterWidget\",\"name\":\"Newsletter\",\"description\":\"Subscribe to Our Newsletter\"}','2022-10-15 13:57:16','2022-10-15 13:57:16'),(24,'CopyrightFooterMenuWidget','footer_copyright_menu','ultra-vi',1,'{\"id\":\"CopyrightFooterMenuWidget\",\"name\":\"Copyright footer Menu\",\"menu_id\":\"quick-links\"}','2022-10-15 13:57:16','2022-10-15 13:57:16');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-15 21:16:40
