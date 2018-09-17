<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Abonnement extends Model
{
    protected $table = 'abonnements';
    protected $primaryKey = 'id';
    protected $fillable = ['titre', 'prix', 'description_1', 'description_2', 'popular'];
}
