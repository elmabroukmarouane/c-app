
function LoadpostsList() {
    var posts_array = new Array();
    $.ajax({
        url: 'get-posts',
        type: 'GET',
        'async': false,
        success: function (response) {
            posts_array = response.posts;
        }
    });
    return posts_array;
}

function refresh_table(posts_list)
{
    var length_data = posts_list.length;
    var dataTable = $('#posts-list').DataTable();
    if(length_data > 0){
        dataTable.clear().draw();
        $.each(posts_list, function(key, value) {
            dataTable.row.add([
                '<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                '<strong><a href="javascript:void(0)" onclick="showPost(' + value.id + ')">' + value.title + '</a></strong>',
                '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> ' +
                '<a href="javascript:void(0)" class="btn btn-icon btn-danger tip" onclick="supprimer(' + value.id + ')" data-toggle="tooltip" data-placement="top" data-original-title="Delete"><i class="fa fa-trash-o"></i> </a> '
            ]).draw();
        });
    }else{
        dataTable.clear().draw();
    }
}

function ajoutOuModif() {
    var admin;
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var id_post = $('#id_post').val();
    if(id_post !== "")
    {
        posts_list = posts_list.filter(function(el) {
            return parseInt(el.id) !== parseInt(id_post);
        });
    }

    var formData = new FormData();
    formData.append("id_post", $('#id_post').val());
    formData.append("title", $('#title').val());
    //formData.append("detail", $('#detail').val());
    formData.append("detail", CKEDITOR.instances.detail.getData());

    $.ajax({
        url: 'ajoutOuModif_posts',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            admin = {
                id:response.post.id,
                title:response.post.title
            }
            posts_list.unshift(admin);
            refresh_table(posts_list);
            $('#postsModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id){

    $.ajax({
        url: 'modifier_posts/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update Post</strong>');
            $('#id_post').val(response.post.id);
            $('#title').val(response.post.title);
            //$('#detail').val(response.post.detail);
            CKEDITOR.instances.detail.setData(response.post.detail);
            $('#postsModal').modal('show');
        }
    });
}

function showPost(id){

    $.ajax({
        url: 'modifier_posts/' + id,
        type: 'GET',
        success: function (response) {
            $('#show_titre_form').html('<strong>Detail Post</strong>');
            $('#show_title').html(response.post.title);
            $('#show_detail').html(response.post.detail);
            $('#showPostsModal').modal('show');
        }
    });
}

function supprimer(id){
    $.confirm({
        title: '<strong>Delete post !</strong>',
        content: 'Do you really wants to delete this post ?',
        type: 'red',
        typeAnimated: true,
        backgroundDismiss: true,
        icon: 'fa fa-question',
        theme: 'modern',
        buttons: {
            tryAgain: {
                text: 'Yes',
                btnClass: 'btn-red',
                action: function(){
                    posts_list = posts_list.filter(function(el) {
                        return el.id !== id;
                    });
                    $.ajax({
                        url: 'supprimer_posts/' + id,
                        type: 'GET',
                        success: function (response) {
                            refresh_table(posts_list);
                            confirmation(response.msg);
                        }
                    });
                }
            },
            no: {
                text: 'No',
                close: function () {
                }
            }
        }
    });
}

function supprimer_all(){
    var tab_sup = [];
    $.confirm({
        title: '<strong>Delete posts !</strong>',
        content: 'Do you really wants to delete these posts ?',
        type: 'red',
        typeAnimated: true,
        backgroundDismiss: true,
        icon: 'fa fa-question',
        theme: 'modern',
        buttons: {
            tryAgain: {
                text: 'Yes',
                btnClass: 'btn-red',
                action: function(){
                    $(".table").find('input[class="checkbox_ids"]').each(function(){
                        if ($(this).is(":checked"))
                            tab_sup.push($(this).val());
                    });
                    if(tab_sup.length > 0){
                        $.each(tab_sup, function(key, value) {
                            posts_list = posts_list.filter(function(el) {
                                var el_id = parseInt(el.id);
                                var tab_sup_id = parseInt(value);
                                return el_id !== tab_sup_id;
                            });
                        });
                        $.ajax({
                            type: 'POST',
                            url: 'supprimer_all_posts',
                            data: {
                                'json_tab':JSON.stringify(tab_sup)
                            },
                            dataType: 'json',
                            success: function (response) {
                                refresh_table(posts_list);
                                confirmation(response.msg);
                            }
                        });
                    }else{
                        $.alert({
                            title: '<strong>Alert!</strong>',
                            content: 'Please select posts type before deleting !!!',
                            type: 'red',
                            typeAnimated: true,
                            backgroundDismiss: true,
                            icon: 'fa fa-exclamation',
                            theme: 'modern',
                            buttons: {
                                tryAgain: {
                                    text: 'Try again',
                                    btnClass: 'btn-red',
                                    action: function(){
                                    }
                                }
                            }
                        });
                    }
                }
            },
            no: {
                text: 'No',
                close: function () {
                }
            }
        }
    });
}

function vider_table(){
    $.confirm({
        title: '<strong>Clear Table !</strong>',
        content: 'Do you really wants to clear this table ?',
        type: 'red',
        typeAnimated: true,
        backgroundDismiss: true,
        icon: 'fa fa-question',
        theme: 'modern',
        buttons: {
            tryAgain: {
                text: 'Yes',
                btnClass: 'btn-red',
                action: function(){
                    posts_list = [];
                    $.ajax({
                        url: 'clear_table_posts',
                        type: 'POST',
                        success: function (response) {
                            refresh_table(posts_list);
                            confirmation(response.msg);
                        }
                    });
                }
            },
            no: {
                text: 'No',
                close: function () {
                }
            }
        }
    });
}

function confirmation(msg) {
    $.alert({
        title: '<strong>Confirmation!</strong>',
        content: msg,
        type: 'green',
        typeAnimated: true,
        backgroundDismiss: true,
        icon: 'fa fa-thumbs-o-up',
        theme: 'modern',
        buttons: {
            OK: {
                text: 'OK',
                btnClass: 'btn-green',
                action: function(){
                }
            }
        }
    });
}

function vider() {
    $('#titre_form').html('<strong>Add post</strong>');
    $('#id_post').val('');
    $('#title').val('');
    //$('#detail').val('');
    CKEDITOR.instances.detail.setData('');
    $('#postsModal').modal('show');
}

function checkall(){
    if($('#chk_all').is(":checked")){
        $('.checkbox_ids').prop('checked', true);
    }else{
        $('.checkbox_ids').prop('checked', false);
    }
}

$(document).ready(function(){
    posts_list = LoadpostsList();
    $('#posts-list').DataTable({
        columnDefs: [{orderable: false, targets: [0, 2]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(posts_list);
    $('#form-posts').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
});
