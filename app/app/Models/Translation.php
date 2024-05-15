<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Translation extends Model
{
    use HasFactory;

    protected $fillable = [
//        'module',
        'language_id',
        'value',
//        'need_editor'
    ];

    public function languageDetails()
    {
        return $this->hasOne(Language::class, 'id', 'language_id');
    }
}
