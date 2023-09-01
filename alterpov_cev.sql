-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 27, 2021 at 01:50 AM
-- Server version: 10.3.31-MariaDB-log-cll-lve
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alterpov_cev`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `id_package` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `id_client` int(11) NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `jenis` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `id_package`, `tanggal`, `id_client`, `status`, `jenis`) VALUES
(1, 3, '2021-07-23', 13, 'Pending', 1),
(2, 3, '2021-07-24', 7, 'Pending', 1),
(3, 4, '2021-09-04', 10, 'Pending', 2),
(7, 4, '2021-09-12', 7, 'Done', 1),
(8, 5, '2021-11-30', 13, 'Canceled', 1),
(9, 1, '2021-12-18', 17, 'Canceled', 1),
(10, 5, '2021-11-29', 17, 'Confirmed', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookmark`
--

INSERT INTO `bookmark` (`id`, `id_client`, `id_vendor`, `status`) VALUES
(1, 7, 10, 1),
(2, 7, 11, 1),
(5, 7, 9, 2),
(4, 7, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `keterangan` varchar(255) DEFAULT '-',
  `pp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `username`, `nama`, `alamat`, `email`, `no_hp`, `keterangan`, `pp`) VALUES
(1, 'tina', 'Tina Haruna', 'Nangka', 'tina@mail.com', '089771767287', '-', 'photos/6t9gdn56ret2eh47hc1a.png'),
(2, 'fuji', 'Fuji Kaws', 'Buduk', 'fuji@mail.com', '081338150725', '-', NULL),
(3, 'bobby', 'Bobby Kurnianto', 'Kesiman', 'bobby@mail.com', '085223678542', '-', 'photos/rghvmwvyhu7u3re7gxm5.png');

-- --------------------------------------------------------

--
-- Table structure for table `eo`
--

CREATE TABLE `eo` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT '-',
  `pp` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `type` enum('EO','Talent') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eo`
--

INSERT INTO `eo` (`id`, `username`, `nama`, `alamat`, `email`, `no_hp`, `jenis`, `keterangan`, `pp`, `cover`, `type`) VALUES
(1, 'shiga', 'Shiga Wedding Planner', 'Pecatu', 'shiga@gmail.com', '089227181771', 'Wedding', '10 years experience in event especially wedding', 'photos/eo1.png', 'photos/event.jpg', 'EO'),
(2, 'morris', 'Morris Event Organizer', 'Legian', 'morris@gmail.com', '087886545387', 'Wedding', 'Specialize in wedding', 'photos/eo2.png', 'photos/event2.jpg', 'EO'),
(3, 'sheira', 'Sheira Event Planner', 'Seminyak', 'sheira@gmail.com', '081338150725', 'Birthday', '-', 'photos/eo3.png', 'photos/event3.jpg', NULL),
(5, 'alyssa', 'Alyssa Event Planner', 'Kuta', 'alyssa@mail.com', '081778261556', 'Office Event', '-', NULL, 'photos/event.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `nama_package` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `status` enum('active','nonactive') COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `venue` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `id_vendor`, `nama_package`, `deskripsi`, `harga`, `status`, `photo`, `venue`, `longitude`, `latitude`) VALUES
(1, 10, 'New Normal Wedding', 'Konsep pernikahan minimalis dan modern era pandemi dan new normal', 15000000, 'active', 'photos/event5.jpg', 'Balai Bhumiku', NULL, NULL),
(2, 11, 'Bali Lite Wedding', 'Wedding 100 pax', 20000000, 'active', 'photos/wtkwvk63hfrj21b946e5.png', 'Alila', NULL, NULL),
(3, 10, 'Pandemic Wedding', 'Mini wedding with 300 pax guests', 40000000, 'active', 'photos/e0g3gayzey98jy53jdw0.png', 'Ayana Bali', NULL, NULL),
(4, 9, 'Wedding Music Package', 'Melantukan alunan musik classic untuk mengiringi pernikahan Anda dengan durasi 4-5 jam.', 8000000, 'active', 'photos/wbandup.jpg', 'TBA', NULL, NULL),
(5, 16, 'Traditional Prewedding', 'Color ipsum', 8000000, 'active', 'photos/zmkg0qbg25xfqfx8iz6p.png', 'Melasti', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `konten` text NOT NULL,
  `tanggal` date NOT NULL,
  `label` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`id`, `id_user`, `photo`, `judul`, `konten`, `tanggal`, `label`) VALUES
(1, 10, 'photos/reri4cmm7m2w63xjrnkn.png', 'Bali Classic Wedding', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ', '2021-06-25', 'Prestige'),
(2, 9, 'photos/bvt-live-wedding-band.jpg', 'Wedding Classic Music', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', '2021-08-19', 'Wedding, Classic');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL,
  `rate` double NOT NULL,
  `review` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `id_vendor`, `id_client`, `id_booking`, `rate`, `review`, `foto`, `tanggal`) VALUES
(2, 10, 13, 1, 4.5, 'Sangat memuaskan!', 'photos/r1bwcmqf0mx934ue7xnv.png', '2021-08-25'),
(3, 9, 7, 7, 4, 'Highly recommended!', 'photos/r1bwcmqf0mx934ue7xnv.png', '2021-09-25'),
(4, 9, 10, 3, 5, 'Sangat bagus dan cocok untuk pernikahan', 'photos/rrerq2g4dqbvmrjqg90w.png', '2021-09-03'),
(6, 16, 17, 10, 5, 'A good result!', 'photos/4149z8j7g93ahzd4xk51.png', '2021-11-26');

-- --------------------------------------------------------

--
-- Table structure for table `talent`
--

CREATE TABLE `talent` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `pp` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `talent`
--

INSERT INTO `talent` (`id`, `username`, `nama`, `alamat`, `email`, `no_hp`, `jenis`, `keterangan`, `pp`, `cover`) VALUES
(1, 'plusminus', 'PlusMinus Band', 'Buduk', 'peterpan@mail.com', '089771872617', 'Music', 'Pop Rock Band', 'photos/talent.jpg', 'photos/event4.jpg'),
(2, 'rcphoto', 'RC Photography', 'Dalung', 'rcp@mail.com', '081256145341', 'Documentation', 'Professional Wedding Photographer', 'photos/5x14dc3p9vvayen4d7b6.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `tipe` tinyint(4) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `tipe`, `token`) VALUES
(7, 'tina', 'tina123', 2, ''),
(9, 'plusminus', 'plusminus123', 3, ''),
(10, 'shiga', 'shiga123', 4, 'cHQXUU9yRgaSAd2cccgkzS:APA91bFiM4YXLf8i3CRFan79blLzbd-6hpOCZuFlJMsUwNrVOy9THmu_Vrv6JZZCD0KeIGfkgiCedORDbQNYOZLlGqDcakq48YkyQ02uKmauryjDb5Nz_z6eg8wLSbpz_jtihh2I5wZV'),
(11, 'morris', 'morris123', 4, ''),
(12, 'sheira', 'sheira123', 4, ''),
(13, 'fuji', 'fuji12345', 2, 'fksqbVzcSLi8s7GEV63MZt:APA91bECwVD-0Nit8mclVfB42b0MI8eO1qVtFm55Pvth-uryig5_hiFcjNOU9S3kOiQqTdz8pJsMdcs9U4lMLgZmc-0JyKl-HeyVntV08gOY_7Lh7zPdMOZ5P8Rlx_VdNKoQaLIIsFmZ'),
(15, 'alyssa', 'alyssa123', 4, 'cHQXUU9yRgaSAd2cccgkzS:APA91bFiM4YXLf8i3CRFan79blLzbd-6hpOCZuFlJMsUwNrVOy9THmu_Vrv6JZZCD0KeIGfkgiCedORDbQNYOZLlGqDcakq48YkyQ02uKmauryjDb5Nz_z6eg8wLSbpz_jtihh2I5wZV'),
(16, 'rcphoto', 'rcphoto', 3, 'cHQXUU9yRgaSAd2cccgkzS:APA91bFiM4YXLf8i3CRFan79blLzbd-6hpOCZuFlJMsUwNrVOy9THmu_Vrv6JZZCD0KeIGfkgiCedORDbQNYOZLlGqDcakq48YkyQ02uKmauryjDb5Nz_z6eg8wLSbpz_jtihh2I5wZV'),
(17, 'bobby', 'bobby123', 2, 'cv6OvNMMQbO8eTjhII7KNZ:APA91bFDcml52hsCzfnn4B-jk0_hnCZWPN34jLX0-P8J6HEAq7Dmj6dTfPhzTMY6uCc2oY1LvIDu2hOPrKmfdC7Hv7YlwfwGUgE5ZMnqlcqbOOR7hpOELdYYeRq33GIwMPZG2kO00Di5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eo`
--
ALTER TABLE `eo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `talent`
--
ALTER TABLE `talent`
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
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bookmark`
--
ALTER TABLE `bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `eo`
--
ALTER TABLE `eo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `talent`
--
ALTER TABLE `talent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
