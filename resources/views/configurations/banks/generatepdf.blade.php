<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Banks List</title>
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
<h2 style="text-align: center; font-weight: bold;">Banks List</h2><br />
<table class="table">
    <thead>
    <tr style="text-align: center;">
        <th>Bank</th>
    </tr>
    </thead>
    <tbody>
    @foreach($banks as $bank)
        <tr style="text-align: center;">
            <td>{{$bank->bank}}</td>
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>