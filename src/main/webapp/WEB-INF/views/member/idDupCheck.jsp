<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** I D 중복 확인 **</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/memberStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/inCheck.js"></script>
<script>
// 사용자가 입력한 id를 사용가능하도록 해주고, 현재(this)창은 close 
function idOK(){
//	opener.document.getElementById('id').value='${newID}';
	opener.$('#id').val('${newID}');
	// <script>에서 EL은 문자열Type 내부에서 사용가능함
	opener.document.getElementById('submit').disabled='';
/* 	opener.document.getElementById('idDup').disabled='disabled'; */
	
	//부모창의 id는 readonly, password에는 focus
	// ** JQ 방식으로 속성 접근
	//=> attr, prop
	//=> attr()는 HTML의 속성(Attribute), 기능, 입력된 값을 취급
	//=> prop()는 JavaScript의 프로퍼티(Property), 실제값, Property가 가지는 본연의 값
//	opener.$('#id').attr('readonly', 'readonly');
	opener.$('#id').prop('readonly',true);
	opener.$('#password').focus();
	
	// => 현재(this)창은 close 
	window.close(); // OK
	// self.close(); // OK
	
}//idOk
</script>
<style>
   body {
      background: #E6E6FA;
      font-family: 맑은고딕;
   }
   #wrap {
      margin-left: 0;
      text-align: center;
   }
   h3 {
      color: #00008B; 
   }

</style>
</head>
<body>
<div id="wrap">
<h2>** I D 중복 확인 **</h2>
	<form action="idCheck" method="post">
	UserID :
	 <input type="text" id="id" name="id">&nbsp;
	 <input type="submit" value="ID중복확인" onclick="return idCheck()"><br>
				 <!-- inCheck.js 의  idCheck() 의 결과에 따라 submit 결정-->
	<span id="iMessage" class="eMessage"></span>
	</form>
	<br><br><hr><hr>
	<div id="msgBlock">
		<c:if test="${idUse == 'T'}">
			${newID}는 사용가능 합니다
			<input type="button" value="idOK" onclick="idOK()">
		</c:if>
		
		<c:if test="${idUse == 'F' }">
			${newID}는 이미 사용중 입니다<br>
			다시 입력하세요
			<script>
				$('#id').focus();
				opener.document.getElementById('id').value='';
			</script>	
		</c:if>
	
	</div>
</div>
</body>
</html>