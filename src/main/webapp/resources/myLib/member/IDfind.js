function naCheck(){
	var name=$('#name').val();
	
	if(name.length < 1){
		$('#nMessage').html("이름은 1글자 이상 입니다");
		return false;
				
	}else if(name.replace(/[가-힣.a-z]/gi,'').length > 0){
		$('#nMessage').html('이름은 한글또는 영문으로 입력하세요');
		return false;
	}else{
		$('#nMessage').html('');
		return true;
	}
}//ncheck

function telCheck(){
	var tel=$('#tel').val();
	var reg = /^[0-9]+/g;

	if(reg.test(tel)==false){
		$('#tMessage').html("숫자만 입력하세요");
		return false;
	}else{
		$('#tMessage').html('');
		return true;
	}	
}

function findid(){
	
}