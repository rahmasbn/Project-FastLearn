-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2019 at 05:37 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fastlearn`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `id_user` int(2) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `kd_matkul` char(3) NOT NULL,
  `nama_matkul` varchar(30) NOT NULL,
  `biaya` int(10) NOT NULL,
  `prasyarat` varchar(200) NOT NULL,
  `kd_fakultas` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `daftar`
--

CREATE TABLE `daftar` (
  `kd_matkul` char(3) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jml_matkul` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `kd_fakultas` char(5) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id_fb` int(4) NOT NULL,
  `feedback` varchar(500) NOT NULL,
  `tgl_feedback` date NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_user` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id_siswa` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `id_query` int(7) NOT NULL,
  `tgl_post` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `query`
--

CREATE TABLE `query` (
  `id_query` int(7) NOT NULL,
  `pertanyaan` varchar(300) NOT NULL,
  `tgl_pertanyaan` date NOT NULL,
  `tgl_respon` date NOT NULL,
  `kd_fakultas` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id_siswa` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` int(15) NOT NULL,
  `id_center` char(4) NOT NULL,
  `kd_fakultas` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `study_center`
--

CREATE TABLE `study_center` (
  `id_center` varchar(2) NOT NULL,
  `nama` varchar(10) NOT NULL,
  `lokasi` char(100) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`kd_matkul`),
  ADD KEY `kd_fakultas` (`kd_fakultas`);

--
-- Indexes for table `daftar`
--
ALTER TABLE `daftar`
  ADD KEY `kd_matkul` (`kd_matkul`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`kd_fakultas`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_fb`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_siswa_2` (`id_siswa`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD KEY `id_query` (`id_query`),
  ADD KEY `id_query_2` (`id_query`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `query`
--
ALTER TABLE `query`
  ADD PRIMARY KEY (`id_query`),
  ADD KEY `kd_fakultas` (`kd_fakultas`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_center` (`id_center`),
  ADD KEY `kd_fakultas` (`kd_fakultas`);

--
-- Indexes for table `study_center`
--
ALTER TABLE `study_center`
  ADD PRIMARY KEY (`id_center`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id_user` int(2) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`kd_fakultas`) REFERENCES `faculty` (`kd_fakultas`);

--
-- Constraints for table `daftar`
--
ALTER TABLE `daftar`
  ADD CONSTRAINT `daftar_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `student` (`id_siswa`),
  ADD CONSTRAINT `daftar_ibfk_2` FOREIGN KEY (`kd_matkul`) REFERENCES `course` (`kd_matkul`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `student` (`id_siswa`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `administrator` (`id_user`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `student` (`id_siswa`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`id_query`) REFERENCES `query` (`id_query`);

--
-- Constraints for table `query`
--
ALTER TABLE `query`
  ADD CONSTRAINT `query_ibfk_1` FOREIGN KEY (`kd_fakultas`) REFERENCES `faculty` (`kd_fakultas`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`kd_fakultas`) REFERENCES `faculty` (`kd_fakultas`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`id_center`) REFERENCES `study_center` (`id_center`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
