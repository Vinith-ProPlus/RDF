-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 28, 2023 at 10:53 AM
-- Server version: 5.7.44
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leadboost_rpc_tmp`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `ProductID` varchar(50) NOT NULL,
  `Slug` varchar(160) DEFAULT NULL,
  `ProductName` varchar(150) DEFAULT NULL,
  `ProductType` enum('Simple','Variable') DEFAULT 'Simple',
  `HSNSAC` varchar(50) DEFAULT NULL,
  `CID` varchar(50) DEFAULT NULL,
  `SCID` varchar(50) DEFAULT NULL,
  `UID` varchar(50) DEFAULT NULL,
  `TaxType` enum('Exclude','Include') DEFAULT 'Exclude',
  `TaxID` varchar(50) DEFAULT NULL,
  `PRate` double DEFAULT '0',
  `SRate` double DEFAULT '0',
  `Decimals` enum('auto','0','1','2','3','4','5','6','7','8','9') DEFAULT 'auto',
  `Description` text,
  `ShortDescription` text,
  `Attributes` text,
  `Images` text,
  `gallery` text,
  `ActiveStatus` enum('Active','Inactive') DEFAULT 'Active',
  `DFlag` int(1) DEFAULT '0',
  `CreatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products_variation`
--

CREATE TABLE `tbl_products_variation` (
  `VariationID` varchar(50) NOT NULL,
  `UUID` varchar(100) DEFAULT NULL,
  `ProductID` varchar(50) DEFAULT NULL,
  `Slug` text,
  `Title` varchar(150) DEFAULT NULL,
  `PRate` double DEFAULT '0',
  `SRate` double DEFAULT '0',
  `Images` text,
  `Attributes` text,
  `CombinationID` text,
  `DFlag` int(1) DEFAULT '0',
  `CreatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_save_status`
--

CREATE TABLE `tbl_product_save_status` (
  `UserID` varchar(50) NOT NULL,
  `Percentage` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `tbl_products_variation`
--
ALTER TABLE `tbl_products_variation`
  ADD PRIMARY KEY (`VariationID`);

--
-- Indexes for table `tbl_product_save_status`
--
ALTER TABLE `tbl_product_save_status`
  ADD PRIMARY KEY (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
