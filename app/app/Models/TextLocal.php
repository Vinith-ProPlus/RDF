<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TextLocal extends Model
{
    use HasFactory;

    public function sendOTP($mobileNumber, $message)
    {
        $data = ['apikey' => urlencode(config('app.TEXT_LOCAL_API_KEY')),
                'numbers' => [$mobileNumber],
                'sender' => urlencode(config('app.TEXT_LOCAL_SENDER_NAME')),
                'message' => rawurlencode($message)
        ];

        $ch = curl_init('https://api.textlocal.in/send/');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        $response = curl_exec($ch);
        info($response);
        $err = curl_error($ch);
        info($err);

        curl_close($ch);

        if ($err) {
            return array('error' => 1);
        } else {
            return array('error' => 0);
        }
    }
}
