<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Packabonnementplatform extends Model
{
    protected $table = 'packabonnementplatforms';
    protected $primaryKey = 'id';
    protected $fillable = ['nom_pack_abonnement_platform', 'prix_ut'];
}
