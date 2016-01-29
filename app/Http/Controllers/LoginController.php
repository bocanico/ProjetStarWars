<?php

namespace App\Http\Controllers;

use App\Product;
use Illuminate\Support\Facades\Auth;
use View;
use App\Http\Requests;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Category;

class LoginController extends Controller
{
    public function __construct()
    {
        View::composer('partials.nav', function($view){

            //        $categories = Category::lists('title', 'id'); // mieux que Category::all() mais ! que 2 arguments;
            $categories = Category::all();

            if(!is_null(session('panier')))
            {
                $panier = session('panier');
                $number_products = array_sum($panier);

            }else{
                $number_products = 0;
            }
            //            dd($categories);
            $view->with(compact('categories', 'number_products'));

        });
    }

    public function login(Request $request)
    {
        if ($request->isMethod('post'))
        {
            $this->validate($request, [
                'email' => 'required|email',
                'password' => 'required',
                'remember' => 'in:true'
            ]);

            $remember = !empty($request->input('remember'))? true : false; // si true le formulaire se souviendra de notre choix

            if (Auth::attempt(['email' => $request->input('email'), 'password' => $request->input('password')], $remember))
            {
                return redirect()->intended('product'); // redirection à la main vers notre page admin produit
            }else{
                return back()->withInput($request->only('email', 'remember'))->with([
                    'message' => trans('app.noAuth'), 'alert' => 'warning'
                ]);
            }

        }
        else
        {
            return view('auth.login')->with([
                'message' => 'you are logged-in',
                'alert' => 'done'
            ]);
        }
    }

    public function logout()
    {
        $panier = (session('panier'))? session('panier'): NULL;

        if(!is_null($panier)){
            foreach($panier as $product_id => $quantity)
            {
                $product = Product::find($product_id);
                $stock_quantity = session('stock.'.$product_id);
                $product->update(['quantity' => $stock_quantity]);
            }
        }
        session(['panier' => NULL]);
        session(['stock' => NULL]);
        Auth::logout();

        return redirect()->home()->with([
        'message' => 'you are logged out',
        'alert' => 'done'
        ]); // home() alias de route
    }
}
