<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Ontrading;

class OntradingsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();

        foreach(range(1,2) as $index)
        {
            foreach (range(1,5) as $ind)
            {
                $total_paid = $faker->numberBetween(100, 30000);
                $date = new DateTime();
                $rand_date = rand(1, 10);
                $interval = new DateInterval('P' . $rand_date . 'M');
                $date->add($interval);
                $total_paid_history = $faker->numberBetween(100, 30000);
                $date_history = $faker->date('Y-m-d', 'now');
                Ontrading::create([
                    'id_personne' => $index,
                    'id_abonnement' => $ind,
                    'periode' => $date_history,
                    'type_payment' => rand(0, 1) ? 'Bank' : 'Wallet',
                    'id_payment' => rand(1, 10),
                    'type_get_paid' => rand(0, 1) ? 'Bank' : 'Wallet',
                    'id_get_paid' => rand(1, 10),
                    'total_profit' => $total_paid_history,
                    'paid' => $total_paid_history / 2,
                    'finished' => 1,
                    'active' => 1
                ]);
                Ontrading::create([
                    'id_personne' => $index,
                    'id_abonnement' => $ind,
                    'periode' => $date->format('Y-m-d'),
                    'type_payment' => rand(0, 1) ? 'Bank' : 'Wallet',
                    'id_payment' => rand(1, 10),
                    'type_get_paid' => rand(0, 1) ? 'Bank' : 'Wallet',
                    'id_get_paid' => rand(1, 10),
                    'total_profit' => $total_paid,
                    'paid' => $total_paid / 2,
                    'finished' => 0,
                    'active' => 1
                ]);
            }
        }
        foreach(range(3,10) as $index)
        {
            $rand_abonnement = rand(1, 5);
            $total_paid = $faker->numberBetween(100, 30000);
            $date = new DateTime();
            $rand_date = rand(1, 10);
            $interval = new DateInterval('P' . $rand_date . 'M');
            $date->add($interval);
            Ontrading::create([
                'id_personne' => $index,
                'id_abonnement' => $rand_abonnement,
                'periode' => $date->format('Y-m-d'),
                'type_payment' => rand(0, 1) ? 'Bank' : 'Wallet',
                'id_payment' => rand(1, 10),
                'type_get_paid' => rand(0, 1) ? 'Bank' : 'Wallet',
                'id_get_paid' => rand(1, 10),
                'total_profit' => $total_paid,
                'paid' => $total_paid / 2,
                'finished' => 0,
                'active' => rand(0, 1)
            ]);
        }
    }
}
