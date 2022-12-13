let nombreMedico = document.getElementById('nombre-medico');

let nombreStorage = localStorage.getItem('nombre_medico');

nombreMedico.innerHTML = nombreStorage;

let modalMensajeError = document.getElementById('modal-mensaje-error');
let mensajeError = document.getElementById('mensaje-error')
let btnCerrarModal = document.getElementById('btn-cerrar');
let textoCompletarCampos = 'Faltan completar campos';
let textoFechaInvalida = 'La fecha seleccionada es inválida'

function validarForm(){
    res = false;
    if(validarFecha() && validarHorario()){
        res = true;
    }
    return res;
}

function validarFecha() {
    let campoFechaFormatoIncorrecto = document.getElementById('fecha');
    var fecha = campoFechaFormatoIncorrecto.value;
    var resFecha = fecha.split("-");
    var agno = resFecha[0];
    var mes = resFecha[1];
    var dia = resFecha[2];
    resFecha[0] = mes;
    resFecha[1] = dia;
    resFecha[2] = agno;
    dia = resFecha[0];
    var fechaFormatoDeseado = resFecha.join('/');
    let fechaActual = new Date();
    let fechaIngresada = new Date(fechaFormatoDeseado);
    let res = true;
    if(campoFechaFormatoIncorrecto.value == ''){
        mensajeError.innerHTML = textoCompletarCampos;
        mostrarMensajeError();
        res = false;
    }
    else if(fechaActual > fechaIngresada){
        mensajeError.innerHTML = textoFechaInvalida;
        mostrarMensajeError()
        res = false;
    }
    return res
}

function validarHorario(){
    res = true;
    let horario = document.getElementById('horarios');
    if(horario.value == 'Selecciona un horario'){
        mensajeError.innerHTML = textoCompletarCampos;
        mostrarMensajeError();
        res = false;
    }
    return res;
}

//funcionalidad para mostrar y cerrar la ventana modal
function mostrarMensajeError(){
    modalMensajeError.showModal();
}
btnCerrarModal.addEventListener('click', ()=>{
    modalMensajeError.close();
})