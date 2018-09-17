
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
                '<a href="javascript:void(0)" onclick="show_wallet(' + value.id + ')"><strong>' + value.currencie + '</strong></a>',
                '<a href="javascript:void(0)" onclick="show_wallet(' + value.id + ')"><strong>' + value.wallet_name + '</strong></a>',
                '<a href="javascript:void(0)" onclick="show_wallet(' + value.id + ')"><strong>' + value.wallet_adresse + '</strong></a>'
            ]).draw();
        });
    }else{
        dataTable.clear().draw();
    }
}

function show_wallet(id){

    $.ajax({
        url: 'show_wallet_companywallets/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>wallet Details</strong>');
            $('#currencie').html('<strong style="font-weight: bold">' + response.companywallet.currencie + '</strong>');
            $('#wallet_name').html('<strong style="font-weight: bold">' + response.companywallet.wallet_name + '</strong>');
            $('#wallet_adresse').html('<strong style="font-weight: bold">' + response.companywallet.wallet_adresse + '</strong>');
            $('#companywalletsModal').modal('show');
        }
    });
}

$(document).ready(function(){
    companywallets_list = LoadcompanywalletsList();
    $('#companywallets-list').DataTable({
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(companywallets_list);
});
