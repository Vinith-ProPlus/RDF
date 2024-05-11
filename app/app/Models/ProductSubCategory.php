<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductSubCategory extends Model
{
    use HasFactory;

    protected $table = "tbl_product_subcategory";

    protected $fillable = [
        "PSCID",
        "PCID",
        "PSCName",
        "PSCNameInTranslation",
        "PSCImage",
        "VideoURLs",
        "Images",
        "ActiveStatus",
        "DFlag",
        "CreatedBy",
        "UpdatedBy",
        "DeletedBy",
        "CreatedOn",
        "UpdatedOn",
        "DeletedOn",
        "AdditionalSetting",
    ];
}
