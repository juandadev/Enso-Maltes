var btnInicio = document.getElementById('visit');
btnInicio.addEventListener('click', function () {
    window.location = "inicio.html";
});

//Menú desplegable
var btnOpen = document.getElementById('open');
var btnClose = document.getElementById('close');
var sideNav = document.getElementById('sidenav');

btnOpen.addEventListener('click', function () {
    sideNav.style.width = "100%";
});

btnClose.addEventListener('click', function () {
    sideNav.style.width = "0";
});
