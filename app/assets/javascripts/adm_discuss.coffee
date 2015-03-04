# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.apr_btn').click -> 
		disid = $(this).data("disid")
		$.ajax({
			url: '/adm/discusses/approve',
			type: 'POST',
			data: 'discuss_id='+disid,
			success: () ->
				location.reload()	
		})

	$('.unapr_btn').click -> 
		disid = $(this).data("disid")
		$.ajax({
			url: '/adm/discusses/unapprove',
			type: 'POST',
			data: 'discuss_id='+disid,
			success: () ->
				location.reload()
		})