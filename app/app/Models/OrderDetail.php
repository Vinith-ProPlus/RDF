<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class OrderDetail extends Model
{
    use HasFactory;

    protected $connection = "rdf_main";
    protected $table = "tbl_order_details";
    protected $primaryKey = 'DetailID';
    public $incrementing = false;
    const CREATED_AT = 'CreatedOn';
    const UPDATED_AT = 'UpdatedOn';

    protected $appends = ['productImageUrl'];

    protected $fillable = [
        "DetailID",
        "OrderID",
        "CTID",
        "CID",
        "SCID",
        "ProductID",
        "ProductName",
        "ProductVariationID",
        "Qty",
        "PRate",
        "SRate",
        "UOMID",
        "Amount",
        "CreatedOn",
        "CreatedBy",
        "UpdatedOn",
        "UpdatedBy"
    ];

    public function getproductImageUrlAttribute()
    {
        if ($this->product_variation_id) {
            $image = DB::table('tbl_products_variation')
                ->where('VariationID', $this->product_variation_id)
                ->pluck('VImage')
                ->first();
        } else {
            $image = DB::table('tbl_products')
                ->where('ProductID', $this->ProductID)
                ->pluck('ProductImage')
                ->first();
        }
        if (!$image) {
            $image = config('app.url') . '/' . 'assets/images/no-image-b.png';
        } else {
            $image = config('app.url') . '/' . $image;
        }
        return $image;
    }
}
