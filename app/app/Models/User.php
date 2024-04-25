<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = "users";

    const UPDATED_AT = 'UpdatedOn';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        "UserID",
        "ReferID",
        "Name",
        "FirstName",
        "LastName",
        "DOB",
        "DOJ",
        "GenderID",
        "Address",
        "CountryID",
        "StateID",
        "DistrictID",
        "TalukID",
        "CityID",
        "PostalCodeID",
        "UserName",
        "RoleID",
        "LoginType",
        "EMail",
        "MobileNumber",
        "ProfileImage",
        "ActiveStatus",
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function gender()
    {
        return $this->hasOne(Gender::class,'GID','GenderID');
    }
    public function user_role()
    {
        return $this->hasOne(UserRole::class,'RoleID','RoleID');
    }
}
