<?php $paginas = noPaginasAutor($blog_config['posts_per_page'], $con, $id_usuario); ?>

<section class="paginacion">
    <ul>
        <?php if(actual() === 1): ?>
        <li class="disabled">
            <i class="fas fa-chevron-circle-left"></i>
        </li>
        <?php else: ?>
        <li>
            <a href="inicio.php?id=<?php echo $id_usuario ?>&p=<?php echo actual() - 1; ?>">
                <i class="fas fa-chevron-circle-left"></i>
            </a>
        </li>
        <?php endif; ?>

        <?php for($i = 1; $i <= $paginas; $i++): ?>

            <?php if(actual() === $i): ?>
            <li>
                <a href="perfil.php?id=<?php echo $id_usuario ?>&p=<?php echo $i; ?>">
                    <div class="circle actual"></div>
                </a>
            </li>
            <?php else: ?>
            <li>
                <a href="profile.php?id=<?php echo $id_usuario ?>&p=<?php echo $i; ?>">
                    <div class="circle"></div>
                </a>
            </li>
            <?php endif; ?>

        <?php endfor; ?>

        <?php if(actual() == $paginas): ?>
        <li class="disabled">
            <i class="fas fa-chevron-circle-right"></i>
        </li>
        <?php else: ?>
        <li>
            <a href="perfil.php?p=<?php echo actual() + 1; ?>">
                <i class="fas fa-chevron-circle-right"></i>
            </a>
        </li>
        <?php endif; ?>

    </ul>
</section>