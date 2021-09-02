<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game List</title>
</head>
<body>	

	<div style="position: fixed; z-index: 50"><jsp:include page="/WEB-INF/views/game/header.jsp" flush="true" /></div>
	<div style="position: relative;">
		<img src="resources/image/space.jpg" width="100%" height="400px">	
		<div style="position: absolute; width: 100%; bottom: 140px;
			 font-size: 4em; font-weight: bold; color: white" align="center">
			 게임 순위
		</div>
	</div>
	
	<table  style="width: 50%;  margin-top: 30px; position: relative;" align = "center">
		<tr height="30" bgcolor="LightSteelBlue ">
			<th>순위</th><th>게임명</th><th>장르</th><th>평점</th></tr>
		<c:forEach var="list" items="${games}" >
		<tr height="30" align="center">
			<td>${list.grank}</td><td>${list.gname}</td>
			<td>${list.categories2}</td><td>${list.grade}</td>	
		</tr>
	</c:forEach>
	</table>

</body>
</html>