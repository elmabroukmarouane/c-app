
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
                '<span class="round"><i class="fa fa-info"></i></span>',
                '<strong><a href="javascript:void(0)" onclick="showPost(' + value.id + ')">' + value.title + '</a></strong>'
            ]).draw();
        });
    }else{
        dataTable.clear().draw();
    }
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

$(document).ready(function(){
    posts_list = LoadpostsList();
    $('#posts-list').DataTable({
        columnDefs: [{orderable: false, targets: [0]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(posts_list);
});
