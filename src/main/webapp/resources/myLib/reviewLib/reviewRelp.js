var reCheck=false;
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
			reCheck = rCheck();
			if(reCheck == true){
				$('.replsubtn').prop("disabled",false).css({
					background :"OrangeRed",
					color:"white"
				});
			}else if(reCheck == false){
				$('.replsubtn').prop("disabled",true).css({
					background :"rgba(0, 0, 0, 0.15)",
					color:"black"
			});
		}
	});//repl.keyup	
});//ready
function rCheck(){
	var repl=$('#repl').val().replace(/\s|　/gi, '');		
	if(repl.length == 0 ){
		return false;				
	}
	else {
		return true;
	}
}//rCheck
$(function(){
$('#replsumit').click(function(){
	$.ajax({
		type:"Post",
		url:"replinsert",
		data:{
			rpcontents:$('#repl').val(),
			rvno : $('#replrvno').val()
		},
		success:function(resultData){	
			
			if(resultData.replin == 'T'){
				location.reload();
				alert(resultData.message)
			}else{
				alert(resultData.message);				
			}
		},
		error:function(){
			$('#resultArea').html("서버 Error");
		}
	});
	
}); repl_click
});