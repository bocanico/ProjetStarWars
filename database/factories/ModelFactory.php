<?php

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| Here you may define all of your model factories. Model factories give
| you a convenient way to create models for testing and seeding your
| database. Just tell the factory how a default model should look.
|
*/

//$factory->define(App\User::class, function (Faker\Generator $faker) {
//    return [
//        'name' => $faker->name,
//        'email' => $faker->email,
//        'password' => bcrypt(str_random(10)),
//        'remember_token' => str_random(10),
//    ];
//});

// factory pour insérer des données dans la table Product
$factory->define(App\Product::class, function (Faker\Generator $faker) {

    $name = $faker->name;

    return [
        'name' => $name,
        'slug' => str_slug($name, '-'),
        'category_id' => rand(1,2),
        'price' => $faker->randomFloat(2, 20, 2000),
        'quantity' => $faker->numberBetween(1,10),
        'score' => 0,
        'abstract' => $faker->sentence(rand(6,10)),
        'content' => $faker->paragraph(rand(3,8)),
        'published_at' => $faker->date('Y-m-d','now')
    ];
});

// factory pour insérer des données dans la table Tag
$factory->define(App\Tag::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->word,
    ];
});

// factory pour insérer des données dans la table Customer
$factory->define(App\Customer::class, function (Faker\Generator $faker) {
    static $userId = 0;

    return [
        'user_id' => ++$userId,
        'address' => $faker->address,
        'number_card' => $faker->creditCardNumber,
        'number_command' => rand(1,200)
    ];
});
