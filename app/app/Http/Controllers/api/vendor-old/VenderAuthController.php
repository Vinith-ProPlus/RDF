<?php

namespace App\Http\Controllers\api\vendor;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use DB;
use Auth;
use Helper;
use Laravel\Passport\RefreshToken;
use Laravel\Passport\Token;
use activeMenuNames;
use ValidUnique;
use ValidDB;
use DocNum;
use docTypes;
use logs;

class VenderAuthController extends Controller{
    private $generalDB;
    private $tmpDB;
    private $ActiveMenuName;
    private $FileTypes;


    public function __construct(){
		$this->generalDB=Helper::getGeneralDB();
		$this->tmpDB=Helper::getTmpDB();
        $this->ActiveMenuName=activeMenuNames::Vendors->value;
		$this->FileTypes=Helper::getFileTypes(array("category"=>array("Images","Documents")));
    }

    public function VendorDocuments(request $req){
		$return = [
			'MaxSize' => "2MB",
			'extensions' => ['doc','docx','pdf','png','jpg','jpeg'],
			'Documents' => [
                [
                    'DocName' => 'GSTCertificate',
                    'DisplayName' => 'GST Certificate',
                    'isRequired' => true,
                ],
                [
                    'DocName' => 'PANCard',
                    'DisplayName' => 'PAN Card',
                    'isRequired' => true,
                ],
                [
                    'DocName' => 'AadharCardFront',
                    'DisplayName' => 'Aadhar Card Front',
                    'isRequired' => true,
                ],
                [
                    'DocName' => 'AadharCardBack',
                    'DisplayName' => 'Aadhar Card Back',
                    'isRequired' => true,
                ],
            ],
		];
        return response()->json($return);
	}
    public function Register(Request $req){
        $reqData = $req->all();
        // return json_decode($reqData['Documents'] , true);
        // return $reqData;

        $NewData=$OldData=[];
		$ValidDB=[];
			
        $ValidDB['Country']['TABLE']=$this->generalDB."tbl_countries";
        $ValidDB['Country']['ErrMsg']="Country name does not exist";
        $ValidDB['Country']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$reqData['CountryID']);
        $ValidDB['Country']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>"Active");
        $ValidDB['Country']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

        $ValidDB['State']['TABLE']=$this->generalDB."tbl_states";
        $ValidDB['State']['ErrMsg']="State name does not exist";
        $ValidDB['State']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$reqData['CountryID']);
        $ValidDB['State']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$reqData['StateID']);
        $ValidDB['State']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>"Active");
        $ValidDB['State']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

        $ValidDB['District']['TABLE']=$this->generalDB."tbl_districts";
        $ValidDB['District']['ErrMsg']="District name does not exist";
        $ValidDB['District']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$reqData['CountryID']);
        $ValidDB['District']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$reqData['StateID']);
        $ValidDB['District']['WHERE'][]=array("COLUMN"=>"DistrictID","CONDITION"=>"=","VALUE"=>$reqData['DistrictID']);
        $ValidDB['District']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>"Active");
        $ValidDB['District']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

        $ValidDB['Taluk']['TABLE']=$this->generalDB."tbl_taluks";
        $ValidDB['Taluk']['ErrMsg']="Taluk name does not exist";
        $ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$reqData['CountryID']);
        $ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$reqData['StateID']);
        $ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"DistrictID","CONDITION"=>"=","VALUE"=>$reqData['DistrictID']);
        $ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"TalukID","CONDITION"=>"=","VALUE"=>$reqData['TalukID']);
        $ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>"Active");
        $ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

        $ValidDB['PostalCode']['TABLE']=$this->generalDB."tbl_postalcodes";
        $ValidDB['PostalCode']['ErrMsg']="Postal Code does not exist";
        $ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$reqData['CountryID']);
        $ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$reqData['StateID']);
        $ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"DistrictID","CONDITION"=>"=","VALUE"=>$reqData['DistrictID']);
        $ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"PID","CONDITION"=>"=","VALUE"=>$reqData['PostalCodeID']);
        $ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>"Active");
        $ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

        $ValidDB['City']['TABLE']=$this->generalDB."tbl_cities";
        $ValidDB['City']['ErrMsg']="City Name does not exist";
        $ValidDB['City']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$reqData['CountryID']);
        $ValidDB['City']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$reqData['StateID']);
        $ValidDB['City']['WHERE'][]=array("COLUMN"=>"DistrictID","CONDITION"=>"=","VALUE"=>$reqData['DistrictID']);
        $ValidDB['City']['WHERE'][]=array("COLUMN"=>"TalukID","CONDITION"=>"=","VALUE"=>$reqData['TalukID']);
        $ValidDB['City']['WHERE'][]=array("COLUMN"=>"PostalID","CONDITION"=>"=","VALUE"=>$reqData['PostalCodeID']);
        $ValidDB['City']['WHERE'][]=array("COLUMN"=>"CityID","CONDITION"=>"=","VALUE"=>$reqData['CityID']);
        $ValidDB['City']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>"Active");
        $ValidDB['City']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

        if (isset($reqData['PCategories'])) {
            $reqData['PCategories'] = json_decode($reqData['PCategories'], true);
        }
        if (isset($reqData['Documents'])) {
            $reqData['Documents'] = json_decode($reqData['Documents'], true);
        }

        $rules = [
            'VendorName' => ['required', 'max:50', new ValidUnique(array("TABLE" => "tbl_vendors", "WHERE" => " VendorName='" . $reqData['VendorName'] . "' "), "This Vendor Name is already taken.")],
            'VendorCoName' => ['required','max:50', new ValidUnique(array("TABLE" => "tbl_vendors", "WHERE" => " VendorCoName='" . $reqData['VendorCoName'] . "' "), "This Vendor Company Name is already taken.")],
            'VendorCoWebsite' => ['max:50', new ValidUnique(array("TABLE" => "tbl_vendors", "WHERE" => " VendorCoWebsite='" . $reqData['VendorCoWebsite'] . "' "), "This Vendor Company Website is already taken.")],
            'Email'=> ['required', 'email:filter', new ValidUnique(array("TABLE" => "tbl_vendors", "WHERE" => " Email='" . $reqData['Email'] . "' "), "This Email is already taken.")],
            'GSTNo' => ['required', 'regex:/^\d{2}[A-Z]{5}\d{4}[A-Z]{1}\d[Z]{1}[0-9A-Z]{1}$/'],
            'MobileNumber1' => ['required', 'regex:/^[0-9]{10}$/'],
            'MobileNumber2' => ['nullable', 'regex:/^[0-9]{10}$/'],
            'CountryID' => ['required', new ValidDB($ValidDB['Country'])],
            'StateID' => ['required', new ValidDB($ValidDB['State'])],
            'DistrictID' => ['required', new ValidDB($ValidDB['District'])],
            'TalukID' => ['required', new ValidDB($ValidDB['Taluk'])],
            'PostalCodeID' => ['required', new ValidDB($ValidDB['PostalCode'])],
            'CityID' => ['required', new ValidDB($ValidDB['City'])],
            'PCategories' => 'array|min:1',
        ];

        $messages = [
            'Logo.mimes' => "The Logo field must be a file of type: " . implode(", ", $this->FileTypes['category']['Images']) . ".",
            'VendorCoName.required' => 'Vendor Company Name is required',
            'MobileNumber1.regex' => 'Mobile Number 1 should be 10 digits',
            'MobileNumber2.regex' => 'Mobile Number 2 should be 10 digits',
            'GSTNo.regex' => 'Invalid GST Number Format',
            'GSTNo.required' => 'GST Number is Required',
            'PCategories.array' => 'Invalid format for categories.',
            'PCategories.min' => 'Select at least one category.',
        ];

        if ($req->hasFile('Logo')) {
            $rules['Logo'] = 'mimes:' . implode(",", $this->FileTypes['category']['Images']);
        }
        $validator = Validator::make($reqData, $rules, $messages);

        $errors = $validator->errors()->toArray();

        $DocErrors = [];
        foreach ($reqData['Documents'] as $key => $data) {
            if (empty($data)) {
                $DocErrors[$key] = "{$key} is mandatory.";
            }
        }

        if (!empty($DocErrors) || !empty($errors)) {
            $resultErrors = !empty($DocErrors) ? ['Documents' => $DocErrors] + $errors : $errors;
            return array('status' => false, 'message' => "Vendor Register Failed", 'errors' => $resultErrors);
        }

        DB::beginTransaction();
        try{
            $Logo="";
            $VendorID=DocNum::getDocNum(docTypes::Vendor->value);
            $dir="uploads/master/vendor/manage-vendors/".$VendorID."/";
            $dDir="uploads/master/vendor/manage-vendors/".$VendorID."/documents/";
            if (!file_exists( $dir)) {mkdir( $dir, 0777, true);}
            if (!file_exists( $dDir)) {mkdir( $dDir, 0777, true);}
            if($req->hasFile('Logo')){
                $file = $req->file('Logo');
                $fileName=md5($file->getClientOriginalName() . time());
                $fileName1 =  $fileName. "." . $file->getClientOriginalExtension();
                $file->move($dir, $fileName1);
                $Logo=$dir.$fileName1;
            }else if(Helper::isJSON($req->Logo)==true){
                $Img=json_decode($req->Logo);
                if(file_exists($Img->uploadPath)){
                    $fileName1=$Img->fileName!=""?$Img->fileName:Helper::RandomString(10)."png";
                    copy($Img->uploadPath,$dir.$fileName1);
                    $Logo=$dir.$fileName1;
                    unlink($Img->uploadPath);
                }
            }
            $data = [
                "VendorID" => $VendorID,
                "VendorName" => $reqData['VendorName'],
                "VendorCoName" => $reqData['VendorCoName'],
                "VendorCoWebsite" => $reqData['VendorCoWebsite'],
                "GSTNo" => $reqData['GSTNo'],
                "Email" => $reqData['Email'],
                "PCategories" => serialize($reqData['PCategories']),
                "MobileNumber1" => $reqData['MobileNumber1'],
                "MobileNumber2" => $reqData['MobileNumber2'],
                "Address" => $reqData['Address'],
                "CountryID" => $reqData['CountryID'],
                "StateID" => $reqData['StateID'],
                "DistrictID" => $reqData['DistrictID'],
                "TalukID" => $reqData['TalukID'],
                "CityID" => $reqData['CityID'],
                "PostalCode" => $reqData['PostalCodeID'],
                "Reference" => $reqData['Reference'],
                'Logo' => $Logo,
                "CreatedOn" => date("Y-m-d H:i:s"),
            ];
            $status=DB::Table('tbl_vendors')->insert($data);
            if($status){
                foreach ($reqData['Documents'] as $docType => $docDetails) {
                    if (file_exists($docDetails['uploadPath'])) {
                        $ext = pathinfo($docDetails['uploadPath'], PATHINFO_EXTENSION);
                        $fileName1 = $docDetails['fileName'] != "" ? $docDetails['fileName'] : Helper::RandomString(10) . '.' . $ext;
                        copy($docDetails['uploadPath'], $dDir . $fileName1);
                        $uploadedDocument = $dDir . $fileName1;
            
                        $data = [
                            "SLNO" => DocNum::getDocNum(docTypes::VendorDocuments->value),
                            'VendorID' => $VendorID,
                            'DocName' => $docType,
                            'documents' => $uploadedDocument,
                            'CreatedOn' => date('Y-m-d H:i:s'),
                        ];
                        $status = DB::table('tbl_vendors_document')->insert($data);
                        if ($status) {
                            DocNum::updateDocNum(docTypes::VendorDocuments->value);
                        }
                    }
                }
            }
        }catch(Exception $e){
            $status=false;
        }
        if($status==true){
            DB::commit();
            DocNum::updateDocNum(docTypes::Vendor->value);
            $NewData=DB::table('tbl_vendors')->where('VendorID',$VendorID)->get();
            $logData=array("Description"=>"New Vendor Created ","ModuleName"=>$this->ActiveMenuName,"Action"=>'Add',"ReferID"=>$VendorID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>"","IP"=>$req->ip());
            logs::Store($logData);
            return array('status'=>true,'message'=>"Vendor Registered Successfully");
        }else{
            DB::rollback();
            foreach($uploadingImgs as $index=>$Img){
                Helper::removeFile($Img);
            }
            return array('status'=>false,'message'=>"Vendor Create Failed");
        }
    }
    public function Update(Request $req,$VendorID){
        // return $req;
        // return json_decode($req->SupplyDetails);
        if (json_decode($req->isGeneral) && $req->General) {
            $GeneralData = json_decode($req->General, true);
            $rules = [
                // 'VendorName' => ['required', 'max:50', new ValidUnique(array("TABLE" => "tbl_vendors", "WHERE" => " VendorName='" . $GeneralData['VendorName'] . "' and VendorID<>'" . $VendorID . "'  "), "This Vendor Name is already taken.")],
                // 'VendorCoName' => ['required', 'max:50', new ValidUnique(array("TABLE" => "tbl_vendors", "WHERE" => " VendorCoName='" . $GeneralData['VendorCoName'] . "' and VendorID<>'" . $VendorID . "' "), "This Vendor Company Name is already taken.")],
                'MobileNumber1' => ['required', 'regex:/^[0-9]{10}$/'],
                'MobileNumber2' => ['nullable', 'regex:/^[0-9]{10}$/'],
            ];
        
            $messages = [
                // 'VendorCoName.required' => 'Vendor Company Name is required',
                'MobileNumber1.regex' => 'Mobile Number 1 should be 10 digits',
                'MobileNumber2.regex' => 'Mobile Number 2 should be 10 digits',
            ];
            $validator = Validator::make($GeneralData, $rules, $messages);
        
            if ($validator->fails()) {
                return array('status' => false, 'message' => "Vendor Register Failed", 'errors' => $validator->errors());
            } else {
                $status = DB::statement("CREATE TABLE IF NOT EXISTS {$this->tmpDB}`tbl_vendors` (
                    `VendorID` varchar(50) PRIMARY KEY NOT NULL,
                    `VendorName` varchar(150) DEFAULT NULL,
                    `VendorCoName` text DEFAULT NULL,
                    `VendorCoWebsite` text DEFAULT NULL,
                    `Reference` text DEFAULT NULL,
                    `GSTNo` varchar(50) DEFAULT NULL,
                    `PCategories` text DEFAULT NULL,
                    `VendorType` varchar(50) DEFAULT NULL,
                    `Email` varchar(150) DEFAULT NULL,
                    `MobileNumber1` varchar(50) DEFAULT NULL,
                    `MobileNumber2` varchar(50) DEFAULT NULL,
                    `Address` text DEFAULT NULL,
                    `PostalCode` varchar(50) DEFAULT NULL,
                    `CityID` varchar(50) DEFAULT NULL,
                    `TalukID` varchar(50) DEFAULT NULL,
                    `DistrictID` varchar(50) DEFAULT NULL,
                    `StateID` varchar(50) DEFAULT NULL,
                    `CountryID` varchar(50) DEFAULT NULL,
                    `Logo` text DEFAULT NULL,
                    `CreatedOn` datetime DEFAULT CURRENT_TIMESTAMP
                )");
                if ($status) {
                    DB::table($this->tmpDB . 'tbl_vendors')->where('VendorID', $VendorID)->delete();
                    $data = [
                        'VendorID'=>$VendorID,
                        'MobileNumber1'=>$GeneralData['MobileNumber1'],
                        'MobileNumber2'=>$GeneralData['MobileNumber2'],
                        'VendorType'=>$GeneralData['VendorType'],
                    ];
                    $status = DB::table($this->tmpDB . 'tbl_vendors')->insert($data);
                    if ($status) {
                        // return response()->json(['status' => true, 'message' => 'General Data Updated']);
                    }
                }
            }
        }
        if (json_decode($req->isSupplyDetails) && $req->SupplyDetails) {
            // return $req->SupplyDetails;
            $SupplyDetailsData = json_decode($req->SupplyDetails);
            if (is_array($SupplyDetailsData) && count($SupplyDetailsData) == 0) {
                return array('status' => false, 'message' => "Vendor Register Failed", 'errors' => ['SupplyDetails' => "Select a Product Sub Category"]);
            } else {
                $status = DB::statement("CREATE TABLE IF NOT EXISTS {$this->tmpDB}`tbl_vendors_supply` (
                    `DetailID` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
                    `VendorID` varchar(50) DEFAULT NULL,
                    `PCID` varchar(50) DEFAULT NULL,
                    `PSCID` varchar(50) DEFAULT NULL,
                    `CreatedOn` datetime DEFAULT CURRENT_TIMESTAMP
                )");
                if ($status) {
                    DB::table($this->tmpDB . 'tbl_vendors_supply')->where('VendorID', $VendorID)->delete();
                    foreach ($SupplyDetailsData as $item) {
                        $data = array(
                            "VendorID" => $VendorID,
                            "PCID" => $item->PCID,
                            "PSCID" => $item->PSCID,
                        );
                        $status = DB::Table($this->tmpDB . 'tbl_vendors_supply')->insert($data);
                    }
                    if ($status) {
                        return response()->json(['status' => true, 'message' => 'Supply Details Updated']);
                    }
                }
            }
        }
        if (json_decode($req->isStockPoints) && $req->StockPoints) {
            $StockPointsData = json_decode($req->StockPoints);
            if (is_array($StockPointsData) && count($StockPointsData) == 0) {
                return array('status' => false, 'message' => "Vendor Register Failed", 'errors' => ['StockPoints' => "Add a Stock Point"]);
            } else {
                $status = DB::statement("CREATE TABLE IF NOT EXISTS {$this->tmpDB}`tbl_vendors_stock_point` (
                    `SNo` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
                    `DetailID` varchar(50) DEFAULT NULL,
                    `UUID` varchar(50) DEFAULT NULL,
                    `VendorID` varchar(50) DEFAULT NULL,
                    `PointName` varchar(150) DEFAULT NULL,
                    `Address` text DEFAULT NULL,
                    `PostalID` varchar(50) DEFAULT NULL,
                    `CityID` varchar(50) DEFAULT NULL,
                    `TalukID` varchar(50) DEFAULT NULL,
                    `DistrictID` varchar(50) DEFAULT NULL,
                    `StateID` varchar(50) DEFAULT NULL,
                    `CountryID` varchar(50) DEFAULT NULL,
                    `CreatedOn` datetime DEFAULT CURRENT_TIMESTAMP
                )");
                if ($status) {
                    DB::table($this->tmpDB . 'tbl_vendors_stock_point')->where('VendorID', $VendorID)->delete();
                    foreach ($StockPointsData as $item) {
                        $UUID = isset($item->UUID) && !empty($item->UUID) ? $item->UUID : substr(str_shuffle(substr(uniqid(uniqid(), true), 0, 16)), 0, 12);
                        $DetailID = isset($item->DetailID) ? $item->DetailID : "";
                        $data = array(
                            "VendorID" => $VendorID,
                            "DetailID" => $DetailID,
                            "UUID" => $UUID,
                            "PointName" => $item->PointName,
                            "Address" => $item->Address,
                            "PostalID" => $item->PostalID,
                            "CityID" => $item->CityID,
                            "TalukID" => $item->TalukID,
                            "DistrictID" => $item->DistrictID,
                            "StateID" => $item->StateID,
                            "CountryID" => $item->CountryID,
                        );
                        $status = DB::table($this->tmpDB . 'tbl_vendors_stock_point')->insert($data);
                    }
                    if ($status) {
                        return response()->json(['status' => true, 'message' => 'Stock Points Updated']);
                    }
                }
            }
        }
        if (json_decode($req->isVehicles) && $req->Vehicles) {
            $VehiclesData = json_decode($req->Vehicles);
            if (is_array($VehiclesData) && count($VehiclesData) > 0) {
                $status = DB::statement("CREATE TABLE IF NOT EXISTS {$this->tmpDB}`tbl_vendors_vehicle` (
                    `SNo` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
                    `VendorID` varchar(50) DEFAULT NULL,
                    `VehicleID` varchar(50) DEFAULT NULL,
                    `UUID` varchar(150) DEFAULT NULL,
                    `VNumber` varchar(50) DEFAULT NULL,
                    `VType` varchar(50) DEFAULT NULL,
                    `VBrand` varchar(50) DEFAULT NULL,
                    `VModel` varchar(50) DEFAULT NULL,
                    `VLength` varchar(50) DEFAULT NULL,
                    `VDepth` varchar(50) DEFAULT NULL,
                    `VWidth` varchar(50) DEFAULT NULL,
                    `VCapacity` varchar(50) DEFAULT NULL,
                    `CreatedOn` datetime DEFAULT CURRENT_TIMESTAMP
                )");
        
                if ($status) {
                    $status = DB::statement("CREATE TABLE IF NOT EXISTS {$this->tmpDB}`tbl_vendors_vehicle_images` (
                        `SNo` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
                        `SLNo` varchar(50) DEFAULT NULL,
                        `VendorID` varchar(50) DEFAULT NULL,
                        `VehicleID` varchar(50) DEFAULT NULL,
                        `UUID` varchar(150) DEFAULT NULL,
                        `ImgID` varchar(50) DEFAULT NULL,
                        `gImage` text DEFAULT NULL,
                        `CreatedOn` datetime DEFAULT CURRENT_TIMESTAMP
                    )");
        
                    if ($status) {
                        DB::table($this->tmpDB . 'tbl_vendors_vehicle')->where('VendorID', $VendorID)->delete();
                        DB::table($this->tmpDB . 'tbl_vendors_vehicle_images')->where('VendorID', $VendorID)->delete();
                        foreach ($VehiclesData as $item) {
                            // $UUID = sprintf('%04x%04x-%04x-%04x-%04x-%04x%04x%04x', mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0x0fff) | 0x4000, mt_rand(0, 0x3fff) | 0x8000, mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff));
                            $UUID = isset($item->UUID) && !empty($item->UUID) ? $item->UUID : substr(str_shuffle(substr(uniqid(uniqid(), true), 0, 16)), 0, 12);
                            $VehicleID = isset($item->VehicleID) ? $item->VehicleID : "";
                            $data = array(
                                "VendorID" => $VendorID,
                                "VehicleID" => $VehicleID,
                                "UUID" => $UUID,
                                "VNumber" => $item->VNumber,
                                "VType" => $item->VTypeID,
                                "VBrand" => $item->VBrandID,
                                "VModel" => $item->VModelID,
                                "VLength" => $item->VLength,
                                "VDepth" => $item->VDepth,
                                "VWidth" => $item->VWidth,
                                "VCapacity" => $item->VCapacity,
                            );
                            $status = DB::table($this->tmpDB . 'tbl_vendors_vehicle')->insert($data);
                            if ($status && count($item->Images) > 0) {
                                foreach ($item->Images as $row) {
                                    $ImgID = isset($item->ImgID) && !empty($item->ImgID) ? $item->ImgID : substr(str_shuffle(substr(uniqid(uniqid(), true), 0, 16)), 0, 12);
                                    $imageData = array(
                                        'VendorID' => $VendorID,
                                        "VehicleID" => $VehicleID,
                                        "UUID" => $UUID,
                                        "ImgID" => $ImgID,
                                        'gImage' => serialize($row),
                                    );
                                    $status = DB::table($this->tmpDB . 'tbl_vendors_vehicle_images')->insert($imageData);
                                }
                            }
                        }
        
                        if ($status) {
                            return response()->json(['status' => true, 'message' => 'Vehicles Data Updated']);
                        }
                    }
                }
            }
        }
        if (json_decode($req->isServiceLocations) && $req->ServiceLocations) {
            $ServiceLocationsData=json_decode($req->ServiceLocations);
            $ServiceBy = $ServiceLocationsData->ServiceBy;
            $ServiceData = $ServiceLocationsData->ServiceData;
            if (is_array($ServiceData) && count($ServiceData) == 0) {
                return array('status' => false, 'message' => "Vendor Register Failed", 'errors' => ['ServiceLocations' => "Add a Service Location"]);
            } else {
                $status = DB::statement("CREATE TABLE IF NOT EXISTS {$this->tmpDB}`tbl_vendors_service_locations` (
                    `SNo` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
                    `VendorID` varchar(50) DEFAULT NULL,
                    `ServiceBy` enum('District','PostalCode','Radius') NOT NULL DEFAULT 'PostalCode',
                    `Latitude` varchar(100) DEFAULT NULL,
                    `Longitude` varchar(100) DEFAULT NULL,
                    `Raduis` int(50) DEFAULT NULL,
                    `PostalCodeID` varchar(50) DEFAULT NULL,
                    `DistrictID` varchar(50) DEFAULT NULL,
                    `StateID` varchar(50) DEFAULT NULL,
                    `CreatedOn` datetime DEFAULT CURRENT_TIMESTAMP
                )");
                if ($status) {
                    DB::table($this->tmpDB.'tbl_vendors_service_locations')->where('VendorID',$VendorID)->delete();
                    if($ServiceBy == "District"){
                        foreach($ServiceData as $data){
                            foreach($data->Districts as $item){
                                $tdata=array(
                                    "VendorID"=>$VendorID,
                                    "ServiceBy"=>$ServiceBy,
                                    "StateID" => $data->StateID,
                                    "DistrictID"=>$item->DistrictID,
                                );
                                $status=DB::Table($this->tmpDB.'tbl_vendors_service_locations')->insert($tdata);
                            }
                        }
                    }elseif($ServiceBy == "PostalCode"){
                        foreach($ServiceData as $data){
                            foreach($data->Districts as $item){
                                foreach($item->PostalCodeIDs as $row){
                                    $tdata=array(
                                        "VendorID"=>$VendorID,
                                        "ServiceBy"=>$ServiceBy,
                                        "StateID" => $data->StateID,
                                        "DistrictID"=>$item->DistrictID,
                                        "PostalCodeID"=>$row,
                                    );
                                    $status=DB::Table($this->tmpDB.'tbl_vendors_service_locations')->insert($tdata);
                                }
                            }
                        }
                    }else{
                        $status = false;
                    }
                    if ($status) {
                        return response()->json(['status' => true,'message' => 'Service Locations Updated']);
                    }
                }
            }
        }
        if (json_decode($req->isAll)) {
            $VendorDetails = $this->getTmpVendorData($VendorID);
            // return $VendorDetails;
            if($VendorDetails){
                DB::beginTransaction();
                $status=false;
                $Logo="";
                $UploadedFiles = [];
                $DeletedFiles = [];
                try {
                    $dir="uploads/master/vendor/manage-vendors/".$VendorID."/";
                    $vdir="uploads/master/vendor/manage-vendors/".$VendorID."/vehicles/";
                    $dDir="uploads/master/vendor/manage-vendors/".$VendorID."/documents/";
                    if (!file_exists( $dir)) {mkdir( $dir, 0777, true);}
                    if (!file_exists( $vdir)) {mkdir( $vdir, 0777, true);}
                    if (!file_exists( $dDir)) {mkdir( $dDir, 0777, true);}
        
                    if(isset($VendorDetails->Logo) && $VendorDetails->hasFile('Logo')){
                        $file = $VendorDetails->file('Logo');
                        $fileName=md5($file->getClientOriginalName() . time());
                        $fileName1 =  $fileName. "." . $file->getClientOriginalExtension();
                        $file->move($dir, $fileName1);
                        $Logo=$dir.$fileName1;
                    }else if(Helper::isJSON($VendorDetails->Logo)==true){
                        $Img=json_decode($VendorDetails->Logo);
                        if(file_exists($Img->uploadPath)){
                            $fileName1=$Img->fileName!=""?$Img->fileName:Helper::RandomString(10)."png";
                            copy($Img->uploadPath,$dir.$fileName1);
                            $Logo=$dir.$fileName1;
                            unlink($Img->uploadPath);
                        }
                    }

                    $data=array(
                        "MobileNumber1"=>$VendorDetails->MobileNumber1,
                        "MobileNumber2"=>$VendorDetails->MobileNumber2,
                        "VendorType"=>$VendorDetails->VendorType,
                        "UpdatedOn"=>date("Y-m-d H:i:s")
                    );
                    if($Logo!=""){
                        $data['Logo']=$Logo;
                    }
                    $status=DB::Table('tbl_vendors')->where('VendorID',$VendorID)->update($data);

                    //Vehicles
                    $VehicleUUIDs=[];
                    if($status && !empty($VendorDetails->Vehicles)){
                        foreach($VendorDetails->Vehicles as $data){
                            $VehicleUUIDs[]=$data->UUID;
                            $VehicleID = "";
                            $t=DB::Table('tbl_vendors_vehicle')->where('VendorID',$VendorID)->where('UUID',$data->UUID)->first();
                            if($t){
                                $tdata=array(
                                    "VNumber"=>$data->VNumber,
                                    "VType"=>$data->VType,
                                    "VBrand"=>$data->VBrand,
                                    "VModel"=>$data->VModel,
                                    "VLength"=>$data->VLength,
                                    "VDepth"=>$data->VDepth,
                                    "VWidth"=>$data->VWidth,
                                    "VCapacity"=>$data->VCapacity,
                                    "UpdatedOn"=>date("Y-m-d H:i:s")
                                );
                                $status=DB::Table('tbl_vendors_vehicle')->where('VendorID',$VendorID)->where('UUID',$data->UUID)->update($tdata);
                            }else{
                                $VehicleID = DocNum::getDocNum(docTypes::VendorVehicle->value);
                                $tdata=array(
                                    "VehicleID"=>$VehicleID,
                                    "VendorID"=>$VendorID,
                                    "UUID"=>$data->UUID,
                                    "VNumber"=>$data->VNumber,
                                    "VType"=>$data->VType,
                                    "VBrand"=>$data->VBrand,
                                    "VModel"=>$data->VModel,
                                    "VLength"=>$data->VLength,
                                    "VDepth"=>$data->VDepth,
                                    "VWidth"=>$data->VWidth,
                                    "VCapacity"=>$data->VCapacity,
                                    "CreatedOn"=>date("Y-m-d H:i:s")
                                );
                                $status=DB::Table('tbl_vendors_vehicle')->insert($tdata);
                                if($status){
                                    DocNum::updateDocNum(docTypes::VendorVehicle->value);
                                }
                            }
                            $ImgIDs=array();
                            if($status){
                                if (isset($data->Images) && !empty((array)$data->Images)) {
                                    foreach($data->Images as $vImgData){
                                        $ImgIDs[]=$vImgData->ImgID;
                                        $vImg=unserialize($vImgData->gImage);
                                        
                                        // return $vImg->uploadPath;
                                        if(file_exists($vImg->uploadPath) ){

                                            $fileName1=$vImg->fileName!=""?$vImg->fileName:Helper::RandomString(10)."png";
                                            copy($vImg->uploadPath,$vdir.$fileName1);
                                            
                                            $VImages=$vdir.$fileName1;
                                            $t=DB::Table('tbl_vendors_vehicle_images')->where('VendorID',$VendorID)->where('UUID',$data->UUID)->where('ImgID',$vImgData->ImgID)->first();
                                            if($t){
                                                $tmpData=array(
                                                    "gImage"=>$VImages,
                                                    "UpdatedOn"=>date("Y-m-d H:i:s")
                                                );
                                                $status=DB::Table('tbl_vendors_vehicle_images')->where('VendorID',$VendorID)->where('UUID',$data->UUID)->where('ImgID',$vImgData->ImgID)->update($tmpData);
                                            }else{
                                                $tmpData=array(
                                                    "SLNO"=>DocNum::getDocNum(docTypes::VendorVehicleImages->value),
                                                    "VendorID"=>$VendorID,
                                                    "VehicleID"=>$VehicleID,
                                                    "UUID"=>$data->UUID,
                                                    "ImgID"=>$vImgData->ImgID,
                                                    "gImage"=>$VImages,
                                                    "CreatedOn"=>date("Y-m-d H:i:s")
                                                );
                                                $status=DB::Table('tbl_vendors_vehicle_images')->insert($tmpData);
                                                if($status){
                                                    DocNum::updateDocNum(docTypes::VendorVehicleImages->value);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            //delete images
                            if($status && count($ImgIDs)>0){
                                $sql="Select SLNO,gImage From tbl_vendors_vehicle_images Where VendorID='".$VendorID."' and UUID='".$data->UUID."' and ImgID not in('".implode("','",$ImgIDs)."')";
                                $result=DB::SELECT($sql);
                                for($m=0;$m<count($result);$m++){
                                    if($status){
                                        $RemoveImg[]=$result[$m]->gImage;
                                        $status=DB::Table('tbl_vendors_vehicle_images')->where('SLNO',$result[$m]->SLNO)->delete();
                                    }
                                }
                            }
                        }
                        if($status && count($VehicleUUIDs)>0){
                            $sql="Select * From tbl_vendors_vehicle Where VendorID='".$VendorID."' and UUID not in('".implode("','",$VehicleUUIDs)."')";
                            $result=DB::SELECT($sql);
                            for($m=0;$m<count($result);$m++){
                                if($status){
                                    $status=DB::Table('tbl_vendors_vehicle')->where('UUID',$result[$m]->UUID)->update(array("DFlag"=>1,"DeletedOn"=>date("Y-m-d H:i:s")));
                                }
                            }
                        }
                    }

                    //supply details
                    if($status && !empty($VendorDetails->SupplyDetails)){
                        $PSCIDs=[];
                        foreach($VendorDetails->SupplyDetails as $data){
                            $PSCIDs[]=$data->PSCID;
                            $t=DB::Table('tbl_vendors_supply')->where('VendorID',$VendorID)->Where('PCID',$data->PCID)->Where('PSCID',$data->PSCID)->first();
                            if(!$t){
                                $DetailID = DocNum::getDocNum(docTypes::VendorSupply->value);
                                $tdata=array(
                                    "DetailID"=>$DetailID,
                                    "VendorID"=>$VendorID,
                                    "PCID"=>$data->PCID,
                                    "PSCID"=>$data->PSCID,
                                    "CreatedOn"=>date("Y-m-d H:i:s")
                                );
                                $status=DB::Table('tbl_vendors_supply')->insert($tdata);
                                if($status){
                                    DocNum::updateDocNum(docTypes::VendorSupply->value);
                                }
                            }
                        }
                        if (!empty($PSCIDs)) {
                            DB::Table('tbl_vendors_supply')->where('VendorID',$VendorID)->WhereIn('PSCID',$PSCIDs)->update(['DFlag'=>0,'UpdatedOn'=>date('Y-m-d H:i:s')]);
                            DB::Table('tbl_vendors_supply')->where('VendorID',$VendorID)->WhereNotIn('PSCID',$PSCIDs)->update(['DFlag'=>1,'UpdatedOn'=>date('Y-m-d H:i:s')]);
                            $status=true;
                        }
                    }
                
                    //service location details
                    if($status && !empty($VendorDetails->ServiceLocations)){
                        $ServiceBy = $VendorDetails->ServiceLocations['ServiceBy'];
                        $ServiceData = $VendorDetails->ServiceLocations['ServiceData'];
                        if($ServiceBy == "District"){
                            $DistrictIDs=[];
                            foreach($ServiceData as $data){
                                foreach($data->Districts as $item){
                                    $DistrictIDs[] = $item->DistrictID;
                                    $t=DB::Table('tbl_vendors_service_locations')->where('VendorID',$VendorID)->where('ServiceBy',$ServiceBy)->Where('DistrictID',$item->DistrictID)->first();
                                    if(!$t){
                                        $PostalCodeIDs = DB::table($this->generalDB.'tbl_postalcodes')->where('DistrictID',$item->DistrictID)->where('ActiveStatus','Active')->where('DFlag',0)->pluck('PID')->toArray();
                                        if (!empty($PostalCodeIDs)) {
                                            foreach($PostalCodeIDs as $row){
                                                $DetailID = DocNum::getDocNum(docTypes::VendorServiceLocation->value);
                                                $tdata=array(
                                                    "DetailID"=>$DetailID,
                                                    "VendorID"=>$VendorID,
                                                    "ServiceBy"=>$ServiceBy,
                                                    "StateID" => $data->StateID,
                                                    "DistrictID"=>$item->DistrictID,
                                                    "PostalCodeID"=>$row,
                                                    "CreatedOn"=>date("Y-m-d H:i:s")
                                                );
                                                $status=DB::Table('tbl_vendors_service_locations')->insert($tdata);
                                                if($status){
                                                    DocNum::updateDocNum(docTypes::VendorServiceLocation->value);
                                                }
                                            }
                                        }else{
                                            $DetailID = DocNum::getDocNum(docTypes::VendorServiceLocation->value);
                                            $tdata=array(
                                                "DetailID"=>$DetailID,
                                                "VendorID"=>$VendorID,
                                                "ServiceBy"=>$ServiceBy,
                                                "StateID" => $data->StateID,
                                                "DistrictID"=>$item->DistrictID,
                                                "CreatedOn"=>date("Y-m-d H:i:s")
                                            );
                                            $status=DB::Table('tbl_vendors_service_locations')->insert($tdata);
                                            if($status){
                                                DocNum::updateDocNum(docTypes::VendorServiceLocation->value);
                                            }
                                        }
                                    }
                                }
                            }
                            if (!empty($DistrictIDs)) {
                                DB::Table('tbl_vendors_service_locations')->where('VendorID',$VendorID)->where('ServiceBy',$ServiceBy)->WhereIn('DistrictID',$DistrictIDs)->update(['DFlag'=>0,'UpdatedOn'=>date('Y-m-d H:i:s')]);
                                DB::Table('tbl_vendors_service_locations')->where('VendorID',$VendorID)->where('ServiceBy',$ServiceBy)->WhereNotIn('DistrictID',$DistrictIDs)->update(['DFlag'=>1,'UpdatedOn'=>date('Y-m-d H:i:s')]);
                                $status=true;
                            }
                        }elseif($ServiceBy == "PostalCode"){
                            $PostalCodeIDs=[];
                            foreach($ServiceData as $data){
                                foreach($data->Districts as $item){
                                    foreach($item->PostalCodeIDs as $row){
                                        $PostalCodeIDs[] = $row;
                                        $t=DB::Table('tbl_vendors_service_locations')->where('VendorID',$VendorID)->where('ServiceBy',$ServiceBy)->Where('PostalCodeID',$row)->first();
                                        if(!$t){
                                            $DetailID = DocNum::getDocNum(docTypes::VendorServiceLocation->value);
                                            $tdata=array(
                                                "DetailID"=>$DetailID,
                                                "VendorID"=>$VendorID,
                                                "ServiceBy"=>$ServiceBy,
                                                "StateID" => $data->StateID,
                                                "DistrictID"=>$item->DistrictID,
                                                "PostalCodeID"=>$row,
                                                "CreatedOn"=>date("Y-m-d H:i:s")
                                            );
                                            $status=DB::Table('tbl_vendors_service_locations')->insert($tdata);
                                            if($status){
                                                DocNum::updateDocNum(docTypes::VendorServiceLocation->value);
                                            }
                                        }
                                    }
                                }
                            }
                            if (!empty($PostalCodeIDs)) {
                                DB::Table('tbl_vendors_service_locations')->where('VendorID',$VendorID)->where('ServiceBy',$ServiceBy)->WhereIn('PostalCodeID',$PostalCodeIDs)->update(['DFlag'=>0,'UpdatedOn'=>date('Y-m-d H:i:s')]);
                                DB::Table('tbl_vendors_service_locations')->where('VendorID',$VendorID)->where('ServiceBy',$ServiceBy)->WhereNotIn('PostalCodeID',$PostalCodeIDs)->update(['DFlag'=>1,'UpdatedOn'=>date('Y-m-d H:i:s')]);
                                $status=true;
                            }
                        }else{
                            $status = false;
                        }
                        DB::Table('tbl_vendors_service_locations')->where('VendorID',$VendorID)->whereNot('ServiceBy',$ServiceBy)->update(['DFlag'=>1,'UpdatedOn'=>date('Y-m-d H:i:s')]);
                        DB::table('tbl_vendors')->where('VendorID',$VendorID)->update(['ServiceBy'=>$ServiceBy]);
                    }

                    //stock points details
                    if($status && !empty($VendorDetails->StockPoints)){
                        $tStockPoints=array();
                        foreach($VendorDetails->StockPoints as $data){
                            $tStockPoints[]=$data->UUID;
                            $t=DB::Table('tbl_vendors_stock_point')->where('VendorID',$VendorID)->Where('UUID',$data->UUID)->first();
                            if($t){
                                $tdata=array(
                                    "PointName"=>$data->PointName,
                                    "Address"=>$data->Address,
                                    "PostalID"=>$data->PostalID,
                                    "CityID"=>$data->CityID,
                                    "TalukID"=>$data->TalukID,
                                    "DistrictID"=>$data->DistrictID,
                                    "StateID"=>$data->StateID,
                                    "CountryID"=>$data->CountryID,
                                    "UpdatedOn"=>date("Y-m-d H:i:s")
                                );
                                $status=DB::Table('tbl_vendors_stock_point')->where('VendorID',$VendorID)->Where('UUID',$data->UUID)->update($tdata);
                            }else{
                                $DetailID = DocNum::getDocNum(docTypes::VendorStockPoint->value);
                                $tdata=array(
                                    "DetailID"=>$DetailID,
                                    "VendorID"=>$VendorID,
                                    "UUID"=>$data->UUID,
                                    "PointName"=>$data->PointName,
                                    "Address"=>$data->Address,
                                    "PostalID"=>$data->PostalID,
                                    "CityID"=>$data->CityID,
                                    "TalukID"=>$data->TalukID,
                                    "DistrictID"=>$data->DistrictID,
                                    "StateID"=>$data->StateID,
                                    "CountryID"=>$data->CountryID,
                                    "CreatedOn"=>date("Y-m-d H:i:s")
                                );
                                $status=DB::Table('tbl_vendors_stock_point')->insert($tdata);
                                if($status){
                                    DocNum::updateDocNum(docTypes::VendorStockPoint->value);
                                }
                            }
                        }
                        if($status && count($tStockPoints)>0){
                            $sql="Select UUID From tbl_vendors_stock_point Where VendorID='".$VendorID."' and UUID not in('".implode("','",$tStockPoints)."')";
                            $result=DB::SELECT($sql);
                            for($m=0;$m<count($result);$m++){
                                if($status){
                                    $status=DB::Table('tbl_vendors_stock_point')->where('VendorID',$VendorID)->where('UUID',$result[$m]->UUID)->update(array("DFlag"=>1,"DeletedOn"=>date("Y-m-d H:i:s")));
                                }
                            }
                        }
                    }

                    //Documents
                    if($status && isset($VendorDetails->Documents) && !empty($VendorDetails->Documents)){
                        $tDocuments=array();
                        foreach($VendorDetails->Documents as $ImgID=>$Document){
                            if($status){
                                $tDocuments[]=$ImgID;
                                if($Document->referData->isTemp =="1" && file_exists($Document->uploadPath) ){
                                    $fileName1=$Document->fileName!=""?$Document->fileName:Helper::RandomString(10)."png";
                                    copy($Document->uploadPath,$dDir.$fileName1);
                                    $DocUrl=$dDir.$fileName1;
                                    $RemoveImg[]=$Document->uploadPath;
                                    $uploadingImgs[]=$DocUrl;
                                    $t=DB::Table('tbl_vendors_document')->where('VendorID',$VendorID)->where('ImgID',$ImgID)->get();
                                    if(count($t)>0){
                                        $tdata=array(
                                            "documents"=>$DocUrl,
                                            "CreatedOn"=>date("Y-m-d H:i:s")
                                        );
                                        $status=DB::Table('tbl_vendors_document')->where('VendorID',$VendorID)->where('ImgID',$ImgID)->update($tdata);
                                    }else{
                                        $tdata=array(
                                            "SLNO"=>DocNum::getDocNum(docTypes::VendorDocuments->value),
                                            "VendorID"=>$VendorID,
                                            "ImgID"=>$ImgID,
                                            "documents"=>$DocUrl,
                                            "CreatedOn"=>date("Y-m-d H:i:s")
                                        );
                                        $status=DB::Table('tbl_vendors_document')->insert($tdata);
                                        if($status){
                                            DocNum::updateDocNum(docTypes::VendorDocuments->value);
                                        }
                                    }
                                }
                            }
                        }
                        if($status && count($tDocuments)>0){
                            $sql="Select SLNO,documents From tbl_vendors_document Where VendorID='".$VendorID."'  and ImgID not in('".implode("','",$tDocuments)."')";
                            $result=DB::SELECT($sql);
                            for($m=0;$m<count($result);$m++){
                                if($status){
                                    $RemoveImg[]=$result[$m]->documents;
                                    $status=DB::Table('tbl_vendors_document')->where('SLNO',$result[$m]->SLNO)->delete();
                                }
                            }
                        }
                    }

                    // $status = true;
                }catch(Exception $e) {
                    $status=false;
                }
                if($status==true){
                    DB::commit();
                    $this->deleteTmpVendorData($VendorID);
                    // $logData=array("Description"=>"Vendor Updated ","ModuleName"=>$this->ActiveMenuName,"Action"=>cruds::UPDATE->value,"ReferID"=>$VendorID,"OldData"=>$OldData,"NewData"=>$NewData,"IP"=>$VendorDetails->ip());
                    foreach($DeletedFiles as $Url){
                        // Helper::removeFile($Img);
                    }
                    return array('status'=>true,'message'=>"Vendor Updated Successfully");
                }else{
                    DB::rollback();
                    foreach($UploadedFiles as $Url){
                        // Helper::removeFile($Img);
                    }
                    return array('status'=>false,'message'=>"Vendor Update Failed");
                }
            }
        }

        return response()->json([
            'status' => false,
            'message' => 'VENDOR UPDATE FAILED',
        ]);
    }
    public function Login(Request $req){
		$rules=array(
			'email' => 'required|email:filter',
			'password' => 'required',
			'fcmToken' => 'required',
		);
		$message=array(
		    'fcmToken.required'=>'Firebase Cloud Message Token is required'
		);

		$validator = Validator::make($req->all(), $rules,$message);
			
		if ($validator->fails()) {
			return array('status'=>false,'message'=>"Login failed",'errors'=>$validator->errors());			
		}
        $return=array('status'=>false);
        $result=DB::Table('users')->where('UserName',$req->email)->get();
        if(count($result)>0){
            if(($result[0]->DFlag==0)&&($result[0]->ActiveStatus=='Active')&&($result[0]->isLogin==1)){
                if(Auth::attempt(['UserName'=>$req->email,'password'=>$req->password,'ActiveStatus' => 1,'DFlag' => 0,'isLogin' => 1])){
                    $token=auth()->user()->createToken('Token')->accessToken;
					DB::Table('users')->where('UserID',Auth()->user()->UserID)->update(array("fcmToken"=>$req->fcmToken));
                    $userInfo=helper::getUserInfo(Auth()->user()->UserID);
                    
                    $return=array(
						"status"=>true,
						"message"=>"Successfully Logged in",
						"data"=>array(
							"token"=>$token,
							"email"=>Auth()->user()->email,
							"userID"=>Auth()->user()->UserID,
							"user_data"=> $userInfo['status']==true?$userInfo['data']:array(),
                        )
					);
                    /* if(count($return['data']['user_data'])>0){
                        $return['data']['user_data']=$return['data']['user_data'][0];
                    } */
                    
                }else{
                    $return['message']='login failed';
                    $return['password']='The user name and password not match.';
                }
            }elseif($result[0]->DFlag==1){
                $return['message']='Your account has been deleted.';
            }elseif($result[0]->ActiveStatus==0){
                $return['message']='Your account has been disabled.';
            }elseif($result[0]->isLogin==0){
                $return['message']='You dont have login rights.';
            }
        }else{
            $return['message']='login failed';
            $return['email']='User name does not exists. please verify user name.';
        }
        return $return;
    }
    public function RegisteredDetails(request $req){
        $Data = DB::Table('tbl_vendors')->where('ActiveStatus','Active')->where('VendorName',$req->VendorName)->where('DFlag',0)->first();
        // return $Data;
        $Data->PCategories =$Data->PCategories ? unserialize($Data->PCategories) : [];
		$return = [
			'status' => 'true',
			'data' => $Data,
		];
        return response()->json($return);
	}
    public function getVendorData(request $req){
        $VendorID=$req->VendorID;
		$VendorDetails = DB::table('tbl_vendors')->where('DFlag',0)->where('ActiveStatus','Active')/* ->where('isApproved',1) */->where('VendorID',$VendorID)->first();
        if($VendorDetails){
            $Vehicles = DB::table('tbl_vendors_vehicle')->where('DFlag',0)->where('VendorID',$VendorID)->get();
            if(!empty($Vehicles)){
                foreach($Vehicles as $item){
                    $item->Images= DB::table('tbl_vendors_vehicle_images')->where('VendorID',$VendorID)->where('UUID',$item->UUID)->get();
                }
            }
            $VendorDetails->Vehicles = $Vehicles;
            $VendorDetails->SupplyDetails = DB::table('tbl_vendors_supply')->where('DFlag',0)->where('VendorID',$VendorID)->get();
            $VendorDetails->StockPoints = DB::table('tbl_vendors_stock_point')->where('DFlag',0)->where('VendorID',$VendorID)->get();

            $ServiceLocation = DB::table('tbl_vendors_service_locations')->where('DFlag',0)->where('VendorID',$VendorID)->groupBy('StateID','ServiceBy')->select('StateID','ServiceBy')->get();
            $ServiceLocations = [
                'ServiceBy'=> $ServiceLocation[0]->ServiceBy,
                'ServiceData'=> [],
            ];
			foreach ($ServiceLocation as $item) {
				$item->Districts = DB::table('tbl_vendors_service_locations')->where('DFlag',0)->where('VendorID', $VendorID)->where('StateID', $item->StateID)->groupBy('DistrictID')->select('DistrictID')->get();
				foreach ($item->Districts as $row){
					$postalCodeIDs  = DB::table('tbl_vendors_service_locations')->where('DFlag',0)->where('StateID',$item->StateID)->where('DistrictID',$row->DistrictID)->where('VendorID',$VendorID)->pluck('PostalCodeID')->toArray();
                    if (count($postalCodeIDs) > 0) {
                        $row->PostalCodeIDs = $postalCodeIDs;
                    }
                }
                unset($item->ServiceBy);
                $ServiceLocations['ServiceData'][] = $item;
			}
            $VendorDetails->ServiceLocations = $ServiceLocations;
            
            return $VendorDetails;
        }
	}
    public function getTmpVendorData($VendorID){
		$VendorDetails = DB::table($this->tmpDB.'tbl_vendors')->where('VendorID',$VendorID)->first();
        if($VendorDetails){
            $Vehicles = DB::table($this->tmpDB.'tbl_vendors_vehicle')->where('VendorID',$VendorID)->get();
            if(!empty($Vehicles)){
                foreach($Vehicles as $item){
                    $item->Images= DB::table($this->tmpDB.'tbl_vendors_vehicle_images')->where('VendorID',$VendorID)->where('UUID',$item->UUID)->get();
                }
            }
            $VendorDetails->Vehicles = $Vehicles;
            $VendorDetails->SupplyDetails = DB::table($this->tmpDB.'tbl_vendors_supply')->where('VendorID',$VendorID)->get();
            $VendorDetails->StockPoints = DB::table($this->tmpDB.'tbl_vendors_stock_point')->where('VendorID',$VendorID)->get();

            $ServiceLocation = DB::table($this->tmpDB.'tbl_vendors_service_locations')->where('VendorID',$VendorID)->groupBy('StateID','ServiceBy')->select('StateID','ServiceBy')->get();
            $ServiceLocations = [
                'ServiceBy'=> $ServiceLocation[0]->ServiceBy,
                'ServiceData'=> [],
            ];
			foreach ($ServiceLocation as $item) {
				$item->Districts = DB::table($this->tmpDB.'tbl_vendors_service_locations')->where('VendorID', $VendorID)->where('StateID', $item->StateID)->groupBy('DistrictID')->select('DistrictID')->get();
				foreach ($item->Districts as $row){
					$postalCodeIDs  = DB::table($this->tmpDB.'tbl_vendors_service_locations')->where('StateID',$item->StateID)->where('DistrictID',$row->DistrictID)->where('VendorID',$VendorID)->pluck('PostalCodeID')->toArray();
                    if (count($postalCodeIDs) > 0) {
                        $row->PostalCodeIDs = $postalCodeIDs;
                    }
                }
                unset($item->ServiceBy);
                $ServiceLocations['ServiceData'][] = $item;
			}
            $VendorDetails->ServiceLocations = $ServiceLocations;
            
            return $VendorDetails;
        }
	}
    public function deleteTmpVendorData($VendorID) {
        DB::table($this->tmpDB.'tbl_vendors_vehicle_images')->where('VendorID', $VendorID)->delete();
    
        DB::table($this->tmpDB.'tbl_vendors_vehicle')->where('VendorID', $VendorID)->delete();
    
        DB::table($this->tmpDB.'tbl_vendors_supply')->where('VendorID', $VendorID)->delete();
    
        DB::table($this->tmpDB.'tbl_vendors_stock_point')->where('VendorID', $VendorID)->delete();
    
        DB::table($this->tmpDB.'tbl_vendors_service_locations')->where('VendorID', $VendorID)->delete();
    
        DB::table($this->tmpDB.'tbl_vendors')->where('VendorID', $VendorID)->delete();
    }
    
    public function getUserInfo(Request $req){
        return helper::getUserInfo(Auth()->user()->UserID);
    }

    public function Validation(Request $req){
        if ($req->has('General') && $req->General != null) {
            $GeneralData = json_decode($req->General, true);
            $ValidDB=[];
                        
            $ValidDB['Country']['TABLE']=$this->generalDB."tbl_countries";
            $ValidDB['Country']['ErrMsg']="Country name does not exist";
            $ValidDB['Country']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$GeneralData['CountryID']);
            $ValidDB['Country']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>"Active");
            $ValidDB['Country']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

            $ValidDB['State']['TABLE']=$this->generalDB."tbl_states";
            $ValidDB['State']['ErrMsg']="State name does not exist";
            $ValidDB['State']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$GeneralData['CountryID']);
            $ValidDB['State']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$GeneralData['StateID']);
            $ValidDB['State']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>"Active");
            $ValidDB['State']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

            $ValidDB['District']['TABLE']=$this->generalDB."tbl_districts";
            $ValidDB['District']['ErrMsg']="District name does not exist";
            $ValidDB['District']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$GeneralData['CountryID']);
            $ValidDB['District']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$GeneralData['StateID']);
            $ValidDB['District']['WHERE'][]=array("COLUMN"=>"DistrictID","CONDITION"=>"=","VALUE"=>$GeneralData['DistrictID']);
            $ValidDB['District']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>"Active");
            $ValidDB['District']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

            $ValidDB['Taluk']['TABLE']=$this->generalDB."tbl_taluks";
            $ValidDB['Taluk']['ErrMsg']="Taluk name does not exist";
            $ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$GeneralData['CountryID']);
            $ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$GeneralData['StateID']);
            $ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"DistrictID","CONDITION"=>"=","VALUE"=>$GeneralData['DistrictID']);
            $ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"TalukID","CONDITION"=>"=","VALUE"=>$GeneralData['TalukID']);
            $ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>"Active");
            $ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

            $ValidDB['PostalCode']['TABLE']=$this->generalDB."tbl_postalcodes";
            $ValidDB['PostalCode']['ErrMsg']="Postal Code does not exist";
            $ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$GeneralData['CountryID']);
            $ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$GeneralData['StateID']);
            $ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"DistrictID","CONDITION"=>"=","VALUE"=>$GeneralData['DistrictID']);
            $ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"PID","CONDITION"=>"=","VALUE"=>$GeneralData['PostalCodeID']);
            $ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>"Active");
            $ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

            $ValidDB['City']['TABLE']=$this->generalDB."tbl_cities";
            $ValidDB['City']['ErrMsg']="City Name does not exist";
            $ValidDB['City']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$GeneralData['CountryID']);
            $ValidDB['City']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$GeneralData['StateID']);
            $ValidDB['City']['WHERE'][]=array("COLUMN"=>"DistrictID","CONDITION"=>"=","VALUE"=>$GeneralData['DistrictID']);
            $ValidDB['City']['WHERE'][]=array("COLUMN"=>"TalukID","CONDITION"=>"=","VALUE"=>$GeneralData['TalukID']);
            $ValidDB['City']['WHERE'][]=array("COLUMN"=>"PostalID","CONDITION"=>"=","VALUE"=>$GeneralData['PostalCodeID']);
            $ValidDB['City']['WHERE'][]=array("COLUMN"=>"CityID","CONDITION"=>"=","VALUE"=>$GeneralData['CityID']);
            $ValidDB['City']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>"Active");
            $ValidDB['City']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

            $rules = [
                'VendorName' => ['required', 'max:50', new ValidUnique(array("TABLE" => "tbl_vendors", "WHERE" => " VendorName='" . $GeneralData['VendorName'] . "' and VendorID<>'".$GeneralData['VendorID']."'  "), "This Vendor Name is already taken.")],
                'VendorCoName' => ['required','max:50', new ValidUnique(array("TABLE" => "tbl_vendors", "WHERE" => " VendorCoName='" . $GeneralData['VendorCoName'] . "' "), "This Vendor Company Name is already taken.")],
                'VendorCoWebsite' => ['max:50', new ValidUnique(array("TABLE" => "tbl_vendors", "WHERE" => " VendorCoWebsite='" . $GeneralData['VendorCoWebsite'] . "' "), "This Vendor Company Website is already taken.")],
                'GSTNo' => ['required', 'regex:/^\d{2}[A-Z]{5}\d{4}[A-Z]{1}\d[Z]{1}[0-9A-Z]{1}$/'],
                'MobileNumber1' => ['required', 'regex:/^[0-9]{10}$/'],
                'MobileNumber2' => ['nullable', 'regex:/^[0-9]{10}$/'],
                'CountryID' => ['required', new ValidDB($ValidDB['Country'])],
                'StateID' => ['required', new ValidDB($ValidDB['State'])],
                'DistrictID' => ['required', new ValidDB($ValidDB['District'])],
                'TalukID' => ['required', new ValidDB($ValidDB['Taluk'])],
                'PostalCodeID' => ['required', new ValidDB($ValidDB['PostalCode'])],
                'CityID' => ['required', new ValidDB($ValidDB['City'])],
            ];

            $messages = [
                'Logo.mimes' => "The Logo field must be a file of type: " . implode(", ", $this->FileTypes['category']['Images']) . ".",
                'VendorCoName.required' => 'Vendor Company Name is required',
                'MobileNumber1.regex' => 'Mobile Number 1 should be 10 digits',
                'MobileNumber2.regex' => 'Mobile Number 2 should be 10 digits',
                'GSTNo.regex' => 'Invalid GST Number Format',
                'GSTNo.required' => 'GST Number is Required',
            ];

            if (!empty($GeneralData['Email'])) {
                $rules['Email'] = ['required', 'email:filter', new ValidUnique(array("TABLE" => "tbl_vendors", "WHERE" => " EMail='" . $GeneralData['EMail'] . "' and VendorID<>'".$GeneralData['VendorID']."'  "), "This Email is already taken.")];
            }

            if ($req->hasFile('Logo')) {
                $rules['Logo'] = 'mimes:' . implode(",", $this->FileTypes['category']['Images']);
            }

            $validator = Validator::make($GeneralData, $rules, $messages);

            if ($validator->fails()) {
                return array('status' => false, 'message' => "Vendor Register Failed", 'errors' => $validator->errors());
            }
        }
    }

}
