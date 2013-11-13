# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	$('#companyshow').bind 'change', (event) =>
#if $(this).is(':checked')
			#选中,后台数据的值更改为true
			company_id = $("#companyid").text()
			$.ajax
				url : "/admins/company/updateshow"
				type : "POST"
				dataType: "json"
				data : {id:company_id, show: if $('#companyshow').is(':checked') then 1 else 0}
