<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 리스트</title>



</head>
<body>
	<jsp:include page="/WEB-INF/views/headfoot/gameTopBar.jsp" flush="true" />

		<div class="hrdiv">댓글</div>
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
							<div class="rdiv4">
								<img src="resources/image/write.png" width="20px" height="20px">
								${list.rpcount}
							</div>
						</div>
					</div>
					<div class="score">${list.score}</div>				
				</div>
				<div class="rdiv2"></div>
			</c:forEach>
		</div>
	
		<jsp:include page="/WEB-INF/views/headfoot/footer.jsp" flush="true" />
</body>
</html>