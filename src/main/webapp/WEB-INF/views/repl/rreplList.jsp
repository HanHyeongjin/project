<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리플 리스트</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/myLib/replLib/rreplinsert.css">
<link rel="stylesheet" type="text/css"
	href="resources/myLib/replLib/replList.css">

</head>
<body>
	<c:forEach var="rrelist" items="${rrepls}">
		<div class="repldiv">
		<div style="display: flex;">
		<div class="userimg"><img src="resources/image/user.png" width="40" height="40"></div>
			<div>
			<div class="repldiv2">${rrelist.nickname}</div>
			<div class="repldiv2">${rrelist.rpcontents}</div>
			</div></div>
			
			<div class="rpbott repldiv2">
				<span class="rpbtn"><img src="resources/image/likeoff.png"
					width="15px" height="15px"></span> <span class="rpbtn"><img
					src="resources/image/dislikeoff.png" width="15px" height="15px"></span>
				
			</div>
			<div id="insertrrpl${rrelist.replno}" class="insertrrpl">
			</div>
		</div>
	</c:forEach>
</body>
</html>