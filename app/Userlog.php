<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Userlog extends Model {

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'userlogs';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    protected $fillable = ['user_id', 'activite', 'ip_address', 'status_class'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

}
