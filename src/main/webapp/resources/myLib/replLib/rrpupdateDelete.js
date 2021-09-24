
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

$('.rrupdatecancel').click(function(){
	id = $(this).attr('id');
	$('#coup'+id).removeClass('rrepl');
	$('#coup'+id).addClass('rpcontentsarea');
	$('#coup'+id).attr("disabled", true);
	$('#btnup'+id).css('display','none');
	
});//답글 수정 취소

	
$('.rrpup').keyup(function() {
	id = $(this).attr('id');
	ruCheck = rrupCheck();
	if(ruCheck == true){
		$('#rrp'+id).prop("disabled",false).css({
			background :"OrangeRed",
			color:"white",
			cursor : "pointer"
		});
	}else{
		$('#rrp'+id).prop("disabled",true).css({
			background :"rgba(0, 0, 0, 0.15)",
			color:"black",
			cursor: "default"
		});
	}
});//답글 수정 작성 

$('.rrpupbtn').click(function(){
	id = $(this).attr('id');
	
	$.ajax({
		type:"get",
		url:"rpupdate",		
		data:{
			replno : $('#rpno'+id).val(),
			rpcontents:$('.'+id).val()		
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
			alert("답글수정중 오류가 발생했습니다.");
		}
	});
	
}); //답글 수정

$('.rrpdelete').click(function(){
	id =$(this).attr('id');
	$.ajax({
		type:"get",
		url:"rpdelete",
		data:{
			replno:$('.rpno'+id).val()
		},
		success:function(result){	
			if(result.replin == 'T'){
			alert("답글이 삭제되었습니다.");
			$('.rreplresult').html("");
			$('.viewrrpl').html("▼ 답글 보기");
			}else alert(result.message);
		},
		error:function(){
			alert("답글삭제 실패");
		}
	});
}); // 답글 삭제

});//ready
function rrupCheck(){
	
	var repl=$('#'+id).val().replace(/\s|　/gi, '');		
	if(repl.length == 0 ){
		return false;				
	}
	else {
		return true;
	}

}