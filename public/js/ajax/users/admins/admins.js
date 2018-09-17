function LoadAdminsList() {
  var admins_array = [];
  $.ajax({
    url: "get-users",
    type: "GET",
    async: false,
    success: function (response) {
      admins_array = response.admins;
    }
  });
  return admins_array;
}

function refresh_table(admins_list) {
  var length_data = admins_list.length;
  var dataTable = $("#admins-list").DataTable();
  if (length_data > 0) {
    dataTable.clear().draw();
    $.each(admins_list, function (key, value) {
      dataTable.row
        .add([
          '<input type="checkbox" class="checkbox_ids" id="admin_' +
          value.id +
          '" value="' +
          value.id +
          '">',
          "<strong>" + value.nom_prenom + "</strong>",
          "<strong>" + value.date_naissance + "</strong>",
          "<strong>" + value.telephone + "</strong>",
          "<strong>" + value.email + "</strong>",
          /* '<img src="divers/images/images_admins/' +
            value.image +
            '" class="img-thumbnail" alt="' +
            value.nom_prenom +
            " Picture\" style='width: 100px; height: 100px;' data-toggle='tooltip' data-placement='top' data-original-title=\"" +
            value.nom_prenom +
            ' Picture"  />', */
          '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' +
          value.id +
          ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> ' +
          '<a href="javascript:void(0)" class="btn btn-icon btn-danger tip" onclick="supprimer(' +
          value.id +
          ')" data-toggle="tooltip" data-placement="top" data-original-title="Delete"><i class="fa fa-trash-o"></i> </a> ' +
          '<a href="javascript:void(0)" class="btn btn-icon btn-info tip" onclick="status(' +
          value.id +
          ')" data-toggle="tooltip" data-placement="top" data-original-title="Change Status"><i class="fa fa-id-card-o"></i> </a>'
        ])
        .draw();
    });
  } else {
    dataTable.clear().draw();
  }
}

function filter_table(id_tpersonne_filter, id_statuscompte_filter) {
  var id_tpersonne_filter_local = parseInt(id_tpersonne_filter);
  var id_statuscompte_filter_local = parseInt(id_statuscompte_filter);
  //admins_list
  var admin_list_filter = [];
  if (id_tpersonne_filter_local !== -1 && id_statuscompte_filter_local !== -1) {
    admin_list_filter = admins_list.filter(function (el) {
      var el_id_tpersonne_local = parseInt(el.id_tpersonne);
      var el_id_statuscompte_local = parseInt(el.id_statuscompte);
      return (
        el_id_tpersonne_local === id_tpersonne_filter_local &&
        el_id_statuscompte_local === id_statuscompte_filter_local
      );
    });
  } else if (
    id_tpersonne_filter_local !== -1 &&
    id_statuscompte_filter_local === -1
  ) {
    admin_list_filter = admins_list.filter(function (el) {
      var el_id_tpersonne_local = parseInt(el.id_tpersonne);
      return el_id_tpersonne_local === id_tpersonne_filter_local;
    });
  } else if (
    id_tpersonne_filter_local === -1 &&
    id_statuscompte_filter_local !== -1
  ) {
    admin_list_filter = admins_list.filter(function (el) {
      var el_id_statuscompte_local = parseInt(el.id_statuscompte);
      return el_id_statuscompte_local === id_statuscompte_filter_local;
    });
  } else {
    admin_list_filter = admins_list;
  }
  refresh_table(admin_list_filter);
}

function ajoutOuModif() {
  var admin;
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
    }
  });
  var id_personne = $("#id_personne").val();
  if (id_personne !== "") {
    admins_list = admins_list.filter(function (el) {
      return parseInt(el.id) !== parseInt(id_personne);
    });
  }

  var formData = new FormData();
  formData.append("id_personne", $("#id_personne").val());
  formData.append("nom", $("#nom").val());
  formData.append("prenom", $("#prenom").val());
  formData.append("date_naissance", $("#date_naissance").val());
  formData.append("telephone", $("#telephone").val());
  formData.append("adresse", $("#adresse").val());
  formData.append("image", $("#image")[0].files[0]);
  formData.append("email", $("#email").val());
  formData.append("password", $("#password").val());
  formData.append("id_tpersonne", $("#id_tpersonne").val());
  formData.append("id_statuscompte", $("#id_statuscompte").val());

  $.ajax({
    url: "ajoutOuModif",
    type: "POST",
    async: true,
    contentType: false,
    processData: false,
    data: formData,
    success: function (response) {
      admin = {
        id: response.personne.id,
        nom_prenom: response.personne.nom_prenom,
        date_naissance: response.personne.date_naissance,
        telephone: response.personne.telephone,
        email: response.personne.email,
        image: response.personne.image,
        id_statuscompte: response.personne.id_statuscompte
      };
      admins_list.unshift(admin);
      refresh_table(admins_list);
      $("#AdminModal").modal("hide");
      confirmation(response.msg);
    }
  });
}

function updateStatus() {
  var id_status_personne = parseInt($("#id_status_personne").val());
  var id_status_statuscompte = $("#id_status_statuscompte").val();
  admins_list = admins_list.filter(function (el) {
    var el_id_local = parseInt(el.id);
    if (id_status_personne === el_id_local) {
      el.id_statuscompte = id_status_statuscompte;
    }
    return el;
  });

  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
    }
  });

  var formData = new FormData();
  formData.append("id_status_personne", $("#id_status_personne").val());
  formData.append("id_status_statuscompte", $("#id_status_statuscompte").val());

  $.ajax({
    url: "updateStatus",
    type: "POST",
    async: true,
    contentType: false,
    processData: false,
    data: formData,
    success: function (response) {
      // search by id_personne the object in the array then update id_status of this person in the adminlist
      $("#id_tpersonne_filter").val("-1");
      $("#id_statuscompte_filter").val("-1");
      $("#AdminStatusModal").modal("hide");
      confirmation(response.msg);
      refresh_table(admins_list);
    }
  });
}

function modifier(id) {
  $.ajax({
    url: "modifier/" + id,
    type: "GET",
    success: function (response) {
      $("#titre_form").html("<strong>Update User</strong>");
      $("#msg_info").html(
        '<strong>All fileds are required except the Image and the password, <span style="color: green; text-decoration: underline;">it\'s optional !</span></strong>'
      );
      $("#id_personne").val(response.personne.id);
      $("#nom").val(response.personne.nom);
      $("#prenom").val(response.personne.prenom);
      $("#email").val(response.personne.email);
      $("#date_naissance").val(response.personne.date_naissance);
      $("#telephone").val(response.personne.telephone);
      $("#adresse").val(response.personne.adresse);
      $("#password").val(response.personne.password);
      $("#password").removeAttr("required");
      $("#required_password").removeClass("required_field");
      $("#required_password").hide();
      $("#confirm_password").val("");
      $("#confirm_password").removeAttr("required");
      $("#required_confirm_password").removeClass("required_field");
      $("#required_confirm_password").hide();
      $("#id_tpersonne").val(response.personne.id_tpersonne);
      $("#id_statuscompte").val(response.personne.id_statuscompte);
      $("#AdminModal").modal("show");
    }
  });
}

function status(id) {
  $.ajax({
    url: "modifier/" + id,
    type: "GET",
    success: function (response) {
      $("#titre_status_form").html("<strong>Update Status User</strong>");
      $("#msg_status_info").html(
        "<strong>Please change the account status of this user !</strong>"
      );
      $("#id_status_personne").val(response.personne.id);
      $("#id_status_statuscompte").val(response.personne.id_statuscompte);
      $("#AdminStatusModal").modal("show");
    }
  });
}

function supprimer(id) {
  $.confirm({
    title: "<strong>Delete user !</strong>",
    content: "Do you really wants to delete this user ?",
    type: "red",
    typeAnimated: true,
    backgroundDismiss: true,
    icon: "fa fa-question",
    theme: "modern",
    buttons: {
      tryAgain: {
        text: "Yes",
        btnClass: "btn-red",
        action: function () {
          admins_list = admins_list.filter(function (el) {
            return el.id !== id;
          });
          $.ajax({
            url: "supprimer/" + id,
            type: "GET",
            success: function (response) {
              refresh_table(admins_list);
              confirmation(response.msg);
            }
          });
        }
      },
      no: {
        text: "No",
        close: function () {}
      }
    }
  });
}

function supprimer_all() {
  var tab_sup = [];
  $.confirm({
    title: "<strong>Delete users !</strong>",
    content: "Do you really wants to delete these users ?",
    type: "red",
    typeAnimated: true,
    backgroundDismiss: true,
    icon: "fa fa-question",
    theme: "modern",
    buttons: {
      tryAgain: {
        text: "Yes",
        btnClass: "btn-red",
        action: function () {
          $(".table")
            .find('input[class="checkbox_ids"]')
            .each(function () {
              if ($(this).is(":checked")) tab_sup.push($(this).val());
            });
          if (tab_sup.length > 0) {
            $.each(tab_sup, function (key, value) {
              admins_list = admins_list.filter(function (el) {
                var el_id = parseInt(el.id);
                var tab_sup_id = parseInt(value);
                return el_id !== tab_sup_id;
              });
            });
            $.ajax({
              type: "POST",
              url: "supprimer_all",
              data: {
                json_tab: JSON.stringify(tab_sup)
              },
              dataType: "json",
              success: function (response) {
                refresh_table(admins_list);
                confirmation(response.msg);
              }
            });
          } else {
            $.alert({
              title: "<strong>Alert!</strong>",
              content: "Please select users before deleting !!!",
              type: "red",
              typeAnimated: true,
              backgroundDismiss: true,
              icon: "fa fa-exclamation",
              theme: "modern",
              buttons: {
                tryAgain: {
                  text: "Try again",
                  btnClass: "btn-red",
                  action: function () {}
                }
              }
            });
          }
        }
      },
      no: {
        text: "No",
        close: function () {}
      }
    }
  });
}

function vider_table() {
  $.confirm({
    title: "<strong>Clear Table !</strong>",
    content: "Do you really wants to clear this table ?",
    type: "red",
    typeAnimated: true,
    backgroundDismiss: true,
    icon: "fa fa-question",
    theme: "modern",
    buttons: {
      tryAgain: {
        text: "Yes",
        btnClass: "btn-red",
        action: function () {
          admins_list = [];
          $.ajax({
            url: "clear_table",
            type: "POST",
            success: function (response) {
              refresh_table(admins_list);
              confirmation(response.msg);
            }
          });
        }
      },
      no: {
        text: "No",
        close: function () {}
      }
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
        action: function () {}
      }
    }
  });
}

function vider() {
  $("#titre_form").html("<strong>Add User</strong>");
  $("#id_personne").val("");
  $("#nom").val("");
  $("#prenom").val("");
  $("#date_naissance").val("");
  $("#telephone").val("");
  $("#adresse").val("");
  $("#image").val("");
  $("#email").val("");
  $("#password").val("");
  $("#password").attr("required", "");
  $("#required_password").addClass("required_field");
  $("#required_password").show();
  $("#confirm_password").val("");
  $("#confirm_password").attr("required", "");
  $("#required_confirm_password").addClass("required_field");
  $("#required_confirm_password").show();
  $("#msg_info").html(
    '<strong>All fileds are required except the Image, <span style="color: green; text-decoration: underline;">it\'s optional !</span></strong>'
  );
  $("#id_tpersonne").val("1");
  $("#id_statuscompte").val("1");
  $("#AdminModal").modal("show");
}

function checkall() {
  if ($("#chk_all").is(":checked")) {
    $(".checkbox_ids").prop("checked", true);
  } else {
    $(".checkbox_ids").prop("checked", false);
  }
}

function afficherpassword() {
  if ($("#afficher_password").val() === "oui") {
    $("#password").attr("type", "password");
    $("#icon_password").attr("class", "fa fa-eye");
    $("#afficher_password").val("non");
  } else {
    $("#password").attr("type", "text");
    $("#icon_password").attr("class", "fa fa-eye-slash");
    $("#afficher_password").val("oui");
  }
}

function afficherconfirmpassword() {
  if ($("#afficher_confirmPassword").val() === "oui") {
    $("#confirm_password").attr("type", "password");
    $("#icon_confirmpassword").attr("class", "fa fa-eye");
    $("#afficher_confirmPassword").val("non");
  } else {
    $("#confirm_password").attr("type", "text");
    $("#icon_confirmpassword").attr("class", "fa fa-eye-slash");
    $("#afficher_confirmPassword").val("oui");
  }
}

$(document).ready(function () {
  admins_list = LoadAdminsList();
  $("#admins-list").DataTable({
    columnDefs: [{
      orderable: false,
      targets: [5]
    }],
    pageLength: 15,
    lengthMenu: [
      [15, 30, 50, 100, -1],
      [15, 30, 50, 100, "All"]
    ]
  });
  refresh_table(admins_list);
  $("#form-admin").submit(function (e) {
    e.preventDefault();
    ajoutOuModif();
  });
  $("#form-status-admin").submit(function (e) {
    e.preventDefault();
    updateStatus();
  });
  var password = $("#password")[0];
  var confirmPassword = $("#confirm_password")[0];

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