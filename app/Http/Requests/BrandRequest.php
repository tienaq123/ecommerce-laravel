<?php

namespace App\Http\Requests;

use App\Http\Enums\StatusEnum;
use App\Models\Brand;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class BrandRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => [
                'required',
                Rule::unique('brands')->whereNull('deleted_at')->ignore($this->route('brand'))

            ],
            'description' => ['nullable'],
            'image' => ['nullable'],
            'status' => [
                'required',
                Rule::in([StatusEnum::ACTIVE, StatusEnum::UNACTIVE]),
            ],
        ];
    }
    public function withValidator($validator)
    {

        $validator->after(function ($validator) {
            $request = $this->all();

            $exists = Brand::where(function ($query) use ($request) {
                if (isset($request['id'])) {
                    $query->where('id', '!=', $request["id"]);
                }
                $query->where(['name' => $request["name"]]);
            })->exists();

            if ($exists) {
                $validator->errors()->add('name', 'Tên đã tồn tại.');
            }
        });
    }
}
