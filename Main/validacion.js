//Variable del input del email
let emailCampo = document.getElementById('user-email');
//Expresion regular regex para validar el email
const emailRegex = /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/;

let emailError = document.getElementById('error');
let emailPass  = document.getElementById('password');
let modalCampoVacio = document.getElementById('completar-campos');
let btnCerrarModal = document.getElementById('btn-cerrar');

let mensajeError = document.getElementById('mensaje-error');

btnCerrarModal.addEventListener('click', () => {
    modalCampoVacio.close();
})

//funcion que valida el email.
function validateEmail(){
    if(emailRegex.test(emailCampo.value)){
        emailCampo.classList.remove('invalido');
        emailCampo.classList.add('valido');
        emailError.classList.remove('errorTexto');
        emailError.classList.add('validTexto');
        return true;
    }
    else if( emailCampo.value == ''){
        emailCampo.classList.remove('invalido');
        emailCampo.classList.remove('valido');
        emailError.classList.remove('errorTexto');
        emailError.classList.add('validTexto');
        return false;
    }
    else{
        emailCampo.classList.remove('valido');
        emailCampo.classList.add('invalido');
        emailError.classList.add('errorTexto');
        emailError.classList.remove('validTexto');
        return false;
    }
}

function validatePass(){
    if(emailPass.value == ''){
        return false;
    }
    return true;
}

//Llama a la funcion validateEmail con cada tecla ingresada.   
emailCampo.addEventListener('keyup', ()=>{
    validateEmail();
})

function conectAjax() {
	var httpRequest = false;        		 //	CREA EL OBJETO "AJAX".Que es una instancia de XMLHttpRequest.
    										 // Esta funcion es generica para cualquier utilidad 
    if (window.XMLHttpRequest) {             // -> Mozilla, Safari, ...
		httpRequest = new XMLHttpRequest();  
    } else if (window.ActiveXObject) {       // -> IE
		httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return httpRequest;
}

function getDataForm(idForm){
    // obtiene los name y los value de los elementos de un formulario.
    // y retorna un objeto FormData()
    var formData = new FormData();

    data=document.forms[idForm].getElementsByTagName("input");
   
    for (let i=0; i<data.length;i++) {
        if (data[i].name!=undefined && data[i].value!=undefined)
            if (data[i].type=='text' || data[i].type=='password' || data[i].type=='email'){
                formData.append(data[i].name, data[i].value);
            }
    }

    return formData;
}

function consulta_asincrona(url, method='POST'){
    const promise = new Promise((resolve, reject) =>{
        var xhr =  conectAjax();
        var dataForm = getDataForm('login-form');
        if(xhr) {
            xhr.open(method, url, true);                  // false = sincro , true = asincro
            xhr.onreadystatechange = function() {
                if (xhr.readyState!=1) {
                    document.body.style.cursor = 'wait';            // SET ESPERA Cursor mouse en espera
                }
                if (xhr.readyState==4 && xhr.status==200) {                                                
                    document.body.style.cursor = 'default';        // RESET ESPERA Cursor mouse en normal
                    textHTML = xhr.responseText;                   // recupera la respuesta            
                    resolve(textHTML);
                }
            }
            xhr.send(dataForm);
        }
        else{
            console.log('No se pudo instanciar el objeto AJAX!');
            reject('Algo ha salido mal!');
        }

    })

    const promiseResult = promise.then((resolvedResult) => {
        const result = resolvedResult;
        return result;
    }, (rejectedResult) => {
        console.warn(rejectedResult);
    })

    return promiseResult;
}

// Hace que no se pueda enviar el FORM si faltan datos.
async function validarForm(url){
    
    res = false; 
    if(validateEmail() == true && validatePass() == true){

        consultaCredencialesUserLogueandose = await consulta_asincrona(url);

        boolConsulta = Boolean(parseInt(consultaCredencialesUserLogueandose));

        if(! boolConsulta){
            mensajeError.innerHTML = 'Credenciales incorrectas!';
            modalCampoVacio.showModal();
        }
        else{
            window.location.href = 'menu.php';
        }
    }
    else if(emailPass.value == '' || emailCampo.value == ''){
        mensajeError.innerHTML = 'Faltan completar campos!';
        modalCampoVacio.showModal();
    }
    return false;
}

let botonMostrar = document.getElementById('mostrar');
let botonOcultar = document.getElementById('ocultar');
let inputPswrd = document.getElementById('password')

botonMostrar.addEventListener('click', ()=>{
    botonMostrar.classList.remove('mostrar');
    botonMostrar.classList.add('ocultar');
    botonOcultar.classList.remove('ocultar');
    botonOcultar.classList.add('mostrar');

    inputPswrd.setAttribute('type', 'text');
})

botonOcultar.addEventListener('click', ()=>{
    botonOcultar.classList.remove('mostrar');
    botonOcultar.classList.add('ocultar');
    botonMostrar.classList.remove('ocultar');
    botonMostrar.classList.add('mostrar');

    inputPswrd.setAttribute('type', 'password');
})
