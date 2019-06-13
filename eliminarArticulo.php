<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
		<style>
		#descripcion{
			background-color:green;
			width: 31%;
			height: 45%;
			display: inline-block;
			margin-right: 1%;
			margin-left: 1%;
			margin-top: 1%;
			margin-bottom: 1%;
}</style>
	<title></title>
</head>
<body>
<form  action="eliminarArticuloBD.php"  method = "POST" >
	<?php  
		session_start();
	if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}
		$conexion = new mysqli("localhost", "root", "root", "enso_maltes");
			
			if ($conexion->connect_error) {
			    die("La conexion falló: " . $conexion->connect_error);
			} 
			//Mostrar los artículos del usuario por su id guardado en el localStorage

			$consulta = 'select * from articulos where fk_id_usuario='.$_SESSION['usuario'];
			
			$result = $conexion->query($consulta);			

			if ($result->num_rows > 0) {
			    

			    while($row = $result->fetch_assoc()) {
			    	


			        echo '
		
			          
		<div id="descripcion">
		<h1 id="titulo"></h1>'
			.$row["titulo"].		
		'<p id="autor">
			Nacho Vegas
		</p>

		<p id="fecha de publicación">'
				.$row["fecha"].
		'</p>
		<p id="genero"></p>
		<p> Eliminar artículo
		
		<input type="radio" name="eliminar" value="'.$row["id_articulo"].'">
		</p>	
		
		</div>
		
		';
			    }
			} else {
			    echo "0 results";
			}
			$conexion->close();
		?>

		<button> Eliminar </button> 
		</form>

</body>
</html>