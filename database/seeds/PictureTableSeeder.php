<?php

use Illuminate\Database\Seeder;
//use Illuminate\Support\Facades\Storage;
use App\Picture;

class PictureTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */

    protected $faker;

    public function __construct(Faker\Generator $faker)
    {
        $this->faker = $faker;
    }


    public function run()
    {
        $files = Storage::allFiles();

        foreach($files as $file) Storage::delete($file);

        $products = App\Product::all();

        foreach($products as $product) {
            // pour importer de fichiers distants
            $uri = str_random(12).'_370x235.jpg';
            Storage::put(
                $uri,
                file_get_contents('http://lorempixel.com/futurama/370/235/')
            );
            Picture::create([
                'product_id' => $product->id,
                'uri' => $uri,
                'title' => $this->faker->name
            ]);
        }
    }
}
