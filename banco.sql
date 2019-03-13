-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-03-2019 a las 00:27:07
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `banco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Atencion al Cliente', 'Gestion de reclamos y consultorias.'),
(2, 'Remesas', 'Gestion de envios y recibos de dinero'),
(3, 'Pagos', 'Pagos de servicios'),
(4, 'Creditos', 'Creditos personales entre otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `dui` varchar(10) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `dui`, `nombre`) VALUES
(1, '05854680-6', NULL),
(2, '05808732-3', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo`
--

CREATE TABLE `codigo` (
  `id` int(11) NOT NULL,
  `codigo` varchar(15) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `codigo`
--

INSERT INTO `codigo` (`id`, `codigo`, `cliente_id`) VALUES
(1, 'AT001', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo_servicio`
--

CREATE TABLE `codigo_servicio` (
  `id` int(11) NOT NULL,
  `codigo_id` int(11) NOT NULL,
  `tipo_servicio_id` int(11) DEFAULT NULL,
  `estado` enum('En Espera','En Ventanilla','Finalizado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `codigo_servicio`
--

INSERT INTO `codigo_servicio` (`id`, `codigo_id`, `tipo_servicio_id`, `estado`) VALUES
(1, 1, 1, 'En Espera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `usuario` varchar(15) DEFAULT NULL,
  `clave` varchar(200) DEFAULT NULL,
  `genero` enum('Masculino','Femenino') DEFAULT NULL,
  `dui` varchar(10) DEFAULT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `nombre`, `apellido`, `telefono`, `usuario`, `clave`, `genero`, `dui`, `rol_id`) VALUES
(1, 'Admin', 'Admin', '', 'admin', '$2a$10$ekSAYAS4.Y/5tsKXeAva6ec3c3J9QuF70OjPst5bqHMalKC1E7U6S', NULL, NULL, 1),
(2, 'N2', 'A2', '2222-2222', 'U2', '$2a$10$ekSAYAS4.Y/5tsKXeAva6ec3c3J9QuF70OjPst5bqHMalKC1E7U6S', 'Masculino', '01234567-8', 2),
(3, 'N3', 'A3', '2222-2222', 'U3', '$2a$10$ekSAYAS4.Y/5tsKXeAva6ec3c3J9QuF70OjPst5bqHMalKC1E7U6S', 'Masculino', '01234567-8', 2),
(4, 'Mauricio', 'Cruz', '7475-2009', '@MCruz', '$2a$10$RfyksUyCQg1M4FzlqKtd.e.mTpQH64c7efKK8Jzd6lfUmGZVMviu6', 'Masculino', '05854680-6', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `rol` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE `tipo_servicio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `area_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_servicio`
--

INSERT INTO `tipo_servicio` (`id`, `nombre`, `area_id`) VALUES
(1, 'Ayuda y Reclamos', 1),
(2, 'Envio de dinero', 2),
(3, 'Pagos CAES', 3),
(4, 'Recepcion de Dinero', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventanilla`
--

CREATE TABLE `ventanilla` (
  `id` int(11) NOT NULL,
  `numeroVentanilla` int(11) DEFAULT NULL,
  `area_id` int(11) NOT NULL,
  `Empleado_id` int(11) DEFAULT NULL,
  `estado` enum('Activa','Inactiva') NOT NULL DEFAULT 'Inactiva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ventanilla`
--

INSERT INTO `ventanilla` (`id`, `numeroVentanilla`, `area_id`, `Empleado_id`, `estado`) VALUES
(2, 1, 1, NULL, 'Inactiva'),
(3, 2, 1, NULL, 'Inactiva'),
(4, 1, 2, NULL, 'Inactiva'),
(5, 2, 2, NULL, 'Inactiva'),
(6, 3, 1, NULL, 'Inactiva'),
(7, 1, 3, NULL, 'Inactiva'),
(8, 2, 3, NULL, 'Inactiva'),
(9, 3, 3, NULL, 'Inactiva');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `codigo`
--
ALTER TABLE `codigo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_codigo_cliente1_idx` (`cliente_id`);

--
-- Indices de la tabla `codigo_servicio`
--
ALTER TABLE `codigo_servicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_codigo_has_servicio_codigo1_idx` (`codigo_id`),
  ADD KEY `fk_codigo_servicio_tipo_servicio1_idx` (`tipo_servicio_id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rol_empleado` (`rol_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rol` (`rol`);

--
-- Indices de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tipo_servicio_area1_idx` (`area_id`);

--
-- Indices de la tabla `ventanilla`
--
ALTER TABLE `ventanilla`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ventanilla_area1_idx` (`area_id`),
  ADD KEY `fk_ventanilla_Empleado1_idx` (`Empleado_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `codigo`
--
ALTER TABLE `codigo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `codigo_servicio`
--
ALTER TABLE `codigo_servicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventanilla`
--
ALTER TABLE `ventanilla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `codigo`
--
ALTER TABLE `codigo`
  ADD CONSTRAINT `fk_codigo_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `codigo_servicio`
--
ALTER TABLE `codigo_servicio`
  ADD CONSTRAINT `fk_codigo_has_servicio_codigo1` FOREIGN KEY (`codigo_id`) REFERENCES `codigo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_codigo_servicio_tipo_servicio1` FOREIGN KEY (`tipo_servicio_id`) REFERENCES `tipo_servicio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_rol_empleado` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`);

--
-- Filtros para la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD CONSTRAINT `fk_tipo_servicio_area1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventanilla`
--
ALTER TABLE `ventanilla`
  ADD CONSTRAINT `fk_ventanilla_Empleado1` FOREIGN KEY (`Empleado_id`) REFERENCES `empleado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventanilla_area1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON UPDATE NO ACTION;

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `limpieza` ON SCHEDULE EVERY 1 DAY STARTS '2019-01-05 14:00:00' ON COMPLETION PRESERVE ENABLE COMMENT 'hoy si???' DO BEGIN
DELETE FROM codigo_servicio;
ALTER TABLE codigo_servicio AUTO_INCREMENT=0;
DELETE FROM codigo;
ALTER TABLE codigo AUTO_INCREMENT=0;
DELETE FROM cliente;
ALTER TABLE cliente AUTO_INCREMENT=0;
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
