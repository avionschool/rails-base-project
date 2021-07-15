document.getElementById("comment_user").addEventListener("input", function() {
  textArea = document.getElementById("comment_user")
  textArea.style.height = "5px";
  textArea.style.height = (textArea.scrollHeight)+"px";
});


document.querySelectorAll('.edit').forEach(e => {
  e.addEventListener('click', () => {
    hide_elementid = "comment" + e.id;
    show_elementid = "edit" + e.id;
    hide = document.getElementById(hide_elementid);
    show = document.getElementById(show_elementid);
    hide.style.display = "none";
    show.style.display = "block";
  });
});
