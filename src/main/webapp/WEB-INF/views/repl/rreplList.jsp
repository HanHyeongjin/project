<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 리스트</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/replLib/rpupdateDelete.js"></script>
<script src="resources/myLib/replLib/rplike.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/myLib/replLib/rreplinsert.css">
<link rel="stylesheet" type="text/css"
	href="resources/myLib/replLib/replList.css">
<link rel="stylesheet" type="text/css"
	href="resources/myLib/replLib/rrpupdateDelete.css">

</head>
<body>
	<div style="width: 100%">
		<c:forEach var="rrelist" items="${rrepls}">
			<div style="display: flex;">
				<div class="repldiv" style="width: 100%;">
					<div style="display: flex;">
						<div class="userimg">
							<img src="resources/image/user.png" width="40" height="40">
						</div>
						<div style="width: 100%;">
							<div class="repldiv2">${rrelist.nickname}</div>
							<div class="repldiv2">
								<textarea class="rpcontentsarea rpup rrpcoupdate${rrelist.replno}"
									id="coupdate${rrelist.replno}" disabled="disabled">${rrelist.rpcontents}</textarea>
								<div class="rreplbtndiv" id="btnupdate${rrelist.replno}">
									<input type="button" value="취소" class=" rrupdatecancel"
										id="date${rrelist.replno}"> <input
										id="rrpcoupdate${rrelist.replno}" type="button" value="수정"
										class="rrpupbtn"> <input type="hidden"
										id="rpnorrpcoupdate${rrelist.replno}" value="${rrelist.replno}" class="rpnotrepl${relist.replno}">
								</div>
							</div>
						</div>
					</div>

					<div class="rpbott repldiv2">
						<c:choose>
						<c:when test="${rrelist.rplionoff == 1}">
						<span class="rpbtn like checked rpdislike${rrelist.replno}" id="rplike${rrelist.replno}"><img src="resources/image/likeon.png"width="15px" height="15px">
						<c:choose><c:when test="${rrelist.rplicount>0}">  ${rrelist.rplicount}</c:when></c:choose></span> 
						<span class="rpbtn dislike rplike${rrelist.replno}"id="rpdislike${rrelist.replno}"><img src="resources/image/dislikeoff.png" width="15px" height="15px">
						<c:choose><c:when test="${rrelist.rpdislicount>0}">  ${rrelist.rpdislicount}</c:when></c:choose></span>						
						</c:when>	
						<c:when test="${rrelist.rplionoff ==2}">
						<span class="rpbtn like rpdislike${rrelist.replno}"id="rplike${rrelist.replno}"><img src="resources/image/likeoff.png"width="15px" height="15px">
						<c:choose><c:when test="${rrelist.rplicount>0}">  ${rrelist.rplicount}</c:when></c:choose></span> 
						<span class="rpbtn dislike checked rplike${rrelist.replno}"id="rpdislike${rrelist.replno}"><img src="resources/image/dislikeon.png" width="15px" height="15px">
						<c:choose><c:when test="${rrelist.rpdislicount>0}">  ${rrelist.rpdislicount}</c:when></c:choose></span>	
						</c:when>	
						<c:otherwise>
						<span class="rpbtn like rpdislike${rrelist.replno}"id="rplike${rrelist.replno}"><img src="resources/image/likeoff.png"width="15px" height="15px">
						<c:choose><c:when test="${rrelist.rplicount>0}">  ${rrelist.rplicount}</c:when></c:choose></span> 
						<span class="rpbtn dislike rplike${rrelist.replno}"id="rpdislike${rrelist.replno}"><img src="resources/image/dislikeoff.png" width="15px" height="15px">
						<c:choose><c:when test="${rrelist.rpdislicount>0}">  ${rrelist.rpdislicount}</c:when></c:choose></span>	
						</c:otherwise>				
					</c:choose>
					<input type="hidden" class="rpnorplike${rrelist.replno} rpnorpdislike${rrelist.replno}" value="${rrelist.replno}" >
					<input type="hidden" class="lirplike${rrelist.replno} lirpdislike${rrelist.replno}" value="${rrelist.rplicount}" >
					<input type="hidden" class="dlirplike${rrelist.replno} dlirpdislike${rrelist.replno}" value="${rrelist.rpdislicount}" >
					

					</div>
					<div id="insertrrpl${rrelist.replno}" class="insertrrpl"></div>
				</div>

				<c:if test="${loginID == rrelist.id}">
					<div class="rmenubar">
						<div class="viewmenu" id="te${rrelist.replno}">
							<img src="resources/image/rpmenu.png" width="15" height="15">
						</div>
						<div class="upanddel" id="updelete${rrelist.replno}">
							<div class="rpmenu rpupdate" id="update${rrelist.replno}">
								<img src="resources/image/update.png" width="15" height="15">수정
							</div>
							<div class="rpmenu rrpdelete" id="trepl${rrelist.replno}">
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