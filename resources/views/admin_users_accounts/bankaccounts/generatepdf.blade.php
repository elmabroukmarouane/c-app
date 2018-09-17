<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Accounts List of {{ $bankaccounts[0]->nom_prenom }}</title>
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
<h2 style="text-align: center; font-weight: bold;">Accounts List of {{ $bankaccounts[0]->nom_prenom }}</h2><br />
<table class="table">
    <thead>
    <tr style="text-align: center;">
        <th>Bank</th>
        <th>Bank Country</th>
        <th>#Account</th>
    </tr>
    </thead>
    <tbody>
    @foreach($bankaccounts as $bankaccount)
        <tr style="text-align: center;">
            <td>{{$bankaccount->bank}}</td>
            <td>{{$bankaccount->bank_account_country}}</td>
            <td>{{$bankaccount->bank_account_number}}</td>
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>