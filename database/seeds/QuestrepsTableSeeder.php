<?php

use Illuminate\Database\Seeder;
use App\Questrep;

class QuestrepsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 1; $i <= 2; $i++)
        {
            for($j = 1; $j <= 5; $j++)
            {
                Questrep::create([
                    'user_id' => $i,
                    'question_id' => $j,
                    'reponse' => 'OK ' . $j
                ]);
            }
        }
    }
}
