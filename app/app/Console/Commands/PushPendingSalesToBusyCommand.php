<?php

namespace App\Console\Commands;

use App\Models\BusyIntegration;
use App\Models\Order;
use Illuminate\Console\Command;
use function Psl\Type\null;

class PushPendingSalesToBusyCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'push-pending-sales-to-busy-command';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'push-pending-sales-to-busy-command';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $busyIntegration = new BusyIntegration();
        if($busyIntegration->isBusyHostActive()){
            $pendingOrderIDs = Order::where('BusySaleID', null)->pluck('OrderID');
            foreach ($pendingOrderIDs as $pendingOrderID){
                $busyIntegration->pushSaleVoucher($pendingOrderID);
            }
        }
    }
}
