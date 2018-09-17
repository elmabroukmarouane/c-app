<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pvbalancepersonne extends Model
{
    protected $table = 'pvbalancepersonnes';
    protected $primaryKey = 'id';
    protected $fillable = ['id_personne', 'id_balance_affiliation', 'type_payment', 'montant_pvbalancepersonne', 'status_pvbalancepersonne'];

    public function personne()
    {
        return $this->belongsTo('App\Personne');
    }

    public function balanceaffiliation()
    {
        return $this->belongsTo('App\Balanceaffiliation');
    }
}
