<?php
session_start();

if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}
?>

<main>
    <div class="articulo">
        <div class="portada">
            <img src="users/articles/<?php echo $post['foto_portada']; ?>" alt="<?php echo $post['titulo']; ?>">
        </div>
        <h2 class="article_title"><?php echo $post['titulo']; ?></h2>
        
        <p class="fecha"><?php echo $post['fecha']; ?></p>

        <div class="author">
            <div class="pic">
                <img src="users/profile/<?php echo $post['foto_perfil']; ?>" alt="<?php echo $post['nombre_usuario']; ?>">
            </div>

            <p><?php echo $post['nombre_usuario']; ?></p>
        </div>

        <p class="content"><?php echo $post['contenido']; ?></p>

    </div>
</main>

<script src="js/principal.js"></script>

<?php
require 'footer.php';
?>
