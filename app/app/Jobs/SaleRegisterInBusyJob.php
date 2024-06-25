<?php

namespace App\Jobs;

use App\Models\BusyIntegration;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class SaleRegisterInBusyJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $orderID;

    public function __construct($orderID)
    {
        $this->orderID = $orderID;
    }

    public function handle()
    {
        $busyIntegration = new BusyIntegration();
        $busyIntegration->pushSaleVoucher($this->orderID);
    }
}
