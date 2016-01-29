<!doctype html>
<html class="no-js" lang="fr">
<head>
    <meta charset="UTF-8">
    <title>appStarWars - @yield('title')</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{url('assets/css/knacss.min.css')}}" media="all">
    <link rel="stylesheet" href="{{url('assets/css/app.min.css')}}" media="all">
</head>

<body>
<div id="main" role="main" class="line pam">
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
</body>
</html>







