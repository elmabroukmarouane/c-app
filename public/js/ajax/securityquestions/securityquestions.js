function Ckeck_row_questrep() {
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
    }
  });

  var formData = new FormData();
  formData.append("question_id", $("#id_question").val());
  formData.append("reponse", $("#reponse").val());
  formData.append("user_id", $("#user_id_final_security").val());
  formData.append("wt_64", $("#wt_64").val());

  $.ajax({
    url: "/public/CkeckRowVerificationQuestions",
    type: "POST",
    async: true,
    contentType: false,
    processData: false,
    data: formData,
    statusCode: {
      404: function(response) {
        if (count_error_questions >= 3) {
          $("#msg_confirm_form").html(
            '<div class="alert alert-danger block-inner"><strong>Answers not valid ! </strong>Your account is disabled. To re-activate your account, please check you mailbox !</div>'
          );
          $("#msg_confirm_form").show();
          var formDataUserId = new FormData();
          formDataUserId.append("user_id", $("#user_id_final_security").val());
          $.ajax({
            url: "/public/sendEmailVerificationQuestionsPost",
            type: "POST",
            async: true,
            contentType: false,
            processData: false,
            data: formDataUserId,
            success: function(response) {
              confirmation(response.msg);
              /* $.ajax({
                url: "/public/deconnectSecurityQuestions",
                type: "GET",
                async: false,
                success: function(response) {
                  setTimeout(function() {
                    window.location.href = response.url;
                  }, 4000);
                }
              }); */
            }
          });
          setTimeout(function() {
            window.location.href = response.responseJSON.url;
          }, 4000);
        } else {
          count_error_questions++;
          Errorconfirmation("Answers not valid. Please try again !");
        }
      }
    },
    success: function(data) {
      window.location.href = data.url;
    }
  });
}

function confirmation(msg) {
  $.alert({
    title: "<strong>Success !</strong>",
    content: msg,
    type: "green",
    typeAnimated: true,
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
  $("#securityquestions").submit(function(e) {
    e.preventDefault();
    Ckeck_row_questrep();
  });
});
