<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRoutineTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('routine', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('teacher_id');
            $table->unsignedInteger('batch_id');
            $table->unsignedInteger('section_id')->nullable();
//            $table->integer('day_wise_slot_id')->nullable()->foreign('day_wise_slot_id')->references('id')->on('day_wise_slots');
            $table->unsignedBigInteger('day_id');
            $table->unsignedBigInteger('time_slot_id');
            $table->unsignedInteger('course_id');
            $table->unsignedInteger('room_id');
            $table->integer('created_by')->nullable()->foreign('created_by')->references('id')->on('users');
            $table->integer('edited_by')->nullable()->foreign('edited_by')->references('id')->on('users');
            $table->unsignedBigInteger('yearly_session_id');
            $table->enum('is_active',['yes','no'])->default('yes');
            $table->timestamps();

            $table->foreign('teacher_id')->references('id')->on('teachers')->onDelete('cascade');
            $table->foreign('batch_id')->references('id')->on('batch')->onDelete('cascade');
            $table->foreign('section_id')->references('id')->on('sections');
            $table->foreign('day_id')->references('id')->on('days')->onDelete('cascade');
            $table->foreign('time_slot_id')->references('id')->on('time_slots')->onDelete('cascade');
            $table->foreign('course_id')->references('id')->on('courses')->onDelete('cascade');
            $table->foreign('room_id')->references('id')->on('rooms')->onDelete('cascade');
            $table->foreign('yearly_session_id')->references('id')->on('yearly_sessions')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('routine');
    }
}
