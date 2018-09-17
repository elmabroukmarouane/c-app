<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Company Wallets List</title>
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
<h2 style="text-align: center; font-weight: bold;">Company Wallets List</h2><br />
<table class="table">
    <thead>
    <tr style="text-align: center;">
        <th>Currencie</th>
        <th>Wallet Name</th>
        <th>Wallet Address</th>
    </tr>
    </thead>
    <tbody>
    @foreach($companywallets as $companywallet)
        <tr style="text-align: center;">
            <td>{{$companywallet->currencie}}</td>
            <td>{{$companywallet->wallet_name}}</td>
            <td>{{$companywallet->wallet_adresse}}</td>
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>