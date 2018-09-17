<?php

use Illuminate\Database\Seeder;
use App\Statuscompte;

class StatuscomptesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Statuscompte::create([
            'status_compte' => 'Active'
        ]);
        Statuscompte::create([
            'status_compte' => 'Canceled'
        ]);

        Statuscompte::create([
            'status_compte' => 'Pending Validation'
        ]);
        Statuscompte::create([
            'status_compte' => 'Suspended'
        ]);
    }
}
