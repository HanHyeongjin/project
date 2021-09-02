	$(function() {		
		$('.mheader').css({
			fontWeight:"bold",
			color:"orange"
		});
		$('.mheader').hover(function() {
			$(this).css({
				fontWeight:"bold",
				color:"gray",
				cursor:"pointer" }) //css
		}, function(){
			$(this).css({
				fontWeight:"bold",
				color:"orange",
				cursor:"default" }) //css
	  }); //hover		
	
	
});//ready


onload=function(){
document.addEventListener('scroll', function() {
	var menubar = document.getElementById("menubar");
    var scroll = window.scrollY
	
	if(scroll > 0){
			menubar.style.backgroundColor = "rgba(0,0,0,1)";
	
		
		}else{
			menubar.style.backgroundColor = "rgba(0,0,0,0)";
		}
	

});
}