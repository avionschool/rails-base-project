document.getElementById("modalcover").addEventListener("click", function() {
  document.getElementById("modalcover").style.display = "none";
  document.getElementById("modaltopup").style.display = "none";
});

document.getElementById("closebtn2").addEventListener("click", function() {
  document.getElementById("modalcover").style.display = "none";
  document.getElementById("modaltopup").style.display = "none";
});

document.getElementById("topup").addEventListener("click", function() {
  document.getElementById("modalcover").style.display = "flex";
  document.getElementById("modaltopup").style.display = "flex";
});
