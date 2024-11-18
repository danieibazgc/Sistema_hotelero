let arrow = document.querySelectorAll(".arrow");

for (var i = 0; i < arrow.length; i++) {
    arrow[i].addEventListener("click", (e) => {
        let arrowParent = e.target.parentElement.parentElement; // Selecciona el contenedor principal del icono de la flecha
        arrowParent.classList.toggle("showMenu"); // Cambia class.toggle a classList.toggle
    });
}


let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".bx-menu");
console.log(sidebarBtn);
sidebarBtn.addEventListener("click",()=>{
    sidebar.classList.toggle("close");
});


