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
	
<script>

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
<table class="jointable"  align="center">

  <tr><td class="blind">아이디</td>
  <tr><td><input type="text" name="id" id="id" placeholder="아이디를 입력하세요" title="아이디"></td></tr>
  <tr><td class="blind">비밀번호</td></tr>
  <tr><td><input type="password" name="password" id="password1" autocomplete="off" placeholder="비밀번호를 입력하세요" title="비밀번호">
  </td></tr>  
  <tr><td class="blind">비밀번호 확인</td></tr>
  <tr><td><input type="password" name="password2" id="password2" autocomplete="off" placeholder="비밀번호를 한번더 입력하세요" title="비밀번호">
  </td></tr>
  <tr><td class="blind">닉네임</td></tr>
  <tr><td><input type="text" name="name" id="name" placeholder=""> </td></tr>  
  <tr><td class="blind">이메일 주소</td></tr><tr>
  <tr><td><input type="email" name="email" id="email" placeholder="" > </td></tr>  
  <tr><td align="right" style="margin-right: 0;"><input type="submit" name="signup_submit" id="signup-submit" value="회원가입하기"></td></tr>
</table>
<c:if test="${message != null}">
	<br>${message}<br><br>	
</c:if>
</body>
</html>