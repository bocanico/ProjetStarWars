@extends('layouts.master')

@section('title','Produit/'.$product->id)

@section('content')
    {{--$products injecté depuis le FrontController et méthode showProduct--}}
    <div class="product grid-2">
        <div class="txtcenter">
                @if($pict = $product->picture)
                    {{--fonction url de laravel--}}
                    <img class="bl" id="img_product" src="{{url('uploads', $pict->uri)}}" alt="">
                @endif
            <div class="inbl">
                <form method="POST" action="{{ url('prod', [$product->id, $product->slug]) }}">
                    {!! csrf_field() !!}
                    <input class="input-text" id="name" name="name" type="hidden" value="{{$product->name}}">
                    <input class="input-text" id="product_id" name="product_id" type="hidden" value="{{$product->id}}">
                    <input class="input-text" id="price" name="price" type="hidden" value="{{$product->price}}">
                    {{--<input class="input-text" id="product" name="product" type="hidden" value="{{$product}}">--}}
                    <input class="input-text" id="product_quantity" name="product_quantity" type="hidden" value="{{$product->quantity}}">

                    <label for="quantity">quantity</label>
                    <select name="quantity" id="quantity" required>
                        <option value="" disabled>&nbsp;</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select><br/>
                    <input type="submit" value="Commander">
                </form>
            </div>
            <div class="inbl txtleft">
                <p class="">
                    <span>Vous avez @if(session('panier.'.$product->id)) {{session('panier.'.$product->id)}} @else 0 @endif @if(session('panier.'.$product->id) > 1) exemplaires @else exemplaire @endif dans votre panier</span>
                </p>
                @if($product->quantity == 0)
                    <p class="">
                        <span>Produit indisponible </span>
                    </p>
                @else
                    <p class="">
                        <span>Il reste {{$product->quantity}} articles en magasin</span>
                    </p>
                @endif
                {{--<p>--}}
                {{--<span>Il y avait: {{session('stock.'.$product->id)}} articles en magasin (Session)</span>--}}
                {{--</p>--}}
            </div>
        </div>
        <div>
            <h2 class="inbl">{{$product->name}}</h2>
            <b id="price" class="fr">{{$product->price}} euros TTC.</b><br/>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi consequatur eaque, ex, facilis, fuga hic nam nesciunt nisi odio omnis pariatur perspiciatis quasi rerum sapiente sunt! Ad animi dicta, dolore laboriosam laudantium repellendus repudiandae soluta. Eos fugit molestiae nam rem! A impedit maxime pariatur provident temporibus veritatis. Eum, illum inventore!
            </p>
            <p class="small">
                <span>{{trans('app.tag')}} </span>
                <i>
                    @forelse($product->tags as $tag)
                        <a href="{{ url('tag', [$tag->id, $tag->name]) }}">{{$tag->name}}</a>-
                    @empty
                        {{trans('app.noTag')}}
                    @endforelse
                </i>
            </p>
            <p class="small">
                <span>{{trans('app.category')}}</span>{{$product->category->title}}
            </p>
        </div>

@stop

