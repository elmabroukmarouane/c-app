<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompanyaccountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('companyaccounts', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->unsignedInteger('id_bank');
            $table->string('bank_account_number', 100);
            $table->string('bank_account_country', 100);
            $table->timestamps();
        });

        Schema::table('companyaccounts', function (Blueprint $table){
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
        Schema::dropIfExists('companyaccounts');
    }
}
