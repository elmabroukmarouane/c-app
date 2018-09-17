function LoadbalanceaffiliationsList() {
    var balanceaffiliations_array = [];
    $.ajax({
        url: 'get-balanceaffiliations',
        type: 'GET',
        'async': false,
        success: function (response) {
            balanceaffiliations_array = response.balanceaffiliations;
        }
    });
    return balanceaffiliations_array;
}

function refresh_table(balanceaffiliations_list) {
    var length_data = balanceaffiliations_list.length;
    var dataTable = $('#balanceaffiliations-list').DataTable();
    if (length_data > 0) {
        dataTable.clear().draw();
        $.each(balanceaffiliations_list, function (key, value) {
            $.ajax({
                url: 'modifier_rankings/' + value.rank_sponsor,
                type: 'GET',
                success: function (response) {
                    dataTable.row.add([
                        '<strong>' + value.sponsor_nom_prenom + '</strong>',
                        '<strong>' + response.ranking.ranking + '</strong>',
                        '<strong>' + value.balance_affiliation + '</strong>',
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
    var id_balanceaffiliation = $('#id_balance_affiliation').val();
    if (id_balanceaffiliation !== "") {
        balanceaffiliations_list = balanceaffiliations_list.filter(function (el) {
            return parseInt(el.id) !== parseInt(id_balanceaffiliation);
        });
    }

    var formData = new FormData();
    formData.append("id_balance_affiliation", $('#id_balance_affiliation').val());
    formData.append("balance_affiliation", $('#balance_affiliation').val());

    $.ajax({
        url: 'ajoutOuModif_balanceaffiliations',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            admin = {
                id: response.balanceaffiliation[0].id,
                sponsor_nom_prenom: response.balanceaffiliation[0].sponsor_nom_prenom,
                rank_sponsor: response.balanceaffiliation[0].rank_sponsor,
                balance_affiliation: response.balanceaffiliation[0].balance_affiliation
            };
            balanceaffiliations_list.unshift(admin);
            refresh_table(balanceaffiliations_list);
            $('#balanceaffiliationsModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id) {

    $.ajax({
        url: 'modifier_balanceaffiliations/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update Balance Affiliation</strong>');
            $('#id_balance_affiliation').val(response.balanceaffiliation.id);
            $('#balance_affiliation').val(response.balanceaffiliation.balance_affiliation);
            $('#balanceaffiliationsModal').modal('show');
        }
    });
}

function modifierByRanking() {
    $('#titre_form_by_ranking').html('<strong>Update Balance Affiliation by Ranking</strong>');
    $('#balanceaffiliationsByRankingModal').modal('show');
}

function ajoutOuModifByRanking() {
    var balanceaffiliation;
    var array_id_balanceaffiliations = [];
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var id_ranking_filter = $('#id_ranking_filter').val();
    if (id_ranking_filter !== "") {
        balanceaffiliations_list = balanceaffiliations_list.filter(function (el) {
            if (parseInt(el.rank_sponsor) === parseInt(id_ranking_filter)) {
                array_id_balanceaffiliations.push(el.id);
            }
            return parseInt(el.rank_sponsor) !== parseInt(id_ranking_filter);
        });
        //console.log('AR BA => ', array_id_balanceaffiliations);
    }

    var formData = new FormData();
    formData.append("array_id_balanceaffiliations", array_id_balanceaffiliations);
    formData.append("balance_affiliation", $('#balance_affiliation_by_ranking').val());

    $.ajax({
        url: 'ajoutOuModifByRanking_balanceaffiliations',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            $.each(response.balanceaffiliations, function (key, value) {
                balanceaffiliation = {
                    id: value.id,
                    sponsor_nom_prenom: value.sponsor_nom_prenom,
                    rank_sponsor: value.rank_sponsor,
                    balance_affiliation: value.balance_affiliation
                };
                balanceaffiliations_list.unshift(balanceaffiliation);
            });
            refresh_table(balanceaffiliations_list);
            $('#balance_affiliation_by_ranking').val('');
            $('#balanceaffiliationsByRankingModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function filter_table(id_rank_sponsor) {
    var id_rank_sponsor_local = parseInt(id_rank_sponsor);
    var balanceaffiliations_list_filter = [];
    if (id_rank_sponsor_local !== -1) {
        balanceaffiliations_list_filter = balanceaffiliations_list.filter(function (el) {
            var el_id_rank_sponsor_local = parseInt(el.rank_sponsor);
            return (
                el_id_rank_sponsor_local === id_rank_sponsor_local
            );
        });
    } else {
        balanceaffiliations_list_filter = balanceaffiliations_list;
    }
    refresh_table(balanceaffiliations_list_filter);
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
    balanceaffiliations_list = LoadbalanceaffiliationsList();
    $('#balanceaffiliations-list').DataTable({
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
    refresh_table(balanceaffiliations_list);
    $('#form-balanceaffiliations').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
    $('#form-balanceaffiliationsByRankingModal').submit(function (e) {
        e.preventDefault();
        ajoutOuModifByRanking();
    });
});