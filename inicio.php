<?php
require 'private/config.php';
require 'php/functions.php';

$con = connection($db_config);

if (!$con) {
    header('Location: error.php');
}

$posts = obtenerPost($blog_config['posts_per_page'], $con);
$principal = $posts[0];

if (!$posts) {
    header('Location: error.php');
}

require 'views/inicio.view.php';
?>