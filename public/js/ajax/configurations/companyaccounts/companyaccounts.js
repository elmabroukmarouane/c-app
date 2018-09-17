
function LoadcompanyaccountsList() {
    var companyaccounts_array = new Array();
    $.ajax({
        url: 'get-companyaccounts',
        type: 'GET',
        'async': false,
        success: function (response) {
            companyaccounts_array = response.companyaccounts;
        }
    });
    return companyaccounts_array;
}

function refresh_table(companyaccounts_list)
{
    var length_data = companyaccounts_list.length;
    var dataTable = $('#companyaccounts-list').DataTable();
    if(length_data > 0){
        dataTable.clear().draw();
        $.each(companyaccounts_list, function(key, value) {
            dataTable.row.add([
                '<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                '<strong>' + value.bank + '</strong>',
                '<strong>' + value.bank_account_country + '</strong>',
                '<strong>' + value.bank_account_number + '</strong>',
                '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> ' +
                '<a href="javascript:void(0)" class="btn btn-icon btn-danger tip" onclick="supprimer(' + value.id + ')" data-toggle="tooltip" data-placement="top" data-original-title="Delete"><i class="fa fa-trash-o"></i> </a> '
            ]).draw();
        });
    }else{
        dataTable.clear().draw();
    }
}

function ajoutOuModif() {
    var companyaccount;
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var id_companyaccount = $('#id_companyaccount').val();
    if(id_companyaccount !== "")
    {
        companyaccounts_list = companyaccounts_list.filter(function(el) {
            return parseInt(el.id) !== parseInt(id_companyaccount);
        });
    }

    var formData = new FormData();
    formData.append("id_companyaccount", $('#id_companyaccount').val());
    formData.append("id_bank", $('#id_bank').val());
    formData.append("bank_account_country", $('#bank_account_country').val());
    formData.append("bank_account_number", $('#bank_account_number').val());

    $.ajax({
        url: 'ajoutOuModif_companyaccounts',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            companyaccount = {
                id:response.companyaccount.id,
                bank:response.companyaccount.bank,
                bank_account_number:response.companyaccount.bank_account_number,
                bank_account_country:response.companyaccount.bank_account_country
            }
            companyaccounts_list.unshift(companyaccount);
            refresh_table(companyaccounts_list);
            $('#companyaccountsModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id){

    $.ajax({
        url: 'modifier_companyaccounts/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update Account</strong>');
            $('#id_companyaccount').val(response.companyaccount.id);
            $('#id_bank').val(response.companyaccount.id_bank);
            $('#bank_account_country').val(response.companyaccount.bank_account_country);
            $('#bank_account_number').val(response.companyaccount.bank_account_number);
            $('#companyaccountsModal').modal('show');
        }
    });
}

function supprimer(id){
    $.confirm({
        title: '<strong>Delete Account !</strong>',
        content: 'Do you really wants to delete this account ?',
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
                    companyaccounts_list = companyaccounts_list.filter(function(el) {
                        return el.id !== id;
                    });
                    $.ajax({
                        url: 'supprimer_companyaccounts/' + id,
                        type: 'GET',
                        success: function (response) {
                            refresh_table(companyaccounts_list);
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
        title: '<strong>Delete Accounts !</strong>',
        content: 'Do you really wants to delete these Accounts ?',
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
                            companyaccounts_list = companyaccounts_list.filter(function(el) {
                                var el_id = parseInt(el.id);
                                var tab_sup_id = parseInt(value);
                                return el_id !== tab_sup_id;
                            });
                        });
                        $.ajax({
                            type: 'POST',
                            url: 'supprimer_all_companyaccounts',
                            data: {
                                'json_tab':JSON.stringify(tab_sup)
                            },
                            dataType: 'json',
                            success: function (response) {
                                refresh_table(companyaccounts_list);
                                confirmation(response.msg);
                            }
                        });
                    }else{
                        $.alert({
                            title: '<strong>Alert!</strong>',
                            content: 'Please select accounts before deleting !!!',
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
                    companyaccounts_list = [];
                    $.ajax({
                        url: 'clear_table_companyaccounts',
                        type: 'POST',
                        success: function (response) {
                            refresh_table(companyaccounts_list);
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
    $('#titre_form').html('<strong>Add Account</strong>');
    $('#id_companyaccount').val('');
    $('#id_bank').val(1);
    $('#bank_account_country').val('Morocco');
    $('#bank_account_number').val('');
    $('#companyaccountsModal').modal('show');
}

function checkall(){
    if($('#chk_all').is(":checked")){
        $('.checkbox_ids').prop('checked', true);
    }else{
        $('.checkbox_ids').prop('checked', false);
    }
}

$(document).ready(function(){
    companyaccounts_list = LoadcompanyaccountsList();
    $('#companyaccounts-list').DataTable({
        columnDefs: [{orderable: false, targets: [0, 2]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(companyaccounts_list);
    $('#form-companyaccounts').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
});
