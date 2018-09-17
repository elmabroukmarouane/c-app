<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Users List</title>
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
<h2 style="text-align: center; font-weight: bold;">Users List</h2><br />
<table class="table">
    <thead>
    <tr style="text-align: center;">
        <th>First & Lastname</th>
        <th>Birthdate</th>
        <th>Phone</th>
        <th>Email</th>
    </tr>
    </thead>
    <tbody>
    @foreach($admins as $admin)
        <tr style="text-align: center;">
            <td>{{$admin->nom_prenom}}</td>
            <td>{{$admin->date_naissance}}</td>
            <td>{{$admin->telephone}}</td>
            <td>{{$admin->email}}</td>
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>