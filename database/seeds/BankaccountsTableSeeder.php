<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Bankaccount;

class BankaccountsTableSeeder extends Seeder
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
                Bankaccount::create([
                    'id_personne' => $index,
                    'id_bank' => $ind,
                    'bank_account_number' => $faker->bankAccountNumber,
                    'bank_account_country' => $faker->country
                ]);
            }
        }
        foreach(range(3,10) as $index)
        {
            Bankaccount::create([
                'id_personne' => $index,
                'id_bank' => rand(1, 5),
                'bank_account_number' => $faker->bankAccountNumber,
                'bank_account_country' => $faker->country
            ]);
        }
    }
}
