<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\ProductVariant;
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

        if ($request->quantity > $product->quantity) {
            return response()->json(['message' => 'Insufficient product quantity'], 400);
        }

        if (Auth::check()) {
            $userId = Auth::id();
            $order = Order::firstOrCreate(
                ['user_id' => $userId, 'status_id' => 1],
                ['total_amount' => 0]
            );

            $orderItem = OrderItem::updateOrCreate(
                ['order_id' => $order->id, 'product_id' => $request->product_id, 'variant_id' => $request->variant_id],
                ['quantity' => DB::raw('quantity + ' . $request->quantity), 'price' => $this->getProductPrice($request->product_id, $request->variant_id)]
            );

            $order->total_amount += $orderItem->price * $request->quantity;
            $order->save();

            return response()->json(['message' => 'Product added to cart successfully user', 'data' => $order]);
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

            return response()->json(['message' => 'Product added to cart successfully session', 'data' => $cart]);
        }
    }


    public function viewCart()
    {
        if (Auth::check()) {
            $userId = Auth::id();
            $order = Order::with(['items.product', 'items.variant'])->where('user_id', $userId)->where('status_id', 1)->first();

            if (!$order) {
                return response()->json(['message' => 'Your cart is empty'], 404);
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
            return response()->json(['message' => 'Your cart is empty ss'], 404);
        }
    }

    public function updateCart(Request $request, $itemId)
    {

        $validator = Validator::make($request->all(), [
            'quantity' => 'required|integer|min:1',
        ]);

        // Check if validation fails
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation Error',
                'errors' => $validator->errors()
            ], 422);
        }

        if (Auth::check()) {
            $userId = Auth::id();
            $order = Order::where('user_id', $userId)->where('status_id', 1)->first();

            if (!$order) {
                return response()->json(['message' => 'Your cart is empty'], 404);
            }

            $orderItem = OrderItem::where('id', $itemId)->where('order_id', $order->id)->first();

            if (!$orderItem) {
                return response()->json(['message' => 'Item not found in cart'], 404);
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
                    $item['quantity'] = $request->quantity;
                    break;
                }
            }

            session()->put('cart', $cart);

            return response()->json(['message' => 'Cart updated successfully']);
        }
    }

    public function removeFromCart($itemId)
    {
        if (Auth::check()) {
            $userId = Auth::id();
            $order = Order::where('user_id', $userId)->where('status_id', 1)->first();

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
