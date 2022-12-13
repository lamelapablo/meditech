<?php 
include '../BaseDatos.php';

function dias_trabajados($conn, $id_user){
    $query = strConsulta($id_user);
    $queryResult = ejecutarSQL($conn, $query);

    $diasTrabajados = array(
        'lunes' => NULL,
        'martes' => NULL,
        'miercoles' => NULL,
        'jueves' => NULL,
        'viernes' => NULL,
        'sabado' => NULL
    );

    while ($row = $queryResult->fetch_assoc()) {             // http://php.net/manual/es/mysqli-result.fetch-assoc.php
        $diasTrabajados[$row['day']] = $row['work_shift']; 
    }

    return $diasTrabajados;
}

function generar_fila($dia, $turno_trabajo){
    $diaCapitalize = ucfirst($dia);

    if($turno_trabajo == NULL){
        $fila = <<<CONTENIDO
        <tr>
            <td class="col-1">{$diaCapitalize}</td>
            <td class="cell">
                <input type="checkbox" class='checkbox' name="{$dia}-TM">            
            </td>
            <td class="cell">
                <input type="checkbox" class='checkbox' name="{$dia}-TT">             
            </td>
        </tr>
        CONTENIDO;
    }
    elseif($turno_trabajo == 'completo'){
        $fila = <<<CONTENIDO
        <tr>
            <td class="col-1">{$diaCapitalize}</td>
            <td class="cell">
                <input type="checkbox" class='checkbox' name="{$dia}-TM" checked>            
            </td>
            <td class="cell">
                <input type="checkbox" class='checkbox' name="{$dia}-TT" checked>             
            </td>
        </tr>
        CONTENIDO;
    }
    elseif($turno_trabajo == 'tarde'){
        $fila = <<<CONTENIDO
        <tr>
            <td class="col-1">{$diaCapitalize}</td>
            <td class="cell">
                <input type="checkbox" class='checkbox' name="{$dia}-TM">            
            </td>
            <td class="cell">
                <input type="checkbox" class='checkbox' name="{$dia}-TT" checked>             
            </td>
        </tr>
        CONTENIDO;
    }
    else{
        $fila = <<<CONTENIDO
        <tr>
            <td class="col-1">{$diaCapitalize}</td>
            <td class="cell">
                <input type="checkbox" class='checkbox' name="{$dia}-TM" checked>            
            </td>
            <td class="cell">
                <input type="checkbox" class='checkbox' name="{$dia}-TT">             
            </td>
        </tr>
        CONTENIDO;  
    }

    return $fila;
}

function generar_tabla($id_user){

    $conn = conectarBD();

    $diasTrabajados = dias_trabajados($conn, $id_user);

    desconectarBD($conn);

    $tabla = <<<CONTENIDO

    CONTENIDO;

    foreach($diasTrabajados as $dia => $turno_trabajo){
        $fila = generar_fila($dia, $turno_trabajo);
        $tabla = $tabla.$fila;
    }

    return $tabla;
}


function strConsulta($id_user){

    $query = "SELECT working_days.day, work_shifts.work_shift FROM users
    INNER JOIN doctors ON users.id = doctors.id_user
    INNER JOIN working_days ON doctors.id = working_days.id_doctor
    INNER JOIN work_shifts ON work_shifts.id = working_days.id_work_shift
    WHERE users.id LIKE {$id_user};";

    return $query;
}

?>