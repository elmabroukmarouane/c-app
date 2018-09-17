function table_ontrading(id_personne) {
  $.ajax({
    url: "getOntrading/" + id_personne,
    type: "GET",
    async: false,
    success: function (response) {
      var length_data = response.data_ontrading.length;
      var dataTable = $("#ontrading-list").DataTable();
      if (length_data > 0) {
        dataTable.clear().draw();
        $.each(response.data_ontrading, function (key, value) {
          dataTable.row
            .add([
              "<strong>" + value.abonnement + "</strong>",
              "<strong>" + value.type_payment + "</strong>",
              "<strong>" + value.id_payment + "</strong>",
              "<strong>" + value.periode + "</strong>",
              "<strong>" + value.total_profit + "</strong>",
              /* '<strong>' + value.paid + '</strong>',
                        '<strong>' + value.rest + '</strong>', */
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

function table_ontrading_history(id_personne) {
  $.ajax({
    url: "getOntradingHistory/" + id_personne,
    type: "GET",
    async: false,
    success: function (response) {
      var length_data = response.data_ontrading_history.length;
      var dataTable = $("#ontrading-list-history").DataTable();
      if (length_data > 0) {
        dataTable.clear().draw();
        $.each(response.data_ontrading_history, function (key, value) {
          dataTable.row
            .add([
              "<strong>" + value.abonnement + "</strong>",
              "<strong>" + value.type_payment + "</strong>",
              "<strong>" + value.id_payment + "</strong>",
              "<strong>" + value.periode + "</strong>",
              "<strong>" + value.total_profit + "</strong>"
              /* "<strong>" + value.paid + "</strong>",
              "<strong>" + value.rest + "</strong>" */
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

function show_trading_pack_modal(id_personne, id_abonnement) {
  $("#titre_form").html("<strong>Take this pack</strong>");
  $("#id_personne").val(id_personne);
  $("#id_abonnement").val(id_abonnement);
  $("#trading_periode_pack").val(3);
  $("#TradingPackModal").modal("show");
}

function buyTradingPack() {
  swal({
    title: "Loading",
    text: "Please, wait a moment. \n The system is processing your request !",
    icon: '/c-app/assets/images/2.gif',
    buttons: false,
    closeOnClickOutside: false
  });
  var id_personne = $("#id_personne").val();
  var id_abonnement = $("#id_abonnement").val();
  var trading_periode_pack = $("#trading_periode_pack").val();
  var type_payment = $("#type_payment").val();
  var payment_account_wallet = $("#payment_account_wallet").val();
  var type_get_paid = $("#type_get_paid").val();
  var get_paid_account_wallet = $("#get_paid_account_wallet").val();
  if (type_payment == "Balance") {
    $.ajax({
      url: 'modifier_packs/' + id_abonnement,
      type: 'GET',
      'async': false,
      success: function (response) {
        var abonnement_pack = response.pack;
        $.ajax({
          url: 'getBalanceAffiliationByPersonne/' + id_personne,
          type: 'GET',
          'async': false,
          success: function (response) {
            var balanceaffiliation = response.balanceaffiliation;
            var balance_affiliation = parseFloat(balanceaffiliation.balance_affiliation);
            var float_abonnement_pack = parseFloat(abonnement_pack.prix);
            var float_trading_periode_pack = parseFloat(trading_periode_pack);
            if (balance_affiliation < (float_abonnement_pack * float_trading_periode_pack)) {
            //if (balance_affiliation < float_abonnement_pack) {
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
              formData.append("id_abonnement", id_abonnement);
              formData.append("periode_pack", trading_periode_pack);
              formData.append("type_payment", type_payment);
              formData.append("id_payment", payment_account_wallet);
              formData.append("type_get_paid", type_get_paid);
              formData.append("id_get_paid", get_paid_account_wallet);

              $.ajax({
                url: "buyTradingPack",
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
                  table_ontrading(id_personne);
                  table_ontrading_history(id_personne);
                  $("#TradingPackModal").modal("hide");
                  confirmation(response.msg);
                }
              });
            }
          }
        });
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
    formData.append("id_abonnement", id_abonnement);
    formData.append("periode_pack", trading_periode_pack);
    formData.append("type_payment", type_payment);
    formData.append("id_payment", payment_account_wallet);
    formData.append("type_get_paid", type_get_paid);
    formData.append("id_get_paid", get_paid_account_wallet);

    $.ajax({
      url: "buyTradingPack",
      type: "POST",
      async: true,
      contentType: false,
      processData: false,
      data: formData,
      success: function (response) {
		swal.close();
        table_ontrading(id_personne);
        table_ontrading_history(id_personne);
        $("#TradingPackModal").modal("hide");
        confirmation(response.msg);
      }
    });
  }
}

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
  //$('#aioConceptName').find(":selected").text();
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

function fill_select_get_paid(get_paid_type) {
  //$('#aioConceptName').find(":selected").text();
  var select_html = "";
  if (get_paid_type == "Bank") {
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
        $("#get_paid_account_wallet").html(select_html);
        select_html = "";
      }
    });
  } else if (get_paid_type == "Wallet") {
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
        $("#get_paid_account_wallet").html(select_html);
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
  fill_select_get_paid(
    $("#type_get_paid")
    .find(":selected")
    .val()
  );
  $("#form-trading-pack").submit(function (e) {
    e.preventDefault();
    buyTradingPack();
  });
});