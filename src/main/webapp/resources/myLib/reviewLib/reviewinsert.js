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
