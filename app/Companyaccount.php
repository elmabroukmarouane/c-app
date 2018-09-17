<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Companyaccount extends Model
{
    protected $table = 'companyaccounts';
    protected $primaryKey = 'id';
    protected $fillable = ['id_bank', 'bank_account_number', 'bank_account_country'];

    public function bank()
    {
        return $this->belongsTo(Bank::class);
    }
}
