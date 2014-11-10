# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#tweet_input').keypress (evt) ->
  	input = $('#tweet_content').val()
  	if (140 - input.length) < 0
  		alert(input.length)