-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2022 at 02:01 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `retail_database_seminar`
--

-- --------------------------------------------------------

--
-- Table structure for table `auditreport`
--

CREATE TABLE `auditreport` (
  `audit_id` varchar(255) NOT NULL,
  `audit_datetime` date NOT NULL,
  `product_line_id` varchar(255) NOT NULL,
  `theory_value` int(255) NOT NULL,
  `true_value` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `billdetails`
--

CREATE TABLE `billdetails` (
  `bill_id` varchar(255) NOT NULL,
  `product_instance_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryorder`
--

CREATE TABLE `deliveryorder` (
  `delivery_Order_id` varchar(255) NOT NULL,
  `delivery_Order_date` date NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `expected_quantity` int(255) NOT NULL,
  `actual_quantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryorderdetail`
--

CREATE TABLE `deliveryorderdetail` (
  `delivery_order_id` varchar(255) NOT NULL,
  `product_instance_id` varchar(255) NOT NULL,
  `is_checked` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `producline`
--

CREATE TABLE `producline` (
  `product_line_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `stock` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `productinstancerfid`
--

CREATE TABLE `productinstancerfid` (
  `product_instance_id` varchar(255) NOT NULL,
  `product_line_id` varchar(255) NOT NULL,
  `is_purchased` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tagread`
--

CREATE TABLE `tagread` (
  `tad_read_id` varchar(255) NOT NULL,
  `product_instance_id` varchar(255) NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auditreport`
--
ALTER TABLE `auditreport`
  ADD PRIMARY KEY (`audit_id`),
  ADD KEY `product_line_id` (`product_line_id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `billdetails`
--
ALTER TABLE `billdetails`
  ADD PRIMARY KEY (`bill_id`,`product_instance_id`),
  ADD KEY `product_instance_id` (`product_instance_id`);

--
-- Indexes for table `deliveryorder`
--
ALTER TABLE `deliveryorder`
  ADD PRIMARY KEY (`delivery_Order_id`);

--
-- Indexes for table `deliveryorderdetail`
--
ALTER TABLE `deliveryorderdetail`
  ADD PRIMARY KEY (`delivery_order_id`),
  ADD KEY `product_instance_id` (`product_instance_id`);

--
-- Indexes for table `producline`
--
ALTER TABLE `producline`
  ADD PRIMARY KEY (`product_line_id`);

--
-- Indexes for table `productinstancerfid`
--
ALTER TABLE `productinstancerfid`
  ADD PRIMARY KEY (`product_instance_id`),
  ADD KEY `product_line_id` (`product_line_id`);

--
-- Indexes for table `tagread`
--
ALTER TABLE `tagread`
  ADD PRIMARY KEY (`tad_read_id`),
  ADD KEY `product_instance_id` (`product_instance_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auditreport`
--
ALTER TABLE `auditreport`
  ADD CONSTRAINT `auditreport_ibfk_1` FOREIGN KEY (`product_line_id`) REFERENCES `producline` (`product_line_id`);

--
-- Constraints for table `billdetails`
--
ALTER TABLE `billdetails`
  ADD CONSTRAINT `billdetails_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`),
  ADD CONSTRAINT `billdetails_ibfk_2` FOREIGN KEY (`product_instance_id`) REFERENCES `productinstancerfid` (`product_instance_id`);

--
-- Constraints for table `deliveryorderdetail`
--
ALTER TABLE `deliveryorderdetail`
  ADD CONSTRAINT `deliveryorderdetail_ibfk_1` FOREIGN KEY (`product_instance_id`) REFERENCES `productinstancerfid` (`product_instance_id`),
  ADD CONSTRAINT `deliveryorderdetail_ibfk_2` FOREIGN KEY (`delivery_order_id`) REFERENCES `deliveryorder` (`delivery_Order_id`);

--
-- Constraints for table `productinstancerfid`
--
ALTER TABLE `productinstancerfid`
  ADD CONSTRAINT `productinstancerfid_ibfk_1` FOREIGN KEY (`product_line_id`) REFERENCES `producline` (`product_line_id`);

--
-- Constraints for table `tagread`
--
ALTER TABLE `tagread`
  ADD CONSTRAINT `tagread_ibfk_1` FOREIGN KEY (`product_instance_id`) REFERENCES `productinstancerfid` (`product_instance_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
