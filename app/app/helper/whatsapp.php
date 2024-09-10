<?php
namespace App\app\helper;

use DB;
use Helper;
class whatsapp{
    private static function getAPIInfo(){
        $data=(object)["endpoint"=>"https://api.aipowersolutions.in/","apiKey"=>"WQZY4beQckgfnLAhKxfZSGFAv53DeUE2WmY3dVBR42d6a993"];
        return $data;
    }
    /* private static function sendMessage1($data){
            // Replace these placeholders with your actual values
            $apiEndpoint = 'https://api.aipowersolutions.in/'; // Adjust the base URL
            $token = 'WQZY4beQckgfnLAhKxfZSGFAv53DeUE2WmY3dVBR42d6a993';
            $phone = '7708679203';
            $templateName = 'welcome_message';
            $templateLanguage = 'en_US';

            $data = [
                'token' => $token,
                'phone' => $phone,
                'template_name' => $templateName,
                'template_language' => $templateLanguage,
                'components' => [
                    [
                        'type' => 'body',
                        'parameters' => [
                            [
                                'type' => 'text',
                                'text' => 'Natural Raisins',
                            ],
                            [
                                'type' => 'text',
                                'text' => 'Anandhan AS',
                            ],
                            [
                                'type' => 'text',
                                'text' => 'Natural Raisins',
                            ],
                            [
                                'type' => 'text',
                                'text' => 'Natural Raisins',
                            ],
                            [
                                'type' => 'text',
                                'text' => 'Natural Raisins',
                            ],
                        ],
                    ],
                ],
            ];

            $ch = curl_init($apiEndpoint . 'api/wpbox/sendtemplatemessage');

            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

            // Set headers to indicate JSON content type
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Content-Type: application/json',
            ]);

            // Optional: Enable verbose output for debugging (comment out when not needed)
            // curl_setopt($ch, CURLOPT_VERBOSE, true);

            $response = curl_exec($ch);
            $curlError = curl_error($ch);

            if ($curlError) {
                echo 'Error: ' . $curlError;
            } else {
                echo 'Response: ' . $response;
            }

            curl_close($ch);
    } */
    private static function sendMessage($data){
        logger($data);

        $apiInfo = self::getAPIInfo();
        $data['token'] = $apiInfo->apiKey;

        $ch = curl_init($apiInfo->endpoint . 'api/wpbox/sendtemplatemessage');

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

        // Set headers to indicate JSON content type
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json',
        ]);

        // Optional: Enable verbose output for debugging (comment out when not needed)
        // curl_setopt($ch, CURLOPT_VERBOSE, true);

        $response = curl_exec($ch);
        $curlError = curl_error($ch);


        curl_close($ch);
        self::saveLog($data['template_name'],$data['phone'],$response);
        logger($response);
        return $response;
    }
    public static function saveLog($TemplateName,$MobileNumber,$data){
        $LogDB=Helper::getLogDB();
        $TableName="tbl_whatsapp_log_".date("Y");
        if(Helper::checkTableExists($LogDB,$TableName)==false){
            $sql="CREATE  TABLE IF NOT EXISTS ".$LogDB.$TableName."(SLNO int(20) PRIMARY KEY AUTO_INCREMENT,MobileNumber VarChar(20),Template VarChar(200),ResponseText LongText,createdOn TIMESTAMP NULL DEFAULT NULL)";
            DB::Statement($sql);
        }
        if(Helper::checkTableExists($LogDB,$TableName)){
            $tdata=[
                "MobileNumber"=>$MobileNumber,
                "Template"=>$TemplateName,
                "ResponseText"=>$data,
                "createdOn"=>now(),
            ];
            DB::Table($LogDB.$TableName)->insert($tdata);
        }
    }
    public static function whatsappVerification($PhoneNumber,$info){
        $data = [
            'phone' => $PhoneNumber,
            'template_name' => "mobile_number_whatsapp_verification",
            'template_language' => 'en_US',
            'components' => [
                [
                    'type' => 'body',
                    'parameters' => [
                        ['type' => 'text','text' => $info->customerName],
                        ['type' => 'text','text' => $info->companyName],
                        ['type' => 'text','text' => $info->otp],
                        ['type' => 'text','text' => $info->companyName],
                    ],
                ],
            ],
        ];
        return self::sendMessage($data);
    }
    public static function welcomeMessage($PhoneNumber,$info){
        $data = [
            'phone' => $PhoneNumber,
            'template_name' => "welcome_message",
            'template_language' => 'en_US',
            'components' => [
                [
                    'type' => 'body',
                    'parameters' => [
                        ['type' => 'text','text' => $info->companyName],
                        ['type' => 'text','text' => $info->customerName],
                        ['type' => 'text','text' => $info->companyName],
                        ['type' => 'text','text' => $info->companyName],
                    ],
                ],
            ],
        ];
        return self::sendMessage($data);
    }
    public static function newProductPromotions($PhoneNumber,$info){
        $data = [
            'phone' => $PhoneNumber,
            'template_name' => "new_product_promotions",
            'template_language' => 'en_US',
            'components' => [
                [
                    'type' => 'header',
                    'parameters' => [
                        ['type' => 'image','image' => ["link"=>$info->productImage]]
                    ],
                ],
                [
                    'type' => 'body',
                    'parameters' => [
                        ['type' => 'text','text' => $info->customerName],
                        ['type' => 'text','text' => $info->website],
                        ['type' => 'text','text' => $info->companyName],
                    ],
                ],
                [
                    'type' => 'button',
                    "sub_type"=> "url",
                    "index"=> 0,
                    'parameters' => [
                        ['type' => 'text','text' => $info->slug],
                    ],
                ]
            ],
        ];
        return self::sendMessage($data);
    }
    public static function receivingPayment($PhoneNumber,$info){
        $data = [
            'phone' => $PhoneNumber,
            'template_name' => "thank_you_for_receiving_payment ",
            'template_language' => 'en_US',
            'components' => [
                [
                    'type' => 'body',
                    'parameters' => [
                        ['type' => 'text','text' => $info->customerName],
                        ['type' => 'text','text' => $info->receiptNo],
                        ['type' => 'text','text' => $info->amount],
                        ['type' => 'text','text' => $info->paymentDate],
                        ['type' => 'text','text' => $info->link],
                        ['type' => 'text','text' => $info->companyName],
                    ],
                ],
            ],
        ];
        return self::sendMessage($data);
    }
    public static function sendPurchaseOrder($PhoneNumber,$info){

        $data = [
            'phone' => $PhoneNumber,
            'template_name' => "purchase_order",
            'template_language' => 'en',
            'components' => [
                [
                    'type' => 'body',
                    'parameters' => [
                        ['type' => 'text','text' => $info->supplierName],
                        ['type' => 'text','text' => $info->PONo],
                        ['type' => 'text','text' => $info->PONo],
                        ['type' => 'text','text' => $info->PODate],
                        ['type' => 'text','text' => $info->amount],
                        ['type' => 'text','text' => $info->link],
                        ['type' => 'text','text' => $info->companyName],
                    ],
                ],
                [
                    'type' => 'button',
                    "sub_type"=> "url",
                    "index"=> 0,
                    'parameters' => [
                        ['type' => 'text','text' => $info->link],
                    ],
                ]
            ],
        ];
        return self::sendMessage($data);
    }
    public static function sendPurchase($PhoneNumber,$info){

        $data = [
            'phone' => $PhoneNumber,
            'template_name' => "purchase",
            'template_language' => 'en',
            'components' => [
                [
                    'type' => 'body',
                    'parameters' => [
                        ['type' => 'text','text' => $info->supplierName],
                        ['type' => 'text','text' => $info->TranNo],
                        ['type' => 'text','text' => $info->TranDate],
                        ['type' => 'text','text' => $info->amount],
                        ['type' => 'text','text' => $info->link],
                        ['type' => 'text','text' => $info->companyName],
                    ],
                ],
                [
                    'type' => 'button',
                    "sub_type"=> "url",
                    "index"=> 0,
                    'parameters' => [
                        ['type' => 'text','text' => $info->link],
                    ],
                ]
            ],
        ];
        return self::sendMessage($data);
    }
    public static function sendSalesOrder($PhoneNumber,$info){

        $data = [
            'phone' => $PhoneNumber,
            'template_name' => "sales_order",
            'template_language' => 'en',
            'components' => [
                [
                    'type' => 'body',
                    'parameters' => [
                        ['type' => 'text','text' => $info->customerName],
                        ['type' => 'text','text' => $info->TranNo],
                        ['type' => 'text','text' => $info->TranNo],
                        ['type' => 'text','text' => $info->TranDate],
                        ['type' => 'text','text' => $info->amount],
                        ['type' => 'text','text' => $info->link],
                        ['type' => 'text','text' => $info->companyName],
                    ],
                ],
                [
                    'type' => 'button',
                    "sub_type"=> "url",
                    "index"=> 0,
                    'parameters' => [
                        ['type' => 'text','text' => $info->link],
                    ],
                ]
            ],
        ];
        return self::sendMessage($data);
    }
    public static function sendSalesInvoice($PhoneNumber,$info){
        $data = [
            'phone' => '7200955220',
            'template_name' => "sending_invoice",
            'template_language' => 'en_US',
            'components' => [
                [
                    'type' => 'body',
                    'parameters' => [
                        ['type' => 'text','text' => $info->customerName],
                        ['type' => 'text','text' => $info->invNo],
                        ['type' => 'text','text' => $info->invDate],
                        ['type' => 'text','text' => $info->amount],
                        ['type' => 'text','text' => $info->link],
                        ['type' => 'text','text' => $info->companyName],
                        ['type' => 'text','text' => $info->companyName],
                    ],
                ],
            ],
        ];
        return self::sendMessage($data);
    }
    public static function outstandingReminder($PhoneNumber,$info){

        $data = [
            'phone' => $PhoneNumber,
            'template_name' => "outstanding_payment_reminder",
            'template_language' => 'en_US',
            'components' => [
                [
                    'type' => 'body',
                    'parameters' => [
                        ['type' => 'text','text' => $info->customerName],
                        ['type' => 'text','text' => $info->outstanding],
                        ['type' => 'text','text' => $info->link],
                        ['type' => 'text','text' => $info->companyName],
                    ],
                ],
            ],
        ];
        return self::sendMessage($data);
    }
    public static function sendProductPromotion($FYDBName,$ProductID,$SBatchNo){
        /*
        if($Settings['enable-whatsapp-notifications']==true){
            $sql=" SELECT C.CustomerName,C.WhatsAppNumber, CGP.ProductID,P.Slug,P.ProductName,P.ProductImage FROM tbl_customer_group_price as CGP  ";
            $sql.=" LEFT JOIN tbl_products as P ON P.ProductID=CGP.ProductID LEFT JOIN tbl_customers as C ON C.GroupID=CGP.GroupID  ";
            $sql.=" Where CGP.ProductID='".$ProductID."' and IFNULL(C.WhatsAppNumber,'')<>'' and C.DFlag=0 and C.ActiveStatus='Active'";
            $result=DB::SELECT($sql);
            foreach($result as $item){
                $info=(object)[
                    "companyName"=>$Company->CompanyName,
                    "customerName"=>$item->CustomerName,
                    "productImage"=>url('/')."/".$item->ProductImage,
                    "slug"=>$item->Slug,
                    "website"=>url('/'),
                ];
                $response=self::newProductPromotions($item->WhatsAppNumber,$info);
            }
        }*/
        $Company=(object)Helper::getCompanySettings();
        $Settings=Helper::getSettings();
        if($Settings['enable-whatsapp-notifications']==true){
            $sql =" SELECT D.SBatchNo,D.ProductImage,P.ProductName,P.ProductCode,P.Slug,LP.GroupID,C.CustomerName,C.WhatsappNumber FROM ".$FYDBName."tbl_purchase_details as D ";
            $sql.=" LEFT JOIN  ".$FYDBName."tbl_lot_price as LP ON LP.DetailID=D.DetailID LEFT JOIN tbl_products as P ON P.ProductID=D.ProductID ";
            $sql.=" LEFT JOIN tbl_customers as C ON C.GroupID=LP.GroupID  ";
            $sql.=" where LP.isShow=1 and  D.SBatchNo='".$SBatchNo."' and D.ProductID='".$ProductID."' and IFNULL(C.WhatsAppNumber,'')<>'' and C.DFlag=0 and C.ActiveStatus='Active'";
            $result=DB::SELECT($sql);
            foreach($result as $item){
                $info=(object)[
                    "companyName"=>$Company->CompanyName,
                    "customerName"=>$item->CustomerName,
                    "productImage"=>url('/')."/".$item->ProductImage,
                    "slug"=>$item->Slug,
                    "website"=>url('/'),
                ];
                $response=self::newProductPromotions($item->WhatsappNumber,$info);
            }
        }
    }
    public static function sendProductBulkPromotion($FYDBName,$ProductID,$SBatchNo,$ContactName,$ContactNumber){
        $Company=(object)Helper::getCompanySettings();
        $Settings=Helper::getSettings();
        if($Settings['enable-whatsapp-notifications']==true){
            $sql =" SELECT D.SBatchNo,D.ProductImage,P.ProductName,P.ProductCode,P.Slug,LP.GroupID,C.CustomerName,C.WhatsappNumber FROM ".$FYDBName."tbl_purchase_details as D ";
            $sql.=" LEFT JOIN  ".$FYDBName."tbl_lot_price as LP ON LP.DetailID=D.DetailID LEFT JOIN tbl_products as P ON P.ProductID=D.ProductID ";
            $sql.=" LEFT JOIN tbl_customers as C ON C.GroupID=LP.GroupID  ";
            $sql.=" where LP.isShow=1 and  D.SBatchNo='".$SBatchNo."' and D.ProductID='".$ProductID."' and IFNULL(C.WhatsAppNumber,'')<>'' and C.DFlag=0 and C.ActiveStatus='Active'";
            $result=DB::SELECT($sql);
            foreach($result as $item){
                $info=(object)[
                    "companyName"=>$Company->CompanyName,
                    "customerName"=>$ContactName,
                    "productImage"=>url('/')."/".$item->ProductImage,
                    "slug"=>$item->Slug,
                    "website"=>url('/'),
                ];
                $response=self::newProductPromotions($ContactNumber,$info);
            }
        }
        /*
        $Company=(object)Helper::getCompanySettings();
        $Settings=Helper::getSettings();
        $sql=" SELECT * FROM  tbl_products where ProductID='".$ProductID."'";
        $result=DB::SELECT($sql);
        if(count($result)>0){
            $info=(object)[
                "companyName"=>$Company->CompanyName,
                "customerName"=>$ContactName,
                "productImage"=>url('/')."/".$result[0]->ProductImage,
                "slug"=>$result[0]->Slug,
                "website"=>url('/'),
            ];
            $response=self::newProductPromotions($ContactNumber,$info);
        }*/
    }
}
