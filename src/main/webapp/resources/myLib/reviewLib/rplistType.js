$(function(){
	$('.listType').click(function(){
		$('.selectrplist').css("display","block");
		
	}); // list type
$(document).mouseup(function (e){
  		var LayerPopup = $(".selectrplist");
  		if(LayerPopup.has(e.target).length === 0){
  			  LayerPopup.css('display','none')
 		 }
	}); // 매뉴 숨기기
	
	$('#poplist').click(function(){
		$('#reclist, #mylist').removeClass('selected');
		$('#poplist').addClass('selected');
		$.ajax({
			type:"get",
			url : "replpoplist",
			data:{
				rvno:$('#replrvno').val()
			},
			success:function(result){	
			$('#replListf').html(result);
		},
			error:function(){
			$('#replListf').html("댓글이 하나도 없습니다. 첫 댓글을 입력해 주세요");
		}
		});
	});// 인기순
	
	$('#reclist').click(function(){
		$('#poplist, #mylist').removeClass('selected');
		$('#reclist').addClass('selected');
		$.ajax({
			type:"get",
			url:"replreclist",
			data:{
				rvno:$('#replrvno').val()
			},
			success:function(result){	
			$('#replListf').html(result);
		},
			error:function(){
			$('#replListf').html("댓글이 하나도 없습니다. 첫 댓글을 입력해 주세요");
		}
		});
	});// 최신순
	$('#mylist').click(function(){
		$('#poplist, #reclist').removeClass('selected');
		$('#mylist').addClass('selected');
		$.ajax({
			type:"get",
			url:"replmylist",
			data:{
				rvno:$('#replrvno').val()
			},
			success:function(result){	
			$('#replListf').html(result);
		},
			error:function(){
			$('#replListf').html("댓글이 하나도 없습니다. 첫 댓글을 입력해 주세요");
		}
		});
	});// 내가 쓴 댓글
	
});//ready

