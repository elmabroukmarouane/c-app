<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

use App\Userlog;

class CreateUserlogsTable extends Migration {

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('userlogs', function(Blueprint $table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->integer('user_id')->unsigned();
            $table->text('activite');
            $table->text('ip_address');
            $table->text('status_class');
            $table->timestamps();
        });

        Schema::table('userlogs', function(Blueprint $table){
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('userlogs');
    }

}
