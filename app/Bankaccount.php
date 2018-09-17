<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bankaccount extends Model
{
    protected $table = 'bankaccounts';
    protected $primaryKey = 'id';
    protected $fillable = ['id_personne', 'id_bank', 'bank_account_number', 'bank_account_country'];

    public function personne()
    {
        return $this->belongsTo(Personne::class);
    }

    public function bank()
    {
        return $this->belongsTo(Bank::class);
    }
}
