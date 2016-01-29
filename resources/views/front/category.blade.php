@extends('layouts.master')

@section('title','Produits')

@section('content')
    <div id="tri">
        <span>Trier par:</span>
        <a href="{{ url('cat', [$category->id, $category->slug, 'bydate']) }}">date</a>
        <a href="{{ url('cat', [$category->id, $category->slug, 'byname']) }}">nom</a>
        <a href="{{ url('cat', [$category->id, $category->slug, 'byprice']) }}">prix</a>
        <a href="{{ url('cat', [$category->id, $category->slug, 'byscore']) }}">popularité</a>
        <span id="number_DB_products" class="fr">il y a {{$products->total()}} articles</span>
    </div>

    {{--$products injecté depuis le controller et méthode index--}}
    @forelse($products as $product)
        <div id="{{$product->id}}" class="product grid-1-2">
            <div class="txtcenter">
            @if($pict = $product->picture)
                {{--fonction url de laravel--}}
                <img id="img_products" src="{{url('uploads', $pict->uri)}}" alt="" >
            @endif
            </div>
            <div>
            <h2><a href="{{ URL::to('prod/'.$product->id) }}">{{$product->name}}</a></h2>
            {{$product->abstract}}
                <p class="small">
                    <span>{{trans('app.price')}}</span>{{$product->price}}
                </p>
                <p class="small">
                    <span>{{trans('app.dateCreate')}}</span>{{$product->published_at->format('d/m/Y')}}
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
                <p class="small">
                    <span>{{trans('app.score')}}</span>{{$product->score}}
                </p>
            </div>
        </div>
    @empty
        <p>No product</p>
    @endforelse
    <div id="endpage" class="visually-hidden">
        <span>No more products</span>
    </div>
        {{--creation des liens de pagination--}}
{{--    {!! $products->links() !!}--}}
@stop
