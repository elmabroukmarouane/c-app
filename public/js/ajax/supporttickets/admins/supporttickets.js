
function LoadsupportticketsList() {
    var supporttickets_array = new Array();
    $.ajax({
        url: 'get-supporttickets-admins',
        type: 'GET',
        'async': false,
        success: function (response) {
            supporttickets_array = response.supporttickets;
        }
    });
    return supporttickets_array;
}

function refresh_table(supporttickets_list)
{
    var status = '';
    var length_data = supporttickets_list.length;
    var dataTable = $('#supporttickets-list').DataTable();
    if(length_data > 0){
        dataTable.clear().draw();
        $.each(supporttickets_list, function(key, value) {
            if(value.status == 0)
            {
                status = '<strong class="label label-danger">Open</strong>';
            }
            else
            {
                status = '<strong class="label label-info">Closed</strong>';
            }
            dataTable.row.add([
                '<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                '<strong>' + value.id + '</strong>',
                '<strong>' + value.nom_prenom + '</strong>',
                '<strong>' + value.subject + '</strong>',
                '<strong>' + value.created_at + '</strong>',
                status,
                '<a href="javascript:void(0)" class="btn btn-icon btn-success tip" onclick="supporttickets_show_messages(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Ticket Messages List"><i class="fa fa-list-alt"></i> </a> ' +
                '<a href="javascript:void(0)" class="btn btn-icon btn-danger tip" onclick="supprimer(' + value.id + ')" data-toggle="tooltip" data-placement="top" data-original-title="Delete"><i class="fa fa-trash-o"></i> </a> '+
                '<a href="javascript:void(0)" class="btn btn-icon btn-info tip" onclick="status(' + value.id + ')" data-toggle="tooltip" data-placement="top" data-original-title="Change Status"><i class="fa fa-flag-o"></i> </a>'
            ]).draw();
        });
    }else{
        dataTable.clear().draw();
    }
}

function ajoutOuModif() {
    var admin;
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
    var id_supportticket = $('#id_supportticket').val();
    if(id_supportticket !== "")
    {
        supporttickets_list = supporttickets_list.filter(function(el) {
            return parseInt(el.id) !== parseInt(id_supportticket);
        });
    }

    var formData = new FormData();
    formData.append("id_supportticket", $('#id_supportticket').val());
    formData.append("subject", $('#supportticket_subject').val());
    formData.append("message", CKEDITOR.instances.supportticket_message.getData());

    $.ajax({
        url: 'ajoutOuModif_supporttickets-admins',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
			swal.close();
            admin = {
                id:response.supportticket.id,
                nom_prenom:response.supportticket.nom_prenom,
                subject:response.supportticket.subject,
                created_at:response.supportticket.created_at,
                status:response.supportticket.status
            }
            supporttickets_list.unshift(admin);
            $('#supporttickets_status_filter').val('-1');
            refresh_table(supporttickets_list);
            $('#supportticketsModal').modal('hide');
            confirmation(response.msg);
        }
    });
}

function updateStatus() {
    var id_status_supportticket = parseInt($('#id_status_supportticket').val());
    var status_supporttickets = $('#status_supporttickets').val();
    if(id_status_supportticket !== "")
    {
        supporttickets_list = supporttickets_list.filter(function(el) {
            var el_id_local = parseInt(el.id);
            if(id_status_supportticket === el_id_local)
            {
                el.status = status_supporttickets;
            }
            return el;
        });
    }

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var formData = new FormData();
    formData.append("id_status_supportticket", $('#id_status_supportticket').val());
    formData.append("status_supporttickets", $('#status_supporttickets').val());

    $.ajax({
        url: 'updateStatus_supporttickets',
        type: 'POST',
        async: true,
        contentType: false,
        processData: false,
        data: formData,
        success: function (response) {
           $('#supporttickets_status_filter').val('-1');
            $('#status_supportticketsModal').modal('hide');
            confirmation(response.msg);
            refresh_table(supporttickets_list);
        }
    });
}

function supporttickets_show_messages(id){
    var msg_list = '';
    var nom_prenom = '';
    var color_th = '';
    var supportticket_status = 0;
    var ticket_status = '';
    $.ajax({
        url: 'list_supportticketmessages/' + id,
        type: 'GET',
        success: function (response) {
            var length_data = response.supportticketmessages.length;
            if(length_data > 0) {
                color_th = '#2eb8b8';
                if(response.supportticketmessages[0].status == 0)
                {
                    ticket_status = 'Open';
                }
                else
                {
                    ticket_status = 'Closed';
                }
                msg_list += '<h4><strong style="text-decoration: underline">Ticket\'s Information</strong></h4><br />';
                msg_list += '<table style="text-align: center; border: solid 3px ' + color_th + '; width: 100%; margin-bottom: 10px;">';
                msg_list += '<thead><th colspan="2" style="text-align: center; padding: 2%; background-color: ' + color_th + '; color: white;">Ticket #' + response.supportticketmessages[0].id + ' Created at :' + response.supportticketmessages[0].created_at + '</th></thead>' +
                    '<tbody>' +
                    '<td style="width: 50%; border-right: solid 3px ' + color_th + '; color: black;"><strong>Ticket status : ' + ticket_status + '</strong></td>' +
                    '<td style="width: 50%; color: black;"><strong>Name : ' + response.supportticketmessages[0].nom_prenom + '</strong></td>' +
                    '</tbody>';
                msg_list += '</table>';
                msg_list += '<hr style="border: solid 2px #e6005c; width: 100%;" />';
                msg_list += '<h4><strong style="text-decoration: underline">Messages</strong></h4><br />';
                $.each(response.supportticketmessages, function (key, value) {
                    if(value.id_sender == 3)
                    {
                        nom_prenom = 'Administrator';
                        color_th = '#00b300';
                    }
                    else
                    {
                        nom_prenom = value.nom_prenom;
                        color_th = '#0d6aad';
                    }
                    msg_list += '<table style="border: solid 3px ' + color_th + '; width: 100%; margin-bottom: 10px;">';
                    msg_list += '<thead><th style="padding: 2%; background-color: ' + color_th + '; color: white;">' + nom_prenom + ' - Sent at :' + value.created_at + '</th></thead>' +
                                '<tbody><td style="padding: 1%; color: black;"><strong>' + value.message + '</strong></td></tbody>';
                    msg_list += '</table>';
                    supportticket_status = value.status;
                    $('#supportticket_subject').val(value.subject);
                });
            }
            $('#titre_form').html('<strong>Ticket Messages List</strong>');
            $('#id_supportticket').val(id);
            if(supportticket_status == 0)
            {
                msg_list += '<hr style="border: solid 2px #e6005c; width: 100%;" />';
                $('#list_supportticket_message').html(msg_list);
                $('#list_supportticket_message').show();
                $('#open_ticket_submit').show();
                $('#open_ticket_cancel').show();
                $('#form_supportticket_message').show();
            }
            else
            {
                $('#list_supportticket_message').html(msg_list);
                $('#list_supportticket_message').show();
                $('#open_ticket_submit').hide();
                $('#open_ticket_cancel').show();
                $('#form_supportticket_message').hide();
            }
            CKEDITOR.instances.supportticket_message.setData('');
            $('#supportticket_subject').attr('readonly', 'readonly');
            $('#supportticketsModal').modal('show');
        }
    });
}



function status(id){

    $.ajax({
        url: 'get_status_supportticket/' + id,
        type: 'GET',
        success: function (response) {
            $('#titre_form_status').html('<strong>Update Status Ticket</strong>');
            $('#id_status_supportticket').val(response.supportticket.id);
            $('#status_supporttickets').val(response.supportticket.status);
            $('#status_supportticketsModal').modal('show');
        }
    });
}

function filter_table(supporttickets_status_filter)
{
    var supporttickets_status_filter_local = parseInt(supporttickets_status_filter);
    var admin_list_filter = new Array();
    if(supporttickets_status_filter_local !== -1)
    {
        admin_list_filter = supporttickets_list.filter(function(el) {
            var el_supporttickets_status_local = parseInt(el.status);
            return el_supporttickets_status_local === supporttickets_status_filter_local;
        });
    }
    else
    {
        admin_list_filter = supporttickets_list;
    }
    refresh_table(admin_list_filter);
}

function supprimer(id){
    $.confirm({
        title: '<strong>Delete supportticket !</strong>',
        content: 'Do you really wants to delete this ticket ?',
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
                    supporttickets_list = supporttickets_list.filter(function(el) {
                        return el.id !== id;
                    });
                    $.ajax({
                        url: 'supprimer_supporttickets/' + id,
                        type: 'GET',
                        success: function (response) {
                            refresh_table(supporttickets_list);
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
        title: '<strong>Delete supporttickets !</strong>',
        content: 'Do you really wants to delete these tickets ?',
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
                            supporttickets_list = supporttickets_list.filter(function(el) {
                                var el_id = parseInt(el.id);
                                var tab_sup_id = parseInt(value);
                                return el_id !== tab_sup_id;
                            });
                        });
                        $.ajax({
                            type: 'POST',
                            url: 'supprimer_all_supporttickets',
                            data: {
                                'json_tab':JSON.stringify(tab_sup)
                            },
                            dataType: 'json',
                            success: function (response) {
                                refresh_table(supporttickets_list);
                                confirmation(response.msg);
                            }
                        });
                    }else{
                        $.alert({
                            title: '<strong>Alert!</strong>',
                            content: 'Please select tickets type before deleting !!!',
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
                    supporttickets_list = [];
                    $.ajax({
                        url: 'clear_table_supporttickets',
                        type: 'POST',
                        success: function (response) {
                            refresh_table(supporttickets_list);
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
    $('#titre_form').html('<strong>Open Ticket</strong>');
    $('#id_supportticket').val('');
    $('#supportticket_subject').val('');
    CKEDITOR.instances.supportticket_message.setData('');
    $('#list_supportticket_message').hide();
    $('#supportticket_subject').removeAttr("readonly");
    $('#open_ticket_submit').show();
    $('#open_ticket_cancel').show();
    $('#form_supportticket_message').show();
    $('#supportticketsModal').modal('show');
}

function checkall(){
    if($('#chk_all').is(":checked")){
        $('.checkbox_ids').prop('checked', true);
    }else{
        $('.checkbox_ids').prop('checked', false);
    }
}

$(document).ready(function(){
    supporttickets_list = LoadsupportticketsList();
    $('#supporttickets-list').DataTable({
        order: [[ 1, "desc" ]],
        columnDefs: [{orderable: false, targets: [0, 6]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(supporttickets_list);
    $('#form-supporttickets').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
    $('#form-status_supporttickets').submit(function (e) {
        e.preventDefault();
        updateStatus();
    });
});
