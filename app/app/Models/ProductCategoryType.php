<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductCategoryType extends Model
{
    use HasFactory;

    protected $connection = "rdf_main";
    protected $table = "tbl_product_category_type";

    protected $fillable = [
        "PCTID",
        "PCTName",
        "PCTImage",
        "Images",
        "ActiveStatus",
        "DFlag",
        "CreatedBy",
        "UpdatedBy",
        "DeletedBy",
        "CreatedOn",
        "UpdatedOn",
        "DeletedOn",
        "AdditionalSetting"
    ];
}
