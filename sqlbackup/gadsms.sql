-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2022 at 03:39 PM
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
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `device_name` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `customer_id`, `service_id`, `start_date`, `end_date`, `created_date`, `updated_by`, `updated_date`, `device_name`, `status`) VALUES
(2, 9876, 956374, '2022-05-16', '2022-05-18', '2022-05-16 16:45:55', 'Kent Armelia', '2022-05-23 18:50:55', 'Kent Armelia', 'Done'),
(3, 33659030, 956374, '2022-05-17', '2022-05-17', '2022-05-17 19:03:55', 'Kent Armelia', '2022-05-23 18:51:11', 'adfssss', 'Done'),
(5, 33659030, 941563, '2022-05-17', '2022-05-18', '2022-05-17 21:31:38', 'Kent Armelia', '2022-05-23 18:51:16', 'vivo y1', 'Done'),
(6, 9876, 941563, '2022-05-22', '2022-05-23', '2022-05-22 16:53:40', 'Kent Armelia', '2022-05-23 18:51:18', 'sdfok', 'Done'),
(7, 9876, 941563, '2022-05-23', '2022-05-23', '2022-05-23 21:14:53', NULL, NULL, 'janet', 'pending');

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
(11585844, 'Armelia', 'Jeanica', 'None', '09423123582', 'jeannkay06@gmail.com', 'Belle Ame', 'kentbobo'),
(18923865, 'intong', 'roger', 'None', '645655641654', 'rogerintong@gmail.com', 'emzhee', 'daisy'),
(33659030, 'opina', 'james kaiser', 'None', '090241759835', 'jameskaiser@gmail.com', 'lesliejava', 'kaiser123'),
(47869263, 'armelia', 'angela bianca', 'None', '09164641246', 'biancaarmelia@gmail.com', 'anree', 'sighilak'),
(59211294, 'Armelia', 'Jeanica Ann', 'None', '09423123582', 'jeannkay06@gmail.com', 'Nica', 'belleame'),
(69035274, 'abapo', 'joy', 'None', '152352436346', 'joyabapo@gmail.com', 'jepang', 'joyjoy'),
(93933159, 'pescadero', 'ciara camille', 'madaue city', '120301247', 'ciarapescadero@gmail.com', 'ciarapescadero', 'pescadero');

-- --------------------------------------------------------

--
-- Table structure for table `defect_prod_inventory`
--

CREATE TABLE `defect_prod_inventory` (
  `defect_prod_id` int(10) NOT NULL,
  `prod_detail_id` int(10) NOT NULL,
  `defect_prod_desc` varchar(50) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_price` double(12,2) NOT NULL,
  `product_type_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `defect_prod_inventory`
--

INSERT INTO `defect_prod_inventory` (`defect_prod_id`, `prod_detail_id`, `defect_prod_desc`, `product_name`, `quantity`, `product_price`, `product_type_id`) VALUES
(2222, 1111, 'Wireless Gaming Mouse, 16K Optical Sensor', 'Logitech G604 LIGHTSPEED', 1, 3795.00, 141859),
(2226, 1111, 'basta diri guba', 'sample 1', 20, 202345.00, 141857);

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

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`product_id`, `product_type_id`, `product_name`, `product_price`, `discount_price`, `stock_quantity`, `create_by`, `create_date`, `updated_by`, `updated_date`) VALUES
(19293, 141859, 'Logitech G604 LIGHTSPEED', '3795.00', '0.10', 15, 'Chester Ace Saagundo', '2022-04-22 07:02:28', 'Chester Ace Saagundo', '2022-04-22 07:02:28'),
(19824, 141857, 'OPPO A94', '15999.00', '0.20', 13, 'Philip Gabriel Bornea', '2022-04-20 11:23:48', 'Charles John Cañete', '2022-05-03 21:09:59'),
(19958, 141857, 'Samsung 27\" Gaming Monitor', '5457.00', '0.05', 18, 'Charles John Cañete', '2022-04-18 11:47:53', 'Charles John Cañete', '2022-05-03 21:32:54');

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

--
-- Dumping data for table `product_sale`
--

INSERT INTO `product_sale` (`prod_sale_ref_id`, `customer_id`, `created_by`, `created_data`) VALUES
(2851, 9876, 'Charles John Cañete', '2022-11-11 13:23:44');

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

--
-- Dumping data for table `product_sale_detail`
--

INSERT INTO `product_sale_detail` (`prod_detail_id`, `prod_sale_ref_id`, `product_type_id`, `quantity`, `sale_price`, `created_by`, `created_date`) VALUES
(1111, 2851, 141859, 15, '3795.00', 'Charles John Cañete', '2022-11-11 13:35:29');

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `product_type_id` int(10) NOT NULL,
  `product_type_name` varchar(100) NOT NULL,
  `product_type_desc` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`product_type_id`, `product_type_name`, `product_type_desc`) VALUES
(141857, 'OPPO Smartphone', '8GB RAM + 128GB ROM, MTK P95 Octa Core'),
(141858, 'Asus Laptop', 'AMD Ryzen 7 4800HS Mobile Processor, NVIDIA GeForc'),
(141859, 'Logitech Mouse', 'Wireless Gaming Mouse, 16K Optical Sensor'),
(141871, 'Samsung Monitor', 'Resolution 2,560 x 1,440, Screen Curvature 1000r C');

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
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service_id`, `service_type_id`, `item_quipment`, `rating`, `service_price`, `user_id`) VALUES
(941563, 222, 'screwdriver', '0', '500.00', 1112),
(956374, 111, 'screwdriver', '0', '1000.00', 1112);

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

--
-- Dumping data for table `service_sale`
--

INSERT INTO `service_sale` (`serv_sale_ref_id`, `customer_id`, `created_by`, `created_date`) VALUES
(8, 33659030, 'chester ace', '2022-05-16 16:51:05'),
(9, 9876, 'chester ace', '2022-05-16 16:51:05');

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

--
-- Dumping data for table `service_sale_detail`
--

INSERT INTO `service_sale_detail` (`serv_detail_id`, `serv_sale_ref_id`, `service_id`, `created_by`, `created_date`) VALUES
(1, 8, 941563, 'chester ace', '2022-05-16 16:52:46'),
(2, 8, 956374, 'chester ace', '2022-05-16 16:52:46'),
(3, 9, 941563, 'chester ace', '2022-05-16 16:53:45'),
(4, 9, 956374, 'chester ace', '2022-05-16 16:53:46');

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE `service_type` (
  `service_type_id` int(10) NOT NULL,
  `service_type_name` varchar(50) NOT NULL,
  `service_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_type`
--

INSERT INTO `service_type` (`service_type_id`, `service_type_name`, `service_desc`) VALUES
(111, 'repair', 'repair defective devices'),
(222, 'device checkup', 'check up device');

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
  ADD KEY `prod_detail_id` (`prod_detail_id`),
  ADD KEY `product_type_id` (`product_type_id`);

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
  ADD KEY `service_type_id` (`service_type_id`),
  ADD KEY `user_id` (`user_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `defect_prod_inventory`
--
ALTER TABLE `defect_prod_inventory`
  MODIFY `defect_prod_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2229;

--
-- AUTO_INCREMENT for table `service_sale_detail`
--
ALTER TABLE `service_sale_detail`
  MODIFY `serv_detail_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `defect_prod_inventory_ibfk_1` FOREIGN KEY (`prod_detail_id`) REFERENCES `product_sale_detail` (`prod_detail_id`),
  ADD CONSTRAINT `product_type_id` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`product_type_id`);

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
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`service_type_id`) REFERENCES `service_type` (`service_type_id`),
  ADD CONSTRAINT `service_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

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
