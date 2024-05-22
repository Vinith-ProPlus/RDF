<?php

namespace App\Http\Controllers\web\Settings;

use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Models\Translation;
use App\Models\TranslationKey;
use App\Traits\ApiResponse;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use App\Models\DocNum;
use App\Models\general;
use App\Models\ServerSideProcess;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\enums\cruds;

use App\Rules\ValidUnique;
use App\Rules\ValidDB;
use App\Http\Controllers\web\logController;
use stdClass;

class TranslationController extends Controller
{
    use ApiResponse;
    private $general;
    private $DocNum;
    private $UserID;
    private $LoginType;
    private $ActiveMenuName;
    private $PageTitle;
    private $CRUD;
    private $logs;
    private $Settings;
    private $Menus;

    public function __construct()
    {
        $this->ActiveMenuName = "Translations";
        $this->PageTitle = "Translations";
        $this->middleware('auth');
        $this->DocNum = new DocNum();

        $this->middleware(function ($request, $next) {
            $this->UserID = auth()->user()->UserID;
            $this->LoginType = auth()->user()->LoginType;
            $this->general = new general($this->UserID, $this->ActiveMenuName, auth()->user()->LoginType);
            $this->Menus = $this->general->loadMenu();
            $this->CRUD = $this->general->getCrudOperations($this->ActiveMenuName);
            $this->Settings = $this->general->getSettings();
            return $next($request);
        });
    }

    public function index(Request $req)
    {
        if ($this->general->isCrudAllow($this->CRUD, "edit")) {
            $FormData = $this->general->UserInfo;
            $FormData['ActiveMenuName'] = $this->ActiveMenuName;
            $FormData['PageTitle'] = $this->PageTitle;
            $FormData['isEdit'] = true;
            $FormData['menus'] = $this->Menus;
            $FormData['crud'] = $this->CRUD;
            $FormData['languages'] = Language::with('translations')->active()->get();

            foreach ($FormData['languages'] as $language) {
                $translationsValue = json_decode($language->translations->value);
                $translationsValue = $translationsValue ?? new stdClass();
                $language->translations_value = $translationsValue;
            }
            $FormData['translation_keys'] = TranslationKey::all();
            if (count($FormData['languages']) > 0) {
                return view('app.settings.translations.edit', $FormData);
            } else {
                return view('errors.400');
            }
        }
    }

    public function Update(Request $request)
    {
        if ($this->general->isCrudAllow($this->CRUD, "edit")) {
            $validatedData = Validator::make($request->all(), [
                'language_id' => 'required|integer|exists:languages,id',
                'value' => 'required'
            ]);

            if ($validatedData->fails()) {
                return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
            }
            DB::beginTransaction();
            try {
                $OldData = Translation::where('language_id', $request->language_id)->first();
                if($OldData){
                    $newTranslations = json_decode($request->value);
                    $existingTranslations = json_decode($OldData->value);
                    if (!$existingTranslations) {
                        $existingTranslations = new stdClass();
                    }
                    foreach ($newTranslations as $key => $value) {
                        $existingTranslations->$key = $value;
                    }
                    $value = json_encode($existingTranslations);
                    $NewData = Translation::where('language_id', $request->language_id)->update(['value' => $value]);
                } else {
                    $NewData = Translation::create(['language_id' => $request->language_id, 'value' => $request->value]);
                }
                DB::commit();
                $logData = array("Description" => "Translation updated", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::UPDATE, "ReferID" => $request->language_id, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $request->ip());
                logController::Store($logData);
                return array('status' => true, 'message' => "Translation updated successfully");
            } catch (Exception $e) {
                logger($e);
                DB::rollback();
                return array('status' => false, 'message' => "Translation update failed");
            }
        } else {
            return response(array('status' => false, 'message' => "Access Denied"), 403);
        }
    }
}
