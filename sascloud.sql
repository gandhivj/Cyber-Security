-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2020 at 07:26 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sascloud`
--

-- --------------------------------------------------------

--
-- Table structure for table `anomaly`
--

CREATE TABLE `anomaly` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `count1` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `access_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `key_request`
--

CREATE TABLE `key_request` (
  `id` int(11) NOT NULL,
  `ownerid` varchar(255) DEFAULT NULL,
  `fileid` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `access_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `key_request`
--

INSERT INTO `key_request` (`id`, `ownerid`, `fileid`, `uid`, `uname`, `email`, `access_type`, `status`) VALUES
(6, '4', '100', '6', 'sarav', 'conceptdemo12345@gmail.com', 'java', 'UFRXBQ'),
(7, '5', '101', '7', 'gandhi', 'gandhisabarish96@gmail.com', 'java', 'CmHl8n');

-- --------------------------------------------------------

--
-- Table structure for table `owner_register`
--

CREATE TABLE `owner_register` (
  `id` int(11) NOT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner_register`
--

INSERT INTO `owner_register` (`id`, `uname`, `password`, `email`, `dob`, `place`, `country`, `status`) VALUES
(4, 'concept', 'solutions', 'conceptdemo12345@gmail.com', '05/05/1990', 'Trivandrum', 'INDIA', 'AlRAPk'),
(5, 'gandhi', '12345', 'gandhisabarish96@gmail.com', '05/05/1997', 'Nagercoil', 'INDIA', 'XdQ8VJ');

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE `upload` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `keyword_index` varchar(255) DEFAULT NULL,
  `file` longblob DEFAULT NULL,
  `ff` longtext DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `fpath` varchar(255) DEFAULT NULL,
  `enc_index` varchar(255) DEFAULT NULL,
  `enc_content` longtext DEFAULT NULL,
  `file_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload`
--

INSERT INTO `upload` (`id`, `uid`, `fid`, `file_name`, `keyword_index`, `file`, `ff`, `file_size`, `score`, `date`, `fpath`, `enc_index`, `enc_content`, `file_key`) VALUES
(15, '4', 100, 'java Notes', 'java', 0x536153436c6f75645f68656c702e646f6378, 'Efficient Traceable Authorization System\n\nKGC\n\n	Uid :\n	Pwd :\n', '11.57', 0, '03-03-2020', 'C:\\Users\\ELCOT\\Documents\\NetBeansProjects\\SaSinCloud\\build\\web\\Gallery\\SaSCloud_help.docx', 'java', 'Efficient Traceable Authorization System\n\nKGC\n\n	Uid :\n	Pwd :\n', '87556'),
(16, '5', 101, 'Java Hand Book', 'java', 0x536153436c6f75645f68656c702e646f6378, 'Efficient Traceable Authorization System\n\nKGC\n\n	Uid :\n	Pwd :\n', '11.25', 0, '03-03-2020', 'C:\\Users\\ELCOT\\Documents\\NetBeansProjects\\SaSinCloud\\build\\web\\Gallery\\SaSCloud_help.docx', 'java', 'Efficient Traceable Authorization System\n\nKGC\n\n	Uid :\n	Pwd :\n', '34782');

-- --------------------------------------------------------

--
-- Table structure for table `user_register`
--

CREATE TABLE `user_register` (
  `id` int(11) NOT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `access_type` varchar(255) DEFAULT NULL,
  `public_key` varchar(255) DEFAULT NULL,
  `attribute_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_register`
--

INSERT INTO `user_register` (`id`, `uname`, `password`, `email`, `dob`, `place`, `country`, `access_type`, `public_key`, `attribute_key`) VALUES
(6, 'sarav', '12345', 'conceptdemo12345@gmail.com', '05/05/2019', 'Trivandrum', 'INDIA', 'java', '65KKeX', '796985'),
(7, 'gandhi', '12345', 'gandhisabarish96@gmail.com', '05/05/1997', 'Nagercoil', 'INDIA', 'java', 'TCT143', '281356');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anomaly`
--
ALTER TABLE `anomaly`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `key_request`
--
ALTER TABLE `key_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owner_register`
--
ALTER TABLE `owner_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_register`
--
ALTER TABLE `user_register`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anomaly`
--
ALTER TABLE `anomaly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `key_request`
--
ALTER TABLE `key_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `owner_register`
--
ALTER TABLE `owner_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `upload`
--
ALTER TABLE `upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_register`
--
ALTER TABLE `user_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
