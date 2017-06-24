// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require tether
//= require bootstrap-sprockets
//= require gritter
//= require turbolinks
//= require_tree .


//jQuery Turbolinks doesn't support ready events bound via $(document).on('ready', function). 
//Instead, use $(document).ready(function) or $(function).

$(document).ready(function() {

  $( "body" ).on( "click", "#ShiftButton", function(event) {
    $("#chartdiv").toggle();
    if($("#ShiftButton").text() === "Add Definition") {
      $("#ShiftButton").text("I do not know the definition");
    } else {
      $("#ShiftButton").text("Add Definition") ;
    }
  });
});

$(function() {
	//alert("dom is loaded"); works!

	// ajax call on pagination link

	//$("body").on("click",  ".words_ajax .pagination a", function(){
	//	$.getScript(this.href);

	$("body").on("click", "#words_ajax .pagination a", function() { //.On is the official replacement for .Live
		//alert("click works!"); //works the first time the page is loaded
		$(".pagination").html("Page is loading..."); //works the first time the page is loaded
		$.getScript(this.href); //is equivalent to $.get(this.href, null, null, "script");
		return false;
	});
	// ajax call on search form
	$("#words_search input").keyup(function() {
		$.get($("#words_search").attr("action"), $("#words_search").serialize(), null, "script");
		return false;
	});
});

// dataType "script" => "Evaluates the response as JavaScript and returns it as plain text. " 
// so how do I get rails to render js?
