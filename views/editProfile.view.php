<?php
session_start();

if (isset($_SESSION['usuario'])) {
    require 'views/header_logout.php';
} else {
    require 'views/header_login.php';
}
?>

<main>
    <div class="profile_container">
       
       <a href="profile.php?id=<?php print_r($user['id_usuario']); ?>">Volver</a>
        
        <form action="editProfile.php?id=<?php print_r($user['id_usuario']); ?>" method="POST">
            <input type="text" id="nombreU" name="nombreU" class="nombreU" value="<?php print_r($user['nombre_usuario']); ?>">
            
            
            <select name="generoU" id="generoU" class="generoU">
                <option value="hombre" <?php if ($user['genero'] == 'hombre') {echo 'selected';} else {} ?>>Hombre</option>
                <option value="mujer" <?php if ($user['genero'] == 'mujer') {echo 'selected';} else {} ?>>Mujer</option>
                <option value="no definido" <?php if ($user['genero'] == 'no definido') {echo 'selected';} else {} ?>>No definido</option>
            </select>
            
            <textarea name="infoU" id="infoU" cols="30" rows="10" class="infoU"><?php print_r($user['info_usuario']); ?></textarea>
            
            <button class="submitU" id="submitU">Guardar cambios</button>
        </form>
        
        <div class="msg">
            <p><?php echo $msg; ?></p>
        </div>
    </div>
</main>

<?php
require 'views/footer.php';
?>
