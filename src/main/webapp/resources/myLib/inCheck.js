function idCheck(){
	var id=$('#id').val();
	
	if(id.length < 5 || id.length >20 ){
		$('#iMessage').html('4~20 글자 이내만 사용가능합니다');
		return false;
	}else if (id.replace(/[a-z.0-9.{4,20}]/gi,'').length > 0){
		$('#iMessage').html('4~20자의 영문 소문자, 숫자만 사용 가능합니다.');
		return false;
	}else{
		$('#iMessage').html("");
		return true;
	}
}

function pwCheck(){
	var password=$('#password1').val();
		
	if(password.length < 4){
		$('#pMessage').html("password는 4글자 이상 입니다");
		return false;
			
	}else if(password.replace(/[!-*]/gi,'').length >= password.length){
		//특수문자가 포함 되어있다면 특수문자를 ''로 replace 한 후 길이가 줄어야 됨
		$('#pMessage').html('password는 특수문자가 반드시 1개이상 포함되어야 합니다');
		return false;
	}else if(password.replace(/[a-z.0-9.!-*]/gi,'').length > 0){
		$('#pMessage').html('password는 영문과 숫자, 특수문자 로 입력하세요 ');
		return false;
	}else{
		$('#pMessage').html('');
		return true;
	}
}//pCheck

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

function nickCheck(){
	var nickname=$('#nickname').val();
	if(nickname.replace(/[가-힣.a-z.0-9]/gi,'').length > 0){
		$('#niMessage').html('닉네임은 한글, 영어, 숫자로 입력하세요');
		return false;
		
	}else{
		$('#niMessage').html('');
		return true;	
	
	}		
}//niCheck

function tCheck(){
	var tel=$('#tel').val();

	if($.isNumeric(tel)==false){
		$('#tMessage').html("전화번호를 입력하세요");
		return false;
	}else if(point.replace(/[.]/g,'').length < point.length){
		$('#tMessage').html("point는 정수로만 입력하세요");
		return false;
	}else{
		$('#tMessage').html('');
		return true;
	}	
}//poCheck

function eCheck(){
	var email=$('#email').val();
				
	if($.isNumeric(email)==false){
		$('#eMessage').html("weight는 숫자로만 입력하세요");
		return false;
	}else if(parseFloat(email) <20 || parseFloat(weight) >200){
			//else if(Number(weight) <20 || Number(weight) >200){
			// Number(weight)
			$('#eMessage').html("weight 값이 범위를 벗어납니다");
			return false
	}else{
		$('#eMessage').html('');
		return true;
	}
}

