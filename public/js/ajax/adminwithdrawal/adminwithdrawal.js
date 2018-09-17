function LoadadminwithdrawalsList() {
    var adminwithdrawals_array = [];
    $.ajax({
        url: 'get-adminwithdrawals',
        type: 'GET',
        'async': false,
        success: function (response) {
            adminwithdrawals_array = response.adminwithdrawals;
        }
    });
    return adminwithdrawals_array;
}

function refresh_table(adminwithdrawals_list) {
    var length_data = adminwithdrawals_list.length;
    var dataTable = $('#adminwithdrawals-list').DataTable();
    var status_withdrawls = "";
    var status_withdrawls_icon = "";
    var select_status_withdrawls = "";
    if (length_data > 0) {
        dataTable.clear().draw();
        $.each(adminwithdrawals_list, function (key, value) {
            if (value.status_pvbalancepersonne == 0) {
                status_withdrawls = "Pending";
                status_withdrawls_icon = "warning";
                select_status_withdrawls = '<select class="form-control" name="home_status_pvbalancepersonne" id="home_status_pvbalancepersonne" onchange="adminwithdrawals_change_status_pvbalancepersonne(' + value.id + ', $(this).val())" style="padding: 2px;">' +
                    '<option value = "0" selected = "selected"> Pending </option>' +
                    '<option value = "1" > Validated </option>' +
                    '<option value = "2" > Rejected </option>' +
                    '</select>';
            } else if (value.status_pvbalancepersonne == 1) {
                status_withdrawls = "Validated";
                status_withdrawls_icon = "success";
                select_status_withdrawls = '<label><strong><span class="label label-success">Validated</span></strong></label>';
            } else if (value.status_pvbalancepersonne == 2) {
                status_withdrawls = "Rejected";
                status_withdrawls_icon = "danger";
                select_status_withdrawls = '<label><strong><span class="label label-danger">Rejected</span></strong></label>';
            }
            dataTable.row.add([
                '<strong>' + value.nom + ' ' + value.prenom + '</strong>',
                '<strong>' + value.balance_affiliation + '</strong>',
                '<strong>' + value.type_payment + '</strong>',
                '<strong>$ ' + value.montant_pvbalancepersonne + '</strong>',
                '<label><strong><span class="label label-' + status_withdrawls_icon + '">' + status_withdrawls + '</span></strong></label>',
                '<strong>' + moment(value.updated_at).format("DD/MM/YYYY HH:mm:ss") + '</strong>',
                select_status_withdrawls
            ]).draw();
        });
    } else {
        dataTable.clear().draw();
    }
}

function filter_table(filter_status_pvbalancepersonne) {
    var filter_status_pvbalancepersonne_local = parseInt(filter_status_pvbalancepersonne);
    var adminwithdrawals_list_filter = [];
    if (filter_status_pvbalancepersonne_local !== -1) {
        adminwithdrawals_list_filter = adminwithdrawals_list.filter(function (el) {
            var el_filter_status_pvbalancepersonne_local = parseInt(el.status_pvbalancepersonne);
            return (
                el_filter_status_pvbalancepersonne_local === filter_status_pvbalancepersonne_local
            );
        });
    } else {
        adminwithdrawals_list_filter = adminwithdrawals_list;
    }
    refresh_table(adminwithdrawals_list_filter);
}

function adminwithdrawals_change_status_pvbalancepersonne(id_pvbalancepersonne, status_pvbalancepersonne) {

    $.ajaxSetup({
        headers: {
            "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
        }
    });

    var formData = new FormData();
    formData.append("id_pvbalancepersonne", id_pvbalancepersonne);
    formData.append("status_pvbalancepersonne", status_pvbalancepersonne);

    $.ajax({
        url: "updateStatusWithdrawAdmin",
        type: "POST",
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            adminwithdrawals_list = LoadadminwithdrawalsList();
            refresh_table(adminwithdrawals_list);
            filter_table($("#filter_status_pvbalancepersonne").val());
            confirmation(response.msg);
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

function Errorconfirmation(msg) {
    $.alert({
        title: "<strong>SORRY !</strong>",
        content: msg,
        type: "red",
        typeAnimated: true,
        icon: "fa fa-exclamation",
        theme: "modern",
        buttons: {
            OK: {
                text: "TRY AGAIN AFTER",
                btnClass: "btn-red",
                action: function () {}
            }
        }
    });
}

$(document).ready(function () {
    adminwithdrawals_list = LoadadminwithdrawalsList();
    $('#adminwithdrawals-list').DataTable({
        columnDefs: [{
            orderable: false,
            targets: [6]
        }],
        pageLength: 15,
        lengthMenu: [
            [15, 30, 50, 100, -1],
            [15, 30, 50, 100, "All"]
        ]
    });
    refresh_table(adminwithdrawals_list);
    filter_table($("#filter_status_pvbalancepersonne").val());
});