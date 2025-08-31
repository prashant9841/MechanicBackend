-- MariaDB dump 10.19  Distrib 10.5.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
  KEY `fk_sxsgfmvgozpepbuqpbuoomrqtoaixwelfuog` (`primaryOwnerId`),
  CONSTRAINT `fk_hucuslwnhamtskaxnnqpuyzkcitwucuqnarx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sxsgfmvgozpepbuqpbuoomrqtoaixwelfuog` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
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
  KEY `idx_pehpqhgdciawzufmpgfgaiclquqokfeggwwq` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_corxufiwzuvmbbmpqeqzanlqhjcffjyagmox` (`dateRead`),
  KEY `fk_mdwaavxyupxgjztyxmpuquqbmhnoooojoqrs` (`pluginId`),
  CONSTRAINT `fk_mdwaavxyupxgjztyxmpuquqbmhnoooojoqrs` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nbqyfkmrssjgiryrtgbxhtdeutbznwhidtkb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
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
  KEY `idx_tkqfggxjonckfdkbhewzqxqpniexvimxuwul` (`sessionId`,`volumeId`),
  KEY `idx_xagfbhqfaelnjgogpyeatdxgngzfoqwhfslv` (`volumeId`),
  CONSTRAINT `fk_atcyhqycpcuzbfnweunrzkhxjulzueazjsrs` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qyelsidgnclnjrdzdrhadjchiojsrgkreuep` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
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
  KEY `idx_dvnvotkvwjiorgdntraqmccsflpahelrxawb` (`filename`,`folderId`),
  KEY `idx_xxsibztamvqflboxipiwrarzoxpysxvstgdv` (`folderId`),
  KEY `idx_fjurjpwqdmuepaprsxukfqwodypgubnvltua` (`volumeId`),
  KEY `fk_msgrozfijonsrigqjqbejjyknkbcmkrklcwb` (`uploaderId`),
  CONSTRAINT `fk_bqyoqkdhuppxzqifscbfgagkrwgzwmgszttr` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_brwsgixejfrfaomoakkvrdsmaurolgajnxai` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_msgrozfijonsrigqjqbejjyknkbcmkrklcwb` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ywwjhoimvoeepxvcnneupvzqoabdlbqxqvny` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
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
  KEY `fk_dezknlnpbicozieqkczyyyusugjyprdjqjea` (`siteId`),
  CONSTRAINT `fk_dezknlnpbicozieqkczyyyusugjyprdjqjea` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ixzsyyeiibljgqvzgniczzxumajsjcmriweb` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE
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
  KEY `fk_jlxizldwvmsvhrorsrhklxmzeiezckshwgws` (`userId`),
  CONSTRAINT `fk_jlxizldwvmsvhrorsrhklxmzeiezckshwgws` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulkopevents`
--

DROP TABLE IF EXISTS `bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulkopevents` (
  `key` char(10) NOT NULL,
  `senderClass` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_qjdzohgggcbrjauswbstgtiungdvniegljmd` (`timestamp`)
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
  KEY `idx_fpsqqlfufwvllavxmiymginjsnwiktdlpqvh` (`groupId`),
  KEY `fk_rdhkoyerabvmlwivjzzcdwrwmjvfczlxleds` (`parentId`),
  CONSTRAINT `fk_rdhkoyerabvmlwivjzzcdwrwmjvfczlxleds` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rgtzweswrnghswswmlsiyekvikfnbiefokzs` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ugzptanzccasrjujrkbpuihgnlhvisfrszww` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
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
  KEY `idx_ijvexzjmknaemuzhwbyxvmqxwmltvxzoapuw` (`name`),
  KEY `idx_yprojiravjenzjobggoxmgvezhpvsxlodfzt` (`handle`),
  KEY `idx_lpzhztlshhnbyhvbnhzgiymvmtytugrxyuoo` (`structureId`),
  KEY `idx_fjvctbvrgyqeyjrxrsfotwpsdumhktyiyrat` (`fieldLayoutId`),
  KEY `idx_dvkgejhouwviesriflvmwvirkanbuuexxkrr` (`dateDeleted`),
  CONSTRAINT `fk_idynrkxemcscsfuvlsbtvhvhtwcwwsvlkjlc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tlieunssdolpdpuzztwwekuefqytebkldnww` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `idx_rejiwiccbuurhandfhtmpuijjfwxmkxuttqa` (`groupId`,`siteId`),
  KEY `idx_pgsxrvmfkqntpzsiqvdjpwpfakdygrrxdzrn` (`siteId`),
  CONSTRAINT `fk_fmjenaydbkqlcmkmeaqepshnozeqqaidvlbk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yqinscigtyqkinxybchyrrqdyybqzvurbfjx` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
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
  KEY `idx_adjfbujncwyxsilauaystahqnzhupviwdjrv` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_klyxpbeaipjjnpzcxtkmhzdxzgdcelpwwaaa` (`siteId`),
  KEY `fk_zgcawgwzafqpqabuatxiqvjqdotgjerdmakg` (`userId`),
  CONSTRAINT `fk_klyxpbeaipjjnpzcxtkmhzdxzgdcelpwwaaa` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_lrajlgbnycfwpovvdxrxiuqafzypcifairff` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zgcawgwzafqpqabuatxiqvjqdotgjerdmakg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
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
  KEY `idx_fytuqbtexkjjqiulpngunolgeteojkswpfzz` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_uxaycoqltpndstcwiaurdtmctzyrbchvhlfp` (`siteId`),
  KEY `fk_nwgifammgntmueyjehmjldlnrecesvvnezym` (`fieldId`),
  KEY `fk_efwopbqltajmsblpfcamkipxhlalfiecwome` (`userId`),
  CONSTRAINT `fk_efwopbqltajmsblpfcamkipxhlalfiecwome` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_nwgifammgntmueyjehmjldlnrecesvvnezym` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rclbpdnxzfxihvspjuoxwwjvchylkclbkcix` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uxaycoqltpndstcwiaurdtmctzyrbchvhlfp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  KEY `fk_ttqwbgxsymzgyqugrnulshonzlqecvbsuoaj` (`userId`),
  CONSTRAINT `fk_ttqwbgxsymzgyqugrnulshonzlqecvbsuoaj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `idx_tlawrkiubxbwagljaieajfqslimcjclbkewz` (`key`,`fingerprint`)
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
  KEY `idx_fhyhgsoxjmdkqdocpmymonygrgpcvlhngesv` (`creatorId`,`provisional`),
  KEY `idx_idgsihjdpevjiyxietpssocqmanqizohlpha` (`saved`),
  KEY `fk_xhxgnanxfbywflxsajdjsphbrorrqbkbdlwh` (`canonicalId`),
  CONSTRAINT `fk_qinxvkvteodwxmbvywwjzdjfwkwyejadmhye` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xhxgnanxfbywflxsajdjsphbrorrqbkbdlwh` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  KEY `idx_xbbydtqwhgsopeeaexgzerhubdikbrvouwqa` (`elementId`,`timestamp`,`userId`),
  KEY `fk_yjqcncefknfjvgvghlafetpzerfjaanvpmmk` (`userId`),
  KEY `fk_iovpkayqsfayqtpwpxfqtyklrhyhzngibdec` (`siteId`),
  KEY `fk_flxkqigxtctmbkfrjctkhftmsrmpwbziqdfl` (`draftId`),
  CONSTRAINT `fk_flxkqigxtctmbkfrjctkhftmsrmpwbziqdfl` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iovpkayqsfayqtpwpxfqtyklrhyhzngibdec` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kvnaonyflxevzignfkjueqgsmzgovmsprzzi` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yjqcncefknfjvgvghlafetpzerfjaanvpmmk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
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
  KEY `idx_mwxnpwztyxewrkwabighjzvjxmcbbufpzvae` (`dateDeleted`),
  KEY `idx_dqqtexohqhqefuimsgrrjcbsvxtujflcelhu` (`fieldLayoutId`),
  KEY `idx_bwxxrmmsobmvaufqkwsovzrfjtcalxwnxbal` (`type`),
  KEY `idx_odxytrgdojuwnfrkcnibzgpoxtzrgwmedizl` (`enabled`),
  KEY `idx_ibmivhaauywehmlvzddvactdimccxvylzris` (`canonicalId`),
  KEY `idx_kpxiiletahqjpsxqqgwznrxsseebilozwwgd` (`archived`,`dateCreated`),
  KEY `idx_wgbtydowotiwpeogwaliceqehqtibztebwpi` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_ahfotlhnybwfvolagpshwaybcwxtosmxnxzb` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_anpeisbsmcowigzsuqwdawtuwtqjbtuafpjg` (`draftId`),
  KEY `fk_zrzmndbibblpbtunavzjbtydxjkmywohmhbz` (`revisionId`),
  CONSTRAINT `fk_anpeisbsmcowigzsuqwdawtuwtqjbtuafpjg` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_auextuxcvjdvuztwfpbgidvqibhcgwxttlns` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jplwyjvflmmhvwpxrkucrpnzphlxttqkjawd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zrzmndbibblpbtunavzjbtydxjkmywohmhbz` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  KEY `idx_brrvzukxrmqbqvfhqfyweannyzcepojyuswo` (`timestamp`)
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
  KEY `fk_vsnuzracfsghfyiultoxsgcbjgiaorwehmgk` (`ownerId`),
  CONSTRAINT `fk_ffaorszgxpsxvzwdgjqwccdcnqhjbqbllkyd` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vsnuzracfsghfyiultoxsgcbjgiaorwehmgk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `idx_ctjpifvrggynagsixsgdeortjljowaubfyzx` (`elementId`,`siteId`),
  KEY `idx_oiidvfmwvyvicbvzkwxuoiyvmtshxzdwtkus` (`siteId`),
  KEY `idx_krxlzttoiaydsvrwkwscowiuozxkrfvyumih` (`title`,`siteId`),
  KEY `idx_btilsnetsqzaldtcudhmbvdcaoobqxwcurpw` (`slug`,`siteId`),
  KEY `idx_ubmweqwlqeucavvynytgixuoztwklwewuduq` (`enabled`),
  KEY `idx_wvbkdkqlbeousctnouehysfgwazmjktvlmrd` (`uri`,`siteId`),
  CONSTRAINT `fk_mealouwlkjyfwhdszrujbjfronahtlofmgso` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qtjiaoktftpxellbcfguylsxoqcnladnghzr` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `status` enum('live','pending','expired') NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fdfetdbvjjeyfgchdarpayxhlwlztakucend` (`postDate`),
  KEY `idx_wfxtzyrgxpvgtqpgzvjxnyifibckwzjkguxq` (`expiryDate`),
  KEY `idx_mwzylhuygpgwsmbmvitbovsuxqxzxcblnwvr` (`status`),
  KEY `idx_ugzgbkrmgptpipeznnzjuonozqiklsouhria` (`sectionId`),
  KEY `idx_lywweqaspivjetptovrkslsugqhmpanuajdk` (`typeId`),
  KEY `idx_mlhbvvxotevasckquqbvesqfzxjrgyaxmlsk` (`primaryOwnerId`),
  KEY `idx_gfvsedsprnywlgeokewjwodabhgucvecrwct` (`fieldId`),
  KEY `fk_mvnllwzwzbriyraeysweenngfsztfsvohixs` (`parentId`),
  CONSTRAINT `fk_autsheyjpbqfuusehsfwdmrzgndntkctdfxj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_causbrgmsqjpjczyzvhnymkpngtcsgurbrkl` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kaqthjymlsyebzxlqwojksndojkbucmhzwbg` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kqdsgfchtcskqzswjmdcmnascygqqkhcxylc` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mvnllwzwzbriyraeysweenngfsztfsvohixs` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ykkglzvewekdbiugwwsvrfmpqidnqzqutklk` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
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
  KEY `idx_ytrypxaofaggtuzlbppcrmxgnwjlucrforlm` (`authorId`),
  KEY `idx_iluvbdvdgohsjjlxqanynnziyhrhpgegmaei` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_fmwprmplrzqseuaowsihzxmltshwfoqfypzg` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gturxtaknwyhkgurgdyoxjjxuhowizfrsiqy` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
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
  KEY `idx_iwscjlzfhrprmnjqckiuhhsqexrlikmmuceh` (`fieldLayoutId`),
  KEY `idx_ggxvcvhlybbngpxfzmvnxvihgwjbiaeucpna` (`dateDeleted`),
  CONSTRAINT `fk_wmrkijscgrytadcqornouxkfocjwllzfpsgf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  KEY `idx_oroomansafopsxjufdulfuuscgvqkruvbzyn` (`dateDeleted`),
  KEY `idx_mybpvmhxsuejgysmdnvnsatugoesswysrmvv` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  KEY `idx_ypklqwjmtsyhocqpilcsrfuaecghepydcpna` (`handle`,`context`),
  KEY `idx_yxinfzopgrdfpsvtjbqjbpfxvxfmjwauqbxj` (`context`),
  KEY `idx_zkqmfdatmpaofmtcdcvamwwirjacaefspksx` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  KEY `idx_mdfbunwuijgrrxokjenwdehykcjgmkurakwk` (`name`),
  KEY `idx_pmoeqlizzljqpewrleclpnagjmgeuaqsuykl` (`handle`),
  KEY `idx_vxykxojbftczsrtggcvvlysqyscuoesxmpjs` (`fieldLayoutId`),
  KEY `idx_fgqocgnfchedtyekmtbcvqazvlozbjstqgme` (`sortOrder`),
  CONSTRAINT `fk_nfnkokzyeqummohyxpurqxnzgrrxpbefuvph` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qwyyqeqeuplfzvjohtoqikslqlspsxhrbdvc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `idx_etzmmhhrhdenxhxeghikkgbewdvtufkgyxzm` (`accessToken`),
  UNIQUE KEY `idx_tazotjhgoktbhrbwzujjdgtblluiwqvsiwiz` (`name`),
  KEY `fk_utkmkbprtiuhlmvkjqapwljagawcctoyqxpe` (`schemaId`),
  CONSTRAINT `fk_utkmkbprtiuhlmvkjqapwljagawcctoyqxpe` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
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
  KEY `idx_peumgaoafcnzklkfkthnekkruzuwvxjxsmtq` (`assetId`,`transformString`)
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
  KEY `idx_qbeotigvgeojhnwyqshmoharpewsljauqfsy` (`name`),
  KEY `idx_eupmvbcyquvcmmixlwialhxneazmqqjfldwz` (`handle`)
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
  UNIQUE KEY `idx_pczevxuqbqlhtbyihhbusnaujzfboprioyqr` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  UNIQUE KEY `idx_ervkubuzmxyjxmzskctgigdeqepcozxjebsr` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  KEY `idx_iernhjcdxihcqatvfqoyjhtwbhuuznmbyzne` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_neamloadnuosdcfhnjunsbzfzkfzrxyxeqdo` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  UNIQUE KEY `idx_jvuvpehuowrgltomewofxfoulyecthsmgihd` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_kvlquyefkhptywtidqybwcpvhftgnrjwqqlw` (`sourceId`),
  KEY `idx_wwbqffhdhzkegphnconcpydsmjozsfdudety` (`targetId`),
  KEY `idx_dqmevkoqdafuecewegdppvgxwjpazjftpypt` (`sourceSiteId`),
  CONSTRAINT `fk_dsrmhmvcohjplgqvfdsopjliocqpzdlmcine` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_igsfcuwaysinrwqskuhxntvlnnlhsdahtzen` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kztlehzxxbxoetereqxqzpwdwoqlogxokhpl` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  UNIQUE KEY `idx_hcvscmzjceccjrvutydvgxpmktanlmwspylw` (`canonicalId`,`num`),
  KEY `fk_bbtjgbdtqlieegcapavptugvtbmohxgcgprl` (`creatorId`),
  CONSTRAINT `fk_bbtjgbdtqlieegcapavptugvtbmohxgcgprl` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lhhvjsfpdyjiausuapduzhwpqnllbldvziqh` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  FULLTEXT KEY `idx_kljycetvxisaqktiwzumwvhdmysopkysmewu` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue`
--

DROP TABLE IF EXISTS `searchindexqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindexqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gnsdloaztrkosqmcexoqjlrzgumhgbkqcrcw` (`elementId`,`siteId`,`reserved`),
  CONSTRAINT `fk_mmlyrqkwwdjqxodsvkwesudrijqiicukfter` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue_fields`
--

DROP TABLE IF EXISTS `searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_mbuckephpciyobnhkunuxrpymtaakipzendc` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_ypxgmsmrlynqmbebchdmcwjfaxhzovdwkqcq` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
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
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vtpulnaetegpvukiburkzvlbslfheqianzbj` (`handle`),
  KEY `idx_srkrybdxaiwxvpnihphybcpeanixseiesggw` (`name`),
  KEY `idx_aovwkditbdbovjcjtqhyuxnyvlxkexdjsgzt` (`structureId`),
  KEY `idx_ldeqpgjlpqsgfogossyiofbuvhbqrivmjexu` (`dateDeleted`),
  CONSTRAINT `fk_dpqwaifnmmoxufsnqtuljxjlnacmsrjbbwgo` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_cixprfhremigzvbphlslfguxyqeisnfcbgsk` (`typeId`),
  CONSTRAINT `fk_cixprfhremigzvbphlslfguxyqeisnfcbgsk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ngvrggogpmhkshwdzcfamgmoeiwovbxyxolb` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `idx_awivpyurrbdlvynhetfryypxlcnpgfpyonpg` (`sectionId`,`siteId`),
  KEY `idx_huwcpslbcxkubtsdlxovibqmumqsezdfrhep` (`siteId`),
  CONSTRAINT `fk_viarvlxvrlvdlaxhxveoxzhejqmdpppbmrdm` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xheaxgmeuyozxjjorqoccvphyxhflmyvycuy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  KEY `idx_epdysiopxzbufchawkoxizzhgjxjxtzlvsno` (`uid`),
  KEY `idx_qsvvjbzdinqrianbtzdxfwqgkmjtppnuvlcw` (`token`),
  KEY `idx_jnbkwtjwatbkehfsraaymbqojseszrykzmbr` (`dateUpdated`),
  KEY `idx_jmrqxzfjyyrwwomuffjicdytcnjeoaktjdcs` (`userId`),
  CONSTRAINT `fk_yiwggfbdqtcwhjqhkvzfqtvdnmypqftmcgao` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  UNIQUE KEY `idx_qudeapgapmclbafjorihshrxebuvdjizuyon` (`userId`,`message`),
  CONSTRAINT `fk_dgkuobhfykbwrcsoozujqoniftgxzajcxalt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
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
  KEY `idx_twjxjqxbblpizgtkkiavlctqmqlqdjrcwvfg` (`name`)
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
  KEY `idx_dwcpcednbvvurbjxymwemrxdnwxoipeubuwh` (`dateDeleted`),
  KEY `idx_cihkmupsqxvdlhfmldvjrgbvcqracslnvfws` (`handle`),
  KEY `idx_yamicovpisnildbajtignlwsbvspqirdaizk` (`sortOrder`),
  KEY `fk_giwtxbwrgadgdlwlrfikmcsvtryynpnvzxcu` (`groupId`),
  CONSTRAINT `fk_giwtxbwrgadgdlwlrfikmcsvtryynpnvzxcu` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  KEY `fk_vybslbpwmurfyebqspwstghdwyadegoivpjt` (`userId`),
  CONSTRAINT `fk_vybslbpwmurfyebqspwstghdwyadegoivpjt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `idx_qqhknqlaqlrihhbaskzvdpnfjkwdozrkodgl` (`structureId`,`elementId`),
  KEY `idx_hkbiyeraglsqrsovfqlauuwcoaytgnccpkun` (`root`),
  KEY `idx_poaeoiwfkczpkbbjzcpubcmvyicehdcjlzoc` (`lft`),
  KEY `idx_yblumfndwomclcjwhzsxunpoogflhtufhoxb` (`rgt`),
  KEY `idx_mvzqrkwbllnejqsmbdpelbszulsquubdlynr` (`level`),
  KEY `idx_gykvmlqbiooggmpuzjusofosgbyutpwtnrzt` (`elementId`),
  CONSTRAINT `fk_cyybnkuapsljvxkpojpwfgsspfiyfkubufoy` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  KEY `idx_ooxpvwgdrjdyupnncfbbbhbfgclzyaglprrg` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  UNIQUE KEY `idx_lhpyuophbbiuuargptwodlepezsrtrlppjtj` (`key`,`language`),
  KEY `idx_xevfiuxgtpyndftnflnilrorxumjqsdpzhvf` (`language`)
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
  KEY `idx_kmhqedyetfmnobabguxvfymdgrktoengmabr` (`name`),
  KEY `idx_uvuqksisfvcnnsdjrxiodksfgzumhwthyhfo` (`handle`),
  KEY `idx_dmnxkgqjjfwyqrutzzcrynszqsoukkdimbvh` (`dateDeleted`),
  KEY `fk_zakghcehgmbfhzgmkydolexwhgtjqwmkjvop` (`fieldLayoutId`),
  CONSTRAINT `fk_zakghcehgmbfhzgmkydolexwhgtjqwmkjvop` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
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
  KEY `idx_nwwieulfqcqsdvpwccajbvbepxlprcicloyq` (`groupId`),
  CONSTRAINT `fk_bmloqbdwqfgbgzijiytocblamjsboauzewoo` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lakerdvsrtoxzqmdongdvottlkoxisedlpaa` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `idx_vzsavoeywgmxleisptmtyufzmjamemexlaei` (`token`),
  KEY `idx_fldzojigcngfmshwfuuutokyxpedynaownyl` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  KEY `idx_xndxbctkuacggmpunetubwsgdilcbuniilyh` (`handle`),
  KEY `idx_jvbiaubzaappkydquxhhvemradauuuzpmbcj` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  UNIQUE KEY `idx_yzjjzbqafoqapjzimjeptcxuedxcwmhcbfnl` (`groupId`,`userId`),
  KEY `idx_cxbwzbqygatkqaqcovyuwfkbjzfwfkrgkqtm` (`userId`),
  CONSTRAINT `fk_fbptrinwhydyasodouiegkzjhnrmpfvtijpb` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wrzvvuxhmakbtdeiuqmkloggmuabeseknwow` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  UNIQUE KEY `idx_fqadnrckpklfbehhtldzouhkponwuzmnuvug` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  UNIQUE KEY `idx_hlaazahqlrsquwspxtlerzmazswfybcoosaz` (`permissionId`,`groupId`),
  KEY `idx_negchhankprcrxoxgbpryuiwpnfmtltwytfo` (`groupId`),
  CONSTRAINT `fk_qyccpnasvkejalvsxvibuurqsagcgrtxsolg` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ulfjbhzbfhfdhbufbubpgdzhxepshkuvyuvo` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  UNIQUE KEY `idx_sudoneovhpssxcfozidlgghutecupdlymzyy` (`permissionId`,`userId`),
  KEY `idx_owefkjscdxsrchcktadpjflxpecmjoqjroxq` (`userId`),
  CONSTRAINT `fk_rilqwnttiptsydnnwdsxbmcrjauorskrfvid` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uhnsbntdbbpauakgcydprkdafosqakajjkeo` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
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
  CONSTRAINT `fk_sbcqkjwubkgrcapxyertjmqdjlcpklroqele` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
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
  `affiliatedSiteId` int DEFAULT NULL,
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
  KEY `idx_cbtszesmohwzszizadgdgjxxuebwzcrpvjeo` (`active`),
  KEY `idx_yesmilyoxmpxujohtwgpyeznilmghzjrgcvl` (`locked`),
  KEY `idx_jwruiupxnurpeptotqmrbokhxyfjajynimdg` (`pending`),
  KEY `idx_wtyozqtyhoarssnkgfdpagydmbnavxkdizin` (`suspended`),
  KEY `idx_mabihvutytmmownasjpvjifjsdjpsxtcxowu` (`verificationCode`),
  KEY `idx_edhmgxvimaahlvpwcaqtwaztrpjuqrwhjtpl` (`email`),
  KEY `idx_ckbauzktdyruyansuvsivcaqdpuvmvmtcapn` (`username`),
  KEY `fk_ljbhgakofsmejmeabylgjvjmrqqaxsljayjd` (`photoId`),
  KEY `fk_uceuyqybdovndwqgdkprludcdbncwvsqieht` (`affiliatedSiteId`),
  CONSTRAINT `fk_leauxxlxyztrdahetazpgpwxvnuwzwikdgqh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ljbhgakofsmejmeabylgjvjmrqqaxsljayjd` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_uceuyqybdovndwqgdkprludcdbncwvsqieht` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL
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
  UNIQUE KEY `idx_bgmxairaskijcrsvwukqrypdhqqvzblcoikx` (`name`,`parentId`,`volumeId`),
  KEY `idx_aldzlcqdtgcbwqvbxljhdjioiknruqyycytr` (`parentId`),
  KEY `idx_uncymiebtfpfnppqpyfvwtsgfgvnlgkqktgb` (`volumeId`),
  CONSTRAINT `fk_cyctxwynhsdtkqnixvhlnplydsxmknrsuukw` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vosgqxhjvfercoxkrroptcoltkgohkaccvag` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  KEY `idx_sqfnbpwjjtaiwndzlumdhdeygpuzagyqpymx` (`name`),
  KEY `idx_ghyrlojyefcbmgnygdvazyulqmscvhgrkmch` (`handle`),
  KEY `idx_dbhzxtkuwrrvdplwwvajvmzyljvlkmdlocrs` (`fieldLayoutId`),
  KEY `idx_ziybptsrdphcyonrjrjzsnyqlcqcschvxfro` (`dateDeleted`),
  CONSTRAINT `fk_adhcszbvfcnmtyogaqxzxnrhrdkkkkjaxhgt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
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
  KEY `fk_iidppprpekbwnizukraqhtnmahrdsyevttsr` (`userId`),
  CONSTRAINT `fk_iidppprpekbwnizukraqhtnmahrdsyevttsr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
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
  KEY `idx_pvrupczwbxnuxupbdgqxineofftqeptcmwqp` (`userId`),
  CONSTRAINT `fk_zraodzvvjduqtbdckhrhsrdayrondxfqugbt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
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

-- Dump completed on 2025-08-31  3:15:43
-- MariaDB dump 10.19  Distrib 10.5.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `bulkopevents`
--

LOCK TABLES `bulkopevents` WRITE;
/*!40000 ALTER TABLE `bulkopevents` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `bulkopevents` ENABLE KEYS */;
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
INSERT INTO `changedattributes` VALUES (3,1,'email','2025-08-31 01:21:25',0,1),(3,1,'firstName','2025-08-31 01:21:25',0,1),(3,1,'fullName','2025-08-31 01:21:25',0,1),(3,1,'username','2025-08-31 01:21:25',0,1),(7,1,'postDate','2025-08-31 01:23:14',0,1),(7,1,'slug','2025-08-31 01:23:15',0,1),(7,1,'title','2025-08-31 01:23:14',0,1),(7,1,'uri','2025-08-31 01:23:15',0,1),(12,1,'postDate','2025-08-31 01:38:17',0,1),(12,1,'slug','2025-08-31 01:38:10',0,1),(12,1,'title','2025-08-31 01:38:10',0,1),(12,1,'uri','2025-08-31 01:38:10',0,1),(16,1,'postDate','2025-08-31 01:42:19',0,1),(16,1,'slug','2025-08-31 01:42:02',0,1),(16,1,'title','2025-08-31 01:42:02',0,1),(16,1,'uri','2025-08-31 01:42:02',0,1),(18,1,'postDate','2025-08-31 01:42:29',0,1),(18,1,'slug','2025-08-31 01:42:29',0,1),(18,1,'title','2025-08-31 01:42:29',0,1),(18,1,'uri','2025-08-31 01:42:29',0,1),(22,1,'slug','2025-08-31 01:57:16',0,1),(22,1,'title','2025-08-31 01:57:16',0,1),(22,1,'uri','2025-08-31 01:57:16',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (7,1,1,'ead1c954-804b-484f-acc2-8a43dffcdbd2','2025-08-31 01:23:21',0,1),(7,1,3,'723a5240-8ac5-4422-9a6e-ae5fcf84e2d9','2025-08-31 01:22:55',0,1),(7,1,9,'530ca557-da49-42b0-9f04-76638ed1323e','2025-08-31 01:38:23',0,1),(7,1,10,'5957c527-1bd2-4ef0-a557-bec42573c65c','2025-08-31 01:38:23',0,1),(12,1,2,'451526d9-0093-4ac3-abba-3b4689df9674','2025-08-31 01:38:10',0,1),(12,1,4,'1ee68bcf-204a-413d-bd03-289bd14abeb0','2025-08-31 01:38:12',0,1),(12,1,4,'3e78520b-d7d6-4712-86e2-529ed0f53886','2025-08-31 01:38:16',0,1),(16,1,11,'a16c4b3d-d7fc-4c9a-80ad-5b1f89f2c852','2025-08-31 01:42:19',0,1),(18,1,11,'a16c4b3d-d7fc-4c9a-80ad-5b1f89f2c852','2025-08-31 01:42:29',0,1),(20,1,5,'dc7118d1-b85c-444a-8386-44e7c42fab84','2025-08-31 01:42:38',0,1),(20,1,10,'5957c527-1bd2-4ef0-a557-bec42573c65c','2025-08-31 01:58:59',0,1),(22,1,4,'1ee68bcf-204a-413d-bd03-289bd14abeb0','2025-08-31 01:57:16',0,1),(22,1,4,'3e78520b-d7d6-4712-86e2-529ed0f53886','2025-08-31 01:57:16',0,1);
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
INSERT INTO `drafts` VALUES (1,NULL,1,0,'First draft',NULL,0,NULL,0),(3,NULL,1,0,'First draft',NULL,0,NULL,0),(4,NULL,1,0,'First draft',NULL,0,NULL,0),(5,NULL,1,0,'First draft',NULL,0,NULL,0),(10,NULL,1,0,'First draft',NULL,0,NULL,0),(13,7,1,1,'Draft 1','',1,NULL,1),(14,NULL,1,0,'First draft',NULL,0,NULL,0),(15,NULL,1,0,'First draft','',0,NULL,1);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (1,1,1,NULL,'view','2025-08-31 01:28:36'),(3,1,1,NULL,'save','2025-08-31 01:21:26'),(3,1,1,NULL,'view','2025-08-31 01:22:35'),(4,1,1,NULL,'view','2025-08-31 01:21:30'),(5,1,1,NULL,'view','2025-08-31 01:22:13'),(6,1,1,NULL,'view','2025-08-31 01:22:21'),(7,1,1,NULL,'edit','2025-08-31 01:58:59'),(7,1,1,NULL,'save','2025-08-31 01:38:23'),(7,1,1,NULL,'view','2025-08-31 02:01:54'),(12,1,1,NULL,'save','2025-08-31 01:38:17'),(12,1,1,NULL,'view','2025-08-31 01:56:36'),(15,1,1,NULL,'view','2025-08-31 01:39:07'),(16,1,1,NULL,'save','2025-08-31 01:42:19'),(16,1,1,NULL,'view','2025-08-31 01:43:48'),(18,1,1,NULL,'save','2025-08-31 01:42:29'),(18,1,1,NULL,'view','2025-08-31 01:42:29'),(21,1,1,NULL,'view','2025-08-31 01:52:56'),(22,1,1,NULL,'save','2025-08-31 01:57:16'),(22,1,1,NULL,'view','2025-08-31 01:57:15');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2025-08-31 01:15:12','2025-08-31 01:15:12',NULL,NULL,NULL,'b5a1631a-b1dc-4cf5-b5b5-db493127a942'),(2,NULL,1,NULL,1,'craft\\elements\\Entry',1,0,'2025-08-31 01:18:43','2025-08-31 01:18:43',NULL,NULL,NULL,'449dfb14-a775-4b55-a4dd-b3f0a2ba530e'),(3,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2025-08-31 01:21:09','2025-08-31 01:21:26',NULL,NULL,NULL,'7172ad9a-0193-4184-9262-cecc5c834e02'),(4,NULL,3,NULL,1,'craft\\elements\\Entry',1,0,'2025-08-31 01:21:29','2025-08-31 01:21:29',NULL,NULL,NULL,'15549ddb-5409-4412-a916-8f3620a8bd79'),(5,NULL,4,NULL,1,'craft\\elements\\Entry',1,0,'2025-08-31 01:22:13','2025-08-31 01:22:13',NULL,NULL,NULL,'67c3b254-0cb3-4834-a616-ab2f71e43d08'),(6,NULL,5,NULL,NULL,'craft\\elements\\User',1,0,'2025-08-31 01:22:21','2025-08-31 01:22:21',NULL,NULL,NULL,'e66dc686-c18a-471b-aa60-6b2b6ba15c32'),(7,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-08-31 01:22:52','2025-08-31 01:38:23',NULL,NULL,NULL,'b9dae5e9-5359-45a6-bcb8-836ab299a93e'),(8,7,NULL,1,1,'craft\\elements\\Entry',1,0,'2025-08-31 01:23:15','2025-08-31 01:23:15',NULL,NULL,NULL,'1be8ae20-38f6-4507-94f2-b8faa4c06576'),(10,7,NULL,2,1,'craft\\elements\\Entry',1,0,'2025-08-31 01:23:21','2025-08-31 01:23:21',NULL,NULL,NULL,'492e641a-c996-454a-98dd-ebe498acc170'),(12,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-08-31 01:38:02','2025-08-31 01:38:17',NULL,NULL,NULL,'fb1fabaa-fa93-46ec-ba55-efaa53155c26'),(13,12,NULL,3,2,'craft\\elements\\Entry',1,0,'2025-08-31 01:38:17','2025-08-31 01:38:17',NULL,NULL,NULL,'e12e6402-722d-4019-9c67-8c8be5aac86e'),(14,7,NULL,4,1,'craft\\elements\\Entry',1,0,'2025-08-31 01:38:23','2025-08-31 01:38:23',NULL,NULL,NULL,'97cb0b2f-a2dc-46e0-bd40-14143a235777'),(15,NULL,10,NULL,1,'craft\\elements\\Entry',1,0,'2025-08-31 01:39:06','2025-08-31 01:39:06',NULL,NULL,NULL,'764edded-6c78-4bae-ab65-1610b6cb7aa2'),(16,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-08-31 01:41:55','2025-08-31 01:42:19',NULL,NULL,NULL,'f590ca9a-5b38-4363-bf94-66272f6c32ae'),(17,16,NULL,5,3,'craft\\elements\\Entry',1,0,'2025-08-31 01:42:19','2025-08-31 01:42:19',NULL,NULL,NULL,'547edfea-35b5-4b3b-a3d0-6d91a99834fc'),(18,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-08-31 01:42:22','2025-08-31 01:42:29',NULL,NULL,NULL,'4239e43d-cc42-4f74-869b-116fa26a0b80'),(19,18,NULL,6,3,'craft\\elements\\Entry',1,0,'2025-08-31 01:42:29','2025-08-31 01:42:29',NULL,NULL,NULL,'d4eeae44-791e-42dd-9b71-54a4e4715f44'),(20,7,13,NULL,1,'craft\\elements\\Entry',1,0,'2025-08-31 01:42:38','2025-08-31 01:58:59',NULL,NULL,NULL,'87707b30-f62b-4dbd-ba42-f7ae99143883'),(21,NULL,14,NULL,1,'craft\\elements\\Entry',1,0,'2025-08-31 01:52:56','2025-08-31 01:52:56',NULL,NULL,NULL,'b7dbaf51-1f14-4bdc-9527-87717bec2c5c'),(22,NULL,15,NULL,2,'craft\\elements\\Entry',1,0,'2025-08-31 01:57:14','2025-08-31 01:57:16',NULL,NULL,NULL,'622d68b6-60e1-4297-9170-7e6b12930458');
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
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2025-08-31 01:15:12','2025-08-31 01:15:12','6a7cab00-e136-4b80-8301-afc38129c190'),(2,2,1,NULL,'__temp_fmznnjqlkmkhipvvcvymulowyqqeipzgfkkt','bookings/__temp_fmznnjqlkmkhipvvcvymulowyqqeipzgfkkt',NULL,1,'2025-08-31 01:18:43','2025-08-31 01:18:43','8ad75fd8-97d9-4363-bee5-a4ea5fff9892'),(3,3,1,NULL,NULL,NULL,NULL,1,'2025-08-31 01:21:09','2025-08-31 01:21:09','5da4b062-9eb1-4e44-822a-a7520fcfea67'),(4,4,1,NULL,'__temp_buzluegxdrsgygnjvzgcgfogowaoaxbarvoy','bookings/__temp_buzluegxdrsgygnjvzgcgfogowaoaxbarvoy',NULL,1,'2025-08-31 01:21:29','2025-08-31 01:21:29','ea8054c3-5e5f-42a3-97e3-1d6b6b9825ab'),(5,5,1,NULL,'__temp_rfiudwieeomgbrqwagijejtisrlzlazwwujg','bookings/__temp_rfiudwieeomgbrqwagijejtisrlzlazwwujg',NULL,1,'2025-08-31 01:22:13','2025-08-31 01:22:13','b1bf88bd-21a7-4442-926c-3f65c735e0aa'),(6,6,1,NULL,NULL,NULL,NULL,1,'2025-08-31 01:22:21','2025-08-31 01:22:21','8d1ea985-63a9-489b-a138-95bfcdcd66ff'),(7,7,1,'Test','test','bookings/test','{\"4b48f646-6a5b-4872-a6e3-3318268a854d\": [], \"530ca557-da49-42b0-9f04-76638ed1323e\": \"00:40:00\", \"5957c527-1bd2-4ef0-a557-bec42573c65c\": [12], \"723a5240-8ac5-4422-9a6e-ae5fcf84e2d9\": [3], \"ead1c954-804b-484f-acc2-8a43dffcdbd2\": {\"date\": \"2025-08-09 07:00:00\"}}',1,'2025-08-31 01:22:52','2025-08-31 01:38:23','4f1e394b-5e2e-45b2-b0f4-38b57bb4087a'),(8,8,1,'Test','test','bookings/test','{\"723a5240-8ac5-4422-9a6e-ae5fcf84e2d9\": [3]}',1,'2025-08-31 01:23:15','2025-08-31 01:23:15','9b3fe042-dc95-49ff-a077-1168b4fdea69'),(10,10,1,'Test','test','bookings/test','{\"723a5240-8ac5-4422-9a6e-ae5fcf84e2d9\": [3], \"ead1c954-804b-484f-acc2-8a43dffcdbd2\": {\"date\": \"2025-08-09 07:00:00\"}}',1,'2025-08-31 01:23:21','2025-08-31 01:23:21','40e2f63a-4758-4c5d-9d1c-615acd4e3f5d'),(12,12,1,'Tested','tested','invoices/tested','{\"1ee68bcf-204a-413d-bd03-289bd14abeb0\": {\"date\": \"2025-09-25 07:00:00\"}, \"3e78520b-d7d6-4712-86e2-529ed0f53886\": {\"date\": \"2025-09-13 07:00:00\"}, \"451526d9-0093-4ac3-abba-3b4689df9674\": \"5566\"}',1,'2025-08-31 01:38:02','2025-08-31 01:38:16','cd87ddbb-080e-4894-b28b-bd647a6d36ec'),(13,13,1,'Tested','tested','invoices/tested','{\"1ee68bcf-204a-413d-bd03-289bd14abeb0\": {\"date\": \"2025-09-25 07:00:00\"}, \"3e78520b-d7d6-4712-86e2-529ed0f53886\": {\"date\": \"2025-09-13 07:00:00\"}, \"451526d9-0093-4ac3-abba-3b4689df9674\": \"5566\"}',1,'2025-08-31 01:38:17','2025-08-31 01:38:17','425e4d01-b0a3-4d2a-b99b-c5b47152e31b'),(14,14,1,'Test','test','bookings/test','{\"530ca557-da49-42b0-9f04-76638ed1323e\": \"00:40:00\", \"5957c527-1bd2-4ef0-a557-bec42573c65c\": [12], \"723a5240-8ac5-4422-9a6e-ae5fcf84e2d9\": [3], \"ead1c954-804b-484f-acc2-8a43dffcdbd2\": {\"date\": \"2025-08-09 07:00:00\"}}',1,'2025-08-31 01:38:23','2025-08-31 01:38:23','2a1039ce-d44d-467b-8653-0b826a110f6b'),(15,15,1,NULL,'__temp_zinqherqvoxkpkchdhdvpjwymegsxavkofdc','bookings/__temp_zinqherqvoxkpkchdhdvpjwymegsxavkofdc',NULL,1,'2025-08-31 01:39:06','2025-08-31 01:39:06','4d7dd14b-409d-4d9f-9df2-4b099e8bb111'),(16,16,1,'Booking Confirmed','booking-confirmed','user-messages/booking-confirmed','{\"a16c4b3d-d7fc-4c9a-80ad-5b1f89f2c852\": \"Assertively syndicate alternative alignments vis-a-vis front-end platforms. Authoritatively empower flexible growth strategies without backward-compatible portals. Continually maximize resource-leveling core competencies via 24/365 web-readiness. Conveniently restore enterprise quality vectors with customized technologies. Monotonectally benchmark progressive interfaces with dynamic services.\\n\\nRapidiously recaptiualize open-source convergence through long-term high-impact.\\nAssertively syndicate alternative alignments vis-a-vis front-end platforms. Authoritatively empower flexible growth strategies without backward-compatible portals. Continually maximize resource-leveling core competencies via 24/365 web-readiness. Conveniently restore enterprise quality vectors with customized technologies. Monotonectally benchmark progressive interfaces with dynamic services.\\n\\nRapidiously recaptiualize open-source convergence through long-term high-impact.\\nAssertively syndicate alternative alignments vis-a-vis front-end platforms. Authoritatively empower flexible growth strategies without backward-compatible portals. Continually maximize resource-leveling core competencies via 24/365 web-readiness. Conveniently restore enterprise quality vectors with customized technologies. Monotonectally benchmark progressive interfaces with dynamic services.\\n\\nRapidiously recaptiualize open-source convergence through long-term high-impact.\"}',1,'2025-08-31 01:41:55','2025-08-31 01:42:19','3b21bb69-b88a-4079-ab3c-9737aed2c24f'),(17,17,1,'Booking Confirmed','booking-confirmed','user-messages/booking-confirmed','{\"a16c4b3d-d7fc-4c9a-80ad-5b1f89f2c852\": \"Assertively syndicate alternative alignments vis-a-vis front-end platforms. Authoritatively empower flexible growth strategies without backward-compatible portals. Continually maximize resource-leveling core competencies via 24/365 web-readiness. Conveniently restore enterprise quality vectors with customized technologies. Monotonectally benchmark progressive interfaces with dynamic services.\\n\\nRapidiously recaptiualize open-source convergence through long-term high-impact.\\nAssertively syndicate alternative alignments vis-a-vis front-end platforms. Authoritatively empower flexible growth strategies without backward-compatible portals. Continually maximize resource-leveling core competencies via 24/365 web-readiness. Conveniently restore enterprise quality vectors with customized technologies. Monotonectally benchmark progressive interfaces with dynamic services.\\n\\nRapidiously recaptiualize open-source convergence through long-term high-impact.\\nAssertively syndicate alternative alignments vis-a-vis front-end platforms. Authoritatively empower flexible growth strategies without backward-compatible portals. Continually maximize resource-leveling core competencies via 24/365 web-readiness. Conveniently restore enterprise quality vectors with customized technologies. Monotonectally benchmark progressive interfaces with dynamic services.\\n\\nRapidiously recaptiualize open-source convergence through long-term high-impact.\"}',1,'2025-08-31 01:42:19','2025-08-31 01:42:19','e9130748-719f-4841-a406-541101f78604'),(18,18,1,'Boobkinfg Canclked','boobkinfg-canclked','user-messages/boobkinfg-canclked','{\"a16c4b3d-d7fc-4c9a-80ad-5b1f89f2c852\": \"Assertively syndicate alternative alignments vis-a-vis front-end platforms. Authoritatively empower flexible growth strategies without backward-compatible portals. Continually maximize resource-leveling core competencies via 24/365 web-readiness. Conveniently restore enterprise quality vectors with customized technologies. Monotonectally benchmark progressive interfaces with dynamic services.\\n\\nRapidiously recaptiualize open-source convergence through long-term high-impact.Assertively syndicate alternative alignments vis-a-vis front-end platforms. Authoritatively empower flexible growth strategies without backward-compatible portals. Continually maximize resource-leveling core competencies via 24/365 web-readiness. Conveniently restore enterprise quality vectors with customized technologies. Monotonectally benchmark progressive interfaces with dynamic services.\\n\\nRapidiously recaptiualize open-source convergence through long-term high-impact.Assertively syndicate alternative alignments vis-a-vis front-end platforms. Authoritatively empower flexible growth strategies without backward-compatible portals. Continually maximize resource-leveling core competencies via 24/365 web-readiness. Conveniently restore enterprise quality vectors with customized technologies. Monotonectally benchmark progressive interfaces with dynamic services.\\n\\nRapidiously recaptiualize open-source convergence through long-term high-impact.\"}',1,'2025-08-31 01:42:22','2025-08-31 01:42:29','7f97f9e9-9d4b-4880-87b5-dc86c5d3c6e7'),(19,19,1,'Boobkinfg Canclked','boobkinfg-canclked','user-messages/boobkinfg-canclked','{\"a16c4b3d-d7fc-4c9a-80ad-5b1f89f2c852\": \"Assertively syndicate alternative alignments vis-a-vis front-end platforms. Authoritatively empower flexible growth strategies without backward-compatible portals. Continually maximize resource-leveling core competencies via 24/365 web-readiness. Conveniently restore enterprise quality vectors with customized technologies. Monotonectally benchmark progressive interfaces with dynamic services.\\n\\nRapidiously recaptiualize open-source convergence through long-term high-impact.Assertively syndicate alternative alignments vis-a-vis front-end platforms. Authoritatively empower flexible growth strategies without backward-compatible portals. Continually maximize resource-leveling core competencies via 24/365 web-readiness. Conveniently restore enterprise quality vectors with customized technologies. Monotonectally benchmark progressive interfaces with dynamic services.\\n\\nRapidiously recaptiualize open-source convergence through long-term high-impact.Assertively syndicate alternative alignments vis-a-vis front-end platforms. Authoritatively empower flexible growth strategies without backward-compatible portals. Continually maximize resource-leveling core competencies via 24/365 web-readiness. Conveniently restore enterprise quality vectors with customized technologies. Monotonectally benchmark progressive interfaces with dynamic services.\\n\\nRapidiously recaptiualize open-source convergence through long-term high-impact.\"}',1,'2025-08-31 01:42:29','2025-08-31 01:42:29','05df6d3d-e2c6-42a9-afe3-dbd960e67c3a'),(20,20,1,'Test','test','bookings/test','{\"530ca557-da49-42b0-9f04-76638ed1323e\": \"00:40:00\", \"5957c527-1bd2-4ef0-a557-bec42573c65c\": [12], \"723a5240-8ac5-4422-9a6e-ae5fcf84e2d9\": [3], \"dc7118d1-b85c-444a-8386-44e7c42fab84\": \"complete\", \"ead1c954-804b-484f-acc2-8a43dffcdbd2\": {\"date\": \"2025-08-09 07:00:00\"}}',1,'2025-08-31 01:42:38','2025-08-31 01:58:59','d21725e3-74eb-44f2-9381-c5415cbba66a'),(21,21,1,NULL,'__temp_joldlzwtgpjelxlrujbwqajvxhjbcmhzvzjc','bookings/__temp_joldlzwtgpjelxlrujbwqajvxhjbcmhzvzjc',NULL,1,'2025-08-31 01:52:56','2025-08-31 01:52:56','0188f5c8-6648-441b-9bbc-0839e0454db5'),(22,22,1,'c','c','invoices/c',NULL,1,'2025-08-31 01:57:14','2025-08-31 01:57:16','b9c78470-3377-4343-9e76-b031d4cb244c');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,NULL,NULL,1,'2025-08-31 01:18:43',NULL,'live',NULL,NULL,'2025-08-31 01:18:43','2025-08-31 01:18:43'),(4,1,NULL,NULL,NULL,1,'2025-08-31 01:21:29',NULL,'live',NULL,NULL,'2025-08-31 01:21:29','2025-08-31 01:21:29'),(5,1,NULL,NULL,NULL,1,'2025-08-31 01:22:13',NULL,'live',NULL,NULL,'2025-08-31 01:22:13','2025-08-31 01:22:13'),(7,1,NULL,NULL,NULL,1,'2025-08-31 01:23:00',NULL,'live',NULL,NULL,'2025-08-31 01:22:52','2025-08-31 01:23:14'),(8,1,NULL,NULL,NULL,1,'2025-08-31 01:23:00',NULL,'live',NULL,NULL,'2025-08-31 01:23:15','2025-08-31 01:23:15'),(10,1,NULL,NULL,NULL,1,'2025-08-31 01:23:00',NULL,'live',NULL,NULL,'2025-08-31 01:23:21','2025-08-31 01:23:21'),(12,2,NULL,NULL,NULL,2,'2025-08-31 01:38:00',NULL,'live',NULL,NULL,'2025-08-31 01:38:02','2025-08-31 01:38:17'),(13,2,NULL,NULL,NULL,2,'2025-08-31 01:38:00',NULL,'live',NULL,NULL,'2025-08-31 01:38:17','2025-08-31 01:38:17'),(14,1,NULL,NULL,NULL,1,'2025-08-31 01:23:00',NULL,'live',NULL,NULL,'2025-08-31 01:38:23','2025-08-31 01:38:23'),(15,1,NULL,NULL,NULL,1,'2025-08-31 01:39:06',NULL,'live',NULL,NULL,'2025-08-31 01:39:06','2025-08-31 01:39:06'),(16,3,NULL,NULL,NULL,3,'2025-08-31 01:42:00',NULL,'live',NULL,NULL,'2025-08-31 01:41:55','2025-08-31 01:42:19'),(17,3,NULL,NULL,NULL,3,'2025-08-31 01:42:00',NULL,'live',NULL,NULL,'2025-08-31 01:42:19','2025-08-31 01:42:19'),(18,3,NULL,NULL,NULL,3,'2025-08-31 01:42:00',NULL,'live',NULL,NULL,'2025-08-31 01:42:22','2025-08-31 01:42:29'),(19,3,NULL,NULL,NULL,3,'2025-08-31 01:42:00',NULL,'live',NULL,NULL,'2025-08-31 01:42:29','2025-08-31 01:42:29'),(20,1,NULL,NULL,NULL,1,'2025-08-31 01:23:00',NULL,'live',NULL,NULL,'2025-08-31 01:42:38','2025-08-31 01:42:38'),(21,1,NULL,NULL,NULL,1,'2025-08-31 01:52:56',NULL,'live',NULL,NULL,'2025-08-31 01:52:56','2025-08-31 01:52:56'),(22,2,NULL,NULL,NULL,2,'2025-08-31 01:57:14',NULL,'live',NULL,NULL,'2025-08-31 01:57:14','2025-08-31 01:57:14');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES (2,1,1),(4,1,1),(5,1,1),(7,1,1),(8,1,1),(10,1,1),(12,1,1),(13,1,1),(14,1,1),(15,1,1),(16,1,1),(17,1,1),(18,1,1),(19,1,1),(20,1,1),(21,1,1),(22,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'Bookings','bookings',NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-08-31 01:17:19','2025-08-31 01:17:19',NULL,'546b5180-0a10-4e0f-af11-62d612a9d04b'),(2,2,'Invoices','invoices',NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-08-31 01:25:03','2025-08-31 01:25:03',NULL,'6daa3ceb-95bd-4544-9173-a67cf9d06f59'),(3,3,'messages','messages',NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-08-31 01:41:47','2025-08-31 01:41:47',NULL,'06d7311a-370e-4367-ab47-4e38c4245b8d');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"f38d5bc6-f40f-4024-aeba-4b684017923d\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"b4ddfac3-e498-446a-98a5-8043aaa6f0b6\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-08-31T01:14:28+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"ead1c954-804b-484f-acc2-8a43dffcdbd2\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"06c03878-9272-4d84-b169-8f626e1460b9\", \"required\": false, \"dateAdded\": \"2025-08-31T01:17:19+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"723a5240-8ac5-4422-9a6e-ae5fcf84e2d9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"89b426b3-21f6-40a6-8196-7c0190f3025f\", \"required\": false, \"dateAdded\": \"2025-08-31T01:22:10+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"dc7118d1-b85c-444a-8386-44e7c42fab84\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"c82f4a2f-91e1-4a48-a283-7c1b36412880\", \"required\": false, \"dateAdded\": \"2025-08-31T01:35:30+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"4b48f646-6a5b-4872-a6e3-3318268a854d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"44081ed8-d13f-41bd-b5b8-783a94f34705\", \"required\": false, \"dateAdded\": \"2025-08-31T01:35:30+00:00\", \"instructions\": \"This only for garrage, not visivle to user\", \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b6c2fa36-9b47-4fb5-b608-bbf0cf437f12\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"72837d69-c9e7-4272-b0b4-f5b576af9837\", \"required\": false, \"dateAdded\": \"2025-08-31T01:35:30+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"7a49bada-7570-42dc-9d26-bed9ca6a83bc\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"90a28548-dddf-4a34-8e4d-5b91fa638606\", \"required\": false, \"dateAdded\": \"2025-08-31T01:35:30+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"530ca557-da49-42b0-9f04-76638ed1323e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"01e6943f-08f9-4808-b6dc-34051c26ecf0\", \"required\": false, \"dateAdded\": \"2025-08-31T01:35:30+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"0174a9fb-f970-42ed-a2d6-cf0c05a1086d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Estimated Cost\", \"width\": 100, \"handle\": \"cost\", \"warning\": null, \"fieldUid\": \"72837d69-c9e7-4272-b0b4-f5b576af9837\", \"required\": false, \"dateAdded\": \"2025-08-31T01:35:30+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"5957c527-1bd2-4ef0-a557-bec42573c65c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"dc4a0039-1b70-4e67-ba01-0ecff719d18b\", \"required\": false, \"dateAdded\": \"2025-08-31T01:37:53+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"d9f83652-4f92-43c9-b819-e4512934ef81\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"1205acf3-5730-40dc-ad8d-703224f9a9fd\", \"required\": false, \"dateAdded\": \"2025-08-31T02:00:04+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-08-31 01:17:19','2025-08-31 02:00:04',NULL,'71dbd422-7061-4a64-b92c-6cfbd57c8f4e'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"a843247a-ffee-494c-93ea-2bddb1b9f56a\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"eaed0e59-d2a0-4908-ad44-de7ef0c1b408\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-08-31T01:23:57+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"451526d9-0093-4ac3-abba-3b4689df9674\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Reg NO\", \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"1205acf3-5730-40dc-ad8d-703224f9a9fd\", \"required\": false, \"dateAdded\": \"2025-08-31T01:28:15+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"1ee68bcf-204a-413d-bd03-289bd14abeb0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"2d979fbe-7d32-40c9-88d4-a516aed5cccd\", \"required\": false, \"dateAdded\": \"2025-08-31T01:28:15+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"3e78520b-d7d6-4712-86e2-529ed0f53886\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Expecte Date\", \"width\": 100, \"handle\": \"expectedDate\", \"warning\": null, \"fieldUid\": \"2d979fbe-7d32-40c9-88d4-a516aed5cccd\", \"required\": false, \"dateAdded\": \"2025-08-31T01:28:15+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-08-31 01:25:03','2025-08-31 01:28:15',NULL,'82f1395f-3124-44f4-98b2-e1ffd7adb66e'),(3,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"602a36f2-3860-49e5-b6a5-173dd04781ea\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"12db1094-ea23-4dfe-95d5-a488f4f15332\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-08-31T01:39:51+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"a16c4b3d-d7fc-4c9a-80ad-5b1f89f2c852\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"4744cb5b-ed79-4965-8c58-b4d292924cc9\", \"required\": false, \"dateAdded\": \"2025-08-31T01:41:47+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-08-31 01:41:47','2025-08-31 01:41:47',NULL,'0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,'Expected Date','expectedDate','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Date','{\"max\":null,\"min\":null,\"minuteIncrement\":30,\"showDate\":true,\"showTime\":false,\"showTimeZone\":false}','2025-08-31 01:17:00','2025-08-31 01:17:00',NULL,'06c03878-9272-4d84-b169-8f626e1460b9'),(2,'Customer','customer','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2025-08-31 01:17:16','2025-08-31 01:17:16',NULL,'1205acf3-5730-40dc-ad8d-703224f9a9fd'),(3,'Customer2','customer2','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Users','{\"allowSelfRelations\":false,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":true,\"sources\":[\"group:e3d56696-859e-4ef0-be1e-ff17f856d9d0\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2025-08-31 01:22:08','2025-08-31 01:23:07',NULL,'89b426b3-21f6-40a6-8196-7c0190f3025f'),(4,'Due Date','dueDate','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Date','{\"max\":null,\"min\":null,\"minuteIncrement\":30,\"showDate\":true,\"showTime\":false,\"showTimeZone\":false}','2025-08-31 01:27:02','2025-08-31 01:27:02',NULL,'2d979fbe-7d32-40c9-88d4-a516aed5cccd'),(5,'Status','bookingStatus','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"customOptions\":false,\"options\":[{\"label\":\"Pending\",\"value\":\"pending\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Confirmed\",\"value\":\"confirmed\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"In Progress\",\"value\":\"inProgress\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Cancled\",\"value\":\"cancled\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Complete\",\"value\":\"complete\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"}]}','2025-08-31 01:31:11','2025-08-31 01:31:11',NULL,'c82f4a2f-91e1-4a48-a283-7c1b36412880'),(6,'Mechanic','mechanic','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Users','{\"allowSelfRelations\":false,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"sources\":[\"group:087f44a7-f8f2-4d79-bc45-aed02607d9e6\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2025-08-31 01:31:57','2025-08-31 01:31:57',NULL,'44081ed8-d13f-41bd-b5b8-783a94f34705'),(7,'Notes','notes','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2025-08-31 01:33:20','2025-08-31 01:33:20',NULL,'72837d69-c9e7-4272-b0b4-f5b576af9837'),(8,'Service Type','serviceType','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"customOptions\":false,\"options\":[{\"label\":\"Servicing\",\"value\":\"servicing\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"WOF\",\"value\":\"wof\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Other\",\"value\":\"other\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"}]}','2025-08-31 01:33:54','2025-08-31 01:33:54',NULL,'90a28548-dddf-4a34-8e4d-5b91fa638606'),(9,'Bookeing Time','bookeingTime','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Time','{\"max\":null,\"min\":null,\"minuteIncrement\":10}','2025-08-31 01:34:50','2025-08-31 01:34:50',NULL,'01e6943f-08f9-4808-b6dc-34051c26ecf0'),(10,'Invoice','invoice','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedEntries\":false,\"showUnpermittedSections\":false,\"sources\":[\"section:1fefc6f5-07ba-4872-9d39-a54142b16d0c\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2025-08-31 01:37:52','2025-08-31 01:37:52',NULL,'dc4a0039-1b70-4e67-ba01-0ecff719d18b'),(11,'Text Editor1','textEditor1','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":10,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2025-08-31 01:41:37','2025-08-31 01:41:37',NULL,'4744cb5b-ed79-4965-8c58-b4d292924cc9');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
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
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[]',1,'2025-08-31 01:38:43','2025-08-31 01:38:43','77edc0e8-5484-4c5f-bd5f-754d9041e716');
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
INSERT INTO `info` VALUES (1,'5.7.1.1','5.7.0.3',0,'yuvfzqnetuxu','3@qccafrefpw','2025-08-31 01:15:12','2025-08-31 02:00:04','8037d69e-be59-4920-8889-a445778c5bdc');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','1cf7023f-e5b4-4bb8-8a7c-24cb51f7f0c3'),(2,'craft','m221101_115859_create_entries_authors_table','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','41c69a1c-cacd-4957-a3a0-a0bb1120ad0d'),(3,'craft','m221107_112121_add_max_authors_to_sections','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','efc9fbd0-1d3c-4739-abe1-0d6490a21c21'),(4,'craft','m221205_082005_translatable_asset_alt_text','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','d0d9c58d-3941-45a5-8f5a-6df7ff89c581'),(5,'craft','m230314_110309_add_authenticator_table','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','b76aff13-c4d1-4c2e-9fc0-c4af68a3f5d5'),(6,'craft','m230314_111234_add_webauthn_table','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','523c36a1-08a4-476e-9db2-53678347deb9'),(7,'craft','m230503_120303_add_recoverycodes_table','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','2de4f276-2cc8-4185-bf7c-a45a18693178'),(8,'craft','m230511_000000_field_layout_configs','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','26342eab-6957-4a3e-9adb-bf3f3be198c2'),(9,'craft','m230511_215903_content_refactor','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','198355fd-00e2-4a83-95cd-c7538e4d9669'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','2b4e2687-a19b-4ef7-ba26-3e7b3764ef58'),(11,'craft','m230524_000001_entry_type_icons','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','fec4e1db-2e19-4a5c-982d-bc05708ff05b'),(12,'craft','m230524_000002_entry_type_colors','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','8ddb9a01-12a4-47a0-a159-dcd8c8804598'),(13,'craft','m230524_220029_global_entry_types','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','d1c21fd9-4938-40a7-bcb3-1fd4cbd8065e'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','ccecf5a0-8555-40f7-b951-f6e3680fde6b'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','d0ddcc4b-aa89-40bf-a56e-1fd0216576f1'),(16,'craft','m230616_173810_kill_field_groups','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','ebfc2feb-8bb3-4f1e-ba76-27fbfb0b3b50'),(17,'craft','m230616_183820_remove_field_name_limit','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','5cfb9e98-0962-4b25-94e3-80ffe6efe4a2'),(18,'craft','m230617_070415_entrify_matrix_blocks','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','070664ae-b865-43e8-bcf4-fe33bf09349d'),(19,'craft','m230710_162700_element_activity','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','24998422-9c0b-47d1-999b-224189a6c05c'),(20,'craft','m230820_162023_fix_cache_id_type','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','92d9b544-94c0-4b66-b87d-ef3f54645e97'),(21,'craft','m230826_094050_fix_session_id_type','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','ce9d283d-64f9-453f-bf86-94a17080a35e'),(22,'craft','m230904_190356_address_fields','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','3c9fd426-3c27-4c33-a70b-f0b7c821ba70'),(23,'craft','m230928_144045_add_subpath_to_volumes','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','d094414e-3adc-4e55-a973-596566cb298b'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','86e0d688-2344-4569-88bd-d527ac2d8c7b'),(25,'craft','m231213_030600_element_bulk_ops','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','bd42c1fd-68ff-4db2-b80c-33be675dfd19'),(26,'craft','m240129_150719_sites_language_amend_length','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','7dc6c945-110c-4a84-ba3a-88e52d56a4ce'),(27,'craft','m240206_035135_convert_json_columns','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','4d08d60c-c44b-439f-8811-e3ab9c9f59f9'),(28,'craft','m240207_182452_address_line_3','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','ca06f626-f1ba-40eb-aadc-ba7a5d5f70bd'),(29,'craft','m240302_212719_solo_preview_targets','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','7864df5c-c700-4e1b-8a35-b7b285846303'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','2aaccd94-1edd-4df0-9aa1-808982bb7aa0'),(31,'craft','m240723_214330_drop_bulkop_fk','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','5b5eae24-0291-4542-a36f-8611bfb188ea'),(32,'craft','m240731_053543_soft_delete_fields','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','0ba78e6e-1f65-4d34-a07f-149b8ce474d8'),(33,'craft','m240805_154041_sso_identities','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','a5d8bf8d-1319-423f-bdea-ab6f7af06935'),(34,'craft','m240926_202248_track_entries_deleted_with_section','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','f109c573-1168-4a01-ab23-c49f3bafef1d'),(35,'craft','m241120_190905_user_affiliated_sites','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','434a33c0-5929-40c4-90a1-910aa3233549'),(36,'craft','m241125_122914_add_viewUsers_permission','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','afa8605b-7632-4152-a004-69cb210a2c29'),(37,'craft','m250119_135304_entry_type_overrides','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','5bd3ea45-818b-49f8-bdcf-9b00b04a64bc'),(38,'craft','m250206_135036_search_index_queue','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','19cbf0cd-14c4-4707-99ce-88fefccd3afe'),(39,'craft','m250207_172349_bulkop_events','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','5651a5f1-fc63-4450-9578-9b1a319552d2'),(40,'craft','m250315_131608_unlimited_authors','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','4f5bb6f2-824c-4607-8f21-c3a3c5753f76'),(41,'craft','m250403_171253_static_statuses','2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 01:15:13','cd9e54de-6ac0-429e-8f24-a2b83a708bb0'),(42,'plugin:ckeditor','Install','2025-08-31 01:46:22','2025-08-31 01:46:22','2025-08-31 01:46:22','f6ad1c6d-17d0-4834-b945-f15721faac79'),(43,'plugin:ckeditor','m230408_163704_v3_upgrade','2025-08-31 01:46:22','2025-08-31 01:46:22','2025-08-31 01:46:22','62e4d71b-f2c2-4d56-a5d3-6f931047d685');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'ckeditor','4.10.1','3.0.0.0','2025-08-31 01:46:22','2025-08-31 01:46:22','2025-08-31 01:46:22','165015df-ccd8-4566-af34-26f3e933084c');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('ckeditor.configs.8ca7378c-8d3e-4433-aebd-0c7752590ed5.headingLevels.0','1'),('ckeditor.configs.8ca7378c-8d3e-4433-aebd-0c7752590ed5.headingLevels.1','2'),('ckeditor.configs.8ca7378c-8d3e-4433-aebd-0c7752590ed5.headingLevels.2','3'),('ckeditor.configs.8ca7378c-8d3e-4433-aebd-0c7752590ed5.headingLevels.3','4'),('ckeditor.configs.8ca7378c-8d3e-4433-aebd-0c7752590ed5.headingLevels.4','5'),('ckeditor.configs.8ca7378c-8d3e-4433-aebd-0c7752590ed5.headingLevels.5','6'),('ckeditor.configs.8ca7378c-8d3e-4433-aebd-0c7752590ed5.name','\"Simple\"'),('ckeditor.configs.8ca7378c-8d3e-4433-aebd-0c7752590ed5.toolbar.0','\"heading\"'),('ckeditor.configs.8ca7378c-8d3e-4433-aebd-0c7752590ed5.toolbar.1','\"|\"'),('ckeditor.configs.8ca7378c-8d3e-4433-aebd-0c7752590ed5.toolbar.2','\"bold\"'),('ckeditor.configs.8ca7378c-8d3e-4433-aebd-0c7752590ed5.toolbar.3','\"italic\"'),('ckeditor.configs.8ca7378c-8d3e-4433-aebd-0c7752590ed5.toolbar.4','\"link\"'),('dateModified','1756605604'),('email.fromEmail','\"prashant9841@gmail.com\"'),('email.fromName','\"Mechanicbackend Ddev\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.color','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elementCondition','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.autocapitalize','true'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.autocomplete','false'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.autocorrect','true'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.class','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.dateAdded','\"2025-08-31T01:39:51+00:00\"'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.disabled','false'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.elementCondition','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.id','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.includeInCards','false'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.inputType','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.instructions','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.label','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.max','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.min','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.name','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.orientation','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.placeholder','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.providesThumbs','false'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.readonly','false'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.required','true'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.size','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.step','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.tip','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.title','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.uid','\"12db1094-ea23-4dfe-95d5-a488f4f15332\"'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.userCondition','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.warning','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.0.width','100'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.dateAdded','\"2025-08-31T01:41:47+00:00\"'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.editCondition','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.elementCondition','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.fieldUid','\"4744cb5b-ed79-4965-8c58-b4d292924cc9\"'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.handle','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.includeInCards','false'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.instructions','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.label','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.providesThumbs','false'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.required','false'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.tip','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.uid','\"a16c4b3d-d7fc-4c9a-80ad-5b1f89f2c852\"'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.userCondition','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.warning','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.elements.1.width','100'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.name','\"Content\"'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.uid','\"602a36f2-3860-49e5-b6a5-173dd04781ea\"'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.fieldLayouts.0ef2e6ee-8153-425e-ba90-2f2fc6a57ff5.tabs.0.userCondition','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.handle','\"messages\"'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.hasTitleField','true'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.icon','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.name','\"messages\"'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.showSlugField','true'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.showStatusField','true'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.slugTranslationKeyFormat','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.slugTranslationMethod','\"site\"'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.titleFormat','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.titleTranslationKeyFormat','null'),('entryTypes.06d7311a-370e-4367-ab47-4e38c4245b8d.titleTranslationMethod','\"site\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.color','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elementCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.autocapitalize','true'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.autocomplete','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.autocorrect','true'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.class','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.dateAdded','\"2025-08-31T01:14:28+00:00\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.disabled','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.elementCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.id','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.includeInCards','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.inputType','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.instructions','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.label','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.max','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.min','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.name','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.orientation','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.placeholder','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.providesThumbs','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.readonly','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.required','true'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.size','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.step','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.tip','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.title','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.uid','\"b4ddfac3-e498-446a-98a5-8043aaa6f0b6\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.userCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.warning','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.0.width','100'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.dateAdded','\"2025-08-31T01:17:19+00:00\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.editCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.elementCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.fieldUid','\"06c03878-9272-4d84-b169-8f626e1460b9\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.handle','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.includeInCards','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.instructions','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.label','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.providesThumbs','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.required','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.tip','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.uid','\"ead1c954-804b-484f-acc2-8a43dffcdbd2\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.userCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.warning','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.1.width','100'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.dateAdded','\"2025-08-31T02:00:04+00:00\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.editCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.elementCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.fieldUid','\"1205acf3-5730-40dc-ad8d-703224f9a9fd\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.handle','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.includeInCards','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.instructions','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.label','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.providesThumbs','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.required','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.tip','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.uid','\"d9f83652-4f92-43c9-b819-e4512934ef81\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.userCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.warning','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.10.width','100'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.dateAdded','\"2025-08-31T01:22:10+00:00\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.editCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.elementCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.fieldUid','\"89b426b3-21f6-40a6-8196-7c0190f3025f\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.handle','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.includeInCards','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.instructions','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.label','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.providesThumbs','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.required','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.tip','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.uid','\"723a5240-8ac5-4422-9a6e-ae5fcf84e2d9\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.userCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.warning','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.2.width','100'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.dateAdded','\"2025-08-31T01:35:30+00:00\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.editCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.elementCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.fieldUid','\"c82f4a2f-91e1-4a48-a283-7c1b36412880\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.handle','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.includeInCards','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.instructions','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.label','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.providesThumbs','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.required','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.tip','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.uid','\"dc7118d1-b85c-444a-8386-44e7c42fab84\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.userCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.warning','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.3.width','100'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.dateAdded','\"2025-08-31T01:35:30+00:00\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.editCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.elementCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.fieldUid','\"44081ed8-d13f-41bd-b5b8-783a94f34705\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.handle','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.includeInCards','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.instructions','\"This only for garrage, not visivle to user\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.label','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.providesThumbs','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.required','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.tip','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.uid','\"4b48f646-6a5b-4872-a6e3-3318268a854d\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.userCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.warning','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.4.width','100'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.dateAdded','\"2025-08-31T01:35:30+00:00\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.editCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.elementCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.fieldUid','\"72837d69-c9e7-4272-b0b4-f5b576af9837\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.handle','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.includeInCards','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.instructions','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.label','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.providesThumbs','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.required','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.tip','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.uid','\"b6c2fa36-9b47-4fb5-b608-bbf0cf437f12\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.userCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.warning','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.5.width','100'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.dateAdded','\"2025-08-31T01:35:30+00:00\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.editCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.elementCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.fieldUid','\"90a28548-dddf-4a34-8e4d-5b91fa638606\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.handle','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.includeInCards','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.instructions','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.label','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.providesThumbs','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.required','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.tip','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.uid','\"7a49bada-7570-42dc-9d26-bed9ca6a83bc\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.userCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.warning','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.6.width','100'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.dateAdded','\"2025-08-31T01:35:30+00:00\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.editCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.elementCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.fieldUid','\"01e6943f-08f9-4808-b6dc-34051c26ecf0\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.handle','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.includeInCards','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.instructions','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.label','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.providesThumbs','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.required','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.tip','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.uid','\"530ca557-da49-42b0-9f04-76638ed1323e\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.userCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.warning','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.7.width','100'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.dateAdded','\"2025-08-31T01:35:30+00:00\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.editCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.elementCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.fieldUid','\"72837d69-c9e7-4272-b0b4-f5b576af9837\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.handle','\"cost\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.includeInCards','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.instructions','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.label','\"Estimated Cost\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.providesThumbs','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.required','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.tip','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.uid','\"0174a9fb-f970-42ed-a2d6-cf0c05a1086d\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.userCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.warning','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.8.width','100'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.dateAdded','\"2025-08-31T01:37:53+00:00\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.editCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.elementCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.fieldUid','\"dc4a0039-1b70-4e67-ba01-0ecff719d18b\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.handle','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.includeInCards','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.instructions','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.label','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.providesThumbs','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.required','false'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.tip','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.uid','\"5957c527-1bd2-4ef0-a557-bec42573c65c\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.userCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.warning','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.elements.9.width','100'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.name','\"Content\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.uid','\"f38d5bc6-f40f-4024-aeba-4b684017923d\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.fieldLayouts.71dbd422-7061-4a64-b92c-6cfbd57c8f4e.tabs.0.userCondition','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.handle','\"bookings\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.hasTitleField','true'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.icon','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.name','\"Bookings\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.showSlugField','true'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.showStatusField','true'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.slugTranslationKeyFormat','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.slugTranslationMethod','\"site\"'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.titleFormat','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.titleTranslationKeyFormat','null'),('entryTypes.546b5180-0a10-4e0f-af11-62d612a9d04b.titleTranslationMethod','\"site\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.color','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elementCondition','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.autocapitalize','true'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.autocomplete','false'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.autocorrect','true'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.class','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.dateAdded','\"2025-08-31T01:23:57+00:00\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.disabled','false'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.elementCondition','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.id','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.includeInCards','false'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.inputType','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.instructions','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.label','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.max','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.min','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.name','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.orientation','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.placeholder','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.providesThumbs','false'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.readonly','false'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.required','true'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.size','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.step','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.tip','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.title','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.uid','\"eaed0e59-d2a0-4908-ad44-de7ef0c1b408\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.userCondition','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.warning','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.0.width','100'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.dateAdded','\"2025-08-31T01:28:15+00:00\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.editCondition','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.elementCondition','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.fieldUid','\"1205acf3-5730-40dc-ad8d-703224f9a9fd\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.handle','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.includeInCards','false'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.instructions','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.label','\"Reg NO\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.providesThumbs','false'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.required','false'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.tip','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.uid','\"451526d9-0093-4ac3-abba-3b4689df9674\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.userCondition','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.warning','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.1.width','100'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.dateAdded','\"2025-08-31T01:28:15+00:00\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.editCondition','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.elementCondition','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.fieldUid','\"2d979fbe-7d32-40c9-88d4-a516aed5cccd\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.handle','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.includeInCards','false'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.instructions','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.label','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.providesThumbs','false'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.required','false'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.tip','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.uid','\"1ee68bcf-204a-413d-bd03-289bd14abeb0\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.userCondition','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.warning','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.2.width','100'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.dateAdded','\"2025-08-31T01:28:15+00:00\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.editCondition','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.elementCondition','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.fieldUid','\"2d979fbe-7d32-40c9-88d4-a516aed5cccd\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.handle','\"expectedDate\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.includeInCards','false'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.instructions','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.label','\"Expecte Date\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.providesThumbs','false'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.required','false'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.tip','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.uid','\"3e78520b-d7d6-4712-86e2-529ed0f53886\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.userCondition','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.warning','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.elements.3.width','100'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.name','\"Content\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.uid','\"a843247a-ffee-494c-93ea-2bddb1b9f56a\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.fieldLayouts.82f1395f-3124-44f4-98b2-e1ffd7adb66e.tabs.0.userCondition','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.handle','\"invoices\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.hasTitleField','true'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.icon','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.name','\"Invoices\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.showSlugField','true'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.showStatusField','true'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.slugTranslationKeyFormat','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.slugTranslationMethod','\"site\"'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.titleFormat','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.titleTranslationKeyFormat','null'),('entryTypes.6daa3ceb-95bd-4544-9173-a67cf9d06f59.titleTranslationMethod','\"site\"'),('fields.01e6943f-08f9-4808-b6dc-34051c26ecf0.columnSuffix','null'),('fields.01e6943f-08f9-4808-b6dc-34051c26ecf0.handle','\"bookeingTime\"'),('fields.01e6943f-08f9-4808-b6dc-34051c26ecf0.instructions','null'),('fields.01e6943f-08f9-4808-b6dc-34051c26ecf0.name','\"Bookeing Time\"'),('fields.01e6943f-08f9-4808-b6dc-34051c26ecf0.searchable','false'),('fields.01e6943f-08f9-4808-b6dc-34051c26ecf0.settings.max','null'),('fields.01e6943f-08f9-4808-b6dc-34051c26ecf0.settings.min','null'),('fields.01e6943f-08f9-4808-b6dc-34051c26ecf0.settings.minuteIncrement','10'),('fields.01e6943f-08f9-4808-b6dc-34051c26ecf0.translationKeyFormat','null'),('fields.01e6943f-08f9-4808-b6dc-34051c26ecf0.translationMethod','\"none\"'),('fields.01e6943f-08f9-4808-b6dc-34051c26ecf0.type','\"craft\\\\fields\\\\Time\"'),('fields.06c03878-9272-4d84-b169-8f626e1460b9.columnSuffix','null'),('fields.06c03878-9272-4d84-b169-8f626e1460b9.handle','\"expectedDate\"'),('fields.06c03878-9272-4d84-b169-8f626e1460b9.instructions','null'),('fields.06c03878-9272-4d84-b169-8f626e1460b9.name','\"Expected Date\"'),('fields.06c03878-9272-4d84-b169-8f626e1460b9.searchable','false'),('fields.06c03878-9272-4d84-b169-8f626e1460b9.settings.max','null'),('fields.06c03878-9272-4d84-b169-8f626e1460b9.settings.min','null'),('fields.06c03878-9272-4d84-b169-8f626e1460b9.settings.minuteIncrement','30'),('fields.06c03878-9272-4d84-b169-8f626e1460b9.settings.showDate','true'),('fields.06c03878-9272-4d84-b169-8f626e1460b9.settings.showTime','false'),('fields.06c03878-9272-4d84-b169-8f626e1460b9.settings.showTimeZone','false'),('fields.06c03878-9272-4d84-b169-8f626e1460b9.translationKeyFormat','null'),('fields.06c03878-9272-4d84-b169-8f626e1460b9.translationMethod','\"none\"'),('fields.06c03878-9272-4d84-b169-8f626e1460b9.type','\"craft\\\\fields\\\\Date\"'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.columnSuffix','null'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.handle','\"customer\"'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.instructions','null'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.name','\"Customer\"'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.searchable','false'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.settings.byteLimit','null'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.settings.charLimit','null'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.settings.code','false'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.settings.initialRows','4'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.settings.multiline','false'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.settings.placeholder','null'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.settings.uiMode','\"normal\"'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.translationKeyFormat','null'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.translationMethod','\"none\"'),('fields.1205acf3-5730-40dc-ad8d-703224f9a9fd.type','\"craft\\\\fields\\\\PlainText\"'),('fields.2d979fbe-7d32-40c9-88d4-a516aed5cccd.columnSuffix','null'),('fields.2d979fbe-7d32-40c9-88d4-a516aed5cccd.handle','\"dueDate\"'),('fields.2d979fbe-7d32-40c9-88d4-a516aed5cccd.instructions','null'),('fields.2d979fbe-7d32-40c9-88d4-a516aed5cccd.name','\"Due Date\"'),('fields.2d979fbe-7d32-40c9-88d4-a516aed5cccd.searchable','false'),('fields.2d979fbe-7d32-40c9-88d4-a516aed5cccd.settings.max','null'),('fields.2d979fbe-7d32-40c9-88d4-a516aed5cccd.settings.min','null'),('fields.2d979fbe-7d32-40c9-88d4-a516aed5cccd.settings.minuteIncrement','30'),('fields.2d979fbe-7d32-40c9-88d4-a516aed5cccd.settings.showDate','true'),('fields.2d979fbe-7d32-40c9-88d4-a516aed5cccd.settings.showTime','false'),('fields.2d979fbe-7d32-40c9-88d4-a516aed5cccd.settings.showTimeZone','false'),('fields.2d979fbe-7d32-40c9-88d4-a516aed5cccd.translationKeyFormat','null'),('fields.2d979fbe-7d32-40c9-88d4-a516aed5cccd.translationMethod','\"none\"'),('fields.2d979fbe-7d32-40c9-88d4-a516aed5cccd.type','\"craft\\\\fields\\\\Date\"'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.columnSuffix','null'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.handle','\"mechanic\"'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.instructions','null'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.name','\"Mechanic\"'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.searchable','false'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.settings.allowSelfRelations','false'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.settings.branchLimit','null'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.settings.defaultPlacement','\"end\"'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.settings.maintainHierarchy','false'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.settings.maxRelations','1'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.settings.minRelations','null'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.settings.selectionLabel','null'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.settings.showCardsInGrid','false'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.settings.showSiteMenu','false'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.settings.sources.0','\"group:087f44a7-f8f2-4d79-bc45-aed02607d9e6\"'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.settings.targetSiteId','null'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.settings.validateRelatedElements','false'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.settings.viewMode','\"list\"'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.translationKeyFormat','null'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.translationMethod','\"none\"'),('fields.44081ed8-d13f-41bd-b5b8-783a94f34705.type','\"craft\\\\fields\\\\Users\"'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.columnSuffix','null'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.handle','\"textEditor1\"'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.instructions','null'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.name','\"Text Editor1\"'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.searchable','false'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.settings.byteLimit','null'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.settings.charLimit','null'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.settings.code','false'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.settings.initialRows','10'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.settings.multiline','true'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.settings.placeholder','null'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.settings.uiMode','\"normal\"'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.translationKeyFormat','null'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.translationMethod','\"none\"'),('fields.4744cb5b-ed79-4965-8c58-b4d292924cc9.type','\"craft\\\\fields\\\\PlainText\"'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.columnSuffix','null'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.handle','\"notes\"'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.instructions','null'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.name','\"Notes\"'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.searchable','false'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.settings.byteLimit','null'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.settings.charLimit','null'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.settings.code','false'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.settings.initialRows','4'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.settings.multiline','false'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.settings.placeholder','null'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.settings.uiMode','\"normal\"'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.translationKeyFormat','null'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.translationMethod','\"none\"'),('fields.72837d69-c9e7-4272-b0b4-f5b576af9837.type','\"craft\\\\fields\\\\PlainText\"'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.columnSuffix','null'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.handle','\"customer2\"'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.instructions','null'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.name','\"Customer2\"'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.searchable','false'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.settings.allowSelfRelations','false'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.settings.branchLimit','null'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.settings.defaultPlacement','\"end\"'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.settings.maintainHierarchy','false'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.settings.maxRelations','1'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.settings.minRelations','null'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.settings.selectionLabel','null'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.settings.showCardsInGrid','false'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.settings.showSiteMenu','true'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.settings.sources.0','\"group:e3d56696-859e-4ef0-be1e-ff17f856d9d0\"'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.settings.targetSiteId','null'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.settings.validateRelatedElements','false'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.settings.viewMode','\"list\"'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.translationKeyFormat','null'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.translationMethod','\"none\"'),('fields.89b426b3-21f6-40a6-8196-7c0190f3025f.type','\"craft\\\\fields\\\\Users\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.columnSuffix','null'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.handle','\"serviceType\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.instructions','null'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.name','\"Service Type\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.searchable','false'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.customOptions','false'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.0.__assoc__.0.0','\"label\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.0.__assoc__.0.1','\"Servicing\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.0.__assoc__.1.0','\"value\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.0.__assoc__.1.1','\"servicing\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.0.__assoc__.2.0','\"icon\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.0.__assoc__.2.1','\"\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.0.__assoc__.3.0','\"color\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.0.__assoc__.3.1','\"\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.0.__assoc__.4.0','\"default\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.0.__assoc__.4.1','\"\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.1.__assoc__.0.0','\"label\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.1.__assoc__.0.1','\"WOF\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.1.__assoc__.1.0','\"value\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.1.__assoc__.1.1','\"wof\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.1.__assoc__.2.0','\"icon\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.1.__assoc__.2.1','\"\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.1.__assoc__.3.0','\"color\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.1.__assoc__.3.1','\"\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.1.__assoc__.4.0','\"default\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.1.__assoc__.4.1','\"\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.2.__assoc__.0.0','\"label\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.2.__assoc__.0.1','\"Other\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.2.__assoc__.1.0','\"value\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.2.__assoc__.1.1','\"other\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.2.__assoc__.2.0','\"icon\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.2.__assoc__.2.1','\"\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.2.__assoc__.3.0','\"color\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.2.__assoc__.3.1','\"\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.2.__assoc__.4.0','\"default\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.settings.options.2.__assoc__.4.1','\"\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.translationKeyFormat','null'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.translationMethod','\"none\"'),('fields.90a28548-dddf-4a34-8e4d-5b91fa638606.type','\"craft\\\\fields\\\\Dropdown\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.columnSuffix','null'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.handle','\"bookingStatus\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.instructions','null'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.name','\"Status\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.searchable','false'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.customOptions','false'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.0.__assoc__.0.0','\"label\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.0.__assoc__.0.1','\"Pending\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.0.__assoc__.1.0','\"value\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.0.__assoc__.1.1','\"pending\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.0.__assoc__.2.0','\"icon\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.0.__assoc__.2.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.0.__assoc__.3.0','\"color\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.0.__assoc__.3.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.0.__assoc__.4.0','\"default\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.0.__assoc__.4.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.1.__assoc__.0.0','\"label\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.1.__assoc__.0.1','\"Confirmed\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.1.__assoc__.1.0','\"value\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.1.__assoc__.1.1','\"confirmed\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.1.__assoc__.2.0','\"icon\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.1.__assoc__.2.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.1.__assoc__.3.0','\"color\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.1.__assoc__.3.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.1.__assoc__.4.0','\"default\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.1.__assoc__.4.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.2.__assoc__.0.0','\"label\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.2.__assoc__.0.1','\"In Progress\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.2.__assoc__.1.0','\"value\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.2.__assoc__.1.1','\"inProgress\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.2.__assoc__.2.0','\"icon\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.2.__assoc__.2.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.2.__assoc__.3.0','\"color\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.2.__assoc__.3.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.2.__assoc__.4.0','\"default\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.2.__assoc__.4.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.3.__assoc__.0.0','\"label\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.3.__assoc__.0.1','\"Cancled\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.3.__assoc__.1.0','\"value\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.3.__assoc__.1.1','\"cancled\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.3.__assoc__.2.0','\"icon\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.3.__assoc__.2.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.3.__assoc__.3.0','\"color\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.3.__assoc__.3.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.3.__assoc__.4.0','\"default\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.3.__assoc__.4.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.4.__assoc__.0.0','\"label\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.4.__assoc__.0.1','\"Complete\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.4.__assoc__.1.0','\"value\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.4.__assoc__.1.1','\"complete\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.4.__assoc__.2.0','\"icon\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.4.__assoc__.2.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.4.__assoc__.3.0','\"color\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.4.__assoc__.3.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.4.__assoc__.4.0','\"default\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.settings.options.4.__assoc__.4.1','\"\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.translationKeyFormat','null'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.translationMethod','\"none\"'),('fields.c82f4a2f-91e1-4a48-a283-7c1b36412880.type','\"craft\\\\fields\\\\Dropdown\"'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.columnSuffix','null'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.handle','\"invoice\"'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.instructions','null'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.name','\"Invoice\"'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.searchable','false'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.allowSelfRelations','false'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.branchLimit','null'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.defaultPlacement','\"end\"'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.maintainHierarchy','false'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.maxRelations','1'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.minRelations','null'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.selectionLabel','null'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.showCardsInGrid','false'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.showSiteMenu','false'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.showUnpermittedEntries','false'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.showUnpermittedSections','false'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.sources.0','\"section:1fefc6f5-07ba-4872-9d39-a54142b16d0c\"'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.targetSiteId','null'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.validateRelatedElements','false'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.settings.viewMode','\"list\"'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.translationKeyFormat','null'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.translationMethod','\"none\"'),('fields.dc4a0039-1b70-4e67-ba01-0ecff719d18b.type','\"craft\\\\fields\\\\Entries\"'),('graphql.schemas.77edc0e8-5484-4c5f-bd5f-754d9041e716.isPublic','true'),('graphql.schemas.77edc0e8-5484-4c5f-bd5f-754d9041e716.name','\"Public Schema\"'),('meta.__names__.01e6943f-08f9-4808-b6dc-34051c26ecf0','\"Bookeing Time\"'),('meta.__names__.06c03878-9272-4d84-b169-8f626e1460b9','\"Expected Date\"'),('meta.__names__.06d7311a-370e-4367-ab47-4e38c4245b8d','\"messages\"'),('meta.__names__.087f44a7-f8f2-4d79-bc45-aed02607d9e6','\"Manager\"'),('meta.__names__.1205acf3-5730-40dc-ad8d-703224f9a9fd','\"Customer\"'),('meta.__names__.1fefc6f5-07ba-4872-9d39-a54142b16d0c','\"Invoices\"'),('meta.__names__.24d03742-7d39-4a48-8c25-1f9882ff1011','\"User Messages\"'),('meta.__names__.2d979fbe-7d32-40c9-88d4-a516aed5cccd','\"Due Date\"'),('meta.__names__.44081ed8-d13f-41bd-b5b8-783a94f34705','\"Mechanic\"'),('meta.__names__.4744cb5b-ed79-4965-8c58-b4d292924cc9','\"Text Editor1\"'),('meta.__names__.546b5180-0a10-4e0f-af11-62d612a9d04b','\"Bookings\"'),('meta.__names__.6daa3ceb-95bd-4544-9173-a67cf9d06f59','\"Invoices\"'),('meta.__names__.72837d69-c9e7-4272-b0b4-f5b576af9837','\"Notes\"'),('meta.__names__.76d12674-18ad-4ced-a174-101dd2e25f8e','\"Admin\"'),('meta.__names__.77edc0e8-5484-4c5f-bd5f-754d9041e716','\"Public Schema\"'),('meta.__names__.89b426b3-21f6-40a6-8196-7c0190f3025f','\"Customer2\"'),('meta.__names__.8ca7378c-8d3e-4433-aebd-0c7752590ed5','\"Simple\"'),('meta.__names__.90a28548-dddf-4a34-8e4d-5b91fa638606','\"Service Type\"'),('meta.__names__.929b82bc-c4d7-473f-857c-ea44cc6c8984','\"Mechanicbackend Ddev\"'),('meta.__names__.c82f4a2f-91e1-4a48-a283-7c1b36412880','\"Status\"'),('meta.__names__.d8a32934-96c4-42dc-b853-4c0f88bbec8e','\"Mechanicbackend Ddev\"'),('meta.__names__.dc4a0039-1b70-4e67-ba01-0ecff719d18b','\"Invoice\"'),('meta.__names__.dfc02452-ba5b-4fd4-a114-66835c034135','\"Bookings\"'),('meta.__names__.e3d56696-859e-4ef0-be1e-ff17f856d9d0','\"Customer\"'),('plugins.ckeditor.edition','\"standard\"'),('plugins.ckeditor.enabled','true'),('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.defaultPlacement','\"end\"'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.enableVersioning','true'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.entryTypes.0.uid','\"6daa3ceb-95bd-4544-9173-a67cf9d06f59\"'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.handle','\"invoices\"'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.maxAuthors','1'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.name','\"Invoices\"'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.propagationMethod','\"all\"'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.siteSettings.929b82bc-c4d7-473f-857c-ea44cc6c8984.enabledByDefault','true'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.siteSettings.929b82bc-c4d7-473f-857c-ea44cc6c8984.hasUrls','true'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.siteSettings.929b82bc-c4d7-473f-857c-ea44cc6c8984.template','\"invoices/_entry.twig\"'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.siteSettings.929b82bc-c4d7-473f-857c-ea44cc6c8984.uriFormat','\"invoices/{slug}\"'),('sections.1fefc6f5-07ba-4872-9d39-a54142b16d0c.type','\"channel\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.defaultPlacement','\"end\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.enableVersioning','true'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.entryTypes.0.uid','\"06d7311a-370e-4367-ab47-4e38c4245b8d\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.handle','\"userMessages\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.maxAuthors','1'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.name','\"User Messages\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.propagationMethod','\"all\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.siteSettings.929b82bc-c4d7-473f-857c-ea44cc6c8984.enabledByDefault','true'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.siteSettings.929b82bc-c4d7-473f-857c-ea44cc6c8984.hasUrls','true'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.siteSettings.929b82bc-c4d7-473f-857c-ea44cc6c8984.template','\"user-messages/_entry.twig\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.siteSettings.929b82bc-c4d7-473f-857c-ea44cc6c8984.uriFormat','\"user-messages/{slug}\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.structure.maxLevels','null'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.structure.uid','\"499c773f-b044-49e1-9adf-2fbd78408fd0\"'),('sections.24d03742-7d39-4a48-8c25-1f9882ff1011.type','\"structure\"'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.defaultPlacement','\"end\"'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.enableVersioning','true'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.entryTypes.0.uid','\"546b5180-0a10-4e0f-af11-62d612a9d04b\"'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.handle','\"bookings\"'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.maxAuthors','1'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.name','\"Bookings\"'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.propagationMethod','\"all\"'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.siteSettings.929b82bc-c4d7-473f-857c-ea44cc6c8984.enabledByDefault','true'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.siteSettings.929b82bc-c4d7-473f-857c-ea44cc6c8984.hasUrls','true'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.siteSettings.929b82bc-c4d7-473f-857c-ea44cc6c8984.template','\"bookings/_entry.twig\"'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.siteSettings.929b82bc-c4d7-473f-857c-ea44cc6c8984.uriFormat','\"bookings/{slug}\"'),('sections.dfc02452-ba5b-4fd4-a114-66835c034135.type','\"channel\"'),('siteGroups.d8a32934-96c4-42dc-b853-4c0f88bbec8e.name','\"Mechanicbackend Ddev\"'),('sites.929b82bc-c4d7-473f-857c-ea44cc6c8984.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.929b82bc-c4d7-473f-857c-ea44cc6c8984.handle','\"default\"'),('sites.929b82bc-c4d7-473f-857c-ea44cc6c8984.hasUrls','true'),('sites.929b82bc-c4d7-473f-857c-ea44cc6c8984.language','\"en\"'),('sites.929b82bc-c4d7-473f-857c-ea44cc6c8984.name','\"Mechanicbackend Ddev\"'),('sites.929b82bc-c4d7-473f-857c-ea44cc6c8984.primary','true'),('sites.929b82bc-c4d7-473f-857c-ea44cc6c8984.siteGroup','\"d8a32934-96c4-42dc-b853-4c0f88bbec8e\"'),('sites.929b82bc-c4d7-473f-857c-ea44cc6c8984.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"Mechanicbackend Ddev\"'),('system.schemaVersion','\"5.7.0.3\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.groups.087f44a7-f8f2-4d79-bc45-aed02607d9e6.description','null'),('users.groups.087f44a7-f8f2-4d79-bc45-aed02607d9e6.handle','\"manager\"'),('users.groups.087f44a7-f8f2-4d79-bc45-aed02607d9e6.name','\"Manager\"'),('users.groups.087f44a7-f8f2-4d79-bc45-aed02607d9e6.permissions.0','\"createentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.087f44a7-f8f2-4d79-bc45-aed02607d9e6.permissions.1','\"deleteentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.087f44a7-f8f2-4d79-bc45-aed02607d9e6.permissions.2','\"deletepeerentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.087f44a7-f8f2-4d79-bc45-aed02607d9e6.permissions.3','\"deletepeerentrydrafts:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.087f44a7-f8f2-4d79-bc45-aed02607d9e6.permissions.4','\"saveentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.087f44a7-f8f2-4d79-bc45-aed02607d9e6.permissions.5','\"savepeerentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.087f44a7-f8f2-4d79-bc45-aed02607d9e6.permissions.6','\"savepeerentrydrafts:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.087f44a7-f8f2-4d79-bc45-aed02607d9e6.permissions.7','\"viewentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.087f44a7-f8f2-4d79-bc45-aed02607d9e6.permissions.8','\"viewpeerentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.087f44a7-f8f2-4d79-bc45-aed02607d9e6.permissions.9','\"viewpeerentrydrafts:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.description','null'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.handle','\"admin\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.name','\"Admin\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.0','\"accesscp\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.1','\"accesscpwhensystemisoff\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.10','\"editusers\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.11','\"impersonateusers\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.12','\"moderateusers\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.13','\"performupdates\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.14','\"registerusers\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.15','\"saveentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.16','\"savepeerentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.17','\"savepeerentrydrafts:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.18','\"utility:clear-caches\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.19','\"utility:db-backup\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.2','\"accesssitewhensystemisoff\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.20','\"utility:deprecation-errors\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.21','\"utility:find-replace\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.22','\"utility:migrations\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.23','\"utility:php-info\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.24','\"utility:queue-manager\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.25','\"utility:system-messages\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.26','\"utility:system-report\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.27','\"utility:updates\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.28','\"viewentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.29','\"viewpeerentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.3','\"administrateusers\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.30','\"viewpeerentrydrafts:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.31','\"viewusers\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.4','\"assignuserpermissions\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.5','\"createentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.6','\"deleteentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.7','\"deletepeerentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.8','\"deletepeerentrydrafts:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.76d12674-18ad-4ced-a174-101dd2e25f8e.permissions.9','\"deleteusers\"'),('users.groups.e3d56696-859e-4ef0-be1e-ff17f856d9d0.description','null'),('users.groups.e3d56696-859e-4ef0-be1e-ff17f856d9d0.handle','\"customer\"'),('users.groups.e3d56696-859e-4ef0-be1e-ff17f856d9d0.name','\"Customer\"'),('users.groups.e3d56696-859e-4ef0-be1e-ff17f856d9d0.permissions.0','\"createentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.e3d56696-859e-4ef0-be1e-ff17f856d9d0.permissions.1','\"saveentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.groups.e3d56696-859e-4ef0-be1e-ff17f856d9d0.permissions.2','\"viewentries:dfc02452-ba5b-4fd4-a114-66835c034135\"'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true');
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
INSERT INTO `relations` VALUES (1,3,7,NULL,3,1,'2025-08-31 01:22:55','2025-08-31 01:22:55','d4f47667-5f6a-4622-8953-499e3763f22b'),(2,3,8,NULL,3,1,'2025-08-31 01:23:15','2025-08-31 01:23:15','9938b5fc-342f-4a64-b7d6-8e02f88430df'),(4,3,10,NULL,3,1,'2025-08-31 01:23:21','2025-08-31 01:23:21','76b2f076-c6b9-4cab-af4d-82ed84958b09'),(7,10,7,NULL,12,1,'2025-08-31 01:38:23','2025-08-31 01:38:23','47e8795e-9504-48e2-8817-9843e651dbc5'),(8,3,14,NULL,3,1,'2025-08-31 01:38:23','2025-08-31 01:38:23','a82f31bf-e0e7-476c-adb3-b2525d7083f3'),(9,10,14,NULL,12,1,'2025-08-31 01:38:23','2025-08-31 01:38:23','d6033b52-8661-4a01-86df-2c891b06a3e0'),(10,3,20,NULL,3,1,'2025-08-31 01:42:38','2025-08-31 01:42:38','0bcaf470-c9ce-4ae6-a43e-3f05420660d2'),(12,10,20,NULL,12,1,'2025-08-31 01:58:59','2025-08-31 01:58:59','a907594a-26fb-4d3f-ae92-22ea5f3e5ec3');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,7,1,1,''),(2,7,1,2,'Applied “Draft 1”'),(3,12,1,1,''),(4,7,1,3,'Applied “Draft 1”'),(5,16,1,1,''),(6,18,1,1,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' prashant9841 gmail com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' prashant9841 gmail com '),(2,'slug',0,1,' temp fmznnjqlkmkhipvvcvymulowyqqeipzgfkkt '),(2,'title',0,1,''),(3,'email',0,1,' test test com '),(3,'firstname',0,1,' test '),(3,'fullname',0,1,' test '),(3,'lastname',0,1,''),(3,'slug',0,1,''),(3,'username',0,1,' test test com '),(4,'slug',0,1,' temp buzluegxdrsgygnjvzgcgfogowaoaxbarvoy '),(4,'title',0,1,''),(5,'slug',0,1,' temp rfiudwieeomgbrqwagijejtisrlzlazwwujg '),(5,'title',0,1,''),(6,'email',0,1,''),(6,'firstname',0,1,''),(6,'fullname',0,1,''),(6,'lastname',0,1,''),(6,'slug',0,1,''),(6,'username',0,1,''),(7,'slug',0,1,' test '),(7,'title',0,1,' test '),(12,'slug',0,1,' tested '),(12,'title',0,1,' tested '),(15,'slug',0,1,' temp zinqherqvoxkpkchdhdvpjwymegsxavkofdc '),(15,'title',0,1,''),(16,'slug',0,1,' booking confirmed '),(16,'title',0,1,' booking confirmed '),(18,'slug',0,1,' boobkinfg canclked '),(18,'title',0,1,' boobkinfg canclked '),(20,'slug',0,1,' test '),(20,'title',0,1,' test '),(21,'slug',0,1,' temp joldlzwtgpjelxlrujbwqajvxhjbcmhzvzjc '),(21,'title',0,1,''),(22,'slug',0,1,' c '),(22,'title',0,1,' c ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue`
--

LOCK TABLES `searchindexqueue` WRITE;
/*!40000 ALTER TABLE `searchindexqueue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue_fields`
--

LOCK TABLES `searchindexqueue_fields` WRITE;
/*!40000 ALTER TABLE `searchindexqueue_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Bookings','bookings','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-08-31 01:17:48','2025-08-31 01:17:48',NULL,'dfc02452-ba5b-4fd4-a114-66835c034135'),(2,NULL,'Invoices','invoices','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-08-31 01:25:08','2025-08-31 01:25:08',NULL,'1fefc6f5-07ba-4872-9d39-a54142b16d0c'),(3,1,'User Messages','userMessages','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-08-31 01:41:48','2025-08-31 01:41:48',NULL,'24d03742-7d39-4a48-8c25-1f9882ff1011');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,1,1,NULL,NULL),(2,2,1,NULL,NULL),(3,3,1,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'bookings/{slug}','bookings/_entry.twig',1,'2025-08-31 01:17:48','2025-08-31 01:17:48','b11712a4-6b31-4f4e-b0d1-0d077cf72e1f'),(2,2,1,1,'invoices/{slug}','invoices/_entry.twig',1,'2025-08-31 01:25:08','2025-08-31 01:25:08','ac9d9ff7-9b74-4ac5-aa19-fc5c0aea8a41'),(3,3,1,1,'user-messages/{slug}','user-messages/_entry.twig',1,'2025-08-31 01:41:48','2025-08-31 01:41:48','c85f610a-f47d-4f33-8f4f-ca32edbbbeeb');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
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
INSERT INTO `sitegroups` VALUES (1,'Mechanicbackend Ddev','2025-08-31 01:15:12','2025-08-31 01:15:12',NULL,'d8a32934-96c4-42dc-b853-4c0f88bbec8e');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','Mechanicbackend Ddev','default','en',1,'$PRIMARY_SITE_URL',1,'2025-08-31 01:15:12','2025-08-31 01:15:12',NULL,'929b82bc-c4d7-473f-857c-ea44cc6c8984');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
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
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,6,0,'2025-08-31 01:41:55','2025-08-31 01:42:22','f89f3aae-6bc9-493c-85ec-6ce05b301879'),(2,1,16,1,2,3,1,'2025-08-31 01:41:55','2025-08-31 01:41:55','a637690b-0401-4c5e-93f8-0d1e3e71c704'),(3,1,18,1,4,5,1,'2025-08-31 01:42:22','2025-08-31 01:42:22','57598fc9-b682-4710-9de1-c12e44fb0909');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,NULL,'2025-08-31 01:41:48','2025-08-31 01:41:48',NULL,'499c773f-b044-49e1-9adf-2fbd78408fd0');
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
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `usergroups` VALUES (1,'Admin','admin',NULL,'2025-08-31 01:20:16','2025-08-31 01:20:16','76d12674-18ad-4ced-a174-101dd2e25f8e'),(2,'Manager','manager',NULL,'2025-08-31 01:20:41','2025-08-31 01:20:41','087f44a7-f8f2-4d79-bc45-aed02607d9e6'),(3,'Customer','customer',NULL,'2025-08-31 01:21:01','2025-08-31 01:21:01','e3d56696-859e-4ef0-be1e-ff17f856d9d0');
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `usergroups_users` VALUES (1,3,3,'2025-08-31 01:22:32','2025-08-31 01:22:32','7f34a33f-d866-49f2-8be1-24d21c41d743');
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpermissions` VALUES (1,'accesscp','2025-08-31 01:20:16','2025-08-31 01:20:16','964a9fde-2aa3-46f8-9216-2e7729a0bad2'),(2,'accesscpwhensystemisoff','2025-08-31 01:20:16','2025-08-31 01:20:16','b966dfad-cb26-4a70-a4fd-5450028ec79d'),(3,'accesssitewhensystemisoff','2025-08-31 01:20:16','2025-08-31 01:20:16','82f4b842-f71c-4b94-a2ba-9c6df13ed5ce'),(4,'administrateusers','2025-08-31 01:20:16','2025-08-31 01:20:16','369ccfe1-791c-4b01-8b41-b28bc56cd68e'),(5,'assignuserpermissions','2025-08-31 01:20:16','2025-08-31 01:20:16','87c9acdf-0d58-491b-be7d-3ab5064cf325'),(6,'createentries:dfc02452-ba5b-4fd4-a114-66835c034135','2025-08-31 01:20:16','2025-08-31 01:20:16','f5c0ed45-5799-40a6-8200-cfe3cbd950d7'),(7,'deleteentries:dfc02452-ba5b-4fd4-a114-66835c034135','2025-08-31 01:20:16','2025-08-31 01:20:16','c14282db-a7fa-4131-908c-2465c7da09aa'),(8,'deletepeerentries:dfc02452-ba5b-4fd4-a114-66835c034135','2025-08-31 01:20:16','2025-08-31 01:20:16','e0d4ff1b-55af-4ece-a20b-29203ee61d74'),(9,'deletepeerentrydrafts:dfc02452-ba5b-4fd4-a114-66835c034135','2025-08-31 01:20:16','2025-08-31 01:20:16','bc949e2b-29db-4f2c-a8a4-28264e43b53e'),(10,'deleteusers','2025-08-31 01:20:16','2025-08-31 01:20:16','b7ff2632-4c31-4c03-bba0-1eff7b40a680'),(11,'editusers','2025-08-31 01:20:16','2025-08-31 01:20:16','a4273e3e-5ad6-4b76-80fe-5ed1da3583aa'),(12,'impersonateusers','2025-08-31 01:20:16','2025-08-31 01:20:16','8a127400-54b3-495f-859a-81c37a38101d'),(13,'moderateusers','2025-08-31 01:20:16','2025-08-31 01:20:16','75eee20c-b060-4267-8dad-7d8b0effc53e'),(14,'performupdates','2025-08-31 01:20:16','2025-08-31 01:20:16','03e527c4-be07-4f48-9992-d276799049e4'),(15,'registerusers','2025-08-31 01:20:16','2025-08-31 01:20:16','8ecab23d-ddd2-47d2-a908-0f7e0a535e59'),(16,'saveentries:dfc02452-ba5b-4fd4-a114-66835c034135','2025-08-31 01:20:16','2025-08-31 01:20:16','f12f2b9e-46b2-472f-b420-4aabdf732ad2'),(17,'savepeerentries:dfc02452-ba5b-4fd4-a114-66835c034135','2025-08-31 01:20:16','2025-08-31 01:20:16','7e47f42b-9f8e-40c4-9558-33b9ea62f451'),(18,'savepeerentrydrafts:dfc02452-ba5b-4fd4-a114-66835c034135','2025-08-31 01:20:16','2025-08-31 01:20:16','ae9874da-0175-4d74-a101-e81e5e297905'),(19,'utility:clear-caches','2025-08-31 01:20:16','2025-08-31 01:20:16','ca83e858-d773-4afa-912c-c4efe5886db2'),(20,'utility:db-backup','2025-08-31 01:20:16','2025-08-31 01:20:16','0d8527ae-b7c1-4e9e-8bf1-2cd9fde2c103'),(21,'utility:deprecation-errors','2025-08-31 01:20:16','2025-08-31 01:20:16','1beb9a56-97bd-482d-94fc-dc398cbf2e19'),(22,'utility:find-replace','2025-08-31 01:20:16','2025-08-31 01:20:16','a8cd5fa5-10e4-47cc-bb81-55fbd2a62df2'),(23,'utility:migrations','2025-08-31 01:20:16','2025-08-31 01:20:16','b96b80b8-d2ec-43b8-b474-03964d3685a4'),(24,'utility:php-info','2025-08-31 01:20:16','2025-08-31 01:20:16','1e80fdd1-b9c5-49ce-a153-a61aea2f3e63'),(25,'utility:queue-manager','2025-08-31 01:20:16','2025-08-31 01:20:16','7fb90f3d-bae6-434a-8110-f4d941dbf17a'),(26,'utility:system-messages','2025-08-31 01:20:16','2025-08-31 01:20:16','f386a1c2-4f8d-4f73-849b-3beab950b436'),(27,'utility:system-report','2025-08-31 01:20:16','2025-08-31 01:20:16','a76e2e50-dd56-4557-a513-083172020079'),(28,'utility:updates','2025-08-31 01:20:16','2025-08-31 01:20:16','9caa510e-9d24-42da-8e87-c5615f10b1f3'),(29,'viewentries:dfc02452-ba5b-4fd4-a114-66835c034135','2025-08-31 01:20:16','2025-08-31 01:20:16','1d1ad8d9-cf33-431f-87c5-0e2a11382e14'),(30,'viewpeerentries:dfc02452-ba5b-4fd4-a114-66835c034135','2025-08-31 01:20:16','2025-08-31 01:20:16','cf60c990-adfb-4704-8d8c-76540908cb32'),(31,'viewpeerentrydrafts:dfc02452-ba5b-4fd4-a114-66835c034135','2025-08-31 01:20:16','2025-08-31 01:20:16','8497077e-ad49-417e-a41b-1432bd406fe6'),(32,'viewusers','2025-08-31 01:20:16','2025-08-31 01:20:16','cbfd215b-b97f-48ca-b68e-20f4406cbcfe');
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpermissions_usergroups` VALUES (1,1,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','f9ef4430-c617-4aa1-a3a5-e7e8bf28cb3d'),(2,2,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','b5d340d5-747b-493f-a4ba-9a1f9745f368'),(3,3,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','643297cc-1705-4789-a0fe-2f941f6f08d9'),(4,4,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','d574887c-aab3-41be-aeb8-3180e51fb02a'),(5,5,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','a963abf1-7ff6-46a8-a234-d5693d098551'),(6,6,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','bc1e4498-918b-47b5-805c-9197bbfa954f'),(7,7,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','7ec96920-792d-4ae7-9798-2e436676153b'),(8,8,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','41ad4161-13dc-4a63-9c15-0dbdb80c5573'),(9,9,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','0abf3bd4-4013-470d-9b4d-674a6696cf68'),(10,10,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','3b7adc9d-822d-4b29-987b-ff35962e394d'),(11,11,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','15e94e6a-e466-442b-b63c-fa726b52fe59'),(12,12,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','8cc093a9-5c60-4c10-abc0-09941a988987'),(13,13,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','d65a8000-8d11-4367-b08a-4b40af222635'),(14,14,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','ac50158b-30c6-4222-acd2-f67ae9e52248'),(15,15,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','08a1cdb4-66e5-4d07-b0e8-1a505c0225a7'),(16,16,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','a20ac672-bd30-48b4-b6da-4c4b184ae19d'),(17,17,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','728eeab8-d6f0-4652-9873-3852af067b7e'),(18,18,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','3e592a1a-71a0-4791-bb7c-1853e6fe8083'),(19,19,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','c5f9add1-25d4-4d20-996a-a34a891a6a56'),(20,20,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','76e6aadf-c1d9-4d9d-beca-6bc25656b675'),(21,21,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','f3b616d6-1b91-41f1-ae82-12e7dc961ba7'),(22,22,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','59847d9d-f574-4101-a77f-2ebee40afb32'),(23,23,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','ba7f0fc3-1d0b-46f7-875f-43f789a455df'),(24,24,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','c256a083-8d5b-4ad5-a41e-aacca55aeee3'),(25,25,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','a47847ca-5fd9-4996-90d4-3491d8cc43d0'),(26,26,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','d8f91829-0815-4fb2-8184-f7598f43f0fe'),(27,27,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','b9c4e971-c548-4300-816a-ec8827f75530'),(28,28,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','2098df7f-15ba-43bf-930a-2ea15a2f69d8'),(29,29,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','3122766c-0ed6-4807-8605-c18b2106dbb2'),(30,30,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','e81752b0-07e1-4acf-8381-4b766d99cf4d'),(31,31,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','2e0880d3-475a-4171-b34a-61b66a46205e'),(32,32,1,'2025-08-31 01:20:16','2025-08-31 01:20:16','2147b209-b08a-48be-a41e-f396c2c76b26'),(33,6,2,'2025-08-31 01:20:41','2025-08-31 01:20:41','8f2c7aa8-b4e8-443e-9e87-46cf42895f4f'),(34,7,2,'2025-08-31 01:20:41','2025-08-31 01:20:41','083a29a0-ba51-4e8a-a5ef-d2e1a069b920'),(35,8,2,'2025-08-31 01:20:41','2025-08-31 01:20:41','848c3254-aded-464a-91be-770137e95873'),(36,9,2,'2025-08-31 01:20:41','2025-08-31 01:20:41','9368388c-4953-4285-a382-abc2d811d502'),(37,16,2,'2025-08-31 01:20:41','2025-08-31 01:20:41','d84e201e-9222-4476-bb4a-4c1ee80f5e26'),(38,17,2,'2025-08-31 01:20:41','2025-08-31 01:20:41','db5874a4-289c-472b-8cc9-4bf242a39e17'),(39,18,2,'2025-08-31 01:20:41','2025-08-31 01:20:41','b8db7db6-a369-46a7-99bb-9e43e8b971c4'),(40,29,2,'2025-08-31 01:20:41','2025-08-31 01:20:41','a6af1369-9b60-4155-8b36-64009a06b0a2'),(41,30,2,'2025-08-31 01:20:41','2025-08-31 01:20:41','0d23a737-cb8e-4d63-b21d-4f5ade04249f'),(42,31,2,'2025-08-31 01:20:41','2025-08-31 01:20:41','8c840373-688d-48f9-86b1-922a6ad0ad3e'),(46,6,3,'2025-08-31 01:21:03','2025-08-31 01:21:03','a3f54232-c20c-4e29-8e9a-ede0f7e2c2ee'),(47,16,3,'2025-08-31 01:21:03','2025-08-31 01:21:03','0103202a-4666-4f95-9075-a43b7af9cf88'),(48,29,3,'2025-08-31 01:21:03','2025-08-31 01:21:03','30b35288-890f-4acf-b105-b068df576420');
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
INSERT INTO `userpreferences` VALUES (1,'{\"locale\": \"en-NZ\", \"language\": \"en\", \"useShapes\": false, \"weekStartDay\": \"1\", \"underlineLinks\": false, \"disableAutofocus\": \"\", \"profileTemplates\": true, \"showFieldHandles\": true, \"showExceptionView\": true, \"notificationDuration\": \"5000\", \"enableDebugToolbarForCp\": true, \"enableDebugToolbarForSite\": true}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,NULL,1,0,0,0,1,'prashant9841@gmail.com',NULL,NULL,NULL,'prashant9841@gmail.com','$2y$13$IAdYasGdzfKXxvj30lB.b.v4/RSFFn1kDTfeWGrIU8OkzTMwVMaXy','2025-08-31 03:15:36',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2025-08-31 01:15:13','2025-08-31 01:15:13','2025-08-31 03:15:36'),(3,NULL,NULL,1,0,0,0,0,'test@test.com','Test','Test',NULL,'test@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,'2025-08-31 01:21:09','2025-08-31 01:22:44'),(6,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,'2025-08-31 01:22:21','2025-08-31 01:22:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
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
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2025-08-31 01:15:14','2025-08-31 01:15:14','5f4cac15-7417-42a9-93e5-8b4ee83ff203'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2025-08-31 01:15:14','2025-08-31 01:15:14','dbc569d9-6f25-411c-a547-016f1967393b'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2025-08-31 01:15:14','2025-08-31 01:15:14','0bafec82-015e-4943-8bf3-13d2c7ed6fd2'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2025-08-31 01:15:14','2025-08-31 01:15:14','051147c0-c405-4bf5-9ad7-7927fd99b0e6');
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

-- Dump completed on 2025-08-31  3:15:43
