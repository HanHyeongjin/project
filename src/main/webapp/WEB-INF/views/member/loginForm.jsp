<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/memberStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/inCheck.js"></script>
<script>
var iCheck=false;
var pCheck=false;

$(function(){
	
$('#id').focus();
	
	$('#id').focusout(function(){
		iCheck=idCheck();
		
	})//id_focusout 
	
	$('#password1').focusout(function() {
		pCheck=pwCheck();
	
	});
});

function inCheck(){
	if(iCheck == false){
		$('#iMessage').html('아이디를 입력하세요');
	}
	if(pCheck == false){
		$('#pMessage').html('비밀번호를 입력하세요');
	}
	if(iCheck && pCheck) return true;
	else return false;
}//incheck

</script>
</head>
<body>	

    <div style="position: fixed; z-index: 50"><jsp:include page="/WEB-INF/views/headfoot/header.jsp" flush="true" /></div>
	<div style="position: relative;">
		<img src="resources/image/space.jpg" width="100%" height="400px">	
		<div style="position: absolute; width: 100%; bottom: 140px;
			 font-size: 4em; font-weight: bold; color: white" align="center">
			 로그인
		</div>
	</div>
	<div align="center" class="container">
	<form action="login" method="get" class="login-id-box">
			<table >
				<tr>
					<td class="login-id-box" align="center">
						<input type="text" name="id" id="id" placeholder="아이디" title="아이디">
					<br>
						<span id="iMessage" class="eMessage"></span>
					</td>
				</tr>
				<tr>
					<td class="login-id-box" align="center">
						<input type="password" name="password" id="password1" placeholder="비밀번호">
					<br>
						<span id="pMessage" class="eMessage"></span>
					</td>
				</tr>
				<tr>
					<td class="login-id-box" align="center">
						<input type="submit" class="login" value="로그인" onclick="return inCheck()">&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<a href="findid"><b>아이디 찾기</b></a>&nbsp;<span class="bar">&nbsp;&nbsp;|</span>
						<a href="findpassword"><b>비밀번호 찾기</b></a>&nbsp;<span class="bar">&nbsp;|&nbsp;</span>
						<a href="joinf"><b>회원가입</b></a>&nbsp;
					</td>
				</tr>		
			</table>
			</form>
		</div>	
		<c:if test="${message != null}">
			<br>${message}<br><br>	
		</c:if>

</body>
</html>