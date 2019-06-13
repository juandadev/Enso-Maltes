<?php
session_start();

if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}
?>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v3.3"></script>

<main>
    <div class="articulo">
        <div class="portada">
            <img src="users/articles/<?php echo $post['foto_portada']; ?>" alt="<?php echo $post['titulo']; ?>">
        </div>
        <h2 class="article_title"><?php echo $post['titulo']; ?></h2>
        
        <p class="fecha"><?php echo $post['fecha']; ?></p>

        <div class="author">
            <div class="pic">
                <a href="profile.php?id=<?php echo $post['id_usuario']; ?>"><img src="users/profile/<?php echo $post['foto_perfil']; ?>" alt="<?php echo $post['nombre_usuario']; ?>"></a>
            </div>

            <p><?php echo $post['nombre_usuario']; ?></p>
        </div>

        <?php echo html_entity_decode($post['contenido']); ?>

    </div>
    
    <?php
    echo '<div class="fb-comments" data-href=http://localhost'.$_SERVER["REQUEST_URI"].' data-width="100%" data-numposts="10"></div>';
    ?>
</main>

<script src="js/principal.js"></script>

<?php
require 'footer.php';
?>
