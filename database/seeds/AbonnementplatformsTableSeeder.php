<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Abonnementplatform;

class AbonnementplatformsTableSeeder extends Seeder
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
            $total_paid = $faker->numberBetween(100, 30000);
            $date = new DateTime();
            $rand_date = rand(1, 10);
            $interval = new DateInterval('P' . $rand_date . 'M');
            $date->add($interval);
            Abonnementplatform::create([
                'id_personne' => $index,
                'id_packabonnementplatform' => '1',
                'type_payment' => rand(0, 1) ? 'Bank' : 'Wallet',
                'id_payment' => rand(1, 10),
                'periode' => $date->format('Y-m-d'),
                'total_pay' => $total_paid,
                'paid' => $total_paid / 2,
                'finished' => 0
            ]);
        }

        foreach(range(1,10) as $index)
        {
            $total_paid = $faker->numberBetween(100, 30000);
            $date_history = $faker->date('Y-m-d', 'now');
            Abonnementplatform::create([
                'id_personne' => $index,
                'id_packabonnementplatform' => '1',
                'type_payment' => rand(0, 1) ? 'Bank' : 'Wallet',
                'id_payment' => rand(1, 10),
                'periode' => $date_history,
                'total_pay' => $total_paid,
                'paid' => $total_paid,
                'finished' => 1
            ]);
        }
    }
}
