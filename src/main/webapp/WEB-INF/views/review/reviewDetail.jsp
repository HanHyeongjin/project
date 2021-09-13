<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/reviewLib/reviewRelp.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/myLib/reviewLib/rdetail.css">
<script>
var reCheck=false;
	$(function () {		
		$('.repl').focus(function() {
			$('.repl').css({
				borderColor: "black"
			});
			$('.replbtndiv').css({
				visibility: "visible"
			});
		});//focus
		
		$('.repl').focusout(function() {
			$('.repl').css({
				borderColor: "rgba(0, 0, 0, 0.15)"
			});
		});//focusout
		$('#repl').keyup(function() {
			reCheck = rCheck();
			if(reCheck == true){
				$('.replsubtn').prop("disabled",false).css({
					background :"OrangeRed",
					color:"white"
				});
			}else if(reCheck == false){
				$('.replsubtn').prop("disabled",true).css({
					background :"rgba(0, 0, 0, 0.15)",
					color:"black"
			});
		}
	});//repl.keyup
	
	if(${review.score} == 1){
		$('#s1').addClass("star");
	}else if(${review.score} == 2){
		$('#s1').addClass("star");
		$('#s2').addClass("star");
	}else if(${review.score} == 3){
		$('#s1').addClass("star");
		$('#s2').addClass("star");
		$('#s3').addClass("star");
	}else if(${review.score} == 4){
		$('#s1').addClass("star");
		$('#s2').addClass("star");
		$('#s3').addClass("star");
		$('#s4').addClass("star");
	}else if(${review.score} == 5){
		$('.s').addClass("star");
	}
});//ready
function rCheck(){
	var repl=$('#repl').val().replace(/\s|　/gi, '');		
	if(repl.length == 0 ){
		return false;				
	}
	else {
		return true;
	}
	
}//rCheck

	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/headfoot/gameTopBar.jsp" flush="true" />

	<div class="rdbody">
		<div class="title">${review.rtitle}</div>
		<div style="display: flex;">

			<div class="rdiv1">
				<img src="resources/image/user.png" width="20px" height="20px">
				${review.nickname}
			</div>
			<div class="rdiv1">
				<img src="resources/image/date.png" width="20px" height="20px">
				${review.rvredate}
			</div>
			<div class="stars">
				<span id="s1" class="s">★</span> <span id="s2" class="s">★</span> <span
					id="s3" class="s">★</span> <span id="s4" class="s">★</span> <span
					id="s5" class="s">★</span>
			</div>
		</div>
		<div class="hrdiv"></div>
		<div class="contents">${review.rcontents}</div>
		<div class="hrdiv">댓글</div>
		<div>
			<form>
				<input id="repl" class="repl" type="text"
					placeholder="댓글 작성하기......">
				<div class="replbtndiv">
					<input type="reset" value="취소" class="replrsbtn"> <input
						type="submit" value="작성" class="replsubtn" disabled>
				</div>
				<!-- <div class=""></div> -->
			</form>

		</div>
	</div>
	<jsp:include page="/WEB-INF/views/headfoot/footer.jsp" flush="true" />
</body>
</html>