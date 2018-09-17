<?php

use Illuminate\Database\Seeder;
use App\Userlog;

class UserlogsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Userlog::create([
            'user_id' => '1',
            'activite' => 'Connected successfully',
            'ip_address' => '192.168.0.1',
            'status_class' => 'success'
        ]);

        Userlog::create([
            'user_id' => '1',
            'activite' => 'Disconnected successfully',
            'ip_address' => '192.168.0.1',
            'status_class' => 'danger'
        ]);

        Userlog::create([
            'user_id' => '2',
            'activite' => 'Connected successfully',
            'ip_address' => '192.168.0.2',
            'status_class' => 'success'
        ]);

        Userlog::create([
            'user_id' => '2',
            'activite' => 'Disconnected successfully',
            'ip_address' => '192.168.0.2',
            'status_class' => 'danger'
        ]);

        Userlog::create([
            'user_id' => '3',
            'activite' => 'Connected successfully',
            'ip_address' => '192.168.0.3',
            'status_class' => 'success'
        ]);

        Userlog::create([
            'user_id' => '3',
            'activite' => 'Disconnected successfully',
            'ip_address' => '192.168.0.3',
            'status_class' => 'danger'
        ]);

        Userlog::create([
            'user_id' => '4',
            'activite' => 'Connected successfully',
            'ip_address' => '192.168.0.4',
            'status_class' => 'success'
        ]);

        Userlog::create([
            'user_id' => '4',
            'activite' => 'Disconnected successfully',
            'ip_address' => '192.168.0.4',
            'status_class' => 'danger'
        ]);

        Userlog::create([
            'user_id' => '1',
            'activite' => 'Connected successfully',
            'ip_address' => '192.168.0.5',
            'status_class' => 'success'
        ]);

        Userlog::create([
            'user_id' => '1',
            'activite' => 'Disconnected successfully',
            'ip_address' => '192.168.0.5',
            'status_class' => 'danger'
        ]);
    }
}
