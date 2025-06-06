<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $table = "tbl_products";
    protected $primaryKey = 'ProductID';
    public $timestamps = false;

    protected $fillable = [
        "ProductID",
        "Slug",
        "ProductName",
        "ProductType",
        "ProductCode",
        "Stages",
        "VideoURL",
        "ProductBrochure",
        "HSNSAC",
        "CID",
        "SCID",
        "UID",
        "TaxType",
        "TaxID",
        "PRate",
        "SRate",
        "Decimals",
        "Description",
        "ShortDescription",
        "Attributes",
        "ProductImage",
        "Images",
        "ActiveStatus",
        "DFlag",
        "CreatedOn",
        "CreatedBy",
        "UpdatedOn",
        "UpdatedBy",
        "DeletedOn",
        "DeletedBy",
    ];

    public function uom()
    {
        return $this->belongsTo(UOM::class, 'UID', 'UID');
    }
}
