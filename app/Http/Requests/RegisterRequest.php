<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class RegisterRequest extends FormRequest
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
            "name" => "required",
            'email' => 'required|email|unique:users,email',
            'date_of_birth' => 'required|date',
            'password' => 'required',
            're_password' => 'required_with:password|same:password'

        ];
    }
    public function messages()
    {
        return [
            'email.required' => 'Trường email là bắt buộc.',
            'email.email' => 'Trường email phải là một địa chỉ email hợp lệ.',
            'email.unique' => 'Trường email đã tồn tại trong hệ thống.',
            'name.required' => 'Trường tên là bắt buộc.',
            'date_of_birth.date' => 'Trường ngày sinh phải là ngày hợp lệ',
            'date_of_birth.required' => 'Trường ngày sinh là bắt buộc',
            'password.required' => 'Trường mật khẩu là bắt buộc.',
            're_password.required_with' => 'Trường nhập lại mật khẩu là bắt buộc khi mật khẩu được cung cấp.',
            're_password.same' => 'Mật khẩu nhập lại không khớp.'
        ];
    }
    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            response()->json([
                'success' => false,
                'messages' => 'Validate errors',
                'data' => $validator->errors()
            ], 402)
        );
    }
}
