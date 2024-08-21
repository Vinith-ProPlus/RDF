<?php

namespace App\Http\Controllers\web\masters\product;

use App\enums\activeMenuNames;
use App\helper\helper;
use App\Http\Controllers\Controller;
use App\Models\DeliveryChargeRule;
use App\Models\general;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DeliveryChargeRuleController extends Controller
{
    private $general;
    private $UserID;
    private $ReferID;
    private $ActiveMenuName;
    private $PageTitle;
    private $CRUD;
    private $Settings;
    private $FileTypes;
    private $Menus;

    public function __construct()
    {
        $this->ActiveMenuName = activeMenuNames::Coupon->value;
        $this->PageTitle = "Delivery Charge Rule";
        $this->middleware('auth');
        $this->FileTypes = Helper::getFileTypes(array("category" => array("Images")));
        $this->middleware(function ($request, $next) {
            $this->UserID = auth()->user()->UserID;
            $this->ReferID = auth()->user()->ReferID;
            $this->general = new general($this->UserID, $this->ActiveMenuName);
            $this->Menus = $this->general->loadMenu();
            $this->CRUD = $this->general->getCrudOperations($this->ActiveMenuName);
            $this->Settings = $this->general->getSettings();
            return $next($request);
        });
    }

    public function index()
    {
        $FormData = $this->general->UserInfo;
        $FormData['menus'] = $this->Menus;
        $FormData['crud'] = $this->CRUD;
        $FormData['ActiveMenuName'] = $this->ActiveMenuName;
        $FormData['PageTitle'] = $this->PageTitle;
        $rules = DeliveryChargeRule::all();
        return view('app.master.product.delivery_charge_rules.index', $FormData, compact('rules'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'min_order_value' => 'required|numeric|min:0',
            'max_order_value' => 'required|numeric|gt:min_order_value',
            'delivery_charge' => 'required|numeric|min:0',
        ]);

        DB::beginTransaction();
        try {
            DeliveryChargeRule::create($request->all());
            DB::commit();
            return redirect()->route('delivery-charge-rules.index')->with('success', 'Rule added successfully.');
        } catch (\Exception $e) {
            logger("Error in DeliveryChargeRuleController@store: " . $e->getMessage());
            DB::rollback();
            return redirect()->route('delivery-charge-rules.index')->with('error', 'An error occurred: ' . $e->getMessage());
        }
    }
}
