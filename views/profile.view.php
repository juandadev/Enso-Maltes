<?php
session_start();

if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}
?>

<main>
    <h2><?php print_r($user['nombre_usuario']); ?></h2>
    
    <p><?php print_r($user['correo']); ?></p>
    
    <img src="users/profile/<?php print_r($user['foto_perfil']); ?>" alt="<?php print_r($user['nombre_usuario']); ?>">
    
    <p><?php print_r($user['genero']); ?></p>
    
    <p><?php print_r($user['info_usuario']); ?></p>
</main>

<?php
require 'views/footer.php';
?>