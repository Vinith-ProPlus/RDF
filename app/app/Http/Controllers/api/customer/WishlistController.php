<?php

namespace App\Http\Controllers\api\customer;

use App\Http\Controllers\Controller;
use App\Models\Wishlist;
use App\Traits\ApiResponse;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class WishlistController extends Controller
{
    use ApiResponse;
    public function addWishlist(Request $request): JsonResponse
    {
        DB::beginTransaction();
        try {
            $validatedData = Validator::make($request->all(), [
                'product_id' => 'required|string|exists:tbl_products,ProductID',
                'product_variation_id' => 'nullable|string|exists:tbl_products_variation,VariationID',
            ]);

            if ($validatedData->fails()) {
                return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
            }

            $product_id = $request->product_id;
            $product_variation_id = $request->product_variation_id;
            $customer_id = $request->auth_customer->CustomerID;

            $wishlist = Wishlist::firstOrCreate(['customer_id' => $customer_id, 'product_id' => $product_id,
                'product_variation_id' => $product_variation_id]);
            DB::commit();
            if ($wishlist->wasRecentlyCreated) {
                return $this->successResponse([], "Wishlist item added successfully");
            }
            return $this->errorResponse([], "The selected product is already in your wishlist", 422);
        } catch (Exception $e) {
            logger($e);
            DB::rollBack();
            return $this->errorResponse($e, "Wishlist item adding failed", 422);
        }
    }
    public function removeWishlist(Request $request): JsonResponse
    {
        DB::beginTransaction();
        try {
            $validatedData = Validator::make($request->all(), [
                'product_id' => 'required|string|exists:tbl_products,ProductID',
                'product_variation_id' => 'nullable|string|exists:tbl_products_variation,VariationID',
            ]);

            if ($validatedData->fails()) {
                return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
            }

            $product_id = $request->product_id;
            $product_variation_id = $request->product_variation_id;
            $customer_id = $request->auth_customer->CustomerID;

            $products = Wishlist::where('customer_id', $customer_id)
                ->where('product_id', $product_id);
            if (isset($product_variation_id)){
                $deleted = $products->where('product_variation_id', $product_variation_id)->delete();
            } else {
                $deleted = $products->where('product_variation_id', null)->delete();
            }
            DB::commit();
            if ($deleted) {
                return $this->successResponse([], "Wishlist item removed successfully");
            } else {
                return $this->errorResponse([], "This product was not listed in your wishlist", 422);
            }
        } catch (Exception $e) {
            logger($e);
            DB::rollBack();
            return $this->errorResponse($e, "Wishlist item removing failed", 422);
        }
    }

    public function my_wishlist(Request $request): JsonResponse
    {
        logger("Rewv wis");
        logger($request);
        try {
            $customer_id = $request->auth_customer->CustomerID;

            $wishlistProductIds = Wishlist::where('customer_id', $customer_id)->pluck('product_id');
            logger($wishlistProductIds);

            $wishlistProducts = Wishlist::where('customer_id', $customer_id)->pluck('product_id');
                return $this->successResponse([], "Wishlist items fetched successfully");

        } catch (Exception $e) {
            logger($e);
            return $this->errorResponse($e, "Wishlist item fetch failed", 422);
        }
    }
}
