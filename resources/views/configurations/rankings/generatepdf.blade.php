<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Rankings List</title>
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
<h2 style="text-align: center; font-weight: bold;">Rankings List</h2><br />
<table class="table">
    <thead>
    <tr style="text-align: center;">
        <th>Ranking</th>
    </tr>
    </thead>
    <tbody>
    @foreach($rankings as $ranking)
        <tr style="text-align: center;">
            <td>{{$ranking->ranking}}</td>
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>