-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2017 at 04:30 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pk2s`
--
CREATE DATABASE IF NOT EXISTS `pk2s` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pk2s`;

-- --------------------------------------------------------

--
-- Table structure for table `bayar`
--

CREATE TABLE `bayar` (
  `kd_bayar` int(11) NOT NULL,
  `kd_jual` int(11) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_jual`
--

CREATE TABLE `detail_jual` (
  `kd_detail_jual` int(11) NOT NULL,
  `kd_jual` int(11) NOT NULL,
  `kd_tiket` varchar(25) NOT NULL,
  `kd_kelas` varchar(25) NOT NULL,
  `kd_jenis` varchar(25) NOT NULL,
  `kd_jadwal` varchar(25) NOT NULL,
  `no_gantangan` char(60) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `kd_jadwal` varchar(25) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `tgl_lomba` date NOT NULL,
  `tempat_lomba` varchar(50) NOT NULL,
  `jam` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_burung`
--

CREATE TABLE `jenis_burung` (
  `kd_jenis` varchar(25) NOT NULL,
  `nama_jenis` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelas_burung`
--

CREATE TABLE `kelas_burung` (
  `kd_kelas` varchar(25) NOT NULL,
  `nama_kelas` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `panitia`
--

CREATE TABLE `panitia` (
  `user` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `panitia`
--

INSERT INTO `panitia` (`user`, `password`) VALUES
('dika', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `kd_jual` int(11) NOT NULL,
  `kd_peserta` int(11) NOT NULL,
  `tgl_jual` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`kd_jual`, `kd_peserta`, `tgl_jual`) VALUES
(0, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `kd_peserta` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_rek` int(20) NOT NULL,
  `no_telp` int(11) NOT NULL,
  `jenkel` enum('Perempuan','Laki-laki') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `kd_tiket` varchar(25) NOT NULL,
  `nama_tiket` varchar(25) NOT NULL,
  `harga` int(11) NOT NULL,
  `stock` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bayar`
--
ALTER TABLE `bayar`
  ADD PRIMARY KEY (`kd_bayar`),
  ADD KEY `kd_jual` (`kd_jual`);

--
-- Indexes for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD PRIMARY KEY (`kd_detail_jual`),
  ADD KEY `kd_jual` (`kd_jual`),
  ADD KEY `kd_tiket` (`kd_tiket`),
  ADD KEY `kd_kelas` (`kd_kelas`),
  ADD KEY `kd_jenis` (`kd_jenis`),
  ADD KEY `kd_jadwal` (`kd_jadwal`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`kd_jadwal`);

--
-- Indexes for table `jenis_burung`
--
ALTER TABLE `jenis_burung`
  ADD PRIMARY KEY (`kd_jenis`);

--
-- Indexes for table `kelas_burung`
--
ALTER TABLE `kelas_burung`
  ADD PRIMARY KEY (`kd_kelas`);

--
-- Indexes for table `panitia`
--
ALTER TABLE `panitia`
  ADD PRIMARY KEY (`user`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`kd_jual`),
  ADD KEY `kd_peserta` (`kd_peserta`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`kd_peserta`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`kd_tiket`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `kd_peserta` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bayar`
--
ALTER TABLE `bayar`
  ADD CONSTRAINT `bayar_ibfk_1` FOREIGN KEY (`kd_jual`) REFERENCES `penjualan` (`kd_jual`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD CONSTRAINT `detail_jual_ibfk_1` FOREIGN KEY (`kd_jual`) REFERENCES `penjualan` (`kd_jual`),
  ADD CONSTRAINT `detail_jual_ibfk_2` FOREIGN KEY (`kd_tiket`) REFERENCES `tiket` (`kd_tiket`),
  ADD CONSTRAINT `detail_jual_ibfk_3` FOREIGN KEY (`kd_kelas`) REFERENCES `kelas_burung` (`kd_kelas`),
  ADD CONSTRAINT `detail_jual_ibfk_4` FOREIGN KEY (`kd_jenis`) REFERENCES `jenis_burung` (`kd_jenis`),
  ADD CONSTRAINT `detail_jual_ibfk_5` FOREIGN KEY (`kd_jadwal`) REFERENCES `jadwal` (`kd_jadwal`);

--
-- Constraints for table `peserta`
--
ALTER TABLE `peserta`
  ADD CONSTRAINT `peserta_ibfk_1` FOREIGN KEY (`kd_peserta`) REFERENCES `penjualan` (`kd_peserta`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
