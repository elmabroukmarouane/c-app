<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Personne extends Model
{
    protected $table = 'personnes';
    protected $primaryKey = 'id';
    protected $fillable = ['id_tpersonne', 'id_statuscompte', 'nom', 'prenom', 'date_naissance', 'telephone', 'adresse', 'pays', 'ville', 'zipcode', 'image'];

    public function tpersonne()
    {
        return $this->belongsTo(Tpersonne::class);
    }

    public function statuscompte()
    {
        return $this->belongsTo(Statuscompte::class);
    }

    public function membres()
    {
        return $this->hasMany(Membre::class);
    }

    public function users()
    {
        return $this->hasMany(User::class);
    }

    public function niveau1s()
    {
        return $this->hasMany(Niveau1::class);
    }
}
