const botonMenu = document.getElementById('btn-menu');
const menuContainer = document.getElementsByClassName('container-menu')[0];

botonMenu.addEventListener('click', ()=>{
    let altura = 0;
    if(menuContainer.firstElementChild.clientHeight == 0){
        altura = menuContainer.firstElementChild.scrollHeight;
        botonMenu.style.transform = ('rotate(90deg)');       
    }
    else{
        botonMenu.style.transform = ('unset');
    }  

    menuContainer.firstElementChild.style.height = altura + 'px';
});

