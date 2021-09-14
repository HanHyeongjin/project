<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 상단 바</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/gamelib/gameTopStyle.css">
</head>
<body>
	 <div style="position: fixed; z-index: 50"><jsp:include
			page="/WEB-INF/views/headfoot/header.jsp" flush="true" /></div>	
		<img src="${game.img}" width="100%" height="40%">
		<div class="textbox">
			<div class="topimg">
				<img src="${game.img}" width="200px;" height="200px"><br>
				<span
					style="width: 200px; height: 50px; background: black; color: white;">관심목록에
					추가</span>
			</div>
			<div style="float: left; margin: 100px 0 0 6%">
				<span id="intextname" class="intext"
					style="font-size: 4em;">${game.gname}</span><br>
				<span id="intextservice" class="intext"
					style="font-size: 1.5em;">${game.gservice}</span><br>
				<div>
					<c:choose>
						<c:when test="${game.rating ==0}">
							<img src="resources/gameImage/ratall.png">
						</c:when>
						<c:when test="${game.rating ==12}">
							<img src="resources/gameImage/rat12.png">
						</c:when>
						<c:when test="${game.rating ==15}">
							<img src="resources/gameImage/rat15.png">
						</c:when>
						<c:when test="${game.rating ==18}">
							<img src="resources/gameImage/rat18.png">
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>	
</body>
</html>