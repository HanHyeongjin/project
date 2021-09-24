<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** I D 중복 확인 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/member/memberStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/member/IDfind.js"></script>
<script>
	
</script>
<style>
#findid-box{
	margin: 0px 10px 8px 10px;
    padding: 10px;
    border: solid 10px #dadada;
    width: 1000px;
    background-color: rgba( 255, 255, 255, 0.5 );
}
</style>
</head>
<body>
	
<div align="center" class="container">	
<form action="findid" method="get" id="findid-box">	
<table >
	<tr>
  		<td class="blind">아이디</td>
  	</tr>
  	<c:if test="${message != null} "><tr><td>${message != null}</td></tr></c:if>
  	<c:forEach var="list" items="${findid}"><tr><td>가입하신 아이디는 ${list.id} 입니다.</td></tr></c:forEach>
</table>
</form>
</div>
</body>
</html>