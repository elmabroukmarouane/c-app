<?php

use Illuminate\Database\Seeder;
use App\Bank;

class BanksTableSeeder extends Seeder
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
            Bank::create([
                'bank' => 'BANK ' . $index
            ]);
        }
    }
}
