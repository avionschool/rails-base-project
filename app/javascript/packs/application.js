// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "@fortawesome/fontawesome-free/css/all"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import 'bootstrap'
import 'jquery'
import '../stylesheets/application'
import '../stylesheets/navbar'
// import '../stylesheets/normalize'

// document.addEventListener('turbolinks:load', () => {
//      $('[data-toggle="tooltip"]').tooltip()
//      $('[data-toggle="popover"]').popover()
// })

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
