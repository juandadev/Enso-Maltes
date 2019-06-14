<?php
session_start();

if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}
?>

<main>
    <div class="content">
        <h1>Acerca de</h1>
        
        <p>
            ¿Qué o quienes somos Enso Maltés? Realmente no importa, lo importante es que tienes la oportunidad de decir lo que sientes, de que te lean, de no tener miedo a censura.
        </p>

        <p>
            Soy Nadie. ¿Tú quién eres? ¿Eres también un Nadie? Ya somos dos entonces.
        </p>
    </div>
</main>

<?php
require 'views/footer.php';
?>