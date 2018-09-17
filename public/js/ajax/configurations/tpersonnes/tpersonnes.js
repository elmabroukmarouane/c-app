
function LoadtpersonnesList() {
    var tpersonnes_array = new Array();
    $.ajax({
        url: 'get-tpersonnes',
        type: 'GET',
        'async': false,
        success: function (response) {
            tpersonnes_array = response.tpersonnes;
        }
    });
    return tpersonnes_array;
}

function refresh_table(tpersonnes_list)
{
    var length_data = tpersonnes_list.length;
    var dataTable = $('#tpersonnes-list').DataTable();
    if(length_data > 0){
        dataTable.clear().draw();
        $.each(tpersonnes_list, function(key, value) {
            dataTable.row.add([
                '<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                '<strong>' + value.tpersonne + '</strong>',
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
    var id_tpersonne = $('#id_tpersonne').val();
    if(id_tpersonne !== "")
    {
        tpersonnes_list = tpersonnes_list.filter(function(el) {
            return parseInt(el.id) !== parseInt(id_tpersonne);
        });
    }

    var formData = new FormData();
    formData.append("id_tpersonne", $('#id_tpersonne').val());
    formData.append("tpersonne", $('#tpersonne').val());

    $.ajax({
        url: 'ajoutOuModif_tpersonnes',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            admin = {
                id:response.tpersonne.id,
                tpersonne:response.tpersonne.tpersonne
            }
            tpersonnes_list.unshift(admin);
            refresh_table(tpersonnes_list);
            $('#tpersonnesModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id){

    $.ajax({
        url: 'modifier_tpersonnes/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update User Type</strong>');
            $('#id_tpersonne').val(response.tpersonne.id);
            $('#tpersonne').val(response.tpersonne.tpersonne);
            $('#tpersonnesModal').modal('show');
        }
    });
}

function supprimer(id){
    $.confirm({
        title: '<strong>Delete user type !</strong>',
        content: 'Do you really wants to delete this user type ?',
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
                    tpersonnes_list = tpersonnes_list.filter(function(el) {
                        return el.id !== id;
                    });
                    $.ajax({
                        url: 'supprimer_tpersonnes/' + id,
                        type: 'GET',
                        success: function (response) {
                            refresh_table(tpersonnes_list);
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
        title: '<strong>Delete users type !</strong>',
        content: 'Do you really wants to delete these users type ?',
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
                            tpersonnes_list = tpersonnes_list.filter(function(el) {
                                var el_id = parseInt(el.id);
                                var tab_sup_id = parseInt(value);
                                return el_id !== tab_sup_id;
                            });
                        });
                        $.ajax({
                            type: 'POST',
                            url: 'supprimer_all_tpersonnes',
                            data: {
                                'json_tab':JSON.stringify(tab_sup)
                            },
                            dataType: 'json',
                            success: function (response) {
                                refresh_table(tpersonnes_list);
                                confirmation(response.msg);
                            }
                        });
                    }else{
                        $.alert({
                            title: '<strong>Alert!</strong>',
                            content: 'Please select users type before deleting !!!',
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
                    tpersonnes_list = [];
                    $.ajax({
                        url: 'clear_table_tpersonnes',
                        type: 'POST',
                        success: function (response) {
                            refresh_table(tpersonnes_list);
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
    $('#titre_form').html('<strong>Add User Type</strong>');
    $('#id_tpersonne').val('');
    $('#tpersonne').val('');
    $('#tpersonnesModal').modal('show');
}

function checkall(){
    if($('#chk_all').is(":checked")){
        $('.checkbox_ids').prop('checked', true);
    }else{
        $('.checkbox_ids').prop('checked', false);
    }
}

$(document).ready(function(){
    tpersonnes_list = LoadtpersonnesList();
    $('#tpersonnes-list').DataTable({
        columnDefs: [{orderable: false, targets: [0, 2]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(tpersonnes_list);
    $('#form-tpersonnes').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
});
