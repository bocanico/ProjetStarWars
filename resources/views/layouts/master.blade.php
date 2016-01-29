<!doctype html>
<html class="no-js" lang="fr">
<head>
    <meta charset="UTF-8">
    <title>appStarWars - @yield('title')</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{url('assets/css/knacss.min.css')}}" media="all">
    <link rel="stylesheet" href="{{url('assets/css/app.min.css')}}" media="all">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
</head>
<body>
<header id="header" role="banner" class="line txtcenter">
    @include('partials.nav')
</header>
<div id="main" role="main" class="line pam">
    @if(Session::has('message'))
        @include('front.partials.flash')
    @endif
    @yield('content', 'default value')
</div>

<footer id="footer" role="contentinfo" class="line pam txtcenter">
    @include('partials.footer')
</footer>
<script src="{{url("assets/vendor/jquery-1.12.0.min.js")}}"></script>
<script src="{{url("assets/js/main.js")}}"></script>
</body>
</html>