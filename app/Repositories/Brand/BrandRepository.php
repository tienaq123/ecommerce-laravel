<?php

namespace App\Repositories\Brand;

use App\Http\Enums\PaginateDefault;
use App\Http\Requests\BrandRequest;
use App\Models\Brand;
use Illuminate\Pagination\Paginator;
use App\Repositories\BaseRepository;
use App\Repositories\Brand\BrandInterface;
use Illuminate\Http\Request;

class BrandRepository extends BaseRepository implements BrandInterface
{
    private Brand $brand;
    public function __construct(Brand $brand)
    {
        $this->brand = $brand;
    }

    public function get(Request $request)
    {
        $builder = $this->brand->newQuery();
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
        $brand = $this->brand->query();
        $brand->where('id', $id);
        $data = $brand->first();
        if (!$data) {
            return null;
        }

        return $data;
    }

    public function store(BrandRequest $request)
    {
        $brand = $this->brand->create($request->all());
        return $brand;
    }

    public function update(BrandRequest $request, $id)
    {
        $brand = $this->brand->find($id);

        if (!$brand) {
            return null;
        }

        $brand->update($request->all());
        return $brand;
    }

    public function destroy($id)
    {
        $brand = $this->brand->find($id);

        if (!$brand) {
            return false;
        }

        return $brand->delete();
    }

    public function toggle($id)
    {
        $brand = $this->brand->find($id);
        if (!$brand) {
            return null;
        }
        $brand->status = !$brand->status;
        $brand->save();

        return $brand;
    }
}
