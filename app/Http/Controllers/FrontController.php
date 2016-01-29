<?php

namespace App\Http\Controllers;

use App\Customer;
use App\Events\ProductWasCommanded;
use App\History;
use App\Tag;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Response;
use View;
use Mail;
use App\Post;
use App\Category;
use App\Product;
use Illuminate\Http\Request;
use App\Http\Requests;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;


class FrontController extends Controller
{

    // on injecte les categories dans le partials.nav
    // (ou layout.master puisque partials.nav est include dans layout.master)
    public function __construct()
    {

    //    View::composer('front.cart', function($view) use($request){
    //        $panier = $request->session()->all();
    //        $this->panier=$panier;
    //        $view->with(compact('panier'));
    //    });


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

    public function index($byType = 'bydate')
    {

        if($byType == 'bydate')
        {
            $products = Product::with('tags','category','picture')->online()->orderBy('published_at', 'DESC')->paginate(5);

            return view('front.index', compact('products', 'number_DB_products'));
        }
        else if($byType == 'byname')
        {
            $products = Product::with('tags','category','picture')->online()->orderBy('name', 'ASC')->paginate(5);

            return view('front.index', compact('products'));
        }
        else if($byType == 'byprice')
        {
            $products = Product::with('tags','category','picture')->online()->orderBy('price', 'DESC')->paginate(5);

            return view('front.index', compact('products'));
        }
        else if($byType == 'byscore')
        {
            $products = Product::with('tags','category','picture')->online()->orderBy('score', 'DESC')->paginate(5);

            return view('front.index', compact('products'));
        }
    }

    public function scrollProd(Request $request, $byType = 'bydate')
    {
//        $url = $request->url;
        $url = $request->getPathInfo();
        $offset = $request->offset;
        $numberItems = $request->numberItems;
//        return $url;
        $field = 'published_at';
        $order = 'DESC';

        if (strstr($url, 'home') !== false)
        {
            if($byType == 'bydate')
            {
                $field = 'published_at';
                $order = 'DESC';
            }
            elseif($byType == 'byname')
            {
                $field = 'name';
                $order = 'ASC';
            }
            elseif($byType == 'byprice')
            {
                $field = 'price';
                $order = 'DESC';
            }
            elseif($byType == 'byscore')
            {
                $field = 'score';
                $order = 'DESC';
            };

            $products = Product::with('tags','category','picture')
                ->online()
                ->orderBy($field, $order)
                ->skip($offset)
                ->take($numberItems)
                ->get();

            $number_DB_products = count(Product::all());

//                return Response::json(View::make('front.productscroll', compact('products'))->render());
            return response()->json([
                'data' => $number_DB_products,
                'html' => view('front.productscroll', compact('products'))->render(),
            ]);
        }
        elseif(strstr($url, 'cat') !== false)
        {
            if($byType == 'bydate')
            {
                $field = 'published_at';
                $order = 'DESC';
            }
            elseif($byType == 'byname')
            {
                $field = 'name';
                $order = 'ASC';
            }
            elseif($byType == 'byprice')
            {
                $field = 'price';
                $order = 'DESC';
            }
            elseif($byType == 'byscore')
            {
                $field = 'score';
                $order = 'DESC';
            };

            preg_match('#cat/([0-9]+)#', $url, $matches);
            $category_id = $matches[1];

            $products = Category::findOrFail($category_id)->products()->with('tags','category','picture')
                ->online()
                ->orderBy($field, $order)
                ->skip($offset)
                ->take($numberItems)
                ->get();
            $number_DB_products = count(Category::findOrFail($category_id)->products()->get());

            return response()->json([
                'data' => $number_DB_products,
                'html' => view('front.productscroll', compact('products'))->render(),]);
        }
        elseif(strstr($url, 'tag') !== false)
        {
            if($byType == 'bydate')
            {
                $field = 'published_at';
                $order = 'DESC';
            }
            elseif($byType == '')
            {
                $field = 'name';
                $order = 'ASC';
            }
            elseif($byType == 'byprice')
            {
                $field = 'price';
                $order = 'DESC';
            }
            elseif($byType == 'byscore')
            {
                $field = 'score';
                $order = 'DESC';
            };

            preg_match('#tag/([0-9]+)#', $url, $matches);
            $tag_id = $matches[1];

            $products = Tag::findOrFail($tag_id)->products()->with('tags', 'category', 'picture')
                ->online()
                ->orderBy($field, $order)
                ->skip($offset)
                ->take($numberItems)
                ->get();

            $number_DB_products = count(Tag::findOrFail($tag_id)->products()->get());

            return response()->json([
                'data' => $number_DB_products,
                'html' => view('front.productscroll', compact('products'))->render(),
            ]);
        }
    }



    public function showProduct($id, $slug = '')
    {
//        $product = Product::with('tags','category','picture')->find($id);
//        $product = Product::find($id);
        $product = Product::findOrFail($id); // redirige vers 404

//Ci-dessous: exemple de catch et de redirection si id numerique inexistant ex /product/1000
//        try{
//            $product = Product::findOrFail($id);
//        }catch(\Exception $e)
//        {
//            dd($e->getMessage()); // var_dump customisé + die
//
//            return view('front.no_product');
//        }


        return view('front.product', compact('product'));
    }

    public function selectProduct(Request $request)
    {
        // 1 rules sur la request
        $this->validate($request, [
            'product_id'    => 'integer',
            'price'         => 'numeric',
            'quantity'      => 'required|integer',
        ]);



        $product_id = $request->input('product_id');
        $product = Product::find($product_id);
//        dd($product);
        $quantity = $request->input('quantity');
        $product_quantity = $product->quantity;
        $stock_quantity = $product_quantity - $quantity;

        /*
         * Gestion des stocks
         */
        if($stock_quantity >= 0)
        {
            if ($request->session()->has('panier')) {

                $panier=$request->session()->get('panier');

                if(!array_key_exists($product_id , $panier)) {
                    $panier = array_add($panier, $product_id, $quantity);
                    $request->session()->put('panier', $panier);
                    session(['stock.'.$product_id => $product_quantity]);
//                $stock_quantity = $product_quantity - $quantity;
                }else{
                    $quantity_init = session('panier.'.$product_id);
                    $quantity_final = $quantity_init + $quantity;
//                dd($quantity_final);
                    $request->session()->forget('panier.'.$product_id);
                    $request->session()->put('panier.'.$product_id, $quantity_final);
//                $request->session()->forget('stock.'.$product_id);
//                $request->session()->put('stock.'.$product_id, $quantity_final);
//                $stock_quantity = $product_quantity - $quantity;
                }
                $product->update(['quantity' => $stock_quantity]);
            }else{
                session(['panier'=>[$product_id=>$quantity]]);
                session(['stock'=>[$product_id=>$product_quantity]]);
                $stock_quantity = $product_quantity - $quantity;
                $product->update(['quantity' => $stock_quantity]);
            }
        }else{
            return back()->with([
                'message' => 'product non disponible',
                'alert' => 'fail'
            ]);
        }

        return back();
    }

    public function showCart()
    {
         $panier = (session('panier'))? session('panier'): NULL;

//        dd($panier);
        $total = 0;
        if(!is_null($panier)){
            foreach($panier as $product_id => $quantity)
            {
                $product = Product::find($product_id);
                $products[] = $product;
                $quantities[] = $quantity;
                $price = $product->price;
                $total += $price * $quantity;
            }
            return view('front.cart', compact('panier', 'products', 'quantities', 'total'));
        }else{
            return view('front.cart', compact('panier'));
        }
    }

    public function cartAddProduct($product_id)
    {
        $product = Product::find($product_id);
        $product_quantity = $product->quantity;
//        dd($product_quantity);
        if($product_quantity >= 1)
        {
            $product->quantity -= 1;
            $product->save();
            $quantity = session('panier.'.$product_id) + 1;
            session(['panier.'.$product_id => $quantity]);
            return back()->with([
                'alert' => 'done',
                'message' => 'Produits ajoutés au panier',
            ]);;
        }
        else
        {
            return back()->with([
            'alert' => 'fail',
            'message' => 'No more products',
            ]);
        }
    }

    public function cartSubProduct($product_id)
    {
        $product = Product::find($product_id);
        $product_quantity = $product->quantity;
        $quantity = session('panier.'.$product_id);
//        dd($product_quantity);
        if($quantity >= 1)
        {
            $product->quantity += 1;
            $product->save();
            $quantity = session('panier.'.$product_id) - 1;
            session(['panier.'.$product_id => $quantity]);
            return back();
        }
        else{
            return back()->with([
                'alert' => 'fail',
                'message' => 'Your cart is empty',
            ]);
        }

    }

    public function resetProduct(Request $request)
    {
        $product_id = $request->input('product_id');
        $request->session()->forget('panier.'.$product_id);
//        dd(session('panier'));
        $product = Product::find($product_id);
        $stock_quantity = session('stock.'.$product_id);
//            dd($stock_quantity);
        $product->update(['quantity' => $stock_quantity]);
        return back()->with([
            'alert' => 'done',
            'message' => 'Les produits ont été retiré de votre panier',
        ]);
    }

    public function finalize(Request $request)
    {
        $panier = session('panier');
        $user = Auth::user(); // user authentifié par le login
        $user_id = $user->id;
//        dd($user);

//        $customer_id = $user->customer->id;
//        dd($customer_id);
//        $data = $user->customer()->get();
//        $data = $user->customer()->firstOrFail();
//        dd($data);

        try{
            $customer = $user->customer()->firstOrFail();
//            dd($customer);
            //        $customer = $data[0]; // $data est une collection !?
//        $customer_id = $customer->id;
//        dd($customer->id);


            if(!is_null($panier)){
                foreach($panier as $product_id => $quantity)
                {
                    $product = Product::find($product_id);

                    Event::fire(new ProductWasCommanded($product, $quantity));


                    $price = $product->price;
                    $quantities[] = $quantity;
                    History::create([
                        'product_id' => $product_id,
                        'customer_id' => $customer->id,
                        'price' => $price,
                        'quantity' => $quantity,
                        'command_at' => Carbon::now(), // ou date('Y-m-d h:i:s');
                        'status' => 'finalized',
                    ]);
                }
                $number_command = array_sum($quantities);
                $customer->update(['number_command' => $number_command]);
                session(['panier' => NULL]);
                session(['stock' => NULL]);
//            dd($panier);
                return redirect('/home')->with([
                    'message' => 'succes add',
                    'alert' => 'Commande effectuée'
                ]);
//            return view('front.cart', compact('products', 'quantities', 'total'));
            }else{
                return back()->with(['message' => 'Votre panier est vide']);
            }
        }catch(\Exception $e)
        {
//            dd('mauvaise route');
            $request->session()->flash('status', 'fail');
            return back();
//            dd('coucou'); // var_dump customisé + die
        }
    }

    public function storeCustomer(Request $request)
    {
//        $this->validate($request, [
//            'user_id'    => 'integer',
//            'address'         => 'required|string|max:255',
//            'number_card'      => 'required|numeric',
//        ]);



        $request->all();
        $validator = Validator::make($request->all(),[
            'user_id'    => 'integer',
            'address'         => 'required|string|max:255',
            'number_card'      => 'required|numeric',
        ]);

        if($validator->fails())
        {
            $request->session()->flash('status', 'fail');
            return back()->withInput()->withErrors($validator);
        }


        $user = Auth::user(); // user authentifié par le login
        $user_id = $user->id;
//        dd($user_id);
        $address = $request->input('address');
        $number_card = $request->input('number_card');

        Customer::create([
            'user_id' => $user_id,
            'address' => $address,
            'number_card' => $number_card,
        ]);

        $request->session()->flash('status', 'done');
        return back();
    }

    public function showProductByCategory($category_id, $slug = '', $byType = 'bydate')
    {
        if($byType == 'bydate')
        {
            $category = Category::findOrFail($category_id);
            $products = $category->products()->with('tags','category','picture')->online()->orderBy('published_at', 'DESC')->paginate(5);
            return view('front.category', compact('products', 'category'));
        }
        else if($byType == 'byname')
        {
            // Les deux methodes ci-dessous marchent
//        $products = Product::with('tags','category','picture')->where('category_id','=',$category_id)->paginate(5);
            $category = Category::findOrFail($category_id);
            $products = $category->products()->with('tags','category','picture')->online()->orderBy('name', 'ASC')->paginate(5);
            return view('front.category', compact('products', 'category')); // compact: ['products' => $products]
        }
        else if($byType == 'byprice')
        {
            $category = Category::findOrFail($category_id);
            $products = $category->products()->with('tags','category','picture')->online()->orderBy('price', 'DESC')->paginate(5);
            return view('front.category', compact('products', 'category'));
        }
        else if($byType == 'byscore')
        {
            $category = Category::findOrFail($category_id);
            $products = $category->products()->with('tags','category','picture')->online()->orderBy('score', 'DESC')->paginate(5);
            return view('front.category', compact('products', 'category'));
        }
    }

    public function showProductByTag($tag_id, $name = '', $byType = 'bydate')
    {
        if($byType == 'bydate')
        {
            $tag = Tag::find($tag_id);
            $products = $tag->products()->with('tags', 'category', 'picture')->online()->orderBy('published_at', 'DESC')->paginate(5);
            return view('front.tag', compact('products', 'tag'));
        }
        else if($byType == 'byname')
        {
            $tag = Tag::find($tag_id);
            $products = $tag->products()->with('tags', 'category', 'picture')->online()->orderBy('name', 'ASC')->paginate(5);
            return view('front.tag', compact('products', 'tag'));
        }
        else if($byType == 'byprice')
        {
            $tag = Tag::find($tag_id);
            $products = $tag->products()->with('tags', 'category', 'picture')->online()->orderBy('price', 'DESC')->paginate(5);
            return view('front.tag', compact('products', 'tag'));
        }
        else if($byType == 'byscore')
        {
            $tag = Tag::find($tag_id);
            $products = $tag->products()->with('tags', 'category', 'picture')->online()->orderBy('score', 'DESC')->paginate(5);
            return view('front.tag', compact('products', 'tag'));
        }

    }

    public function showContact()
    {
        return view('front.contact');
    }

    public function storeContact(Request $request)
    {
        // $request->all(); données du formulaire
//        $validator = Validator::make($request->all(),[
//            'email' => 'required|email', // field du formulaire => regex, verif
//            'content' => 'required|max:255'
//        ]);
//        var_dump($validator->messages());
//        dd($validator->fails());
//        // dd($validator->fails()); // si true c'est qu'on a echoué
//        if($validator->fails()) return back()->withInput()->withErrors($validator);

        # Tout ce qu'il y a dessus est accessible avec les lignes ci-dessous qui automatisent
        $this->validate($request, [
            'email' => 'required|email', // field du formulaire => regex, verif
            'content' => 'required|max:255'// customiser le message d'error pour require dans validation.php tableau custom
        ]);

        # on va s'envoyer des mails (au technicien par ex) views/emails/contact.blade.php
        $content = $request->input('content');
//        $test = $request->input();
//        var_dump($test);
//        dd($test['email']);
//        dd($request->input());
        Mail::send('emails.contact',$request->input(), function($m) use($request) {
//            dd($m);
            $m->from($request->input('email'), 'Client'); // from mail client
            $m->to(env('EMAIL_TECH'),'admin')->subject('Contact e-boutique');
        });


        // on peut faire aussi un redirect('contact') vers l'URI /contact
        // pour info: le with ci-dessous met tout dans l'objet Session qu'on recupère
        // dans front/partials/flash.blade.php
        return back()->with([
            'message' => trans('app.contactSuccess'),
            'alert' => 'done' // css pour les différentes alertes de nos messages
        ]);
    }
    /*equivalent à
    session_start();
    $_SESSION['laravel']['message'] = trans('app.contactSucces');
    $_SESSION['laravel']['alert'] = 'success';
    */
}
