-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 19, 2018 at 08:26 AM
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
  `nguoi_tao` varchar(255) NOT NULL,
  `ke_hoach` varchar(500) DEFAULT NULL,
  `noi_dung` varchar(4000) NOT NULL,
  `doi_tuong` varchar(500) DEFAULT NULL,
  `so_luong` varchar(255) DEFAULT NULL,
  `giang_vien` varchar(50) DEFAULT NULL,
  `thoi_luong` varchar(255) DEFAULT NULL,
  `start_time` varchar(500) DEFAULT NULL,
  `end_time` varchar(500) DEFAULT NULL,
  `dia_diem` varchar(50) DEFAULT NULL,
  `hinh_thuc` varchar(50) DEFAULT NULL,
  `loai_danh_gia` varchar(50) DEFAULT NULL,
  `tien_do` varchar(50) DEFAULT NULL,
  `ket_qua` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dao_tao`
--

INSERT INTO `dao_tao` (`id`, `nguoi_tao`, `ke_hoach`, `noi_dung`, `doi_tuong`, `so_luong`, `giang_vien`, `thoi_luong`, `start_time`, `end_time`, `dia_diem`, `hinh_thuc`, `loai_danh_gia`, `tien_do`, `ket_qua`) VALUES
(13, 'thiennlh1', 'đào tạo Ipv6', 'đào tạo Ipv6 cho PTDHT', 'TT.HK, TT.NTH, P.TDHT', '', 'thiennlh1', '', '13/07/2018 11:45:00', '23/07/2018 11:45:00', '', '', '', 'kế hoạch', NULL),
(10, 'thiennlh1', 'đào tạo BRAS', 'đào tạo BRAS cho PTDHT', 'PTDHT    ', '20', 'nguyentv3', '-2', '16/07/2018 12:00:00', '16/07/2018 14:00:00', '27B NTH', 'không đạt', NULL, 'kế hoạch', NULL),
(14, 'thiennlh1', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(15, 'thiennlh1', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(16, 'thiennlh1', 'AAAAA', 'AAAAA', '19/07/2018 14:25:00', '21/07/2018 14:25:00', ' AAAAA', '22', 'AAAAAAAAAAAAAAAAAAAA', '22', '27B NTH', 'tập trung', 'không đánh giá', NULL, NULL);

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

--
-- Dumping data for table `diem_danh_dao_tao`
--

INSERT INTO `diem_danh_dao_tao` (`id_from_dao_tao`, `username`, `role`, `result`, `duration`, `comment`) VALUES
(10, 'binhpn', NULL, 'đạt', NULL, NULL),
(10, 'nguyentv3', NULL, 'đạt', NULL, NULL),
(10, 'thiennlh1', 'hoc vien', 'đạt', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma_nv` varchar(255) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `chuc_danh` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `sdt` varchar(255) DEFAULT NULL,
  `phong` varchar(10) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `islock` varchar(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `ma_nv`, `username`, `password`, `fullname`, `chuc_danh`, `email`, `sdt`, `phong`, `picture`, `islock`) VALUES
(1, '197823', 'thiennlh1', 'cWF5QDE M Ag', 'Nguyễn lý hoàng thiện', 'Nhân viên', 'thiennlh1@viettel.com.vn', '978888540', 'TDHT', NULL, '0'),
(2, '1', 'admin', 'cWF5QDE M Ag', 'admin', 'Nhân viên', 'admin@viettel.com.vn', '123456789', 'TDHT', NULL, '0'),
(6, '1111111', 'nguyentv3', 'cWF5QDE M Ag', 'Tran vu nguyen', 'nhân viên', 'nguyentv3@viettel.com.vn', '1212312312312', 'TDHT', NULL, '0'),
(7, '23456', 'hieucd', NULL, 'AAAAAA', NULL, NULL, NULL, NULL, NULL, '0');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
