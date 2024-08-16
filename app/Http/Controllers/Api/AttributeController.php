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
            foreach ($request->values as $valueData) {
                $attribute->values()->create([
                    'value' => $valueData['value']
                ]);
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
            'values.*.id' => 'nullable|exists:attribute_values,id',
            'values.*.value' => 'required|string|max:255'
        ]);

        $attribute = Attribute::findOrFail($id);
        $attribute->update([
            'name' => $request->name,
        ]);

        if ($request->has('values')) {
            foreach ($request->values as $valueData) {
                if (isset($valueData['id'])) {
                    // Cập nhật giá trị thuộc tính đã tồn tại
                    $attributeValue = $attribute->values()->find($valueData['id']);
                    if ($attributeValue) {
                        $attributeValue->update([
                            'value' => $valueData['value']
                        ]);
                    }
                } else {
                    // Thêm mới giá trị thuộc tính
                    $attribute->values()->create([
                        'value' => $valueData['value']
                    ]);
                }
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
