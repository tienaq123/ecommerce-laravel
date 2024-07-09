<?php

namespace App\Providers;

use App\Repositories\Banner\BannerInterface;
use App\Repositories\Banner\BannerRepository;
use App\Repositories\Brand\BrandInterface;
use App\Repositories\Brand\BrandRepository;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->bind(BannerInterface::class, BannerRepository::class);
        $this->app->bind(BrandInterface::class, BrandRepository::class);
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
