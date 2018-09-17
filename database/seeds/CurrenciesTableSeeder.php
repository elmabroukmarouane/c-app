<?php

use Illuminate\Database\Seeder;
use App\Currencie;

class CurrenciesTableSeeder extends Seeder
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
            Currencie::create([
                'currencie' => 'Currencie ' . $index
            ]);
        }
    }
}
