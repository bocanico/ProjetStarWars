<?php

use Illuminate\Database\Seeder;

class CategoryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('categories')->insert(
            [
                [
                    'title'         => 'lasers',
                    'slug'          => 'lasers',
                    'description'   => 'bla bla bla'
                ],
                [
                    'title'         => 'casques',
                    'slug'          => 'casques',
                    'description'   => 'bli bli bli'
                ]
            ]
        );
    }
}
