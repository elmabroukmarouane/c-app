<?php

use Illuminate\Database\Seeder;
use App\Niveau1;

class Niveau1sTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Niveau1::create([
            'id_parrain' => 1,
            'id_parraine' => 2
        ]);
        Niveau1::create([
            'id_parrain' => 1,
            'id_parraine' => 3
        ]);
        Niveau1::create([
            'id_parrain' => 1,
            'id_parraine' => 4
        ]);
        Niveau1::create([
            'id_parrain' => 1,
            'id_parraine' => 5
        ]);
        Niveau1::create([
            'id_parrain' => 2,
            'id_parraine' => 6
        ]);
        Niveau1::create([
            'id_parrain' => 2,
            'id_parraine' => 7
        ]);
        Niveau1::create([
            'id_parrain' => 2,
            'id_parraine' => 8
        ]);
        Niveau1::create([
            'id_parrain' => 2,
            'id_parraine' => 9
        ]);
        Niveau1::create([
            'id_parrain' => 2,
            'id_parraine' => 10
        ]);
        /*$i = 1;
        $id_parainne = 2;
        foreach(range(3,10) as $index)
        {
            Niveau1::create([
                'id_parrain' => $i,
                'id_parraine' => $id_parainne
            ]);

            if($index % 5 == 0)
            {
                $i++;
                $id_parainne++;
                continue;
            }
            $id_parainne = $index;
        }*/
    }
}
