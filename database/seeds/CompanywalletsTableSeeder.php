<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Companywallet;

class CompanywalletsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();
        foreach(range(1,10) as $index)
        {
            Companywallet::create([
                'id_currencie' => rand(1, 5),
                'wallet_name' => $faker->word,
                'wallet_adresse' => $faker->bankAccountNumber
            ]);
        }
    }
}
