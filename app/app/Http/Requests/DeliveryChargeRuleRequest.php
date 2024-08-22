<?php

namespace App\Http\Requests;

use App\Models\DeliveryChargeRule;
use Illuminate\Foundation\Http\FormRequest;

class DeliveryChargeRuleRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $deliveryChargeRule = $this->route('delivery_charge_rule');
        $deliveryChargeRuleId = $deliveryChargeRule ? $deliveryChargeRule->id : null;

        return [
            'min_order_value' => [
                'required',
                'numeric',
                'min:0',
                function ($attribute, $value, $fail) use ($deliveryChargeRuleId) {
                    $exists = DeliveryChargeRule::where(function ($query) use ($value, $deliveryChargeRuleId) {
                        $query->where('min_order_value', '<=', $value)
                            ->where('max_order_value', '>=', $value)
                            ->where('id', '!=', $deliveryChargeRuleId);
                    })
                        ->exists();
                    if ($exists) {
                        $fail('The minimum order value conflicts with an existing rule.');
                    }
                }
            ],
            'max_order_value' => [
                'required',
                'numeric',
                'gt:min_order_value',
                function ($attribute, $value, $fail) use ($deliveryChargeRuleId) {
                    $exists = DeliveryChargeRule::where(function ($query) use ($value, $deliveryChargeRuleId) {
                        $query->where('min_order_value', '<=', $value)
                            ->where('max_order_value', '>=', $value)
                            ->where('id', '!=', $deliveryChargeRuleId);
                    })
                        ->exists();
                    if ($exists) {
                        $fail('The maximum order value conflicts with an existing rule.');
                    }
                }
            ],
            'delivery_charge' => [
                'required',
                'numeric',
                'min:0'
            ]
        ];
    }

    /**
     * Get custom error messages for validation.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'min_order_value.required' => 'Minimum order value is required.',
            'min_order_value.numeric' => 'Minimum order value must be a number.',
            'max_order_value.required' => 'Maximum order value is required.',
            'max_order_value.numeric' => 'Maximum order value must be a number.',
            'max_order_value.gt' => 'Maximum order value must be greater than minimum order value.',
            'delivery_charge.required' => 'Delivery charge is required.',
            'delivery_charge.numeric' => 'Delivery charge must be a number.',
        ];
    }
}
