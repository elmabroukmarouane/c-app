<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Companywallet extends Model
{
    protected $table = 'companywallets';
    protected $primaryKey = 'id';
    protected $fillable = ['id_currencie', 'wallet_name', 'wallet_adresse'];

    public function currencie()
    {
        return $this->belongsTo(Currencie::class);
    }
}
