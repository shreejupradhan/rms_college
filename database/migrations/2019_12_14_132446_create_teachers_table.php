<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTeachersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('teachers', function(Blueprint $table)
		{
			$table->increments('id');
			$table->unsignedBigInteger('user_id')->nullable();
			$table->string('slug')->nullable();
            $table->unsignedBigInteger('rank_id')->nullable();
            $table->integer('department_id')->nullable()->foreign('department_id')->references('id')->on('department');
            $table->enum('is_active',['yes','no'])->default('yes');
			$table->date('join_date')->nullable();
			$table->timestamps();
            $table->foreign('rank_id')->references('id')->on('teacher_ranks')->onDelete('set null');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('set null');


		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::dropIfExists('teachers');
	}

}
