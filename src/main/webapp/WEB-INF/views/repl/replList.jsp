<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리플 리스트</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/replLib/rreplInsert.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/myLib/replLib/rreplinsert.css">
<link rel="stylesheet" type="text/css"
	href="resources/myLib/replLib/replList.css">

</head>
<body>
<c:if test="${message != null}">
	${message}
</c:if>
	<div id="iddiv">
	
	
	<c:forEach var="relist" items="${repls}">
	
		<div id="pl${relist.replno}">
			<div class="repldiv2">${relist.nickname}</div>
			<div class="repldiv2">${relist.rpcontents}</div>
			<div class="rpbott repldiv2">
				<span class="rpbtn"><img src="resources/image/likeoff.png"
					width="15px" height="15px"></span> <span class="rpbtn"><img
					src="resources/image/dislikeoff.png" width="15px" height="15px"></span>
				<span class="rpbtn" id="rrpl${relist.replno}">답글 작성</span>
					
			
				<div id="viewrrpl${relist.replno}" class="viewrrpl">답글 보기</div>
				
				<div id="insertrrpl${relist.replno}" class="insertrrpl">
				<form>
					<input type="hidden" id="rootrepl${relist.replno}"
						value="${relist.replno}" name="root" >
					<input type="hidden" id="noviewrrpl${relist.replno}"
						value="${relist.root}">
						<input type="hidden" id="steprepl${relist.replno}"
						value="1" name="step" >
					 <input type="hidden"
						id="rvnorepl${relist.replno}" value="${review.rvno}" name="rvno">
					<textarea id="repl${relist.replno}" class="rrepl" name="rpcontents"
						placeholder="답글 작성하기......" cols="100" rows="5"></textarea>
					<div class="rreplbtndiv" id="btnrepl${relist.replno}">
						<input type="reset" value="취소" class="rreplrsbtn"> <input
							id="subrepl${relist.replno}" type="submit" value="작성"
							class="rreplsubtn"  disabled>
					</div>
					</form>
				</div>
				<div class="rreplresult" id="divviewrrpl${relist.replno}">	
							
				</div>
				<div>
				
				</div>
			</div>
		</div>
	</c:forEach>
	</div>
</body>
</html>