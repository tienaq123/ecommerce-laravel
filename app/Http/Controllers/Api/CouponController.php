<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Coupon;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Nette\Utils\Random;
use Illuminate\Support\Str;

class CouponController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $coupons = Coupon::all();
        foreach ($coupons as $coupon) {
            if ($coupon->expiration_date <= now()) {
                $this->updateStatus($coupon->id);
            }
        }
        return response()->json([
            'status' => true,
            'data' => $coupons
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = Validator::make($request->input(), [
            'code' => 'required|min:6|max:6|uppercase|unique:coupons,code',
            'discount' => 'required|integer|between:1,100',
            'expiration_date' => 'required|date'
        ]);
        if ($validation->fails()) {
            return response()->json([
                'status' => false,
                'error' => $validation->errors()
            ]);
        }
        if ($request->expiration_date <= now()) {
            return response()->json([
                'status' => false,
                'error' => 'Ngày hết hạn phải lớn hơn ngày hiện tại'
            ]);
        }
        try {
            DB::transaction(function () use ($request) {
                Coupon::create($request->input());
            });
            return response()->json([
                'status' => true,
                'message' => 'Thêm mới mã khuyến mãi thành công'
            ]);
        } catch (\Exception  $e) {
            return response()->json([
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }
    public function makeCode()
    {
        $code = Coupon::all('code')->toArray();
        $makeCode = Str::random(6);
        do {
            $makeCode = Str::random(6);
        } while (in_array($makeCode, $code));
        return strtoupper($makeCode);
    }
    /**
     * Display the specified resource.
     */
    public function showById(string $id)
    {
        $coupon = Coupon::find($id);
        if ($coupon) {
            if ($coupon->status == 'unactive') {
                return response()->json([
                    'status' => false,
                    'message' => 'Mã khuyến mãi đã hết hạn'
                ]);
            }
            return response()->json([
                'status' => true,
                'data' => $coupon
            ]);
        }
        return response()->json([
            'status' => false,
            'message' => 'Không tìm thấy mã khuyến mãi'
        ]);
    }
    public function getByCode(Request $request)
    {
        $validation = Validator::make($request->input(), [
            'code' => 'required'
        ]);
        if ($validation->fails()) {
            return response()->json([
                'status' => false,
                'error' => $validation->errors()
            ]);
        }
        $coupon = Coupon::where('code', $request->code)->first();
        if ($coupon) {
            if ($coupon->status == 'unactive') {
                return response()->json([
                    'status' => false,
                    'message' => 'Mã khuyến mãi đã hết hạn'
                ]);
            }
            return response()->json([
                'status' => true,
                'data' => $coupon
            ]);
        }
        return response()->json([
            'status' => false,
            'message' => 'Không tìm thấy mã khuyến mãi'
        ]);
    }
    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validation = Validator::make($request->input(), [
            'code' => 'required|min:6|max:6|uppercase|unique:coupons,code,' . $id,
            'discount' => 'required|integer|between:1,100',
            'expiration_date' => 'required|date'
        ]);
        if ($validation->fails()) {
            return response()->json([
                'status' => false,
                'error' => $validation->errors()
            ]);
        }
        if ($request->expiration_date <= now()) {
            return response()->json([
                'status' => false,
                'error' => 'Ngày hết hạn phải lớn hơn ngày hiện tại'
            ]);
        }
        try {
            DB::transaction(function () use ($request, $id) {
                $coupon = Coupon::find($id);
                $coupon->update($request->input());
            });
            return response()->json([
                'status' => true,
                'message' => 'Cập nhật mã khuyến mãi thành công'
            ]);
        } catch (\Exception  $e) {
            return response()->json([
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }

    /**
     * Update status coupon
     */
    public function updateStatus($id)
    {
        $coupon = Coupon::find($id);
        if (!$coupon) {
            return response()->json([
                'status' => false,
                'message' => 'Mã khuyến mãi không tồn tại'
            ]);
        }
        try {
            DB::transaction(function () use ($coupon) {
                // $coupon->update($request->all());
                if ($coupon->status == 'active') {
                    $coupon->status = 'unactive';
                    $coupon->save();
                } else {
                    $coupon->status = 'active';
                    $coupon->save();
                }
            });
            return response()->json([
                'status' => true,
                'message' => 'Cập nhật trạng thái mã khuyến mại thành công'
            ]);
        } catch (\Exception  $e) {
            return response()->json([
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $coupon = Coupon::find($id);
        if (!$coupon) {
            return response()->json([
                'status' => false,
                'message' => 'Mã khuyến mãi không tồn tại'
            ]);
        }
        try {
            DB::transaction(function () use ($coupon) {
                $coupon->delete();
            });
            return response()->json([
                'status' => true,
                'message' => 'Xóa mã khuyến mãi thành công'
            ]);
        } catch (\Exception  $e) {
            return response()->json([
                'status' => false,
                'error' => $e->getMessage()
            ]);
        }
    }
}
