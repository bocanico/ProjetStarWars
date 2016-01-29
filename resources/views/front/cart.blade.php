@extends('layouts.master')


@section('content')
    @if($panier != NULL)
        @foreach($products as $index => $product)
            <div class="product grid-1-2">
                <div class="txtcenter">
                    @if($pict = $product->picture)
                        <img id="img_cart" class="inbl" src="{{url('uploads', $pict->uri)}}" alt="">
                    @endif
                </div>
                <div>
                        <h2 class="">{{$product->name}}</h2>
                        <b id="price" class="">{{$product->price}} &euro; TTC.</b><br/>
                        <b id="quantity" class="">Quantité: {{$quantities[$index]}}</b>
                        <div class="inbl">
                            <a href="{{url('cart/sub', $product->id)}}"><i id='moins'.{{$product->id}} class="fa fa-minus-square"></i></a>
                            <a href="{{url('cart/add', $product->id)}}"><i class="fa fa-plus-square"></i></a>
                        </div>
                        <form method="POST" action="{{url('prod/reset')}}">
                            {!! csrf_field() !!}
                            <input class="input-text" id="product_id" name="product_id" type="hidden" value="{{$product->id}}">
                            <input type="submit" value="reset">
                        </form>
                        @if($product->quantity == 0)
                            <p class="">
                                <span>Produit indisponible </span>
                            </p>
                        @else
                            <p class="">
                                <span>Il reste {{$product->quantity}} articles en magasin</span>
                            </p>
                        @endif
                </div>
            </div>
        @endforeach
        <div id="command" class="txtright">
            <b id="total">Total: {{$total}} &euro; TTC </b>

            @if(Auth::check())
                <a href="{{url('prod/finalize')}}"><button @if(session('status') == 'fail')) class="visually-hidden" @else class="" @endif>Terminer</button></a>
            @else
                <a href="{{url('prod/command')}}"><button>Commander</button></a>
            @endif
        </div>
        <div id="customer" @if(session('status') == 'fail')) class="" @else class="visually-hidden" @endif>
                 <form method="POST" action="{{url('prod/finalize')}}">
                 {!! csrf_field() !!}
                     <div class="form-text">
                         <label class="label" for="address">Address</label>
                         <input class="input-text" id="address" name="address" type="text" value="{{old('address')}}">
                         @if($errors->has('address'))<span class="error">{{$errors->first('address')}}</span>@endif
                     </div>
                     <div class="form-text">
                         <label class="label" for="number_card">Number card</label>
                         <input class="input-text" id="number_card" name="number_card" type="text" value="{{old('number_card')}}">
                         @if($errors->has('number_card'))<span class="error">{{$errors->first('number_card')}}</span>@endif
                     </div>
                     <input type="submit" value="Envoyer">
                 </form>
        </div>
    @else
        <p>Sorry no command</p>
    @endif
@stop
