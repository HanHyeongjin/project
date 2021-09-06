<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game INFO</title>
</head>
<body>
	<div style="position: fixed; z-index: 50"><jsp:include page="/WEB-INF/views/headfoot/header.jsp" flush="true" /></div>
		<div style="position: relative;">
			<img src="${game.img}" width="100%" height="400px">	
			<div style="position: absolute; width: 100%; bottom: 140px;" align="center">
				 <span style=" font-size: 4em; font-weight: bold; color: white">${game.gname}</span><br>
				 <span style=" font-size: 1.5em; font-weight: bold; color: white">${game.service}</span>				 
			</div>
		</div>
		
	
	
	<jsp:include page="/WEB-INF/views/headfoot/footer.jsp" flush="true" />
</body>
</html>