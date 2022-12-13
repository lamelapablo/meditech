-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2022 a las 19:22:47
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `meditech`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `comment` varchar(280) COLLATE utf8_spanish_ci NOT NULL,
  `assistance` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `appointments`
--

INSERT INTO `appointments` (`id`, `id_doctor`, `id_user`, `date_time`, `comment`, `assistance`) VALUES
(1, 1, 31, '2022-12-20 08:00:00', '', 0),
(2, 2, 32, '2022-09-01 10:30:00', 'Debe realizarse una resonancia.', 1),
(3, 3, 40, '2023-02-13 16:00:00', '', 0),
(4, 4, 34, '2022-06-29 09:00:00', 'Tomar ibuprofeno cada 8 horas por una semana.', 1),
(5, 5, 36, '2023-03-31 14:00:00', '', 0),
(6, 6, 38, '2022-03-10 07:00:00', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_specialty` int(11) NOT NULL,
  `tuition` varchar(32) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `doctors`
--

INSERT INTO `doctors` (`id`, `id_user`, `id_specialty`, `tuition`) VALUES
(1, 1, 1, 'ONCO001'),
(2, 2, 14, 'UROL001'),
(3, 3, 15, 'GINE001'),
(4, 4, 2, 'HEMA001'),
(5, 5, 3, 'PEDI001'),
(6, 6, 6, 'ODON001'),
(7, 7, 4, 'NEUR001'),
(8, 8, 4, 'NEUR002'),
(9, 9, 5, 'CARD001'),
(10, 10, 5, 'CARD002'),
(11, 11, 3, 'PEDI002'),
(12, 12, 6, 'ODON002'),
(13, 13, 15, 'GINE002'),
(14, 14, 7, 'OFTA001'),
(15, 15, 8, 'PSIQ001'),
(16, 16, 8, 'PSIQ002'),
(17, 17, 11, 'ENDO001'),
(18, 18, 9, 'DERM001'),
(19, 19, 10, 'GAST001'),
(20, 20, 10, 'GAST002'),
(21, 21, 9, 'DERM002'),
(22, 22, 11, 'ENDO002'),
(23, 23, 12, 'INFE001'),
(24, 24, 12, 'INFE002'),
(25, 25, 13, 'TRAU001'),
(26, 26, 13, 'TRAU002'),
(27, 27, 14, 'UROL002'),
(28, 28, 1, 'ONCO002'),
(29, 29, 2, 'HEMA002'),
(30, 30, 7, 'OFTA002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specialties`
--

CREATE TABLE `specialties` (
  `id` int(11) NOT NULL,
  `specialty` varchar(32) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `specialties`
--

INSERT INTO `specialties` (`id`, `specialty`) VALUES
(5, 'Cardiologia'),
(9, 'Dermatologia'),
(11, 'Endocrinologia'),
(10, 'Gastroenterologia'),
(15, 'Ginecologia'),
(2, 'Hematologia'),
(12, 'Infectologia'),
(4, 'Neurologia'),
(6, 'Odontologia'),
(7, 'Oftalmologia'),
(1, 'Oncologia'),
(3, 'Pediatria'),
(8, 'Psiquiatria'),
(13, 'Traumatologia'),
(14, 'Urologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `surname` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `born_date` date NOT NULL,
  `image` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `phone_number` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `dni` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `email`, `password`, `born_date`, `image`, `phone_number`, `dni`) VALUES
(1, 'Pablo', 'Lamela', 'lamelapablo@uca.edu.ar', 'abcd1234', '2004-05-14', '', '11-5420-9827', 37490339),
(2, 'Juan', 'Pejinakis', 'ipejinakis@uca.edu.ar', 'sapopepe', '2004-03-05', '', '387-445-7691', 45433087),
(3, 'Juan Cruz', 'Gonzalez', 'gonzalezjuanc@uca.edu.ar', 'juang1234', '1969-12-24', '', '11-5869-0014', 36621274),
(4, 'Milagros', 'Soler', 'solermilagrosluz@uca.edu.ar', 'milagritos4321', '2003-06-26', '', '11-3825-0894', 22853146),
(5, 'Estefania', 'Garcilazo', 'egarcilazo@uca.edu.ar', 'estefideluca', '2004-04-04', '', '11-5609-5401', 43264449),
(6, 'Matias', 'Colombo', 'mcolombo@uca.edu.ar', 'colo141298', '1983-01-02', '', '11-3208-9484', 14204316),
(7, 'Esteban', 'Quito', 'quitoesteban@uca.edu.ar', 'estebanquito1234', '1970-03-02', '', '11-5420-9893', 30254291),
(8, 'Alan', 'Brito', 'britoalan@uca.edu.ar', 'alanbrito4321', '1998-11-21', '', '11-5420-9813', 24124283),
(9, 'MIcaela', 'Aguirre', 'aguirremicaela@uca.edu.ar', 'micuveguies', '2004-02-16', '', '11-6138-0513', 47382149),
(10, 'Juan', 'Lopez', 'lopezjuan@uca.edu.ar', 'juanlopez2606', '2011-05-23', '', '11-5420-3467', 11295973),
(11, 'Diego', 'Maradona', 'maradonadiego@uca.edu.ar', 'mexico86', '2010-10-10', '', '11-5420-9421', 10516971),
(12, 'Facundo', 'Monti', 'montifacundo@uca.edu.ar', 'facumonti13', '1987-11-27', '', '11-6018-5630', 36859886),
(13, 'Santiago', 'Bongiovanni', 'bongiovanni@uca.edu.ar', 'FB1234', '2004-05-14', '', '11-4521-1452', 19775877),
(14, 'Maria', 'Leuthier', 'leuthier@uca.edu.ar', 'ML12345', '2004-05-03', '', '11-4785-9658', 31107374),
(15, 'Felipe', 'Maidana', 'maidana@uca.edu.ar', 'FM12314', '1969-10-29', '', '11-4587-5236', 33491657),
(16, 'Ignacio', 'Cornejo', 'cornejo@uca.edu.ar', 'IC1234578', '2003-07-26', '', '11-0235-6523', 15402033),
(17, 'Gabriel', 'Guzman', 'guzmangabriel@uca.edu.ar', 'GG123463', '2005-04-04', '', '11-4785-1452', 23339277),
(18, 'Xiomara', 'Perez', 'perez@uca.edu.ar', 'XP12345', '1986-05-23', '', '11-0147-8520', 44404989),
(19, 'Martina', 'Ulivarri', 'ulivarri@uca.edu.ar', 'MU12387', '2008-01-01', '', '11-3698-2147', 35234101),
(20, 'Milagros', 'Zamar', 'zamar@uca.edu.ar', 'MZ90812', '2001-09-02', '', '11-7896-4521', 37171838),
(21, 'Sofia', 'Barrio', 'sbarrio@uca.edu.ar', 'sb1999', '2004-02-15', '', '54632198', 46472280),
(22, 'Alexia', 'Lapad', 'alapad@uca.edu.ar', 'al4756', '2011-03-23', '', '27345817', 21003402),
(23, 'Mauricio', 'Zarif', 'mzarif@uca.edu.ar', 'mz1928', '2010-10-10', '', '34257857', 33924063),
(24, 'Alejandra', 'Gimenez', 'agimenez@uca.edu.ar', 'ag1932', '1987-06-24', '', '18986263', 23782161),
(25, 'Alex', 'Sandro', 'asandro@uca.edu.ar', 'as4387', '2004-03-14', '', '90023743', 31049950),
(26, 'Nicolas', 'Gerala', 'ngerala@uca.edu.ar', 'ng4835', '1969-09-07', '', '72355155', 40896181),
(27, 'Melina', 'Pejinakis', 'mpejinakis@uca.edu.ar', 'mp3457', '1980-11-02', '', '93721522', 24421912),
(28, 'Gonzalo', 'Soler', 'gsoler@uca.edu.ar', 'gs2374', '2003-06-26', '', '44828246', 39656019),
(29, 'Brian', 'Lamela', 'blamela@uca.edu.ar', 'bl1234', '2005-04-05', '', '73478234', 22755046),
(30, 'Pedro', 'Guerrero', 'pguerrero@uca.edu.ar', 'pg5432', '1983-02-26', '', '93620274', 48945858),
(31, 'Sebastian', 'Zangara', 'zangara@uca.edu.ar', 'SZ9517', '1970-03-02', '', '11-7532-1452', 22426449),
(32, 'Paul', 'Leuckel', 'leuckel@uca.edu.ar', 'PL8547', '1998-11-21', '', '11-8520-4563', 11391829),
(33, 'Sven', 'Espeche', 'espeche@uca.edu.ar', 'SE7145', '2004-02-16', '', '11-7896-4120', 23007481),
(34, 'Marcos', 'Iacuzzi', 'Iacuzzi@uca.edu.ar', 'MI9863', '2011-05-23', '', '11-6325-7481', 24320372),
(35, 'Kenzo', 'Casal', 'casal@uca.edu.ar', 'LC1382', '2010-10-10', '', '11-7410-3698', 24565034),
(36, 'Joaquin', 'Ovejero', 'ovejero@uca.edu.ar', 'JO7896', '1987-11-27', '', '11-4526-4125', 27336884),
(37, 'Manuel', 'Alderete', 'alderetemanuel@uca.edu.ar', 'MA1235', '2004-05-14', '', '11-7845-1203', 35336991),
(38, 'Paula', 'Carlino', 'carlino@uca.edu.ar', 'PC7896', '2004-05-03', '', '11-4589-1236', 47039629),
(39, 'Paulina', 'Luna', 'luna@uca.edu.ar', 'PL7845', '1969-12-24', '', '11-0258-0258', 46684743),
(40, 'Ornela', 'Santos', 'santos@uca.edu.ar', 'OS7843', '2003-07-26', '', '11-7441-1025', 42422458);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `working_days`
--

CREATE TABLE `working_days` (
  `id` int(11) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `day` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `id_work_shift` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `working_days`
--

INSERT INTO `working_days` (`id`, `id_doctor`, `day`, `id_work_shift`) VALUES
(1, 1, 'lunes', 3),
(2, 1, 'martes', 3),
(3, 1, 'miercoles', 2),
(4, 1, 'jueves', 3),
(5, 1, 'viernes', 3),
(6, 1, 'sabado', 3),
(7, 2, 'lunes', 1),
(8, 2, 'martes', 2),
(9, 2, 'miercoles', 3),
(10, 2, 'jueves', 1),
(11, 2, 'viernes', 1),
(12, 2, 'sabado', 3),
(13, 3, 'lunes', 3),
(14, 3, 'martes', 3),
(15, 3, 'miercoles', 3),
(16, 3, 'jueves', 1),
(17, 3, 'viernes', 2),
(18, 3, 'sabado', 3),
(19, 4, 'lunes', 3),
(20, 4, 'martes', 1),
(21, 4, 'miercoles', 1),
(22, 4, 'jueves', 1),
(23, 4, 'viernes', 1),
(24, 4, 'sabado', 1),
(25, 5, 'lunes', 3),
(26, 5, 'martes', 1),
(27, 5, 'miercoles', 2),
(28, 5, 'jueves', 1),
(29, 5, 'viernes', 2),
(30, 5, 'sabado', 1),
(31, 6, 'lunes', 3),
(32, 6, 'martes', 2),
(33, 6, 'miercoles', 3),
(34, 6, 'jueves', 1),
(35, 6, 'viernes', 3),
(36, 6, 'sabado', 3),
(37, 7, 'lunes', 2),
(38, 7, 'martes', 3),
(39, 7, 'miercoles', 1),
(40, 7, 'jueves', 1),
(41, 7, 'viernes', 2),
(42, 7, 'sabado', 3),
(43, 8, 'lunes', 2),
(44, 8, 'martes', 2),
(45, 8, 'miercoles', 1),
(46, 8, 'jueves', 3),
(47, 8, 'viernes', 2),
(48, 8, 'sabado', 2),
(49, 9, 'lunes', 3),
(50, 9, 'martes', 1),
(51, 9, 'miercoles', 1),
(52, 9, 'jueves', 2),
(53, 9, 'viernes', 1),
(54, 9, 'sabado', 2),
(55, 10, 'lunes', 2),
(56, 10, 'martes', 3),
(57, 10, 'miercoles', 1),
(58, 10, 'jueves', 1),
(59, 10, 'viernes', 1),
(60, 10, 'sabado', 3),
(61, 11, 'lunes', 2),
(62, 11, 'martes', 2),
(63, 11, 'miercoles', 3),
(64, 11, 'jueves', 3),
(65, 11, 'viernes', 2),
(66, 11, 'sabado', 3),
(67, 12, 'lunes', 3),
(68, 12, 'martes', 1),
(69, 12, 'miercoles', 2),
(70, 12, 'jueves', 1),
(71, 12, 'viernes', 1),
(72, 12, 'sabado', 1),
(73, 13, 'lunes', 3),
(74, 13, 'martes', 1),
(75, 13, 'miercoles', 2),
(76, 13, 'jueves', 1),
(77, 13, 'viernes', 1),
(78, 13, 'sabado', 3),
(79, 14, 'lunes', 2),
(80, 14, 'martes', 2),
(81, 14, 'miercoles', 2),
(82, 14, 'jueves', 3),
(83, 14, 'viernes', 2),
(84, 14, 'sabado', 3),
(85, 15, 'lunes', 3),
(86, 15, 'martes', 1),
(87, 15, 'miercoles', 2),
(88, 15, 'jueves', 3),
(89, 15, 'viernes', 1),
(90, 15, 'sabado', 2),
(91, 16, 'lunes', 2),
(92, 16, 'martes', 2),
(93, 16, 'miercoles', 3),
(94, 16, 'jueves', 2),
(95, 16, 'viernes', 2),
(96, 16, 'sabado', 3),
(97, 17, 'lunes', 3),
(98, 17, 'martes', 1),
(99, 17, 'miercoles', 2),
(100, 17, 'jueves', 2),
(101, 17, 'viernes', 3),
(102, 17, 'sabado', 3),
(103, 18, 'lunes', 3),
(104, 18, 'martes', 1),
(105, 18, 'miercoles', 1),
(106, 18, 'jueves', 1),
(107, 18, 'viernes', 3),
(108, 18, 'sabado', 2),
(109, 19, 'lunes', 3),
(110, 19, 'martes', 1),
(111, 19, 'miercoles', 3),
(112, 19, 'jueves', 2),
(113, 19, 'viernes', 1),
(114, 19, 'sabado', 2),
(115, 20, 'lunes', 3),
(116, 20, 'martes', 3),
(117, 20, 'miercoles', 2),
(118, 20, 'jueves', 1),
(119, 20, 'viernes', 2),
(120, 20, 'sabado', 2),
(121, 21, 'lunes', 3),
(122, 21, 'martes', 1),
(123, 21, 'miercoles', 1),
(124, 21, 'jueves', 1),
(125, 21, 'viernes', 1),
(126, 21, 'sabado', 1),
(127, 22, 'lunes', 2),
(128, 22, 'martes', 2),
(129, 22, 'miercoles', 1),
(130, 22, 'jueves', 1),
(131, 22, 'viernes', 2),
(132, 22, 'sabado', 2),
(133, 23, 'lunes', 3),
(134, 23, 'martes', 3),
(135, 23, 'miercoles', 2),
(136, 23, 'jueves', 1),
(137, 23, 'viernes', 2),
(138, 23, 'sabado', 1),
(139, 24, 'lunes', 1),
(140, 24, 'martes', 2),
(141, 24, 'miercoles', 1),
(142, 24, 'jueves', 2),
(143, 24, 'viernes', 3),
(144, 24, 'sabado', 3),
(145, 25, 'lunes', 1),
(146, 25, 'martes', 1),
(147, 25, 'miercoles', 1),
(148, 25, 'jueves', 1),
(149, 25, 'viernes', 2),
(150, 25, 'sabado', 2),
(151, 26, 'lunes', 1),
(152, 26, 'martes', 3),
(153, 26, 'miercoles', 3),
(154, 26, 'jueves', 2),
(155, 26, 'viernes', 1),
(156, 26, 'sabado', 1),
(157, 27, 'lunes', 3),
(158, 27, 'martes', 1),
(159, 27, 'miercoles', 2),
(160, 27, 'jueves', 2),
(161, 27, 'viernes', 1),
(162, 27, 'sabado', 1),
(163, 28, 'lunes', 3),
(164, 28, 'martes', 3),
(165, 28, 'miercoles', 2),
(166, 28, 'jueves', 3),
(167, 28, 'viernes', 1),
(168, 28, 'sabado', 3),
(169, 29, 'lunes', 3),
(170, 29, 'martes', 1),
(171, 29, 'miercoles', 2),
(172, 29, 'jueves', 3),
(173, 29, 'viernes', 2),
(174, 29, 'sabado', 2),
(175, 30, 'lunes', 1),
(176, 30, 'martes', 3),
(177, 30, 'miercoles', 2),
(178, 30, 'jueves', 1),
(179, 30, 'viernes', 1),
(180, 30, 'sabado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `work_shifts`
--

CREATE TABLE `work_shifts` (
  `id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `work_shift` varchar(32) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `work_shifts`
--

INSERT INTO `work_shifts` (`id`, `start_time`, `end_time`, `work_shift`) VALUES
(1, '07:00:00', '13:00:00', 'mañana'),
(2, '14:00:00', '20:00:00', 'tarde'),
(3, '07:00:00', '20:00:00', 'completo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_doctor` (`id_doctor`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tuition` (`tuition`),
  ADD KEY `id_specialty` (`id_specialty`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `specialty` (`specialty`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `working_days`
--
ALTER TABLE `working_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_doctor` (`id_doctor`),
  ADD KEY `id_work_shift` (`id_work_shift`);

--
-- Indices de la tabla `work_shifts`
--
ALTER TABLE `work_shifts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `work_shift` (`work_shift`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `specialties`
--
ALTER TABLE `specialties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `working_days`
--
ALTER TABLE `working_days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT de la tabla `work_shifts`
--
ALTER TABLE `work_shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`id_doctor`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`id_specialty`) REFERENCES `specialties` (`id`),
  ADD CONSTRAINT `doctors_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `working_days`
--
ALTER TABLE `working_days`
  ADD CONSTRAINT `working_days_ibfk_1` FOREIGN KEY (`id_doctor`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `working_days_ibfk_2` FOREIGN KEY (`id_work_shift`) REFERENCES `work_shifts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
