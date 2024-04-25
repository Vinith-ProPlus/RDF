<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    use HasFactory;

    protected $table = "tbl_product_category";

    protected $fillable = [
        "PCID",
        "PCName",
        "PCImage",
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
