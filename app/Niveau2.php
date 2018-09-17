<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Niveau2 extends Model
{
    protected $table = 'niveau2s';
    protected $primaryKey = 'id';
    protected $fillable = ['id_parrain_base', 'id_parrain_direct', 'id_parraine'];

    public function personne()
    {
        return $this->belongsTo(Personne::class);
    }
}
