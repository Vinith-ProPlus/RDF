<?php

namespace App\Events;

use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class NewOrderNotification implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $message;
    public $userId;
    public $orderId;

    public function __construct($message, $userId, $orderId)
    {
        $this->message = $message;
        $this->userId = $userId;
        $this->orderId = $orderId;
    }

    public function broadcastOn(): array
    {
        return ['my-channel-'.$this->userId];
    }

    public function broadcastAs(): string
    {
        return 'my-event';
    }
}
