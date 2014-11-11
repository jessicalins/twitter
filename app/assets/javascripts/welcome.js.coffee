# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#tweet_input').keypress ->
  	input = $('#tweet_content').val().length
  	limit = $('#tweet_content').attr('maxlength') 
  	remain = limit - input
  	$('#counter_text').text(remain)