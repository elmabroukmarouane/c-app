<?php

use Illuminate\Database\Seeder;
use App\Balanceaffiliationparameter;

class BalanceaffiliationparametersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Balanceaffiliationparameter::create([
            'newcomer_parameter' => '50',
            'affiliate_parameter' => '15'
        ]);
    }
}
