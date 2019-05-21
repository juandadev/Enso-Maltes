# Enso Maltés

## Plan de Diseño

* Usuario super Dios
* Usuarios no registrados
* Usuarios registrados
* Usuarios no registrados pero que se le va a enviar el boletín


### Página de incio
* registrarse
* información de la página
* rankin de blog
	* 5 más votados de la semana
	* 5 más votados del mes
	* 5 más votados de siempre
        *  por usuario
        *  por entrada al blog
* Iniciar sesión
* Escribir una nueva entrada
* Sección para recibir el boletín
* Buscar
	* Con un text area para buscar blogs por tags

### Usuarios que escriben
* Mostrar información de los usuarios
* Mostrar los usuarios con blogs más famosos

### Registrarse
* Pedir informacion al usuario
	* correo
	* nombre
	* usuario
	* contraseña
	* foto de perfil
	* Tipo de blog
	* Acerca del autor		
		* después de registrarse mandar correo de confirmación
		* después de confirmar la cuenta devolver a la página de inicio

### Inicio de sesión
* Correo y contaseña
* Validar los datos desde la base de datos
* Mandar a incio al usuario

### Escribir una entrada
* Validar que sea un usuario registrado
* Mandar a página editor de texto
	* Lo que se escriba guardarse en la base de datos
		* Opción de poner fotos en el texto o sólo poder cambiar la del banner
		* Elegir los tags del contenido
		* Publicar
* Mandar boletín semanal de entradas publicadas a los usuarios que lo soliciten
    * Después de publicar la entrada, mandar al perfil del autor (visto desde el cliente)

### Perfil del autor (vista desde el cliente)
* Mostrar las entradas del autor
	* Mostrarlas por rankin
* Mostrar la información del autor

### Los blogs
* Poder cambiar de blogs
	* los blogs que se irán mostrando serían por rankin
	* En caso de que se encuentre en el perfil del usuario se irán mostrando por rankin del usuario
* Sección de comentarios
* Calificar al usuario
	* Pueden calificar usuarios registrados y no registrados
* Denunciar

### Boletín semanal
* Información de qué es esto
* Pedir correo para mandar el boletín por correo
* Enviar correo de confirmación
	* Después de confirmar el correo, devolver al usuario a la página de inicio	

### Denuncias
* Información
* Editor de texto
	* Escribirá las razones y estas serán enviadas a nuestro correo, nosotros revisaremos las demandas de los usuarios y a - nuestro criterio veremos si dejamos la entrada o la damos de baja
		* Después de escribir y mandar al correo la denuncia, volver a la entrada que estaba viendo el usuario

### Perfil del autor (vista desde el servidor)
* Mostrar las entradas del autor
	* Tener la opción de eliminar las entradas
* editar perfil
* Recuperar contraseña
	* Después de mandar el correo de verificación para recuperar la contraseña devolver al perfil del autor (visto del lado servidor)
* Cerrar sesión
	* Después de cerrar sesión mandar a la página de inicio

### Editar perfil
* Dar la opción de editar la siguiente información del usuario
	* nombre
	* usuario
	* contraseña
        * contraseña anterior y nueva
	* recuperar contaseña
	* foto de perfil
	* Tipo de blog
	* Acerca del autor		
        * después de registrarse mandar correo de confirmación
        * después de confirmar la cuenta devolver a la página perfil del autor (vista desde el lado del servidor)
* Eliminar cuenta
* Radio Button para dejar de recibir o recibir boletín

### Recuperar contraseña
* Pedir el correo
	* Revisar si el correo está en la base de datos, en caso de que no mostrar mensaje de usuario no registrado
* Pedir nueva contraseña
* Enviar correo de confirmación
	* Después de confirmar correo actualizar contraseña
		* Devolver al perfil del usuario (visto desde el lado del servidor)

### Eliminar cuenta
* Pedir contraseña
	* Confirmar que quiere eliminar cuenta
	* Si no, devolver al perfil del usuario (visto desde el lado del servidor)
		* Mandar al inicio de la página
        
### Base de datos:

#### Usuario
`id_usuario INT NOT NULL AUTO_INCREMENT PK`

`correo VARCHAR (76) NOT NULL`

`nombre_usuario (16)	NOT NULL`

`tipo_usuario ('administrador','autor') NOT NULL DEFAULT 'mortal',`

`contrasena VARCHAR(16)	NOT NULL`

`info_autor VARCHAR(1000)`

`foto_perfil VARCHAR (45)`

`genero ENUM('femenino' , 'masculino') NOT NULL DEFAULT 'femenino'`

`activo TINYINT(4) NOT NULL DEFAULT '1'`

`verificado TINYINT(4) NOT NULL DEFAULT '0'`

`codigo_verificacion VARCHAR(45) DEFAULT NULL`

`fecha_hora_registro DATETIME NOT NULL`

`codigo_recuperacion VARCHAR(45) DEFAULT NULL`

`fecha_hora_recuperacion DATETIME DEFAULT NULL`

`PRIMARY KEY ('id'),`

`UNIQUE KEY 'correo_UNIQUE' ('correo')`

#### Blog
`id INT(11) NOT NULL AUTO_INCREMENT`

`id_usuario INT(11) NOT NULL`

`titulo VARCHAR(45) NOT NULL`

#### Artículos
`id_articulo INT AUTO INC NOT NULL PK;`

`titulo VARCHAR(100) NOT NULL;`

`nombre_usuario VARCHAR(16);`

`foto_portada VARCHAR (45);`

`fecha DATE NOT NULL;`

`genero VARCHAR(20);`

Crear cuenta con la opción de recibir boletín, si desea o no, quitar la opción de no crear usuario como autor para recibir boletín