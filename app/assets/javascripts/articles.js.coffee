# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	$('.rrecommend').bind 'change', (event) =>
			#选中,后台数据的值更改为true
			input = event.currentTarget
			articleId = input.name
			$.ajax
				url : "/admins/article/updaterecommend"
				type : "POST"
				dataType: "json"
				data : {id:articleId, recommend: if $(input).is(':checked') then 1 else 0}
