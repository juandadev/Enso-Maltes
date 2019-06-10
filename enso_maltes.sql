-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2019 a las 01:15:01
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
(1, 2, 'Base de datos como servicio', 'Configurar, probar y demostrar el acceso a una base de datos alojada con un proveedor de cómputo en la nube.', '2019-06-10 01:28:56', 'A diferencia de montar los servidores localmente desde nuestro propio ordenador, al utilizar algún proveedor de cómputo en la nube nos ahorra muchísimo espacio, tiempo y trabajo, ya que prácticamente al alcance de un clic podemos contratar y levantar el servidor de nuestra preferencia sin ningún esfuerzo.\r\nExisten diferentes proveedores para diferente tipo de cosas, con tarifas muy accesibles y herramientas para poder manejar el servidor a nuestro gusto, todo esto supone una gran ventaja para adentrarse en el cómputo en la nube.\r\nEl único contratiempo que se tuvo fue el no saber cómo se abrían los puertos en el Firewall del servidor para poder realizar la conexión exitosamente.\r\nEl tiempo aproximado de la realización de la actividad fue alrededor de 2 horas.\r\n', 'bit.jpg', 1),
(2, 2, 'CMS alojado en la web', 'Instalar y configurar un CMS utilizando un proveedor de hosting o de servicios de cómputo en la nube.', '2019-06-10 01:28:56', 'Utilizar un proveedor de cómputo en la nube la instalación de aplicaciones o CMS en servidores está al alcance de un solo clic, y ofrecen muchas facilidades de pago dependiendo de las características que mejor se adapten a nuestras necesidades, esto supone ser una herramienta muy útil para la mayoría de la gente ya que en términos de costo es mucho más barato la renta de un servidor que estar manteniendo uno en nuestro propio lugar de trabajo.\r\nNo hubo contratiempos al momento de la realización de esta actividad.\r\nEl tiempo aproximado de la realización de la actividad fue alrededor de 1 hora.\r\n', 'presta.jpg', 1),
(3, 2, 'adfasdf', 'sadfasdf', '2019-06-10 04:44:11', 'asdfasdf', NULL, 4),
(4, 2, 'sdfasdf', 'asdfasdf', '2019-06-10 04:44:11', 'asdfasdf', NULL, 3),
(5, 2, 'asdfasdf', 'asdfasdf', '2019-06-10 04:44:11', 'adfgdfh', NULL, 1),
(6, 2, 'adfgadfg', 'adfgadfg', '2019-06-10 04:44:11', 'adfgadfg', NULL, 6),
(7, 2, 'adfgadfh', 'dafhgadfg', '2019-06-10 04:44:11', 'adfgadfg', NULL, 2),
(8, 2, 'adfgadfh', 'adfgadfh', '2019-06-10 04:44:11', 'adfhadfh', NULL, 5),
(9, 2, 'adfhdfh', 'adfgadfg', '2019-06-10 04:44:11', 'adfgadfg', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `id_autor` bigint(20) UNSIGNED NOT NULL,
  `fk_id_usuario` bigint(20) UNSIGNED NOT NULL,
  `foto_perfil` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `genero` enum('femenino','masculino') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'femenino',
  `info_autor` text CHARACTER SET utf8 COLLATE utf8_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id_autor`, `fk_id_usuario`, `foto_perfil`, `genero`, `info_autor`) VALUES
(2, 1, 'juan.png', 'masculino', 'Web Developer | Parral, Chihuahua\r\njuandamartinez.com');

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
(2, 'Política'),
(3, 'Filosofía'),
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
(1, 'Juan Daniel', 'jdmartinez@itparral.edu.mx', '0', '15410596', 'autor');

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
  ADD UNIQUE KEY `usuarios_correo_unique` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id_articulo` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `id_autor` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
