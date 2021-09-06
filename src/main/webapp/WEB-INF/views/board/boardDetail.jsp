<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css" >
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<style>

video {max-width:40%; display: block; margin:10px auto;}
</style>
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
	
<br>
<video  muted autoplay loop>
<source src="resources/video/lostark.mp4" type="video/mp4">
<strong>Your browser does not support the video tag.</strong>
</video>
<br>
<table class="table table-hover">
<tr>
		<td bgcolor="Gainsboro" >${Apple.title}</td>
	</tr>
	</table><table class="table table-hover">
	<tr><td bgcolor="Gainsboro">작성자</td>
		<td width="400px;">${Apple.id}</td>
	<td bgcolor="Gainsboro">작성일</td>
		<td>${Apple.regdate}</td>
	<td bgcolor="Gainsboro">조회수</td>
		<td>${Apple.cnt}</td></tr>
		</table><table class="table table-hover">
		<tr height="600px;"><td>${Apple.content}</td></tr>
	</table>
	<table class="table table-hover">
	<tr height="10">
		<td><textarea name="Content" cols="100"></textarea>
	 <button type="button" class="btn btn-outline-primary" >등록</button>	
		</td>   
	</tr>	
</table>

<c:if test="${message!=null}">
<hr>
=> ${message}
</c:if>
<br><hr>
<!--** 로그인 했는지 ..
 	** 글쓴이(Apple.id) 와 글보는이(loginID) 가 동일인 인지 .. 
 	=> 표시 되는 메뉴가 달라져야 함 
 	=> 답글 달기 추가 -->
<c:if test="${loginID!=null}"> 	
  <c:if test="${loginID==Apple.id || loginID=='admin'}">
	<a href="bdetail?seq=${Apple.seq}&jcode=U"  class="btn btn-default">글수정</a>&nbsp;&nbsp;
	<a href="bdelete?seq=${Apple.seq}"  class="btn btn-default">글삭제</a>&nbsp;&nbsp;
  </c:if>
	<a href="binsertf"  class="btn btn-default">글쓰기</a>&nbsp;
	<br><hr>
</c:if>  
<a href="blist"  class="btn btn-default">글목록</a>
</body>
</html>