<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Posts;

class PostsTableSeeder extends Seeder
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
            Posts::create([
                'title' => $faker->word,
                'detail' => $faker->paragraph
            ]);
        }
    }
}
