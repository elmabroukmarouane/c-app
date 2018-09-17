
function LoadquestionsList() {
    var questions_array = new Array();
    $.ajax({
        url: 'get-questions',
        type: 'GET',
        'async': false,
        success: function (response) {
            questions_array = response.questions;
        }
    });
    return questions_array;
}

function refresh_table(questions_list)
{
    var length_data = questions_list.length;
    var dataTable = $('#questions-list').DataTable();
    if(length_data > 0){
        dataTable.clear().draw();
        $.each(questions_list, function(key, value) {
            dataTable.row.add([
                '<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                '<strong>' + value.question + '</strong>',
                '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> ' +
                '<a href="javascript:void(0)" class="btn btn-icon btn-danger tip" onclick="supprimer(' + value.id + ')" data-toggle="tooltip" data-placement="top" data-original-title="Delete"><i class="fa fa-trash-o"></i> </a> '
            ]).draw();
        });
    }else{
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
    var id_question = $('#id_question').val();
    if(id_question !== "")
    {
        questions_list = questions_list.filter(function(el) {
            return parseInt(el.id) !== parseInt(id_question);
        });
    }

    var formData = new FormData();
    formData.append("id_question", $('#id_question').val());
    formData.append("question", $('#question').val());

    $.ajax({
        url: 'ajoutOuModif_questions',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            admin = {
                id:response.question.id,
                question:response.question.question
            }
            questions_list.unshift(admin);
            refresh_table(questions_list);
            $('#questionsModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id){

    $.ajax({
        url: 'modifier_questions/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update question</strong>');
            $('#id_question').val(response.question.id);
            $('#question').val(response.question.question);
            $('#questionsModal').modal('show');
        }
    });
}

function supprimer(id){
    $.confirm({
        title: '<strong>Delete question !</strong>',
        content: 'Do you really wants to delete this question ?',
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
                    questions_list = questions_list.filter(function(el) {
                        return el.id !== id;
                    });
                    $.ajax({
                        url: 'supprimer_questions/' + id,
                        type: 'GET',
                        success: function (response) {
                            refresh_table(questions_list);
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
        title: '<strong>Delete questions !</strong>',
        content: 'Do you really wants to delete these questions ?',
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
                            questions_list = questions_list.filter(function(el) {
                                var el_id = parseInt(el.id);
                                var tab_sup_id = parseInt(value);
                                return el_id !== tab_sup_id;
                            });
                        });
                        $.ajax({
                            type: 'POST',
                            url: 'supprimer_all_questions',
                            data: {
                                'json_tab':JSON.stringify(tab_sup)
                            },
                            dataType: 'json',
                            success: function (response) {
                                refresh_table(questions_list);
                                confirmation(response.msg);
                            }
                        });
                    }else{
                        $.alert({
                            title: '<strong>Alert!</strong>',
                            content: 'Please select questions type before deleting !!!',
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
                    questions_list = [];
                    $.ajax({
                        url: 'clear_table_questions',
                        type: 'POST',
                        success: function (response) {
                            refresh_table(questions_list);
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

function vider() {
    $('#titre_form').html('<strong>Add question</strong>');
    $('#id_question').val('');
    $('#question').val('');
    $('#questionsModal').modal('show');
}

function checkall(){
    if($('#chk_all').is(":checked")){
        $('.checkbox_ids').prop('checked', true);
    }else{
        $('.checkbox_ids').prop('checked', false);
    }
}

$(document).ready(function(){
    questions_list = LoadquestionsList();
    $('#questions-list').DataTable({
        columnDefs: [{orderable: false, targets: [0, 2]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(questions_list);
    $('#form-questions').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
});
