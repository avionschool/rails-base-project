$(document).ready(function () {
  // Check for click events on the navbar burger icon
  $(".navbar-burger").click(function () {
    // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
    $(".navbar-burger").toggleClass("is-active");
    $(".navbar-menu").toggleClass("is-active");
  });
});

/*===== LINK ACTIVE  =====*/
const linkColor = document.querySelectorAll(".nav__link");
function colorLink() {
  linkColor.forEach((l) => l.classList.remove("active"));
  this.classList.add("active");
}

linkColor.forEach((l) => l.addEventListener("click", colorLink));

// function hideNotice() {
//   setInterval(function () {
//     document.querySelector(".notification").style.display = "none";
//     document.querySelector(".notif").style.display = "none";
//   }, 8000);
// }

// hideNotice();

$(".notification" ).fadeOut(6000);

const margLeft = () => {
  console.log("tae")
  dashboard = document.querySelector(".dashboard");


  if (dashboard.classList.contains("margin-left-none")) {
    dashboard.classList.remove("margin-left-none");
    dashboard.classList.add("margin-left");
  } else {
    dashboard.classList.remove("margin-left")
    dashboard.classList.add("margin-left-none");
  }
}

const toggler = document.getElementById("nav-toggle")

toggler.addEventListener("click", margLeft)

const margLeft2 = () => {
  console.log("tae")
  dashboard = document.querySelector(".dashboard2");


  if (dashboard.classList.contains("margin-left-none2")) {
    dashboard.classList.remove("margin-left-none2");
    dashboard.classList.add("margin-left2");
  } else {
    dashboard.classList.remove("margin-left2")
    dashboard.classList.add("margin-left-none2");
  }
}

const toggler2 = document.getElementById("nav-toggle")

toggler.addEventListener("click", margLeft2)

/*===== EXPANDER MENU  =====*/
const showMenu = (toggleId, navbarId, bodyId) => {
  const toggle = document.getElementById(toggleId),
    navbar = document.getElementById(navbarId),
    bodypadding = document.getElementById(bodyId);

  if (toggle && navbar) {
    toggle.addEventListener("click", () => {
      navbar.classList.toggle("expander");

      bodypadding.classList.toggle("body-pd");
    });
  }
};
showMenu("nav-toggle", "navbar", "body-pd");



let dropdown = document.querySelector('.dropdown');
 const drop = (event) => {
    event.stopPropagation();
    dropdown.classList.toggle('is-active');
}

dropdown.addEventListener('click', drop)
