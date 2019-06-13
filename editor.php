<?php
session_start();

if (isset($_SESSION['usuario'])) {
} else {
    header('Location: inicio.php');
}

require 'private/config.php';
require 'php/functions.php';

$con = connection($db_config);

$cats = categorias($con);
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <link href="node_modules/froala-editor/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="node_modules/froala-editor/js/froala_editor.pkgd.min.js"></script>
    <script src="js/plugins/image.min.js"></script>

    <link href="../css/froala_style.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/principal.css">
</head>

<?php
if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}
?>

<body>

    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v3.3"></script>

    <main>

        <form class="nuevoA" action="guardarInfoBD.php" method="POST">

            <textarea class="tituloA" name="titulo" placeholder="Título de la entrada"></textarea>

            <textarea class="extractoA" name="extracto" placeholder="Opcional: Escriba una breve introducción de su texto"></textarea><br>

            <textarea class="contenidoA" name="editor_content" id="myEditor" enctype="multipart/form-data"> </textarea>

            <div class="categoriaA">
                <?php foreach ($cats as $cat): ?>
                <input id="<?php print_r($cat['nombre_categoria']); ?>" type="radio" name="genero" value="<?php print_r($cat['id_categoria']); ?>" checked><span class="customRadio"></span><label for="<?php print_r($cat['nombre_categoria']); ?>"><?php print_r($cat['nombre_categoria']); ?></label>
                <?php endforeach; ?>
            </div>

            <button class="submitA"> Crear Artículo </button>
        </form>

    </main>


    <script>
        new FroalaEditor('#myEditor', {
            toolbarInline: false,
            imageUploadParam: 'image_param',

            // Set the image upload URL.
            imageUploadURL: 'guardarImagen.php',

            // Additional upload params.
            imageUploadParams: {},

            // Set request type.
            imageUploadMethod: 'POST',

            // Set max image size to 5MB.
            imageMaxSize: 5 * 1024 * 1024,

            // Allow to upload PNG and JPG.
            imageAllowedTypes: ['jpeg', 'jpg', 'png'],

            events: {
                'image.beforeUpload': function(images) {},
                'image.uploaded': function(response) {},
                'image.inserted': function($img, response) {},
                'image.replaced': function($img, response) {},
                'image.error': function(error, response) {
                    // Bad link.
                    if (error.code == 1) {}

                    // No link in upload response.
                    else if (error.code == 2) {}

                    // Error during image upload.
                    else if (error.code == 3) {}

                    // Parsing response failed.
                    else if (error.code == 4) {}

                    // Image too text-large.
                    else if (error.code == 5) {}

                    // Invalid image type.
                    else if (error.code == 6) {}

                    // Image can be uploaded only to same domain in IE 8 and IE 9.
                    else if (error.code == 7) {}

                    // Response contains the original server response to the request if available.
                }
            }
        });

    </script>

    <?php
require 'views/footer.php';
?>
