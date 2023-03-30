-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: car_dealership
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `stamp` varchar(50) DEFAULT NULL,
  `country_of_origin` enum('UK','GR','USA','RU') DEFAULT 'UK',
  `country_of_use` enum('UK','RU') DEFAULT 'RU',
  `year_of_release` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,' \'opel\'','GR','UK','1973-03-25 22:44:58'),(2,' \'toyota\'','GR','UK','2009-01-26 01:42:08'),(3,' \'opel\'','UK','UK','1994-04-30 14:14:13'),(4,' \'opel\'','RU','UK','1971-07-29 17:48:22'),(5,' \'patriot\'','RU','UK','2001-01-19 12:20:11'),(6,' \'toyota\'','RU','RU','2008-02-26 06:48:54'),(7,' \'patriot\'','RU','RU','1985-07-16 18:13:00'),(8,'\'audi\'','GR','UK','2000-04-24 00:28:03'),(9,' \'opel\'','GR','UK','2007-03-25 19:29:49'),(10,' \'patriot\'','GR','UK','1997-03-03 08:19:22');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `car_id` bigint unsigned NOT NULL,
  `value` text,
  `rank` int DEFAULT NULL,
  `read` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `car_id` (`car_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,11,1,'Eum quisquam ratione facere. Incidunt sit ut nam. Voluptatem sapiente pariatur totam nihil quis voluptate.',1,'1'),(2,12,2,'Beatae nemo nulla est aut aperiam sint dignissimos. Cum delectus eligendi et voluptas eum quasi at eos. Provident quibusdam voluptates quam reprehenderit enim. Dignissimos aut sed nihil officiis sit numquam in. Minima nobis quia sed cupiditate ullam.',6,'1'),(3,13,3,'Cumque pariatur omnis velit laboriosam sit. Quas illum id itaque. Quo sit eveniet nobis consectetur culpa. Repudiandae eius veniam voluptatem neque voluptatum amet. Consequatur velit aliquid quibusdam et.',5,'1'),(4,14,4,'Perferendis in ut alias vitae. Nihil a modi sapiente dolor ducimus ex.',3,'1'),(5,15,5,'Officiis repellendus nam occaecati est error maxime. Voluptatem et debitis doloribus facilis id. Et dolorum ut quam asperiores error. Consequatur sunt est aut dolores cupiditate qui doloremque.',10,''),(6,17,6,'Et cumque eveniet quo est illum ipsam. Velit cumque voluptas esse rem consequatur. Voluptatum facilis dolor laborum nostrum adipisci nam. Aperiam accusantium optio rerum at et fugiat voluptas.',10,''),(7,18,7,'Ea et dignissimos quia est assumenda non. Exercitationem et voluptas cumque omnis et nisi. Vel quisquam doloribus laboriosam laborum voluptas.',9,'1'),(8,19,8,'Dolorem tempora eum dicta illum qui in dolore maiores. Consequatur dolor autem ipsum adipisci distinctio non. Illo maxime optio suscipit eaque ipsam. Qui minima sunt error mollitia. Et minima laudantium reprehenderit distinctio.',6,''),(9,20,9,'Quidem voluptatem neque laboriosam excepturi facilis dicta. Est ipsum ex laudantium consectetur sed possimus nulla. Qui cumque vero ullam cum corporis voluptatem dolore.',1,'1'),(10,11,10,'Libero harum voluptas molestiae voluptates beatae perferendis. Nobis doloribus ipsum ipsa dolore. Quis omnis est enim non. Impedit molestias beatae labore distinctio qui qui. Delectus autem impedit voluptas assumenda eaque enim ducimus sit.',10,'1');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint unsigned NOT NULL,
  `car_id` bigint unsigned NOT NULL,
  `body` text,
  `filename` varchar(255) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `car_id` (`car_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Sunt id sunt adipisci repudiandae mollitia. Nemo enim sit consequatur consequatur assumenda voluptas. Quia facilis corporis at cumque odio.','ut',4977,'2006-12-16 04:12:37','2000-04-05 14:52:41'),(2,2,2,'Dolorem amet quod quibusdam voluptas cum nostrum. Eos qui pariatur ex dignissimos quos quae rerum. Fugit doloremque reprehenderit est consequuntur dolorem soluta veritatis ea.','perferendis',1941,'1984-06-04 18:46:18','1973-08-06 21:00:51'),(3,3,3,'Aspernatur dolorem error dolore pariatur sit perspiciatis id. Corporis reiciendis exercitationem tenetur quia sapiente animi temporibus. Molestiae ad voluptatem ex tenetur est quo.','quos',1229,'2006-02-07 16:07:20','1988-02-16 12:09:30'),(4,4,4,'Quidem minus incidunt quos qui pariatur. A adipisci id est nemo alias quia et ea. Ut ullam ducimus culpa aut ut ut voluptatem. Asperiores quis autem tenetur aut.','et',2733,'2003-12-31 19:49:12','1984-11-05 19:42:33'),(5,5,5,'Odio est a est. Aut magni impedit ullam aut et sed. Eum nostrum ex ex illum et odit tenetur. Magnam quia culpa voluptatem et eius.','et',3561,'2015-01-09 17:22:53','2020-12-12 20:27:09'),(6,6,6,'Ex voluptas optio aut voluptate veritatis et. Assumenda architecto itaque minima et dolorem et ut. Eos quia voluptas et libero et sit. Soluta eos optio recusandae sint suscipit sunt commodi.','nihil',1553,'1994-03-29 01:03:48','2001-09-13 08:34:20'),(7,7,7,'Perspiciatis voluptas eos maxime deleniti dolor molestias. Saepe sit officiis rem aut minus dolores voluptatem. Ea possimus neque repudiandae quo. Non ab velit voluptatum.','nihil',844,'2007-06-24 22:01:05','2020-08-05 23:54:10'),(8,8,8,'Quod placeat enim et optio quo et nam. Aut impedit soluta consequatur consequatur.','corporis',3337,'2013-02-16 14:02:08','2013-10-27 16:21:00'),(9,9,9,'Iure quo vel illo tempore. Nihil quasi ipsa quia harum totam laborum. Error quo sit neque incidunt voluptatum laborum iure magnam. Voluptatem perferendis porro nulla deleniti fugit.','vitae',914,'2007-08-14 17:00:23','1977-11-06 03:39:46'),(10,10,10,'Sit aut iure aspernatur maiores eaque dolor. Est modi dolor nisi error aut aliquam aliquid. Et earum nulla vel officiis aliquam qui.','aut',2918,'1978-09-04 08:20:36','2016-11-05 14:53:45');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,' mp4','2012-09-21 03:27:43'),(2,'mp3','1985-08-25 05:30:06'),(3,'mp3','1993-02-19 13:35:06'),(4,' png','2011-09-05 11:24:54'),(5,' jpg','1992-04-30 06:06:45'),(6,' png','1991-09-27 21:07:42'),(7,' png','1971-08-11 14:18:55'),(8,' png','2020-02-27 10:02:38'),(9,' jpg','1991-03-02 21:54:10'),(10,' png','1990-07-18 20:29:05');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `value` text,
  `is_delivered` tinyint(1) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,11,'Qui sit ut animi officiis. Cumque esse occaecati qui aspernatur. Praesentium placeat vero accusamus dolor debitis debitis. Aut deleniti est sed assumenda et.',0,'2010-02-23 21:56:29'),(2,12,'Sed aut ut omnis fugit vel consectetur sequi. Unde impedit ab sed. Nihil molestiae maxime cupiditate possimus.',1,'2013-12-01 01:56:37'),(3,13,'Saepe excepturi in quas nobis laboriosam tempora modi. Aut inventore ut possimus consequatur error in facilis.',0,'2000-01-16 07:14:20'),(4,14,'Nihil ea ratione consequatur libero velit ad. Excepturi qui tenetur et quia sit. Voluptas unde corrupti libero omnis delectus accusamus.',1,'1990-12-09 05:12:51'),(5,15,'Ex beatae voluptatibus commodi nostrum. Rerum facere laborum maiores aut porro occaecati. Possimus cupiditate ratione architecto et. Ea voluptas voluptatem itaque necessitatibus nihil dolorum qui. Illum accusantium deleniti voluptatem facilis ipsa placeat.',0,'1982-11-26 09:29:27'),(6,17,'Qui fugit deserunt non cumque autem excepturi magnam. Iste aut dolores consectetur aspernatur itaque. Dicta ad sunt assumenda vel. Excepturi sapiente non occaecati accusamus velit odit assumenda.',1,'1988-02-09 12:09:59'),(7,18,'Quo voluptas laudantium et est. Natus soluta laboriosam vel reprehenderit. Et modi qui est officiis ad quas.',1,'1982-11-02 18:46:21'),(8,19,'Est aspernatur impedit quisquam est et mollitia ut. Sapiente ut sint facere.',1,'1998-12-20 01:59:58'),(9,20,'Sed veniam est iste aut rerum earum ratione. Reprehenderit rerum et voluptatem ut occaecati. Eaque et sit dicta voluptas. Quis quo nobis natus.',1,'2012-09-24 16:57:09'),(10,11,'Quia totam quod velit voluptates sed iure eos. Et doloremque cum porro illo fugit odio dolorem. Fugit ea ut cumque dolorem accusamus quis omnis minus. Voluptatem perferendis error perspiciatis et placeat consequatur neque.',1,'1996-10-23 11:51:22');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `car_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `order_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `paid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `car_id` (`car_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,11,'1998-04-30 17:02:29',1),(2,2,12,'1993-10-29 11:02:41',1),(3,3,13,'1990-10-05 18:15:42',0),(4,4,14,'2021-07-11 03:16:16',1),(5,5,15,'1980-05-07 20:58:13',0),(6,6,17,'2007-07-10 20:05:35',1),(7,7,18,'1974-08-06 01:14:47',1),(8,8,19,'2022-02-07 08:46:43',1),(9,9,20,'1994-08-28 14:09:07',0),(10,10,11,'1974-10-28 16:12:08',0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preference`
--

DROP TABLE IF EXISTS `preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preference` (
  `car_id` bigint unsigned NOT NULL,
  `price` bigint DEFAULT NULL,
  `model` varchar(50) NOT NULL,
  `fuel` varchar(50) NOT NULL,
  `colour` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `class` char(1) DEFAULT NULL COMMENT 'класс',
  `equipment` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`car_id`),
  CONSTRAINT `preference_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preference`
--

LOCK TABLES `preference` WRITE;
/*!40000 ALTER TABLE `preference` DISABLE KEYS */;
INSERT INTO `preference` VALUES (1,74047477,'\'camry\'',' \'diesel\'',' \'green\'','\'hatchbag\'','\'','\'1/3\'','Rem quidem ut consequatur et ut. Et id sit et itaque officia incidunt. Est dolores quia rerum fuga. Consequatur consequatur qui error.'),(2,17681101,' \'p300\'','\'petrol\'','\'red\'','\'hatchbag\'','\'',' \'2/3\'','Odio inventore sed dolore. Unde necessitatibus consectetur voluptatem non omnis. Ad ea excepturi repudiandae cupiditate consequuntur quia.'),(3,81094852,' \'A1\'','\'petrol\'','\'red\'','\'hatchbag\'','\'',' \'2/3\'','Odit impedit iusto enim cum esse reprehenderit optio. Fuga eum non neque et occaecati. Iste est omnis maiores aliquid voluptatem voluptas.'),(4,44840956,' \'p300\'',' \'diesel\'',' \'green\'',' \'sedan\'','\'','\'1/3\'','Autem necessitatibus qui voluptatibus delectus qui nam dicta. Voluptas omnis est ea esse eos dolor. Quae cum eos doloremque est. Dolore in qui explicabo natus iusto quia.'),(5,15566932,' \'p300\'',' \'diesel\'','\'red\'','\'hatchbag\'','\'','\'1/3\'','Voluptatem laudantium eveniet rem nisi reiciendis voluptatibus corrupti a. Aperiam itaque nostrum non sit voluptatem nisi temporibus. Ut autem qui consequuntur rerum sapiente rerum eveniet.'),(6,84205599,' \'A1\'',' \'diesel\'','\'red\'','\'hatchbag\'','\'','\'1/3\'','Molestiae voluptatem consequatur eligendi. A deserunt ab est. Qui explicabo veniam corporis vel dolores. Blanditiis in consequuntur est aut qui.'),(7,78260564,'\'camry\'','\'petrol\'',' \'green\'','\'hatchbag\'','\'',' \'2/3\'','Expedita iure voluptatem est eum ut. Sunt amet aspernatur qui. Provident aut optio occaecati a recusandae. Voluptatem accusantium in totam et doloribus numquam.'),(8,60744104,' \'A1\'','\'petrol\'',' \'green\'','\'hatchbag\'','\'','\'1/3\'','Hic et assumenda et molestiae et similique nobis. Et qui deleniti voluptate soluta ut cupiditate. Officia qui quia nesciunt modi vero.'),(9,20356308,' \'A1\'',' \'diesel\'',' \'green\'','\'hatchbag\'','\'',' \'2/3\'','Tempore corporis corrupti sapiente. Ipsa qui nam quaerat error. Ullam suscipit eveniet ut. Quae non eaque facere est rerum est. Sunt quis numquam cupiditate vel maiores similique nesciunt est.'),(10,47132557,' \'p300\'','\'petrol\'','\'red\'',' \'sedan\'','\'','\'1/3\'','Dicta suscipit ut consequatur deleniti nulla. Aut sit fugit laboriosam. Molestiae eveniet et sed corporis possimus velit. Perferendis minus ut sunt quod debitis nostrum aut.');
/*!40000 ALTER TABLE `preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `user_id` bigint unsigned NOT NULL,
  `post` varchar(50) DEFAULT NULL,
  `salary` bigint DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (11,' salesman',38976,'Consequatur ab qui praesentium ut animi et. Iste deleniti perferendis sint. Eos esse aliquam velit et perferendis impedit non.'),(12,'mechanic',50311,'Aut qui unde quis rerum corporis enim aliquid. Necessitatibus incidunt tenetur minima ducimus quod rerum. Ullam reiciendis repellendus illum dignissimos fugit et.'),(13,' salesman',32102,'At voluptatem veritatis fugiat minima eveniet fugit eaque. Velit necessitatibus maxime iure quisquam ratione sed. Voluptatem non sed consequuntur et aperiam voluptatem occaecati.'),(14,' marketing specialist',57694,'Nam dicta praesentium aut. Et et repellat est eum mollitia voluptatem et. Quas enim tenetur nostrum quo non assumenda. Placeat laboriosam doloribus numquam voluptatum.'),(15,'mechanic',82906,'Doloremque fugiat itaque facere. Maxime blanditiis ad omnis. Est quia magni aliquid nisi veniam laboriosam aliquid.');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_chat`
--

DROP TABLE IF EXISTS `support_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_chat` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `support_id` bigint unsigned NOT NULL,
  `message_id` bigint unsigned NOT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_id` (`support_id`),
  KEY `message_id` (`message_id`),
  CONSTRAINT `support_chat_ibfk_1` FOREIGN KEY (`support_id`) REFERENCES `staff` (`user_id`),
  CONSTRAINT `support_chat_ibfk_2` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_chat`
--

LOCK TABLES `support_chat` WRITE;
/*!40000 ALTER TABLE `support_chat` DISABLE KEYS */;
INSERT INTO `support_chat` VALUES (11,11,1,1),(12,12,2,1),(13,13,3,0),(14,14,4,1),(15,15,5,0),(20,11,10,1);
/*!40000 ALTER TABLE `support_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `country` enum('UK','GR','USA','RU') DEFAULT 'UK',
  `birthday` datetime DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(120) DEFAULT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (11,'Jonathan','McLaughlin','GR','2016-11-14 02:08:28','tiara19@example.net',0),(12,'Bernadine','Franecki','GR','1998-07-02 15:34:45','coby.mcglynn@example.com',241074),(13,'Antonietta','Dickinson','UK','1972-10-02 10:57:04','wkuvalis@example.net',63),(14,'Liliana','Kozey','GR','1978-12-23 00:40:31','kutch.adalberto@example.org',706),(15,'Marquis','Lubowitz','USA','1996-02-14 02:56:47','marshall99@example.org',898783),(17,'Jenifer','Jakubowski','GR','2021-09-16 22:17:46','rkrajcik@example.com',278),(18,'Anastasia','Little','USA','2000-03-23 00:07:22','hmurray@example.org',6460864345),(19,'Lilla','Wilkinson','USA','1989-07-13 03:17:08','flittel@example.com',3347),(20,'Mireille','Halvorson','RU','2012-07-06 21:46:40','jedidiah27@example.com',514464);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'car_dealership'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-29 20:30:51
