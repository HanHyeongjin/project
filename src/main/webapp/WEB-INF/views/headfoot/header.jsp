<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/headerStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/header.js"></script>
</head>
<body>
	<div class="topbar">
		<div class="headerbar" id="headerbar">
			<c:if test="${loginID ==null}">
			<a href="loginf" class="mheader" id="login">로그인</a>&nbsp;&nbsp;
			<a href="joinf" class="mheader" id="join">회원가입</a></c:if>
			
			<c:if test="${loginID !=null}">
			<a href="logout" class="mheader" id="logout">로그아웃</a>&nbsp;&nbsp;
			<a href="myinfo" class="mheader" id="myinfo">내정보</a>&nbsp;&nbsp;
			</c:if>
		</div>
		
		<div class="menubar" id="menubar">
			<a href="home" class="menu">사이트 이름</a>
			<a href="gameinsertf" class="menu">소개</a>
			<a href="gamelist" class="menu">공지사항</a>
			<a href="blist" class="menu">게시판</a>
			<a href="gamelist" class="menu">게임 순위</a>
			<span class="menu"><input type="search"><button>검색</button></span>
		</div>
	</div>
</body>
</html>