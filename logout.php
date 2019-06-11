<?php
session_start();

if (isset($_SESSION['usuario'])) {
    session_destroy();
    $_SESSION = array();
    
    header('Location: inicio.php');
} else {
    header('Location: inicio.php');
}
?>