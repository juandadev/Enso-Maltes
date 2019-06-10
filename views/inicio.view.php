<?php
require 'header.php';
?>

<main>
    <section class="rank">
        <div class="container">
            <div class="cover">
                <img src="img/og.png" alt="Obito">
            </div>

            <div class="wrap">
                <div class="info">
                    <h3>Óbito</h3>

                    <p>
                        Ya vi a mis amigos en estado putrefacto muchas veces, en una vida compartida
                        de trocito en trocito. Los amigos son de épocas, le dije a Miguel, y lo comprendió a la primera.
                        Ya les vi a todos, ahorcados, ahogados, vomitados boca arriba, con las camas empapadas y las sábanas duras por la sangre seca.
                    </p>
                </div>

                <div class="footer-rank">
                    <a href="#">Seguir leyendo</a>

                    <div class="author">
                        <div class="pic">
                            <img src="img/panero.png" alt="Francisco Panero">
                        </div>

                        <p>Francisco Panero</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="nav-rank">
            <div class="nav-rank-item">
                <a href="#">Las vivencias son para ti, no pa' los demás</a>
            </div>

            <div class="nav-rank-item selected">
                <a href="#">Óbito</a>
            </div>

            <div class="nav-rank-item">
                <a href="#">Vamos a la esquina a fumar unos porros</a>
            </div>

            <div class="nav-rank-item">
                <a href="#">Con timón y en el delirio</a>
            </div>
        </div>
    </section>

    <section class="preview">
        <div class="item-prev">
            <h4>COMIDA</h4>

            <h3>Qué es Poo Pourri y por qué conocerlo</h3>

            <p>
                No hay nada más incómodo que ir al baño en lugares donde el sanitario es compartido. En especial, lugares como la oficina o la escuela. No cabe duda,…
            </p>

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
                    <img src="img/panero.png" alt="Francisco Panero">
                </div>

                <p>Francisco Panero</p>
            </div>
        </div>
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
