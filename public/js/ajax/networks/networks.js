var array_sub_affiliates = [];
function LoadAffiliatesList() {
  var affiliates_array = [];
  $.ajax({
    url: "getAffiliates",
    type: "GET",
    async: false,
    success: function(response) {
      affiliates_array = response.affiliates_list;
    }
  });
  return affiliates_array;
}

function refresh_table(affiliates_list) {
  var length_data = affiliates_list.length;
  var dataTable = $("#affiliates-list").DataTable();
  var affiliates_td = "";
  var i = 0;
  if (length_data > 0) {
    dataTable.clear().draw();
    $.each(affiliates_list, function(key, value) {
      if (typeof value.affiliates !== "undefined") {
        array_sub_affiliates.push(value.affiliates);
        affiliates_td =
          '<img style="cursor: pointer;" onclick="table_sub_affiliates(' +
          i +
          ')" src="assets/images/details_open.png" alt="' +
          value.nom_prenom +
          " has sponsors\" data-toggle='tooltip' data-placement='top' data-original-title=\"" +
          value.nom_prenom +
          ' has sub sponsors"  />';
        i++;
      } else {
        affiliates_td =
          '<img src="assets/images/details_close.png" alt="' +
          value.nom_prenom +
          " doesn't have sub sponsors\" data-toggle='tooltip' data-placement='top' data-original-title=\"" +
          value.nom_prenom +
          " doesn't have sub sponsors\"  />";
      }
      dataTable.row
        .add([
          affiliates_td,
          "<strong>" + value.nom_prenom + "</strong>",
          "<strong>" + value.ranking + "</strong>",
          '<strong><a href="mailto:' +
            value.email +
            '">' +
            value.email +
            "</a></strong>",
          "<strong>" + value.telephone + "</strong>",
          "<strong>" + value.date_inscription + "</strong>",
          '<img style="cursor: pointer;" onclick="table_ontrading(' +
            value.id_personne +
            ')" src="assets/images/details_open.png" alt="' +
            value.nom_prenom +
            " Ontrading Packages\" data-toggle='tooltip' data-placement='top' data-original-title=\"" +
            value.nom_prenom +
            ' Ontrading Packages"  />',
          '<img style="cursor: pointer;" onclick="table_subscription(' +
            value.id_personne +
            ')" src="assets/images/details_open.png" alt="' +
            value.nom_prenom +
            " Subscription Packages\" data-toggle='tooltip' data-placement='top' data-original-title=\"" +
            value.nom_prenom +
            ' Subscription Package"  />'
        ])
        .draw();
    });
  } else {
    dataTable.clear().draw();
  }
}

function table_ontrading(id_personne) {
  $.ajax({
    url: "getOntrading/" + id_personne,
    type: "GET",
    async: false,
    success: function(response) {
      var string_ontrading = "";
      string_ontrading +=
        '<table id="ontradings-list" class="table table-responsive full-color-table full-info-table hover-table" width="100%">' +
        "<thead>" +
        "<tr>" +
        "<th>Package</th>" +
        "<th>Pay Type</th>" +
        //"<th>Payment</th>" +
        "<th>Period</th>" +
        "<th>Total</th>" +
        "<th>Paid</th>" +
        "<th>Rest</th>" +
        "<th>Rest Period</th>" +
        "</tr>" +
        "</thead>" +
        "<tbody>";
      var length_data = response.data_ontrading.length;
      if (length_data > 0) {
        $.each(response.data_ontrading, function(key, value) {
          string_ontrading +=
            "<tr>" +
            "<td><strong>" +
            value.abonnement +
            "</strong></td>" +
            "<td><strong>" +
            value.type_payment +
            "</strong></td>" +
            /* "<td><strong>" +
            value.id_payment +
            "</strong></td>" + */
            "<td>" +
            value.periode +
            "</td>" +
            "<td><strong>" +
            value.total_profit +
            "</strong></td>" +
            "<td><strong>" +
            value.paid +
            "</strong></td>" +
            "<td><strong>" +
            value.rest +
            "</strong></td>" +
            "<td><strong>" +
            value.rest_periode +
            "</strong></td>" +
            "</tr>";
        });
      } else {
        string_ontrading +=
          "<tr>" +
          '<td colspan="7" class="text-center" width="100%"><strong>No Package Activated for this user</strong></td>' +
          "</tr>";
      }
      string_ontrading += "</tbody>" + "</table>";
      $("#titre_ontradings").html("<strong>Ontrading List</strong>");
      $("#table_ontradings").html(string_ontrading);
      $("#AffiliatesModal").modal("hide");
      $("#OntradingModal").modal("show");
    }
  });
}

function table_subscription(id_personne) {
  $.ajax({
    url:
      "getabonnementplatforms_abonnementplatforms_Packs_active_id/" +
      id_personne,
    type: "GET",
    async: false,
    success: function(response) {
      var string_subscription = "";
      string_subscription +=
        '<table id="ontradings-list" class="table table-responsive full-color-table full-info-table hover-table" width="100%">' +
        "<thead>" +
        "<tr>" +
        "<th>Package</th>" +
        "<th>Pay Type</th>" +
        //"<th>Payment</th>" +
        "<th>Period</th>" +
        "<th>Total</th>" +
        "<th>Paid</th>" +
        "<th>Rest</th>" +
        "<th>Rest Period</th>" +
        "</tr>" +
        "</thead>" +
        "<tbody>";
      var length_data = response.data_abonnementplatforms.length;
      if (length_data > 0) {
        $.each(response.data_abonnementplatforms, function(key, value) {
          string_subscription +=
            "<tr>" +
            "<td><strong>" +
            value.packabonnementplatform +
            "</strong></td>" +
            "<td><strong>" +
            value.type_payment +
            "</strong></td>" +
            /* "<td><strong>" +
            value.id_payment +
            "</strong></td>" + */
            "<td>" +
            value.periode +
            "</td>" +
            "<td><strong>" +
            value.total_pay +
            "</strong></td>" +
            "<td><strong>" +
            value.paid +
            "</strong></td>" +
            "<td><strong>" +
            value.rest +
            "</strong></td>" +
            "<td><strong>" +
            value.rest_periode +
            "</strong></td>" +
            "</tr>";
        });
      } else {
        string_subscription +=
          "<tr>" +
          '<td colspan="7" class="text-center" width="100%"><strong>No Package Activated for this user</strong></td>' +
          "</tr>";
      }
      string_subscription += "</tbody>" + "</table>";
      $("#titre_ontradings").html("<strong>Subscription Package List</strong>");
      $("#table_ontradings").html(string_subscription);
      $("#AffiliatesModal").modal("hide");
      $("#OntradingModal").modal("show");
    }
  });
}

function table_sub_affiliates(i) {
  var string_sub_affiliates = "";
  string_sub_affiliates +=
    '<table id="sub-affiliates-list" class="table table-responsive full-color-table full-info-table hover-table">' +
    "<thead>" +
    "<tr>" +
    "<th>Name</th>" +
    "<th>Ranking</th>" +
    "<th>Email</th>" +
    "<th>Phone</th>" +
    "<th>Registration date</th>" +
    "<th>Trading Packages</th>" +
    "<th>Subscription Packages</th>" +
    "</tr>" +
    "</thead>" +
    "<tbody>";
  $.each(array_sub_affiliates[i], function(key, value) {
    string_sub_affiliates +=
      '<tr class="tr-affiliates">' +
      "<td><strong>" +
      value.nom_prenom +
      "</strong></td>" +
      "<td>" +
      value.ranking +
      "</td>" +
      '<td><strong><a href="mailto:' +
      value.email +
      '">' +
      value.email +
      "</a></strong></td>" +
      "<td><strong>" +
      value.telephone +
      "</strong></td>" +
      "<td><strong>" +
      value.date_inscription +
      "</strong></td>" +
      '<td><img style="cursor: pointer;" onclick="table_ontrading(' +
      value.id_personne +
      ')" src="assets/images/details_open.png" alt="' +
      value.nom_prenom +
      " Ontrading Packages\" data-toggle='tooltip' data-placement='top' data-original-title=\"" +
      value.nom_prenom +
      ' Ontrading Packages"  /></td>' +
      '<td><img style="cursor: pointer;" onclick="table_subscription(' +
      value.id_personne +
      ')" src="assets/images/details_open.png" alt="' +
      value.nom_prenom +
      " Subscription Packages\" data-toggle='tooltip' data-placement='top' data-original-title=\"" +
      value.nom_prenom +
      ' Subscription Package"  /></td>' +
      "<tr>";
  });
  string_sub_affiliates += "</tbody>" + "</table>";
  $("#titre_affiliates").html("<strong>Sponsors List</strong>");
  $("#table_affiliates").html(string_sub_affiliates);
  $("#AffiliatesModal").modal("show");
}

$(document).ready(function() {
  affiliates_list = LoadAffiliatesList();
  $("#affiliates-list").DataTable({
    pageLength: 15,
    lengthMenu: [[15, 30, 50, 100, -1], [15, 30, 50, 100, "All"]]
  });
  refresh_table(affiliates_list);

  $("#download-tree-aff").click(function(e) {
    e.preventDefault();
    var useWidth = $("#tree-simple").prop("scrollWidth");
    var useHeight = $("#tree-simple").prop("scrollHeight");
    html2canvas($("#tree-simple")[0], {
      width: useWidth,
      height: useHeight
    }).then(function(canvas) {
      var a = $("<a>")
        .attr("href", canvas.toDataURL("image/png"))
        .attr("download", "graph.png")
        .appendTo("body");
      a[0].click();
      a.remove();
    });
  });
});
