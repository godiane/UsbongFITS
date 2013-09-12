-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: fits
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,1,'di.gonzales@gmail.com',0,0),(2,2,'dianarisse@gmail.com',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
INSERT INTO `account_emailconfirmation` VALUES (1,2,'2013-08-24 14:42:53',NULL,'0be905e762699dcf7208c85d2d07a9fabf013a854aac105b21615594f62ad6a6');
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
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add redirect',5,'add_redirect'),(14,'Can change redirect',5,'change_redirect'),(15,'Can delete redirect',5,'delete_redirect'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add email address',8,'add_emailaddress'),(23,'Can change email address',8,'change_emailaddress'),(24,'Can delete email address',8,'delete_emailaddress'),(25,'Can add email confirmation',9,'add_emailconfirmation'),(26,'Can change email confirmation',9,'change_emailconfirmation'),(27,'Can delete email confirmation',9,'delete_emailconfirmation'),(28,'Can add document',10,'add_document'),(29,'Can change document',10,'change_document'),(30,'Can delete document',10,'delete_document'),(31,'Can add migration history',11,'add_migrationhistory'),(32,'Can change migration history',11,'change_migrationhistory'),(33,'Can delete migration history',11,'delete_migrationhistory'),(34,'Can add log entry',12,'add_logentry'),(35,'Can change log entry',12,'change_logentry'),(36,'Can delete log entry',12,'delete_logentry'),(37,'Can add comment',13,'add_comment'),(38,'Can change comment',13,'change_comment'),(39,'Can delete comment',13,'delete_comment'),(40,'Can moderate comments',13,'can_moderate'),(41,'Can add comment flag',14,'add_commentflag'),(42,'Can change comment flag',14,'change_commentflag'),(43,'Can delete comment flag',14,'delete_commentflag'),(44,'Can add social app',15,'add_socialapp'),(45,'Can change social app',15,'change_socialapp'),(46,'Can delete social app',15,'delete_socialapp'),(47,'Can add social account',16,'add_socialaccount'),(48,'Can change social account',16,'change_socialaccount'),(49,'Can delete social account',16,'delete_socialaccount'),(50,'Can add social token',17,'add_socialtoken'),(51,'Can change social token',17,'change_socialtoken'),(52,'Can delete social token',17,'delete_socialtoken'),(53,'Can add Setting',18,'add_setting'),(54,'Can change Setting',18,'change_setting'),(55,'Can delete Setting',18,'delete_setting'),(56,'Can add Site permission',19,'add_sitepermission'),(57,'Can change Site permission',19,'change_sitepermission'),(58,'Can delete Site permission',19,'delete_sitepermission'),(59,'Can add Page',20,'add_page'),(60,'Can change Page',20,'change_page'),(61,'Can delete Page',20,'delete_page'),(62,'Can add Rich text page',21,'add_richtextpage'),(63,'Can change Rich text page',21,'change_richtextpage'),(64,'Can delete Rich text page',21,'delete_richtextpage'),(65,'Can add Link',22,'add_link'),(66,'Can change Link',22,'change_link'),(67,'Can delete Link',22,'delete_link'),(68,'Can add Blog post',23,'add_blogpost'),(69,'Can change Blog post',23,'change_blogpost'),(70,'Can delete Blog post',23,'delete_blogpost'),(71,'Can add Blog Category',24,'add_blogcategory'),(72,'Can change Blog Category',24,'change_blogcategory'),(73,'Can delete Blog Category',24,'delete_blogcategory'),(74,'Can add Comment',25,'add_threadedcomment'),(75,'Can change Comment',25,'change_threadedcomment'),(76,'Can delete Comment',25,'delete_threadedcomment'),(77,'Can add Keyword',26,'add_keyword'),(78,'Can change Keyword',26,'change_keyword'),(79,'Can delete Keyword',26,'delete_keyword'),(80,'Can add assigned keyword',27,'add_assignedkeyword'),(81,'Can change assigned keyword',27,'change_assignedkeyword'),(82,'Can delete assigned keyword',27,'delete_assignedkeyword'),(83,'Can add Rating',28,'add_rating'),(84,'Can change Rating',28,'change_rating'),(85,'Can delete Rating',28,'delete_rating'),(86,'Can add Form',29,'add_form'),(87,'Can change Form',29,'change_form'),(88,'Can delete Form',29,'delete_form'),(89,'Can add Field',30,'add_field'),(90,'Can change Field',30,'change_field'),(91,'Can delete Field',30,'delete_field'),(92,'Can add Form entry',31,'add_formentry'),(93,'Can change Form entry',31,'change_formentry'),(94,'Can delete Form entry',31,'delete_formentry'),(95,'Can add Form field entry',32,'add_fieldentry'),(96,'Can change Form field entry',32,'change_fieldentry'),(97,'Can delete Form field entry',32,'delete_fieldentry'),(98,'Can add Gallery',33,'add_gallery'),(99,'Can change Gallery',33,'change_gallery'),(100,'Can delete Gallery',33,'delete_gallery'),(101,'Can add Image',34,'add_galleryimage'),(102,'Can change Image',34,'change_galleryimage'),(103,'Can delete Image',34,'delete_galleryimage'),(104,'Can add Twitter query',35,'add_query'),(105,'Can change Twitter query',35,'change_query'),(106,'Can delete Twitter query',35,'delete_query'),(107,'Can add Tweet',36,'add_tweet'),(108,'Can change Tweet',36,'change_tweet'),(109,'Can delete Tweet',36,'delete_tweet');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$sfYXMMLYdBCX$HrqKNnJlsaljQHZ4fkuYXnV6wxstsEtcaoYpEVw+8is=','2013-09-08 15:37:33',1,'usbong','','','di.gonzales@gmail.com',1,1,'2013-08-18 16:50:18'),(2,'pbkdf2_sha256$10000$4hMWKCW1Ng3Y$VKUi4GgS08cE6k/F7GmcFGHIzesHSCzWvox4MbFmidU=','2013-09-08 15:34:54',0,'diane','','','dianarisse@gmail.com',0,1,'2013-08-24 14:42:53');
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
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `slug` varchar(2000),
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blogcategory_99732b5c` (`site_id`),
  CONSTRAINT `site_id_refs_id_93afc60f` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
  `status` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `title` varchar(500) NOT NULL,
  `short_url` varchar(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `slug` varchar(2000),
  `comments_count` int(11) NOT NULL,
  `keywords_string` varchar(500) NOT NULL,
  `site_id` int(11) NOT NULL,
  `rating_average` double NOT NULL,
  `rating_count` int(11) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL,
  `featured_image` varchar(255),
  `gen_description` tinyint(1) NOT NULL,
  `_meta_title` varchar(500),
  `in_sitemap` tinyint(1) NOT NULL,
  `rating_sum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blogpost_6340c63c` (`user_id`),
  KEY `blog_blogpost_99732b5c` (`site_id`),
  CONSTRAINT `site_id_refs_id_ac21095f` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `user_id_refs_id_01a962b8` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `blog_blogpost_categories_blogpost_id_79f2a5569187bd14_uniq` (`blogpost_id`,`blogcategory_id`),
  KEY `blog_blogpost_categories_3beb7885` (`blogpost_id`),
  KEY `blog_blogpost_categories_29db1e0f` (`blogcategory_id`),
  CONSTRAINT `blogcategory_id_refs_id_91693b1c` FOREIGN KEY (`blogcategory_id`) REFERENCES `blog_blogcategory` (`id`),
  CONSTRAINT `blogpost_id_refs_id_6a2ad936` FOREIGN KEY (`blogpost_id`) REFERENCES `blog_blogpost` (`id`)
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
  UNIQUE KEY `blog_blogpost_related_po_from_blogpost_id_3007eb9b6b16df8b_uniq` (`from_blogpost_id`,`to_blogpost_id`),
  KEY `blog_blogpost_related_posts_69f74308` (`from_blogpost_id`),
  KEY `blog_blogpost_related_posts_bb78a3ca` (`to_blogpost_id`),
  CONSTRAINT `from_blogpost_id_refs_id_6404941b` FOREIGN KEY (`from_blogpost_id`) REFERENCES `blog_blogpost` (`id`),
  CONSTRAINT `to_blogpost_id_refs_id_6404941b` FOREIGN KEY (`to_blogpost_id`) REFERENCES `blog_blogpost` (`id`)
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
  `value` varchar(2000) NOT NULL,
  `name` varchar(50) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `conf_setting_99732b5c` (`site_id`),
  CONSTRAINT `site_id_refs_id_29e7e142` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_setting`
--

LOCK TABLES `conf_setting` WRITE;
/*!40000 ALTER TABLE `conf_setting` DISABLE KEYS */;
INSERT INTO `conf_setting` VALUES (1,'','GOOGLE_ANALYTICS_ID',1),(2,'10','SEARCH_PER_PAGE',1),(3,'5','COMMENTS_NUM_LATEST',1),(4,'1','RICHTEXT_FILTER_LEVEL',1),(5,'','TWITTER_CONSUMER_SECRET',1),(6,'True','COMMENTS_UNAPPROVED_VISIBLE',1),(7,'Usbong\'s Forest in the Sky','SITE_TAGLINE',1),(8,'search','TWITTER_DEFAULT_QUERY_TYPE',1),(9,'True','COMMENTS_REMOVED_VISIBLE',1),(10,'3','TWITTER_DEFAULT_NUM_TWEETS',1),(11,'','BITLY_ACCESS_TOKEN',1),(12,'False','SSL_ENABLED',1),(13,'','AKISMET_API_KEY',1),(14,'True','COMMENTS_DEFAULT_APPROVED',1),(15,'','TWITTER_ACCESS_TOKEN_KEY',1),(16,'usbong','TWITTER_DEFAULT_QUERY',1),(17,'Usbong FITS','SITE_TITLE',1),(18,'5','BLOG_POST_PER_PAGE',1),(19,'','COMMENTS_NOTIFICATION_EMAILS',1),(20,'','COMMENTS_DISQUS_API_PUBLIC_KEY',1),(21,'','COMMENTS_DISQUS_API_SECRET_KEY',1),(22,'','TWITTER_CONSUMER_KEY',1),(23,'False','COMMENTS_ACCOUNT_REQUIRED',1),(24,'10','MAX_PAGING_LINKS',1),(25,'','TWITTER_ACCESS_TOKEN_SECRET',1),(26,'4','TAG_CLOUD_SIZES',1),(27,'','COMMENTS_DISQUS_SHORTNAME',1),(28,'','SSL_FORCE_HOST',1),(29,'False','RATINGS_ACCOUNT_REQUIRED',1);
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
  UNIQUE KEY `user_id` (`user_id`),
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
  UNIQUE KEY `core_sitepermission_sit_sitepermission_id_31fc3b7b7e3badd5_uniq` (`sitepermission_id`,`site_id`),
  KEY `core_sitepermission_sites_0780734a` (`sitepermission_id`),
  KEY `core_sitepermission_sites_99732b5c` (`site_id`),
  CONSTRAINT `sitepermission_id_refs_id_7dccdcbd` FOREIGN KEY (`sitepermission_id`) REFERENCES `core_sitepermission` (`id`),
  CONSTRAINT `site_id_refs_id_91a6d9d4` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-08-18 16:56:51',1,22,'1','Upload',1,''),(2,'2013-08-18 16:57:39',1,20,'1','Upload',3,''),(3,'2013-08-18 16:58:19',1,22,'2','The Usbong Project',1,''),(4,'2013-08-18 16:58:43',1,22,'2','About',2,'Changed title.'),(5,'2013-08-24 01:49:29',1,15,'1','Usbong FITS',1,''),(6,'2013-09-08 15:37:48',1,20,'2','About',3,''),(7,'2013-09-08 15:37:59',1,22,'3','Usbong',1,'');
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
  KEY `django_comment_flags_6340c63c` (`user_id`),
  KEY `django_comment_flags_3925f323` (`comment_id`),
  KEY `django_comment_flags_9f00eb17` (`flag`),
  CONSTRAINT `comment_id_refs_id_669ff450` FOREIGN KEY (`comment_id`) REFERENCES `django_comments` (`id`),
  CONSTRAINT `user_id_refs_id_73e17509` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `django_comments_37ef4eb4` (`content_type_id`),
  KEY `django_comments_99732b5c` (`site_id`),
  KEY `django_comments_6340c63c` (`user_id`),
  CONSTRAINT `content_type_id_refs_id_5ce75e49` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `site_id_refs_id_c6498c81` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `user_id_refs_id_c4f1d065` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'redirect','redirects','redirect'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'email address','account','emailaddress'),(9,'email confirmation','account','emailconfirmation'),(10,'document','upload','document'),(11,'migration history','south','migrationhistory'),(12,'log entry','admin','logentry'),(13,'comment','comments','comment'),(14,'comment flag','comments','commentflag'),(15,'social app','socialaccount','socialapp'),(16,'social account','socialaccount','socialaccount'),(17,'social token','socialaccount','socialtoken'),(18,'Setting','conf','setting'),(19,'Site permission','core','sitepermission'),(20,'Page','pages','page'),(21,'Rich text page','pages','richtextpage'),(22,'Link','pages','link'),(23,'Blog post','blog','blogpost'),(24,'Blog Category','blog','blogcategory'),(25,'Comment','generic','threadedcomment'),(26,'Keyword','generic','keyword'),(27,'assigned keyword','generic','assignedkeyword'),(28,'Rating','generic','rating'),(29,'Form','forms','form'),(30,'Field','forms','field'),(31,'Form entry','forms','formentry'),(32,'Form field entry','forms','fieldentry'),(33,'Gallery','galleries','gallery'),(34,'Image','galleries','galleryimage'),(35,'Twitter query','twitter','query'),(36,'Tweet','twitter','tweet');
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
  KEY `django_redirect_99732b5c` (`site_id`),
  KEY `django_redirect_acd0874a` (`old_path`),
  CONSTRAINT `site_id_refs_id_390e2add` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9h23bo277vfa4kbo8e38atyvohr7notr','MjdlMzU5ZTFkYjgzYWI3ZmE3YjUyMTk0ZGVkOTRhYzI5ODhhYmVhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-09-22 15:37:33'),('byu02xg9u1rlnq6gxrp3ls01oxm2izz3','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=','2013-09-01 17:00:34'),('n0az0r7p832oqbf2izoo6l0bfw1q45l4','MzQ5NjA5MWY2Mzc1Yzg5ZGVmMDlkMzA2M2E1NTMxZWY5MzZiZGYyOTqAAn1xAShYDwAAAF9zZXNzaW9uX2V4cGlyeXECSwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigECdS4=','2013-09-07 14:43:43'),('ovx83t7nq9m9gdajxvcx2j5ekse0v95h','MzQ5NjA5MWY2Mzc1Yzg5ZGVmMDlkMzA2M2E1NTMxZWY5MzZiZGYyOTqAAn1xAShYDwAAAF9zZXNzaW9uX2V4cGlyeXECSwBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVS1tZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigECdS4=','2013-09-16 11:57:40'),('wari8z6zl1tys47ia06nlyrnr7qqaezf','NThiODA2ZDk4YWM2Y2VjZDNjYWJjZmZjZmExMTYwMTgxNzFmMjE4YjqAAn1xAS4=','2013-09-21 03:20:07');
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
INSERT INTO `django_site` VALUES (1,'127.0.0.1:8000','Default');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_field`
--

DROP TABLE IF EXISTS `forms_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms_field` (
  `_order` int(11) DEFAULT NULL,
  `form_id` int(11) NOT NULL,
  `default` varchar(2000) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `label` varchar(200) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `help_text` varchar(100) NOT NULL,
  `choices` varchar(1000) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placeholder_text` varchar(100) NOT NULL,
  `field_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forms_field_c3d79a6c` (`form_id`),
  CONSTRAINT `form_id_refs_page_ptr_id_5a752766` FOREIGN KEY (`form_id`) REFERENCES `forms_form` (`page_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `entry_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(2000),
  PRIMARY KEY (`id`),
  KEY `forms_fieldentry_e8d920b6` (`entry_id`),
  CONSTRAINT `entry_id_refs_id_e329b086` FOREIGN KEY (`entry_id`) REFERENCES `forms_formentry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `email_message` longtext NOT NULL,
  `page_ptr_id` int(11) NOT NULL,
  `email_copies` varchar(200) NOT NULL,
  `button_text` varchar(50) NOT NULL,
  `response` longtext NOT NULL,
  `content` longtext NOT NULL,
  `send_email` tinyint(1) NOT NULL,
  `email_subject` varchar(200) NOT NULL,
  `email_from` varchar(75) NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `page_ptr_id_refs_id_fe19b67b` FOREIGN KEY (`page_ptr_id`) REFERENCES `pages_page` (`id`)
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
  `entry_time` datetime NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forms_formentry_c3d79a6c` (`form_id`),
  CONSTRAINT `form_id_refs_page_ptr_id_4d605921` FOREIGN KEY (`form_id`) REFERENCES `forms_form` (`page_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  CONSTRAINT `page_ptr_id_refs_id_75804475` FOREIGN KEY (`page_ptr_id`) REFERENCES `pages_page` (`id`)
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
  KEY `galleries_galleryimage_579c518c` (`gallery_id`),
  CONSTRAINT `gallery_id_refs_page_ptr_id_d6457fc6` FOREIGN KEY (`gallery_id`) REFERENCES `galleries_gallery` (`page_ptr_id`)
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
  `content_type_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(11) NOT NULL,
  `object_pk` int(11) DEFAULT NULL,
  `_order` int(11),
  PRIMARY KEY (`id`),
  KEY `generic_assignedkeyword_37ef4eb4` (`content_type_id`),
  KEY `generic_assignedkeyword_0e202173` (`keyword_id`),
  CONSTRAINT `content_type_id_refs_id_c36d959c` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `keyword_id_refs_id_aa70ce50` FOREIGN KEY (`keyword_id`) REFERENCES `generic_keyword` (`id`)
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
  `slug` varchar(2000),
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `generic_keyword_99732b5c` (`site_id`),
  CONSTRAINT `site_id_refs_id_f6393455` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
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
  `content_type_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `object_pk` int(11) DEFAULT NULL,
  `rating_date` datetime,
  `user_id` int(11),
  PRIMARY KEY (`id`),
  KEY `generic_rating_37ef4eb4` (`content_type_id`),
  KEY `generic_rating_6340c63c` (`user_id`),
  CONSTRAINT `content_type_id_refs_id_1c638e93` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_9436ba96` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `by_author` tinyint(1) NOT NULL,
  `comment_ptr_id` int(11) NOT NULL,
  `replied_to_id` int(11) DEFAULT NULL,
  `rating_count` int(11) NOT NULL,
  `rating_average` double NOT NULL,
  `rating_sum` int(11) NOT NULL,
  PRIMARY KEY (`comment_ptr_id`),
  KEY `generic_threadedcomment_148afc3c` (`replied_to_id`),
  CONSTRAINT `comment_ptr_id_refs_id_d4c241e5` FOREIGN KEY (`comment_ptr_id`) REFERENCES `django_comments` (`id`),
  CONSTRAINT `replied_to_id_refs_comment_ptr_id_83bd8e31` FOREIGN KEY (`replied_to_id`) REFERENCES `generic_threadedcomment` (`comment_ptr_id`)
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
-- Table structure for table `pages_link`
--

DROP TABLE IF EXISTS `pages_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_link` (
  `page_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `page_ptr_id_refs_id_2adddb0b` FOREIGN KEY (`page_ptr_id`) REFERENCES `pages_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_link`
--

LOCK TABLES `pages_link` WRITE;
/*!40000 ALTER TABLE `pages_link` DISABLE KEYS */;
INSERT INTO `pages_link` VALUES (3);
/*!40000 ALTER TABLE `pages_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_page`
--

DROP TABLE IF EXISTS `pages_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_page` (
  `status` int(11) NOT NULL,
  `_order` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `description` longtext NOT NULL,
  `title` varchar(500) NOT NULL,
  `short_url` varchar(200) DEFAULT NULL,
  `login_required` tinyint(1) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expiry_date` datetime DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `titles` varchar(1000) DEFAULT NULL,
  `content_model` varchar(50) DEFAULT NULL,
  `slug` varchar(2000),
  `keywords_string` varchar(500) NOT NULL,
  `site_id` int(11) NOT NULL,
  `gen_description` tinyint(1) NOT NULL,
  `in_menus` varchar(100),
  `_meta_title` varchar(500),
  `in_sitemap` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_page_410d0aac` (`parent_id`),
  KEY `pages_page_99732b5c` (`site_id`),
  CONSTRAINT `parent_id_refs_id_68963b8e` FOREIGN KEY (`parent_id`) REFERENCES `pages_page` (`id`),
  CONSTRAINT `site_id_refs_id_70c9ac77` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_page`
--

LOCK TABLES `pages_page` WRITE;
/*!40000 ALTER TABLE `pages_page` DISABLE KEYS */;
INSERT INTO `pages_page` VALUES (2,0,NULL,'Usbong','Usbong',NULL,0,3,NULL,'2013-09-08 15:37:59','Usbong','link','http://usbong.ph/','',1,1,'1,2,3',NULL,0);
/*!40000 ALTER TABLE `pages_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_richtextpage`
--

DROP TABLE IF EXISTS `pages_richtextpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_richtextpage` (
  `content` longtext NOT NULL,
  `page_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `page_ptr_id_refs_id_558d29bc` FOREIGN KEY (`page_ptr_id`) REFERENCES `pages_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_richtextpage`
--

LOCK TABLES `pages_richtextpage` WRITE;
/*!40000 ALTER TABLE `pages_richtextpage` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES (1,'facebook','Usbong FITS','','b27a6558b22205781cfccdc8035ce38b','176199212556750');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` VALUES (1,1,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'socialaccount','0001_initial','2013-08-18 16:50:34'),(2,'socialaccount','0002_genericmodels','2013-08-18 16:50:37'),(3,'facebook','0001_initial','2013-08-18 16:50:38'),(4,'facebook','0002_auto__add_facebookaccesstoken__add_unique_facebookaccesstoken_app_acco','2013-08-18 16:50:39'),(5,'facebook','0003_tosocialaccount','2013-08-18 16:50:39'),(6,'socialaccount','0003_auto__add_unique_socialaccount_uid_provider','2013-08-18 16:50:39'),(7,'socialaccount','0004_add_sites','2013-08-18 16:50:41'),(8,'socialaccount','0005_set_sites','2013-08-18 16:50:41'),(9,'socialaccount','0006_auto__del_field_socialapp_site','2013-08-18 16:50:41'),(10,'socialaccount','0007_auto__add_field_socialapp_client_id','2013-08-18 16:50:42'),(11,'socialaccount','0008_client_id','2013-08-18 16:50:42'),(12,'socialaccount','0009_auto__add_field_socialtoken_expires_at','2013-08-18 16:50:43'),(13,'socialaccount','0010_auto__chg_field_socialtoken_token','2013-08-18 16:50:44'),(14,'socialaccount','0011_auto__chg_field_socialtoken_token','2013-08-18 16:50:44'),(15,'facebook','0004_auto__del_facebookapp__del_facebookaccesstoken__del_unique_facebookacc','2013-08-18 16:50:45'),(16,'conf','0001_initial','2013-08-18 16:50:45'),(17,'conf','0002_auto__add_field_setting_site','2013-08-18 16:50:46'),(18,'conf','0003_update_site_setting','2013-08-18 16:50:46'),(19,'conf','0004_ssl_account_settings_rename','2013-08-18 16:50:46'),(20,'core','0001_initial','2013-08-18 16:50:46'),(21,'pages','0001_initial','2013-08-18 16:50:48'),(22,'pages','0002_auto__del_field_page__keywords__add_field_page_keywords_string__chg_fi','2013-08-18 16:50:49'),(23,'blog','0001_initial','2013-08-18 16:50:53'),(24,'blog','0002_auto','2013-08-18 16:50:55'),(25,'blog','0003_categories','2013-08-18 16:50:55'),(26,'blog','0004_auto__del_field_blogpost_category','2013-08-18 16:50:55'),(27,'blog','0005_auto__del_comment__add_field_blogpost_comments_count__chg_field_blogpo','2013-08-18 16:50:56'),(28,'blog','0006_auto__del_field_blogpost__keywords__add_field_blogpost_keywords_string','2013-08-18 16:50:57'),(29,'core','0002_auto__del_keyword','2013-08-18 16:50:57'),(30,'core','0003_auto__add_sitepermission','2013-08-18 16:50:58'),(31,'core','0004_set_site_permissions','2013-08-18 16:50:58'),(32,'core','0005_auto__chg_field_sitepermission_user__del_unique_sitepermission_user','2013-08-18 16:50:59'),(33,'generic','0001_initial','2013-08-18 16:51:01'),(34,'generic','0002_auto__add_keyword__add_assignedkeyword','2013-08-18 16:51:02'),(35,'generic','0003_auto__add_rating','2013-08-18 16:51:03'),(36,'generic','0004_auto__chg_field_rating_object_pk__chg_field_assignedkeyword_object_pk','2013-08-18 16:51:05'),(37,'generic','0005_keyword_site','2013-08-18 16:51:06'),(38,'generic','0006_move_keywords','2013-08-18 16:51:06'),(39,'generic','0007_auto__add_field_assignedkeyword__order','2013-08-18 16:51:07'),(40,'generic','0008_set_keyword_order','2013-08-18 16:51:07'),(41,'generic','0009_auto__chg_field_keyword_title__chg_field_keyword_slug','2013-08-18 16:51:08'),(42,'generic','0009_auto__del_field_threadedcomment_email_hash','2013-08-18 16:51:08'),(43,'generic','0010_auto__chg_field_keyword_slug__chg_field_keyword_title','2013-08-18 16:51:08'),(44,'generic','0011_auto__add_field_threadedcomment_rating_count__add_field_threadedcommen','2013-08-18 16:51:09'),(45,'generic','0012_auto__add_field_rating_rating_date','2013-08-18 16:51:09'),(46,'generic','0013_auto__add_field_threadedcomment_rating_sum','2013-08-18 16:51:10'),(47,'generic','0014_auto__add_field_rating_user','2013-08-18 16:51:11'),(48,'blog','0007_auto__add_field_blogpost_site','2013-08-18 16:51:12'),(49,'blog','0008_auto__add_field_blogpost_rating_average__add_field_blogpost_rating_cou','2013-08-18 16:51:13'),(50,'blog','0009_auto__chg_field_blogpost_content','2013-08-18 16:51:13'),(51,'blog','0010_category_site_allow_comments','2013-08-18 16:51:14'),(52,'blog','0011_comment_site_data','2013-08-18 16:51:15'),(53,'blog','0012_auto__add_field_blogpost_featured_image','2013-08-18 16:51:15'),(54,'blog','0013_auto__chg_field_blogpost_featured_image','2013-08-18 16:51:15'),(55,'blog','0014_auto__add_field_blogpost_gen_description','2013-08-18 16:51:16'),(56,'blog','0015_auto__chg_field_blogcategory_title__chg_field_blogcategory_slug__chg_f','2013-08-18 16:51:18'),(57,'blog','0016_add_field_blogpost__meta_title','2013-08-18 16:51:18'),(58,'blog','0017_add_field_blogpost__related_posts','2013-08-18 16:51:20'),(59,'blog','0018_auto__add_field_blogpost_in_sitemap','2013-08-18 16:51:20'),(60,'blog','0019_auto__add_field_blogpost_rating_sum','2013-08-18 16:51:21'),(61,'forms','0001_initial','2013-08-18 16:51:23'),(62,'forms','0002_auto__add_field_field_placeholder_text','2013-08-18 16:51:23'),(63,'forms','0003_auto__chg_field_field_field_type','2013-08-18 16:51:24'),(64,'forms','0004_auto__chg_field_form_response__chg_field_form_content','2013-08-18 16:51:25'),(65,'forms','0005_auto__chg_field_fieldentry_value','2013-08-18 16:51:25'),(66,'pages','0003_auto__add_field_page_site','2013-08-18 16:51:27'),(67,'pages','0004_auto__del_contentpage__add_richtextpage','2013-08-18 16:51:27'),(68,'pages','0005_rename_contentpage','2013-08-18 16:51:27'),(69,'pages','0006_auto__add_field_page_gen_description','2013-08-18 16:51:28'),(70,'pages','0007_auto__chg_field_page_slug__chg_field_page_title','2013-08-18 16:51:28'),(71,'pages','0008_auto__add_link','2013-08-18 16:51:29'),(72,'pages','0009_add_field_page_in_menus','2013-08-18 16:51:29'),(73,'pages','0010_set_menus','2013-08-18 16:51:29'),(74,'pages','0011_delete_nav_flags','2013-08-18 16:51:30'),(75,'pages','0012_add_field_page__meta_title','2013-08-18 16:51:30'),(76,'pages','0013_auto__add_field_page_in_sitemap','2013-08-18 16:51:30'),(77,'galleries','0001_initial','2013-08-18 16:51:32'),(78,'twitter','0001_initial','2013-08-18 16:51:33'),(79,'twitter','0002_auto__chg_field_query_value','2013-08-18 16:51:33');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twitter_query`
--

DROP TABLE IF EXISTS `twitter_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twitter_query` (
  `interested` tinyint(1) NOT NULL,
  `type` varchar(10) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(140) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_query`
--

LOCK TABLES `twitter_query` WRITE;
/*!40000 ALTER TABLE `twitter_query` DISABLE KEYS */;
INSERT INTO `twitter_query` VALUES (1,'search',1,'django mezzanine'),(1,'search',2,'usbong');
/*!40000 ALTER TABLE `twitter_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twitter_tweet`
--

DROP TABLE IF EXISTS `twitter_tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twitter_tweet` (
  `retweeter_profile_image_url` varchar(200) DEFAULT NULL,
  `text` longtext,
  `created_at` datetime DEFAULT NULL,
  `remote_id` varchar(50) NOT NULL,
  `retweeter_user_name` varchar(100) DEFAULT NULL,
  `profile_image_url` varchar(200) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `query_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `retweeter_full_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `twitter_tweet_1f3ceafc` (`query_id`),
  CONSTRAINT `query_id_refs_id_b81595a6` FOREIGN KEY (`query_id`) REFERENCES `twitter_query` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_document`
--

alter table upload_document change donwload_count download_count int(10) unsigned

LOCK TABLES `upload_document` WRITE;
/*!40000 ALTER TABLE `upload_document` DISABLE KEYS */;
INSERT INTO `upload_document` VALUES (1,'documents/2013/08/19/champs_1.utree',1,'','2013-08-19'),(2,'documents/2013/08/24/boo_1.xml',1,'','2013-08-24'),(3,'documents/2013/08/24/champs.utree',1,'','2013-08-24'),(4,'documents/2013/08/24/boo_2.xml',1,'Test description.','2013-08-24'),(5,'documents/2013/08/24/boo_3.xml',1,'Test description.','2013-08-24'),(6,'documents/2013/08/24/champs_1.utree',1,'Test description.','2013-08-24'),(7,'documents/2013/08/24/champs_2.utree',1,'Test description.','2013-08-24'),(8,'documents/2013/08/24/champs_3.utree',1,'Test description.','2013-08-24'),(9,'documents/2013/08/24/champs_4.utree',1,'Test description.','2013-08-24'),(10,'documents/2013/08/24/champs_5.utree',2,'Test description.','2013-08-24'),(11,'documents/2013/09/02/champs.utree',2,'Test description.','2013-09-02'),(12,'documents/2013/09/02/champs_7.utree',2,'Chanps 7','2013-09-02'),(13,'documents/2013/09/02/champs_7_1.utree',2,'YouTube http://www.youtube.com/watch?v=NlqI26xZZo4','2013-09-02'),(14,'documents/2013/09/02/champs_7_2.utree',2,'http://www.youtube.com/watch?v=NlqI26xZZo4','2013-09-02'),(15,'documents/2013/09/02/champs_7_3.utree',2,'Testing youtube Yay??? http://www.youtube.com/watch?v=NlqI26xZZo4 Nay???>>>','2013-09-02'),(16,'documents/2013/09/02/champs_1.utree',2,'http://www.youtube.com/watch?v=NlqI26xZZo4','2013-09-02');
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

-- Dump completed on 2013-09-12 21:16:02
