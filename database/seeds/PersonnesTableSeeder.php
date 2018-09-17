<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Personne;
use App\Balanceaffiliation;
use App\Balancebitcoin;
use App\Pvbalancepersonne;

class PersonnesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();
        $i = 1;
        foreach(range(1,10) as $index)
        {
            $personne = Personne::create([
                'id_tpersonne' => $i,
                'id_statuscompte' => rand(1, 4),
                'nom' => $faker->firstName,
                'prenom' => $faker->lastName,
                'date_naissance' => $faker->date('d/m/Y', '1999-01-01'),
                'telephone' => $faker->phoneNumber,
                'adresse' => $faker->address,
                'pays' => $faker->country,
                'ville' => $faker->city,
                'zipcode' => $faker->postcode,
                'image' => 'avatar.png'
            ]);
            $balanceaffiliation = Balanceaffiliation::create([
                'id_personne' => $personne->id,
                'balance_affiliation' => 0
            ]);
            $balancebitcoin = Balancebitcoin::create([
                'id_personne' => $personne->id,
                'balance_bitcoin' => 0
            ]);
            Pvbalancepersonne::create([
                'id_personne' => $personne->id,
                'id_balance_affiliation' => $balanceaffiliation->id,
                'type_payment' => rand(0, 1) ? 'Bank' : 'Wallet',
                'montant_pvbalancepersonne' => 0,
                'status_pvbalancepersonne' => rand(0, 2)
            ]);
            if($index % 2 == 0)
            {
                $i++;
            }
        }
    }
}
