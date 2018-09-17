function LoadbalancebitcoinsList() {
    var balancebitcoins_array = [];
    $.ajax({
        url: 'get-balancebitcoins',
        type: 'GET',
        'async': false,
        success: function (response) {
            balancebitcoins_array = response.balancebitcoins;
        }
    });
    return balancebitcoins_array;
}

function refresh_table(balancebitcoins_list) {
    var length_data = balancebitcoins_list.length;
    var dataTable = $('#balancebitcoins-list').DataTable();
    if (length_data > 0) {
        dataTable.clear().draw();
        $.each(balancebitcoins_list, function (key, value) {
            $.ajax({
                url: 'modifier_rankings/' + value.rank_sponsor,
                type: 'GET',
                success: function (response) {
                    dataTable.row.add([
                        '<strong>' + value.sponsor_nom_prenom + '</strong>',
                        '<strong>' + response.ranking.ranking + '</strong>',
                        '<strong>' + value.balance_bitcoin + '</strong>',
                        '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> '
                    ]).draw();
                }
            });
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
    var id_balancebitcoin = $('#id_balance_bitcoin').val();
    if (id_balancebitcoin !== "") {
        balancebitcoins_list = balancebitcoins_list.filter(function (el) {
            return parseInt(el.id) !== parseInt(id_balancebitcoin);
        });
    }

    var formData = new FormData();
    formData.append("id_balance_bitcoin", $('#id_balance_bitcoin').val());
    formData.append("balance_bitcoin", $('#balance_bitcoin').val());

    $.ajax({
        url: 'ajoutOuModif_balancebitcoins',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            admin = {
                id: response.balancebitcoin[0].id,
                sponsor_nom_prenom: response.balancebitcoin[0].sponsor_nom_prenom,
                rank_sponsor: response.balancebitcoin[0].rank_sponsor,
                balance_bitcoin: response.balancebitcoin[0].balance_bitcoin
            };
            balancebitcoins_list.unshift(admin);
            refresh_table(balancebitcoins_list);
            $('#balancebitcoinsModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id) {

    $.ajax({
        url: 'modifier_balancebitcoins/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update Balance bitcoin</strong>');
            $('#id_balance_bitcoin').val(response.balancebitcoin.id);
            $('#balance_bitcoin').val(response.balancebitcoin.balance_bitcoin);
            $('#balancebitcoinsModal').modal('show');
        }
    });
}

function modifierByRanking() {
    $('#titre_form_by_ranking').html('<strong>Update Balance bitcoin by Ranking</strong>');
    $('#balancebitcoinsByRankingModal').modal('show');
}

function ajoutOuModifByRanking() {
    var balancebitcoin;
    var array_id_balancebitcoins = [];
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var id_ranking_filter = $('#id_ranking_filter').val();
    if (id_ranking_filter !== "") {
        balancebitcoins_list = balancebitcoins_list.filter(function (el) {
            if (parseInt(el.rank_sponsor) === parseInt(id_ranking_filter)) {
                array_id_balancebitcoins.push(el.id);
            }
            return parseInt(el.rank_sponsor) !== parseInt(id_ranking_filter);
        });
        //console.log('AR BA => ', array_id_balancebitcoins);
    }

    var formData = new FormData();
    formData.append("array_id_balancebitcoins", array_id_balancebitcoins);
    formData.append("balance_bitcoin", $('#balance_bitcoin_by_ranking').val());

    $.ajax({
        url: 'ajoutOuModifByRanking_balancebitcoins',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            $.each(response.balancebitcoins, function (key, value) {
                balancebitcoin = {
                    id: value.id,
                    sponsor_nom_prenom: value.sponsor_nom_prenom,
                    rank_sponsor: value.rank_sponsor,
                    balance_bitcoin: value.balance_bitcoin
                };
                balancebitcoins_list.unshift(balancebitcoin);
            });
            refresh_table(balancebitcoins_list);
            $('#balance_bitcoin_by_ranking').val('');
            $('#balancebitcoinsByRankingModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function filter_table(id_rank_sponsor) {
    var id_rank_sponsor_local = parseInt(id_rank_sponsor);
    var balancebitcoins_list_filter = [];
    if (id_rank_sponsor_local !== -1) {
        balancebitcoins_list_filter = balancebitcoins_list.filter(function (el) {
            var el_id_rank_sponsor_local = parseInt(el.rank_sponsor);
            return (
                el_id_rank_sponsor_local === id_rank_sponsor_local
            );
        });
    } else {
        balancebitcoins_list_filter = balancebitcoins_list;
    }
    refresh_table(balancebitcoins_list_filter);
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
    balancebitcoins_list = LoadbalancebitcoinsList();
    $('#balancebitcoins-list').DataTable({
        columnDefs: [{
            orderable: false,
            targets: [3]
        }],
        pageLength: 15,
        lengthMenu: [
            [15, 30, 50, 100, -1],
            [15, 30, 50, 100, "All"]
        ]
    });
    refresh_table(balancebitcoins_list);
    $('#form-balancebitcoins').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
    $('#form-balancebitcoinsByRankingModal').submit(function (e) {
        e.preventDefault();
        ajoutOuModifByRanking();
    });
});