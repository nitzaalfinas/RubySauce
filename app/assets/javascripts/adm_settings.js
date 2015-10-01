var adm_settings = {
    save: function() {
        var data_send = $('form#form_settings').serialize();
        $.ajax({
            url: '/adm/settings/update',
            data: data_send,
            type: 'POST',
            success: function(response) {
                alert(response);
            }
        });
    }
};