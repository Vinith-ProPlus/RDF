<?php

namespace App\Http\Controllers\api\customer;

use App\helper\helper;
use App\Http\Controllers\Controller;
use App\Models\Coupon;
use App\Models\MobileUpdate;
use App\Models\ProductReview;
use App\Traits\ApiResponse;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class MasterController extends Controller
{
    use ApiResponse;

//    General Data
    public function latestMobileVersion(){
        return [
            'status' => true,
            'data' => MobileUpdate::first(),
        ];
    }
    public function getGender(request $req){
        $return = [
            'status' => true,
            'data' => Helper::getGender(),
        ];
        return $return;
    }
    public function getCountry(request $req){
        $return = [
            'status' => true,
            'data' => Helper::getCountry(),
        ];
        return $return;
    }

    public function getPostalCode(request $req){
        $return = [
            'status' => true,
            'data' => Helper::getPostalCode(array("CountryID"=>$req->CountryID,"StateID"=>$req->StateID,"DistrictID"=>$req->DistrictID,"TalukID"=>$req->TalukID)),
        ];
        return $return;
    }
    public function getState(request $req){
        logger("state");
        $return = [
            'status' => true,
            'data' => Helper::getState(array("CountryID"=>$req->CountryID)),
        ];
        return $return;
    }
    public function getDistrict(request $req){
        $return = [
            'status' => true,
            'data' => Helper::getDistrict(array("CountryID"=>$req->CountryID,"StateID"=>$req->StateID)),
        ];
        return $return;
    }

    public function getCity(Request $req){
        $data = Helper::getCity(["CountryID" => $req->CountryID,"StateID" => $req->StateID,"DistrictID" => $req->DistrictID,"TalukID" => $req->TalukID,"PostalID" => $req->PostalID,"PostalCode" => $req->PostalCode,]);

        if (isset($data['error'])) {
            $return = [
                'status' => false,
                'message' => $data['error'],
                'data' => [],
            ];
        } else {
            $return = [
                'status' => true,
                'data' => $data,
            ];
        }
        return $return;
    }
    public function getPriceRanges(){
        return [
            'status' => true,
            'data' => collect([["key" => "0,200", "value" => "₹ 0 - 200"], ["key" => "200,400", "value" => "₹ 200 - 400"], ["key" => "400,600", "value" => "₹ 400 - 600"],
                ["key" => "600,1000", "value" => "₹ 600 - 1000"], ["key" => "1000,2000", "value" => "₹ 1000 - 2000"], ["key" => "2000,4000", "value" => "₹ 2000 - 4000"],
                ["key" => "4000,6000", "value" => "₹ 4000 - 6000"], ["key" => "6000,8000", "value" => "₹ 6000 - 8000"], ["key" => "8000,1000000", "value" => "₹ 8000 & more"]])
        ];
    }

//    Product Data
    public function GetCategoryType(Request $req){
        $pageNo = $req->PageNo ?? 1;
        $perPage = 15;

        $Category = DB::table('tbl_product_category_type')
            ->where('ActiveStatus', 'Active')->where('DFlag', 0)
            ->when($req->has('SearchText') && !empty($req->SearchText), function ($query) use ($req) {
                return $query->where('PCTName', 'like', '%' . $req->SearchText . '%');
            });

        $result = $Category->select('PCTName', 'PCTID', DB::raw('CONCAT("' . config('app.url') . '/", COALESCE(NULLIF(PCTImage, ""), "assets/images/no-image-b.png")) AS CategoryTypeImage'))
            ->paginate($perPage, ['*'], 'page', $pageNo);

        return response()->json([
            'status' => true,
            'data' => $result->items(),
            'CurrentPage' => $result->currentPage(),
            'LastPage' => $result->lastPage(),
        ]);
    }

    public function GetCategory(Request $req){
        $pageNo = $req->PageNo ?? 1;
        $perPage = 15;

        $Category = DB::table('tbl_product_category as PC')
            ->where('PC.ActiveStatus', 'Active')->where('PC.DFlag', 0)
            ->when($req->PCTID, function ($query) use ($req) {
                $PCTID = $req->PCTID;
                $PCTIDs = is_array($PCTID) ? $PCTID : [$PCTID];
                return $query->whereIn('PC.PCTID', $PCTIDs);
            })
            ->when($req->has('SearchText') && !empty($req->SearchText), function ($query) use ($req) {
                return $query->where('PC.PCName', 'like', '%' . $req->SearchText . '%');
            });

        $result = $Category->select('PC.PCName', 'PC.PCID', 'PC.PCTID', DB::raw('CONCAT("' . config('app.url') . '/", COALESCE(NULLIF(PC.PCImage, ""), "assets/images/no-image-b.png")) AS CategoryImage'))->paginate($perPage, ['*'], 'page', $pageNo);

        return response()->json([
            'status' => true,
            'data' => $result->items(),
            'CurrentPage' => $result->currentPage(),
            'LastPage' => $result->lastPage(),
        ]);
    }
    public function GetSubCategory(Request $req){
        $pageNo = $req->PageNo ?? 1;
        $perPage = 15;

        $SubCategory = DB::table('tbl_product_subcategory as PSC')
            ->join('tbl_product_category as PC', 'PC.PCID', 'PSC.PCID')
            ->where('PSC.ActiveStatus', 'Active')->where('PSC.DFlag', 0)
            ->where('PC.ActiveStatus', 'Active')->where('PC.DFlag', 0)
            ->when($req->PCTID, function ($query) use ($req) {
                $PCTID = $req->PCTID;
                $PCTIDs = is_array($PCTID) ? $PCTID : [$PCTID];
                return $query->whereIn('PSC.PCTID', $PCTIDs);
            })
            ->when($req->PCID, function ($query) use ($req) {
                $PCID = $req->PCID;
                $PCIDs = is_array($PCID) ? $PCID : [$PCID];
                return $query->whereIn('PSC.PCID', $PCIDs);
            })
            ->when($req->has('SearchText') && !empty($req->SearchText), function ($query) use ($req) {
                return $query->where('PSC.PSCName', 'like', '%' . $req->SearchText . '%');
            });
        $result = $SubCategory->select('PSC.PSCName', 'PSC.PSCID','PC.PCID','PC.PCTID','PC.PCName', DB::raw('CONCAT("' . url('/') . '/", COALESCE(NULLIF(PSC.PSCImage, ""), "assets/images/no-image-b.png")) AS SubCategoryImage'))->paginate($perPage, ['*'], 'page', $pageNo);

        return response()->json([
            'status' => true,
            'data' => $result->items(),
            'CurrentPage' => $result->currentPage(),
            'LastPage' => $result->lastPage(),
        ]);
    }

    public function getProducts(Request $req)
    {
        try {
            $pageNo = $req->PageNo ?? 1;
            $perPage = 15;

            $products = DB::table('tbl_products as P')
                ->join('tbl_product_category_type as PCT', 'PCT.PCTID', 'P.CTID')->join('tbl_product_category as PC', 'PC.PCID', 'P.CID')
                ->join('tbl_product_subcategory as PSC', 'PSC.PSCID', 'P.SCID')->join('tbl_uom as U', 'U.UID', 'P.UID')
                ->where('P.ActiveStatus', 'Active')->where('P.DFlag', 0)->where('PC.ActiveStatus', 'Active')
                ->where('PC.DFlag', 0)->where('PSC.ActiveStatus', 'Active')->where('PSC.DFlag', 0)
                ->when($req->PID, function ($query) use ($req) {
                    $PID = $req->PID;
                    $PIDs = is_array($PID) ? $PID : [$PID];
                    return $query->whereIn('P.ProductID', $PIDs);
                })
                ->when($req->PCTID, function ($query) use ($req) {
                    $PCTID = $req->PCTID;
                    $PCTIDs = is_array($PCTID) ? $PCTID : [$PCTID];
                    return $query->whereIn('P.CTID', $PCTIDs);
                })
                ->when($req->PCID, function ($query) use ($req) {
                    $PCID = $req->PCID;
                    $PCIDs = is_array($PCID) ? $PCID : [$PCID];
                    return $query->whereIn('P.CID', $PCIDs);
                })
                ->when($req->PSCID, function ($query) use ($req) {
                    $PSCID = $req->PSCID;
                    $PSCIDs = is_array($PSCID) ? $PSCID : [$PSCID];
                    return $query->whereIn('P.SCID', $PSCIDs);
                })
                ->when($req->has('SearchText') && !empty($req->SearchText), function ($query) use ($req) {
                    return $query->where('P.ProductName', 'like', '%' . $req->SearchText . '%');
                });

            $result = $products->select('P.ProductName', 'P.ProductID', 'PCT.PCTName', 'PCT.PCTID', 'PC.PCName', 'PC.PCID', 'PSC.PSCName', 'PSC.PSCID', 'U.UName', 'U.UCode', 'U.UID',
                DB::raw('CONCAT("' . config('app.url') . '/", COALESCE(NULLIF(P.ProductImage, ""), "assets/images/no-image-b.png")) AS ProductImage'),
                DB::raw('(SELECT CASE
                       WHEN EXISTS (SELECT 1 FROM tbl_products_variation WHERE ProductID = P.ProductID)
                       THEN (SELECT PRate FROM tbl_products_variation WHERE ProductID = P.ProductID ORDER BY SRate ASC LIMIT 1)
                       ELSE P.PRate
                     END) AS PRate'),
                DB::raw('(SELECT CASE
                       WHEN EXISTS (SELECT 1 FROM tbl_products_variation WHERE ProductID = P.ProductID) THEN MIN(PV.SRate)
                       ELSE P.SRate
                     END
                     FROM tbl_products_variation AS PV
                     WHERE PV.ProductID = P.ProductID) AS SRate'))
                ->when($req->price_filter, function ($query) use ($req) {
                    $priceRange = explode(',', $req->price_filter);
                    return $query->whereRaw('(SELECT CASE
                           WHEN EXISTS (SELECT 1 FROM tbl_products_variation WHERE ProductID = P.ProductID) THEN MIN(PV.SRate)
                           ELSE P.SRate
                         END
                         FROM tbl_products_variation AS PV
                         WHERE PV.ProductID = P.ProductID) BETWEEN ? AND ?', $priceRange);
                })
                ->when($req->has('sorting_by') && in_array($req->sorting_by, ['SRate', 'ProductName']), function ($query) use ($req) {
                    $sortingKey = $req->sorting_by;
                    $direction = $req->has('sorting_direction') && in_array($req->sorting_direction, ['asc', 'desc']) ? $req->sorting_direction : 'asc';
                    return $query->orderBy($sortingKey, $direction);
                })
                ->paginate($perPage, ['*'], 'page', $pageNo);

            $result->getCollection()->map(function ($item) {
                $item->wishlist = false;
                $item->PRate = Helper::formatAmount($item->PRate);
                $item->SRate = Helper::formatAmount($item->SRate);
                return $item;
            });

            return response()->json([
                'status' => true,
                'data' => $result->items(),
                'CurrentPage' => $result->currentPage(),
                'LastPage' => $result->lastPage(),
            ]);
        } catch (Exception $e) {
            logger($e);
            return $this->errorResponse($e, "Can't get products list", 500);
        }
    }

    public function getProduct(Request $req)
    {
        try {
            $validatedData = Validator::make($req->all(), [
                'ProductID' => 'required|string|exists:tbl_products,ProductID'
            ]);

            if ($validatedData->fails()) {
                return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
            }

            $product = DB::table('tbl_products as P')
                ->join('tbl_product_category_type as PCT', 'PCT.PCTID', 'P.CTID')
                ->join('tbl_product_category as PC', 'PC.PCID', 'P.CID')
                ->join('tbl_product_subcategory as PSC', 'PSC.PSCID', 'P.SCID')
                ->join('tbl_uom as U', 'U.UID', 'P.UID')
                ->where('P.ActiveStatus', 'Active')
                ->where('P.DFlag', 0)
                ->where('PC.ActiveStatus', 'Active')
                ->where('PC.DFlag', 0)
                ->where('PSC.ActiveStatus', 'Active')
                ->where('PSC.DFlag', 0)
                ->where('P.ProductID', $req->ProductID)
                ->first();

            $reviews = ProductReview::with('customerDetails')->where('ProductID', $product->ProductID)
                ->orderBy('CreatedOn', 'desc')
                ->get()
                ->map(function ($review) {
                    $review->CreatedOn = date('M d, Y', strtotime($review->CreatedOn));
                    return $review;
                });

            $ratings = ProductReview::where('ProductID', $product->ProductID)
                ->avg('rating');

            $relatedProductIds = unserialize($product->RelatedProducts);

            if (!is_array($relatedProductIds)) {
                $relatedProductIds = explode(',', $relatedProductIds);
            }

            $relatedProducts = DB::table('tbl_products as P')
                ->leftjoin('tbl_uom as U', 'U.UID', 'P.UID')
                ->where('P.ActiveStatus', 'Active')
                ->where('P.DFlag', 0)
                ->whereIn('P.ProductID', $relatedProductIds)
                ->select('P.ProductID', 'P.ProductName', 'U.UName', 'U.UCode', 'U.UID',
                    DB::raw("CONCAT('" . config('app.url') . "/', COALESCE(P.ProductImage, 'assets/images/no-image-b.png')) as ProductImage"),
                    DB::raw('(CASE WHEN EXISTS (SELECT * FROM tbl_products_variation WHERE P.ProductID = "' . $product->ProductID . '")
                            THEN (SELECT PRate FROM tbl_products_variation WHERE P.ProductID = "' . $product->ProductID . '" ORDER BY SRate LIMIT 1)
                            ELSE P.PRate END) as PRate'),
                    DB::raw('(CASE WHEN EXISTS (SELECT * FROM tbl_products_variation WHERE P.ProductID = "' . $product->ProductID . '")
                            THEN (SELECT SRate FROM tbl_products_variation WHERE P.ProductID = "' . $product->ProductID . '" ORDER BY SRate LIMIT 1)
                            ELSE P.SRate END) as SRate')
                )->get();

            $relatedProducts->transform(function ($item) {
                $item->PRate = Helper::formatAmount($item->PRate);
                $item->SRate = Helper::formatAmount($item->SRate);
                return $item;
            });

            $result = (object)[
                'ProductName' => $product->ProductName,
                'ProductID' => $product->ProductID,
                'PCTName' => $product->PCTName,
                'PCTID' => $product->PCTID,
                'PCName' => $product->PCName,
                'PCID' => $product->PCID,
                'PSCName' => $product->PSCName,
                'PSCID' => $product->PSCID,
                'UName' => $product->UName,
                'UCode' => $product->UCode,
                'UID' => $product->UID,
                'ProductImage' => config('app.url') . '/' . (!empty($product->ProductImage) ? $product->ProductImage : 'assets/images/no-image-b.png'),
                'PRate' => Helper::formatAmount(DB::table('tbl_products_variation')->where('ProductID', $product->ProductID)->exists() ?
                    DB::table('tbl_products_variation')->where('ProductID', $product->ProductID)->orderBy('SRate')->value('PRate') :
                    $product->PRate),
                'SRate' => Helper::formatAmount(DB::table('tbl_products_variation')->where('ProductID', $product->ProductID)->exists() ?
                    DB::table('tbl_products_variation')->where('ProductID', $product->ProductID)->min('SRate') :
                    $product->SRate),
                'unit' => DB::table('tbl_products_variation')
                    ->where('tbl_products_variation.ProductID', $product->ProductID) // Specify the table alias
                    ->where('tbl_products_variation.SRate', function ($query) use ($product) {
                        $query->select(DB::raw('min(SRate)'))
                            ->from('tbl_products_variation')
                            ->where('ProductID', $product->ProductID);
                    })
                    ->leftJoin('tbl_products_variation_details as D', function ($join) {
                        $join->on('tbl_products_variation.VariationID', '=', 'D.VariationID');
                    })
                    ->leftJoin('tbl_attributes_details as AD', function ($join) {
                        $join->on('AD.ValueID', '=', 'D.AttributeValueID')
                            ->on('AD.AttrID', '=', 'D.AttributeID');
                    })
                    ->leftJoin('tbl_attributes as A', 'A.AttrID', '=', 'AD.AttrID')
                    ->pluck('AD.Values')
                    ->first() ?? ($product->UName ?? '-'),
                'reviews' => $reviews,
                'RelatedProducts' => $relatedProducts,
                'ratings' => round($ratings)
            ];

            $pGallery = DB::table('tbl_products_gallery')
                ->select('gImage', 'ImgID')
                ->where('ProductID', $product->ProductID)
                ->get();

            foreach ($pGallery as $galleryItem) {
                $galleryItem->fileName = basename($galleryItem->gImage);
                $galleryItem->ext = pathinfo($galleryItem->gImage, PATHINFO_EXTENSION);
                $galleryItem->gImage = Helper::apiCheckImageExistsUrl($galleryItem->gImage);
            }

            $result->gallery = $pGallery;

            $variations = DB::table('tbl_products_variation')
                ->select('VariationID', 'UUID', 'ProductID', 'Slug', 'Title', 'PRate', 'SRate', 'VImage', 'Attributes')
                ->where('ProductID', $product->ProductID)
                ->get();

            foreach ($variations as $variation) {
                $tmp1 = DB::table('tbl_products_variation_gallery as g1')
                    ->select('g1.ImgID', 'g1.gImage')
                    ->where('g1.ProductID', $product->ProductID)
                    ->where('g1.VariationID', $variation->VariationID)
                    ->whereRaw('g1.CreatedOn = (select max(CreatedOn) from tbl_products_variation_gallery as g2 where g2.ImgID = g1.ImgID)')
                    ->get();

                foreach ($tmp1 as $galleryItem) {
                    $galleryItem->fileName = basename($galleryItem->gImage);
                    $galleryItem->ext = pathinfo($galleryItem->gImage, PATHINFO_EXTENSION);
                    $galleryItem->gImage = Helper::apiCheckImageExistsUrl($galleryItem->gImage);
                }

                $sql = "SELECT D.DetailID, D.ProductID, D.VariationID, D.AttributeID, A.AttrName, D.AttributeValueID, AD.Values, D.DFlag FROM tbl_products_variation_details as D LEFT JOIN tbl_attributes_details as AD ON AD.ValueID=D.AttributeValueID and AD.AttrID=D.AttributeID LEFT JOIN tbl_attributes as A On A.AttrID=AD.AttrID ";
                $sql .= " Where D.ProductID='" . $product->ProductID . "' and D.VariationID='" . $variation->VariationID . "'";
                $AttributeDetails = DB::select($sql);

                $variation->PRate = Helper::formatAmount($variation->PRate);
                $variation->SRate = Helper::formatAmount($variation->SRate);
                $variation->unit = isset($AttributeDetails[0]) ? ($AttributeDetails[0]->Values) : ($product->UName ?? '-');
                $variation->gallery = $tmp1;
                $variation->VImage = Helper::apiCheckImageExistsUrl($variation->VImage);
                $variation->VImageExt = pathinfo($variation->VImage, PATHINFO_EXTENSION);
                $variation->VImageFileName = basename($variation->VImage);
            }

            $result->variation = $variations;

            return $this->successResponse($result, "Product found!");
        } catch (\Exception $e) {
            logger($e);
            return $this->errorResponse($e, "Can't get product data", 500);
        }
    }

    public function getCustomerProducts(Request $req)
    {
        try {
            $pageNo = $req->PageNo ?? 1;
            $perPage = 15;
            $customerID = $req->auth_customer->CustomerID;

            $products = DB::table('tbl_products as P')
                ->leftjoin('tbl_product_category_type as PCT', 'PCT.PCTID', 'P.CTID')->leftjoin('tbl_product_category as PC', 'PC.PCID', 'P.CID')
                ->leftjoin('tbl_product_subcategory as PSC', 'PSC.PSCID', 'P.SCID')->leftjoin('tbl_uom as U', 'U.UID', 'P.UID')
                ->leftJoin('tbl_wishlists as W', function ($join) use ($customerID) {
                    $join->on('W.product_id', '=', 'P.ProductID')
                        ->where('W.customer_id', '=', $customerID);
                })
                ->where('P.ActiveStatus', 'Active')->where('P.DFlag', 0)->where('PC.ActiveStatus', 'Active')
                ->where('PC.DFlag', 0)->where('PSC.ActiveStatus', 'Active')->where('PSC.DFlag', 0)
                ->when($req->PID, function ($query) use ($req) {
                    $PID = $req->PID;
                    $PIDs = is_array($PID) ? $PID : [$PID];
                    return $query->whereIn('P.ProductID', $PIDs);
                })
                ->when($req->PCTID, function ($query) use ($req) {
                    $PCTID = $req->PCTID;
                    $PCTIDs = is_array($PCTID) ? $PCTID : [$PCTID];
                    return $query->whereIn('P.CTID', $PCTIDs);
                })
                ->when($req->PCID, function ($query) use ($req) {
                    $PCID = $req->PCID;
                    $PCIDs = is_array($PCID) ? $PCID : [$PCID];
                    return $query->whereIn('P.CID', $PCIDs);
                })
                ->when($req->PSCID, function ($query) use ($req) {
                    $PSCID = $req->PSCID;
                    $PSCIDs = is_array($PSCID) ? $PSCID : [$PSCID];
                    return $query->whereIn('P.SCID', $PSCIDs);
                })
                ->when($req->has('SearchText') && !empty($req->SearchText), function ($query) use ($req) {
                    return $query->where('P.ProductName', 'like', '%' . $req->SearchText . '%');
                });

            $result = $products->select('P.ProductName', 'P.ProductID', 'PCT.PCTName', 'PCT.PCTID', 'PC.PCName', 'PC.PCID', 'PSC.PSCName', 'PSC.PSCID', 'U.UName', 'U.UCode', 'U.UID',
                DB::raw('CONCAT("' . config('app.url') . '/", COALESCE(NULLIF(P.ProductImage, ""), "assets/images/no-image-b.png")) AS ProductImage'),
                DB::raw('(SELECT CASE
                       WHEN EXISTS (SELECT 1 FROM tbl_products_variation WHERE ProductID = P.ProductID)
                       THEN (SELECT PRate FROM tbl_products_variation WHERE ProductID = P.ProductID ORDER BY SRate ASC LIMIT 1)
                       ELSE P.PRate
                     END) AS PRate'),
                DB::raw('(SELECT CASE
                       WHEN EXISTS (SELECT 1 FROM tbl_products_variation WHERE ProductID = P.ProductID) THEN MIN(PV.SRate)
                       ELSE P.SRate
                     END
                     FROM tbl_products_variation AS PV
                     WHERE PV.ProductID = P.ProductID) AS SRate'),
                DB::raw('IF(W.product_id IS NOT NULL, true, false) AS IsInWishlist'))
                ->when($req->price_filter, function ($query) use ($req) {
                    $priceRange = explode(',', $req->price_filter);
                    return $query->whereRaw('(SELECT CASE
                           WHEN EXISTS (SELECT 1 FROM tbl_products_variation WHERE ProductID = P.ProductID) THEN MIN(PV.SRate)
                           ELSE P.SRate
                         END
                         FROM tbl_products_variation AS PV
                         WHERE PV.ProductID = P.ProductID) BETWEEN ? AND ?', $priceRange);
                })
                ->when($req->has('sorting_by') && in_array($req->sorting_by, ['SRate', 'ProductName']), function ($query) use ($req) {
                    $sortingKey = $req->sorting_by;
                    $direction = $req->has('sorting_direction') && in_array($req->sorting_direction, ['asc', 'desc']) ? $req->sorting_direction : 'asc';
                    return $query->orderBy($sortingKey, $direction);
                })
                ->distinct()
                ->paginate($perPage, ['*'], 'page', $pageNo);

            $result->getCollection()->map(function ($item) {
                $item->PRate = Helper::formatAmount($item->PRate);
                $item->SRate = Helper::formatAmount($item->SRate);
                return $item;
            });

            return response()->json([
                'status' => true,
                'data' => $result->items(),
                'CurrentPage' => $result->currentPage(),
                'LastPage' => $result->lastPage(),
            ]);
        } catch (Exception $e) {
            logger($e);
            return $this->errorResponse($e, "Can't get products list", 500);
        }
    }

    public function getCustomerProduct(Request $req)
    {
        try {
            $CustomerID = $req->auth_customer->CustomerID;
            $validatedData = Validator::make($req->all(), [
                'ProductID' => 'required|string'
            ]);

            if ($validatedData->fails()) {
                return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
            }

            $product = DB::table('tbl_products as P')
                ->join('tbl_product_category_type as PCT', 'PCT.PCTID', 'P.CTID')
                ->join('tbl_product_category as PC', 'PC.PCID', 'P.CID')
                ->join('tbl_product_subcategory as PSC', 'PSC.PSCID', 'P.SCID')
                ->join('tbl_uom as U', 'U.UID', 'P.UID')
                ->where('P.ActiveStatus', 'Active')
                ->where('P.DFlag', 0)
                ->where('PC.ActiveStatus', 'Active')
                ->where('PC.DFlag', 0)
                ->where('PSC.ActiveStatus', 'Active')
                ->where('PSC.DFlag', 0)
                ->where('P.ProductID', $req->ProductID)
                ->first();

            if (!$product) {
                return $this->errorResponse('Product not found', 'Product not found', 404);
            }

            $relatedProductIds = unserialize($product->RelatedProducts);

            if (!is_array($relatedProductIds)) {
                $relatedProductIds = explode(',', $relatedProductIds);
            }

            $relatedProducts = DB::table('tbl_products as P')
                ->leftJoin('tbl_wishlists', function ($join) use ($CustomerID) {
                    $join->on('P.ProductID', '=', 'tbl_wishlists.product_id')
                        ->where('tbl_wishlists.customer_id', '=', $CustomerID);
                })->leftjoin('tbl_uom as U', 'U.UID', 'P.UID')
                ->where('P.ActiveStatus', 'Active')
                ->where('P.DFlag', 0)
                ->whereIn('P.ProductID', $relatedProductIds)
                ->select('P.ProductID', 'P.ProductName', 'U.UName', 'U.UCode', 'U.UID',
                    DB::raw("CONCAT('" . config('app.url') . "/', COALESCE(P.ProductImage, 'assets/images/no-image-b.png')) as ProductImage"),
                    DB::raw('(CASE WHEN EXISTS (SELECT * FROM tbl_products_variation WHERE P.ProductID = "' . $product->ProductID . '")
                            THEN (SELECT PRate FROM tbl_products_variation WHERE P.ProductID = "' . $product->ProductID . '" ORDER BY SRate LIMIT 1)
                            ELSE P.PRate END) as PRate'),
                    DB::raw('(CASE WHEN EXISTS (SELECT * FROM tbl_products_variation WHERE P.ProductID = "' . $product->ProductID . '")
                            THEN (SELECT SRate FROM tbl_products_variation WHERE P.ProductID = "' . $product->ProductID . '" ORDER BY SRate LIMIT 1)
                            ELSE P.SRate END) as SRate'),
                    DB::raw('IF(tbl_wishlists.product_id IS NOT NULL, "true", "false") as isInWishlist')
                )->get();

            $relatedProducts->transform(function ($item) {
                $item->PRate = Helper::formatAmount($item->PRate);
                $item->SRate = Helper::formatAmount($item->SRate);
                return $item;
            });

            $pGallery = DB::table('tbl_products_gallery')
                ->select('gImage', 'ImgID')
                ->where('ProductID', $product->ProductID)
                ->get();

            foreach ($pGallery as $galleryItem) {
                $galleryItem->fileName = basename($galleryItem->gImage);
                $galleryItem->ext = pathinfo($galleryItem->gImage, PATHINFO_EXTENSION);
                $galleryItem->gImage = Helper::apiCheckImageExistsUrl($galleryItem->gImage);
            }

            $variations = DB::table('tbl_products_variation')
                ->select('VariationID', 'UUID', 'ProductID', 'Slug', 'Title', 'PRate', 'SRate', 'VImage', 'Attributes', 'CombinationID')
                ->where('ProductID', $product->ProductID)
                ->get();

            foreach ($variations as $variation) {
                $tmp1 = DB::table('tbl_products_variation_gallery as g1')
                    ->select('g1.ImgID', 'g1.gImage')
                    ->where('g1.ProductID', $product->ProductID)
                    ->where('g1.VariationID', $variation->VariationID)
                    ->whereRaw('g1.CreatedOn = (select max(CreatedOn) from tbl_products_variation_gallery as g2 where g2.ImgID = g1.ImgID)')
                    ->get();

                foreach ($tmp1 as $galleryItem) {
                    $galleryItem->fileName = basename($galleryItem->gImage);
                    $galleryItem->ext = pathinfo($galleryItem->gImage, PATHINFO_EXTENSION);
                    $galleryItem->gImage = Helper::apiCheckImageExistsUrl($galleryItem->gImage);
                }

                $sql = "SELECT D.DetailID, D.ProductID, D.VariationID, D.AttributeID, A.AttrName, D.AttributeValueID, AD.Values, D.DFlag FROM tbl_products_variation_details as D LEFT JOIN tbl_attributes_details as AD ON AD.ValueID=D.AttributeValueID and AD.AttrID=D.AttributeID LEFT JOIN tbl_attributes as A On A.AttrID=AD.AttrID ";
                $sql .= " Where D.ProductID='" . $product->ProductID . "' and D.VariationID='" . $variation->VariationID . "'";
                $variation->AttributeDetails = DB::select($sql);

                $variation->PRate = Helper::formatAmount($variation->PRate);
                $variation->SRate = Helper::formatAmount($variation->SRate);
                $tmpVAttributes = unserialize($variation->Attributes);
                $variation->Attributes = $tmpVAttributes;
                $variation->gallery = $tmp1;
                $variation->VImage = Helper::apiCheckImageExistsUrl($variation->VImage);
                $variation->VImageExt = pathinfo($variation->VImage, PATHINFO_EXTENSION);
                $variation->VImageFileName = basename($variation->VImage);
            }

            $reviews = ProductReview::with('customerDetails')->where('ProductID', $product->ProductID)
                ->orderBy('CreatedOn', 'desc')
                ->get()
                ->map(function ($review) use ($CustomerID, $product) {
                    $review->CreatedOn = date('M d, Y', strtotime($review->CreatedOn));
                    $review->isHelpful = DB::table('tbl_review_likes')
                        ->where('ProductID', $product->ProductID)
                        ->where('CustomerID', $CustomerID)
                        ->where('ReviewID', $review->ReviewID)
                        ->exists();
                    return $review;
                });
            $ratings = ProductReview::where('ProductID', $product->ProductID)
                ->avg('rating');

            $result = (object)[
                'ProductName' => $product->ProductName,
                'ProductID' => $product->ProductID,
                'PCTName' => $product->PCTName,
                'PCTID' => $product->PCTID,
                'PCName' => $product->PCName,
                'PCID' => $product->PCID,
                'PSCName' => $product->PSCName,
                'PSCID' => $product->PSCID,
                'UName' => $product->UName,
                'UCode' => $product->UCode,
                'UID' => $product->UID,
                'ProductImage' => config('app.url') . '/' . (!empty($product->ProductImage) ? $product->ProductImage : 'assets/images/no-image-b.png'),
                'PRate' => Helper::formatAmount(DB::table('tbl_products_variation')->where('ProductID', $product->ProductID)->exists() ?
                    DB::table('tbl_products_variation')->where('ProductID', $product->ProductID)->orderBy('SRate')->value('PRate') :
                    $product->PRate),
                'SRate' => Helper::formatAmount(DB::table('tbl_products_variation')->where('ProductID', $product->ProductID)->exists() ?
                    DB::table('tbl_products_variation')->where('ProductID', $product->ProductID)->min('SRate') :
                    $product->SRate),
                'IsInWishlist' => DB::table('tbl_wishlists')->where('customer_id', $CustomerID)->where('product_id', $product->ProductID)->exists(),
                'RelatedProducts' => $relatedProducts,
                'gallery' => $pGallery,
                'variation' => $variations,
                'reviews' => $reviews,
                'ratings' => round($ratings)
            ];

            return $this->successResponse($result, "Product found!");
        } catch (\Exception $e) {
            logger($e);
            return $this->errorResponse($e, "Can't get product data", 500);
        }
    }

    public function checkCoupon(Request $request)
    {
        $validatedData = Validator::make($request->all(), [
            'coupon_code' => 'required|exists:tbl_coupons,coupon_code',
        ]);

        if ($validatedData->fails()) {
            return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
        }

        $coupon = Coupon::where('coupon_code', $request->coupon_code)
            ->where('DFlag', 0)
            ->where('ActiveStatus', 'Active')
            ->first(['COID', 'type', 'value']);

        if($coupon) {
            if ($coupon->type === 'Percentage') {
                $coupon->value = $coupon->value . '%';
            } else {
                $coupon->value = Helper::formatAmount($coupon->value);
            }
            return $this->successResponse($coupon, "Valid Coupon!");
        }else{
            return $this->errorResponse([], "In-Valid Coupon!");
        }
    }
}
