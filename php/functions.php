<?php
//Database connection
function connection($db_config) {
    try {
        $con = new PDO('mysql:host=localhost;dbname='.$db_config['database'].'', $db_config['user'], $db_config['pass']);
        return $con;
    } catch (PDOException $e) {
        echo "Error: ". $e->getMessage();
        return false;
    }
}

function limpiarDatos($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

function actual() {
    return isset($_GET['p']) ? (int)$_GET['p'] : 1;
}

function obtenerPost($post_per_page, $con) {
    $inicio = (actual() > 1) ? actual() * $post_per_page - $post_per_page : 0;
    $sentence = $con->prepare("SELECT categorias.nombre_categoria, articulos.id_articulo, articulos.titulo, articulos.extracto, usuarios.nombre_usuario, usuarios.foto_perfil, articulos.foto_portada FROM articulos INNER JOIN categorias ON articulos.fk_id_categoria=categorias.id_categoria INNER JOIN usuarios ON articulos.fk_id_usuario=usuarios.id_usuario LIMIT $inicio, $post_per_page");
    $sentence->execute();
    return $sentence->fetchAll();
}

function article($id) {
    return (int)limpiarDatos($id);
}

function idPost($con, $id) {
    $result = $con->query("SELECT articulos.titulo, articulos.fecha, articulos.foto_portada, articulos.contenido, usuarios.foto_perfil, usuarios.nombre_usuario FROM articulos INNER JOIN usuarios ON articulos.fk_id_usuario=usuarios.id_usuario WHERE articulos.id_articulo = $id LIMIT 1");
    $result = $result->fetchAll();
    return ($result) ? $result : false;
}

function noPaginas($post_per_page, $con) {
    $total_post = $con->prepare('SELECT COUNT(id_articulo) as total FROM articulos');
    $total_post->execute();
    $total_post = $total_post->fetch()['total'];
    
    $paginas = ceil($total_post / $post_per_page);
    return $paginas;
}

function mailValidate($email) {
    $email = filter_var(strtolower($email), FILTER_SANITIZE_EMAIL);
    
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        return true; 
   	} else { 
      	return false; 
   	} 
}

function mailExists($email, $con) {
    $result = $con->query("SELECT * FROM usuarios WHERE correo = '$email'");
    $result = $result->fetchAll();
    return ($result) ? true : false;
}
?>
