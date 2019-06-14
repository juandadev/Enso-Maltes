<?php
session_start();

if (isset($_SESSION['usuario'])) {
    header('Location: inicio.php');
}

require 'private/config.php';
require 'php/functions.php';

//Los datos se recibieron por via post
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user = filter_var(strtolower($_POST['user']), FILTER_SANITIZE_STRING);
    $email = $_POST['email'];
    $password = $_POST['passw'];
    $confirm = $_POST['confPass'];
    $token = md5($_POST['email']);
        
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
        
        if (mailValidate($email) == false) {
            $errors .= '<li>El correo no es válido</li>';
        }
        
        if (mailExists($email, $con) == true) {
            $errors .= '<li>El correo ya ha sido registrado</li>';
        }
        
//        Hasheando contraseña
        $password = hash('sha512', $password);
        $confirm = hash('sha512', $confirm);
        
        if ($password != $confirm) {
            $errors .= '<li>Las contraseñas deben coincidir</li>';
        }
    }
    
    if ($errors == '') {
//        Insertado usuario en BD
        $statement = $con->prepare("INSERT INTO usuarios (id_usuario, nombre_usuario, correo, contrasena, token) VALUES (null, '$user', '$email', '$password', '$token')");
        $statement->execute();
        
        include("php/envioCorreo.php");
        
        $contenido = '<div>        
        <h1>Hola '.$user.'!</h1>
        
        <p>Agradecemos tu registro a nuestro blog, para verificar que eres humano, por favor verifica tu correo para que puedas tener acceso a tu cuenta en nuestra plataforma.</p>
        
        <p>Ingresa a este enlace para completar el registro:</p>
        
        <a href="'.$db_config['url'].'/activation.php?token='.$token.'">https://ensomaltes.xyz/activation.php?token='.$token.'</a>
        
        <p>Enso Maltés | 2019 &copy; Juan Daniel Martinez Navarro & Francisco Carrillo Ayala</p>
        
    </div>';
        
        $sendMail = new email('Enso Maltés', 'snoopdjffny@gmail.com', '15410596juandaniel16');
        $sendMail->agregar($email, $user);
        
        if ($sendMail->enviar('Prueba de correo', $contenido)) {
            header('Location: msg.php?m=1');
        } else {
            $errors .= '<li>Error al enviar correo de verificación</li>';
            $errors .= '<li>'.$sendMail->ErrorInfo.'</li>';
        }
    }
}

require 'views/registro.view.php';
?>
