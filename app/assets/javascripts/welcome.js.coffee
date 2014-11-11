# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
	if $('#tweet_content').val().length == 0
		$('#tweet_button').prop 'disabled', true

	$('#tweet_input').keyup ->
  	input = $('#tweet_content').val().length
  	limit = $('#tweet_content').attr('maxlength') 
  	remain = limit - input
  	$('#counter_text').text(remain)

	  if remain == 0 || input == 0
	  	$('#tweet_button').prop 'disabled', true
	  else 
	  	$('#tweet_button').prop 'disabled', false