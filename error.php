<?php
require 'private/config.php';

session_start();

if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}
?>

<main>
    <div class="error">
    <?php
    switch ($_GET['e']) {
        case 1:
            echo '<h2>Parece que nadie ha escrito nada aún!</h2>';
            break;
        
        case 2:
            echo '<h2>Parece que el articulo ha sido eliminado o no existe</h2>';
            break;
            
        case 3:
            echo '<h2>El perfil del autor al que intentas ingresar no existe!</h2>';
            break;
            
        case 4:
            echo '<h2>Ups! parece que hubo un error de conexión</h2>';
            break;
        
        case 5:
            echo '<h2>Solo el autor de este artículo lo puede editar!</h2>';
            break;
            
        default:
            echo '<h2>Error desconocido</h2>';
            break;
    }
    ?>
    </div>
</main>

<?php
require 'views/footer.php';
?>