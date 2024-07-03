<?php

namespace App\Repositories\Banner;

use App\Http\Requests\BannerRequest;
use Illuminate\Http\Request;

interface BannerInterface
{
    public function get(Request $request);

    public function getById(string $id);

    public function store(BannerRequest $request);

    public function update(BannerRequest $request, $id);

    public function destroy($id);

    public function toggle($id);
}
