<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/member/memberStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/member/IDfind.js"></script>
<script>

var nCheck=false;
var tCheck=false;

$(function(){
	$('#name').focus();
	$('#name').focusout(function(){
		nCheck=naCheck();
		tCheck=telCheck();
		if(nCheck && tCheck){
			$('#next_button').prop("disabled",false);
		}else $('#next_button').prop("disabled",true);
	})//
	
	$('#tel').focusout(function() {
		nCheck=naCheck();
		tCheck=telCheck();
		if(nCheck && tCheck){
			$('#next_button').prop("disabled",false);
		}else $('#next_button').prop("disabled",true);
		
	}); 
	
	
}); //ready




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
	<div style="position: fixed; z-index: 50"><jsp:include page="/WEB-INF/views/headfoot/header.jsp" flush="true" /></div>
	<div style="position: relative;">
		<img src="resources/image/space.jpg" width="100%" height="400px">	
		<div style="position: absolute; width: 100%; bottom: 140px;
			 font-size: 4em; font-weight: bold; color: white" align="center">
			 아이디 찾기
		</div>
	</div>	
<div align="center" class="container">	
<form id="findid-box">	
<table >
	<tr>
  		<td class="blind">이름</td>
  	</tr>
  	<tr>
  		<td style="padding-bottom: 30px">
  			<input type="text" id="name" name="name" style="height: 30px" size="50" placeholder="이름을 입력하세요"><br>
  			<span id="nMessage" class="eMessage"></span>
  		</td>
  	</tr>
  	<tr>
  		<td class="blind">휴대폰 번호</td>
  	</tr>
  	<tr>
  		<td style="padding-bottom: 30px">
  			<input type="tel" name="tel" id="tel" style="height: 30px" size="50" placeholder="(-)없이 입력해주세요">
  				<!-- <a href="https://www.naver.com"  class="button_login" ><span class="">인증번호 받기</span></a> -->
  		<br>
  	
  			<span id="tMessage" class="eMessage"></span>
  		</td>
  	</tr>
 <!-- 	 <tr>
 	 	<td >
 	 	<span id="span_phoneAuthNo" class="phold">인증번호 6자리 숫자 입력</span><br>
 	 
		<input type="text" id="phoneAuthNo" name="phoneAuthNo"  maxlength="6"  style="width:217px" ><br>
 	 	</td>
 	 </tr> -->	
  	<tr>
  		<td style="padding-top: 30px">
  			<input type="button" id="next_button" class="button_login" value="확인" disabled="disabled">
  		</td>
  	</tr>
</table>
</form>
</div>
<div id="iddiv"></div>
<jsp:include page="/WEB-INF/views/headfoot/footer.jsp" flush="true" />
</body>
</html>