<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <link rel="stylesheet" href="css/login-register.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link rel="icon" href="img/favicon/64px.ico" sizes="64x64">
    <link rel="icon" href="img/favicon/32px.ico" sizes="32x32">
    <link rel="icon" href="img/favicon/16px.ico" sizes="16x16">

    <title>Enso Maltés | Registro</title>
</head>

<body>
    <main>
        <div class="cover">
            <img src="img/halcon.png" alt="Enso Maltés Logo">
        </div>

        <div class="form">
            <header>
                <a href="inicio.php">Volver</a>
            </header>

            <div class="data">
                <h1>Registrarse</h1>

                <!--                Redireccionando a sí mismo-->
                <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST" class="login" id="login">
                    <label>USUARIO
                        <input type="text" name="user">
                    </label>

                    <label>CORREO
                        <input type="mail" name="email">
                    </label>

                    <label>CONTRASEÑA
                        <input type="password" name="passw">
                    </label>

                    <label>CONFIRMAR CONTRASEÑA
                        <input type="password" name="confPass">
                    </label>

                    <?php if(!empty($errors)): ?>
                    <div class="errors">
                        <ul>
                            <?php echo $errors; ?>
                        </ul>
                    </div>
                    <?php endif; ?>

                    <div class="buttons">
                        <button type="button" class="btn" id="btnLogin">INICIAR SESIÓN</button>

                        <button type="submit" class="active" id="btnRegister">REGISTRARSE</button>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <script src="js/register.js"></script>
</body>

</html>
