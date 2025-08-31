-- MariaDB dump 10.19  Distrib 10.5.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jsxhqluyvjfnzlincqiwxzemutiapqxvhbdp` (`primaryOwnerId`),
  CONSTRAINT `fk_cpraapdehqooxmbfceiiihcwmsajmitqdulf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jsxhqluyvjfnzlincqiwxzemutiapqxvhbdp` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_itarfbozhuxhwgwyjezhksyrbezjryirwmut` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_zbrfyitrwhhigpetlzxfrbticwmaosodmjpz` (`dateRead`),
  KEY `fk_uwticreiqhshxtkgpoxpxynpyuegqmrksnle` (`pluginId`),
  CONSTRAINT `fk_lvudoeceygmwrrqeeofytcixaaijzzzwnieg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uwticreiqhshxtkgpoxpxynpyuegqmrksnle` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ikgagniahxfwejqxkqncxrvrpfeloiflbegg` (`sessionId`,`volumeId`),
  KEY `idx_xqjprnzuwelphkdffiawimkmgzrasrnoemes` (`volumeId`),
  CONSTRAINT `fk_cxuusaimsngymxwfviiynwlufkbnalopkjfa` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vrkwvasihqybpwvzxgbwltxyqmvhncncbqtv` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kgxelieypxlodvgvtrkorrgemztncosjeuue` (`filename`,`folderId`),
  KEY `idx_icohbovqoackuszzxcnemeplnatzudebuzgd` (`folderId`),
  KEY `idx_bzlvsymtciotpimxaxfkpwdxfebjjkjtqftx` (`volumeId`),
  KEY `fk_ikfdxymgydwrfohrsehzxaikkqjtnzarhrie` (`uploaderId`),
  CONSTRAINT `fk_ejcotxejhyhfspucyhphfegkeagjjuxtbhvg` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_emeqgvsihnynxqpmbbhhhzesgubahffqeecv` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ikfdxymgydwrfohrsehzxaikkqjtnzarhrie` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xfxyorpojsdvoacachowgxxaysuhvnuroylw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_qzrbgcgijhinjkcxwuzmlgmyipiqdqbqzppa` (`siteId`),
  CONSTRAINT `fk_iximpswowufwpwkybqdhvfbenysxoeaakpct` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qzrbgcgijhinjkcxwuzmlgmyipiqdqbqzppa` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_oauth_tokens`
--

DROP TABLE IF EXISTS `auth_oauth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_oauth_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerHandle` varchar(255) NOT NULL,
  `providerType` varchar(255) NOT NULL,
  `tokenType` varchar(255) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `accessToken` text,
  `secret` text,
  `expires` varchar(255) DEFAULT NULL,
  `refreshToken` text,
  `resourceOwnerId` varchar(255) DEFAULT NULL,
  `values` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_xdnroiqnrqsovlqmwireyhkwiccayqmtfnnu` (`userId`),
  CONSTRAINT `fk_xdnroiqnrqsovlqmwireyhkwiccayqmtfnnu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_caches`
--

DROP TABLE IF EXISTS `blitz_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_caches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteId` int NOT NULL,
  `uri` varchar(255) NOT NULL,
  `paginate` int DEFAULT NULL,
  `dateCached` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_keexzcqxwtfxnqcokmnhakukhmvmnxiajwmk` (`siteId`,`uri`),
  KEY `idx_kpgbdzptjnxintcnvhzzxjhezojzjsqxhevu` (`expiryDate`),
  CONSTRAINT `fk_yskalbpkwaehugpsypyguyqfckosfypswwee` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_cachetags`
--

DROP TABLE IF EXISTS `blitz_cachetags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_cachetags` (
  `cacheId` int NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`cacheId`,`tag`),
  KEY `idx_wyyitgtjirdwapgjlcjpxcqpaqywnirmtqwz` (`tag`),
  CONSTRAINT `fk_esmhrwuosebgnjoadsyeordmehzxoadahxpg` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_driverdata`
--

DROP TABLE IF EXISTS `blitz_driverdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_driverdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `driver` varchar(255) NOT NULL,
  `data` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementcaches`
--

DROP TABLE IF EXISTS `blitz_elementcaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_elementcaches` (
  `cacheId` int NOT NULL,
  `elementId` int NOT NULL,
  PRIMARY KEY (`cacheId`,`elementId`),
  KEY `fk_besocqtlvteftptpbhyiexmtyjydlxqknehe` (`elementId`),
  CONSTRAINT `fk_besocqtlvteftptpbhyiexmtyjydlxqknehe` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cqpckpkdmoljaomegkcwtzpfpbtrpzuiztds` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementexpirydates`
--

DROP TABLE IF EXISTS `blitz_elementexpirydates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_elementexpirydates` (
  `elementId` int NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`),
  UNIQUE KEY `idx_qiumbxnasucgzxgipmgpbhxqdatxyinunrri` (`elementId`),
  KEY `idx_jghedbwdfklqjcqtrmfimtnepapjrrortata` (`expiryDate`),
  CONSTRAINT `fk_nmcayownfigmmjazgcxruogxnxrcmyuptqov` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementfieldcaches`
--

DROP TABLE IF EXISTS `blitz_elementfieldcaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_elementfieldcaches` (
  `cacheId` int NOT NULL,
  `elementId` int NOT NULL,
  `fieldInstanceUid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cacheId`,`elementId`,`fieldInstanceUid`),
  KEY `fk_vwnwjovnflubuismdszgiwxvxzexvjyyqzrt` (`elementId`),
  CONSTRAINT `fk_uhqjpnaxsnprydyrqnqwfvsxtbxdmsbavmpb` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vwnwjovnflubuismdszgiwxvxzexvjyyqzrt` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementqueries`
--

DROP TABLE IF EXISTS `blitz_elementqueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_elementqueries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `index` bigint NOT NULL,
  `type` varchar(255) NOT NULL,
  `params` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iwdlajdyxkdastfrwggwumrmogrwjlbueekl` (`index`),
  KEY `idx_vouydslwndhhcjblodlmfahakyvzerrumdcd` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementqueryattributes`
--

DROP TABLE IF EXISTS `blitz_elementqueryattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_elementqueryattributes` (
  `queryId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  PRIMARY KEY (`queryId`,`attribute`),
  CONSTRAINT `fk_kvijygdeosnxdkfqgesvhyiatigwentrgawd` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementquerycaches`
--

DROP TABLE IF EXISTS `blitz_elementquerycaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_elementquerycaches` (
  `cacheId` int NOT NULL,
  `queryId` int NOT NULL,
  PRIMARY KEY (`cacheId`,`queryId`),
  KEY `fk_xkmnefekvhkddpasdhpkptcmxxtyfzoukiai` (`queryId`),
  CONSTRAINT `fk_cznoheizauxtkfkntyjpsexzqfkfkhjwdnvh` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xkmnefekvhkddpasdhpkptcmxxtyfzoukiai` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementqueryfields`
--

DROP TABLE IF EXISTS `blitz_elementqueryfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_elementqueryfields` (
  `queryId` int NOT NULL,
  `fieldInstanceUid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`queryId`,`fieldInstanceUid`),
  CONSTRAINT `fk_lmuvpvogyxiwexxwkweeukgiwikifvjbsivb` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementquerysources`
--

DROP TABLE IF EXISTS `blitz_elementquerysources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_elementquerysources` (
  `queryId` int NOT NULL,
  `sourceId` int NOT NULL,
  PRIMARY KEY (`queryId`,`sourceId`),
  CONSTRAINT `fk_unacrwgdkknazcdvlvmqwbdxidtzwwsxaltu` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_hints`
--

DROP TABLE IF EXISTS `blitz_hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_hints` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `template` varchar(255) NOT NULL,
  `line` int DEFAULT NULL,
  `stackTrace` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_albqwnetmmsayehiyvurmpnuxkdcegynywog` (`fieldId`,`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_includes`
--

DROP TABLE IF EXISTS `blitz_includes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_includes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `index` bigint NOT NULL,
  `siteId` int NOT NULL,
  `template` varchar(255) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mojsivtwuwwkiwuofbgtrbtpskhxftimknaz` (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_ssiincludecaches`
--

DROP TABLE IF EXISTS `blitz_ssiincludecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_ssiincludecaches` (
  `cacheId` int NOT NULL,
  `includeId` int NOT NULL,
  PRIMARY KEY (`cacheId`,`includeId`),
  KEY `fk_cogfhwvufgktvjoxfchlizcghguavvampten` (`includeId`),
  CONSTRAINT `fk_cogfhwvufgktvjoxfchlizcghguavvampten` FOREIGN KEY (`includeId`) REFERENCES `blitz_includes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ymguqultcwayhoulbircdfhtfbrvktbjmkfc` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pbxpjcfzwseyohfgvimcdyhwusaiyplpvxbe` (`groupId`),
  KEY `fk_ibicrpndqzfvrdtzolkyoslbbpwtcznadfwh` (`parentId`),
  CONSTRAINT `fk_iaycgbgxvqfqfjqdqsdthwrqivwpxadjyqjw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ibicrpndqzfvrdtzolkyoslbbpwtcznadfwh` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lwrxjflrscusyfqstwdzqoxdwtisrpvaluvk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lrgxjwfmtzhbltmzfubvxtoehwbubsfbtweg` (`name`),
  KEY `idx_ndljvoshhuzlyrsccoxzcpmmfkbibrnhyyck` (`handle`),
  KEY `idx_pfxxnchayyfliodybwcvzecocccvpzbnnfvr` (`structureId`),
  KEY `idx_ctszsdxndikhffxrgkervhmjlxrpswzgratf` (`fieldLayoutId`),
  KEY `idx_lgxldtszamizimmpelhdfuzclbhkcziqucwz` (`dateDeleted`),
  CONSTRAINT `fk_aamqfmmkgevdkoctmploocpexismpqsqbrmm` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ixgprrvbupfgyolflyutadwobcrrpwlrlqzp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nuzuhekwbkvxwhggzpxjievuxrtieqagpjbv` (`groupId`,`siteId`),
  KEY `idx_hcyvhmkclkdhbcszwlswvfhcllxddxwurvjb` (`siteId`),
  CONSTRAINT `fk_iogjoftcvqdcbtfkvbeakjqmwosmnsrebwfb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xtrwcodidmyzfkntuovnsmfcloecybncuqem` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_jffyeezfmkrxzrtkwmfvxjyeknxiavjivxwu` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_oetxtqonuifsrttmxwpuhhwohopptszpbesq` (`siteId`),
  KEY `fk_ewwuxsujlgnhnuokucndlglslayhskexyrvr` (`userId`),
  CONSTRAINT `fk_ewwuxsujlgnhnuokucndlglslayhskexyrvr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_oetxtqonuifsrttmxwpuhhwohopptszpbesq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pnupmbycorahmysgdfsduvvjmbjqxmknokbu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_hsknbaqsmvjeschcstsqhynasbvccghmkfgs` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_nywgijbtiulzjtlprkwkddhqpvdmtzfihqhv` (`siteId`),
  KEY `fk_ekoxjejvxjxbphhiqskykazkukqbwkmqcdoq` (`fieldId`),
  KEY `fk_fzpufigpqkjvgvsyuvsxtgbttdyuhqiyylrt` (`userId`),
  CONSTRAINT `fk_ekoxjejvxjxbphhiqskykazkukqbwkmqcdoq` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fzpufigpqkjvgvsyuvsxtgbttdyuhqiyylrt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_nywgijbtiulzjtlprkwkddhqpvdmtzfihqhv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vmigklbkbznsohtfcqhllfrnmmhonjujovqc` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_spwqsztvaicmkmsofqbrvxshibdyvklkyyof` (`userId`),
  CONSTRAINT `fk_spwqsztvaicmkmsofqbrvxshibdyvklkyyof` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_twqzwsgmcncffeewpnsszugzqsvnizntoozg` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_yxtdzvjjrpjcbigstydqczsnpubpdqsdulgt` (`creatorId`,`provisional`),
  KEY `idx_yykgomtxevsxwnjnnboirwstqzizuinhywao` (`saved`),
  KEY `fk_lszummovbfvncrtfanmjtuspeklwukzsawqo` (`canonicalId`),
  CONSTRAINT `fk_debidyawjviqikoiairqrjksghpiwytigvpi` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lszummovbfvncrtfanmjtuspeklwukzsawqo` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_xkolgqizfzuewgmuisduonpwvexqmfgqtrge` (`elementId`,`timestamp`,`userId`),
  KEY `fk_ioqfjatukitgkvfaydvqfxjzaxudrzmkpfbi` (`userId`),
  KEY `fk_qprqgmdvojogvdhrgsnkstevadzpharmpupm` (`siteId`),
  KEY `fk_okvmuaptafrdzjzklqwgxhtzcquruxsdaxuo` (`draftId`),
  CONSTRAINT `fk_ioqfjatukitgkvfaydvqfxjzaxudrzmkpfbi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_okvmuaptafrdzjzklqwgxhtzcquruxsdaxuo` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qprqgmdvojogvdhrgsnkstevadzpharmpupm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sjzzlqupdrkzkfhpxhncqirgguvrxiigkppw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ayytvwubugibmvcvljqnwhofutjkgqspkbcw` (`dateDeleted`),
  KEY `idx_nmodekckmitnukbyodupkznhvflryerphqlp` (`fieldLayoutId`),
  KEY `idx_kjymzdazcaroubfiibztpaxzlzdxwbuijevl` (`type`),
  KEY `idx_tapmwjvxfelyofxfiwgpbuslswvazqevmjvl` (`enabled`),
  KEY `idx_tzewbcvrnsqaxqizltvszqwfzgvcrpmydzls` (`canonicalId`),
  KEY `idx_asjqjsexuweslzhkkemtzifbuwdwqnkvfiep` (`archived`,`dateCreated`),
  KEY `idx_hxxlneqebkfjzwzhkfwqveklfhldrqktbhpv` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_jjleffkbekytjostmybrzcbiaidfounevlgw` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_ofathmsfnzhqcutzcaibybvapookyjenuvno` (`draftId`),
  KEY `fk_njbjtrolykslutwheyieybeqzmysrskkfolu` (`revisionId`),
  CONSTRAINT `fk_njbjtrolykslutwheyieybeqzmysrskkfolu` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ofathmsfnzhqcutzcaibybvapookyjenuvno` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pmximvtgbugfisoqcezutlklemyzohvqxevl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_umecanklhakzbjzhsjjjxmtuzofzywugwcom` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_gifxtrmmemackqgzutkfbvpaoztyinpbjxbr` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_safbinjkgsdpmnlhlsdkxmnpsmtlqoxzxsjh` (`ownerId`),
  CONSTRAINT `fk_safbinjkgsdpmnlhlsdkxmnpsmtlqoxzxsjh` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_udhstrmswpbzbpjludbzgjeshfqjbwolypfz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qbjbrjaanygepbznseeauowpnlezomqgdxip` (`elementId`,`siteId`),
  KEY `idx_nolsbzfbtcchmrmklfoccqdhwihbgvkdthpx` (`siteId`),
  KEY `idx_acpikiismuvphiogadoptmdthotemxhcdpwg` (`title`,`siteId`),
  KEY `idx_rjusdqqreqhopfsngumcqeadvvddyvbsywvj` (`slug`,`siteId`),
  KEY `idx_kvmvbqmuyrobpuvejkojuqcergubjzgimovg` (`enabled`),
  KEY `idx_mijswcyofuyigjrujjkwccmitoriazisreuj` (`uri`,`siteId`),
  CONSTRAINT `fk_crkeboddvepsqmwchhxxbyybmljnstvocumy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vttlkbsbwnqzvhnhuhkxoeimkdvoycpvhbsa` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ibnyytwpzvcqfiwjqmonfumqqedueulhjglq` (`postDate`),
  KEY `idx_yqkmibklagbuskucafhiamiahoylqzfriiji` (`expiryDate`),
  KEY `idx_caukdkyfxsfncscykofijlrljgxovoqtybzd` (`sectionId`),
  KEY `idx_pmodqntesyyijlmwsdocivtnvhcanyfjyent` (`typeId`),
  KEY `idx_qxsynsnupjislwyvphgzrkkiajspwctnlbkv` (`primaryOwnerId`),
  KEY `idx_gdlxhnrvxtltkbqljhwbxssvcgpfpcwzxbzy` (`fieldId`),
  KEY `fk_btywyqjfclnosntdjtigvsgghahfiyyokkil` (`parentId`),
  CONSTRAINT `fk_btywyqjfclnosntdjtigvsgghahfiyyokkil` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_cfunzhpazdlmwbpteqebfssyhizsdjarkwop` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dczjtbbzpaokzhujhyubhntzudfwynjwlutt` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qdwfvzjfrxhmquugnutchddfzpfpfeifljwd` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qfngkacbmryjjogkchgguqhlxfshoabjypwb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ylbdmocjfijufjxhnkjxlrtibxoeutiznban` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_kdlguicponiudmqdjgmbpnrszcdqiwqtyrco` (`authorId`),
  KEY `idx_ljdzqbwpuygnhcvxglueplbupbfnwpawcnri` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_ltdhqgpcpsyujbizdmfniswcafgthzpiqryu` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vxdltosqwqfwmwpbqxxvvchteqnstvhztbjl` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lefdrnmntqvfiveskrwaophguyzvscokkknb` (`fieldLayoutId`),
  KEY `idx_pxaqeioexezoenouypgginqomblvzycmsqcl` (`dateDeleted`),
  CONSTRAINT `fk_uovrjqpifjtxucbxryndhpmpltxnwqidfakp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_asfpdpycyizrqbnesimdeybqdxfcwykgvedl` (`dateDeleted`),
  KEY `idx_byomkhysfsvapryoiumwlgpkajqcfytiyyfj` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_adfpvutywtlgdcfvxtpirazivcnfmvjzumuf` (`handle`,`context`),
  KEY `idx_jrtqsneewqzxixiffrbvwxlvguzyyplgszjw` (`context`),
  KEY `idx_soraqtatsxuhzfvjrelksslwbaxqcqxjjgwh` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_emailtemplates`
--

DROP TABLE IF EXISTS `formie_emailtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_emailtemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_fieldlayout_pages`
--

DROP TABLE IF EXISTS `formie_fieldlayout_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_fieldlayout_pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `label` text NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_elhxqikucvzdmafkcrmurcejjahvfludiofm` (`layoutId`),
  CONSTRAINT `fk_sktvayxjzaypggszjoxaonjvubtmfyukkdnc` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_fieldlayout_rows`
--

DROP TABLE IF EXISTS `formie_fieldlayout_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_fieldlayout_rows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `pageId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pfjfulubyulnxvtjkxmzhjlsmqbswaldxozn` (`layoutId`),
  KEY `idx_omasrajguvqvtfirufsnrvbimypotgajtkyj` (`pageId`),
  CONSTRAINT `fk_lxejzzhyoiwarckguxykwjffcwbvuyyvsgtu` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rrdwviethlltzlrrjefmgdbpqsotysgcqurz` FOREIGN KEY (`pageId`) REFERENCES `formie_fieldlayout_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_fieldlayouts`
--

DROP TABLE IF EXISTS `formie_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_fields`
--

DROP TABLE IF EXISTS `formie_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `pageId` int NOT NULL,
  `rowId` int NOT NULL,
  `syncId` int DEFAULT NULL,
  `label` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tehunfjkdnctcllgtztqiimerzvcgyeizhcq` (`layoutId`),
  KEY `idx_hmhkczuqzddfnhecvkcroequqwpnlvnolvvb` (`pageId`),
  KEY `idx_gnfxtsfpypvelacezgjpnmvhirzafvdahqym` (`rowId`),
  KEY `idx_tzafqknvjdgfbupfxvfhihtqkaesbsnoxoey` (`syncId`),
  KEY `idx_qfzkvudjvzbeafarztbsncecixbpbyviefao` (`handle`),
  CONSTRAINT `fk_ltaybaaeiljeamsnedpfeovzvldonqlezqvz` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_neiqtwhdydfjasvxtwqkencadbbljkivqzuo` FOREIGN KEY (`syncId`) REFERENCES `formie_fields` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_scystvmcuarpardgskwvbfcliiwnzlcrflfk` FOREIGN KEY (`pageId`) REFERENCES `formie_fieldlayout_pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xrywzuzbpocifyetupgpuyuilzliiyqcydmp` FOREIGN KEY (`rowId`) REFERENCES `formie_fieldlayout_rows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_forms`
--

DROP TABLE IF EXISTS `formie_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_forms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(64) NOT NULL,
  `settings` mediumtext,
  `layoutId` int DEFAULT NULL,
  `templateId` int DEFAULT NULL,
  `submitActionEntryId` int DEFAULT NULL,
  `submitActionEntrySiteId` int DEFAULT NULL,
  `defaultStatusId` int DEFAULT NULL,
  `dataRetention` enum('forever','minutes','hours','days','weeks','months','years') NOT NULL DEFAULT 'forever',
  `dataRetentionValue` int DEFAULT NULL,
  `userDeletedAction` enum('retain','delete') NOT NULL DEFAULT 'retain',
  `fileUploadsAction` enum('retain','delete') NOT NULL DEFAULT 'retain',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qpjpjiqcsofpgpnndjbhukfaameiwjiqylho` (`layoutId`),
  KEY `idx_ddxkmtnvnnmuxpgxeoaaegldkjfetryhihxj` (`templateId`),
  KEY `idx_dsicsyolxwocgbmmwlfzutllwyxnyrmsjjfy` (`defaultStatusId`),
  KEY `idx_qocloajerboceupfpkgdbilolxxdksuedico` (`submitActionEntryId`),
  KEY `idx_hcpnmntqhzqwqrhmbbhgbiktdmmpqlmmmpdc` (`submitActionEntrySiteId`),
  CONSTRAINT `fk_evgzcvmofdrhvsibhobsujutmoqnsnwykwbd` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kxbknebpdxaxaphfrkhszadnljpjowwuqpwz` FOREIGN KEY (`defaultStatusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qefoacyorxruohqdplrkgwwkgoqjfsvrutvv` FOREIGN KEY (`submitActionEntryId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vcueujsgoqzeyfwxsfabmxvlcdsrejogywmj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wvgvidfattntwmookvrrumtusdgmxqjgxhwe` FOREIGN KEY (`templateId`) REFERENCES `formie_formtemplates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_formtemplates`
--

DROP TABLE IF EXISTS `formie_formtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_formtemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) DEFAULT NULL,
  `useCustomTemplates` tinyint(1) DEFAULT '1',
  `outputCssLayout` tinyint(1) DEFAULT '1',
  `outputCssTheme` tinyint(1) DEFAULT '1',
  `outputJsBase` tinyint(1) DEFAULT '1',
  `outputJsTheme` tinyint(1) DEFAULT '1',
  `outputCssLocation` varchar(255) DEFAULT NULL,
  `outputJsLocation` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ztlxaptfmbzukgkqgojlvbosvosxcswakjdo` (`fieldLayoutId`),
  CONSTRAINT `fk_qkfmifmyoniyfrnnaesqbucwilyiqyygzbtz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_integrations`
--

DROP TABLE IF EXISTS `formie_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_integrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `settings` text,
  `cache` longtext,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_notifications`
--

DROP TABLE IF EXISTS `formie_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formId` int NOT NULL,
  `templateId` int DEFAULT NULL,
  `pdfTemplateId` int DEFAULT NULL,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `subject` text,
  `recipients` enum('email','conditions') NOT NULL DEFAULT 'email',
  `to` text,
  `toConditions` text,
  `cc` text,
  `bcc` text,
  `replyTo` text,
  `replyToName` text,
  `from` text,
  `fromName` text,
  `sender` text,
  `content` text,
  `attachFiles` tinyint(1) DEFAULT '1',
  `attachPdf` tinyint(1) DEFAULT '0',
  `attachAssets` text,
  `enableConditions` tinyint(1) DEFAULT '0',
  `conditions` text,
  `customSettings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_meqhqjojjpnfcmeehjpcosaeqgtyztckzdgr` (`formId`),
  KEY `idx_iudwjbykclmqulbjgfwdzdueajelbvcmwrmc` (`templateId`),
  KEY `fk_squlqqjxbaxdjvlokimirrmgdxvyomtucwzn` (`pdfTemplateId`),
  CONSTRAINT `fk_lsvtnjgyngglofxdeuveavtstvtcocyngqsk` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_squlqqjxbaxdjvlokimirrmgdxvyomtucwzn` FOREIGN KEY (`pdfTemplateId`) REFERENCES `formie_pdftemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zqoionsowqjkrhoplzhspiclsxxhkkjhoaec` FOREIGN KEY (`templateId`) REFERENCES `formie_emailtemplates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_payments`
--

DROP TABLE IF EXISTS `formie_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int NOT NULL,
  `submissionId` int NOT NULL,
  `fieldId` int NOT NULL,
  `subscriptionId` int DEFAULT NULL,
  `amount` decimal(14,4) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `status` enum('pending','redirect','success','failed','processing') NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `message` text,
  `note` mediumtext,
  `response` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ihtlhlriwcsmrcjedpsgkfzsdtydmetzeraa` (`integrationId`),
  KEY `idx_nnurtldurmyyzhptptybekoifkvtknikzide` (`fieldId`),
  KEY `idx_kzadarpfnnftpzvinatobzdbnugktmwffirv` (`reference`),
  KEY `fk_azxcjhjnktadbmwpkfchnhgeckhqfdcnufgp` (`submissionId`),
  KEY `fk_hkkwqxpnnjnkqmggbwbtmefjqhuffpemuqhq` (`subscriptionId`),
  CONSTRAINT `fk_azxcjhjnktadbmwpkfchnhgeckhqfdcnufgp` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hkkwqxpnnjnkqmggbwbtmefjqhuffpemuqhq` FOREIGN KEY (`subscriptionId`) REFERENCES `formie_payments_subscriptions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mmwsrawaazzokqafyntgxciolbsotyiamtdp` FOREIGN KEY (`fieldId`) REFERENCES `formie_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sjyypxxctvcdpwvxatiyehrllufbwbdwiuad` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_payments_plans`
--

DROP TABLE IF EXISTS `formie_payments_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_payments_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `planData` text,
  `isArchived` tinyint(1) NOT NULL,
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_utlgmkdzlolzvgflfvnoyjbbeagphukbxdne` (`handle`),
  KEY `idx_rbgasarnvfutqymutsllwscouxajbclihgos` (`integrationId`),
  KEY `idx_zzcoiccfmcrrouuqgyczfgidptnbfoywgahq` (`reference`),
  CONSTRAINT `fk_mojrpwrywcrbgrzasefiukpecmuszizokoot` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_payments_subscriptions`
--

DROP TABLE IF EXISTS `formie_payments_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_payments_subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int DEFAULT NULL,
  `submissionId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `planId` int DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `subscriptionData` text,
  `trialDays` int NOT NULL,
  `nextPaymentDate` datetime DEFAULT NULL,
  `hasStarted` tinyint(1) NOT NULL DEFAULT '1',
  `isSuspended` tinyint(1) NOT NULL DEFAULT '0',
  `dateSuspended` datetime DEFAULT NULL,
  `isCanceled` tinyint(1) NOT NULL,
  `dateCanceled` datetime DEFAULT NULL,
  `isExpired` tinyint(1) NOT NULL,
  `dateExpired` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mphbydkjczqcbblgqthkudaxkfzhnyvjgsuy` (`integrationId`),
  KEY `idx_ppwtxtgkyiqahfbjuvpowopyoscqciatjzje` (`submissionId`),
  KEY `idx_hxeslnmzabxvlhfhtbfluyqpygsemnqqpqdy` (`fieldId`),
  KEY `idx_jnfuzxidrlkmnstpavdlewtjzqogvdngkgtj` (`planId`),
  KEY `idx_tmvujggnqjfuqemivszdtgcgmkkqffcvyffk` (`reference`),
  KEY `idx_khqefwxrdkooypikzeaaecahmqthmlhzerja` (`nextPaymentDate`),
  KEY `idx_rugdqmhlrbpjqvnaajwmuqiciyrvieeiqchs` (`dateExpired`),
  KEY `idx_btxdngnhrurrjyifbmgvumoiojyvmqizpjcs` (`dateExpired`),
  CONSTRAINT `fk_axjnpfgoyvytimsxfpiknsvipqqpsaagvvnw` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_bdsrfklhihiudoxkoxabulohwepubxttnatd` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_gnjqmlbahjyrebidkolcyrlshcfttglbrqit` FOREIGN KEY (`planId`) REFERENCES `formie_payments_plans` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_jzhlyznrnwcrdtsgqewgbexxfemybvabrrrf` FOREIGN KEY (`fieldId`) REFERENCES `formie_fields` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_pdftemplates`
--

DROP TABLE IF EXISTS `formie_pdftemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_pdftemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) NOT NULL,
  `filenameFormat` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_relations`
--

DROP TABLE IF EXISTS `formie_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kejjjbwpskxxcgfnsewaiuqzuifkrbglpnep` (`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_dunspljkphawmwshjzasvyeapdxntkdmfxld` (`sourceId`),
  KEY `idx_xbhkmkdgaeudjjqximyincvqessbeldbajej` (`targetId`),
  KEY `idx_oawntmwonjkcdvuykgartvzlllfbyavzunvu` (`sourceSiteId`),
  CONSTRAINT `fk_apwpyggqfvxetlsaqinthvbrlfbolzeqqogn` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tjvifxpeueidepsmlvwbkaakffksyvttrlsx` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wxutjlsrekeceufpraffjclgtulvnbovnfma` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_sentnotifications`
--

DROP TABLE IF EXISTS `formie_sentnotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_sentnotifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `formId` int DEFAULT NULL,
  `submissionId` int DEFAULT NULL,
  `notificationId` int DEFAULT NULL,
  `subject` text,
  `to` text,
  `cc` text,
  `bcc` text,
  `replyTo` text,
  `replyToName` text,
  `from` text,
  `fromName` text,
  `sender` text,
  `body` mediumtext,
  `htmlBody` mediumtext,
  `info` text,
  `success` tinyint(1) DEFAULT NULL,
  `message` text,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_sydyukyepwbhlxjurxlhscpcsodwftlllnsl` (`formId`),
  KEY `fk_cqniizjeifiiluooarepuogxxddotxlzdhbu` (`submissionId`),
  KEY `fk_gktweqzkyewcoykzevxmvvdglmqekawoutrt` (`notificationId`),
  CONSTRAINT `fk_cqniizjeifiiluooarepuogxxddotxlzdhbu` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gktweqzkyewcoykzevxmvvdglmqekawoutrt` FOREIGN KEY (`notificationId`) REFERENCES `formie_notifications` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sydyukyepwbhlxjurxlhscpcsodwftlllnsl` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_usdxnaqyjktrjfitixquftwctbgltrrstrjg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_statuses`
--

DROP TABLE IF EXISTS `formie_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'green',
  `description` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_stencils`
--

DROP TABLE IF EXISTS `formie_stencils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_stencils` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `data` mediumtext,
  `templateId` int DEFAULT NULL,
  `submitActionEntryId` int DEFAULT NULL,
  `submitActionEntrySiteId` int DEFAULT NULL,
  `defaultStatusId` int DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kgnbrmbkokkbqtfvsszkpuvpbjmuhgmkbtev` (`templateId`),
  KEY `idx_bdwgtoyuugofblpqdofinvurgbevdigvxogd` (`defaultStatusId`),
  CONSTRAINT `fk_jgzaqxjebkdkoeqktmkrlojognrjiqhrgvvu` FOREIGN KEY (`templateId`) REFERENCES `formie_formtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lhgsxomjdyadhydxggiqcbhrrktpkalwoyzk` FOREIGN KEY (`defaultStatusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_submissions`
--

DROP TABLE IF EXISTS `formie_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_submissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` json DEFAULT NULL,
  `formId` int NOT NULL,
  `statusId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `isIncomplete` tinyint(1) DEFAULT '0',
  `isSpam` tinyint(1) DEFAULT '0',
  `spamReason` text,
  `spamClass` varchar(255) DEFAULT NULL,
  `snapshot` text,
  `ipAddress` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_upbpysqyhogkhvihikohmpkpmqavcwvixrbw` (`formId`),
  KEY `idx_rsvzwvwfszispcwqfytjqufndygvdhnxwlfs` (`statusId`),
  KEY `idx_eyzxkpoclhzlubhavazztujtkszsjzrpzrla` (`userId`),
  CONSTRAINT `fk_eweeqqqihdbqzhlmrbxkcqqztiumgmfcyfhw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_huwdrzgueweycqvxeiufginqpwzmlugukoxc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lthyjbyuzizrutvohnqonfirvtamebjcrbsv` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_utcduyqonniegkdosizpieqrantmkhrlvufw` FOREIGN KEY (`statusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tglgrhqienhdpxqonxmzzwbdsuoosldqdmbq` (`name`),
  KEY `idx_cgrklprqrndthbjskknayapogoscjcwjvopc` (`handle`),
  KEY `idx_egbakeyoawuauywrorqlxxykfxhjlqmnllsv` (`fieldLayoutId`),
  KEY `idx_uoxpscrysmgtwgzxrjutwkrrihyxzpiytftc` (`sortOrder`),
  CONSTRAINT `fk_aukcuuwtufdfcrgerfgbvzlugppgtfnaiqtq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kcqhxouoiqeimosmwmehqntobdmeupzpqwyu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_clpknfrohdwhoszocmvazpoxdezxpxaxeyin` (`accessToken`),
  UNIQUE KEY `idx_ibyvsdtshmbbqcdpocnzgpfmkujqgagwqdzg` (`name`),
  KEY `fk_rjsasfkezhkkrwafiejurxldsauvhbrokqya` (`schemaId`),
  CONSTRAINT `fk_rjsasfkezhkkrwafiejurxldsauvhbrokqya` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hyper_element_cache`
--

DROP TABLE IF EXISTS `hyper_element_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hyper_element_cache` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int DEFAULT NULL,
  `sourceId` int DEFAULT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `sourceType` varchar(255) DEFAULT NULL,
  `targetId` int DEFAULT NULL,
  `targetSiteId` int DEFAULT NULL,
  `targetType` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jfptmhchpajacjnbjojysxylvxnaaibtczul` (`id`),
  KEY `idx_xtznrrornfujqufmgoincglshindvkrolgzw` (`sourceId`),
  KEY `idx_pnhajbozrmxsuwqpuzlggvrulazarvfxytzz` (`sourceSiteId`),
  KEY `idx_wahkrhgvbrfqdnbgctjayooakcjftabrjmzt` (`targetId`),
  KEY `idx_omrlxzyoypcnfrtgrraxrpfmufdxvwftwzic` (`targetSiteId`),
  CONSTRAINT `fk_gqiubdfchtcfesrgqqqfgdexxhrzszfvlmmk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_iqsyxsdhygjaxvlbvvgnxuekoguctfsgjtlo` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nakuozpqpwgiboqxcygsiwjqmoapqgtmrqvb` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xctcdcnjamyafnvojpavnvezlsocclfamzxh` FOREIGN KEY (`targetSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hyper_field_cache`
--

DROP TABLE IF EXISTS `hyper_field_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hyper_field_cache` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sourceField` char(36) NOT NULL DEFAULT '0',
  `targetField` char(36) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tupdmfftfrvfvkpuaxoerwirodbyltwmaugk` (`id`),
  KEY `idx_uiostdhhyqtjwnxyjqunsjxixknohfltjtic` (`sourceField`),
  KEY `idx_durxxlaxhznmalpfnykjyblsgjnlqjkhckny` (`targetField`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nxpitpcbkqqaeuybhqmcipgqhdchonfmofgg` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zhsdfindukipiodmljihseivougijjoiuhxk` (`name`),
  KEY `idx_bmazsbsmxbpuvnuyxcoomajekaxnylhawfjk` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zxlchndvzqaukcnswxkpgwvuyzdjirhcunsu` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_twulqwwhhkbfsikxpzgsrfjhpcssbhbaaflg` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_ewnytnodeedykvikhotztuejkgvnqsveuxxr` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_zqucsfgbuosmfzgwhzbzflxgsiryljvjtxdz` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wwdgxlslarqgraaqugswrbevdsectqhuavhn` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_cldxknbvjhjuwqbivvserepkdxolvddvkmrl` (`sourceId`),
  KEY `idx_tsarpngthfjqtwehsrvaskryeerhruamvjmh` (`targetId`),
  KEY `idx_wrtzdocudjosuyckhgfdsswrfpfpcetxarmz` (`sourceSiteId`),
  CONSTRAINT `fk_cdrxamhjvqzqltvpappaywuyoapzyczytvnq` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hqrrtxnchwztpspulaqjzbknktpfbtrjszzn` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yovygcnryihopojgmabzhwexzeithnpbutnp` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iufwnqbbneqcpcvsndnubuztuufgqzyjrshf` (`canonicalId`,`num`),
  KEY `fk_jmwioppgmjvipgeravbtppnyfijpvmvzwxti` (`creatorId`),
  CONSTRAINT `fk_jmwioppgmjvipgeravbtppnyfijpvmvzwxti` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ppvhxizxbzmzflruukxfaximzwplrgzqsosz` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_uepcmhcyokllzntlaqfoukapqvtprrhrvkvd` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned NOT NULL DEFAULT '1',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qoasfcskdsylqsfyymrqfarpjoibutuuvbhe` (`handle`),
  KEY `idx_ayaizstjuafednjueqlgfkcryytykdkfweca` (`name`),
  KEY `idx_ontyrytpzdaiuzbckioeuhdezeueskanwzcj` (`structureId`),
  KEY `idx_kcppnyfqsltjyrulmyfrryprmnfjhnobumoz` (`dateDeleted`),
  CONSTRAINT `fk_lguvirbccmbsfqxwjwtksrwzoazttlfyzihd` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_ekzejzdflffiwqedtduvprpkfnqyqrdxoyfz` (`typeId`),
  CONSTRAINT `fk_ebcjffckskzbyvcsuulyamvgholeovsmadck` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ekzejzdflffiwqedtduvprpkfnqyqrdxoyfz` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cxkgcwyyeoujvteapfnsntzfmnyfsrpoichm` (`sectionId`,`siteId`),
  KEY `idx_ttjsepkalmnbqqrkkiwsdysmmsyvdgkiuypr` (`siteId`),
  CONSTRAINT `fk_dtljucszyliehblwxvrhkmblksvgpgngclge` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mbooguzvcsewechaimuhnbsdsjvrkqglchuo` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seomatic_metabundles`
--

DROP TABLE IF EXISTS `seomatic_metabundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seomatic_metabundles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `bundleVersion` varchar(255) NOT NULL DEFAULT '',
  `sourceBundleType` varchar(255) NOT NULL DEFAULT '',
  `sourceId` int DEFAULT NULL,
  `sourceName` varchar(255) NOT NULL DEFAULT '',
  `sourceHandle` varchar(255) NOT NULL DEFAULT '',
  `sourceType` varchar(64) NOT NULL DEFAULT '',
  `typeId` int DEFAULT NULL,
  `sourceTemplate` varchar(500) DEFAULT '',
  `sourceSiteId` int DEFAULT NULL,
  `sourceAltSiteSettings` text,
  `sourceDateUpdated` datetime NOT NULL,
  `metaGlobalVars` text,
  `metaSiteVars` text,
  `metaSitemapVars` text,
  `metaContainers` text,
  `redirectsContainer` text,
  `frontendTemplatesContainer` text,
  `metaBundleSettings` text,
  PRIMARY KEY (`id`),
  KEY `idx_rdwtyazgnjcvthdxghbxrpmbynylhskeietf` (`sourceBundleType`),
  KEY `idx_cosaejwbgvuhikawjrnvzettqmukdxsuvydw` (`sourceId`),
  KEY `idx_kwtbzolljhjyrkvjokrnvzklljbpopcwhyyd` (`sourceSiteId`),
  KEY `idx_bmdcxnzuddiagtmasojtmrkbahnaqdflirwc` (`sourceHandle`),
  CONSTRAINT `fk_bkfxfawsrxafnhsgneueebicqubtrvjckanz` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xxqfiwngaajhunhcsubblmfpdnhownhsxeyc` (`uid`),
  KEY `idx_ygeusprovyhgjxtraxjsqlqearfgbfkobcbt` (`token`),
  KEY `idx_coqhyjcmkmzsgtcgoxwubkxxvnlyxccmxwtw` (`dateUpdated`),
  KEY `idx_lydmejnymuinnstimpaaupjzvgrqffxuotxs` (`userId`),
  CONSTRAINT `fk_ohkdzaygqlhpylznrlcpxrkrmjnhupvpbtpo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lxmqjedmqtprejagglbdwszilahppvgwxktq` (`userId`,`message`),
  CONSTRAINT `fk_uyfzshghnevvuxoquahakgawagfyougzpjwi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wsusfjdcofijdbixfemxcgcibicgjorwyhqh` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mlxgeguixhyxnmevrxgpmpxtipodcqyrghjy` (`dateDeleted`),
  KEY `idx_vnsufbualwagljihjskdhcbhqkgpjifdfsfe` (`handle`),
  KEY `idx_yqboygixhyiyfjylqokywcosowijykktuqsn` (`sortOrder`),
  KEY `fk_ymbtinkgeymbtzxrbbeafgsgoavxbpukkcff` (`groupId`),
  CONSTRAINT `fk_ymbtinkgeymbtzxrbbeafgsgoavxbpukkcff` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sprig_playgrounds`
--

DROP TABLE IF EXISTS `sprig_playgrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sprig_playgrounds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `component` text,
  `variables` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_hwhymbdjsvumisnvrzxxjikgfllippbopfhv` (`userId`),
  CONSTRAINT `fk_hwhymbdjsvumisnvrzxxjikgfllippbopfhv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qmkpriehfkaflzrkpjiwwpdtsjypkeqfznll` (`structureId`,`elementId`),
  KEY `idx_pcxcpihqvkoqrivuzkxrjinwlujjnioycbqg` (`root`),
  KEY `idx_mtehquuhisqxgllhlweflhoqourwircwygmx` (`lft`),
  KEY `idx_mkzedmkkcnfwchmpurbpuczelabeqngocrwm` (`rgt`),
  KEY `idx_cjqmdefhlrxjrqqyegqyloqwpzrhimjbltsn` (`level`),
  KEY `idx_jozxuchyvucsihyuiipgfrkfofxtdzgmsxvc` (`elementId`),
  CONSTRAINT `fk_rkjuhudrnmkcqafxhceedofxulqihbwhcoxy` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wagvvnqdiemhsrjxlsaixdblerdqwrkmozsg` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hboplsdocaqlldijeennurqmzmogctzhjhot` (`key`,`language`),
  KEY `idx_eejjckstcxapvgvybuljesjearmlqcsyrefz` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vnfftjeglaexaubbsrluvtkruqrgqulogsio` (`name`),
  KEY `idx_koffikkqjrsbjhfefsvopcyaarepdzdiafmr` (`handle`),
  KEY `idx_iutloundfulhgchzlhowibpibyutkorjwkdl` (`dateDeleted`),
  KEY `fk_avsoskwttlbmgfwpfxjfxoogpihzzqgdvimg` (`fieldLayoutId`),
  CONSTRAINT `fk_avsoskwttlbmgfwpfxjfxoogpihzzqgdvimg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kezjjhisnxhtpbnmtkqzzcjkwhashjalkmvz` (`groupId`),
  CONSTRAINT `fk_lexiscsgldxswynahxmpxjhidryplcpizlnd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nlispapmitivtmucbzoahewduvuwgeqjvpwt` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oddhbvuqkjmzqorlddpmzbbjwmmhjsnfwrzi` (`token`),
  KEY `idx_hcytsulqwqdcoucvuxjynldngwkorluginbk` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zvtrvtzugxoxtdhgigkzuasxrzglxsuvjsha` (`handle`),
  KEY `idx_nfqzjonoixvlqqvszstotfvrwpcqvitarwhw` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vsayxdwrqkzgnfhgfaptkwqvxvffgteoipwx` (`groupId`,`userId`),
  KEY `idx_zxxqlrvzpuwkrqeohtxpihssxozzkamyzecq` (`userId`),
  CONSTRAINT `fk_mbtypxmxsshrnrefqdsiwbuoqvuqeyknwqkj` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oikqacpwrtewpykiahilnlilkpitsqtkwpen` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qyvjfrqubdwdvgvgmdmtdfxfnsfupxqrtnvn` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vrkmbjyvvicyhvgpqajfqkafwwpekyniwuae` (`permissionId`,`groupId`),
  KEY `idx_hnaevfvxgcmjsnuqrlsuwbqsboustprpszpk` (`groupId`),
  CONSTRAINT `fk_iimsvqdnqsjrowybwkqpcwazilzosutdierx` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vsicihjdzbigzobspxtbfhdqzhqxsaloithn` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_byejwsxchrrzkakgmwovufewtzlzgoqpbyqz` (`permissionId`,`userId`),
  KEY `idx_lwnxhcfwofmbxgokbkkkiogpaielxqjykmaz` (`userId`),
  CONSTRAINT `fk_nxwseeslrslpiitkjlnsxxycwjgmemousirh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ttqfkgrcgjecspmunsnedmnievbmpnebrxyh` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_eyosedqdgirodapkqunuyuepxdyzbjjbpylt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_afkynuvgbcajmoirnvfnqqxhjhtstubirxir` (`active`),
  KEY `idx_imckjeauavixayeldapmtzojeywaarvkvfdl` (`locked`),
  KEY `idx_tlhjnejzbkwiucggbeemcrxnfsanlgbbojro` (`pending`),
  KEY `idx_wncnwkucanveturgwymazcploaeeojdocmmx` (`suspended`),
  KEY `idx_fbdzcmeurkfxcbevfihtltmuvawphfxvpnmo` (`verificationCode`),
  KEY `idx_qpogymiirrjowqzqslfqstmxrqyqzjwhivov` (`email`),
  KEY `idx_ltxjwhtliiphscqsujmlpzeskjxbhcajaqje` (`username`),
  KEY `fk_vmvihqzhabasmncepyxacmpglqbonwmbbylw` (`photoId`),
  CONSTRAINT `fk_guqrnvxuczhwsjrhafovzmivipvuobtibphu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vmvihqzhabasmncepyxacmpglqbonwmbbylw` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hbbixhpbvgopgymeabimwlhcfaduqqbfhrwh` (`name`,`parentId`,`volumeId`),
  KEY `idx_arysamnqroviwxtaydbymdgdavkxktbpanux` (`parentId`),
  KEY `idx_emtprhgcqiehdmbnijuprecjhuuelabmzfyy` (`volumeId`),
  CONSTRAINT `fk_oeolaiqfkylfxszwewdgicawvsxoaslzvrlh` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rsfhgipdbljukxsdixgnkamxbtokvepjvcvq` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mufhigsepsttfjzjhpnwvuqpbzgaltrhcshr` (`name`),
  KEY `idx_ksjkqbrfovkjyiutdknzggtsuftlrrsyshxj` (`handle`),
  KEY `idx_akcuxcsggwjapppuxytqyxbqcfpzcxfzmbxk` (`fieldLayoutId`),
  KEY `idx_zhxjpptmcvylioymerbcwgsjxmeqowfarfna` (`dateDeleted`),
  CONSTRAINT `fk_sxlutyomlslnawamcajnqkicvdapcdffftvk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_mmtttzykvnavzbmkxebcxnqcahdoeufoeoyo` (`userId`),
  CONSTRAINT `fk_mmtttzykvnavzbmkxebcxnqcahdoeufoeoyo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jlsowlzvgcpbvggltyskpclcbgkpecjcqeum` (`userId`),
  CONSTRAINT `fk_hdlokvufsqnvjlarwjnvhkmojcdntjaykknh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-03  3:17:11
-- MariaDB dump 10.19  Distrib 10.5.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `auth_oauth_tokens`
--

LOCK TABLES `auth_oauth_tokens` WRITE;
/*!40000 ALTER TABLE `auth_oauth_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `auth_oauth_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_caches`
--

LOCK TABLES `blitz_caches` WRITE;
/*!40000 ALTER TABLE `blitz_caches` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_caches` VALUES (2,1,'faqs',NULL,NULL,NULL),(3,1,'events',NULL,NULL,NULL),(5,1,'contact',NULL,NULL,NULL);
/*!40000 ALTER TABLE `blitz_caches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_cachetags`
--

LOCK TABLES `blitz_cachetags` WRITE;
/*!40000 ALTER TABLE `blitz_cachetags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_cachetags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_driverdata`
--

LOCK TABLES `blitz_driverdata` WRITE;
/*!40000 ALTER TABLE `blitz_driverdata` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_driverdata` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementcaches`
--

LOCK TABLES `blitz_elementcaches` WRITE;
/*!40000 ALTER TABLE `blitz_elementcaches` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_elementcaches` VALUES (5,2);
/*!40000 ALTER TABLE `blitz_elementcaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementexpirydates`
--

LOCK TABLES `blitz_elementexpirydates` WRITE;
/*!40000 ALTER TABLE `blitz_elementexpirydates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementexpirydates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementfieldcaches`
--

LOCK TABLES `blitz_elementfieldcaches` WRITE;
/*!40000 ALTER TABLE `blitz_elementfieldcaches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementfieldcaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementqueries`
--

LOCK TABLES `blitz_elementqueries` WRITE;
/*!40000 ALTER TABLE `blitz_elementqueries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_elementqueries` VALUES (1,3252978344,'verbb\\formie\\elements\\Form','{\"handle\":\"contact\",\"siteId\":1,\"limit\":1}');
/*!40000 ALTER TABLE `blitz_elementqueries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementqueryattributes`
--

LOCK TABLES `blitz_elementqueryattributes` WRITE;
/*!40000 ALTER TABLE `blitz_elementqueryattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_elementqueryattributes` VALUES (1,'dateCreated'),(1,'handle');
/*!40000 ALTER TABLE `blitz_elementqueryattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementquerycaches`
--

LOCK TABLES `blitz_elementquerycaches` WRITE;
/*!40000 ALTER TABLE `blitz_elementquerycaches` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_elementquerycaches` VALUES (5,1);
/*!40000 ALTER TABLE `blitz_elementquerycaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementqueryfields`
--

LOCK TABLES `blitz_elementqueryfields` WRITE;
/*!40000 ALTER TABLE `blitz_elementqueryfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementqueryfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementquerysources`
--

LOCK TABLES `blitz_elementquerysources` WRITE;
/*!40000 ALTER TABLE `blitz_elementquerysources` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementquerysources` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_hints`
--

LOCK TABLES `blitz_hints` WRITE;
/*!40000 ALTER TABLE `blitz_hints` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_hints` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_includes`
--

LOCK TABLES `blitz_includes` WRITE;
/*!40000 ALTER TABLE `blitz_includes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_includes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_ssiincludecaches`
--

LOCK TABLES `blitz_ssiincludecaches` WRITE;
/*!40000 ALTER TABLE `blitz_ssiincludecaches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_ssiincludecaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (2,1,'title','2024-07-23 00:11:03',0,1),(4,1,'postDate','2024-09-03 02:27:00',0,1),(4,1,'slug','2024-09-03 02:27:00',0,1),(4,1,'title','2024-09-03 02:26:51',0,1),(5,1,'postDate','2024-09-03 02:25:10',0,1),(10,1,'postDate','2024-09-03 02:29:56',0,1),(10,1,'slug','2024-09-03 02:29:56',0,1),(10,1,'title','2024-09-03 02:29:56',0,1),(10,1,'uri','2024-09-03 02:29:56',0,1),(35,1,'postDate','2024-09-03 03:03:39',0,1),(35,1,'slug','2024-09-03 03:03:39',0,1),(35,1,'title','2024-09-03 03:03:38',0,1),(37,1,'postDate','2024-09-03 03:03:44',0,1),(37,1,'slug','2024-09-03 03:03:44',0,1),(37,1,'title','2024-09-03 03:03:44',0,1),(39,1,'postDate','2024-09-03 03:03:48',0,1),(39,1,'slug','2024-09-03 03:03:48',0,1),(39,1,'title','2024-09-03 03:03:48',0,1),(41,1,'postDate','2024-09-03 03:03:52',0,1),(41,1,'slug','2024-09-03 03:03:52',0,1),(41,1,'title','2024-09-03 03:03:52',0,1),(43,1,'postDate','2024-09-03 03:03:57',0,1),(43,1,'slug','2024-09-03 03:03:57',0,1),(43,1,'title','2024-09-03 03:03:57',0,1),(48,1,'postDate','2024-09-03 03:10:46',0,1),(48,1,'slug','2024-09-03 03:10:46',0,1),(48,1,'title','2024-09-03 03:10:42',0,1),(50,1,'postDate','2024-09-03 03:10:48',0,1),(50,1,'slug','2024-09-03 03:10:48',0,1),(50,1,'title','2024-09-03 03:10:48',0,1),(52,1,'postDate','2024-09-03 03:10:55',0,1),(52,1,'slug','2024-09-03 03:10:55',0,1),(52,1,'title','2024-09-03 03:10:52',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (4,1,4,'75bdbc80-6a47-442a-abd7-22c49eece2ab','2024-09-03 02:33:26',0,1),(5,1,3,'3c200bc8-f427-45f8-9348-b0488d6535ab','2024-09-03 02:26:05',0,1),(29,1,5,'aa529e71-3082-46d5-a2c8-71dcc40dcbbe','2024-09-03 03:08:32',0,1),(29,1,10,'4a39ce45-5160-451a-aece-0652ba8208b6','2024-09-03 03:08:32',0,1),(29,1,11,'4a899c6e-116d-4f60-a2d0-48791c2cf1ce','2024-09-03 03:08:32',0,1),(35,1,4,'75bdbc80-6a47-442a-abd7-22c49eece2ab','2024-09-03 03:03:39',0,1),(37,1,4,'75bdbc80-6a47-442a-abd7-22c49eece2ab','2024-09-03 03:03:44',0,1),(39,1,4,'75bdbc80-6a47-442a-abd7-22c49eece2ab','2024-09-03 03:03:48',0,1),(41,1,4,'75bdbc80-6a47-442a-abd7-22c49eece2ab','2024-09-03 03:03:52',0,1),(43,1,4,'75bdbc80-6a47-442a-abd7-22c49eece2ab','2024-09-03 03:03:57',0,1),(48,1,4,'75bdbc80-6a47-442a-abd7-22c49eece2ab','2024-09-03 03:10:46',0,1),(50,1,4,'75bdbc80-6a47-442a-abd7-22c49eece2ab','2024-09-03 03:10:48',0,1),(52,1,4,'75bdbc80-6a47-442a-abd7-22c49eece2ab','2024-09-03 03:10:55',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (1,NULL,1,0,'First draft',NULL,0,NULL,0),(15,NULL,1,0,'First draft',NULL,0,NULL,0),(18,NULL,1,0,'First draft',NULL,0,NULL,0);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (3,1,1,NULL,'view','2024-09-03 02:20:07'),(4,1,1,NULL,'edit','2024-09-03 02:33:25'),(4,1,1,NULL,'save','2024-09-03 02:33:26'),(4,1,1,NULL,'view','2024-09-03 03:07:36'),(10,1,1,NULL,'save','2024-09-03 02:29:56'),(29,1,1,NULL,'edit','2024-09-03 03:08:18'),(29,1,1,NULL,'save','2024-09-03 03:08:32'),(29,1,1,NULL,'view','2024-09-03 03:16:54'),(31,1,1,NULL,'view','2024-09-03 02:47:19'),(34,1,1,NULL,'view','2024-09-03 02:50:41'),(35,1,1,NULL,'save','2024-09-03 03:03:39'),(35,1,1,NULL,'view','2024-09-03 03:03:30'),(37,1,1,NULL,'save','2024-09-03 03:03:44'),(37,1,1,NULL,'view','2024-09-03 03:03:40'),(39,1,1,NULL,'save','2024-09-03 03:03:48'),(39,1,1,NULL,'view','2024-09-03 03:03:45'),(41,1,1,NULL,'save','2024-09-03 03:03:52'),(41,1,1,NULL,'view','2024-09-03 03:03:48'),(43,1,1,NULL,'save','2024-09-03 03:03:57'),(43,1,1,NULL,'view','2024-09-03 03:03:57'),(48,1,1,NULL,'save','2024-09-03 03:10:46'),(48,1,1,NULL,'view','2024-09-03 03:10:36'),(50,1,1,NULL,'save','2024-09-03 03:10:48'),(50,1,1,NULL,'view','2024-09-03 03:10:46'),(52,1,1,NULL,'save','2024-09-03 03:10:55'),(52,1,1,NULL,'view','2024-09-03 03:14:27');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,2,'craft\\elements\\User',1,0,'2024-07-04 01:19:21','2024-07-04 01:19:21',NULL,NULL,NULL,'3711d637-8984-4774-a0e5-457508abedd7'),(2,NULL,NULL,NULL,NULL,'verbb\\formie\\elements\\Form',1,0,'2024-07-22 01:42:38','2024-07-23 00:11:03',NULL,NULL,NULL,'5411c984-97e4-4481-b4d2-04344cb60e73'),(3,NULL,1,NULL,1,'craft\\elements\\Entry',1,0,'2024-09-03 02:06:05','2024-09-03 02:06:05',NULL,NULL,NULL,'d00a0545-9db5-4f4b-9323-1cea0f5cdd03'),(4,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-09-03 02:25:07','2024-09-03 02:33:26',NULL,NULL,NULL,'d8f83475-0d2b-431a-b5c5-029de69172a1'),(5,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-09-03 02:25:09','2024-09-03 02:26:05',NULL,'2024-09-03 02:50:34',NULL,'ca47e462-0091-47cc-83c3-22834e26b553'),(6,4,NULL,1,5,'craft\\elements\\Entry',1,0,'2024-09-03 02:27:00','2024-09-03 02:27:00',NULL,NULL,NULL,'81607f08-d4c8-42fb-8f52-d48ad7ab871e'),(8,4,NULL,2,5,'craft\\elements\\Entry',1,0,'2024-09-03 02:27:10','2024-09-03 02:27:10',NULL,NULL,NULL,'5a30a674-1f83-4b36-bae2-cf382bd993e6'),(10,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-09-03 02:29:54','2024-09-03 02:29:56',NULL,NULL,NULL,'65d1772c-6dd9-4a6c-bb73-03b55f18ce62'),(11,10,NULL,3,1,'craft\\elements\\Entry',1,0,'2024-09-03 02:29:56','2024-09-03 02:29:56',NULL,NULL,NULL,'e1cae844-a6f5-424a-bb65-9778dce82fa8'),(12,4,NULL,4,5,'craft\\elements\\Entry',1,0,'2024-09-03 02:30:00','2024-09-03 02:30:00',NULL,NULL,NULL,'1ef6afdb-0307-4c7e-8871-6357708f872d'),(14,4,NULL,5,5,'craft\\elements\\Entry',1,0,'2024-09-03 02:30:20','2024-09-03 02:30:20',NULL,NULL,NULL,'04597f4e-5d26-4a57-acb4-5dc632ffd0e1'),(16,4,NULL,6,5,'craft\\elements\\Entry',1,0,'2024-09-03 02:30:47','2024-09-03 02:30:47',NULL,NULL,NULL,'5b504ac4-24dc-4b04-829d-35c991f08eae'),(18,4,NULL,7,5,'craft\\elements\\Entry',1,0,'2024-09-03 02:31:29','2024-09-03 02:31:29',NULL,NULL,NULL,'5688bea7-1720-4888-9a47-0f7ada14676f'),(20,4,NULL,8,5,'craft\\elements\\Entry',1,0,'2024-09-03 02:32:27','2024-09-03 02:32:27',NULL,NULL,NULL,'7ef41c54-fc4b-44fa-9f81-3048867a2a2a'),(22,4,NULL,9,5,'craft\\elements\\Entry',1,0,'2024-09-03 02:32:32','2024-09-03 02:32:32',NULL,NULL,NULL,'682274a1-9632-45bf-b458-8c37322bae3e'),(24,4,NULL,10,5,'craft\\elements\\Entry',1,0,'2024-09-03 02:32:39','2024-09-03 02:32:39',NULL,NULL,NULL,'d7990671-1386-40c8-bb33-69ed688dafcc'),(26,4,NULL,11,5,'craft\\elements\\Entry',1,0,'2024-09-03 02:32:48','2024-09-03 02:32:48',NULL,NULL,NULL,'c2ca0c3f-3d52-440d-95e1-144d0803c16f'),(28,4,NULL,12,5,'craft\\elements\\Entry',1,0,'2024-09-03 02:33:26','2024-09-03 02:33:26',NULL,NULL,NULL,'a470c2a5-cb26-42af-9e1d-3f2027e855b3'),(29,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2024-09-03 02:45:00','2024-09-03 03:08:32',NULL,NULL,NULL,'1c7211d8-efbd-48be-9546-6605495c2609'),(30,29,NULL,13,8,'craft\\elements\\Entry',1,0,'2024-09-03 02:45:00','2024-09-03 02:45:00',NULL,NULL,NULL,'82c6a383-958f-4b56-b4ae-f7fa40815ffb'),(31,NULL,15,NULL,5,'craft\\elements\\Entry',1,0,'2024-09-03 02:47:19','2024-09-03 02:47:19',NULL,NULL,NULL,'4329e952-c4fa-4e25-9205-253e02c0d9d5'),(34,NULL,18,NULL,5,'craft\\elements\\Entry',1,0,'2024-09-03 02:50:41','2024-09-03 02:50:41',NULL,NULL,NULL,'2e64dadb-2bd5-46ea-950e-7256b94a1b11'),(35,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:03:30','2024-09-03 03:03:39',NULL,NULL,NULL,'a56df5d3-fe65-4f8e-b11c-984589182b9a'),(36,35,NULL,14,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:03:39','2024-09-03 03:03:39',NULL,NULL,NULL,'52ac5f28-c7f3-4f03-872a-18a6e191e7e0'),(37,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:03:40','2024-09-03 03:03:44',NULL,NULL,NULL,'fdab101e-c914-41ad-beaf-20746bbd554b'),(38,37,NULL,15,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:03:44','2024-09-03 03:03:44',NULL,NULL,NULL,'e76be597-c8d6-4c84-bd17-553250ed5677'),(39,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:03:44','2024-09-03 03:03:48',NULL,NULL,NULL,'fcc62756-cec0-458c-ba1b-31c312081d6e'),(40,39,NULL,16,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:03:48','2024-09-03 03:03:48',NULL,NULL,NULL,'a9b9fc95-9241-4757-bf13-6168f139055b'),(41,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:03:48','2024-09-03 03:03:52',NULL,NULL,NULL,'3e02d3b0-abd4-4239-a009-c10a15c50121'),(42,41,NULL,17,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:03:52','2024-09-03 03:03:52',NULL,NULL,NULL,'7dc726bb-e08c-49d4-a284-a80fd72f9c6c'),(43,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:03:52','2024-09-03 03:03:57',NULL,NULL,NULL,'2c74f0c4-a765-4011-a49e-69a45d9b3b67'),(44,43,NULL,18,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:03:57','2024-09-03 03:03:57',NULL,NULL,NULL,'4d26a7d7-d99a-4e45-878b-0b702c34b6dd'),(45,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2024-09-03 03:08:32','2024-09-03 03:08:32',NULL,NULL,NULL,'5570b0a3-3ef8-45f9-b8f3-5cdc2607711b'),(46,29,NULL,19,8,'craft\\elements\\Entry',1,0,'2024-09-03 03:08:32','2024-09-03 03:08:32',NULL,NULL,NULL,'7ff338b3-e247-4a5f-827a-994f5582aeae'),(47,45,NULL,20,7,'craft\\elements\\Entry',1,0,'2024-09-03 03:08:32','2024-09-03 03:08:32',NULL,NULL,NULL,'3e3c3ce1-676a-466b-9262-3a1b47e8f0cc'),(48,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:10:36','2024-09-03 03:10:46',NULL,NULL,NULL,'3eeadf7a-5d96-44fb-bc41-a682b20f96ac'),(49,48,NULL,21,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:10:46','2024-09-03 03:10:46',NULL,NULL,NULL,'e359d8c3-8019-477e-9f96-ef48a86b451e'),(50,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:10:46','2024-09-03 03:10:48',NULL,NULL,NULL,'d2c7fae5-a7f9-4c7c-a0f7-28eb35ba9e27'),(51,50,NULL,22,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:10:48','2024-09-03 03:10:48',NULL,NULL,NULL,'4480d413-aaa3-4650-b13b-73b8915e9bfe'),(52,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:10:48','2024-09-03 03:10:55',NULL,NULL,NULL,'278d7ff5-cdc4-476b-9a96-956397b113a0'),(53,52,NULL,23,5,'craft\\elements\\Entry',1,0,'2024-09-03 03:10:55','2024-09-03 03:10:55',NULL,NULL,NULL,'14e55488-4bad-4d2e-bb64-c52c3b5b7f34');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_owners` VALUES (5,4,1),(45,29,1),(47,46,1);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2024-07-04 01:19:21','2024-07-04 01:19:21','3c25269a-f798-485f-8fa3-8e5d20b21a5d'),(2,2,1,'Contact',NULL,NULL,NULL,1,'2024-07-22 01:42:38','2024-07-22 01:42:38','f9c4c529-2ef9-494e-ba39-4185e22e9a97'),(3,3,1,NULL,'__temp_ltwomubcqhacsszplyatzfzopymuocourmsw','__temp_ltwomubcqhacsszplyatzfzopymuocourmsw',NULL,1,'2024-09-03 02:06:05','2024-09-03 02:06:05','96574bcc-3775-41cc-b5d7-a5b9c9305903'),(4,4,1,'Our Services','our-services',NULL,'{\"75bdbc80-6a47-442a-abd7-22c49eece2ab\": \"https://item.linkField.type\"}',1,'2024-09-03 02:25:07','2024-09-03 02:33:26','512c3fab-1325-49a8-ad01-00247f26763b'),(5,5,1,NULL,'__temp_tqhteupzdnxgqdwgcfumfdubikoypsmgmvqk',NULL,NULL,1,'2024-09-03 02:25:09','2024-09-03 02:25:09','cfb9545e-884e-4609-b436-827b9443b8e4'),(6,6,1,'Our Services','our-services',NULL,NULL,1,'2024-09-03 02:27:00','2024-09-03 02:27:00','5493cadd-26f2-41b5-935d-155ecc812464'),(8,8,1,'Our Services','our-services',NULL,'{\"75bdbc80-6a47-442a-abd7-22c49eece2ab\": \"https://prospa.ddev.site:8443/\"}',1,'2024-09-03 02:27:10','2024-09-03 02:27:10','0299ef51-cae2-4ef8-a596-5e0a2f4dc5c4'),(10,10,1,'DDa','dda','dda',NULL,1,'2024-09-03 02:29:54','2024-09-03 02:30:00','311e86c9-9084-4a63-8a06-15201944d2ed'),(11,11,1,'DDa','dda','dda',NULL,1,'2024-09-03 02:29:56','2024-09-03 02:29:56','bf93faee-db7f-4a84-8d78-1721a0b30d80'),(12,12,1,'Our Services','our-services',NULL,'{\"75bdbc80-6a47-442a-abd7-22c49eece2ab\": \"{entry:10@1:url}\"}',1,'2024-09-03 02:30:00','2024-09-03 02:30:00','775d40d4-bb99-4917-8369-f3460164a938'),(14,14,1,'Our Services','our-services',NULL,'{\"75bdbc80-6a47-442a-abd7-22c49eece2ab\": \"mailto:moca@moca.co.nz\"}',1,'2024-09-03 02:30:20','2024-09-03 02:30:20','aaf27461-feda-4115-9703-2ec41c1958fc'),(16,16,1,'Our Services','our-services',NULL,'{\"75bdbc80-6a47-442a-abd7-22c49eece2ab\": \"tel:9849849845\"}',1,'2024-09-03 02:30:47','2024-09-03 02:30:47','e98a114b-3ec6-4fcd-83d3-7a0e89df7470'),(18,18,1,'Our Services','our-services',NULL,'{\"75bdbc80-6a47-442a-abd7-22c49eece2ab\": \"https://prospa.ddev.site:8443/\"}',1,'2024-09-03 02:31:29','2024-09-03 02:31:29','09958f8b-7827-4605-b29e-7f7ffdb16dda'),(20,20,1,'Our Services','our-services',NULL,NULL,1,'2024-09-03 02:32:27','2024-09-03 02:32:27','bacd8aba-652b-48c4-9f15-ae06239b55c4'),(22,22,1,'Our Services','our-services',NULL,NULL,1,'2024-09-03 02:32:32','2024-09-03 02:32:32','ffaf5d57-3205-4761-b1b4-31c6b40e6e12'),(24,24,1,'Our Services','our-services',NULL,'{\"75bdbc80-6a47-442a-abd7-22c49eece2ab\": \"mailto:mail@m.com\"}',1,'2024-09-03 02:32:39','2024-09-03 02:32:39','d5d6cacc-e08e-40b6-9d66-0304aef18d60'),(26,26,1,'Our Services','our-services',NULL,'{\"75bdbc80-6a47-442a-abd7-22c49eece2ab\": \"{entry:10@1:url}\"}',1,'2024-09-03 02:32:48','2024-09-03 02:32:48','1e6fabe6-1f4c-4496-a634-25fba6e4bba6'),(28,28,1,'Our Services','our-services',NULL,'{\"75bdbc80-6a47-442a-abd7-22c49eece2ab\": \"https://item.linkField.type\"}',1,'2024-09-03 02:33:26','2024-09-03 02:33:26','7b33739f-a4cd-4e13-ba11-adeb1923a2ce'),(29,29,1,'Site Settings','site-settings',NULL,'{\"4a39ce45-5160-451a-aece-0652ba8208b6\": \"0800867674\", \"aa529e71-3082-46d5-a2c8-71dcc40dcbbe\": \"info@prospa.nz\"}',1,'2024-09-03 02:45:00','2024-09-03 03:08:32','b6aecbdc-4306-481a-ab06-9862e95a20f2'),(30,30,1,'Site Settings','site-settings',NULL,NULL,1,'2024-09-03 02:45:00','2024-09-03 02:45:00','2db7f6b8-53ba-4a20-90c7-72442e833fd2'),(31,31,1,NULL,'__temp_dirzcxulbnemfrkizvrmqrcjxzkzycaxhcsn',NULL,NULL,1,'2024-09-03 02:47:19','2024-09-03 02:47:19','1418308d-13d7-4250-a9c2-8ef8fa16b0b5'),(34,34,1,NULL,'__temp_bhnyvrxkgcotvydaornjqtyswbqfubkmxpak',NULL,NULL,1,'2024-09-03 02:50:41','2024-09-03 02:50:41','40e3c771-5557-447b-9946-8bf87e467155'),(35,35,1,'Our People','our-people',NULL,NULL,1,'2024-09-03 03:03:30','2024-09-03 03:03:39','b99100c1-d854-463f-a1bf-1172c3560970'),(36,36,1,'Our People','our-people',NULL,NULL,1,'2024-09-03 03:03:39','2024-09-03 03:03:39','450a95fd-b640-4a4b-88ed-ea675b8c9430'),(37,37,1,'Case Studies','case-studies',NULL,NULL,1,'2024-09-03 03:03:40','2024-09-03 03:03:44','0a36757f-3739-433b-be81-2c36f588c788'),(38,38,1,'Case Studies','case-studies',NULL,NULL,1,'2024-09-03 03:03:44','2024-09-03 03:03:44','d6863e86-594e-4b85-834f-2a83e834ebbd'),(39,39,1,'FAQs','faqs',NULL,NULL,1,'2024-09-03 03:03:44','2024-09-03 03:03:48','1767f065-cc9c-42bd-9139-54994a79c182'),(40,40,1,'FAQs','faqs',NULL,NULL,1,'2024-09-03 03:03:48','2024-09-03 03:03:48','2e5b5844-4e9c-40eb-9262-3b0117f9c4c2'),(41,41,1,'Events','events',NULL,NULL,1,'2024-09-03 03:03:48','2024-09-03 03:03:52','fa02061a-5d80-42e0-adaa-4532d741b06a'),(42,42,1,'Events','events',NULL,NULL,1,'2024-09-03 03:03:52','2024-09-03 03:03:52','9ab60602-42d1-4172-9262-dd7cd7955f68'),(43,43,1,'Contact','contact',NULL,NULL,1,'2024-09-03 03:03:52','2024-09-03 03:03:57','04f5c24a-ab0f-4f27-adf1-2d4cc588692f'),(44,44,1,'Contact','contact',NULL,NULL,1,'2024-09-03 03:03:57','2024-09-03 03:03:57','f70c721d-0afe-4b62-8aa8-f16a250b9e6e'),(45,45,1,'facebook-f','facebook-f',NULL,'{\"8ed2fcaf-086f-4152-ab6b-627e9dbd3744\": \"facebook-f\"}',1,'2024-09-03 03:08:32','2024-09-03 03:08:32','7e7fcdd8-81ed-4726-a797-ffe5a6e733a0'),(46,46,1,'Site Settings','site-settings',NULL,'{\"4a39ce45-5160-451a-aece-0652ba8208b6\": \"0800867674\", \"aa529e71-3082-46d5-a2c8-71dcc40dcbbe\": \"info@prospa.nz\"}',1,'2024-09-03 03:08:32','2024-09-03 03:08:32','0f604fde-a5f8-420a-8c10-520a4641c132'),(47,47,1,'facebook-f','facebook-f',NULL,'{\"8ed2fcaf-086f-4152-ab6b-627e9dbd3744\": \"facebook-f\"}',1,'2024-09-03 03:08:32','2024-09-03 03:08:32','567ab6be-4906-4dfd-a535-362e9550d0c1'),(48,48,1,'Careers','careers',NULL,NULL,1,'2024-09-03 03:10:36','2024-09-03 03:10:46','7e15fb76-5d6a-454d-a6b5-a744367dc802'),(49,49,1,'Careers','careers',NULL,NULL,1,'2024-09-03 03:10:46','2024-09-03 03:10:46','9e45da66-b273-484d-b3ad-323a536d5624'),(50,50,1,'Sustainability','sustainability',NULL,NULL,1,'2024-09-03 03:10:46','2024-09-03 03:10:48','e1dcb9d8-bc09-4c0d-bb1a-b7783a102388'),(51,51,1,'Sustainability','sustainability',NULL,NULL,1,'2024-09-03 03:10:48','2024-09-03 03:10:48','94e6d656-4168-49d4-a3d4-6082129476d7'),(52,52,1,'Privacy Policy','privacy-policy',NULL,NULL,1,'2024-09-03 03:10:48','2024-09-03 03:10:55','3618638d-2947-4731-a8a0-d79c26cbadc5'),(53,53,1,'Privacy Policy','privacy-policy',NULL,NULL,1,'2024-09-03 03:10:55','2024-09-03 03:10:55','bf0a5f01-87ef-4665-bd83-6644c1c3f18e');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (3,1,NULL,NULL,NULL,1,'2024-09-03 02:06:05',NULL,NULL,'2024-09-03 02:06:05','2024-09-03 02:06:05'),(4,2,NULL,NULL,NULL,4,'2024-09-03 02:27:00',NULL,NULL,'2024-09-03 02:25:07','2024-09-03 02:27:00'),(5,NULL,NULL,4,4,3,'2024-09-03 02:25:00',NULL,1,'2024-09-03 02:25:09','2024-09-03 02:25:10'),(6,2,NULL,NULL,NULL,4,'2024-09-03 02:27:00',NULL,NULL,'2024-09-03 02:27:00','2024-09-03 02:27:00'),(8,2,NULL,NULL,NULL,4,'2024-09-03 02:27:00',NULL,NULL,'2024-09-03 02:27:10','2024-09-03 02:27:10'),(10,1,NULL,NULL,NULL,1,'2024-09-03 02:29:00',NULL,NULL,'2024-09-03 02:29:54','2024-09-03 02:29:56'),(11,1,NULL,NULL,NULL,1,'2024-09-03 02:29:00',NULL,NULL,'2024-09-03 02:29:56','2024-09-03 02:29:56'),(12,2,NULL,NULL,NULL,4,'2024-09-03 02:27:00',NULL,NULL,'2024-09-03 02:30:00','2024-09-03 02:30:00'),(14,2,NULL,NULL,NULL,4,'2024-09-03 02:27:00',NULL,NULL,'2024-09-03 02:30:20','2024-09-03 02:30:20'),(16,2,NULL,NULL,NULL,4,'2024-09-03 02:27:00',NULL,NULL,'2024-09-03 02:30:47','2024-09-03 02:30:47'),(18,2,NULL,NULL,NULL,4,'2024-09-03 02:27:00',NULL,NULL,'2024-09-03 02:31:29','2024-09-03 02:31:29'),(20,2,NULL,NULL,NULL,4,'2024-09-03 02:27:00',NULL,NULL,'2024-09-03 02:32:27','2024-09-03 02:32:27'),(22,2,NULL,NULL,NULL,4,'2024-09-03 02:27:00',NULL,NULL,'2024-09-03 02:32:32','2024-09-03 02:32:32'),(24,2,NULL,NULL,NULL,4,'2024-09-03 02:27:00',NULL,NULL,'2024-09-03 02:32:39','2024-09-03 02:32:39'),(26,2,NULL,NULL,NULL,4,'2024-09-03 02:27:00',NULL,NULL,'2024-09-03 02:32:48','2024-09-03 02:32:48'),(28,2,NULL,NULL,NULL,4,'2024-09-03 02:27:00',NULL,NULL,'2024-09-03 02:33:26','2024-09-03 02:33:26'),(29,3,NULL,NULL,NULL,7,'2024-09-03 02:45:00',NULL,NULL,'2024-09-03 02:45:00','2024-09-03 02:45:00'),(30,3,NULL,NULL,NULL,7,'2024-09-03 02:45:00',NULL,NULL,'2024-09-03 02:45:00','2024-09-03 02:45:00'),(31,2,NULL,NULL,NULL,4,'2024-09-03 02:47:19',NULL,NULL,'2024-09-03 02:47:19','2024-09-03 02:47:19'),(34,2,NULL,NULL,NULL,4,'2024-09-03 02:50:41',NULL,NULL,'2024-09-03 02:50:41','2024-09-03 02:50:41'),(35,2,NULL,NULL,NULL,4,'2024-09-03 03:03:00',NULL,NULL,'2024-09-03 03:03:30','2024-09-03 03:03:39'),(36,2,NULL,NULL,NULL,4,'2024-09-03 03:03:00',NULL,NULL,'2024-09-03 03:03:39','2024-09-03 03:03:39'),(37,2,NULL,NULL,NULL,4,'2024-09-03 03:03:00',NULL,NULL,'2024-09-03 03:03:40','2024-09-03 03:03:44'),(38,2,NULL,NULL,NULL,4,'2024-09-03 03:03:00',NULL,NULL,'2024-09-03 03:03:44','2024-09-03 03:03:44'),(39,2,NULL,NULL,NULL,4,'2024-09-03 03:03:00',NULL,NULL,'2024-09-03 03:03:44','2024-09-03 03:03:48'),(40,2,NULL,NULL,NULL,4,'2024-09-03 03:03:00',NULL,NULL,'2024-09-03 03:03:48','2024-09-03 03:03:48'),(41,2,NULL,NULL,NULL,4,'2024-09-03 03:03:00',NULL,NULL,'2024-09-03 03:03:48','2024-09-03 03:03:52'),(42,2,NULL,NULL,NULL,4,'2024-09-03 03:03:00',NULL,NULL,'2024-09-03 03:03:52','2024-09-03 03:03:52'),(43,2,NULL,NULL,NULL,4,'2024-09-03 03:03:00',NULL,NULL,'2024-09-03 03:03:52','2024-09-03 03:03:57'),(44,2,NULL,NULL,NULL,4,'2024-09-03 03:03:00',NULL,NULL,'2024-09-03 03:03:57','2024-09-03 03:03:57'),(45,NULL,NULL,29,11,6,'2024-09-03 02:47:00',NULL,NULL,'2024-09-03 03:08:32','2024-09-03 03:08:32'),(46,3,NULL,NULL,NULL,7,'2024-09-03 02:45:00',NULL,NULL,'2024-09-03 03:08:32','2024-09-03 03:08:32'),(47,NULL,NULL,46,11,6,'2024-09-03 02:47:00',NULL,NULL,'2024-09-03 03:08:32','2024-09-03 03:08:32'),(48,4,NULL,NULL,NULL,4,'2024-09-03 03:10:00',NULL,NULL,'2024-09-03 03:10:36','2024-09-03 03:10:46'),(49,4,NULL,NULL,NULL,4,'2024-09-03 03:10:00',NULL,NULL,'2024-09-03 03:10:46','2024-09-03 03:10:46'),(50,4,NULL,NULL,NULL,4,'2024-09-03 03:10:00',NULL,NULL,'2024-09-03 03:10:46','2024-09-03 03:10:48'),(51,4,NULL,NULL,NULL,4,'2024-09-03 03:10:00',NULL,NULL,'2024-09-03 03:10:48','2024-09-03 03:10:48'),(52,4,NULL,NULL,NULL,4,'2024-09-03 03:10:00',NULL,NULL,'2024-09-03 03:10:48','2024-09-03 03:10:55'),(53,4,NULL,NULL,NULL,4,'2024-09-03 03:10:00',NULL,NULL,'2024-09-03 03:10:55','2024-09-03 03:10:55');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES (3,1,1),(4,1,1),(6,1,1),(8,1,1),(10,1,1),(11,1,1),(12,1,1),(14,1,1),(16,1,1),(18,1,1),(20,1,1),(22,1,1),(24,1,1),(26,1,1),(28,1,1),(31,1,1),(34,1,1),(35,1,1),(36,1,1),(37,1,1),(38,1,1),(39,1,1),(40,1,1),(41,1,1),(42,1,1),(43,1,1),(44,1,1),(48,1,1),(49,1,1),(50,1,1),(51,1,1),(52,1,1),(53,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'Page - Blocks','pageBlocks','file',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2024-07-04 01:19:21','2024-07-04 01:19:21',NULL,'bdf6317d-0df7-449f-a937-a1a274ffb106'),(2,3,'Internal Link','internalLink','page',NULL,0,'site',NULL,'',0,'site',NULL,1,'2024-09-03 02:23:24','2024-09-03 02:23:24',NULL,'70458b6c-f389-4606-a2c5-a0994a111a40'),(3,4,'Link Field','linkField','globe',NULL,0,'site',NULL,'',0,'site',NULL,1,'2024-09-03 02:24:48','2024-09-03 02:45:55','2024-09-03 02:50:34','79457a77-9405-4bfe-8c1c-bbfbe8f974c4'),(4,5,'Navigation','navigation','bars',NULL,1,'site',NULL,'',0,'site',NULL,1,'2024-09-03 02:24:59','2024-09-03 02:24:59',NULL,'401590d1-1d18-4503-8baf-2560169e8c8f'),(5,6,'Site Settings','siteSettings','gear',NULL,0,'site',NULL,'Site Settings',0,'site',NULL,1,'2024-09-03 02:35:24','2024-09-03 02:35:24','2024-09-03 02:45:16','23bd50a2-bf84-4c08-9a4f-f487113722a9'),(6,7,'Social Media','socialMedia','hashtag',NULL,0,'site',NULL,'{socialMediaType.value}',0,'site',NULL,1,'2024-09-03 02:38:03','2024-09-03 02:49:07',NULL,'ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3'),(7,8,'Site Settings','siteSettings','gear',NULL,0,'site',NULL,'Site Settings',0,'site',NULL,1,'2024-09-03 02:44:59','2024-09-03 02:45:23',NULL,'05fb432b-77b1-40bc-8ff7-56425ce230ad'),(8,9,'Just Content','justContent','triangle-exclamation',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-09-03 02:53:21','2024-09-03 02:53:21',NULL,'fcf95a95-6db1-48dd-9aa8-a641adeec479');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"0102572d-d127-40b1-b9c0-704387cc932f\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"0cf026d5-6d08-4e27-8a1f-ab30bca41c98\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}','2024-07-04 01:19:21','2024-07-04 01:19:21',NULL,'71660a2a-5e9c-456e-9584-e81e70baf6f2'),(2,'craft\\elements\\User','{\"tabs\": [{\"uid\": \"366b3483-a440-4c21-8176-e5e4a5a3f72a\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"26dfedb2-a9db-4faa-bff4-bff0af4682f4\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\users\\\\FullNameField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": false, \"attribute\": \"fullName\", \"inputType\": null, \"requirable\": true, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"id\": null, \"tip\": null, \"uid\": \"27c4bf62-bda3-45fe-9a25-de520cf57c33\", \"type\": \"craft\\\\fieldlayoutelements\\\\users\\\\PhotoField\", \"label\": null, \"width\": 100, \"warning\": null, \"requirable\": false, \"orientation\": null, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"275bc1be-6632-4ef8-bf93-204f0a109984\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\users\\\\EmailField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}','2024-07-04 01:19:21','2024-07-04 01:19:21',NULL,'a503256d-9911-4514-9ccd-b894513f87ed'),(3,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"22507cd6-91ed-40c8-afa1-88f56a37f412\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"64240877-a304-4f33-94fe-78933c992573\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-09-03T02:21:08+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"95491145-4945-49f0-a727-923ee418902a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"dc8f8aeb-7a68-4039-8224-309e42b0a9de\", \"required\": false, \"dateAdded\": \"2024-09-03T02:23:24+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-03 02:23:24','2024-09-03 02:23:24',NULL,'e96c8427-37b5-4887-8ace-7a23b00f12cc'),(4,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"387cde56-6f85-4a8b-9582-6dfd355579b3\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"d4e471e1-6025-4c8c-9c28-a106cd1a64ce\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-09-03T02:22:33+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"3c200bc8-f427-45f8-9348-b0488d6535ab\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"2b988591-9982-412b-b0d9-3b6599c0d5df\", \"required\": false, \"dateAdded\": \"2024-09-03T02:24:48+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-03 02:24:48','2024-09-03 02:24:48','2024-09-03 02:50:34','68598d7d-685b-465d-8aac-b10ddf3662ad'),(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"27b18608-3051-4652-a46d-0d4e8e62e02c\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"a3c7fe31-80b0-435a-8ecd-92cc2df27485\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 50, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-09-03T02:20:10+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"75bdbc80-6a47-442a-abd7-22c49eece2ab\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"d1b2a017-2d04-4c75-b64f-08e1e463a08a\", \"required\": false, \"dateAdded\": \"2024-09-03T02:24:59+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-03 02:24:59','2024-09-03 02:24:59',NULL,'745a0d7b-5782-4faf-be73-36fbdeec4fa2'),(6,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"8af6e3ad-7b40-49c7-8923-e0135b368a4c\", \"name\": \"Site Info\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"6d7b8d1a-9a57-485e-acf0-c8d5f932b9d0\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-09-03T02:33:35+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-03 02:35:24','2024-09-03 02:35:24','2024-09-03 02:45:16','bef0f73c-2474-4511-8145-417b47c62f61'),(7,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"9f5471c2-15fd-4e36-aa38-d6c53a5099e8\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"67738bfd-7e53-45bf-b206-fd5f02da0702\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 50, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-09-03T02:35:44+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"c2e6f968-985a-4076-9b8f-c68696683b90\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"2b988591-9982-412b-b0d9-3b6599c0d5df\", \"required\": false, \"dateAdded\": \"2024-09-03T02:49:07+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"8ed2fcaf-086f-4152-ab6b-627e9dbd3744\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"4173875d-a199-4944-9f1a-3319bffe8113\", \"required\": false, \"dateAdded\": \"2024-09-03T02:48:21+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-03 02:38:03','2024-09-03 02:49:07',NULL,'fa88878b-fe55-4576-a5bf-d61adcf538d3'),(8,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"4297a4e1-48fe-45d0-ac9c-870b370e3836\", \"name\": \"Site Info\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"74684534-8011-4515-a3a6-46c50a47fdd2\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-09-03T02:44:17+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"cbfa196d-8d17-4064-a63b-e703c262c923\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Google Maps Api\", \"width\": 25, \"handle\": \"googleMapsApi\", \"warning\": null, \"fieldUid\": \"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\", \"required\": false, \"dateAdded\": \"2024-09-03T02:44:59+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"4c016ccd-f324-474c-964e-57097e297979\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Google Analytics\", \"width\": 25, \"handle\": \"googleAnalytics\", \"warning\": null, \"fieldUid\": \"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\", \"required\": false, \"dateAdded\": \"2024-09-03T02:44:59+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"1f2dff3c-d140-4c04-99c8-611e54ce4c3b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Google Tag Manager\", \"width\": 25, \"handle\": \"gtm\", \"warning\": null, \"fieldUid\": \"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\", \"required\": false, \"dateAdded\": \"2024-09-03T02:44:59+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"48895358-f22c-4d6f-ad4a-a048cfd8a4da\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Clarity Code\", \"width\": 25, \"handle\": \"clarity\", \"warning\": null, \"fieldUid\": \"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\", \"required\": false, \"dateAdded\": \"2024-09-03T02:44:59+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"uid\": \"5f72ffb3-1925-4529-a54f-02b8cbcbd02e\", \"type\": \"craft\\\\fieldlayoutelements\\\\HorizontalRule\", \"dateAdded\": \"2024-09-03T02:44:59+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b4380c5d-f3b9-41de-aa26-b2016e45f22e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"53449f53-916a-460c-84ed-4c4342067e0d\", \"required\": false, \"dateAdded\": \"2024-09-03T02:44:59+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"b2bf5e38-8b62-475c-8de1-e42aca093e85\", \"name\": \"Contact Info\", \"elements\": [{\"tip\": null, \"uid\": \"4a39ce45-5160-451a-aece-0652ba8208b6\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Phone Number\", \"width\": 25, \"handle\": \"phoneNumber\", \"warning\": null, \"fieldUid\": \"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\", \"required\": false, \"dateAdded\": \"2024-09-03T02:44:59+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"c158b664-b98b-455b-a2f1-0efd9f1d9590\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Phone Number\", \"width\": 25, \"handle\": \"phoneNumber2\", \"warning\": null, \"fieldUid\": \"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\", \"required\": false, \"dateAdded\": \"2024-09-03T02:44:59+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"aa529e71-3082-46d5-a2c8-71dcc40dcbbe\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"d388c229-d406-4b40-930e-6c6a14eb67cb\", \"required\": false, \"dateAdded\": \"2024-09-03T02:44:59+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"uid\": \"0b3e9240-7145-46ad-9dc4-b27bbcb5b027\", \"type\": \"craft\\\\fieldlayoutelements\\\\HorizontalRule\", \"dateAdded\": \"2024-09-03T02:44:59+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"d1124ed4-3339-43af-b4ab-63318891ec8a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Address\", \"width\": 100, \"handle\": \"address\", \"warning\": null, \"fieldUid\": \"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\", \"required\": false, \"dateAdded\": \"2024-09-03T02:44:59+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"c5575e1a-59c5-401b-8629-6bcd6581c16a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Latitude\", \"width\": 50, \"handle\": \"lat\", \"warning\": null, \"fieldUid\": \"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\", \"required\": false, \"dateAdded\": \"2024-09-03T02:44:59+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b5842d58-3593-4229-998f-1e6f5bea44ca\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Longitude\", \"width\": 50, \"handle\": \"lng\", \"warning\": null, \"fieldUid\": \"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\", \"required\": false, \"dateAdded\": \"2024-09-03T02:44:59+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"f7590f5d-3c05-467b-9c01-cb274ba2ba8a\", \"name\": \"Social Media\", \"elements\": [{\"tip\": null, \"uid\": \"4a899c6e-116d-4f60-a2d0-48791c2cf1ce\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9\", \"required\": false, \"dateAdded\": \"2024-09-03T02:44:59+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-03 02:44:59','2024-09-03 02:45:23',NULL,'da49e34d-4488-470a-b429-3807b94f94d9'),(9,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"d6da69cd-adbb-40f3-97b2-459118a4554a\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"a33edca0-ddc7-4618-b561-c62b805eb08b\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-09-03T02:51:49+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"bdb12c7f-d1f7-4cec-a780-3d5537fccc63\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Content\", \"width\": 100, \"handle\": \"contents\", \"warning\": null, \"fieldUid\": \"06b6050b-3bd9-4f2d-b243-a71d312eafe3\", \"required\": false, \"dateAdded\": \"2024-09-03T02:53:21+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-03 02:53:21','2024-09-03 02:53:21',NULL,'1a4830bd-3187-42d7-aa85-5afa3a70a036');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (2,'Entries','entries','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"cards\"}','2024-09-03 02:23:14','2024-09-03 02:23:14',NULL,'dc8f8aeb-7a68-4039-8224-309e42b0a9de'),(3,'URL','linkUrl','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Link','{\"maxLength\":255,\"types\":[\"url\"]}','2024-09-03 02:24:44','2024-09-03 02:50:08',NULL,'2b988591-9982-412b-b0d9-3b6599c0d5df'),(4,'Link Field','linkField','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Link','{\"maxLength\":255,\"typeSettings\":{\"asset\":{\"allowedKinds\":\"*\",\"showUnpermittedVolumes\":\"\",\"showUnpermittedFiles\":\"\"},\"entry\":{\"sources\":\"*\"}},\"types\":[\"url\",\"asset\",\"category\",\"email\",\"entry\",\"tel\"]}','2024-09-03 02:24:52','2024-09-03 02:26:34',NULL,'d1b2a017-2d04-4c75-b64f-08e1e463a08a'),(5,'Email Address','emailAddress','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Email','{\"placeholder\":null}','2024-09-03 02:38:03','2024-09-03 02:38:03',NULL,'d388c229-d406-4b40-930e-6c6a14eb67cb'),(6,'Form','form','global',NULL,NULL,0,'none',NULL,'verbb\\formie\\fields\\Forms','{\"allowSelfRelations\":false,\"branchLimit\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":\"Select A Form\",\"showCardsInGrid\":true,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"cards\"}','2024-09-03 02:38:03','2024-09-03 02:38:03',NULL,'1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69'),(7,'Full Option Content Editor','fullOptionContentEditor','global',NULL,NULL,1,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"ckeConfig\":\"97cf3fba-300b-4bbd-89de-d116f6ca64d2\",\"createButtonLabel\":\"Add\",\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2024-09-03 02:38:03','2024-09-03 02:38:03',NULL,'06b6050b-3bd9-4f2d-b243-a71d312eafe3'),(8,'Multi Line Text','multiLineText','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-09-03 02:38:03','2024-09-03 02:38:03',NULL,'63206d24-ecbb-4b9c-8ae7-7ce5fd86f063'),(9,'Simple Text Editor','simpleTextEditor','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"ckeConfig\":null,\"createButtonLabel\":null,\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2024-09-03 02:38:03','2024-09-03 02:38:03',NULL,'53449f53-916a-460c-84ed-4c4342067e0d'),(10,'Single Line Text','singleLineText','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-09-03 02:38:03','2024-09-03 02:38:03',NULL,'d09e7eaa-db8d-4b8c-a242-4cad3af936c0'),(11,'Social Media','socialMedia','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minEntries\":null,\"maxEntries\":null,\"viewMode\":\"blocks\",\"showCardsInGrid\":false,\"includeTableView\":false,\"defaultTableColumns\":[],\"pageSize\":null,\"createButtonLabel\":\"Social Media\",\"propagationMethod\":\"all\",\"propagationKeyFormat\":null,\"siteSettings\":{\"08c386f4-5a41-4c9f-8282-f6785af06bfc\":[]},\"entryTypes\":[\"ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3\"]}','2024-09-03 02:38:03','2024-09-03 02:48:23',NULL,'1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9'),(12,'Social Media Type','socialMediaType','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Facebook\",\"value\":\"facebook-f\",\"default\":\"\"},{\"label\":\"Twitter (X)\",\"value\":\"twitterX\",\"default\":\"\"},{\"label\":\"Instagram\",\"value\":\"instagram\",\"default\":\"\"},{\"label\":\"Linkedin\",\"value\":\"linkedin\",\"default\":\"\"},{\"label\":\"Pintetest\",\"value\":\"pintetest\",\"default\":\"\"},{\"label\":\"Website\",\"value\":\"globe-pointer\",\"default\":\"\"}]}','2024-09-03 02:38:03','2024-09-03 02:38:03',NULL,'4173875d-a199-4944-9f1a-3319bffe8113');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_emailtemplates`
--

LOCK TABLES `formie_emailtemplates` WRITE;
/*!40000 ALTER TABLE `formie_emailtemplates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_emailtemplates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_fieldlayout_pages`
--

LOCK TABLES `formie_fieldlayout_pages` WRITE;
/*!40000 ALTER TABLE `formie_fieldlayout_pages` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_fieldlayout_pages` VALUES (1,1,'Page 1',0,'{\"submitButtonLabel\":\"Send message\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[],\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}','2024-07-22 01:42:38','2024-07-22 01:48:13','48fbc537-61f0-406f-86ec-4f913a51f822'),(2,2,'Page 1',0,'{\"submitButtonLabel\":\"Submit\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[],\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}','2024-07-22 01:42:38','2024-07-22 01:42:38','ff73e337-f136-48c6-a94d-1e00527a0ce1');
/*!40000 ALTER TABLE `formie_fieldlayout_pages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_fieldlayout_rows`
--

LOCK TABLES `formie_fieldlayout_rows` WRITE;
/*!40000 ALTER TABLE `formie_fieldlayout_rows` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_fieldlayout_rows` VALUES (1,1,1,0,'2024-07-22 01:42:38','2024-07-22 01:42:38','cd62d31d-f1aa-4714-b726-ec0cb28d0eec'),(2,2,2,0,'2024-07-22 01:42:38','2024-07-22 01:42:38','cc0d5e32-1ee9-4f2e-93e7-79d0cc7c4e3c'),(3,1,1,1,'2024-07-22 01:42:38','2024-07-22 01:42:38','f7b33739-0b3b-4434-a273-481b162128d2'),(4,1,1,4,'2024-07-22 01:42:38','2024-07-22 01:48:13','bf89e2ca-031c-4b74-aba6-42ba8e10a5de'),(9,1,1,3,'2024-07-22 04:28:56','2024-07-22 04:38:15','a7a70b76-4af1-4a68-9769-112094206399'),(10,1,1,2,'2024-07-22 04:38:15','2024-07-22 04:38:15','2867ae37-7dde-4edb-8812-751eda764d62');
/*!40000 ALTER TABLE `formie_fieldlayout_rows` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_fieldlayouts`
--

LOCK TABLES `formie_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `formie_fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_fieldlayouts` VALUES (1,'2024-07-22 01:42:38','2024-07-22 01:42:38','669b1a9e-4c03-4db8-9a68-e78559432fc6'),(2,'2024-07-22 01:42:38','2024-07-22 01:42:38','d893a4fc-bbaf-457c-b027-cf69fe699d2d');
/*!40000 ALTER TABLE `formie_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_fields`
--

LOCK TABLES `formie_fields` WRITE;
/*!40000 ALTER TABLE `formie_fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_fields` VALUES (1,2,2,2,NULL,'Prefix','prefix','verbb\\formie\\fields\\subfields\\NamePrefix',0,'{\"optgroups\":true,\"limitOptions\":false,\"min\":null,\"max\":null,\"instructions\":null,\"enabled\":false,\"required\":false,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"honorific-prefix\"}],\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null,\"options\":[{\"isDefault\":true,\"label\":\"Select an option\",\"value\":\"\"}],\"multi\":false,\"layout\":null}','2024-07-22 01:42:38','2024-07-22 01:42:38','9cb07645-05a6-42bb-b5d6-2c9f1d618db4'),(2,2,2,2,NULL,'First Name','firstName','verbb\\formie\\fields\\subfields\\NameFirst',1,'{\"limit\":false,\"min\":null,\"minType\":\"characters\",\"max\":null,\"maxType\":\"characters\",\"uniqueValue\":false,\"instructions\":null,\"enabled\":true,\"required\":true,\"matchField\":null,\"placeholder\":\"e.g. Peter\",\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"given-name\"}],\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null}','2024-07-22 01:42:38','2024-07-22 01:42:38','ec494a85-8c38-4f09-85bb-0073b44c8376'),(3,2,2,2,NULL,'Middle Name','middleName','verbb\\formie\\fields\\subfields\\NameMiddle',2,'{\"limit\":false,\"min\":null,\"minType\":\"characters\",\"max\":null,\"maxType\":\"characters\",\"uniqueValue\":false,\"instructions\":null,\"enabled\":false,\"required\":false,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"additional-name\"}],\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null}','2024-07-22 01:42:38','2024-07-22 01:42:38','f051cd4c-6fd1-4d8a-9a38-bb222f2d6dc4'),(4,2,2,2,NULL,'Last Name','lastName','verbb\\formie\\fields\\subfields\\NameLast',3,'{\"limit\":false,\"min\":null,\"minType\":\"characters\",\"max\":null,\"maxType\":\"characters\",\"uniqueValue\":false,\"instructions\":null,\"enabled\":true,\"required\":true,\"matchField\":null,\"placeholder\":\"e.g. Sherman\",\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"family-name\"}],\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null}','2024-07-22 01:42:38','2024-07-22 01:42:38','61cf791a-6603-496f-8aa6-790bcad13047'),(5,1,1,1,NULL,'Name','yourName','verbb\\formie\\fields\\Name',0,'{\"useMultipleFields\":false,\"instructions\":null,\"enabled\":true,\"required\":true,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"instructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null,\"nestedLayoutId\":2,\"contentTable\":null,\"subFieldLabelPosition\":null}','2024-07-22 01:42:38','2024-07-22 04:28:56','2b2c75eb-a639-4cec-94a7-b2a5993327e9'),(6,1,1,3,NULL,'Email','emailAddress','verbb\\formie\\fields\\Email',0,'{\"validateDomain\":false,\"blockedDomains\":[],\"uniqueValue\":false,\"instructions\":null,\"enabled\":true,\"required\":true,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null}','2024-07-22 01:42:38','2024-07-22 01:48:13','4a0319de-0223-491e-9d97-f98e4e9c9ef5'),(7,1,1,4,NULL,'Message','message','verbb\\formie\\fields\\MultiLineText',0,'{\"limit\":false,\"min\":null,\"minType\":\"characters\",\"max\":null,\"maxType\":\"characters\",\"useRichText\":false,\"richTextButtons\":[\"bold\",\"italic\"],\"uniqueValue\":false,\"instructions\":null,\"enabled\":true,\"required\":true,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null}','2024-07-22 01:42:38','2024-07-23 00:11:03','8752f035-4b23-4819-a500-01fbcd5430b3'),(8,1,1,10,NULL,'Phone','phone','verbb\\formie\\fields\\Phone',0,'{\"countryEnabled\":true,\"countryDefaultValue\":\"NZ\",\"countryAllowed\":[],\"instructions\":null,\"enabled\":true,\"required\":false,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null}','2024-07-22 01:48:13','2024-07-22 04:38:15','7c1cad39-1bd0-4161-8bd9-4ad5e5f2b0d6'),(10,1,1,9,NULL,'Region','formRegion','verbb\\formie\\fields\\Dropdown',0,'{\"optgroups\":true,\"limitOptions\":false,\"min\":null,\"max\":null,\"instructions\":null,\"enabled\":true,\"required\":false,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null,\"options\":[{\"label\":\"Northland\",\"value\":\"Northland\",\"isDefault\":true,\"__isNew\":true},{\"label\":\"Auckland\",\"value\":\"Auckland\",\"isDefault\":false},{\"label\":\"Waikato\",\"value\":\"Waikato\",\"isDefault\":false},{\"label\":\"Bay of Plenty\",\"value\":\"Bay of Plenty\",\"isDefault\":false},{\"label\":\"Gisborne\",\"value\":\"Gisborne\",\"isDefault\":false},{\"label\":\"Hawke\'s Bay\",\"value\":\"Hawke\'s Bay\",\"isDefault\":false},{\"label\":\"Taranaki\",\"value\":\"Taranaki\",\"isDefault\":false},{\"label\":\"Manawatū-Whanganui\",\"value\":\"Manawatū-Whanganui\",\"isDefault\":false},{\"label\":\"Wellington\",\"value\":\"Wellington\",\"isDefault\":false},{\"label\":\"Tasman\",\"value\":\"Tasman\",\"isDefault\":false},{\"label\":\"Nelson\",\"value\":\"Nelson\",\"isDefault\":false},{\"label\":\"Marlborough\",\"value\":\"Marlborough\",\"isDefault\":false},{\"label\":\"West Coast\",\"value\":\"West Coast\",\"isDefault\":false},{\"label\":\"Canterbury\",\"value\":\"Canterbury\",\"isDefault\":false},{\"label\":\"Otago\",\"value\":\"Otago\",\"isDefault\":false},{\"label\":\"Southland\",\"value\":\"Southland\",\"isDefault\":false}],\"multi\":false,\"layout\":null}','2024-07-22 04:28:56','2024-07-22 04:28:56','37a9fd22-08a1-47e9-a622-9536dc3e50aa');
/*!40000 ALTER TABLE `formie_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_forms`
--

LOCK TABLES `formie_forms` WRITE;
/*!40000 ALTER TABLE `formie_forms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_forms` VALUES (2,'contact','{\"displayFormTitle\":false,\"displayCurrentPageTitle\":false,\"displayPageTabs\":false,\"displayPageProgress\":false,\"scrollToTop\":true,\"progressPosition\":\"end\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"requiredIndicator\":\"asterisk\",\"submitMethod\":\"ajax\",\"submitAction\":\"message\",\"submitActionTab\":null,\"submitActionUrl\":null,\"submitActionFormHide\":false,\"submitActionMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"},\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\\\"}]}]\",\"submitActionMessageTimeout\":null,\"submitActionMessagePosition\":\"top-form\",\"loadingIndicator\":\"spinner\",\"loadingIndicatorText\":null,\"validationOnSubmit\":true,\"validationOnFocus\":true,\"errorMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"},\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Couldn’t save submission due to errors.\\\"}]}]\",\"errorMessagePosition\":\"top-form\",\"requireUser\":false,\"requireUserMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"}}]\",\"scheduleForm\":false,\"scheduleFormStart\":null,\"scheduleFormEnd\":null,\"scheduleFormPendingMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"}}]\",\"scheduleFormExpiredMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"}}]\",\"limitSubmissions\":false,\"limitSubmissionsNumber\":null,\"limitSubmissionsType\":\"total\",\"limitSubmissionsMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"}}]\",\"integrations\":[],\"submissionTitleFormat\":\"{timestamp}\",\"collectIp\":false,\"collectUser\":false,\"dataRetention\":null,\"dataRetentionValue\":null,\"fileUploadsAction\":null,\"redirectUrl\":null,\"pageRedirectUrl\":null,\"defaultEmailTemplateId\":null,\"disableCaptchas\":false}',1,NULL,NULL,NULL,1,'forever',NULL,'retain','retain','2024-07-22 01:42:38','2024-07-23 00:11:03','5411c984-97e4-4481-b4d2-04344cb60e73');
/*!40000 ALTER TABLE `formie_forms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_formtemplates`
--

LOCK TABLES `formie_formtemplates` WRITE;
/*!40000 ALTER TABLE `formie_formtemplates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_formtemplates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_integrations`
--

LOCK TABLES `formie_integrations` WRITE;
/*!40000 ALTER TABLE `formie_integrations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_integrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_notifications`
--

LOCK TABLES `formie_notifications` WRITE;
/*!40000 ALTER TABLE `formie_notifications` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_notifications` VALUES (1,2,NULL,NULL,'Admin Notification','adminNotification',1,'A new submission was made on \"{formName}\"','email','{systemEmail}',NULL,NULL,NULL,'{field:emailAddress}',NULL,NULL,NULL,NULL,'[{\"type\":\"paragraph\",\"attrs\":{\"textAlign\":\"start\"},\"content\":[{\"type\":\"text\",\"text\":\"A user submission has been made on the \\\"\"},{\"type\":\"variableTag\",\"attrs\":{\"label\":\"Form Name\",\"value\":\"{formName}\"}},{\"type\":\"text\",\"text\":\"\\\" form on \"},{\"type\":\"variableTag\",\"attrs\":{\"label\":\"Site Name\",\"value\":\"{siteName}\"}},{\"type\":\"text\",\"text\":\" at \"},{\"type\":\"variableTag\",\"attrs\":{\"label\":\"Timestamp (yyyy-mm-dd hh:mm:ss)\",\"value\":\"{timestamp}\"}}]},{\"type\":\"paragraph\",\"attrs\":{\"textAlign\":\"start\"},\"content\":[{\"type\":\"text\",\"text\":\"Their submission details are:\"}]},{\"type\":\"paragraph\",\"attrs\":{\"textAlign\":\"start\"},\"content\":[{\"type\":\"variableTag\",\"attrs\":{\"label\":\"All Form Fields\",\"value\":\"{allFields}\"}}]}]',1,NULL,'[]',NULL,NULL,'[]','2024-07-22 01:42:38','2024-07-22 01:48:13','c51c2f0c-410e-4c2b-b170-eb1ce3888aab'),(2,2,NULL,NULL,'User Notification','userNotification',1,'Thanks for contacting us!','email','{field:emailAddress}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[{\"type\":\"paragraph\",\"content\":[{\"type\":\"text\",\"text\":\"Thanks again for contacting us. Our team will get back to you as soon as we can.\"}]},{\"type\":\"paragraph\",\"content\":[{\"type\":\"text\",\"text\":\"As a reminder, you submitted the following details at \"},{\"type\":\"variableTag\",\"attrs\":{\"label\":\"Timestamp (yyyy-mm-dd hh:mm:ss)\",\"value\":\"{timestamp}\"}}]},{\"type\":\"paragraph\",\"content\":[{\"type\":\"variableTag\",\"attrs\":{\"label\":\"All Form Fields\",\"value\":\"{allFields}\"}}]}]',1,NULL,NULL,NULL,NULL,'[]','2024-07-22 01:42:38','2024-07-22 01:42:38','d663a285-dab7-4e8c-af8f-cdda82516e23');
/*!40000 ALTER TABLE `formie_notifications` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_payments`
--

LOCK TABLES `formie_payments` WRITE;
/*!40000 ALTER TABLE `formie_payments` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_payments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_payments_plans`
--

LOCK TABLES `formie_payments_plans` WRITE;
/*!40000 ALTER TABLE `formie_payments_plans` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_payments_plans` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_payments_subscriptions`
--

LOCK TABLES `formie_payments_subscriptions` WRITE;
/*!40000 ALTER TABLE `formie_payments_subscriptions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_payments_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_pdftemplates`
--

LOCK TABLES `formie_pdftemplates` WRITE;
/*!40000 ALTER TABLE `formie_pdftemplates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_pdftemplates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_relations`
--

LOCK TABLES `formie_relations` WRITE;
/*!40000 ALTER TABLE `formie_relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_sentnotifications`
--

LOCK TABLES `formie_sentnotifications` WRITE;
/*!40000 ALTER TABLE `formie_sentnotifications` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_sentnotifications` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_statuses`
--

LOCK TABLES `formie_statuses` WRITE;
/*!40000 ALTER TABLE `formie_statuses` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_statuses` VALUES (1,'New','new','green',NULL,1,1,NULL,'2024-07-04 01:19:55','2024-07-04 01:19:55','4162c5fc-73ec-4299-b9d2-3eb0ae698ef0');
/*!40000 ALTER TABLE `formie_statuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_stencils`
--

LOCK TABLES `formie_stencils` WRITE;
/*!40000 ALTER TABLE `formie_stencils` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_stencils` VALUES (1,'Contact Form','contactForm','{\"dataRetention\":\"forever\",\"dataRetentionValue\":null,\"fileUploadsAction\":\"retain\",\"notifications\":[{\"attachFiles\":true,\"content\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"A user submission has been made on the \\\\\\\"\\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Form Name\\\",\\\"value\\\":\\\"{formName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"\\\\\\\" form on \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Site Name\\\",\\\"value\\\":\\\"{siteName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\" at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Their submission details are:\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\",\"enabled\":true,\"name\":\"Admin Notification\",\"replyTo\":\"{field:emailAddress}\",\"subject\":\"A new submission was made on \\\"{formName}\\\"\",\"to\":\"{systemEmail}\"},{\"attachFiles\":true,\"content\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thanks again for contacting us. Our team will get back to you as soon as we can.\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"As a reminder, you submitted the following details at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\",\"enabled\":true,\"name\":\"User Notification\",\"replyTo\":null,\"subject\":\"Thanks for contacting us!\",\"to\":\"{field:emailAddress}\"}],\"pages\":[{\"label\":\"Page 1\",\"rows\":[{\"fields\":[{\"settings\":{\"enabled\":true,\"handle\":\"yourName\",\"instructions\":\"Please enter your full name.\",\"instructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"label\":\"Your Name\",\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"placeholder\":\"Your name\",\"required\":false,\"rows\":[{\"fields\":[{\"settings\":{\"enabled\":false,\"handle\":\"prefix\",\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"honorific-prefix\"}],\"label\":\"Prefix\",\"options\":[{\"isDefault\":true,\"isOptgroup\":false,\"label\":\"Select an option\",\"value\":\"\"}],\"required\":false},\"type\":\"verbb\\\\formie\\\\fields\\\\subfields\\\\NamePrefix\"},{\"settings\":{\"enabled\":true,\"handle\":\"firstName\",\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"given-name\"}],\"label\":\"First Name\",\"placeholder\":\"e.g. Peter\",\"required\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameFirst\"},{\"settings\":{\"enabled\":false,\"handle\":\"middleName\",\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"additional-name\"}],\"label\":\"Middle Name\",\"required\":false},\"type\":\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameMiddle\"},{\"settings\":{\"enabled\":true,\"handle\":\"lastName\",\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"family-name\"}],\"label\":\"Last Name\",\"placeholder\":\"e.g. Sherman\",\"required\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameLast\"}]}],\"useMultipleFields\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\Name\"}]},{\"fields\":[{\"settings\":{\"enabled\":true,\"handle\":\"emailAddress\",\"instructions\":\"Please enter your email so we can get in touch.\",\"label\":\"Email Address\",\"placeholder\":\"e.g. psherman@wallaby.com\",\"required\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\Email\"}]},{\"fields\":[{\"settings\":{\"enabled\":true,\"handle\":\"message\",\"instructions\":\"Please enter your comments.\",\"label\":\"Message\",\"placeholder\":\"e.g. The reason for my enquiry is...\",\"required\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\MultiLineText\"}]}],\"settings\":{\"backButtonLabel\":\"Back\",\"buttonsPosition\":\"left\",\"saveButtonLabel\":\"Save\",\"saveButtonStyle\":\"link\",\"showBackButton\":false,\"showSaveButton\":false,\"submitButtonLabel\":\"Contact us\"}}],\"settings\":{\"collectIp\":false,\"collectUser\":false,\"dataRetention\":null,\"dataRetentionValue\":null,\"defaultEmailTemplateId\":null,\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"disableCaptchas\":false,\"displayCurrentPageTitle\":false,\"displayFormTitle\":false,\"displayPageProgress\":false,\"displayPageTabs\":false,\"errorMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Couldn’t save submission due to errors.\\\"}]}]\",\"errorMessagePosition\":\"top-form\",\"fileUploadsAction\":null,\"limitSubmissions\":false,\"limitSubmissionsMessage\":null,\"limitSubmissionsNumber\":null,\"limitSubmissionsType\":null,\"loadingIndicator\":\"spinner\",\"loadingIndicatorText\":null,\"pageRedirectUrl\":null,\"progressPosition\":\"end\",\"redirectUrl\":null,\"requireUser\":false,\"requireUserMessage\":null,\"requiredIndicator\":\"asterisk\",\"scheduleForm\":false,\"scheduleFormEnd\":null,\"scheduleFormExpiredMessage\":null,\"scheduleFormPendingMessage\":null,\"scheduleFormStart\":null,\"scrollToTop\":true,\"submissionTitleFormat\":\"{timestamp}\",\"submitAction\":\"message\",\"submitActionFormHide\":false,\"submitActionMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\\\"}]}]\",\"submitActionMessagePosition\":\"top-form\",\"submitActionMessageTimeout\":null,\"submitActionTab\":null,\"submitActionUrl\":null,\"submitMethod\":\"ajax\",\"validationOnFocus\":true,\"validationOnSubmit\":true},\"userDeletedAction\":\"retain\"}',NULL,NULL,NULL,1,NULL,'2024-07-04 01:19:55','2024-07-04 01:19:55','bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb');
/*!40000 ALTER TABLE `formie_stencils` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_submissions`
--

LOCK TABLES `formie_submissions` WRITE;
/*!40000 ALTER TABLE `formie_submissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_submissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[]',1,'2024-07-04 01:19:21','2024-07-04 01:19:21','19d6d897-1cde-4d59-914a-2bf8a23e7916');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `hyper_element_cache`
--

LOCK TABLES `hyper_element_cache` WRITE;
/*!40000 ALTER TABLE `hyper_element_cache` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `hyper_element_cache` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `hyper_field_cache`
--

LOCK TABLES `hyper_field_cache` WRITE;
/*!40000 ALTER TABLE `hyper_field_cache` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `hyper_field_cache` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'5.3.6','5.3.0.2',0,'dznbnzdeuszl','3@qvqjtjghly','2024-07-04 01:19:21','2024-09-03 02:53:29','122cf878-ff8d-4551-a711-4022ead1e6cb');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','084bf543-9e5e-4b13-87a9-17a993d7ae91'),(2,'craft','m221101_115859_create_entries_authors_table','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','731c45eb-2b72-43fb-905e-fbc2200e73de'),(3,'craft','m221107_112121_add_max_authors_to_sections','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','8126e100-e701-4ef0-abf6-b68dd21a474f'),(4,'craft','m221205_082005_translatable_asset_alt_text','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','30ad1e56-a29c-44fc-ae1f-4478ee9ac1d5'),(5,'craft','m230314_110309_add_authenticator_table','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','c409d5b0-6153-4236-9e75-84cf97fad718'),(6,'craft','m230314_111234_add_webauthn_table','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','e01e6609-5155-4f5b-b455-716cf5c8c120'),(7,'craft','m230503_120303_add_recoverycodes_table','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','d8d35170-b48a-4eb8-b7d7-dff5da93b542'),(8,'craft','m230511_000000_field_layout_configs','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','499198d5-b9b4-41dc-9416-ce7a5a10e5d9'),(9,'craft','m230511_215903_content_refactor','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','473bca07-9672-405f-9f13-3e28cb7d0228'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','cbb5065e-e294-4cbf-a456-d2d104a08fb4'),(11,'craft','m230524_000001_entry_type_icons','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','0d0fa8a6-d6a1-4446-bd40-9694db1489d7'),(12,'craft','m230524_000002_entry_type_colors','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','8eb9fdeb-5663-489e-adcc-7b9d11c54c6a'),(13,'craft','m230524_220029_global_entry_types','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','584f43bd-4560-463e-9a3d-cfd6448f8e6a'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','98b56e25-c9ce-4f72-85be-a5cc5b57b6a6'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','81787876-2c0d-44c7-b6ee-5353b4fd3008'),(16,'craft','m230616_173810_kill_field_groups','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','7ab60122-c64a-4d55-8019-2ec20b2be0c4'),(17,'craft','m230616_183820_remove_field_name_limit','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','41affb01-3636-404a-9986-a56f6f019efe'),(18,'craft','m230617_070415_entrify_matrix_blocks','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','b64792fa-ea09-48d7-9d16-fdd5a7957e76'),(19,'craft','m230710_162700_element_activity','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','ba5e4a62-88f1-4491-bf6e-732bc816afe1'),(20,'craft','m230820_162023_fix_cache_id_type','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','7204792c-32ee-4407-91a0-a2bb5621ff24'),(21,'craft','m230826_094050_fix_session_id_type','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','33692d62-3952-4f39-80cd-5469848b3ef4'),(22,'craft','m230904_190356_address_fields','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','d12974cf-937f-4f49-a5ed-9e2953e81682'),(23,'craft','m230928_144045_add_subpath_to_volumes','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','7624b310-a174-4397-bcef-4f7737af2305'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','0e51abe3-6460-49f9-8318-51c7e70f0ca1'),(25,'craft','m231213_030600_element_bulk_ops','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','4a565779-4e50-4a56-9e23-34400a957b78'),(26,'craft','m240129_150719_sites_language_amend_length','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','456f0d69-43c4-4e0a-a215-eaaa8f29b1b1'),(27,'craft','m240206_035135_convert_json_columns','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','a5c49da9-5341-430a-8b71-9ad1355a42b0'),(28,'craft','m240207_182452_address_line_3','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','aba3bb46-5c4a-4c09-ac71-14415eafdabe'),(29,'craft','m240302_212719_solo_preview_targets','2024-07-04 01:19:22','2024-07-04 01:19:22','2024-07-04 01:19:22','9018de14-1011-4d09-9ac0-6c476a45d5e5'),(30,'plugin:hyper','Install','2024-07-04 01:19:50','2024-07-04 01:19:50','2024-07-04 01:19:50','eaf1533c-dff9-4e87-999e-b1c7af5d8a91'),(31,'plugin:seomatic','Install','2024-07-04 01:19:51','2024-07-04 01:19:51','2024-07-04 01:19:51','d9621ea2-de58-40a8-8c9f-0717cc7c39c0'),(32,'plugin:seomatic','m180314_002755_field_type','2024-07-04 01:19:51','2024-07-04 01:19:51','2024-07-04 01:19:51','a7fd9d25-1157-4798-8b09-10be1dc49e6a'),(33,'plugin:seomatic','m180314_002756_base_install','2024-07-04 01:19:51','2024-07-04 01:19:51','2024-07-04 01:19:51','c64d2226-8e32-4bce-8643-ada482a5f278'),(34,'plugin:seomatic','m180502_202319_remove_field_metabundles','2024-07-04 01:19:51','2024-07-04 01:19:51','2024-07-04 01:19:51','77ff0693-2dc0-4894-a5e1-c2a697cb7c15'),(35,'plugin:seomatic','m180711_024947_commerce_products','2024-07-04 01:19:51','2024-07-04 01:19:51','2024-07-04 01:19:51','d0ef84b8-aa96-4dfc-8f0a-61fe98e550fd'),(36,'plugin:seomatic','m190401_220828_longer_handles','2024-07-04 01:19:51','2024-07-04 01:19:51','2024-07-04 01:19:51','67e58a24-e024-44f4-986e-a249199cf37f'),(37,'plugin:seomatic','m190518_030221_calendar_events','2024-07-04 01:19:51','2024-07-04 01:19:51','2024-07-04 01:19:51','e0df9456-8f4c-41ac-ae15-9170f170b458'),(38,'plugin:seomatic','m200419_203444_add_type_id','2024-07-04 01:19:51','2024-07-04 01:19:51','2024-07-04 01:19:51','c8f7d515-60c6-4603-9233-f045358d94be'),(39,'plugin:seomatic','m210603_213100_add_gql_schema_components','2024-07-04 01:19:51','2024-07-04 01:19:51','2024-07-04 01:19:51','8a087c81-b9fa-4263-ada6-6a49c0b73afb'),(40,'plugin:seomatic','m210817_230853_announcement_v3_4','2024-07-04 01:19:51','2024-07-04 01:19:51','2024-07-04 01:19:51','30757b82-d49e-4cf7-832d-4a08f59222e8'),(41,'plugin:seomatic','m230601_184259_announcement_google_ua_deprecated','2024-07-04 01:19:51','2024-07-04 01:19:51','2024-07-04 01:19:51','348c87a6-fcf2-45b8-a3ff-4a28d4aac634'),(42,'plugin:blitz','Install','2024-07-04 01:19:52','2024-07-04 01:19:52','2024-07-04 01:19:52','bdf5bc3e-e867-43af-b797-1ba99fb794e4'),(43,'plugin:blitz','m240226_120000_drop_route_variable_hints_and_column','2024-07-04 01:19:52','2024-07-04 01:19:52','2024-07-04 01:19:52','8d070909-6fcd-469c-83da-44aa7491c5a2'),(44,'plugin:blitz','m240310_120000_add_stack_trace','2024-07-04 01:19:52','2024-07-04 01:19:52','2024-07-04 01:19:52','b26cca04-d665-4f4e-af95-3204c837851d'),(45,'plugin:sprig','Install','2024-07-04 01:19:53','2024-07-04 01:19:53','2024-07-04 01:19:53','8e8fe314-0219-4d38-8749-2220e4f650df'),(46,'module:verbb-auth','m221127_000000_install','2024-07-04 01:19:53','2024-07-04 01:19:53','2024-07-04 01:19:53','be2fb7fe-8eaa-4e20-900c-5a867c763b14'),(47,'plugin:formie','Install','2024-07-04 01:19:55','2024-07-04 01:19:55','2024-07-04 01:19:55','6949c354-04ae-46d4-9d6e-132005ede12a'),(48,'plugin:formie','m231125_000000_craft5','2024-07-04 01:19:55','2024-07-04 01:19:55','2024-07-04 01:19:55','b2c86015-38d8-4637-9c8a-628af6d80ff7'),(49,'plugin:formie','m231129_000000_integrations_mapping','2024-07-04 01:19:55','2024-07-04 01:19:55','2024-07-04 01:19:55','d2774245-9f77-4eb6-9685-62736bff3fef'),(50,'plugin:formie','m231130_000000_conditions_mapping','2024-07-04 01:19:55','2024-07-04 01:19:55','2024-07-04 01:19:55','e0209ee3-bdb1-42c4-98f2-2a1e511d2879'),(51,'plugin:formie','m231202_000000_auth_module','2024-07-04 01:19:55','2024-07-04 01:19:55','2024-07-04 01:19:55','76793d0b-26ca-497a-8a99-9f0fa1967a5f'),(52,'plugin:formie','m240130_000000_permissions','2024-07-04 01:19:55','2024-07-04 01:19:55','2024-07-04 01:19:55','22060629-7e51-485c-8dc4-b48eb40e9283'),(53,'plugin:formie','m240313_000000_subfields','2024-07-04 01:19:55','2024-07-04 01:19:55','2024-07-04 01:19:55','5ca1c41b-f501-4d27-a94a-a2cfcb1df90d'),(54,'plugin:formie','m240318_000000_fix_content_table','2024-07-04 01:19:55','2024-07-04 01:19:55','2024-07-04 01:19:55','99003617-101a-4c0f-9b90-519c26f21249'),(55,'plugin:formie','m240318_000000_migrate_stencils','2024-07-04 01:19:55','2024-07-04 01:19:55','2024-07-04 01:19:55','e64249ee-3cc1-4d8f-b44d-0c619494b234'),(56,'plugin:formie','m240318_000000_notification_fields','2024-07-04 01:19:55','2024-07-04 01:19:55','2024-07-04 01:19:55','9e32e86d-d175-46ed-acab-a3f1371f0298'),(57,'plugin:formie','m240325_000000_notifications_custom_settings','2024-07-04 01:19:55','2024-07-04 01:19:55','2024-07-04 01:19:55','e3d2e883-150e-41f7-a50c-00a79a75f593'),(58,'plugin:ckeditor','Install','2024-07-04 01:19:56','2024-07-04 01:19:56','2024-07-04 01:19:56','62bd6c6a-448c-4680-8bb3-9efe9505d235'),(59,'plugin:ckeditor','m230408_163704_v3_upgrade','2024-07-04 01:19:56','2024-07-04 01:19:56','2024-07-04 01:19:56','1d27b2ed-1a39-46b2-90e7-977b3e72fd0d'),(63,'craft','m240619_091352_add_auth_2fa_timestamp','2024-07-23 00:01:58','2024-07-23 00:01:58','2024-07-23 00:01:58','68ddd142-288f-4b82-ba24-55f61b0d5982'),(64,'plugin:blitz','m240709_120000_alter_fieldid_column','2024-07-23 00:01:58','2024-07-23 00:01:58','2024-07-23 00:01:58','29cfe4b1-e730-4941-8bc8-081e485d4f79'),(65,'plugin:blitz','m240719_120000_remove_legacy_settings','2024-07-23 00:01:58','2024-07-23 00:01:58','2024-07-23 00:01:58','51f54dc3-c14d-4d92-b550-5b327f4b85ba'),(66,'plugin:formie','m240407_000000_payment_fk','2024-07-23 00:01:58','2024-07-23 00:01:58','2024-07-23 00:01:58','8c34b6ce-b447-4b35-b04f-0699f11533ae'),(67,'plugin:formie','m240507_000000_entry_integration_ids','2024-07-23 00:01:58','2024-07-23 00:01:58','2024-07-23 00:01:58','61891e12-633f-43b8-955d-d39b689efb75'),(68,'plugin:formie','m240528_000000_payment_fk','2024-07-23 00:01:59','2024-07-23 00:01:59','2024-07-23 00:01:59','98fc57c9-8f67-4859-8f6b-799d2c74a257'),(69,'plugin:formie','m240614_000000_klaviyo','2024-07-23 00:01:59','2024-07-23 00:01:59','2024-07-23 00:01:59','e4a6d785-738f-49e1-ada4-2ecb11eb1e04'),(70,'craft','m240723_214330_drop_bulkop_fk','2024-09-03 01:52:54','2024-09-03 01:52:54','2024-09-03 01:52:54','453d1940-ad71-4ba5-8747-63121f998335'),(71,'craft','m240731_053543_soft_delete_fields','2024-09-03 01:52:54','2024-09-03 01:52:54','2024-09-03 01:52:54','4674599a-cb67-4b21-a6c8-9b14645482bb'),(72,'craft','m240805_154041_sso_identities','2024-09-03 01:52:54','2024-09-03 01:52:54','2024-09-03 01:52:54','9e46c17a-2ab0-452f-8670-3a574efef504'),(73,'plugin:blitz','m240731_120000_add_datecached_column','2024-09-03 01:52:54','2024-09-03 01:52:54','2024-09-03 01:52:54','07a85e54-5431-44e1-a7d2-c48cf44b4111'),(74,'plugin:blitz','m240820_120000_add_fieldinstanceuid_column','2024-09-03 01:52:54','2024-09-03 01:52:54','2024-09-03 01:52:54','db9efdb0-162d-4519-9986-a5f09e2c2717'),(75,'plugin:blitz','m240826_120000_convert_cachecontrol_settings','2024-09-03 01:52:54','2024-09-03 01:52:54','2024-09-03 01:52:54','b18a2626-1406-487d-920c-a8c9c1da66a0'),(76,'plugin:formie','m240807_000000_migrate_date_field_datetime','2024-09-03 01:52:54','2024-09-03 01:52:54','2024-09-03 01:52:54','5c259276-969c-443f-bba4-b6f6b22cd7d8');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'hyper','2.0.4','1.0.0','2024-07-04 01:19:50','2024-07-04 01:19:50','2024-09-03 01:52:54','30306173-1b42-4bbb-a2f0-02fcf36861b6'),(2,'seomatic','5.1.2','3.0.12','2024-07-04 01:19:51','2024-07-04 01:19:51','2024-09-03 01:52:54','e17e1e3d-523c-441b-97a7-9e36132f2f63'),(3,'vite','5.0.1','1.0.0','2024-07-04 01:19:51','2024-07-04 01:19:51','2024-09-03 01:52:54','5b060a9c-7954-4d28-9197-5e3246bd9962'),(4,'blitz','5.7.1','5.7.0.1','2024-07-04 01:19:52','2024-07-04 01:19:52','2024-09-03 01:52:54','bce09997-a0c4-448c-aea4-67011af22be7'),(5,'sprig','3.5.0','1.0.1','2024-07-04 01:19:53','2024-07-04 01:19:53','2024-09-03 01:52:54','4aaf0ee6-3d87-47d8-9dd7-6124d2bcedc7'),(6,'formie','3.0.5','3.4.6','2024-07-04 01:19:53','2024-07-04 01:19:53','2024-09-03 01:52:54','104256dd-54a0-4d3b-ac91-9713f7bbb9db'),(7,'imager-x','5.0.2','4.0.0','2024-07-04 01:19:55','2024-07-04 01:19:55','2024-09-03 01:52:54','81defbc5-dde0-401b-a473-72990d7381c1'),(8,'minify','5.0.0','1.0.0','2024-07-04 01:19:56','2024-07-04 01:19:56','2024-07-23 00:01:59','60c29b84-507b-4fac-aae3-079ea00709b4'),(9,'ckeditor','4.2.0','3.0.0.0','2024-07-04 01:19:56','2024-07-04 01:19:56','2024-09-03 01:53:32','9a782d9c-09f8-49a4-a63a-473d9b4ce086'),(10,'mailgun','3.1.0','1.0.0','2024-07-04 01:19:57','2024-07-04 01:19:57','2024-07-04 01:19:57','84495e8d-df93-4e3d-b511-7cf7d124f9a8'),(12,'admin-bar','5.0.0','3.1.0','2024-09-03 01:58:52','2024-09-03 01:58:52','2024-09-03 01:58:52','1ce6baf0-463f-4f23-b2e8-df7df976c9b4'),(13,'assetusage','4.0.0','2.0.0','2024-09-03 02:00:31','2024-09-03 02:00:31','2024-09-03 02:00:31','f7d34a5d-8686-40a6-ae32-a95560c5f15b'),(14,'blur-hash','3.0.0','1.0.0','2024-09-03 02:01:00','2024-09-03 02:01:00','2024-09-03 02:01:00','64e6860c-dccb-4099-b8c8-7abed473b102'),(15,'cp-field-inspect','2.0.2','1.0.0','2024-09-03 02:01:19','2024-09-03 02:01:19','2024-09-03 02:01:19','05feced8-11fc-410b-9841-df4dd8b41ced'),(16,'diy-widget','4.0.0','2.0.1','2024-09-03 02:01:48','2024-09-03 02:01:48','2024-09-03 02:01:48','86f56919-9811-4423-a865-3d227979abfb'),(17,'elements-panel','3.0.0','1.0.0','2024-09-03 02:02:06','2024-09-03 02:02:06','2024-09-03 02:02:06','41c68032-91b4-4592-a97e-ef892dde27b2'),(18,'image-resizer','4.0.1','2.0.0','2024-09-03 02:02:24','2024-09-03 02:02:24','2024-09-03 02:02:24','066db9f3-810b-4286-9a49-706ad8f34592'),(19,'field-manager','4.0.2','1.0.0','2024-09-03 02:37:33','2024-09-03 02:37:33','2024-09-03 02:37:33','a99f6a81-3d4e-4519-8a53-ba5b66205e62');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('ckeditor.configs.8b610edc-f2dd-46b6-9597-96fcbb6d302a.headingLevels.0','1'),('ckeditor.configs.8b610edc-f2dd-46b6-9597-96fcbb6d302a.headingLevels.1','2'),('ckeditor.configs.8b610edc-f2dd-46b6-9597-96fcbb6d302a.headingLevels.2','3'),('ckeditor.configs.8b610edc-f2dd-46b6-9597-96fcbb6d302a.headingLevels.3','4'),('ckeditor.configs.8b610edc-f2dd-46b6-9597-96fcbb6d302a.headingLevels.4','5'),('ckeditor.configs.8b610edc-f2dd-46b6-9597-96fcbb6d302a.headingLevels.5','6'),('ckeditor.configs.8b610edc-f2dd-46b6-9597-96fcbb6d302a.name','\"Simple\"'),('ckeditor.configs.8b610edc-f2dd-46b6-9597-96fcbb6d302a.toolbar.0','\"heading\"'),('ckeditor.configs.8b610edc-f2dd-46b6-9597-96fcbb6d302a.toolbar.1','\"|\"'),('ckeditor.configs.8b610edc-f2dd-46b6-9597-96fcbb6d302a.toolbar.2','\"bold\"'),('ckeditor.configs.8b610edc-f2dd-46b6-9597-96fcbb6d302a.toolbar.3','\"italic\"'),('ckeditor.configs.8b610edc-f2dd-46b6-9597-96fcbb6d302a.toolbar.4','\"link\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.headingLevels.0','1'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.headingLevels.1','2'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.headingLevels.2','3'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.headingLevels.3','4'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.headingLevels.4','5'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.headingLevels.5','6'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.name','\"Full\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.alignment.options.0','\"left\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.alignment.options.1','\"right\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.alignment.options.2','\"center\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontColor.colors.0.color','\"hsl(0, 0%, 0%)\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontColor.colors.0.label','\"Black\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontColor.colors.1.color','\"#D7272E\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontColor.colors.1.label','\"Main Red\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontColor.colors.2.color','\"#B02028\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontColor.colors.2.label','\"Secondary Red\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontColor.colors.3.color','\"#F69D8F\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontColor.colors.3.label','\"Pink\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontColor.colors.4.color','\"#5D7D2A\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontColor.colors.4.label','\"Green\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontColor.colors.5.color','\"#353635\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontColor.colors.5.label','\"Grey\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontFamily.options.0','\"caveat-brush, sans-serif\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontFamily.options.1','\"azo-sans-web, serif\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontSize.options.0','\"12\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontSize.options.1','\"14\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontSize.options.10','\"73\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontSize.options.2','\"default\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontSize.options.3','\"18\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontSize.options.4','\"20\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontSize.options.5','\"22\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontSize.options.6','\"24\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontSize.options.7','\"30\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontSize.options.8','\"34\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.fontSize.options.9','\"59\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.image.resizeUnit','\"%\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.image.toolbar.0','\"toggleImageCaption\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.image.toolbar.1','\"imageTextAlternative\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.image.toolbar.2','\"|\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.image.toolbar.3','\"imageStyle:inline\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.image.toolbar.4','\"imageStyle:wrapText\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.image.toolbar.5','\"imageStyle:breakText\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.image.toolbar.6','\"|\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.image.toolbar.7','\"linkImage\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.image.toolbar.8','\"|\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.image.toolbar.9','\"transformImage\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.imageResizeHandles','true'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.link.addTargetToExternalLinks','true'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.link.decorators.0.attributes.class','\"btn leading-loose mr-3 btnDark px-4 inline-flex text-xs uppercase font-bold transition text-white bg-dark3 border-2 border-transparent hover:text-dark3 hover:bg-white hover:border-dark3 standardBtn active\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.link.decorators.0.label','\"Primary button style\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.link.decorators.0.mode','\"manual\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.link.decorators.1.attributes.rel','\"noopener noreferrer\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.link.decorators.1.attributes.target','\"_blank\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.link.decorators.1.label','\"open in new tab\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.options.link.decorators.1.mode','\"manual\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.0','\"sourceEditing\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.1','\"heading\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.10','\"|\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.11','\"underline\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.12','\"strikethrough\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.13','\"subscript\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.14','\"superscript\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.15','\"|\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.16','\"bulletedList\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.17','\"numberedList\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.18','\"|\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.19','\"fontSize\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.2','\"|\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.20','\"fontFamily\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.21','\"fontColor\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.22','\"fontBackgroundColor\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.23','\"|\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.24','\"insertImage\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.25','\"mediaEmbed\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.26','\"|\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.27','\"blockQuote\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.28','\"insertTable\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.29','\"|\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.3','\"bold\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.30','\"removeFormat\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.4','\"italic\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.5','\"link\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.6','\"|\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.7','\"alignment\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.8','\"outdent\"'),('ckeditor.configs.e5f5c269-edf3-4e01-a7fc-f27360374782.toolbar.9','\"indent\"'),('dateModified','1725332009'),('email.fromEmail','\"$CRAFT_SYSTEM_EMAIL\"'),('email.fromName','\"$CRAFT_SITE_NAME\"'),('email.replyToEmail','null'),('email.template','\"_emails/system.twig\"'),('email.transportSettings.host','\"$SMTP_HOST\"'),('email.transportSettings.password','\"$SMTP_PASSWORD\"'),('email.transportSettings.port','\"$SMTP_PORT\"'),('email.transportSettings.useAuthentication','\"1\"'),('email.transportSettings.username','\"$SMTP_USERNAME\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Smtp\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.color','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.autocapitalize','true'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.autocomplete','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.autocorrect','true'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.class','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.dateAdded','\"2024-09-03T02:44:17+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.disabled','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.id','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.includeInCards','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.inputType','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.instructions','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.label','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.max','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.min','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.name','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.orientation','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.placeholder','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.providesThumbs','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.readonly','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.requirable','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.size','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.step','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.tip','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.title','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.uid','\"74684534-8011-4515-a3a6-46c50a47fdd2\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.warning','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.0.width','100'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.dateAdded','\"2024-09-03T02:44:59+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.fieldUid','\"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.handle','\"googleMapsApi\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.includeInCards','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.instructions','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.label','\"Google Maps Api\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.providesThumbs','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.required','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.tip','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.uid','\"cbfa196d-8d17-4064-a63b-e703c262c923\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.warning','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.1.width','25'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.dateAdded','\"2024-09-03T02:44:59+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.fieldUid','\"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.handle','\"googleAnalytics\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.includeInCards','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.instructions','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.label','\"Google Analytics\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.providesThumbs','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.required','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.tip','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.uid','\"4c016ccd-f324-474c-964e-57097e297979\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.warning','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.2.width','25'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.dateAdded','\"2024-09-03T02:44:59+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.fieldUid','\"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.handle','\"gtm\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.includeInCards','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.instructions','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.label','\"Google Tag Manager\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.providesThumbs','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.required','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.tip','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.uid','\"1f2dff3c-d140-4c04-99c8-611e54ce4c3b\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.warning','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.3.width','25'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.dateAdded','\"2024-09-03T02:44:59+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.fieldUid','\"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.handle','\"clarity\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.includeInCards','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.instructions','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.label','\"Clarity Code\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.providesThumbs','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.required','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.tip','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.uid','\"48895358-f22c-4d6f-ad4a-a048cfd8a4da\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.warning','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.4.width','25'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.5.dateAdded','\"2024-09-03T02:44:59+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.5.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.5.uid','\"5f72ffb3-1925-4529-a54f-02b8cbcbd02e\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.5.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.dateAdded','\"2024-09-03T02:44:59+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.fieldUid','\"53449f53-916a-460c-84ed-4c4342067e0d\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.handle','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.includeInCards','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.instructions','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.label','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.providesThumbs','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.required','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.tip','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.uid','\"b4380c5d-f3b9-41de-aa26-b2016e45f22e\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.warning','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.elements.6.width','100'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.name','\"Site Info\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.uid','\"4297a4e1-48fe-45d0-ac9c-870b370e3836\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.0.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.dateAdded','\"2024-09-03T02:44:59+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.fieldUid','\"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.handle','\"phoneNumber\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.includeInCards','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.instructions','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.label','\"Phone Number\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.providesThumbs','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.required','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.tip','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.uid','\"4a39ce45-5160-451a-aece-0652ba8208b6\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.warning','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.0.width','25'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.dateAdded','\"2024-09-03T02:44:59+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.fieldUid','\"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.handle','\"phoneNumber2\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.includeInCards','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.instructions','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.label','\"Phone Number\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.providesThumbs','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.required','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.tip','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.uid','\"c158b664-b98b-455b-a2f1-0efd9f1d9590\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.warning','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.1.width','25'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.dateAdded','\"2024-09-03T02:44:59+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.fieldUid','\"d388c229-d406-4b40-930e-6c6a14eb67cb\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.handle','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.includeInCards','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.instructions','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.label','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.providesThumbs','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.required','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.tip','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.uid','\"aa529e71-3082-46d5-a2c8-71dcc40dcbbe\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.warning','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.2.width','50'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.3.dateAdded','\"2024-09-03T02:44:59+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.3.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.3.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.3.uid','\"0b3e9240-7145-46ad-9dc4-b27bbcb5b027\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.3.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.dateAdded','\"2024-09-03T02:44:59+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.fieldUid','\"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.handle','\"address\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.includeInCards','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.instructions','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.label','\"Address\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.providesThumbs','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.required','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.tip','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.uid','\"d1124ed4-3339-43af-b4ab-63318891ec8a\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.warning','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.4.width','100'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.dateAdded','\"2024-09-03T02:44:59+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.fieldUid','\"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.handle','\"lat\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.includeInCards','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.instructions','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.label','\"Latitude\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.providesThumbs','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.required','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.tip','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.uid','\"c5575e1a-59c5-401b-8629-6bcd6581c16a\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.warning','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.5.width','50'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.dateAdded','\"2024-09-03T02:44:59+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.fieldUid','\"d09e7eaa-db8d-4b8c-a242-4cad3af936c0\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.handle','\"lng\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.includeInCards','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.instructions','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.label','\"Longitude\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.providesThumbs','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.required','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.tip','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.uid','\"b5842d58-3593-4229-998f-1e6f5bea44ca\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.warning','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.elements.6.width','50'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.name','\"Contact Info\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.uid','\"b2bf5e38-8b62-475c-8de1-e42aca093e85\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.1.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.dateAdded','\"2024-09-03T02:44:59+00:00\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.elementCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.fieldUid','\"1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.handle','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.includeInCards','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.instructions','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.label','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.providesThumbs','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.required','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.tip','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.uid','\"4a899c6e-116d-4f60-a2d0-48791c2cf1ce\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.warning','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.elements.0.width','100'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.name','\"Social Media\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.uid','\"f7590f5d-3c05-467b-9c01-cb274ba2ba8a\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.fieldLayouts.da49e34d-4488-470a-b429-3807b94f94d9.tabs.2.userCondition','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.handle','\"siteSettings\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.hasTitleField','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.icon','\"gear\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.name','\"Site Settings\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.showSlugField','false'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.showStatusField','true'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.slugTranslationKeyFormat','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.slugTranslationMethod','\"site\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.titleFormat','\"Site Settings\"'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.titleTranslationKeyFormat','null'),('entryTypes.05fb432b-77b1-40bc-8ff7-56425ce230ad.titleTranslationMethod','\"site\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.color','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elementCondition','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.autocapitalize','true'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.autocomplete','false'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.autocorrect','true'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.class','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.dateAdded','\"2024-09-03T02:20:10+00:00\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.disabled','false'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.elementCondition','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.id','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.includeInCards','false'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.inputType','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.instructions','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.label','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.max','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.min','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.name','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.orientation','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.placeholder','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.providesThumbs','false'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.readonly','false'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.requirable','false'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.size','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.step','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.tip','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.title','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.uid','\"a3c7fe31-80b0-435a-8ecd-92cc2df27485\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.userCondition','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.warning','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.0.width','50'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.dateAdded','\"2024-09-03T02:24:59+00:00\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.elementCondition','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.fieldUid','\"d1b2a017-2d04-4c75-b64f-08e1e463a08a\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.handle','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.includeInCards','false'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.instructions','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.label','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.providesThumbs','false'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.required','false'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.tip','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.uid','\"75bdbc80-6a47-442a-abd7-22c49eece2ab\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.userCondition','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.warning','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.elements.1.width','50'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.name','\"Content\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.uid','\"27b18608-3051-4652-a46d-0d4e8e62e02c\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.fieldLayouts.745a0d7b-5782-4faf-be73-36fbdeec4fa2.tabs.0.userCondition','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.handle','\"navigation\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.hasTitleField','true'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.icon','\"bars\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.name','\"Navigation\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.showSlugField','false'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.showStatusField','true'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.slugTranslationKeyFormat','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.slugTranslationMethod','\"site\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.titleFormat','\"\"'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.titleTranslationKeyFormat','null'),('entryTypes.401590d1-1d18-4503-8baf-2560169e8c8f.titleTranslationMethod','\"site\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.color','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elementCondition','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.autocapitalize','true'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.autocomplete','false'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.autocorrect','true'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.class','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.dateAdded','\"2024-09-03T02:21:08+00:00\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.disabled','false'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.elementCondition','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.id','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.includeInCards','false'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.inputType','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.instructions','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.label','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.max','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.min','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.name','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.orientation','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.placeholder','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.providesThumbs','false'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.readonly','false'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.requirable','false'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.size','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.step','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.tip','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.title','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.uid','\"64240877-a304-4f33-94fe-78933c992573\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.userCondition','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.warning','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.0.width','100'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.dateAdded','\"2024-09-03T02:23:24+00:00\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.elementCondition','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.fieldUid','\"dc8f8aeb-7a68-4039-8224-309e42b0a9de\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.handle','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.includeInCards','false'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.instructions','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.label','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.providesThumbs','false'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.required','false'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.tip','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.uid','\"95491145-4945-49f0-a727-923ee418902a\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.userCondition','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.warning','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.elements.1.width','100'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.name','\"Content\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.uid','\"22507cd6-91ed-40c8-afa1-88f56a37f412\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.fieldLayouts.e96c8427-37b5-4887-8ace-7a23b00f12cc.tabs.0.userCondition','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.handle','\"internalLink\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.hasTitleField','false'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.icon','\"page\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.name','\"Internal Link\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.showSlugField','false'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.showStatusField','true'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.slugTranslationKeyFormat','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.slugTranslationMethod','\"site\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.titleFormat','\"\"'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.titleTranslationKeyFormat','null'),('entryTypes.70458b6c-f389-4606-a2c5-a0994a111a40.titleTranslationMethod','\"site\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.color','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elementCondition','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.autocapitalize','true'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.autocomplete','false'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.autocorrect','true'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.class','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.dateAdded','\"2024-09-03T02:35:44+00:00\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.disabled','false'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.elementCondition','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.id','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.includeInCards','false'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.inputType','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.instructions','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.label','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.max','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.min','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.name','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.orientation','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.placeholder','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.providesThumbs','false'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.readonly','false'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.requirable','false'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.size','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.step','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.tip','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.title','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.uid','\"67738bfd-7e53-45bf-b206-fd5f02da0702\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.userCondition','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.warning','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.0.width','50'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.dateAdded','\"2024-09-03T02:49:07+00:00\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.elementCondition','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.fieldUid','\"2b988591-9982-412b-b0d9-3b6599c0d5df\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.handle','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.includeInCards','false'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.instructions','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.label','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.providesThumbs','false'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.required','false'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.tip','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.uid','\"c2e6f968-985a-4076-9b8f-c68696683b90\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.userCondition','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.warning','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.1.width','50'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.dateAdded','\"2024-09-03T02:48:21+00:00\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.elementCondition','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.fieldUid','\"4173875d-a199-4944-9f1a-3319bffe8113\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.handle','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.includeInCards','false'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.instructions','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.label','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.providesThumbs','false'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.required','false'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.tip','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.uid','\"8ed2fcaf-086f-4152-ab6b-627e9dbd3744\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.userCondition','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.warning','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.elements.2.width','50'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.name','\"Content\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.uid','\"9f5471c2-15fd-4e36-aa38-d6c53a5099e8\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.fieldLayouts.fa88878b-fe55-4576-a5bf-d61adcf538d3.tabs.0.userCondition','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.handle','\"socialMedia\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.hasTitleField','false'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.icon','\"hashtag\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.name','\"Social Media\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.showSlugField','false'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.showStatusField','true'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.slugTranslationKeyFormat','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.slugTranslationMethod','\"site\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.titleFormat','\"{socialMediaType.value}\"'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.titleTranslationKeyFormat','null'),('entryTypes.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3.titleTranslationMethod','\"site\"'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.color','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elementCondition','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.autocapitalize','true'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.autocomplete','false'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.autocorrect','true'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.class','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.disabled','false'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.elementCondition','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.id','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.includeInCards','false'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.inputType','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.instructions','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.label','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.max','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.min','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.name','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.orientation','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.placeholder','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.providesThumbs','false'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.readonly','false'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.requirable','false'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.size','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.step','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.tip','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.title','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.uid','\"0cf026d5-6d08-4e27-8a1f-ab30bca41c98\"'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.userCondition','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.warning','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.elements.0.width','100'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.name','\"Content\"'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.uid','\"0102572d-d127-40b1-b9c0-704387cc932f\"'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.fieldLayouts.71660a2a-5e9c-456e-9584-e81e70baf6f2.tabs.0.userCondition','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.handle','\"pageBlocks\"'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.hasTitleField','true'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.icon','\"file\"'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.name','\"Page - Blocks\"'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.showSlugField','true'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.showStatusField','true'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.slugTranslationKeyFormat','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.slugTranslationMethod','\"site\"'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.titleFormat','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.titleTranslationKeyFormat','null'),('entryTypes.bdf6317d-0df7-449f-a937-a1a274ffb106.titleTranslationMethod','\"site\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.color','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elementCondition','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.autocapitalize','true'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.autocomplete','false'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.autocorrect','true'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.class','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.dateAdded','\"2024-09-03T02:51:49+00:00\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.disabled','false'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.elementCondition','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.id','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.includeInCards','false'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.inputType','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.instructions','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.label','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.max','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.min','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.name','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.orientation','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.placeholder','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.providesThumbs','false'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.readonly','false'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.requirable','false'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.size','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.step','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.tip','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.title','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.uid','\"a33edca0-ddc7-4618-b561-c62b805eb08b\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.userCondition','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.warning','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.0.width','100'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.dateAdded','\"2024-09-03T02:53:21+00:00\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.elementCondition','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.fieldUid','\"06b6050b-3bd9-4f2d-b243-a71d312eafe3\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.handle','\"contents\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.includeInCards','false'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.instructions','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.label','\"Content\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.providesThumbs','false'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.required','false'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.tip','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.uid','\"bdb12c7f-d1f7-4cec-a780-3d5537fccc63\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.userCondition','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.warning','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.elements.1.width','100'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.name','\"Content\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.uid','\"d6da69cd-adbb-40f3-97b2-459118a4554a\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.fieldLayouts.1a4830bd-3187-42d7-aa85-5afa3a70a036.tabs.0.userCondition','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.handle','\"justContent\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.hasTitleField','true'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.icon','\"triangle-exclamation\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.name','\"Just Content\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.showSlugField','true'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.showStatusField','true'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.slugTranslationKeyFormat','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.slugTranslationMethod','\"site\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.titleFormat','\"\"'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.titleTranslationKeyFormat','null'),('entryTypes.fcf95a95-6db1-48dd-9aa8-a641adeec479.titleTranslationMethod','\"site\"'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.columnSuffix','null'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.handle','\"fullOptionContentEditor\"'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.instructions','null'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.name','\"Full Option Content Editor\"'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.searchable','true'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.settings.availableTransforms','\"*\"'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.settings.availableVolumes','\"*\"'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.settings.ckeConfig','\"97cf3fba-300b-4bbd-89de-d116f6ca64d2\"'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.settings.createButtonLabel','\"Add\"'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.settings.defaultTransform','null'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.settings.enableSourceEditingForNonAdmins','false'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.settings.purifierConfig','null'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.settings.purifyHtml','false'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.settings.showUnpermittedFiles','false'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.settings.showUnpermittedVolumes','false'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.settings.showWordCount','false'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.settings.wordLimit','null'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.translationKeyFormat','null'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.translationMethod','\"none\"'),('fields.06b6050b-3bd9-4f2d-b243-a71d312eafe3.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.columnSuffix','null'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.handle','\"socialMedia\"'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.instructions','null'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.name','\"Social Media\"'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.searchable','false'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.settings.createButtonLabel','\"Social Media\"'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.settings.entryTypes.0','\"ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3\"'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.settings.includeTableView','false'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.settings.maxEntries','null'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.settings.minEntries','null'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.settings.pageSize','null'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.settings.propagationKeyFormat','null'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.settings.propagationMethod','\"all\"'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.settings.showCardsInGrid','false'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.settings.viewMode','\"blocks\"'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.translationKeyFormat','null'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.translationMethod','\"site\"'),('fields.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9.type','\"craft\\\\fields\\\\Matrix\"'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.columnSuffix','null'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.handle','\"form\"'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.instructions','null'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.name','\"Form\"'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.searchable','false'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.settings.allowSelfRelations','false'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.settings.branchLimit','null'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.settings.maintainHierarchy','false'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.settings.maxRelations','1'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.settings.minRelations','null'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.settings.selectionLabel','\"Select A Form\"'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.settings.showCardsInGrid','true'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.settings.showSiteMenu','false'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.settings.sources','\"*\"'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.settings.targetSiteId','null'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.settings.validateRelatedElements','false'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.settings.viewMode','\"cards\"'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.translationKeyFormat','null'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.translationMethod','\"none\"'),('fields.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69.type','\"verbb\\\\formie\\\\fields\\\\Forms\"'),('fields.2b988591-9982-412b-b0d9-3b6599c0d5df.columnSuffix','null'),('fields.2b988591-9982-412b-b0d9-3b6599c0d5df.handle','\"linkUrl\"'),('fields.2b988591-9982-412b-b0d9-3b6599c0d5df.instructions','null'),('fields.2b988591-9982-412b-b0d9-3b6599c0d5df.name','\"URL\"'),('fields.2b988591-9982-412b-b0d9-3b6599c0d5df.searchable','false'),('fields.2b988591-9982-412b-b0d9-3b6599c0d5df.settings.maxLength','255'),('fields.2b988591-9982-412b-b0d9-3b6599c0d5df.settings.types.0','\"url\"'),('fields.2b988591-9982-412b-b0d9-3b6599c0d5df.translationKeyFormat','null'),('fields.2b988591-9982-412b-b0d9-3b6599c0d5df.translationMethod','\"none\"'),('fields.2b988591-9982-412b-b0d9-3b6599c0d5df.type','\"craft\\\\fields\\\\Link\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.columnSuffix','null'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.handle','\"socialMediaType\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.instructions','null'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.name','\"Social Media Type\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.searchable','false'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.0.__assoc__.0.0','\"label\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.0.__assoc__.0.1','\"Facebook\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.0.__assoc__.1.0','\"value\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.0.__assoc__.1.1','\"facebook-f\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.0.__assoc__.2.0','\"default\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.0.__assoc__.2.1','\"\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.1.__assoc__.0.0','\"label\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.1.__assoc__.0.1','\"Twitter (X)\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.1.__assoc__.1.0','\"value\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.1.__assoc__.1.1','\"twitterX\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.1.__assoc__.2.0','\"default\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.1.__assoc__.2.1','\"\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.2.__assoc__.0.0','\"label\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.2.__assoc__.0.1','\"Instagram\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.2.__assoc__.1.0','\"value\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.2.__assoc__.1.1','\"instagram\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.2.__assoc__.2.0','\"default\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.2.__assoc__.2.1','\"\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.3.__assoc__.0.0','\"label\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.3.__assoc__.0.1','\"Linkedin\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.3.__assoc__.1.0','\"value\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.3.__assoc__.1.1','\"linkedin\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.3.__assoc__.2.0','\"default\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.3.__assoc__.2.1','\"\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.4.__assoc__.0.0','\"label\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.4.__assoc__.0.1','\"Pintetest\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.4.__assoc__.1.0','\"value\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.4.__assoc__.1.1','\"pintetest\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.4.__assoc__.2.0','\"default\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.4.__assoc__.2.1','\"\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.5.__assoc__.0.0','\"label\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.5.__assoc__.0.1','\"Website\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.5.__assoc__.1.0','\"value\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.5.__assoc__.1.1','\"globe-pointer\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.5.__assoc__.2.0','\"default\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.settings.options.5.__assoc__.2.1','\"\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.translationKeyFormat','null'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.translationMethod','\"none\"'),('fields.4173875d-a199-4944-9f1a-3319bffe8113.type','\"craft\\\\fields\\\\Dropdown\"'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.columnSuffix','null'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.handle','\"simpleTextEditor\"'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.instructions','null'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.name','\"Simple Text Editor\"'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.searchable','false'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.settings.availableTransforms','\"\"'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.settings.availableVolumes','\"*\"'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.settings.ckeConfig','null'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.settings.createButtonLabel','null'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.settings.defaultTransform','null'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.settings.enableSourceEditingForNonAdmins','false'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.settings.purifierConfig','null'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.settings.purifyHtml','true'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.settings.showUnpermittedFiles','false'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.settings.showUnpermittedVolumes','false'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.settings.showWordCount','false'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.settings.wordLimit','null'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.translationKeyFormat','null'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.translationMethod','\"none\"'),('fields.53449f53-916a-460c-84ed-4c4342067e0d.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.columnSuffix','null'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.handle','\"multiLineText\"'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.instructions','null'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.name','\"Multi Line Text\"'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.searchable','false'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.settings.byteLimit','null'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.settings.charLimit','null'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.settings.code','false'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.settings.initialRows','4'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.settings.multiline','true'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.settings.placeholder','null'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.settings.uiMode','\"normal\"'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.translationKeyFormat','null'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.translationMethod','\"none\"'),('fields.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063.type','\"craft\\\\fields\\\\PlainText\"'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.columnSuffix','null'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.handle','\"singleLineText\"'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.instructions','null'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.name','\"Single Line Text\"'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.searchable','false'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.settings.byteLimit','null'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.settings.charLimit','null'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.settings.code','false'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.settings.initialRows','4'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.settings.multiline','false'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.settings.placeholder','null'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.settings.uiMode','\"normal\"'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.translationKeyFormat','null'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.translationMethod','\"none\"'),('fields.d09e7eaa-db8d-4b8c-a242-4cad3af936c0.type','\"craft\\\\fields\\\\PlainText\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.columnSuffix','null'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.handle','\"linkField\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.instructions','null'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.name','\"Link Field\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.searchable','false'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.maxLength','255'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.types.0','\"url\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.types.1','\"asset\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.types.2','\"category\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.types.3','\"email\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.types.4','\"entry\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.types.5','\"tel\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.typeSettings.__assoc__.0.0','\"asset\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.typeSettings.__assoc__.0.1.__assoc__.0.0','\"allowedKinds\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.typeSettings.__assoc__.0.1.__assoc__.0.1','\"*\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.typeSettings.__assoc__.0.1.__assoc__.1.0','\"showUnpermittedVolumes\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.typeSettings.__assoc__.0.1.__assoc__.1.1','\"\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.typeSettings.__assoc__.0.1.__assoc__.2.0','\"showUnpermittedFiles\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.typeSettings.__assoc__.0.1.__assoc__.2.1','\"\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.typeSettings.__assoc__.1.0','\"entry\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.typeSettings.__assoc__.1.1.__assoc__.0.0','\"sources\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.settings.typeSettings.__assoc__.1.1.__assoc__.0.1','\"*\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.translationKeyFormat','null'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.translationMethod','\"none\"'),('fields.d1b2a017-2d04-4c75-b64f-08e1e463a08a.type','\"craft\\\\fields\\\\Link\"'),('fields.d388c229-d406-4b40-930e-6c6a14eb67cb.columnSuffix','null'),('fields.d388c229-d406-4b40-930e-6c6a14eb67cb.handle','\"emailAddress\"'),('fields.d388c229-d406-4b40-930e-6c6a14eb67cb.instructions','null'),('fields.d388c229-d406-4b40-930e-6c6a14eb67cb.name','\"Email Address\"'),('fields.d388c229-d406-4b40-930e-6c6a14eb67cb.searchable','false'),('fields.d388c229-d406-4b40-930e-6c6a14eb67cb.settings.placeholder','null'),('fields.d388c229-d406-4b40-930e-6c6a14eb67cb.translationKeyFormat','null'),('fields.d388c229-d406-4b40-930e-6c6a14eb67cb.translationMethod','\"none\"'),('fields.d388c229-d406-4b40-930e-6c6a14eb67cb.type','\"craft\\\\fields\\\\Email\"'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.columnSuffix','null'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.handle','\"entries\"'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.instructions','null'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.name','\"Entries\"'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.searchable','false'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.settings.allowSelfRelations','false'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.settings.branchLimit','null'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.settings.maintainHierarchy','false'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.settings.maxRelations','1'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.settings.minRelations','null'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.settings.selectionLabel','null'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.settings.showCardsInGrid','false'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.settings.showSiteMenu','false'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.settings.sources','\"*\"'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.settings.targetSiteId','null'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.settings.validateRelatedElements','false'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.settings.viewMode','\"cards\"'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.translationKeyFormat','null'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.translationMethod','\"none\"'),('fields.dc8f8aeb-7a68-4039-8224-309e42b0a9de.type','\"craft\\\\fields\\\\Entries\"'),('formie.statuses.4162c5fc-73ec-4299-b9d2-3eb0ae698ef0.color','\"green\"'),('formie.statuses.4162c5fc-73ec-4299-b9d2-3eb0ae698ef0.description','null'),('formie.statuses.4162c5fc-73ec-4299-b9d2-3eb0ae698ef0.handle','\"new\"'),('formie.statuses.4162c5fc-73ec-4299-b9d2-3eb0ae698ef0.isDefault','true'),('formie.statuses.4162c5fc-73ec-4299-b9d2-3eb0ae698ef0.name','\"New\"'),('formie.statuses.4162c5fc-73ec-4299-b9d2-3eb0ae698ef0.sortOrder','1'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.dataRetention','\"forever\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.dataRetentionValue','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.fileUploadsAction','\"retain\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.notifications.0.attachFiles','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.notifications.0.content','\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"A user submission has been made on the \\\\\\\"\\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Form Name\\\",\\\"value\\\":\\\"{formName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"\\\\\\\" form on \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Site Name\\\",\\\"value\\\":\\\"{siteName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\" at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Their submission details are:\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.notifications.0.enabled','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.notifications.0.name','\"Admin Notification\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.notifications.0.replyTo','\"{field:emailAddress}\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.notifications.0.subject','\"A new submission was made on \\\"{formName}\\\"\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.notifications.0.to','\"{systemEmail}\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.notifications.1.attachFiles','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.notifications.1.content','\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thanks again for contacting us. Our team will get back to you as soon as we can.\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"As a reminder, you submitted the following details at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.notifications.1.enabled','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.notifications.1.name','\"User Notification\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.notifications.1.replyTo','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.notifications.1.subject','\"Thanks for contacting us!\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.notifications.1.to','\"{field:emailAddress}\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.label','\"Page 1\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.enabled','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.handle','\"yourName\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.instructions','\"Please enter your full name.\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.instructionsPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.label','\"Your Name\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.labelPosition','\"verbb\\\\formie\\\\positions\\\\Hidden\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.placeholder','\"Your name\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.required','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.enabled','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.handle','\"prefix\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.inputAttributes.0.label','\"autocomplete\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.inputAttributes.0.value','\"honorific-prefix\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.label','\"Prefix\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.options.0.isDefault','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.options.0.isOptgroup','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.options.0.label','\"Select an option\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.options.0.value','\"\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.required','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.type','\"verbb\\\\formie\\\\fields\\\\subfields\\\\NamePrefix\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.settings.enabled','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.settings.handle','\"firstName\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.settings.inputAttributes.0.label','\"autocomplete\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.settings.inputAttributes.0.value','\"given-name\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.settings.label','\"First Name\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.settings.placeholder','\"e.g. Peter\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.settings.required','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.type','\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameFirst\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.2.settings.enabled','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.2.settings.handle','\"middleName\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.2.settings.inputAttributes.0.label','\"autocomplete\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.2.settings.inputAttributes.0.value','\"additional-name\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.2.settings.label','\"Middle Name\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.2.settings.required','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.2.type','\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameMiddle\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.settings.enabled','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.settings.handle','\"lastName\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.settings.inputAttributes.0.label','\"autocomplete\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.settings.inputAttributes.0.value','\"family-name\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.settings.label','\"Last Name\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.settings.placeholder','\"e.g. Sherman\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.settings.required','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.type','\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameLast\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.settings.useMultipleFields','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.0.fields.0.type','\"verbb\\\\formie\\\\fields\\\\Name\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.1.fields.0.settings.enabled','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.1.fields.0.settings.handle','\"emailAddress\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.1.fields.0.settings.instructions','\"Please enter your email so we can get in touch.\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.1.fields.0.settings.label','\"Email Address\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.1.fields.0.settings.placeholder','\"e.g. psherman@wallaby.com\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.1.fields.0.settings.required','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.1.fields.0.type','\"verbb\\\\formie\\\\fields\\\\Email\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.2.fields.0.settings.enabled','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.2.fields.0.settings.handle','\"message\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.2.fields.0.settings.instructions','\"Please enter your comments.\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.2.fields.0.settings.label','\"Message\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.2.fields.0.settings.placeholder','\"e.g. The reason for my enquiry is...\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.2.fields.0.settings.required','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.rows.2.fields.0.type','\"verbb\\\\formie\\\\fields\\\\MultiLineText\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.settings.backButtonLabel','\"Back\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.settings.buttonsPosition','\"left\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.settings.saveButtonLabel','\"Save\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.settings.saveButtonStyle','\"link\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.settings.showBackButton','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.settings.showSaveButton','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.pages.0.settings.submitButtonLabel','\"Contact us\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.collectIp','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.collectUser','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.dataRetention','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.dataRetentionValue','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.defaultEmailTemplateId','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.defaultInstructionsPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.defaultLabelPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.disableCaptchas','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.displayCurrentPageTitle','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.displayFormTitle','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.displayPageProgress','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.displayPageTabs','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.errorMessage','\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Couldn’t save submission due to errors.\\\"}]}]\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.errorMessagePosition','\"top-form\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.fileUploadsAction','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.limitSubmissions','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.limitSubmissionsMessage','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.limitSubmissionsNumber','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.limitSubmissionsType','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.loadingIndicator','\"spinner\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.loadingIndicatorText','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.pageRedirectUrl','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.progressPosition','\"end\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.redirectUrl','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.requiredIndicator','\"asterisk\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.requireUser','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.requireUserMessage','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.scheduleForm','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.scheduleFormEnd','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.scheduleFormExpiredMessage','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.scheduleFormPendingMessage','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.scheduleFormStart','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.scrollToTop','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.submissionTitleFormat','\"{timestamp}\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.submitAction','\"message\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.submitActionFormHide','false'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.submitActionMessage','\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\\\"}]}]\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.submitActionMessagePosition','\"top-form\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.submitActionMessageTimeout','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.submitActionTab','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.submitActionUrl','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.submitMethod','\"ajax\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.validationOnFocus','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.settings.validationOnSubmit','true'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.data.userDeletedAction','\"retain\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.defaultStatus','\"4162c5fc-73ec-4299-b9d2-3eb0ae698ef0\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.handle','\"contactForm\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.name','\"Contact Form\"'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.submitActionEntry','null'),('formie.stencils.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb.template','null'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.19d6d897-1cde-4d59-914a-2bf8a23e7916.isPublic','true'),('graphql.schemas.19d6d897-1cde-4d59-914a-2bf8a23e7916.name','\"Public Schema\"'),('meta.__names__.05fb432b-77b1-40bc-8ff7-56425ce230ad','\"Site Settings\"'),('meta.__names__.06b6050b-3bd9-4f2d-b243-a71d312eafe3','\"Full Option Content Editor\"'),('meta.__names__.08c386f4-5a41-4c9f-8282-f6785af06bfc','\"$CRAFT_SITE_NAME\"'),('meta.__names__.18afc206-c397-4a60-bd93-bebe69611b1f','\"Footer Navigation\"'),('meta.__names__.19d6d897-1cde-4d59-914a-2bf8a23e7916','\"Public Schema\"'),('meta.__names__.1b2b5d25-f3c7-4710-970c-bf4dd3ce9bc9','\"Social Media\"'),('meta.__names__.1dafbbbe-838e-40fb-b33d-4cc3e1e2cb69','\"Form\"'),('meta.__names__.2b988591-9982-412b-b0d9-3b6599c0d5df','\"URL\"'),('meta.__names__.401590d1-1d18-4503-8baf-2560169e8c8f','\"Navigation\"'),('meta.__names__.4162c5fc-73ec-4299-b9d2-3eb0ae698ef0','\"New\"'),('meta.__names__.4173875d-a199-4944-9f1a-3319bffe8113','\"Social Media Type\"'),('meta.__names__.43328633-207b-4555-b704-20798cfe5942','\"Errors\"'),('meta.__names__.53449f53-916a-460c-84ed-4c4342067e0d','\"Simple Text Editor\"'),('meta.__names__.63206d24-ecbb-4b9c-8ae7-7ce5fd86f063','\"Multi Line Text\"'),('meta.__names__.70458b6c-f389-4606-a2c5-a0994a111a40','\"Internal Link\"'),('meta.__names__.7b662bcd-ea91-4c91-86ce-c60348c664d1','\"Pages\"'),('meta.__names__.7da4c184-4c24-46df-aeac-06c87941a3d2','\"Header Navigation\"'),('meta.__names__.8b610edc-f2dd-46b6-9597-96fcbb6d302a','\"Simple\"'),('meta.__names__.ac9ecf82-ce69-48ec-a9b8-a7ec33c8e4d3','\"Social Media\"'),('meta.__names__.bbe42781-9d0a-46a1-9052-5e6ff1b2a5fb','\"Contact Form\"'),('meta.__names__.bc026fc0-1927-41f4-be0a-2e521733a3e8','\"Site Settings\"'),('meta.__names__.bdf6317d-0df7-449f-a937-a1a274ffb106','\"Page - Blocks\"'),('meta.__names__.d09e7eaa-db8d-4b8c-a242-4cad3af936c0','\"Single Line Text\"'),('meta.__names__.d1b2a017-2d04-4c75-b64f-08e1e463a08a','\"Link Field\"'),('meta.__names__.d388c229-d406-4b40-930e-6c6a14eb67cb','\"Email Address\"'),('meta.__names__.d99bf7af-1eb1-4b77-814e-624eeec1a0e3','\"$CRAFT_SITE_NAME\"'),('meta.__names__.dc8f8aeb-7a68-4039-8224-309e42b0a9de','\"Entries\"'),('meta.__names__.e5f5c269-edf3-4e01-a7fc-f27360374782','\"Full\"'),('meta.__names__.fcf95a95-6db1-48dd-9aa8-a641adeec479','\"Just Content\"'),('plugins.admin-bar.edition','\"standard\"'),('plugins.admin-bar.enabled','true'),('plugins.admin-bar.schemaVersion','\"3.1.0\"'),('plugins.assetusage.edition','\"standard\"'),('plugins.assetusage.enabled','true'),('plugins.assetusage.schemaVersion','\"2.0.0\"'),('plugins.blitz.edition','\"standard\"'),('plugins.blitz.enabled','true'),('plugins.blitz.licenseKey','\"ZCHA6KD6O0IPE0JCQL7JKOE5\"'),('plugins.blitz.schemaVersion','\"5.7.0.1\"'),('plugins.blur-hash.edition','\"standard\"'),('plugins.blur-hash.enabled','true'),('plugins.blur-hash.schemaVersion','\"1.0.0\"'),('plugins.ckeditor.edition','\"standard\"'),('plugins.ckeditor.enabled','true'),('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),('plugins.cp-field-inspect.edition','\"standard\"'),('plugins.cp-field-inspect.enabled','true'),('plugins.cp-field-inspect.schemaVersion','\"1.0.0\"'),('plugins.diy-widget.edition','\"standard\"'),('plugins.diy-widget.enabled','true'),('plugins.diy-widget.schemaVersion','\"2.0.1\"'),('plugins.elements-panel.edition','\"standard\"'),('plugins.elements-panel.enabled','true'),('plugins.elements-panel.schemaVersion','\"1.0.0\"'),('plugins.field-manager.edition','\"standard\"'),('plugins.field-manager.enabled','true'),('plugins.field-manager.schemaVersion','\"1.0.0\"'),('plugins.formie.edition','\"standard\"'),('plugins.formie.enabled','true'),('plugins.formie.licenseKey','\"JTVPTRTTIIU8M5I9CR90PWH9\"'),('plugins.formie.schemaVersion','\"3.4.6\"'),('plugins.hyper.edition','\"standard\"'),('plugins.hyper.enabled','true'),('plugins.hyper.licenseKey','\"MZ3QSXK83FZSBX5IHJS048GG\"'),('plugins.hyper.schemaVersion','\"1.0.0\"'),('plugins.image-resizer.edition','\"standard\"'),('plugins.image-resizer.enabled','true'),('plugins.image-resizer.schemaVersion','\"2.0.0\"'),('plugins.imager-x.edition','\"lite\"'),('plugins.imager-x.enabled','true'),('plugins.imager-x.licenseKey','\"H8XW7BRGKUO9LX0CIOA5PR9S\"'),('plugins.imager-x.schemaVersion','\"4.0.0\"'),('plugins.mailgun.edition','\"standard\"'),('plugins.mailgun.enabled','true'),('plugins.mailgun.schemaVersion','\"1.0.0\"'),('plugins.minify.edition','\"standard\"'),('plugins.minify.enabled','true'),('plugins.minify.schemaVersion','\"1.0.0\"'),('plugins.seomatic.edition','\"standard\"'),('plugins.seomatic.enabled','true'),('plugins.seomatic.licenseKey','\"UHDTQ7F7LLYYI75URPL8SKY7\"'),('plugins.seomatic.schemaVersion','\"3.0.12\"'),('plugins.sprig.edition','\"standard\"'),('plugins.sprig.enabled','true'),('plugins.sprig.schemaVersion','\"1.0.1\"'),('plugins.vite.edition','\"standard\"'),('plugins.vite.enabled','true'),('plugins.vite.schemaVersion','\"1.0.0\"'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.defaultPlacement','\"end\"'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.enableVersioning','true'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.entryTypes.0','\"401590d1-1d18-4503-8baf-2560169e8c8f\"'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.handle','\"footerNavigation\"'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.maxAuthors','1'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.name','\"Footer Navigation\"'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.propagationMethod','\"all\"'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.enabledByDefault','true'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.hasUrls','false'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.template','null'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.uriFormat','null'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.structure.maxLevels','null'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.structure.uid','\"e166b4ed-e1a6-4392-a334-278bf1424c0d\"'),('sections.18afc206-c397-4a60-bd93-bebe69611b1f.type','\"structure\"'),('sections.43328633-207b-4555-b704-20798cfe5942.defaultPlacement','\"end\"'),('sections.43328633-207b-4555-b704-20798cfe5942.enableVersioning','true'),('sections.43328633-207b-4555-b704-20798cfe5942.entryTypes.0','\"fcf95a95-6db1-48dd-9aa8-a641adeec479\"'),('sections.43328633-207b-4555-b704-20798cfe5942.handle','\"error\"'),('sections.43328633-207b-4555-b704-20798cfe5942.maxAuthors','1'),('sections.43328633-207b-4555-b704-20798cfe5942.name','\"Errors\"'),('sections.43328633-207b-4555-b704-20798cfe5942.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.43328633-207b-4555-b704-20798cfe5942.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.43328633-207b-4555-b704-20798cfe5942.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.43328633-207b-4555-b704-20798cfe5942.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.43328633-207b-4555-b704-20798cfe5942.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.43328633-207b-4555-b704-20798cfe5942.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.43328633-207b-4555-b704-20798cfe5942.propagationMethod','\"all\"'),('sections.43328633-207b-4555-b704-20798cfe5942.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.enabledByDefault','true'),('sections.43328633-207b-4555-b704-20798cfe5942.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.hasUrls','false'),('sections.43328633-207b-4555-b704-20798cfe5942.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.template','null'),('sections.43328633-207b-4555-b704-20798cfe5942.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.uriFormat','null'),('sections.43328633-207b-4555-b704-20798cfe5942.type','\"channel\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.defaultPlacement','\"end\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.enableVersioning','true'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.entryTypes.0','\"bdf6317d-0df7-449f-a937-a1a274ffb106\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.handle','\"pages\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.maxAuthors','1'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.name','\"Pages\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.previewTargets.0.__assoc__.0.1','\"Page\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.previewTargets.0.__assoc__.1.0','\"refresh\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.previewTargets.0.__assoc__.1.1','\"1\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.previewTargets.0.__assoc__.2.0','\"urlFormat\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.previewTargets.0.__assoc__.2.1','\"{url}\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.propagationMethod','\"all\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.enabledByDefault','true'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.hasUrls','true'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.template','\"_pages/base.twig\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.uriFormat','\"{slug}\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.structure.maxLevels','null'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.structure.uid','\"4c0a1eed-b32a-43d6-ad31-77d4dc6ba447\"'),('sections.7b662bcd-ea91-4c91-86ce-c60348c664d1.type','\"structure\"'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.defaultPlacement','\"end\"'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.enableVersioning','true'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.entryTypes.0','\"401590d1-1d18-4503-8baf-2560169e8c8f\"'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.handle','\"headerNavigation\"'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.maxAuthors','1'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.name','\"Header Navigation\"'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.propagationMethod','\"all\"'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.enabledByDefault','true'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.hasUrls','false'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.template','null'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.uriFormat','null'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.structure.maxLevels','null'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.structure.uid','\"f3683a61-22d6-461c-8e62-81f8e8945551\"'),('sections.7da4c184-4c24-46df-aeac-06c87941a3d2.type','\"structure\"'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.defaultPlacement','\"end\"'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.enableVersioning','true'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.entryTypes.0','\"05fb432b-77b1-40bc-8ff7-56425ce230ad\"'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.handle','\"siteSettings\"'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.maxAuthors','1'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.name','\"Site Settings\"'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.propagationMethod','\"all\"'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.enabledByDefault','true'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.hasUrls','false'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.template','null'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.siteSettings.08c386f4-5a41-4c9f-8282-f6785af06bfc.uriFormat','null'),('sections.bc026fc0-1927-41f4-be0a-2e521733a3e8.type','\"single\"'),('siteGroups.d99bf7af-1eb1-4b77-814e-624eeec1a0e3.name','\"$CRAFT_SITE_NAME\"'),('sites.08c386f4-5a41-4c9f-8282-f6785af06bfc.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.08c386f4-5a41-4c9f-8282-f6785af06bfc.enabled','true'),('sites.08c386f4-5a41-4c9f-8282-f6785af06bfc.handle','\"prospa\"'),('sites.08c386f4-5a41-4c9f-8282-f6785af06bfc.hasUrls','true'),('sites.08c386f4-5a41-4c9f-8282-f6785af06bfc.language','\"en-GB\"'),('sites.08c386f4-5a41-4c9f-8282-f6785af06bfc.name','\"$CRAFT_SITE_NAME\"'),('sites.08c386f4-5a41-4c9f-8282-f6785af06bfc.primary','true'),('sites.08c386f4-5a41-4c9f-8282-f6785af06bfc.siteGroup','\"d99bf7af-1eb1-4b77-814e-624eeec1a0e3\"'),('sites.08c386f4-5a41-4c9f-8282-f6785af06bfc.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"$CRAFT_SITE_NAME\"'),('system.retryDuration','null'),('system.schemaVersion','\"5.3.0.2\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elementCondition','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.attribute','\"fullName\"'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.autocapitalize','true'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.autocomplete','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.autocorrect','true'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.class','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.disabled','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.elementCondition','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.id','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.includeInCards','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.inputType','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.instructions','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.label','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.max','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.min','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.name','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.orientation','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.placeholder','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.providesThumbs','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.readonly','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.requirable','true'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.required','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.size','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.step','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.tip','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.title','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\users\\\\FullNameField\"'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.uid','\"26dfedb2-a9db-4faa-bff4-bff0af4682f4\"'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.userCondition','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.warning','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.0.width','100'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.1.elementCondition','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.1.id','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.1.includeInCards','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.1.instructions','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.1.label','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.1.orientation','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.1.providesThumbs','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.1.requirable','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.1.tip','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\users\\\\PhotoField\"'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.1.uid','\"27c4bf62-bda3-45fe-9a25-de520cf57c33\"'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.1.userCondition','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.1.warning','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.1.width','100'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.autocapitalize','true'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.autocomplete','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.autocorrect','true'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.class','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.disabled','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.elementCondition','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.id','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.includeInCards','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.inputType','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.instructions','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.label','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.max','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.min','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.name','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.orientation','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.placeholder','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.providesThumbs','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.readonly','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.requirable','false'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.size','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.step','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.tip','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.title','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\users\\\\EmailField\"'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.uid','\"275bc1be-6632-4ef8-bf93-204f0a109984\"'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.userCondition','null'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.elements.2.width','100'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.name','\"Content\"'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.uid','\"366b3483-a440-4c21-8176-e5e4a5a3f72a\"'),('users.fieldLayouts.a503256d-9911-4514-9ccd-b894513f87ed.tabs.0.userCondition','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (3,4,12,1,10,1,'2024-09-03 02:30:00','2024-09-03 02:30:00','4a52b660-ad75-48eb-9b12-8d203850ae0f'),(7,4,26,1,10,1,'2024-09-03 02:32:48','2024-09-03 02:32:48','16f9298e-0b6e-4aef-a86f-54f1fbc0f783');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,4,1,1,''),(2,4,1,2,'Applied “Draft 1”'),(3,10,1,1,''),(4,4,1,3,'Applied “Draft 1”'),(5,4,1,4,'Applied “Draft 1”'),(6,4,1,5,'Applied “Draft 1”'),(7,4,1,6,'Applied “Draft 1”'),(8,4,1,7,'Applied “Draft 1”'),(9,4,1,8,'Applied “Draft 1”'),(10,4,1,9,'Applied “Draft 1”'),(11,4,1,10,'Applied “Draft 1”'),(12,4,1,11,'Applied “Draft 1”'),(13,29,1,1,NULL),(14,35,1,1,''),(15,37,1,1,''),(16,39,1,1,''),(17,41,1,1,''),(18,43,1,1,''),(19,29,1,2,'Applied “Draft 1”'),(20,45,1,1,NULL),(21,48,1,1,''),(22,50,1,1,''),(23,52,1,1,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' emma moca co nz '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' emma moca co nz '),(2,'handle',0,1,' contact '),(2,'slug',0,1,''),(2,'title',0,1,' contact '),(3,'slug',0,1,' temp ltwomubcqhacsszplyatzfzopymuocourmsw '),(3,'title',0,1,''),(4,'slug',0,1,' our services '),(4,'title',0,1,' our services '),(5,'slug',0,1,' temp tqhteupzdnxgqdwgcfumfdubikoypsmgmvqk '),(5,'title',0,1,''),(10,'slug',0,1,' dda '),(10,'title',0,1,' dda '),(29,'slug',0,1,' site settings '),(29,'title',0,1,' site settings '),(31,'slug',0,1,' temp dirzcxulbnemfrkizvrmqrcjxzkzycaxhcsn '),(31,'title',0,1,''),(34,'slug',0,1,' temp bhnyvrxkgcotvydaornjqtyswbqfubkmxpak '),(34,'title',0,1,''),(35,'slug',0,1,' our people '),(35,'title',0,1,' our people '),(37,'slug',0,1,' case studies '),(37,'title',0,1,' case studies '),(39,'slug',0,1,' faqs '),(39,'title',0,1,' faqs '),(41,'slug',0,1,' events '),(41,'title',0,1,' events '),(43,'slug',0,1,' contact '),(43,'title',0,1,' contact '),(45,'slug',0,1,' facebook f '),(45,'title',0,1,' facebook f '),(48,'slug',0,1,' careers '),(48,'title',0,1,' careers '),(50,'slug',0,1,' sustainability '),(50,'title',0,1,' sustainability '),(52,'slug',0,1,' privacy policy '),(52,'title',0,1,' privacy policy ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,1,'Pages','pages','structure',1,1,'all','end','[{\"label\": \"Page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-07-04 01:19:21','2024-07-04 01:19:21',NULL,'7b662bcd-ea91-4c91-86ce-c60348c664d1'),(2,2,'Header Navigation','headerNavigation','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-09-03 02:25:02','2024-09-03 02:25:02',NULL,'7da4c184-4c24-46df-aeac-06c87941a3d2'),(3,NULL,'Site Settings','siteSettings','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-09-03 02:45:00','2024-09-03 02:45:00',NULL,'bc026fc0-1927-41f4-be0a-2e521733a3e8'),(4,3,'Footer Navigation','footerNavigation','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-09-03 02:51:58','2024-09-03 02:51:58',NULL,'18afc206-c397-4a60-bd93-bebe69611b1f'),(5,NULL,'Errors','error','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-09-03 02:53:29','2024-09-03 02:53:29',NULL,'43328633-207b-4555-b704-20798cfe5942');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,1,1),(2,4,1),(3,7,1),(4,4,1),(5,8,1);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'{slug}','_pages/base.twig',1,'2024-07-04 01:19:21','2024-07-04 01:19:21','9ef75021-c798-4285-82b5-91c4e2a7c7fb'),(2,2,1,0,NULL,NULL,1,'2024-09-03 02:25:02','2024-09-03 02:25:02','b4cadf1f-8dec-45cc-8711-7ca0905f9207'),(3,3,1,0,NULL,NULL,1,'2024-09-03 02:45:00','2024-09-03 02:45:00','05e7ecbf-8dae-4f12-a426-3005db11bea9'),(4,4,1,0,NULL,NULL,1,'2024-09-03 02:51:58','2024-09-03 02:51:58','6cd00712-8125-4963-a8fb-5bb9e9678a48'),(5,5,1,0,NULL,NULL,1,'2024-09-03 02:53:29','2024-09-03 02:53:29','19389ff3-ba5f-485d-8750-a8bf7a7bae07');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `seomatic_metabundles`
--

LOCK TABLES `seomatic_metabundles` WRITE;
/*!40000 ALTER TABLE `seomatic_metabundles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `seomatic_metabundles` VALUES (1,'2024-07-04 01:19:51','2024-07-04 01:19:51','c0a7c29a-cb4f-4d27-b5f4-a797d3cb41c9','1.0.71','__GLOBAL_BUNDLE__',1,'__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__',NULL,'',1,'[]','2024-07-04 01:19:51','{\"language\":null,\"mainEntityOfPage\":\"WebSite\",\"seoTitle\":\"\",\"siteNamePosition\":\"before\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{{ seomatic.helper.safeCanonicalUrl() }}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{{ seomatic.meta.seoTitle }}\",\"ogSiteNamePosition\":\"none\",\"ogDescription\":\"{{ seomatic.meta.seoDescription }}\",\"ogImage\":\"{{ seomatic.meta.seoImage }}\",\"ogImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"ogImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"ogImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"twitterCard\":\"summary\",\"twitterCreator\":\"{{ seomatic.site.twitterHandle }}\",\"twitterTitle\":\"{{ seomatic.meta.seoTitle }}\",\"twitterSiteNamePosition\":\"none\",\"twitterDescription\":\"{{ seomatic.meta.seoDescription }}\",\"twitterImage\":\"{{ seomatic.meta.seoImage }}\",\"twitterImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"twitterImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"twitterImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"Prospa\",\"identity\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"creator\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":{\"twitter\":{\"siteName\":\"Twitter\",\"handle\":\"twitter\",\"url\":\"\"},\"facebook\":{\"siteName\":\"Facebook\",\"handle\":\"facebook\",\"url\":\"\"},\"wikipedia\":{\"siteName\":\"Wikipedia\",\"handle\":\"wikipedia\",\"url\":\"\"},\"linkedin\":{\"siteName\":\"LinkedIn\",\"handle\":\"linkedin\",\"url\":\"\"},\"googleplus\":{\"siteName\":\"Google+\",\"handle\":\"googleplus\",\"url\":\"\"},\"youtube\":{\"siteName\":\"YouTube\",\"handle\":\"youtube\",\"url\":\"\"},\"instagram\":{\"siteName\":\"Instagram\",\"handle\":\"instagram\",\"url\":\"\"},\"pinterest\":{\"siteName\":\"Pinterest\",\"handle\":\"pinterest\",\"url\":\"\"},\"github\":{\"siteName\":\"GitHub\",\"handle\":\"github\",\"url\":\"\"},\"vimeo\":{\"siteName\":\"Vimeo\",\"handle\":\"vimeo\",\"url\":\"\"}},\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"newsSitemap\":false,\"newsPublicationName\":\"\",\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":{\"generator\":{\"charset\":\"\",\"content\":\"SEOmatic\",\"httpEquiv\":\"\",\"name\":\"generator\",\"property\":null,\"include\":true,\"key\":\"generator\",\"environment\":null,\"dependencies\":{\"config\":[\"generatorEnabled\"]},\"tagAttrs\":[]},\"keywords\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.seoKeywords }}\",\"httpEquiv\":\"\",\"name\":\"keywords\",\"property\":null,\"include\":true,\"key\":\"keywords\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.seoDescription }}\",\"httpEquiv\":\"\",\"name\":\"description\",\"property\":null,\"include\":true,\"key\":\"description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"referrer\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.referrer }}\",\"httpEquiv\":\"\",\"name\":\"referrer\",\"property\":null,\"include\":true,\"key\":\"referrer\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"robots\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.robots }}\",\"httpEquiv\":\"\",\"name\":\"robots\",\"property\":null,\"include\":true,\"key\":\"robots\",\"environment\":{\"live\":{\"content\":\"{{ seomatic.meta.robots }}\"},\"staging\":{\"content\":\"none\"},\"local\":{\"content\":\"none\"}},\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":{\"fb:profile_id\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookProfileId }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:profile_id\",\"include\":true,\"key\":\"fb:profile_id\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"fb:app_id\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookAppId }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:app_id\",\"include\":true,\"key\":\"fb:app_id\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:locale\":{\"charset\":\"\",\"content\":\"{{ craft.app.language |replace({\\\"-\\\": \\\"_\\\"}) }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale\",\"include\":true,\"key\":\"og:locale\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:locale:alternate\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale:alternate\",\"include\":true,\"key\":\"og:locale:alternate\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:site_name\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.siteName }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:site_name\",\"include\":true,\"key\":\"og:site_name\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:type\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogType }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:type\",\"include\":true,\"key\":\"og:type\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:url\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.canonicalUrl }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:url\",\"include\":true,\"key\":\"og:url\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:title\":{\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.ogSiteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogTitle }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:title\",\"include\":true,\"key\":\"og:title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogDescription }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:description\",\"include\":true,\"key\":\"og:description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:image\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImage }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image\",\"include\":true,\"key\":\"og:image\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:image:width\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageWidth }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:width\",\"include\":true,\"key\":\"og:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:image:height\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageHeight }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:height\",\"include\":true,\"key\":\"og:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:image:alt\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageDescription }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:alt\",\"include\":true,\"key\":\"og:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:see_also\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:see_also\",\"include\":true,\"key\":\"og:see_also\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"facebook-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"facebook-domain-verification\",\"property\":null,\"include\":true,\"key\":\"facebook-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"facebookSiteVerification\"]},\"tagAttrs\":[]}},\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":{\"twitter:card\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterCard }}\",\"httpEquiv\":\"\",\"name\":\"twitter:card\",\"property\":null,\"include\":true,\"key\":\"twitter:card\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:site\":{\"charset\":\"\",\"content\":\"@{{ seomatic.site.twitterHandle }}\",\"httpEquiv\":\"\",\"name\":\"twitter:site\",\"property\":null,\"include\":true,\"key\":\"twitter:site\",\"environment\":null,\"dependencies\":{\"site\":[\"twitterHandle\"]},\"tagAttrs\":[]},\"twitter:creator\":{\"charset\":\"\",\"content\":\"@{{ seomatic.meta.twitterCreator }}\",\"httpEquiv\":\"\",\"name\":\"twitter:creator\",\"property\":null,\"include\":true,\"key\":\"twitter:creator\",\"environment\":null,\"dependencies\":{\"meta\":[\"twitterCreator\"]},\"tagAttrs\":[]},\"twitter:title\":{\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.twitterSiteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterTitle }}\",\"httpEquiv\":\"\",\"name\":\"twitter:title\",\"property\":null,\"include\":true,\"key\":\"twitter:title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterDescription }}\",\"httpEquiv\":\"\",\"name\":\"twitter:description\",\"property\":null,\"include\":true,\"key\":\"twitter:description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:image\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImage }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image\",\"property\":null,\"include\":true,\"key\":\"twitter:image\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:image:width\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageWidth }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:width\",\"property\":null,\"include\":true,\"key\":\"twitter:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]},\"twitter:image:height\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageHeight }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:height\",\"property\":null,\"include\":true,\"key\":\"twitter:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]},\"twitter:image:alt\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageDescription }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:alt\",\"property\":null,\"include\":true,\"key\":\"twitter:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]}},\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":null,\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":{\"google-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.googleSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"google-site-verification\",\"property\":null,\"include\":true,\"key\":\"google-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"googleSiteVerification\"]},\"tagAttrs\":[]},\"bing-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.bingSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"msvalidate.01\",\"property\":null,\"include\":true,\"key\":\"bing-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"bingSiteVerification\"]},\"tagAttrs\":[]},\"pinterest-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.pinterestSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"p:domain_verify\",\"property\":null,\"include\":true,\"key\":\"pinterest-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"pinterestSiteVerification\"]},\"tagAttrs\":[]}},\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":{\"canonical\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.meta.canonicalUrl }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"canonical\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"canonical\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"home\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"\\/\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"home\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"home\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"author\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"\\/humans.txt\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"author\",\"sizes\":\"\",\"type\":\"text\\/plain\",\"include\":true,\"key\":\"author\",\"environment\":null,\"dependencies\":{\"frontend_template\":[\"humans\"]},\"tagAttrs\":[]},\"publisher\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.site.googlePublisherLink }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"publisher\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"publisher\",\"environment\":null,\"dependencies\":{\"site\":[\"googlePublisherLink\"]},\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":{\"gtag\":{\"name\":\"Google gtag.js\",\"description\":\"The global site tag (gtag.js) is a JavaScript tagging framework and API that allows you to send event data to AdWords, DoubleClick, and Google Analytics. Instead of having to manage multiple tags for different products, you can use gtag.js and more easily benefit from the latest tracking features and integrations as they become available. [Learn More](https:\\/\\/developers.google.com\\/gtagjs\\/)\",\"templatePath\":\"_frontend\\/scripts\\/gtagHead.twig\",\"templateString\":\"{% set gtagProperty = googleAnalyticsId.value ??? googleAdWordsId.value ??? dcFloodlightId.value ??? null %}\\n{% if gtagProperty %}\\nwindow.dataLayer = window.dataLayer || [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\nfunction gtag(){dataLayer.push(arguments)};\\ngtag(\'js\', new Date());\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if googleAnalyticsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'anonymize_ip\': #{ipAnonymization.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'link_attribution\': #{enhancedLinkAttribution.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'allow_display_features\': #{displayFeatures.value ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAnalyticsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if googleAdWordsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAdWordsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if dcFloodlightId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ dcFloodlightId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/gtagBody.twig\",\"bodyTemplateString\":\"{% set gtagProperty = googleAnalyticsId.value ??? googleAdWordsId.value ??? dcFloodlightId.value ??? null %}\\n{% if gtagProperty %}\\n<script async src=\\\"{{ gtagScriptUrl.value }}?id={{ gtagProperty }}\\\"><\\/script>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleAnalyticsId\":{\"title\":\"Google Analytics Measurement\\/Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `G-XXXXXXXXXX` or `UA-XXXXXX-XX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/analytics\\/answer\\/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"googleAdWordsId\":{\"title\":\"AdWords Conversion ID\",\"instructions\":\"Only enter the ID, e.g.: `AW-XXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.google.com\\/adwords-remarketing-tag\\/)\",\"type\":\"string\",\"value\":\"\"},\"dcFloodlightId\":{\"title\":\"DoubleClick Floodlight ID\",\"instructions\":\"Only enter the ID, e.g.: `DC-XXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/dcm\\/partner\\/answer\\/7568534)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send PageView\",\"instructions\":\"Controls whether the `gtag.js` script automatically sends a PageView to Google Analytics, AdWords, and DoubleClick Floodlight when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"In some cases, you might need to anonymize the IP addresses of hits sent to Google Analytics. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/ip-anonymization)\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Google Analytics Display Features\",\"instructions\":\"The display features plugin for gtag.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/display-features)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Google Analytics Enhanced Link Attribution\",\"instructions\":\"Enhanced link attribution improves click track reporting by automatically differentiating between multiple link clicks that have the same URL on a given page. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"gtagScriptUrl\":{\"title\":\"Google gtag.js Script URL\",\"instructions\":\"The URL to the Google gtag.js tracking script. Normally this should not be changed, unless you locally cache it. The JavaScript `dataLayer` will automatically be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/gtag\\/js\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"gtag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"googleTagManager\":{\"name\":\"Google Tag Manager\",\"description\":\"Google Tag Manager is a tag management system that allows you to quickly and easily update tags and code snippets on your website. Once the Tag Manager snippet has been added to your website or mobile app, you can configure tags via a web-based user interface without having to alter and deploy additional code. [Learn More](https:\\/\\/support.google.com\\/tagmanager\\/answer\\/6102821?hl=en)\",\"templatePath\":\"_frontend\\/scripts\\/googleTagManagerHead.twig\",\"templateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n{{ dataLayerVariableName.value }} = [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\n(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({\'gtm.start\':\\nnew Date().getTime(),event:\'gtm.js\'});var f=d.getElementsByTagName(s)[0],\\nj=d.createElement(s),dl=l!=\'dataLayer\'?\'&l=\'+l:\'\';j.async=true;j.src=\\n\'{{ googleTagManagerUrl.value }}?id=\'+i+dl;f.parentNode.insertBefore(j,f);\\n})(window,document,\'script\',\'{{ dataLayerVariableName.value }}\',\'{{ googleTagManagerId.value }}\');\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/googleTagManagerBody.twig\",\"bodyTemplateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n<noscript><iframe src=\\\"{{ googleTagManagerNoScriptUrl.value }}?id={{ googleTagManagerId.value }}\\\"\\nheight=\\\"0\\\" width=\\\"0\\\" style=\\\"display:none;visibility:hidden\\\"><\\/iframe><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleTagManagerId\":{\"title\":\"Google Tag Manager ID\",\"instructions\":\"Only enter the ID, e.g.: `GTM-XXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.google.com\\/tag-manager\\/quickstart)\",\"type\":\"string\",\"value\":\"\"},\"dataLayerVariableName\":{\"title\":\"DataLayer Variable Name\",\"instructions\":\"The name to use for the JavaScript DataLayer variable. The value of this variable will be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"dataLayer\"},\"googleTagManagerUrl\":{\"title\":\"Google Tag Manager Script URL\",\"instructions\":\"The URL to the Google Tag Manager script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/gtm.js\"},\"googleTagManagerNoScriptUrl\":{\"title\":\"Google Tag Manager Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Google Tag Manager `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/ns.html\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"googleTagManager\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"facebookPixel\":{\"name\":\"Facebook Pixel\",\"description\":\"The Facebook pixel is an analytics tool that helps you measure the effectiveness of your advertising. You can use the Facebook pixel to understand the actions people are taking on your website and reach audiences you care about. [Learn More](https:\\/\\/www.facebook.com\\/business\\/help\\/651294705016616)\",\"templatePath\":\"_frontend\\/scripts\\/facebookPixelHead.twig\",\"templateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?\\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;\\nn.push=n;n.loaded=!0;n.version=\'2.0\';n.queue=[];t=b.createElement(e);t.async=!0;\\nt.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,\\ndocument,\'script\',\'{{ facebookPixelUrl.value }}\');\\nfbq(\'init\', \'{{ facebookPixelId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nfbq(\'track\', \'PageView\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/facebookPixelBody.twig\",\"bodyTemplateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none\\\"\\nsrc=\\\"{{ facebookPixelNoScriptUrl.value }}?id={{ facebookPixelId.value }}&ev=PageView&noscript=1\\\" \\/><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"facebookPixelId\":{\"title\":\"Facebook Pixel ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.facebook.com\\/docs\\/facebook-pixel\\/api-reference)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Facebook Pixel PageView\",\"instructions\":\"Controls whether the Facebook Pixel script automatically sends a PageView to Facebook Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"facebookPixelUrl\":{\"title\":\"Facebook Pixel Script URL\",\"instructions\":\"The URL to the Facebook Pixel script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/connect.facebook.net\\/en_US\\/fbevents.js\"},\"facebookPixelNoScriptUrl\":{\"title\":\"Facebook Pixel Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Facebook Pixel `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.facebook.com\\/tr\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"facebookPixel\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"linkedInInsight\":{\"name\":\"LinkedIn Insight\",\"description\":\"The LinkedIn Insight Tag is a lightweight JavaScript tag that powers conversion tracking, retargeting, and web analytics for LinkedIn ad campaigns.\",\"templatePath\":\"_frontend\\/scripts\\/linkedInInsightHead.twig\",\"templateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n_linkedin_data_partner_id = \\\"{{ dataPartnerId.value }}\\\";\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/linkedInInsightBody.twig\",\"bodyTemplateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n<script type=\\\"text\\/javascript\\\">\\n(function(){var s = document.getElementsByTagName(\\\"script\\\")[0];\\n    var b = document.createElement(\\\"script\\\");\\n    b.type = \\\"text\\/javascript\\\";b.async = true;\\n    b.src = \\\"{{ linkedInInsightUrl.value }}\\\";\\n    s.parentNode.insertBefore(b, s);})();\\n<\\/script>\\n<noscript>\\n<img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ linkedInInsightNoScriptUrl.value }}?pid={{ dataPartnerId.value }}&fmt=gif\\\" \\/>\\n<\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"dataPartnerId\":{\"title\":\"LinkedIn Data Partner ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/www.linkedin.com\\/help\\/lms\\/answer\\/65513\\/adding-the-linkedin-insight-tag-to-your-website?lang=en)\",\"type\":\"string\",\"value\":\"\"},\"linkedInInsightUrl\":{\"title\":\"LinkedIn Insight Script URL\",\"instructions\":\"The URL to the LinkedIn Insight script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/snap.licdn.com\\/li.lms-analytics\\/insight.min.js\"},\"linkedInInsightNoScriptUrl\":{\"title\":\"LinkedIn Insight &lt;noscript&gt; URL\",\"instructions\":\"The URL to the LinkedIn Insight `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/dc.ads.linkedin.com\\/collect\\/\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"linkedInInsight\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"hubSpot\":{\"name\":\"HubSpot\",\"description\":\"If you\'re not hosting your entire website on HubSpot, or have pages on your website that are not hosted on HubSpot, you\'ll need to install the HubSpot tracking code on your non-HubSpot pages in order to capture those analytics.\",\"templatePath\":null,\"templateString\":null,\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/hubSpotBody.twig\",\"bodyTemplateString\":\"{% if hubSpotId.value is defined and hubSpotId.value %}\\n<script type=\\\"text\\/javascript\\\" id=\\\"hs-script-loader\\\" async defer src=\\\"{{ hubSpotUrl.value }}{{ hubSpotId.value }}.js\\\"><\\/script>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"hubSpotId\":{\"title\":\"HubSpot ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/knowledge.hubspot.com\\/articles\\/kcs_article\\/reports\\/install-the-hubspot-tracking-code)\",\"type\":\"string\",\"value\":\"\"},\"hubSpotUrl\":{\"title\":\"HubSpot Script URL\",\"instructions\":\"The URL to the HubSpot script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"\\/\\/js.hs-scripts.com\\/\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"hubSpot\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"pinterestTag\":{\"name\":\"Pinterest Tag\",\"description\":\"The Pinterest tag allows you to track actions people take on your website after viewing your Promoted Pin. You can use this information to measure return on ad spend (RoAS) and create audiences to target on your Promoted Pins. [Learn More](https:\\/\\/help.pinterest.com\\/en\\/business\\/article\\/track-conversions-with-pinterest-tag)\",\"templatePath\":\"_frontend\\/scripts\\/pinterestTagHead.twig\",\"templateString\":\"{% if pinterestTagId.value is defined and pinterestTagId.value %}\\n!function(e){if(!window.pintrk){window.pintrk=function(){window.pintrk.queue.push(\\nArray.prototype.slice.call(arguments))};var\\nn=window.pintrk;n.queue=[],n.version=\\\"3.0\\\";var\\nt=document.createElement(\\\"script\\\");t.async=!0,t.src=e;var\\nr=document.getElementsByTagName(\\\"script\\\")[0];r.parentNode.insertBefore(t,r)}}(\\\"{{ pinterestTagUrl.value }}\\\");\\npintrk(\'load\', \'{{ pinterestTagId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\npintrk(\'page\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/pinterestTagBody.twig\",\"bodyTemplateString\":\"{% if pinterestTagId.value is defined and pinterestTagId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ pinterestTagNoScriptUrl.value }}?tid={{ pinterestTagId.value }}&noscript=1\\\" \\/><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"pinterestTagId\":{\"title\":\"Pinterest Tag ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.pinterest.com\\/docs\\/ad-tools\\/conversion-tag\\/)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Pinterest Tag PageView\",\"instructions\":\"Controls whether the Pinterest Tag script automatically sends a PageView to when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"pinterestTagUrl\":{\"title\":\"Pinterest Tag Script URL\",\"instructions\":\"The URL to the Pinterest Tag script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/s.pinimg.com\\/ct\\/core.js\"},\"pinterestTagNoScriptUrl\":{\"title\":\"Pinterest Tag Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Pinterest Tag `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/ct.pinterest.com\\/v3\\/\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"pinterestTag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"fathom\":{\"name\":\"Fathom\",\"description\":\"Fathom is a simple, light-weight, privacy-first alternative to Google Analytics. So, stop scrolling through pages of reports and collecting gobs of personal data about your visitors, both of which you probably don’t need. [Learn More](https:\\/\\/usefathom.com\\/)\",\"templatePath\":\"_frontend\\/scripts\\/fathomAnalytics.twig\",\"templateString\":\"{% if siteId.value is defined and siteId.value %}\\n(function() {\\nvar tag = document.createElement(\'script\');\\ntag.src = \\\"{{ scriptUrl.value }}\\\";\\ntag.defer = true;\\ntag.setAttribute(\\\"data-site\\\", \\\"{{ siteId.value | raw }}\\\");\\n{% if honorDnt.value %}\\ntag.setAttribute(\\\"data-honor-dnt\\\", \\\"true\\\");\\n{% endif %}\\n{% if disableAutoTracking.value %}\\ntag.setAttribute(\\\"data-auto\\\", \\\"false\\\");\\n{% endif %}\\n{% if ignoreCanonicals.value %}\\ntag.setAttribute(\\\"data-canonical\\\", \\\"false\\\");\\n{% endif %}\\n{% if excludedDomains.value | length %}\\ntag.setAttribute(\\\"data-excluded-domains\\\", \\\"{{ excludedDomains.value | raw }}\\\");\\n{% endif %}\\n{% if includedDomains.value | length %}\\ntag.setAttribute(\\\"data-included-domains\\\", \\\"{{ includedDomains.value | raw }}\\\");\\n{% endif %}\\nvar firstScriptTag = document.getElementsByTagName(\'script\')[0];\\nfirstScriptTag.parentNode.insertBefore(tag, firstScriptTag);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteId\":{\"title\":\"Site ID\",\"instructions\":\"Only enter the Site ID, not the entire script code. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking)\",\"type\":\"string\",\"value\":\"\"},\"honorDnt\":{\"title\":\"Honoring Do Not Track (DNT)\",\"instructions\":\"By default we track every visitor to your website, regardless of them having DNT turned on or not. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"disableAutoTracking\":{\"title\":\"Disable automatic tracking\",\"instructions\":\"By default, we track a page view every time a visitor to your website loads a page with our script on it. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"ignoreCanonicals\":{\"title\":\"Ignore canonicals\",\"instructions\":\"If there’s a canonical URL in place, then by default we use it instead of the current URL. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"excludedDomains\":{\"title\":\"Excluded Domains\",\"instructions\":\"You exclude one or several domains, so our tracker will track things on every domain, except the ones excluded. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"string\",\"value\":\"\"},\"includedDomains\":{\"title\":\"Included Domains\",\"instructions\":\"If you want to go in the opposite direction and only track stats on a specific domain. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"string\",\"value\":\"\"},\"scriptUrl\":{\"title\":\"Fathom Script URL\",\"instructions\":\"The URL to the Fathom tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/cdn.usefathom.com\\/script.js\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"fathom\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"matomo\":{\"name\":\"Matomo\",\"description\":\"Matomo is a Google Analytics alternative that protects your data and your customers\' privacy [Learn More](https:\\/\\/matomo.org\\/)\",\"templatePath\":\"_frontend\\/scripts\\/matomoAnalytics.twig\",\"templateString\":\"{% if siteId.value is defined and siteId.value and scriptUrl.value is defined and scriptUrl.value | length %}\\nvar _paq = window._paq = window._paq || [];\\n{% if sendPageView.value %}\\n_paq.push([\'trackPageView\']);\\n{% endif %}\\n{% if sendPageView.value %}\\n_paq.push([\'enableLinkTracking\']);\\n{% endif %}\\n(function() {\\nvar u=\\\"{{ scriptUrl.value }}\\\";\\n_paq.push([\'setTrackerUrl\', u+\'matomo.php\']);\\n_paq.push([\'setSiteId\', {{ siteId.value }}]);\\nvar d=document, g=d.createElement(\'script\'), s=d.getElementsByTagName(\'script\')[0];\\ng.type=\'text\\/javascript\'; g.async=true; g.src=u+\'matomo.js\'; s.parentNode.insertBefore(g,s);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteId\":{\"title\":\"Site ID\",\"instructions\":\"Only enter the Site ID, not the entire script code. [Learn More](https:\\/\\/developer.matomo.org\\/guides\\/tracking-javascript-guide)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Matomo PageView\",\"instructions\":\"Controls whether the Matomo script automatically sends a PageView when your pages are loaded. [Learn More](https:\\/\\/developer.matomo.org\\/api-reference\\/tracking-javascript)\",\"type\":\"bool\",\"value\":true},\"enableLinkTracking\":{\"title\":\"Enable Link Tracking\",\"instructions\":\"Install link tracking on all applicable link elements. [Learn More](https:\\/\\/developer.matomo.org\\/api-reference\\/tracking-javascript)\",\"type\":\"bool\",\"value\":true},\"scriptUrl\":{\"title\":\"Matomo Script URL\",\"instructions\":\"The URL to the Matomo tracking script. This will vary depending on whether you are using Matomo Cloud or Matomo On-Premise. [Learn More](https:\\/\\/developer.matomo.org\\/guides\\/tracking-javascript-guide)\",\"type\":\"string\",\"value\":\"\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"matomo\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"plausible\":{\"name\":\"Plausible\",\"description\":\"Plausible is a lightweight and open-source website analytics tool. No cookies and fully compliant with GDPR, CCPA and PECR. [Learn More](https:\\/\\/plausible.io\\/)\",\"templatePath\":\"_frontend\\/scripts\\/plausibleAnalytics.twig\",\"templateString\":\"{% if siteDomain.value is defined and siteDomain.value %}\\n(function() {\\nvar tag = document.createElement(\'script\');\\ntag.src = \\\"{{ scriptUrl.value }}\\\";\\ntag.defer = true;\\ntag.setAttribute(\\\"data-domain\\\", \\\"{{ siteDomain.value | raw }}\\\");\\nvar firstScriptTag = document.getElementsByTagName(\'script\')[0];\\nfirstScriptTag.parentNode.insertBefore(tag, firstScriptTag);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteDomain\":{\"title\":\"Site Domain\",\"instructions\":\"Only enter the site domain, not the entire script code. [Learn More](https:\\/\\/plausible.io\\/docs\\/plausible-script)\",\"type\":\"string\",\"value\":\"\"},\"scriptUrl\":{\"title\":\"Plausible Script URL\",\"instructions\":\"The URL to the Plausible tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/plausible.io\\/js\\/plausible.js\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"plausible\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"googleAnalytics\":{\"name\":\"Google Analytics (old)\",\"description\":\"Google Analytics gives you the digital analytics tools you need to analyze data from all touchpoints in one place, for a deeper understanding of the customer experience. You can then share the insights that matter with your whole organization. [Learn More](https:\\/\\/www.google.com\\/analytics\\/analytics\\/)\",\"templatePath\":\"_frontend\\/scripts\\/googleAnalytics.twig\",\"templateString\":\"{% if trackingId.value is defined and trackingId.value %}\\n(function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){\\n(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\\nm=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\\n})(window,document,\'script\',\'{{ analyticsUrl.value }}\',\'ga\');\\nga(\'create\', \'{{ trackingId.value |raw }}\', \'auto\'{% if linker.value %}, {allowLinker: true}{% endif %});\\n{% if ipAnonymization.value %}\\nga(\'set\', \'anonymizeIp\', true);\\n{% endif %}\\n{% if displayFeatures.value %}\\nga(\'require\', \'displayfeatures\');\\n{% endif %}\\n{% if ecommerce.value %}\\nga(\'require\', \'ecommerce\');\\n{% endif %}\\n{% if enhancedEcommerce.value %}\\nga(\'require\', \'ec\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linkid\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linker\');\\n{% endif %}\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nga(\'send\', \'pageview\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"trackingId\":{\"title\":\"Google Analytics Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `UA-XXXXXX-XX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/analytics\\/answer\\/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Google Analytics PageView\",\"instructions\":\"Controls whether the Google Analytics script automatically sends a PageView to Google Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"When a customer of Analytics requests IP address anonymization, Analytics anonymizes the address as soon as technically feasible at the earliest possible stage of the collection network.\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Display Features\",\"instructions\":\"The display features plugin for analytics.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/display-features)\",\"type\":\"bool\",\"value\":false},\"ecommerce\":{\"title\":\"Ecommerce\",\"instructions\":\"Ecommerce tracking allows you to measure the number of transactions and revenue that your website generates. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedEcommerce\":{\"title\":\"Enhanced Ecommerce\",\"instructions\":\"The enhanced ecommerce plug-in for analytics.js enables the measurement of user interactions with products on ecommerce websites across the user\'s shopping experience, including: product impressions, product clicks, viewing product details, adding a product to a shopping cart, initiating the checkout process, transactions, and refunds. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/enhanced-ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Enhanced Link Attribution\",\"instructions\":\"Enhanced Link Attribution improves the accuracy of your In-Page Analytics report by automatically differentiating between multiple links to the same URL on a single page by using link element IDs. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"linker\":{\"title\":\"Linker\",\"instructions\":\"The linker plugin simplifies the process of implementing cross-domain tracking as described in the Cross-domain Tracking guide for analytics.js. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/linker)\",\"type\":\"bool\",\"value\":false},\"analyticsUrl\":{\"title\":\"Google Analytics Script URL\",\"instructions\":\"The URL to the Google Analytics tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.google-analytics.com\\/analytics.js\"}},\"dataLayer\":[],\"deprecated\":true,\"deprecationNotice\":\"Universal Analytics (which is what this script uses) is being [discontinued on July 1st, 2023](https:\\/\\/support.google.com\\/analytics\\/answer\\/11583528). You should use Google gtag.js or Google Tag Manager instead and transition to a new GA4 property.\",\"discontinued\":false,\"include\":false,\"key\":\"googleAnalytics\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.meta.mainEntityOfPage }}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"issn\":null,\"dateModified\":null,\"associatedMedia\":null,\"publisherImprint\":null,\"pattern\":null,\"audio\":null,\"recordedAt\":null,\"hasPart\":null,\"awards\":null,\"encoding\":null,\"workTranslation\":null,\"releasedEvent\":null,\"workExample\":null,\"spatial\":null,\"accessModeSufficient\":null,\"award\":null,\"review\":null,\"interpretedAsClaim\":null,\"publisher\":null,\"exampleOfWork\":null,\"genre\":null,\"translationOfWork\":null,\"headline\":null,\"acquireLicensePage\":null,\"assesses\":null,\"creativeWorkStatus\":null,\"sdLicense\":null,\"educationalUse\":null,\"countryOfOrigin\":null,\"contentRating\":null,\"locationCreated\":null,\"creator\":{\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\"},\"accessibilitySummary\":null,\"commentCount\":null,\"copyrightYear\":null,\"isBasedOnUrl\":null,\"license\":null,\"usageInfo\":null,\"publication\":null,\"timeRequired\":null,\"interactivityType\":null,\"publishingPrinciples\":null,\"contributor\":null,\"citation\":null,\"conditionsOfAccess\":null,\"learningResourceType\":null,\"correction\":null,\"author\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"reviews\":null,\"isPartOf\":null,\"producer\":null,\"thumbnail\":null,\"accessMode\":null,\"editEIDR\":null,\"temporalCoverage\":null,\"copyrightHolder\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"educationalAlignment\":null,\"funding\":null,\"material\":null,\"alternativeHeadline\":null,\"version\":null,\"isFamilyFriendly\":null,\"materialExtent\":null,\"discussionUrl\":null,\"size\":null,\"maintainer\":null,\"copyrightNotice\":null,\"comment\":null,\"offers\":null,\"text\":null,\"fileFormat\":null,\"encodings\":null,\"about\":null,\"audience\":null,\"keywords\":null,\"spatialCoverage\":null,\"sponsor\":null,\"accessibilityAPI\":null,\"sdPublisher\":null,\"contentLocation\":null,\"interactionStatistic\":null,\"encodingFormat\":null,\"archivedAt\":null,\"mainEntity\":null,\"datePublished\":null,\"isAccessibleForFree\":null,\"dateCreated\":null,\"teaches\":null,\"thumbnailUrl\":null,\"accountablePerson\":null,\"typicalAgeRange\":null,\"sdDatePublished\":null,\"funder\":null,\"expires\":null,\"aggregateRating\":null,\"temporal\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"inLanguage\":\"{{ seomatic.meta.language }}\",\"provider\":null,\"abstract\":null,\"digitalSourceType\":null,\"position\":null,\"mentions\":null,\"sourceOrganization\":null,\"video\":null,\"editor\":null,\"creditText\":null,\"schemaVersion\":null,\"translator\":null,\"accessibilityHazard\":null,\"contentReferenceTime\":null,\"educationalLevel\":null,\"character\":null,\"isBasedOn\":null,\"name\":\"{{ seomatic.meta.seoTitle }}\",\"description\":\"{{ seomatic.meta.seoDescription }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.meta.canonicalUrl }}\",\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.meta.seoImage }}\"},\"additionalType\":null,\"potentialAction\":{\"type\":\"SearchAction\",\"target\":{\"type\":\"EntryPoint\",\"urlTemplate\":\"{{ seomatic.site.siteLinksSearchTarget }}\"},\"query-input\":\"{{ seomatic.helper.siteLinksQueryInput() }}\"},\"alternateName\":null,\"disambiguatingDescription\":null,\"sameAs\":null,\"mainEntityOfPage\":\"{{ seomatic.meta.canonicalUrl }}\"},\"identity\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.site.identity.computedType }}\",\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\",\"graph\":null,\"include\":true,\"key\":\"identity\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"memberOf\":null,\"foundingLocation\":\"{{ seomatic.site.identity.organizationFoundingLocation }}\",\"hasOfferCatalog\":null,\"awards\":null,\"alumni\":null,\"nonprofitStatus\":null,\"slogan\":null,\"owns\":null,\"award\":null,\"event\":null,\"makesOffer\":null,\"review\":null,\"hasPOS\":null,\"duns\":\"{{ seomatic.site.identity.organizationDuns }}\",\"brand\":null,\"knowsLanguage\":null,\"department\":null,\"knowsAbout\":null,\"foundingDate\":\"{{ seomatic.site.identity.organizationFoundingDate }}\",\"diversityPolicy\":null,\"leiCode\":null,\"publishingPrinciples\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.helper.socialTransform(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\",\"width\":\"{{ seomatic.helper.socialTransformWidth(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\",\"height\":\"{{ seomatic.helper.socialTransformHeight(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\"},\"ownershipFundingInfo\":null,\"reviews\":null,\"isicV4\":null,\"telephone\":\"{{ seomatic.site.identity.genericTelephone }}\",\"location\":null,\"correctionsPolicy\":null,\"areaServed\":null,\"funding\":null,\"employee\":null,\"numberOfEmployees\":null,\"hasMerchantReturnPolicy\":null,\"iso6523Code\":null,\"taxID\":null,\"naics\":null,\"founders\":null,\"contactPoint\":null,\"serviceArea\":null,\"globalLocationNumber\":null,\"keywords\":null,\"email\":\"{{ seomatic.site.identity.genericEmail }}\",\"ethicsPolicy\":null,\"sponsor\":null,\"agentInteractionStatistic\":null,\"employees\":null,\"events\":null,\"interactionStatistic\":null,\"legalName\":null,\"vatID\":null,\"members\":null,\"funder\":null,\"aggregateRating\":null,\"hasCredential\":null,\"seeks\":null,\"subOrganization\":null,\"dissolutionDate\":null,\"contactPoints\":[],\"founder\":\"{{ seomatic.site.identity.organizationFounder }}\",\"unnamedSourcesPolicy\":null,\"parentOrganization\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{{ seomatic.site.identity.genericStreetAddress }}\",\"addressLocality\":\"{{ seomatic.site.identity.genericAddressLocality }}\",\"addressRegion\":\"{{ seomatic.site.identity.genericAddressRegion }}\",\"postalCode\":\"{{ seomatic.site.identity.genericPostalCode }}\",\"addressCountry\":\"{{ seomatic.site.identity.genericAddressCountry }}\"},\"faxNumber\":null,\"actionableFeedbackPolicy\":null,\"diversityStaffingReport\":null,\"hasCertification\":null,\"member\":null,\"name\":\"{{ seomatic.site.identity.genericName }}\",\"description\":\"{{ seomatic.site.identity.genericDescription }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.site.identity.genericUrl }}\",\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.site.identity.genericImage }}\",\"width\":\"{{ seomatic.site.identity.genericImageWidth }}\",\"height\":\"{{ seomatic.site.identity.genericImageHeight }}\"},\"additionalType\":null,\"potentialAction\":null,\"alternateName\":\"{{ seomatic.site.identity.genericAlternateName }}\",\"disambiguatingDescription\":null,\"sameAs\":null,\"mainEntityOfPage\":null},\"creator\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.site.creator.computedType }}\",\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\",\"graph\":null,\"include\":true,\"key\":\"creator\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"memberOf\":null,\"foundingLocation\":\"{{ seomatic.site.creator.organizationFoundingLocation }}\",\"hasOfferCatalog\":null,\"awards\":null,\"alumni\":null,\"nonprofitStatus\":null,\"slogan\":null,\"owns\":null,\"award\":null,\"event\":null,\"makesOffer\":null,\"review\":null,\"hasPOS\":null,\"duns\":\"{{ seomatic.site.creator.organizationDuns }}\",\"brand\":null,\"knowsLanguage\":null,\"department\":null,\"knowsAbout\":null,\"foundingDate\":\"{{ seomatic.site.creator.organizationFoundingDate }}\",\"diversityPolicy\":null,\"leiCode\":null,\"publishingPrinciples\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.helper.socialTransform(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\",\"width\":\"{{ seomatic.helper.socialTransformWidth(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\",\"height\":\"{{ seomatic.helper.socialTransformHeight(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\"},\"ownershipFundingInfo\":null,\"reviews\":null,\"isicV4\":null,\"telephone\":\"{{ seomatic.site.creator.genericTelephone }}\",\"location\":null,\"correctionsPolicy\":null,\"areaServed\":null,\"funding\":null,\"employee\":null,\"numberOfEmployees\":null,\"hasMerchantReturnPolicy\":null,\"iso6523Code\":null,\"taxID\":null,\"naics\":null,\"founders\":null,\"contactPoint\":null,\"serviceArea\":null,\"globalLocationNumber\":null,\"keywords\":null,\"email\":\"{{ seomatic.site.creator.genericEmail }}\",\"ethicsPolicy\":null,\"sponsor\":null,\"agentInteractionStatistic\":null,\"employees\":null,\"events\":null,\"interactionStatistic\":null,\"legalName\":null,\"vatID\":null,\"members\":null,\"funder\":null,\"aggregateRating\":null,\"hasCredential\":null,\"seeks\":null,\"subOrganization\":null,\"dissolutionDate\":null,\"contactPoints\":[],\"founder\":\"{{ seomatic.site.creator.organizationFounder }}\",\"unnamedSourcesPolicy\":null,\"parentOrganization\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{{ seomatic.site.creator.genericStreetAddress }}\",\"addressLocality\":\"{{ seomatic.site.creator.genericAddressLocality }}\",\"addressRegion\":\"{{ seomatic.site.creator.genericAddressRegion }}\",\"postalCode\":\"{{ seomatic.site.creator.genericPostalCode }}\",\"addressCountry\":\"{{ seomatic.site.creator.genericAddressCountry }}\"},\"faxNumber\":null,\"actionableFeedbackPolicy\":null,\"diversityStaffingReport\":null,\"hasCertification\":null,\"member\":null,\"name\":\"{{ seomatic.site.creator.genericName }}\",\"description\":\"{{ seomatic.site.creator.genericDescription }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.site.creator.genericUrl }}\",\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.site.creator.genericImage }}\",\"width\":\"{{ seomatic.site.creator.genericImageWidth }}\",\"height\":\"{{ seomatic.site.creator.genericImageHeight }}\"},\"additionalType\":null,\"potentialAction\":null,\"alternateName\":\"{{ seomatic.site.creator.genericAlternateName }}\",\"disambiguatingDescription\":null,\"sameAs\":null,\"mainEntityOfPage\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{{ seomatic.meta.seoTitle }}\",\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.siteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":{\"humans\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"\\/* TEAM *\\/\\n\\nCreator: {{ seomatic.site.creator.genericName ?? \\\"n\\/a\\\" }}\\nURL: {{ parseEnv(seomatic.site.creator.genericUrl ?? \\\"n\\/a\\\") }}\\nDescription: {{ seomatic.site.creator.genericDescription ?? \\\"n\\/a\\\" }}\\n\\n\\/* THANKS *\\/\\n\\nCraft CMS - https:\\/\\/craftcms.com\\nPixel & Tonic - https:\\/\\/pixelandtonic.com\\n\\n\\/* SITE *\\/\\n\\nStandards: HTML5, CSS3\\nComponents: Craft CMS 5, Yii2, PHP, JavaScript, SEOmatic\\n\",\"siteId\":null,\"include\":true,\"handle\":\"humans\",\"path\":\"humans.txt\",\"template\":\"_frontend\\/pages\\/humans.twig\",\"controller\":\"frontend-template\",\"action\":\"humans\"},\"robots\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# robots.txt for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }}\\n\\n{{ seomatic.helper.sitemapIndex() }}\\n{% switch seomatic.config.environment %}\\n\\n{% case \\\"live\\\" %}\\n\\n    # live - don\'t allow web crawlers to index cpresources\\/ or vendor\\/\\n\\n    User-agent: *\\n    Disallow: \\/cpresources\\/\\n    Disallow: \\/vendor\\/\\n    Disallow: \\/.env\\n    Disallow: \\/cache\\/\\n\\n{% case \\\"staging\\\" %}\\n\\n    # staging - disallow all\\n\\n    User-agent: *\\n    Disallow: \\/\\n\\n{% case \\\"local\\\" %}\\n\\n    # local - disallow all\\n\\n    User-agent: *\\n    Disallow: \\/\\n\\n{% default %}\\n\\n    # default - don\'t allow web crawlers to index cpresources\\/ or vendor\\/\\n\\n    User-agent: *\\n    Disallow: \\/cpresources\\/\\n    Disallow: \\/vendor\\/\\n    Disallow: \\/.env\\n    Disallow: \\/cache\\/\\n\\n{% endswitch %}\\n\\n# Disallow ChatGPT bot, as there\'s no benefit to allowing it to index your site\\nUser-agent: GPTBot\\nDisallow: \\/\\n\\n# Disallow Google Bard and Vertex AI bots, as there\'s no benefit to allowing it to index your site\\nUser-agent: Google-Extended\\nDisallow: \\/\\n\\n# Disallow Perplexity bot, as there\'s no benefit to allowing it to index your site\\nUser-agent: PerplexityBot\\nDisallow: \\/\\n\",\"siteId\":null,\"include\":true,\"handle\":\"robots\",\"path\":\"robots.txt\",\"template\":\"_frontend\\/pages\\/robots.twig\",\"controller\":\"frontend-template\",\"action\":\"robots\"},\"ads\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# ads.txt file for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }}\\n# More info: https:\\/\\/support.google.com\\/admanager\\/answer\\/7441288?hl=en\\n{{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }},123,DIRECT\\n\",\"siteId\":null,\"include\":false,\"handle\":\"ads\",\"path\":\"ads.txt\",\"template\":\"_frontend\\/pages\\/ads.twig\",\"controller\":\"frontend-template\",\"action\":\"ads\"},\"security\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# security.txt file for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }} - more info: https:\\/\\/securitytxt.org\\/\\n\\n# (required) Contact email address for security issues\\nContact: mailto:user@example.com\\n\\n# (required) Expiration date for the security information herein\\nExpires: {{ date(\'+1 year\')|atom }}\\n\\n# (optional) OpenPGP key:\\nEncryption: {{ url(\'pgp-key.txt\') }}\\n\\n# (optional) Security policy page:\\nPolicy: {{ url(\'security-policy\') }}\\n\\n# (optional) Security acknowledgements page:\\nAcknowledgements: {{ url(\'hall-of-fame\') }}\\n\",\"siteId\":null,\"include\":false,\"handle\":\"security\",\"path\":\".well-known\\/security.txt\",\"template\":\"_frontend\\/pages\\/security.twig\",\"controller\":\"frontend-template\",\"action\":\"security\"}},\"name\":\"Frontend Templates\",\"description\":\"Templates that are rendered on the frontend\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":\"SeomaticEditableTemplate\",\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(2,'2024-07-04 01:19:51','2024-09-03 02:29:56','34181bb2-0da9-4c85-a4e1-e575966287cd','1.0.31','section',1,'Pages','pages','structure',NULL,'_pages/base.twig',1,'{\"1\":{\"id\":1,\"sectionId\":1,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"{slug}\",\"template\":\"_pages\\/base.twig\",\"language\":\"en-gb\"}}','2024-09-03 02:29:56','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{{ entry.title }}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{{ entry.url }}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{{ seomatic.meta.seoTitle }}\",\"ogSiteNamePosition\":\"sameAsGlobal\",\"ogDescription\":\"{{ seomatic.meta.seoDescription }}\",\"ogImage\":\"{{ seomatic.meta.seoImage }}\",\"ogImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"ogImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"ogImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{{ seomatic.site.twitterHandle }}\",\"twitterTitle\":\"{{ seomatic.meta.seoTitle }}\",\"twitterSiteNamePosition\":\"sameAsGlobal\",\"twitterDescription\":\"{{ seomatic.meta.seoDescription }}\",\"twitterImage\":\"{{ seomatic.meta.seoImage }}\",\"twitterImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"twitterImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"twitterImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"Prospa\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapAssetTransform\":null,\"newsSitemap\":false,\"newsPublicationName\":\"\",\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"sitemapPageSize\":500,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.meta.mainEntityOfPage }}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"specialty\":null,\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"significantLinks\":null,\"reviewedBy\":null,\"relatedLink\":null,\"primaryImageOfPage\":null,\"significantLink\":null,\"speakable\":null,\"dateModified\":\"{{ entry.dateUpdated |atom }}\",\"associatedMedia\":null,\"publisherImprint\":null,\"pattern\":null,\"audio\":null,\"recordedAt\":null,\"hasPart\":null,\"awards\":null,\"encoding\":null,\"workTranslation\":null,\"releasedEvent\":null,\"workExample\":null,\"spatial\":null,\"accessModeSufficient\":null,\"award\":null,\"review\":null,\"interpretedAsClaim\":null,\"publisher\":{\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\"},\"exampleOfWork\":null,\"genre\":null,\"translationOfWork\":null,\"headline\":\"{{ seomatic.meta.seoTitle }}\",\"acquireLicensePage\":null,\"assesses\":null,\"creativeWorkStatus\":null,\"sdLicense\":null,\"educationalUse\":null,\"countryOfOrigin\":null,\"contentRating\":null,\"locationCreated\":null,\"creator\":{\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\"},\"accessibilitySummary\":null,\"commentCount\":null,\"copyrightYear\":\"{{ entry.postDate | date(\\\"Y\\\") }}\",\"isBasedOnUrl\":null,\"license\":null,\"usageInfo\":null,\"publication\":null,\"timeRequired\":null,\"interactivityType\":null,\"publishingPrinciples\":null,\"contributor\":null,\"citation\":null,\"conditionsOfAccess\":null,\"learningResourceType\":null,\"correction\":null,\"author\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"reviews\":null,\"isPartOf\":null,\"producer\":null,\"thumbnail\":null,\"accessMode\":null,\"editEIDR\":null,\"temporalCoverage\":null,\"copyrightHolder\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"educationalAlignment\":null,\"funding\":null,\"material\":null,\"alternativeHeadline\":null,\"version\":null,\"isFamilyFriendly\":null,\"materialExtent\":null,\"discussionUrl\":null,\"size\":null,\"maintainer\":null,\"copyrightNotice\":null,\"comment\":null,\"offers\":null,\"text\":null,\"fileFormat\":null,\"encodings\":null,\"about\":null,\"audience\":null,\"keywords\":null,\"spatialCoverage\":null,\"sponsor\":null,\"accessibilityAPI\":null,\"sdPublisher\":null,\"contentLocation\":null,\"interactionStatistic\":null,\"encodingFormat\":null,\"archivedAt\":null,\"mainEntity\":null,\"datePublished\":\"{{ entry.postDate |atom }}\",\"isAccessibleForFree\":null,\"dateCreated\":\"{{ entry.dateCreated |atom }}\",\"teaches\":null,\"thumbnailUrl\":null,\"accountablePerson\":null,\"typicalAgeRange\":null,\"sdDatePublished\":null,\"funder\":null,\"expires\":null,\"aggregateRating\":null,\"temporal\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"inLanguage\":\"{{ seomatic.meta.language }}\",\"provider\":null,\"abstract\":null,\"digitalSourceType\":null,\"position\":null,\"mentions\":null,\"sourceOrganization\":null,\"video\":null,\"editor\":null,\"creditText\":null,\"schemaVersion\":null,\"translator\":null,\"accessibilityHazard\":null,\"contentReferenceTime\":null,\"educationalLevel\":null,\"character\":null,\"isBasedOn\":null,\"name\":\"{{ seomatic.meta.seoTitle }}\",\"description\":\"{{ seomatic.meta.seoDescription }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.meta.canonicalUrl }}\",\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.meta.seoImage }}\"},\"additionalType\":null,\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{{ seomatic.site.siteLinksSearchTarget }}\",\"query-input\":\"{{ seomatic.helper.siteLinksQueryInput() }}\"},\"alternateName\":null,\"disambiguatingDescription\":null,\"sameAs\":null,\"mainEntityOfPage\":\"{{ seomatic.meta.canonicalUrl }}\"}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{{ seomatic.meta.seoTitle }}\",\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.siteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"sameAsGlobal\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}');
/*!40000 ALTER TABLE `seomatic_metabundles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'$CRAFT_SITE_NAME','2024-07-04 01:19:21','2024-07-04 01:19:21',NULL,'d99bf7af-1eb1-4b77-814e-624eeec1a0e3');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','$CRAFT_SITE_NAME','prospa','en-GB',1,'$PRIMARY_SITE_URL',1,'2024-07-04 01:19:21','2024-09-03 01:48:26',NULL,'08c386f4-5a41-4c9f-8282-f6785af06bfc');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sprig_playgrounds`
--

LOCK TABLES `sprig_playgrounds` WRITE;
/*!40000 ALTER TABLE `sprig_playgrounds` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sprig_playgrounds` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,6,0,'2024-09-03 02:06:05','2024-09-03 02:29:54','c92a07c2-b69b-4b42-bba4-140d9db7f11a'),(2,1,3,1,2,3,1,'2024-09-03 02:06:05','2024-09-03 02:06:05','4de8b1f7-cc17-4115-8b75-0d4477a7f791'),(3,2,NULL,3,1,18,0,'2024-09-03 02:25:07','2024-09-03 03:03:52','659f1c90-3476-475d-a690-48401c6a0340'),(4,2,4,3,2,3,1,'2024-09-03 02:25:07','2024-09-03 02:25:07','fa215b81-0e8c-4d0e-b0c6-23472c170bda'),(5,1,10,1,4,5,1,'2024-09-03 02:29:54','2024-09-03 02:29:54','87a2951b-ba3a-450b-9962-b93ddbafaa05'),(6,2,31,3,4,5,1,'2024-09-03 02:47:19','2024-09-03 02:47:19','01e74c88-c872-4c69-86ab-ec638284063f'),(7,2,34,3,6,7,1,'2024-09-03 02:50:41','2024-09-03 02:50:41','f7a992e1-c8bf-42d7-a0dc-64e0145b638b'),(8,2,35,3,8,9,1,'2024-09-03 03:03:30','2024-09-03 03:03:30','bad22c8c-7728-4a00-b41e-b8695f60855b'),(9,2,37,3,10,11,1,'2024-09-03 03:03:40','2024-09-03 03:03:40','78764332-214b-43ba-9719-d87c0ce56e7f'),(10,2,39,3,12,13,1,'2024-09-03 03:03:44','2024-09-03 03:03:44','e8a19504-7ce8-490c-baa6-4ce687c63e64'),(11,2,41,3,14,15,1,'2024-09-03 03:03:48','2024-09-03 03:03:48','fc87c943-9b6e-4d56-82e4-ec294b66fcd6'),(12,2,43,3,16,17,1,'2024-09-03 03:03:52','2024-09-03 03:03:52','6e805c7a-19e8-4bda-b9f1-8699cb041108'),(13,3,NULL,13,1,8,0,'2024-09-03 03:10:36','2024-09-03 03:10:48','54772d6c-6062-491c-80d7-54dae9d2eb97'),(14,3,48,13,2,3,1,'2024-09-03 03:10:36','2024-09-03 03:10:36','2555f508-0e87-404e-b0d8-6b620dc78047'),(15,3,50,13,4,5,1,'2024-09-03 03:10:46','2024-09-03 03:10:46','72da5e51-aa0c-4431-90cb-4343909dceb2'),(16,3,52,13,6,7,1,'2024-09-03 03:10:48','2024-09-03 03:10:48','d5cf67f3-9809-49a4-97eb-3567bda1c592');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,NULL,'2024-07-04 01:19:21','2024-07-04 01:19:21',NULL,'4c0a1eed-b32a-43d6-ad31-77d4dc6ba447'),(2,NULL,'2024-09-03 02:25:02','2024-09-03 02:25:02',NULL,'f3683a61-22d6-461c-8e62-81f8e8945551'),(3,NULL,'2024-09-03 02:51:58','2024-09-03 02:51:58',NULL,'e166b4ed-e1a6-4392-a334-278bf1424c0d');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tokens` VALUES (1,'x-EkyLruxGjvACEP4NKmQbbD2RMwS0Kx','blitz/generator/generate',NULL,NULL,'2024-07-24 20:35:47','2024-07-23 20:35:47','2024-07-23 20:35:47','289bd466-ad0a-4128-8bf4-330b4c6c7553'),(2,'D7KDdYr1xS8JtY1SDQMWKcSmTGZC1Sm6','blitz/generator/generate',NULL,NULL,'2024-07-24 20:35:48','2024-07-23 20:35:48','2024-07-23 20:35:48','2e4973d1-ea8f-4f19-9b5d-54ec1204e0ba');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\": \"en-NZ\", \"showFieldHandles\": true}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'emma@moca.co.nz',NULL,NULL,NULL,'emma@moca.co.nz','$2y$13$3PkNQrK8Y78khFsdoyPPA.tqNkxtpi/6PczC/8hG9OKAMDnBlCnpy','2024-09-03 01:46:35',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2024-07-04 01:19:22','2024-07-04 01:19:22','2024-09-03 01:46:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,NULL,'Temporary Uploads',NULL,'2024-07-22 01:42:39','2024-07-22 01:42:39','92bc77d9-84c8-4cb9-9849-38af2ad81bd1'),(2,1,NULL,'user_1','user_1/','2024-07-22 01:42:39','2024-07-22 01:42:39','98058bd8-5b93-4671-9c5b-3de0a34da5cf');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2024-07-05 01:06:04','2024-07-05 01:06:04','f098dfe2-5b22-4202-8fef-af84b74c1c50'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2024-07-05 01:06:04','2024-07-05 01:06:04','2095795c-116b-4ffc-b525-dea6a92e28bc'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2024-07-05 01:06:04','2024-07-05 01:06:04','04d18f9f-48de-4be6-93c7-2d7cb46ec2a5'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2024-07-05 01:06:04','2024-07-05 01:06:04','5b3d30af-3550-42b4-bde8-869bd1fab564');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-03  3:17:11
