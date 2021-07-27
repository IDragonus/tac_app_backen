-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-07-2021 a las 03:54:19
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tac_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'tac', '0001_initial', '2021-07-27 01:08:53.179687');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tac_client`
--

DROP TABLE IF EXISTS `tac_client`;
CREATE TABLE IF NOT EXISTS `tac_client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `client_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `client_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `id_cola_id` int NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `tac_client_id_cola_id_47137dc7` (`id_cola_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tac_client`
--

INSERT INTO `tac_client` (`client_id`, `client_name`, `client_status`, `id_cola_id`) VALUES
(1, 'Eliana Pina', 'Atendido', 1),
(2, 'Ruben Alarcon', 'Atendido', 2),
(3, 'hhhh', 'Atendido', 1),
(4, 'Martin Candas', 'Atendido', 1),
(5, 'Carlos Mendoza', 'No Atendido', 1),
(6, 'Penelope Glamour', 'Atendido', 2),
(7, 'Maria Mata', 'No Atendido', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tac_ticket`
--

DROP TABLE IF EXISTS `tac_ticket`;
CREATE TABLE IF NOT EXISTS `tac_ticket` (
  `cola_id` int NOT NULL AUTO_INCREMENT,
  `cola_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cola_time` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cola_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tac_ticket`
--

INSERT INTO `tac_ticket` (`cola_id`, `cola_name`, `cola_time`) VALUES
(1, 'cola 1', '2min'),
(2, 'cola 2', '3min');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
