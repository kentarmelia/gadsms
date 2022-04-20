-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2022 at 12:44 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gadsms`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `service_id` int(10) NOT NULL,
  `agenda` varchar(50) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(100) NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(10) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(40) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `lastname`, `firstname`, `address`, `phone`, `email`, `username`, `password`) VALUES
(9876, 'Damolo', 'Christus Aldrich', 'Cebu City', '09123456678', 'damoloo@gmail.com', 'chixboydams', 'damolo123'),
(33659030, 'opina', 'james kaiser', 'None', '090241759835', 'jameskaiser@gmail.com', 'lesliejava', 'kaiser123'),
(59211294, 'Armelia', 'Jeanica Ann', 'None', '09423123582', 'jeannkay06@gmail.com', 'Nica', 'belleame');

-- --------------------------------------------------------

--
-- Table structure for table `defect_prod_inventory`
--

CREATE TABLE `defect_prod_inventory` (
  `defect_prod_id` int(10) NOT NULL,
  `prod_detail_id` int(10) NOT NULL,
  `defect_prod_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `product_id` int(10) NOT NULL,
  `product_type_id` int(10) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_price` decimal(12,2) NOT NULL,
  `discount_price` decimal(12,2) DEFAULT NULL,
  `stock_quantity` int(11) NOT NULL,
  `create_by` varchar(100) NOT NULL,
  `create_date` datetime NOT NULL,
  `updated_by` varchar(100) NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_sale`
--

CREATE TABLE `product_sale` (
  `prod_sale_ref_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_sale_detail`
--

CREATE TABLE `product_sale_detail` (
  `prod_detail_id` int(10) NOT NULL,
  `prod_sale_ref_id` int(10) NOT NULL,
  `product_type_id` int(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sale_price` decimal(12,2) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `product_type_id` int(10) NOT NULL,
  `product_type_name` varchar(100) NOT NULL,
  `product_type_desc` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(10) NOT NULL,
  `role_name` varchar(30) NOT NULL,
  `role_desc` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `role_desc`) VALUES
(123, 'Admin', 'Administrator/Manager'),
(456, 'Seller', 'Product Seller'),
(789, 'Technician', 'Repairing or Replacing faulty equipment and other ');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(10) NOT NULL,
  `service_type_id` int(10) NOT NULL,
  `item_quipment` varchar(50) NOT NULL,
  `rating` varchar(50) NOT NULL,
  `service_price` decimal(12,2) NOT NULL,
  `assigned_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service_sale`
--

CREATE TABLE `service_sale` (
  `serv_sale_ref_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service_sale_detail`
--

CREATE TABLE `service_sale_detail` (
  `serv_detail_id` int(10) NOT NULL,
  `serv_sale_ref_id` int(10) NOT NULL,
  `service_id` int(10) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE `service_type` (
  `service_type_id` int(10) NOT NULL,
  `service_type_name` varchar(50) NOT NULL,
  `service_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `role_id`, `username`, `password`, `lastname`, `firstname`, `address`, `phone`, `email`) VALUES
(1112, 789, 'technician_kent', 'kent123', 'Armelia', 'Kent', 'Talisay, Cebu', '09786392125', 'senpaisen@gmail.com'),
(1357, 123, 'admin_charles', 'charles123', 'Cañete', 'Charles John', 'Tabunok, Cebu', '01234567891', 'charlesxd@gmail.com'),
(2468, 456, 'seller_chester', 'chester123', 'Saagundo', 'Chester Ace', 'Bantayan, Cebu', '09876543321', 'csaagundo@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`,`customer_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `defect_prod_inventory`
--
ALTER TABLE `defect_prod_inventory`
  ADD PRIMARY KEY (`defect_prod_id`),
  ADD KEY `prod_detail_id` (`prod_detail_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_type_id` (`product_type_id`);

--
-- Indexes for table `product_sale`
--
ALTER TABLE `product_sale`
  ADD PRIMARY KEY (`prod_sale_ref_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `product_sale_detail`
--
ALTER TABLE `product_sale_detail`
  ADD PRIMARY KEY (`prod_detail_id`,`prod_sale_ref_id`),
  ADD KEY `prod_sale_ref_id` (`prod_sale_ref_id`),
  ADD KEY `product_type_id` (`product_type_id`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`product_type_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `service_type_id` (`service_type_id`);

--
-- Indexes for table `service_sale`
--
ALTER TABLE `service_sale`
  ADD PRIMARY KEY (`serv_sale_ref_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `service_sale_detail`
--
ALTER TABLE `service_sale_detail`
  ADD PRIMARY KEY (`serv_detail_id`,`serv_sale_ref_id`),
  ADD KEY `serv_sale_ref_id` (`serv_sale_ref_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`service_type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`);

--
-- Constraints for table `defect_prod_inventory`
--
ALTER TABLE `defect_prod_inventory`
  ADD CONSTRAINT `defect_prod_inventory_ibfk_1` FOREIGN KEY (`prod_detail_id`) REFERENCES `product_sale_detail` (`prod_detail_id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`product_type_id`);

--
-- Constraints for table `product_sale`
--
ALTER TABLE `product_sale`
  ADD CONSTRAINT `product_sale_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `product_sale_detail`
--
ALTER TABLE `product_sale_detail`
  ADD CONSTRAINT `product_sale_detail_ibfk_1` FOREIGN KEY (`prod_sale_ref_id`) REFERENCES `product_sale` (`prod_sale_ref_id`),
  ADD CONSTRAINT `product_sale_detail_ibfk_2` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`product_type_id`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`service_type_id`) REFERENCES `service_type` (`service_type_id`);

--
-- Constraints for table `service_sale`
--
ALTER TABLE `service_sale`
  ADD CONSTRAINT `service_sale_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `service_sale_detail`
--
ALTER TABLE `service_sale_detail`
  ADD CONSTRAINT `service_sale_detail_ibfk_1` FOREIGN KEY (`serv_sale_ref_id`) REFERENCES `service_sale` (`serv_sale_ref_id`),
  ADD CONSTRAINT `service_sale_detail_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
