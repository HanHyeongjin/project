var id
$(function () {		
		$('.like').click(function(){
			id= $(this).attr('id');
			var likeon = $('#likeon').html();
			var likeoff = $('#likeoff').html();
			var dislikeoff = $('#dislikeoff').html();
			var dislikecnt = $('.dli'+id).val();
			var likecnt = $('.li'+id).val();
			
			if(!$(this).hasClass('checked')&& !$('.'+id).hasClass('checked')){
				// 처음 좋아요를 누르는 경우
				likecnt = Number(likecnt)+1;
				$('.li'+id).val(likecnt);
				$.ajax({
				type:"get",
				url:"insertrplike",
				data:{
					replno:$('.rpno'+id).val(),
					rpli : 1
				},
				success:function(){					
					
				},
				error:function(){
					alert("서버오류입니다 잠시후 다시 시도해 주세요");
				}
			});
				$(this).html(likeon+"  "+likecnt);
				$(this).addClass('checked');			
			}else if(!$(this).hasClass('checked') && $('.'+id).hasClass('checked')){
				// 싫어요가 체크되어있는 상황에서 좋아요를 누르는 경우
				dislikecnt = Number(dislikecnt)-1;
				$('.dli'+id).val(dislikecnt);
				likecnt = Number(likecnt)+1;
				$('.li'+id).val(likecnt);
				$(this).html(likeon+"  "+likecnt);
				$.ajax({
				type:"get",
				url:"updaterplike",
				data:{
					replno:$('.rpno'+id).val(),
					rpli : 1
				},
				success:function(){	
					
				},
				error:function(){
					alert("서버오류입니다 잠시후 다시 시도해 주세요");
				}
			});
				
				
				if(dislikecnt>0){
					$('.'+id).html(dislikeoff+"  "+dislikecnt);
				}else $('.'+id).html(dislikeoff);				
				$(this).addClass('checked');
				$('.'+id).removeClass('checked');
			}
		
			else{
				// 좋아요 취소 
				likecnt = Number(likecnt)-1;
				$('.li'+id).val(likecnt);
				$.ajax({
				type:"get",
				url:"deleterplike",
				data:{
					replno:$('.rpno'+id).val()
				},
				success:function(){	
					
				},
				error:function(){
					alert("서버오류입니다 잠시후 다시 시도해 주세요");
				}
			});
				if(likecnt>0){
					$(this).html(likeoff+"  "+likecnt);
				}else $(this).html(likeoff);		
				$(this).removeClass('checked');
				}
			
			
		}); //좋아요
		
		
		
		$('.dislike').click(function(){
			id= $(this).attr('id');
			var dislikeon = $('#dislikeon').html();
			var dislikeoff = $('#dislikeoff').html();
			var dislikecnt = $('.dli'+id).val();
		    var likeoff = $('#likeoff').html();
			var likecnt = $('.li'+id).val();
			if(!$(this).hasClass('checked')&& !$('.'+id).hasClass('checked')){
				// 처음 싫어요 누르는 경우
				dislikecnt = Number(dislikecnt)+1;
				$('.dli'+id).val(dislikecnt);
				$.ajax({
				type:"get",
				url:"insertrplike",
				data:{
					replno:$('.rpno'+id).val(),
					rpli : 2
				},
				success:function(){	
				},
				error:function(){
					alert("서버오류입니다 잠시후 다시 시도해 주세요");
				}
			});
				$(this).html(dislikeon+"  "+dislikecnt);				
				$(this).addClass('checked');			
			}else if(!$(this).hasClass('checked') && $('.'+id).hasClass('checked')){
				// 좋아요가 체크되어있는 상황에서 싫어요를 누르는 경우
				likecnt = Number(likecnt)-1;
				$('.li'+id).val(likecnt);
				dislikecnt = Number(dislikecnt)+1;
				$('.dli'+id).val(dislikecnt);
				$.ajax({
				type:"get",
				url:"updaterplike",
				data:{
					replno:$('.rpno'+id).val(),
					rpli : 2
				},
				success:function(){	
				},
				error:function(){
					alert("서버오류입니다 잠시후 다시 시도해 주세요");
				}
			});
				$(this).html(dislikeon+"  "+dislikecnt);				
				if(likecnt>0){
					$('.'+id).html(likeoff+"  "+likecnt);
				}else $('.'+id).html(likeoff);
				
				$(this).addClass('checked');
				$('.'+id).removeClass('checked');
			}
			
			else{
				// 싫어요 취소 
				dislikecnt = Number(dislikecnt)-1;
				$('.dli'+id).val(dislikecnt);
				$.ajax({
				type:"get",
				url:"deleterplike",
				data:{
					replno:$('.rpno'+id).val()
				},
				success:function(){	
				},
				error:function(){
					alert("서버오류입니다 잠시후 다시 시도해 주세요");
				}
			});
				if(dislikecnt>0){
					$(this).html(dislikeoff+"  "+dislikecnt);
				}else $(this).html(dislikeoff);		
				$(this).removeClass('checked');
				}
			
			
		}); //싫어요
		
});//ready
