<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateYearlyLogTable extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'create-yearly-log-table';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create log table yearly';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $year = now()->year;
        $tableName = 'tbl_logs_' . $year;

        if (!Schema::hasTable($tableName)) {
            Schema::create($tableName, function (Blueprint $table) {
                $table->string('LogID', 50)->primary();
                $table->string('ReferID', 50)->nullable();
                $table->string('Description', 255)->nullable();
                $table->string('ModuleName', 150)->nullable();
                $table->string('Action', 100)->nullable();
                $table->text('OldData')->nullable();
                $table->text('NewData')->nullable();
                $table->string('IPAddress', 100)->nullable();
                $table->string('UserID', 50)->nullable();
                $table->timestamp('LogTime')->default(DB::raw('CURRENT_TIMESTAMP'));
            });
            $this->info("Table $tableName created successfully.");
        } else {
            $this->info("Table $tableName already exists.");
        }
    }
}
