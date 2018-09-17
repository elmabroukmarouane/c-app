<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Tpersonne;

class TpersonnesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();

        Tpersonne::create([
            'tpersonne' => 'Member'
        ]);
        Tpersonne::create([
            'tpersonne' => 'Admin'
        ]);
        Tpersonne::create([
            'tpersonne' => 'Super Admin'
        ]);

        foreach(range(4,10) as $index)
        {
            Tpersonne::create([
                'tpersonne' => $faker->word
            ]);
        }
    }
}
