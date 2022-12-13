<?php

include 'nav_correspondiente.php';
include 'dias_trabajados.php';


function calcular_edad($born_date){
    $today = date("Y-m-d");

    $diff = date_diff(date_create($born_date), date_create($today));
    
    return $diff->format('%y');
}

function mostrar_pantalla(){

    $user = $_SESSION['usuario'];

    $id = $user['id'];
    $nombre = $user['name'];
    $apellido = $user['surname'];
    $email = $user['email'];
    $edad = calcular_edad($user['born_date']);
    $telefono = $user['phone_number'];
    $dni = $user['dni'];

    $type = $user['type'];
    $nav = nav_correspondiente($type);

    $tabla = generar_tabla($id);

    $pantalla = <<<MICUENTA
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="normalize.css">
        <link rel="stylesheet" type="text/css" href="header.css">
        <link rel="stylesheet" type="text/css" href="footer.css">
        <link rel="stylesheet" type="text/css" href="../iconos/iconos.css">
        <link rel="stylesheet" type="text/css" href="micuenta_doctor.css">
        <link rel="stylesheet" type="text/css" href="nav.css">
        <link rel="stylesheet" href="tabla.css">
        <link rel="icon" href="../imagenes/icono.ico">
        <title>Portal de Salud Meditech</title>
    </head>
    <body>
        <dialog id="modal">
            <form method="#">
                <table>
                    <tr>
                        <th>Días:</th>
                        <th>Turno Mañana (7:00 a 12:00)</td>
                        <th>Turno Tarde (13:00 a 20:00)</th>
                    </tr>
                    {$tabla}
                </table>
                <input type="submit" class='btn-modal' id="btn-confirmar" value="Confirmar">
                <button type='reset' class='btn-modal' id="btn-cerrar-modal">Cerrar</button>
            </form>
        </dialog>
        <header>
            <a href="menu.html">
                <img id="headerlogo" src='../imagenes/LOGO HEADER.png'>
            </a>
            <img class='icono' id='btn-menu' src='../iconos/bars-solid.svg'>
        </header>
        <div class="menu-flex">
            {$nav}
            <section id="contenido">
                <h2>Mi Cuenta</h2>
                <div id="contenedor-datos">
                    <form id="form-agregar-foto">
                        <div id="contenedor-agregar-foto">
                            <input type="file" capture='user' title="Agregar Foto" accept="image/*">
                        </div>
                        <input id='btn-guardar-cambios' type="submit" value="Guardar cambios">
                    </form>
                    <div id="contenedor-info-usuario">
                        <div>
                            <h3>Nombre: {$nombre}</h3>
                            <h3>Apellido: {$apellido}</h3>
                            <h3>Mail: {$email}</h3>
                        </div>
                        <div>
                            <h3>Edad: {$edad}</h3>
                            <h3>Telefono: {$telefono}</h3>
                            <h3>DNI: {$dni}</h3>
                        </div>
                    </div>
                </div>
                <div id="contenedor-cambiar-datos">
                    <a class='btn-cambiar-datos' href="../Cambiar_pswrd/cambiar-contraseña.html">
                        <img src="../imagenes/icono-cambio-de-contraseña.png">
                        <p>Cambiar mi contraseña</p>
                    </a>
                    <div class='btn-cambiar-datos' id="contenedor-horario-trabajo">
                        <img src="../iconos/icono.calendario.png">
                        <p>Horario de Trabajo</p>
                    </div>
                    <a class='btn-cambiar-datos' href="../Main/cerrar-sesion.php">
                        <img src="../iconos/right-from-bracket-solid.svg">
                        <p>Cerrar sesión</p>
                    </a>
                </div>
            </section>
        </div>
        <footer>
            <div id="contenedor-footer">
                <section id="ayuda">
                    <p>Servicio al cliente:</p>
                    <div>
                        <img class='icono' src="../iconos/clock-regular.svg">
                        <p>Horario de atencion: 8:00 hs - 18:00 hs</p>
                    </div>
                    <div>
                        <img class='icono' src="../iconos/envelope-regular.svg">
                        <a id="mail" href="mailto:soporte@meditech.com">Enviar un email</a>
                    </div>
                    <div>
                        <img class='icono' src="../iconos/phone-solid.svg">
                        <p>Télefono de contacto: 0800-11-3825-0894</p>
                    </div>
                </section>
                <section id='social'>
                    <ul>
                        <li>
                            <img class='icono' src="../iconos/instagram.svg">
                            <a href="http://instagram.com">Instagram</a></li>
                        <li>
                            <img class='icono' src="../iconos/square-twitter.svg">
                            <a href='http://twitter.com'>Twitter</a>
                        </li>
                        <li>
                            <img class='icono' src="../iconos/facebook.svg">
                            <a href='http://facebook.com'>Facebook</a>
                        </li>
                    </ul>
                </section>
            </div>
            <section id="legal">
                <p>&#169 Copyright 2022 - Todos los derechos reservados</p>
            </section>
        </footer>
        <script type="text/javascript" src="micuenta.js"></script>
        <script type="text/javascript" src="nav-responsive.js"></script>
    </body>
    </html>
    MICUENTA;

    echo($pantalla);
}


function main(){
    session_start();
    
    mostrar_pantalla();

}

main()
?>