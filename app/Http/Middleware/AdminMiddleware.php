<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
//        dd('middleware Admin');
//        dd(Auth::user()->role);

//        if (Auth::user()->role != 'administrator')
//        {
//            return redirect('/home')->with(['message' => trans('auth.notAuth')]);
//        }
//
//            return $next($request);

        if (Auth::user()->role == 'administrator'){
            return $next($request);
        }else if (Auth::user()->role == 'editor'){
            return $next($request);
        }
        return redirect('/home')->with([
            'message' => 'you are logged in',
            'alert' => 'done'
        ]);

    }
}
