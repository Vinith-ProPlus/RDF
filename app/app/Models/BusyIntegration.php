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

    function isBusyHostActive()
    {
        $ch = curl_init(getenv("BUSY_URL"));
        curl_setopt_array($ch, [CURLOPT_NOBODY => true, CURLOPT_TIMEOUT => 5]);
        if(curl_exec($ch) && ($code = curl_getinfo($ch, CURLINFO_HTTP_CODE)) >= 200 && $code < 400) {
            $q = "SELECT TOP 1 vchno FROM tran1 WHERE vchtype = 9;";
            $response = $this->runCustomQuery($q);
            return (($response !== "") && ($response !== false));
        } else {
            return false;
        }
    }

    function runCustomQuery($query): bool|string
    {
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_URL => getenv("BUSY_URL"),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_HTTPHEADER => [
                'SC: 1',
                "Qry: $query",
                'UserName: a',
                'Pwd: a'
            ],
        ]);
        $response = curl_exec($curl);
        curl_close($curl);
        return $response;
    }

    function getVouchersList()
    {
        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_URL => getenv("BUSY_URL"),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_HTTPHEADER => [
                'SC: 1',
                'Qry: SELECT TOP 1 vchcode, vchno FROM tran1 WHERE vchtype = 9;',
//                'Qry: select vchno from tran1 where vchtype=9 order by date desc',
                'UserName: a',
                'Pwd: a'
            ],
        ]);
        $response = curl_exec($curl);
        curl_close($curl);
        return $response;
    }

    function minifyXml($xml) {
        $dom = new DOMDocument();
        $dom->preserveWhiteSpace = false;
        $dom->formatOutput = false;
        $dom->loadXML($xml);
        return $dom->saveXML($dom->documentElement);
    }

    function composeOrderXml($order)
    {
        if ($order) {
            // Start composing the XML
            $xml = '<Sale>';
            $xml .= '<VchSeriesName>Main</VchSeriesName>';
            $xml .= '<Date>' . date('d-m-Y', strtotime($order->OrderDate)) . '</Date>'; // Format the date as needed
            $xml .= '<VchType>9</VchType>';
            $xml .= '<StockUpdationDate>' . date('d-m-Y', strtotime($order->OrderDate)) . '</StockUpdationDate>'; // Same date as OrderDate for simplicity
            $xml .= '<STPTName>Local-Exempt</STPTName>';
            $xml .= '<MasterName1>' . $order->CustomerName . ' - ' . $order->MobileNo1 . '</MasterName1>';
            $xml .= '<MasterName2>Main Store</MasterName2><TranCurName>Rs.</TranCurName><InputType>1</InputType>';
//            $xml .= '<BillingDetails><PartyName>'. $order->CustomerName .'</PartyName><Address1>'. $order->CompleteAddress .'</Address1></BillingDetails>';
            $xml .= '<BillingDetails><PartyName>' . $order->CustomerName . ' - ' . $order->MobileNo1 . '</PartyName><Address1>'. $order->Address .'</Address1>';
            $xml .= '<Address2>'. $order->City .', '. $order->District .',</Address2><Address3>'. $order->State .' - '. $order->PostalCode . '</Address3>';
            $xml .= '<tmpStateName>'. $order->State .'</tmpStateName><tmpAreaName>'. $order->District .'</tmpAreaName><tmpPINCode>'. $order->PostalCode .'</tmpPINCode></BillingDetails>';
            $xml .= '<ItemEntries>';


            // Loop through order details
            foreach ($order->orderDetails as $index => $detail) {
                $xml .= '<ItemDetail>';
                $xml .= '<Date>' . date('d-m-Y', strtotime($detail->CreatedOn)) . '</Date>'; // Format the date as needed
                $xml .= '<VchType>9</VchType>';
                $xml .= '<SrNo>' . ($index + 1) . '</SrNo>'; // Assuming SrNo increment for each detail
                $xml .= '<ItemName>' . htmlspecialchars($detail->ProductName) .' - '. ($detail->unit ?? '') . '</ItemName>'; // Assuming ProductName is safe, encode special characters
                $xml .= '<UnitName>'. $detail->unit .'</UnitName><ConFactor>1</ConFactor>'; // Assuming conversion factor
                $xml .= '<Qty>' . $detail->Qty . '</Qty>'; // Quantity ordered$xml .= '<ItemDescInfo/>'; // Empty for now
                $xml .= '<Price>' . $detail->SRate . '</Price>'; // Selling rate per unit
                $xml .= '<ListPrice>' . $detail->PRate . '</ListPrice>'; // Assuming same as Price
                $xml .= '<Amt>' . $detail->Amount . '</Amt>'; // Amount for this detail
                $xml .= '<NettAmount>' . $detail->Amount . '</NettAmount>'; // Assuming same as Amt
                $xml .= '<MC>Main Store</MC>'; // Assuming main store
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
            return $this->minifyXml($xml);
        } else {
            return "";
        }
    }

    function createAccountXml($order)
    {
        if ($order) {
            $xml = '<Account><Name>' . $order->CustomerName . ' - ' . $order->MobileNo1 . '</Name><PrintName>' . $order->CustomerName . ' - ' . $order->MobileNo1 . '</PrintName>';
            $xml .= '<ParentGroup>Sundry Debtors</ParentGroup><Address><Address1>'. $order->Address .'</Address1>';
            $xml .= '<Address2>'. $order->City .', '. $order->District .',</Address2>';
            $xml .= '<Address3>'. $order->State .' - '. $order->PostalCode . '</Address3><OF/><StateName>'. $order->State .'</StateName>';
            $xml .= '<AreaName>'. $order->District .'</AreaName><PINCode>'. $order->PostalCode .'</PINCode></Address></Account>';
            $curl = curl_init();
            curl_setopt_array($curl, [
                CURLOPT_URL => getenv("BUSY_URL"),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 5,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_HTTPHEADER => [
                    'SC: 5',
                    'UserName: a',
                    'Pwd: a',
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
    function pushSaleVoucher($OrderID)
    {
        if ($this->isBusyHostActive()) {
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
            $this->createAccountXml($order);
            $xml = $this->composeOrderXml($order);
            $minified_xml = $this->minifyXml($xml);
            $curl = curl_init();
            curl_setopt_array($curl, [
                CURLOPT_URL => getenv("BUSY_URL"),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_HTTPHEADER => [
                    'SC: 2',
                    'UserName: a',
                    'Pwd: a',
                    'vchtype: 9',
                    "vchXml: $minified_xml"
                ],
            ]);
            $response = curl_exec($curl);
            curl_close($curl);
            if(($response !== "") && ($response !== false)){
                $order->update(['BusySaleID' => $response]);
            }
        }
    }
}
