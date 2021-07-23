$(function () {
    const output = document.getElementById('img_prev');
    // Multiple images preview in browser
    var imagesPreview = function(input, placeToInsertImagePreview) {
        $(placeToInsertImagePreview).empty()
        if (input.files) {
            var filesAmount = input.files.length;

            for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();

                reader.onload = function(event) {
                    $($.parseHTML('<img>')).attr('src', event.target.result).addClass('tour_img').appendTo(placeToInsertImagePreview);
                }

                reader.readAsDataURL(input.files[i]);
            }
        }

    };

    $('#tour_images').on('change', function() {
        imagesPreview(this, 'div.images-container');
    });
    $('#images-prev').on("click", function (event) {
        $('img.active').removeClass('active')
        $(event.target).closest("img").toggleClass("active");
        console.log(output);
        output.src = $(event.target).closest("img").attr('src')
    });



});