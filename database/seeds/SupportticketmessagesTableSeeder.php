<?php

use Illuminate\Database\Seeder;
use App\Supportticketmessage;
use Faker\Factory as Faker;

class SupportticketmessagesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();

        Supportticketmessage::create([
            'id_supportticket' => 1,
            'id_sender' => 1,
            'id_receiver' => 3,
            'message' => 'Hello, I have a problem !'
        ]);
        Supportticketmessage::create([
            'id_supportticket' => 1,
            'id_sender' => 3,
            'id_receiver' => 1,
            'message' => 'Hello, which kind of problems ?'
        ]);
        Supportticketmessage::create([
            'id_supportticket' => 1,
            'id_sender' => 1,
            'id_receiver' => 3,
            'message' => 'The profil did not updated !'
        ]);
        Supportticketmessage::create([
            'id_supportticket' => 1,
            'id_sender' => 3,
            'id_receiver' => 1,
            'message' => 'OK,  go to profil and refresh page and then click update !'
        ]);
        Supportticketmessage::create([
            'id_supportticket' => 1,
            'id_sender' => 1,
            'id_receiver' => 3,
            'message' => 'OK, Thanks it works, you saved my day !'
        ]);
        Supportticketmessage::create([
            'id_supportticket' => 1,
            'id_sender' => 3,
            'id_receiver' => 1,
            'message' => 'No problem, Thank you for using this platform :) !'
        ]);

        Supportticketmessage::create([
            'id_supportticket' => 2,
            'id_sender' => 2,
            'id_receiver' => 3,
            'message' => 'Hello, I have a problem !'
        ]);
        Supportticketmessage::create([
            'id_supportticket' => 2,
            'id_sender' => 3,
            'id_receiver' => 2,
            'message' => 'Hello, which kind of problems ?'
        ]);
        Supportticketmessage::create([
            'id_supportticket' => 2,
            'id_sender' => 2,
            'id_receiver' => 3,
            'message' => 'The pack did not buyed :s !'
        ]);
        Supportticketmessage::create([
            'id_supportticket' => 2,
            'id_sender' => 3,
            'id_receiver' => 2,
            'message' => 'OK,  go to pack page and refresh it and then click Take it another time !'
        ]);
        Supportticketmessage::create([
            'id_supportticket' => 2,
            'id_sender' => 2,
            'id_receiver' => 3,
            'message' => 'OK, Thanks it works, you saved my day !'
        ]);
        Supportticketmessage::create([
            'id_supportticket' => 2,
            'id_sender' => 3,
            'id_receiver' => 2,
            'message' => 'No problem, Thank you for using this platform :) !'
        ]);
        foreach(range(3,10) as $index)
        {
            Supportticketmessage::create([
                'id_supportticket' => $index,
                'id_sender' => $index,
                'id_receiver' => 3,
                'message' => $faker->paragraph
            ]);
        }
    }
}
