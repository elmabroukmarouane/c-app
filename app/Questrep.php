<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Questrep extends Model
{
    protected $table = 'questreps';
    protected $primaryKey = 'id';
    protected $fillable = ['user_id', 'question_id', 'reponse'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function question()
    {
        return $this->belongsTo(Question::class);
    }
}
