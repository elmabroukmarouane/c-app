<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateQuestrepsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('questreps', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('user_id');
            $table->unsignedInteger('question_id');
            $table->text('reponse');
            $table->timestamps();
        });

        Schema::table('questreps', function (Blueprint $table){
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });

        Schema::table('questreps', function (Blueprint $table){
            $table->foreign('question_id')->references('id')->on('questreps')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('questreps');
    }
}
