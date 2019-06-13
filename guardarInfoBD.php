<?php
	session_start();
	if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}

if(filter_input(INPUT_POST, 'editor_content') AND filter_input(INPUT_POST, 'titulo') AND filter_input(INPUT_POST, 'genero') AND filter_input(INPUT_POST, 'extracto')){


	$enlace = mysqli_connect("localhost", "root", "root", "enso_maltes");

if ($enlace->connect_error) {
    die("La conexión falló: " . $enlace->connect_error);
} 

$texto = htmlentities($_POST['editor_content']);

//guardar el id del autor default

		

		$sql = 'insert into articulos (id_articulo, fk_id_usuario, titulo, extracto, fecha, contenido, foto_portada, fk_id_categoria, visitas, comentarios) values (default, "'.$_SESSION['usuario'].'", "'.$_POST['titulo'].'", "'.$_POST['extracto'].'", current_timestamp, "'.$texto.'", null, "'.$_POST['genero'].'", 0, 0)';
		echo $sql;


if ($enlace->query($sql) === TRUE) {
    header('Location: inicio.php');
} else {
    echo "Error al cargar los datos: ";
}

$enlace->close();

} else{

	echo 'los datos están vacios';
}



?>