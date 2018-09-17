<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Sponsors Packages List</title>
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
<h2 style="text-align: center; font-weight: bold;">Active Packages List</h2><br />
<table class="table">
    <thead>
    <tr style="text-align: center;">
        <th>ID</th>
        <th>Package</th>
        <th>Pay Type</th>
        <th>Payment</th>
        <th>Get Payment</th>
        <th>Period</th>
        <th>Total</th>
        <th>Paid</th>
        <th>Rest</th>
    </tr>
    </thead>
    <tbody>
    @foreach($data_ontradings as $data_ontrading)
        <tr style="text-align: center;">
            <td>{{ $loop->index + 1 }}</td>
            <td>{{ $data_ontrading['abonnement'] }}</td>
            <td>{{ $data_ontrading['type_payment'] }}</td>
            <td>{{ $data_ontrading['id_payment'] }}</td>
            <td>{{ $data_ontrading['id_get_paid'] }}</td>
            <td>{{ $data_ontrading['periode'] }}</td>
            <td>{{ $data_ontrading['total_profit'] }}</td>
            <td>{{ $data_ontrading['paid'] }}</td>
            <td>{{ $data_ontrading['rest'] }}</td>
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>