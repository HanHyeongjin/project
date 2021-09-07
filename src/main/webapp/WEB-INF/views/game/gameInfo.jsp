<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game INFO</title>
<style>

.gameimg{
	position: relative;
	
}
.textbox{
	background: rgba(0,0,0,0.9);
	position: absolute;
	top:0;
	height: 300px;
	width: 100%;
	padding-top: 100px;
}
.intext{
	padding-top: 50px;
}
.infotable{
	margin: 30px 0 0 200px;
	width: 900px;
	height: 400px
}
.infobox{
	background : black;
	color: white;
	margin: 0 0 0 200px;
	
    width: 900px;    
    display: flex;
}
.infobox2{
	margin: auto;
}

</style>
</head>
<body>
	<div style="position: fixed; z-index: 50"><jsp:include page="/WEB-INF/views/headfoot/header.jsp" flush="true" /></div>
		<div class="gameimg">
			<img src="${game.img}" width="100%" height="400px">	
			<div class="textbox">
				 <div style="float: left; text-align: center; margin-left: 200px"><img src="${game.img}" width="200px;" height="200px"><br>
					 <span style="width: 200px; height: 50px; background:black; color: white; ">관심목록에 추가</span>
				</div>
				 <div style="float: left;">
					 <span id="intextname" class="intext" style=" font-size: 4em; font-weight: bold; color: white">${game.gname}</span><br>
					 <span id="intextservice" class="intext"  style=" font-size: 1.5em; font-weight: bold; color: white">${game.gservice}</span><br>
					 <img src="resources/gameImage/rat12.png">				 
				 </div>
			</div>
		</div>
		<table class="infotable">
		<tr><td style="background: black; font-size: 3em; color: white;" colspan="4">
			${game.gname}
		</td></tr>
		<tr>
			<td style="background: dimgray;" colspan="1">
			<img src="${game.img}" width="250px" height="250px">
			</td>
			<td style="background: dimgray;" class="3">
			<div style="color: white; ">${game.contents}</div>
			</td>
		</tr>
		</table>
		<div class="infobox">
			<div class="infobox2"><div>출시년도</div><div>${game.reldate}</div></div>
			<div class="infobox2"><div>연령제한</div><div>${game.rating}</div></div>
			<div class="infobox2"><div>게임사</div><div>${game.gservice}</div></div>	
			<div class="infobox2"><div>장르</div><div>${game.categories2}</div></div>
		</div>
		
			
			
			
			
		
	
	
	<jsp:include page="/WEB-INF/views/headfoot/footer.jsp" flush="true" />
</body>
</html>