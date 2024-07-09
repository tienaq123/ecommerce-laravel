<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\BrandRequest;
use App\Http\Resources\BrandResource;
use App\Repositories\Brand\BrandInterface;
use Illuminate\Http\Request;

class BrandController extends Controller
{
    private BrandInterface $brand;

    public function __construct(BrandInterface $brand)
    {
        $this->brand = $brand;
    }

    public function index(Request $request)
    {
        $data = $this->brand->get($request);
        if ($data) {
            return BrandResource::collection($data);
        }
        return response()->apiJsonResponse([
            'data' => []
        ]);
    }

    public function show($id)
    {

        $brand = $this->brand->getById($id);
        if (!$brand) {
            return response()->json(['message' => 'Brand not found'], 404);
        }
        return BrandResource::make($brand);
    }

    public function store(BrandRequest $request)
    {
        $brand = $this->brand->store($request);
        return response()->json($brand, 201);
    }

    public function update(BrandRequest $request, $id)
    {
        $brand = $this->brand->update($request, $id);
        if (!$brand) {
            return response()->json(['message' => 'Brand not found'], 404);
        }
        return response()->json($brand);
    }


    public function destroy(string $id)
    {
        $deleted = $this->brand->destroy($id);
        if (!$deleted) {
            return response()->json(['message' => 'Brand not found'], 404);
        }
        return response()->json(['message' => 'Brand deleted successfully']);
    }

    public function toggleStatus(string $id)
    {
        $brand = $this->brand->toggle($id);
        if (!$brand) {
            return response()->json(['message' => 'Brand not found'], 404);
        }
        return response()->json($brand);
    }
}
