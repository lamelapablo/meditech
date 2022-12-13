let listaElementos = document.querySelectorAll('.list-button--click')

listaElementos.forEach(listaElemento => {
    listaElemento.addEventListener('click', () => {
        listaElemento.classList.toggle('girar-flecha');

        let altura = 0;
        let menu = listaElemento.nextElementSibling;

        if(menu.clientHeight == '0'){
            altura = menu.scrollHeight;
        }

        menu.style.height = altura + 'px';

    });
});

let listaBotones = document.querySelectorAll('.btn-pedir-turno')

listaBotones.forEach(boton => {
    boton.addEventListener('click', () => {
        nodoPadre = boton.parentNode;
        nombreMedico = nodoPadre;
        while(nombreMedico.previousSibling.innerHTML == undefined){
            nombreMedico = nombreMedico.previousSibling;
        }

        nombreMedico = nombreMedico.previousSibling.innerHTML;
        localStorage.setItem('nombre_medico', nombreMedico);

    });
});

