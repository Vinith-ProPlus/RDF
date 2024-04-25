-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2024 at 01:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rdf_log`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs_2024`
--

CREATE TABLE `tbl_logs_2024` (
  `LogID` varchar(50) NOT NULL,
  `ReferID` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ModuleName` varchar(150) DEFAULT NULL,
  `Action` varchar(100) DEFAULT NULL,
  `OldData` text DEFAULT NULL,
  `NewData` text DEFAULT NULL,
  `IPAddress` varchar(100) DEFAULT NULL,
  `UserID` varchar(50) DEFAULT NULL,
  `LogTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_logs_2024`
--
ALTER TABLE `tbl_logs_2024`
  ADD PRIMARY KEY (`LogID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
