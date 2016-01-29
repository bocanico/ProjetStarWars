@extends('layouts.master')

@section('title','Contact')

@section('content')
    {{--Utilisation des variables de Session créées dans storeContact du FrontController--}}
        <form id="contact" method="POST" action="{{url('storeContact')}}">
            {{--Delivre un Token sha1--}}
            {!! csrf_field() !!}

            <div class="form-text">
                <label class="label" for="email">{{trans('app.emailAdress')}}</label><br/>
                <input class="input-text" id="email" name="email" type="text" value="{{old('email')}}">
                @if($errors->has('email'))<span class="error">{{$errors->first('email')}}</span>@endif
            </div>
            <div class="content">
                <label class="label" for="content">{{trans('app.emailContent')}}</label><br/>
                <textarea name="content" id="content" rows="10" cols="50">{{old('content')}}</textarea>
            </div>
            @if($errors->has('content'))<span class="error">{{$errors->first('content')}}</span>@endif
            <div class="form-submit">
                <input type="submit" value="ok" class="mas">
            </div>

        </form>
@stop
