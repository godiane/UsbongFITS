-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: fits
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.13.04.1

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
  `download_count` int(10) unsigned NOT NULL,
  `up_vote` int(10) unsigned NOT NULL,
  `down_vote` int(10) unsigned NOT NULL,
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
INSERT INTO `upload_document` VALUES (1,'documents/2013/10/06/champs_1.utree',1,'Test description.','2013-10-06',0,0,0),(2,'documents/2013/10/07/champs.utree',1,'Test description.','2013-10-07',0,0,0),(3,'documents/2013/10/07/champs_7.utree',1,'Test 123','2013-10-07',0,0,0),(4,'documents/2013/10/07/champs_1.utree',1,'http://www.youtube.com/watch?v=FCe6Nw3KoXA','2013-10-07',0,0,0);
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

-- Dump completed on 2013-10-07  7:56:29
