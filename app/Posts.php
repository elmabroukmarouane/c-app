<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Posts extends Model
{
    protected $table = 'posts';
    protected $primaryKey = 'id';
    protected $fillable = ['title', 'detail'];
}
