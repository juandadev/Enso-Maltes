<?php
session_start();
	//Falta checar la sesión
require 'private/config.php';

if(filter_input(INPUT_GET, 'idA')){


	$enlace = mysqli_connect($db_config['host'], $db_config['user'], $db_config['pass'], $db_config['database']);

if ($enlace->connect_error) {
    die("La conexión falló: " . $enlace->connect_error);
} 

//guardar el id del autor default

$sql = 'delete from articulos where id_articulo ='.$_GET['idA'];


if ($enlace->query($sql) === TRUE) {
    header('Location: profile.php?id='.$_SESSION['usuario']);
} else {
    echo "Error al eliminar de la base de datos: ";
}

$enlace->close();

} else{

	header('Location: profile.php?id='.$_SESSION['usuario']);
}



?>