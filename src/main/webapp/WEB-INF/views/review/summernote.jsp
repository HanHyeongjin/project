<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>썸머노트</title>
<link rel="stylesheet" type="text/css"
	href="resources/myLib/reviewLib/reviewinsert.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="resources/myLib/reviewLib/reviewinsert.js"></script>
</head>
<body>
	
	<form action="reviewinsert" method="get">
		<div class="reviewform">
			<div class="hrdiv" align="left">리뷰 작성</div>
			<div align="center"><span>게임에 대한 리뷰와 평점을 작성해 주세요.<br>
				평점 주기를 한번 클릭 후 평점을 줄 수 있습니다.<br>
				평점을 준 후 평점주기를 다시한번 클릭시 평점을 다시 줄 수 있습니다.</span><br>
				<span style="color: DarkRed;" >* 과도한 욕설 및 비방등을 작설할 경우 사이트 이용에 제한이 걸릴 수 있습니다. *</span>
			</div>
			<div class="hrdiv2"></div>
			<div style="display: flex;">
				<div class="titlediv">
					<div class="texttitle">제목</div>
					<input type="text" class="title" name="rtitle">
				</div>
				<div class="titlediv2">
					<div class="texttitle">평점 <span class="resets">평점 주기</span></div>
					<div style="display: flex;">
						<div class="stars">
							<span id="s1" class="s" >★</span> <span id="s2" class="s">★</span>
							<span id="s3" class="s">★</span> <span id="s4"  class="s">★</span>
							<span id="s5" class="s">★</span>							
						</div>
						<div class="inputstar">
							<input id="display" value="0" size="1" name="score" readonly="readonly"> 점
						</div>
					</div>
				</div>
			</div>
			<div class="hrdiv2" align="left"></div>
			<div class="texttitle">내용</div>
			<textarea id="summernote" name="rcontents">
      
     </textarea>
			<script>
<<<<<<< HEAD
				$('#summernote').summernote({
					tabSize : 2,
					height : "auto",
					minHeight : 300
				});
=======
				$('#summernote')
						.summernote(
								{										
									tabsize : 2,
									height: 300
								});
>>>>>>> branch 'master' of https://github.com/HanHyeongjin/project.git
			</script>
			<div class="submitbtn" align="right">
				<input type="text" name="idno" value="${game.idno}" hidden="true"> 
				<input type="submit" value="작성하기" class="submit">
			</div>
		</div>
	</form>
</body>
</html>