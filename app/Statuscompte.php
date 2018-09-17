<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Statuscompte extends Model
{
    protected $table = 'statuscomptes';
    protected $primaryKey = 'id';
    protected $fillable = ['status_compte'];

    public function personnes()
    {
        return $this->hasMany(Personne::class);
    }
}
