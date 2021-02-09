<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFormResvalsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('form_resvals', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('form_id');
            $table->unsignedInteger('form_field_id');
            $table->smallInteger('sel_type');
            $table->unsignedInteger('field_limit');
            $table->string('custom_text', 191);
            $table->softDeletes();
            $table->timestamps();
        });

        Schema::table('form_resvals', function (Blueprint $table) {
            $table->foreign('form_id')->references('id')->on('forms')->onDelete('cascade');
            $table->foreign('form_field_id')->references('id')->on('form_fields')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('form_resvals');
    }
}
