<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link href="node_modules/froala-editor/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="node_modules/froala-editor/js/froala_editor.pkgd.min.js"></script>
    <script src="js/plugins/image.min.js"></script>

    <link href="../css/froala_style.min.css" rel="stylesheet" type="text/css" />

    <title></title>
</head>

<body>



    <?php  
    
    session_start();

if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}
   require 'php/functions.php'; 
require 'private/config.php';
    $con = connection($db_config);
	
    $editA = editar($con, $_GET['idA']);
    $editA = $editA[0];
/*if(filter_input(INPUT_POST, 'modificar')){


		$enlace = mysqli_connect("localhost", $db_config['user'], $db_config['pass'], "enso_maltes");
			
			if ($enlace->connect_error) {
			    die("La conexion falló: " . $conexion->connect_error);
			} 

			$consulta = 'select * from articulos where id_articulo ='.$_POST['modificar'];
			
			$result = $enlace->query($consulta);			

			if ($result->num_rows > 0) {
			    

			    while($row = $result->fetch_assoc()) {

			        echo '	<form  action="modificarArticuloBD.php"  method = "POST" >
   
			<textarea name="titulo"> '.$row["titulo"].'</textarea>

  			<textarea  name = "editor_content"  id = "myEditor" enctype="multipart/form-data">'
  				.$row["contenido"].
  			'</textarea>

  			<textarea name="extracto" placeholder="Opcional: Escriba una breve introducción de su texto">'.$row["extracto"].'</textarea><br>

  			<input type="radio" name="genero" value="1" checked> Arte<br>
  			<input type="radio" name="genero" value="2"> Filosofía<br>
  			<input type="radio" name="genero" value="3"> Ciencia<br>
  			<input type="radio" name="genero" value="4"> Música<br>
  			<input type="radio" name="genero" value="5"> Misticismo<br>
  			<input type="radio" name="genero" value="6"> Tecnología<br>
  			<input type="radio" name="genero" value="7"> Salud<br>
  			<input type="radio" name="genero" value="8"> Política<br>
  			<input type="radio" name="genero" value="9"> Ciencia<br>
  			<input type="radio" name="genero" value="Drogas"> Drogas<br>
  			<input type="hidden" name="id" value='.$row["id_articulo"].'> 
  		
  		<button> Enviar </button> 
	</form>';
			    }
			} else {
			    echo "0 results";
			}
			$enlace->close();
			} else{

	header('Location: modificarArticulos.php');
}*/
?>

    <main>

        <form class="nuevoA" action="modificarArticuloBD.php" method="POST">

            <textarea class="tituloA" name="titulo" placeholder="Título de la entrada"><?php print_r($editA['titulo']); ?></textarea>

            <textarea class="extractoA" name="extracto" placeholder="Opcional: Escriba una breve introducción de su texto"><?php print_r($editA['extracto']); ?></textarea><br>

            <textarea class="contenidoA" name="editor_content" id="myEditor" enctype="multipart/form-data"><?php print_r($editA['contenido']); ?></textarea>

            <div class="categoriaA">
                <input id="arte" type="radio" name="genero" value="4" checked><span class="customRadio"></span><label for="arte">Arte</label>

                <input id="filosofia" type="radio" name="genero" value="3"><span class="customRadio"></span><label for="filosofia">Filosofía</label>

                <input id="ciencia" type="radio" name="genero" value="3"><span class="customRadio"></span><label for="ciencia">Ciencia</label>

                <input id="musica" type="radio" name="genero" value="4"><span class="customRadio"></span><label for="musica">Música</label>

                <input id="misticismo" type="radio" name="genero" value="6"><span class="customRadio"></span><label for="misticismo">Misticismo</label>

                <input id="tecnologia" type="radio" name="genero" value="6"><span class="customRadio"></span><label for="tecnologia">Tecnología</label>

                <input id="salud" type="radio" name="genero" value="5"><span class="customRadio"></span> <label for="salud">Salud</label>

                <input id="politica" type="radio" name="genero" value="2"> <span class="customRadio"></span><label for="politica">Politica</label>

                <input id="drogas" type="radio" name="genero" value="9"><span class="customRadio"></span><label for="drogas">Drogas</label>
            </div>
            
            <input type="hidden" name="id" value="<?php print_r($editA['id_articulo']); ?>">

            <button class="submitA"> Modificar Artículo </button>
        </form>

    </main>


    <script>
        new FroalaEditor('#myEditor', {
            toolbarInline: false,
            imageUploadParam: 'image_param',

            // Set the image upload URL.
            imageUploadURL: 'guardarImagen.php',

            // Additional upload params.
            imageUploadParams: {
                id: 'my_editor'
            },

            // Set request type.
            imageUploadMethod: 'POST',

            // Set max image size to 5MB.
            imageMaxSize: 5 * 1024 * 1024,

            // Allow to upload PNG and JPG.
            imageAllowedTypes: ['jpeg', 'jpg', 'png'],

            events: {
                'image.beforeUpload': function(images) {
                    alert('Before');
                },
                'image.uploaded': function(response) {
                    alert('aquí 1');
                },
                'image.inserted': function($img, response) {
                    // Image was inserted in the editor.
                    alert('aquí 2');
                },
                'image.replaced': function($img, response) {
                    // Image was replaced in the editor.
                    alert('aquí 3');
                },
                'image.error': function(error, response) {
                    // Bad link.
                    alert('aquí 4');
                    if (error.code == 1) {
                        alert('error 1');
                    }

                    // No link in upload response.
                    else if (error.code == 2) {
                        alert('error 2');
                    }

                    // Error during image upload.
                    else if (error.code == 3) {
                        alert('error 3');
                    }

                    // Parsing response failed.
                    else if (error.code == 4) {
                        alert('error 4');
                    }

                    // Image too text-large.
                    else if (error.code == 5) {
                        alert('error 5');
                    }

                    // Invalid image type.
                    else if (error.code == 6) {
                        alert('error 6');
                    }

                    // Image can be uploaded only to same domain in IE 8 and IE 9.
                    else if (error.code == 7) {
                        alert('error 7');
                    }

                    // Response contains the original server response to the request if available.
                }
            }
        });

    </script>

</body>

</html>
