 var reCheck=false;
var id
var rid;
var bid;

	$(function () {		
		
		
		$('.rpbtn').click(function(){
		rid = $(this).attr('id');
		$('#insert'+rid).show();
	});
	
	$('.viewrrpl').click(function(){
		id = $(this).attr('id');
		if($('#div'+id).html() == ''){
			
		$.ajax({
			type:"get",
			url:"rreplist",
			data:{
				root:$('#no'+id).val()
			},
			success:function(result){
			
			$('#div'+id).html(result);
		},
		error:function(){
			
		}			
		});//ajax
		
		$(this).html("▲ 답글 숨기기");		
	}else{
		$(this).html("▼ 답글 보기");	
		$('#div'+id).html("");
	}
	}); //click
		
		
				
		$('.rrepl').focus(function() {
			
			rid = $(this).attr('id');
			$(this).css({
				borderColor: "black"
			});
			$('#btn'+rid).css({
				visibility: "visible"
			});
		});//focus
		
		$('.rrepl').focusout(function() {
			$(this).css({
				borderColor: "rgba(0, 0, 0, 0.15)"
			});
		});//focusout
		$('.rrepl').keyup(function() {
			
			reCheck = rCheck();
			if(reCheck == true){
				$('#sub'+rid).prop("disabled",false).css({
					background :"OrangeRed",
					color:"white",
					cursor : "pointer"
				});
			}else if(reCheck == false){
				$('#sub'+rid).prop("disabled",true).css({
					background :"rgba(0, 0, 0, 0.15)",
					color:"black",
					cursor: "default"
			});
		}
	});//repl.keyup	
		
$('.rreplsubtn').click(function(){
	var sid = $(this).attr('id');
	
	$.ajax({
		type:"get",
		url:"rreplinsert",		
		data:{
			rvno : $('#rvno'+sid).val(),
			rpcontents:$('.rrepl'+sid).val(),
			root : $('#root'+sid).val()			
		},
		success:function(result){	
			$('#iddiv').html(result);
		},
		error:function(){
			alert("답글등록 실패");
		}
	});
	
}); //click



});//ready
function rCheck(){
	
	var repl=$('#'+rid).val().replace(/\s|　/gi, '');		
	if(repl.length == 0 ){
		return false;				
	}
	else {
		return true;
	}
}//rCheck
