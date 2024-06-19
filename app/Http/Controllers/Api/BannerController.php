<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\BannerResources;
use App\Models\Banner;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator as FacadesValidator;

class BannerController extends Controller
{
    public function index()
    {
        $banners = Banner::all();
        return response()->json([
            'status' => true,
            'message' => 'Success banners',
            'data' => BannerResources::collection($banners)
        ], 200);
    }

    public function show($id)
    {
        $banner = Banner::find($id);
        if (!$banner) {
            return response()->json([
                'status' => false,
                'message' => 'Banner does not exist',
                'data' => []
            ], 404);
        }
        return response()->json([
            'status' => true,
            'message' => 'Success',
            'data' => new BannerResources($banner)
        ], 200);
    }

    public function store(Request $request)
    {
        $validation = FacadesValidator::make(
            $request->all(),
            [
                'title' => ['required', 'min:2', 'max:100'],
                'image_url' => ['required'],
                'link' => ['required'],
            ]
        );

        if ($validation->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Error',
                'data' => $validation->errors()
            ], 422);
        }

        $data = $request->all();
        $banner = Banner::create($data);
        return response()->json([
            'status' => true,
            'message' => 'Success',
            'data' => new BannerResources($banner)
        ], 200);
    }
    public function update(Request $request, $id)
    {
        $banner = Banner::find($id);
        if (!$banner) {
            return response()->json([
                'status' => false,
                'message' => 'Không tồn tại',
                'data' => []
            ], 404);
        }
        $validation = FacadesValidator::make(
            $request->all(),
            [
                'title' => ['required', 'min:2', 'max:100'],
                'image_url' => ['required'],
                'link' => ['required'],
            ]
        );

        if ($validation->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Error',
                'data' => $validation->errors()
            ], 422);
        }

        $data = $request->all();
        $banner->update($data);
        return response()->json([
            'status' => true,
            'message' => 'Success',
            'data' => new BannerResources($banner)
        ], 200);
    }
}
