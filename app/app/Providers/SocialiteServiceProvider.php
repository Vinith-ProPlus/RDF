<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Laravel\Socialite\Facades\Socialite;
use DB;
class SocialiteServiceProvider extends ServiceProvider{
    /**
     * Register services.
     */
    public function boot(){
        $this->configureSocialiteProviders();
    }

    /**
     * Bootstrap services.
     */
    public function register(){
        //
    }
    protected function configureSocialiteProviders(){
        $providers = [];

        foreach ($providers as $provider) {
            Socialite::extend($provider->ProviderName, function ($app) use ($provider) {
                return Socialite::buildProvider(
                    'Laravel\Socialite\Two\\' . ucfirst($provider->ProviderName) . 'Provider',
                    [
                        'client_id' => $provider->ClientID,
                        'client_secret' => $provider->ClientSecret,
                        "redirect"=>url('/')."/social/callback/".$provider->ProviderName,
                        // Add other configuration fields here
                    ]
                );
            });
        }
    }
}
