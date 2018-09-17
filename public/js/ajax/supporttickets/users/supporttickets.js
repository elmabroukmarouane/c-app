
function LoadsupportticketsList() {
    var supporttickets_array = new Array();
    $.ajax({
        url: 'get-supporttickets-users',
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
                //'<input type="checkbox" class="checkbox_ids" id="admin_' + value.id + '" value="' + value.id + '">',
                '<strong>' + value.id + '</strong>',
                '<strong>' + value.nom_prenom + '</strong>',
                '<strong>' + value.subject + '</strong>',
                '<strong>' + value.created_at + '</strong>',
                status,
                '<a href="javascript:void(0)" class="btn btn-icon btn-success tip" onclick="supporttickets_show_messages(' + value.id + ')"  data-toggle="tooltip" data-placement="top" data-original-title="Ticket Messages List"><i class="fa fa-list-alt"></i> </a> '
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
        url: 'ajoutOuModif_supporttickets-users',
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

$(document).ready(function(){
    supporttickets_list = LoadsupportticketsList();
    $('#supporttickets-list').DataTable({
        order: [[ 0, "desc" ]],
        columnDefs: [{orderable: false, targets: [5]}],
        pageLength: 15,
        lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
    });
    refresh_table(supporttickets_list);
    $('#form-supporttickets').submit(function (e) {
        e.preventDefault();
        ajoutOuModif();
    });
});
