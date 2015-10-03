var adm_articles = {
    onload: function() {
        
        //tiny_mce
        setTimeout(function(){
            tinyMCE.init({
                menubar: false,
                plugins: [ "autolink link image code table template" ],
                selector:"#article_body",
                toolbar1: "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | code",
            });	
	},500); 
        
        //menu active
        $('#pill_articles').addClass('active');
    },
    create_permalink: function() {
        var title = $('#article_title').val();
        var tit_a = title.replace(/\W+/g, "-");
        var permalink = tit_a.toLowerCase();

        $('#article_permalink').val(permalink);
    },
    show_media_win: function() {
        //checking media_win_modal
        var check = $('#media_win_modal').length;

        if (check == 0) {
          $.ajax({
            url: '/adm/media/media_win?page=1&rows=5&sort=id&order=desc',
            success: function(response) {
              $('#media_win').html(response);
              $('#media_win_modal').modal();
            }
          });
        }
        else {
          $('#media_win_modal').modal();
        }
    }
};