function ProfilajoutOuModif() {
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
    }
  });

  var formData = new FormData();
  formData.append("id_personne", $("#update_profil_id_personne").val());
  formData.append("nom", $("#update_profil_nom").val());
  formData.append("prenom", $("#update_profil_prenom").val());
  formData.append("date_naissance", $("#update_profil_date_naissance").val());
  formData.append("telephone", $("#update_profil_telephone").val());
  formData.append("adresse", $("#update_profil_adresse").val());
  //formData.append("image", $('#update_profil_image')[0].files[0]);
  formData.append("email", $("#update_profil_email").val());
  formData.append("password", $("#update_profil_password").val());
  formData.append(
    "active_security_questions",
    $("#update_active_security_questions").val()
  );

  $.ajax({
    url: "ProfilajoutOuModif",
    type: "POST",
    async: true,
    contentType: false,
    processData: false,
    data: formData,
    success: function (response) {
      $("#div_image_header1").html(
        '<img src="divers/images/images_admins/' +
        response.personne.image +
        '" alt="' +
        response.personne.prenom +
        " " +
        response.personne.nom +
        '" class="profile-pic" />'
      );
      $("#div_image_header2").html(
        '<img src="divers/images/images_admins/' +
        response.personne.image +
        '" alt="' +
        response.personne.prenom +
        " " +
        response.personne.nom +
        '">'
      );
      $("#div_nom_header").html(
        response.personne.prenom + " " + response.personne.nom
      );
      $("#div_email_header").html(
        '<a href="mailto:' +
        response.user.email +
        '">' +
        response.user.email +
        "</a>"
      );
      $("#div_image_menu").html(
        '<img src="divers/images/images_admins/' +
        response.personne.image +
        '"  alt="' +
        response.personne.prenom +
        " " +
        response.personne.nom +
        '" />'
      );
      $("#div_nom_menu").html(
        response.personne.prenom + " " + response.personne.nom
      );
      $("#updateProfilModal").modal("hide");
      Profilconfirmation(response.msg);
    }
  });
}

function Profilmodifier(id) {
  $.ajax({
    url: "Profilmodifier/" + id,
    type: "GET",
    success: function (response) {
      $("#update_profil_titre_form").html("<strong>Update Profil</strong>");
      $("#update_profil_msg_info").html(
        '<strong>All fileds are required except the Image and the password, <span style="color: green; text-decoration: underline;">it\'s optional !</span></strong>'
      );
      $("#update_profil_id_personne").val(response.personne.id);
      if (response.personne.nom !== "") {
        $("#update_profil_nom").attr("readonly", "readonly");
      } else {
        $("#update_profil_nom").removeAttr("readonly");
      }
      $("#update_profil_nom").val(response.personne.nom);
      if (response.personne.prenom !== "") {
        $("#update_profil_prenom").attr("readonly", "readonly");
      } else {
        $("#update_profil_prenom").removeAttr("readonly");
      }
      $("#update_profil_prenom").val(response.personne.prenom);
      if (response.personne.email !== "") {
        $("#update_profil_email").attr("readonly", "readonly");
      } else {
        $("#update_profil_email").removeAttr("readonly");
      }
      $("#update_profil_email").val(response.personne.email);
      if (response.personne.date_naissance !== "") {
        $("#update_profil_date_naissance").attr("readonly", "readonly");
      } else {
        $("#update_profil_date_naissance").removeAttr("readonly");
      }
      $("#update_profil_date_naissance").val(response.personne.date_naissance);
      if (response.personne.telephone !== "") {
        $("#update_profil_telephone").attr("readonly", "readonly");
      } else {
        $("#update_profil_telephone").removeAttr("readonly");
      }
      $("#update_profil_telephone").val(response.personne.telephone);
      if (response.personne.adresse !== "") {
        $("#update_profil_adresse").attr("readonly", "readonly");
      } else {
        $("#update_profil_adresse").removeAttr("readonly");
      }
      $("#update_profil_adresse").val(response.personne.adresse);
      $("#update_profil_password").val(response.personne.password);
      $("#update_profil_password").removeAttr("required");
      $("#update_profil_required_password").removeClass("required_field");
      $("#update_profil_required_password").hide();
      $("#update_profil_confirm_password").val("");
      $("#update_profil_confirm_password").removeAttr("required");
      $("#update_profil_required_confirm_password").removeClass(
        "required_field"
      );
      $("#update_profil_required_confirm_password").hide();
      $("#update_active_security_questions").val(
        response.personne.active_security_questions
      );
      $("#updateProfilModal").modal("show");
    }
  });
}

function ProfilShowInfo(id) {
  $.ajax({
    url: "Profilmodifier/" + id,
    type: "GET",
    success: function (response) {
      $("#profil_page_nom_prenom").html(
        response.personne.prenom + " " + response.personne.nom
      );
      $("#profil_page_email").html(
        '<a href="mailto:' +
        response.personne.email +
        '">' +
        response.personne.email +
        "</a>"
      );
      $("#profil_page_date_naissance").html(response.personne.date_naissance);
      $("#profil_page_telephone").html(response.personne.telephone);
      $("#profil_page_adresse").html(response.personne.adresse);
    }
  });
}

function Ranking() {
  $.ajax({
    url: "ranking",
    type: "GET",
    success: function (response) {
      $("#raking_user").html(response.ranking + '<i class="fa fa-star"></i>');
      //$('#div_raking_user').html(response.ranking);
      $("#div_raking_user").html(
        "<strong>" + response.ranking + '</strong><i class="fa fa-star"></i>'
      );
      $("#span_raking_user").html(
        "<strong>" + response.ranking + '</strong><i class="fa fa-star"></i>'
      );
    }
  });
}

function Profilconfirmation(msg) {
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

function update_old_profil_afficherpassword() {
  if ($("#update_old_profil_afficher_password").val() === "oui") {
    $("#update_old_profil_password").attr("type", "password");
    $("#update_old_profil_icon_password").attr("class", "fa fa-eye");
    $("#update_old_profil_afficher_password").val("non");
  } else {
    $("#update_old_profil_password").attr("type", "text");
    $("#update_old_profil_icon_password").attr("class", "fa fa-eye-slash");
    $("#update_old_profil_afficher_password").val("oui");
  }
}

function update_profil_afficherpassword() {
  if ($("#update_profil_afficher_password").val() === "oui") {
    $("#update_profil_password").attr("type", "password");
    $("#update_profil_icon_password").attr("class", "fa fa-eye");
    $("#update_profil_afficher_password").val("non");
  } else {
    $("#update_profil_password").attr("type", "text");
    $("#update_profil_icon_password").attr("class", "fa fa-eye-slash");
    $("#update_profil_afficher_password").val("oui");
  }
}

function update_profil_afficherconfirmpassword() {
  if ($("#update_profil_afficher_confirmPassword").val() === "oui") {
    $("#update_profil_confirm_password").attr("type", "password");
    $("#update_profil_icon_confirmpassword").attr("class", "fa fa-eye");
    $("#update_profil_afficher_confirmPassword").val("non");
  } else {
    $("#update_profil_confirm_password").attr("type", "text");
    $("#update_profil_icon_confirmpassword").attr("class", "fa fa-eye-slash");
    $("#update_profil_afficher_confirmPassword").val("oui");
  }
}

function getPosts() {
  var html_posts = "";
  $.ajax({
    url: "getPostsHeader",
    type: "GET",
    success: function (response) {
      var length_data = response.posts_array.length;
      if (length_data > 0) {
        $("#pt_rouge_notif_new").show();
        $.each(response.posts_array, function (key, value) {
          html_posts +=
            "<!-- Message -->" +
            '<a href="javascript:void(0)">' +
            '<div class="btn btn-info btn-circle"><i class="fa fa-info"></i></div>' +
            '<div class="mail-contnet">' +
            "<h5> &nbsp;" +
            value.title +
            '</h5> <span class="time"> &nbsp;' +
            value.date_post +
            "</span> </div>" +
            "</a>" +
            "<!-- Message -->";
        });
      } else {
        $("#pt_rouge_notif_new").hide();
        var d = new Date();
        var month = d.getMonth() + 1;
        var day = d.getDate();
        var output =
          (day < 10 ? "0" : "") +
          day +
          "/" +
          (month < 10 ? "0" : "") +
          month +
          "/" +
          d.getFullYear();
        html_posts +=
          "<!-- Message -->" +
          '<a href="javascript:void(0)">' +
          '<div class="btn btn-info btn-circle"><i class="fa fa-info"></i></div>' +
          '<div class="mail-contnet">' +
          '<h5> &nbsp;No new post !</h5> <span class="time"> &nbsp;' +
          output +
          "</span> </div>" +
          "</a>" +
          "<!-- Message -->";
      }
      $("#notification_header").html(html_posts);
    }
  });
}

function sendMessages() {
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
    }
  });

  var formData = new FormData();
  formData.append("id_personne", $("#id_personne_msg").val());
  //formData.append("message", $('#msg_textarea_admin').val());
  formData.append("message", CKEDITOR.instances.msg_textarea_admin.getData());

  $.ajax({
    url: "sendMessages",
    type: "POST",
    async: true,
    contentType: false,
    processData: false,
    data: formData,
    success: function (response) {
      //$("#msg_textarea_admin").val('');
      CKEDITOR.instances.msg_textarea_admin.setData("");
      Profilconfirmation(response.msg);
    }
  });
}

$("#update_profil_page_button").click(function () {
  //var update_old_profil_password = $("#update_old_profil_password").val();
  var update_profil_password = $("#update_profil_password").val();
  var update_profil_confirm_password = $(
    "#update_profil_confirm_password"
  ).val();
  /*var empty_fields = false;
  console.log(
    "update_old_profil_password => ",
    update_old_profil_password,
    "update_profil_password => ",
    update_profil_password,
    "update_profil_confirm_password => ",
    update_profil_confirm_password
  );*/
  /*if (update_old_profil_password == "") {
    $("#update_old_profil_password").css("border", "1px solid red");
  } else {
    $("#update_old_profil_password").css("border", "1px solid rgba(0,0,0,.15)");
  }
  if (update_profil_password == "") {
    $("#update_profil_password").css("border", "1px solid red");
  } else {
    $("#update_profil_password").css("border", "1px solid rgba(0,0,0,.15)");
  }
  if (update_profil_confirm_password == "") {
    $("#update_profil_confirm_password").css("border", "1px solid red");
  } else {
    $("#update_profil_confirm_password").css(
      "border",
      "1px solid rgba(0,0,0,.15)"
    );
  }
  if (
    update_old_profil_password != "" &&
    update_profil_password != "" &&
    update_profil_confirm_password != ""
  ) {
    empty_fields = true;
  }*/
  //if (empty_fields) {
  if (update_profil_password == update_profil_confirm_password) {
    $("#update_profil_password").css("border", "1px solid rgba(0,0,0,.15)");
    $("#update_profil_confirm_password").css(
      "border",
      "1px solid rgba(0,0,0,.15)"
    );
    //alert("Passwords Match");
    $.ajaxSetup({
      headers: {
        "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
      }
    });

    var formData = new FormData();
    formData.append("update_profil_nom", $("#update_profil_nom").val());
    formData.append("update_profil_prenom", $("#update_profil_prenom").val());
    formData.append(
      "update_profil_date_naissance",
      $("#update_profil_date_naissance").val()
    );
    formData.append(
      "update_profil_telephone",
      $("#update_profil_telephone").val()
    );
    formData.append("update_profil_adresse", $("#update_profil_adresse").val());
    formData.append("update_profil_email", $("#update_profil_email").val());
    formData.append(
      "update_profil_password",
      $("#update_profil_password").val()
    );
    formData.append(
      "update_old_profil_password",
      $("#update_old_profil_password").val()
    );
    formData.append(
      "active_security_questions",
      $("#update_active_security_questions").val()
    );

    $.ajax({
      url: "updateProfilPage",
      type: "POST",
      async: true,
      contentType: false,
      processData: false,
      data: formData,
      statusCode: {
        404: function (response) {
          Errorconfirmation(response.responseJSON.msg);
        },
        500: function (response) {
          Errorconfirmation(response.responseJSON.msg);
        }
      },
      success: function (response) {
        $("#profil_page_nom_prenom").html(
          response.personne.prenom + " " + response.personne.nom
        );
        $("#profil_page_email").html(
          '<a href="mailto:' +
          response.user.email +
          '">' +
          response.user.email +
          "</a>"
        );
        $("#profil_page_date_naissance").html(response.personne.date_naissance);
        $("#profil_page_telephone").html(response.personne.telephone);
        $("#profil_page_adresse").html(response.personne.adresse);

        if (response.personne.nom !== "") {
          $("#update_profil_nom").attr("readonly", "readonly");
        } else {
          $("#update_profil_nom").removeAttr("readonly");
        }
        $("#update_profil_nom").val(response.personne.nom);
        if (response.personne.prenom !== "") {
          $("#update_profil_prenom").attr("readonly", "readonly");
        } else {
          $("#update_profil_prenom").removeAttr("readonly");
        }
        $("#update_profil_prenom").val(response.personne.prenom);
        if (response.user.email !== "") {
          $("#update_profil_email").attr("readonly", "readonly");
        } else {
          $("#update_profil_email").removeAttr("readonly");
        }
        $("#update_profil_email").val(response.user.email);
        if (response.personne.date_naissance !== "") {
          $("#update_profil_date_naissance").attr("readonly", "readonly");
        } else {
          $("#update_profil_date_naissance").removeAttr("readonly");
        }
        $("#update_profil_date_naissance").val(
          response.personne.date_naissance
        );
        if (response.personne.telephone !== "") {
          $("#update_profil_telephone").attr("readonly", "readonly");
        } else {
          $("#update_profil_telephone").removeAttr("readonly");
        }
        $("#update_profil_telephone").val(response.personne.telephone);
        if (response.personne.adresse !== "") {
          $("#update_profil_adresse").attr("readonly", "readonly");
        } else {
          $("#update_profil_adresse").removeAttr("readonly");
        }
        $("#update_old_profil_password").val("");
        $("#update_profil_password").val("");
        $("#update_profil_confirm_password").val("");
        $("#update_active_security_questions").val(
          response.user.active_security_questions
        );
        Profilconfirmation(response.msg);
      }
    });
  } else {
    $("#update_profil_password").css("border", "1px solid red");
    $("#update_profil_confirm_password").css("border", "1px solid red");
  }
  //}
});

function change_status_pvbalancepersonne(id_pvbalancepersonne, status_pvbalancepersonne) {

  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
    }
  });

  var formData = new FormData();
  formData.append("id_pvbalancepersonne", id_pvbalancepersonne);
  formData.append("status_pvbalancepersonne", status_pvbalancepersonne);

  $.ajax({
    url: "updateStatusWithdrawAdmin",
    type: "POST",
    async: true,
    contentType: false,
    processData: false,
    data: formData,
    success: function (response) {
      refresh_table_withdraw_admin();
      confirmation_withdraw_admin(response.msg);
    }
  });
}

function refresh_table_withdraw_admin() {
  var html_withdraw_admin_home = "";
  $.ajax({
    url: 'get-admin-home-withdrawals',
    type: 'GET',
    'async': false,
    success: function (response) {
      var length_data = response.withdrawals.length;
      if (length_data > 0) {
        $.each(response.withdrawals, function (key, value) {
          if (value.status_pvbalancepersonne == 0) {
            status_withdrawls = "Pending";
            status_withdrawls_icon = "warning";
          } else if (value.status_pvbalancepersonne == 1) {
            status_withdrawls = "Validated";
            status_withdrawls_icon = "success";
          } else if (value.status_pvbalancepersonne == 2) {
            status_withdrawls = "Rejected";
            status_withdrawls_icon = "danger";
          }
          html_withdraw_admin_home += "<tr>";
          html_withdraw_admin_home += "<td>";
          html_withdraw_admin_home += '<span class="round round-danger"><i class="fa fa-exclamation"></i></span>';
          html_withdraw_admin_home += "</td>";
          html_withdraw_admin_home += "<td>";
          html_withdraw_admin_home += '<strong>' + value.nom + ' ' + value.prenom + '</strong>';
          html_withdraw_admin_home += "</td>";
          html_withdraw_admin_home += "<td>";
          html_withdraw_admin_home += '<strong>' + value.type_payment + '</strong>';
          html_withdraw_admin_home += "</td>";
          html_withdraw_admin_home += "<td>";
          html_withdraw_admin_home += '<strong>$ ' + value.montant_pvbalancepersonne + '</strong>';
          html_withdraw_admin_home += "</td>";
          html_withdraw_admin_home += "<td>";
          html_withdraw_admin_home += '<label><strong><span class="label label-warning">Pending</span></strong></label>';
          html_withdraw_admin_home += "</td>";
          html_withdraw_admin_home += "<td>";
          html_withdraw_admin_home += '<strong>' + moment(value.updated_at).format("DD/MM/YYYY HH:mm:ss") + '</strong>';
          html_withdraw_admin_home += "</td>";
          html_withdraw_admin_home += "<td>";
          html_withdraw_admin_home += '<select class="form-control" name="home_status_pvbalancepersonne" id="home_status_pvbalancepersonne" onchange="change_status_pvbalancepersonne(' + value.id + ', $(this).val())" style="padding: 2px;">';
          html_withdraw_admin_home += '<option value = "0" selected = "selected"> Pending </option>';
          html_withdraw_admin_home += '<option value = "1" > Validated </option>';
          html_withdraw_admin_home += '<option value = "2" > Rejected </option>';
          html_withdraw_admin_home += '</select>';
          html_withdraw_admin_home += "</td>";
          html_withdraw_admin_home += "</tr >";
        });
      } else {
        html_withdraw_admin_home += "<tr>";
        html_withdraw_admin_home += "<td>";
        html_withdraw_admin_home += '<span class="round round-success"><i class="fa fa-thumbs-o-up"></i></span>';
        html_withdraw_admin_home += "</td>";
        html_withdraw_admin_home += '<td colspan="6" class="text-center">';
        html_withdraw_admin_home += '<strong>No withdrawal for today !</strong>';
        html_withdraw_admin_home += "</td>";
        html_withdraw_admin_home += "</tr>";
      }
      $("#admin_withdrawal_data_home tbody").html(html_withdraw_admin_home);
    }
  });
}

function confirmation_withdraw_admin(msg) {
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

function show_subscription_pack_modal(id_personne, id_packabonnementplatform) {
  $("#titre_form").html("<strong>Take this pack</strong>");
  $("#id_personne").val(id_personne);
  $("#id_packabonnementplatform").val(id_packabonnementplatform);
  $.ajax({
    url: 'modifier_packabonnementplatforms/' + id_packabonnementplatform,
    type: 'GET',
    'async': false,
    success: function (response) {
      $("#packabonnementplatform_prix_ut").val(response.packabonnementplatform.prix_ut);
    }
  });
  $("#periode_pack").val(1);
  $("#subscriptionPackModal").modal("show");
}

function buysubscriptionPack() {
  swal({
    title: "Loading",
    text: "Please, wait a moment. \n The system is processing your request !",
    icon: '/c-app/assets/images/2.gif',
    buttons: false,
    closeOnClickOutside: false
  });
  var id_personne = $("#id_personne").val();
  var id_packabonnementplatform = $("#id_packabonnementplatform").val();
  var periode_pack = $("#periode_pack").val();
  var type_payment = $("#type_payment").val();
  var payment_account_wallet = $("#payment_account_wallet").val();
  var packabonnementplatform_prix_ut = $("#packabonnementplatform_prix_ut").val();

  if (type_payment == "Balance") {
    $.ajax({
      url: 'getBalanceAffiliationByPersonne/' + id_personne,
      type: 'GET',
      'async': false,
      success: function (response) {
        var balanceaffiliation = response.balanceaffiliation;
        var balance_affiliation = parseFloat(balanceaffiliation.balance_affiliation);
        var float_packabonnementplatform_prix_ut = parseFloat(packabonnementplatform_prix_ut);
        if (balance_affiliation < float_packabonnementplatform_prix_ut) {
		  swal.close();
          Errorconfirmation("You don't have enough money in your balance to buy this service !");
        } else {
          $.ajaxSetup({
            headers: {
              "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
            }
          });

          var formData = new FormData();
          formData.append("id_personne", id_personne);
          formData.append("id_packabonnementplatform", id_packabonnementplatform);
          formData.append("periode_pack", periode_pack);
          formData.append("type_payment", type_payment);
          formData.append("id_payment", "1");

          $.ajax({
            url: "buySubscriptionPack",
            type: "POST",
            async: true,
            contentType: false,
            processData: false,
            data: formData,
			statusCode: {
			  500: function (response) {
			    swal.close();
			    Errorconfirmation("Something wrong with the system !");
			  },
			  404: function (response) {
			    swal.close();
			    Errorconfirmation("Fonction not found !");
			  }
			},
            success: function (response) {
			  swal.close();
              var url = document.URL,
                sub_url = "subscriptionpacks";
              if (url.indexOf(sub_url) !== -1) {
                table_subscriptionpacks(id_personne);
                table_subscriptionpacks_history(id_personne);
              }
              if (url.indexOf("homes") !== -1 || url.indexOf("home") !== -1) {
                setTimeout(function () {
                  location.reload();
                }, 1000);
              }
              $("#subscriptionPackModal").modal("hide");
              Profilconfirmation("The service has been purchased successfully !");
            }
          });
        }
      }
    });
  } else {
    $.ajaxSetup({
      headers: {
        "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
      }
    });

    var formData = new FormData();
    formData.append("id_personne", id_personne);
    formData.append("id_packabonnementplatform", id_packabonnementplatform);
    formData.append("periode_pack", periode_pack);
    formData.append("type_payment", type_payment);
    formData.append("id_payment", "1");

    $.ajax({
      url: "buySubscriptionPack",
      type: "POST",
      async: true,
      contentType: false,
      processData: false,
      data: formData,
      statusCode: {
        500: function (response) {
          swal.close();
          Errorconfirmation("Something wrong with the system !");
        },
        404: function (response) {
          swal.close();
          Errorconfirmation("Fonction not found !");
        }
      },
      success: function (response) {
        swal.close();
        var url = document.URL,
          sub_url = "subscriptionpacks";
        if (url.indexOf(sub_url) !== -1) {
          table_subscriptionpacks(id_personne);
          table_subscriptionpacks_history(id_personne);
        }
        $("#subscriptionPackModal").modal("hide");
        confirmation_buyservice(response.msg);
      }
    });
  }
}

function confirmation_buyservice(msg) {
  $.alert({
    title: "<strong>Confirmation!</strong>",
    columnClass: "col-md-12",
    content: msg,
    type: "green",
    typeAnimated: true,
    backgroundDismiss: true,
    icon: "fa fa-thumbs-o-up",
    //theme: "modern",
    buttons: {
      OK: {
        text: "OK",
        btnClass: "btn-green",
        action: function () {}
      }
    }
  });
}

$(document).ready(function () {
  getPosts();
  Ranking();
  $("#affiliate_link").attr("readonly", "readonly");
  $("#copy_affiliate_link").click(function () {
    $("#affiliate_link").select();
    document.execCommand("copy");
    $("#copy_message").fadeIn();
    setTimeout(function () {
      $("#copy_message").fadeOut();
    }, 3000);
  });
  $("#form-update-profil").submit(function (e) {
    e.preventDefault();
    ProfilajoutOuModif();
  });
  $("#form-send-msg-admin").submit(function (e) {
    e.preventDefault();
    sendMessages();
  });
  $("#form-subscription-pack").submit(function (e) {
    e.preventDefault();
    buysubscriptionPack();
  });
  var old_password = $("#update_old_profil_password")[0];
  var password = $("#update_profil_password")[0];
  var confirmPassword = $("#update_profil_confirm_password")[0];

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