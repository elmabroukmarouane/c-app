<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Currencie extends Model
{
    protected $table = 'currencies';
    protected $primaryKey = 'id';
    protected $fillable = ['currencie'];
}
