# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#discuss_submit_btn').click -> 
		data = $('#discuss_form').serialize()
		$.ajax({
			url: '/discuss/send_insert',
			type: 'POST',
			data: data,
			success: () ->
				alert "Komentar terkirim. \n\nKomentar akan ditampilkan jika disetujui :)"
				$('#dis_body').val ''
				location.reload()
		})
		return false
