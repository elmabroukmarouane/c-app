function precisionRound(number, precision) {
  var factor = Math.pow(10, precision);
  return Math.round(number * factor) / factor;
}

function table_subscriptionpacks(id_personne) {
  $.ajax({
    url: "getabonnementplatforms_abonnementplatforms_Packs_active_id/" +
      id_personne,
    type: "GET",
    async: false,
    success: function (response) {
      var length_data = response.data_abonnementplatforms.length;
      var dataTable = $("#subscriptionpacks-list").DataTable();
      if (length_data > 0) {
        dataTable.clear().draw();
        $.each(response.data_abonnementplatforms, function (key, value) {
          dataTable.row
            .add([
              "<strong>" + value.packabonnementplatform + "</strong>",
              "<strong>" + value.type_payment + "</strong>",
              //"<strong>" + value.id_payment + "</strong>",
              "<strong>" + value.periode + "</strong>",
              "<strong>" + precisionRound(value.total_pay, 2) + "</strong>",
              /* "<strong>" + precisionRound(value.paid, 2) + "</strong>",
              "<strong>" + precisionRound(value.rest, 2) + "</strong>", */
              "<strong>" + value.rest_periode + "</strong>"
            ])
            .draw();
        });
      } else {
        dataTable.clear().draw();
      }
    }
  });
}

function table_subscriptionpacks_history(id_personne) {
  $.ajax({
    url: "getSubscriptionPacksHistory/" + id_personne,
    type: "GET",
    async: false,
    success: function (response) {
      var length_data = response.data_abonnementplatforms.length;
      var dataTable = $("#subscriptionpacks-list-history").DataTable();
      if (length_data > 0) {
        dataTable.clear().draw();
        $.each(response.data_abonnementplatforms, function (key, value) {
          dataTable.row
            .add([
              "<strong>" + value.packabonnementplatform + "</strong>",
              "<strong>" + value.type_payment + "</strong>",
              //"<strong>" + value.id_payment + "</strong>",
              "<strong>" + value.periode + "</strong>",
              "<strong>" + precisionRound(value.total_pay, 2) + "</strong>"
              /* "<strong>" + precisionRound(value.paid, 2) + "</strong>",
              "<strong>" + precisionRound(value.rest, 2) + "</strong>" */
              //'<strong>' + value.rest_periode + '</strong>'
            ])
            .draw();
        });
      } else {
        dataTable.clear().draw();
      }
    }
  });
}

/* function show_subscription_pack_modal(id_personne, id_packabonnementplatform) {
  $("#titre_form").html("<strong>Take this pack</strong>");
  $("#id_personne").val(id_personne);
  $("#id_packabonnementplatform").val(id_packabonnementplatform);
  $("#periode_pack").val(1);
  $("#subscriptionPackModal").modal("show");
}

function buysubscriptionPack() {
  var id_personne = $("#id_personne").val();
  var id_packabonnementplatform = $("#id_packabonnementplatform").val();
  var periode_pack = $("#periode_pack").val();
  var type_payment = $("#type_payment").val();
  var payment_account_wallet = $("#payment_account_wallet").val();

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
  formData.append("id_payment", payment_account_wallet);

  $.ajax({
    url: "buySubscriptionPack",
    type: "POST",
    async: true,
    contentType: false,
    processData: false,
    data: formData,
    success: function(response) {
      table_subscriptionpacks(id_personne);
      table_subscriptionpacks_history(id_personne);
      $("#subscriptionPackModal").modal("hide");
      confirmation(response.msg);
    }
  });
} */

function confirmation(msg) {
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

function fill_select_payment(payment_type) {
  var select_html = "";
  if (payment_type == "Bank") {
    $.ajax({
      url: "get-companyaccounts",
      type: "GET",
      async: false,
      success: function (response) {
        $.each(response.companyaccounts, function (key, value) {
          select_html +=
            '<option value="' +
            value.id +
            '" selected="selected">Account ' +
            value.id +
            "</option>";
        });
        $("#payment_account_wallet").html(select_html);
        select_html = "";
      }
    });
  } else if (payment_type == "Wallet") {
    $.ajax({
      url: "get-companywallets",
      type: "GET",
      async: false,
      success: function (response) {
        $.each(response.companywallets, function (key, value) {
          select_html +=
            '<option value="' +
            value.id +
            '" selected="selected">' +
            value.wallet_name +
            "</option>";
        });
        $("#payment_account_wallet").html(select_html);
        select_html = "";
      }
    });
  }
}

$(document).ready(function () {
  fill_select_payment(
    $("#type_payment")
    .find(":selected")
    .val()
  );
  /* $("#form-subscription-pack").submit(function (e) {
    e.preventDefault();
    buysubscriptionPack();
  }); */
});