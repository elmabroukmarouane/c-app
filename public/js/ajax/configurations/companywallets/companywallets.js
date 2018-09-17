
function LoadcompanywalletsList() {
    var companywallets_array = new Array();
    $.ajax({
        url: 'get-companywallets',
        type: 'GET',
        'async': false,
        success: function (response) {
            companywallets_array = response.companywallets;
        }
    });
    return companywallets_array;
}

function refresh_table(companywallets_list)
{
    var length_data = companywallets_list.length;
    var dataTable = $('#companywallets-list').DataTable();
    if(length_data > 0){
        dataTable.clear().draw();
        $.each(companywallets_list, function(key, value) {
            dataTable.row.add([
                '<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                '<strong>' + value.currencie + '</strong>',
                '<strong>' + value.wallet_name + '</strong>',
                '<strong>' + value.wallet_adresse + '</strong>',
                '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> ' +
                '<a href="javascript:void(0)" class="btn btn-icon btn-danger tip" onclick="supprimer(' + value.id + ')" data-toggle="tooltip" data-placement="top" data-original-title="Delete"><i class="fa fa-trash-o"></i> </a> '
            ]).draw();
        });
    }else{
        dataTable.clear().draw();
    }
}

function ajoutOuModif() {
    var companywallet;
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var id_companywallet = $('#id_companywallet').val();
    if(id_companywallet !== "")
    {
        companywallets_list = companywallets_list.filter(function(el) {
            return parseInt(el.id) !== parseInt(id_companywallet);
        });
    }

    var formData = new FormData();
    formData.append("id_companywallet", $('#id_companywallet').val());
    formData.append("id_currencie", $('#id_currencie').val());
    formData.append("wallet_name", $('#wallet_name').val());
    formData.append("wallet_adresse", $('#wallet_adresse').val());

    $.ajax({
        url: 'ajoutOuModif_companywallets',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            companywallet = {
                id:response.companywallet.id,
                currencie:response.companywallet.currencie,
                wallet_name:response.companywallet.wallet_name,
                wallet_adresse:response.companywallet.wallet_adresse
            }
            companywallets_list.unshift(companywallet);
            refresh_table(companywallets_list);
            $('#companywalletsModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id){

    $.ajax({
        url: 'modifier_companywallets/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update Wallet</strong>');
            $('#id_companywallet').val(response.companywallet.id);
            $('#id_currencie').val(response.companywallet.id_currencie);
            $('#wallet_name').val(response.companywallet.wallet_name);
            $('#wallet_adresse').val(response.companywallet.wallet_adresse);
            $('#companywalletsModal').modal('show');
        }
    });
}

function supprimer(id){
    $.confirm({
        title: '<strong>Delete wallet !</strong>',
        content: 'Do you really wants to delete this wallet ?',
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
                    companywallets_list = companywallets_list.filter(function(el) {
                        return el.id !== id;
                    });
                    $.ajax({
                        url: 'supprimer_companywallets/' + id,
                        type: 'GET',
                        success: function (response) {
                            refresh_table(companywallets_list);
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
        title: '<strong>Delete wallets !</strong>',
        content: 'Do you really wants to delete these wallets ?',
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
                            companywallets_list = companywallets_list.filter(function(el) {
                                var el_id = parseInt(el.id);
                                var tab_sup_id = parseInt(value);
                                return el_id !== tab_sup_id;
                            });
                        });
                        $.ajax({
                            type: 'POST',
                            url: 'supprimer_all_companywallets',
                            data: {
                                'json_tab':JSON.stringify(tab_sup)
                            },
                            dataType: 'json',
                            success: function (response) {
                                refresh_table(companywallets_list);
                                confirmation(response.msg);
                            }
                        });
                    }else{
                        $.alert({
                            title: '<strong>Alert!</strong>',
                            content: 'Please select wallets before deleting !!!',
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
                    companywallets_list = [];
                    $.ajax({
                        url: 'clear_table_companywallets',
                        type: 'POST',
                        success: function (response) {
                            refresh_table(companywallets_list);
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
    $('#titre_form').html('<strong>Add wallet</strong>');
    $('#id_companywallet').val('');
    $('#id_currencie').val(1);
    $('#wallet_name').val('');
    $('#wallet_adresse').val('');
    $('#companywalletsModal').modal('show');
}

function checkall(){
    if($('#chk_all').is(":checked")){
        $('.checkbox_ids').prop('checked', true);
    }else{
        $('.checkbox_ids').prop('checked', false);
    }
}

$(document).ready(function(){
    companywallets_list = LoadcompanywalletsList();
    $('#companywallets-list').DataTable({
        columnDefs: [{orderable: false, targets: [0, 2]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(companywallets_list);
    $('#form-companywallets').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
});
