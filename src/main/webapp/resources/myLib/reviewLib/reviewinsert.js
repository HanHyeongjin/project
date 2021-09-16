var tCheck=false;
var sCheck=false;
var cCheck=false;
	
function reCheck(){
		tCheck=tiCheck();
		sCheck=scCheck();
		cCheck=coCheck();
		if(tCheck == false){
			alert("제목을 입력해 주세요");
		}
		if(sCheck == false){
			alert("평점을 입력해 주세요");
		}
		if(cCheck == false){
			alert("내용을 작성해 주세요");
		}
		if(tCheck && sCheck && cCheck ){
			alert("리뷰가 등록되었습니다");
			return true;
		}else return false;
}// reCheck
function tiCheck(){
	var rtitle=$('#rtitle').val().replace(/\s|　/gi, '');		
	if(rtitle.length == 0 ) return false;				
	else return true;
}//tiCheck
function scCheck(){
	var score=$('#display').val();		
	if(score < 0 || score>5) return false;			
	else return true;
}//tiCheck
function coCheck(){
	
	var rcontens=$('#summernote').val().replace(/\s|　/gi, '');		
	rcontens= rcontens.replace(/&nbsp;/gi,"");
	rcontens= rcontens.replace(/<br>/gi,"");
	rcontens= rcontens.replace(/ /gi,"");
	rcontens= rcontens.replace(/<p><\/p>/gi,"");
	if(rcontens=="") return false;			
	else return true;
}//coCheck
$(function() {
	
	$('.resets').click(function() {
		$('.s').removeClass("star");
		$('#display').val("0");
	
		$('.s').hover(function(){
			for(var i = 0; i<= $(this).index()+1; i++){
				$('.stars > span:nth-child('+(i)+')').addClass("star");
			}$('#display').val(i-1);
		
		},function(){
			$('.s').removeClass("star");
			$('#display').val("0");
		});
		
		$('.s').click(function(){
		for(var i = 0; i<$('#display').val(); i++){
			$('.s').off();
			$('.stars > span:nth-child('+i+')').addClass("star");
		}$('#display').val(i);
		});
	});
}); //ready
