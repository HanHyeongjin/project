<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/footerStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div class="footerback" align="center">	
		<div class="footertxt">
			이곳은 footer입니다.
		</div>	
		<div>
			<c:if test="${loginID ==null}">
			<a href="loginf" class="mheader" id="adlogin">관리자 로그인</a>&nbsp;&nbsp;
			<a href="joinf" class="mheader" id="adjoin">관리자 회원가입</a></c:if>
			
			<c:if test="${loginID !=null}">
			<a href="logout" class="mheader" id="adlogout">로그아웃</a>&nbsp;&nbsp;
			<a href="myinfo" class="mheader" id="admyinfo">내정보</a>&nbsp;&nbsp;
			<a href="delete" class="mheader" id="addelete">회원탈퇴</a>
			</c:if>
		</div>
	</div>
</body>
</html>