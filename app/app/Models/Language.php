<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Language extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'name_in_english',
        'code',
        'status',
    ];

    public function scopeActive($query)
    {
        return $query->whereStatus('Active');
    }
}
