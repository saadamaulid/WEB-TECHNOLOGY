-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2020 at 11:30 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wedding`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cID` int(11) NOT NULL,
  `cName` varchar(50) COLLATE armscii8_bin NOT NULL,
  `cEmail` varchar(50) COLLATE armscii8_bin NOT NULL,
  `cAddress` varchar(50) COLLATE armscii8_bin NOT NULL,
  `cPhone` int(10) NOT NULL,
  `cDob` date NOT NULL,
  `cGender` char(2) COLLATE armscii8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cID`, `cName`, `cEmail`, `cAddress`, `cPhone`, `cDob`, `cGender`) VALUES
(1, 'saada maulid', 'saada@gmail.com', 'bububu', 774132396, '0000-00-00', 'op'),
(2, 'saada maulid', 'saada@gmail.com', 'Bububu', 774132396, '0000-00-00', 'op'),
(3, 'Nasra moh\'d', 'nass@gmail.com', 'Jumbi', 774132394, '0000-00-00', 'op'),
(4, 'Nasra moh\'d', 'nass@gmail.com', '', 774132394, '0000-00-00', 'op');

-- --------------------------------------------------------

--
-- Table structure for table `dressing`
--

CREATE TABLE `dressing` (
  `dressID` int(22) NOT NULL,
  `dName` varchar(50) COLLATE armscii8_bin NOT NULL,
  `dType` varchar(20) COLLATE armscii8_bin NOT NULL,
  `dSize` int(20) NOT NULL,
  `dColor` varchar(10) COLLATE armscii8_bin NOT NULL,
  `totalDressing` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

--
-- Dumping data for table `dressing`
--

INSERT INTO `dressing` (`dressID`, `dName`, `dType`, `dSize`, `dColor`, `totalDressing`) VALUES
(1, 'Mini', 'Cotton', 56, 'White', 2),
(2, 'A-line', 'cotton', 23, 'green', 7),
(3, 'Ballgown', 'Cotton', 45, 'Green', 3),
(4, 'Ballgown', 'Cotton', 27, 'Green', 2);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `usrename` varchar(50) COLLATE armscii8_bin NOT NULL,
  `loginID` int(11) NOT NULL,
  `password` varchar(30) COLLATE armscii8_bin NOT NULL,
  `role` varchar(30) COLLATE armscii8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`usrename`, `loginID`, `password`, `role`) VALUES
('saadma', 1, '12345', 'customer'),
('abdul', 2, '54321', 'manager'),
('namos', 3, '123456', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `orderID` int(11) NOT NULL,
  `ordeName` varchar(50) COLLATE armscii8_bin NOT NULL,
  `cID` int(11) NOT NULL,
  `amount` int(30) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `orderdressing`
--

CREATE TABLE `orderdressing` (
  `ordDID` int(11) NOT NULL,
  `dressID` int(22) NOT NULL,
  `orderID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cID`);

--
-- Indexes for table `dressing`
--
ALTER TABLE `dressing`
  ADD PRIMARY KEY (`dressID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`loginID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `cID` (`cID`);

--
-- Indexes for table `orderdressing`
--
ALTER TABLE `orderdressing`
  ADD PRIMARY KEY (`ordDID`),
  ADD KEY `dressID` (`dressID`),
  ADD KEY `orderID` (`orderID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dressing`
--
ALTER TABLE `dressing`
  MODIFY `dressID` int(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `loginID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orderdressing`
--
ALTER TABLE `orderdressing`
  MODIFY `ordDID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `customer` (`cID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderdressing`
--
ALTER TABLE `orderdressing`
  ADD CONSTRAINT `orderdressing_ibfk_1` FOREIGN KEY (`dressID`) REFERENCES `dressing` (`dressID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdressing_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
