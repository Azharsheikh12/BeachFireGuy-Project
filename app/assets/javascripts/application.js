import 'bootstrap'; 
import '@popperjs/core';
//= require jquery3
//= require jquery-ui
//= require jquery
//= require bootstrap-datepicker	
//= require jquery_ujs


/*
 *= require jquery-ui
 */ 


$(document).ready(function() {
  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd',
    autoclose: true
  });
});

//= require owl.carousel.min
//= require bootstrap.bundle.min
//= require main


