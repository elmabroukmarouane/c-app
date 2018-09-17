
function LoadcurrenciesList() {
    var currencies_array = new Array();
    $.ajax({
        url: 'get-currencies',
        type: 'GET',
        'async': false,
        success: function (response) {
            currencies_array = response.currencies;
        }
    });
    return currencies_array;
}

function refresh_table(currencies_list)
{
    var length_data = currencies_list.length;
    var dataTable = $('#currencies-list').DataTable();
    if(length_data > 0){
        dataTable.clear().draw();
        $.each(currencies_list, function(key, value) {
            dataTable.row.add([
                '<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                '<strong>' + value.currencie + '</strong>',
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
    var id_currencie = $('#id_currencie').val();
    if(id_currencie !== "")
    {
        currencies_list = currencies_list.filter(function(el) {
            return parseInt(el.id) !== parseInt(id_currencie);
        });
    }

    var formData = new FormData();
    formData.append("id_currencie", $('#id_currencie').val());
    formData.append("currencie", $('#currencie').val());

    $.ajax({
        url: 'ajoutOuModif_currencies',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            admin = {
                id:response.currencie.id,
                currencie:response.currencie.currencie
            }
            currencies_list.unshift(admin);
            refresh_table(currencies_list);
            $('#currenciesModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id){

    $.ajax({
        url: 'modifier_currencies/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update currencie</strong>');
            $('#id_currencie').val(response.currencie.id);
            $('#currencie').val(response.currencie.currencie);
            $('#currenciesModal').modal('show');
        }
    });
}

function supprimer(id){
    $.confirm({
        title: '<strong>Delete currencie !</strong>',
        content: 'Do you really wants to delete this currencie ?',
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
                    currencies_list = currencies_list.filter(function(el) {
                        return el.id !== id;
                    });
                    $.ajax({
                        url: 'supprimer_currencies/' + id,
                        type: 'GET',
                        success: function (response) {
                            refresh_table(currencies_list);
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
        title: '<strong>Delete currencies !</strong>',
        content: 'Do you really wants to delete these currencies ?',
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
                            currencies_list = currencies_list.filter(function(el) {
                                var el_id = parseInt(el.id);
                                var tab_sup_id = parseInt(value);
                                return el_id !== tab_sup_id;
                            });
                        });
                        $.ajax({
                            type: 'POST',
                            url: 'supprimer_all_currencies',
                            data: {
                                'json_tab':JSON.stringify(tab_sup)
                            },
                            dataType: 'json',
                            success: function (response) {
                                refresh_table(currencies_list);
                                confirmation(response.msg);
                            }
                        });
                    }else{
                        $.alert({
                            title: '<strong>Alert!</strong>',
                            content: 'Please select currencies type before deleting !!!',
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
                    currencies_list = [];
                    $.ajax({
                        url: 'clear_table_currencies',
                        type: 'POST',
                        success: function (response) {
                            refresh_table(currencies_list);
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
    $('#titre_form').html('<strong>Add currencie</strong>');
    $('#id_currencie').val('');
    $('#currencie').val('');
    $('#currenciesModal').modal('show');
}

function checkall(){
    if($('#chk_all').is(":checked")){
        $('.checkbox_ids').prop('checked', true);
    }else{
        $('.checkbox_ids').prop('checked', false);
    }
}

$(document).ready(function(){
    currencies_list = LoadcurrenciesList();
    $('#currencies-list').DataTable({
        columnDefs: [{orderable: false, targets: [0, 2]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(currencies_list);
    $('#form-currencies').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
});
