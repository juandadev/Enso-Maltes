<?php
session_start();

if (isset($_SESSION['usuario'])) {
    header('Location: inicio.php');
}

require 'php/functions.php';
require 'private/config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $password = $_POST['passw'];
    $password = hash('sha512', $password);
    
    if (empty($_POST['remember'])) {
        
    }
    
    $errors = '';
    
    $con = connection($db_config);
    
    $statement = $con->prepare("SELECT * FROM usuarios WHERE correo = '$email' AND contrasena = '$password'");
    $statement->execute();
    $result = $statement->fetch();
    
    if ($result !== false) {
        $_SESSION['usuario'] = $result['nombre_usuario'];
        header('Location: inicio.php');
    } else {
        $errors .= '<li>Correo o contraseña incorrectos</li>';
    }
}

require 'views/login.view.php';
?>