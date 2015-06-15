var n_menu = {
    current_menu_element: function() {
        console.log('function current_menu_element');

        $.ajax({
            url: '/adm/menu/current_menu_element',
            success: function(response) {
                $('#current_menu').html(response);
            }
        });
    },
    do_nested: function() {
        console.log('function do_nested');

        $('.sortable').nestedSortable({
            handle: 'div',
            items: 'li',
            toleranceElement: '> div'
        });
    },
    draft_menu_element: function() {
        console.log('function draft_menu_element');
        $.ajax({
            url: '/adm/menu/draft_menu_element',
            success: function(response) {
                $('#draft_menu_element').html(response);

                n_menu.do_nested();
            }
        });
    },
    update_menu_draft: function() {
        console.log('function update_menu_draft');

        var create_data = $('#draft_menu_input').val($('#draft_menu_element').html());

        setTimeout(function() {
            var data = $('#draft_menu_input').val();
            $.ajax({
                url: '/adm/menu/update_draft',
                data: "data=" + data,
                type: 'POST',
                success: function(response) {
                    n_menu.draft_menu_element(); //tampilkan draft menu yang baru
                }
            });
        }, 100);
    },
    update_draft_to_current_menu: function() {
        console.log('function update_draft_to_current_menu');

        var create_data = $('#draft_menu_element').find('i').remove();
        setTimeout(function() {
            var data_input = $('#draft_menu_input').val($('#draft_menu_element').html());
            var data = $('#draft_menu_input').val();
            $.ajax({
                url: '/adm/menu/update',
                type: 'POST',
                data: 'data=' + data,
                success: function() {
                    alert('Success!');
                    n_menu.draft_menu_element(); //tampilkan draft menu
                    n_menu.current_menu_element(); //tampilkan current menu
                }
            });
        }, 100);
    },
    add_page_to_draft: function(article_id, title, permalink) {
        console.log('function add_page_to_draft');

        var elementz = "<li id='menu_page_" + article_id + "'>"
                + "   <div><a href='/page/" + permalink + "'>" + title + "</a>"
                + "       <i class='glyphicon glyphicon-trash' onclick='n_menu.del_page(" + article_id + ");'></i>"
                + "       <i class='glyphicon glyphicon-move cursor-pointer'></i>"
                + "   </div>"
                + "</li>";
        $('.sortable').prepend(elementz);

        setTimeout(function() {
            n_menu.update_menu_draft();
        }, 100);

    },
    del_page: function(id) {
        console.log('function del_page');

        $('li#menu_page_' + id).remove();
        n_menu.update_menu_draft();
    },
    add_category_to_draft: function(category_id, cat_name, cat_slug) {
        console.log('function add_category_to_draft');

        var elementz = "<li id='menu_category_" + category_id + "'>"
                + "   <div>"
                + "       <a href='/category/" + cat_slug + "'>" + cat_name + "</a>"
                + "       <i class='glyphicon glyphicon-trash' onclick='n_menu.del_category(" + category_id + ")'></i>"
                + "       <i class='glyphicon glyphicon-move cursor-pointer'></i>"
                + "   </div>"
                + "</li>";
        $('.sortable').prepend(elementz);

        setTimeout(function() {
            n_menu.update_menu_draft();
        }, 100);
    },
    del_category: function(id) {
        console.log('function del_category');

        $('li#menu_category_' + id).remove();
        n_menu.update_menu_draft();
    },
    add_custom_to_draft: function() {
        console.log('function add_custom_to_draft');

        var random_id = Math.floor((Math.random() * 10000) + 1);
        var custom_text = $('#custom_text').val();
        var custom_url = $('#custom_url').val();
        var elementz = "<li id='menu_custom_" + random_id + "'>"
                + "   <div>"
                + "       <a href='" + custom_url + "'>" + custom_text + "</a>"
                + "       <i class='glyphicon glyphicon-trash' onclick='n_menu.del_custom(" + random_id + ");'></i>"
                + "       <i class='glyphicon glyphicon-move cursor-pointer'></i>"
                + "   </div>"
                + "</li>";
        $('.sortable').prepend(elementz);

        setTimeout(function() {
            n_menu.update_menu_draft();
        }, 100);
    },
    del_custom: function(id) {
        $('li#menu_custom_' + id).remove();
        n_menu.update_menu_draft();
    },
    form_manual: function() {
        $.ajax({
            url: '/adm/menu/form_manual',
            success: function(response) {
                $('#current_menu').html(response);
                $('#current_menu_click_me').hide();
            }
        });
    },
    form_manual_update: function() {
        var data = $('#form_manual_textarea').val();
        $.ajax({
            url: '/adm/menu/form_manual_update',
            data: 'data=' + data,
            type: 'POST',
            success: function() {
                n_menu.current_menu_element();
                $('#current_menu_click_me').show();
            }
        });
    }
};