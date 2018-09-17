<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\User;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();

        foreach(range(1,10) as $index)
        {
            User::create([
                'id_personne' => $index,
                'email' => $faker->email,
                'password' => bcrypt('123456'),
                'online' => '0',
                'active_security_questions' => rand(0, 1),
                'firstime' => '0'
            ]);
        }
    }
}
