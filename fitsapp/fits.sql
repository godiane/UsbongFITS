-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: mysql.server    Database: usbong$fits
-- ------------------------------------------------------
-- Server version	5.1.63-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(75) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_4aacde5e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,1,'di.gonzales@gmail.com',0,0),(2,5,'masarapmabuhay@gmail.com',1,1);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `sent` datetime DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirmation_a659cab3` (`email_address_id`),
  CONSTRAINT `email_address_id_refs_id_6ea1eea3` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
INSERT INTO `account_emailconfirmation` VALUES (1,1,'2013-08-06 16:36:08',NULL,'fa257d2610ba472d8d5e13531920dc727998741060f97718e60bfb250a43e61c'),(2,2,'2013-08-06 16:36:37',NULL,'5fc83dfe130643ab8f427a85c9ce83b126e5d0f3f363c6f394c0e37c3e7670b0'),(3,1,'2013-08-06 16:37:53',NULL,'22f8cdf40f3da7af652cfa5064e7d63b3fd6d6da977419087274f3ac706e8254'),(4,4,'2013-08-18 16:14:27',NULL,'6b24e6ed467524ee1d5dd2989b55b03029426a721a714bf46b534fc82c8d0c9e');
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_a7792de1` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_9af0b65a` (`user_id`),
  CONSTRAINT `user_id_refs_id_9af0b65a` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add redirect',6,'add_redirect'),(17,'Can change redirect',6,'change_redirect'),(18,'Can delete redirect',6,'delete_redirect'),(19,'Can add session',7,'add_session'),(20,'Can change session',7,'change_session'),(21,'Can delete session',7,'delete_session'),(22,'Can add site',8,'add_site'),(23,'Can change site',8,'change_site'),(24,'Can delete site',8,'delete_site'),(25,'Can add Setting',9,'add_setting'),(26,'Can change Setting',9,'change_setting'),(27,'Can delete Setting',9,'delete_setting'),(28,'Can add Site permission',10,'add_sitepermission'),(29,'Can change Site permission',10,'change_sitepermission'),(30,'Can delete Site permission',10,'delete_sitepermission'),(31,'Can add Comment',11,'add_threadedcomment'),(32,'Can change Comment',11,'change_threadedcomment'),(33,'Can delete Comment',11,'delete_threadedcomment'),(34,'Can add Keyword',12,'add_keyword'),(35,'Can change Keyword',12,'change_keyword'),(36,'Can delete Keyword',12,'delete_keyword'),(37,'Can add assigned keyword',13,'add_assignedkeyword'),(38,'Can change assigned keyword',13,'change_assignedkeyword'),(39,'Can delete assigned keyword',13,'delete_assignedkeyword'),(40,'Can add Rating',14,'add_rating'),(41,'Can change Rating',14,'change_rating'),(42,'Can delete Rating',14,'delete_rating'),(43,'Can add Blog post',15,'add_blogpost'),(44,'Can change Blog post',15,'change_blogpost'),(45,'Can delete Blog post',15,'delete_blogpost'),(46,'Can add Blog Category',16,'add_blogcategory'),(47,'Can change Blog Category',16,'change_blogcategory'),(48,'Can delete Blog Category',16,'delete_blogcategory'),(49,'Can add Form',17,'add_form'),(50,'Can change Form',17,'change_form'),(51,'Can delete Form',17,'delete_form'),(52,'Can add Field',18,'add_field'),(53,'Can change Field',18,'change_field'),(54,'Can delete Field',18,'delete_field'),(55,'Can add Form entry',19,'add_formentry'),(56,'Can change Form entry',19,'change_formentry'),(57,'Can delete Form entry',19,'delete_formentry'),(58,'Can add Form field entry',20,'add_fieldentry'),(59,'Can change Form field entry',20,'change_fieldentry'),(60,'Can delete Form field entry',20,'delete_fieldentry'),(61,'Can add Page',21,'add_page'),(62,'Can change Page',21,'change_page'),(63,'Can delete Page',21,'delete_page'),(64,'Can add Rich text page',22,'add_richtextpage'),(65,'Can change Rich text page',22,'change_richtextpage'),(66,'Can delete Rich text page',22,'delete_richtextpage'),(67,'Can add Link',23,'add_link'),(68,'Can change Link',23,'change_link'),(69,'Can delete Link',23,'delete_link'),(70,'Can add Gallery',24,'add_gallery'),(71,'Can change Gallery',24,'change_gallery'),(72,'Can delete Gallery',24,'delete_gallery'),(73,'Can add Image',25,'add_galleryimage'),(74,'Can change Image',25,'change_galleryimage'),(75,'Can delete Image',25,'delete_galleryimage'),(76,'Can add Twitter query',26,'add_query'),(77,'Can change Twitter query',26,'change_query'),(78,'Can delete Twitter query',26,'delete_query'),(79,'Can add Tweet',27,'add_tweet'),(80,'Can change Tweet',27,'change_tweet'),(81,'Can delete Tweet',27,'delete_tweet'),(82,'Can add migration history',28,'add_migrationhistory'),(83,'Can change migration history',28,'change_migrationhistory'),(84,'Can delete migration history',28,'delete_migrationhistory'),(85,'Can add log entry',29,'add_logentry'),(86,'Can change log entry',29,'change_logentry'),(87,'Can delete log entry',29,'delete_logentry'),(88,'Can add comment',30,'add_comment'),(89,'Can change comment',30,'change_comment'),(90,'Can delete comment',30,'delete_comment'),(91,'Can moderate comments',30,'can_moderate'),(92,'Can add comment flag',31,'add_commentflag'),(93,'Can change comment flag',31,'change_commentflag'),(94,'Can delete comment flag',31,'delete_commentflag'),(95,'Can add email address',32,'add_emailaddress'),(96,'Can change email address',32,'change_emailaddress'),(97,'Can delete email address',32,'delete_emailaddress'),(98,'Can add email confirmation',33,'add_emailconfirmation'),(99,'Can change email confirmation',33,'change_emailconfirmation'),(100,'Can delete email confirmation',33,'delete_emailconfirmation'),(101,'Can add social app',34,'add_socialapp'),(102,'Can change social app',34,'change_socialapp'),(103,'Can delete social app',34,'delete_socialapp'),(104,'Can add social account',35,'add_socialaccount'),(105,'Can change social account',35,'change_socialaccount'),(106,'Can delete social account',35,'delete_socialaccount'),(107,'Can add social token',36,'add_socialtoken'),(108,'Can change social token',36,'change_socialtoken'),(109,'Can delete social token',36,'delete_socialtoken'),(110,'Can add Media Library',37,'add_medialibrary'),(111,'Can change Media Library',37,'change_medialibrary'),(112,'Can delete Media Library',37,'delete_medialibrary'),(113,'Can add Media File',38,'add_mediafile'),(114,'Can change Media File',38,'change_mediafile'),(115,'Can delete Media File',38,'delete_mediafile'),(116,'Can add document',39,'add_document'),(117,'Can change document',39,'change_document'),(118,'Can delete document',39,'delete_document');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'usbong','','','usbong.evangelist@gmail.com','pbkdf2_sha256$10000$iu5HIF31FFI3$JoFjQauIrLkNXMkdT9fRINXheGz+ETpy45uW3KbNbBE=',1,1,1,'2013-08-18 16:13:20','2013-07-07 10:53:46'),(2,'diana','Diana Jayne','Gonzales','di.gonzales@gmail.com','pbkdf2_sha256$10000$WYob0PIe0Wt4$NTISgAcJT24KHGy7w0B4uAu+7gRp2UzukqU3Vvme4kU=',0,1,0,'2013-07-15 16:34:01','2013-07-15 16:34:01'),(3,'godiane','Diana Jayne','Gonzales','','!',0,1,0,'2013-08-24 02:00:18','2013-07-15 16:47:48'),(4,'smeagins','smeagol','baggins','ishmeagol@hotmail.com','pbkdf2_sha256$10000$mhwUZaKcxIEe$f5ajeL7dvdxNhmVcEzKMYE3hInuKUDkjXs24czMK1Og=',0,1,0,'2013-07-16 21:20:51','2013-07-16 21:20:50'),(5,'test','a','b','j@c.com','pbkdf2_sha256$10000$71yco6esSkyp$QsUHNNbJLxG0jdXQmpHmomA6zKqd0ZUgZUPG8nAtQfo=',0,1,0,'2013-07-18 11:56:40','2013-07-18 11:56:40'),(6,'iamteem','Tim','Medina','iamteem@gmail.com','pbkdf2_sha256$10000$DJlbM6kxdjM4$SBvGbL5n2bq+ZT8pXUaRMn26d3El+kAS4pBf//nWXQE=',0,1,0,'2013-07-18 12:07:32','2013-07-18 12:07:32'),(7,'user','Diana Jayne','Gonzales','','!',0,1,0,'2013-08-08 06:43:49','2013-07-19 03:36:12'),(8,'testaccount','Test','Account','test@account.com','pbkdf2_sha256$10000$2XlJFpWQgt9e$h1J23/6mC7+UM1Zktt/Mom3TzDYEX9FjPGcBwlEbhP0=',0,1,0,'2013-07-19 03:40:48','2013-07-19 03:40:48'),(9,'masarapmabuhay','Michael','Syson','masarapmabuhay@gmail.com','!',0,1,0,'2013-08-12 14:07:05','2013-08-12 14:07:04'),(10,'dianarisse','','','dianarisse@gmail.com','pbkdf2_sha256$10000$tBr19X2zGcZi$vuNBFM54FZZhPz3yZT+IWaQgGs4qmhb0exNc37GF2uE=',0,1,0,'2013-08-18 16:14:53','2013-08-18 16:14:27');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f0ee9890` (`group_id`),
  CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`),
  CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogcategory`
--

DROP TABLE IF EXISTS `blog_blogcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `slug` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id_refs_id_5db8f583` (`site_id`),
  CONSTRAINT `site_id_refs_id_5db8f583` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogcategory`
--

LOCK TABLES `blog_blogcategory` WRITE;
/*!40000 ALTER TABLE `blog_blogcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_blogcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogpost`
--

DROP TABLE IF EXISTS `blog_blogpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogpost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments_count` int(11) NOT NULL,
  `keywords_string` varchar(500) NOT NULL,
  `rating_count` int(11) NOT NULL,
  `rating_sum` int(11) NOT NULL,
  `rating_average` double NOT NULL,
  `site_id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `slug` varchar(2000) DEFAULT NULL,
  `_meta_title` varchar(500) DEFAULT NULL,
  `description` longtext NOT NULL,
  `gen_description` tinyint(1) NOT NULL,
  `status` int(11) NOT NULL,
  `publish_date` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `short_url` varchar(200) DEFAULT NULL,
  `in_sitemap` tinyint(1) NOT NULL,
  `content` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_6020e4f0` (`user_id`),
  KEY `site_id_refs_id_72f12b99` (`site_id`),
  CONSTRAINT `site_id_refs_id_72f12b99` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `user_id_refs_id_6020e4f0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogpost`
--

LOCK TABLES `blog_blogpost` WRITE;
/*!40000 ALTER TABLE `blog_blogpost` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_blogpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogpost_categories`
--

DROP TABLE IF EXISTS `blog_blogpost_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogpost_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blogpost_id` int(11) NOT NULL,
  `blogcategory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogpost_id` (`blogpost_id`,`blogcategory_id`),
  KEY `blogcategory_id_refs_id_e7402db1` (`blogcategory_id`),
  CONSTRAINT `blogcategory_id_refs_id_e7402db1` FOREIGN KEY (`blogcategory_id`) REFERENCES `blog_blogcategory` (`id`),
  CONSTRAINT `blogpost_id_refs_id_d4f4848f` FOREIGN KEY (`blogpost_id`) REFERENCES `blog_blogpost` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogpost_categories`
--

LOCK TABLES `blog_blogpost_categories` WRITE;
/*!40000 ALTER TABLE `blog_blogpost_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_blogpost_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogpost_related_posts`
--

DROP TABLE IF EXISTS `blog_blogpost_related_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogpost_related_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_blogpost_id` int(11) NOT NULL,
  `to_blogpost_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_blogpost_id` (`from_blogpost_id`,`to_blogpost_id`),
  KEY `to_blogpost_id_refs_id_413362e3` (`to_blogpost_id`),
  CONSTRAINT `to_blogpost_id_refs_id_413362e3` FOREIGN KEY (`to_blogpost_id`) REFERENCES `blog_blogpost` (`id`),
  CONSTRAINT `from_blogpost_id_refs_id_413362e3` FOREIGN KEY (`from_blogpost_id`) REFERENCES `blog_blogpost` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogpost_related_posts`
--

LOCK TABLES `blog_blogpost_related_posts` WRITE;
/*!40000 ALTER TABLE `blog_blogpost_related_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_blogpost_related_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_setting`
--

DROP TABLE IF EXISTS `conf_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conf_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id_refs_id_358fae2a` (`site_id`),
  CONSTRAINT `site_id_refs_id_358fae2a` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_setting`
--

LOCK TABLES `conf_setting` WRITE;
/*!40000 ALTER TABLE `conf_setting` DISABLE KEYS */;
INSERT INTO `conf_setting` VALUES (1,1,'GOOGLE_ANALYTICS_ID',''),(2,1,'SEARCH_PER_PAGE','10'),(3,1,'COMMENTS_NUM_LATEST','5'),(4,1,'COMMENTS_ACCOUNT_REQUIRED','False'),(5,1,'RICHTEXT_FILTER_LEVEL','1'),(6,1,'COMMENTS_UNAPPROVED_VISIBLE','True'),(7,1,'SITE_TAGLINE','Usbong\'s Forest in the Sky'),(8,1,'TWITTER_DEFAULT_QUERY_TYPE','search'),(9,1,'COMMENTS_REMOVED_VISIBLE','True'),(10,1,'TWITTER_DEFAULT_NUM_TWEETS','3'),(11,1,'SSL_ENABLED','False'),(12,1,'AKISMET_API_KEY',''),(13,1,'COMMENTS_DEFAULT_APPROVED','True'),(15,1,'TWITTER_DEFAULT_QUERY','usbong'),(16,1,'SITE_TITLE','Usbong FITS'),(17,1,'BLOG_POST_PER_PAGE','5'),(18,1,'COMMENTS_NOTIFICATION_EMAILS',''),(19,1,'COMMENTS_DISQUS_API_PUBLIC_KEY',''),(20,1,'COMMENTS_DISQUS_API_SECRET_KEY',''),(22,1,'MAX_PAGING_LINKS','10'),(23,1,'TAG_CLOUD_SIZES','4'),(24,1,'COMMENTS_DISQUS_SHORTNAME',''),(25,1,'SSL_FORCE_HOST','');
/*!40000 ALTER TABLE `conf_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sitepermission`
--

DROP TABLE IF EXISTS `core_sitepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_sitepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_b319fa2a` (`user_id`),
  CONSTRAINT `user_id_refs_id_b319fa2a` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sitepermission`
--

LOCK TABLES `core_sitepermission` WRITE;
/*!40000 ALTER TABLE `core_sitepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_sitepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sitepermission_sites`
--

DROP TABLE IF EXISTS `core_sitepermission_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_sitepermission_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sitepermission_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sitepermission_id` (`sitepermission_id`,`site_id`),
  KEY `site_id_refs_id_573d8999` (`site_id`),
  CONSTRAINT `sitepermission_id_refs_id_980f2d26` FOREIGN KEY (`sitepermission_id`) REFERENCES `core_sitepermission` (`id`),
  CONSTRAINT `site_id_refs_id_573d8999` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sitepermission_sites`
--

LOCK TABLES `core_sitepermission_sites` WRITE;
/*!40000 ALTER TABLE `core_sitepermission_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_sitepermission_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_c8665aa` (`user_id`),
  KEY `content_type_id_refs_id_288599e6` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-07-15 01:42:37',1,23,'2','Sign Up',1,''),(2,'2013-07-15 01:44:18',1,17,'3','Upload',1,''),(3,'2013-07-15 16:18:24',1,34,'1','Usbong on Facebook',1,''),(4,'2013-07-17 00:47:12',1,21,'2','Sign Up',3,''),(5,'2013-07-17 00:56:24',1,17,'3','Upload',2,'Changed login_required.'),(6,'2013-07-19 03:33:18',1,34,'2','Usbong on Google',1,''),(7,'2013-07-19 03:35:53',1,34,'2','Usbong on Google',2,'No fields changed.'),(8,'2013-07-23 22:53:46',1,23,'4','Login',1,''),(9,'2013-07-23 22:54:01',1,23,'5','Logout',1,''),(10,'2013-07-23 22:56:23',1,21,'4','Login',3,''),(11,'2013-07-23 22:56:47',1,21,'5','Logout',3,''),(12,'2013-07-24 03:08:20',1,37,'6','Uploaded Trees',1,''),(13,'2013-07-24 03:10:36',1,37,'6','Uploaded Trees',2,'No fields changed.'),(14,'2013-07-24 07:26:30',1,23,'7','Login Using Facebook',1,''),(15,'2013-07-24 07:26:44',1,23,'8','Login Using Google',1,''),(16,'2013-08-03 17:25:50',1,21,'7','Login Using Facebook',3,''),(17,'2013-08-03 17:25:56',1,21,'8','Login Using Google',3,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_flags`
--

DROP TABLE IF EXISTS `django_comment_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `flag` varchar(30) NOT NULL,
  `flag_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`comment_id`,`flag`),
  KEY `comment_id_refs_id_373a05f7` (`comment_id`),
  CONSTRAINT `comment_id_refs_id_373a05f7` FOREIGN KEY (`comment_id`) REFERENCES `django_comments` (`id`),
  CONSTRAINT `user_id_refs_id_603c4dcb` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_flags`
--

LOCK TABLES `django_comment_flags` WRITE;
/*!40000 ALTER TABLE `django_comment_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comments`
--

DROP TABLE IF EXISTS `django_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) NOT NULL,
  `object_pk` longtext NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(75) NOT NULL,
  `user_url` varchar(200) NOT NULL,
  `comment` longtext NOT NULL,
  `submit_date` datetime NOT NULL,
  `ip_address` char(15) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_81622011` (`user_id`),
  KEY `site_id_refs_id_8db720f8` (`site_id`),
  KEY `content_type_id_refs_id_f2a7975b` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_f2a7975b` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `site_id_refs_id_8db720f8` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `user_id_refs_id_81622011` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comments`
--

LOCK TABLES `django_comments` WRITE;
/*!40000 ALTER TABLE `django_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'redirect','redirects','redirect'),(7,'session','sessions','session'),(8,'site','sites','site'),(9,'Setting','conf','setting'),(10,'Site permission','core','sitepermission'),(11,'Comment','generic','threadedcomment'),(12,'Keyword','generic','keyword'),(13,'assigned keyword','generic','assignedkeyword'),(14,'Rating','generic','rating'),(15,'Blog post','blog','blogpost'),(16,'Blog Category','blog','blogcategory'),(17,'Form','forms','form'),(18,'Field','forms','field'),(19,'Form entry','forms','formentry'),(20,'Form field entry','forms','fieldentry'),(21,'Page','pages','page'),(22,'Rich text page','pages','richtextpage'),(23,'Link','pages','link'),(24,'Gallery','galleries','gallery'),(25,'Image','galleries','galleryimage'),(26,'Twitter query','twitter','query'),(27,'Tweet','twitter','tweet'),(28,'migration history','south','migrationhistory'),(29,'log entry','admin','logentry'),(30,'comment','comments','comment'),(31,'comment flag','comments','commentflag'),(32,'email address','account','emailaddress'),(33,'email confirmation','account','emailconfirmation'),(34,'social app','socialaccount','socialapp'),(35,'social account','socialaccount','socialaccount'),(36,'social token','socialaccount','socialtoken'),(37,'Media Library','mezzanine_file_collections','medialibrary'),(38,'Media File','mezzanine_file_collections','mediafile'),(39,'document','upload','document');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_redirect`
--

DROP TABLE IF EXISTS `django_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_redirect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `old_path` varchar(200) NOT NULL,
  `new_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`,`old_path`),
  CONSTRAINT `site_id_refs_id_4aa27aa6` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_redirect`
--

LOCK TABLES `django_redirect` WRITE;
/*!40000 ALTER TABLE `django_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('03whgx0x07y155x92ctd5jf1iigf7f06','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=','2013-08-20 08:03:50'),('0wtze5fgq7vjm6omarryp13ymmgj81yv','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-22 14:20:53'),('0ykashhm2i6dxkuiaxlp76nch0s8eyo1','ZWVmZTMxOWJmNmE3ZGYyZWUwNjAxM2ZmODY1ZTM0YzI1MzhkNGU0MjqAAn1xAShYDwAAAF9zZXNzaW9uX2V4cGlyeXECSwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEKVRNzb2NpYWxhY2NvdW50X3N0YXRlfXEGVQdwcm9jZXNzWAUAAABsb2dpbnNYDAAAAGtjczVudVRuOWoxWYZ1Lg==','2013-09-01 16:14:53'),('1e0h7v3g31owcn6epkhb8hu4rtb303a6','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=','2013-08-07 11:51:16'),('2czj1c0jklyoptwao41hopznjf0eqytz','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-16 21:29:16'),('2jx3rk52yooksm1ecd46dzs05l20i3pc','YTNkMGIwYTEwOWM2MDg3YmNjNmVkNTliYTU2NDlkZWUyOTMzMWU0NDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2013-08-20 10:31:30'),('38ep6nf5ieh6ylqo4i79fbib3do9abs2','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-22 07:14:03'),('4n9lycouvsh579i2boajt8flwzx3y0e3','YmM0MDU0YjNjZDBiMWE5ZTQ1NGUyMzhiMjA4ZWIzY2VmN2ZhMWNmOTqAAn1xAShYDwAAAF9zZXNzaW9uX2V4cGlyeXECSwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEBdS4=','2013-08-21 11:41:20'),('5auo1pkgmpxecnifmg9vfqyup8jca678','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=','2013-08-19 05:07:30'),('6hdcu810vystwyxzxta2mh8zzdce9p88','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-20 10:40:57'),('7pak9lvhmfgzjeaurjzxvd3b0algxd44','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=','2013-08-20 16:27:04'),('7x9ti2jdyoyf7p4kg2x57awvgo3eskbg','MWJmZDU3ODhlOTFkZmMxM2NlY2I5NDg4MTgwODgxNTgzOWM3ZTg2NjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEEdS4=','2013-07-30 21:20:51'),('8uq976w66k59zs3zb9s62zm9ud5ofhzx','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-16 10:57:40'),('98w9ivf85iqjh9ve7ijcnd4mq2wzcisu','YTNkMGIwYTEwOWM2MDg3YmNjNmVkNTliYTU2NDlkZWUyOTMzMWU0NDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2013-08-22 14:20:17'),('9f3376cb26c5f56d8548b3ec4b77339e','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tl\nbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=\n','2013-07-29 01:41:44'),('9fe80y8xjw7gyw2gvvzkuujnef980sn2','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-07 07:35:38'),('9jbq6k8fkaut6bl6vpmoe7o5wyt42x5q','YTNkMGIwYTEwOWM2MDg3YmNjNmVkNTliYTU2NDlkZWUyOTMzMWU0NDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2013-08-20 19:45:58'),('ag40l34hf4hwgwnf6t7wye61t4ycq8p5','YTNkMGIwYTEwOWM2MDg3YmNjNmVkNTliYTU2NDlkZWUyOTMzMWU0NDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2013-08-14 23:12:40'),('al5lsuabfrrid4t8e9ck722wibntihe7','YTNkMGIwYTEwOWM2MDg3YmNjNmVkNTliYTU2NDlkZWUyOTMzMWU0NDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2013-08-22 07:07:35'),('b9d3816ad78c3b96611a996bcc70d55d','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=\n','2013-07-29 02:47:26'),('bnavdnbywjhut9tsuwtsrw1u8vvnlwdr','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-21 10:56:23'),('c20o6luhjzpkibrmnp6jnbh5c2zaapyd','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=','2013-08-04 23:12:58'),('c7roxdwmvjxy1d8zx1lfling2rsttq4i','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=','2013-08-07 16:17:58'),('cdqbneiljm9c08yx9gciuuy7okr7iguv','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-17 03:41:04'),('dca5gm26d7v05u20oplzwir2fmtn91uk','OGVhYTczM2UyNDU4N2EwY2FjZWJlZjlhYjA0OWI1NTMxNTRiNGM4YjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQd1Lg==','2013-08-07 13:03:33'),('dj1h2rwxm2ma589irpr3bhkl5vqn1rh6','YTNkMGIwYTEwOWM2MDg3YmNjNmVkNTliYTU2NDlkZWUyOTMzMWU0NDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2013-08-21 10:26:12'),('dzjaszpicn5jd6m5ppw0qxsg0vq7zjnc','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-18 17:10:36'),('e2komvcwjwjz509i5llk0l76lfj7mkaw','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=','2013-08-09 11:41:37'),('ekr0q89wcl5rxq1k8in7d17f1kzuktuq','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=','2013-08-22 06:44:04'),('fc69af9e83483b8392e9456940263f57','MTMyMWJkNWZkN2IyZGE2MDBlOTAxYzM2YzQ5NzY0ODg2YThkNzA3ODqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2013-07-29 11:18:37'),('g70vth7o551uyt5ka7szeo0szofl2axb','YmM0MDU0YjNjZDBiMWE5ZTQ1NGUyMzhiMjA4ZWIzY2VmN2ZhMWNmOTqAAn1xAShYDwAAAF9zZXNzaW9uX2V4cGlyeXECSwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEBdS4=','2013-08-28 04:28:06'),('gxnmv57uc0v9nk817cvpfto514yomw59','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-06 21:39:18'),('h612jxqxyxhbr5a9anom96atm7562gch','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=','2013-08-08 07:50:01'),('hmv6vugr9wu9g3akxhy9g68iduwjudu8','YWNmMWU4NDQ0ZTRmZTUwNTkyYjFhNjU2MDU0OWJmYTlkMmE0NGFiYTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQNVFmFjY291bnRfdmVyaWZpZWRfZW1haWxxBU51Lg==','2013-07-29 16:47:48'),('i6hpl026duytii08sxj442x5bj5jh6ta','YTNkMGIwYTEwOWM2MDg3YmNjNmVkNTliYTU2NDlkZWUyOTMzMWU0NDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2013-08-21 19:51:38'),('idmawriujl3zrrndw2ucg82v13j24ar2','NmYxMWQyZDBiZmJiNWVhN2VjNmIxMjkxNGJhOGE0NDM4ZDgyZWU5ODqAAn1xAVUTc29jaWFsYWNjb3VudF9zdGF0ZXECfXEDVQdwcm9jZXNzcQRYBQAAAGxvZ2lucQVzWAwAAABsM2FIMGJtU0U2c2mGcy4=','2013-09-02 20:55:23'),('ix8lwoah9qf4ucvika5hq0gg4pi934yr','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-16 11:16:57'),('jzqefzlued17ue9hjm7o9py96lasetfx','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=','2013-08-07 16:18:51'),('lufcbwixr10sb32ehvty80lfbw0q3tc1','YmM0MDU0YjNjZDBiMWE5ZTQ1NGUyMzhiMjA4ZWIzY2VmN2ZhMWNmOTqAAn1xAShYDwAAAF9zZXNzaW9uX2V4cGlyeXECSwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEBdS4=','2013-08-26 14:09:26'),('mf992j8vmdzxmk6tqv4nmz9zrdk9a6jy','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-09-01 14:59:27'),('mv0jdhgieytxl4h2ftw6qv764qz5wgta','Y2UwNzc2ZDk3N2QyMjhhZGViYWZkODhlYzFiN2I1NThmMzRkODY0MTqAAn1xAShYDwAAAF9zZXNzaW9uX2V4cGlyeXECSoCvGwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEBdS4=','2013-08-30 15:59:55'),('nd49anxg5wxmv3howhz44m93vycsgpwg','YTNkMGIwYTEwOWM2MDg3YmNjNmVkNTliYTU2NDlkZWUyOTMzMWU0NDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2013-08-07 16:33:07'),('nka7mzdqbg5uy1h1e3xdj01ens5hf2p7','YTNkMGIwYTEwOWM2MDg3YmNjNmVkNTliYTU2NDlkZWUyOTMzMWU0NDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2013-08-21 11:46:37'),('nkukmde9rx783ut8uxvugx25fhacufai','YmM0MDU0YjNjZDBiMWE5ZTQ1NGUyMzhiMjA4ZWIzY2VmN2ZhMWNmOTqAAn1xAShYDwAAAF9zZXNzaW9uX2V4cGlyeXECSwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEBdS4=','2013-08-22 19:58:24'),('nusnufty0ckg9kcd1aipzkquj6yb91v6','YmM0MDU0YjNjZDBiMWE5ZTQ1NGUyMzhiMjA4ZWIzY2VmN2ZhMWNmOTqAAn1xAShYDwAAAF9zZXNzaW9uX2V4cGlyeXECSwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEBdS4=','2013-08-20 16:35:48'),('ob939z77984odr6wggg2xhgf1stsvori','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-17 17:25:17'),('oyy5k91smso2y9w0uhyck3jeav3orzoz','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-01 21:56:04'),('p3qdilkr668qhent1pb01izi8m22zplt','NWU1ODA3NDU2Y2Q0NjEyNmEzMmRiN2IxZmFiYTk2MjZmZjQ5ZDBlZTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEIdS4=','2013-08-02 03:40:48'),('plf7bkm14450rw688dppu4s1v5481psc','YTNkMGIwYTEwOWM2MDg3YmNjNmVkNTliYTU2NDlkZWUyOTMzMWU0NDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2013-08-21 19:51:38'),('ppay3obdmotnydraxniuouhdbprboveo','YTNkMGIwYTEwOWM2MDg3YmNjNmVkNTliYTU2NDlkZWUyOTMzMWU0NDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2013-08-20 19:45:58'),('q8mhu63f1cf08khtmjv57c21rdgscw9v','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-07 14:21:11'),('routlgh6vczwb3mvcy03onmk1bovhn8f','YTNkMGIwYTEwOWM2MDg3YmNjNmVkNTliYTU2NDlkZWUyOTMzMWU0NDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2013-08-21 11:46:37'),('sahntmljkwzpmqums5nx11b9fos9qg5c','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-18 14:05:21'),('tb5fhbhlvysyq0axi6c97tbjqri0cg17','NzAzYjE0MWY4NjM1NDhiNDA1ZWY1NjIyNzAxMmI5ZDNmOWNkNTYyMTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBVRNzb2NpYWxhY2NvdW50X3N0YXRlfXEFVQdwcm9jZXNzVQVsb2dpbnNYDAAAAE5tamVialMyMXFkdoZ1Lg==','2013-08-07 14:49:33'),('tg6ewyw6y1tudtbcwcyrzpthltuyxl6q','OTRmYTc4ZTRiMDBmMGEyNmM4ZGQ4YzFjMzdiYjcyMDhlNGY3NDc4NTqAAn1xAShYCgAAAHRlc3Rjb29raWVYBgAAAHdvcmtlZFUSX2F1dGhfdXNlcl9iYWNrZW5kcQJVLW1lenphbmluZS5jb3JlLmF1dGhfYmFja2VuZHMuTWV6emFuaW5lQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQZ1Lg==','2013-08-01 12:07:32'),('u7zzs8scwok0el9x54sych9mspsggfwi','Nzg0ZDY0MDE1OTg4M2ZhZWZlMGE0ZDc1ZWQ2MDVlOTk0ZGMwNzljZTqAAn1xAShYCgAAAHRlc3Rjb29raWVxAlgGAAAAd29ya2VkcQNVDV9hdXRoX3VzZXJfaWSKAQVVEl9hdXRoX3VzZXJfYmFja2VuZFUtbWV6emFuaW5lLmNvcmUuYXV0aF9iYWNrZW5kcy5NZXp6YW5pbmVCYWNrZW5kdS4=','2013-08-01 11:59:10'),('uahajz3v94md6ofwr7hwk6p4xnlldmjy','YTNkMGIwYTEwOWM2MDg3YmNjNmVkNTliYTU2NDlkZWUyOTMzMWU0NDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2013-08-21 10:26:12'),('undm9ji8n3eoakqbunega47wfbyo96z2','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-09-01 14:59:35'),('x4i0jpla7yeijugj0yjquue4iiro3sav','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=','2013-08-01 08:26:05'),('xb8pumh3aias2ybeyp1tg79azfi9mqva','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-18 08:55:47'),('xp87n7d6llhmlmztmi4ihar90k815d7u','MzVhYzA1ZmY4MWY3ZGQ2Njg5N2M1ZWIxOGEzMDcyN2VmN2I0ZGQ5ZDqAAn1xAVUTc29jaWFsYWNjb3VudF9zdGF0ZXECfXEDVQdwcm9jZXNzcQRYBQAAAGxvZ2lucQVzWAwAAABDRWx1M29ENFJOU2qGcy4=','2013-08-20 15:32:20'),('xze905i620qcc4bg6i38zjswk9swx5um','MThlNDU0N2JhNjcwN2Y1YTU5MDQ0ZDdjODAzOTRjMTg0NWNiM2VkYjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQN1Lg==','2013-09-07 02:00:18'),('yfmmlswryjeea4p5wmxrelsp6mxva4vu','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-08-21 06:51:40'),('yzx9e3leq3lsvg0tnigx46twr8x2kd6a','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=','2013-07-31 00:56:55'),('z3gymt123b8i2fauipr83dcob9o8g195','YTNkMGIwYTEwOWM2MDg3YmNjNmVkNTliYTU2NDlkZWUyOTMzMWU0NDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2013-08-18 08:54:42');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'usbong.pythonanywhere.com','Default');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_field`
--

DROP TABLE IF EXISTS `forms_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_order` int(11) DEFAULT NULL,
  `form_id` int(11) NOT NULL,
  `label` varchar(200) NOT NULL,
  `field_type` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `choices` varchar(1000) NOT NULL,
  `default` varchar(2000) NOT NULL,
  `placeholder_text` varchar(100) NOT NULL,
  `help_text` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id_refs_page_ptr_id_1926fc04` (`form_id`),
  CONSTRAINT `form_id_refs_page_ptr_id_1926fc04` FOREIGN KEY (`form_id`) REFERENCES `forms_form` (`page_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_field`
--

LOCK TABLES `forms_field` WRITE;
/*!40000 ALTER TABLE `forms_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_fieldentry`
--

DROP TABLE IF EXISTS `forms_fieldentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms_fieldentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id_refs_id_a8c98a4c` (`entry_id`),
  CONSTRAINT `entry_id_refs_id_a8c98a4c` FOREIGN KEY (`entry_id`) REFERENCES `forms_formentry` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_fieldentry`
--

LOCK TABLES `forms_fieldentry` WRITE;
/*!40000 ALTER TABLE `forms_fieldentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_fieldentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_form`
--

DROP TABLE IF EXISTS `forms_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms_form` (
  `page_ptr_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `button_text` varchar(50) NOT NULL,
  `response` longtext NOT NULL,
  `send_email` tinyint(1) NOT NULL,
  `email_from` varchar(75) NOT NULL,
  `email_copies` varchar(200) NOT NULL,
  `email_subject` varchar(200) NOT NULL,
  `email_message` longtext NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `page_ptr_id_refs_id_1d5610fd` FOREIGN KEY (`page_ptr_id`) REFERENCES `pages_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_form`
--

LOCK TABLES `forms_form` WRITE;
/*!40000 ALTER TABLE `forms_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_formentry`
--

DROP TABLE IF EXISTS `forms_formentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms_formentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `entry_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id_refs_page_ptr_id_97eb7e22` (`form_id`),
  CONSTRAINT `form_id_refs_page_ptr_id_97eb7e22` FOREIGN KEY (`form_id`) REFERENCES `forms_form` (`page_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_formentry`
--

LOCK TABLES `forms_formentry` WRITE;
/*!40000 ALTER TABLE `forms_formentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_formentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_gallery`
--

DROP TABLE IF EXISTS `galleries_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleries_gallery` (
  `page_ptr_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `zip_import` varchar(100) NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `page_ptr_id_refs_id_d7ed4911` FOREIGN KEY (`page_ptr_id`) REFERENCES `pages_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_gallery`
--

LOCK TABLES `galleries_gallery` WRITE;
/*!40000 ALTER TABLE `galleries_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_galleryimage`
--

DROP TABLE IF EXISTS `galleries_galleryimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleries_galleryimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_order` int(11) DEFAULT NULL,
  `gallery_id` int(11) NOT NULL,
  `file` varchar(200) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_id_refs_page_ptr_id_cdf4e25` (`gallery_id`),
  CONSTRAINT `gallery_id_refs_page_ptr_id_cdf4e25` FOREIGN KEY (`gallery_id`) REFERENCES `galleries_gallery` (`page_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_galleryimage`
--

LOCK TABLES `galleries_galleryimage` WRITE;
/*!40000 ALTER TABLE `galleries_galleryimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_galleryimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generic_assignedkeyword`
--

DROP TABLE IF EXISTS `generic_assignedkeyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generic_assignedkeyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_order` int(11) DEFAULT NULL,
  `keyword_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_pk` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `keyword_id_refs_id_3a2a6ccd` (`keyword_id`),
  KEY `content_type_id_refs_id_abf056c` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_abf056c` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `keyword_id_refs_id_3a2a6ccd` FOREIGN KEY (`keyword_id`) REFERENCES `generic_keyword` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generic_assignedkeyword`
--

LOCK TABLES `generic_assignedkeyword` WRITE;
/*!40000 ALTER TABLE `generic_assignedkeyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `generic_assignedkeyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generic_keyword`
--

DROP TABLE IF EXISTS `generic_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generic_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `slug` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id_refs_id_61ab9647` (`site_id`),
  CONSTRAINT `site_id_refs_id_61ab9647` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generic_keyword`
--

LOCK TABLES `generic_keyword` WRITE;
/*!40000 ALTER TABLE `generic_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `generic_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generic_rating`
--

DROP TABLE IF EXISTS `generic_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generic_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `rating_date` datetime DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_pk` int(11) NOT NULL,
  `user_id` int(11),
  PRIMARY KEY (`id`),
  KEY `content_type_id_refs_id_5b2266af` (`content_type_id`),
  KEY `generic_rating_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_9436ba96` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `content_type_id_refs_id_5b2266af` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generic_rating`
--

LOCK TABLES `generic_rating` WRITE;
/*!40000 ALTER TABLE `generic_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `generic_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generic_threadedcomment`
--

DROP TABLE IF EXISTS `generic_threadedcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generic_threadedcomment` (
  `comment_ptr_id` int(11) NOT NULL,
  `rating_count` int(11) NOT NULL,
  `rating_sum` int(11) NOT NULL,
  `rating_average` double NOT NULL,
  `by_author` tinyint(1) NOT NULL,
  `replied_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_ptr_id`),
  KEY `replied_to_id_refs_comment_ptr_id_b5c2dffb` (`replied_to_id`),
  CONSTRAINT `comment_ptr_id_refs_id_16f39c27` FOREIGN KEY (`comment_ptr_id`) REFERENCES `django_comments` (`id`),
  CONSTRAINT `replied_to_id_refs_comment_ptr_id_b5c2dffb` FOREIGN KEY (`replied_to_id`) REFERENCES `generic_threadedcomment` (`comment_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generic_threadedcomment`
--

LOCK TABLES `generic_threadedcomment` WRITE;
/*!40000 ALTER TABLE `generic_threadedcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `generic_threadedcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mezzanine_file_collections_mediafile`
--

DROP TABLE IF EXISTS `mezzanine_file_collections_mediafile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mezzanine_file_collections_mediafile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_order` int(11) DEFAULT NULL,
  `library_id` int(11) NOT NULL,
  `file` varchar(200) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mezzanine_file_collections_mediafile_98518bb8` (`library_id`),
  CONSTRAINT `library_id_refs_page_ptr_id_d811e107` FOREIGN KEY (`library_id`) REFERENCES `mezzanine_file_collections_medialibrary` (`page_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mezzanine_file_collections_mediafile`
--

LOCK TABLES `mezzanine_file_collections_mediafile` WRITE;
/*!40000 ALTER TABLE `mezzanine_file_collections_mediafile` DISABLE KEYS */;
/*!40000 ALTER TABLE `mezzanine_file_collections_mediafile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mezzanine_file_collections_medialibrary`
--

DROP TABLE IF EXISTS `mezzanine_file_collections_medialibrary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mezzanine_file_collections_medialibrary` (
  `page_ptr_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `page_ptr_id_refs_id_d4a5e749` FOREIGN KEY (`page_ptr_id`) REFERENCES `pages_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mezzanine_file_collections_medialibrary`
--

LOCK TABLES `mezzanine_file_collections_medialibrary` WRITE;
/*!40000 ALTER TABLE `mezzanine_file_collections_medialibrary` DISABLE KEYS */;
/*!40000 ALTER TABLE `mezzanine_file_collections_medialibrary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_link`
--

DROP TABLE IF EXISTS `pages_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_link` (
  `page_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `page_ptr_id_refs_id_4cf4c646` FOREIGN KEY (`page_ptr_id`) REFERENCES `pages_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_link`
--

LOCK TABLES `pages_link` WRITE;
/*!40000 ALTER TABLE `pages_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_page`
--

DROP TABLE IF EXISTS `pages_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords_string` varchar(500) NOT NULL,
  `site_id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `slug` varchar(2000) DEFAULT NULL,
  `_meta_title` varchar(500) DEFAULT NULL,
  `description` longtext NOT NULL,
  `gen_description` tinyint(1) NOT NULL,
  `status` int(11) NOT NULL,
  `publish_date` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `short_url` varchar(200) DEFAULT NULL,
  `in_sitemap` tinyint(1) NOT NULL,
  `_order` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `in_menus` varchar(100) DEFAULT NULL,
  `titles` varchar(1000) DEFAULT NULL,
  `content_model` varchar(50) DEFAULT NULL,
  `login_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id_refs_id_961711c7` (`site_id`),
  KEY `parent_id_refs_id_353c0eed` (`parent_id`),
  CONSTRAINT `parent_id_refs_id_353c0eed` FOREIGN KEY (`parent_id`) REFERENCES `pages_page` (`id`),
  CONSTRAINT `site_id_refs_id_961711c7` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_page`
--

LOCK TABLES `pages_page` WRITE;
/*!40000 ALTER TABLE `pages_page` DISABLE KEYS */;
INSERT INTO `pages_page` VALUES (1,'',1,'Blog','blog',NULL,'Blog',1,2,NULL,NULL,NULL,1,1,NULL,'1,2,3','Blog','richtextpage',0);
/*!40000 ALTER TABLE `pages_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_richtextpage`
--

DROP TABLE IF EXISTS `pages_richtextpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_richtextpage` (
  `page_ptr_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `page_ptr_id_refs_id_9aa775e8` FOREIGN KEY (`page_ptr_id`) REFERENCES `pages_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_richtextpage`
--

LOCK TABLES `pages_richtextpage` WRITE;
/*!40000 ALTER TABLE `pages_richtextpage` DISABLE KEYS */;
INSERT INTO `pages_richtextpage` VALUES (1,'<p>Blog</p>');
/*!40000 ALTER TABLE `pages_richtextpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_uid_5ac8b4eb459472be_uniq` (`uid`,`provider`),
  KEY `socialaccount_socialaccount_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_b4f0248b` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
INSERT INTO `socialaccount_socialaccount` VALUES (1,3,'2013-08-24 02:00:18','2013-07-15 16:47:48','facebook','556589065','{\"username\": \"godiane\", \"first_name\": \"Diana Jayne\", \"last_name\": \"Gonzales\", \"verified\": true, \"name\": \"Diana Jayne Gonzales\", \"locale\": \"en_US\", \"gender\": \"female\", \"email\": \"di.gonzales@gmail.com\", \"link\": \"https://www.facebook.com/godiane\", \"timezone\": 8, \"updated_time\": \"2013-08-17T04:35:11+0000\", \"id\": \"556589065\"}'),(2,7,'2013-08-08 06:43:49','2013-07-19 03:36:12','google','107349115395641829865','{\"family_name\": \"Gonzales\", \"name\": \"Diana Jayne Gonzales\", \"picture\": \"https://lh3.googleusercontent.com/-9gVf17WCDyI/AAAAAAAAAAI/AAAAAAAAXNU/sNJW1V5DesA/photo.jpg\", \"locale\": \"en-GB\", \"gender\": \"female\", \"email\": \"di.gonzales@gmail.com\", \"birthday\": \"0000-09-01\", \"link\": \"https://plus.google.com/107349115395641829865\", \"given_name\": \"Diana Jayne\", \"id\": \"107349115395641829865\", \"verified_email\": true}'),(3,9,'2013-08-12 14:07:05','2013-08-12 14:07:05','google','104095094089005235881','{\"family_name\": \"Syson\", \"name\": \"Michael Syson\", \"picture\": \"https://lh3.googleusercontent.com/-wxSTrYYFxJM/AAAAAAAAAAI/AAAAAAAAAo8/gxG14ULipuw/photo.jpg\", \"locale\": \"en\", \"gender\": \"male\", \"email\": \"masarapmabuhay@gmail.com\", \"link\": \"https://plus.google.com/104095094089005235881\", \"given_name\": \"Michael\", \"id\": \"104095094089005235881\", \"verified_email\": true}');
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `key` varchar(100) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `client_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES (1,'facebook','Usbong on Facebook','','b27a6558b22205781cfccdc8035ce38b','176199212556750'),(2,'google','Usbong on Google','','wtOaojgnkENCvUBt3Fn6IXc5','809039109245.apps.googleusercontent.com');
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_711547c3e6a002b_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_f2973cd1` (`socialapp_id`),
  KEY `socialaccount_socialapp_sites_99732b5c` (`site_id`),
  CONSTRAINT `site_id_refs_id_05d6147e` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `socialapp_id_refs_id_e7a43014` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` VALUES (1,1,1),(3,2,1);
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `token` longtext NOT NULL,
  `token_secret` varchar(200) NOT NULL,
  `expires_at` datetime,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_697928748c2e1968_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_socialtoken_60fc113e` (`app_id`),
  KEY `socialaccount_socialtoken_93025c2f` (`account_id`),
  CONSTRAINT `account_id_refs_id_1337a128` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `app_id_refs_id_edac8a54` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
INSERT INTO `socialaccount_socialtoken` VALUES (1,1,1,'CAACgQJN5Yc4BAMzFtCp8dG8U5IZCZCs7rRO7TRSDTx2G7gCvmAHRfa5ceXosVOXzxKDZCMSs6fId6FXYE1QojUka0nQKUKQZC4EEGeFXj90iGJUuL2tbJl7W8B9ZC5xEZA5ZBVvWVyzXW83DOQdwIzk8QQZC1X2pTN0ZD','','2013-10-23 01:53:12'),(2,2,2,'ya29.AHES6ZSrZ0XKskW6S-lvH7ZFDXr-hcjh6dDOtLivX-0Sepo','','2013-08-08 07:43:46'),(3,2,3,'ya29.AHES6ZRNXGpuS_QOGkJcNosdh4yAKu6uvFPp-hrme_nrmbDgFp2X7A','','2013-08-12 15:07:03');
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'conf','0001_initial','2013-07-15 01:02:39'),(2,'conf','0002_auto__add_field_setting_site','2013-07-15 01:02:39'),(3,'conf','0003_update_site_setting','2013-07-15 01:02:39'),(4,'conf','0004_ssl_account_settings_rename','2013-07-15 01:02:39'),(5,'core','0001_initial','2013-07-15 01:02:39'),(6,'pages','0001_initial','2013-07-15 01:02:39'),(7,'pages','0002_auto__del_field_page__keywords__add_field_page_keywords_string__chg_fi','2013-07-15 01:02:39'),(8,'blog','0001_initial','2013-07-15 01:02:39'),(9,'blog','0002_auto','2013-07-15 01:02:39'),(10,'blog','0003_categories','2013-07-15 01:02:39'),(11,'blog','0004_auto__del_field_blogpost_category','2013-07-15 01:02:39'),(12,'blog','0005_auto__del_comment__add_field_blogpost_comments_count__chg_field_blogpo','2013-07-15 01:02:39'),(13,'blog','0006_auto__del_field_blogpost__keywords__add_field_blogpost_keywords_string','2013-07-15 01:02:39'),(14,'core','0002_auto__del_keyword','2013-07-15 01:02:39'),(15,'core','0003_auto__add_sitepermission','2013-07-15 01:02:39'),(16,'core','0004_set_site_permissions','2013-07-15 01:02:39'),(17,'generic','0001_initial','2013-07-15 01:02:39'),(18,'generic','0002_auto__add_keyword__add_assignedkeyword','2013-07-15 01:02:39'),(19,'generic','0003_auto__add_rating','2013-07-15 01:02:39'),(20,'generic','0004_auto__chg_field_rating_object_pk__chg_field_assignedkeyword_object_pk','2013-07-15 01:02:39'),(21,'generic','0005_keyword_site','2013-07-15 01:02:39'),(22,'generic','0006_move_keywords','2013-07-15 01:02:39'),(23,'generic','0007_auto__add_field_assignedkeyword__order','2013-07-15 01:02:39'),(24,'generic','0008_set_keyword_order','2013-07-15 01:02:39'),(25,'generic','0009_auto__chg_field_keyword_title__chg_field_keyword_slug','2013-07-15 01:02:39'),(26,'generic','0009_auto__del_field_threadedcomment_email_hash','2013-07-15 01:02:39'),(27,'generic','0010_auto__chg_field_keyword_slug__chg_field_keyword_title','2013-07-15 01:02:39'),(28,'generic','0011_auto__add_field_threadedcomment_rating_count__add_field_threadedcommen','2013-07-15 01:02:39'),(29,'generic','0012_auto__add_field_rating_rating_date','2013-07-15 01:02:39'),(30,'generic','0013_auto__add_field_threadedcomment_rating_sum','2013-07-15 01:02:39'),(31,'blog','0007_auto__add_field_blogpost_site','2013-07-15 01:02:40'),(32,'blog','0008_auto__add_field_blogpost_rating_average__add_field_blogpost_rating_cou','2013-07-15 01:02:40'),(33,'blog','0009_auto__chg_field_blogpost_content','2013-07-15 01:02:40'),(34,'blog','0010_category_site_allow_comments','2013-07-15 01:02:40'),(35,'blog','0011_comment_site_data','2013-07-15 01:02:40'),(36,'blog','0012_auto__add_field_blogpost_featured_image','2013-07-15 01:02:40'),(37,'blog','0013_auto__chg_field_blogpost_featured_image','2013-07-15 01:02:40'),(38,'blog','0014_auto__add_field_blogpost_gen_description','2013-07-15 01:02:40'),(39,'blog','0015_auto__chg_field_blogcategory_title__chg_field_blogcategory_slug__chg_f','2013-07-15 01:02:40'),(40,'blog','0016_add_field_blogpost__meta_title','2013-07-15 01:02:40'),(41,'blog','0017_add_field_blogpost__related_posts','2013-07-15 01:02:40'),(42,'blog','0018_auto__add_field_blogpost_in_sitemap','2013-07-15 01:02:40'),(43,'blog','0019_auto__add_field_blogpost_rating_sum','2013-07-15 01:02:40'),(44,'forms','0001_initial','2013-07-15 01:02:40'),(45,'forms','0002_auto__add_field_field_placeholder_text','2013-07-15 01:02:40'),(46,'forms','0003_auto__chg_field_field_field_type','2013-07-15 01:02:40'),(47,'forms','0004_auto__chg_field_form_response__chg_field_form_content','2013-07-15 01:02:40'),(48,'forms','0005_auto__chg_field_fieldentry_value','2013-07-15 01:02:40'),(49,'pages','0003_auto__add_field_page_site','2013-07-15 01:02:40'),(50,'pages','0004_auto__del_contentpage__add_richtextpage','2013-07-15 01:02:40'),(51,'pages','0005_rename_contentpage','2013-07-15 01:02:40'),(52,'pages','0006_auto__add_field_page_gen_description','2013-07-15 01:02:40'),(53,'pages','0007_auto__chg_field_page_slug__chg_field_page_title','2013-07-15 01:02:40'),(54,'pages','0008_auto__add_link','2013-07-15 01:02:40'),(55,'pages','0009_add_field_page_in_menus','2013-07-15 01:02:40'),(56,'pages','0010_set_menus','2013-07-15 01:02:40'),(57,'pages','0011_delete_nav_flags','2013-07-15 01:02:40'),(58,'pages','0012_add_field_page__meta_title','2013-07-15 01:02:40'),(59,'pages','0013_auto__add_field_page_in_sitemap','2013-07-15 01:02:40'),(60,'galleries','0001_initial','2013-07-15 01:02:40'),(61,'twitter','0001_initial','2013-07-15 01:02:40'),(62,'twitter','0002_auto__chg_field_query_value','2013-07-15 01:02:40'),(63,'socialaccount','0001_initial','2013-07-15 10:48:33'),(64,'socialaccount','0002_genericmodels','2013-07-15 10:48:34'),(65,'facebook','0001_initial','2013-07-15 10:48:34'),(66,'facebook','0002_auto__add_facebookaccesstoken__add_unique_facebookaccesstoken_app_acco','2013-07-15 10:48:34'),(67,'facebook','0003_tosocialaccount','2013-07-15 10:48:35'),(68,'socialaccount','0003_auto__add_unique_socialaccount_uid_provider','2013-07-15 10:48:35'),(69,'socialaccount','0004_add_sites','2013-07-15 10:48:35'),(70,'socialaccount','0005_set_sites','2013-07-15 10:48:35'),(71,'socialaccount','0006_auto__del_field_socialapp_site','2013-07-15 10:48:35'),(72,'socialaccount','0007_auto__add_field_socialapp_client_id','2013-07-15 10:48:36'),(73,'socialaccount','0008_client_id','2013-07-15 10:48:36'),(74,'socialaccount','0009_auto__add_field_socialtoken_expires_at','2013-07-15 10:48:36'),(75,'socialaccount','0010_auto__chg_field_socialtoken_token','2013-07-15 10:48:36'),(76,'socialaccount','0011_auto__chg_field_socialtoken_token','2013-07-15 10:48:36'),(77,'facebook','0004_auto__del_facebookapp__del_facebookaccesstoken__del_unique_facebookacc','2013-07-15 10:48:37'),(78,'core','0005_auto__chg_field_sitepermission_user__del_unique_sitepermission_user','2013-07-15 15:09:10'),(79,'generic','0014_auto__add_field_rating_user','2013-07-15 15:09:11'),(80,'mezzanine_file_collections','0001_initial','2013-07-23 22:22:52');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twitter_query`
--

DROP TABLE IF EXISTS `twitter_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twitter_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `value` varchar(140) NOT NULL,
  `interested` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_query`
--

LOCK TABLES `twitter_query` WRITE;
/*!40000 ALTER TABLE `twitter_query` DISABLE KEYS */;
INSERT INTO `twitter_query` VALUES (1,'search','django mezzanine',1),(2,'search','usbong',1);
/*!40000 ALTER TABLE `twitter_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twitter_tweet`
--

DROP TABLE IF EXISTS `twitter_tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twitter_tweet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remote_id` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `text` longtext,
  `profile_image_url` varchar(200) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `retweeter_profile_image_url` varchar(200) DEFAULT NULL,
  `retweeter_user_name` varchar(100) DEFAULT NULL,
  `retweeter_full_name` varchar(100) DEFAULT NULL,
  `query_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `query_id_refs_id_adacd71e` (`query_id`),
  CONSTRAINT `query_id_refs_id_adacd71e` FOREIGN KEY (`query_id`) REFERENCES `twitter_query` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_tweet`
--

LOCK TABLES `twitter_tweet` WRITE;
/*!40000 ALTER TABLE `twitter_tweet` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_tweet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_document`
--

DROP TABLE IF EXISTS `upload_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docfile` varchar(100) NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `description` varchar(300) NOT NULL,
  `date_uploaded` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_document_8a3cba94` (`uploader_id`),
  CONSTRAINT `uploader_id_refs_id_083f86f6` FOREIGN KEY (`uploader_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_document`
--

LOCK TABLES `upload_document` WRITE;
/*!40000 ALTER TABLE `upload_document` DISABLE KEYS */;
INSERT INTO `upload_document` VALUES (1,'champs.utree',1,'test','2013-08-18');
/*!40000 ALTER TABLE `upload_document` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-24  2:21:28
