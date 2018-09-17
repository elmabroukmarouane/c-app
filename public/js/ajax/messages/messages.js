
function LoadmessagesList() {
    var messages_array = new Array();
    $.ajax({
        url: 'get-messages',
        type: 'GET',
        'async': false,
        success: function (response) {
            messages_array = response.messages;
        }
    });
    return messages_array;
}

function refresh_table(messages_list)
{
    var length_data = messages_list.length;
    var dataTable = $('#messages-list').DataTable();
    if(length_data > 0){
        dataTable.clear().draw();
        $.each(messages_list, function(key, value) {
            dataTable.row.add([
                '<span id="message_chk_' + value.id + '"><input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '"></span>',
                value.read,
                '<span id="message_sender_' + value.id + '"><strong><a href="javascript:void(0)" onclick="showmessage(' + value.id + ')">' + value.sender + '</a></strong></span>',
                //'<span id="message_message_' + value.id + '"><strong><a href="javascript:void(0)" onclick="showmessage(' + value.id + ')">' + value.message.substr(0, 20) + ' ...</a></strong></span>',
                //'<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> ' +
                '<span id="message_delete_' + value.id + '"><a href="javascript:void(0)" class="btn btn-icon btn-danger tip" onclick="supprimer(' + value.id + ')" data-toggle="tooltip" data-placement="top" data-original-title="Delete"><i class="fa fa-trash-o"></i> </a></span>'
            ]).draw();
            if(value.read === 0)
            {
                $('#message_chk_' + value.id).addClass('tr_row');
            }
        });
    }else{
        dataTable.clear().draw();
    }
    //set_class_table();
}

/*function set_class_table()
{
    if(messages_list.length > 0)
    {
        $.each(messages_list, function(key, value) {
            if(value.read === 0)
            {
                $('#message_chk_' + value.id).addClass('tr_row');
                //$('#message_sender_' + value.id).addClass('tr_row');
                //$('#message_message_' + value.id).addClass('tr_row');
                //$('#message_delete_' + value.id).addClass('tr_row');
            }
        });
    }
}*/

/*function ajoutOuModif() {
    var admin;
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var id_message = $('#id_message').val();
    if(id_message !== "")
    {
        messages_list = messages_list.filter(function(el) {
            return parseInt(el.id) !== parseInt(id_message);
        });
    }

    var formData = new FormData();
    formData.append("id_message", $('#id_message').val());
    formData.append("title", $('#title').val());
    formData.append("detail", $('#detail').val());

    $.ajax({
        url: 'ajoutOuModif_messages',
        type: 'message',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
            admin = {
                id:response.message.id,
                title:response.message.title
            }
            messages_list.unshift(admin);
            refresh_table(messages_list);
            $('#messagesModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function modifier(id){

    $.ajax({
        url: 'modifier_messages/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form').html('<strong>Update message</strong>');
            $('#id_message').val(response.message.id);
            $('#title').val(response.message.title);
            $('#detail').val(response.message.detail);
            $('#messagesModal').modal('show');
        }
    });
}*/

function showmessage(id){
    $.each(messages_list, function(key, value) {
        if(parseInt(value.id) === parseInt(id))
        {
            value.read = 1;
        }
    });
    $.ajax({
        url: 'modifier_messages/' + id,
        type: 'GET',
        success: function (response) {
            $('#show_titre_form').html('<strong>Detail message</strong>');
            $('#show_sender').html(response.message[0].sender);
            $('#show_message').html(response.message[0].message);
            refresh_table(messages_list);
            $('#showmessagesModal').modal('show');
        }
    });
}

function supprimer(id){
    $.confirm({
        title: '<strong>Delete message !</strong>',
        content: 'Do you really wants to delete this message ?',
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
                    messages_list = messages_list.filter(function(el) {
                        return el.id !== id;
                    });
                    $.ajax({
                        url: 'supprimer_messages/' + id,
                        type: 'GET',
                        success: function (response) {
                            refresh_table(messages_list);
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
        title: '<strong>Delete messages !</strong>',
        content: 'Do you really wants to delete these messages ?',
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
                            messages_list = messages_list.filter(function(el) {
                                var el_id = parseInt(el.id);
                                var tab_sup_id = parseInt(value);
                                return el_id !== tab_sup_id;
                            });
                        });
                        $.ajax({
                            type: 'message',
                            url: 'supprimer_all_messages',
                            data: {
                                'json_tab':JSON.stringify(tab_sup)
                            },
                            dataType: 'json',
                            success: function (response) {
                                refresh_table(messages_list);
                                confirmation(response.msg);
                            }
                        });
                    }else{
                        $.alert({
                            title: '<strong>Alert!</strong>',
                            content: 'Please select messages type before deleting !!!',
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
                    messages_list = [];
                    $.ajax({
                        url: 'clear_table_messages',
                        type: 'message',
                        success: function (response) {
                            refresh_table(messages_list);
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

/*function vider() {
    $('#titre_form').html('<strong>Add message</strong>');
    $('#id_message').val('');
    $('#title').val('');
    $('#detail').val('');
    $('#messagesModal').modal('show');
}*/

function checkall(){
    if($('#chk_all').is(":checked")){
        $('.checkbox_ids').prop('checked', true);
    }else{
        $('.checkbox_ids').prop('checked', false);
    }
}

$(document).ready(function(){
    messages_list = LoadmessagesList();
    $('#messages-list').DataTable({
        columnDefs: [
            {
                orderable: false,
                targets: [0, 3]
            },
            {
                targets: [1],
                visible: false,
                searchable: false
            }
        ],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
        /*createdRow: function ( row, data, index ) {
            if ( data[1] === 0 ) {
                $(row).addClass('tr_row');
            }
        }*/
    });
    refresh_table(messages_list);
    /*$('#form-messages').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });*/
});
