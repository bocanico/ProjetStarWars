@extends('layouts.master')

@section('title','Produits')

@section('content')

    <div class="product grid-1-2">
        <form method="POST" action="{{url('login')}}">
            {!! csrf_field() !!}

            <div class="form-text">
                <label class="label" for="email">{{trans('app.emailAdress')}}</label>
                <input class="input-text" id="email" name="email" type="email" value="{{old('email')}}" placeholder="Entrez votre email ici ...">
                @if($errors->has('email'))<span class="error">{{$errors->first('email')}}</span>@endif
            </div>
            <div class="form-text">
                <label class="label" for="password">{{trans('app.password')}}</label>
                <input class="input-text" id="password" name="password" type="password" value="" placeholder="Entrez votre password ici ...">
                @if($errors->has('password'))<span class="error">{{$errors->first('password')}}</span>@endif
            </div>
            <div class="form-text">
                <label class="label" for="remember">{{trans('app.remember')}}</label>
                <input type="radio" name="remember" id="remember" value="true">
            </div>
            <div class="form-submit"></div>
            <input type="submit" value="login">
        </form>
    </div>

@stop
