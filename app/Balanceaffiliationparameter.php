<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Balanceaffiliationparameter extends Model
{
    protected $table = 'balanceaffiliationparameters';
    protected $primaryKey = 'id';
    protected $fillable = ['newcomer_parameter', 'affiliate_parameter'];
}
