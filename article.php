<?php
require 'private/config.php';
require 'php/functions.php';

$con = connection($db_config);
$id_articulo = article($_GET['id']);

if (!$con) {
    header('Location: error.php?e=4');
}

if (empty($id_articulo)) {
    header('Location: inicio.php');
}

$post = idPost($con, $id_articulo);

if (!$post) {
    header('Location: error.php?e=2');
}

$post = $post[0];

contarVisitas($id_articulo, $con);


require 'views/article.view.php';
?>