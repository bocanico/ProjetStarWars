<nav id="navigation" role="navigation">
    <ul class="pal">
        <li><a href="{{url('/home')}}">Accueil</a></li>
        @forelse($categories as $category)
            <li><a href="{{ url('cat', [$category->id, $category->slug]) }}">{{$category->title}}</a></li>
        @empty
            <li>{{trans('app.noCategory')}}</li>
        @endforelse
        <li><a href="{{url('contact')}}">contact</a></li>
        <li><a href="{{url('cart')}}"><i @if(count(session('panier')) > 0) id="panier_logo" @endif class="fa fa-shopping-cart fa-2x"></i><b class="inbl" id="panier_count">{{$number_products}}</b></a></li>
        @if(Auth::check())
            <li class="fr"><a href="{{url('logout')}}">{{trans('app.logout')}}</a></li>
            @if(Auth::user()->role == 'administrator' || Auth::user()->role == 'editor')
                <li class="fr"><a href="{{url('product')}}">{{trans('app.admin')}}</a></li>
            @endif
        @else
            <li class="fr"><a href="{{url('login')}}">{{trans('app.login')}}</a></li>
        @endif
    </ul>
</nav>
