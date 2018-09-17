<?php

use Illuminate\Database\Seeder;
use App\Niveau2;

class Niveau2sTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Niveau2::create([
            'id_parrain_base' => 1,
            'id_parrain_direct' => 2,
            'id_parraine' => 6
        ]);
        Niveau2::create([
            'id_parrain_base' => 1,
            'id_parrain_direct' => 2,
            'id_parraine' => 7
        ]);
        Niveau2::create([
            'id_parrain_base' => 1,
            'id_parrain_direct' => 2,
            'id_parraine' => 8
        ]);
        Niveau2::create([
            'id_parrain_base' => 1,
            'id_parrain_direct' => 2,
            'id_parraine' => 9
        ]);
        Niveau2::create([
            'id_parrain_base' => 1,
            'id_parrain_direct' => 2,
            'id_parraine' => 10
        ]);
    }
}
