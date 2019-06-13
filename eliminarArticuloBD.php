<?php
			session_start();
	if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}

if(filter_input(INPUT_POST, 'eliminar')){


	$enlace = mysqli_connect("localhost", "root", "root", "enso_maltes");

if ($enlace->connect_error) {
    die("La conexión falló: " . $enlace->connect_error);
} 

//guardar el id del autor default

$sql = 'delete from articulos where id_articulo ='.$_POST['eliminar'];


if ($enlace->query($sql) === TRUE) {
    header('Location: eliminarArticulo.php');
} else {
    echo "Error al eliminar de la base de datos: ";
}

$enlace->close();

} else{

	echo "Los datos están vacios";
}



?>