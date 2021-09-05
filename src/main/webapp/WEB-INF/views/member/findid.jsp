<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/memberStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>

var iCheck=false;
var tCheck=false;

$(function(){
	$('#id').focus();
	$('#id').focusout(function(){
		iCheck=idCheck();
		
	})//id_focusout
	
	$('#tel').focusout(function() {
		tCheck=telCheck();
		
	}); 
	
}); //ready

function inCheck(){
	if(iCheck == false){
		$('#iMessage').html('ID를 입력하세요');
	}
	if(tCheck == false){
		$('#tMessage').html('번호를 입력하세요');
	}
	if(iCheck && tCheck) return true;
	else return false;
}//incheck

</script>
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
  <tr><td style="padding-bottom: 30px"><input type="text" id="id" style="height: 30px" size="50" placeholder="이름을 입력하세요"></td></tr>
  <tr><td class="blind">휴대폰 번호</td></tr>
  <tr><td style="padding-bottom: 30px"><input type="tel" id="tel" style="height: 30px" size="50" placeholder="(-)없이 입력해주세요"></td></tr>
  
  <tr><td align="right" style="margin-right: 0"><input type="submit" id="next_button" class="button_login" value="확인"></td></tr>
  </table>
 <%--  <jsp:include page="/WEB-INF/views/game/footer.jsp" flush="true" /> --%>
</body>
</html>