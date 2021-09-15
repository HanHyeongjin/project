<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리플 리스트</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/replLib/rplist.js"></script>
<script src="resources/myLib/replLib/replInsert2.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/myLib/replLib/replinsert2.css">
<link rel="stylesheet" type="text/css"
	href="resources/myLib/replLib/replList.css">

</head>
<body>
	<c:forEach var="relist" items="${repls}" varStatus="vs">
		<div class="repldiv">
			<div class="repldiv2">${relist.nickname}</div>
			<div class="repldiv2">${relist.rpcontents}</div>
			<div class="rpbott repldiv2">
				<span class="rpbtn"><img src="resources/image/likeoff.png"
					width="15px" height="15px"></span> <span class="rpbtn"><img
					src="resources/image/dislikeoff.png" width="15px" height="15px"></span>
				<span class="rpbtn" id="rrpl${relist.replno}">답글 작성</span>
				<div id="insertrrpl${relist.replno}" class="insertrrpl">
				<form>
					<input type="hidden" id="rootrepl${relist.replno}"
						value="${relist.replno}" name="root" >
						<input type="hidden" id="steprepl${relist.replno}"
						value="1" name="step" >
					 <input type="hidden"
						id="rvnorepl${relist.replno}" value="${review.rvno}" name="rvno">
					<textarea id="repl${relist.replno}" class="rrepl" name="rpcontents"
						placeholder="답글 작성하기......" cols="100" rows="5"></textarea>
					<div class="rreplbtndiv" id="btnrepl${relist.replno}">
						<input type="reset" value="취소" class="rreplrsbtn"> <input
							id="subrepl${relist.replno}" type="submit" value="작성"
							class="rreplsubtn" disabled>
					</div>
					</form>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>