-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 08, 2015 at 01:33 AM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `online_voting_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE IF NOT EXISTS `admin_table` (
  `AdminId` int(5) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`AdminId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`AdminId`, `password`) VALUES
(1000, '12345');

-- --------------------------------------------------------

--
-- Table structure for table `log_table`
--

CREATE TABLE IF NOT EXISTS `log_table` (
  `VoterId` int(10) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`VoterId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE IF NOT EXISTS `register` (
  `VoterId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Age` int(5) NOT NULL,
  `Aadhar_card_no` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY (`VoterId`),
  UNIQUE KEY `VoterId` (`VoterId`),
  UNIQUE KEY `Aadhar_card_no` (`Aadhar_card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `register`
--
DROP TRIGGER IF EXISTS `register_after`;
DELIMITER //
CREATE TRIGGER `register_after` AFTER INSERT ON `register`
 FOR EACH ROW INSERT INTO yet_to_vote(VoterId, Password) VALUES(NEW.VoterId, NEW.Password)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `who_gave_vote`
--

CREATE TABLE IF NOT EXISTS `who_gave_vote` (
  `VoterId` int(10) NOT NULL,
  `Party` varchar(10) NOT NULL,
  PRIMARY KEY (`VoterId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `yet_to_vote`
--

CREATE TABLE IF NOT EXISTS `yet_to_vote` (
  `VoterId` int(10) NOT NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY (`VoterId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `yet_to_vote`
--
DROP TRIGGER IF EXISTS `log_data_after_insert`;
DELIMITER //
CREATE TRIGGER `log_data_after_insert` AFTER INSERT ON `yet_to_vote`
 FOR EACH ROW INSERT INTO log_table(VoterId, TIME) VALUES(NEW.VoterId, NOW())
//
DELIMITER ;
DROP TRIGGER IF EXISTS `log_data_after_update`;
DELIMITER //
CREATE TRIGGER `log_data_after_update` BEFORE UPDATE ON `yet_to_vote`
 FOR EACH ROW INSERT INTO log_table(VoterId, TIME) VALUES(NEW.VoterId, NOW())
//
DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
