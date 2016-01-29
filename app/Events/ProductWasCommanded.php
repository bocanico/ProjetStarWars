<?php

namespace App\Events;

use App\Events\Event;
use App\Product;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class ProductWasCommanded extends Event
{
    use SerializesModels;


    public $product;
    public $quantity;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(Product $product, $quantity)
    {
        $this->product = $product;
        $this->quantity = $quantity;
    }

    /**
     * Get the channels the event should be broadcast on.
     *
     * @return array
     */
    public function broadcastOn()
    {
        return [];
    }
}
