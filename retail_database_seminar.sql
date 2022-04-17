-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 15, 2022 lúc 03:46 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `retail_database_seminar`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auditreport`
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
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `bill_id` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetails`
--

CREATE TABLE `billdetails` (
  `bill_id` varchar(255) NOT NULL,
  `product_instance_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deliveryorder`
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
-- Cấu trúc bảng cho bảng `deliveryorderdetail`
--

CREATE TABLE `deliveryorderdetail` (
  `delivery_order_id` varchar(255) NOT NULL,
  `product_instance_id` varchar(255) NOT NULL,
  `is_checked` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `producline`
--

CREATE TABLE `producline` (
  `product_line_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `stock` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productinstancerfid`
--

CREATE TABLE `productinstancerfid` (
  `product_instance_id` varchar(255) NOT NULL,
  `product_line_id` varchar(255) NOT NULL,
  `is_purchased` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tagread`
--

CREATE TABLE `tagread` (
  `tad_read_id` varchar(255) NOT NULL,
  `product_instance_id` varchar(255) NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auditreport`
--
ALTER TABLE `auditreport`
  ADD PRIMARY KEY (`audit_id`),
  ADD KEY `product_line_id` (`product_line_id`);

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`);

--
-- Chỉ mục cho bảng `billdetails`
--
ALTER TABLE `billdetails`
  ADD PRIMARY KEY (`bill_id`,`product_instance_id`),
  ADD KEY `product_instance_id` (`product_instance_id`);

--
-- Chỉ mục cho bảng `deliveryorder`
--
ALTER TABLE `deliveryorder`
  ADD PRIMARY KEY (`delivery_Order_id`);

--
-- Chỉ mục cho bảng `deliveryorderdetail`
--
ALTER TABLE `deliveryorderdetail`
  ADD PRIMARY KEY (`delivery_order_id`),
  ADD KEY `product_instance_id` (`product_instance_id`);

--
-- Chỉ mục cho bảng `producline`
--
ALTER TABLE `producline`
  ADD PRIMARY KEY (`product_line_id`);

--
-- Chỉ mục cho bảng `productinstancerfid`
--
ALTER TABLE `productinstancerfid`
  ADD PRIMARY KEY (`product_instance_id`),
  ADD KEY `product_line_id` (`product_line_id`);

--
-- Chỉ mục cho bảng `tagread`
--
ALTER TABLE `tagread`
  ADD PRIMARY KEY (`tad_read_id`),
  ADD KEY `product_instance_id` (`product_instance_id`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auditreport`
--
ALTER TABLE `auditreport`
  ADD CONSTRAINT `auditreport_ibfk_1` FOREIGN KEY (`product_line_id`) REFERENCES `producline` (`product_line_id`);

--
-- Các ràng buộc cho bảng `billdetails`
--
ALTER TABLE `billdetails`
  ADD CONSTRAINT `billdetails_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`),
  ADD CONSTRAINT `billdetails_ibfk_2` FOREIGN KEY (`product_instance_id`) REFERENCES `productinstancerfid` (`product_instance_id`);

--
-- Các ràng buộc cho bảng `deliveryorderdetail`
--
ALTER TABLE `deliveryorderdetail`
  ADD CONSTRAINT `deliveryorderdetail_ibfk_1` FOREIGN KEY (`product_instance_id`) REFERENCES `productinstancerfid` (`product_instance_id`),
  ADD CONSTRAINT `deliveryorderdetail_ibfk_2` FOREIGN KEY (`delivery_order_id`) REFERENCES `deliveryorder` (`delivery_Order_id`);

--
-- Các ràng buộc cho bảng `productinstancerfid`
--
ALTER TABLE `productinstancerfid`
  ADD CONSTRAINT `productinstancerfid_ibfk_1` FOREIGN KEY (`product_line_id`) REFERENCES `producline` (`product_line_id`);

--
-- Các ràng buộc cho bảng `tagread`
--
ALTER TABLE `tagread`
  ADD CONSTRAINT `tagread_ibfk_1` FOREIGN KEY (`product_instance_id`) REFERENCES `productinstancerfid` (`product_instance_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
