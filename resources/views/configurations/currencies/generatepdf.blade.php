<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Currencies List</title>
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
<h2 style="text-align: center; font-weight: bold;">Currencies List</h2><br />
<table class="table">
    <thead>
    <tr style="text-align: center;">
        <th>Currencie</th>
    </tr>
    </thead>
    <tbody>
    @foreach($currencies as $currencie)
        <tr style="text-align: center;">
            <td>{{$currencie->currencie}}</td>
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>