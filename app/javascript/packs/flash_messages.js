$(document).on('turbolinks:load', function(){
  $(".alert").delay(3000).slideUp(1500, function(){
    $(".alert").alert('close');
  });
});
