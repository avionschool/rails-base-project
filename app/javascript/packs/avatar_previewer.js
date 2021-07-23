function readURL(input) {
    if (input.files && input.files[0]) {     
        var reader = new FileReader();          
        reader.onload = function(e) {    
            document.getElementById('image-preview').src = e.target.result;
        }           
        reader.readAsDataURL(input.files[0]); // convert to base64 string   
    } 
}

let imageFileField = document.getElementById('image-input');
imageFileField.addEventListener('change', function() {
    readURL(this);
});
