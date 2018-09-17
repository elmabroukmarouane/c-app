<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBalanceaffiliationparametersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('balanceaffiliationparameters', function (Blueprint $table) {
            $table->increments('id');
            $table->float('newcomer_parameter')->default(0);
            $table->float('affiliate_parameter')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('balanceaffiliationparameters');
    }
}
