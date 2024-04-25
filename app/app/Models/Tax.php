<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tax extends Model
{
    use HasFactory;

    protected $table = "tbl_tax";

    protected $fillable = [
        "TaxID",
        "TaxName",
        "TaxPercentage",
        "DFlag",
        "ActiveStatus",
        "CreatedBy",
        "UpdatedBy",
        "DeletedBy",
        "CreatedOn",
        "UpdatedOn",
        "DeletedOn",
    ];
}
