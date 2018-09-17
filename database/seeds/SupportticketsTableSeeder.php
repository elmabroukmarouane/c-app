<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Supportticket;

class SupportticketsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();

        Supportticket::create([
            'id_personne' => 1,
            'subject' => 'Problem Update Profil !',
            'status' => 0
        ]);

        Supportticket::create([
            'id_personne' => 2,
            'subject' => 'Problem Buying packs !',
            'status' => 0
        ]);

        foreach(range(3,10) as $index)
        {
            Supportticket::create([
                'id_personne' => $index,
                'subject' => $faker->word,
                'status' => rand(0, 1)
            ]);
        }
    }
}
