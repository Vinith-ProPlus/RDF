<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    use HasFactory;

    protected $table = "tbl_brands";

    protected $fillable = [
        "BrandID",
        "BrandName",
        "BrandLogo",
        "Images",
        "ActiveStatus",
        "DFlag",
        "CreatedBy",
        "UpdatedBy",
        "DeletedBy",
        "CreatedOn",
        "UpdatedOn",
        "DeletedOn",
    ];
}
