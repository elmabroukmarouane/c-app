<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAbonnementplatformsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('abonnementplatforms', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->unsignedInteger('id_personne');
            $table->unsignedInteger('id_packabonnementplatform');
            $table->string('type_payment',100);
            $table->integer('id_payment');
            $table->date('periode');
            $table->float('total_pay')->default(0);
            $table->float('paid')->default(0);
            $table->integer('finished');
            $table->timestamps();
        });

        Schema::table('abonnementplatforms', function (Blueprint $table){
            $table->foreign('id_personne')->references('id')->on('personnes')->onDelete('cascade');
        });

        Schema::table('abonnementplatforms', function (Blueprint $table){
            $table->foreign('id_packabonnementplatform')->references('id')->on('packabonnementplatforms')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('abonnementplatforms');
    }
}
