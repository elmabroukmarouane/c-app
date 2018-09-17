<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tpersonne extends Model
{
    protected $table = 'tpersonnes';
    protected $primaryKey = 'id';
    protected $fillable = ['tpersonne'];

    public function personnes()
    {
        return $this->hasMany(Personne::class);
    }
}
