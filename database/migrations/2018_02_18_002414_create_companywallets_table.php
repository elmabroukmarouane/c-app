<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompanywalletsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('companywallets', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->unsignedInteger('id_currencie');
            $table->string('wallet_name', 100);
            $table->text('wallet_adresse');
            $table->timestamps();
        });

        Schema::table('companywallets', function (Blueprint $table){
            $table->foreign('id_currencie')->references('id')->on('currencies')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('companywallets');
    }
}
