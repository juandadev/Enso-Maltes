<?php
session_start();

if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}

require 'private/config.php';
require 'php/functions.php';

$con = connection($db_config);
$statement = $con->prepare("SELECT * FROM usuarios WHERE token = '".$_GET['token']."'");
$statement->execute();
$result = $statement->fetch();

if ($result != false) {
    $statement = $con->prepare("UPDATE usuarios SET verificado = '1' WHERE token = '".$_GET['token']."'");
    $statement->execute();
    
    $msg = 'Tu cuenta ha sido verificada exitosamente! ahora ya puedes <a href="'.$db_config['url'].'/login.php">Iniciar sesión</a>!';
} else {
    $msg = 'El link de verificación ha expirado!';
}

require 'private/config.php';
?>

<main>
    <h2><?php echo $msg; ?></h2>
</main>

<?php
require 'views/footer.php';
?>