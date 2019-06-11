<?php
session_start();

if (isset($_SESSION['usuario'])) {
    header('Location: inicio.php');
}

require 'private/config.php';
require 'php/functions.php';
//Los datos se recibieron por via get
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user = filter_var(strtolower($_POST['user']), FILTER_SANITIZE_STRING);
    $email = $_POST['email'];
    $password = $_POST['passw'];
    $confirm = $_POST['confPass'];
    
    $errors = ''; //Almacena los mensajes de error
    
    if (empty($user) || empty($email) || empty($password) || empty($confirm)) {
        $errors .= '<li>Debes rellenar todos los campos</li>';
    } else {
        $con = connection($db_config);
        $statement = $con->prepare("SELECT * FROM usuarios WHERE nombre_usuario = '$user' LIMIT 1");
        $statement->execute();
        $result = $statement->fetch();
        
        if ($result != false) {
            $errors .= '<li>El nombre de usuario ya está en uso</li>';
        }
    }
}

require 'views/registro.view.php';
?>