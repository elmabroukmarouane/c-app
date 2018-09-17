function table_abonnementplatforms(finished) {
    $.ajax({
        url: 'getabonnementplatforms_abonnementplatforms_Packs/' + finished,
        type: 'GET',
        'async': false,
        success: function (response) {
            var length_data = response.data_abonnementplatforms.length;
            var dataTable = $('#abonnementplatforms-abonnementplatforms-packs-list').DataTable();
            if (length_data > 0) {
                dataTable.clear().draw();
                $.each(response.data_abonnementplatforms, function (key, value) {
                    dataTable.row.add([
                        '<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                        '<strong>' + value.nom_prenom + '</strong>',
                        '<strong>' + value.packabonnementplatform + '</strong>',
                        '<strong>' + value.type_payment + '</strong>',
                        '<strong>' + value.id_payment + '</strong>',
                        '<strong>' + value.periode + '</strong>',
                        '<strong>' + value.total_pay + '</strong>',
                        '<strong>' + value.paid + '</strong>',
                        '<strong>' + value.rest + '</strong>',
                        '<strong>' + value.rest_periode + '</strong>',
                        '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> ' +
                        '<a href="javascript:void(0)" class="btn btn-icon btn-danger tip" onclick="supprimer(' + value.id + ')" data-toggle="tooltip" data-placement="top" data-original-title="Delete"><i class="fa fa-trash-o"></i> </a> ' +
                        '<a href="javascript:void(0)" class="btn btn-icon btn-info tip" onclick="status(' + value.id_personne + ')" data-toggle="tooltip" data-placement="top" data-original-title="Status User"><i class="fa fa-id-card-o"></i> </a>'
                    ]).draw();
                });
            } else {
                dataTable.clear().draw();
            }
        }
    });
}

function ajoutOuModif_abonnementplatforms_packs() {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var formData = new FormData();
    formData.append("id_abonnementplatforms", $('#id_abonnementplatforms').val());
    formData.append("paid", $('#pack_paid').val());

    $.ajax({
        url: 'ajoutOuModif_abonnementplatforms_packs',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            $('#abonnementplatformsPackModal').modal('hide');
            table_abonnementplatforms($('#finished_pack_filter').val());
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
    formData.append("id_status_personne", $('#id_status_personne').val());
    formData.append("id_status_statuscompte", $('#id_status_statuscompte').val());

    $.ajax({
        url: 'updateStatus',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            $('#PackStatusModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id) {

    $.ajax({
        url: 'modifier_abonnementplatforms_packs/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update Paid Amount</strong>');
            $('#id_abonnementplatforms').val(response.abonnementplatforms.id);
            $('#pack_paid').val(response.abonnementplatforms.paid);
            $('#abonnementplatformsPackModal').modal('show');
        }
    });
}

function status(id) {

    $.ajax({
        url: 'modifier/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_status_form').html('<strong>Update Status User</strong>');
            $('#id_status_personne').val(response.personne.id);
            $('#id_status_statuscompte').val(response.personne.id_statuscompte);
            $('#PackStatusModal').modal('show');
        }
    });
}

function supprimer(id) {
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
                action: function () {
                    $.ajax({
                        url: 'supprimer_abonnementplatforms_packs/' + id,
                        type: 'GET',
                        success: function (response) {
                            table_abonnementplatforms($('#finished_pack_filter').val(), $('#active_pack_filter').val());
                            confirmation(response.msg);
                        }
                    });
                }
            },
            no: {
                text: 'No',
                close: function () {}
            }
        }
    });
}

function supprimer_all() {
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
                action: function () {
                    $(".table").find('input[class="checkbox_ids"]').each(function () {
                        if ($(this).is(":checked"))
                            tab_sup.push($(this).val());
                    });
                    if (tab_sup.length > 0) {
                        $.ajax({
                            type: 'POST',
                            url: 'supprimer_all_abonnementplatforms_packs',
                            data: {
                                'json_tab': JSON.stringify(tab_sup)
                            },
                            dataType: 'json',
                            success: function (response) {
                                table_abonnementplatforms($('#finished_pack_filter').val(), $('#active_pack_filter').val());
                                confirmation(response.msg);
                            }
                        });
                    } else {
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
                                    action: function () {}
                                }
                            }
                        });
                    }
                }
            },
            no: {
                text: 'No',
                close: function () {}
            }
        }
    });
}

function vider_table() {
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
                action: function () {
                    $.ajax({
                        url: 'clear_table_abonnementplatforms_packs',
                        type: 'POST',
                        success: function (response) {
                            table_abonnementplatforms($('#finished_pack_filter').val(), $('#active_pack_filter').val());
                            confirmation(response.msg);
                        }
                    });
                }
            },
            no: {
                text: 'No',
                close: function () {}
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
                action: function () {}
            }
        }
    });
}

function checkall() {
    if ($('#chk_all').is(":checked")) {
        $('.checkbox_ids').prop('checked', true);
    } else {
        $('.checkbox_ids').prop('checked', false);
    }
}

$(document).ready(function () {
    $('#abonnementplatforms-abonnementplatforms-packs-list').DataTable({
        columnDefs: [{
            orderable: false,
            targets: [0, 9]
        }],
        pageLength: 15,
        lengthMenu: [
            [15, 30, 50, 100, -1],
            [15, 30, 50, 100, "All"]
        ]
    });
    table_abonnementplatforms($('#finished_pack_filter').val());
    $('#form-abonnementplatforms-abonnementplatforms-pack').submit(function (e) {
        e.preventDefault();
        ajoutOuModif_abonnementplatforms_packs();
    });
    $('#form-status-pack').submit(function (e) {
        e.preventDefault();
        updateStatus();
    });
});