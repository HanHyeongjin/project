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
	<script src="resources/myLib/mainformHeader.js"></script>	
<script>

</script>
</head>
<body>

<div style="position: fixed; z-index: 50"><jsp:include page="/WEB-INF/views/game/header.jsp" flush="true" /></div>
	<div style="position: relative;">
		<img src="resources/image/space.jpg" width="100%" height="400px">	
		<div style="position: absolute; width: 100%; bottom: 140px;
			 font-size: 4em; font-weight: bold; color: white" align="center">
			 게임 순위
		</div>
	</div>

<div class="container" align="center">
<h2> 회 원 가 입</h2>
  <span class="blind">아이디</span><br>
  <input type="text" name="id" id="id" placeholder="아이디를 입력하세요" title="아이디"><br><br>
  
  <span class="blind">비밀번호</span><br>
  <input type="password" name="password" id="password" autocomplete="off" placeholder="비밀번호를 입력하세요" title="비밀번호">
  <br><br>
  
  <span class="blind">비밀번호 확인</span><br>
  <input type="password" name="password" id="password" autocomplete="off" placeholder="비밀번호를 한번더 입력하세요" title="비밀번호">
   <br><br>
 <span class="blind">닉네임</span><br>
  <input type="text" name="name" id="name" placeholder=""> <br><br>
  
    <span class="blind">이메일 주소</span><br>
  <input type="email" name="email" id="email" placeholder="" > <br><br>
  
  
   <input type="submit" name="signup_submit" id="signup-submit" value="회원가입하기">   
  
</div>

<c:if test="${message != null}">
	<br>${message}<br><br>	
</c:if>
</body>
</html>