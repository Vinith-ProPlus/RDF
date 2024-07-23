<?php

namespace App\Http\Controllers;

use App\helper\helper;
use App\Models\BusyIntegration;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\DB;
use Saloon\XmlWrangler\XmlReader;
use SimpleXMLElement;
use Yajra\DataTables\Facades\DataTables;

class Controller extends BaseController
{
    private $generalDB;
    public function __construct()
    {
        $this->generalDB = Helper::getGeneralDB();
    }
    use AuthorizesRequests, ValidatesRequests;

    public function order_confirmation_mail()
    {
        $OrderID = Order::OrderBy('OrderID', 'desc')->first()->pluck('OrderID')->first();
        $orderDetails = Order::with('orderDetails')
            ->where('OrderID', $OrderID)
            ->get();
        $orderDetails->transform(function ($order) {
            if ($order->orderDetails) {
                $order->orderDetails->transform(function ($detail) {
                    $detail->PRate = Helper::formatAmount($detail->PRate);
                    $detail->SRate = Helper::formatAmount($detail->SRate);
                    $detail->Amount = Helper::formatAmount($detail->Amount);
                    return $detail;
                });
            }
            $order->SubTotal = Helper::formatAmount(($order->SubTotal));
            $order->DiscountAmount = Helper::formatAmount($order->DiscountAmount);
            $order->ShippingCharge = Helper::formatAmount($order->ShippingCharge);
            $order->TotalAmountInString = Helper::formatAmount($order->TotalAmount);
            $order->OrderDate = Carbon::parse($order->OrderDate)->format('d/m/Y');
            return $order;
        });
        if(count($orderDetails) > 0){
            $orderDetails = $orderDetails[0];
        }
        $companyDetails = collect(DB::Table('tbl_company_settings')->pluck( 'KeyValue', 'KeyName'));
        if (empty($companyDetails['Logo'])) {
            $logo = config('app.url') . '/' . 'assets/images/no-image-b.png';
        } else {
            $logo = config('app.url') . '/' . $companyDetails['Logo'];
        }

        $stateID = $companyDetails->get('StateID');
        $cityID = $companyDetails->get('CityID');
        $districtID = $companyDetails->get('DistrictID');
        $postalCodeID = $companyDetails->get('PostalCodeID');

        $locationDetails = DB::table($this->generalDB.'tbl_states as S')
            ->join($this->generalDB.'tbl_cities as CI', 'CI.StateID', '=', 'S.StateID')
            ->join($this->generalDB.'tbl_districts as D', 'D.StateID', '=', 'S.StateID')
            ->join($this->generalDB.'tbl_postalcodes as PC', 'PC.PID', '=', 'CI.PostalID')
            ->select(
                'S.StateName',
                'CI.CityName',
                'D.DistrictName',
                'PC.PostalCode'
            )
            ->where('S.StateID', $stateID)
            ->where('CI.CityID', $cityID)
            ->where('D.DistrictID', $districtID)
            ->where('PC.PID', $postalCodeID)
            ->first();

        return view('order_confirmation', compact('orderDetails', 'companyDetails', 'locationDetails', 'logo'));
//        Mail::to($order->email)->send(new OrderMail($details, $pdf));
    }
    public function order_shipment_mail()
    {
        $OrderID = Order::OrderBy('OrderID', 'desc')->first()->pluck('OrderID')->first();
        $orderDetails = Order::with('orderDetails')
            ->where('OrderID', $OrderID)
            ->get();
        $orderDetails->transform(function ($order) {
            if ($order->orderDetails) {
                $order->orderDetails->transform(function ($detail) {
                    $detail->PRate = Helper::formatAmount($detail->PRate);
                    $detail->SRate = Helper::formatAmount($detail->SRate);
                    $detail->Amount = Helper::formatAmount($detail->Amount);
                    return $detail;
                });
            }
            $order->SubTotal = Helper::formatAmount(($order->SubTotal));
            $order->DiscountAmount = Helper::formatAmount($order->DiscountAmount);
            $order->ShippingCharge = Helper::formatAmount($order->ShippingCharge);
            $order->TotalAmountInString = Helper::formatAmount($order->TotalAmount);
            $order->OrderDate = Carbon::parse($order->OrderDate)->format('d/m/Y');
            return $order;
        });
        if(count($orderDetails) > 0){
            $orderDetails = $orderDetails[0];
        }
        $companyDetails = collect(DB::Table('tbl_company_settings')->pluck( 'KeyValue', 'KeyName'));
        if (empty($companyDetails['Logo'])) {
            $logo = config('app.url') . '/' . 'assets/images/no-image-b.png';
        } else {
            $logo = config('app.url') . '/' . $companyDetails['Logo'];
        }

        $stateID = $companyDetails->get('StateID');
        $cityID = $companyDetails->get('CityID');
        $districtID = $companyDetails->get('DistrictID');
        $postalCodeID = $companyDetails->get('PostalCodeID');

        $locationDetails = DB::table($this->generalDB.'tbl_states as S')
            ->join($this->generalDB.'tbl_cities as CI', 'CI.StateID', '=', 'S.StateID')
            ->join($this->generalDB.'tbl_districts as D', 'D.StateID', '=', 'S.StateID')
            ->join($this->generalDB.'tbl_postalcodes as PC', 'PC.PID', '=', 'CI.PostalID')
            ->select(
                'S.StateName',
                'CI.CityName',
                'D.DistrictName',
                'PC.PostalCode'
            )
            ->where('S.StateID', $stateID)
            ->where('CI.CityID', $cityID)
            ->where('D.DistrictID', $districtID)
            ->where('PC.PID', $postalCodeID)
            ->first();

        return view('order_shipment', compact('orderDetails', 'companyDetails', 'locationDetails', 'logo'));
//        Mail::to($order->email)->send(new OrderMail($details, $pdf));
    }

    public function BusyTableView(Request $request){
        libxml_use_internal_errors(true);
        $data = BusyIntegration::runCustomQuery("SELECT TOP $request->length t.vchCode, t.vchno, t.Date, t.VchSalePurcAmt, m.name FROM tran1 AS t INNER JOIN master1 AS m ON t.MasterCode1 = m.code WHERE t.vchtype = 9 ORDER BY t.vchCode DESC");
        $maxRetries = 3;
        $retryCount = 0;
        while (empty($data) && $retryCount < $maxRetries) {
            $data = BusyIntegration::runCustomQuery("SELECT TOP $request->length t.vchCode, t.vchno, t.Date, t.VchSalePurcAmt, m.name FROM tran1 AS t INNER JOIN master1 AS m ON t.MasterCode1 = m.code WHERE t.vchtype = 9 ORDER BY t.vchCode DESC");
            if (empty($data)) {
                usleep(5000);
                logger($retryCount);
                $retryCount++;
            }
        }

        if (empty($data)) {
            $data = '<?xml version="1.0" encoding="UTF-8"?><root></root>';
        }

        if (!mb_check_encoding($data, 'UTF-8')) {
            $data = mb_convert_encoding($data, 'UTF-8');
        }
        $reader = XmlReader::fromString($data);
        $elements = $reader->element('z:row')->get();
        $data = [];
        foreach ($elements as $element) {
            $object = new \stdClass();
            $object->id = (int) $element->getAttribute('vchCode');
            $object->vchno = trim((string) $element->getAttribute('vchno'));
            $object->name = trim((string) $element->getAttribute('name'));
            $object->Date = Carbon::parse($element->getAttribute('Date'))->format('d-M-Y');
            $object->VchSalePurcAmt = (float) $element->getAttribute('VchSalePurcAmt');
            $data[] = $object;
        }

        return DataTables::of($data)
            ->addColumn('action', function ($data) {
                $button = '<div class="d-flex justify-content-center">';
                $button .= '<a href="'. route("admin.busy.show", $data->id) . '" class="btn btn-outline-primary btn-sm">
                                <i class="fa fa-eye"></i></i></a></div>';
                return $button;
            })
            ->rawColumns(['action'])
            ->make(true);
    }
}
