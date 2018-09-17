
function LoadbankwalletsList() {
    var bankwallets_array = new Array();
    $.ajax({
        url: 'get-bankwallets',
        type: 'GET',
        'async': false,
        success: function (response) {
            bankwallets_array = response.bankwallets;
        }
    });
    return bankwallets_array;
}

function refresh_table(bankwallets_list)
{
    var length_data = bankwallets_list.length;
    var dataTable = $('#bankwallets-list').DataTable();
    if(length_data > 0){
        dataTable.clear().draw();
        $.each(bankwallets_list, function(key, value) {
            dataTable.row.add([
                '<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                '<strong>' + value.nom_prenom + '</strong>',
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
    var bankwallet;
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var id_bankwallet = $('#id_bankwallet').val();
    if(id_bankwallet !== "")
    {
        bankwallets_list = bankwallets_list.filter(function(el) {
            return parseInt(el.id) !== parseInt(id_bankwallet);
        });
    }

    var formData = new FormData();
    formData.append("id_bankwallet", $('#id_bankwallet').val());
    formData.append("id_currencie", $('#id_currencie').val());
    formData.append("wallet_name", $('#wallet_name').val());
    formData.append("wallet_adresse", $('#wallet_adresse').val());

    $.ajax({
        url: 'ajoutOuModif_bankwallets',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            bankwallet = {
                id:response.bankwallet.id,
                nom_prenom:response.bankwallet.nom_prenom,
                currencie:response.bankwallet.currencie,
                wallet_name:response.bankwallet.wallet_name,
                wallet_adresse:response.bankwallet.wallet_adresse
            }
            bankwallets_list.unshift(bankwallet);
            refresh_table(bankwallets_list);
            $('#bankwalletsModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id){

    $.ajax({
        url: 'modifier_bankwallets/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update wallet</strong>');
            $('#id_bankwallet').val(response.bankwallet.id);
            $('#id_currencie').val(response.bankwallet.id_currencie);
            $('#wallet_name').val(response.bankwallet.wallet_name);
            $('#wallet_adresse').val(response.bankwallet.wallet_adresse);
            $('#bankwalletsModal').modal('show');
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
                    bankwallets_list = bankwallets_list.filter(function(el) {
                        return el.id !== id;
                    });
                    $.ajax({
                        url: 'supprimer_bankwallets/' + id,
                        type: 'GET',
                        success: function (response) {
                            refresh_table(bankwallets_list);
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
                            bankwallets_list = bankwallets_list.filter(function(el) {
                                var el_id = parseInt(el.id);
                                var tab_sup_id = parseInt(value);
                                return el_id !== tab_sup_id;
                            });
                        });
                        $.ajax({
                            type: 'POST',
                            url: 'supprimer_all_bankwallets',
                            data: {
                                'json_tab':JSON.stringify(tab_sup)
                            },
                            dataType: 'json',
                            success: function (response) {
                                refresh_table(bankwallets_list);
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
                    bankwallets_list = [];
                    $.ajax({
                        url: 'clear_table_bankwallets',
                        type: 'POST',
                        success: function (response) {
                            refresh_table(bankwallets_list);
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
    $('#id_bankwallet').val('');
    $('#id_currencie').val(1);
    $('#wallet_name').val('');
    $('#wallet_adresse').val('');
    $('#bankwalletsModal').modal('show');
}

function checkall(){
    if($('#chk_all').is(":checked")){
        $('.checkbox_ids').prop('checked', true);
    }else{
        $('.checkbox_ids').prop('checked', false);
    }
}

$(document).ready(function(){
    bankwallets_list = LoadbankwalletsList();
    $('#bankwallets-list').DataTable({
        columnDefs: [{orderable: false, targets: [0, 5]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(bankwallets_list);
    $('#form-bankwallets').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
});
