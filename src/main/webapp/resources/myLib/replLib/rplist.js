var rid;
$(function(){
	$('.rpbtn').click(function(){
		rid = $(this).attr('id');
		$('#insert'+rid).show();
	});
	
});// ready



