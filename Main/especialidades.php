<?php
include '../BaseDatos.php';
include 'nav_correspondiente.php';

function get_specialties_with_doctors($conn){
    $specialtiesWithDoctors = array();

    $query = "SELECT users.name, users.surname, specialties.specialty, doctors.id FROM doctors 
    INNER JOIN users ON users.id = doctors.id_user 
    INNER JOIN specialties ON specialties.id = doctors.id_specialty 
    ORDER BY doctors.id;";

    $result = ejecutarSQL($conn, $query);

    while ($row = $result->fetch_assoc()) {
        if(! array_key_exists($row['specialty'], $specialtiesWithDoctors)){
            $specialtiesWithDoctors += [$row['specialty'] => array($row['id'] => $row['name'].' '.$row['surname'])];
        }
        else{
            $specialtiesWithDoctors[$row['specialty']] += [$row['id'] => $row['name'].' '.$row['surname']]; 
        }
    }

    return $specialtiesWithDoctors;
}

function generate_specialties($conn){
    $specialtiesWithDoctors = get_specialties_with_doctors($conn);

    $specialties = <<<PANTALLA
    PANTALLA;

    foreach($specialtiesWithDoctors as $specialty => $arrDoctors){
        $specialties.=
        "<li>
            <div class='list-item-container list-button--click'>
            <p>{$specialty}</p>
            <img class='flecha-menu' src='../iconos/caret-down-solid.svg'>
            </div>";
        foreach($arrDoctors as $id => $name){
            if($id == array_key_first($arrDoctors)){
                $specialties.=
            "<ul class='medicos'>
                <li>
                    <div class='list-item-container'>
                        <p id='{$id}'>Dr/a {$name}</p>
                        <a href='pedirTurno.html'>
                            <button class='btn-pedir-turno'>Pedir Turno</button>
                        </a>
                    </div>
                </li>";
            }
            elseif($id == array_key_last($arrDoctors)){
                $specialties.=
                "<li>
                    <div class='list-item-container'>
                        <p id='{$id}'>Dr/a {$name}</p>
                        <a href='pedirTurno.html'>
                            <button class='btn-pedir-turno'>Pedir Turno</button>
                        </a>                            
                    </div>
                </li>
            </ul>
        </li>";
            }
            else{
                $specialties.=
                "<li>
                    <div class='list-item-container'>
                        <p id='{$id}'>Dr/a {$name}</p>
                        <a href='pedirTurno.html'>
                            <button class='btn-pedir-turno'>Pedir Turno</button>
                        </a>                            
                    </div>
                </li>";
            }
        }
    }

    return $specialties;
}

function imprimir_pantalla($conn){
    $specialties = generate_specialties($conn);
    $user = $_SESSION['usuario'];
    $type = $user['type'];
    $nav = nav_correspondiente($type);

    $html = <<<PANTALLA
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="normalize.css">
        <link rel="stylesheet" type="text/css" href="header.css">
        <link rel="stylesheet" type="text/css" href="footer.css">
        <link rel="stylesheet" type="text/css" href="especialidades.css">
        <link rel="stylesheet" type="text/css" href="nav.css">
        <link rel="stylesheet" type="text/css" href="../iconos/iconos.css">
        <link rel="icon" href="../imagenes/icono.ico">
        <title>Portal de Salud Meditech</title>
    </head>
    <body>
        <header>
            <a href="menu.html">
                <img id="headerlogo" src='../imagenes/LOGO HEADER.png'>
            </a>
            <img class='icono' id='btn-menu' src='../iconos/bars-solid.svg'>
        </header>

        <div class="menu-flex">
            {$nav}
            <section id="contenido">
                <ul id="lista-especialidades">
                    {$specialties}
                </ul>
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
        <script type="text/javascript" src="especialidades.js"></script>
    </body>
    </html>
    PANTALLA; 

    echo($html);
}

function main(){
    session_start();

    $conn = conectarBD();

    imprimir_pantalla($conn);

    desconectarBD($conn);  
}

main();
?>