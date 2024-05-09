-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2024 at 08:33 AM
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
-- Database: `green_cities_alliance`
--

-- --------------------------------------------------------

--
-- Table structure for table `businesscategories`
--

CREATE TABLE `businesscategories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(255) DEFAULT NULL,
  `Description` varchar(1200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `businesscategories`
--

INSERT INTO `businesscategories` (`CategoryID`, `CategoryName`, `Description`) VALUES
(3, 'Chemical Industries', 'Chemical Industries Pollution'),
(4, 'Resuse', 'Resuse Things Description');

-- --------------------------------------------------------

--
-- Table structure for table `consumers`
--

CREATE TABLE `consumers` (
  `ConsumerId` int(11) NOT NULL,
  `AreaID` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Age_group` varchar(50) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `EnvironmentalInterests` varchar(1200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consumers`
--

INSERT INTO `consumers` (`ConsumerId`, `AreaID`, `Name`, `Location`, `Age_group`, `Gender`, `EnvironmentalInterests`) VALUES
(2, 2, 'Ram', 'Rajasthan', 'Adult', 'Male', 'Pollution'),
(3, 3, 'Tom', 'America', 'Senior', 'Female', 'Green Revolution');

-- --------------------------------------------------------

--
-- Table structure for table `greenbusinesses`
--

CREATE TABLE `greenbusinesses` (
  `BusinessID` int(11) NOT NULL,
  `BusinessCategoryID` int(11) DEFAULT NULL,
  `CompanyName` varchar(255) DEFAULT NULL,
  `ContactInformation` varchar(255) DEFAULT NULL,
  `BusinessDescription` varchar(1200) DEFAULT NULL,
  `BusinessType` varchar(50) DEFAULT NULL,
  `EnvironmentalBenefits` varchar(1200) DEFAULT NULL,
  `PricingCategory` varchar(50) DEFAULT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `greenbusinesses`
--

INSERT INTO `greenbusinesses` (`BusinessID`, `BusinessCategoryID`, `CompanyName`, `ContactInformation`, `BusinessDescription`, `BusinessType`, `EnvironmentalBenefits`, `PricingCategory`, `Email`) VALUES
(2, 3, 'ABC Chemicals Pvt Ltd', 'Rajasthan, India', 'Chemical Factory & Industries', 'Small', 'Pollution', 'Medium', 'ram@gmail.com'),
(3, 4, 'Green House Revolution', 'America, US', 'Reuse Things Pollutant', 'Medium', 'Greebary', 'Medium', 'tom@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `localcouncils`
--

CREATE TABLE `localcouncils` (
  `CouncilId` int(11) NOT NULL,
  `CouncilName` varchar(100) DEFAULT NULL,
  `CouncilDescription` varchar(1200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `localcouncils`
--

INSERT INTO `localcouncils` (`CouncilId`, `CouncilName`, `CouncilDescription`) VALUES
(5, 'Test Council', 'Test Council Description'),
(6, 'New Council', 'New Council Description');

-- --------------------------------------------------------

--
-- Table structure for table `productsservices`
--

CREATE TABLE `productsservices` (
  `ProductID` int(11) NOT NULL,
  `BusinessID` int(11) DEFAULT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `Description` varchar(1200) DEFAULT NULL,
  `Size` varchar(50) DEFAULT NULL,
  `Environmentalbenefits` varchar(1200) DEFAULT NULL,
  `PricingCategory` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productsservices`
--

INSERT INTO `productsservices` (`ProductID`, `BusinessID`, `ProductName`, `Description`, `Size`, `Environmentalbenefits`, `PricingCategory`) VALUES
(18, 3, 'Pollutant', 'Chemical Factory & Industries', 'Small', 'Pollution', 'Low'),
(19, 4, 'Reuse Bottles', 'Reuse Plastic', 'Medium', 'Green Revolution', 'Medium');

-- --------------------------------------------------------

--
-- Table structure for table `residingareas`
--

CREATE TABLE `residingareas` (
  `AreaId` int(11) NOT NULL,
  `AreaName` varchar(100) DEFAULT NULL,
  `LocalCouncilId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `residingareas`
--

INSERT INTO `residingareas` (`AreaId`, `AreaName`, `LocalCouncilId`) VALUES
(2, 'India', 5),
(3, 'US', 6);

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `Vote_id` int(11) NOT NULL,
  `ConsumerID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Vote` varchar(3) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`Vote_id`, `ConsumerID`, `ProductID`, `Vote`, `CreatedAt`) VALUES
(1, 2, 18, 'Yes', '2024-04-18 13:14:00'),
(2, 3, 19, 'No', '2024-04-27 13:59:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `businesscategories`
--
ALTER TABLE `businesscategories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `consumers`
--
ALTER TABLE `consumers`
  ADD PRIMARY KEY (`ConsumerId`);

--
-- Indexes for table `greenbusinesses`
--
ALTER TABLE `greenbusinesses`
  ADD PRIMARY KEY (`BusinessID`);

--
-- Indexes for table `localcouncils`
--
ALTER TABLE `localcouncils`
  ADD PRIMARY KEY (`CouncilId`);

--
-- Indexes for table `productsservices`
--
ALTER TABLE `productsservices`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `residingareas`
--
ALTER TABLE `residingareas`
  ADD PRIMARY KEY (`AreaId`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`Vote_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `businesscategories`
--
ALTER TABLE `businesscategories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `consumers`
--
ALTER TABLE `consumers`
  MODIFY `ConsumerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `greenbusinesses`
--
ALTER TABLE `greenbusinesses`
  MODIFY `BusinessID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `localcouncils`
--
ALTER TABLE `localcouncils`
  MODIFY `CouncilId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `productsservices`
--
ALTER TABLE `productsservices`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `residingareas`
--
ALTER TABLE `residingareas`
  MODIFY `AreaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `Vote_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
