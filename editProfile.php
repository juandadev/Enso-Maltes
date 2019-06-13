<?php
error_reporting(0);
require 'private/config.php';
require 'php/functions.php';

$con = connection($db_config);

if ($_GET['id']) {
    $user = idUser($con, $_GET['id']);
    $user = $user[0];
    
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        editProfile($con, $_GET['id'], $_POST['nombreU'], $_POST['generoU'], $_POST['infoU']);
        echo $_POST['nombreU'];
        echo $_POST['generoU'];
        echo $_POST['infoU'];
        
        header('Location: profile.php?id='.$_GET['id']);
    } else {
    }
} else {
    header('Location: inicio.php');
}

require 'views/editProfile.view.php';
?>