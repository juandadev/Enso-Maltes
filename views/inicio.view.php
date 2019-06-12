<?php
session_start();

if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}
?>

<main>
    <section class="rank">
        <div class="container">
            <div class="cover">
                <a href="article.php?id=<?php print_r($principal['id_articulo']) ?>"><img src="users/articles/<?php print_r($principal['foto_portada']); ?>" alt="<?php print_r($principal['titulo']); ?>"></a>
            </div>

            <div class="wrap">
                <div class="info">
                    <h3><a href="article.php?id=<?php print_r($principal['id_articulo']) ?>"><?php print_r($principal['titulo']); ?></a></h3>

                    <p><?php print_r($principal['extracto']); ?></p>
                </div>

                <div class="footer-rank">
                    <a href="article.php?id=<?php print_r($principal['id_articulo']) ?>">Seguir leyendo</a>

                    <div class="author">
                        <div class="pic">
                            <img src="users/profile/<?php print_r($principal['foto_perfil']); ?>" alt="<?php print_r($principal['nombre_usuario']); ?>">
                        </div>

                        <p><?php print_r($principal['nombre_usuario']); ?></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="nav-rank">
            <?php foreach($array_posts as $post): ?>
            <div class="nav-rank-item">
                <a href="#"><?php echo $post['titulo']; ?></a>
            </div>
            <?php endforeach; ?>
        </div>
    </section>

    <section class="preview">
        <?php foreach($posts as $post): ?>
        <div class="item-prev">
            <h4><?php echo $post['nombre_categoria']; ?></h4>

            <h3><a href="article.php?id=<?php echo $post['id_articulo'] ?>"><?php echo $post['titulo']; ?></a></h3>

            <p><?php echo $post['extracto']; ?></p>

            <div class="stats">
                <i class="fas fa-eye">
                    <p>1,236</p>
                </i>

                <i class="fas fa-comment-alt">
                    <p>56</p>
                </i>
            </div>

            <div class="author">
                <div class="pic">
                    <img src="users/profile/<?php echo $post['foto_perfil']; ?>" alt="<?php echo $post['nombre_usuario']; ?>">
                </div>

                <p><?php echo $post['nombre_usuario']; ?></p>
            </div>
        </div>
        <?php endforeach; ?>
    </section>

    <?php
        require 'paginacion.php';
        ?>
</main>

<?php
require 'footer.php';
?>

<script src="js/principal.js"></script>
</body>

</html>
