-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2019 a las 23:55:59
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `enso_maltes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id_articulo` bigint(20) UNSIGNED NOT NULL,
  `fk_id_autor` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(191) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `extracto` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contenido` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `foto_portada` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_id_categoria` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id_articulo`, `fk_id_autor`, `titulo`, `extracto`, `fecha`, `contenido`, `foto_portada`, `fk_id_categoria`) VALUES
(1, 1, 'Golpeados pero no vencidos', 'Que estamos atribulados en todo, mas no angustiados; en apuros, mas no desesperados; perseguidos, mas no desamparados; derribados, pero no destruidos...', '2019-06-11 20:23:33', 'Una afliccion trae un sentimiento persistente de angustia y desesperacion. No deseamos que ninguna preocupacion pequena y temporal crezca y se convierta en una situacion permanente, persistente, que asesine nuestro deseo de vivir.\r\n\r\nUna afliccion puede destruirnos si lo permitimos. Lo que nos ampara y protege contra la corrosiva fuerza de cualquier afliccion, es la presencia de Dios en nuestras vidas. Su presencia determina si la afliccion desaparece, o nos destruye. El poder de Dios en nuestras almas nos dice si la situacion no pasara de ser solo una preocupacion. Sin la presencia de Dios en nuestros corazones cualquier afliccion nos puede llevar a la locura y hasta la muerte.\r\n\r\nCon Dios en nuestras vidas, tal vez seremos perseguidos, pero jamas nos sentiremos abandonados, seremos golpeados por circunstancias que parecen imposibles, pero por aferrarnos a su amor y perdon, jamas seremos derribados.\r\n\r\nSe con certeza que estas palabras son ciertas, y te dire por que. Cuando conoces a Dios, tu sabes con certeza que algo mayor, mas grande, mas fuerte que tu esta en control de tu vida, de tu futuro, de tu destino. \r\n\r\n\"...Entonces, que diremos a esto? Si Dios esta por nosotros, quien estara contra nosotros?\" Romanos 8:31\r\n\r\nNo te sientas culpable por \"sentirte afligido\", o por reconocer que en verdad has sido golpeado y que los golpes recibidos duelen. Claro que duelen. \r\n\r\nNo tengas temor de reconocer que temporalmente te encuentras confundido, atacado por dudas y que el sentimiento de angustia pelea contra la paz de Dios en lo mas profundo de tu alma. Estas en la lucha, y estas sufriendo dolor, pero no seras derrotado, no seras vencido.', 'golpeado.jpg', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `id_autor` bigint(20) UNSIGNED NOT NULL,
  `fk_id_usuario` bigint(20) UNSIGNED NOT NULL,
  `foto_perfil` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT 'default.png',
  `genero` enum('femenino','masculino','no definido') CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT 'no definido',
  `info_autor` text CHARACTER SET utf8 COLLATE utf8_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id_autor`, `fk_id_usuario`, `foto_perfil`, `genero`, `info_autor`) VALUES
(1, 5, 'default.png', 'no definido', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` bigint(20) UNSIGNED NOT NULL,
  `nombre_categoria` varchar(191) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Cultura General'),
(2, 'Politica'),
(3, 'Filosofia'),
(4, 'Arte'),
(5, 'Salud'),
(6, 'Mistiscismo');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `detalles artículo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `detalles artículo` (
`nombre_categoria` varchar(191)
,`titulo` varchar(191)
,`extracto` varchar(200)
,`nombre_usuario` varchar(16)
,`foto_perfil` varchar(200)
,`foto_portada` varchar(200)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `nombre_usuario` varchar(16) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(76) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `verificado` enum('0','1') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `contrasena` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo_usuario` enum('admin','autor') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'autor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `correo`, `verificado`, `contrasena`, `tipo_usuario`) VALUES
(5, 'juan daniel', 'snoopdjffny@gmail.com', '0', 'f00fe6ae6cec917d69b08459395a09ccb12580d4397ee1fea9dc0465b25406c98c4b5e22256e624bdfbc111b6697930c262d4fbc0ea4c868d2b7ee5f6df8f5a3', 'autor');

-- --------------------------------------------------------

--
-- Estructura para la vista `detalles artículo`
--
DROP TABLE IF EXISTS `detalles artículo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalles artículo`  AS  select `categorias`.`nombre_categoria` AS `nombre_categoria`,`articulos`.`titulo` AS `titulo`,`articulos`.`extracto` AS `extracto`,`usuarios`.`nombre_usuario` AS `nombre_usuario`,`autores`.`foto_perfil` AS `foto_perfil`,`articulos`.`foto_portada` AS `foto_portada` from (((`articulos` join `categorias` on((`articulos`.`fk_id_categoria` = `categorias`.`id_categoria`))) join `autores` on((`articulos`.`fk_id_autor` = `autores`.`id_autor`))) join `usuarios` on((`autores`.`fk_id_usuario` = `usuarios`.`id_usuario`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id_articulo`),
  ADD KEY `articulos_fk_id_autor_foreign` (`fk_id_autor`),
  ADD KEY `categorias_fk_id_categoria_foreign` (`fk_id_categoria`);

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id_autor`),
  ADD KEY `autores_fk_id_usuario_foreign` (`fk_id_usuario`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuarios_correo_unique` (`correo`),
  ADD UNIQUE KEY `UNIQUE` (`nombre_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id_articulo` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `id_autor` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_fk_id_autor_foreign` FOREIGN KEY (`fk_id_autor`) REFERENCES `autores` (`id_autor`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorias_fk_id_categoria_foreign` FOREIGN KEY (`fk_id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE;

--
-- Filtros para la tabla `autores`
--
ALTER TABLE `autores`
  ADD CONSTRAINT `autores_fk_id_usuario_foreign` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
