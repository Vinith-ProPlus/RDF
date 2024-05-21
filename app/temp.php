<?php

use App\helper\helper;
use Illuminate\Support\Facades\DB;
use stdClass;

$countries = DB::table('rdf_general.tbl_countries')->get();
$country = DB::table('rdf_general.tbl_countries')->first();

foreach ($countries as $country) {
    $std = new stdClass();
    $std->en = $country->CountryName;
    $std->ta = App\helper\helper::translate($country->CountryName, 'ta');

    DB::table('rdf_general.tbl_countries')
        ->where('CountryID', $country->CountryID)
        ->update(['CountryNameInTranslation' => json_encode($std)]);
}

$states = DB::table('rdf_general.tbl_states')->where('StateNameInTranslation', "{}")->get();

if($states->count() > 0) {
    foreach ($states as $state) {
        $std = new stdClass();
        $std->en = $state->StateName;
        $std->ta = App\helper\helper::translate($state->StateName, 'ta');

        echo DB::table('rdf_general.tbl_states')
            ->where('StateID', $state->StateID)
            ->update(['StateNameInTranslation' => json_encode($std)]);
    }
    echo "State Translation finished.";
}


$cities = DB::table('rdf_general.tbl_cities')->where('CityNameInTranslation', "{}")->get();

if($cities->count() > 0) {
    foreach ($cities as $city) {
        $std = new stdClass();
        $std->en = $city->CityName;
        $std->ta = App\helper\helper::translate($city->CityName, 'ta');

        DB::table('rdf_general.tbl_cities')
            ->where('CityID', $city->CityID)
            ->update(['CityNameInTranslation' => json_encode($std)]);
    }
    echo "City Name Translation finished.";
}

$districts = DB::table('rdf_general.tbl_districts')->where('DistrictNameInTranslation', "{}")->get();
$districtsCount = $districts->count();
if($districtsCount > 0) {
    foreach ($districts as $district) {
        $processingDataCount = 0;
        $std = new stdClass();
        $std->en = $district->DistrictName;
        $std->ta = App\helper\helper::translate($district->DistrictName, 'ta');

        $processingDataCount += DB::table('rdf_general.tbl_districts')
            ->where('DistrictID', $district->DistrictID)
            ->update(['DistrictNameInTranslation' => json_encode($std)]);
        $progressPercentage = ($processingDataCount / $districtsCount) * 100;
        echo "Progress: " . round($progressPercentage, 2) . "%\n";
    }
    echo "District Name Translation finished.";
}












?>
