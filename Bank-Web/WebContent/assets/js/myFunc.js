/**
 * 
 */
$(document).ready(function() {

	$('#homeLogo').hover(function() {
		$(this).animate({
			padding : '0%'
		})
	}, function() {
		$(this).animate({
			padding: '5%'
		})
	})
})