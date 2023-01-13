-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2022 at 03:58 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pustaka`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id_booking` varchar(12) NOT NULL,
  `tgl_booking` date NOT NULL,
  `batas_ambil` date NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id_booking`, `tgl_booking`, `batas_ambil`, `id_user`) VALUES
('22092022001', '2022-09-22', '2022-09-24', 13);

-- --------------------------------------------------------

--
-- Table structure for table `booking_detail`
--

CREATE TABLE `booking_detail` (
  `id` int(11) NOT NULL,
  `id_booking` varchar(12) NOT NULL,
  `id_buku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_detail`
--

INSERT INTO `booking_detail` (`id`, `id_booking`, `id_buku`) VALUES
(7, '22092022001', 2),
(8, '22092022001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `judul_buku` varchar(128) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `pengarang` varchar(64) NOT NULL,
  `penerbit` varchar(64) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `isbn` text NOT NULL,
  `stok` int(11) NOT NULL,
  `dipinjam` int(11) NOT NULL,
  `dibooking` int(11) NOT NULL,
  `image` varchar(256) DEFAULT 'book-default-cover.jpg',
  `harga_buku` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul_buku`, `id_kategori`, `pengarang`, `penerbit`, `tahun_terbit`, `isbn`, `stok`, `dipinjam`, `dibooking`, `image`, `harga_buku`) VALUES
(1, 'CARA MENJADI GANTENG', 1, 'ridwan tamvans', 'Joygakarta', 2022, 'TEST AJA', 19, 0, 1, 'gambarmonyet.jpg', 100000),
(2, 'RIZKI AGUNG TEST', 1, 'Manusia', 'Bogor', 2022, 'Saya adalah Manusia biasa yang penuh dengan dosa', 19, 0, 1, 'tinkydipsi.jpg', 200000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `no_pinjam` varchar(12) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`) VALUES
(1, 'Komputer'),
(2, 'Bahasa'),
(3, 'Sains'),
(4, 'Hobby'),
(5, 'Komunikasi'),
(6, 'Hukum'),
(7, 'Agama'),
(8, 'Populer'),
(9, 'Komik');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu'),
(4, 'Utility'),
(5, 'Buku'),
(6, 'Anggota'),
(7, 'Laporan');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `no_pinjam` varchar(12) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `id_booking` varchar(12) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `status` enum('Pinjam','Kembali') NOT NULL,
  `total_denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'admministrator'),
(2, 'member');

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

CREATE TABLE `temp` (
  `id` int(11) NOT NULL,
  `tgl_booking` datetime DEFAULT NULL,
  `id_user` varchar(12) NOT NULL,
  `email_user` varchar(128) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `penulis` varchar(128) NOT NULL,
  `penerbit` varchar(128) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `harga_buku` int(255) NOT NULL,
  `tiket` int(11) NOT NULL,
  `total_harga` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `tanggal_input` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `image`, `password`, `role_id`, `is_active`, `tanggal_input`) VALUES
(1, 'Admin', 'admin@admin.com', 'default.jpg', '$2y$10$9RybD5D/U.Vz5Xbg1.kO.Ouj5qUpLs2RQ/kr5nOP61/IbGvUjcK5O', 1, 1, 1554218983),
(4, 'ridwan', 'ridwan@gmail.com', 'default.jpg', '$2y$10$9CKNkNiSI29n/txe7csaJ.DUyPtHFmPLnPd2ZVcmmt2P2EfuY/Yva', 2, 1, 1654967988),
(5, 'fahri', 'fahri@gmail.com', 'default.jpg', '$2y$10$z3KjM1nqL4.ObxbTlt/aIunZLcIQfNiYy6WOv1J86avdqi2w8t.sW', 2, 1, 1654968212),
(6, 'tes', 'tes@gmail.com', 'default.jpg', '$2y$10$9RybD5D/U.Vz5Xbg1.kO.Ouj5qUpLs2RQ/kr5nOP61/IbGvUjcK5O', 2, 1, 1654968285),
(7, 'coba', 'coba@gmail.com', 'default.jpg', '$2y$10$sQdZL3fsMYonbAbMZL/51e6mUn5cilRu6ugyV16ZGg8IvGJJgnkKi', 2, 1, 1654968362),
(8, 'tesdaftar', 'tesdaftar@gmail.com', 'default.jpg', '$2y$10$fd6e1.81Iq.P4u27rS.AN.gqu5qoCUGyj/Hh35BRQSzx1yjy4xD0S', 2, 1, 1654994248),
(9, 'wakwaw', 'wakwaw@gmail.com', 'default.jpg', '$2y$10$e.aoILqErXqUjKk/DKoxKe1aaDE1pAIDuvEeXoPWWJX8lsczmIdyC', 2, 1, 1654995904),
(10, 'fahrinew', 'fahrinew@gmail.com', 'default.jpg', '$2y$10$MMccxcZxG.lLV9dY2iJtF.JwzVpFZuTsBsg9.BqoKhNcQTbKINgMG', 2, 1, 1654996475),
(11, 'fiki', 'fiki@gmail.com', 'default.jpg', '$2y$10$uSI.rIwZ1A3tyP4jNuujQulS/r0PXJmeyCoZFpJKUVAFKtCLY2YYu', 2, 1, 1654996599),
(13, 'Rizki Agung Sentosa', 'mrrizkiagung@gmail.com', 'default.jpg', '$2y$10$VJ3VfxdvdeLDWQG88MRb9efH7JlKyQfOQex78TfvxCRzpSkKQvfcS', 1, 1, 1655706770);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Indexes for table `booking_detail`
--
ALTER TABLE `booking_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_detail`
--
ALTER TABLE `booking_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `temp`
--
ALTER TABLE `temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
