function LoadquestrepsList() {
  var questreps_array = new Array();
  $.ajax({
    url: "get-questreps",
    type: "GET",
    async: false,
    success: function(response) {
      questreps_array = response.questreps;
    }
  });
  return questreps_array;
}

function refresh_table(questreps_list) {
  var length_data = 0;
  $.ajax({
    url: "get-questreps",
    type: "GET",
    async: false,
    success: function(response) {
      questreps_array = response.questreps;
      length_data = questreps_array.length;
      var dataTable = $("#questreps-list").DataTable();
      if (length_data > 0) {
        dataTable.clear().draw();
        $.each(questreps_array, function(key, value) {
          dataTable.row
            .add([
              "<strong>" + value.question + "</strong>",
              "<strong>" + value.reponse + "</strong>",
              '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' +
                value.id +
                ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> '
            ])
            .draw();
        });
        $("#button_add_dropdown").hide();
        $("#divider_add_dropdown").hide();
      } else {
        $("#button_add_dropdown").show();
        $("#divider_add_dropdown").show();
        dataTable.clear().draw();
      }
    }
  });
}

function fill_form_questreps() {
  $("#titre_form").html("<strong>Fill Security Questions</strong>");
  $("#questrepsModal").modal("show");
}

function add_questreps() {
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
    }
  });
  var formData = new FormData();
  formData.append("id_question_1", $("#add_id_question_1").val());
  formData.append("reponse_1", $("#add_reponse_1").val());
  formData.append("id_question_2", $("#add_id_question_2").val());
  formData.append("reponse_2", $("#add_reponse_2").val());
  formData.append("id_question_3", $("#add_id_question_3").val());
  formData.append("reponse_3", $("#add_reponse_3").val());

  $.ajax({
    url: "add_questreps",
    type: "POST",
    async: true,
    contentType: false,
    processData: false,
    data: formData,
    statusCode: {
      500: function(response) {
        Errorconfirmation(response.responseJSON.msg);
      }
    },
    success: function(response) {
      //$("#answered_all_questions").hide();
      $("#button_add_dropdown").hide();
      $("#divider_add_dropdown").hide();
      refresh_table(questreps_list);
      $("#questrepsModal").modal("hide");
      /* $("#questreps_items").html("");
      refresh_question_select(); */
      confirmation(response.msg);
    }
  });
}

function modifier(id) {
  var html_questreps = "";
  $.ajax({
    url: "modifier_questreps/" + id,
    type: "GET",
    success: function(response) {
      $("#update_titre_form").html("<strong>Update Security Question</strong>");
      $("#update_id_questrep").val(id);
      $("#update_id_question").val(response.questrep.question_id);
      $("#update_reponse").val(response.questrep.reponse);
      $("#update_questrepsModal").modal("show");
    }
  });
}

function edit_questreps() {
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
    }
  });
  var formData = new FormData();
  formData.append("id_questrep", $("#update_id_questrep").val());
  formData.append("question_id", $("#update_id_question").val());
  formData.append("reponse", $("#update_reponse").val());

  $.ajax({
    url: "edit_questreps",
    type: "POST",
    async: true,
    contentType: false,
    processData: false,
    data: formData,
    statusCode: {
      500: function(response) {
        Errorconfirmation(response.responseJSON.msg);
      }
    },
    success: function(response) {
      refresh_table(questreps_list);
      $("#update_questrepsModal").modal("hide");
      confirmation(response.msg);
    }
  });
}

function confirmation(msg) {
  $.alert({
    title: "<strong>Confirmation!</strong>",
    content: msg,
    type: "green",
    typeAnimated: true,
    backgroundDismiss: true,
    icon: "fa fa-thumbs-o-up",
    theme: "modern",
    buttons: {
      OK: {
        text: "OK",
        btnClass: "btn-green",
        action: function() {}
      }
    }
  });
}

function Errorconfirmation(msg) {
  $.alert({
    title: "<strong>Error !</strong>",
    content: msg,
    type: "red",
    typeAnimated: true,
    icon: "fa fa-exclamation",
    theme: "modern",
    buttons: {
      OK: {
        text: "TRY AGAIN",
        btnClass: "btn-red",
        action: function() {}
      }
    }
  });
}

$(document).ready(function() {
  $("#questreps-list").DataTable({
    pageLength: 15,
    lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
  });
  refresh_table(questreps_list);
  $("#form-questreps").submit(function(e) {
    e.preventDefault();
    add_questreps();
  });
  $("#update-form-questreps").submit(function(e) {
    e.preventDefault();
    edit_questreps();
  });
});
