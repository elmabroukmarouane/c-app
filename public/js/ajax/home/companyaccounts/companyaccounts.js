
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
                '<a href="javascript:void(0)" onclick="show_account(' + value.id + ')"><strong>' + value.bank + '</strong></a>',
                '<a href="javascript:void(0)" onclick="show_account(' + value.id + ')"><strong>' + value.bank_account_country + '</strong></a>',
                '<a href="javascript:void(0)" onclick="show_account(' + value.id + ')"><strong>' + value.bank_account_number + '</strong></a>'
            ]).draw();
        });
    }else{
        dataTable.clear().draw();
    }
}

function show_account(id){

    $.ajax({
        url: 'show_account_companyaccounts/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Account Details</strong>');
            $('#bank').html('<strong style="font-weight: bold">' + response.companyaccount.bank + '</strong>');
            $('#bank_account_country').html('<strong style="font-weight: bold">' + response.companyaccount.bank_account_country + '</strong>');
            $('#bank_account_number').html('<strong style="font-weight: bold">' + response.companyaccount.bank_account_number + '</strong>');
            $('#companyaccountsModal').modal('show');
        }
    });
}

$(document).ready(function(){
    companyaccounts_list = LoadcompanyaccountsList();
    $('#companyaccounts-list').DataTable({
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(companyaccounts_list);
});
