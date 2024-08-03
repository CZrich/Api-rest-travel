-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-08-2024 a las 19:56:12
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_travel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dato_usuario`
--

CREATE TABLE `dato_usuario` (
  `usuNom` varchar(45) NOT NULL,
  `usuApePa` varchar(45) NOT NULL,
  `usuApeMa` varchar(45) NOT NULL,
  `usuDir` varchar(45) NOT NULL,
  `usuFecNac` date NOT NULL,
  `usuDNI` int(11) NOT NULL,
  `usuNac` varchar(45) NOT NULL,
  `usuCel` int(11) NOT NULL,
  `usuEstReg` varchar(1) NOT NULL DEFAULT 'A',
  `usuCod` int(11) NOT NULL,
  `datUsuCod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dato_usuario`
--

INSERT INTO `dato_usuario` (`usuNom`, `usuApePa`, `usuApeMa`, `usuDir`, `usuFecNac`, `usuDNI`, `usuNac`, `usuCel`, `usuEstReg`, `usuCod`, `datUsuCod`) VALUES
('John', 'Doe', 'Smith', '123 Main St', '1989-12-31', 12345678, 'Country', 123456789, 'A', 1, 1),
('Richard', 'Parterno', 'Materno', 'sin direccion', '1999-08-07', 12345678, 'PE', 147852369, 'A', 2, 2),
('Alberto', 'Parterno', 'Materno', 'sin direccion', '1999-08-07', 12345678, 'PE', 147852369, 'A', 3, 3),
('jose', 'jose', 'jsoe', 'asdasd', '2000-08-01', 70215789, 'PE', 113456789, 'A', 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `empCod` int(11) NOT NULL,
  `empSue` double NOT NULL,
  `usuCod` int(11) NOT NULL,
  `empEstReg` varchar(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetes`
--

CREATE TABLE `paquetes` (
  `paqCod` int(11) NOT NULL,
  `paqCos` double NOT NULL,
  `paqEstReg` varchar(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paquetes`
--

INSERT INTO `paquetes` (`paqCod`, `paqCos`, `paqEstReg`) VALUES
(1, 9000, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetes_servicios`
--

CREATE TABLE `paquetes_servicios` (
  `serCod` int(11) NOT NULL,
  `paqCod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paquetes_servicios`
--

INSERT INTO `paquetes_servicios` (`serCod`, `paqCod`) VALUES
(19, 1),
(20, 1),
(18, 1);

--
-- Disparadores `paquetes_servicios`
--
DELIMITER $$
CREATE TRIGGER `after_insert_paquetes_servicios` AFTER INSERT ON `paquetes_servicios` FOR EACH ROW BEGIN
    -- Variable para almacenar el nuevo costo del paquete
    DECLARE nuevo_costo DOUBLE DEFAULT 0;

    -- Solo calcular el nuevo costo si el estado del servicio es "A"
    IF (SELECT serEstReg FROM servicio WHERE serCod = NEW.serCod) = 'A' THEN
        -- Calcular la suma del costo de todos los servicios relacionados al paquete
        SELECT SUM(s.serCos) INTO nuevo_costo
        FROM servicio s
        JOIN paquetes_servicios ps ON s.serCod = ps.serCod
        WHERE ps.paqCod = NEW.paqCod;
        
        -- Actualizar el costo del paquete
        UPDATE paquetes
        SET paqCos = nuevo_costo
        WHERE paqCod = NEW.paqCod;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `rolCod` int(11) NOT NULL,
  `rolNom` varchar(45) NOT NULL,
  `rolEstReg` varchar(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rolCod`, `rolNom`, `rolEstReg`) VALUES
(1, 'cliente', 'A'),
(2, 'admin', 'A'),
(3, 'empleado', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `serCod` int(11) NOT NULL,
  `serImg` varchar(255) DEFAULT NULL,
  `serDes` varchar(255) NOT NULL,
  `serNom` varchar(45) NOT NULL,
  `serFec` date NOT NULL,
  `serCos` double NOT NULL,
  `serEstReg` varchar(1) NOT NULL DEFAULT 'A',
  `serDest` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`serCod`, `serImg`, `serDes`, `serNom`, `serFec`, `serCos`, `serEstReg`, `serDest`) VALUES
(15, 'd007075a-c068-47d3-96b3-1e2fe887d0cd.jpg', 'una suit en Maiami', 'Hotel suit en Maiami', '2024-08-27', 1000, 'A', 'Maiami'),
(16, 'd11a63af-9709-4d27-b2ec-654531b2b74d.jpg', 'Este mágico lugar se encuentra a unos 100 kilómetros al sur de Cusco y está ubicada en la Cordillera del Vilcanota a una altitud de 5.200 msnm entre los distritos de Pitumarca y Cusipata.', 'La Montaña de los 7 colores', '2024-08-27', 2000, 'A', 'Cusco'),
(17, 'b35f118a-7c3b-45bf-a768-521eba95b880.jpg', 'un holet en maiami', 'Holet', '2024-07-21', 500, 'I', 'Maima'),
(18, 'b875d619-44f6-44ed-9226-e18e3b35b108.jpg', 'Un coche para que  lo use para trasladarse  mientras esta en la cuidad', 'Alquiler de Coche', '2024-07-29', 300, 'A', 'Lima'),
(19, '1e55350b-0866-477f-a2e8-7f0214da7888.jpg', 'Disfruta un fin de semana en las hermosas playas de Maimi, no te  pierdas esta increíble oportunidad de disfrutar con toda tu familia.', 'Playa Maimi', '2024-08-26', 3000, 'A', 'Maimi'),
(20, '9e6ec929-004e-464d-85bc-1919e408c937.jpg', 'Vuelo directo desde Lima a Dubai  por la aerolinea  Emirates que ofrece un servcicio de calidad en todos sus vuelos.', 'Vuelo Lima-Dubai', '2024-08-14', 6000, 'A', 'Dunai'),
(21, '4b63b8a8-c05d-403a-8268-7e6853500795.jpg', 'una cean en un restaurante', 'Cena', '2024-07-25', 100, 'A', 'centro');

--
-- Disparadores `servicio`
--
DELIMITER $$
CREATE TRIGGER `after_update_servicio` AFTER UPDATE ON `servicio` FOR EACH ROW BEGIN
    -- Declaración de variables
    DECLARE nuevo_costo DOUBLE;

    -- Verifica si el estado del servicio cambió a "I"
    IF OLD.serEstReg <> 'I' AND NEW.serEstReg = 'I' THEN
        -- Inicializa la variable nuevo_costo
        SET nuevo_costo = (
            SELECT SUM(s.serCos)
            FROM servicio s
            JOIN paquetes_servicios ps ON s.serCod = ps.serCod
            WHERE ps.paqCod = (
                SELECT paqCod
                FROM paquetes_servicios
                WHERE serCod = OLD.serCod
                LIMIT 1
            )
        );

        -- Actualiza el costo del paquete
        UPDATE paquetes
        SET paqCos = nuevo_costo
        WHERE paqCod = (
            SELECT paqCod
            FROM paquetes_servicios
            WHERE serCod = OLD.serCod
            LIMIT 1
        );
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inactivate_servicio` AFTER UPDATE ON `servicio` FOR EACH ROW BEGIN
    -- Declaración de variables
    DECLARE nuevo_costo DOUBLE;

    -- Verifica si el estado del servicio cambió a "I"
    IF OLD.serEstReg <> 'I' AND NEW.serEstReg = 'I' THEN
        -- Calcular la suma del costo de los servicios con estado 'A' relacionados al paquete
        SET nuevo_costo = (
            SELECT SUM(s.serCos)
            FROM servicio s
            JOIN paquetes_servicios ps ON s.serCod = ps.serCod
            WHERE ps.paqCod = (
                SELECT ps2.paqCod
                FROM paquetes_servicios ps2
                WHERE ps2.serCod = NEW.serCod
                LIMIT 1
            )
            AND s.serEstReg = 'A'
        );

        -- Actualizar el costo del paquete
        UPDATE paquetes
        SET paqCos = nuevo_costo
        WHERE paqCod = (
            SELECT ps3.paqCod
            FROM paquetes_servicios ps3
            WHERE ps3.serCod = NEW.serCod
            LIMIT 1
        );
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuCod` int(11) NOT NULL,
  `usuEma` varchar(45) NOT NULL,
  `usuPas` varchar(255) NOT NULL,
  `usuEstReg` varchar(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuCod`, `usuEma`, `usuPas`, `usuEstReg`) VALUES
(1, 'testuser@gmail.com', '$2a$10$F4js9.qUfSJkxTn.3vHJOuWizOfeKTswiNHPqQdXxfzSSLDhGMTmG', 'A'),
(2, 'richard@gmail.com', '$2a$10$wdAUV9gtR8GdfuN9vIEspueQ99m2ZMchUf8KEr3t1/H1vWVirbGFa', 'A'),
(3, 'alberto@gmail.com', '$2a$10$r8shaAmmEJBlqm9YCT5Lq.rW.sx8CWRvydSI9WBGIEfQqNV9TJiQq', 'A'),
(4, 'user@gmail.com', '$2a$10$xK71fGsl3D6KaQgmRiIiJuSkrI9t34JuRAoIQgSwjM/VQHL9QEify', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_roles`
--

CREATE TABLE `usuarios_roles` (
  `rolCod` int(11) NOT NULL,
  `usuCod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios_roles`
--

INSERT INTO `usuarios_roles` (`rolCod`, `usuCod`) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `venNum` int(11) NOT NULL,
  `venFec` date NOT NULL,
  `venMedPag` varchar(45) NOT NULL,
  `venEstReg` varchar(1) NOT NULL DEFAULT 'A',
  `cliCod` int(11) DEFAULT NULL,
  `venMon` double NOT NULL,
  `empCod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

CREATE TABLE `venta_detalle` (
  `venDetCod` int(11) NOT NULL,
  `ventSubTot` double NOT NULL,
  `ventCant` int(11) NOT NULL,
  `venNum` int(11) NOT NULL,
  `serCod` int(11) DEFAULT NULL,
  `paqCod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dato_usuario`
--
ALTER TABLE `dato_usuario`
  ADD PRIMARY KEY (`datUsuCod`),
  ADD KEY `FK_1` (`usuCod`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`empCod`),
  ADD KEY `FK_1` (`usuCod`);

--
-- Indices de la tabla `paquetes`
--
ALTER TABLE `paquetes`
  ADD PRIMARY KEY (`paqCod`);

--
-- Indices de la tabla `paquetes_servicios`
--
ALTER TABLE `paquetes_servicios`
  ADD KEY `FK_1` (`serCod`),
  ADD KEY `FK_2` (`paqCod`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rolCod`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`serCod`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuCod`);

--
-- Indices de la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD KEY `FK_1` (`rolCod`),
  ADD KEY `FK_2` (`usuCod`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`venNum`),
  ADD KEY `FK_4` (`empCod`),
  ADD KEY `cliCod` (`cliCod`);

--
-- Indices de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD PRIMARY KEY (`venDetCod`),
  ADD KEY `FK_1` (`venNum`),
  ADD KEY `FK_2` (`serCod`),
  ADD KEY `FK_3` (`paqCod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dato_usuario`
--
ALTER TABLE `dato_usuario`
  MODIFY `datUsuCod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `empCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paquetes`
--
ALTER TABLE `paquetes`
  MODIFY `paqCod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `rolCod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `serCod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuCod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `venNum` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `venDetCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dato_usuario`
--
ALTER TABLE `dato_usuario`
  ADD CONSTRAINT `FK_12_1` FOREIGN KEY (`usuCod`) REFERENCES `usuario` (`usuCod`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `FK_11` FOREIGN KEY (`usuCod`) REFERENCES `usuario` (`usuCod`);

--
-- Filtros para la tabla `paquetes_servicios`
--
ALTER TABLE `paquetes_servicios`
  ADD CONSTRAINT `FK_8` FOREIGN KEY (`serCod`) REFERENCES `servicio` (`serCod`),
  ADD CONSTRAINT `FK_9` FOREIGN KEY (`paqCod`) REFERENCES `paquetes` (`paqCod`);

--
-- Filtros para la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD CONSTRAINT `FK_11_1` FOREIGN KEY (`usuCod`) REFERENCES `usuario` (`usuCod`),
  ADD CONSTRAINT `FK_3` FOREIGN KEY (`rolCod`) REFERENCES `rol` (`rolCod`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `FK_12` FOREIGN KEY (`empCod`) REFERENCES `empleados` (`empCod`),
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cliCod`) REFERENCES `usuario` (`usuCod`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD CONSTRAINT `FK_10` FOREIGN KEY (`venNum`) REFERENCES `venta` (`venNum`),
  ADD CONSTRAINT `FK_11_2` FOREIGN KEY (`serCod`) REFERENCES `servicio` (`serCod`),
  ADD CONSTRAINT `FK_12_3` FOREIGN KEY (`paqCod`) REFERENCES `paquetes` (`paqCod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
