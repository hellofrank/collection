# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	$('.companyshow').bind 'change', (event) =>
			#选中,后台数据的值更改为true
			input = event.currentTarget
			
			companyId = input.name
			$.ajax
				url : "/admins/company/updateshow"
				type : "POST"
				dataType: "json"
				data : {id:companyId, show: if $(input).is(':checked') then 1 else 0}

	
	#init = (i) ->
	  #li = "<li num="+i+" class=\" li-star off-star\"></li>"
	  #$(li).appendTo('.star>ul')		
	 
	#for i in [1...6]
	  #init(i)

	#$(".li-star").hover \ 
		#(->
			#tarnum = $(this).attr('num') 
			#$('.li-star').each ->
				#num = $(this).attr('num')
				#if num <= tarnum
					#$(this).removeClass(".off-star").addClass("on-star")
				#else
					#$(this).removeClass(".on-star").addClass("off-star")

			#$(this).click ->
				#$(".li-star").each ->
					#num = $(this).attr('num')
					#if num <= tarnum
						#$(this).removeClass(".off-star").addClass("on-star")
					#else
						#$(this).removeClass(".on-star").addClass("off-star")

				#$(".li-star").off("mouseleave")	), \
			
		#(->$(".li-star").removeClass("on-star").addClass("off-star"))
		
	$(".hozz-ul >li>a").click ->
		$(".hozz-ul>li>a").removeClass('hozz-active')
		$(this).addClass('hozz-active')
