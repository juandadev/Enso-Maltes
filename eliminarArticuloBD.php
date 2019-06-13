<?php
session_start();
	//Falta checar la sesión
require 'private/config.php';

if(filter_input(INPUT_POST, 'eliminar')){


	$enlace = mysqli_connect("localhost", $db_config['user'], $db_config['pass'], "enso_maltes");

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