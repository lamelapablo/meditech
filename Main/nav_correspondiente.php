<?php

function nav_correspondiente($user_type){
    $nav_doctor = <<<NAV
    <nav class="container-menu">
        <ul> 
            <a href="menu.php">
                <li>
                    <img class='icono' src="../iconos/house-solid.svg">
                    <p>Menu</p>
                </li>
            </a>
            <a href="turnos_doctor.php">
                <li>
                    <img class= 'icono' src="../iconos/calendar-check-solid.svg">
                    <p>Turnos</p> 
                </li>
            </a> 
            <a href="mi_cuenta_doctor.php">
                <li>
                    <img class='icono' src="../iconos/circle-user-solid.svg">
                    <p>Mi Cuenta</p> 
                </li>
            </a>
        </ul>        
    </nav> 
    NAV;

    $nav_patient = <<<NAV
    <nav class="container-menu">
        <ul> 
            <a href="menu.php">
                <li>
                    <img class='icono' src="../iconos/house-solid.svg">
                    <p>Menu</p>
                </li>
            </a>
            <a href="turnos_paciente.html">
                <li>
                    <img class= 'icono' src="../iconos/calendar-check-solid.svg">
                    <p>Turnos</p> 
                </li>
            </a> 
            <a href="especialidades.php">
                <li>
                    <img class='icono' src="../iconos/user-doctor-solid.svg">
                    <p>Especialidades</p> 
                </li>
            </a>
            <a href="mi_cuenta_paciente.php">
                <li>
                    <img class='icono' src="../iconos/circle-user-solid.svg">
                    <p>Mi Cuenta</p> 
                </li>
            </a>
        </ul>        
    </nav>
    NAV;

    $nav = NULL;

    if($user_type == 'doctor'){
        $nav = $nav_doctor;
    }
    else{
        $nav = $nav_patient;
    }

    return $nav;
}

?>