-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2020 m. Grd 28 d. 08:42
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `valiutos`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `valiutos`
--

CREATE TABLE `valiutos` (
  `ID` int(10) NOT NULL,
  `valiutos_pav` varchar(64) COLLATE utf8_lithuanian_ci NOT NULL,
  `valiuto_kodas` char(3) COLLATE utf8_lithuanian_ci NOT NULL,
  `kursas_euro_atzvilgiu` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `valiutos`
--

INSERT INTO `valiutos` (`ID`, `valiutos_pav`, `valiuto_kodas`, `kursas_euro_atzvilgiu`) VALUES
(1, 'Australijos doleris', 'AUD', '0.62000'),
(2, 'Šveicarijos frankas', 'CHF', '0.93000'),
(3, 'Danijos krona', 'DKK', '0.13000'),
(4, 'Svaras sterlingų', 'GBP', '1.11000'),
(5, 'Indijos rupija', 'INR', '0.01100'),
(6, 'Euras', 'EUR', '1.00000');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `valstybes`
--

CREATE TABLE `valstybes` (
  `ID` int(100) NOT NULL,
  `valstybes_pav` varchar(64) COLLATE utf8_lithuanian_ci NOT NULL,
  `valstybes_kodas` char(2) COLLATE utf8_lithuanian_ci NOT NULL,
  `valst_valiutos_kodas` char(3) COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `valstybes`
--

INSERT INTO `valstybes` (`ID`, `valstybes_pav`, `valstybes_kodas`, `valst_valiutos_kodas`) VALUES
(1, 'Kiribatis', 'KI', 'AUD'),
(2, 'Nauru', 'NR', 'AUD'),
(3, 'Šveicarija', 'CH', 'CHF'),
(4, 'Farerų salos', 'FO', 'CHF'),
(5, 'Didžioji Britanija', 'GB', 'GBP'),
(6, 'Indija', 'IN', 'INR'),
(7, 'Australija', 'AU', 'AUD'),
(8, 'Tuvalu', 'TV', 'AUD'),
(9, 'Lichtenšteinas', 'LI', 'CHF'),
(10, 'Danija', 'DK', 'DKK'),
(11, 'Grenlandija', 'GL', 'DKK'),
(12, 'Butanas', 'BT', 'INR'),
(13, 'Airija', 'IE', 'EUR'),
(14, 'Austrija', 'AT', 'EUR'),
(15, 'Belgija', 'BE', 'EUR'),
(16, 'Estija', 'EE', 'EUR'),
(17, 'Graikija', 'GR', 'EUR'),
(18, 'Ispanija', 'ES', 'EUR'),
(19, 'Italija', 'IT', 'EUR'),
(20, 'Kipras', 'CY', 'EUR'),
(21, 'Liuksemburgas', 'LU', 'EUR'),
(22, 'Malta', 'MT', 'EUR'),
(23, 'Nyderlandai', 'NL', 'EUR'),
(24, 'Portugalija', 'PT', 'EUR'),
(25, 'Prancūzija', 'FR', 'EUR'),
(26, 'San Marinas', 'SM', 'EUR'),
(27, 'San Martenas', 'SX', 'EUR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `valiutos`
--
ALTER TABLE `valiutos`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `valstybes`
--
ALTER TABLE `valstybes`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `valiutos`
--
ALTER TABLE `valiutos`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `valstybes`
--
ALTER TABLE `valstybes`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
