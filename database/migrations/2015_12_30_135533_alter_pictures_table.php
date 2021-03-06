<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterPicturesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // modifie la structure de la table (qui doit donc exister)
        Schema::table('pictures', function (Blueprint $table) {
            $table->enum('type',['png', 'jpg', 'jpeg', 'gif'])->after('size');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('pictures', function (Blueprint $table) {
            $table->dropColumn('type');
        });
    }
}
