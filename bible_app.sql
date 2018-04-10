-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 10, 2018 at 07:51 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bible_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_path` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `image_path`) VALUES
(1, 'http://localhost:1130/bible.jpg'),
(2, 'http://localhost:1130/chruch.jpg'),
(3, 'http://localhost:1130/about-us.jpg'),
(4, 'http://localhost:1130/ministry.jpg'),
(5, 'http://localhost:1130/father.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `home`
--

DROP TABLE IF EXISTS `home`;
CREATE TABLE IF NOT EXISTS `home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `image_path` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `home`
--

INSERT INTO `home` (`id`, `description`, `image_path`) VALUES
(1, 'sin will keep you from this book or the book will keep you from sin', 'http://localhost:1130/bible.jpg'),
(2, 'a church is a hospital for sinners not a museum for saints', 'http://localhost:1130/chruch.jpg'),
(3, 'Serving God for the better is our moto', 'http://localhost:1130/about-us.jpg'),
(4, 'Ministry is NOT a job or Sunday routine, it\'s a Privilege to be Chosen & Used by Jesus', 'http://localhost:1130/ministry.jpg'),
(5, 'Preacher is an instrument of compassion, not an instrument of wrath', 'http://localhost:1130/father.jpg'),
(6, 'preach the world', '	\r\nhttp://localhost:1130/sermon.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `upcoming_activity`
--

DROP TABLE IF EXISTS `upcoming_activity`;
CREATE TABLE IF NOT EXISTS `upcoming_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `event_date` datetime DEFAULT NULL,
  `image_path` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upcoming_activity`
--

INSERT INTO `upcoming_activity` (`id`, `description`, `event_date`, `image_path`) VALUES
(1, 'sin will keep you from this book or the book will keep you from sin', '2018-10-04 10:01:00', 'http://localhost:1130/bible.jpg'),
(2, 'a church is a hospital for sinners not a museum for saints', '2018-10-03 10:01:00', 'http://localhost:1130/chruch.jpg'),
(3, 'Serving God for the better is our moto', '2018-10-02 10:01:00', 'http://localhost:1130/about-us.jpg'),
(4, 'Ministry is NOT a job or Sunday routine, it\'s a Privilege to be Chosen & Used by Jesus', '2018-10-01 10:01:00', 'http://localhost:1130/ministry.jpg'),
(5, 'Preacher is an instrument of compassion, not an instrument of wrath', '2018-10-05 10:01:00', 'http://localhost:1130/father.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `mac_address` varchar(50) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `verification_token` text,
  `authentication_token` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `mobile`, `mac_address`, `password`, `status`, `verification_token`, `authentication_token`) VALUES
(1, 'prabusankar', '9444550550', '40:88:05:b7:d8:e0', 'admin@123', 0, '952148', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `weekly_activity`
--

DROP TABLE IF EXISTS `weekly_activity`;
CREATE TABLE IF NOT EXISTS `weekly_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `image_path` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weekly_activity`
--

INSERT INTO `weekly_activity` (`id`, `description`, `image_path`) VALUES
(1, 'sin will keep you from this book or the book will keep you from sin', 'http://localhost:1130/bible.jpg'),
(2, 'a church is a hospital for sinners not a museum for saints', 'http://localhost:1130/chruch.jpg'),
(3, 'Serving God for the better is our moto', 'http://localhost:1130/about-us.jpg'),
(4, 'Ministry is NOT a job or Sunday routine, it\'s a Privilege to be Chosen & Used by Jesus', 'http://localhost:1130/ministry.jpg'),
(5, 'Preacher is an instrument of compassion, not an instrument of wrath', 'http://localhost:1130/father.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
