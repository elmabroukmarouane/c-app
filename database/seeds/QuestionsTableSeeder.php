<?php

use Illuminate\Database\Seeder;
use App\Question;

class QuestionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        foreach(range(1,5) as $index)
        {
            Question::create([
                'question' => 'QUESTION ' . $index
            ]);
        }
    }
}
