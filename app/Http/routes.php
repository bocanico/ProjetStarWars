<?php

/*
|--------------------------------------------------------------------------
| Routes File
|--------------------------------------------------------------------------
|
| Here is where you will register all of the routes in an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/


Route::pattern('id', '[1-9][0-9]*'); // elimine les injections autres qu'un nombre!!
Route::pattern('slug', '[a-z_-]*'); // caractères alphabetiques et - de 0 à N
Route::pattern('byType', '[a-z_-]*'); // caractères alphabetiques et - de 0 à N
Route::pattern('name', '[a-z_-]*'); // caractères alphabetiques et - de 0 à N



/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| This route group applies the "web" middleware group to every route
| it contains. The "web" middleware group is defined in your HTTP
| kernel and includes session state, CSRF protection, and more.
|
*/

Route::group(['middleware' => ['throttle:60, 1']], function(){
    Route::post('/home/scroll', 'FrontController@scrollProd');
    Route::post('/home/{byType?}/scroll', 'FrontController@scrollProd');
    Route::post('/cat/{id}/{slug?}/scroll', 'FrontController@scrollProd');
    Route::post('/cat/{id}/{slug?}/{byType?}/scroll', 'FrontController@scrollProd');
    Route::post('/tag/{id}/{name?}/scroll', 'FrontController@scrollProd');
    Route::post('/tag/{id}/{name?}/{byType?}/scroll', 'FrontController@scrollProd');
});



Route::group(['middleware' => ['web']], function () {

    Route::get('/home/{byType?}',['as'=>'home', 'uses'=>'FrontController@index']); // creation alias home (ex usage: redirect()->home();
    Route::get('/prod/{id}/{slug?}','FrontController@showProduct');
    Route::get('/cat/{id}/{slug?}/{byType?}','FrontController@showProductByCategory');
    Route::get('/tag/{id}/{name?}/{byType?}','FrontController@showProductByTag');
    Route::get('contact','FrontController@showContact');
    Route::post('storeContact','FrontController@storeContact');
    Route::post('/prod/{id}/{slug?}','FrontController@selectProduct');
    Route::get('cart', 'FrontController@showCart');
    Route::get('cart/add/{id}', 'FrontController@cartAddProduct');
    Route::get('cart/sub/{id}', 'FrontController@cartSubProduct');
    Route::post('prod/reset', 'FrontController@resetProduct');
    Route::any('login','loginController@login');
    Route::any('logout','loginController@logout');

    // middleware dans le middleware web, qui gère le nombre de connexions  par minutes (donc peu doublon avec xcsrf_token)
    Route::group(['middleware' => ['throttle:60, 1']], function(){
        // any: post and get

    });
    Route::group(['middleware' => ['auth','admin']], function(){
        Route::get('product/history','ProductController@showHistory');// a mettre avant sinon methode REST appliquée
        Route::resource('product', 'ProductController');
        Route::get('product/status/{id}', 'ProductController@changeStatus');
//        Route::post('command')

//        Route::get('product/test', function(){
//            return 'hello world';
//        });

    });

    Route::group(['middleware' => ['auth']], function(){
        Route::get('prod/command', 'FrontController@showCart');
        Route::get('prod/finalize', 'FrontController@finalize');
        Route::post('prod/finalize', 'FrontController@storeCustomer');

    });


//    Route::get('test',['middleware' => ['admin'], function(){
//        return 'hello world';
//    }]);


    // etudier ce qu'il ya ci dessous (fonction de closure au lieu de storeContact ci-dessous)
//Route::post('storeContact', function(REQUEST $request){
//    //var_dump($_POST);
//    //dd('ici contact post');
//    //dd($request);
//    dd($request->all()); // identique à $_POST
//});
});