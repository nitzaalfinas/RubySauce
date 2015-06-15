$(document).ready(function() {
    $('#discuss_submit_btn').click(function() {
        data = $('#discuss_form').serialize()
        $.ajax({
            url: '/discuss/send_insert',
            type: 'POST',
            data: data,
            success: function() {
                alert("Komentar terkirim. \n\nKomentar akan ditampilkan jika disetujui :)");
                $('#dis_body').val('');
                location.reload();
            }
        });
        return false;
    });
});


