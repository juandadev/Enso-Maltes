<?php
require 'private/config.php';

session_start();

if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}
?>

<main>
    <div class="error">
        <h2>Ups! algo ha salido mal</h2>
    </div>
</main>

<?php
require 'views/footer.php';
?>