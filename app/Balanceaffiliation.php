<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Balanceaffiliation extends Model
{
    protected $table = 'balanceaffiliations';
    protected $primaryKey = 'id';
    protected $fillable = ['id_personne', 'balance_affiliation'];

    public function personne()
    {
        return $this->belongsTo(Personne::class);
    }
}
