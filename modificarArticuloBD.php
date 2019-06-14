<?php
	session_start();
	if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}

require 'private/config.php';

if(filter_input(INPUT_POST, 'editor_content') AND filter_input(INPUT_POST, 'titulo') AND filter_input(INPUT_POST, 'genero')AND filter_input(INPUT_POST, 'extracto') AND filter_input(INPUT_POST, 'id')){


	$enlace = mysqli_connect($db_config['host'], $db_config['user'], $db_config['pass'], $db_config['database']);

if ($enlace->connect_error) {
    die("La conexión falló: " . $enlace->connect_error);
} 

$texto = htmlentities($_POST['editor_content']);


$sql='update articulos set titulo="'.$_POST['titulo'].'", extracto="'.$_POST['extracto'].'", contenido="'.$texto.'", fk_id_categoria="'.$_POST['genero'].'" where id_articulo='.$_POST['id'];


if ($enlace->query($sql) === TRUE) {
    header('Location: profile.php?id='.$_SESSION['usuario']);
} else {
    echo "Error al modificar la base de datos: ";
}

$enlace->close();

} else{

	header('Location: profile.php?id='.$_SESSION['usuario']);
}



?>