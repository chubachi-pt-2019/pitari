# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready () ->
    $("#pitari-help-container").click () ->
        $(this).hide()
    $("#pitari-help").click () ->
        $("#pitari-help-container").toggle()