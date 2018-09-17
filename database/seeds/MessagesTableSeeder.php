<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Message;

class MessagesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();
        $i = 1;
        foreach(range(1,20) as $index)
        {
            Message::create([
                'id_personne' => $i,
                'message' => $faker->paragraph
            ]);
            if($index % 2 == 0)
            {
                $i++;
            }
        }
    }
}
