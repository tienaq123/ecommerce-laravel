<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\BannerRequest;
use App\Http\Resources\BannerResources;
use App\Models\Banner;
use App\Repositories\Banner\BannerInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator as FacadesValidator;

class BannerController extends Controller
{

    private BannerInterface $banner;

    public function __construct(BannerInterface $banner)
    {
        $this->banner = $banner;
    }

    public function index(Request $request)
    {
        $data = $this->banner->get($request);
        if ($data) {
            return BannerResources::collection($data);
        }
        return response()->apiJsonResponse([
            'data' => []
        ]);
    }

    public function show($id)
    {

        $banner = $this->banner->getById($id);
        if (!$banner) {
            return response()->json(['message' => 'Banner not found'], 404);
        }
        return BannerResources::make($banner);
    }

    public function store(BannerRequest $request)
    {
        $banner = $this->banner->store($request);
        return response()->json($banner, 201);
    }

    public function update(BannerRequest $request, $id)
    {
        $banner = $this->banner->update($request, $id);
        if (!$banner) {
            return response()->json(['message' => 'Banner not found'], 404);
        }
        return response()->json($banner);
    }


    public function destroy(string $id)
    {
        $deleted = $this->banner->destroy($id);
        if (!$deleted) {
            return response()->json(['message' => 'Banner not found'], 404);
        }
        return response()->json(['message' => 'Banner deleted successfully']);
    }

    public function toggleStatus(string $id)
    {
        $banner = $this->banner->toggle($id);
        if (!$banner) {
            return response()->json(['message' => 'Banner not found'], 404);
        }
        return response()->json($banner);
    }
}
