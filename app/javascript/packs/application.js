// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//Password Toggle for Login
document.addEventListener('turbolinks:load', function () {
    let pwToggle = document.getElementById('pw-toggle')
    function togglePW(){
        let passField = document.getElementById('buyer_password');
            if(passField.type === 'password') {
                passField.type = 'text';
            } else {
                passField.type = 'password';
        }
    }
    pwToggle.addEventListener ('click', togglePW, false)
})

document.addEventListener('turbolinks:load', function () {
    let pwToggle = document.getElementById('pw-toggle')
    function togglePW(){
        let passField = document.getElementById('broker_password');
            if(passField.type === 'password') {
                passField.type = 'text';
            } else {
                passField.type = 'password';
        }
    }
    pwToggle.addEventListener ('click', togglePW, false)
})

document.addEventListener('turbolinks:load', function () {
    let pwToggle = document.getElementById('pw-toggle')
    function togglePW(){
        let passField = document.getElementById('admin_password');
            if(passField.type === 'password') {
                passField.type = 'text';
            } else {
                passField.type = 'password';
        }
    }
    pwToggle.addEventListener ('click', togglePW, false)
})
//End of Password Toggle for Login
