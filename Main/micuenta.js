let btnAbrirModal = document.getElementById("contenedor-horario-trabajo"); 
let btnCerrarModal = document.getElementById("btn-cerrar-modal");
let btnConfirmarHorario = document.getElementById("btn-confirmar");
let modal = document.getElementById("modal");



btnAbrirModal.addEventListener("click", ()=>{ 
    modal.showModal();
})

btnCerrarModal.addEventListener("click", ()=>{ 
    modal.close();
})

btnConfirmarHorario.addEventListener("click", ()=>{ 
    modal.close();
})



