<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 추가</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<style>
	.td1{
		background: black;
		color: orange;
		font-size: 1.5em;
		font-weight: bold;
		align-items: center;
		border-radius: 10px; 
		text-align: center;
	}


</style>
</head>
<body>
<div style="position: fixed; z-index: 50"><jsp:include page="/WEB-INF/views/game/header.jsp" flush="true" /></div>
<div style="position: relative;">
		<img src="resources/image/space.jpg" width="100%" height="400px">	
		<div style="position: absolute; width: 100%; bottom: 140px;
			 font-size: 4em; font-weight: bold; color: white" align="center">
			 게임 추가
		</div>
</div>
	<form action="gameinsert" method="post" enctype="multipart/form-data">
		<table style="width: 50%;  margin-top: 30px; position: relative;" align = "center">
			<tr><td class="td1">게임 이름</td>
			<td><input type="text" name="gname" id="gname" class="in"></td>
			<td rowspan="4" class="td1">이미지 선택</td>
			<td rowspan="4" align="center">
			<img  src="" class="select_img"><br>
			<input type="file" name="imgf" id="imgf" style="width: 300px; height: 200px;">
			<script>
        		 $('#imgf').change(function(){
         		   if(this.files && this.files[0]) {
         		      var reader = new FileReader;
          		         reader.onload = function(e) {
          		         $(".select_img").attr("src", e.target.result)
           	           .width(300).height(200); 
           		  	      } // onload_function
           		        reader.readAsDataURL(this.files[0]);
         		    } // if
       			 }); // change   
       		 </script>
			</td>
			<tr><td class="td1">게임 회사</td><td><input type="text" name="gservice" id="gservice"></td>
			<tr><td class="td1">장르</td><td>  
				<input type="radio" id="online" name="categories1" value="온라인">
  				<label for="online">온라인</label><br>
  				<input type="radio" id="mobile" name="categories1" value="모바일">
  				<label for="mobile">모바일</label><br>
  				</td>
			<tr><td class="td1">세부 장르</td><td><input type="text" name="categories2" id="categories2"></td>
			<tr><td class="td1">게임 소개</td><td colspan="3"><textarea name="contents" rows="30px" style="width:100%"></textarea></td>
			<tr><td></td><td colspan="4" align ="right"><input type="submit" value="추가하기"></td></tr>
		</table>
	</form>

</body>
</html>