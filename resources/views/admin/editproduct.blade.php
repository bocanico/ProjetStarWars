@extends('layouts.admin')

@section('content')
    <form method="POST" action="{{url('product', $product->id)}}">
        {{ csrf_field() }}
        {{ method_field('PUT') }}
        <div class="grid-2">
            <div>
                <div class="form-text">
                    <label class="label" for="name">Title</label>
                    <input class="input-text" id="name" name="name" type="text" value="{{$product->name}}">
                    @if($errors->has('name'))<span class="error">{{$errors->first('name')}}</span>@endif
                </div>
                <div class="form-text">
                    <label class="label" for="slug">Slug</label>
                    <input class="input-text" id="slug" name="slug" type="text" value="{{$product->slug}}">
                    @if($errors->has('slug'))<span class="error">{{$errors->first('slug')}}</span>@endif
                </div>
                <div class="form-text">
                    <label for="status_open">opened</label>
                    <input type="radio" name="status" id="status_open" value="opened" @if($product->status == 'opened') checked @endif>
                    <label for="status_close">closed</label>
                    <input type="radio" name="status" id="status_close" value="closed" @if($product->status == 'closed') checked @endif>
                    @if($errors->has('status'))<span class="error">{{$errors->first('status')}}</span>@endif
                </div>
                <div class="form-text">
                    <label class="label" for="price">Price</label>
                    <input class="input-text" id="price" name="price" type="text" value="{{$product->price}}">
                    @if($errors->has('price'))<span class="error">{{$errors->first('price')}}</span>@endif
                </div>
                <div class="form-text">
                    <label class="label" for="quantity">Quantité</label>
                    <input class="input-text" id="quantity" name="quantity" type="text" value="{{$product->quantity}}">
                    @if($errors->has('quantity'))<span class="error">{{$errors->first('quantity')}}</span>@endif
                </div>
                <div class="form-text">
                    <label class="label" for="published_at">Date</label>
                    {{--<input class="input-text" id="published_at" name="published_at" type="radio" value="1" checked>--}}
                    <input class="input-text" id="published_at" name="published_at" type="date">
                    @if($errors->has('published_at'))<span class="error">{{$errors->first('published_at')}}</span>@endif
                </div>

                <div class="form-text">
                    <label for="category_id">Categories</label>
                    <select name="category_id" id="category_id">
                        <option value="">non catégorisé</option>
                        @foreach($categories as $category)
                            <option value="{{$category->id}}" @if($category->title == $product_category) selected @endif>{{$category->title}}</option>
                        @endforeach
                    </select>
                    @if($errors->has('category'))<span class="error">{{$errors->first('category')}}</span>@endif
                </div>
                <div class="form-text">
                    <label for="tags">Tags</label>
                    <select name="tags[]" id="tags" multiple>
                        <option value="" disabled>&nbsp;</option>
                        @foreach($tags as $tag)
                            <option value="{{$tag->id}}" @if(in_array($tag->name,$product_tags)) selected @endif>{{$tag->name}}</option>
                        @endforeach
                    </select>
                    @if($errors->has('abstract'))<span class="error">{{$errors->first('abstract')}}</span>@endif
                </div>
            </div>
            <div>
                <div class="form-text">
                    <label class="label" for="content">Content</label>
                    <textarea name="content" id="content" rows="10" cols="40">{{old('content')}}</textarea>
                    @if($errors->has('content'))<span class="error">{{$errors->first('content')}}</span>@endif
                </div>
                <div class="form-text">
                    <label class="label" for="abstract">Abstract</label>
                    <textarea name="abstract" id="abstract" rows="5" cols="40">{{old('abstract')}}</textarea>
                    @if($errors->has('abstract'))<span class="error">{{$errors->first('abstract')}}</span>@endif
                </div>


                <div>
                    @if($pict = $product->picture)
                        {{--fonction url de laravel--}}
                        <img src="{{url('uploads', $pict->uri)}}" alt="" width="200 px">
                    @endif
                </div>

                <label for="delete_img">Sélectionner pour effacer l'image</label>
                <input type="radio" name="delete_img" id="delete_img" value="1">

                <div class="form-text">
                    <label class="label" for="thumbnail">Upload image</label><br/>
                    <input class="file" type="file" name="thumbnail">
                    @if($errors->has('thumbnail'))<span class="error">{{$errors->first('thumbnail')}}</span>@endif
                </div>
            </div>
        </div>

        <input type="submit" value="Update">
    </form>
@stop