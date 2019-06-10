<?php
//Database connection
function connection($db_config) {
    try {
        $con = new PDO('mysql:host=localhost;dbname='.$db_config['database'].'', $db_config['user'], $db_config['pass']);
        return $con;
    } catch (PDOException $e) {
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
    $sentence = $con->prepare("SELECT categorias.nombre_categoria, articulos.titulo, articulos.extracto, usuarios.nombre_usuario, autores.foto_perfil, articulos.foto_portada FROM articulos INNER JOIN categorias ON articulos.fk_id_categoria=categorias.id_categoria INNER JOIN autores ON articulos.fk_id_autor=autores.id_autor INNER JOIN usuarios ON autores.fk_id_usuario=usuarios.id_usuario LIMIT $inicio, $post_per_page");
    $sentence->execute();
    return $sentence->fetchAll();
}

function article($id) {
    return (int)limpiarDatos($id);
}

function idPost($con, $id) {
    $result = $con->query("SELECT articulos.titulo, articulos.fecha, articulos.foto_portada, articulos.contenido, autores.foto_perfil, usuarios.nombre_usuario FROM articulos INNER JOIN autores ON articulos.fk_id_autor=autores.id_autor INNER JOIN usuarios ON autores.fk_id_usuario=usuarios.id_usuario WHERE articulos.id_articulo = $id LIMIT 1");
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
?>
