<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Companyaccount;

class CompanyaccountsTableSeeder extends Seeder
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
            Companyaccount::create([
                'id_bank' => rand(1, 5),
                'bank_account_number' => $faker->bankAccountNumber,
                'bank_account_country' => $faker->country
            ]);
        }
    }
}
