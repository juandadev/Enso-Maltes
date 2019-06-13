<?php
session_start();

if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}
?>

<main>
    <div class="profile_container">
        <div class="editar_foto">
            <div class="pp">
                <img src="users/profile/<?php print_r($user['foto_perfil']); ?>" alt="<?php print_r($user['nombre_usuario']); ?>">
            </div>

            <?php if ($_SESSION['usuario'] == $user['id_usuario']): ?>
            <button class="load_p"><i class="fas fa-edit"></i></button>
            <?php endif; ?>
        </div>

        <h2><?php print_r($user['nombre_usuario']); ?></h2>

        <p><?php print_r($user['correo']); ?></p>

        <p class="gender"><?php print_r($user['genero']); ?></p>

        <div class="info_autor">
            <p><?php print_r($user['info_usuario']); ?></p>
        </div>

        <?php if ($_SESSION['usuario'] == $user['id_usuario']): ?>
        <a href="editProfile.php">Editar datos</a>
        <?php endif; ?>
    </div>

    <?php if ($posts): ?>
    <section class="preview">
        <?php foreach ($posts as $post): ?>
        <div class="item-prev">
            <h4><a href=""><?php print_r($post['nombre_categoria']); ?></a></h4>

            <h3><a href="article.php?id=<?php print_r($post['id_articulo']); ?>"><?php print_r($post['titulo']); ?></a></h3>

            <p><?php print_r($post['extracto']); ?></p>

            <div class="stats">
                <i class="fas fa-eye">
                    <p><?php print_r($post['visitas']); ?></p>
                </i>

                <i class="fas fa-comment-alt">
                    <p>0</p>
                </i>
            </div>

            <?php if ($_SESSION['usuario'] == $user['id_usuario']): ?>
            <div class="controlA">
                <a href="editarArticulo.php?idA=<?php print_r($post['id_articulo']); ?>">Editar</a>
                <a href="eliminarArticuloBD.php?idA=<?php print_r($post['id_articulo']); ?>">Eliminar</a>
            </div>
            <?php endif; ?>
        </div>
        <?php endforeach; ?>
        <?php else: ?>
        <h2 class="no_p">No hay articulos de este usuario todvía!</h2>
        <?php endif; ?>
    </section>
</main>

<?php
require 'views/footer.php';
?>
