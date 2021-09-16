<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game INFO</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>
$('.repl').focus(function() {
	$(this).css({
		borderBottom: "green"
	});
})

</script>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/myLib/gamelib/detailReview.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/headfoot/gameTopBar.jsp" flush="true" />
	<div class="maininfo">
		<div class="gameinfo">
			<table class="infotable">
				<tr>
					<td style="background: black; font-size: 3em; color: white;"
						colspan="4">${game.gname}</td>
				</tr>
				<tr>
					<td style="background: dimgray;" colspan="1"><img
						src="${game.img}" width="250px" height="250px"></td>
					<td style="background: dimgray;" class="3">
						<div style="color: white;">${game.contents}</div>
					</td>
				</tr>
			</table>
			<div class="infobox">
				<div class="infobox2">
					<div>출시년도</div>
					<div>${game.reldate}</div>
				</div>
				<div class="infobox2">
					<div>연령제한</div>
					<div>
						<c:choose>
							<c:when test="${game.rating ==0}">전체 이용가</c:when>
							<c:when test="${game.rating ==12}">12세 이용가</c:when>
							<c:when test="${game.rating ==15}">15세 이용가</c:when>
							<c:when test="${game.rating ==18}">청소년 이용불가</c:when>
						</c:choose>
					</div>
				</div>
				<div class="infobox2">
					<div>게임사</div>
					<div>${game.gservice}</div>
				</div>
				<div class="infobox2">
					<div>장르</div>
					<div>${game.categories2}</div>
				</div>
			</div>
		</div>
		<div class="infobox3">
			<div class="box3text">The game 평점</div>
			<div class="box3text">${game.grade}</div>
			<div class="box3text">
				<a href="reviewinsertf?idno=${game.idno}">리뷰 쓰기</a>
			</div>
			<div class="box3text">리뷰 보기</div>
		</div>
	</div>

	<div class="reviewf">
		<div class="rdiv1">유저 리뷰</div>
		<div class="rdiv2">
			<a href="#">더보기</a>
		</div>
		 <div>
		<c:if test="${message != null}">
		${message}
		</c:if>
	</div>
		<div class="rtable">
			<c:forEach var="list" items="${reviews}">
					
		
				<div class="border">
					<div style="background: white; width: 80%">
						<div class="rtitle">
							<a href="reviewdetail?idno=${game.idno}&rvno=${list.rvno}">${list.rtitle}</a>
						</div>
						<div class="rdiv3">
							<div class="rdiv4">
								<img src="resources/image/user.png" width="20px" height="20px">
								${list.nickname}
							</div>
							<div class="rdiv4">
								<img src="resources/image/date.png" width="20px" height="20px">
								${list.rvredate}
							</div>
						</div>
					</div>
					<div class="score">${list.score}</div>				
				</div>
				<div class="rdiv2"></div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/headfoot/footer.jsp" flush="true" />
</body>
</html>