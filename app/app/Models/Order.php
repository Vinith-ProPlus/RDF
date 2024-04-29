<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $connection = "rdf_main";
    protected $table = "tbl_order";
    protected $primaryKey = 'OrderID';
    public $incrementing = false;
    const CREATED_AT = 'CreatedOn';
    const UPDATED_AT = 'UpdatedOn';


    protected $appends = ['productCount'];

    protected $fillable = [
        "OrderID",
        "OrderNo",
        "CustomerName",
        "MobileNo1",
        "Email",
        "Address",
        "State",
        "District",
        "City",
        "PostalCode",
        "CompleteAddress",
        "Status",
        "OrderDate",
        "SubTotal",
        "DiscountType",
        "DiscountPer",
        "DiscountAmount",
        "ShippingCharge",
        "TotalAmount",
        "PaymentID",
        "DFlag",
        "CreatedOn",
        "CreatedBy",
        "UpdatedOn",
        "UpdatedBy",
        "DeletedOn",
        "DeletedBy",
    ];

    public function orderDetails()
    {
        return $this->hasMany(OrderDetail::class,'OrderID','OrderID');
    }

    public function getproductCountAttribute(){
        return OrderDetail::where('OrderID', $this->OrderID)->count();
    }
}
