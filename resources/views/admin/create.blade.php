@extends('layouts.admin')

@section('content')
    <form method="POST" action="{{url('product')}}" enctype="multipart/form-data">
        {!! csrf_field() !!}
        <div class="grid-3">
            <div>
                <div class="form-text">
                    <label class="label" for="name">Title</label><br/>
                    <input class="input-text" id="name" name="name" type="text" value="{{old('name')}}"><br/>
                    @if($errors->has('name'))<span class="error">{{$errors->first('name')}}</span>@endif
                </div>
                <div class="form-text">
                    <label class="label" for="slug">Slug</label><br/>
                    <input class="input-text" id="slug" name="slug" type="text" value="{{old('slug')}}"><br/>
                    @if($errors->has('slug'))<span class="error">{{$errors->first('slug')}}</span>@endif
                </div>
                <div class="form-text">
                    <label for="status_open">opened</label>
                    <input type="radio" name="status" id="status_open" value="opened">
                    <label for="status_close">closed</label>
                    <input type="radio" name="status" id="status_close" value="closed"><br/>
                    @if($errors->has('status'))<span class="error">{{$errors->first('status')}}</span>@endif
                </div>
                <div class="form-text">
                    <label class="label" for="price">Price</label><br/>
                    <input class="input-text" id="price" name="price" type="text" value="{{old('price')}}"><br/>
                    @if($errors->has('price'))<span class="error">{{$errors->first('price')}}</span>@endif
                </div>
                <div class="form-text">
                    <label class="label" for="quantity">Quantité</label><br/>
                    <input class="input-text" id="quantity" name="quantity" type="text" value="{{old('quantity')}}"><br/>
                    @if($errors->has('quantity'))<span class="error">{{$errors->first('quantity')}}</span>@endif
                </div>
            </div>
            <div>
                <div class="form-text">
                    <label class="label" for="published_at">Date</label><br/>
                    {{--<input class="input-text" id="published_at" name="published_at" type="radio" value="1" checked>--}}
                    <input class="input-text" id="published_at" name="published_at" type="date"><br/>
                    @if($errors->has('published_at'))<span class="error">{{$errors->first('published_at')}}</span>@endif
                </div>

                <div class="form-text">
                    <label for="category_id">Categories</label><br/>
                    <select name="category_id" id="category_id">
                        <option value="">non catégorisé</option>
                        @foreach($categories as $id => $title)
                            <option value="{{$id}}">{{$title}}</option>
                        @endforeach
                    </select><br/>
                    @if($errors->has('category'))<span class="error">{{$errors->first('category')}}</span>@endif
                </div>
                <div class="form-text">
                    <label for="tags">Tags</label><br/>
                    <select name="tags[]" id="tags" multiple>
                        <option value="" disabled>&nbsp;</option>
                        @foreach($tags as $id => $name)
                            <option value="{{$id}}">{{$name}}</option>
                        @endforeach
                    </select><br/>
                    @if($errors->has('abstract'))<span class="error">{{$errors->first('abstract')}}</span>@endif
                </div>
            </div>
            <div>
                <div class="form-text"><br/>
                    <label class="label" for="content">Content</label>
                    <textarea name="content" id="content" rows="4" cols="40">{{old('content')}}</textarea><br/>
                    @if($errors->has('content'))<span class="error">{{$errors->first('content')}}</span>@endif
                </div>
                <div class="form-text"><br/>
                    <label class="label" for="abstract">Abstract</label>
                    <textarea name="abstract" id="abstract" rows="2" cols="40">{{old('abstract')}}</textarea>
                    @if($errors->has('abstract'))<span class="error">{{$errors->first('abstract')}}</span>@endif
                </div>

                <div class="form-text">
                    <label class="label" for="thumbnail">Upload image Max. 3Mo </label><br/>
                    <input class="file" type="file" name="thumbnail"><br/>
                    @if($errors->has('thumbnail'))<span class="error">{{$errors->first('thumbnail')}}</span>@endif
                </div>
            </div>
        </div>
        <input type="submit" value="Create">
    </form>
@stop