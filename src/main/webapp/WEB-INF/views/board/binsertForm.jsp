<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css" >
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
</head>
<body>

<div style="position: fixed; z-index: 50"><jsp:include page="/WEB-INF/views/headfoot/header.jsp" flush="true" /></div>
	<div style="position: relative;">
		<img src="resources/image/space.jpg" width="100%" height="400px">	
		<div style="position: absolute; width: 100%; bottom: 140px;
			 font-size: 4em; font-weight: bold; color: white" align="center">
			 게시판
		</div>
	</div>
	
<table class="table table-hover">
<form action="binsert" method="get">
	<tr height="40"><td bgcolor="Gainsboro">아이디</td>
		<td><input type="text" name="id" value="${loginID}" readonly></td>
	<td bgcolor="Gainsboro">제목</td>
		<td><input type="text" name="title"></td></tr>	
	<tr>
		<td colspan="4"><textarea name="content" rows="20" cols="100"></textarea></td>
	</tr>
	<tr height="40"><td></td>
		<td><input type="submit" value="등록"  class="btn btn-default">&nbsp;&nbsp;
			<input type="reset" value="취소"  class="btn btn-default">
		</td>
	</tr>
</form></table>

<c:if test="${message!=null}">
<hr>
=> ${message}
</c:if>
<br><hr>
<a href="blist"  class="btn btn-default">글목록</a>
</body>
</html>