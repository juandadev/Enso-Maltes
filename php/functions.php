<?php
//Database connection
function connection($db_config) {
    try {
        $con = new PDO('mysql:host='.$db_config['host'].';dbname='.$db_config['database'].'', $db_config['user'], $db_config['pass']);
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
    $sentence = $con->prepare("SELECT usuarios.id_usuario, categorias.nombre_categoria, articulos.id_articulo, articulos.titulo, articulos.extracto, articulos.visitas, usuarios.nombre_usuario, usuarios.foto_perfil, articulos.foto_portada FROM articulos INNER JOIN categorias ON articulos.fk_id_categoria=categorias.id_categoria INNER JOIN usuarios ON articulos.fk_id_usuario=usuarios.id_usuario LIMIT $inicio, $post_per_page");
    $sentence->execute();
    return $sentence->fetchAll();
}

function article($id) {
    return (int)limpiarDatos($id);
}

function profile($id) {
    return (int)limpiarDatos($id);
}

function idPost($con, $id) {
    $result = $con->query("SELECT usuarios.id_usuario, articulos.titulo, articulos.fecha, articulos.foto_portada, articulos.contenido, usuarios.foto_perfil, usuarios.nombre_usuario FROM articulos INNER JOIN usuarios ON articulos.fk_id_usuario=usuarios.id_usuario WHERE articulos.id_articulo = $id LIMIT 1");
    $result = $result->fetchAll();
    return ($result) ? $result : false;
}

function idUser($con, $id) {
    $result = $con->query("SELECT * FROM usuarios WHERE id_usuario = '$id'");
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

function postsAutor($id, $con) {
    $result = $con->prepare("SELECT articulos.id_articulo, articulos.fk_id_usuario, articulos.titulo, articulos.extracto, articulos.visitas, categorias.nombre_categoria FROM articulos INNER JOIN categorias ON articulos.fk_id_categoria = categorias.id_categoria WHERE fk_id_usuario = $id");
    $result->execute();
    return $result->fetchAll();
}

function contarVisitas($id, $con) {
    $result = $con->prepare("SELECT * FROM articulos WHERE id_articulo = $id");
    $result->execute();
    $result = $result->fetchAll();
    
    $visita = $result[0];
    $contar = $visita['visitas'] + 1;
    
    $result = $con->prepare('UPDATE articulos SET visitas = '.$contar.' WHERE id_articulo = '.$id);
    $result->execute();
    
    return $visita;
}

function editar($con, $id) {
    $result = $con->prepare("SELECT * FROM articulos WHERE id_articulo = $id");
    $result->execute();
    return $result->fetchAll();
}

function categorias($con) {
    $result = $con->prepare("SELECT * FROM categorias");
    $result->execute();
    return $result->fetchAll();
}
?>
