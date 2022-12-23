<?php

include '../BaseDatos.php';

function update_password($conn){
    if(isset($_POST['nueva-pswrd']) && isset($_POST['confirmar-pswrd']) && $_POST['nueva-pswrd'] == $_POST['confirmar-pswrd']) {
        $pswrd = $_POST['nueva-pswrd'];
        $user = $_SESSION['usuario'];
        $user_id = $user['id'];
        
        $sql = "UPDATE users SET password='$pswrd' WHERE id=$user_id";

        $conn->query($sql);
    }
}

function redirect_user(){
    $user = $_SESSION['usuario'];
    if($user['type'] == 'doctor'){
        header('Location: ../Main/mi_cuenta_doctor.php');
    }
    else{
        header('Location: ../Main/mi_cuenta_paciente.php');        
    }
}

function main(){
    $conn = conectarBD();              // conecta a la base de datos

    session_start();

    update_password($conn);

    redirect_user();
    
    desconectarBD($conn);                // desconecta la base de datos
}

main();
?>