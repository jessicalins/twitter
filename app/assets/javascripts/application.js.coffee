//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
//= require jquery.infinitescroll
$(document).ready ->
	$("#tweets .page").infinitescroll
	  navSelector: "nav.pagination" 
	  nextSelector: "nav.pagination a[rel=next]" 
	  itemSelector: "#tweets tr.tweet" 
