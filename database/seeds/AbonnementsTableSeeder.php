<?php

use Illuminate\Database\Seeder;
use App\Abonnement;

class AbonnementsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Abonnement::create([
            'titre' => 'Bronze',
            'prix' => 1000,
            'description_1' => 'Between 130% and 300%',
            'description_2' => 'Depending to your Rank',
            'popular' => 0
        ]);
        Abonnement::create([
            'titre' => 'Silver',
            'prix' => 2000,
            'description_1' => 'Between 130% and 300%',
            'description_2' => 'Depending to your Rank',
            'popular' => 0
        ]);
        Abonnement::create([
            'titre' => 'Gold',
            'prix' => 5000,
            'description_1' => 'Between 130% and 300%',
            'description_2' => 'Depending to your Rank',
            'popular' => 1
        ]);
        Abonnement::create([
            'titre' => 'Platinum',
            'prix' => 10000,
            'description_1' => 'Between 130% and 300%',
            'description_2' => 'Depending to your Rank',
            'popular' => 0
        ]);
        Abonnement::create([
            'titre' => 'Diamond',
            'prix' => 25000,
            'description_1' => 'Between 130% and 300%',
            'description_2' => 'Depending to your Rank',
            'popular' => 0
        ]);
    }
}
