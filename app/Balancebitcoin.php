<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Balancebitcoin extends Model
{
    protected $table = 'balancebitcoins';
    protected $primaryKey = 'id';
    protected $fillable = ['id_personne', 'balance_bitcoin'];

    public function personne()
    {
        return $this->belongsTo(Personne::class);
    }
}
