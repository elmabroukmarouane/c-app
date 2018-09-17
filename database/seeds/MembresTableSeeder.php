<?php

use Illuminate\Database\Seeder;
use App\Membre;

class MembresTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        foreach(range(1,10) as $index)
        {
            Membre::create([
                'id_personne' => $index,
                'id_parrain' => rand(1, 10)
            ]);
        }
    }
}
