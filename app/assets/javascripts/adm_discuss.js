var adm_discuss = {
    onload: function() {
        $('#pill_discusses').addClass('active');
    },
    approve: function(id) {
        var csrfToken = $('meta [name=csrf-token]').attr('content');
        $.ajax({
            url: '/adm/discuss/approve',
            type: 'POST',
            data: 'authenticity_token='+csrfToken+'&discuss_id='+id,
            success: function() {
                location.reload();
            }
        });
    },
    disapprove: function(id) {
        var csrfToken = $('meta [name=csrf-token]').attr('content');
        $.ajax({
            url: '/adm/discuss/disapprove',
            type: 'POST',
            data: 'authenticity_token='+csrfToken+'&discuss_id='+id,
            success: function() {
                location.reload();
            }
        });
    }
};