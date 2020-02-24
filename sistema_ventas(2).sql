-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-02-2020 a las 09:41:12
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sistema_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `dni` int(10) NOT NULL,
  `edad` int(3) NOT NULL,
  `tarjeta` text NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`nombre`, `apellido`, `dni`, `edad`, `tarjeta`, `fecha_nacimiento`) VALUES
('Juan', 'Perez', 12, 20, 'Mastercard', '2020-01-16'),
('Ramon', 'Ortiz', 13, 25, 'Visa', '2020-02-22'),
('Romina', 'Chavez', 14, 30, 'Mastercard', '2020-02-12'),
('Mariela', 'Gimenez', 15, 20, 'Visa', '2020-02-20'),
('Mariano', 'Colombo', 16, 24, 'Visa', '2020-02-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` double NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_detalle` (`id_detalle`),
  KEY `id_venta` (`id_venta`),
  KEY `id_venta_2` (`id_venta`),
  KEY `id_venta_3` (`id_venta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_detalle`, `id_venta`, `id_producto`, `cantidad`, `precio_venta`) VALUES
(65, 30, 4, 1, 30),
(66, 30, 2, 1, 20),
(67, 30, 7, 1, 50),
(68, 30, 6, 1, 25),
(69, 30, 5, 2, 50),
(70, 31, 2, 2, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `dni` int(11) NOT NULL,
  `edad` int(3) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `legajo` int(11) NOT NULL,
  PRIMARY KEY (`legajo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`nombre`, `apellido`, `dni`, `edad`, `fecha_nacimiento`, `legajo`) VALUES
('Juan', 'Perez', 123456, 30, '1990-10-21', 11),
('Jorge', 'Ortiz', 16565898, 35, '2020-02-07', 12),
('Ortega', 'Ramos', 25698789, 23, '2020-02-22', 13),
('Ernesto', 'Alvarez', 16, 25, '2020-02-23', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `nombre` text NOT NULL,
  `marca` text NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `precio_unitario` double NOT NULL,
  `proveedor` text NOT NULL,
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`nombre`, `marca`, `fecha_vencimiento`, `precio_unitario`, `proveedor`, `id_producto`) VALUES
('Shampoo', 'Loreal', '2025-03-20', 15, 'Loreal', 1),
('Shampoo', 'Rexona', '2025-02-14', 20, 'Rexona', 2),
('Shampoo', 'Tio Nacho', '2020-02-07', 115, 'Tio Nacho', 3),
('Fideos', 'Rivoli', '2025-02-04', 30, 'Rivoli', 4),
('Fideos', 'Mattarazo', '2025-02-03', 25, 'Mattarazo', 5),
('Detergente', 'Magistral', '2030-05-07', 25, 'Magisral', 6),
('Detergente', 'Cif', '2028-04-15', 50, 'Cif', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `dni_cliente` int(11) NOT NULL,
  `legajo_empleado` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `total_venta` double DEFAULT '0',
  PRIMARY KEY (`id_venta`),
  KEY `id_venta` (`id_venta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `dni_cliente`, `legajo_empleado`, `fecha_venta`, `total_venta`) VALUES
(30, 14, 12, '2020-02-24', 175),
(31, 14, 12, '2020-02-24', 40);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
