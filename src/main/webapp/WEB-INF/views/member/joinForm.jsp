<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/memberStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/inCheck.js"></script>
<script>
var iCheck=false;
var pCheck=false;
var nCheck=false;
var niCheck=false;
var tCheck=false;
var eCheck=false; 
var checkid=false;

$(function(){
	
$('#id').focus();
	
	$('#id').focusout(function(){
		iCheck=idCheck();
		checkid=dupid();
		if(checkid ==true ){
			$('#iMessage').css({
				color: "green"
			});
		}else{
			$('#iMessage').css({
				color: "red"
			});
		}
	})//id_focusout 
	
	$('#password1').focusout(function() {
		pCheck=pwCheck();
	
	});
	
	$('#name').focusout(function() {
		nCheck=naCheck();
			
	}); //name_focuseout
	
	$('#nickname').focusout(function() {
		niCheck=nickCheck();
	});//nick_focusout
	$('#tel').focusout(function() {
		tCheck=telCheck();
		
	});//tel_focusout
	
	$('#email').focusout(function() {
		eCheck=emCheck();
		
	});//email_focusout
	
});

function inCheck(){
	if(iCheck == false){
		$('#iMessage').html('아이디를 입력하세요');
	}
	if(checkid == false){
		$('#iMessage').html('사용중인 아이디입니다');
	}
	if(pCheck == false){
		$('#pMessage').html('비밀번호가 올바르지 않습니다');
	}
	if(nCheck == false){
		$('#nMessage').html('필수정보입니다. 이름을 입력해주세요.');
	}
	if(niCheck == false){
		$('#niMessage').html('필수정보입니다. 닉네임을 입력해주세요.');
	}
 	if(tCheck == false){
		$('#tMessage').html('필수정보입니다. 번호를 입력해주세요.');
	}
	if(eCheck == false){
		$('#eMessage').html('필수정보입니다. 이메일 주소를 입력해주세요.');
	}  
	if(iCheck && checkid && pCheck && nCheck && niCheck && tCheck && eCheck ) return true;
	else return false;
}//incheck



//비밀번호 확인
$(function(){
	$('#alert-success').hide();
	$('#alert-fail').hide();
	$('input').keyup(function(){
		var password1=$('#password1').val();
		var password2=$('#password2').val();
		if(password1 != "" || password2 != ""){
			if(password1 == password2){
				$('#alert-success').show();
				$('#alert-fail').hide();
				$('#signup-submit').removeAttr('disabled');
			}else{
				$('#alert-success').hide();
				$('#alert-fail').show();
				$('#signup-submit').attr('disabled','disabled');
			}
		}
		
	});
	
});

//닉네임 확인
/* $(function(){
	$('#success-nick').hide();
	$('$fail-nick').hide();
	$('input').keyup(function(){
	
}); */
</script>
<style>
 #success-nick{
 	color:green;
 	font-style: italic;
	font-size: small;
 }
 
 #fail-nick{
 	color:red;
 	font-style: italic;
	font-size: small;
 }
</style>
</head>
<body>
<div style="position: fixed; z-index: 50"><jsp:include page="/WEB-INF/views/headfoot/header.jsp" flush="true" /></div>
	<div style="position: relative;">
		<img src="resources/image/space.jpg" width="100%" height="400px">	
		<div style="position: absolute; width: 100%; bottom: 140px;
			 font-size: 4em; font-weight: bold; color: white" align="center">
			 회원 가입
		</div>
	</div>
	<form action="join" method="Post" class="container">	
	<table align="center" >
		<tr>
      		<td class="blind">아이디</td>
  		</tr>
  		<tr>
    		<td>
     			<input type="text" name="id" id="id" placeholder="아이디를 입력하세요" ><br>
     			<span id="iMessage"  ></span>&nbsp;&nbsp;
    		</td>
    		<td>
  	 			<!-- <input type="button" style="width: 120px; height: 80px" value="id중복확인" id="checkid" onclick="idDupCheck()"> -->
  			</td>
  		</tr>
  		<tr>
  			<td class="blind" style="margin-bottom: 20px">비밀번호</td>
  		</tr>
 		<tr>
 			<td>
 				<input type="password" name="password" id="password1" autocomplete="off" placeholder="비밀번호를 입력하세요" title="비밀번호" style="margin-bottom: 10px"><br>
 		  		<span id="pMessage" class="eMessage" style="margin-bottom: 20px"></span>
  			</td>
  		</tr>  
  		<tr>
  			<td class="blind">비밀번호 확인</td>
  		</tr>
  		<tr>
  			<td>
  				<input type="password" id="password2" autocomplete="off" placeholder="비밀번호를 한번더 입력하세요" title="비밀번호" style="margin-bottom: 5px"><br>
  				<div class="alert-success" id="alert-success">비밀번호가 일치합니다</div>
  				<div class="alert-fail" id="alert-fail">비밀번호가 일치하지 않습니다</div>
  		 		<span id="pMessage" class="eMessage"></span>
  		 	</td>
  		</tr>
 
		<tr>
			<td class="blind">이름</td>
		</tr>
  		<tr>
  			<td>
  				<input type="text" name="name" id="name" placeholder="이름을 입력하세요" style="margin-bottom: 5px"><br>
  		  		<span id="nMessage" class="eMessage" style="margin-bottom: 20px"></span>
  		  	</td>
  		</tr>
  		<tr>
  			<td class="blind">닉네임</td>
  		</tr>
  		<tr>
  			<td>
  				<input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력하세요" style="margin-bottom: 5px"><br>
  <!-- 	      		<div class="alert-success" id="success-nick">사용가능한 닉네임 입니다!</div>
  				<div class="alert-fail" id="fail-nick">이미 사용중인 닉네임 입니다!</div> -->
  	      		<span id="niMessage" class="eMessage" style="margin-bottom: 20px"></span>
  	      	</td>
  	    </tr>  
  	      
  		<tr>
  			<td class="blind">핸드폰 번호</td>
  		</tr>
  		<tr>
  			<td>
  				<input type="tel" name="tel" id="tel" placeholder="-없이 입력해주세요" style="margin-bottom: 5px"><br>
  			 	<span id="tMessage" class="eMessage" style="margin-bottom: 5px"></span>
  			</td>
  		</tr>  
  		  
 	 	<tr>
 	 		<td class="blind">이메일 주소</td>
 	 	</tr>
  		<tr>
  		 	<td>
     			<input type="email" name="email" id="email" placeholder="이메일을 입력하세요" style="margin-bottom: 5px"><br>
  		  		<span id="eMessage" class="eMessage" style="margin-bottom: 20px"></span>
  		  	</td>
  		</tr>  
  		  
  		<tr>
   			<td>
    			<input type="submit" style="margin-top: 20px" name="signup_submit" class="button_login" value="회원가입하기" onclick="return inCheck()">
   			</td>
  		</tr>
 	</table>
 	</form>
 	<jsp:include page="/WEB-INF/views/headfoot/footer.jsp" flush="true" />
</body>
</html>