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
	<div id="iddiv"></div>	
	<c:forEach var="relist" items="${repls}">
			<div class="repldiv">
			<div style="display: flex;">
			<div class="userimg"><img src="resources/image/user.png" width="50" height="50"></div>
			<div>
			<div class="repldiv2">${relist.nickname}</div>
			<div class="repldiv2">${relist.rpcontents}</div>
			</div>
			</div>
			<div class="rpbott repldiv2">
				<span class="rpbtn"><img src="resources/image/likeoff.png"
					width="15px" height="15px"></span> <span class="rpbtn"><img
					src="resources/image/dislikeoff.png" width="15px" height="15px"></span>
				<span class="rpbtn" id="rrpl${relist.replno}">답글 작성</span>
					
				
				<div id="insertrrpl${relist.replno}" class="insertrrpl">
				<form>
					<input type="hidden" id="rootsubrepl${relist.replno}"
						value="${relist.root}" >
					<input type="hidden" id="noviewrrpl${relist.replno}"
						value="${relist.root}">						
					 <input type="hidden"
						id="rvnosubrepl${relist.replno}" value="${relist.rvno}">
					<textarea id="repl${relist.replno}" class="rrepl rreplsubrepl${relist.replno}" name="rpcontents"
						placeholder="답글 작성하기......" cols="100" rows="5"></textarea>
					<div class="rreplbtndiv" id="btnrepl${relist.replno}">
						<input type="reset" value="취소" class="rreplrsbtn"> 
						<input id="subrepl${relist.replno}" type="button" value="작성"
							class="rreplsubtn"  disabled>
					</div>
					</form>
				</div>
				<c:if test="${relist.rreplcount != 0}">
				<div id="viewrrpl${relist.replno}" class="viewrrpl">▼ 답글 보기</div>
				</c:if>
				<div class="resultrepl${relist.replno} rreplresult" id="divviewrrpl${relist.replno}"></div>
				<div>				
				</div>
			</div>
			</div>
	</c:forEach>
	
</body>
</html>