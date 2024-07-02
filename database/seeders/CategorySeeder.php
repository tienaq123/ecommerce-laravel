<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $parentCategories = Category::factory()->count(5)->create();
        $parentCategories->each(function ($category) {
            Category::factory()->count(3)->create(['parent_id' => $category->id]);
        });
    }
}
