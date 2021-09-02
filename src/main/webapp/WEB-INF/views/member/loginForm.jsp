<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Spring LoginForm **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
<script src="resources/myLib/axTest01.js"></script>	
<script>
// 1. 전역변수 정의
// => 스위치 변수
	var iCheck = false;
	var pCheck = false;
	$(function(){
		// 2. 개별컬럼 무결성 점검 
		// => jQuery, focusout
		$('#id').focus();
		$('#id').focusout(function(){
			iCheck = idCheck();
		}); //id_focusout
		
		$('#password').focusout(function() {
		pCheck =pwCheck();			
		}); //password focusout
	}); // ready		
	// 3. submit처리
	function inCheck() {
		if(iCheck==false){ 
			$('#iMessage').html('ID입력 오류입니다.');
		}
		if(paCheck==false){
			$('#paMessage').html('Password입력 오류입니다.');
		}
		if(iCheck && paCheck){
			alert('입력 완료, 회원 가입 됩니다 ');
			return true;
		}else return false;	
	} // inCheck
</script>
</head>
<body>
<h2>** Spring MyBatis LoginForm **</h2>
<br>
<table>
<!-- <form action="/Web02/login" method="get">  -->
<!-- FrontController Test -->
<form action="login" method="get">
	<tr align="center"><td bgcolor="gray">I D</td>
	<td><input type="text" name="id" value="banana" id="id"><br>
	<span id="iMessage" class="eMessage"></span></td></tr>
	<tr align="center"><td bgcolor="gray">Password</td><td>
	<input type="password" name="password" value="!123qwe" id="password"><br>
	<span id="paMessage" class="eMessage"></span></td></tr>
		<tr><td></td>
		<td align="right"><input type="submit" value="login" onclick="return inCheck()">&nbsp;&nbsp;
		<input type="reset" value="Cancel"><br>
		<span id="alogin" class="textLink">AxLogin</span>&nbsp;&nbsp;
		<span id="jslogin" class="textLink">JsonLogin</span>
		</td></tr>
</form></table>
<br>
<c:if test="${message != null}">
	<br>${message}<br><br>
</c:if>
<hr>
<a href="home">Home</a>&nbsp;&nbsp;
</body>
</html>