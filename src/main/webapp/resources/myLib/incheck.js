function idCheck(){
	var id=$('#id').val();
	
	if(id.length < 4 || id.length >20 ){
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

function nameCheck(){
	var password=$('#password').val();
	
	if(password.length <4){
		$('#pMessage').html('비밀번호는 4글자 이상입니다');
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
}//pwcheck



