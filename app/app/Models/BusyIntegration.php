<?php

namespace App\Models;

use App\helper\helper;
use DOMDocument;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class BusyIntegration extends Model
{
    use HasFactory;

    public static function isBusyHostActive()
    {
        $curl = curl_init();
        $busy_username = config('app.BUSY_USERNAME');
        $busy_password = config('app.BUSY_PASSWORD');
        curl_setopt_array($curl, [
            CURLOPT_URL => config('app.BUSY_URL'),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 10,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_HTTPHEADER => [
                'SC: 1',
                "Qry: select top 1 vchCode from tran1 where vchtype=9 order by vchCode desc",
                "UserName: $busy_username",
                "Pwd: $busy_password"
            ],
        ]);
        $response = curl_exec($curl);
        $code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        $error = curl_error($curl);
        curl_close($curl);
        if ($error) {
            \Log::error("CURL Error: $error");
        } else {
            \Log::info("CURL Response: $response");
        }
        return ($response !== false && $code >= 200 && $code < 400);
    }


    public static function runCustomQuery($query): bool|string
    {
        if (self::isBusyHostActive()) {
            $busy_username = config('app.BUSY_USERNAME');
            $busy_password = config('app.BUSY_PASSWORD');
            $curl = curl_init();
            curl_setopt_array($curl, [
                CURLOPT_URL => config('app.BUSY_URL'),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 10,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_HTTPHEADER => [
                    'SC: 1',
                    "Qry: $query",
                    "UserName: $busy_username",
                    "Pwd: $busy_password"
                ],
            ]);
            $response = curl_exec($curl);
            $error = curl_error($curl);
            curl_close($curl);
            if ($error) {
                \Log::error("CURL Error: $error");
            } else {
                \Log::info("CURL Response: $response");
            }
            return $response;
        } else {
            return "";
        }
    }

    public static function getSingleSale($BusyID)
    {
        if (self::isBusyHostActive()) {
            $busy_username = config('app.BUSY_USERNAME');
            $busy_password = config('app.BUSY_PASSWORD');
            $curl = curl_init();
            curl_setopt_array($curl, [
                CURLOPT_URL => config('app.BUSY_URL'),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_HTTPHEADER => [
                    "SC: 8",
                    "UserName: $busy_username",
                    "Pwd: $busy_password",
                    "vchCode: $BusyID"
                ],
            ]);
            $response = curl_exec($curl);
            curl_close($curl);
            return $response;
        } else {
            return '';
        }
    }

    public static function getVouchersList()
    {
        $busy_username = config('app.BUSY_USERNAME');
        $busy_password = config('app.BUSY_PASSWORD');
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_URL => config('app.BUSY_URL'),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_HTTPHEADER => [
                'SC: 1',
                'Qry: SELECT TOP 1 vchcode, vchno FROM tran1 WHERE vchtype = 9 order by vchcode desc;',
                "UserName: $busy_username",
                "Pwd: $busy_password"
            ],
        ]);
        $response = curl_exec($curl);
        curl_close($curl);
        return $response;
    }

    public static function minifyXml($xml)
    {
        $dom = new DOMDocument();
        $dom->preserveWhiteSpace = false;
        $dom->formatOutput = false;
        $dom->loadXML($xml);
        return $dom->saveXML($dom->documentElement);
    }

    public static function composeOrderXml($order)
    {
        if ($order) {
            $xml = '<Sale>';
            $xml .= '<VchSeriesName>Main</VchSeriesName>';
            $xml .= '<Date>' . date('d-m-Y', strtotime($order->OrderDate)) . '</Date>'; // Format the date as needed
            $xml .= '<VchType>9</VchType>';
            $xml .= '<StockUpdationDate>' . date('d-m-Y', strtotime($order->OrderDate)) . '</StockUpdationDate>'; // Same date as OrderDate for simplicity
            $xml .= '<STPTName>Local-Exempt</STPTName>';
            $xml .= '<MasterName1>' . $order->CustomerName . ' - ' . $order->MobileNo1 . '</MasterName1>';
            $xml .= '<MasterName2>Main Store</MasterName2><TranCurName>Rs.</TranCurName><InputType>1</InputType>';
//            $xml .= '<BillingDetails><PartyName>'. $order->CustomerName .'</PartyName><Address1>'. $order->CompleteAddress .'</Address1></BillingDetails>';
            $xml .= '<BillingDetails><PartyName>' . $order->CustomerName . ' - ' . $order->MobileNo1 . '</PartyName><Address1>' . $order->Address . '</Address1>';
            $xml .= '<Address2>' . $order->City . ', ' . $order->District . ',</Address2><Address3>' . $order->State . ' - ' . $order->PostalCode . '</Address3>';
            $xml .= '<tmpStateName>' . $order->State . '</tmpStateName><tmpAreaName>' . $order->District . '</tmpAreaName><tmpPINCode>' . $order->PostalCode . '</tmpPINCode></BillingDetails>';
            $xml .= '<ItemEntries>';


            // Loop through order details
            foreach ($order->orderDetails as $index => $detail) {
                $xml .= '<ItemDetail>';
                $xml .= '<Date>' . date('d-m-Y', strtotime($detail->CreatedOn)) . '</Date>';
                $xml .= '<VchType>9</VchType>';
                $xml .= '<SrNo>' . ($index + 1) . '</SrNo>';
                $xml .= '<ItemName>' . htmlspecialchars($detail->ProductName) . ' - ' . ($detail->unit ?? '') . '</ItemName>';
                $xml .= '<UnitName>' . $detail->unit . '</UnitName><ConFactor>1</ConFactor>';
                $xml .= '<Qty>' . $detail->Qty . '</Qty>';
                $xml .= '<Price>' . $detail->SRate . '</Price>';
                $xml .= '<ListPrice>' . $detail->PRate . '</ListPrice>';
                $xml .= '<Amt>' . $detail->Amount . '</Amt>';
                $xml .= '<NettAmount>' . $detail->Amount . '</NettAmount>';
                $xml .= '<MC>Main Store</MC>';
                $xml .= '<ItemSerialNoEntries/><ParamStockEntries/><BatchEntries/><RecType>2</RecType></ItemDetail>';
            }

            $xml .= '</ItemEntries>';

            // Add BillSundries section
            $xml .= '<BillSundries><BSDetail><SrNo>1</SrNo>';
            $xml .= '<BSName>Discount</BSName>';
            $xml .= '<Amt>' . $order->DiscountAmount . '</Amt>';
            $xml .= '<Date>' . date('d-m-Y', strtotime($order->OrderDate)) . '</Date>';
            $xml .= '<VchType>9</VchType></BSDetail>';

            $xml .= '<BSDetail><SrNo>2</SrNo><BSName>Shipping Charge</BSName>';
            $xml .= '<Amt>' . $order->ShippingCharge . '</Amt>';
            $xml .= '<Date>' . date('d-m-Y', strtotime($order->OrderDate)) . '</Date>';
            $xml .= '<VchType>9</VchType></BSDetail></BillSundries>';

            $xml .= '<POSVchData><CarrySettlement>True</CarrySettlement></POSVchData></Sale>';
            return self::minifyXml($xml);
        } else {
            return "";
        }
    }

    public static function createAccountXml($order)
    {
        if ($order) {
            $busy_username = config('app.BUSY_USERNAME');
            $busy_password = config('app.BUSY_PASSWORD');
            $xml = '<Account><Name>' . $order->CustomerName . ' - ' . $order->MobileNo1 . '</Name><PrintName>' . $order->CustomerName . ' - ' . $order->MobileNo1 . '</PrintName>';
            $xml .= '<ParentGroup>Sundry Debtors</ParentGroup><Address><Address1>' . $order->Address . '</Address1>';
            $xml .= '<Address2>' . $order->City . ', ' . $order->District . ',</Address2>';
            $xml .= '<Address3>' . $order->State . ' - ' . $order->PostalCode . '</Address3><OF/><StateName>' . $order->State . '</StateName>';
            $xml .= '<AreaName>' . $order->District . '</AreaName><PINCode>' . $order->PostalCode . '</PINCode></Address></Account>';
            $curl = curl_init();
            curl_setopt_array($curl, [
                CURLOPT_URL => config('app.BUSY_URL'),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 5,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_HTTPHEADER => [
                    'SC: 5',
                    "UserName: $busy_username",
                    "Pwd: $busy_password",
                    'MasterType: 2',
                    "MasterXml: $xml"
                ],
            ]);
            curl_exec($curl);
            curl_close($curl);
        }
    }

    // select top 1 vchno from tran1 where vchtype=9 order by date desc
    // select top 1 vchCode, vchno from tran1 where vchtype=9 order by vchCode desc
    public static function pushSaleVoucher($OrderID)
    {
        if (self::isBusyHostActive()) {
            $busy_username = config('app.BUSY_USERNAME');
            $busy_password = config('app.BUSY_PASSWORD');
            $order = Order::with('orderDetails')->where('OrderID', $OrderID)->first();
            $order->CustomerName = Helper::translate($order->CustomerName, 'en');
            $order->City = Helper::translate($order->City, 'en');
            $order->District = Helper::translate($order->District, 'en');
            $order->State = Helper::translate($order->State, 'en');
            if ($order->orderDetails) {
                $order->orderDetails->transform(function ($detail) {
                    if ($detail->ProductVariationID) {
                        $productUnit = DB::table('tbl_products_variation')
                            ->where('tbl_products_variation.ProductID', $detail->ProductID)
                            ->where('tbl_products_variation.VariationID', $detail->ProductVariationID)
                            ->leftJoin('tbl_products_variation_details as D', function ($join) {
                                $join->on('tbl_products_variation.VariationID', '=', 'D.VariationID');
                            })
                            ->leftJoin('tbl_attributes_details as AD', function ($join) {
                                $join->on('AD.ValueID', '=', 'D.AttributeValueID')
                                    ->on('AD.AttrID', '=', 'D.AttributeID');
                            })
                            ->leftJoin('tbl_attributes as A', 'A.AttrID', '=', 'AD.AttrID')
                            ->select('AD.Values')
                            ->first();
                    } else {
                        $productUnit = DB::table('tbl_products')
                            ->where('tbl_products.ProductID', $detail->ProductID)
                            ->leftJoin('tbl_uom as U', 'U.UID', '=', 'tbl_products.UID')
                            ->select('U.UName')
                            ->first();
                    }
                    $productUnit = $productUnit->Values ?? $productUnit->UName ?? '-';
                    $detail->unit = $productUnit;
                    return $detail;
                });
            }
            self::createAccountXml($order);
            $xml = self::composeOrderXml($order);
            $minified_xml = self::minifyXml($xml);
            $curl = curl_init();
            curl_setopt_array($curl, [
                CURLOPT_URL => config('app.BUSY_URL'),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_HTTPHEADER => [
                    'SC: 2',
                    "UserName: $busy_username",
                    "Pwd: $busy_password",
                    'vchtype: 9',
                    "vchXml: $minified_xml"
                ],
            ]);
            $response = curl_exec($curl);
            curl_close($curl);
            if (($response !== "") && ($response !== false)) {
                $order->update(['BusySaleID' => $response]);
            }
        }
    }
}
