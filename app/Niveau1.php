<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Niveau1 extends Model
{
    protected $table = 'niveau1s';
    protected $primaryKey = 'id';
    protected $fillable = ['id_parrain', 'id_parraine'];

    public function personne()
    {
        return $this->belongsTo(Personne::class);
    }
}
