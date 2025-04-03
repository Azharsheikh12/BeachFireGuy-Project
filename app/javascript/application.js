// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Application } from "stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

const application = Application.start()
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

import "@hotwired/turbo-rails"
import "controllers"
// import 'bootstrap';
import "popper"
import "bootstrap"
require("bootstrap-datepicker")
require("jquery")

//= require jquery3
//= require bootstrap-datepicker

//= require jquery3
//= require jquery_ujs
//= require_tree .

//= require bootstrap-datepicker


$(document).ready(function() {
  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd',
    autoclose: true
  });
});


//= require jquery
//= require ahoy
//
// NEW (add these two lines)
//= require moment
//= require bootstrap-datetimepicker
//
//= require_tree 

//= require owl.carousel.min.js
//= require jquery.min.js
//= require popper.min.js
//= require bootstrap.min.js

