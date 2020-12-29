-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2020 at 07:59 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Vendstor`
--

-- --------------------------------------------------------

--
-- Table structure for table `App`
--

CREATE TABLE `App` (
  `AppId` varchar(50) NOT NULL,
  `Message` text NOT NULL,
  `Version` varchar(10) NOT NULL,
  `HasMessage` tinyint(4) NOT NULL,
  `IsOff` tinyint(1) NOT NULL,
  `IsUpdateRequired` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Blobs`
--

CREATE TABLE `Blobs` (
  `BlobId` varchar(50) NOT NULL,
  `Path` varchar(255) NOT NULL,
  `Url` varchar(255) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CustomerGroups`
--

CREATE TABLE `CustomerGroups` (
  `GroupId` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `CustomerId` varchar(50) NOT NULL,
  `GroupId` varchar(50) NOT NULL,
  `Code` varchar(50) NOT NULL,
  `StoreCredit` decimal(10,2) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Sex` varchar(10) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `PhoneNumber` varchar(50) NOT NULL,
  `Website` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `PostCode` varchar(10) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `IsFavorite` tinyint(1) NOT NULL,
  `IsVerified` tinyint(1) NOT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `RegisteredAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Discounts`
--

CREATE TABLE `Discounts` (
  `DiscountId` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` text NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Value` decimal(10,0) NOT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `OrderId` varchar(50) NOT NULL,
  `OrderedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Payments`
--

CREATE TABLE `Payments` (
  `PaymentId` varchar(50) NOT NULL,
  `Method` varchar(255) NOT NULL,
  `Paid` decimal(10,2) NOT NULL,
  `Balance` decimal(10,2) NOT NULL,
  `PaidAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PaymentTypes`
--

CREATE TABLE `PaymentTypes` (
  `StoreId` varchar(50) NOT NULL,
  `Cash` tinyint(1) NOT NULL DEFAULT 1,
  `CreditCard` tinyint(1) NOT NULL,
  `StoreCredit` tinyint(1) NOT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ProductBrands`
--

CREATE TABLE `ProductBrands` (
  `BrandId` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `CreatedAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ProductDiscounts`
--

CREATE TABLE `ProductDiscounts` (
  `DiscountId` varchar(50) NOT NULL,
  `ProductId` varchar(50) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `ProductId` varchar(50) NOT NULL,
  `Barcode` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` text NOT NULL,
  `Stock` decimal(10,2) NOT NULL,
  `IsBalanceRequired` tinyint(1) NOT NULL,
  `SupplyPrice` decimal(10,2) NOT NULL,
  `RetailPrice` decimal(10,2) NOT NULL,
  `Markup` decimal(10,2) NOT NULL,
  `TaxId` varchar(50) NOT NULL,
  `TypeId` varchar(50) NOT NULL,
  `BrandId` varchar(50) NOT NULL,
  `SupplierId` varchar(50) NOT NULL,
  `ImageBlobId` varchar(50) DEFAULT NULL,
  `Color` varchar(10) DEFAULT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ProductSuppliers`
--

CREATE TABLE `ProductSuppliers` (
  `SupplierId` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Markup` decimal(5,0) DEFAULT NULL,
  `Description` text NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Company` varchar(50) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(100) NOT NULL,
  `Website` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `PostCode` varchar(10) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ProductTags`
--

CREATE TABLE `ProductTags` (
  `TagId` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CreatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ProductTypes`
--

CREATE TABLE `ProductTypes` (
  `TypeId` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SaleItems`
--

CREATE TABLE `SaleItems` (
  `SaleItemId` varchar(50) NOT NULL,
  `SaleId` varchar(50) NOT NULL,
  `ProductId` varchar(50) NOT NULL,
  `DiscountId` varchar(50) DEFAULT NULL,
  `Quantity` decimal(10,2) NOT NULL,
  `SupplyPrice` decimal(10,2) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `DiscountPrice` decimal(10,2) NOT NULL,
  `TaxAmount` decimal(10,2) NOT NULL,
  `TotalPrice` decimal(10,2) NOT NULL,
  `Note` text DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `IsDiscounted` tinyint(1) NOT NULL,
  `IsBalanceRequired` tinyint(1) NOT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Sales`
--

CREATE TABLE `Sales` (
  `SaleId` varchar(50) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `CustomerId` varchar(50) DEFAULT NULL,
  `Note` text DEFAULT NULL,
  `ItemsCount` int(4) NOT NULL,
  `SupplyPrice` decimal(10,2) NOT NULL,
  `SubTotalPrice` decimal(10,2) NOT NULL,
  `DiscountPrice` decimal(10,2) NOT NULL,
  `TaxAmount` decimal(10,2) NOT NULL,
  `TotalPrice` decimal(10,2) NOT NULL,
  `PaymentMethod` varchar(50) NOT NULL,
  `Paid` decimal(10,2) NOT NULL,
  `Balance` decimal(10,2) NOT NULL,
  `DiscountName` varchar(50) DEFAULT NULL,
  `DiscountAmount` decimal(10,2) NOT NULL,
  `DiscountPercentage` decimal(10,2) NOT NULL,
  `IsDiscounted` tinyint(1) NOT NULL,
  `IsGuest` tinyint(1) NOT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `SoldAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Software`
--

CREATE TABLE `Software` (
  `SoftId` varchar(255) NOT NULL,
  `SoftwareId` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Version` varchar(50) NOT NULL,
  `Url` varchar(255) NOT NULL,
  `Note` text NOT NULL,
  `Build` varchar(255) NOT NULL,
  `GUID` varchar(255) NOT NULL,
  `IsUpdateRequired` tinyint(1) NOT NULL,
  `ReleasedAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Stores`
--

CREATE TABLE `Stores` (
  `StoreId` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `PhoneNumber` varchar(50) NOT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `Locale` varchar(10) NOT NULL,
  `Currency` varchar(25) DEFAULT NULL,
  `Address` varchar(100) NOT NULL,
  `PostCode` varchar(10) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `IsEmailVerified` tinyint(1) NOT NULL,
  `IsVerified` tinyint(1) NOT NULL,
  `VerificationToken` varchar(50) NOT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `RegisteredAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Taxes`
--

CREATE TABLE `Taxes` (
  `TaxId` varchar(50) NOT NULL,
  `StoreId` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Rate` decimal(10,0) NOT NULL,
  `ShortName` varchar(10) NOT NULL,
  `StoreShortName` varchar(10) NOT NULL,
  `Description` text NOT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UserId` varchar(50) NOT NULL,
  `Token` varchar(50) NOT NULL,
  `StoreId` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PinCode` varchar(10) NOT NULL,
  `Role` varchar(10) NOT NULL,
  `Locale` varchar(10) NOT NULL,
  `Color` varchar(10) NOT NULL,
  `ImageBlobId` varchar(255) DEFAULT NULL,
  `IsOnline` tinyint(1) NOT NULL,
  `IsVerified` tinyint(1) NOT NULL,
  `LastActive` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `RegisteredAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `App`
--
ALTER TABLE `App`
  ADD PRIMARY KEY (`AppId`);

--
-- Indexes for table `Blobs`
--
ALTER TABLE `Blobs`
  ADD PRIMARY KEY (`BlobId`);

--
-- Indexes for table `CustomerGroups`
--
ALTER TABLE `CustomerGroups`
  ADD PRIMARY KEY (`GroupId`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`CustomerId`);

--
-- Indexes for table `Discounts`
--
ALTER TABLE `Discounts`
  ADD PRIMARY KEY (`DiscountId`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderId`);

--
-- Indexes for table `PaymentTypes`
--
ALTER TABLE `PaymentTypes`
  ADD PRIMARY KEY (`StoreId`);

--
-- Indexes for table `ProductBrands`
--
ALTER TABLE `ProductBrands`
  ADD PRIMARY KEY (`BrandId`);

--
-- Indexes for table `ProductDiscounts`
--
ALTER TABLE `ProductDiscounts`
  ADD UNIQUE KEY `ProductId` (`ProductId`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`ProductId`),
  ADD UNIQUE KEY `Barcode` (`Barcode`);

--
-- Indexes for table `ProductSuppliers`
--
ALTER TABLE `ProductSuppliers`
  ADD PRIMARY KEY (`SupplierId`);

--
-- Indexes for table `ProductTypes`
--
ALTER TABLE `ProductTypes`
  ADD PRIMARY KEY (`TypeId`);

--
-- Indexes for table `SaleItems`
--
ALTER TABLE `SaleItems`
  ADD PRIMARY KEY (`SaleItemId`);

--
-- Indexes for table `Sales`
--
ALTER TABLE `Sales`
  ADD PRIMARY KEY (`SaleId`);

--
-- Indexes for table `Software`
--
ALTER TABLE `Software`
  ADD PRIMARY KEY (`SoftId`);

--
-- Indexes for table `Stores`
--
ALTER TABLE `Stores`
  ADD PRIMARY KEY (`StoreId`);

--
-- Indexes for table `Taxes`
--
ALTER TABLE `Taxes`
  ADD PRIMARY KEY (`TaxId`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `UserToken` (`Token`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
