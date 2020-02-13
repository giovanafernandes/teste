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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require react
//= require react_ujs
//= require jquery3
//= require jquery_ujs
//= require components
//= require bootstrap-datepicker
//= require_tree .

$(document).ready(function() {
		$("#button-collapse").click(() => showMenu());
		$("#settings-btn").click((e) => showSettings(e));

		if($("#empresa-nome").length)
		{
			$("#empresa-nome").keyup(function(e)
			{
				let name = $("#empresa-nome").val();
				if(name == "")
				{
					$("#h4-empresa").html("Sua empresa");
				} else {
					$("#h4-empresa").html(name);
				}
			});
		}

		// function setActive()
		// {
		// 		if($("#active").length)
		// 		{
		// 			let value = $("#active").val();
		// 			$(".menu-item:eq(" + value + ")").addClass("active");
		// 		}
		// }

		function showMenu()
		{
			if($(".button-collapse:eq(0)").hasClass("up"))
			{
				$(".button-collapse:eq(0)").removeClass("up");
				$(".button-collapse:eq(1)").removeClass("down");
				$("#collapse-content").removeClass("show-menu");
			} else {
				$(".button-collapse:eq(0)").addClass("up");
				$(".button-collapse:eq(1)").addClass("down");
				$("#collapse-content").addClass("show-menu");
			}
		}

		function showSettings(evt)
		{
			var elem = $("#settings");
			if(elem.hasClass("menu-hide"))
			{
				elem.removeClass("menu-hide");
			} else {
				elem.addClass("menu-hide");
			}
		}
})
