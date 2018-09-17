function LoadbankaccountsList() {
  var bankaccounts_array = new Array();
  $.ajax({
    url: "get-bankaccounts",
    type: "GET",
    async: false,
    success: function(response) {
      bankaccounts_array = response.bankaccounts;
    }
  });
  return bankaccounts_array;
}

function refresh_table(bankaccounts_list) {
  var length_data = bankaccounts_list.length;
  var dataTable = $("#bankaccounts-list").DataTable();
  if (length_data > 0) {
    dataTable.clear().draw();
    $.each(bankaccounts_list, function(key, value) {
      dataTable.row
        .add([
          '<input type="checkbox" class="checkbox_ids" id="admin_' +
            value.id +
            '" value="' +
            value.id +
            '">',
          "<strong>" + value.nom_prenom + "</strong>",
          "<strong>" + value.bank + "</strong>",
          "<strong>" + value.bank_account_country + "</strong>",
          "<strong>" + value.bank_account_number + "</strong>",
          '<a href="javascript:void(0)" class="btn btn-icon btn-warning tip" onclick="modifier(' +
            value.id +
            ')"  data-toggle="tooltip" data-placement="top" data-original-title="Update"><i class="fa fa-pencil"></i> </a> ' +
            '<a href="javascript:void(0)" class="btn btn-icon btn-danger tip" onclick="supprimer(' +
            value.id +
            ')" data-toggle="tooltip" data-placement="top" data-original-title="Delete"><i class="fa fa-trash-o"></i> </a> '
        ])
        .draw();
    });
  } else {
    dataTable.clear().draw();
  }
}

function ajoutOuModif() {
  var bankaccount;
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
    }
  });
  var id_bankaccount = $("#id_bankaccount").val();
  if (id_bankaccount !== "") {
    bankaccounts_list = bankaccounts_list.filter(function(el) {
      return parseInt(el.id) !== parseInt(id_bankaccount);
    });
  }

  var formData = new FormData();
  formData.append("id_bankaccount", $("#id_bankaccount").val());
  formData.append("id_bank", $("#id_bank").val());
  formData.append("bank_account_country", $("#bank_account_country").val());
  formData.append("bank_account_number", $("#bank_account_number").val());

  $.ajax({
    url: "ajoutOuModif_bankaccounts",
    type: "POST",
    async: true,
    contentType: false,
    processData: false,
    data: formData,
    success: function(response) {
      bankaccount = {
        id: response.bankaccount[0].id,
        nom_prenom: response.bankaccount[0].nom_prenom,
        bank: response.bankaccount[0].bank,
        bank_account_number: response.bankaccount[0].bank_account_number,
        bank_account_country: response.bankaccount[0].bank_account_country
      };
      bankaccounts_list.unshift(bankaccount);
      refresh_table(bankaccounts_list);
      $("#form_group_bankname").fadeOut();
      $("#bankaccountsModal").modal("hide");
      confirmation(response.msg);
    }
  });
}

function modifier(id) {
  $.ajax({
    url: "modifier_bankaccounts/" + id,
    type: "GET",
    success: function(response) {
      $("#titre_form").html("<strong>Update Account</strong>");
      $("#id_bankaccount").val(response.bankaccount.id);
      $("#id_bank").val(response.bankaccount.id_bank);
      $("#bank_account_country").val(response.bankaccount.bank_account_country);
      $("#bank_account_number").val(response.bankaccount.bank_account_number);
      $("#bankaccountsModal").modal("show");
    }
  });
}

function supprimer(id) {
  $.confirm({
    title: "<strong>Delete Account !</strong>",
    content: "Do you really wants to delete this account ?",
    type: "red",
    typeAnimated: true,
    backgroundDismiss: true,
    icon: "fa fa-question",
    theme: "modern",
    buttons: {
      tryAgain: {
        text: "Yes",
        btnClass: "btn-red",
        action: function() {
          bankaccounts_list = bankaccounts_list.filter(function(el) {
            return el.id !== id;
          });
          $.ajax({
            url: "supprimer_bankaccounts/" + id,
            type: "GET",
            success: function(response) {
              refresh_table(bankaccounts_list);
              confirmation(response.msg);
            }
          });
        }
      },
      no: {
        text: "No",
        close: function() {}
      }
    }
  });
}

function supprimer_all() {
  var tab_sup = [];
  $.confirm({
    title: "<strong>Delete Accounts !</strong>",
    content: "Do you really wants to delete these Accounts ?",
    type: "red",
    typeAnimated: true,
    backgroundDismiss: true,
    icon: "fa fa-question",
    theme: "modern",
    buttons: {
      tryAgain: {
        text: "Yes",
        btnClass: "btn-red",
        action: function() {
          $(".table")
            .find('input[class="checkbox_ids"]')
            .each(function() {
              if ($(this).is(":checked")) tab_sup.push($(this).val());
            });
          if (tab_sup.length > 0) {
            $.each(tab_sup, function(key, value) {
              bankaccounts_list = bankaccounts_list.filter(function(el) {
                var el_id = parseInt(el.id);
                var tab_sup_id = parseInt(value);
                return el_id !== tab_sup_id;
              });
            });
            $.ajax({
              type: "POST",
              url: "supprimer_all_bankaccounts",
              data: {
                json_tab: JSON.stringify(tab_sup)
              },
              dataType: "json",
              success: function(response) {
                refresh_table(bankaccounts_list);
                confirmation(response.msg);
              }
            });
          } else {
            $.alert({
              title: "<strong>Alert!</strong>",
              content: "Please select accounts before deleting !!!",
              type: "red",
              typeAnimated: true,
              backgroundDismiss: true,
              icon: "fa fa-exclamation",
              theme: "modern",
              buttons: {
                tryAgain: {
                  text: "Try again",
                  btnClass: "btn-red",
                  action: function() {}
                }
              }
            });
          }
        }
      },
      no: {
        text: "No",
        close: function() {}
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
        action: function() {
          bankaccounts_list = [];
          $.ajax({
            url: "clear_table_bankaccounts",
            type: "POST",
            success: function(response) {
              refresh_table(bankaccounts_list);
              confirmation(response.msg);
            }
          });
        }
      },
      no: {
        text: "No",
        close: function() {}
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
        action: function() {}
      }
    }
  });
}

function vider() {
  $("#titre_form").html("<strong>Add Account</strong>");
  $("#id_bankaccount").val("");
  $("#id_bank").val(1);
  $("#bank_account_country").val("Morocco");
  $("#bank_account_number").val("");
  $("#bankaccountsModal").modal("show");
}

function checkall() {
  if ($("#chk_all").is(":checked")) {
    $(".checkbox_ids").prop("checked", true);
  } else {
    $(".checkbox_ids").prop("checked", false);
  }
}

$(document).ready(function() {
  bankaccounts_list = LoadbankaccountsList();
  $("#bankaccounts-list").DataTable({
    columnDefs: [{ orderable: false, targets: [0, 2] }],
    pageLength: 15,
    lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
  });
  refresh_table(bankaccounts_list);
  $("#form-bankaccounts").submit(function(e) {
    e.preventDefault();
    ajoutOuModif();
  });
});
