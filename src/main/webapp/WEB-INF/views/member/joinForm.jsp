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
var iCheck =false ;
var pCheck =false;
var pw2Check=false;
var nCheck =false;
var nickCheck = false;
var tCheck = false;
var eCheck = false;

$(function(){
	$('#id').focus();
	$('#id').focusout(function(){
		iCheck = idCheck;
	});//id_focusout
	
	$('#password').focusout(function(){
		pCheck = passwordCheck;
	});//pw_focusout
	$('#password2').focusout(function(){
		pw2Check = password2Check;
	});//pw2_focusout
	
	$('#name').focusout(function(){
		nCheck = nameCheck;
	});//name_focusout
	
	$('#nickname').focusout(function(){
		nickCheck = nicknameCheck;
	});//nick_focusout
	
	$('#tel').focusout(function(){
		tCheck = telCheck;
	});//phone_focusout
	
	$('#email').focusout(function(){
		eCheck = emailCheck;
	});//email_focusout
	
});//ready

function inCheck(){
	if(iCheck == false){
		$('#iMessage').html('필수정보입니다. 아이디를 입력해주세요.');
	}
	if(pCheck == false){
		$('#pMessage').html('영문,숫자,특수문자를 사용하세요.');
	}
	if(pw2Check == false){
		$('#p2Message').html('비밀번호가 일치하지 않습니다.');
	}
	if(nCheck == false){
		$('#nMessage').html('필수정보입니다. 이름을 입력해주세요.');
	}
	if(nickCheck == false){
		$('#nickMessage').html('필수정보입니다. 닉네임을 입력해주세요.');
	}
	if(tCheck == false){
		$('#tMessage').html('필수정보입니다. 번호를 입력해주세요.');
	}
	if(eCheck == false){
		$('#eMessage').html('필수정보입니다. 이메일 주소를 입력해주세요.');
	}
	
	if(iCheck && pCheck && pw2Check &&
		nCheck && nickCheck && tCheck && eCheck){
		alert("입력 완료 회원가입 되었습니다!");
		return true;
	}else{
		return false;
	}
	
}
//id 중복 체크
function idDupCheck(){
	if(iCheck == false){
		iCheck = idCheck;
	}else{
		var url="idCheck?id="$('#id').val();
	}
}

</script>
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
<form action="join" method="post" id="myForm" enctype="multipart/form-data">
  <table class="jointable"  align="center">
    <tr><td class="blind">아이디</td></tr>
    <tr><td><input type="text" name="id" id="id" placeholder="아이디를 입력하세요" title="아이디" style="margin-bottom: 20px"></td>
  	    <td><input type="button" value="id중복확인" id="idDup" onclick="idDupCheck()">&nbsp;&nbsp;
  	  	<span id="iMessage" class="eMessage"></span></td></tr>
  
  <tr><td class="blind">비밀번호</td></tr>
  <tr><td><input type="password" name="password" id="password" autocomplete="off" placeholder="비밀번호를 입력하세요" title="비밀번호" style="margin-bottom: 20px">
 		  <span id="pMessage" class="eMessage"></span>
  </td></tr>  
  
  <tr><td class="blind">비밀번호 확인</td></tr>
  <tr><td><input type="password" name="password2" id="password2" autocomplete="off" placeholder="비밀번호를 한번더 입력하세요" title="비밀번호" style="margin-bottom: 20px">
  		  <span id="p2Message" class="eMessage"></span></td></tr>
 
  <tr><td class="blind">이름</td></tr>
  <tr><td><input type="text" name="name" id="name" placeholder="" style="margin-bottom: 20px">
  		  <span id="nMessage" class="eMessage"></span></td></tr>
  
  <tr><td class="blind">닉네임</td></tr>
  <tr><td><input type="text" name="nickname" id="nickname" placeholder="" style="margin-bottom: 20px">
  	      <span id="nickMessage" class="eMessage"></span></td></tr>  
  	      
  <tr><td class="blind">핸드폰 번호</td></tr>
  <tr><td><input type="tel" name="tel" id="tel" placeholder="" style="margin-bottom: 20px">
  		  <span id="tMessage" class="eMessage"></span></td></tr>  
  		  
  <tr><td class="blind">이메일 주소</td></tr><tr>
  <tr><td><input type="email" name="email" id="email" placeholder="" style="margin-bottom: 20px">
  		  <span id="eMessage" class="eMessage"></span></td></tr>  
  		  
  <tr><td><input type="submit" class="button_login" value="회원가입하기" onclick="return inCheck()" ></td></tr>
</table>
</form>	
<c:if test="${message != null}">
	<br>${message}<br><br>	
</c:if>

<jsp:include page="/WEB-INF/views/headfoot/footer.jsp" flush="true" />
</body>
</html>