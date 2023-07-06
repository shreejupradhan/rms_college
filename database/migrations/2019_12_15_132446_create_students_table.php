<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateStudentsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('students', function(Blueprint $table)
		{
			$table->bigIncrements('id');
			$table->integer('number_of_student');
            $table->unsignedInteger('batch_id');
            $table->integer('yearly_session_id')->nullable()->foreign('yearly_session_id')->references('id')->on('yearly_sessions');
            $table->enum('is_active',['yes','no'])->default('yes');
			$table->timestamps();
            $table->foreign('batch_id')->references('id')->on('batch')->onDelete('cascade');

		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::dropIfExists('students');
	}

}
