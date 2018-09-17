<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Supportticket extends Model
{
    protected $table = 'supporttickets';
    protected $primaryKey = 'id';
    protected $fillable = ['id_personne', 'subject', 'status'];

    public function personne()
    {
        return $this->belongsTo(Personne::class);
    }
}
