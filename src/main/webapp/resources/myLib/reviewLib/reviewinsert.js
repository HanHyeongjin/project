$(function() {
	$('.resets').click(function() {
		$('.s').removeClass("star");
		$('#display').val("0");

	
	$('#s1').hover(function() {
		$(this).addClass("star");
		$('#display').val("1");
	}, function() {
		$('.s').removeClass("star");
		$('#display').val("0");
	});
	
	$('#s2').hover(function() {
		$('#s1').addClass("star");
		$(this).addClass("star");
		$('#display').val("2");
	}, function() {
		$('.s').removeClass("star");
		$('#display').val("0");
	});
	
	$('#s3').hover(function() {
		$('#s1').addClass("star");
		$('#s2').addClass("star");
		$(this).addClass("star");
		$('#display').val("3");
	}, function() {
		$('.s').removeClass("star");
		$('#display').val("0");
	});

	$('#s4').hover(function() {
		$('#s1').addClass("star");
		$('#s2').addClass("star");
		$('#s3').addClass("star");
		$(this).addClass("star");
		$('#display').val("4");
	}, function() {
		$('.s').removeClass("star");
		$('#display').val("0");
	});

	$('#s5').hover(function() {
		$('#s1').addClass("star");
		$('#s2').addClass("star");
		$('#s3').addClass("star");
		$('#s4').addClass("star");
		$(this).addClass("star");
		$('#display').val("5");
	}, function() {
		$('.s').removeClass("star");
		$('#display').val("0");
	});

	$('#s1').click(function() {
		$('.s').off();
		$(this).addClass("star");		
		$('#display').val("1");
	});
	

	$('#s2').click(function() {
		$('.s').off();
		$('#1').addClass("star");		
		$(this).addClass("star");
		$('#display').val("2");
	});
	

	$('#s3').click(function() {
		$('.s').off();
		$('#1').addClass("star");
		$('#2').addClass("star");	
		$(this).addClass("star");
		$('#display').val("3");
	});
	

	$('#s4').click(function() {
		$('.s').off();
		$('#1').addClass("star");
		$('#2').addClass("star");
		$('#3').addClass("star");	
		$(this).addClass("star");
		$('#display').val("4");
	});
	

	$('#s5').click(function() {
		$('.s').off();
		$('#1').addClass("star");
		$('#2').addClass("star");
		$('#3').addClass("star");
		$('#4').addClass("star");
		$(this).addClass("star");
		$('#display').val("5");
	});
	
	});

}); //ready