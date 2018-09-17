<?php

use Illuminate\Database\Seeder;
use App\Packabonnementplatform;

class PackabonnementplatformsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        /*foreach(range(1,5) as $index)
        {*/
            Packabonnementplatform::create([
                'nom_pack_abonnement_platform' => 'Pack Abonnement Platform 1',
                'prix_ut' => rand(10, 100) . '.' . rand(1, 99)
            ]);
        //}
    }
}
