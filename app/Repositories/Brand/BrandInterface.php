<?php

namespace App\Repositories\Brand;

use App\Http\Requests\BrandRequest;
use Illuminate\Http\Request;

interface BrandInterface
{
    public function get(Request $request);

    public function getById(string $id);

    public function store(BrandRequest $request);

    public function update(BrandRequest $request, $id);

    public function destroy($id);

    public function toggle($id);
}
