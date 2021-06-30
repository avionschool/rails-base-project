document.getElementById("editmodal").addEventListener("click", function() {
  document.getElementById("modalcover").style.display = "flex";
  document.getElementById("modalupdate").style.display = "flex";
});

document.getElementById("modalcover").addEventListener("click", function() {
  document.getElementById("modalcover").style.display = "none";
  document.getElementById("modalupdate").style.display = "none";
});

document.getElementById("closebtn").addEventListener("click", function() {
  document.getElementById("modalcover").style.display = "none";
  document.getElementById("modalupdate").style.display = "none";
});
