
function LoadpackabonnementplatformsList() {
    var packabonnementplatforms_array = new Array();
    $.ajax({
        url: 'get-packabonnementplatforms',
        type: 'GET',
        'async': false,
        success: function (response) {
            packabonnementplatforms_array = response.packabonnementplatforms;
        }
    });
    return packabonnementplatforms_array;
}

function refresh_table(packabonnementplatforms_list)
{
    var length_data = packabonnementplatforms_list.length;
    var dataTable = $('#packabonnementplatforms-list').DataTable();
    if(length_data > 0){
        dataTable.clear().draw();
        $.each(packabonnementplatforms_list, function(key, value) {
            dataTable.row.add([
                //'<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                '<strong>' + value.nom_pack_abonnement_platform + '</strong>',
                '<strong>' + value.prix_ut + '</strong>',
                '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> ' /*+
                '<a href="javascript:void(0)" class="btn btn-icon btn-danger tip" onclick="supprimer(' + value.id + ')" data-toggle="tooltip" data-placement="top" data-original-title="Delete"><i class="fa fa-trash-o"></i> </a> '*/
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
    var id_packabonnementplatform = $('#id_packabonnementplatform').val();
    if(id_packabonnementplatform !== "")
    {
        packabonnementplatforms_list = packabonnementplatforms_list.filter(function(el) {
            return parseInt(el.id) !== parseInt(id_packabonnementplatform);
        });
    }

    var formData = new FormData();
    formData.append("id_packabonnementplatform", $('#id_packabonnementplatform').val());
    formData.append("nom_pack_abonnement_platform", $('#nom_pack_abonnement_platform').val());
    formData.append("prix_ut", $('#prix_ut').val());

    $.ajax({
        url: 'ajoutOuModif_packabonnementplatforms',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            admin = {
                id:response.packabonnementplatform.id,
                nom_pack_abonnement_platform:response.packabonnementplatform.nom_pack_abonnement_platform,
                prix_ut:response.packabonnementplatform.prix_ut
            }
            packabonnementplatforms_list.unshift(admin);
            refresh_table(packabonnementplatforms_list);
            $('#packabonnementplatformsModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id){

    $.ajax({
        url: 'modifier_packabonnementplatforms/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update Subscription packs platform</strong>');
            $('#id_packabonnementplatform').val(response.packabonnementplatform.id);
            $('#nom_pack_abonnement_platform').val(response.packabonnementplatform.nom_pack_abonnement_platform);
            $('#prix_ut').val(response.packabonnementplatform.prix_ut);
            $('#packabonnementplatformsModal').modal('show');
        }
    });
}/*

function supprimer(id){
    $.confirm({
        title: '<strong>Delete packabonnementplatform !</strong>',
        content: 'Do you really wants to delete this packabonnementplatform ?',
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
                    packabonnementplatforms_list = packabonnementplatforms_list.filter(function(el) {
                        return el.id !== id;
                    });
                    $.ajax({
                        url: 'supprimer_packabonnementplatforms/' + id,
                        type: 'GET',
                        success: function (response) {
                            refresh_table(packabonnementplatforms_list);
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
        title: '<strong>Delete packabonnementplatforms !</strong>',
        content: 'Do you really wants to delete these packabonnementplatforms ?',
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
                            packabonnementplatforms_list = packabonnementplatforms_list.filter(function(el) {
                                var el_id = parseInt(el.id);
                                var tab_sup_id = parseInt(value);
                                return el_id !== tab_sup_id;
                            });
                        });
                        $.ajax({
                            type: 'POST',
                            url: 'supprimer_all_packabonnementplatforms',
                            data: {
                                'json_tab':JSON.stringify(tab_sup)
                            },
                            dataType: 'json',
                            success: function (response) {
                                refresh_table(packabonnementplatforms_list);
                                confirmation(response.msg);
                            }
                        });
                    }else{
                        $.alert({
                            title: '<strong>Alert!</strong>',
                            content: 'Please select packabonnementplatforms type before deleting !!!',
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
                    packabonnementplatforms_list = [];
                    $.ajax({
                        url: 'clear_table_packabonnementplatforms',
                        type: 'POST',
                        success: function (response) {
                            refresh_table(packabonnementplatforms_list);
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
}*/

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
}/*

function vider() {
    $('#titre_form').html('<strong>Add packabonnementplatform</strong>');
    $('#id_packabonnementplatform').val('');
    $('#packabonnementplatform').val('');
    $('#packabonnementplatformsModal').modal('show');
}

function checkall(){
    if($('#chk_all').is(":checked")){
        $('.checkbox_ids').prop('checked', true);
    }else{
        $('.checkbox_ids').prop('checked', false);
    }
}*/

$(document).ready(function(){
    packabonnementplatforms_list = LoadpackabonnementplatformsList();
    $('#packabonnementplatforms-list').DataTable({
        columnDefs: [{orderable: false, targets: [0, 2]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(packabonnementplatforms_list);
    $('#form-packabonnementplatforms').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
});
