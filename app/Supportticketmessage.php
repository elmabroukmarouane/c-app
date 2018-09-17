<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Supportticketmessage extends Model
{
    protected $table = 'supportticketmessages';
    protected $primaryKey = 'id';
    protected $fillable = ['id_supportticket', 'id_sender', 'id_receiver', 'message'];

    public function supportticket()
    {
        return $this->belongsTo(Supportticket::class);
    }
}
