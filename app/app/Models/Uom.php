<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Uom extends Model
{
    use HasFactory;

    protected $table = "tbl_uom";

    protected $fillable = [
        "UID",
        "UCode",
        "UName",
        "UNameInTranslation",
        "DFlag",
        "ActiveStatus",
        "CreatedBy",
        "UpdatedBy",
        "DeletedBy",
        "CreatedOn",
        "UpdatedOn",
        "DeletedOn"
    ];
}
