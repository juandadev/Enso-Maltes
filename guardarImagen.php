<?php 
	$target_dir = "imagenes/";
	$target_file = $target_dir . basename($_FILES["image_param"]["name"]);


	if (move_uploaded_file($_FILES["image_param"]["tmp_name"], $target_file)) {
    	$rutaImg= array('link' => $target_file);
    	echo json_encode($rutaImg);     
    } else {
        echo "Ups! Ocurrió un error al subir tu foto.";
    }
 ?>