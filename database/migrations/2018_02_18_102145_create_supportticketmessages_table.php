<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSupportticketmessagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('supportticketmessages', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->unsignedInteger('id_supportticket');
            $table->unsignedInteger('id_sender');
            $table->unsignedInteger('id_receiver');
            $table->text('message');
            $table->timestamps();
        });

        Schema::table('supportticketmessages', function (Blueprint $table){
            $table->foreign('id_sender')->references('id')->on('personnes')->onDelete('cascade');
        });

        Schema::table('supportticketmessages', function (Blueprint $table){
            $table->foreign('id_receiver')->references('id')->on('personnes')->onDelete('cascade');
        });

        Schema::table('supportticketmessages', function (Blueprint $table){
            $table->foreign('id_supportticket')->references('id')->on('supporttickets')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('supportticketmessages');
    }
}
