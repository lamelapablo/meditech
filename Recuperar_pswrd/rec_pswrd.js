//Expresion regular regex para validar el email
const emailRegex = /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/;

let inputEmail = document.getElementById('email');
let tooltiptext = document.getElementsByClassName('tooltiptext')[0];

function validarMail(){
    let res = true;
    if(inputEmail.value == ''){
        let texto = 'Debe completar el campo';
        tooltiptext.innerHTML = texto;
        tooltiptext.classList.remove('ocultar');
        res = false;
    }
    else if(!emailRegex.test(inputEmail.value)){
        texto = 'Ingrese un email válido';
        tooltiptext.innerHTML = texto;
        tooltiptext.classList.remove('ocultar');
        res = false;
    }
    return res;
}

inputEmail.addEventListener('focus', () =>{
    tooltiptext.classList.add('ocultar');
})

function validarForm(){
    let res = true;
    if(! validarMail()){
        res = false;
    }
    return res;
}