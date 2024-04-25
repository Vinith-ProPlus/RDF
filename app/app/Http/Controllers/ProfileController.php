<?php

namespace App\Http\Controllers;

use App\enums\activeMenuNames;
use App\helper\helper;
use App\Http\Controllers\web\logController;
use App\Http\Requests\ProfileUpdateRequest;
use App\Models\Gender;
use App\Models\general;
use App\Models\UserRole;
use Exception;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Illuminate\View\View;

class ProfileController extends Controller
{
    private $general;
    private $UserID;
    private $ActiveMenuName;
    private $PageTitle;
    private $CRUD;
    private $Settings;
    private $Menus;
    private $generalDB;
    private $FileTypes;
    private $request;


    public function __construct()
    {
        $this->ActiveMenuName = activeMenuNames::ManageCustomers->value;
        $this->PageTitle = "Profile";
        $this->middleware('auth');
        $this->middleware(function ($request, $next) {
            $this->UserID = auth()->user()->UserID;
            $this->general = new general($this->UserID, $this->ActiveMenuName);
            $this->Menus = $this->general->loadMenu();
            $this->CRUD = $this->general->getCrudOperations($this->ActiveMenuName);
            $this->Settings = $this->general->getSettings();
            $this->generalDB = Helper::getGeneralDB();
            $this->FileTypes = Helper::getFileTypes(array("category" => array("Images")));
            $this->request = $request;
            return $next($request);
        });
    }

//    public function view(Request $req)
//    {
//        if ($this->general->isCrudAllow($this->CRUD, "view")) {
//            $FormData = $this->general->UserInfo;
//            $FormData['ActiveMenuName'] = $this->ActiveMenuName;
//            $FormData['PageTitle'] = $this->PageTitle;
//            $FormData['menus'] = $this->Menus;
//            $FormData['crud'] = $this->CRUD;
//            $FormData['isEdit'] = false;
//            $FormData['FileTypes']=$this->FileTypes;
//            $FormData['profile'] = auth()->user();
//            $FormData['country'] = auth()->user();
//            $FormData['states'] = auth()->user();
//            $FormData['city'] = auth()->user();
//            return view('profile.view', $FormData);
//        } else {
//            return view('errors.403');
//        }
//    }

    public function view(Request $req)
    {
        if ($this->general->isCrudAllow($this->CRUD, "view")) {
            $FormData = $this->general->UserInfo;
            $FormData['menus'] = $this->Menus;
            $FormData['crud'] = $this->CRUD;
            $FormData['ActiveMenuName'] = $this->ActiveMenuName;
            $FormData['PageTitle'] = $this->PageTitle;
            $FormData['isEdit'] = false;
            $FormData['SETTINGS'] = $this->Settings;
            $FormData['FileTypes'] = $this->FileTypes;
            $FormData['EditData'] = auth()->user();
            $FormData['EditData']->PostalCode = DB::table($this->generalDB . 'tbl_postalcodes as P')->where('PID', $FormData['EditData']->PostalCodeID)->value('PostalCode');
            return view('profile.profile', $FormData);
        } else {
            return view('errors.403');
        }
    }
    public function edit(Request $req)
    {
        if ($this->general->isCrudAllow($this->CRUD, "edit")) {
            $FormData = $this->general->UserInfo;
            $FormData['menus'] = $this->Menus;
            $FormData['crud'] = $this->CRUD;
            $FormData['ActiveMenuName'] = $this->ActiveMenuName;
            $FormData['PageTitle'] = $this->PageTitle;
            $FormData['isEdit'] = true;
            $FormData['SETTINGS'] = $this->Settings;
            $FormData['FileTypes'] = $this->FileTypes;
            $FormData['genders'] = Gender::all();
            $FormData['user_roles'] = UserRole::all();
            $FormData['EditData'] = auth()->user();
            $FormData['EditData']->PostalCode = DB::table($this->generalDB . 'tbl_postalcodes as P')->where('PID', $FormData['EditData']->PostalCodeID)->value('PostalCode');
            return view('profile.profile', $FormData);
        } else {
            return view('errors.403');
        }
    }

    /**
     * Update the user's profile information.
     */
    public function update(ProfileUpdateRequest $request)
    {
        if ($this->general->isCrudAllow($this->CRUD, "edit")) {
            $OldData = auth()->user();
            DB::beginTransaction();
            try {
                $profileData = $request->all();

                if ($request->ProfileImageUrl && Helper::isJSON($request->ProfileImageUrl)) {
                    $ProfileImage = "";
                    $dir = "profile_images/";
                    if (!file_exists($dir)) {
                        mkdir($dir, 0777, true);
                    }
                    $Img = json_decode($request->ProfileImageUrl);
                    if (file_exists($Img->uploadPath)) {
                        $newFileName = $Img->fileName != "" ? $Img->fileName : Helper::RandomString(10) . "png";
                        copy($Img->uploadPath, $dir . $newFileName);
                        $ProfileImage = $dir . $newFileName;
                        unlink($Img->uploadPath);
                    }
                    if (file_exists("profile_images/" . $OldData->ProfileImage)) {
                        unlink("profile_images/" . $OldData->ProfileImage);
                    }
                    if (file_exists($ProfileImage)) {
                        Helper::ImageResize($ProfileImage, $dir);
                    }
                    $profileData['ProfileImage'] = $newFileName;
                }

                $request->user()->fill($profileData);

                $request->user()->save();
                $logData = array("Description" => "Profile details Updated ", "ModuleName" => "Profile", "Action" => "Update", "ReferID" => $OldData->UserID, "OldData" => $OldData, "NewData" => $request, "UserID" => $this->UserID, "IP" => $request->ip());
                logController::Store($logData);
                DB::commit();
                return array('status' => true, 'message' => "Profile Updated Successfully");
            } catch (Exception $e) {
                logger($e);
                DB::rollback();
                return array('status' => false, 'message' => "Profile Update Failed");
            }
        } else {
            return array('status' => false, 'message' => 'Access denied');
        }
    }

    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current_password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }
}
