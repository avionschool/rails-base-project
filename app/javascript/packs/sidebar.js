window.onload = (event) => {
  containers = document.querySelectorAll(".container")
  var index = 0, length = containers.length;
  for ( ; index < length; index++) {
    containers[index].style.marginLeft = "15rem";
  }
};
