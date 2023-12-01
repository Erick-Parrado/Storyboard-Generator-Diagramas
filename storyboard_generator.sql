-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2023 a las 18:58:22
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

CREATE DATABASE storyboard_generator;

USE storyboard_generator;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `storyboard_generator`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `day_times`
--

CREATE TABLE `day_times` (
  `dayT_id` int(11) NOT NULL,
  `dayT_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `framing`
--

CREATE TABLE `framing` (
  `fram_id` int(11) NOT NULL,
  `fram_name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moves`
--

CREATE TABLE `moves` (
  `move_id` int(11) NOT NULL,
  `move_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE `planes` (
  `plan_id` int(11) NOT NULL,
  `plan_duration` int(11) DEFAULT NULL,
  `plan_argument` int(11) NOT NULL,
  `plan_image` varchar(255) NOT NULL,
  `shot_id` int(11) NOT NULL,
  `fram_id` int(11) NOT NULL,
  `move_id` int(11) NOT NULL,
  `scen_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE `projects` (
  `proj_id` int(11) NOT NULL,
  `proj_tittle` varchar(128) NOT NULL,
  `proj_productora` varchar(128) NOT NULL,
  `proj_dateCreate` int(11) NOT NULL,
  `proj_dateUpdate` int(11) NOT NULL,
  `proj_dateFinish` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scenes`
--

CREATE TABLE `scenes` (
  `scen_id` int(11) NOT NULL,
  `scen_number` int(11) NOT NULL,
  `scen_duration` int(11) NOT NULL,
  `scen_place` varchar(64) NOT NULL,
  `dayT_id` int(11) NOT NULL,
  `spac_id` int(11) NOT NULL,
  `proj_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shots`
--

CREATE TABLE `shots` (
  `shot_id` int(11) NOT NULL,
  `shot_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `spaces`
--

CREATE TABLE `spaces` (
  `spac_id` int(11) NOT NULL,
  `spac_name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team_members`
--

CREATE TABLE `team_members` (
  `teme_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `proj_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(64) NOT NULL,
  `user_lastName` varchar(64) NOT NULL,
  `user_email` varchar(64) NOT NULL,
  `user_password` varchar(64) NOT NULL,
  `user_phone` varchar(7) NOT NULL,
  `user_age` int(11) NOT NULL,
  `us_identifier` varchar(128) NOT NULL,
  `us_key` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `day_times`
--
ALTER TABLE `day_times`
  ADD PRIMARY KEY (`dayT_id`);

--
-- Indices de la tabla `framing`
--
ALTER TABLE `framing`
  ADD PRIMARY KEY (`fram_id`);

--
-- Indices de la tabla `moves`
--
ALTER TABLE `moves`
  ADD PRIMARY KEY (`move_id`);

--
-- Indices de la tabla `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`plan_id`),
  ADD KEY `shot_id` (`shot_id`),
  ADD KEY `move_id` (`move_id`),
  ADD KEY `fram_id` (`fram_id`),
  ADD KEY `scen_id` (`scen_id`);

--
-- Indices de la tabla `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`proj_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indices de la tabla `scenes`
--
ALTER TABLE `scenes`
  ADD PRIMARY KEY (`scen_id`),
  ADD KEY `spac_id` (`spac_id`),
  ADD KEY `proj_id` (`proj_id`),
  ADD KEY `dayT_id` (`dayT_id`);

--
-- Indices de la tabla `shots`
--
ALTER TABLE `shots`
  ADD PRIMARY KEY (`shot_id`);

--
-- Indices de la tabla `spaces`
--
ALTER TABLE `spaces`
  ADD PRIMARY KEY (`spac_id`);

--
-- Indices de la tabla `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`teme_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `proj_id` (`proj_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `day_times`
--
ALTER TABLE `day_times`
  MODIFY `dayT_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `framing`
--
ALTER TABLE `framing`
  MODIFY `fram_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `moves`
--
ALTER TABLE `moves`
  MODIFY `move_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planes`
--
ALTER TABLE `planes`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `projects`
--
ALTER TABLE `projects`
  MODIFY `proj_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `scenes`
--
ALTER TABLE `scenes`
  MODIFY `scen_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `shots`
--
ALTER TABLE `shots`
  MODIFY `shot_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `spaces`
--
ALTER TABLE `spaces`
  MODIFY `spac_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `team_members`
--
ALTER TABLE `team_members`
  MODIFY `teme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `planes`
--
ALTER TABLE `planes`
  ADD CONSTRAINT `planes_ibfk_1` FOREIGN KEY (`shot_id`) REFERENCES `shots` (`shot_id`),
  ADD CONSTRAINT `planes_ibfk_2` FOREIGN KEY (`move_id`) REFERENCES `moves` (`move_id`),
  ADD CONSTRAINT `planes_ibfk_3` FOREIGN KEY (`fram_id`) REFERENCES `framing` (`fram_id`),
  ADD CONSTRAINT `planes_ibfk_4` FOREIGN KEY (`scen_id`) REFERENCES `scenes` (`scen_id`);

--
-- Filtros para la tabla `scenes`
--
ALTER TABLE `scenes`
  ADD CONSTRAINT `scenes_ibfk_1` FOREIGN KEY (`spac_id`) REFERENCES `spaces` (`spac_id`),
  ADD CONSTRAINT `scenes_ibfk_2` FOREIGN KEY (`proj_id`) REFERENCES `projects` (`proj_id`),
  ADD CONSTRAINT `scenes_ibfk_3` FOREIGN KEY (`dayT_id`) REFERENCES `day_times` (`dayT_id`);

--
-- Filtros para la tabla `team_members`
--
ALTER TABLE `team_members`
  ADD CONSTRAINT `team_members_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `team_members_ibfk_2` FOREIGN KEY (`proj_id`) REFERENCES `projects` (`proj_id`),
  ADD CONSTRAINT `team_members_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
