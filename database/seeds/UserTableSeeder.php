<?php

use Illuminate\Database\Seeder;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert(
            [
                [
                    'name'      => 'nico',
                    'email'     => 'nico@nico.fr',
                    'password'  => Hash::make('nico'),
                    'role'      => 'administrator'
                ],
                [
                    'name'      => 'tony',
                    'email'     => 'tony@tony.fr',
                    'password'  => Hash::make('tony'),
                    'role'      => 'editor'
                ],
                [
                    'name'      => 'antoine',
                    'email'     => 'antoine@antoine.fr',
                    'password'  => Hash::make('antoine'),
                    'role'      => 'visitor'
                ],
                [
                    'name'      => 'yini',
                    'email'     => 'yini@yini.fr',
                    'password'  => Hash::make('yini'),
                    'role'      => 'visitor'
                ],
                [
                    'name'      => 'jb',
                    'email'     => 'jb@jb.fr',
                    'password'  => Hash::make('jb'),
                    'role'      => 'visitor'
                ]
            ]
        );
    }
}
