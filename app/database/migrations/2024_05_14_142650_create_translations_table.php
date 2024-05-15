<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('translation_keys', function (Blueprint $table) {
            $table->id();
//            $table->enum('module', ['General', 'Product', 'Order']);
//            $table->string('language_code');
            $table->text('key')->nullable();
//            $table->boolean('need_editor')->default(false);
            $table->timestamps();
        });

        Schema::create('translations', function (Blueprint $table) {
            $table->id();
//            $table->enum('module', ['General', 'Product', 'Order']);
            $table->foreignId('language_id');
            $table->text('value')->nullable();
//            $table->boolean('need_editor')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('translations');
        Schema::dropIfExists('translation_keys');
    }
};
