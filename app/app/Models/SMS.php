<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SMS extends Model
{
    use HasFactory;

    /**
     * @param $mobileNumber
     * @param $message
     * @return array
     * @throws \JsonException
     */
    public function sendOTP($mobileNumber, $message): array
    {
        $apiKey = config('app.SMS_API_KEY');
        $sender = config('app.SMS_SENDER_NAME');

        $payload = [
            'apikey'   => $apiKey,
            'route'    => 'transactional',
            'sender'   => $sender,
            'mobileno' => $mobileNumber,
            'text'     => $message,
        ];

        $ch = curl_init('https://www.smsalert.co.in/api/push.json');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($payload));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);
        curl_setopt($ch, CURLOPT_USERAGENT, 'RoyalDryFruitsApp/1.0');

        $response = curl_exec($ch);
        curl_close($ch);

        $responseData = json_decode($response, true, 512, JSON_THROW_ON_ERROR);

        if ($responseData['status'] === 'success') {
            $deliveryStatus = $responseData['description']['batch_dtl'][0]['status'] ?? 'UNKNOWN';
            return [
                'status'  => true,
                'message' => 'OTP Sent Successfully',
                'msgid'   => $responseData['description']['batch_dtl'][0]['msgid'] ?? null,
                'dlr_status' => $deliveryStatus,
                'raw_response' => $responseData,
            ];
        }

        return [
            'status' => false,
            'message' => 'OTP Send Failed',
            'error' => $responseData['description'] ?? 'Unknown error',
            'raw_response' => $responseData,
        ];
    }
}
