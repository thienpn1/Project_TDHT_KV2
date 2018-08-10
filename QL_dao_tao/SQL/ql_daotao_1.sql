-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 11, 2018 at 09:46 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ql_daotao`
--

-- --------------------------------------------------------

--
-- Table structure for table `dao_tao`
--

DROP TABLE IF EXISTS `dao_tao`;
CREATE TABLE IF NOT EXISTS `dao_tao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ke_hoach` varchar(500) DEFAULT NULL,
  `noi_dung` varchar(4000) NOT NULL,
  `doi_tuong` varchar(500) DEFAULT NULL,
  `so_luong` int(11) DEFAULT NULL,
  `giang_vien` varchar(50) DEFAULT NULL,
  `thoi_luong` int(11) DEFAULT NULL,
  `start_time` varchar(500) DEFAULT NULL,
  `end_time` varchar(500) DEFAULT NULL,
  `dia_diem` varchar(50) DEFAULT NULL,
  `hinh_thuc` varchar(50) DEFAULT NULL,
  `loai_danh_gia` varchar(50) DEFAULT NULL,
  `tien_do` varchar(50) DEFAULT NULL,
  `ket_qua` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `diem_danh_dao_tao`
--

DROP TABLE IF EXISTS `diem_danh_dao_tao`;
CREATE TABLE IF NOT EXISTS `diem_danh_dao_tao` (
  `id_from_dao_tao` int(11) DEFAULT NULL,
  `username` varchar(500) DEFAULT NULL,
  `role` varchar(500) DEFAULT NULL,
  `result` varchar(500) DEFAULT 'OK',
  `duration` int(11) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma_nv` int(11) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `chuc_danh` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `so_dt` int(11) DEFAULT NULL,
  `don_vi` varchar(10) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `islock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
