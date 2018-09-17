<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Sponsors Subscription Packs List</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        td, th {
            border: 2px solid #000000;
        }
    </style>
</head>
<body>
<h2 style="text-align: center; font-weight: bold;">Sponsors Subscription Packs List</h2><br />
<table class="table">
    <thead>
    <tr style="text-align: center;">
        <th>ID</th>
        <th>Sponsor</th>
        <th>Pack</th>
        <th>Pay Type</th>
        <th>Payment</th>
        <th>Period</th>
        <th>Total</th>
        <th>Paid</th>
        <th>Rest</th>
        <th>Rest Period</th>
    </tr>
    </thead>
    <tbody>
    @foreach($data_abonnementplatforms as $data_abonnementplatform)
        <tr style="text-align: center;">
            <td>{{ $data_abonnementplatform['id'] }}</td>
            <td>{{ $data_abonnementplatform['nom_prenom'] }}</td>
            <td>{{ $data_abonnementplatform['packabonnementplatform'] }}</td>
            <td>{{ $data_abonnementplatform['type_payment'] }}</td>
            <td>{{ $data_abonnementplatform['id_payment'] }}</td>
            <td>{{ $data_abonnementplatform['periode'] }}</td>
            <td>{{ $data_abonnementplatform['total_pay'] }}</td>
            <td>{{ $data_abonnementplatform['paid'] }}</td>
            <td>{{ $data_abonnementplatform['rest'] }}</td>
            <td>{{ $data_abonnementplatform['rest_periode'] }}</td>
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>