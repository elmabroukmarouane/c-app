<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePvbalancepersonnesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pvbalancepersonnes', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->unsignedInteger('id_personne');
            $table->unsignedInteger('id_balance_affiliation');
            $table->string('type_payment', 100);
            $table->float('montant_pvbalancepersonne')->default(0);
            $table->integer('status_pvbalancepersonne')->default(0);
            $table->timestamps();
        });

        Schema::table('pvbalancepersonnes', function (Blueprint $table){
            $table->foreign('id_personne')->references('id')->on('personnes')->onDelete('cascade');
        });

        Schema::table('pvbalancepersonnes', function (Blueprint $table){
            $table->foreign('id_balance_affiliation')->references('id')->on('balanceaffiliations')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pvbalancepersonnes');
    }
}
