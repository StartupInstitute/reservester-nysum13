# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

//= require jquery.multi-select


# alert("from coffee file START");
$(document).ready ->
  $.noConflict()
  $("#restaurant_categories").multiSelect()
  # alert "from coffee file END"
