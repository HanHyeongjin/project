<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세 및 댓글 작성</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/myLib/reviewLib/rdetail.css">
<script src="resources/myLib/replLib/replInsert.js"></script>
<script src="resources/myLib/reviewLib/rplistType.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/myLib/replLib/replinsert.css">

<script>
$(function () {
	for(var i = 0; i<=${review.score}; i++){
		$('.stars > span:nth-child('+i+')').addClass("star");
	}
});
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

		<div class="contents" style="width: 70%">${review.rcontents}</div>
		<div class="hrdiv">댓글</div>
		<div>
			<form>
				<input type="hidden" id="replrvno" value="${review.rvno}">
				<textarea id="repl" class="repl" name="rpcontents"
					placeholder="댓글 작성하기......" cols="100" rows="5"></textarea>
				<div class="replbtndiv">
					<input type="reset" value="취소" class="replrsbtn"> <input
						type="button" id="replsumit" value="작성" class="replsubtn" disabled>
				</div>
			</form>
			<div class="rvrpinfo">
				<div style="margin-right: 80px">댓글 ${review.rpcount}개</div>
				<div>
					<div class="listType">
						<img src="resources/image/rplist.png" width="20px" height="20px">
						정렬 기준
					</div>
					<div class="selectrplist">
						<div id="poplist">인기 댓글순</div>
						<div id="reclist" class="selected">최신 댓글순</div>
						<div id="mylist">내가 쓴 댓글</div>
					</div>
				</div>
			</div>
			<div id="replListf"></div>
		</div>
	</div>

</body>
</html>