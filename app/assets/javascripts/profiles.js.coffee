# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#profiles').imagesLoaded ->
    $('#profiles').masonry
      itemSelector: '.box'
      isFitWidth: true

#Interval to the carousel

# $('.carousel').carousel({
#  interval: 2000
#	})