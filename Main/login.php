<?php

include '../BaseDatos.php';

function buscar_user($result){
    //print(var_dump ($result));           // descomentar por si quiero debuguear
    //die();
    $usuario = array(
        'id' => NULL,
        'name' => NULL,
        'surname' => NULL,
        'email' => NULL,
        'password' => NULL,
        'born_date' => NULL,
        'image' => NULL,
        'phone_number' => NULL,
        'dni' => NULL,
        'type' => NULL
    );
                        
    while ($row = $result->fetch_assoc()) {             // http://php.net/manual/es/mysqli-result.fetch-assoc.php
        $usuario['id'] = $row['id'];
        $usuario['name'] = $row['name'];
        $usuario['surname'] = $row['surname'];
        $usuario['email'] = $row['email'];
        $usuario['password'] = $row['password'];
        $usuario['born_date'] = $row['born_date'];
        $usuario['image'] = $row['image'];
        $usuario['phone_number'] = $row['phone_number'];
        $usuario['dni'] = $row['dni'];
    }

    return $usuario;
}

function strConsulta($tabla, $atributo, $campo){

    $query = "SELECT * FROM $tabla WHERE $atributo LIKE '$campo';";

    return $query;
}

function iniciarSesion($usuario){    
    $_SESSION['usuario'] = $usuario;
    $_SESSION['instante'] = time();
}

function loguear($conn){
    
    $email=$_REQUEST['userEmail'];
    $pass=$_REQUEST['password'];        // obtengo de la BD el pass correspondiente 
    
    $queryForUser = strConsulta('users', 'email', $email);         // carga el texto con la consulta sql
    $resultForUser = ejecutarSQL($conn, $queryForUser); // ejecuta la consulta sql
    $usuario = buscar_user($resultForUser);

    if($usuario['id'] != NULL and $usuario['password'] == $pass){
        $queryForDoctor = strConsulta('doctors', 'id_user', $usuario['id']);
        $resultForDoctor = ejecutarSQL($conn, $queryForDoctor);
        $usuario = verificar_es_doctor($usuario, $resultForDoctor);
        iniciarSesion($usuario);
        echo(json_encode(array("credenciales" => true)));
    }
    else{
        echo(json_encode(array("credenciales" => false)));
    } 
}

function verificar_es_doctor($usuario, $result){
    if ($result->fetch_assoc() != NULL) {             // http://php.net/manual/es/mysqli-result.fetch-assoc.php
        $usuario['type'] = 'doctor';
    }
    else{
        $usuario['type'] = 'patient';
    }

    return $usuario;
}

function main(){
    $conn = conectarBD();              // conecta a la base de datos

    session_start();

    if(isset($_SESSION['usuario'])){
        echo(json_encode(array("credenciales" => true)));
    }
    else{
        if(isset($_REQUEST['userEmail']) && isset($_REQUEST['password']) ) {            
            loguear($conn);     
        }
    }
    
    desconectarBD($conn);                // desconecta la base de datos
}
main();
?>