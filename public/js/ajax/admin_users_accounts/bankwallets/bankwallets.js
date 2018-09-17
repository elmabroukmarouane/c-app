
function LoadbankwalletsList() {
    var bankwallets_array = new Array();
    $.ajax({
        url: 'get-admin-users-wallets-list',
        type: 'GET',
        'async': false,
        success: function (response) {
            bankwallets_array = response.personnes;
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
                '<strong>' + value.nom_prenom + '</strong>',
                '<a href="javascript:void(0)" class="btn btn-icon btn-info tip" onclick="show_wallets(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Show wallets List"><i class="fa fa-list-alt"></i> </a> ' +
                '<a href="generatePDF_admin_bankwallets/' + value.id + '" class="btn btn-icon btn-danger tip" target="_blank" data-toggle="tooltip" data-placement="top" data-original-title="Generate PDF wallets list"><i class="fa fa-file-pdf-o"></i> </a> '
            ]).draw();
        });
    }else{
        dataTable.clear().draw();
    }
}

function show_wallets(id_personne)
{
    $.ajax({
        url: 'get-admin_bankwallets/' + id_personne,
        type: 'GET',
        'async': false,
        success: function (response) {
            var string_bankwallet = '';
            string_bankwallet +=  '<table id="bankwallets-list" class="table table-responsive full-color-table full-info-table hover-table">'+
                '<thead>' +
                '<tr>' +
                '<th>Currencie</th>' +
                '<th>Wallet Name</th>' +
                '<th>Wallet Address</th>' +
                '</tr>' +
                '</thead>' +
                '<tbody>';
            var length_data = response.bankwallets.length;
            if(length_data > 0)
            {
                $.each(response.bankwallets, function(key, value) {
                    string_bankwallet +=  '<tr>' +
                        '<td width="10%"><strong>' + value.currencie + '</strong></td>' +
                        '<td width="60%"><strong>' + value.wallet_name + '</strong></td>' +
                        '<td width="30%"><strong>' + value.wallet_adresse + '</strong></td>' +
                        '</tr>';
                });
            }
            else
            {
                string_bankwallet +=  '<tr>' +
                    '<td colspan="3" class="text-center" width="100%"><strong>No wallet added by this user</strong></td>' +
                    '</tr>';
            }
            string_bankwallet +=     '</tbody>'+
                '</table>';
            $('#titre_bankwallets').html('<strong>Wallets List of ' + response.bankwallets[0].nom_prenom + '</strong>');
            $('#table_bankwallets').html(string_bankwallet);
            $('#bankwalletModal').modal('show');
        }
    });
}

$(document).ready(function(){
    bankwallets_list = LoadbankwalletsList();
    $('#bankwallets-list').DataTable({
        columnDefs: [{orderable: false, targets: [1]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(bankwallets_list);
});
