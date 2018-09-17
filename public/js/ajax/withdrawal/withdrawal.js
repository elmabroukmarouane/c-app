function LoadwithdrawalsList() {
    var withdrawals_array = [];
    $.ajax({
        url: 'get-withdrawals',
        type: 'GET',
        'async': false,
        success: function (response) {
            withdrawals_array = response.withdrawals;
        }
    });
    return withdrawals_array;
}

function refresh_table(withdrawals_list) {
    var length_data = withdrawals_list.length;
    var dataTable = $('#withdrawals-list').DataTable();
    var status_withdrawls = "";
    var status_withdrawls_icon = "";
    if (length_data > 0) {
        dataTable.clear().draw();
        $.each(withdrawals_list, function (key, value) {
            if (value.status_pvbalancepersonne == 0) {
                status_withdrawls = "Pending";
                status_withdrawls_icon = "warning";
            } else if (value.status_pvbalancepersonne == 1) {
                status_withdrawls = "Validated";
                status_withdrawls_icon = "success";
            } else if (value.status_pvbalancepersonne == 2) {
                status_withdrawls = "Rejected";
                status_withdrawls_icon = "danger";
            }
            dataTable.row.add([
                '<strong>' + value.nom + ' ' + value.prenom + '</strong>',
                //'<strong>' + value.balance_affiliation + '</strong>',
                '<strong>' + value.type_payment + '</strong>',
                '<strong>$ ' + value.montant_pvbalancepersonne + '</strong>',
                '<label><strong><span class="label label-' + status_withdrawls_icon + '">' + status_withdrawls + '</span></strong></label>',
                '<strong>' + moment(value.updated_at).format("DD/MM/YYYY HH:mm:ss") + '</strong>'
            ]).draw();
        });
    } else {
        dataTable.clear().draw();
    }
}

function filter_table(filter_status_pvbalancepersonne) {
    var filter_status_pvbalancepersonne_local = parseInt(filter_status_pvbalancepersonne);
    var withdrawals_list_filter = [];
    if (filter_status_pvbalancepersonne_local !== -1) {
        withdrawals_list_filter = withdrawals_list.filter(function (el) {
            var el_filter_status_pvbalancepersonne_local = parseInt(el.status_pvbalancepersonne);
            return (
                el_filter_status_pvbalancepersonne_local === filter_status_pvbalancepersonne_local
            );
        });
    } else {
        withdrawals_list_filter = withdrawals_list;
    }
    refresh_table(withdrawals_list_filter);
}

function ajoutOuModif() {
    var amount_withdrawal = parseFloat($('#amount_withdrawal').val());
    var total_balance_amount = parseFloat($('#total_balance_amount').val());
    var total_montant_pvbalancepersonne = parseFloat($('#total_montant_pvbalancepersonne').val());
    var total_amount_withdrawal_4p = (amount_withdrawal / 100) * 4;		
	var montant_pvbalancepersonne_withdrawal_formData = amount_withdrawal + total_amount_withdrawal_4p;

    if ((total_balance_amount - total_montant_pvbalancepersonne) >= (amount_withdrawal + total_amount_withdrawal_4p)) {
		swal({
			title: "Loading",
			text: "Please, wait a moment. \n The system is processing your request !",
			icon: '/c-app/assets/images/2.gif',
			buttons: false,
			closeOnClickOutside: false
		});
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        var formData = new FormData();
        formData.append("id_balance_affiliation", $('#id_balance_affiliation').val());
        formData.append("type_payment", $('#type_payment').val());
        formData.append("montant_pvbalancepersonne", montant_pvbalancepersonne_withdrawal_formData);

        $.ajax({
            url: 'ajoutOuModif_withdrawals',
            type: 'POST',
            async: true,
            contentType: false,
            processData: false,
            data: formData,
            success: function (response) {
				swal.close();
                withdrawals_list.unshift(response.withdrawal);
                refresh_table(withdrawals_list);
                $('#withdrawalsModal').modal('hide');
                confirmation(response.msg);
            }
        });
    } else {
        Errorconfirmation("You don't have enough money in your balance to withdraw this amount !");
    }
}

function withdraw_amount_balance() {
    $.ajax({
        url: 'get-balance-user',
        type: 'GET',
        'async': false,
        success: function (response) {
            $('#titre_form').html('<strong>Withraw an amount from your balance</strong>');
            /* $('#id_withdrawal').val(response.withdrawal.id); */
            $('#id_balance_affiliation').val(response.balanceaffiliation.id);
            $('#total_balance_amount').val(response.balanceaffiliation.balance_affiliation);
            $('#total_montant_pvbalancepersonne').val(response.total_montant_pvbalancepersonne);
            $('#amount_withdrawal').val('');
            $('#type_payment').val('Bank');
            $('#withdrawalsModal').modal('show');
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
    withdrawals_list = LoadwithdrawalsList();
    $('#withdrawals-list').DataTable({
        pageLength: 15,
        lengthMenu: [
            [15, 30, 50, 100, -1],
            [15, 30, 50, 100, "All"]
        ]
    });
    refresh_table(withdrawals_list);
    $('#form-withdrawals').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
});