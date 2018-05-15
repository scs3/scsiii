-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 14, 2018 at 08:38 PM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `db_scsiii`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(21, 2, 4, '17_colon01.jpg', 'image', 1200, 779, 229462, NULL, '2018-05-11 22:51:39', '2018-05-11 22:51:39', '2018-05-11 22:51:44', '6db0d62c-e935-4374-81a1-c244f016fa4d'),
(22, 2, 4, '17_colon02.jpg', 'image', 1206, 783, 213639, NULL, '2018-05-11 22:51:51', '2018-05-11 22:51:51', '2018-05-11 22:51:54', 'a789b9c3-37a3-461d-be9f-a53f660f5788'),
(23, 2, 4, '17w_cover.jpg', 'image', 1200, 1200, 133185, NULL, '2018-05-12 04:28:10', '2018-05-12 04:28:10', '2018-05-12 04:28:17', '9c7c46ea-8d8b-4207-b14d-1488b0548af1'),
(24, 2, 4, '17w_ownership.jpg', 'image', 1200, 1200, 77401, NULL, '2018-05-12 04:28:11', '2018-05-12 04:28:11', '2018-05-12 04:28:18', 'eba5c5ca-9b03-4ea1-a932-4e2b802dea33'),
(26, 2, 4, 'aw_kreskin.jpg', 'image', 1200, 790, 145190, NULL, '2018-05-12 14:17:37', '2018-05-12 14:17:37', '2018-05-12 14:17:43', 'c16b11f4-58e7-4245-baad-42f27926bc47'),
(28, 2, 4, 'aw_school.jpg', 'image', 1200, 791, 170265, NULL, '2018-05-12 14:22:45', '2018-05-12 14:22:45', '2018-05-12 14:22:48', '1a659549-74c8-4a73-9e25-b50416d4bf6e');

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assettransformindex`
--

INSERT INTO `assettransformindex` (`id`, `assetId`, `filename`, `format`, `location`, `volumeId`, `fileExists`, `inProgress`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(6, 21, '17_colon01.jpg', NULL, '_twoFiftyPX', 2, 1, 0, '2018-05-12 04:23:28', '2018-05-12 04:23:28', '2018-05-12 04:23:28', '72396b08-e426-42c4-97f9-81f7e0c2601b'),
(7, 23, '17w_cover.jpg', NULL, '_twoFiftyPX', 2, 1, 0, '2018-05-12 04:28:27', '2018-05-12 04:28:27', '2018-05-12 04:28:28', 'dadfc50d-634a-49a2-940c-25664b3f67e9'),
(8, 26, 'aw_kreskin.jpg', NULL, '_twoFiftyPX', 2, 1, 0, '2018-05-12 14:19:11', '2018-05-12 14:19:11', '2018-05-12 14:19:12', 'b67ac728-74d7-4813-8d8a-abd9800fdff6'),
(9, 28, 'aw_school.jpg', NULL, '_twoFiftyPX', 2, 1, 0, '2018-05-12 14:23:04', '2018-05-12 14:23:04', '2018-05-12 14:23:04', 'c03a3584-0aa9-48cb-ad90-e0e5397aa78f');

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assettransforms`
--

INSERT INTO `assettransforms` (`id`, `name`, `handle`, `mode`, `position`, `width`, `height`, `format`, `quality`, `interlace`, `dimensionChangeTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, '250px', 'twoFiftyPX', 'fit', 'center-center', NULL, 500, NULL, NULL, 'none', '2018-05-12 04:23:24', '2018-05-11 22:28:03', '2018-05-12 04:23:24', '4784e365-9130-4e23-b929-5aa3c6eb71d4');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_bio` text,
  `field_contact` text,
  `field_social` text,
  `field_description` text,
  `field_client` text,
  `field_contributor` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_bio`, `field_contact`, `field_social`, `field_description`, `field_client`, `field_contributor`) VALUES
(1, 1, 1, NULL, '2018-05-02 18:55:21', '2018-05-10 14:46:21', 'b99da41f-98f3-4573-bf82-a6425100621d', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 18, 1, 'Homepage', '2018-05-11 22:19:49', '2018-05-11 22:19:49', '986ea7b4-e34f-4f19-ba67-38ed8a3466f3', NULL, NULL, NULL, NULL, NULL, NULL),
(19, 19, 1, 'Info', '2018-05-11 22:20:04', '2018-05-11 22:36:52', '7da29411-117f-443c-8dc0-1c75f826f70f', '<p>Sam Solomon is a Texas-based designer, art director and photographer specializing in editorial design and branding. He is Creative Director for <a href=\"http://genomemag.com/\">Genome</a>, a health and science quarterly focused on genomics. Previously, he was art director for <a href=\"http://americanwaymagazine.com/\">American Way</a>, and a contributor to <a href=\"http://texasmonthly.com/\">Texas Monthly</a> and <a href=\"http://dmagazine.com/\">D Magazine</a>. He has sat on the design jury for the Society of Publication Designers, and has been recognized for his work by the SPD, Communication Arts, Print, Graphis and the Dallas Society for Visual Communication.</p>', '<p><a href=\"mailto:sam@samsolomon.co\">sam@samsolomon.co</a></p>', '<p><a href=\"https://www.instagram.com/samuelsolomon/\">Instagram</a></p><p><a href=\"https://www.behance.net/scs3\">Behance</a></p>', NULL, NULL, NULL),
(20, 20, 1, 'Colon Cancer', '2018-05-11 22:33:00', '2018-05-12 04:38:09', 'f05d7748-2167-47a6-97be-21227f7ff29c', NULL, NULL, NULL, '<p>Colon Cancer feature</p>', '<p>Genome magazine</p>', '<p>Illustrations by Mike McQuade</p>'),
(21, 21, 1, '17 Colon01', '2018-05-11 22:51:38', '2018-05-11 22:51:44', '16aeaf75-0244-4dea-b8d5-67fb4d89a735', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 22, 1, '17 Colon02', '2018-05-11 22:51:51', '2018-05-11 22:51:54', '306def8e-730d-4776-81af-007e4193d6c5', NULL, NULL, NULL, NULL, NULL, NULL),
(23, 23, 1, '17W Cover', '2018-05-12 04:28:09', '2018-05-12 04:28:17', '194104ae-e279-4af9-a398-a28eebbf4b0f', NULL, NULL, NULL, NULL, NULL, NULL),
(24, 24, 1, '17W Ownership', '2018-05-12 04:28:10', '2018-05-12 04:28:18', 'e72a2cd8-45ad-4f27-8ecb-27a22d1d1ef5', NULL, NULL, NULL, NULL, NULL, NULL),
(25, 25, 1, 'DNA Ownership', '2018-05-12 04:28:24', '2018-05-12 04:30:03', '2210f1b6-d6ed-4717-a37e-b8dbbdeaa9c2', NULL, NULL, NULL, '<p>Cover story on DNA ownership.</p>', '<p>Genome Magazine</p>', '<p>Photographs by Fredrik Broden</p>'),
(26, 26, 1, 'Aw Kreskin', '2018-05-12 14:17:36', '2018-05-12 14:17:43', 'fe49b061-30e3-4fb4-b81a-705886bfc5b5', NULL, NULL, NULL, NULL, NULL, NULL),
(27, 27, 1, 'Kreskin', '2018-05-12 14:18:00', '2018-05-12 14:18:00', 'c9ff6e9b-a904-4240-832e-7c8cf0a97b39', NULL, NULL, NULL, '<p>Feature profile on the Amazing Kreskin</p>', '<p>American Way</p>', '<p>Photographs by Ian Allen</p>'),
(28, 28, 1, 'Aw School', '2018-05-12 14:22:45', '2018-05-12 14:22:48', '00f1ec5a-ee10-4ca8-84fb-ce13cf7c317b', NULL, NULL, NULL, NULL, NULL, NULL),
(29, 29, 1, 'Education', '2018-05-12 14:22:59', '2018-05-12 14:22:59', 'c99f5244-6b2b-4bce-8e54-c13a3f1aa467', NULL, NULL, NULL, '<p>Feature weighing the benefits of single-sex education.</p>', '<p>American Way</p>', '<p>Photographs by Chris Korbey</p>');

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'craft\\elements\\User', 1, 0, '2018-05-02 18:55:21', '2018-05-10 14:46:21', 'e245d715-e2ea-4cad-9c08-cd7fb699705d'),
(18, 9, 'craft\\elements\\Entry', 1, 0, '2018-05-11 22:19:49', '2018-05-11 22:19:49', 'e6537e05-ca91-449b-ae95-1876112e8396'),
(19, 10, 'craft\\elements\\Entry', 1, 0, '2018-05-11 22:20:04', '2018-05-11 22:36:52', '4b16eafb-67a9-4738-b345-0735d4c79d98'),
(20, 11, 'craft\\elements\\Entry', 1, 0, '2018-05-11 22:33:00', '2018-05-12 04:38:09', '34cdf31c-42fe-4743-b3f2-d2996203f6a0'),
(21, 12, 'craft\\elements\\Asset', 1, 0, '2018-05-11 22:51:38', '2018-05-11 22:51:44', '82b3f98a-e157-4928-8d0e-9e8ddf0fe71d'),
(22, 12, 'craft\\elements\\Asset', 1, 0, '2018-05-11 22:51:51', '2018-05-11 22:51:54', 'b87e4647-65ed-4476-bd25-845cd4051799'),
(23, 12, 'craft\\elements\\Asset', 1, 0, '2018-05-12 04:28:09', '2018-05-12 04:28:17', 'dba7028a-5bfe-49d2-ad5c-5a536c08e7d3'),
(24, 12, 'craft\\elements\\Asset', 1, 0, '2018-05-12 04:28:10', '2018-05-12 04:28:18', '3b483e1b-e643-4a7a-b8a2-dcb86cf4a642'),
(25, 11, 'craft\\elements\\Entry', 1, 0, '2018-05-12 04:28:24', '2018-05-12 04:30:03', '9adccd26-5a4f-4bb4-a132-42fd35ef24a8'),
(26, 12, 'craft\\elements\\Asset', 1, 0, '2018-05-12 14:17:36', '2018-05-12 14:17:43', 'ad2fb536-fa41-4f61-ad3b-4f5f274402ec'),
(27, 11, 'craft\\elements\\Entry', 1, 0, '2018-05-12 14:18:00', '2018-05-12 14:18:00', '91e3a7c0-897a-4b96-80fe-81d7105e3661'),
(28, 12, 'craft\\elements\\Asset', 1, 0, '2018-05-12 14:22:45', '2018-05-12 14:22:48', '1e92c9e3-97a3-4a53-84e1-3e6b0deddfb2'),
(29, 11, 'craft\\elements\\Entry', 1, 0, '2018-05-12 14:22:59', '2018-05-12 14:22:59', '342d3c6e-bfe6-4bff-8ca6-3cb46a4afa82');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2018-05-02 18:55:21', '2018-05-10 14:46:21', '29c2cde2-9f5b-4ecd-b2cb-051e427d15be'),
(18, 18, 1, 'homepage', '', 1, '2018-05-11 22:19:49', '2018-05-11 22:19:49', 'c04307f1-3efd-4402-a2eb-2ede58338796'),
(19, 19, 1, 'info', 'info', 1, '2018-05-11 22:20:04', '2018-05-11 22:36:52', '2fb53867-afd4-450c-b99e-74580277be33'),
(20, 20, 1, 'colon-cancer', 'projects/colon-cancer', 1, '2018-05-11 22:33:00', '2018-05-12 04:38:09', '8199fab6-3ff8-4268-b682-0f460830737e'),
(21, 21, 1, NULL, NULL, 1, '2018-05-11 22:51:38', '2018-05-11 22:51:44', 'ce63f6d5-32c4-4a94-b24e-264ec5540467'),
(22, 22, 1, NULL, NULL, 1, '2018-05-11 22:51:51', '2018-05-11 22:51:54', 'ed9a9a05-731d-429a-8388-094fab82dfc6'),
(23, 23, 1, NULL, NULL, 1, '2018-05-12 04:28:09', '2018-05-12 04:28:17', '46f9fddf-dccd-4e03-a968-37f830d12554'),
(24, 24, 1, NULL, NULL, 1, '2018-05-12 04:28:10', '2018-05-12 04:28:18', '43171d8a-5d1c-4f5a-a0a8-39d2315f03f5'),
(25, 25, 1, 'dna-ownership', 'projects/dna-ownership', 1, '2018-05-12 04:28:24', '2018-05-12 04:30:03', '4da54245-3df9-49b0-87ea-3943a2b1c5df'),
(26, 26, 1, NULL, NULL, 1, '2018-05-12 14:17:36', '2018-05-12 14:17:43', '9b2f76da-9472-491f-a6f3-e9196dcc21c0'),
(27, 27, 1, 'kreskin', 'projects/kreskin', 1, '2018-05-12 14:18:00', '2018-05-12 14:18:00', 'b117f771-d5d8-4474-9d29-3ed09b10ada4'),
(28, 28, 1, NULL, NULL, 1, '2018-05-12 14:22:45', '2018-05-12 14:22:48', 'c3328c5e-df8b-4c09-a5b1-694580341efe'),
(29, 29, 1, 'education', 'projects/education', 1, '2018-05-12 14:22:59', '2018-05-12 14:22:59', 'c80100cf-0673-49c6-a8c3-20a6438c63cb');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(18, 8, 8, NULL, '2018-05-11 22:19:49', NULL, '2018-05-11 22:19:49', '2018-05-11 22:19:49', '421da0a8-ab86-4ffa-a5c1-604803b6c85f'),
(19, 9, 9, NULL, '2018-05-11 22:20:04', NULL, '2018-05-11 22:20:04', '2018-05-11 22:36:52', 'fb19d2ae-0b44-4889-8eca-75e0c23a729f'),
(20, 10, 10, 1, '2018-05-11 22:32:00', NULL, '2018-05-11 22:33:00', '2018-05-12 04:38:09', 'fad9ca00-6e3e-4949-9e50-d180624cfd7b'),
(25, 10, 10, 1, '2018-05-11 22:30:00', NULL, '2018-05-12 04:28:24', '2018-05-12 04:30:03', '9b6e4dc5-e1df-4837-8a63-8e6a578c54c3'),
(27, 10, 10, 1, '2018-05-12 14:18:00', NULL, '2018-05-12 14:18:00', '2018-05-12 14:18:00', '4021722c-6de1-4182-83d7-c603c22ca0d6'),
(29, 10, 10, 1, '2018-05-12 14:22:59', NULL, '2018-05-12 14:22:59', '2018-05-12 14:22:59', '4bf004ac-d0e6-4956-8b83-3c17bb091eac');

-- --------------------------------------------------------

--
-- Table structure for table `entrydrafts`
--

CREATE TABLE `entrydrafts` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(8, 8, 9, 'Homepage', 'homepage', 0, NULL, '{section.name|raw}', 1, '2018-05-11 22:19:49', '2018-05-11 22:19:49', 'ddc48eba-e6d2-4c24-a77b-cc0618bcfe4c'),
(9, 9, 10, 'Info', 'info', 1, 'Title', NULL, 1, '2018-05-11 22:20:04', '2018-05-11 22:35:01', '34633f9f-06ed-4d30-a1e0-3b7fe14f453e'),
(10, 10, 11, 'Projects', 'projects', 1, 'Title', NULL, 1, '2018-05-11 22:20:35', '2018-05-12 04:08:18', '90730097-e4d7-4bd4-8ea8-a0224881b81a');

-- --------------------------------------------------------

--
-- Table structure for table `entryversions`
--

CREATE TABLE `entryversions` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL,
  `num` smallint(6) UNSIGNED NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entryversions`
--

INSERT INTO `entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `siteId`, `num`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(15, 20, 10, 1, 1, 1, '', '{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"Colon Cancer\",\"slug\":\"colon-cancer\",\"postDate\":1526077979,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"15\":\"<p>Genome magazine</p>\",\"17\":[],\"16\":\"<p>Illustrations by Mike McQuade</p>\",\"14\":\"<p>Colon Cancer feature</p>\"}}', '2018-05-11 22:33:00', '2018-05-11 22:33:00', 'f8badc24-5385-4481-826f-558e00785b8d'),
(16, 19, 9, 1, 1, 1, 'Revision from May 11, 2018, 3:35:02 PM', '{\"typeId\":\"9\",\"authorId\":null,\"title\":\"Info\",\"slug\":\"info\",\"postDate\":1526077204,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":[]}', '2018-05-11 22:35:53', '2018-05-11 22:35:53', '1e46728a-c329-44eb-9e4d-87b928e30978'),
(17, 19, 9, 1, 1, 2, '', '{\"typeId\":\"9\",\"authorId\":null,\"title\":\"Info\",\"slug\":\"info\",\"postDate\":1526077204,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"11\":\"<p>&nbsp;</p>\",\"12\":\"<p>&nbsp;</p>\",\"13\":\"<p>&nbsp;</p>\"}}', '2018-05-11 22:35:53', '2018-05-11 22:35:53', 'd03fe98a-7ac5-459b-9c56-2b0ac9a7bb27'),
(18, 19, 9, 1, 1, 3, '', '{\"typeId\":\"9\",\"authorId\":null,\"title\":\"Info\",\"slug\":\"info\",\"postDate\":1526077204,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"11\":\"<p>&nbsp;</p>\",\"12\":\"<p>&nbsp;</p>\",\"13\":\"<p>&nbsp;</p>\"}}', '2018-05-11 22:35:58', '2018-05-11 22:35:58', '88a8a9c0-46f0-4d8f-b3da-a0277603e094'),
(19, 19, 9, 1, 1, 4, '', '{\"typeId\":\"9\",\"authorId\":null,\"title\":\"Info\",\"slug\":\"info\",\"postDate\":1526077204,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"11\":\"<p>&nbsp;</p>\",\"12\":\"<p>&nbsp;</p>\",\"13\":\"<p>&nbsp;</p>\"}}', '2018-05-11 22:36:05', '2018-05-11 22:36:05', '3081d425-8f54-487d-b790-2bec7409dc2f'),
(20, 19, 9, 1, 1, 5, '', '{\"typeId\":\"9\",\"authorId\":null,\"title\":\"Info\",\"slug\":\"info\",\"postDate\":1526077204,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"11\":\"<p>Sam Solomon is a Texas-based designer, art director and photographer specializing in editorial design and branding. He is Creative Director for <a href=\\\"http://genomemag.com/\\\">Genome</a>, a health and science quarterly focused on genomics. Previously, he was art director for <a href=\\\"http://americanwaymagazine.com/\\\">American Way</a>, and a contributor to <a href=\\\"http://texasmonthly.com/\\\">Texas Monthly</a> and <a href=\\\"http://dmagazine.com/\\\">D Magazine</a>. He has sat on the design jury for the Society of Publication Designers, and has been recognized for his work by the SPD, Communication Arts, Print, Graphis and the Dallas Society for Visual Communication.</p>\",\"12\":\"<p><a href=\\\"mailto:sam@samsolomon.co\\\">sam@samsolomon.co</a></p>\",\"13\":\"<p><a href=\\\"https://www.instagram.com/samuelsolomon/\\\">Instagram</a></p><p><a href=\\\"https://www.behance.net/scs3\\\">Behance</a></p>\"}}', '2018-05-11 22:36:52', '2018-05-11 22:36:52', 'fe5aeed1-f084-4ea5-ae64-0d8fdfcadf6e'),
(21, 20, 10, 1, 1, 2, '', '{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"Colon Cancer\",\"slug\":\"colon-cancer\",\"postDate\":1526077920,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"15\":\"<p>Genome magazine</p>\",\"17\":[\"22\"],\"16\":\"<p>Illustrations by Mike McQuade</p>\",\"14\":\"<p>Colon Cancer feature</p>\"}}', '2018-05-11 22:52:03', '2018-05-11 22:52:03', '47f0e9cf-cdf7-47ba-b51e-cc558b1b7ab6'),
(22, 20, 10, 1, 1, 3, '', '{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"Colon Cancer\",\"slug\":\"colon-cancer\",\"postDate\":1526077920,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"15\":\"<p>Genome magazine</p>\",\"17\":[\"21\",\"22\"],\"16\":\"<p>Illustrations by Mike McQuade</p>\",\"14\":\"<p>Colon Cancer feature</p>\"}}', '2018-05-11 22:52:23', '2018-05-11 22:52:23', 'c42ac5b5-0410-4b19-8489-6e22530a96e9'),
(23, 20, 10, 1, 1, 4, '', '{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"Colon Cancer\",\"slug\":\"colon-cancer\",\"postDate\":1526077920,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"15\":\"<p>Genome magazine</p>\",\"16\":\"<p>Illustrations by Mike McQuade</p>\",\"14\":\"<p>Colon Cancer feature</p>\",\"18\":[\"21\"],\"17\":[\"22\"]}}', '2018-05-12 04:07:39', '2018-05-12 04:07:39', '119c666f-027d-4df2-ae42-203b8564a24f'),
(24, 20, 10, 1, 1, 5, '', '{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"Colon Cancer\",\"slug\":\"colon-cancer\",\"postDate\":1526077920,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"15\":\"<p>Genome magazine</p>\",\"16\":\"<p>Illustrations by Mike McQuade</p>\",\"14\":\"<p>Colon Cancer feature</p>\",\"18\":[\"21\",\"22\"]}}', '2018-05-12 04:26:16', '2018-05-12 04:26:16', '5528ef20-1839-4e3f-a206-ac6335e902a8'),
(25, 25, 10, 1, 1, 1, '', '{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"DNA Ownership\",\"slug\":\"dna-ownership\",\"postDate\":1526099304,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"15\":\"<p>Genome Magazine</p>\",\"16\":\"<p>Photographs by Fredrik Broden</p>\",\"14\":\"<p>Cover story on DNA ownership.</p>\",\"18\":[\"23\",\"24\"]}}', '2018-05-12 04:28:25', '2018-05-12 04:28:25', '655c3b70-d646-4992-ac4e-706f8a182271'),
(26, 25, 10, 1, 1, 2, '', '{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"DNA Ownership\",\"slug\":\"dna-ownership\",\"postDate\":1526077800,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"15\":\"<p>Genome Magazine</p>\",\"16\":\"<p>Photographs by Fredrik Broden</p>\",\"14\":\"<p>Cover story on DNA ownership.</p>\",\"18\":[\"23\",\"24\"]}}', '2018-05-12 04:30:04', '2018-05-12 04:30:04', '1ef405e8-eaaa-4e5b-8735-02db0fbfc17b'),
(27, 20, 10, 1, 1, 6, '', '{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"Colon Cancer\",\"slug\":\"colon-cancer\",\"postDate\":1526077920,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"15\":\"<p>Genome magazine</p>\",\"16\":\"<p>Illustrations by Mike McQuade</p>\",\"14\":\"<p>Colon Cancer feature</p>\",\"18\":[\"21\",\"22\"]}}', '2018-05-12 04:38:09', '2018-05-12 04:38:09', '123baf80-cf43-4268-8eae-77700071e267'),
(28, 27, 10, 1, 1, 1, '', '{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"Kreskin\",\"slug\":\"kreskin\",\"postDate\":1526134680,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"15\":\"<p>American Way</p>\",\"16\":\"<p>Photographs by Ian Allen</p>\",\"14\":\"<p>Feature profile on the Amazing Kreskin</p>\",\"18\":[\"26\"]}}', '2018-05-12 14:18:00', '2018-05-12 14:18:00', 'a408bc2f-399a-4427-8113-e63e4cbfbc27'),
(29, 29, 10, 1, 1, 1, '', '{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"Education\",\"slug\":\"education\",\"postDate\":1526134979,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"15\":\"<p>American Way</p>\",\"16\":\"<p>Photographs by Chris Korbey</p>\",\"14\":\"<p>Feature weighing the benefits of single-sex education.</p>\",\"18\":[\"28\"]}}', '2018-05-12 14:22:59', '2018-05-12 14:22:59', '9932cace-d9f5-4766-83f8-499ee5aaedfa');

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(8, 'Info', '2018-05-11 22:21:51', '2018-05-11 22:21:51', 'f435e620-b213-4e42-8bec-60b0a91a54ed'),
(9, 'Content', '2018-05-11 22:24:09', '2018-05-11 22:24:09', '5ecf48e0-da9f-44b0-808f-6d3062ad3e4f');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(34, 10, 14, 11, 1, 1, '2018-05-11 22:35:01', '2018-05-11 22:35:01', 'bb4a69e0-24c4-48e3-8f4f-913263a4b49d'),
(35, 10, 14, 12, 1, 2, '2018-05-11 22:35:01', '2018-05-11 22:35:01', '4624c447-7ca0-469f-9599-06aeaf807d55'),
(36, 10, 14, 13, 1, 3, '2018-05-11 22:35:01', '2018-05-11 22:35:01', '6491ff06-81ff-4a8b-9db2-a221c5f4a57a'),
(50, 11, 18, 14, 1, 1, '2018-05-12 04:08:18', '2018-05-12 04:08:18', 'f82487eb-c5b7-42f3-b275-160a291b78e0'),
(51, 11, 18, 15, 0, 2, '2018-05-12 04:08:18', '2018-05-12 04:08:18', 'c6a14360-8a59-47c2-b1ab-0930bd065e62'),
(52, 11, 18, 16, 0, 3, '2018-05-12 04:08:18', '2018-05-12 04:08:18', '9d91548a-ee87-4450-aafb-48715b85205f'),
(53, 11, 18, 18, 1, 4, '2018-05-12 04:08:18', '2018-05-12 04:08:18', '7660e7e2-1969-4f5b-bf2e-dc5f25dbff07');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(7, 'craft\\elements\\Asset', '2018-05-10 16:23:13', '2018-05-10 19:14:52', '006763a8-93b1-418d-8670-8770398033b2'),
(9, 'craft\\elements\\Entry', '2018-05-11 22:19:49', '2018-05-11 22:19:49', '3da8d944-5409-4b38-a4bd-75e578baea16'),
(10, 'craft\\elements\\Entry', '2018-05-11 22:20:04', '2018-05-11 22:35:01', '66b78252-4ea8-483f-819e-94f8acab9223'),
(11, 'craft\\elements\\Entry', '2018-05-11 22:20:35', '2018-05-12 04:08:18', '6f80819d-dc08-4136-ae7d-8f3d7c98bab8'),
(12, 'craft\\elements\\Asset', '2018-05-11 22:26:57', '2018-05-12 04:21:23', '87dc1610-7b03-451a-9fe4-d4e1ecb56755');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(14, 10, 'Info', 1, '2018-05-11 22:35:01', '2018-05-11 22:35:01', '92cddedc-3729-4ae3-9631-a6259bfcf426'),
(18, 11, 'Content', 1, '2018-05-12 04:08:18', '2018-05-12 04:08:18', 'd5ad31af-9478-4e15-a2ab-bc7543631275');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(11, 8, 'Bio', 'bio', 'global', '', 'none', NULL, 'craft\\ckeditor\\Field', '{\"purifierConfig\":\"\",\"purifyHtml\":\"\",\"columnType\":\"text\"}', '2018-05-11 22:22:55', '2018-05-11 22:22:55', '635754b2-3e15-42ef-986a-d606e758a05d'),
(12, 8, 'Contact', 'contact', 'global', 'Email address, location, etc.', 'none', NULL, 'craft\\ckeditor\\Field', '{\"purifierConfig\":\"\",\"purifyHtml\":\"\",\"columnType\":\"text\"}', '2018-05-11 22:23:36', '2018-05-11 22:23:36', '23fdb397-d9cf-410c-bf50-74c414add66c'),
(13, 8, 'Social', 'social', 'global', 'Social media links', 'none', NULL, 'craft\\ckeditor\\Field', '{\"purifierConfig\":\"\",\"purifyHtml\":\"\",\"columnType\":\"text\"}', '2018-05-11 22:24:02', '2018-05-11 22:24:02', 'c6a750be-ad7b-4d10-96f9-02c8cb41392d'),
(14, 9, 'Description', 'description', 'global', '', 'none', NULL, 'craft\\ckeditor\\Field', '{\"purifierConfig\":\"\",\"purifyHtml\":\"\",\"columnType\":\"text\"}', '2018-05-11 22:24:35', '2018-05-11 22:24:35', '4ca802e0-6bf7-4396-bb9b-dbbf4297d748'),
(15, 9, 'Client', 'client', 'global', '', 'none', NULL, 'craft\\ckeditor\\Field', '{\"purifierConfig\":\"\",\"purifyHtml\":\"\",\"columnType\":\"text\"}', '2018-05-11 22:25:05', '2018-05-11 22:25:05', 'd503b001-3f0a-4a28-8d1e-595f2a0d61d4'),
(16, 9, 'Contributor', 'contributor', 'global', '', 'none', NULL, 'craft\\ckeditor\\Field', '{\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"columnType\":\"text\"}', '2018-05-11 22:25:19', '2018-05-11 22:25:19', '28e52ff1-fa08-4c28-af82-e71da18c7c54'),
(18, 9, 'Image', 'image', 'global', '', 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"folder:4\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:4\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"\",\"selectionLabel\":\"Image\",\"localizeRelations\":false}', '2018-05-12 04:06:33', '2018-05-12 04:25:48', 'bfdc42c6-ef76-4994-965d-f4f2524570d9');

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `edition` tinyint(3) UNSIGNED NOT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `on` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `edition`, `timezone`, `name`, `on`, `maintenance`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.0.7', '3.0.91', 0, 'America/Chicago', 'scsiii', 1, 0, 'B7wIlzefHCeQ', '2018-05-02 18:55:21', '2018-05-12 04:25:48', '43d9b81e-44b7-4957-8185-b5ccb64b63a6');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'app', 'Install', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '73a15557-6ef8-46e2-a06e-750086672018'),
(2, NULL, 'app', 'm150403_183908_migrations_table_changes', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '71840121-076d-4882-a07b-6d3e59cb647c'),
(3, NULL, 'app', 'm150403_184247_plugins_table_changes', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '4eea0d7e-c3a3-466b-b93d-277d74ce9350'),
(4, NULL, 'app', 'm150403_184533_field_version', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '9f43964c-706e-4f96-99d3-f8f8e1c489c6'),
(5, NULL, 'app', 'm150403_184729_type_columns', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '35f7edf9-70ae-44e1-a75d-08b59e8583b9'),
(6, NULL, 'app', 'm150403_185142_volumes', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'c565f8f6-fb4b-462d-8538-a4a0e2ed74d5'),
(7, NULL, 'app', 'm150428_231346_userpreferences', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '6a3fd6ef-b012-4c82-a4a7-100c974fe999'),
(8, NULL, 'app', 'm150519_150900_fieldversion_conversion', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'cbdaf6af-1bbf-450a-907b-5f26a4011983'),
(9, NULL, 'app', 'm150617_213829_update_email_settings', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '059571da-c2be-4b78-97d0-7cd1ef1d4ad4'),
(10, NULL, 'app', 'm150721_124739_templatecachequeries', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'c79c4f05-7914-45f6-9418-7d71f03536a0'),
(11, NULL, 'app', 'm150724_140822_adjust_quality_settings', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'dc491a7f-04b6-4d3b-a956-8ad7a09a961e'),
(12, NULL, 'app', 'm150815_133521_last_login_attempt_ip', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'ee357e1a-57e3-4de0-bc44-04c80b13490e'),
(13, NULL, 'app', 'm151002_095935_volume_cache_settings', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '7e7a1ef5-9a29-4ca8-8047-1f8bf95aa93e'),
(14, NULL, 'app', 'm151005_142750_volume_s3_storage_settings', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '3fc6e528-90d9-49a3-b58a-f324ee826cee'),
(15, NULL, 'app', 'm151016_133600_delete_asset_thumbnails', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '021a9a48-580d-400c-a625-c32fe53d778c'),
(16, NULL, 'app', 'm151209_000000_move_logo', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '0d703077-b275-4b0e-b5c5-2f0f38c09a32'),
(17, NULL, 'app', 'm151211_000000_rename_fileId_to_assetId', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '503a0b07-2db0-4181-9863-8d017e40bf41'),
(18, NULL, 'app', 'm151215_000000_rename_asset_permissions', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '135e2191-dd14-4fc5-8d95-aa90f00e03bc'),
(19, NULL, 'app', 'm160707_000001_rename_richtext_assetsource_setting', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'c7ddea43-ffd1-41ef-b22d-2cdddbe99e45'),
(20, NULL, 'app', 'm160708_185142_volume_hasUrls_setting', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'acb5e04a-92ef-4b2d-909c-b8b2e68b0de3'),
(21, NULL, 'app', 'm160714_000000_increase_max_asset_filesize', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '32664c5f-1716-4fd5-8b6e-c1abaa70362b'),
(22, NULL, 'app', 'm160727_194637_column_cleanup', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'd13c21cd-92c4-4684-9794-f7a1ef47409f'),
(23, NULL, 'app', 'm160804_110002_userphotos_to_assets', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '6b8ae18b-2ef2-456d-9c98-9256168f6bf2'),
(24, NULL, 'app', 'm160807_144858_sites', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'bc777027-36f3-4401-9978-893e50ba6925'),
(25, NULL, 'app', 'm160829_000000_pending_user_content_cleanup', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '4895d898-9413-4301-af69-96c4b6c3c04e'),
(26, NULL, 'app', 'm160830_000000_asset_index_uri_increase', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '43e41c37-4e39-4ab6-8c22-b80d3696677e'),
(27, NULL, 'app', 'm160912_230520_require_entry_type_id', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'e2717206-3822-4e7f-a46e-99528e633cde'),
(28, NULL, 'app', 'm160913_134730_require_matrix_block_type_id', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'd1a8929c-b6ff-4945-a1e3-cb31b448c47c'),
(29, NULL, 'app', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'e8ebf9c9-5754-48ff-b4de-2581f4e5e409'),
(30, NULL, 'app', 'm160920_231045_usergroup_handle_title_unique', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'c666617e-40b5-4ade-8e81-00c3670cb644'),
(31, NULL, 'app', 'm160925_113941_route_uri_parts', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '6f8e2b0a-fe56-46b7-9066-22f81d1b38ba'),
(32, NULL, 'app', 'm161006_205918_schemaVersion_not_null', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '25e85a26-19de-49d3-b124-2d22460776f0'),
(33, NULL, 'app', 'm161007_130653_update_email_settings', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '7c6733ce-d7c0-4c73-9d1e-a08698269bb7'),
(34, NULL, 'app', 'm161013_175052_newParentId', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'c5b372d9-12cb-4ab5-8a44-49e7c99444c2'),
(35, NULL, 'app', 'm161021_102916_fix_recent_entries_widgets', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '1a6bc1fd-3d20-46af-b22b-37d32b458eab'),
(36, NULL, 'app', 'm161021_182140_rename_get_help_widget', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'bb77a245-8945-4a03-8a4b-7696e56e66f9'),
(37, NULL, 'app', 'm161025_000000_fix_char_columns', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '5ec2114b-3355-4c77-b9b7-1e724fcb617b'),
(38, NULL, 'app', 'm161029_124145_email_message_languages', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '3d7e2a31-5ac7-44c4-b030-536bb2339605'),
(39, NULL, 'app', 'm161108_000000_new_version_format', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'df5927eb-7fcc-468e-883e-bd8dc64fce7f'),
(40, NULL, 'app', 'm161109_000000_index_shuffle', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '0a496d35-106c-486a-a836-4dd207307995'),
(41, NULL, 'app', 'm161122_185500_no_craft_app', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '84a73498-eb5d-411c-b05c-798be853d1bf'),
(42, NULL, 'app', 'm161125_150752_clear_urlmanager_cache', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '654ca1a2-b45b-49c7-8acf-b4bfb5ab0253'),
(43, NULL, 'app', 'm161220_000000_volumes_hasurl_notnull', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'b05d37b8-5862-41a6-b1b0-615da281acd1'),
(44, NULL, 'app', 'm170114_161144_udates_permission', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '9b35a858-1657-4694-8645-16e13173b77c'),
(45, NULL, 'app', 'm170120_000000_schema_cleanup', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'd118fb7f-dd15-4299-af64-92b198d9d509'),
(46, NULL, 'app', 'm170126_000000_assets_focal_point', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '1447fa53-616c-453a-bcac-f9d6bb402fdc'),
(47, NULL, 'app', 'm170206_142126_system_name', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'a6884785-ab82-4e13-829f-d27f5990a121'),
(48, NULL, 'app', 'm170217_044740_category_branch_limits', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '40dd4b68-cada-43b4-b8ba-591b259142d6'),
(49, NULL, 'app', 'm170217_120224_asset_indexing_columns', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '72fd781c-9f2c-4d72-ae4b-208efd3b58cc'),
(50, NULL, 'app', 'm170223_224012_plain_text_settings', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '6b910bff-8e3d-4652-9fef-b1d58fc2a320'),
(51, NULL, 'app', 'm170227_120814_focal_point_percentage', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '02c1458b-1647-4e1b-b88a-26e43d6d74e8'),
(52, NULL, 'app', 'm170228_171113_system_messages', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'adae242b-c37a-45d2-96e5-f15f522c1eb5'),
(53, NULL, 'app', 'm170303_140500_asset_field_source_settings', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '38ac784e-26f0-448c-ac6d-e51e2032ff65'),
(54, NULL, 'app', 'm170306_150500_asset_temporary_uploads', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2045ecda-6464-451f-b861-1fc1bd1d9ec6'),
(55, NULL, 'app', 'm170414_162429_rich_text_config_setting', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '6982d3a4-506d-4c56-9408-0138c96df8fd'),
(56, NULL, 'app', 'm170523_190652_element_field_layout_ids', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '4bbcaf50-b866-46ef-aef9-3d86ecfecd57'),
(57, NULL, 'app', 'm170612_000000_route_index_shuffle', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '12f5f6c2-912e-42bd-aa70-0451f9080874'),
(58, NULL, 'app', 'm170621_195237_format_plugin_handles', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '9be1ef36-bc58-4417-9e9f-a58074e8698c'),
(59, NULL, 'app', 'm170630_161028_deprecation_changes', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'ef8264e9-b6f0-4ba0-95a8-65896a922c52'),
(60, NULL, 'app', 'm170703_181539_plugins_table_tweaks', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '97d321aa-a930-45da-afdb-183efd23198f'),
(61, NULL, 'app', 'm170704_134916_sites_tables', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'f8a0f3d7-4cd2-4c6b-8465-908f58d4349a'),
(62, NULL, 'app', 'm170706_183216_rename_sequences', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '53c9ce66-5152-4df4-bd99-54992b2723bd'),
(63, NULL, 'app', 'm170707_094758_delete_compiled_traits', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'e4c38b04-3f4f-47cc-a375-2ded16c71e8d'),
(64, NULL, 'app', 'm170731_190138_drop_asset_packagist', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2a32a0ca-21ba-4c87-8d29-6e61602299ef'),
(65, NULL, 'app', 'm170810_201318_create_queue_table', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'fce81fb9-65ea-4b20-9985-ebe8c975a3b1'),
(66, NULL, 'app', 'm170816_133741_delete_compiled_behaviors', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '547b1476-c39e-472f-9c5b-5f5103d472ac'),
(67, NULL, 'app', 'm170821_180624_deprecation_line_nullable', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '579df688-6dde-4b57-bacf-8b1b267844ee'),
(68, NULL, 'app', 'm170903_192801_longblob_for_queue_jobs', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '4398ac90-9a2c-421e-a05b-ec64accf59b2'),
(69, NULL, 'app', 'm170914_204621_asset_cache_shuffle', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '0df417fc-03cc-4b05-83e5-a2ff46595d80'),
(70, NULL, 'app', 'm171011_214115_site_groups', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'd817b8fb-f92b-4983-aaa9-f7261da70557'),
(71, NULL, 'app', 'm171012_151440_primary_site', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '24ed40c3-ddf4-463a-863b-b74a770bdcaf'),
(72, NULL, 'app', 'm171013_142500_transform_interlace', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '13b7b27a-ae93-4153-b737-879f200f59a4'),
(73, NULL, 'app', 'm171016_092553_drop_position_select', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '8817583f-bed0-41b3-9f23-fe7630a71f9f'),
(74, NULL, 'app', 'm171016_221244_less_strict_translation_method', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '8e722017-c115-4c2b-8fef-6fabcb8ba238'),
(75, NULL, 'app', 'm171107_000000_assign_group_permissions', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '05e9d92a-10aa-4768-b5f1-4c809b4b7b4a'),
(76, NULL, 'app', 'm171117_000001_templatecache_index_tune', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '1b76ac6f-ba16-48fe-a4e2-de1c745463f8'),
(77, NULL, 'app', 'm171126_105927_disabled_plugins', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '440ae760-5cf3-495a-9ef3-1a0c70db4754'),
(78, NULL, 'app', 'm171130_214407_craftidtokens_table', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', 'f8c81875-a423-4d1e-b458-b1793431d6df'),
(79, NULL, 'app', 'm171202_004225_update_email_settings', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '0116b5fb-99ef-46c1-b86e-fb75f1b00f1d'),
(80, NULL, 'app', 'm171204_000001_templatecache_index_tune_deux', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '0ceb531d-05a1-40a2-9089-06405558e69b'),
(81, NULL, 'app', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '102ff15d-7c5e-4f0a-80cc-c8612e0cceab'),
(82, NULL, 'app', 'm171218_143135_longtext_query_column', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '26a6d943-7511-4e10-ad78-e9d820ad89f8'),
(83, NULL, 'app', 'm171231_055546_environment_variables_to_aliases', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2f919e35-c133-4078-b549-7f089afaabd8'),
(84, NULL, 'app', 'm180113_153740_drop_users_archived_column', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '88c8a965-ca58-4768-acf6-ec5ab3d1e80e'),
(85, NULL, 'app', 'm180122_213433_propagate_entries_setting', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', 'f88f1fc3-2df1-444c-8227-ea31b8572975'),
(86, NULL, 'app', 'm180124_230459_fix_propagate_entries_values', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '8463f6d4-203b-4f99-9fa1-994c50f21f33'),
(87, NULL, 'app', 'm180128_235202_set_tag_slugs', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '4d825dd3-7245-42d5-8c31-1e526f454099'),
(88, NULL, 'app', 'm180202_185551_fix_focal_points', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', 'bea1d1b2-eb7d-4baa-8eb5-9cf50b8e16ff'),
(89, NULL, 'app', 'm180217_172123_tiny_ints', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '22cb41b2-3be7-4b4b-9227-b182547cb38e'),
(90, NULL, 'app', 'm180321_233505_small_ints', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', 'd3dbcdee-5c0f-4858-ac9b-0d30eeec8c96'),
(91, NULL, 'app', 'm180328_115523_new_license_key_statuses', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', 'f63afce0-0add-428b-a166-6996dc198c7d'),
(92, NULL, 'app', 'm180404_182320_edition_changes', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', 'fc6b7742-d64d-4891-a793-9d5f9e9f118b'),
(93, NULL, 'app', 'm180411_102218_fix_db_routes', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '712e26b3-3dd0-4100-a6dd-2f91a82ca07d'),
(94, NULL, 'app', 'm180416_205628_resourcepaths_table', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '87fa15ed-b232-45ab-9103-af56aa20e1ce'),
(95, NULL, 'app', 'm180418_205713_widget_cleanup', '2018-05-02 18:55:22', '2018-05-02 18:55:22', '2018-05-02 18:55:22', 'cb99dec9-4f47-4cf5-90c7-3ebbae6230e8');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKey` char(24) DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKey`, `licenseKeyStatus`, `enabled`, `settings`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ckeditor', '1.0.0-beta.2', '1.0.0', NULL, 'unknown', 1, NULL, '2018-05-03 19:26:22', '2018-05-03 19:26:22', '2018-05-11 22:42:19', '791cbdb9-0fd5-4548-8ad1-788804595db2');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(20, 18, 25, NULL, 23, 1, '2018-05-12 04:30:04', '2018-05-12 04:30:04', '1370141f-9e42-48ad-bce1-f2a290aab952'),
(21, 18, 25, NULL, 24, 2, '2018-05-12 04:30:04', '2018-05-12 04:30:04', 'faf508b2-59fd-45d9-bfb6-d75ffe329bcb'),
(22, 18, 20, NULL, 21, 1, '2018-05-12 04:38:09', '2018-05-12 04:38:09', 'aeb88357-acf7-40ab-ac41-099b66187964'),
(23, 18, 20, NULL, 22, 2, '2018-05-12 04:38:09', '2018-05-12 04:38:09', '5c586681-c166-4a4e-b651-8776d2b2b1e5'),
(24, 18, 27, NULL, 26, 1, '2018-05-12 14:18:00', '2018-05-12 14:18:00', '893b1b38-7dc0-4517-b836-44bea0adab05'),
(25, 18, 29, NULL, 28, 1, '2018-05-12 14:22:59', '2018-05-12 14:22:59', '67fa6ea6-a682-46e0-8c6a-4b24fd752e14');

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('102baa71', '@lib/fabric'),
('10431919', '@app/web/assets/updates/dist'),
('12c5e3b1', '@app/web/assets/deprecationerrors/dist'),
('1359f1b4', '@app/web/assets/dashboard/dist'),
('143edffa', '@app/web/assets/fields/dist'),
('198a5993', '@lib/garnishjs'),
('209d4866', '@lib/fileupload'),
('21b0580f', '@lib/prismjs'),
('23365286', '@lib/jquery-touch-events'),
('241bf635', '@craft/web/assets/tablesettings/dist'),
('24926e44', '@lib/picturefill'),
('2594983a', '@app/web/assets/sites/dist'),
('26ea7933', '@runtime/assets/thumbs/8'),
('2a374e15', '@lib/d3'),
('2c315e43', '@craft/web/assets/utilities/dist'),
('2f181468', '@app/web/assets/editentry/dist'),
('33ff33b4', '@app/web/assets/editentry/dist'),
('36d069c9', '@lib/d3'),
('38754998', '@lib/picturefill'),
('3c7a6fba', '@lib/fileupload'),
('3d577fd3', '@lib/prismjs'),
('3fd1755a', '@lib/jquery-touch-events'),
('43f20637', '@craft/web/assets/searchindexes/dist'),
('457f5f3f', '@lib/timepicker'),
('4d759b7b', '@app/web/assets/plugins/dist'),
('5207fd76', '@craft/web/assets/recententries/dist'),
('5247bd08', '@yii/debug/assets'),
('56d7e4f', '@lib/garnishjs'),
('599878e3', '@lib/timepicker'),
('5bc4bb29', '@craft/web/assets/updater/dist'),
('5f45025e', '@craft/web/assets/findreplace/dist'),
('5ffa4352', '@runtime/assets/thumbs/22'),
('6592eb43', '@craft/web/assets/generalsettings/dist'),
('66672096', '@lib/xregexp'),
('67213ed1', '@runtime/assets/thumbs/28'),
('673066bb', '@app/web/assets/edituser/dist'),
('6b15f2ed', '@app/web/assets/edittransform/dist'),
('6c0b641c', '@lib/selectize'),
('6c37c08e', '@craft/ckeditor/assets/field/dist'),
('6cbdbf18', '@craft/web/assets/updateswidget/dist'),
('6fb5843', '@bower/bootstrap/dist'),
('7099b47b', '@runtime/assets/thumbs/8'),
('70ec43c0', '@lib/selectize'),
('710eace9', '@runtime/assets/thumbs/24'),
('73c97c53', '@runtime/assets/thumbs/23'),
('76c36689', '@craft/web/assets/cp/dist'),
('77f2d531', '@app/web/assets/edittransform/dist'),
('7a80074a', '@lib/xregexp'),
('7bbf3d5f', '@craft/web/assets/installer/dist'),
('7fb856f4', '@craft/web/assets/pluginstore/dist'),
('846287f5', '@app/web/assets/matrixsettings/dist'),
('849e3537', '@vendor/yiisoft/yii2/assets'),
('86fa4d86', '@app/web/assets/routes/dist'),
('87a8f936', '@lib/element-resize-detector'),
('8d47529e', '@craft/web/assets/dashboard/dist'),
('8d9f826', '@app/web/assets/fields/dist'),
('9012933b', '@lib'),
('928db1f2', '@craft/web/assets/matrixsettings/dist'),
('984e7305', '@runtime/assets/thumbs/21'),
('9885a029', '@app/web/assets/matrixsettings/dist'),
('9b4fdeea', '@lib/element-resize-detector'),
('a00a8d04', '@runtime/assets/thumbs/26'),
('a31db16b', '@runtime/assets/thumbs/8'),
('a5508262', '@lib/velocity'),
('a5900a56', '@lib/jquery.payment'),
('a7e2b4ea', '@app/web/assets/tablesettings/dist'),
('a83852c3', '@bower/jquery/dist'),
('a94ff446', '@app/web/assets/feed/dist'),
('aec8dab5', '@app/web/assets/utilities/dist'),
('b1259e9f', '@runtime/assets/thumbs/21'),
('b22ffd69', '@app/web/assets/utilities/dist'),
('b2c4bc62', '@craft/web/assets/deprecationerrors/dist'),
('b4df751f', '@bower/jquery/dist'),
('b5a8d39a', '@app/web/assets/feed/dist'),
('b721efaf', '@runtime/assets/thumbs/28'),
('b9772d8a', '@lib/jquery.payment'),
('b9825444', '@runtime/assets/thumbs/8'),
('b9b7a5be', '@lib/velocity'),
('bb059336', '@app/web/assets/tablesettings/dist'),
('c094440', '@craft/web/assets/fields/dist'),
('c1866e1d', '@craft/web/assets/dbbackup/dist'),
('c317fedc', '@craft/web/assets/login/dist'),
('c7daab1', '@runtime/assets/thumbs/23'),
('c88d8d5a', '@app/web/assets/login/dist'),
('c8fbff67', '@runtime/assets/thumbs/15'),
('ca43ec5', '@app/web/assets/updates/dist'),
('cb114911', '@craft/web/assets/craftsupport/dist'),
('ccb39824', '@app/web/assets/cp/dist'),
('ccc8dad', '@lib/fabric'),
('cd199875', '@app/web/assets/recententries/dist'),
('d0254871', '@vendor/craftcms/ckeditor/lib/ckeditor/dist'),
('d054bff8', '@app/web/assets/cp/dist'),
('d1febfa9', '@app/web/assets/recententries/dist'),
('d78bd50f', '@app/web/assets/pluginstore/dist'),
('d7f520b4', '@runtime/assets/thumbs/8'),
('e1d65106', '@app/web/assets/craftsupport/dist'),
('e22c46d', '@app/web/assets/deprecationerrors/dist'),
('e707b60a', '@app/web/assets/generalsettings/dist'),
('e94881ae', '@runtime/assets/thumbs/15'),
('e9a08faa', '@craft/web/assets/plugins/dist'),
('ea76dfc5', '@runtime/assets/thumbs/8'),
('eba7a0b', '@runtime/assets/thumbs/24'),
('ebf919c7', '@lib/jquery-ui'),
('ee8971f4', '@runtime/assets/thumbs/26'),
('ef44fdc7', '@app/web/assets/updateswidget/dist'),
('f3a3da1b', '@app/web/assets/updateswidget/dist'),
('f4047455', '@craft/web/assets/feed/dist'),
('f41db42d', '@craft/web/assets/clearcaches/dist'),
('f6b263f', '@runtime/assets/thumbs/22'),
('f71e3e1b', '@lib/jquery-ui'),
('f946b9a9', '@app/web/assets/installer/dist'),
('fbe091d6', '@app/web/assets/generalsettings/dist'),
('fbed668', '@app/web/assets/dashboard/dist'),
('fd3176da', '@app/web/assets/craftsupport/dist'),
('ff11aff8', '@app/web/assets/updater/dist');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `siteId` int(11) DEFAULT NULL,
  `uriParts` varchar(255) NOT NULL,
  `uriPattern` varchar(255) NOT NULL,
  `template` varchar(500) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' sam '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' samuel c solomon gmail com '),
(1, 'slug', 0, 1, ''),
(29, 'field', 15, 1, ' american way '),
(29, 'field', 16, 1, ' photographs by chris korbey '),
(28, 'kind', 0, 1, ' image '),
(28, 'slug', 0, 1, ''),
(28, 'title', 0, 1, ' aw school '),
(29, 'field', 14, 1, ' feature weighing the benefits of single sex education '),
(25, 'field', 16, 1, ' photographs by fredrik broden '),
(25, 'field', 18, 1, ' 17w cover 17w ownership '),
(25, 'slug', 0, 1, ' dna ownership '),
(25, 'title', 0, 1, ' dna ownership '),
(26, 'filename', 0, 1, ' aw_kreskin jpg '),
(26, 'extension', 0, 1, ' jpg '),
(26, 'kind', 0, 1, ' image '),
(26, 'slug', 0, 1, ''),
(26, 'title', 0, 1, ' aw kreskin '),
(27, 'field', 14, 1, ' feature profile on the amazing kreskin '),
(27, 'field', 15, 1, ' american way '),
(27, 'field', 16, 1, ' photographs by ian allen '),
(27, 'field', 18, 1, ' aw kreskin '),
(27, 'slug', 0, 1, ' kreskin '),
(27, 'title', 0, 1, ' kreskin '),
(28, 'filename', 0, 1, ' aw_school jpg '),
(28, 'extension', 0, 1, ' jpg '),
(19, 'slug', 0, 1, ' info '),
(19, 'title', 0, 1, ' info '),
(21, 'filename', 0, 1, ' 17_colon01 jpg '),
(21, 'extension', 0, 1, ' jpg '),
(21, 'kind', 0, 1, ' image '),
(21, 'slug', 0, 1, ''),
(21, 'title', 0, 1, ' 17 colon01 '),
(22, 'filename', 0, 1, ' 17_colon02 jpg '),
(22, 'extension', 0, 1, ' jpg '),
(22, 'kind', 0, 1, ' image '),
(22, 'slug', 0, 1, ''),
(22, 'title', 0, 1, ' 17 colon02 '),
(25, 'field', 15, 1, ' genome magazine '),
(20, 'field', 18, 1, ' 17 colon01 17 colon02 '),
(23, 'filename', 0, 1, ' 17w_cover jpg '),
(23, 'extension', 0, 1, ' jpg '),
(23, 'kind', 0, 1, ' image '),
(23, 'slug', 0, 1, ''),
(23, 'title', 0, 1, ' 17w cover '),
(24, 'filename', 0, 1, ' 17w_ownership jpg '),
(24, 'extension', 0, 1, ' jpg '),
(24, 'kind', 0, 1, ' image '),
(24, 'slug', 0, 1, ''),
(24, 'title', 0, 1, ' 17w ownership '),
(25, 'field', 14, 1, ' cover story on dna ownership '),
(18, 'title', 0, 1, ' homepage '),
(18, 'slug', 0, 1, ' homepage '),
(20, 'field', 14, 1, ' colon cancer feature '),
(20, 'field', 15, 1, ' genome magazine '),
(20, 'field', 16, 1, ' illustrations by mike mcquade '),
(20, 'field', 17, 1, ' 17 colon02 '),
(20, 'slug', 0, 1, ' colon cancer '),
(20, 'title', 0, 1, ' colon cancer '),
(19, 'field', 11, 1, ' sam solomon is a texas based designer art director and photographer specializing in editorial design and branding he is creative director for genome a health and science quarterly focused on genomics previously he was art director for american way and a contributor to texas monthly and d magazine he has sat on the design jury for the society of publication designers and has been recognized for his work by the spd communication arts print graphis and the dallas society for visual communication '),
(19, 'field', 12, 1, ' sam samsolomon co '),
(19, 'field', 13, 1, ' instagrambehance '),
(29, 'field', 18, 1, ' aw school '),
(29, 'slug', 0, 1, ' education '),
(29, 'title', 0, 1, ' education ');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagateEntries` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagateEntries`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(8, NULL, 'Homepage', 'homepage', 'single', 1, 1, '2018-05-11 22:19:49', '2018-05-11 22:19:49', '4d85bb51-a3be-4ce6-94a8-94ad3599bb28'),
(9, NULL, 'Info', 'info', 'single', 1, 1, '2018-05-11 22:20:04', '2018-05-11 22:20:04', 'e934398f-41a6-4bbf-bdb8-a785df187b21'),
(10, NULL, 'Projects', 'projects', 'channel', 1, 1, '2018-05-11 22:20:35', '2018-05-11 22:20:35', '114c9a98-9a3a-4a11-8065-84053c3b0cd7');

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(8, 8, 1, 1, '/', 'homepage/_entry', 1, '2018-05-11 22:19:49', '2018-05-11 22:19:49', '4deeb978-f720-4425-a47d-165dbd1bf92a'),
(9, 9, 1, 1, 'info', 'info/_entry', 1, '2018-05-11 22:20:04', '2018-05-11 22:20:04', '4540c00e-c9ef-4313-80b6-475cb90ed8db'),
(10, 10, 1, 1, 'projects/{slug}', 'projects/_entry', 1, '2018-05-11 22:20:35', '2018-05-11 22:20:35', '6e805249-e276-4695-816c-889c93bb9959');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'qIdrhWfmOLY0xIvRnwrUlDyGKYuvq3Bm2m6zFJR7uHdpRpTxdL_TMPqhitk0wklAxb3-17lxjPqTjRN2m_J180Fw-AYR65YS7TeT', '2018-05-10 14:11:48', '2018-05-10 14:24:04', 'dad0f2d9-fbef-4636-a9e4-388474b0a106'),
(2, 1, 'HsiPl93nU7XHTbdC6VBUhCteRo4SeAW9vFdIErqIp4wLj2d9Ul3U3L5pv5CM97-1xlVJfWIBLJTjzs9Y4Nlp-R4bE_I_DOkQH4HZ', '2018-05-10 21:49:56', '2018-05-10 22:17:06', 'dc3c61d2-9659-4898-b3be-4132b20952ea'),
(4, 1, 'KNuKxr1mya4mJ97F70J-l9Yr2ghPRTAUSs4zVmscjQC5BJerZPFrqTSXXaaJ-xcgrgOmRzOE2h98w7uXBPlxv1bGQ3Pre0h9aWwK', '2018-05-12 03:57:32', '2018-05-12 04:48:49', '52059918-31c7-4b05-b08f-dbff1986e63f');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'scsiii', '2018-05-02 18:55:21', '2018-05-02 18:55:21', 'f4af14d1-2c68-487e-8e38-916b615a98c9');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 'scsiii', 'default', 'en-US', 1, '@web/', 1, '2018-05-02 18:55:21', '2018-05-02 18:55:21', '347c8d41-90f0-4c6b-aa05-8b6b4db85f31');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `systemsettings`
--

CREATE TABLE `systemsettings` (
  `id` int(11) NOT NULL,
  `category` varchar(15) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `systemsettings`
--

INSERT INTO `systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'email', '{\"fromEmail\":\"samuel.c.solomon@gmail.com\",\"fromName\":\"scsiii\",\"transportType\":\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"}', '2018-05-02 18:55:21', '2018-05-02 18:55:21', '906927be-7717-4b8b-98d4-2beb1d5c45a1');

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\",\"weekStartDay\":\"0\",\"enableDebugToolbarForSite\":true,\"enableDebugToolbarForCp\":true}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
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
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'sam', NULL, '', '', 'samuel.c.solomon@gmail.com', '$2y$13$E.8xkRMAjaimp7kSGa57tOipy8X3ldigwipn/wx7EaUvINZ40VRyq', 1, 0, 0, 0, '2018-05-12 21:10:17', '::1', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2018-05-10 14:46:24', '2018-05-02 18:55:21', '2018-05-12 21:10:17', '10a5e201-beaf-4063-91fd-f9786fbc183c');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, NULL, NULL, 'Temporary source', NULL, '2018-05-10 16:25:57', '2018-05-10 16:25:57', '62cc5152-f431-4990-a777-2f57a74de18a'),
(3, 2, NULL, 'user_1', 'user_1/', '2018-05-10 16:25:57', '2018-05-10 16:25:57', 'ef02f067-b1a2-4a32-bc79-4f3eb0d70823'),
(4, NULL, 2, 'Projects', '', '2018-05-11 22:26:57', '2018-05-11 22:50:32', '26155b98-60c7-40bd-a614-c154ae6a9ee6');

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `volumes`
--

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 12, 'Projects', 'projects', 'craft\\volumes\\Local', 1, '//localhost:8888/images', '{\"path\":\"/Users/ssolomom/git/scsiii/web/images\"}', 1, '2018-05-11 22:26:57', '2018-05-12 04:21:23', 'c0b50ce3-dd0f-4e0f-b4e6-23fa146d2dd6');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, 0, '{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}', 1, '2018-05-02 19:44:14', '2018-05-02 19:44:14', '26f762f5-31bd-482c-96d0-b9afb24fe75b'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, 0, '[]', 1, '2018-05-02 19:44:14', '2018-05-02 19:44:14', 'c972e868-cce8-45b9-9bd8-9464980d26b7'),
(3, 1, 'craft\\widgets\\Updates', 3, 0, '[]', 1, '2018-05-02 19:44:14', '2018-05-02 19:44:14', '2d4be61c-9a8f-4b2d-92a0-304c9ed95f61'),
(4, 1, 'craft\\widgets\\Feed', 4, 0, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2018-05-02 19:44:14', '2018-05-02 19:44:14', '36ad3cbb-50eb-472b-9105-b42ff4a4dbac');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assets_filename_folderId_unq_idx` (`filename`,`folderId`),
  ADD KEY `assets_folderId_idx` (`folderId`),
  ADD KEY `assets_volumeId_idx` (`volumeId`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_groupId_idx` (`groupId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `categorygroups_handle_unq_idx` (`handle`),
  ADD KEY `categorygroups_structureId_idx` (`structureId`),
  ADD KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `content_siteId_idx` (`siteId`),
  ADD KEY `content_title_idx` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `elements_type_idx` (`type`),
  ADD KEY `elements_enabled_idx` (`enabled`),
  ADD KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD UNIQUE KEY `elements_sites_uri_siteId_unq_idx` (`uri`,`siteId`),
  ADD KEY `elements_sites_siteId_idx` (`siteId`),
  ADD KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `elements_sites_enabled_idx` (`enabled`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_postDate_idx` (`postDate`),
  ADD KEY `entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `entries_authorId_idx` (`authorId`),
  ADD KEY `entries_sectionId_idx` (`sectionId`),
  ADD KEY `entries_typeId_idx` (`typeId`);

--
-- Indexes for table `entrydrafts`
--
ALTER TABLE `entrydrafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrydrafts_sectionId_idx` (`sectionId`),
  ADD KEY `entrydrafts_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `entrydrafts_siteId_idx` (`siteId`),
  ADD KEY `entrydrafts_creatorId_idx` (`creatorId`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  ADD UNIQUE KEY `entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  ADD KEY `entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `entryversions`
--
ALTER TABLE `entryversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entryversions_sectionId_idx` (`sectionId`),
  ADD KEY `entryversions_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `entryversions_siteId_idx` (`siteId`),
  ADD KEY `entryversions_creatorId_idx` (`creatorId`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldgroups_name_unq_idx` (`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `fields_groupId_idx` (`groupId`),
  ADD KEY `fields_context_idx` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `globalsets_name_unq_idx` (`name`),
  ADD UNIQUE KEY `globalsets_handle_unq_idx` (`handle`),
  ADD KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  ADD KEY `matrixblocks_ownerSiteId_idx` (`ownerSiteId`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `migrations_pluginId_idx` (`pluginId`),
  ADD KEY `migrations_type_pluginId_idx` (`type`,`pluginId`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plugins_handle_unq_idx` (`handle`),
  ADD KEY `plugins_enabled_idx` (`enabled`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `relations_sourceId_idx` (`sourceId`),
  ADD KEY `relations_targetId_idx` (`targetId`),
  ADD KEY `relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `routes_uriPattern_idx` (`uriPattern`),
  ADD KEY `routes_siteId_idx` (`siteId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `sections_name_unq_idx` (`name`),
  ADD KEY `sections_structureId_idx` (`structureId`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_uid_idx` (`uid`),
  ADD KEY `sessions_token_idx` (`token`),
  ADD KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `sessions_userId_idx` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sitegroups_name_unq_idx` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sites_handle_unq_idx` (`handle`),
  ADD KEY `sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `sites_groupId_fk` (`groupId`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `structureelements_root_idx` (`root`),
  ADD KEY `structureelements_lft_idx` (`lft`),
  ADD KEY `structureelements_rgt_idx` (`rgt`),
  ADD KEY `structureelements_level_idx` (`level`),
  ADD KEY `structureelements_elementId_idx` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `systemmessages_language_idx` (`language`);

--
-- Indexes for table `systemsettings`
--
ALTER TABLE `systemsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemsettings_category_unq_idx` (`category`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taggroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `taggroups_handle_unq_idx` (`handle`),
  ADD KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_groupId_idx` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unq_idx` (`token`),
  ADD KEY `tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `usergroups_name_unq_idx` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unq_idx` (`username`),
  ADD UNIQUE KEY `users_email_unq_idx` (`email`),
  ADD KEY `users_uid_idx` (`uid`),
  ADD KEY `users_verificationCode_idx` (`verificationCode`),
  ADD KEY `users_photoId_fk` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `volumefolders_parentId_idx` (`parentId`),
  ADD KEY `volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumes_name_unq_idx` (`name`),
  ADD UNIQUE KEY `volumes_handle_unq_idx` (`handle`),
  ADD KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `entrydrafts`
--
ALTER TABLE `entrydrafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `entryversions`
--
ALTER TABLE `entryversions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemsettings`
--
ALTER TABLE `systemsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrydrafts`
--
ALTER TABLE `entrydrafts`
  ADD CONSTRAINT `entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entryversions`
--
ALTER TABLE `entryversions`
  ADD CONSTRAINT `entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entryversions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `migrations`
--
ALTER TABLE `migrations`
  ADD CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
