<?php

namespace App\Listeners;

use App\Events\ProductWasCommanded;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class scoreProduct
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  ProductWasCommanded  $event
     * @return void
     */
    public function handle(ProductWasCommanded $event)
    {
        $product = $event->product;
        $quantity = $event->quantity;
        $product->score += $quantity;
        $product->save();
    }
}
