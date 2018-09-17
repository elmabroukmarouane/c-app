<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    protected $table = 'messages';
    protected $primaryKey = 'id';
    protected $fillable = ['id_personne', 'message'];

    public function personne()
    {
        return $this->belongsTo(Personne::class);
    }
}
