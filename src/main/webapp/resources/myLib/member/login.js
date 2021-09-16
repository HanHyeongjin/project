// ** JSON Login : jsonView Test
$('#jslogin').click(function(){
	$.ajax({
		type:"Post",
		url:"jslogin",
		data:{
			id:$('#id').val(),
			password:$('#password').val()
		},
		success:function(resultData){
			// => 서버로부터 Json 형태의 Data를 response 로 받음
			// 	  "loginsuccess -> T 성공"
			// 	  "loginsuccess -> F 실패"
			
			if(resultData.loginsuccess == 'T'){
				location.reload();
				alert("Json Login 성공")
			}else{
				alert(resultData.message);
				$('#id').focus();
			}
		},
		error:function(){
			$('#resultArea').html("Json Login Error");
		}
	});
	
}); jslogin_click