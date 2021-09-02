<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/memberStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div style="position: fixed; z-index: 50"><jsp:include page="/WEB-INF/views/headfoot/header.jsp" flush="true" /></div>
	<div style="position: relative;">
		<img src="resources/image/space.jpg" width="100%" height="400px">	
		<div style="position: absolute; width: 100%; bottom: 140px;
			 font-size: 4em; font-weight: bold; color: white" align="center">
			 아이디 찾기
		</div>
	</div>	
 <table action="findid" align="center">
  <tr><td class="blind">이름</td></tr>
  <tr><td style="padding-bottom: 30px"><input type="text" style="height: 30px" size="50" placeholder="이름을 입력하세요"></td></tr>
  <tr><td class="blind">휴대폰 번호</td></tr>
  <tr><td style="padding-bottom: 30px"><input type="tel" style="height: 30px" size="50" placeholder="(-)없이 입력해주세요"></td></tr>
  <tr><td align="right" style="margin-right: 0"><input id="next_button" value="확인"></td></tr>
  </table>
 <%--  <jsp:include page="/WEB-INF/views/game/footer.jsp" flush="true" /> --%>
</body>
</html>