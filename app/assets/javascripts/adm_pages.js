var adm_pages = {
    onload: function() {
        
        //tiny_mce
        setTimeout(function(){
            tinyMCE.init({
                menubar: false,
                plugins: [ "autolink link image code table template" ],
                selector:"textarea",
                toolbar1: "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | code",
            });	
	},500);
        
        $('#pill_pages').addClass('active');
    },
    create_permalink: function() {
        var title = $('#article_title').val();
        var tit_a = title.replace(/\W+/g, "-");
        var permalink = tit_a.toLowerCase();

        $('#article_permalink').val(permalink);
    }
};