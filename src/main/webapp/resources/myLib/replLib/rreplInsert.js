 var reCheck=false;
var id
var rid;
var did;
	$(function () {		
		
		
		$('.rpbtn').click(function(){
		rid = $(this).attr('id');
		$('#insert'+rid).show();
	});
	
	$('.viewrrpl').click(function(){
		id = $(this).attr('id');
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
	}); //click
		
				
		$('.rrepl').focus(function() {
			
			id = $(this).attr('id');
			$(this).css({
				borderColor: "black"
			});
			$('#btn'+id).css({
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
				$('#sub'+id).prop("disabled",false).css({
					background :"OrangeRed",
					color:"white",
					cursor : "pointer"
				});
			}else if(reCheck == false){
				$('#sub'+id).prop("disabled",true).css({
					background :"rgba(0, 0, 0, 0.15)",
					color:"black",
					cursor: "default"
			});
		}
	});//repl.keyup	
	
	/*$.ajax({
		type:"get",
		url:"rreplinsert",
		data:{
			rvno : $('#rvno'+id).val(),
			rpcontents:$('#'+id).val(),
			root : $('#root'+id).val(),
			step : $('#step'+id).val()
		},
		success:function(result){	
			$('.rreplresult').html(result);
		},
		error:function(){
			alert("서버 Error");
		}
	});*/
	
	$('#subrepl'+id).click(function(){
	
	$.ajax({
		type:"get",
		url:"rreplinsert",
		data:{
			rvno : $('#rvno'+id).val(),
			rpcontents:$('#'+id).val(),
			root : $('#root'+id).val(),
			step : $('#step'+id).val()
		},
		success:function(result){	
			$('.rreplresult').html(result);
		},
		error:function(){
			alert("서버 Error");
		}
	});
	
}); //repl_click
});//ready
function rCheck(){
	console.log($('#'+id).val());
	console.log($('#rvno'+id).val());
	console.log($('#root'+id).val());
	console.log($('#step'+id).val());
	
	var repl=$('#'+id).val().replace(/\s|　/gi, '');		
	if(repl.length == 0 ){
		return false;				
	}
	else {
		return true;
	}
}//rCheck
