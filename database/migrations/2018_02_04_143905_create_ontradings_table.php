<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOntradingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ontradings', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->unsignedInteger('id_personne');
            $table->unsignedInteger('id_abonnement');
            $table->date('periode');
            $table->string('type_payment',100);
            $table->integer('id_payment');
            $table->string('type_get_paid',100);
            $table->integer('id_get_paid');
            $table->float('total_profit')->default(0);
            $table->float('paid')->default(0);
            $table->integer('finished');
            $table->integer('active');
            $table->timestamps();
        });

        Schema::table('ontradings', function (Blueprint $table){
            $table->foreign('id_personne')->references('id')->on('personnes')->onDelete('cascade');
        });

        Schema::table('ontradings', function (Blueprint $table){
            $table->foreign('id_abonnement')->references('id')->on('abonnements')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ontradings');
    }
}
