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
    </div>
</main>

<?php
require 'views/footer.php';
?>