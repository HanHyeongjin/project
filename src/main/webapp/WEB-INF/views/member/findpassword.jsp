<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/memberStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/inCheck.js"></script>
<script>

var iCheck=false;
var tCheck=false;

$(function(){
	$('#id').focus();
	$('#id').focusout(function(){
		iCheck=idCheck();
		
	})//id_focusout
	
	$('#email').focusout(function() {
		eCheck=emCheck();
		
	}); 
	
}); //ready

function inCheck(){
	if(iCheck == false){
		$('#iMessage').html('ID를 입력하세요');
	}
	if(tCheck == false){
		$('#eMessage').html('이메일을 입력하세요');
	}
	if(iCheck && eCheck) return true;
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
			회원 비밀번호 찾기
		</div>
	</div>
<table align="center">
	<tr>
		<td class="blind">아이디&nbsp;</td>
	</tr>
	<tr>
		<td style="padding-bottom: 20px">
		<input type="text" size="40" style="height: 30px" class="id"><br>
		<span id="iMessage" class="eMessage"></span>
		</td>
	</tr>
	<tr>
		<td class="blind">이메일&nbsp;</td>
	</tr>
	<tr>
		<td>
			<input type="email" size="30" style="height: 30px" id="domain" name="email">@
	  		<input type="email" id="domain" size="30" style="height: 30px" name="email"><br>
	  		<span id="eMessage" class="eMessage"></span>
	  	</td>
	</tr>
  	<tr>
 	 	<td align="right" style="padding-top: 20px" class="blind">
 	 	<input type="submit" id="next_button" class="button_login" value="확인" onclick="return inCheck()"></td>
  	</tr>
</table>	

<jsp:include page="/WEB-INF/views/headfoot/footer.jsp" flush="true" />
</body>
</html>