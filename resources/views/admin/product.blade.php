@extends('layouts.admin')

@section('content')
    {!! $products->links() !!}

    <a href="{{url('product/create')}}"><button>Create</button></a>

    <div class="grid-8 admin_product">
        <div><b>Status</b></div>
        <div><b>Title</b></div>
        <div><b>Price</b></div>
        <div><b>Quantity</b></div>
        <div><b>Date</b></div>
        <div><b>Category</b></div>
        <div><b>Tags</b></div>
        <div><b>Edit/Delete</b></div>
    </div>
    @foreach($products as $product)
        <div class="grid-8 admin_product">
            @if($product->status)
                {{--<a class="btn btn-{{$product->status}} href="{{url('product',['status', $product->id])}}">{{$product->status}}</a>--}}
                <div><a href="{{url('product/status/'.$product->id)}}"><button  class="btn-{{$product->status}}">{{$product->status}}</button></a></div>
            @endif
            <div>
                <span><a href="{{url('product', $product->id)}}">{{$product->name}}</a></span>
            </div>
            <div><span>{{$product->price}}</span></div>
            <div><span>{{$product->quantity}}</span></div>
            <div><span>{{$product->published_at->format('d/m/Y')}}</span></div>
            <div><span>{{$product->category->title}}</span></div>
            <div>
                @forelse($product->tags as $tag)
                    <span>{{$tag->name}}, </span>
                @empty
                    {{trans('app.noTag')}}
                @endforelse
            </div>
            <div>
                <a href="{{url('product/'.$product->id, 'edit')}}"><button>Edit</button></a>

            @if(Auth::user()->role == 'administrator')
                    <form class="inbl" method="POST" action="{{url('product', $product->id)}}">
                        {!! csrf_field() !!}
                        <input type="hidden" name="_method" value="delete">
                        <input id="delete" type="submit" value="delete">
                    </form>
                 @endif
            </div>
        </div>
    @endforeach
    <div id="links">
        {!! $products->links() !!}
    </div>
@stop