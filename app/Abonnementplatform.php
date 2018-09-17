<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Abonnementplatform extends Model
{
    protected $table = 'abonnementplatforms';
    protected $primaryKey = 'id';
    protected $fillable = ['id_personne', 'id_packabonnementplatform', 'type_payment', 'id_payment', 'periode', 'total_pay', 'paid', 'finished'];

    public function personne()
    {
        return $this->belongsTo(Personne::class);
    }

    public function abonnementplatform()
    {
        return $this->belongsTo(Abonnementplatform::class);
    }
}
