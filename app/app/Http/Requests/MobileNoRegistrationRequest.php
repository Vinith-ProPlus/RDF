<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MobileNoRegistrationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'mobile_no' => 'required|integer|digits:10|unique:tbl_customer,MobileNo1'
        ];
    }

    public function attributes()
    {
        return [
            'mobile_no' => 'Mobile No',
        ];
    }
}
