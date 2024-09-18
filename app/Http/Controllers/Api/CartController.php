<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Coupon;
use App\Models\GuestOrder;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\ProductVariant;
use App\Services\VNPayService;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class CartController extends Controller
{
    public function addToCart(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'variant_id' => 'nullable|exists:product_variants,id',
            'quantity' => 'required|integer|min:1',
        ]);

        $product = Product::find($request->product_id);
        $variant = ProductVariant::find($request->variant_id);

        if (!$product || ($request->variant_id && !$variant)) {
            return response()->json(['message' => 'Product or variant not found'], 404);
        }

        if ($request->quantity > ($variant ? $variant->stock : $product->quantity)) {
            return response()->json(['message' => 'Insufficient product quantity'], 400);
        }

        if (Auth::check()) {
            $userId = Auth::id();
            $order = Order::firstOrCreate(
                ['user_id' => $userId, 'status_id' => 6],
                ['total_amount' => 0]
            );

            $orderItem = OrderItem::updateOrCreate(
                ['order_id' => $order->id, 'product_id' => $request->product_id, 'variant_id' => $request->variant_id],
                ['quantity' => DB::raw('quantity + ' . $request->quantity), 'price' => $this->getProductPrice($request->product_id, $request->variant_id)]
            );

            $order->total_amount += $orderItem->price * $request->quantity;
            $order->save();

            return response()->json(['message' => 'Product added to cart successfully', 'data' => $order]);
        } else {
            $cart = session()->get('cart', []);

            $cartExists = false;
            foreach ($cart as &$item) {
                if ($item['product_id'] == $request->product_id && $item['variant_id'] == $request->variant_id) {
                    $item['quantity'] += $request->quantity;
                    $cartExists = true;
                    break;
                }
            }

            if (!$cartExists) {
                $cartItem = [
                    'product_id' => $request->product_id,
                    'variant_id' => $request->variant_id,
                    'quantity' => $request->quantity,
                    'price' => $variant ? $variant->price : $product->price,
                    'product' => $product,
                    'variant' => $variant,
                ];
                $cart[] = $cartItem;
            }

            session()->put('cart', $cart);

            return response()->json(['message' => 'Product added to cart successfully', 'data' => $cart]);
        }
    }

    public function viewCart()
    {
        if (Auth::check()) {
            $userId = Auth::id();
            $order = Order::with(['items.product', 'items.variant'])->where('user_id', $userId)->where('status_id', 6)->first();

            if (!$order) {
                return response()->json(['message' => 'Your cart is empty'], 200);
            }

            $cartDetails = [
                'id' => $order->id,
                'user_id' => $order->user_id,
                'total_amount' => $order->total_amount,
                'status_id' => $order->status_id,
                'items' => $order->items->map(function ($item) {
                    return [
                        'id' => $item->id,
                        'order_id' => $item->order_id,
                        'product_id' => $item->product_id,
                        'variant_id' => $item->variant_id,
                        'quantity' => $item->quantity,
                        'price' => $item->price,
                        'total_price' => $item->quantity * $item->price, // Tổng giá trị của mục giỏ hàng
                        'product' => [
                            'id' => $item->product->id,
                            'name' => $item->product->name,
                            'description' => $item->product->description,
                            'price' => $item->product->price,
                            'price_old' => $item->product->price_old,
                            'quantity' => $item->product->quantity,
                            'view' => $item->product->view,
                            'category_id' => $item->product->category_id,
                            'brand_id' => $item->product->brand_id,
                            'promotion' => $item->product->promotion,
                            'status' => $item->product->status,
                            'created_at' => $item->product->created_at,
                            'updated_at' => $item->product->updated_at,
                            'image' => $item->product->productImages->first()->image_url ?? null, // Ảnh sản phẩm
                        ],
                        'variant' => $item->variant ? [
                            'id' => $item->variant->id,
                            'product_id' => $item->variant->product_id,
                            'sku' => $item->variant->sku,
                            'stock' => $item->variant->stock,
                            'price' => $item->variant->price,
                            'thumbnail' => $item->variant->thumbnail,
                            'created_at' => $item->variant->created_at,
                            'updated_at' => $item->variant->updated_at,
                        ] : null,
                    ];
                }),
            ];

            return response()->json($cartDetails);
        } else {
            $cart = session()->get('cart', []);

            if (empty($cart)) {
                return response()->json(['message' => 'Your cart session is empty'], 404);
            }

            return response()->json(['message' => 'Success', 'data' => $cart]);
        }
    }

    public function viewOrder()
    {
        if (Auth::check()) {
            $userId = Auth::id();
            $orders = Order::with(['items.product', 'items.variant', 'status']) // Include status relationship
                ->where('user_id', $userId)
                ->where('status_id', '!=', 6) // Lấy các đơn hàng có trạng thái khác 6
                ->get();

            if ($orders->isEmpty()) {
                return response()->json(['message' => 'You have no orders with status other than 1'], 200);
            }

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
                    'status' => $order->status->name, // Get the status name
                    'created_at' => $order->created_at,
                    'updated_at' => $order->updated_at,
                    'items' => $order->items->map(function ($item) {
                        return [
                            'product_name' => $item->product->name,
                            'quantity' => $item->quantity,
                            'price' => $item->price,
                            'total_price' => $item->quantity * $item->price,
                            'image' => $item->product->productImages->first()->image_url ?? null,
                            'variant' => $item->variant ? [
                                'sku' => $item->variant->sku,
                                'price' => $item->variant->price,
                                'thumbnail' => $item->variant->thumbnail,
                            ] : null,
                        ];
                    }),
                ];
            });

            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $orderDetails
            ]);
        } else {
            return response()->json(['message' => 'User not authenticated'], 401);
        }
    }

    public function detail($orderId)
    {
        // Lấy user hiện tại
        $userId = Auth::id();

        // Tìm đơn hàng dựa trên orderId và userId để đảm bảo người dùng chỉ có thể xem chi tiết đơn hàng của chính mình
        $order = Order::with(['items.product.productImages', 'items.variant', 'status'])
            ->where('id', $orderId)
            ->where('user_id', $userId)
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



    public function updateCart(Request $request, $itemId)
    {
        $validator = Validator::make($request->all(), [
            'quantity' => 'required|integer|min:1',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation Error',
                'errors' => $validator->errors()
            ], 422);
        }

        if (Auth::check()) {
            $userId = Auth::id();
            $order = Order::where('user_id', $userId)->where('status_id', 6)->first();

            if (!$order) {
                return response()->json(['message' => 'Your cart is empty'], 404);
            }

            $orderItem = OrderItem::where('id', $itemId)->where('order_id', $order->id)->first();

            if (!$orderItem) {
                return response()->json(['message' => 'Item not found in cart'], 404);
            }

            $product = Product::find($orderItem->product_id);
            $variant = $orderItem->variant_id ? ProductVariant::find($orderItem->variant_id) : null;

            if ($request->quantity > ($variant ? $variant->stock : $product->quantity)) {
                return response()->json(['message' => 'Insufficient product quantity'], 400);
            }

            $order->total_amount -= $orderItem->price * $orderItem->quantity;
            $orderItem->quantity = $request->quantity;
            $orderItem->save();

            $order->total_amount += $orderItem->price * $orderItem->quantity;
            $order->save();

            return response()->json(['message' => 'Cart updated successfully']);
        } else {
            $cart = session()->get('cart', []);

            foreach ($cart as &$item) {
                if ($item['product_id'] == $itemId) {
                    $product = Product::find($item['product_id']);
                    $variant = $item['variant_id'] ? ProductVariant::find($item['variant_id']) : null;

                    if ($request->quantity > ($variant ? $variant->stock : $product->quantity)) {
                        return response()->json(['message' => 'Insufficient product quantity'], 400);
                    }

                    $item['quantity'] = $request->quantity;
                    break;
                }
            }

            session()->put('cart', $cart);

            return response()->json(['message' => 'Cart updated successfully']);
        }
    }

    public function cancelOrder(Request $request, $orderId)
    {
        // Lấy user hiện tại
        $userId = Auth::id();

        // Tìm đơn hàng dựa trên orderId và userId để đảm bảo người dùng chỉ có thể hủy đơn hàng của chính mình
        $order = Order::where('id', $orderId)
            ->where('user_id', $userId)
            ->first();

        // Kiểm tra xem đơn hàng có tồn tại không
        if (!$order) {
            return response()->json([
                'status' => false,
                'message' => 'Order not found or you do not have permission to cancel this order.'
            ], 404);
        }

        // Kiểm tra xem trạng thái hiện tại của đơn hàng có cho phép hủy không
        if ($order->status_id != 1) { // Chỉ cho phép hủy nếu trạng thái đơn hàng là 'Pending'
            return response()->json([
                'status' => false,
                'message' => 'Đơn hàng đã xác nhận không thể hủy'
            ], 400);
        }

        // Lặp qua các sản phẩm trong đơn hàng và hoàn lại số lượng vào kho
        foreach ($order->orderItems as $orderItem) {
            $variant = ProductVariant::find($orderItem->variant_id);

            if ($variant) {
                // Tăng số lượng tồn kho của biến thể sản phẩm
                $variant->stock += $orderItem->quantity;
                $variant->save();
            }
        }

        // Cập nhật trạng thái đơn hàng thành 'Cancelled'
        $order->status_id = 5; // 5 tương ứng với 'Cancelled'
        $order->save();

        return response()->json([
            'status' => true,
            'message' => 'Order has been successfully cancelled and stock has been restored.'
        ]);
    }


    public function removeFromCart($itemId)
    {
        if (Auth::check()) {
            $userId = Auth::id();
            $order = Order::where('user_id', $userId)->where('status_id', 6)->first();

            if (!$order) {
                return response()->json(['message' => 'Your cart is empty'], 404);
            }

            $orderItem = OrderItem::where('id', $itemId)->where('order_id', $order->id)->first();

            if (!$orderItem) {
                return response()->json(['message' => 'Item not found in cart'], 404);
            }

            $order->total_amount -= $orderItem->price * $orderItem->quantity;
            $orderItem->delete();
            $order->save();

            return response()->json(['message' => 'Product removed from cart successfully']);
        } else {
            $cart = session()->get('cart', []);
            $newCart = [];

            foreach ($cart as $item) {
                if ($item['product_id'] != $itemId) {
                    $newCart[] = $item;
                }
            }

            session()->put('cart', $newCart);

            return response()->json(['message' => 'Product removed from cart successfully']);
        }
    }

    public function clearCart()
    {
        if (Auth::check()) {
            $userId = Auth::id();
            $order = Order::with(['items'])->where('user_id', $userId)->where('status_id', 6)->first();

            if (!$order) {
                return response()->json(['message' => 'Your cart is already empty'], 404);
            }

            foreach ($order->items as $item) {
                $item->delete();
            }

            $order->total_amount = 0;
            $order->save();

            return response()->json(['message' => 'Cart cleared successfully']);
        } else {
            session()->forget('cart');
            return response()->json(['message' => 'Cart cleared successfully']);
        }
    }

    // Check sản phẩm trong giỏ hàng
    public function checkingCart()
    {
        // Lấy ID của user hiện tại (giả sử user đã đăng nhập)
        $userId = auth()->id();

        // Lấy đơn hàng của người dùng đang ở trạng thái 'pending' hoặc 'processing'
        $order = Order::with('orderItems.productVariant.product') // Thêm mối quan hệ với bảng product
            ->where('user_id', $userId)
            ->where('status_id', 6) // chỉ lấy đơn hàng trong giỏ (status_id = 6)
            ->first();

        if (!$order) {
            return response()->json([
                'status' => false,
                'message' => 'Order not found',
            ], 404);
        }

        // Danh sách các sản phẩm không khả dụng
        $unavailableItems = [];

        // Kiểm tra từng item trong đơn hàng
        foreach ($order->orderItems as $item) {
            $productVariant = $item->productVariant;

            // Kiểm tra trạng thái is_available và quantity
            if (!$productVariant || $productVariant->is_available == false || $productVariant->stock < $item->quantity) {
                $unavailableItems[] = [
                    'product_name' => $productVariant->product->name, // Lấy tên sản phẩm từ bảng product
                    'sku' => $productVariant->sku, // SKU của biến thể
                    'stock' => $productVariant->stock, // Số lượng tồn kho
                    'ordered_quantity' => $item->quantity // Số lượng mà khách hàng đã đặt
                ];
            }
        }

        // Nếu có sản phẩm không khả dụng
        if (!empty($unavailableItems)) {
            return response()->json([
                'status' => false,
                'message' => 'Some items in the order are unavailable',
                'unavailable_items' => $unavailableItems
            ], 422);
        }

        // Nếu tất cả sản phẩm đều khả dụng
        return response()->json([
            'status' => true,
            'message' => 'All items are available'
        ], 200);
    }



    public function checkout(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'shipping_method' => 'required|string|max:255',
            'payment' => 'required|string|max:255',
            'paymentMethod' => 'max:255',
            'address_detail' => 'required|string|max:255',
            'ward' => 'required|string|max:255',
            'district' => 'required|string|max:255',
            'city' => 'required|string|max:255',
            'name' => 'required|string|max:255',
            'email' => 'nullable|string|email|max:255',
            'phone_number' => 'required|string|max:20',
            'coupon_code' => 'nullable|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation Error',
                'errors' => $validator->errors()
            ], 422);
        }

        // Lấy thông tin giỏ hàng
        $cart = Auth::check() ? Order::where('user_id', Auth::id())->where('status_id', 6)->first() : session()->get('cart', []);

        if (empty($cart)) {
            return response()->json(['message' => 'Your cart is empty'], 404);
        }

        // Tính toán tổng số tiền
        $totalAmount = 0;
        if (Auth::check()) {
            foreach ($cart->items as $cartItem) {
                $totalAmount += $cartItem->price * $cartItem->quantity;
            }
        } else {
            foreach ($cart as $cartItem) {
                $totalAmount += $cartItem['price'] * $cartItem['quantity'];
            }
        }

        // Kiểm tra và áp dụng phí ship
        $shippingFee = 0;
        if ($totalAmount < 1000000) {
            $shippingFee = 20000; // Cộng 20k phí ship nếu đơn hàng dưới 1 triệu
        }

        // Cộng phí ship vào tổng giá trị đơn hàng
        $totalAmount += $shippingFee;

        // Kiểm tra mã khuyến mãi
        $discountAmount = 0;
        if ($request->filled('coupon_code')) {
            $coupon = Coupon::where('code', $request->coupon_code)
                ->where('status', 'Active')
                ->where('expiration_date', '>=', now())
                ->first();

            if ($coupon) {
                // Áp dụng giảm giá
                $discountAmount = $coupon->discount;

                // Cập nhật lại tổng số tiền sau khi giảm giá
                $totalAmount = $totalAmount * (1 - ($discountAmount / 100));
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Phiếu giảm giá không hợp lệ hoặc đã hết hạn',
                ], 400);
            }
        }



        $payment = $request->payment;

        // Tạo hoặc cập nhật đơn hàng
        $order = Order::updateOrCreate(
            [
                'id' => $cart->id ?? null
            ],
            [
                'user_id' => Auth::check() ? Auth::id() : null,
                'total_amount' => $totalAmount,
                'discount' => $discountAmount, // Lưu giá trị giảm giá
                // 'shipping_fee' => $shippingFee, // Lưu phí ship
                'status_id' => $payment !== 'COD' ? 6 : 1, // Nếu thanh toán online thì trạng thái là "chờ thanh toán", nếu COD là "đã xác nhận"
                'shipping_method' => $request->shipping_method,
                'payment' => $request->payment,
                'address_detail' => $request->address_detail,
                'ward' => $request->ward,
                'district' => $request->district,
                'city' => $request->city,
                'coupon_code' => $coupon->code ?? null, // Lưu mã khuyến mãi vào đơn hàng nếu có
            ]
        );

        // Thêm các sản phẩm vào đơn hàng nếu người dùng chưa đăng nhập
        if (!Auth::check()) {
            foreach ($cart as $cartItem) {
                OrderItem::updateOrCreate(
                    [
                        'order_id' => $order->id,
                        'product_id' => $cartItem['product_id'],
                        'variant_id' => $cartItem['variant_id'],
                    ],
                    [
                        'quantity' => $cartItem['quantity'],
                        'price' => $cartItem['price'],
                    ]
                );
            }

            // Lưu thông tin khách hàng nếu là khách hàng chưa đăng nhập
            GuestOrder::updateOrCreate(
                [
                    'order_id' => $order->id,
                ],
                [
                    'name' => $request->name,
                    'email' => $request->email,
                    'phone_number' => $request->phone_number,
                    'address_detail' => $request->address_detail,
                    'ward' => $request->ward,
                    'district' => $request->district,
                    'city' => $request->city,
                ]
            );
        }

        // Nếu thanh toán là online, redirect tới VNPay
        if ($payment === 'COD') {
            foreach ($order->items as $orderItem) {
                $variant = ProductVariant::find($orderItem->variant_id);
                if ($variant) {
                    $variant->stock -= $orderItem->quantity;
                    $variant->save();
                }
            }
        } elseif ($payment !== 'COD') {
            $vnpayService = new VNPayService();
            if ($payment === 'online_qr') {
                $paymentMethod = "VnMart";
            } elseif ($payment === 'online_card') {
                $paymentMethod = "VNBANK";
            } elseif ($payment === 'online_visa') {
                $paymentMethod = "INTCARD";
            } else {
                $paymentMethod = "";
            }
            $vnpUrl = $vnpayService->createPaymentUrl($order, $paymentMethod);
            return $vnpUrl;
        }

        // Nếu thanh toán là COD, xóa session cart
        session()->forget('cart');

        return response()->json([
            'message' => 'Order has been placed successfully',
            'order' => $order
        ]);
    }



    private function getProductPrice($productId, $variantId = null)
    {
        if ($variantId) {
            $variant = ProductVariant::find($variantId);
            return $variant ? $variant->price : 0;
        }

        $product = Product::find($productId);
        return $product ? $product->price : 0;
    }
}
