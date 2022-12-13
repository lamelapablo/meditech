//funcion para sacar tildes de un string
const removeAccents = (str) => {
    return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
} 

let listaBotonesCancelarTurno = document.querySelectorAll('.btn-cancelar-turno');
let modalCancelarTurno = document.getElementById('modal-cancelar-turno');
let btnCerrarModalTurno = document.getElementById('btn-cerrar-modal-turno');

//cuando se presiona el boton de 'cancelar turno' se abre la pop-up window para confirmar si desea cancelar turno
listaBotonesCancelarTurno.forEach(boton =>{
    boton.addEventListener('click', () =>{
        modalCancelarTurno.showModal();
    });
});

btnCerrarModalTurno.addEventListener('click', () =>{
    modalCancelarTurno.close();
})

let listaBotonesEditarComentarios = document.querySelectorAll('.btn-editar-comentario');
let modalEditarComentarios = document.getElementById('modal-editar-comentarios');
let btnCerrarModalComentarios = document.getElementById('btn-cerrar-modal-comentarios');

//cuando se presiona el boton de 'ver comentarios' se abre la pop-up window para ver comentarios
listaBotonesEditarComentarios.forEach(boton =>{
    boton.addEventListener('click', () =>{
        modalEditarComentarios.showModal();
    });
});


btnCerrarModalComentarios.addEventListener('click', () =>{
    modalEditarComentarios.close();
})

let listaBotonesBuscarPorTurnos = document.querySelectorAll('.btn-buscar-turnos');
let inputBuscarTurnos = document.getElementById('input-buscar-turnos');
var opcionBoton = 'paciente';

let listaPacientesTurnos = document.querySelectorAll('.paciente');
let listaFechasTurnos = document.querySelectorAll('.fecha');

let h3TurnosFuturos = document.getElementById('turnos-f-no-encontrados');
let contenedorTurnosFuturos = document.getElementById('lista-turnos-futuros');
let h3TurnosPasados = document.getElementById('turnos-p-no-encontrados');
let contenedorTurnosPasados = document.getElementById('lista-turnos-pasados');
let h3TurnosDia = document.getElementById('turnos-dia-no-encontrados');
let contenedorTurnosDia = document.getElementById('lista-turnos-dia');


//funcion que al pasarle el ul devuelve una lista con los li que contiene
function lista_turnos(contenedorTurnos){
    let listaTurnos = [];
    contenedorTurnos.childNodes.forEach(turno => {
        if(turno.tagName == 'LI'){
            listaTurnos.push(turno);
        }
    })
    return listaTurnos
}

listaBotonesBuscarPorTurnos[0].classList.add('set-background'); //se selecciona por default el boton de buscar por paciente
//se filtra por default por paciente
filtrar(listaPacientesTurnos)
inputBuscarTurnos.addEventListener('keyup', ()=>{
    filtrar(listaPacientesTurnos);
})


//funcion que dependiendo de la lista de turnos que se le pase muestra un aviso de que no hay turnos para mostrar
function texto_no_hay_resultados(listaTurnos, elementoh3){
    bandera = false
    listaTurnos.forEach(turno => {
        let listaClases = turno.classList;
        if(listaClases.contains('mostrar')){
            bandera = true;
        }
    })

    if(!bandera){
        elementoh3.classList.remove('ocultar');
        elementoh3.classList.add('mostrar');
        
    }
    else{
        elementoh3.classList.remove('mostrar');
        elementoh3.classList.add('ocultar');
    }
}

listaBotonesBuscarPorTurnos.forEach(boton =>{
    //agrego una escucha a cada boton de buscar turno por
    boton.addEventListener('click', () =>{
        //recorro la lista de clases de cada boton para remover de algun otro boton la clase que setea su background
        listaBotonesBuscarPorTurnos.forEach(boton =>{
            listaClasesBoton = boton.classList;
            listaClasesBoton.forEach(clase =>{
                if(clase == 'set-background'){
                    boton.classList.remove('set-background');
                }
            })
        })
        boton.classList.add('set-background'); //seteo el background del boton que fue clickeado
        let textoBoton = boton.innerHTML; //obtengo el texto contenido en el boton
        let ultimaPalabra =  textoBoton.split(" ").slice(-1)[0]; //obtengo la ultima palabra de ese texto
        opcionBoton = removeAccents(ultimaPalabra.toLowerCase()); //almaceno la opcion del boton que se presiono 

        //dependiendo de que boton se encuentre seleccionado se pasa una determinada lista a la funcion filtrar
        switch (opcionBoton){
            case('paciente'):
                inputBuscarTurnos.setAttribute("type", "text")
                filtrar(listaPacientesTurnos);
                inputBuscarTurnos.addEventListener('keyup', ()=>{
                    filtrar(listaPacientesTurnos);
                });             
                break;
            case('fecha'):
                inputBuscarTurnos.setAttribute("type", "date")
                filtrar(listaFechasTurnos);
                inputBuscarTurnos.addEventListener('keyup', ()=>{
                    filtrar(listaFechasTurnos);
                });   
                inputBuscarTurnos.addEventListener('change', ()=>{
                    filtrar(listaFechasTurnos);
                }); 
        }
    })
})

//funcion para obtener el texto de un input
function obtener_texto_input(){
    if(inputBuscarTurnos.getAttribute("type") == "date"){
        var fecha = inputBuscarTurnos.value;
        var resFecha = fecha.split("-");
        var reversedFecha = resFecha.reverse(); 
        var textoInput = reversedFecha.join('/');
    }
    else{
        textoInput = removeAccents(inputBuscarTurnos.value).toLowerCase();
    }
    return textoInput;
}

//funcion para filtrar los turnos que deben o no aparecer en la pantalla y muestra un mensaje si no hay ninguno para mostrar
function filtrar(lista){
    let textoInput = obtener_texto_input();
    lista.forEach(elemento =>{
        textoElemento = removeAccents(elemento.innerHTML.toLowerCase());
        let listItemTurno = elemento.parentNode.parentNode.parentNode;
        if(!textoElemento.includes(textoInput)){
            listItemTurno.classList.remove('mostrar');
            listItemTurno.classList.add("ocultar");
        }
        else{
            listItemTurno.classList.remove('ocultar');
            listItemTurno.classList.add("mostrar");
        }
    })

    listaTurnosFuturos = lista_turnos(contenedorTurnosFuturos);
    texto_no_hay_resultados(listaTurnosFuturos, h3TurnosFuturos);

    listaTurnosPasados = lista_turnos(contenedorTurnosPasados);
    texto_no_hay_resultados(listaTurnosPasados, h3TurnosPasados);

    listaTurnosDia = lista_turnos(contenedorTurnosDia);
    texto_no_hay_resultados(listaTurnosDia, h3TurnosDia);
}
