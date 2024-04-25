<?php

namespace App\Http\Middleware\app\Http\Middleware;

use App\Models\Customer;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AuthenticateWithToken
{
    /**
     * Handle an incoming request.
     *
     * @param Closure(Request): (Response) $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $token = $request->header('Authorization');

        if (!$token) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        $token = str_replace('Bearer ', '', $token);
        $customer = Customer::where('api_token', $token)->first();

        if (!$customer) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        // Attach the authenticated user to the request
        $request->auth_customer = $customer;

        return $next($request);
    }
}
