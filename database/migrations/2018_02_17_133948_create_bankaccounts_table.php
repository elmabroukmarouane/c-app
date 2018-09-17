<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBankaccountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bankaccounts', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->unsignedInteger('id_personne');
            $table->unsignedInteger('id_bank');
            $table->string('bank_account_number', 100);
            $table->string('bank_account_country', 100);
            $table->timestamps();
        });

        Schema::table('bankaccounts', function (Blueprint $table){
            $table->foreign('id_personne')->references('id')->on('personnes')->onDelete('cascade');
        });

        Schema::table('bankaccounts', function (Blueprint $table){
            $table->foreign('id_bank')->references('id')->on('banks')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bankaccounts');
    }
}
