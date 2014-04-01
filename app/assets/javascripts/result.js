$(document).ready(function(){
	var currentPage = 1;
	var splitRequestUrl = $("#request-ajax").text().split('/');
	var ajaxUrl = "/"+splitRequestUrl[3]+"/"+splitRequestUrl[4];
	var maxPageNum = $("#page-num").text();
	$("#left-control").click(function(){
		var minIndex = 0;
		var maxIndex = $('#sm-gallary-ul>li').length;
		var currentIndex = parseInt($(".sm-current").attr("index"));
		var currentClassSelect = ".sm-gallary-li"+currentIndex;
		var prevIndex = currentIndex-1;
		var prevClassSelect = ".sm-gallary-li"+prevIndex;
		var prevImgSelect = prevClassSelect+" >img";
		if(prevIndex != NaN && prevIndex>=minIndex){
			$(currentClassSelect).removeClass('sm-current');
			$(prevClassSelect).addClass('sm-current');
			var newprevImg = $('.sm-current>img').clone();
			$('.current >img').remove();
			newprevImg.removeAttr("width").attr('width','737');
			newprevImg.removeAttr("height").attr('height','320');
			$('.current').append(newprevImg);
		}

		if(currentIndex!= NaN && currentIndex == minIndex){
			currentPage = parseInt(currentPage)-1
			if(currentPage>0){
				$.ajax({
					type:"GET",
					url : ajaxUrl+"/page",
					dataType: "json",
					data: {page:currentPage}
				}).done(function(data){
					var dataLength = data.length;
					if(dataLength>0){
						for(var i=0; i<data.length; i++){
							var newliimg;
							if (i == 0){
								var li = "<li class=\"sm-gallary-li"+i+" sm-current\" index=\""+i+"\">"
								var img = "<img src=\""+data[i].image.url+"\" width=\"119\" height=\"119\">"
								newliimg = li+img+"</li>"
							}else{
								var li = "<li class=\"sm-gallary-li"+i+"\" index=\""+i+"\">"
								var img = "<img src=\""+data[i].image.url+"\" width=\"119\" height=\"119\">"
								var liimg = li+img+"</li>"
								newliimg += liimg;
							}
						}
						$('#sm-gallary-ul').empty().append(newliimg);
						var currentimg = $('.sm-current>img');
						var current = $('.current>img');
						current.remove();
						var newcurrentimg = currentimg.clone();
						newcurrentimg.removeAttr("width").attr('width','737');
						newcurrentimg.removeAttr("height").attr('height','320');
						$('.current').append(newcurrentimg);
					}
				});
			}
		}
	});

	$("#right-control").click(function(){
		var minIndex = 0;
		var maxIndex = $('#sm-gallary-ul>li').length;
		var currentIndex = parseInt($(".sm-current").attr("index"));
		var currentClassSelect = ".sm-gallary-li"+currentIndex;
		var nextIndex = currentIndex+1;
		var nextClassSelect = ".sm-gallary-li"+nextIndex;
		var nextImgSelect = nextClassSelect+">img";
		if(nextIndex != NaN && nextIndex<maxIndex){
			$(currentClassSelect).removeClass('sm-current');
			$(nextClassSelect).addClass('sm-current');
			var newnextImg = $('.sm-current>img').clone();
			$('.current >img').remove();
			newnextImg.removeAttr("width").attr('width','737');
			newnextImg.removeAttr("height").attr('height','320');
			$('.current').append(newnextImg);
		}
		if(nextIndex == maxIndex){
			currentPage = parseInt(currentPage)+1;
			if(currentPage<=maxPageNum){
				$.ajax({
			    	type: "GET",
					url: ajaxUrl+"/page",
					dataType: "json",
					data: {page:currentPage}
				}).done(function(data){
					var dataLength = data.length;
					if(dataLength>0){
						for(var i=0; i<data.length; i++){
							var newliimg;
							if (i == 0){
								var li = "<li class=\"sm-gallary-li"+i+" sm-current\" index=\""+i+"\">"
								var img = "<img src=\""+data[i].image.url+"\" width=\"119\" height=\"119\">"
								newliimg = li+img+"</li>"
							}else{
								var li = "<li class=\"sm-gallary-li"+i+"\" index=\""+i+"\">"
								var img = "<img src=\""+data[i].image.url+"\" width=\"119\" height=\"119\">"
								var liimg = li+img+"</li>"
								newliimg += liimg;
							}
						}
						$('#sm-gallary-ul').empty().append(newliimg);
						var currentimg = $('.sm-current>img');
						var current = $('.current>img');
						current.remove();
						var newcurrentimg = currentimg.clone();
						newcurrentimg.removeAttr("width").attr('width','737');
						newcurrentimg.removeAttr("height").attr('height','320');
						$('.current').append(newcurrentimg);
					}
				});
			}
		}
	});
});
