-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2021 at 10:35 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cliente`
--

CREATE TABLE `tbl_cliente` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDO` varchar(50) DEFAULT NULL,
  `CORREO` varchar(100) DEFAULT NULL,
  `TELEFONO` int(50) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cliente`
--

INSERT INTO `tbl_cliente` (`ID_CLIENTE`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `DIRECCION`) VALUES
(3, 'YANORI', 'FLORES', 'flores@gmail.com', 97788268, 'EL SIFON, AJUTERIQUE'),
(4, 'LOHANY', 'MARQUEZ', 'marquez@gmail.com', 95663214, 'COMAYAGUA, COMAYAGUA'),
(5, 'SHARON', 'MARTINEZ', 'martinez@gmail.com', 99210547, 'LAMAMI, COMAYAGUA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `ID_MENU` int(11) NOT NULL,
  `CAMARONES=180` int(100) NOT NULL,
  `AMBURGUESAS=45` int(100) NOT NULL,
  `PIZZA=189` int(100) NOT NULL,
  `ARROZ CHINO=150` int(100) NOT NULL,
  `SOPAS=60` int(100) NOT NULL,
  `LIMONADA=15` int(100) NOT NULL,
  `JUGO_MARACUYA=15` int(100) NOT NULL,
  `CAFE=12` int(100) NOT NULL,
  `COCA-COLA=20` int(100) NOT NULL,
  `PASTEL DE VAINILLA=50` int(100) NOT NULL,
  `PASTEL DE CHOCOLATE=50` int(100) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`ID_MENU`, `CAMARONES=180`, `AMBURGUESAS=45`, `PIZZA=189`, `ARROZ CHINO=150`, `SOPAS=60`, `LIMONADA=15`, `JUGO_MARACUYA=15`, `CAFE=12`, `COCA-COLA=20`, `PASTEL DE VAINILLA=50`, `PASTEL DE CHOCOLATE=50`, `ID_CLIENTE`) VALUES
(3, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 3),
(4, 0, 0, 1, 2, 0, 0, 2, 0, 0, 1, 0, 5),
(5, 0, 0, 0, 2, 2, 0, 0, 2, 0, 0, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pedidos`
--

CREATE TABLE `tbl_pedidos` (
  `ID_PEDIDO` int(11) NOT NULL,
  `PLATO DE ENTRADA` varchar(100) NOT NULL,
  `PLATA FUERTE` varchar(100) NOT NULL,
  `BEBIDAS` varchar(100) NOT NULL,
  `POSTRES` varchar(100) NOT NULL,
  `TOTAL =` int(100) DEFAULT NULL,
  `ID_CLIENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pedidos`
--

INSERT INTO `tbl_pedidos` (`ID_PEDIDO`, `PLATO DE ENTRADA`, `PLATA FUERTE`, `BEBIDAS`, `POSTRES`, `TOTAL =`, `ID_CLIENTE`) VALUES
(3, '1 PLATO DE CAMARONES', '1 AMBURGUESA', '1 COCA COLA', '1 PASTEL DE VAINILLA', 540, 3),
(4, '1 PLATO DE ARROZ CHINO', '1 PIZZA', '1 JUGO DE MARACUYA', '1 PASTEL DE VAINILLA', 514, 5),
(5, '2 PLATOS DE ARROX CHINO', '2 SOPAS', '2 CAFES', '1 PASTEL DE CHOCOLATE', 500, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`ID_MENU`),
  ADD KEY `FK_CLIENTE_MENU` (`ID_CLIENTE`);

--
-- Indexes for table `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD KEY `FK_CLIENTE_PEDIDOS` (`ID_CLIENTE`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `ID_MENU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  MODIFY `ID_PEDIDO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD CONSTRAINT `FK_CLIENTE_MENU` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `tbl_cliente` (`ID_CLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  ADD CONSTRAINT `FK_CLIENTE_PEDIDOS` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `tbl_cliente` (`ID_CLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
