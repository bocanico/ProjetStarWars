<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use View;
use App\Category;
use App\History;
use App\Picture;
use App\Product;
use App\Tag;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    /**f
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $products = Product::with('tags','category','picture')->orderBy('published_at')->paginate(4);
        return view('admin.product', compact('products'));
//        var_dump('test');
    }


    public function changeStatus($id)
    {
        $product = Product::find($id);

        $product->status = ($product->status=='opened')? 'closed' : 'opened';
        $product->save(); // pour sauver en base de donnée

//        return view('product');
        return back()->with(['message' => trans('app.changeStatus')]);
    }

    public function showHistory()
    {
//        $histories = History::orderBy('command_at')->get();
        $histories = History::with('customer','product')->orderBy('command_at')->paginate(6);
//        $user = $histories->user();
//        $total = [];
//        foreach ($histories as $history)
//        {
//            $total[] += $history->quantity * $history->price;
//        }
        return view('admin.history', compact('histories'));//, compact('histories','products','customers'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
//        $tags = Tag::all();
        $tags = Tag::lists('name','id');
        $categories = Category::lists('title','id');
        return view('admin.create', compact('tags','categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Requests\ProductRequest $request)
    {
        # le $this->validate ci-dessous peut-être supprimé par injection de ProductRequest
//        dd($request->all());
        // Rappel ci-dessous cette méthode redirige vers le formulaire + rajoute les errors etc...
//        $this->validate($request, [
//            'name'          => 'required|string|max:255',
//            'slug'          => 'string',
//            'category_id'   => 'integer',
//            'price'         => 'required|numeric',
//            'quantity'      => 'integer',
//            'status'        => 'in:opened,closed',
//            'published_at'  => 'required|date_format:Y-m-j',
//            'thumbnail'     => 'image|max:3000', // en byte (octet) donc 3Mo
//        ]);


        $tags = $request->input('tags');
        $product = Product::create($request->all());

        if (!empty($tags))
            $product->tags()->attach($tags);

        # phpini limite le nombre d'octets pour une image téléchargée
//        dd($request->file('thumbnail'));
        if (!is_null($request->file('thumbnail'))) {

            $im = $request->file('thumbnail');

            // extension de l'image
            $ext = $im->getClientOriginalExtension();
            $uri = str_random(12).'.'.$ext;

//            dd($im->move(env('UPLOAD_PATH', './uploads'), $uri));
            $im->move(env('UPLOAD_PATH', './uploads'), $uri); // Exception renvoyée par le framework si problem


            # Bien veiller aux fillables de Picture pour que ça marche ci-dessous
            # et !! si on a deja 'move' notre image, getSize ne marche plus, il faut getClientSize
            Picture::create([
                'uri' => $uri,
                'size' => $im->getClientSize(),
                'type' => $ext,
                'product_id' => $product->id
            ]);
        }
//    dd($request->input('status'));
        return back()->with([
            'alert' => 'done',
            'message' => 'produit créé',
        ]);
//        return redirect('product')->with(['message' => 'succes add'])
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        //dd('methode show');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $product = Product::find($id);

        $tags = Tag::all();
        $product_tags = [];
        foreach ($product->tags as $tag) {
            $product_tags[] = $tag->name;
        }
        $categories = Category::all();
        $product_category = $product->category->title;
//        var_dump($categories);
//        dd($product_category);
        return view('admin.editproduct', compact('product','categories','product_category','tags','product_tags'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\ProductRequest $request, $id)
    {
//        $this->validate($request, [
//            'name'          => 'required|string|max:255',
//            'slug'          => 'string',
//            'category_id'   => 'integer',
//            'price'         => 'required|numeric',
//            'quantity'      => 'integer',
//            'status'        => 'in:opened,closed',
//            'published_at'  => 'required|date_format:Y-m-j',
//            'thumbnail'     => 'image|max:3000', // en byte (octet) donc 3Mo
//            'delete_img'    => 'in:1'
//        ]);

        $tags = $request->input('tags');
        $product = Product::find($id);

        if(!empty($tags))
        {
//            $product->tags()->detach();
//            $product->tags()->attach($tags);
            // equivalent à
            $product->tags()->sync($tags);
        }else{
            $product->tags()->detach(); // s'il n y a pas de tags ou tags décochés
        }


        // gestion image et
        $picture = $product->picture;
        if($request->input('delete_img') == 1)
        {
            if(!is_null($picture))
            {
                Storage::delete($picture->uri); // supprime le fichier physiquement
                $picture->delete(); // supprime la picture en BDD dans la table pictures
            }
        }


        if (!is_null($request->file('thumbnail'))) {
            // on remet ce bout de code ci-dessous au cas ou boutton supprimer non coché et nouvelle image uploadée
            if(!is_null($picture))
            {
                Storage::delete($picture->uri); // supprime le fichier physiquement
                $picture->delete(); // supprime la picture en BDD dans la table pictures
            }

            $im = $request->file('thumbnail');

            // extension de l'image
            $ext = $im->getClientOriginalExtension();
            $uri = str_random(12).'.'.$ext;

//        dd($im->move(env('UPLOAD_PATH', './uploads'), $uri));
            $im->move(env('UPLOAD_PATH', './uploads'), $uri); // Exception renvoyée par le framework si problem


            # Bien veiller aux fillables de Picture pour que ça marche ci-dessous
            # et !! si on a deja 'move' notre image, getSize ne marche plus, il faut getClientSize
            Picture::create([
                'uri' => $uri,
                'size' => $im->getClientSize(),
                'type' => $ext,
                'product_id' => $product->id
            ]);
        }

        $product->update($request->all());

        return redirect('product')->with([
            'alert' => 'done',
            'message' => 'update produit',
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if(Auth::user()->role === 'administrator')
        {
            // il faut supprimer le produit et la picture associée
            $product = Product::find($id);
            $picture = $product->picture;

            if(!is_null($picture))
            {
                Storage::delete($picture->uri); // supprime le fichier physiquement
                $picture->delete(); // supprime la picture en BDD
            }

            $product->delete(); // on cascade pour les tags N-N

            return back()->with([
            'message' => 'Produit retiré',
            'alert' => 'done'
            ]);
        }
        else return back()->with([
            'message' => 'You have no acces',
            'alert' => 'fail'
        ]);

    }
}
