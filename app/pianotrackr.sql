-- MySQL dump 10.11
--
-- Host: localhost    Database: pianotrackr
-- ------------------------------------------------------
-- Server version	5.0.37-community-nt

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
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL default '',
  `updatedAt` datetime NOT NULL default '0000-00-00 00:00:00',
  `createdAt` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'IC Advanced Students','2007-05-16 22:42:13','2007-05-10 21:29:42'),(4,'Piano User Group','2007-05-16 22:41:52','2007-05-10 21:29:42'),(5,'Summer Camp','2007-05-16 22:41:38','2007-05-10 21:29:42'),(6,'Faculty','2007-05-10 21:29:42','2007-05-10 21:29:42'),(7,'Student','2007-05-10 21:27:08','2007-05-10 21:27:08'),(8,'Staff','2007-05-10 21:29:42','2007-05-10 21:29:42'),(9,'Administrators','2007-05-12 19:20:51','2007-05-12 19:20:51'),(11,'Spring Technicians','2007-05-16 22:42:43','2007-05-14 00:42:05');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrument`
--

DROP TABLE IF EXISTS `instrument`;
CREATE TABLE `instrument` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `serial` varchar(30) NOT NULL default '',
  `brand` varchar(100) NOT NULL default '',
  `model` varchar(100) NOT NULL default '',
  `yearBuilt` varchar(4) NOT NULL default '0000',
  `type` enum('Grand','Upright','Harpischord','Clavinova') NOT NULL default 'Grand',
  `location` varchar(100) NOT NULL default '',
  `jjwcm` int(1) unsigned NOT NULL default '0',
  `comments` text NOT NULL,
  `retailValue` float default NULL,
  `replaceValue` float default NULL,
  `baseWorkload` int(8) default NULL,
  `condition` float NOT NULL default '1',
  `rebuildingParameters` float default NULL,
  `climateControl` float default NULL,
  `usage` float default NULL,
  `standardOfMaintenance` float default NULL,
  `facultyId` int(11) unsigned default NULL,
  `updatedAt` datetime NOT NULL default '0000-00-00 00:00:00',
  `createdAt` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instrument`
--

LOCK TABLES `instrument` WRITE;
/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
INSERT INTO `instrument` VALUES (1,'544921','Steinway','D','1990','Grand','4301',0,'',98800,79040,80,1.3,0.4,0.6,0.8,0.1,0,'2007-05-16 21:25:23','2007-01-01 00:00:00'),(2,'465841','Steinway','D841','1979','Grand','4301',1,'',98800,79040,80,1,0.4,0.6,0.8,0.1,0,'2007-05-17 12:51:49','2007-05-12 02:37:42'),(4,'1879505','Kawai','G3','1989','Upright','4304',0,'Those questions often evolved into great conversations. Each friend told us their favorite artists and songs, explored the music we suggested, gave us feedback, and we in turn made new suggestions. Everybody started joking that we were now their personal DJs.',6690,5352,80,1,1.2,0.6,1.7,1.8,0,'2007-05-16 21:27:25','2007-05-12 02:47:21'),(5,'370462','Steinway','B','1961','Grand','4306',0,'',66300,53040,80,0.6,0.4,0.6,0.6,1.8,0,'2007-05-16 21:29:02','2007-05-12 02:49:14'),(6,'79457-E','Steinway','C','1893','Grand','4308',0,'9/18/95- Needs a complete examination of action geometry before next replacement of parts. Also needs examination of rear duplex placement. ',93200,74560,80,0.6,0.4,0.6,0.6,0.1,0,'2007-05-16 22:53:32','2007-05-16 21:36:31'),(7,'385428','Steinway','B','1964','Grand','4308',0,'',66300,53040,80,0.8,0.4,0.6,2,1,0,'2007-05-16 21:39:03','2007-05-16 21:39:03'),(8,'2','Clark','Tibaut','2003','Harpischord','4308',0,'Donated by John and Alice Cooper 12/03.',27300,0,80,1.3,0.4,0.6,1.3,0.1,0,'2007-05-16 22:26:49','2007-05-16 21:41:08'),(9,'352','Hub','Hass','2000','Harpischord','4309',0,'',30450,0,80,1.3,0.4,0.6,1.3,0.1,0,'2007-05-16 21:47:49','2007-05-16 21:47:49'),(10,'1329439','Kawai','UST 7','1982','Upright','4309',0,'',6690,5352,80,1,1.2,0.6,1.7,1.8,0,'2007-05-16 21:49:53','2007-05-16 21:49:53'),(11,'385429','Steinway','B','1964','Grand','4210',0,'9/18/95 - After the completion of restringing, hammer filing and regulation this B became one of the best in the neighborhood. I experimented with keeping the old tuning pins in since the were sufficiently tight.',66300,53040,80,1,0.4,0.6,0.6,0.4,0,'2007-05-16 22:27:01','2007-05-16 22:01:51'),(13,'319653 A','Steinway','D','1946','Grand','3104',0,'9/18/95-When this piano had itâ€™s interior reconditioned in 1994 the plate at the no. 1 & 2 plate bolts was found to be very high after removing the bolts. After replacing the pinblock and turning down the nose bolts slightly it was  lowered a little. One could observe that some kind of stress load creep had occurred. This may have been a manufacturing defect as well.  It was decided to not attempt further alterations if indeed any are possible. The piano has lasted this long with the plate torqued and the budget would not allow a major reconditioning to correct the problem.',98800,79040,80,1.3,0.4,0.6,0.6,0.4,0,'2007-05-16 22:15:52','2007-05-16 22:15:52'),(14,'27200','Bose','290','1952','Grand','3105',0,'9/18/95-The humidity control system has worked well for this piano but it could stand some redesigning to increase sturdiness.',179546,143637,80,0.6,0.4,1,2,0.1,0,'2007-05-16 22:17:10','2007-05-16 22:17:10'),(15,'77336','Bluthner','6','1908','Grand','3206',0,'donated by Anne Karp',77230,61784,80,1.3,0.6,0.6,2,1.3,0,'2007-05-16 22:18:55','2007-05-16 22:18:55'),(16,'65083','Knabe','6 4','1908','Grand','3210',0,'Donated to IC by Brunstein family in honor of cousin.',49400,47520,80,1.3,0.4,0.6,1,1.3,0,'2007-05-16 22:21:46','2007-05-16 22:21:46'),(17,'19391','Mason and Rich','BB','1910','Grand','3302',0,'9/18/95-The front treble duplex bars need replacing. For whatever reason the old wood bars were not replaced when the piano was reconditioned and tonal quality consequently suffers. New brass duplex bars are in the shop.',59322,47458,80,1.3,0.4,0.6,1,1,0,'2007-05-16 22:25:57','2007-05-16 22:25:57'),(18,'60022','Steinway','B','1887','Grand','2211',0,'This is an 85 note piano.',66300,53040,80,1,0.4,0.6,1,1.3,0,'2007-05-16 22:52:10','2007-05-16 22:36:36');
/*!40000 ALTER TABLE `instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `firstName` varchar(100) default NULL,
  `middleName` varchar(100) default NULL,
  `lastName` varchar(100) default NULL,
  `title` varchar(20) default NULL,
  `phone` varchar(20) default NULL,
  `email` varchar(100) default NULL,
  `address` varchar(100) default NULL,
  `groupId` int(10) unsigned default NULL,
  `login` varchar(40) default NULL,
  `password` varchar(33) NOT NULL default '',
  `isDeleted` int(1) unsigned default '0',
  `updatedAt` datetime NOT NULL default '0000-00-00 00:00:00',
  `createdAt` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Will','','Fleming','','','','',9,'will','4d2127bd4e3c8d4de55317271f6d9f91',0,'2007-05-14 20:38:37','2007-05-10 21:29:42'),(3,'Henry','','Mason','','','','',9,'henry','027e4180beedb29744413a7ea6b84a42',0,'2007-05-10 21:29:42','2007-05-10 21:29:42'),(4,'Keith','','Bodin','','','','',9,'keith','8dd9fa632ca161d0ca1929a4d99cbe77',0,'2007-05-10 21:29:42','2007-05-10 21:29:42'),(5,'Leo','','Baghdassarian','','','','',9,'leo','0f759dd1ea6c4c76cedc299039ca4f23',0,'2007-05-17 13:24:44','2007-05-10 21:29:42'),(6,'Graeme','','Bailey','','','','',6,'','',1,'2007-05-16 22:43:03','2007-05-10 21:29:42'),(7,'Abbey','','Normal','ghost','','','',0,'','',1,'2007-05-10 21:29:42','2007-05-10 21:29:42'),(8,'David','','Schwartz','','','','',6,'','',0,'2007-05-13 01:00:48','2007-05-13 01:00:48'),(9,'Claire','','Cardie','','','','',6,'','',0,'2007-05-13 01:01:16','2007-05-13 01:01:03');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedure`
--

DROP TABLE IF EXISTS `procedure`;
CREATE TABLE `procedure` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `ticketId` int(11) unsigned NOT NULL default '0',
  `startDate` datetime default NULL,
  `amount` int(11) default NULL,
  `description` text NOT NULL,
  `proceduretypeId` int(11) unsigned NOT NULL default '0',
  `updatedAt` datetime NOT NULL default '0000-00-00 00:00:00',
  `createdAt` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `procedure`
--

LOCK TABLES `procedure` WRITE;
/*!40000 ALTER TABLE `procedure` DISABLE KEYS */;
INSERT INTO `procedure` VALUES (9,5,'2007-05-17 00:00:00',0,'I put them out.',12,'2007-05-17 12:50:22','2007-05-17 12:50:07');
/*!40000 ALTER TABLE `procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceduretype`
--

DROP TABLE IF EXISTS `proceduretype`;
CREATE TABLE `proceduretype` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proceduretype`
--

LOCK TABLES `proceduretype` WRITE;
/*!40000 ALTER TABLE `proceduretype` DISABLE KEYS */;
INSERT INTO `proceduretype` VALUES (1,'Voicing'),(2,'Selective regulation'),(3,'Comprehensive regulation'),(4,'Action repair'),(5,'Action reconditioning'),(6,'Interior repair'),(7,'Interior reconditioning'),(8,'Case repair'),(9,'Case refinishing'),(10,'Cleaning'),(11,'Humidity control'),(12,'Miscellaneous');
/*!40000 ALTER TABLE `proceduretype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuning`
--

DROP TABLE IF EXISTS `tuning`;
CREATE TABLE `tuning` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `ticketId` int(11) unsigned NOT NULL default '0',
  `amount` int(11) default NULL,
  `tuningtypeId` int(11) unsigned NOT NULL default '0',
  `direction` enum('raise','lower') NOT NULL default 'raise',
  `updatedAt` datetime NOT NULL default '0000-00-00 00:00:00',
  `createdAt` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tuning`
--

LOCK TABLES `tuning` WRITE;
/*!40000 ALTER TABLE `tuning` DISABLE KEYS */;
INSERT INTO `tuning` VALUES (4,7,3,1,'lower','2007-05-11 16:16:07','2007-05-11 16:16:07'),(5,11,7,1,'lower','2007-05-17 12:58:48','2007-05-12 13:18:42'),(6,12,3,2,'raise','2007-05-17 13:03:40','2007-05-17 13:03:40');
/*!40000 ALTER TABLE `tuning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuningtype`
--

DROP TABLE IF EXISTS `tuningtype`;
CREATE TABLE `tuningtype` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tuningtype`
--

LOCK TABLES `tuningtype` WRITE;
/*!40000 ALTER TABLE `tuningtype` DISABLE KEYS */;
INSERT INTO `tuningtype` VALUES (1,'Tuning'),(2,'Touch up'),(3,'Pitch adjustment');
/*!40000 ALTER TABLE `tuningtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workticket`
--

DROP TABLE IF EXISTS `workticket`;
CREATE TABLE `workticket` (
  `id` int(11) NOT NULL auto_increment,
  `createdBy` int(11) unsigned default NULL,
  `instrumentId` int(11) unsigned NOT NULL default '0',
  `performedBy` int(11) unsigned NOT NULL default '0',
  `dateCompleted` datetime NOT NULL default '0000-00-00 00:00:00',
  `timeSpent` float NOT NULL default '0',
  `description` text NOT NULL,
  `status` enum('unread','in progress','done','waiting') NOT NULL default 'unread',
  `updatedAt` datetime NOT NULL default '0000-00-00 00:00:00',
  `createdAt` datetime NOT NULL default '0000-00-00 00:00:00',
  `updatedBy` int(11) unsigned default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workticket`
--

LOCK TABLES `workticket` WRITE;
/*!40000 ALTER TABLE `workticket` DISABLE KEYS */;
INSERT INTO `workticket` VALUES (1,1,6,1,'2007-06-01 00:00:00',0,'Keys are broken','unread','2007-05-17 12:49:26','2007-05-10 00:00:00',5),(2,3,1,1,'2007-06-01 00:00:00',3,'Fix the box marked broken.','done','2007-05-17 13:02:19','2007-05-10 01:00:00',5),(3,3,1,1,'2007-06-01 00:00:00',1,'Fix the strings marked flawed.','done','2007-05-17 13:05:22','2007-05-10 02:00:00',5),(4,4,13,4,'2007-06-01 00:00:00',3,'Fix the the legs, they are broken.','in progress','2007-05-17 13:03:23','2007-05-10 03:00:00',5),(5,1,1,1,'2007-05-11 16:09:36',1.3,'Things are on fire.','done','2007-05-17 12:50:22','2007-05-11 16:09:36',5),(6,1,10,1,'2007-05-11 16:14:54',17,'Keys are missing','unread','2007-05-17 13:04:22','2007-05-11 16:14:54',5),(7,1,9,3,'2007-05-11 16:16:06',17,'Tuning will not hold','waiting','2007-05-17 12:52:28','2007-05-11 16:16:06',5),(8,1,13,3,'2007-05-11 16:17:10',0,'Piano has been painted','done','2007-05-17 13:04:55','2007-05-11 16:17:10',5),(9,1,10,1,'2007-05-11 16:17:28',2,'Complete action reconditioning','in progress','2007-05-17 13:00:50','2007-05-11 16:17:28',5),(10,4,2,4,'2007-05-12 11:00:30',10,'Voicing issues','waiting','2007-05-17 12:51:10','2007-05-12 11:00:30',5),(11,4,7,4,'2007-05-12 11:00:54',7,'Keys are off, needs attention','done','2007-05-17 12:58:48','2007-05-12 11:00:54',5),(12,4,1,0,'2007-05-12 13:01:29',10,'fix everything','done','2007-05-17 13:03:40','2007-05-12 13:01:29',5),(13,4,17,4,'2007-05-12 13:02:28',1,'Waiting on part from CU','waiting','2007-05-17 13:02:06','2007-05-12 13:02:28',5),(14,4,17,5,'2007-05-12 13:21:45',3,'We need more cowbell','in progress','2007-05-17 12:56:56','2007-05-12 13:21:45',5),(15,4,8,5,'2007-05-12 20:10:05',4,'please tune.','unread','2007-05-17 12:57:44','2007-05-12 20:10:05',5),(16,5,15,0,'2007-05-17 13:25:57',0,'Tuning is off','unread','2007-05-17 13:25:57','2007-05-17 13:25:57',5),(17,5,0,0,'2007-05-17 13:27:01',0,'Move Request: Hub Has (#352) to room 3408','unread','2007-05-17 13:27:01','2007-05-17 13:27:01',5);
/*!40000 ALTER TABLE `workticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2007-05-17 17:30:33
