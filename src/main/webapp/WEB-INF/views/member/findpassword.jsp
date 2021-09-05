<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/memberStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div style="position: fixed; z-index: 50"><jsp:include page="/WEB-INF/views/headfoot/header.jsp" flush="true" /></div>
	<div style="position: relative;">
		<img src="resources/image/space.jpg" width="100%" height="400px">	
		<div style="position: absolute; width: 100%; bottom: 140px;
			 font-size: 4em; font-weight: bold; color: white" align="center">
			회원 비밀번호 찾기
		</div>
	</div>
<table align="center">
	<tr><td align="center"></td>
	<tr><td class="blind">아이디&nbsp;</td></tr>
	<tr><td style="padding-bottom: 20px"><input type="text" size="40" style="height: 30px" class="id"></td></tr>
	<tr><td class="blind">이메일&nbsp;</td></tr>
	<tr><td><input type="email" size="40" style="height: 30px" id="domain" name="email">@
	  <input type="email" id="domain" size="40" style="height: 30px" name="email">
	  </td>
	</tr>
  <tr>
  <td align="right" style="padding-top: 20px" class="blind"><input type="submit" id="next_button" class="button_login" value="확인"></td>
  </tr>
</table>	


</body>
</html>