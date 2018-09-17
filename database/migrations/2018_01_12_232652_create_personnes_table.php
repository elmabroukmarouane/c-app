<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePersonnesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('personnes', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->unsignedInteger('id_tpersonne');
            $table->unsignedInteger('id_statuscompte');
            $table->string('nom', 100)->nullable();
            $table->string('prenom', 100)->nullable();
            $table->string('date_naissance', 10)->nullable();
            $table->text('telephone')->nullable();
            $table->text('adresse')->nullable();
            $table->string('pays', 100)->nullable();
            $table->string('ville', 100)->nullable();
            $table->string('zipcode', 100)->nullable();
            $table->text('image');
            $table->timestamps();
        });

        Schema::table('personnes', function (Blueprint $table){
            $table->foreign('id_tpersonne')->references('id')->on('tpersonnes')->onDelete('cascade');
        });

        Schema::table('personnes', function (Blueprint $table){
            $table->foreign('id_statuscompte')->references('id')->on('statuscomptes')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('personnes');
    }
}
