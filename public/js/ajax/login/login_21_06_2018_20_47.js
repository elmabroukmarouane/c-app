/* Form Login [Mod by EMO] */
function refresh_captch() {
  $.ajax({
    url: "refresh-captch",
    type: "GET",
    async: false,
    success: function (response) {
      $(".captcha span").html(response.captcha);
    }
  });
}
$(".btn-refresh-captcha").click(function () {
  refresh_captch();
});

function RegisterajoutOuModif() {
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
    }
  });

  var formData = new FormData();

  formData.append("nom", $("#signup_nom").val());
  formData.append("prenom", $("#signup_prenom").val());
  formData.append("pays", $("#signup_pays").val());
  formData.append("ville", $("#signup_ville").val());
  formData.append("zipcode", $("#signup_zipcode").val());
  formData.append("signup_type_payment", $("#signup_type_payment").val());
  formData.append("signup_wallet_public_key", $("#signup_wallet_public_key").val());
  formData.append("signup_payment_name", $("#signup_payment_name").val());
  formData.append("email", $("#signup_email").val());
  formData.append("password", $("#signup_password").val());
  formData.append("captcha", $("#captcha").val());
  formData.append("affiliate_id", $("#affiliate_id").val());

  $.ajax({
    url: "RegisterajoutOuModif",
    type: "POST",
    async: true,
    contentType: false,
    processData: false,
    data: formData,
    statusCode: {
      422: function (response) {
        $("#captcha").val("");
        refresh_captch();
        Errorconfirmation("Wrong Captcha. Please try again !");
      }
    },
    success: function (response) {
      $("#captcha").val("");
      refresh_captch();
      $("#msg_confirm_form").html(
        '<div class="alert alert-success block-inner"><strong>Success ! </strong>Your account has been created successfully. Please check your email to confirm it !</div>'
      );
      $("#error_login").hide();
      $("#msg_confirm_form").show();
      $("#registerform").hide();
      $("#loginform").slideDown();
      confirmation(response.msg);
    }
  });
}

function recoverPassword() {
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
    }
  });

  var formData = new FormData();

  formData.append("email", $("#recover_email").val());

  $.ajax({
    url: "checkEmailSecurity",
    type: "POST",
    async: true,
    contentType: false,
    processData: false,
    data: formData,
    statusCode: {
      404: function (response) {
        $("#recover_email").val("");
        $("#msg_confirm_form").html(
          '<div class="alert alert-danger block-inner"><strong>Error ! </strong>Email not found. Please Try again !</div>'
        );
        $("#error_login").hide();
        $("#msg_confirm_form").show();
        Errorconfirmation("Email not found. Please Try again !");
      }
    },
    success: function (response) {
      //console.log(response.newPassword);
      if (
        typeof response.active_security_questions !== "undefined" &&
        response.active_security_questions == 1
      ) {
        swal({
          title: "Loading",
          text: "Loading Questions. Please wait !!!",
          icon: "assets/images/2.gif",
          buttons: false,
          closeOnClickOutside: false
        });
        var html_questreps = "";
        $.ajax({
          url: "/public/get-questions-distinct-id/" + response.user_id,
          type: "GET",
          async: false,
          success: function (data_questions) {
            questions_array = data_questions.questions;
            if (questions_array.length > 0) {
              $.each(questions_array, function (key, value) {
                var formData_login = new FormData();
                formData_login.append("question_id", value.id);
                formData_login.append("user_id", response.user_id);
                id_questions_array.push(value.id);
                html_questreps +=
                  '<div class="form-group">' +
                  "<label>" +
                  value.question +
                  '<span style="font-weight: bold; color: red;"> (*)</span></label>' +
                  '<input type="text" class="form-control form-control-line" name="reponse_' +
                  value.id +
                  '" id="reponse_' +
                  value.id +
                  '" placeholder="Enter your answer" required>' +
                  "</div>";
              });
            }
            $("#questreps_items").html(html_questreps);
            $("#questreps_items").show();
            swal({
              title: "Loading",
              text: "Questions Loaded successfully :) !",
              icon: "success",
              timer: 2000
            });
            $("#recoverform").slideUp();
            $("#securityquestionsform").show();
            var_dump_value = response.user_id;
            email_user = $("#recover_email").val();
            $("#recover_email").val("");
          }
        });
      } else {
        $("#msg_confirm_form").html(
          '<div class="alert alert-success block-inner"><strong>Success ! </strong>An email has been successfully sent to your mailbox. Please check your email to change your password !</div>'
        );
        $("#error_login").hide();
        $("#msg_confirm_form").show();
        $("#recoverform").hide();
        $("#loginform").slideDown();
        confirmation(response.msg);
      }
    }
  });
}

function Ckeck_row_questrep() {
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
    }
  });
  var formData = new FormData();
  formData.append("id_questions_array", id_questions_array);
  formData.append("user_id", var_dump_value);
  $.each(id_questions_array, function (key, value) {
    formData.append("reponse_" + value, $("#reponse_" + value).val());
  });
  console.log("id_questions_array =>", id_questions_array);
  $.ajax({
    url: "CkeckRowQuestrep",
    type: "POST",
    async: true,
    contentType: false,
    processData: false,
    data: formData,
    statusCode: {
      404: function (response) {
        $.each(id_questions_array, function (key, value) {
          $("#reponse_" + value).val("");
        });
        $("#msg_confirm_form").html(
          '<div class="alert alert-danger block-inner"><strong>Error ! </strong>Email not found. Please Try again !</div>'
        );
        $("#error_login").hide();
        $("#msg_confirm_form").show();
        Errorconfirmation("Response not valid. Please enter a valid answers !");
      }
    },
    success: function (data) {
      if (data.found == true) {
        var formData = new FormData();
        formData.append("email", email_user);

        $.ajax({
          url: "/public/sendEmailRecoverPasswordPost",
          type: "POST",
          async: true,
          contentType: false,
          processData: false,
          data: formData,
          statusCode: {
            404: function (response) {
              $("#recover_email").val("");
              $("#msg_confirm_form").html(
                '<div class="alert alert-danger block-inner"><strong>Error ! </strong>Email not found. Please Try again !</div>'
              );
              $("#error_login").hide();
              $("#msg_confirm_form").show();
              Errorconfirmation("Email not found. Please Try again !");
            }
          },
          success: function (response) {
            $("#msg_confirm_form").html(
              '<div class="alert alert-success block-inner"><strong>Success ! </strong>An email has been successfully sent to your mailbox. Please check your email to change your password !</div>'
            );
            $("#error_login").hide();
            $("#msg_confirm_form").show();
            $("#securityquestionsform").hide();
            $("#recoverform").hide();
            $("#loginform").slideDown();
            confirmation(response.msg);
          }
        });
      }
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
        action: function () {}
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
        action: function () {}
      }
    }
  });
}

function vider_register() {
  $("#signup_email").val("");
  $("#signup_password").val("");
  $("#signup_confirm_password").val("");
}

function show_wallet_name_select(signup_type_payment) {
  if (signup_type_payment == "Bank") {
    $("#signup_wallet_public_key").removeAttr("placeholder");
    $("#signup_wallet_public_key").attr("placeholder", "Account Number");
    $('#div_signup_payment_name').hide();
  } else {
    $("#signup_wallet_public_key").removeAttr("placeholder");
    $("#signup_wallet_public_key").attr("placeholder", "Wallet Public Key");
    $('#div_signup_payment_name').show();
  }
}

$("#link-register").click(function () {
  vider_register();
  $("#loginform").slideUp();
  $("#securityquestionsform").slideUp();
  $("#registerform").show();
});
$("#return-btn").click(function () {
  $("#recoverform").hide();
  $("#securityquestionsform").hide();
  $("#loginform").slideDown();
});
$("#security-return-btn").click(function () {
  $("#recoverform").hide();
  $("#securityquestionsform").hide();
  $("#loginform").slideDown();
});
$("#recover-btn").click(function () {
  $("#loginform").slideUp();
  $("#securityquestionsform").slideUp();
  $("#recoverform").show();
});
$("#login-btn").click(function () {
  $("#registerform").hide();
  $("#securityquestionsform").hide();
  $("#loginform").slideDown();
});

$(document).ready(function () {
  $("#registerform").submit(function (e) {
    e.preventDefault();
    RegisterajoutOuModif();
  });
  $("#recoverform").submit(function (e) {
    e.preventDefault();
    recoverPassword();
  });
  $("#securityquestionsform").submit(function (e) {
    e.preventDefault();
    Ckeck_row_questrep();
  });
  var password = $("#signup_password")[0];
  var confirmPassword = $("#signup_confirm_password")[0];

  function validatePassword() {
    if (password.value != confirmPassword.value) {
      confirmPassword.setCustomValidity("Passwords Don't Match");
    } else {
      confirmPassword.setCustomValidity("");
    }
  }

  password.onchange = validatePassword;
  confirmPassword.onkeyup = validatePassword;
});