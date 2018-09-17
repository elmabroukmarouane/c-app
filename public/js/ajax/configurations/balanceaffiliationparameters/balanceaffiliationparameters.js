function LoadbalanceaffiliationparametersList() {
    var balanceaffiliationparameters_array = [];
    $.ajax({
        url: 'get-balanceaffiliationparameters',
        type: 'GET',
        'async': false,
        success: function (response) {
            balanceaffiliationparameters_array = response.balanceaffiliationparameters;
        }
    });
    return balanceaffiliationparameters_array;
}

function refresh_table(balanceaffiliationparameters_list) {
    var length_data = balanceaffiliationparameters_list.length;
    var dataTable = $('#balanceaffiliationparameters-list').DataTable();
    if (length_data > 0) {
        dataTable.clear().draw();
        $.each(balanceaffiliationparameters_list, function (key, value) {
            dataTable.row.add([
                '<strong>$ ' + value.newcomer_parameter + '</strong>',
                '<strong>$ ' + value.affiliate_parameter + '</strong>',
                '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> '
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
    var id_balanceaffiliationparameter = $('#id_balanceaffiliationparameter').val();
    if (id_balanceaffiliationparameter !== "") {
        balanceaffiliationparameters_list = balanceaffiliationparameters_list.filter(function (el) {
            return parseInt(el.id) !== parseInt(id_balanceaffiliationparameter);
        });
    }

    var formData = new FormData();
    formData.append("id_balanceaffiliationparameter", $('#id_balanceaffiliationparameter').val());
    formData.append("newcomer_parameter", $('#newcomer_parameter').val());
    formData.append("affiliate_parameter", $('#affiliate_parameter').val());

    $.ajax({
        url: 'ajoutOuModif_balanceaffiliationparameters',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            admin = {
                id: response.balanceaffiliationparameter.id,
                newcomer_parameter: response.balanceaffiliationparameter.newcomer_parameter,
                affiliate_parameter: response.balanceaffiliationparameter.affiliate_parameter
            };
            balanceaffiliationparameters_list.unshift(admin);
            refresh_table(balanceaffiliationparameters_list);
            $('#balanceaffiliationparametersModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id) {

    $.ajax({
        url: 'modifier_balanceaffiliationparameters/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update Balance Affiliate Parameters</strong>');
            $('#id_balanceaffiliationparameter').val(response.balanceaffiliationparameter.id);
            $('#newcomer_parameter').val(response.balanceaffiliationparameter.newcomer_parameter);
            $('#affiliate_parameter').val(response.balanceaffiliationparameter.affiliate_parameter);
            $('#balanceaffiliationparametersModal').modal('show');
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

$(document).ready(function () {
    balanceaffiliationparameters_list = LoadbalanceaffiliationparametersList();
    $('#balanceaffiliationparameters-list').DataTable({
        columnDefs: [{
            orderable: false,
            targets: [2]
        }],
        pageLength: 15,
        lengthMenu: [
            [15, 30, 50, 100, -1],
            [15, 30, 50, 100, "All"]
        ]
    });
    refresh_table(balanceaffiliationparameters_list);
    $('#form-balanceaffiliationparameters').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
});