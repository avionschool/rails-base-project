function navbarscroll () {
  var bodyElement = document.querySelector("body");
  var navbar = document.getElementById("navbar");
  this.scrollY > 300 ? navbar.style.opacity = 1 : navbar.style.opacity = 0;
}
window.addEventListener("scroll", navbarscroll , false);