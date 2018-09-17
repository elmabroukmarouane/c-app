<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ontrading extends Model
{
    protected $table = 'ontradings';
    protected $primaryKey = 'id';
    protected $fillable = ['id_personne', 'id_abonnement', 'type_payment', 'id_payment', 'type_get_paid', 'id_get_paid', 'periode', 'total_profit', 'paid', 'finished', 'active'];

    public function personne()
    {
        return $this->belongsTo(Personne::class);
    }

    public function abonnement()
    {
        return $this->belongsTo(Abonnement::class);
    }
}
