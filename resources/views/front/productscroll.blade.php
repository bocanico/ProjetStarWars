@forelse($products as $product)
    <div id="{{$product->id}}" class="product grid-1-2">
        <div class="txtcenter">
            @if($pict = $product->picture)
                {{--fonction url de laravel--}}
                <img id="img_products" src="{{url('uploads', $pict->uri)}}" alt="">
            @endif
        </div>
        <div>
            <h2><a href="{{ url('prod', [$product->id, $product->slug]) }}">{{$product->name}}</a></h2>
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
        </div>
    </div>
@empty
    {{--<p>No product</p>--}}
@endforelse
<div>
    <a id="infiniteLoader">
        <img src="{{url('assets/img/infiniteLoader.gif')}}" alt="AjaxLoader">
    </a>
</div>