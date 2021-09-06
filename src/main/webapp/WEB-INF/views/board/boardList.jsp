<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<% String cp = request.getContextPath(); %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MMORPG 게시판</title>
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css" >
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<style>

video {max-width:40%; display: block; margin:10px auto;}
</style>

<script>

//** Button 으로 현재 입력 & 선택한 keyword 와 searchType 을 queryString 으로 
//   요청을 보내기 때문에 makeQuery() 메서드를 사용해야 함.
//$(document).ready(function() { .... })
$(function() {	
	// SearchType 이 '---' 면 keyword 클리어
	$('#searchType').change(function() {
		if ($(this).val()=='n') $('#keyword').val('');
	}); //change
	
	$('#searchBtn').on("click", function() {
		self.location="blist"
			+"${pageMaker.makeQuery(1)}"
			+"&searchType="
			+$('#searchType').val()
			+'&keyword='
			+$('#keyword').val()
		// bcplist?curPage=1&rowsPerPage=3&searchType=t&keyword=Java
				
		/* 	비교 Test :
		self.location="bcplist"
				+"${pageMaker.searchQuery(1)}" */		
				
	}); //on_click
	
}) //ready

</script>
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
<c:if test="${message!=null}">
 => ${message}<br> 
</c:if>

<table class="table table-hover">
<tr height="30" bgcolor="Gainsboro">
	<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th><th>추천수</th>
</tr>
<c:forEach var="list" items="${Banana}"><tr height="40">

	<td>${list.seq}</td>
	<td>	
			<a href="bdetail?seq=${list.seq}&id=${list.id}">${list.title}</a>		
	</td>
	<td>${list.id}</td><td>${list.regdate}</td><td>${list.cnt}</td>
</tr></c:forEach>
</table>
<br><hr>
<div id="searchBar">
	<select name="searchType" id="searchType" >
		<option value="t" <c:out value="${pageMaker.cri.searchType=='t' ? 'selected':''}"/> >제목</option>
		<option value="c" <c:out value="${pageMaker.cri.searchType=='c' ? 'selected':''}"/> >내용</option>
		<option value="w" <c:out value="${pageMaker.cri.searchType=='w' ? 'selected':''}"/> >작성자</option>
		<option value="tc" <c:out value="${pageMaker.cri.searchType=='tc' ? 'selected':''}"/> >제목 & 내용</option>
		<option value="cw" <c:out value="${pageMaker.cri.searchType=='cw' ? 'selected':''}"/> >내용 & 작성자</option>
	</select>
	<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" >
	<button id="searchBtn"  class="btn btn-default">검색</button>
</div>
<br>

<br>

<div align="center">
	<!-- Paging 2 : Criteria 적용 
		=> ver01 : pageMaker.makeQuery(?)
		=> ver02 : pageMaker.searchQuery(?)
		1)  First << ,  Prev <  처리 -->
<ul class="pagination">	
		
	<c:if test="${pageMaker.prev && pageMaker.spageNo>1}">
	<li>
		<a href="blist${pageMaker.searchQuery(1)}"><<</a>&nbsp;
		<a href="blist${pageMaker.searchQuery(pageMaker.spageNo-1)}"><</a>
		</li>
	</c:if>
	
	<!-- 2) sPageNo ~ ePageNo 까지, displayPageNo 만큼 표시 -->
	<c:forEach var="i" begin="${pageMaker.spageNo}" end="${pageMaker.epageNo}">
	<li>
			<a href="blist${pageMaker.searchQuery(i)}">${i}</a>&nbsp;	
		</li>
	</c:forEach>
	<!-- 3) Next >  ,  Last >>  처리 -->
	<c:if test="${pageMaker.next && pageMaker.epageNo>0}">
	<li>
		<a href="blist${pageMaker.searchQuery(pageMaker.epageNo+1)}">></a>&nbsp;
		<a href="blist${pageMaker.searchQuery(pageMaker.lastPageNo)}">>></a>&nbsp;&nbsp;
		</li>
	</c:if>
	
	</ul>
</div>
<c:if test="${loginID!=null}"> 	
		<a href="binsertf" class="btn btn-default">글 쓰기</a>	
		</c:if>
<br><hr>	
<script type="https://ajax.googleapos.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>