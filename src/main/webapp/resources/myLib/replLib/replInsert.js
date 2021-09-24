var replCheck=false;
	$(function () {		
		$('.repl').focus(function() {
			$('.repl').css({
				borderColor: "black"
			});
			$('.replbtndiv').css({
				visibility: "visible"
			});
		});//focus
		
		$('.repl').focusout(function() {
			$('.repl').css({
				borderColor: "rgba(0, 0, 0, 0.15)"
			});
		});//focusout
		$('#repl').keyup(function() {
			replCheck = rpCheck();
			if(replCheck == true){
				$('.replsubtn').prop("disabled",false).css({
					background :"OrangeRed",
					color:"white",
					cursor: "pointer"
				});
			}else if(replCheck == false){
				$('.replsubtn').prop("disabled",true).css({
					background :"rgba(0, 0, 0, 0.15)",
					color:"black",
					cursor: "default"
			});
		}
	});//repl.keyup	
	
	$('#replsumit').click(function(){
	$.ajax({
		type:"get",
		url:"replinsert",
		dataType : 'json',
		data:{
			
			rvno : $('#replrvno').val(),
			rpcontents:$('#repl').val()
		},
		success:function(resultData){	
			if(resultData.replin == 'T'){
				alert(resultData.rpinmessage);
				location.reload();
			}else{
				alert(resultData.rpinmessage);	
				location.reload();		
			}
		},
		error:function(){
			alert("서버 Error");
		}
	});
	
	
	
}); //repl_click

$.ajax({
		type:"get",
		url:"replreclist",
		data:{
			rvno : $('#replrvno').val(),
		},
		success:function(result){	
			$('#replListf').html(result);
		},
		error:function(){
			$('#replListf').html("댓글이 하나도 없습니다. 첫 댓글을 입력해 주세요");
		}
	});

$("textarea").on('keydown keyup', function () {
  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
});

});//ready
function rpCheck(){
	var repl=$('#repl').val().replace(/\s|　/gi, '');		
	if(repl.length == 0 ){
		return false;				
	}
	else {
		return true;
	}
}//rCheck
