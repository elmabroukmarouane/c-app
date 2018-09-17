
function LoadquestrepsList() {
    var questreps_array = new Array();
    $.ajax({
        url: 'get-questreps',
        type: 'GET',
        'async': false,
        success: function (response) {
            questreps_array = response.questreps;
        }
    });
    return questreps_array;
}

function refresh_table(questreps_list)
{
    var length_data = 0;
        $.ajax({
        url: 'get-questreps',
        type: 'GET',
        'async': false,
        success: function (response) {
            questreps_array = response.questreps;
            length_data = questreps_array.length;
            var dataTable = $('#questreps-list').DataTable();
            if(length_data > 0){
                dataTable.clear().draw();
                $.each(questreps_array, function(key, value) {
                    dataTable.row.add([
                        '<strong>' + value.question + '</strong>',
                        '<strong>' + value.reponse + '</strong>',
                        '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> '
                    ]).draw();
                });
            }else{
                dataTable.clear().draw();
            }
        }
    });
}

function fill_form_questreps()
{
    //var html_id_questreps = '';
    swal({
        title: "Loading",
        text: "Loading Questions. Please wait !!!",
        icon: 'assets/images/2.gif',
        buttons: false,
        closeOnClickOutside: false
    });
    var html_questreps = '';
    $('#titre_form').html('<strong>Fill Security Questions</strong>');
    $.ajax({
        url: 'get-questions',
        type: 'GET',
        'async': false,
        success: function (response) {
            questions_array = response.questions;
            if(questions_array.length > 0)
            {
                $.each(questions_array, function(key, value) {
                    $.ajax({
                        url: 'get-row-questrep/' + value.id,
                        type: 'GET',
                        'async': false,
                        success: function (data) {
                            questrep_array = data.questrep;
                            if(questrep_array != null)
                            {
                                /*//html_id_questreps += '<input value="' + questrep_array.id + '" type="hidden" id="id_questrep" name="id_questrep_' + questrep_array.id + '" id="id_questrep_' + questrep_array.id + '">';
                                id_questrep_array.push(questrep_array.id);
                                html_questreps += '<div class="form-group">' +
                                    '<label>' + value.question + '<span class="required_field"> (*)</span></label>' +
                                    '<input value="' + questrep_array.reponse + '" type="text" class="form-control form-control-line" name="reponse_' + questrep_array.id + '" id="reponse_' + questrep_array.id + '" placeholder="Enter your answer" required>' +
                                    '</div>';*/
                                html_questreps = '<span style="color: red; font-weight: bold;">You have already answered the questions. <br>Please Update it if you want !</span>';
                                $('#questreps_items').show();
                                $('#submit_button_questreps').hide();
                            } else if(questrep_array == null) {
                                //html_id_questreps += '<input value="0" type="hidden" id="id_questrep">';
                                id_questions_array.push(value.id);
                                html_questreps += '<div class="form-group">' +
                                    '<label>' + value.question + '<span class="required_field"> (*)</span></label>' +
                                    '<input type="text" class="form-control form-control-line" name="reponse_' + value.id + '" id="reponse_' + value.id + '" placeholder="Enter your answer" required>' +
                                    '</div>';
                                $('#questreps_items').show();
                                $('#submit_button_questreps').show();
                            }
                        }
                    });
                });
            } else {
                html_questreps += '<div class="form-group">' +
                '<label>Pas de questions disponibles !</label>' +
                '</div>';
            }
            /*console.log(id_questrep_array);
            console.log(id_questions_array);*/
            //$('#id_questreps_items').html(html_id_questreps);
            $('#questreps_items').html(html_questreps);
            swal({
                title: "Loading",
                text: "Questions Loaded successfully :) !",
                icon: 'success',
                timer: 2000
            });
            $('#questrepsModal').modal('show');
        }
    });
}

function add_questreps()
{
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var formData = new FormData();
    formData.append("id_questions_array", id_questions_array);
    $.each(id_questions_array, function(key, value) {
        formData.append('reponse_' + value, $('#reponse_' + value).val());
    });

    $.ajax({
        url: 'add_questreps',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            refresh_table(questreps_list);
            $('#questrepsModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id){
    swal({
        title: "Loading",
        text: "Loading Questions. Please wait !!!",
        icon: 'assets/images/2.gif',
        buttons: false,
        closeOnClickOutside: false
    });
    var html_questreps = '';
    $.ajax({
        url: 'modifier_questreps/' + id,
        type: 'GET',
        success: function (response) {
            $('#update_titre_form').html('<strong>Update Security Question</strong>');
            $.ajax({
                url: 'modifier_questions/' + response.questrep.question_id,
                type: 'GET',
                'async': false,
                success: function (data) {
                    html_questreps += '<div class="form-group">' +
                        '<label>' + data.question.question + '<span class="required_field"> (*)</span></label>' +
                        '<input value="' + response.questrep.reponse + '" type="text" class="form-control form-control-line" id="update_reponse" placeholder="Enter your answer" required>' +
                        '</div>';
                    $('#update_id_questrep').val(id);
                    $('#update_questreps_items').html(html_questreps);
                    $('#update_questreps_items').show();
                    swal({
                        title: "Loading",
                        text: "Questions Loaded successfully :) !",
                        icon: 'success',
                        timer: 2000
                    });
                    $('#update_questrepsModal').modal('show');
                }
            });
        }
    });
}

function edit_questreps()
{
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var formData = new FormData();
    formData.append("update_id_questrep", $('#update_id_questrep').val());
    formData.append("update_reponse", $('#update_reponse').val());

    $.ajax({
        url: 'edit_questreps',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            refresh_table(questreps_list);
            $('#update_questrepsModal').modal('hide');
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
                action: function(){
                }
            }
        }
    });
}

function ajoutOuModif() {
    var bankwallet;
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var id_bankwallet = $('#id_bankwallet').val();
    if(id_bankwallet !== "")
    {
        questreps_list = questreps_list.filter(function(el) {
            return parseInt(el.id) !== parseInt(id_bankwallet);
        });
    }

    var formData = new FormData();
    formData.append("id_bankwallet", $('#id_bankwallet').val());
    formData.append("id_currencie", $('#id_currencie').val());
    formData.append("wallet_name", $('#wallet_name').val());
    formData.append("wallet_adresse", $('#wallet_adresse').val());

    $.ajax({
        url: 'ajoutOuModif_questreps',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            bankwallet = {
                id:response.bankwallet.id,
                nom_prenom:response.bankwallet.nom_prenom,
                currencie:response.bankwallet.currencie,
                wallet_name:response.bankwallet.wallet_name,
                wallet_adresse:response.bankwallet.wallet_adresse
            }
            questreps_list.unshift(bankwallet);
            refresh_table(questreps_list);
            $('#questrepsModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

/*
function modifier(id){

    $.ajax({
        url: 'modifier_questreps/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update wallet</strong>');
            $('#id_bankwallet').val(response.bankwallet.id);
            $('#id_currencie').val(response.bankwallet.id_currencie);
            $('#wallet_name').val(response.bankwallet.wallet_name);
            $('#wallet_adresse').val(response.bankwallet.wallet_adresse);
            $('#questrepsModal').modal('show');
        }
    });
}

function supprimer(id){
    $.confirm({
        title: '<strong>Delete wallet !</strong>',
        content: 'Do you really wants to delete this wallet ?',
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
                    questreps_list = questreps_list.filter(function(el) {
                        return el.id !== id;
                    });
                    $.ajax({
                        url: 'supprimer_questreps/' + id,
                        type: 'GET',
                        success: function (response) {
                            refresh_table(questreps_list);
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
        title: '<strong>Delete wallets !</strong>',
        content: 'Do you really wants to delete these wallets ?',
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
                            questreps_list = questreps_list.filter(function(el) {
                                var el_id = parseInt(el.id);
                                var tab_sup_id = parseInt(value);
                                return el_id !== tab_sup_id;
                            });
                        });
                        $.ajax({
                            type: 'POST',
                            url: 'supprimer_all_questreps',
                            data: {
                                'json_tab':JSON.stringify(tab_sup)
                            },
                            dataType: 'json',
                            success: function (response) {
                                refresh_table(questreps_list);
                                confirmation(response.msg);
                            }
                        });
                    }else{
                        $.alert({
                            title: '<strong>Alert!</strong>',
                            content: 'Please select wallets before deleting !!!',
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
                    questreps_list = [];
                    $.ajax({
                        url: 'clear_table_questreps',
                        type: 'POST',
                        success: function (response) {
                            refresh_table(questreps_list);
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

function vider() {
    $('#titre_form').html('<strong>Add wallet</strong>');
    $('#id_bankwallet').val('');
    $('#id_currencie').val(1);
    $('#wallet_name').val('');
    $('#wallet_adresse').val('');
    $('#questrepsModal').modal('show');
}*/

$(document).ready(function(){
    questreps_list = LoadquestrepsList();
    $('#questreps-list').DataTable({
        //columnDefs: [{orderable: false, targets: [2]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    //fill_form_questreps();
    refresh_table(questreps_list);
    $('#form-questreps').submit(function (e) {
        e.preventDefault();
        add_questreps();
    });
    $('#update-form-questreps').submit(function (e) {
        e.preventDefault();
        edit_questreps();
    });
});
