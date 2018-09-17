
function LoadbankaccountsList() {
    var bankaccounts_array = new Array();
    $.ajax({
        url: 'get-admin-users-accounts-list',
        type: 'GET',
        'async': false,
        success: function (response) {
            bankaccounts_array = response.personnes;
        }
    });
    return bankaccounts_array;
}

function refresh_table(bankaccounts_list)
{
    var length_data = bankaccounts_list.length;
    var dataTable = $('#bankaccounts-list').DataTable();
    if(length_data > 0){
        dataTable.clear().draw();
        $.each(bankaccounts_list, function(key, value) {
            dataTable.row.add([
                '<strong>' + value.nom_prenom + '</strong>',
                '<a href="javascript:void(0)" class="btn btn-icon btn-info tip" onclick="show_accounts(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Show Accounts List"><i class="fa fa-list-alt"></i> </a> ' +
                '<a href="generatePDF_admin_bankaccounts/' + value.id + '" class="btn btn-icon btn-danger tip" target="_blank" data-toggle="tooltip" data-placement="top" data-original-title="Generate PDF Accounts list"><i class="fa fa-file-pdf-o"></i> </a> '
            ]).draw();
        });
    }else{
        dataTable.clear().draw();
    }
}

function show_accounts(id_personne)
{
    $.ajax({
        url: 'get-admin_bankaccounts/' + id_personne,
        type: 'GET',
        'async': false,
        success: function (response) {
            var string_bankaccount = '';
            string_bankaccount +=  '<table id="bankaccounts-list" class="table table-responsive full-color-table full-info-table hover-table">'+
                '<thead>' +
                '<tr>' +
                '<th>Bank</th>' +
                '<th>Bank Country</th>' +
                '<th>#Account</th>' +
                '</tr>' +
                '</thead>' +
                '<tbody>';
            var length_data = response.bankaccounts.length;
            if(length_data > 0)
            {
                $.each(response.bankaccounts, function(key, value) {
                    string_bankaccount +=  '<tr>' +
                        '<td width="10%"><strong>' + value.bank + '</strong></td>' +
                        '<td width="60%"><strong>' + value.bank_account_country + '</strong></td>' +
                        '<td width="30%"><strong>' + value.bank_account_number + '</strong></td>' +
                        '</tr>';
                });
            }
            else
            {
                string_bankaccount +=  '<tr>' +
                    '<td colspan="3" class="text-center" width="100%"><strong>No Account added by this user</strong></td>' +
                    '</tr>';
            }
            string_bankaccount +=     '</tbody>'+
                '</table>';
            $('#titre_bankaccounts').html('<strong>Accounts List of ' + response.bankaccounts[0].nom_prenom + '</strong>');
            $('#table_bankaccounts').html(string_bankaccount);
            $('#bankaccountModal').modal('show');
        }
    });
}

$(document).ready(function(){
    bankaccounts_list = LoadbankaccountsList();
    $('#bankaccounts-list').DataTable({
        columnDefs: [{orderable: false, targets: [1]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(bankaccounts_list);
});
