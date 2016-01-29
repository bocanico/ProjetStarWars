<?php

use Illuminate\Database\Seeder;
use App\Tag;
class ProductTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    // Correction Antoine Lucksco
    protected $tag;

    // Injection des dépendances (lire IOC Container)
    public function __construct(Tag $tag)
    {
        $this->tag = $tag;
    }

    public function run()
    {

        $shuffle = function($tags, $num)
        {
            $s = [];
            shuffle($tags); // fonction php de mélange d'un array
            while($num >= 0)
            {
                $s[] = $tags[$num];
                $num--;
            }
            return $s;
        };
        // pour appeller la fonction anonyme: shuffle($tags, 2);
        $max = $this->tag->count(); // $max = Tag::count();
        $tags = $this->tag->lists('id')->toArray(); // methode de laravel pour lister puis on passe
                                                    // d'une collection à un array pour la methode shuffle

        // maintenant on utilise le use du paradigme des fonctions anonymes, pour passer
        // $max, $tags, $shuffle
        factory(App\Product::class, 15)->create()->each(function($product) use($max, $tags, $shuffle){


            $product->tags()->attach($shuffle($tags, rand(1, $max-1))); // Product::find(1)->tags()->attach([id_tag_i, id_tag_j])

        });
    }








//    public function run()
//    {
//
//        // private $tags = App\Tag::all(); // avec global en dessous ne marche pas
//
//        factory(App\Product::class, 15)->create()->each(function($product)
//        {
//            // on peut maintenant travailler sur chaque objet product ex:
//            // après un php artisan migrate:refresh --seed
//            // devrait afficher les resultats dans la console
//            # var_dump($product->id);
//            # var_dump($product->tags);
//
//            // On va associer un product à 1, 2 ou 3 tags max
//            $tags = Tag::all();
//            // global $tags;
//            $result = [];
//
//            // tableau de nombres de la taille du nombre de tags
//            $array_tags = range(1 , count($tags), 1);
//
//            // array_rand pour creer des tableaux de taille (ici max 3) et indice variables
//            $tab = array_rand($array_tags, rand(1, 3));
//
//            // $array_rand renvoie les index
//            if (is_array($tab))
//            {
//                foreach ($tab as $index)
//                {
//                    $result[] = $array_tags[$index];
//                }
//            }
//            else $result[] = $array_tags[$tab];
//            // on attach les id des tags aux produits
//            $product->tags()->attach($result);
//        }
//        );
//    }
}



