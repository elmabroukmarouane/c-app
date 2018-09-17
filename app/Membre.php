<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Membre extends Model
{
    protected $table = 'membres';
    protected $primaryKey = 'id';
    protected $fillable = ['id_personne', 'id_parrain'];

    public function personne()
    {
        return $this->belongsTo(Personne::class);
    }

    public function parrain()
    {
        return $this->belongsTo(Personne::class);
    }
}
