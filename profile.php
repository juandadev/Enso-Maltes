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

$posts = postsAutor($id_usuario, $con);

if ($_SERVER['REQUEST_METHOD'] == 'POST' && !empty($_FILES)) {
//    $check = @getimagesize($_FILES['loadImg']['tmp_name']);
    
    if ($_FILES['loadImg']['error'] > 0) {
        $error = 'Ha ocurrido un error al subir la imagen';
    } else {
        $permission = array("image/jpg", "image/jpeg", "image/png");
        
        if (in_array($_FILES['loadImg']['type'], $permission)) {
            $fecha = date("dHi");
            $random = rand(10, 99);
            
            $route = "users/profile/".$fecha.$random.$_FILES['loadImg']['name'];
            
            if (!file_exists($route)) {
                $move = @move_uploaded_file($_FILES['loadImg']['tmp_name'], $route);
                
                if ($move) {
                    $image = $fecha.$random.$_FILES['loadImg']['name'];
                    loadImageProfile($con, $image, $id_usuario);
                    $error = 'La imagen se ha cargado exitosamente!';
                    header('Location: profile.php?id='.$id_usuario);
                } else {
                    $error = 'Ha ocurrido un error al subir la imagen';
                }
            } else {
                $error = $_FILES['loadImg']['name'].", este archivo ya existe";
            }
        } else {
            $error = 'Este tipo de archivo no está permitido';
        }
    }
    
    /*if ($check !== false) {
        $destination = 'users/profile/';
        $uploaded_file = $destination . $_FILES['loadImg']['name'];
        echo $uploaded_file;
    }*/
}

require 'views/profile.view.php';
?>