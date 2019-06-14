<?php
session_start();

if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}

require 'private/config.php';
?>

<main>
    <?php
    switch ($_GET['m']) {
        case 1:
            echo '<h2 class="msgH">Se ha enviado un correo de verificación en la dirección proporcionada</h2><br/><br/><p class="msgP">Por favor verifica tu correo para poder <a class="msgA" href="'.$db_config['url'].'/login.php">Iniciar sesión</a>.</p>';
            break;
    }
    ?>
</main>

<?php
require 'views/footer.php';
?>