<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css" >
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
</head>
<body>

<div style="position: fixed; z-index: 50"><jsp:include page="/WEB-INF/views/headfoot/header.jsp" flush="true" /></div>
	<div style="position: relative;">
		<img src="resources/image/space.jpg" width="100%" height="400px">	
		<div style="position: absolute; width: 100%; bottom: 140px;
			 font-size: 4em; font-weight: bold; color: white" align="center">
			 글 수정
		</div>
	</div>
	
<table class="table table-hover"><form action="bupdate" method="get">
	<tr><td bgcolor="Gainsboro">번호</td>
	<td ><input type="text" name="seq" value="${Apple.seq}" readonly></td>
	<td bgcolor="Gainsboro">아이디</td>
		<td>${Apple.id}</td>
	<td bgcolor="Gainsboro">작성일</td>
		<td >${Apple.regdate}</td>
	<td bgcolor="Gainsboro">조회수</td>
		<td>${Apple.cnt}</td><tr>
		
	<tr><td bgcolor="Gainsboro">제목</td>
		<td colspan="8"><input type="text" size="110px;" name="title" value="${Apple.title}"></td></tr>	
	
	<tr>
	<td colspan="8"><textarea name="content" rows="20" cols="100">${Apple.content}</textarea></td>
	</tr>
		<tr><td>&nbsp;<input type="submit" value="수정"  class="btn btn-default">&nbsp;&nbsp;
			&nbsp;<input type="reset" value="취소"  class="btn btn-default">
		</td>
	</tr>	
</form></table>

<c:if test="${message!=null}">
<hr>
=> ${message}
</c:if>
<br><hr>
<c:if test="${loginID!=null}"> 	
  <c:if test="${loginID==Apple.id || loginID=='admin'}">
	<a href="bdelete?seq=${Apple.seq}"  class="btn btn-default">글삭제</a>&nbsp;
  </c:if>
	<br><hr>
</c:if>  
<a href="blist"  class="btn btn-default">글목록</a>
</body>
</html>