const grande  = document.querySelector('.grande')
const punto   = document.querySelectorAll('.punto')
const imagen  = document.querySelectorAll('.img')

// cuando click punto
    //saco posicion del punto
    //translateX de foto
    //cambia la clase de punto activo
    //punto activo al click

punto.forEach (( cadaPunto, i ) => { 
    punto[i].addEventListener('click',()=>{

        let posicion = i

        let operacion = posicion * -51

        grande.style.transform = `translateX(${ operacion }%)`

        punto.forEach( ( cadaPunto, i )=>{
            punto[i].classList.remove('activo')
        })
        punto[i].classList.add('activo')
    })
})