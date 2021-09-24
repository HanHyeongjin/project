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
<script src="resources/myLib/replLib/rpupdateDelete.js"></script>
<script src="resources/myLib/replLib/rplike.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/myLib/replLib/rreplinsert.css">
<link rel="stylesheet" type="text/css"
	href="resources/myLib/replLib/replList.css">

</head>
<body>
	<div style="display: none">
		<div id="likeon"><img src="resources/image/likeon.png"width="15px" height="15px"></div>
		<div id="likeoff"><img src="resources/image/likeoff.png"width="15px" height="15px"></div>
		<div id="dislikeoff"><img src="resources/image/dislikeoff.png" width="15px" height="15px"></div>
		<div id="dislikeon"><img src="resources/image/dislikeon.png" width="15px" height="15px"></div>
	</div>
	<div style="width: 70%">
		<c:forEach var="relist" items="${repls}">
		<div style="display: flex;">
			<div class="repldiv" style="width: 100%;">
				<div style="display: flex;">
					<div class="userimg">
						<img src="resources/image/user.png" width="50" height="50">
					</div>
					<div style="width: 100%;">
						<div class="repldiv2">${relist.nickname}</div>
						<div class="repldiv2">
							<textarea class="rpcontentsarea rpup subcoupdate${relist.replno}" id="coupdate${relist.replno}" disabled="disabled">${relist.rpcontents}</textarea>
							<div class="rreplbtndiv" id="btnupdate${relist.replno}">
								<input type="button" value="취소" class=" updatecancel" id="date${relist.replno}"> 
								<input id="subcoupdate${relist.replno}" type="button" value="수정"
									class="rpupbtn" >
									<input type="hidden" id="rpnosubcoupdate${relist.replno}" value="${relist.replno}" >
							</div>
						</div>
					</div>
					
				</div>
				
				<div class="rpbott repldiv2">
				<c:choose>
				<c:when test="${loginID != null}">
					<c:choose>
						<c:when test="${relist.rplionoff == 1}">
						<span class="rpbtn like checked rpdislike${relist.replno}" id="rplike${relist.replno}"><img src="resources/image/likeon.png"width="15px" height="15px">
						<c:choose><c:when test="${relist.rplicount>0}">  ${relist.rplicount}</c:when></c:choose></span> 
						<span class="rpbtn dislike rplike${relist.replno}"id="rpdislike${relist.replno}"><img src="resources/image/dislikeoff.png" width="15px" height="15px">
						<c:choose><c:when test="${relist.rpdislicount>0}">  ${relist.rpdislicount}</c:when></c:choose></span>						
						</c:when>	
						<c:when test="${relist.rplionoff ==2}">
						<span class="rpbtn like rpdislike${relist.replno}"id="rplike${relist.replno}"><img src="resources/image/likeoff.png"width="15px" height="15px">
						<c:choose><c:when test="${relist.rplicount>0}">  ${relist.rplicount}</c:when></c:choose></span> 
						<span class="rpbtn dislike checked rplike${relist.replno}"id="rpdislike${relist.replno}"><img src="resources/image/dislikeon.png" width="15px" height="15px">
						<c:choose><c:when test="${relist.rpdislicount>0}">  ${relist.rpdislicount}</c:when></c:choose></span>	
						</c:when>	
						<c:otherwise>
						<span class="rpbtn like rpdislike${relist.replno}"id="rplike${relist.replno}"><img src="resources/image/likeoff.png"width="15px" height="15px">
						<c:choose><c:when test="${relist.rplicount>0}">  ${relist.rplicount}</c:when></c:choose></span> 
						<span class="rpbtn dislike rplike${relist.replno}"id="rpdislike${relist.replno}"><img src="resources/image/dislikeoff.png" width="15px" height="15px">
						<c:choose><c:when test="${relist.rpdislicount>0}">  ${relist.rpdislicount}</c:when></c:choose></span>	
						</c:otherwise>				
					</c:choose>
					</c:when>
					<c:otherwise>
						<span class="rpbtn"><a href="loginf"><img src="resources/image/likeoff.png"width="15px" height="15px"></a>
						<c:choose><c:when test="${relist.rplicount>0}">  ${relist.rplicount}</c:when></c:choose></span> 
						<span class="rpbtn"><a href="loginf"><img src="resources/image/dislikeoff.png" width="15px" height="15px"></a>
						<c:choose><c:when test="${relist.rpdislicount>0}">  ${relist.rpdislicount}</c:when></c:choose></span>	
					</c:otherwise>
					</c:choose>
					<input type="hidden" class="rpnorplike${relist.replno} rpnorpdislike${relist.replno}" value="${relist.replno}" >
					<input type="hidden" class="lirplike${relist.replno} lirpdislike${relist.replno}" value="${relist.rplicount}" >
					<input type="hidden" class="dlirplike${relist.replno} dlirpdislike${relist.replno}" value="${relist.rpdislicount}" >
					
					<span class="rpbtn" id="rrpl${relist.replno}"> <img
						src="resources/image/write.png" width="15px" height="15px">
						답글 작성
					</span>


					<div id="insertrrpl${relist.replno}" class="insertrrpl">
						<form>
							<input type="hidden" id="rootsubrepl${relist.replno}"
								value="${relist.root}"> <input type="hidden"
								id="noviewrrpl${relist.replno}" value="${relist.root}">
							<input type="hidden" id="rvnosubrepl${relist.replno}"
								value="${relist.rvno}">
								
							<c:if test="${loginID != null}">
							<textarea id="repl${relist.replno}"
								class="rrepl rreplsubrepl${relist.replno}" name="rpcontents"
								placeholder="답글 작성하기......" cols="100" rows="5"></textarea>
								<div class="rreplbtndiv" id="btnrepl${relist.replno}">
								<input type="reset" value="취소" class="rreplrsbtn"> <input
									id="subrepl${relist.replno}" type="button" value="작성"
									class="rreplsubtn" disabled>
							</div>
								</c:if>
								<c:if test="${loginID == null}">
							<textarea id="repl${relist.replno}"
								class="rrepl rreplsubrepl${relist.replno}" name="rpcontents"
								placeholder="로그인 후 이용 가능 합니다." cols="100" rows="5" disabled="disabled"></textarea>
								</c:if>
							
						</form>
					</div>
					<c:if test="${relist.rreplcount != 0}">
						<div id="viewrrpl${relist.replno}"
							class="viewrrpl divsubrepl${relist.replno}">▼ 답글 보기</div>
					</c:if>
					<div
						class="resultrepl${relist.replno} viewsubrepl${relist.replno} rreplresult"
						id="divviewrrpl${relist.replno}"></div>
				</div>
			</div>
			
			<c:if test="${loginID == relist.id}">
						<div class="rmenubar">
							<div class="viewmenu" id="te${relist.replno}">
								<img src="resources/image/rpmenu.png" width="15" height="15">
							</div>
							<div class="upanddel" id="updelete${relist.replno}">
								<div class="rpmenu rpupdate" id="update${relist.replno}">
									<img src="resources/image/update.png" width="15" height="15">수정
								</div>
								<div  class="rpmenu rpdelete" id="bcoupdate${relist.replno}">
									<img src="resources/image/delete.png" width="15" height="15">삭제
								</div>
							</div>
						</div>
					</c:if>
					
					</div>
		</c:forEach>
	</div>
</body>
</html>