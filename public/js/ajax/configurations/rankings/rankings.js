function LoadrankingsList() {
    var rankings_array = [];
    $.ajax({
        url: 'get-rankings',
        type: 'GET',
        'async': false,
        success: function (response) {
            rankings_array = response.rankings;
        }
    });
    return rankings_array;
}

function refresh_table(rankings_list) {
    var length_data = rankings_list.length;
    var dataTable = $('#rankings-list').DataTable();
    if (length_data > 0) {
        dataTable.clear().draw();
        $.each(rankings_list, function (key, value) {
            dataTable.row.add([
                //'<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                '<strong>' + value.id + '</strong>',
                '<strong>' + value.ranking + '</strong>',
                '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> '
                //'<a href="javascript:void(0)" class="btn btn-icon btn-danger tip" onclick="supprimer(' + value.id + ')" data-toggle="tooltip" data-placement="top" data-original-title="Delete"><i class="fa fa-trash-o"></i> </a> '
            ]).draw();
        });
    } else {
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
    var id_ranking = $('#id_ranking').val();
    if (id_ranking !== "") {
        rankings_list = rankings_list.filter(function (el) {
            return parseInt(el.id) !== parseInt(id_ranking);
        });
    }

    var formData = new FormData();
    formData.append("id_ranking", $('#id_ranking').val());
    formData.append("ranking", $('#ranking').val());

    $.ajax({
        url: 'ajoutOuModif_rankings',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            admin = {
                id: response.ranking.id,
                ranking: response.ranking.ranking
            };
            rankings_list.unshift(admin);
            refresh_table(rankings_list);
            $('#rankingsModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id) {

    $.ajax({
        url: 'modifier_rankings/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update Ranking</strong>');
            $('#id_ranking').val(response.ranking.id);
            $('#ranking').val(response.ranking.ranking);
            $('#rankingsModal').modal('show');
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
                action: function () {}
            }
        }
    });
}

$(document).ready(function () {
    rankings_list = LoadrankingsList();
    $('#rankings-list').DataTable({
        columnDefs: [{
            orderable: false,
            targets: [2]
        }],
        pageLength: 15,
        lengthMenu: [
            [15, 30, 50, 100, -1],
            [15, 30, 50, 100, "All"]
        ]
    });
    refresh_table(rankings_list);
    $('#form-rankings').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
});