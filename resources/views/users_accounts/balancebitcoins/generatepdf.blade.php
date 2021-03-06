<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Balance Bitcoin List</title>
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
<h2 style="text-align: center; font-weight: bold;">Balance Bitcoin List</h2><br />
<table class="table">
    <thead>
    <tr style="text-align: center;">
        <th>User</th>
        <th>Rank</th>
        <th>Balance</th>
    </tr>
    </thead>
    <tbody>
    @foreach($array_balancebitcoins as $balancebitcoin)
        <tr style="text-align: center;">
            <td>{{$balancebitcoin['sponsor_nom_prenom']}}</td>
            <td>{{$balancebitcoin['rank_sponsor']->ranking}}</td>
            <td>{{$balancebitcoin['balance_bitcoin']}}</td>
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>