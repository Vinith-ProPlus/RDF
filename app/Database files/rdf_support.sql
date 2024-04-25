-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2024 at 01:52 PM
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
-- Database: `rpc_support`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attachment`
--

CREATE TABLE `tbl_attachment` (
  `AttachmentID` varchar(50) NOT NULL,
  `ReferID` varchar(50) DEFAULT NULL,
  `Module` varchar(100) DEFAULT NULL,
  `UploadDir` text DEFAULT NULL,
  `UploadFileName` text DEFAULT NULL,
  `UploadFileExt` varchar(30) DEFAULT NULL,
  `UploadUrl` text DEFAULT NULL,
  `FileSize` varchar(100) NOT NULL DEFAULT '0',
  `DFlag` int(11) DEFAULT 0,
  `UserID` varchar(50) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_support`
--

CREATE TABLE `tbl_support` (
  `SupportID` varchar(50) NOT NULL,
  `UserID` varchar(50) DEFAULT NULL,
  `Subject` varchar(100) DEFAULT NULL,
  `SupportType` varchar(50) DEFAULT NULL,
  `Priority` varchar(20) DEFAULT NULL,
  `Status` int(11) DEFAULT 2 COMMENT '-1 - new\r\n0 - Closed,\r\n1 - Open,\r\n2 - Unattend',
  `DFlag` int(11) DEFAULT 0,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_support_details`
--

CREATE TABLE `tbl_support_details` (
  `SLNO` varchar(50) NOT NULL DEFAULT '',
  `UserID` varchar(50) DEFAULT NULL,
  `SupportID` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `DeliveryStatus` int(11) NOT NULL DEFAULT 0,
  `ReadStatus` int(11) NOT NULL DEFAULT 0,
  `DFlag` int(11) DEFAULT 0,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_attachment`
--
ALTER TABLE `tbl_attachment`
  ADD PRIMARY KEY (`AttachmentID`),
  ADD KEY `AttachmentID` (`AttachmentID`,`ReferID`,`Module`);

--
-- Indexes for table `tbl_support`
--
ALTER TABLE `tbl_support`
  ADD PRIMARY KEY (`SupportID`),
  ADD KEY `SupportID` (`SupportID`,`UserID`,`Subject`,`Priority`,`Status`,`CreatedBy`,`UpdatedBy`,`DeletedBy`);

--
-- Indexes for table `tbl_support_details`
--
ALTER TABLE `tbl_support_details`
  ADD PRIMARY KEY (`SLNO`),
  ADD KEY `SLNO` (`SLNO`,`UserID`,`SupportID`,`CreatedBy`,`UpdatedBy`,`DeletedBy`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
