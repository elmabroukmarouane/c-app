<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Bankwallet;

class BankwalletsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();

        foreach(range(1,2) as $index)
        {
            foreach (range(1,5) as $ind)
            {
                Bankwallet::create([
                    'id_personne' => $index,
                    'id_currencie' => $ind,
                    'wallet_name' => $faker->word,
                    'wallet_adresse' => $faker->bankAccountNumber
                ]);
            }
        }
        foreach(range(3,10) as $index)
        {
            Bankwallet::create([
                'id_personne' => $index,
                'id_currencie' => rand(1, 5),
                'wallet_name' => $faker->word,
                'wallet_adresse' => $faker->bankAccountNumber
            ]);
        }
    }
}
