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

<header id="header" role="banner" class="line txtcenter">
    <a class="fl inbl" href="{{url('/home')}}">
        <img src="{{url('assets/img/Star_Wars_Logo.png')}}" alt="e-StarWars" />
        <h1 class="visually-hidden">e-starwars</h1>
    </a>
    <nav id="navigation" role="navigation">
        <ul class="pal">
            <li><a href="{{url('/home')}}">{{trans('app.backHome')}}</a></li>
            <li><a href="{{url('product')}}">{{trans('app.dashboard')}}</a></li>
            <li><a href="{{url('product/history')}}">{{trans('app.history')}}</a></li>
            <li class="fr"><a href="{{url('logout')}}">{{trans('app.logout')}}</a></li>
        </ul>
    </nav>
</header>
<div id="mainadmin" role="main" class="line pam">
    @if(Session::has('message'))
        @include('front.partials.flash')
    @endif
    @yield('content')
</div>

<footer id="footer" role="contentinfo" class="line pam txtcenter">
</footer>
<script src="{{url("assets/vendor/jquery-1.12.0.min.js")}}"></script>
<script src="{{url("assets/js/main.js")}}"></script>
</body>
</html>