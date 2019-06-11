//Sticky navbar
window.onscroll = function() {
    stick();
}

var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;

function stick() {
    if (window.pageYOffset >= sticky) {
        navbar.classList.add("sticky");
    } else {
        navbar.classList.remove("sticky");
    }
}

//Login button
var btnLogin = document.getElementById('btnLogin');

btnLogin.addEventListener('click', function() {
    window.location = 'login.php';
});

//Logout button
var btnLogout = document.getElementById('btnLogout');

btnLogout.addEventListener('click', function() {
    window.location = 'logout.php';
});