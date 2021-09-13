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
var p2Check=false;
var nCheck=false;
var niCheck=false;
var tCheck=false;
var eCheck=false; 

$(function(){
	$('#id').focus();
	
	$('#id').focusout(function(){
		iCheck=idCheck();
		
	})//id_focusout 
	
	$('#password1').focusout(function() {
		pCheck=pwCheck;
	
	});
		
	$('#name').focusout(function() {
		nCheck=naCheck;
			
	}); //name_focuseout	
		
	$('#nickname').focusout(function() {
			niCheck=nickCheck;
			
	});//birthd_focusout
 	$('#tel').focusout(function() {
			tCheck=telCheck;
			
	});//point_focusout
		
	$('#email').focusout(function() {
			eCheck=emCheck;
			
	});//weight_focusout
		 

}); //ready

function inCheck(){
		if(iCheck == false){
			$('#iMessage').html('ID를 입력하세요');
		}
		if(pCheck == false){
			$('#pMessage').html('PassWord를 입력하세요');
		}
		if(nCheck == false){
			$('#nMessage').html('Name를 입력하세요');
		}
		if(niCheck == false){
			$('#niMessage').html('닉네임을 입력하세요');
		}
		
	if(tCheck == false){
			$('#tMessage').html('전화번호를 입력하세요');
		}
		if(eCheck == false){
			$('#eMessage').html('이메일 주소를 입력하세요');
		} 
		
		if(iCheck && pCheck && nCheck && niCheck  ){
			/* tCheck && eCheck */
			//오류 확인 완료 => submit 실행
		// alert('~~ 입력 완료 , 회원 가입 됩니다. ~~'+${'#id'}.val());
			alert('~~ 입력 완료 , 회원 가입 됩니다. ~~'+$('#id').val());
			return true;
		}else return false;
}//NOT

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
<form action="join" method="Post">	
	<table class="jointable"  align="center">

  <tr><td class="blind">아이디</td>
  <tr><td><input type="text" name="id" id="id" placeholder="아이디를 입력하세요" title="아이디"><br>
  <span id="iMessage" class="eMessage"></span></td></tr>
  
  <tr><td class="blind">비밀번호</td></tr>
  <tr><td><input type="password" name="password" id="password1" autocomplete="off" placeholder="비밀번호를 입력하세요" title="비밀번호">
  
  <span id="p2Message" class="eMessage"></span></td></tr>
  <tr><td class="blind">비밀번호 확인</td></tr>
  <tr><td><input type="password" id="password2" autocomplete="off" placeholder="비밀번호를 한번더 입력하세요" title="비밀번호">
  <div class="alert-success" id="alert-success">비밀번호가 일치합니다</div>
  <div class="alert-fail" id="alert-fail">비밀번호가 일치하지 않습니다</div>
  <span id="pMessage" class="eMessage"></span></td></tr>
  
  <tr><td class="blind">이름</td></tr>
  <tr><td><input type="text" name="name" id="name" autocomplete="off" placeholder="이름을 입력하세요" >
  <span id="nMessage" class="eMessage"></span></td></tr>
  
  <tr><td class="blind">닉네임</td></tr>
  <tr><td><input type="text" name="nickname" id="nickname" placeholder=""> 
  <span id="niMessage" class="eMessage"></span></td></tr>  
  
   <tr><td class="blind">전화번호</td></tr>
  <tr><td><input type="tel" name="tel" id="tel" placeholder="-없이 입력해주세요"> 
  <span id="tMessage" class="eMessage"></span></td></tr>  
  
  <tr><td class="blind">이메일 주소</td></tr><tr>
  <tr><td><input type="email" name="email" id="email" placeholder="" > 
  <span id="eMessage" class="eMessage"></span></td></tr>   
  
  <tr>
    <td align="right" style="margin-right: 0;">
      <input type="submit" name="signup_submit" id="signup-submit" value="회원가입하기" onclick="return inCheck()">
    </td>
   </tr>
 </table>
</form>
<c:if test="${message != null}">
	<br>${message}<br><br>	
</c:if>
</body>
</html>