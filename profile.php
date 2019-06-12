<?php
require 'private/config.php';
require 'php/functions.php';

$con = connection($db_config);
$id_usuario = profile($_GET['id']);

if (!$con) {
    header('Location: error.php?e=4');
}

if (empty($id_usuario)) {
    header('Location: inicio.php');
}

$user = idUser($con, $id_usuario);
$user = $user[0];

if (!$user) {
    header('Location: error.php?e=3');
}

require 'views/profile.view.php';
?>