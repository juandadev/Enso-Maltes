<?php
session_start();
	if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
} 
?>



<form  action="editarArticulo.php"  method = "POST" >

	<?php  
		   
    require 'private/config.php';
    
		$conexion = new mysqli("localhost", $db_config['user'], $db_config['pass'], "enso_maltes");
			
			if ($conexion->connect_error) {
			    die("La conexion falló: " . $conexion->connect_error);
			} 
			//Mostrar los artículos del usuario por su  id guardado en el localStorage

			$consulta = 'select * from articulos where fk_id_usuario = '.$_SESSION['usuario'];
			
			$result = $conexion->query($consulta);			

			if ($result->num_rows > 0) {
			    

			    while($row = $result->fetch_assoc()) {
			    echo'<div id="descripcion">
					<h1 id="titulo"></h1>'
					.$row["titulo"].		
					'<p id="autor">
					Nacho Vegas
					</p>
					<p id="fecha de publicación">'
					.$row["fecha"].
					'</p>
					<p> Modificar artículo
					
					<input type="radio" name="modificar" value='.$row["id_articulo"].'>
					</p>
			
					</div>';
			    }
			} else {
			    echo "0 results";
			}
			$conexion->close();
		?>
		<button> Modificar </button> 
		</form>

</body>
</html>