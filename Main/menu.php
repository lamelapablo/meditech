<?php

include 'nav_correspondiente.php';

function mostrar_pantalla(){

    $user = $_SESSION['usuario'];

    $name = $user['name'];
    $type = $user['type'];
    $nav = nav_correspondiente($type);

    $pantalla = <<<MENU
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="normalize.css">
        <link rel="stylesheet" type="text/css" href="footer.css">
        <link rel="stylesheet" type="text/css" href="header.css">
        <link rel="stylesheet" type="text/css" href="menu.css">
        <link rel="stylesheet" type="text/css" href="nav.css">
        <link rel="stylesheet" type="text/css" href="../iconos/iconos.css">
        <link rel="icon" href="../imagenes/icono.ico">
        <title>Portal de Salud Meditech</title>
    </head>
    <body>
        <header>
            <a href="menu.php">
                <img id="headerlogo" src='../imagenes/LOGO HEADER.png'>
            </a>
            <img class='icono' id='btn-menu' src='../iconos/bars-solid.svg'>
        </header>
        <div class="menu-flex">
            {$nav}
            <section id="contenido">
                <div class="carrusel">
                    <h2>Bienvenido/a {$name}</h2>
                    <div class="grande">
                        <img src="../imagenes/hospital1.png" alt="Imagen1" class="img">
                        <img src="../imagenes/hospital2.png" alt="Imagen2" class="img">
                    </div>

                    <ul class="puntos">
                        <li class="punto activo"></li>
                        <li class="punto"></li>
                    </ul>
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
        <script type="text/javascript" src="nav-responsive.js"></script>
        <script type="text/javascript" src="carrusel.js"></script>
    </body>
    </html>
    MENU;

    echo($pantalla);
}


function main(){
    session_start();
    
    mostrar_pantalla();

}

main()
?>