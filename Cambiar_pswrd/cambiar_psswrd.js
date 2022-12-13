let listaIconoMostrar = document.querySelectorAll('.mostrar');
let listaIconoOcultar = document.querySelectorAll('.ocultar');
let botonConfirmar = document.getElementById('btn-confirmar');

listaIconoMostrar.forEach(icono =>{
    icono.addEventListener('click', ()=>{
        icono.classList.remove('mostrar');
        icono.classList.add('ocultar');

        botonOcultarHermano = icono.nextSibling.nextSibling;
        botonOcultarHermano.classList.remove('ocultar');
        botonOcultarHermano.classList.add('mostrar');

        input = icono.previousSibling.previousSibling;
        input.setAttribute("type", "text");
    })
})

listaIconoOcultar.forEach(icono =>{
    icono.addEventListener('click', ()=>{
        icono.classList.remove('mostrar');
        icono.classList.add('ocultar');

        botonMostrarHermano = icono.previousSibling.previousSibling;
        botonMostrarHermano.classList.remove('ocultar');
        botonMostrarHermano.classList.add('mostrar');

        input = botonMostrarHermano.previousSibling.previousSibling;
        input.setAttribute("type", "password");
    })
})

//validacion del formulario
const COLOR_FONDO_ERROR = '#FFB6C1 ';
const COLOR_BORDE_ERROR = '#FF0000';
const COLOR_FONDO_EDICION = ' #DCDCDC ';
const COLOR_BORDE_EDICION = '#000000';
const COLOR_FONDO_NORMAL = '#FFFFFF';

const RE_VACIO = /^\s*$/;

let inputNuevaPswrd = document.getElementById('nueva-pswrd');
let inputConfirmarPswrd = document.getElementById('confirmar-pswrd');
let form = document.getElementById('form');
let mensajeErrorLargoPswrd = document.getElementsByClassName('tooltiptext')[0];
let mensajeErrorPswrdNoIguales = document.getElementsByClassName('tooltiptext')[1];
let mensajeCompletarCampos = document.getElementById('completar-campos');
let btnCerrarModal = document.getElementById('btn-cerrar');

function validarForm(){
    let res = true;
    if(chequearSiEstaVacio(inputNuevaPswrd) || chequearSiEstaVacio(inputConfirmarPswrd)){
        mensajeCompletarCampos.showModal();
        mensajeCompletarCampos.style.display = 'flex';
        res = false;
    }
    else if(!validar1erInput(inputNuevaPswrd)){
        res = false;
    }
    else{
        if(inputNuevaPswrd.value != inputConfirmarPswrd.value){
            mostrarMensajeError(mensajeErrorPswrdNoIguales);
            cambiarBordeYFondoError(inputConfirmarPswrd);
            res = false;
        }
    }
    return res;
}

btnCerrarModal.addEventListener('click', ()=>{
    mensajeCompletarCampos.close();
    mensajeCompletarCampos.style.display = 'none'
})

validar1erInput(inputNuevaPswrd);
validar2doInput(inputConfirmarPswrd);

function cambiarBordeYFondoError(elemento){
    elemento.style.backgroundColor = COLOR_FONDO_ERROR;
    elemento.style.borderColor = COLOR_BORDE_ERROR;
}

function cambiarBordeYFondoEdicion(elemento){
    elemento.style.backgroundColor = COLOR_FONDO_EDICION;
    elemento.style.borderColor = COLOR_BORDE_EDICION;
}

function cambiarBordeYFondoNormal(elemento){
    elemento.style.backgroundColor = COLOR_FONDO_NORMAL;
    elemento.style.borderColor = COLOR_BORDE_EDICION;
}

function validar1erInput(input){
    let res = true;
    input.addEventListener("blur", ()=>{
        if(largoPswrdNoMayorA6(input)){
            mostrarMensajeError(mensajeErrorLargoPswrd);
            cambiarBordeYFondoError(input);
        }
        else{
            ocultarMensajeError(mensajeErrorLargoPswrd);
            cambiarBordeYFondoNormal(input);
        }
    })
    input.addEventListener("focus", ()=>{
        ocultarMensajeError(mensajeErrorLargoPswrd);
        cambiarBordeYFondoEdicion(input);
        ocultarMensajeError(mensajeErrorPswrdNoIguales);
        cambiarBordeYFondoNormal(inputConfirmarPswrd);
    })
    if(largoPswrdNoMayorA6(input)){
        res = false;
    }
    return res;
}

function validar2doInput(input){
    input.addEventListener('focus', ()=>{
        cambiarBordeYFondoEdicion(input);
        ocultarMensajeError(mensajeErrorPswrdNoIguales);
    })
    
    input.addEventListener('blur', ()=>{
        cambiarBordeYFondoNormal(input);
    })
}

function mostrarMensajeError(mensaje){
    mensaje.classList.remove('ocultar');
}

function ocultarMensajeError(mensaje){
    mensaje.classList.add('ocultar');
}

function chequearSiEstaVacio(input){
    let res = false;
    if(RE_VACIO.test(input.value)){
        res = true;
    }
    return res;
}

function largoPswrdNoMayorA6(input){
    let res = false;
    if(input.value.length < 6){
        res = true;        
    }
    return res;
}