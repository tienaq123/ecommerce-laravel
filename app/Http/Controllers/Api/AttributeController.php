<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Attribute;

class AttributeController extends Controller
{
    public function index()
    {
        $attributes = Attribute::with('values')->get();

        return response()->json([
            'status' => true,
            'message' => 'Success',
            'data' => $attributes
        ], 200);
    }

    // Thêm mới thuộc tính
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'values' => 'nullable|array',
            'values.*.value' => 'required|string|max:255'
        ]);

        $attribute = Attribute::create([
            'name' => $request->name,
        ]);

        if ($request->has('values')) {
            $existingValues = []; // Mảng để lưu trữ các giá trị đã thêm

            foreach ($request->values as $valueData) {
                $value = $valueData['value'];

                // Kiểm tra xem giá trị đã tồn tại trong mảng hoặc trong cơ sở dữ liệu chưa
                if (!in_array($value, $existingValues) && !$attribute->values()->where('value', $value)->exists()) {
                    $attribute->values()->create([
                        'value' => $value
                    ]);

                    // Thêm giá trị vào mảng $existingValues để không bị tạo trùng
                    $existingValues[] = $value;
                }
            }
        }

        return response()->json([
            'status' => true,
            'message' => 'Attribute created successfully',
            'data' => $attribute->load('values')
        ], 201);
    }


    // Cập nhật thuộc tính
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'values' => 'nullable|array',
            'values.*.value' => 'required|string|max:255'
        ]);

        $attribute = Attribute::findOrFail($id);
        $attribute->update([
            'name' => $request->name,
        ]);

        if ($request->has('values')) {
            // Loại bỏ các giá trị trùng lặp trong request
            $requestValues = collect($request->values)->pluck('value')->unique()->toArray(); // Lấy danh sách các 'value' và loại bỏ trùng lặp
            $existingValues = $attribute->values()->pluck('value')->toArray(); // Lấy danh sách các 'value' hiện có trong DB

            // 1. Xóa các giá trị không có trong request
            $valuesToDelete = array_diff($existingValues, $requestValues); // Các giá trị có trong DB nhưng không có trong request
            $attribute->values()->whereIn('value', $valuesToDelete)->delete(); // Xóa những giá trị này

            // 2. Thêm mới các giá trị có trong request mà chưa có trong DB
            $valuesToAdd = array_diff($requestValues, $existingValues); // Các giá trị có trong request nhưng chưa có trong DB
            foreach ($valuesToAdd as $value) {
                $attribute->values()->create(['value' => $value]);
            }
        }

        return response()->json([
            'status' => true,
            'message' => 'Attribute updated successfully',
            'data' => $attribute->load('values')
        ], 200);
    }






    // Xóa thuộc tính
    public function destroy($id)
    {
        $attribute = Attribute::findOrFail($id);
        $attribute->delete();

        return response()->json([
            'status' => true,
            'message' => 'Attribute deleted successfully'
        ], 200);
    }

    public function destroyValue($attributeId, $valueId)
    {
        $attribute = Attribute::findOrFail($attributeId);
        $attributeValue = $attribute->values()->findOrFail($valueId);

        $attributeValue->delete();

        return response()->json([
            'status' => true,
            'message' => 'Attribute value soft deleted successfully'
        ], 200);
    }

    public function restoreValue($attributeId, $valueId)
    {
        $attribute = Attribute::findOrFail($attributeId);
        $attributeValue = $attribute->values()->withTrashed()->findOrFail($valueId);

        $attributeValue->restore();

        return response()->json([
            'status' => true,
            'message' => 'Attribute value restored successfully'
        ], 200);
    }
}
