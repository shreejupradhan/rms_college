<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTimeSlotsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('time_slots', function (Blueprint $table) {
            $table->id();
            $table->time('from')->nullable();
            $table->time('to')->nullable();
            $table->unsignedInteger('shift_id');
            $table->enum('is_active',['yes','no'])->default('yes');
            $table->enum('type',['1','2'])->default('1');
            $table->timestamps();
            $table->foreign('shift_id')->references('id')->on('shifts')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('time_slots');
    }
}
