function readURL(input) {
    if (input.files && input.files[0]) {
        for (let i = 0; i < input.files.length; i++) {
            var reader = new FileReader();
            var img = document.createElement('img');
            img.setAttribute("style","width:100px; height:auto;");
            console.log(input.files[i])
    
            reader.addEventListener("load", function () {
                var image = new Image();
                image.width = 100;
                image.title = input.name;
                image.src = this.result;
                imagePreviewContainer.appendChild(image);
              }, false);

            reader.readAsDataURL(input.files[i]); // convert to base64 string
            
        }
    } 
}

const imagePreviewContainer = document.getElementById('image-preview-container');
const imageFileField = document.getElementById('image-input');
imageFileField.addEventListener('change', function() {  
    readURL(this);
});

