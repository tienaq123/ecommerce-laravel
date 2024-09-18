<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;
use App\Models\ProductVariant;
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
        $orders = Order::with(['items.product' => function ($query) {
            $query->withTrashed(); // Lấy cả sản phẩm đã bị xóa mềm
        }, 'items.variant', 'status', 'user' => function ($query) {
            $query->withTrashed();
        }]) // Include status relationship
            ->where('status_id', '!=', 6) // Chỉ lấy đơn hàng đã xác nhận
            ->get();

        $orderDetails = $orders->map(function ($order) {
            return [
                'id' => $order->id,
                'user_id' => $order->user_id,
                'user_name' => $order->user->name,
                'user_phone' => $order->user->phone_number,
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
                        'product' => $item->product ? [
                            'id' => $item->product->id,
                            'sku' => $item->product->sku,
                            'name' => $item->product->name,
                            'description' => $item->product->description,
                            'price' => $item->product->price,
                            'image' => $item->product->productImages->first()->image_url ?? null, // Ảnh sản phẩm
                            'variant' => $item->variant ? [
                                'sku' => $item->variant->sku,
                                'price' => $item->variant->price,
                                'thumbnail' => $item->variant->thumbnail,
                            ] : null,
                        ] : 'Sản phẩm không tồn tại', // Nếu sản phẩm bị xóa hoàn toàn, không tồn tại
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
         $order = Order::with(['items.product.productImages', 'items.variant', 'status'])
             ->where('id', $id)
             ->first();

         // Kiểm tra xem đơn hàng có tồn tại không
         if (!$order) {
             return response()->json([
                 'status' => false,
                 'message' => 'Order not found or you do not have permission to view this order.'
             ], 404);
         }

         // Lấy chi tiết đơn hàng
         $orderDetail = [
             'id' => $order->id,
             'user_id' => $order->user_id,
             'user_name' => $order->user->name,
             'phone_number' => $order->user->phone_number,
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
                 $product = Product::withTrashed()->find($item->product_id); // Lấy sản phẩm đã bị xóa mềm
                 return [
                     'id' => $item->id,
                     'order_id' => $item->order_id,
                     'product_id' => $item->product_id,
                     'quantity' => $item->quantity,
                     'price' => $item->price,
                     'total_price' => $item->quantity * $item->price,
                     'product' => [
                         'id' => $product->id,
                         'name' => $product->name,
                         'description' => $product->description,
                         'price' => $product->price,
                         'image' => $product->productImages->first()->image_url ?? null, // Ảnh sản phẩm
                         'variant' => $item->variant ? [
                             'sku' => $item->variant->sku,
                             'price' => $item->variant->price,
                             'thumbnail' => $item->variant->thumbnail,
                         ] : null,
                     ],
                 ];
             }),
         ];

         return response()->json([
             'status' => true,
             'message' => 'Success',
             'data' => $orderDetail
         ]);
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
        if ($order->status_id === 5) {
            return response()->json([
                'status' => false,
                'message' => 'Đơn hàng đã bị hủy không thể cập nhật'
            ], 400);
        } else if ($order->status_id === 4) {
            return response()->json([
                'status' => false,
                'message' => 'Đơn hàng đã hoàn tất không thể cập nhật'
            ], 400);
        }

        foreach ($order->orderItems as $orderItem) {
            $variant = ProductVariant::find($orderItem->variant_id);

            if ($variant) {
                $variant->stock += $orderItem->quantity;
                $variant->save();
            }
        }
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
