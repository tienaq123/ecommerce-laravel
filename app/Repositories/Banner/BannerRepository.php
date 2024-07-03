<?php

namespace App\Repositories\Banner;

use App\Http\Enums\PaginateDefault;
use App\Http\Requests\BannerRequest;
use App\Models\Banner;
use App\Repositories\Banner\BannerInterface;
use Illuminate\Pagination\Paginator;
use App\Repositories\BaseRepository;
use Illuminate\Http\Request;

class BannerRepository extends BaseRepository implements BannerInterface
{
    private Banner $banner;
    public function __construct(Banner $banner)
    {
        $this->banner = $banner;
    }

    public function get(Request $request)
    {
        $builder = $this->banner->newQuery();
        $builder->sortable([$request->sort ?? 'created_at' => $request->order ?? 'desc']);
        $data = $builder->paginate($request->per_page ?? PaginateDefault::PER_PAGE);

        if ($this->checkPaginatorList($data)) {
            Paginator::currentPageResolver(function () {
                return PaginateDefault::FIRST_PAGE;
            });
            $data = $builder->paginate($request->per_page ?? PaginateDefault::PER_PAGE);
        }
        return $data;
    }

    public function getById(string $id)
    {
        $banner = $this->banner->query();
        $banner->where('id', $id);
        $data = $banner->first();
        if (!$data) {
            return null;
        }

        return $data;
    }

    public function store(BannerRequest $request)
    {
        $data = $request->validated();
        $banner = $this->banner->create($data);

        return $banner;
    }

    public function update(BannerRequest $request, $id)
    {
        $data = $request->validated();
        $banner = $this->banner->find($id);

        if (!$banner) {
            return null;
        }

        $banner->update($data);
        return $banner;
    }

    public function destroy($id)
    {
        $banner = $this->banner->find($id);

        if (!$banner) {
            return false;
        }

        return $banner->delete();
    }

    public function toggle($id)
    {
        $banner = $this->banner->find($id);
        if (!$banner) {
            return null;
        }
        $banner->active = !$banner->active;
        $banner->save();

        return $banner;
    }
}
