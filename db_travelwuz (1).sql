-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2018 at 12:40 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_travelwuz`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer`
--

CREATE TABLE `tb_customer` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(25) NOT NULL,
  `gender` set('male','female') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_customer`
--

INSERT INTO `tb_customer` (`id`, `name`, `address`, `phone`, `email`, `gender`) VALUES
(1, 'John Kennedy', 'Jl. Gerilya Timur', '08123123', 'john@kennedy.com', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `tb_passengers`
--

CREATE TABLE `tb_passengers` (
  `id` int(5) NOT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `reservation_id` int(5) DEFAULT NULL,
  `seat` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_passengers`
--

INSERT INTO `tb_passengers` (`id`, `customer_id`, `reservation_id`, `seat`) VALUES
(1, 1, 1, '5');

-- --------------------------------------------------------

--
-- Table structure for table `tb_reservation`
--

CREATE TABLE `tb_reservation` (
  `id` int(5) NOT NULL,
  `reservation_code` varchar(25) DEFAULT NULL,
  `reservation_at` datetime DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `seat_code` varchar(25) DEFAULT NULL,
  `rute_id` int(5) DEFAULT NULL,
  `depart_at` datetime DEFAULT '0000-00-00 00:00:00',
  `price` int(11) DEFAULT NULL,
  `user_id` int(5) DEFAULT NULL,
  `status` set('Menunggu Konfirmasi','Konfirmasi') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_reservation`
--

INSERT INTO `tb_reservation` (`id`, `reservation_code`, `reservation_at`, `customer_id`, `seat_code`, `rute_id`, `depart_at`, `price`, `user_id`, `status`) VALUES
(1, 'TRV-54098-WUZ', '2018-02-25 20:17:55', 1, '5', 2, '2018-02-26 03:15:00', 9000000, 7, 'Menunggu Konfirmasi');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rute`
--

CREATE TABLE `tb_rute` (
  `id` int(5) NOT NULL,
  `depart_at` datetime NOT NULL,
  `depart_arrive` datetime DEFAULT NULL,
  `rute_from` text NOT NULL,
  `rute_to` text NOT NULL,
  `price` int(11) NOT NULL,
  `class` set('Economy','Business','First Class') DEFAULT NULL,
  `transportation_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rute`
--

INSERT INTO `tb_rute` (`id`, `depart_at`, `depart_arrive`, `rute_from`, `rute_to`, `price`, `class`, `transportation_id`) VALUES
(1, '2018-02-26 07:29:00', '2018-02-27 09:00:00', 'Jakarta', 'Bali', 7000000, 'Economy', 1),
(2, '2018-02-26 03:15:00', '2018-02-27 04:00:00', 'Bali', 'Jambi', 9000000, 'First Class', 1),
(3, '2018-02-26 04:00:00', '2018-02-27 05:00:00', 'Bali', 'Jakarta', 7600000, 'Business', 1),
(4, '2018-02-26 18:00:00', '2018-02-26 19:00:00', 'Jakarta', 'Bali', 650000, 'Business', 1),
(5, '2018-02-26 21:30:00', '2018-02-27 22:00:00', 'Malang', 'Surabaya', 15000000, 'First Class', 2),
(6, '2018-02-26 19:21:00', '2018-02-26 23:59:00', 'Jakarta', 'Bali', 550000, 'Economy', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_transportation`
--

CREATE TABLE `tb_transportation` (
  `id` int(5) NOT NULL,
  `code` varchar(25) NOT NULL,
  `seat_qty` int(5) NOT NULL,
  `transportation_type_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_transportation`
--

INSERT INTO `tb_transportation` (`id`, `code`, `seat_qty`, `transportation_type_id`) VALUES
(1, 'GRD01', 68, 1),
(2, 'ARS01', 32, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_transportation_type`
--

CREATE TABLE `tb_transportation_type` (
  `id` int(5) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_transportation_type`
--

INSERT INTO `tb_transportation_type` (`id`, `description`) VALUES
(1, 'Pesawat Garuda Air'),
(2, 'Pesawat Air Asia');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(5) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `level` set('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `password`, `fullname`, `level`) VALUES
(1, 'ade1256', 'YWRlMTI1NjEyNTY=', 'Ade Prasetyo', 'admin'),
(6, 'gueganteng', 'YWRlMTI1NjEyNTY=', 'gantengabis', 'user'),
(7, 'user1', 'YWRlMTI1NjEyNTY=', 'John Kennedy', 'user'),
(8, 'abraham123', 'YWRlMTI1NjEyNTY=', 'Abraham', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_passengers`
--
ALTER TABLE `tb_passengers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_id` (`customer_id`),
  ADD KEY `fk_reservation_id` (`reservation_id`);

--
-- Indexes for table `tb_reservation`
--
ALTER TABLE `tb_reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rute_id` (`rute_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `tb_rute`
--
ALTER TABLE `tb_rute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transportation_id` (`transportation_id`);

--
-- Indexes for table `tb_transportation`
--
ALTER TABLE `tb_transportation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transportation_type_id` (`transportation_type_id`);

--
-- Indexes for table `tb_transportation_type`
--
ALTER TABLE `tb_transportation_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_passengers`
--
ALTER TABLE `tb_passengers`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_reservation`
--
ALTER TABLE `tb_reservation`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_passengers`
--
ALTER TABLE `tb_passengers`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `tb_customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reservation_id` FOREIGN KEY (`reservation_id`) REFERENCES `tb_reservation` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tb_reservation`
--
ALTER TABLE `tb_reservation`
  ADD CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `tb_customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `rute_id` FOREIGN KEY (`rute_id`) REFERENCES `tb_rute` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tb_rute`
--
ALTER TABLE `tb_rute`
  ADD CONSTRAINT `transportation_id` FOREIGN KEY (`transportation_id`) REFERENCES `tb_transportation` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tb_transportation`
--
ALTER TABLE `tb_transportation`
  ADD CONSTRAINT `transportation_type_id` FOREIGN KEY (`transportation_type_id`) REFERENCES `tb_transportation_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
