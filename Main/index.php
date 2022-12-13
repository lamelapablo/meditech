<?php
function chequear_user_logueado(){
    session_start();

    if(isset($_SESSION['usuario'])){
        header('Location: ../usuario medico/menu.html');
    }
    else{
        header('Location: login.html');
    }
} 

function main(){
    chequear_user_logueado();
}

main();

?>