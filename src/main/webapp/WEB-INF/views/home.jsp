<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Main</title>	
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>	
	<link rel="stylesheet" type="text/css" href="resources/myLib/footerStyle.css">
</head>
<body>	
		
	<div style="position: fixed; z-index: 50">
		<jsp:include page="/WEB-INF/views/headfoot/header.jsp" flush="true" />
	</div>
	<div style="position: relative;">
		<img src="resources/image/space.jpg" width="100%" height="400px">	
		<div style="position: absolute; width: 100%; bottom: 140px;
		 font-size: 4em; font-weight: bold; color: white" align="center">
		 	사이트 이름
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/headfoot/footer.jsp" flush="true" />
</body>
</html>
