<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/member/memberStyle.css">
	<script src="resources/myLib/member/jquery-3.2.1.min.js"></script>
<script>

</script>
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


.btn_pack{
	cursor: pointer;
	width: 500px;
	height: 70px;
	color:orange;
	background-color:black;
	border-radius: 20px;
}

.btn_r{
float:right;
cursor: pointer;
color:orange;
border-radius: 10px;
}
</style>
</head>
<body>
<div style="position: fixed; z-index: 50"><jsp:include page="/WEB-INF/views/headfoot/header.jsp" flush="true" /></div>
	<div style="position: relative;">
		<img src="resources/image/space.jpg" width="100%" height="400px">	
		<div style="position: absolute; width: 100%; bottom: 140px;
			 font-size: 4em; font-weight: bold; color: white" align="center">
			 MyInfo
		</div>
	</div>
	<table class="" align="center" style="width: 1000px">
	<tr>
		<td bgcolor="Gainsboro ">아이디</td><td>${Apple.id}</td>
	</tr>
	<tr>
		<td bgcolor="Gainsboro " >닉네임 설정</td><td>${Apple.nickname}</td>
	</tr>
	<tr>
		<td bgcolor="Gainsboro " >비밀번호</td><td>${Apple.password}</td>
	</tr>
	<tr>
		<td bgcolor="Gainsboro">이름</td><td>${Apple.name}</td>
	</tr>
	<tr>
		<td bgcolor="Gainsboro" >핸드폰 번호</td><td>${Apple.tel}</td>
	</tr>
	<tr>
		<td bgcolor="Gainsboro" >이메일 주소</td><td>${Apple.email}</td>
	</tr>
	<tr><td colspan="2" align="right"><a href="myinfo?id=${Apple.id}&jcode=U" class="btn_pack">내정보수정</a>&nbsp;&nbsp;
<!-- ** 내정보수정
		=> 내정보를 표시하는 폼이 출력 (mdetail) -> 수정후, 수정버튼 -> 수정 서블릿 
-->
<a href="mdelete?id=${Apple.id}" class="btn_pack">회원탈퇴</a> </td></tr>
</table>
<br><br>

 <form class="btn_r">
<a href="myinfo?id=${Apple.id}&jcode=U" class="btn_pack">내정보수정</a>&nbsp;&nbsp;
<!-- ** 내정보수정
		=> 내정보를 표시하는 폼이 출력 (mdetail) -> 수정후, 수정버튼 -> 수정 서블릿 
-->
<a href="mdelete?id=${Apple.id}" class="btn_pack">회원탈퇴</a> 
	<!-- 관리자가 삭제하는 경우 id 가 필요함 -->
</form> 
<jsp:include page="/WEB-INF/views/headfoot/footer.jsp" flush="true" />
</body>
</html>