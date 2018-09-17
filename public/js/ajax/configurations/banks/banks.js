function LoadbanksList() {
    var banks_array = [];
    $.ajax({
        url: 'get-banks',
        type: 'GET',
        'async': false,
        success: function (response) {
            banks_array = response.banks;
        }
    });
    return banks_array;
}

function refresh_table(banks_list) {
    var length_data = banks_list.length;
    var dataTable = $('#banks-list').DataTable();
    if (length_data > 0) {
        dataTable.clear().draw();
        $.each(banks_list, function (key, value) {
            dataTable.row.add([
                '<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                '<strong>' + value.bank + '</strong>',
                '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> ' +
                '<a href="javascript:void(0)" class="btn btn-icon btn-danger tip" onclick="supprimer(' + value.id + ')" data-toggle="tooltip" data-placement="top" data-original-title="Delete"><i class="fa fa-trash-o"></i> </a> '
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
    var id_bank = $('#id_bank').val();
    if (id_bank !== "") {
        banks_list = banks_list.filter(function (el) {
            return parseInt(el.id) !== parseInt(id_bank);
        });
    }

    var formData = new FormData();
    formData.append("id_bank", $('#id_bank').val());
    formData.append("bank", $('#bank').val());

    $.ajax({
        url: 'ajoutOuModif_banks',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            admin = {
                id: response.bank.id,
                bank: response.bank.bank
            }
            banks_list.unshift(admin);
            refresh_table(banks_list);
            $('#banksModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id) {

    $.ajax({
        url: 'modifier_banks/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update bank</strong>');
            $('#id_bank').val(response.bank.id);
            $('#bank').val(response.bank.bank);
            $('#banksModal').modal('show');
        }
    });
}

function supprimer(id) {
    $.confirm({
        title: '<strong>Delete bank !</strong>',
        content: 'Do you really wants to delete this bank ?',
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
                    banks_list = banks_list.filter(function (el) {
                        return el.id !== id;
                    });
                    $.ajax({
                        url: 'supprimer_banks/' + id,
                        type: 'GET',
                        success: function (response) {
                            refresh_table(banks_list);
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
        title: '<strong>Delete banks !</strong>',
        content: 'Do you really wants to delete these banks ?',
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
                        $.each(tab_sup, function (key, value) {
                            banks_list = banks_list.filter(function (el) {
                                var el_id = parseInt(el.id);
                                var tab_sup_id = parseInt(value);
                                return el_id !== tab_sup_id;
                            });
                        });
                        $.ajax({
                            type: 'POST',
                            url: 'supprimer_all_banks',
                            data: {
                                'json_tab': JSON.stringify(tab_sup)
                            },
                            dataType: 'json',
                            success: function (response) {
                                refresh_table(banks_list);
                                confirmation(response.msg);
                            }
                        });
                    } else {
                        $.alert({
                            title: '<strong>Alert!</strong>',
                            content: 'Please select banks type before deleting !!!',
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
                    banks_list = [];
                    $.ajax({
                        url: 'clear_table_banks',
                        type: 'POST',
                        success: function (response) {
                            refresh_table(banks_list);
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

function vider() {
    $('#titre_form').html('<strong>Add bank</strong>');
    $('#id_bank').val('');
    $('#bank').val('');
    $('#banksModal').modal('show');
}

function checkall() {
    if ($('#chk_all').is(":checked")) {
        $('.checkbox_ids').prop('checked', true);
    } else {
        $('.checkbox_ids').prop('checked', false);
    }
}

$(document).ready(function () {
    banks_list = LoadbanksList();
    $('#banks-list').DataTable({
        columnDefs: [{
            orderable: false,
            targets: [0, 2]
        }],
        pageLength: 15,
        lengthMenu: [
            [15, 30, 50, 100, -1],
            [15, 30, 50, 100, "All"]
        ]
    });
    refresh_table(banks_list);
    $('#form-banks').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
});