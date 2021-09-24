
var ruCheck=false;
var id


$(function(){
	$('.viewmenu').click(function(){
	id = $(this).attr('id');
	$('#updele'+id).css("visibility","visible");
}); //수정 삭제 메뉴 보기

$("body").click(function(e) { 
         if(!$('.upanddel, .viewmenu').has(e.target).length) { 
               $(".upanddel").css("visibility","hidden");
     }
}); // 매뉴 숨기기

$('.rpupdate').click(function(){
	id = $(this).attr('id');
	$('#co'+id).removeClass('rpcontentsarea');
	$('#co'+id).addClass('rrepl');
	$('#co'+id).attr("disabled", false);
	$('#btn'+id).css('display','block');
	
})//댓글 수정

$('.updatecancel').click(function(){
	id = $(this).attr('id');
	$('#coup'+id).removeClass('rrepl');
	$('#coup'+id).addClass('rpcontentsarea');
	$('#coup'+id).attr("disabled", true);
	$('#btnup'+id).css('display','none');
	
})//댓글 수정 취소

		
	
$('.rpup').keyup(function() {
	id = $(this).attr('id');
	ruCheck = rupCheck();
	if(ruCheck == true){
		$('#sub'+id).prop("disabled",false).css({
			background :"OrangeRed",
			color:"white",
			cursor : "pointer"
		});
	}else{
		$('#sub'+id).prop("disabled",true).css({
			background :"rgba(0, 0, 0, 0.15)",
			color:"black",
			cursor: "default"
		});
	}
});//리플 수정 작성 	

$('.rpupbtn').click(function(){
	id =$(this).attr('id');
	$.ajax({
		type:"get",
		url:"rpupdate",
		data:{
			rpcontents:$('.'+id).val(),
			replno:$('#rpno'+id).val()
		},
		success:function(result){	
			if(result.replin == "T"){
			alert(result.message);
			$('.rreplbtndiv').css('display','none');
			$('.'+id).removeClass('rrepl');
			$('.'+id).addClass('rpcontentsarea');
			$('.'+id).attr("disabled", true);
			$('rreplbtndiv').css('display','none');	
			}else alert(result.message);
		},
		error:function(){
			alert("서버 Error");
		}
	});
}); // 수정 완료

$('.rpdelete').click(function(){
	id =$(this).attr('id');
	$.ajax({
		type:"get",
		url:"rpdelete",
		data:{
			replno:$('#rpnosu'+id).val(),
			root : $('#rpnosu'+id).val()
		},
		success:function(resultData){	
			if(resultData.replin == 'T'){
				alert(resultData.message);
				location.reload();
			}else{
				alert(resultData.message);	
				location.reload();		
			}
		},
		error:function(){
			alert("서버 Error");
		}
	});
}); // 댓글 삭제



});//ready
function rupCheck(){
	
	var repl=$('#'+id).val().replace(/\s|　/gi, '');		
	if(repl.length == 0 ){
		return false;				
	}
	else {
		return true;
	}

}
