-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2019 a las 11:34:02
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
  `visitas` bigint(20) NOT NULL DEFAULT '0',
  `comentarios` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id_articulo`, `fk_id_usuario`, `titulo`, `extracto`, `fecha`, `contenido`, `foto_portada`, `fk_id_categoria`, `visitas`, `comentarios`) VALUES
(2, 5, 'Golpeado pero no vencido', 'Que estamos atribulados en todo, mas no angustiados; en apuros, mas no desesperados; perseguidos, mas no desamparados; derribados, pero no destruidos...', '2019-06-12 03:49:15', '&lt;p&gt;Una afliccion trae un sentimiento persistente de angustia y desesperacion. No deseamos que ninguna preocupacion pequena y temporal crezca y se convierta en una situacion permanente, persistente, que asesine nuestro deseo de vivir.&lt;/p&gt;&lt;p&gt;Una afliccion puede destruirnos si lo permitimos. Lo que nos ampara y protege contra la corrosiva fuerza de cualquier afliccion, es la presencia de Dios en nuestras vidas. Su presencia determina si la afliccion desaparece, o nos destruye.&lt;/p&gt;&lt;p&gt;El poder de Dios en nuestras almas nos dice si la situacion no pasara de ser solo una preocupacion. Sin la presencia de Dios en nuestros corazones cualquier afliccion nos puede llevar a la locura y hasta la muerte. Con Dios en nuestras vidas, tal vez seremos perseguidos, pero jamas nos sentiremos abandonados, seremos golpeados por circunstancias que parecen imposibles, pero por aferrarnos a su amor y perdon, jamas seremos derribados.&lt;/p&gt;&lt;p&gt;Se con certeza que estas palabras son ciertas, y te dire por que. Cuando conoces a Dios, tu sabes con certeza que algo mayor, mas grande, mas fuerte que tu esta en control de tu vida, de tu futuro, de tu destino.&lt;/p&gt;&lt;p&gt;&amp;quot;...Entonces, que diremos a esto? Si Dios esta por nosotros, quien estara contra nosotros?&amp;quot; Romanos 8:31 No te sientas culpable por &amp;quot;sentirte afligido&amp;quot;, o por reconocer que en verdad has sido golpeado y que los golpes recibidos duelen.&lt;/p&gt;&lt;p&gt;Claro que duelen. No tengas temor de reconocer que temporalmente te encuentras confundido, atacado por dudas y que el sentimiento de angustia pelea contra la paz de Dios en lo mas profundo de tu alma. Estas en la lucha, y estas sufriendo dolor, pero no seras derrotado, no seras vencido.&lt;/p&gt;', 'golpeado.jpg', 3, 27, 0),
(4, 6, 'Eso no es de gangsters, carnal', 'Nullam non venenatis nisl, nec convallis eros. Quisque commodo scelerisque ex ut lacinia. Integer tortor turpis, consectetur at commodo sit amet, condimentum in metus.', '2019-06-12 06:41:58', 'Fusce et enim aliquet, rutrum risus mattis, faucibus massa. Nulla leo augue, pretium id massa et, commodo commodo metus. Duis vehicula eros lorem. In tortor arcu, bibendum eu convallis quis, cursus ac augue. Aliquam eget mollis odio, at malesuada nibh. Nam tortor justo, faucibus in justo non, accumsan porttitor nunc. Maecenas pulvinar libero iaculis, iaculis arcu in, semper lacus. Pellentesque elementum tempus finibus. Sed tristique arcu lacus, at volutpat nibh pretium sit amet. Maecenas molestie bibendum justo, sagittis iaculis arcu condimentum id. In mattis erat nec sagittis accumsan. Etiam posuere erat sapien, eu molestie tellus interdum non.\\n\\nQuisque in nibh quis velit bibendum ullamcorper at eu eros. Duis fermentum augue vel enim pretium placerat. Quisque molestie, nisi sit amet auctor rutrum, mi purus pretium nunc, in eleifend sapien orci non nibh. Vestibulum eget nibh vitae libero tristique sagittis ac ut tortor. Vestibulum vel lacinia orci. Aenean lacinia sem ut eros hendrerit, quis porta ante congue. Vestibulum sed mauris magna. Nam pharetra lacinia lacus, sed tempor dui dictum at. Praesent consequat congue est. Proin vitae pretium ante. Aliquam erat risus, aliquet sagittis felis vitae, tristique ultrices metus. Vivamus blandit augue mauris, id blandit sem vulputate at. Mauris vestibulum malesuada velit. Aliquam accumsan porta quam, ut rutrum mi sodales a. Nullam hendrerit porta elit in sodales. Aliquam ac congue ante.\\n\\nInteger venenatis malesuada enim sed blandit. Integer placerat sollicitudin fringilla. Aenean cursus nec est non fermentum. In hac habitasse platea dictumst. Etiam in lacus pretium, consectetur orci vitae, pretium purus. Morbi eget risus risus. In viverra ex sagittis lacinia ornare. Integer leo erat, feugiat at orci vitae, dapibus hendrerit diam.\\n\\nPraesent hendrerit felis at consectetur pulvinar. Praesent vestibulum ornare metus ac consectetur. Donec eu dignissim urna, eu efficitur elit. Suspendisse felis nibh, facilisis sit amet ultricies sit amet, porta vitae nunc. Sed eget aliquet est. Etiam tellus odio, sagittis consectetur elementum sed, sagittis sed purus. Donec porttitor ex ut libero mollis mattis. Morbi consectetur porta enim sit amet faucibus. Donec at auctor urna. Sed sit amet pretium libero. Aenean nulla ligula, mattis vel semper in, bibendum id nisl.\\n\\nPraesent pretium egestas lacinia. Praesent ac fermentum lacus. Proin quis lacinia lorem, nec molestie risus. Ut dignissim ex sed rhoncus auctor. Cras rutrum ac velit nec pharetra. Etiam in dapibus felis. Vestibulum malesuada congue purus, sit amet egestas metus luctus vitae.', 'og.png', 1, 1, 0),
(5, 7, 'Con timon y en el delirio', 'Proin eget viverra est, id bibendum justo. In sapien risus, efficitur quis ante tempor, volutpat eleifend nunc. Etiam sollicitudin, diam vitae dignissim egestas, justo neque mollis lorem, sit amet tin', '2019-06-12 18:11:21', 'Morbi mattis mi nec venenatis egestas. Cras tincidunt a tortor eu congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc luctus egestas dui, in commodo lectus scelerisque sit amet. Sed quis fringilla tortor, in condimentum libero. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec tempus nibh quis arcu laoreet tempor. Pellentesque auctor ultrices nisi, eu venenatis nisi sagittis sed. Praesent tortor metus, ultrices gravida ultrices non, imperdiet at est.\r\n\r\nAliquam luctus imperdiet dui, vitae luctus leo. In condimentum porttitor enim ac elementum. Morbi non feugiat ligula, eu suscipit libero. Integer tempus laoreet ante vel sollicitudin. Nulla facilisi. Nam velit sem, porttitor a magna eget, imperdiet eleifend odio. Mauris vulputate sollicitudin dapibus. Maecenas lacus nisl, iaculis sit amet efficitur ultrices, volutpat semper sem. Pellentesque venenatis suscipit sem, eu gravida elit commodo non. Aliquam consectetur ut purus vel efficitur. Cras ultrices magna vitae lectus ultrices accumsan.\r\n\r\nInteger non congue ipsum. Phasellus auctor ultrices erat, vel ornare urna dignissim quis. Donec faucibus purus vel lorem imperdiet auctor. Pellentesque in maximus nulla. Sed laoreet lorem imperdiet velit dignissim luctus. Phasellus suscipit elit eget risus interdum, sed scelerisque tellus porttitor. Vestibulum vulputate sem a dui molestie porta non vitae lorem. Vivamus vitae leo blandit, elementum ligula at, auctor mauris.\r\n\r\nAliquam sit amet nibh convallis, tempus nisl non, pulvinar orci. Cras tristique magna sit amet eros aliquet blandit. Ut sed massa sit amet est consectetur sagittis. Ut gravida, ipsum et semper malesuada, lacus nibh interdum odio, ac lacinia nisi quam quis mi. Sed pellentesque augue enim, vitae mollis libero scelerisque id. Proin tincidunt sollicitudin sapien sed sagittis. Vivamus euismod cursus arcu, eget auctor leo egestas vitae. Pellentesque nec porta metus. Proin ac vulputate orci.\r\n\r\nVivamus sollicitudin ante vel mi dignissim, quis faucibus dui tristique. Cras mattis eleifend tellus, in placerat felis tincidunt ac. Phasellus nec hendrerit erat, non molestie nulla. Morbi congue accumsan nisl, eget ornare nisi blandit vel. Nulla vel lobortis risus. Proin ultrices libero eu turpis tincidunt mattis. Pellentesque eros dolor, euismod at sem vel, pretium tempor felis. Mauris lobortis tristique nisl, ac pellentesque nunc facilisis eu. Cras non ante blandit lectus semper aliquet. Quisque risus sem, interdum sit amet nibh sed, ullamcorper porttitor ex. Ut ullamcorper fermentum ex, eu mattis dui imperdiet non.', NULL, 4, 0, 0),
(6, 7, 'Vamos a fumar unos porros', 'Aliquam luctus imperdiet dui, vitae luctus leo. In condimentum porttitor enim ac elementum. Morbi non feugiat ligula, eu suscipit libero. Integer tempus laoreet ante vel sollicitudin.', '2019-06-12 18:11:21', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque massa justo, lacinia ut sollicitudin vitae, hendrerit a nulla. Proin dapibus varius orci. Ut est tellus, scelerisque sit amet eros quis, varius molestie eros. Nulla commodo nisi orci, sit amet aliquam diam tempor et. Sed cursus porta nisi. Fusce imperdiet quam a nibh cursus, quis imperdiet lacus ullamcorper. Ut ac dictum sem. Maecenas egestas aliquam augue, nec lobortis quam posuere non. Nunc luctus dapibus eros, nec elementum ipsum suscipit non. Curabitur ornare mauris at orci semper ornare vitae at purus. Sed sollicitudin neque mi, ut rutrum ipsum ornare nec. In sed tincidunt nibh. Sed et nunc sit amet lorem pellentesque commodo.\r\n\r\nEtiam sollicitudin tortor sit amet ullamcorper cursus. Nulla tempus auctor arcu ac malesuada. Fusce luctus orci quis porttitor pellentesque. Phasellus bibendum dapibus nulla non condimentum. Donec magna dui, sagittis sit amet dolor non, vehicula molestie justo. Aenean magna nisl, feugiat ac feugiat vitae, aliquam sit amet eros. Fusce nec nisi ac eros accumsan imperdiet. Etiam scelerisque libero et justo ornare, commodo tempor odio finibus. Suspendisse potenti. Nam consectetur aliquet lorem, quis pharetra sem commodo ut. Cras vel enim nunc. Morbi quam lacus, porttitor vel sagittis et, porttitor ut nunc. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nNunc euismod ac orci sed condimentum. Ut ut nulla sit amet tellus finibus elementum at sodales orci. Sed nisl ex, aliquam et mattis eu, suscipit ut velit. Nunc non tortor arcu. Phasellus vitae elit eu ante sodales tempor vitae eu urna. Nunc non mollis eros. Donec ultricies tincidunt nisi, nec placerat purus interdum eget. Nulla dui diam, fringilla vel luctus sed, efficitur et est.\r\n\r\nQuisque varius, dolor sit amet egestas condimentum, magna lacus tincidunt dui, sed laoreet lacus est lobortis libero. Cras ultricies massa lectus, sit amet tristique magna pulvinar ac. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce tincidunt molestie dui quis mattis. Sed congue justo a orci tincidunt, in pellentesque felis malesuada. Pellentesque ultrices ex porta tincidunt scelerisque. Phasellus facilisis ante eget metus feugiat dictum. Maecenas in orci non nisl malesuada vestibulum. Suspendisse consectetur eleifend tincidunt. Nulla ac nunc eget dui feugiat tristique quis eu lorem. Vestibulum consectetur, turpis at sollicitudin rutrum, mauris felis lacinia dui, luctus semper elit ipsum at nisi. Integer est purus, finibus eget consectetur nec, aliquet mattis neque. Sed vel luctus est, scelerisque sollicitudin mi. Nam scelerisque ullamcorper lacus, ut laoreet est tincidunt et.\r\n\r\nNullam tempus lobortis bibendum. Vivamus iaculis lectus sed augue pretium cursus. Mauris pellentesque massa ut dui convallis hendrerit. Phasellus ut odio odio. In hendrerit sit amet dolor eget vehicula. Pellentesque vitae rutrum lorem, sit amet lobortis justo. Nunc nec iaculis nunc. Integer id sem non ex consectetur fermentum.\r\n\r\nDonec odio ligula, rhoncus ultricies purus ut, scelerisque consectetur erat. Aenean venenatis suscipit felis. Quisque fringilla condimentum mattis. Nam et lacinia mi, a aliquet arcu. Suspendisse ultricies interdum vehicula. Nulla molestie erat pharetra hendrerit tempor. Fusce porta in libero vitae aliquet. Vivamus elit lectus, consequat non commodo et, lacinia in tortor. Pellentesque odio ex, facilisis porta imperdiet nec, ultrices a velit.\r\n\r\nVestibulum vitae ipsum pharetra, sodales urna id, bibendum nisi. In tincidunt nibh dolor, non accumsan tellus rhoncus sit amet. Pellentesque luctus semper lacus, sed suscipit enim gravida et. Cras imperdiet nunc eu vehicula cursus. Morbi pretium laoreet laoreet. Aenean rutrum eros at massa ultrices laoreet. Cras mi diam, commodo sed lacinia in, convallis luctus libero. Fusce nec aliquet libero. Maecenas est tellus, feugiat at rhoncus vel, viverra vitae ante.\r\n\r\nQuisque felis turpis, laoreet vel leo in, accumsan finibus ante. Vestibulum urna magna, ultricies at orci nec, aliquet blandit diam. Pellentesque commodo ipsum quis ex condimentum, et iaculis justo varius. Nunc ante felis, rutrum ut est vitae, imperdiet blandit tortor. Nullam ac tellus purus. Aenean vel porttitor sapien. Nullam luctus interdum massa, sit amet volutpat massa elementum et. Etiam vitae quam vestibulum, tincidunt metus eget, malesuada leo. Sed id diam tempor, cursus nulla ut, pretium metus. Sed felis massa, porta a ligula vitae, malesuada feugiat mauris. Phasellus hendrerit accumsan congue. Phasellus suscipit interdum sapien, sit amet sodales ipsum placerat vitae.\r\n\r\nAenean ultricies egestas sapien id consectetur. Nullam ornare vestibulum lacus, eget gravida arcu fringilla sit amet. Duis lobortis maximus laoreet. Ut vestibulum metus sed aliquet convallis. Pellentesque ullamcorper at elit iaculis suscipit. Proin quis finibus mi, ut vehicula justo. Maecenas et elit sed lacus dictum imperdiet. Integer vestibulum, magna id elementum lacinia, ex nulla consectetur quam, in pulvinar neque ipsum et est. Curabitur nibh eros, tristique non pulvinar at, dictum sit amet neque. Suspendisse iaculis urna molestie velit sagittis, in tincidunt tortor vehicula. Nulla ligula magna, semper nec tempor et, sodales eget neque. Maecenas malesuada, velit eu sagittis viverra, nisi dui gravida ante, vitae pretium nulla lectus ac justo.\r\n\r\nFusce blandit malesuada urna ut maximus. Phasellus ut diam tortor. Donec in lacus et mauris sagittis vulputate. Donec faucibus viverra eros ut semper. Sed a mattis nisl, id maximus ipsum. Fusce finibus, ligula in ultricies bibendum, felis mi porta nulla, ut dignissim mauris tellus sed nisl. Nullam ultricies neque enim, eget egestas ex finibus at.', NULL, 1, 1, 0),
(8, 7, 'Que es Poo Pourri', 'Donec odio ligula, rhoncus ultricies purus ut, scelerisque consectetur erat. Aenean venenatis suscipit felis. Quisque fringilla condimentum mattis. Nam et lacinia mi, a aliquet arcu. ', '2019-06-12 18:13:03', 'Fusce nunc leo, sodales vel ultricies mollis, consectetur eget dolor. Aenean rutrum, sapien sed rhoncus interdum, odio libero molestie nunc, in interdum mi odio sed lorem. Maecenas dignissim mi sit amet ligula elementum, et tempus nulla elementum. Curabitur pulvinar nisl sed erat rhoncus tristique. Pellentesque vitae nibh at dolor posuere cursus. Curabitur nec quam metus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam vel laoreet dolor. Curabitur efficitur purus vitae gravida pretium. Mauris velit urna, mattis non varius nec, rutrum non sem. Integer lacus ligula, ornare eget pulvinar vitae, pretium placerat dolor.\r\n\r\nNullam dignissim mauris nunc, at vestibulum nisi porta ac. Quisque aliquet eros lorem, egestas porttitor nibh eleifend a. Curabitur vitae lobortis lectus, vitae luctus nunc. Quisque eu magna dapibus, congue enim et, aliquet lectus. Mauris vehicula sem augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Etiam placerat enim ut libero feugiat tempor.', NULL, 1, 0, 0);

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
(5, 'juan daniel', 'snoopdjffny@gmail.com', '0', 'f00fe6ae6cec917d69b08459395a09ccb12580d4397ee1fea9dc0465b25406c98c4b5e22256e624bdfbc111b6697930c262d4fbc0ea4c868d2b7ee5f6df8f5a3', 'autor', 'juan.png', 'hombre', 'Web Developer | Parral, Chihuahua'),
(6, 'moe greene', 'jdmartinez@itparral.edu.mx', '0', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'autor', 'moe.jpg', 'hombre', 'The Corleone Family wants to buy me out? No, I buy you out, you don\'t buy me out.'),
(7, 'virgil sollozzo', 'mtzn_juandaniel@yahoo.com.mx', '0', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'autor', 'default.png', 'hombre', NULL);

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
  MODIFY `id_articulo` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
