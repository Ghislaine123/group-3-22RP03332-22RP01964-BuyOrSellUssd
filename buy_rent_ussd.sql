-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2025 at 03:27 PM
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
-- Database: `buy_rent_ussd`
--

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `type` enum('rent','sale') DEFAULT NULL,
  `seller_phone` varchar(20) DEFAULT NULL,
  `status` enum('available','rented','sold') DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`id`, `title`, `location`, `price`, `type`, `seller_phone`, `status`) VALUES
(1, 'HOUSE1', 'Kigali', 10000.00, 'rent', '+250792524908', 'available'),
(2, 'HOUSE2', 'Gisenyi', 100.00, 'rent', '+250792524908', 'available'),
(4, 'HOUSE3', 'Gisenyi', 200.00, 'rent', '+250792524908', 'available'),
(6, 'VILLAS', 'Kicukiro', 100.00, 'sale', '+250792524908', 'available'),
(7, 'HOUSE8', 'Gisenyi', 1.00, 'rent', '+250792524908', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `house_id` int(11) DEFAULT NULL,
  `buyer_phone` varchar(20) DEFAULT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `house_id`, `buyer_phone`, `status`, `created_at`) VALUES
(1, 1, '+250792524902', 'rejected', '2025-05-14 04:30:47'),
(2, 1, '+250792524902', 'pending', '2025-05-14 10:34:49'),
(3, 1, '+250792524900', 'pending', '2025-05-14 13:11:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `pin` varchar(4) DEFAULT NULL,
  `role` enum('buyer','seller') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `phone`, `name`, `pin`, `role`) VALUES
(1, '+250792524902', 'Theogene', '4444', 'buyer'),
(2, '+250792524908', 'Ghislaine', '4444', 'seller'),
(4, '+250792524900', 'Henry', '1212', 'buyer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_phone` (`seller_phone`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house_id` (`house_id`),
  ADD KEY `buyer_phone` (`buyer_phone`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `houses`
--
ALTER TABLE `houses`
  ADD CONSTRAINT `houses_ibfk_1` FOREIGN KEY (`seller_phone`) REFERENCES `users` (`phone`);

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`),
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`buyer_phone`) REFERENCES `users` (`phone`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
