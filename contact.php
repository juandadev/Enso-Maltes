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
        <h1>Contacto</h1>
        
        <p>
            ¿Quieres saber más de nosotros? ¿Qué planeamos a futuro? ¿Cómo va a evolucionar esto? ¿Por qué odiamos la censura? Ponte en contacto con nosotros.
        </p>
        
        <p>Contacto: fcarrillo@itparral.edu.mx</p>
    </div>
</main>

<?php
require 'views/footer.php';
?>