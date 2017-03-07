-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 07, 2017 at 08:55 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `image_footage`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `password` (`password`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `status`) VALUES
(1, 'admin', '49c7c09ed3b1ed297cb4b7cde4ebcf3ade1c65c3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `url_link` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `active` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `active` (`active`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `banner_image`, `url_link`, `sort`, `active`, `created`, `modified`) VALUES
(1, 'Title1', 'banner_1.png', 'http://google.com/', 1, 1, '2013-08-19 10:54:21', '2013-08-19 10:54:56'),
(2, 'Title2', 'banner_2.png', 'http://gmail.com/', 2, 1, '2013-08-19 10:54:37', '2013-08-19 10:54:37'),
(3, 'Title3', 'banner_3.jpg', 'http://gmail.com/', NULL, 1, '2013-12-09 07:48:52', '2013-12-09 07:48:52');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `active` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `active` (`active`),
  KEY `position` (`position`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `position`, `active`, `created`, `modified`) VALUES
(1, 0, 'Forest', 2, 1, '2017-01-15 04:45:12', '2017-01-16 19:23:03'),
(2, 0, 'Mountain', 1, 1, '2017-01-15 04:45:36', '2017-01-16 19:23:03'),
(3, 1, 'small forest', 0, 1, '2017-01-15 04:48:51', '2017-01-15 04:48:51'),
(4, 2, 'small mountain', 0, 1, '2017-01-15 04:49:07', '2017-01-15 04:49:07');

-- --------------------------------------------------------

--
-- Table structure for table `categories_products`
--

CREATE TABLE IF NOT EXISTS `categories_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`category_id`,`product_id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `categories_products`
--

INSERT INTO `categories_products` (`id`, `category_id`, `product_id`) VALUES
(1, 3, 1),
(2, 3, 2),
(25, 3, 3),
(4, 3, 4),
(5, 3, 5),
(13, 4, 6),
(20, 2, 7),
(21, 4, 8),
(19, 2, 9),
(22, 3, 10),
(24, 3, 11);

-- --------------------------------------------------------

--
-- Table structure for table `company_infos`
--

CREATE TABLE IF NOT EXISTS `company_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `address1` varchar(250) NOT NULL DEFAULT '',
  `address2` varchar(250) NOT NULL DEFAULT '',
  `city` varchar(250) NOT NULL DEFAULT '',
  `state` varchar(250) NOT NULL DEFAULT '',
  `country` varchar(250) NOT NULL DEFAULT '',
  `zip` varchar(250) NOT NULL DEFAULT '',
  `phone` varchar(250) NOT NULL DEFAULT '',
  `fax` varchar(250) NOT NULL DEFAULT '',
  `from_email` varchar(250) NOT NULL DEFAULT '',
  `url` text NOT NULL,
  `alert_email` text NOT NULL,
  `from_name` varchar(200) NOT NULL DEFAULT '',
  `subject` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `company_infos`
--

INSERT INTO `company_infos` (`id`, `name`, `address1`, `address2`, `city`, `state`, `country`, `zip`, `phone`, `fax`, `from_email`, `url`, `alert_email`, `from_name`, `subject`, `created`, `modified`) VALUES
(1, '', '', '', '', '', '', '10022', '', '', 'info@ecomsimon.com', 'ecomsimon.com', 'info@ecomsimon.com', 'Admin', 'Message', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_type` int(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `description` text,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` tinytext,
  `meta_keywords` tinytext,
  `sort` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `permalink` (`permalink`),
  KEY `active` (`active`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `category_type`, `name`, `permalink`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `sort`, `active`, `created`, `modified`) VALUES
(1, 1, 'About Us', 'aboutus', '<p>THis is about us</p>', '', '', '', 1, 1, '2013-08-20 11:00:45', '2013-09-06 14:04:18'),
(2, 1, 'Contact Us', 'contactus', '<p>THis is contact us aaaa</p>', '', '', '', 2, 1, '2013-08-20 11:01:49', '2013-09-20 10:53:53'),
(3, 2, 'Orders and Returns', 'returns', '<p>this is Orders and Return</p>', '', '', '', 1, 1, '2013-08-20 11:03:13', '2013-08-23 12:51:06');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=230 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`) VALUES
(1, 'AL', 'Albania'),
(2, 'DZ', 'Algeria'),
(3, 'AS', 'American Samoa'),
(4, 'AD', 'Andorra'),
(5, 'AI', 'Anguilla'),
(6, 'AG', 'Antigua'),
(7, 'AR', 'Argentina'),
(8, 'AW', 'Aruba'),
(9, 'AU', 'Australia'),
(10, 'AT', 'Austria'),
(11, 'AP', 'Azores'),
(12, 'AS', 'Bahamas'),
(13, 'BH', 'Bahrain'),
(14, 'BD', 'Bangladesh'),
(15, 'BB', 'Barbados'),
(16, 'BC', 'Barbuda'),
(17, 'BE', 'Belgium'),
(18, 'BZ', 'Belize'),
(19, 'BJ', 'Benin'),
(20, 'BM', 'Bermuda'),
(21, 'BO', 'Bolivia'),
(22, 'BL', 'Bonaire'),
(23, 'BW', 'Botswana'),
(24, 'BR', 'Brazil'),
(25, 'VG', 'British Virgin Islands'),
(26, 'BN', 'Brunei'),
(27, 'BG', 'Bulgaria'),
(28, 'BF', 'Burkina Faso'),
(29, 'BI', 'Burundi'),
(30, 'KH', 'Cambodia'),
(31, 'CM', 'Cameroon'),
(32, 'CA', 'Canada'),
(33, 'CE', 'Canary Islands'),
(34, 'CV', 'Cape Verde Islands'),
(35, 'KY', 'Cayman Islands'),
(36, 'CF', 'Central African Republic'),
(37, 'TD', 'Chad'),
(38, 'NN', 'Channel Islands'),
(39, 'CL', 'Chile'),
(40, 'CN', 'China, Peoples Republic of'),
(41, 'CX', 'Christmas Island'),
(42, 'CC', 'Cocos Islands'),
(43, 'CO', 'Colombia'),
(44, 'CG', 'Congo'),
(45, 'CK', 'Cook Islands'),
(46, 'CR', 'Costa Rica'),
(47, 'HR', 'Croatia'),
(48, 'CB', 'Curacao'),
(49, 'CY', 'Cyprus'),
(50, 'CZ', 'Czech Republic'),
(51, 'DK', 'Denmark'),
(52, 'DJ', 'Djibouti'),
(53, 'DM', 'Dominica'),
(54, 'DO', 'Dominican Republic'),
(55, 'EC', 'Ecuador'),
(56, 'EG', 'Egypt'),
(57, 'SV', 'El Salvador'),
(58, 'GQ', 'Equitorial Guinea'),
(59, 'ER', 'Eritrea'),
(60, 'EE', 'Estonia'),
(61, 'ET', 'Ethiopia'),
(62, 'FO', 'Faeroe Islands'),
(63, 'FJ', 'Fiji'),
(64, 'FI', 'Finland'),
(65, 'FR', 'France'),
(66, 'GF', 'French Guiana'),
(67, 'PF', 'French Polynesia'),
(68, 'GA', 'Gabon'),
(69, 'GM', 'Gambia'),
(70, 'DE', 'Germany'),
(71, 'GH', 'Ghana'),
(72, 'GI', 'Gibraltar'),
(73, 'GR', 'Greece'),
(74, 'GL', 'Greenland'),
(75, 'GD', 'Grenada'),
(76, 'GP', 'Guadeloupe'),
(77, 'GU', 'Guam'),
(78, 'GT', 'Guatemala'),
(79, 'GN', 'Guinea'),
(80, 'GW', 'Guinea-Bissau'),
(81, 'GY', 'Guyana'),
(82, 'HT', 'Haiti'),
(83, 'HO', 'Holland'),
(84, 'HN', 'Honduras'),
(85, 'HK', 'Hong Kong'),
(86, 'HU', 'Hungary'),
(87, 'IS', 'Iceland'),
(88, 'IN', 'India'),
(89, 'ID', 'Indonesia'),
(90, 'IR', 'Iran'),
(91, 'IE', 'Ireland'),
(92, 'IL', 'Israel'),
(93, 'IT', 'Italy'),
(94, 'CI', 'Ivory Coast (Cote d`Ivoire)'),
(95, 'JM', 'Jamaica'),
(96, 'JP', 'Japan'),
(97, 'JO', 'Jordan'),
(98, 'KE', 'Kenya'),
(99, 'KI', 'Kiribati'),
(100, 'KR', 'Korea, South'),
(101, 'KO', 'Kosrae'),
(102, 'KW', 'Kuwait'),
(103, 'KG', 'Kyrgyzstan'),
(104, 'LA', 'Laos'),
(105, 'LB', 'Lebanon'),
(106, 'LS', 'Lesotho'),
(107, 'LR', 'Liberia'),
(108, 'LI', 'Liechtenstein'),
(109, 'LU', 'Luxembourg'),
(110, 'MO', 'Macau'),
(111, 'MK', 'Macedonia'),
(112, 'MG', 'Madagascar'),
(113, 'ME', 'Madeira'),
(114, 'MW', 'Malawi'),
(115, 'MY', 'Malaysia'),
(116, 'MV', 'Maldives'),
(117, 'ML', 'Mali'),
(118, 'MT', 'Malta'),
(119, 'MH', 'Marshall Islands'),
(120, 'MQ', 'Martinique'),
(121, 'MR', 'Mauritania'),
(122, 'MU', 'Mauritius'),
(123, 'MX', 'Mexico'),
(124, 'FM', 'Micronesia'),
(125, 'MC', 'Monaco'),
(126, 'MS', 'Montserrat'),
(127, 'MA', 'Morocco'),
(128, 'MZ', 'Mozambique'),
(129, 'MM', 'Myanmar'),
(130, 'NA', 'Namibia'),
(131, 'NP', 'Nepal'),
(132, 'NL', 'Netherlands'),
(133, 'AN', 'Netherlands Antilles'),
(134, 'NV', 'Nevis'),
(135, 'NC', 'New Caledonia'),
(136, 'NZ', 'New Zealand'),
(137, 'NI', 'Nicaragua'),
(138, 'NE', 'Niger'),
(139, 'NG', 'Nigeria'),
(140, 'NU', 'Niue'),
(141, 'NF', 'Norfolk Island'),
(142, 'NB', 'Northern Ireland'),
(143, 'MP', 'Northern Mariana Islands'),
(144, 'NO', 'Norway'),
(145, 'OM', 'Oman'),
(146, 'PK', 'Pakistan'),
(147, 'PW', 'Palau'),
(148, 'PA', 'Panama'),
(149, 'PG', 'Papua New Guinea'),
(150, 'PY', 'Paraguay'),
(151, 'PE', 'Peru'),
(152, 'PH', 'Philippines'),
(153, 'PL', 'Poland'),
(154, 'PO', 'Ponape'),
(155, 'PT', 'Portugal'),
(156, 'PR', 'Puerto Rico'),
(157, 'QA', 'Qatar'),
(158, 'RE', 'Reunion'),
(159, 'RO', 'Romania'),
(160, 'RT', 'Rota'),
(161, 'RW', 'Rwanda'),
(162, 'SS', 'Saba'),
(163, 'SP', 'Saipan'),
(164, 'SA', 'Saudi Arabia'),
(165, 'SF', 'Scotland'),
(166, 'SN', 'Senegal'),
(167, 'SC', 'Seychelles'),
(168, 'SL', 'Sierra Leone'),
(169, 'SG', 'Singapore'),
(170, 'SK', 'Slovak Republic'),
(171, 'SI', 'Slovenia'),
(172, 'SB', 'Solomon Islands'),
(173, 'ZA', 'South Africa'),
(174, 'ES', 'Spain'),
(175, 'LK', 'Sri Lanka'),
(176, 'NT', 'St. Barthelemy'),
(177, 'SW', 'St. Christopher'),
(178, 'SX', 'St. Croix'),
(179, 'EU', 'St. Eustatius'),
(180, 'UV', 'St. John'),
(181, 'KN', 'St. Kitts'),
(182, 'LC', 'St. Lucia'),
(183, 'MB', 'St. Maarten'),
(184, 'TB', 'St. Martin'),
(185, 'VL', 'St. Thomas'),
(186, 'VC', 'St. Vincent and the Grenadines'),
(187, 'SD', 'Sudan'),
(188, 'SR', 'Suriname'),
(189, 'SZ', 'Swaziland'),
(190, 'SE', 'Sweden'),
(191, 'CH', 'Switzerland'),
(192, 'SY', 'Syria'),
(193, 'TA', 'Tahiti'),
(194, 'TW', 'Taiwan'),
(195, 'TZ', 'Tanzania'),
(196, 'TH', 'Thailand'),
(197, 'TI', 'Tinian'),
(198, 'TG', 'Togo'),
(199, 'TO', 'Tonga'),
(200, 'TL', 'Tortola'),
(201, 'TT', 'Trinidad and Tobago'),
(202, 'TU', 'Truk'),
(203, 'TN', 'Tunisia'),
(204, 'TR', 'Turkey'),
(205, 'TC', 'Turks and Caicos Islands'),
(206, 'TV', 'Tuvalu'),
(207, 'VI', 'U.S. Virgin Islands'),
(208, 'UG', 'Uganda'),
(209, 'UI', 'Union Island'),
(210, 'AE', 'United Arab Emirates'),
(211, 'US', 'United States'),
(212, 'UY', 'Uruguay'),
(213, 'VU', 'Vanuatu'),
(214, 'VE', 'Venezuela'),
(215, 'VN', 'Vietnam'),
(216, 'VR', 'Virgin Gorda'),
(217, 'WK', 'Wake Island'),
(218, 'WL', 'Wales'),
(219, 'WF', 'Wallis and Futuna Islands'),
(220, 'WS', 'Western Samoa'),
(221, 'YA', 'Yap'),
(222, 'YE', 'Yemen'),
(223, 'ZR', 'Zaire'),
(224, 'ZM', 'Zambia'),
(225, 'ZW', 'Zimbabwe'),
(226, 'GB', 'United Kingdom'),
(227, 'TE', 'East Timor'),
(228, 'YU', 'Yugoslavia'),
(229, 'EH', 'Western Sahara');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `coupon_type` varchar(50) DEFAULT NULL,
  `coupon_value` double NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `maximum_uses` int(11) NOT NULL DEFAULT '0',
  `number_of_uses` int(11) NOT NULL DEFAULT '0',
  `description` text,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `coupon_type`, `coupon_value`, `from_date`, `to_date`, `maximum_uses`, `number_of_uses`, `description`, `active`, `created`, `modified`) VALUES
(1, 'ABC', '%', 10, '2014-05-01', '2014-08-31', 0, 2, 'This is ', 1, '2013-12-23 12:24:01', '2013-12-24 11:58:09'),
(2, 'ABCD', '$', 10, '2014-05-01', '2014-08-31', 0, 1, 'sfdg', 1, '2013-12-23 12:26:32', '2013-12-24 11:57:18');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draft_name` varchar(255) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `draft_name`, `from_email`, `from_name`, `subject`, `content`) VALUES
(1, 'User Registration', 'admin@webvirtue.com', 'Admin', 'User Registration', '<p>Hello ##first_name##,</p>\r\n<p><br />Thank you for registering with us<br /><br />To activate your account please click on the Activation Link below:<br /><br />##activation_link##<br /><br /><br />Your Login Detail are as followed. <br /><br />User Name: ##email_address##<br />Password: ##password##</p>\r\n<p>Thank you</p>'),
(2, 'Forgot password', 'admin@webvirtue.com', 'Admin', 'Password Reset', '<p>Dear ##user_name##,<br /><br />Your password has been reset. Below are the login details for your account.<br /><br />User Email: ##email_address##<br />Password: ##password##</p>\r\n<p><br /><br />Thank you,<br />Silver Bliss Team</p>'),
(3, 'Email To Friend', 'admin@webvirtue.com', 'Silver Bliss Admin', 'Your friend share a link', '<p>Hello</p>\r\n<p>Following link is share by your friend.</p>\r\n<p>##product_link##</p>\r\n<p>Message by your friend:</p>\r\n<p>##user_message##</p>\r\n<p>&nbsp;</p>\r\n<p>Thank you</p>\r\n<p>Silver Bliss Team</p>\r\n<p>&nbsp;</p>');

-- --------------------------------------------------------

--
-- Table structure for table `image_uploads`
--

CREATE TABLE IF NOT EXISTS `image_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `url_link` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `active` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `active` (`active`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `image_uploads`
--

INSERT INTO `image_uploads` (`id`, `title`, `banner_image`, `url_link`, `sort`, `active`, `created`, `modified`) VALUES
(31, 'test2', 'dashboard1-2.png', 'www.url.com', NULL, 1, '2017-01-08 20:13:43', '2017-01-08 20:13:43'),
(32, 'testff', NULL, 'fsdfsdf', NULL, 1, '2017-01-09 07:44:07', '2017-01-09 07:44:07'),
(22, 'test1', 'bubble_chart.png', 'www.url.com', NULL, 1, '2017-01-08 19:54:54', '2017-01-08 19:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `manage_banners`
--

CREATE TABLE IF NOT EXISTS `manage_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `banner_link` varchar(255) DEFAULT NULL,
  `short_description` varchar(250) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `active` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `active` (`active`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `manage_banners`
--

INSERT INTO `manage_banners` (`id`, `name`, `banner_image`, `banner_link`, `short_description`, `sort`, `active`, `created`, `modified`) VALUES
(2, 'Hey Mister Mister!', '2.jpg', '', 'This is Photoshop''s version of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis.', 1, 1, '2013-08-09 08:24:38', '2013-08-09 08:26:08'),
(3, 'Hey Mister Mister!!', '3.jpg', '', 'This is Photoshop''s version of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis.', 2, 1, '2013-08-09 08:27:25', '2013-08-09 08:27:25'),
(4, 'Hey Mister Mister !', '4.jpg', '', 'This is Photoshop''s version of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis.', 3, 1, '2013-08-09 08:27:50', '2013-08-09 08:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `multiple_image_uploads`
--

CREATE TABLE IF NOT EXISTS `multiple_image_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_upload_id` int(11) DEFAULT NULL,
  `multiple_image` char(100) DEFAULT NULL,
  `sort` int(5) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `multiple_image_uploads`
--


-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE IF NOT EXISTS `newsletters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `active` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `title`, `subject`, `message`, `active`, `created`, `modified`) VALUES
(1, 'test1', 'subject1', '<p>mesage1 message3</p>', 1, '2013-01-03 08:33:57', '2013-05-23 15:44:50'),
(2, 'test2', 'subject2', '<p>helloo</p>', 1, '2013-01-03 08:34:57', '2013-08-07 14:23:02');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE IF NOT EXISTS `newsletter_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `is_subscribed` tinyint(1) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`subscriber_email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `newsletter_subscribers`
--

INSERT INTO `newsletter_subscribers` (`id`, `subscriber_email`, `firstname`, `lastname`, `is_subscribed`, `created`, `modified`) VALUES
(1, 'puneet.kumar@webvirtue.com', NULL, NULL, 1, '2013-08-20 07:49:20', '2013-08-20 07:50:14'),
(5, 'navneet.awasthi@webvirtue.com', 'N', 'A', 1, '2013-10-09 09:09:14', '2014-05-06 07:15:50');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `shipping_price` decimal(10,2) DEFAULT NULL,
  `handling_price` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `coupon_code` varchar(100) DEFAULT NULL,
  `coupon_type` varchar(50) DEFAULT NULL,
  `coupon_value` double DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `order_total` decimal(10,2) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_status` int(11) DEFAULT '0',
  `order_email` varchar(100) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `shipping_method` varchar(100) DEFAULT NULL,
  `cc_number` varchar(100) DEFAULT NULL,
  `cc_expiry_date` varchar(100) DEFAULT NULL,
  `order_comments` text,
  `ship_firstname` varchar(100) DEFAULT NULL,
  `ship_lastname` varchar(100) DEFAULT NULL,
  `ship_address1` varchar(100) DEFAULT NULL,
  `ship_address2` varchar(100) DEFAULT NULL,
  `ship_city` varchar(100) DEFAULT NULL,
  `ship_state` varchar(100) DEFAULT NULL,
  `ship_zip` varchar(100) DEFAULT NULL,
  `ship_country` varchar(100) DEFAULT NULL,
  `ship_phone` varchar(100) DEFAULT NULL,
  `bill_firstname` varchar(100) DEFAULT NULL,
  `bill_lastname` varchar(100) DEFAULT NULL,
  `bill_address1` varchar(100) DEFAULT NULL,
  `bill_address2` varchar(100) DEFAULT NULL,
  `bill_city` varchar(100) DEFAULT NULL,
  `bill_state` varchar(100) DEFAULT NULL,
  `bill_zip` varchar(100) DEFAULT NULL,
  `bill_country` varchar(100) DEFAULT NULL,
  `bill_phone` varchar(100) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `txn_id`, `subtotal`, `shipping_price`, `handling_price`, `tax`, `coupon_code`, `coupon_type`, `coupon_value`, `coupon_discount`, `order_total`, `order_date`, `order_status`, `order_email`, `ip`, `shipping_method`, `cc_number`, `cc_expiry_date`, `order_comments`, `ship_firstname`, `ship_lastname`, `ship_address1`, `ship_address2`, `ship_city`, `ship_state`, `ship_zip`, `ship_country`, `ship_phone`, `bill_firstname`, `bill_lastname`, `bill_address1`, `bill_address2`, `bill_city`, `bill_state`, `bill_zip`, `bill_country`, `bill_phone`, `created`, `modified`) VALUES
(1, 1, '1234567890', '200.00', '7.00', '0.00', '0.00', 'ABCD', '$', 10, 10, '197.00', '2013-12-24', 0, 'navneet.awasthi@webvirtue.com', '127.0.0.1', NULL, NULL, NULL, NULL, 'Abc', 'Def', 'C-125', '', 'Paris', 'Paris city', '202', 'United Kingdom', '3333333333', 'Navneet', 'Awasthi', '101, street 123', '', 'Delhi', 'New Delhi', '2222222', 'India', '777777777', '2013-12-24 11:57:18', '2013-12-24 11:57:18'),
(2, 1, '1234567890', '200.00', '7.00', '0.00', '0.00', 'ABC', '%', 10, 20, '187.00', '2013-12-24', 0, 'navneet.awasthi@webvirtue.com', '127.0.0.1', NULL, NULL, NULL, NULL, 'Abc', 'Def', 'C-125', '', 'Paris', 'Paris city', '202', 'United Kingdom', '3333333333', 'Navneet', 'Awasthi', '101, street 123', '', 'Delhi', 'New Delhi', '2222222', 'India', '777777777', '2013-12-24 11:58:09', '2013-12-24 11:58:09'),
(3, 1, '1234567890', '20.00', '0.00', '0.00', '0.00', NULL, NULL, NULL, NULL, '20.00', '2014-05-05', 0, 'navneet.awasthi@webvirtue.com', '127.0.0.1', NULL, NULL, NULL, NULL, 'Abc', 'Def', 'C-125', '', 'Paris', 'Paris city', '202', 'United Kingdom', '3333333333', 'Abc', 'Def', 'C-125', '', 'Paris', 'Paris city', '202', 'United Kingdom', '3333333333', '2014-05-05 06:32:47', '2014-05-05 06:32:47'),
(4, 1, '1234567890', '10.00', '0.00', '0.00', '0.00', NULL, NULL, NULL, NULL, '10.00', '2014-05-05', 0, 'navneet.awasthi@webvirtue.com', '127.0.0.1', NULL, NULL, NULL, NULL, 'test', 'new', '1132132', '', 'new', 'york', '125', 'United States', '343564', 'test', 'new', '1132132', '', 'new', 'york', '125', 'United States', '343564', '2014-05-05 11:53:30', '2014-05-05 11:53:30'),
(5, 1, '1234567890', '10.00', '0.00', '0.00', '0.00', NULL, NULL, NULL, NULL, '10.00', '2014-05-05', 0, 'navneet.awasthi@webvirtue.com', '127.0.0.1', NULL, NULL, NULL, NULL, 'test', 'new', '1132132', '', 'new', 'york', '125', 'United States', '343564', 'test', 'new', '1132132', '', 'new', 'york', '125', 'United States', '343564', '2014-05-05 12:28:50', '2014-05-05 12:28:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `attribute_id` varchar(255) DEFAULT NULL,
  `attribute_value_id` varchar(255) DEFAULT NULL,
  `attribute_name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `attribute_id`, `attribute_value_id`, `attribute_name`, `status`, `created`, `modified`) VALUES
(1, 1, 19, 1, '200.00', '1,2', '1,4', 'Size:Small, Color:Purple', 0, '2013-12-24 11:57:18', '2013-12-24 11:57:18'),
(2, 2, 19, 1, '200.00', '1,2', '1,4', 'Size:Small, Color:Purple', 0, '2013-12-24 11:58:09', '2013-12-24 11:58:09'),
(3, 3, 6, 2, '10.00', '1,2,3', '1,4,7', 'Size:S, Color:Purple, Length:Long', 0, '2014-05-05 06:32:47', '2014-05-05 06:32:47'),
(4, 4, 6, 1, '10.00', '1,2,3', '1,4,7', 'Size:S, Color:Purple, Length:Long', 0, '2014-05-05 11:53:30', '2014-05-05 11:53:30'),
(5, 5, 6, 1, '10.00', '1,2,3', '1,4,7', 'Size:S, Color:Purple, Length:Long', 0, '2014-05-05 12:28:50', '2014-05-05 12:28:50');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(25) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `img_sizes` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT '0',
  `product_type` varchar(10) DEFAULT NULL,
  `video_type` int(11) NOT NULL DEFAULT '0',
  `product_video` varchar(255) NOT NULL,
  `youtube_video` text NOT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `new_product` int(11) NOT NULL DEFAULT '0',
  `featured_product` int(11) DEFAULT '0',
  `rating` double(10,1) NOT NULL DEFAULT '0.0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `price` (`price`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `keywords`, `price`, `img_sizes`, `active`, `product_type`, `video_type`, `product_video`, `youtube_video`, `product_image`, `new_product`, `featured_product`, `rating`, `created`, `modified`) VALUES
(1, 'image1', 'image1', '10.00', 'medium', 1, 'img', 0, '', '', '1486907890_65415100shutterstock_163223417.jpg', 1, 0, 0.0, '2017-02-12 14:58:10', '2017-02-12 14:58:10'),
(2, 'image2', 'image2', '20.00', 'medium', 1, 'img', 0, '', '', '1486907890_95820400shutterstock_166507301.jpg', 1, 0, 0.0, '2017-02-12 14:58:11', '2017-02-12 14:58:11'),
(3, 'image3', 'image3', '25.00', 'small', 1, 'img', 0, '', '', '1486907891_19332900shutterstock_169382198.jpg', 1, 1, 0.0, '2017-02-12 14:58:11', '2017-02-12 17:20:16'),
(4, 'image4', 'image4', '35.00', 'large', 1, 'img', 0, '', '', '1486907891_48312300shutterstock_203148505.jpg', 1, 1, 0.0, '2017-02-12 14:58:11', '2017-02-12 14:58:11'),
(5, 'image5', 'imag5', '45.00', 'medium', 1, 'img', 0, '', '', '1486907891_66055900shutterstock_261941330.jpg', 1, 1, 0.0, '2017-02-12 14:58:11', '2017-02-12 14:58:11'),
(6, 'video1', 'video1', '15.00', NULL, 1, 'vid', 1, '1486908986_22393600octagon-5192.mp4', '', NULL, 1, 1, 0.0, '2017-02-12 15:00:12', '2017-02-12 15:16:26'),
(7, 'video2', 'video2', '55.00', NULL, 1, 'vid', 1, '1486916006_77982700SampleVideo_1280x720_1mb.mp4', '', NULL, 1, 1, 0.0, '2017-02-12 15:00:49', '2017-02-12 17:13:26'),
(8, 'video3', 'video3', '65.00', NULL, 1, 'vid', 1, '1486916050_65926900SampleVideo_1280x720_1mb.mp4', '', NULL, 1, 0, 0.0, '2017-02-12 15:01:21', '2017-02-12 17:14:10'),
(9, 'video4', 'video4', '100.00', NULL, 1, 'vid', 2, '', 'http://www.youtube.com/watch?v=TMEr8qohTTI', NULL, 1, 0, 0.0, '2017-02-12 15:02:35', '2017-02-12 15:22:33'),
(10, 'video5', 'video5', '102.00', NULL, 1, 'vid', 2, '', 'http://www.youtube.com/watch?v=TMEr8qohTTI', NULL, 1, 0, 0.0, '2017-02-12 15:06:00', '2017-02-12 17:14:36'),
(11, 'image6', 'image6', '22.00', 'medium', 1, 'img', 0, '', '', '1486916291_34691900shutterstock_263800367.jpg', 1, 0, 0.0, '2017-02-12 17:18:11', '2017-02-12 17:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE IF NOT EXISTS `product_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_code` varchar(50) DEFAULT NULL,
  `sort_order` int(10) DEFAULT NULL,
  `active` int(1) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created` (`created`),
  KEY `prodatt_active` (`active`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `attribute_code`, `sort_order`, `active`, `created`, `modified`) VALUES
(1, 'Size', 1, 1, '2013-01-22 17:13:42', '2013-01-22 14:18:09');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_relations`
--

CREATE TABLE IF NOT EXISTS `product_attribute_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `attribute_value_id` int(11) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_unique_id` (`product_id`,`attribute_id`,`attribute_value_id`),
  KEY `attribute_id` (`attribute_id`),
  KEY `prod_att_rel_attrbval` (`attribute_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `product_attribute_relations`
--

INSERT INTO `product_attribute_relations` (`id`, `product_id`, `attribute_id`, `attribute_value_id`, `quantity`) VALUES
(5, 1, 1, 3, NULL),
(6, 2, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE IF NOT EXISTS `product_attribute_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color_code` varchar(100) DEFAULT NULL,
  `active` int(1) DEFAULT '1',
  `sort_order` int(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created` (`created`),
  KEY `attribute_id` (`attribute_id`),
  KEY `pav_active` (`active`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `product_attribute_values`
--

INSERT INTO `product_attribute_values` (`id`, `attribute_id`, `name`, `color_code`, `active`, `sort_order`, `created`, `modified`) VALUES
(1, 1, 'S', '', 1, 1, '2013-03-08 12:50:25', '2013-04-24 13:16:27'),
(2, 1, 'M', '', 1, 2, '2013-03-08 12:50:41', '2013-04-24 13:16:38'),
(3, 1, 'L', '', 1, 3, '2013-03-08 12:50:55', '2013-04-24 13:16:46'),
(4, 2, 'purple', '', 1, 1, '2013-03-08 12:51:34', '2013-08-05 12:56:22'),
(5, 2, 'yellow', '', 1, 2, '2013-03-08 12:52:02', '2013-03-08 12:52:02'),
(6, 2, 'red', '', 1, 3, '2013-03-08 12:52:37', '2013-03-08 12:52:37'),
(7, 3, 'Long', '', 1, 1, '2013-10-14 11:12:30', '2013-10-14 11:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `sort` int(5) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `product_image`, `sort`, `created`, `modified`) VALUES
(12, 24, 'Desert.jpg', NULL, '2013-10-29 13:39:53', '2013-10-29 13:39:53'),
(11, 24, 'Penguins.jpg', NULL, '2013-10-29 13:39:53', '2013-10-29 13:39:53'),
(13, 1, '1484460955_28085300dashboard1-1.png', NULL, '2017-01-15 07:15:55', '2017-01-15 07:15:55'),
(14, 1, '1484460955_65778600dashboard1-2.png', NULL, '2017-01-15 07:15:55', '2017-01-15 07:15:55'),
(15, 2, '1484462706_42320200graphic_charting_icons.png', NULL, '2017-01-15 07:45:06', '2017-01-15 07:45:06'),
(16, 2, '1484462706_48986300search-result-set-screenshot.png', NULL, '2017-01-15 07:45:06', '2017-01-15 07:45:06');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `overall` int(5) NOT NULL DEFAULT '0',
  `comfort` int(5) NOT NULL DEFAULT '0',
  `style` int(5) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `review` text,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `active` (`active`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `product_id`, `overall`, `comfort`, `style`, `name`, `email`, `review`, `active`, `created`, `modified`) VALUES
(1, 1, 25, 4, 5, 3, 'Navneet Awasthi', 'navneet.awasthi@webvirtue.com', 'This is testing. This is testing. This is testing. This is testing. This is testing. This is testing. ', 1, '2013-10-04 13:18:29', '2013-10-04 13:18:29'),
(2, 1, 5, 3, 3, 3, 'Navneet Awasthi', 'navneet.awasthi@webvirtue.com', 'sgsdgdsghshh', 1, '2013-10-04 13:58:56', '2013-10-04 13:58:56'),
(6, 1, 23, 4, 4, 4, 'Navneet Awasthi', 'navneet.awasthi@webvirtue.com', 'sdss', 1, '2013-11-01 09:08:09', '2013-11-01 09:08:09');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE IF NOT EXISTS `shippings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ship_method` int(11) NOT NULL DEFAULT '0',
  `ship_name` varchar(50) DEFAULT NULL,
  `pickup_method` varchar(50) DEFAULT NULL,
  `package_method` varchar(50) DEFAULT NULL,
  `delivery_method` varchar(50) DEFAULT NULL,
  `handling_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `base_ship_rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ship_rate_per_weight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ship_rate_per_quantity` decimal(10,2) NOT NULL DEFAULT '0.00',
  `allow_handling` int(11) NOT NULL DEFAULT '0',
  `allow_free_shipping` int(11) NOT NULL DEFAULT '0',
  `handling_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `free_ship_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `active` int(11) NOT NULL DEFAULT '0',
  `FedExAccountNumber` varchar(250) DEFAULT NULL,
  `FedExMeterNumber` varchar(250) DEFAULT NULL,
  `FedExWeightUnits` varchar(250) DEFAULT NULL,
  `FedExPayorType` varchar(250) DEFAULT NULL,
  `FedExServer` varchar(250) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `ship_method`, `ship_name`, `pickup_method`, `package_method`, `delivery_method`, `handling_fee`, `base_ship_rate`, `ship_rate_per_weight`, `ship_rate_per_quantity`, `allow_handling`, `allow_free_shipping`, `handling_price`, `free_ship_price`, `active`, `FedExAccountNumber`, `FedExMeterNumber`, `FedExWeightUnits`, `FedExPayorType`, `FedExServer`, `created`, `modified`) VALUES
(1, 1, 'USPS', 'OTP', 'ULE', 'COM', '500.00', '0.00', '0.00', '0.00', 0, 0, '0.00', '0.00', 0, NULL, NULL, NULL, NULL, NULL, '2013-01-07 15:33:41', '2013-08-08 07:10:20'),
(2, 2, 'Fedex', 'FDXE', 'YOURPACKAGING', 'REGULARPICKUP', '1500.00', '0.00', '0.00', '0.00', 0, 0, '0.00', '0.00', 0, '54215245554', '11221212111', 'LBS', 'THIRDPARTY', 'https://gatewaybeta.fedex.com:443/GatewayDC', '2013-01-07 15:30:47', '2013-08-08 07:14:58'),
(3, 3, 'UPS', 'LC', 'ULE', 'COM', '1500.00', '0.00', '0.00', '0.00', 0, 0, '0.00', '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2013-08-08 07:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_carts`
--

CREATE TABLE IF NOT EXISTS `shopping_carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `attribute_id` varchar(255) DEFAULT NULL,
  `attribute_value_id` varchar(255) DEFAULT NULL,
  `attribute_name` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `shopping_carts`
--

INSERT INTO `shopping_carts` (`id`, `session_id`, `product_id`, `quantity`, `price`, `attribute_id`, `attribute_value_id`, `attribute_name`, `created`, `modified`) VALUES
(3, 'oh4ll87i713kgsefdhn4qlslk7', 19, 1, '200.00', '1,2', '1,4', 'Size:Small, Color:Purple', '2013-12-24 12:02:36', '2013-12-24 12:02:36'),
(4, 'r5q89p18g1foj39coj5ee03p55', 19, 1, '200.00', '1,2', '1,4', 'Size:Small, Color:Purple', '2014-01-14 13:03:06', '2014-01-14 13:03:06'),
(5, 'm1p0f98adptk12f4qv1drkevj3', 22, 1, '1500.00', '1,2', '2,5', 'Size:Medium, Color:Yellow', '2014-03-14 12:33:19', '2014-03-14 12:33:19'),
(19, 'j99j927maauov6b9enc4c2k796', 6, 1, '10.00', '1,2,3', '1,4,7', 'Size:S, Color:Purple, Length:Long', '2014-05-05 12:29:02', '2014-05-05 12:29:02');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_coupons`
--

CREATE TABLE IF NOT EXISTS `shopping_coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `shopping_coupons`
--


-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) NOT NULL DEFAULT '',
  `abv` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `state`, `abv`) VALUES
(1, 'ALABAMA', 'AL'),
(2, 'ALASKA', 'AK'),
(3, 'ARIZONA', 'AZ'),
(4, 'ARKANSAS', 'AR'),
(5, 'CALIFORNIA', 'CA'),
(6, 'COLORADO', 'CO'),
(7, 'CONNECTICUT', 'CT'),
(8, 'DELAWARE', 'DE'),
(9, 'FLORIDA', 'FL'),
(10, 'GEORGIA', 'GA'),
(11, 'HAWAII', 'HI'),
(12, 'IDAHO', 'ID'),
(13, 'ILLINOIS', 'IL'),
(14, 'INDIANA', 'IN'),
(15, 'IOWA', 'IA'),
(16, 'KANSAS', 'KS'),
(17, 'KENTUCKY', 'KY'),
(18, 'LOUISIANA', 'LA'),
(19, 'MAINE', 'ME'),
(20, 'MARYLAND', 'MD'),
(21, 'MASSACHUSETTS', 'MA'),
(22, 'MICHIGAN', 'MI'),
(23, 'MINNESOTA', 'MN'),
(24, 'MISSISSIPPI', 'MS'),
(25, 'MISSOURI', 'MO'),
(26, 'MONTANA', 'MT'),
(27, 'NEBRASKA', 'NE'),
(28, 'NEVADA', 'NV'),
(29, 'NEW HAMPSHIRE', 'NH'),
(30, 'NEW JERSEY', 'NJ'),
(31, 'NEW MEXICO', 'NM'),
(32, 'NEW YORK', 'NY'),
(33, 'NORTH CAROLINA', 'NC'),
(34, 'NORTH DAKOTA', 'ND'),
(35, 'OHIO', 'OH'),
(36, 'OKLAHOMA', 'OK'),
(37, 'OREGON', 'OR'),
(38, 'PENNSYLVANIA', 'PA'),
(39, 'RHODE ISLAND', 'RI'),
(40, 'SOUTH CAROLINA', 'SC'),
(41, 'SOUTH DAKOTA', 'SD'),
(42, 'TENNESSEE', 'TN'),
(43, 'TEXAS', 'TX'),
(44, 'UTAH', 'UT'),
(45, 'VERMONT', 'VT'),
(46, 'VIRGINIA', 'VA'),
(47, 'WASHINGTON', 'WA'),
(48, 'WEST VIRGINIA', 'WV'),
(49, 'WISCONSIN', 'WI'),
(50, 'WYOMING', 'WY'),
(51, 'Alberta', 'AB'),
(52, 'British Columbia', 'BC'),
(53, 'Manitoba', 'MB'),
(54, 'New Brunswick', 'NB'),
(55, 'Newfoundland', 'NF'),
(56, 'Northwest Territories', 'NT'),
(57, 'Nova Scotia', 'NS'),
(58, 'Nunavut', 'NU'),
(59, 'Ontario', 'ON'),
(60, 'Prince Edward Island', 'PE'),
(61, 'Quebec', 'PQ'),
(62, 'Saskatchewan', 'SK'),
(63, 'Yukon', 'YT');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fbid` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) NOT NULL,
  `business_type` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zipcode` varchar(50) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `ship_firstname` varchar(255) DEFAULT NULL,
  `ship_lastname` varchar(255) DEFAULT NULL,
  `ship_address` varchar(255) DEFAULT NULL,
  `ship_phone` varchar(50) DEFAULT NULL,
  `ship_mobile` varchar(50) DEFAULT NULL,
  `ship_city` varchar(100) DEFAULT NULL,
  `ship_state` varchar(100) DEFAULT NULL,
  `ship_zipcode` varchar(50) DEFAULT NULL,
  `ship_country` varchar(255) DEFAULT NULL,
  `bill_firstname` varchar(255) DEFAULT NULL,
  `bill_lastname` varchar(255) DEFAULT NULL,
  `bill_address` varchar(255) DEFAULT NULL,
  `bill_phone` varchar(50) DEFAULT NULL,
  `bill_mobile` varchar(50) DEFAULT NULL,
  `bill_city` varchar(100) DEFAULT NULL,
  `bill_state` varchar(100) DEFAULT NULL,
  `bill_zipcode` varchar(50) DEFAULT NULL,
  `bill_country` varchar(255) DEFAULT NULL,
  `ship_check` int(2) NOT NULL DEFAULT '0',
  `newsletter` int(4) NOT NULL DEFAULT '0',
  `activation_key` varchar(255) DEFAULT NULL,
  `active` int(3) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `active` (`active`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fbid`, `email`, `password`, `username`, `firstname`, `lastname`, `job_title`, `business_type`, `company`, `address`, `phone`, `mobile`, `city`, `state`, `zipcode`, `country`, `ship_firstname`, `ship_lastname`, `ship_address`, `ship_phone`, `ship_mobile`, `ship_city`, `ship_state`, `ship_zipcode`, `ship_country`, `bill_firstname`, `bill_lastname`, `bill_address`, `bill_phone`, `bill_mobile`, `bill_city`, `bill_state`, `bill_zipcode`, `bill_country`, `ship_check`, `newsletter`, `activation_key`, `active`, `created`, `modified`) VALUES
(1, '', 'piyush.srivastava@gmail.com', 'c8879f8e5eab57fd9a73a8088c281a6d999a0172', '', 'Piyush', 'Srivastava', '', '', '', 'C-189', '1010101010', '2020202020', 'Delhi', 'NewDelhi', '110001', 'India', 'test', 'new', '1132132', '343564', '46464', 'new', 'york', '125', 'United States', 'test', 'new', '1132132', '343564', '46464', 'new', 'york', '125', 'United States', 1, 1, 'd105ba0e1dccaf9bdc26f795354900510a1643f1', 1, '2013-09-26 12:26:15', '2017-01-08 04:25:53'),
(7, '', 'pkumar@gmail.com', 'c8879f8e5eab57fd9a73a8088c281a6d999a0172', '', 'piyush', 'srivastava', '', '', '', 'sec45', '2238383812', '9810203930', 'gurgaon', 'HR', '122001', 'India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '9b1a59935d423f070871ecd0d11d371477ac1c2a', 1, '2017-01-26 12:15:15', '2017-01-26 12:15:15'),
(8, '', 'aman@gmail.com', 'a836dfa2a0f5428d7606112dca44b2d780d9cdc6', '', 'aman', 'kumar', '', '', '', 'sec45', '234234234234', '982342342', 'delhi', 'delhi', '201201', 'India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 'b13b589793c757bff693198f63e7050350ff1c03', 0, '2017-01-27 21:50:04', '2017-01-27 21:50:04'),
(9, '', 'raman@gmail.com', '9ac7feeeb08687acb52bc9c68bc336ffeb07fb9b', 'raman2', 'raman2', 'kumar2', 'job11', 'business11', 'company11', 'sec461', '2939938912', '9812939393', 'gurgaon', 'hr', '122001', 'Iceland', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 'bef9d9fc35de075a8b851f3c234bd4702a8fd9c6', 1, '2017-01-27 21:54:21', '2017-02-04 18:11:07'),
(10, '', 'tewt@gmail.com', 'e0b9ae8a1ee18092a14920abc715cf652d7f280d', 'adad', 'asdsad', 'adds', 'software', 'IT', 'it section', 'sec45', '23423423423', '98234244', 'delhi', 'delhi', '234332', 'India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '6a3c0e0f3bb2c642b9bc0f87235c0c9360a5a495', 1, '2017-02-05 02:09:19', '2017-02-05 02:09:19'),
(11, NULL, 'k@k.com', '202cb962ac59075b964b07152d234b70', 'jimmydued', 'kapil', 'sharma', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 0, 0, '123', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users1`
--

CREATE TABLE IF NOT EXISTS `users1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(23) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `encrypted_password` varchar(80) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `users1`
--


-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

CREATE TABLE IF NOT EXISTS `wish_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `attribute_id` varchar(255) DEFAULT NULL,
  `attribute_value_id` varchar(255) DEFAULT NULL,
  `attribute_name` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wish_lists`
--


-- --------------------------------------------------------

--
-- Table structure for table `zip_codes`
--

CREATE TABLE IF NOT EXISTS `zip_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zip_code` varchar(5) CHARACTER SET latin1 NOT NULL,
  `lat` float NOT NULL,
  `lon` float NOT NULL,
  `city` varchar(100) CHARACTER SET latin1 NOT NULL,
  `state_prefix` varchar(100) CHARACTER SET latin1 NOT NULL,
  `county` varchar(100) CHARACTER SET latin1 NOT NULL,
  `z_type` varchar(100) CHARACTER SET latin1 NOT NULL,
  `xaxis` float NOT NULL,
  `yaxis` float NOT NULL,
  `zaxis` float NOT NULL,
  `z_primary` varchar(100) CHARACTER SET latin1 NOT NULL,
  `country` varchar(100) CHARACTER SET latin1 NOT NULL,
  `state_name` varchar(255) NOT NULL COMMENT 'US State Name',
  PRIMARY KEY (`id`),
  KEY `zip_code` (`zip_code`),
  KEY `city` (`city`),
  KEY `state_prefix` (`state_prefix`,`state_name`),
  KEY `country` (`country`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zip_codes`
--

