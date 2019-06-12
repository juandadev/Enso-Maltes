//Sticky navbar
window.onscroll = function () {
    stick();
}

var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;
var btnLogin = document.getElementById('btnLogin');

function stick() {
    if (window.pageYOffset > sticky) {
        navbar.classList.add("sticky");
    } else {
        navbar.classList.remove("sticky");
    }
}

//Login button
if (btnLogin == null) {} else {
    btnLogin.addEventListener('click', function () {
        window.location = 'login.php';
    });
}

//Logout button
var btnLogout = document.getElementById('btnLogout');

btnLogout.addEventListener('click', function () {
    window.location = 'logout.php';
});
