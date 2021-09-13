<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 수정</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
<style>
table{
	border:1px solid #444444;
	border-collapse: collapse;
	text-align: center;
	font-size: 30px;
	
}

td {
    border: 1px solid #444444;
  }

tr{
 width: 100px;
 height: 100px;
}
.box{
cursor: pointer;
color:orange;
background-color:black;
border-radius: 10px;
width: 100px;
height: 50px;
font-size:30px;
}

.upbox{
widows: 70px;
height: 30px;
}
</style>
</head>
<body>

<div style="position: fixed; z-index: 50"><jsp:include page="/WEB-INF/views/headfoot/header.jsp" flush="true" /></div>
	<div style="position: relative;">
		<img src="resources/image/space.jpg" width="100%" height="400px">	
		<div style="position: absolute; width: 100%; bottom: 140px;
			 font-size: 4em; font-weight: bold; color: white" align="center">
			 내정보 수정
		</div>
	</div>
<table align="center" style="width: 1000px">
	<tr>
		<td bgcolor="Gainsboro">아이디</td>
		<td>
			<input type="text" name="id" size="20" class="upbox" value="${Apple.id}" readonly>
		</td>
		<!-- ** input Tag 입력 막기 
				=> disabled :  서버로 전송 안됨 
				=> readonly :  서버로 전송 됨   -->
	</tr>
	<tr>
		<td bgcolor="Gainsboro">비밀번호</td>
		<td>
			<input type="text" name="password" size="20" class="upbox" value="${Apple.password}">
		</td>
	</tr>
	<tr>
		<td bgcolor="Gainsboro">닉네임</td>
		<td>
			<input type="text" name="nickname" size="20" class="upbox" value="${Apple.nickname}">
		</td>
	</tr>
	<tr>
		<td bgcolor="Gainsboro">핸드폰번호</td>
		<td>
			<input type="text" name="tel" size="20" class="upbox" value="${Apple.tel}">
		</td>
	</tr>
	<tr>
		<td bgcolor="Gainsboro">이메일</td>
		<td><input type="text" name="email" size="20" class="upbox" value="${Apple.email}"></td>
	</tr>
	
</table>
<table  align="center" style="width: 1000px">
	<tr>
		<td >
			<input type="submit" value="수정" class="box">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="취소" class="box">
		</td>
	</tr>
</table>
<c:if test="${message != null}">
	<br>${message}<br><br>	
</c:if>
<jsp:include page="/WEB-INF/views/headfoot/footer.jsp" flush="true" />
</body>
</html>