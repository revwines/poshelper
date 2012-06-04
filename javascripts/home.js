	
$(document).ready(function(){

	$(function() {
		// setup ul.tabs to work as tabs for each div directly under div.panes
		$("#NavTabs").tabs();
	});

	$("#a").click(
			function(){
				alert('test');
				});
});