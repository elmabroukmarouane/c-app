<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNiveau2sTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('niveau2s', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->unsignedInteger('id_parrain_base');
            $table->unsignedInteger('id_parrain_direct');
            $table->unsignedInteger('id_parraine');
            $table->timestamps();
        });

        Schema::table('niveau2s', function (Blueprint $table){
            $table->foreign('id_parrain_base')->references('id')->on('personnes')->onDelete('cascade');
        });

        Schema::table('niveau2s', function (Blueprint $table){
            $table->foreign('id_parrain_direct')->references('id')->on('personnes')->onDelete('cascade');
        });

        Schema::table('niveau2s', function (Blueprint $table){
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
        Schema::dropIfExists('niveau2s');
    }
}
