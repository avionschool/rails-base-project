document.getElementById("transaction").addEventListener("click", function() {
  var cover = document.getElementById("transaction_cover");
  cover.style.display = "flex";
  cover.setAttribute("value", "1"); 
});

document.getElementById("user").addEventListener("click", function() {
  var cover = document.getElementById("transaction_cover");
  cover.style.display = "none";
  cover.setAttribute("value", "0"); 
});
