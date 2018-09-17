<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bankwallet extends Model
{
    protected $table = 'bankwallets';
    protected $primaryKey = 'id';
    protected $fillable = ['id_personne', 'id_currencie', 'wallet_name', 'wallet_adresse'];

    public function personne()
    {
        return $this->belongsTo(Personne::class);
    }

    public function currencie()
    {
        return $this->belongsTo(Currencie::class);
    }
}
