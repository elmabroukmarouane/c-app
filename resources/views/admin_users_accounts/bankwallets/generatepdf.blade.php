<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Wallets List of {{ $bankwallets[0]->nom_prenom }}</title>
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
<h2 style="text-align: center; font-weight: bold;">Wallets List of {{ $bankwallets[0]->nom_prenom }}</h2><br />
<table class="table">
    <thead>
    <tr style="text-align: center;">
        <th>Currencie</th>
        <th>Wallet Name</th>
        <th>Wallet Address</th>
    </tr>
    </thead>
    <tbody>
    @foreach($bankwallets as $bankwallet)
        <tr style="text-align: center;">
            <td>{{$bankwallet->currencie}}</td>
            <td>{{$bankwallet->wallet_name}}</td>
            <td>{{$bankwallet->wallet_adresse}}</td>
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>