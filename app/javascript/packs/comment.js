document.getElementById("comment_user").addEventListener("input", function() {
  textArea = document.getElementById("comment_user")
  textArea.style.height = "5px";
  textArea.style.height = (textArea.scrollHeight)+"px";
});
