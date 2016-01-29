{{--comme dans la pratique de bootstrap twitter--}}
{{--<div class="alert {{Session::get('alert')}}">--}}
    {{--<p>{{Session::get('message')}}&nbsp;<a href="{{url('/home')}}">{{trans('app.home')}}</a></p>--}}
{{--</div>--}}
<div class="alert {{Session::get('alert')}}">
    <p>{{Session::get('message')}}</p>
</div>