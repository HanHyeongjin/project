<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글달기</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/replLib/replInsert.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/myLib/replLib/replinsert.css">
</head>
<body>
		<form>
		<input type="hidden" id="replrvno" value="${review.rvno}" name="rvno">
		<textarea id="repl" class="repl"  name="rpcontents"
			placeholder="댓글 작성하기......" cols="100" rows="5"></textarea>
		<div class="replbtndiv">
			<input type="reset" value="취소" class="replrsbtn"> <input
				type="submit" id="replsumit" value="작성" class="replsubtn" disabled>
		</div>
		</form>
</body>
</html>