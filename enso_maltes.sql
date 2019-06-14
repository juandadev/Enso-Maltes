-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2019 a las 02:35:52
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
  `fk_id_usuario` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(191) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `extracto` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contenido` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `foto_portada` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_id_categoria` bigint(20) UNSIGNED NOT NULL,
  `visitas` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id_articulo`, `fk_id_usuario`, `titulo`, `extracto`, `fecha`, `contenido`, `foto_portada`, `fk_id_categoria`, `visitas`) VALUES
(2, 5, 'Golpeado pero no vencido', 'Que estamos atribulados en todo, mas no angustiados; en apuros, mas no desesperados; perseguidos, mas no desamparados; derribados, pero no destruidos...', '2019-06-12 03:49:15', '&lt;p&gt;Una afliccion trae un sentimiento persistente de angustia y desesperacion. No deseamos que ninguna preocupacion pequena y temporal crezca y se convierta en una situacion permanente, persistente, que asesine nuestro deseo de vivir.&lt;/p&gt;&lt;p&gt;Una afliccion puede destruirnos si lo permitimos. Lo que nos ampara y protege contra la corrosiva fuerza de cualquier afliccion, es la presencia de Dios en nuestras vidas. Su presencia determina si la afliccion desaparece, o nos destruye.&lt;/p&gt;&lt;p&gt;El poder de Dios en nuestras almas nos dice si la situacion no pasara de ser solo una preocupacion. Sin la presencia de Dios en nuestros corazones cualquier afliccion nos puede llevar a la locura y hasta la muerte. Con Dios en nuestras vidas, tal vez seremos perseguidos, pero jamas nos sentiremos abandonados, seremos golpeados por circunstancias que parecen imposibles, pero por aferrarnos a su amor y perdon, jamas seremos derribados.&lt;/p&gt;&lt;p&gt;Se con certeza que estas palabras son ciertas, y te dire por que. Cuando conoces a Dios, tu sabes con certeza que algo mayor, mas grande, mas fuerte que tu esta en control de tu vida, de tu futuro, de tu destino.&lt;/p&gt;&lt;p&gt;&amp;quot;...Entonces, que diremos a esto? Si Dios esta por nosotros, quien estara contra nosotros?&amp;quot; Romanos 8:31 No te sientas culpable por &amp;quot;sentirte afligido&amp;quot;, o por reconocer que en verdad has sido golpeado y que los golpes recibidos duelen.&lt;/p&gt;&lt;p&gt;Claro que duelen. No tengas temor de reconocer que temporalmente te encuentras confundido, atacado por dudas y que el sentimiento de angustia pelea contra la paz de Dios en lo mas profundo de tu alma. Estas en la lucha, y estas sufriendo dolor, pero no seras derrotado, no seras vencido.&lt;/p&gt;', 'golpeado.jpg', 4, 47),
(9, 8, 'Que onda morros', 'Quiubole que', '2019-06-14 00:33:02', '&lt;p&gt;Me ando meando&lt;/p&gt;', NULL, 2, 0);

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
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `nombre_usuario` varchar(16) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(76) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `verificado` enum('0','1') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `contrasena` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo_usuario` enum('admin','autor') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'autor',
  `foto_perfil` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'default.png',
  `genero` enum('mujer','hombre','no definido') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'no definido',
  `info_usuario` text CHARACTER SET utf8 COLLATE utf8_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `correo`, `verificado`, `contrasena`, `tipo_usuario`, `foto_perfil`, `genero`, `info_usuario`) VALUES
(5, 'juan daniel', 'snoopdjffny@gmail.com', '0', 'f00fe6ae6cec917d69b08459395a09ccb12580d4397ee1fea9dc0465b25406c98c4b5e22256e624bdfbc111b6697930c262d4fbc0ea4c868d2b7ee5f6df8f5a3', 'autor', '13192515IMG-20180223-WA0032(2).jpg', 'hombre', 'Web Developer | Parral, Chihuahua'),
(8, 'moe', 'jdmartinez@itparral.edu.mx', '0', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'autor', 'default.png', 'no definido', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id_articulo`),
  ADD KEY `categorias_fk_id_categoria_foreign` (`fk_id_categoria`),
  ADD KEY `articulos_fk_id_usuario_foreign` (`fk_id_usuario`);

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
  MODIFY `id_articulo` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_fk_id_usuario_foreign` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorias_fk_id_categoria_foreign` FOREIGN KEY (`fk_id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
