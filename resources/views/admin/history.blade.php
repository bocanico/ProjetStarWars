@extends('layouts.admin')

@section('content')
    {!! $histories->links() !!}

    @if($histories->count()>0)
        <div class="grid-7 admin_product">
            <div class="txtcenter"><b>Date Command</b></div>
            <div class="txtcenter"><b>Client name</b></div>
            <div class="txtcenter"><b>Product</b></div>
            <div class="txtcenter"><b>Quantity</b></div>
            <div class="txtcenter"><b>Price</b></div>
            <div class="txtcenter"><b>Total</b></div>
            <div class="txtcenter"><b>Status</b></div>
        </div>
        @foreach($histories as $history)
            <div class="grid-7 admin_product">
                <div class="txtcenter"><span>{{$history->command_at}}</span></div>
                <div class="txtcenter"><span>{{$history->customer->user->name}}</span></div>
                <div class="txtcenter"><span>{{$history->product->name}}</span></div>
                <div class="txtcenter"><span>{{$history->quantity}}</span></div>
                <div class="txtcenter"><span>{{$history->price}}</span></div>
                <div class="txtcenter"><span>{{$history->price * $history->quantity}}</span></div>
                <div class="txtcenter"><span>{{$history->status}}</span></div>
            </div>
        @endforeach
    @else
        <p>Sorry no command</p>
    @endif
    {!! $histories->links() !!}
@stop