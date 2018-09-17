<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBalancebitcoinsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('balancebitcoins', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->unsignedInteger('id_personne');
            $table->float('balance_bitcoin')->default(0);
            $table->timestamps();
        });

        Schema::table('balancebitcoins', function (Blueprint $table){
            $table->foreign('id_personne')->references('id')->on('personnes')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('balancebitcoins');
    }
}
