<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $orders = Order::with(['items.product.productImages', 'status']) // Include the productImages relationship
            ->where('status_id', '!=', 1) // Chỉ lấy đơn hàng đã xác nhận
            ->get();

        $orderDetails = $orders->map(function ($order) {
            return [
                'id' => $order->id,
                'user_id' => $order->user_id,
                'user_name' => $order->user->name,
                'total_amount' => $order->total_amount,
                'payment' => $order->payment,
                'address_detail' => $order->address_detail,
                'ward' => $order->ward,
                'district' => $order->district,
                'city' => $order->city,
                'status_id' => $order->status_id,
                'status' => $order->status->name,
                'created_at' => $order->created_at,
                'updated_at' => $order->updated_at,
                'items' => $order->items->map(function ($item) {
                    return [
                        'id' => $item->id,
                        'order_id' => $item->order_id,
                        'product_id' => $item->product_id,
                        'quantity' => $item->quantity,
                        'price' => $item->price,
                        'total_price' => $item->quantity * $item->price,
                        'product' => [
                            'id' => $item->product->id,
                            'name' => $item->product->name,
                            'description' => $item->product->description,
                            'price' => $item->product->price,
                            'image' => $item->product->productImages->first()->image_url ?? null, // Ảnh sản phẩm
                        ],
                    ];
                }),
            ];
        });

        return response()->json([
            'status' => true,
            'message' => 'Success',
            'data' => $orderDetails
        ]);
    }


    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function updateStatus(Request $request, $id)
    {
        // Xác thực yêu cầu
        $validator = Validator::make($request->all(), [
            'status_id' => 'required|integer|between:1,5',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Invalid status ID',
                'errors' => $validator->errors(),
            ], 400);
        }

        // Tìm đơn hàng theo ID
        $order = Order::find($id);

        if (!$order) {
            return response()->json([
                'status' => false,
                'message' => 'Order not found',
            ], 404);
        }

        // Cập nhật trạng thái đơn hàng
        $order->status_id = $request->input('status_id');
        $order->save();

        return response()->json([
            'status' => true,
            'message' => 'Order status updated successfully',
            'data' => [
                'order_id' => $order->id,
                'new_status' => $order->status->name, // Hiển thị tên trạng thái mới
            ]
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
