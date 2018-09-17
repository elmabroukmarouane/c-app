
function LoadpacksList() {
    var packs_array = new Array();
    $.ajax({
        url: 'get-packs',
        type: 'GET',
        'async': false,
        success: function (response) {
            packs_array = response.abonnements;
        }
    });
    return packs_array;
}

function refresh_table(packs_list)
{
    var length_data = packs_list.length;
    var dataTable = $('#packs-list').DataTable();
    if(length_data > 0){
        dataTable.clear().draw();
        $.each(packs_list, function(key, value) {
            dataTable.row.add([
                //'<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                '<strong>' + value.titre + '</strong>',
                '<strong>$' + value.prix + '</strong>',
                '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> '
                //'<a href="javascript:void(0)" class="btn btn-icon btn-danger tip" onclick="supprimer(' + value.id + ')" data-toggle="tooltip" data-placement="top" data-original-title="Delete"><i class="fa fa-trash-o"></i> </a> '
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
    var id_pack = $('#id_pack').val();
    if(id_pack !== "")
    {
        packs_list = packs_list.filter(function(el) {
            return parseInt(el.id) !== parseInt(id_pack);
        });
    }

    var formData = new FormData();
    formData.append("id_pack", $('#id_pack').val());
    formData.append("titre", $('#pack_titre').val());
    formData.append("prix", $('#pack_prix').val());
    formData.append("description_1", $('#pack_description_1').val());
    formData.append("description_2", $('#pack_description_2').val());
    formData.append("popular", $('#pack_popular').val());

    $.ajax({
        url: 'ajoutOuModif_packs',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            admin = {
                id:response.pack.id,
                titre:response.pack.titre,
                prix:response.pack.prix
            }
            packs_list.unshift(admin);
            refresh_table(packs_list);
            $('#packsModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id){

    $.ajax({
        url: 'modifier_packs/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update pack</strong>');
            $('#id_pack').val(response.pack.id);
            $('#pack_titre').val(response.pack.titre);
            $('#pack_prix').val(response.pack.prix);
            $('#pack_description_1').val(response.pack.description_1);
            $('#pack_description_2').val(response.pack.description_2);
            $('#pack_popular').val(response.pack.popular);
            $('#packsModal').modal('show');
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

$(document).ready(function(){
    packs_list = LoadpacksList();
    $('#packs-list').DataTable({
        order: [[ 1, "asc" ]],
        columnDefs: [{orderable: false, targets: [2]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(packs_list);
    $('#form-packs').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
});
