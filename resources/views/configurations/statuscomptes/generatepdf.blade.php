<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Status Type List</title>
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
<h2 style="text-align: center; font-weight: bold;">Users Type List</h2><br />
<table class="table">
    <thead>
    <tr style="text-align: center;">
        <th>Status Type</th>
    </tr>
    </thead>
    <tbody>
    @foreach($statuscomptes as $statuscompte)
        <tr style="text-align: center;">
            <td>{{$statuscompte->status_compte}}</td>
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>