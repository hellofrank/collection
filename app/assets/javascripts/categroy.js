$('document').ready(function(){
	$('#category-add').click(function(){
		var category = $('#category-input').val().trim();
		if(category !== ""){
			//执行更新操作
			$.ajax({
				type:"POST",
				url :"/admins/article_category/",
				dataType: "json",
				data:{category:category}
			}).done(function(data){
				alert("成功");	
			}).fail(function(){
				alert("出错了");
			});
		}else{
			//不能对空的category进行操作
		}
	});
});
