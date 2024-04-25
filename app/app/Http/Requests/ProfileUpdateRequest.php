<?php

namespace App\Http\Requests;

use App\Models\User;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ProfileUpdateRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
//            'name' => ['string', 'max:255'],
//            'email' => ['email', 'max:255', Rule::unique(User::class)->ignore($this->user()->id)],

            'Name' => 'required|string|min:2|max:100',
        'FirstName' => 'required|string|min:2|max:100',
        'LastName' => 'required|string|min:2|max:100',
        'MobileNumber' => 'required|integer',
        'DOB' => 'required|date',
        'DOJ' => 'nullable|date',
        'EMail' => ['email', 'max:255', Rule::unique(User::class)->ignore($this->user()->id)],
        'GenderID' => 'required|string',
        'Address' => 'required|string',
        'PostalCodeID' => 'required|string',
        'CityID' => 'required|string',
        'TalukID' => 'required|string',
        'DistrictID' => 'required|string',
        'StateID' => 'required|string',
        'CountryID' => 'required|string',
        'removeProfileImage' => 'nullable',
        ];
    }
}
