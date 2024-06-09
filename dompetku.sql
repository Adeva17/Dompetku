-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2024 at 10:17 AM
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
-- Database: `dompetku`
--

-- --------------------------------------------------------

--
-- Table structure for table `datauser`
--

CREATE TABLE `datauser` (
  `IdUser` int(11) NOT NULL,
  `NamaLengkap` varchar(100) NOT NULL,
  `NamaPanggilan` varchar(100) NOT NULL,
  `UserName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `datauser`
--

INSERT INTO `datauser` (`IdUser`, `NamaLengkap`, `NamaPanggilan`, `UserName`) VALUES
(1, 'Ahmad syukron', 'Ahmad', 'Ahmad'),
(2, 'Andrian leonardo', 'Andrian', 'Andrian');

-- --------------------------------------------------------

--
-- Table structure for table `pemasukan`
--

CREATE TABLE `pemasukan` (
  `IdPemasukan` int(11) NOT NULL,
  `IdUser` int(11) NOT NULL,
  `Nominal` int(11) NOT NULL,
  `Tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemasukan`
--

INSERT INTO `pemasukan` (`IdPemasukan`, `IdUser`, `Nominal`, `Tanggal`) VALUES
(1, 1, 50000, '2024-06-08'),
(2, 1, 4000000, '2024-06-08'),
(3, 2, 10000, '2024-06-08'),
(4, 2, 20000, '2024-06-08');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `IdPengeluaran` int(11) NOT NULL,
  `IdUser` int(11) NOT NULL,
  `NamaBarang` varchar(100) NOT NULL,
  `Nominal` int(11) NOT NULL,
  `Kategori` varchar(100) NOT NULL,
  `Deskripsi` varchar(100) NOT NULL,
  `Keterangan` varchar(100) NOT NULL,
  `Tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`IdPengeluaran`, `IdUser`, `NamaBarang`, `Nominal`, `Kategori`, `Deskripsi`, `Keterangan`, `Tanggal`) VALUES
(1, 1, 'nasi goreng', 12000, 'Kebutuhan Primer', 'makanan', 'Pengeluaran', '2024-05-07'),
(2, 1, 'bensin', 30000, 'Kebutuhan Sekunder', 'bahan bakar', 'Pengeluaran', '2024-06-08'),
(3, 1, 'hp samsung galaxi A23 5G', 3500000, 'Kebutuhan Sekunder', 'alat komunikasi', 'Pengeluaran', '2024-06-08'),
(5, 2, 'Bolpen', 6000, 'Kebutuhan Sekunder', 'alat tulis', 'Pengeluaran', '2024-06-08'),
(6, 2, 'tip x', 5000, 'Kebutuhan Sekunder', 'alat tulis', 'Pengeluaran', '2024-06-08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datauser`
--
ALTER TABLE `datauser`
  ADD PRIMARY KEY (`IdUser`);

--
-- Indexes for table `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD PRIMARY KEY (`IdPemasukan`),
  ADD KEY `IdUser` (`IdUser`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`IdPengeluaran`),
  ADD KEY `IdUser` (`IdUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datauser`
--
ALTER TABLE `datauser`
  MODIFY `IdUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pemasukan`
--
ALTER TABLE `pemasukan`
  MODIFY `IdPemasukan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `IdPengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD CONSTRAINT `pemasukan_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `datauser` (`IdUser`);

--
-- Constraints for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD CONSTRAINT `pengeluaran_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `datauser` (`IdUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
