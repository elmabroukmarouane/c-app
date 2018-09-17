<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id_personne', 'email', 'password', 'online', 'active_security_questions',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function userlogs()
    {
        return $this->hasMany(Userlog::class);
    }

    public function personne()
    {
        return $this->belongsTo(Personne::class);
    }
}
