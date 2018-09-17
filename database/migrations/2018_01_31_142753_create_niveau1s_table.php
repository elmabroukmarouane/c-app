<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNiveau1sTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('niveau1s', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->unsignedInteger('id_parrain');
            $table->unsignedInteger('id_parraine');
            $table->timestamps();
        });

        Schema::table('niveau1s', function (Blueprint $table){
            $table->foreign('id_parrain')->references('id')->on('personnes')->onDelete('cascade');
        });

        Schema::table('niveau1s', function (Blueprint $table){
            $table->foreign('id_parraine')->references('id')->on('personnes')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('niveau1s');
    }
}
