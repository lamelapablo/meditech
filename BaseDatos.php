<?php

// https://www.w3schools.com/php/php_ref_mysqli.asp

function getStringConnection(){    
    // obtiene el string de conexión y lo retorna
    // arreglo asociativo con los datos de la conexión
    $arrSConn = array( 
        "servername"  => "localhost",
        "username"    => "root",
        "password"    => "",
        "dbname"      => "meditech",
    );
    return $arrSConn;
}

function conectarBD() {              
    //La función realiza la conexion y la retorna 
    // obtiene el string de conexión
    $arrSConn = getStringConnection();
    // Crear conexión
      $conn = new mysqli($arrSConn["servername"],
                         $arrSConn["username"],
                         $arrSConn["password"],
                         $arrSConn["dbname"]
                        );
    // Checkear conexión
    if ($conn->connect_error) {
        die("Conexion fallida: " . $conn->connect_error);
    } 
    // retornar la conexión 
    return $conn;

}

function ejecutarSQL($conn, $sql) {  
    // realiza una consutla y retorna el resultado
    // realiza una consulta sql $sql a un coneccion $conn  
    $result = $conn->query($sql);
    // retornar el resultado
    return $result;
}
function desconectarBD($conn){       
    // desconecta la conexión a una base de datos
    // cerrar conexión
    $conn->close();
}

?>




