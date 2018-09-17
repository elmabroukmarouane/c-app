<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Available Packs List</title>
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
<h2 style="text-align: center; font-weight: bold;">Available Packs List</h2><br />
<table class="table">
    <thead>
    <tr style="text-align: center;">
        <th>Pack Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Popular</th>
    </tr>
    </thead>
    <tbody>
    @foreach($abonnements as $abonnement)
        <tr style="text-align: center;">
            <td>{{$abonnement->titre}}</td>
            <td>{{$abonnement->prix}}</td>
            <td>{{$abonnement->description_1}} {{$abonnement->description_2}}</td>
            <td>
                <?php
                    if($abonnement->popular == 1)
                    {
                        echo "Yes";
                    }
                    else
                    {
                        echo "No";
                    }
                ?>
            </td>
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>