<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use logs;

class LanguageAPIController extends Controller
{

    public function guestTranslations($page, $lang)
    {
        $filePath = resource_path('lang/'.$lang.'/'.$page.'.php');

        if (!file_exists($filePath)) {
            return response()->json([
                'error' => 'Language file not found'
            ], 404);
        }

        $translations = include $filePath;

        return response()->json([
            'translations' => $translations
        ]);

    }

    public function customerTranslations(Request $request)
    {
        $customer = $request->auth_customer;
        $validator = Validator::make($request->all(), [
            'page' => 'required|string',
        ]);

        // Check if validation fails
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()->first()
            ], 422);
        }

        $lang = $customer->language ?? 'en';
        $page = $request->input('page');

        $filePath = resource_path('lang/'.$lang.'/'.$page.'.php');

        // Check if the language file exists
        if (!file_exists($filePath)) {
            return response()->json([
                'error' => 'Language file not found'
            ], 404);
        }

        // Return the translations as a JSON response
        return response()->json([
            'translations' => include $filePath
        ]);

    }
}
