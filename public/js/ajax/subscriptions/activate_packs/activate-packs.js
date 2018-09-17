function table_ontrading (finished, active) {
    $.ajax({
        url: 'getOntrading_activate_Packs/' + finished + '/' + active,
        type: 'GET',
        'async': false,
        success: function (response) {
            var length_data = response.data_ontrading.length;
            var dataTable = $('#ontrading-activate-packs-list').DataTable();
            if(length_data > 0){
                dataTable.clear().draw();
                $.each(response.data_ontrading, function(key, value) {
                    dataTable.row.add([
                        '<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                        '<strong>' + value.nom_prenom + '</strong>',
                        '<strong>' + value.abonnement + '</strong>',
                        '<strong>' + value.type_payment + '</strong>',
                        '<strong>' + value.id_payment + '</strong>',
                        '<strong>' + value.total_profit + '</strong>',
                        '<strong>' + value.paid + '</strong>',
                        '<strong>' + value.rest + '</strong>',
                        '<strong>' + value.periode + '</strong>',
                        '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> ' +
                        '<a href="javascript:void(0)" class="btn btn-icon btn-danger tip" onclick="supprimer(' + value.id + ')" data-toggle="tooltip" data-placement="top" data-original-title="Delete"><i class="fa fa-trash-o"></i> </a> '+
                        '<a href="javascript:void(0)" class="btn btn-icon btn-info tip" onclick="status(' + value.id + ')" data-toggle="tooltip" data-placement="top" data-original-title="Status pack"><i class="fa fa-shopping-basket"></i> </a>'
                    ]).draw();
                });
            }else{
                dataTable.clear().draw();
            }
        }
    });
}

function ajoutOuModif_activate_packs() {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var formData = new FormData();
    formData.append("id_ontrading", $('#id_ontrading').val());
    formData.append("paid", $('#pack_paid').val());

    $.ajax({
        url: 'ajoutOuModif_activate_packs',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            $('#ActivatePackModal').modal('hide');
            table_ontrading($('#finished_pack_filter').val(), $('#active_pack_filter').val());
            confirmation(response.msg);
        }
    });
}

function updateStatus() {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var formData = new FormData();
    formData.append("id_status_ontrading", $('#id_status_ontrading').val());
    formData.append("active", $('#status_pack_active').val());

    $.ajax({
        url: 'updateStatus_activate_packs',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            $('#finished_pack_filter').val(0);
            $('#active_pack_filter').val($('#status_pack_active').val());
            $('#PackStatusModal').modal('hide');
            table_ontrading($('#finished_pack_filter').val(), $('#active_pack_filter').val());
            confirmation(response.msg);
        }
    });
}

function modifier(id){

    $.ajax({
        url: 'modifier_activate_packs/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update Paid Amount</strong>');
            $('#id_ontrading').val(response.ontrading.id);
            $('#pack_paid').val(response.ontrading.paid);
            $('#ActivatePackModal').modal('show');
        }
    });
}

function status(id){

    $.ajax({
        url: 'modifier_activate_packs/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_status_form').html('<strong>Update Status Pack</strong>');
            $('#id_status_ontrading').val(response.ontrading.id);
            $('#status_pack_active').val(response.ontrading.active);
            $('#PackStatusModal').modal('show');
        }
    });
}

function supprimer(id){
    $.confirm({
        title: '<strong>Delete !</strong>',
        content: 'Do you really wants to delete this ?',
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
                    $.ajax({
                        url: 'supprimer_activate_packs/' + id,
                        type: 'GET',
                        success: function (response) {
                            table_ontrading($('#finished_pack_filter').val(), $('#active_pack_filter').val());
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
        title: '<strong>Delete !</strong>',
        content: 'Do you really wants to delete these ?',
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
                        $.ajax({
                            type: 'POST',
                            url: 'supprimer_all_activate_packs',
                            data: {
                                'json_tab':JSON.stringify(tab_sup)
                            },
                            dataType: 'json',
                            success: function (response) {
                                table_ontrading($('#finished_pack_filter').val(), $('#active_pack_filter').val());
                                confirmation(response.msg);
                            }
                        });
                    }else{
                        $.alert({
                            title: '<strong>Alert!</strong>',
                            content: 'Please select rows before deleting !!!',
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
                    $.ajax({
                        url: 'clear_table_activate_packs',
                        type: 'POST',
                        success: function (response) {
                            table_ontrading($('#finished_pack_filter').val(), $('#active_pack_filter').val());
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

function checkall(){
    if($('#chk_all').is(":checked")){
        $('.checkbox_ids').prop('checked', true);
    }else{
        $('.checkbox_ids').prop('checked', false);
    }
}

$(document).ready(function(){
    $('#ontrading-activate-packs-list').DataTable({
        columnDefs: [{orderable: false, targets: [0, 8]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    table_ontrading($('#finished_pack_filter').val(), $('#active_pack_filter').val());
    $('#form-activate-trading-pack').submit(function (e) {
        e.preventDefault();
        ajoutOuModif_activate_packs();
    });
    $('#form-status-pack').submit(function (e) {
        e.preventDefault();
        updateStatus();
    });
});