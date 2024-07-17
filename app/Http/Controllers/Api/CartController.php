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

class CartController extends Controller
{
    public function addToCart(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'variant_id' => 'nullable|exists:product_variants,id',
            'quantity' => 'required|integer|min:1',
        ]);

        if (Auth::check()) {
            // Người dùng đã đăng nhập
            $userId = Auth::id();
            $order = Order::firstOrCreate(
                ['user_id' => $userId, 'status_id' => 1], // 1: status_id for 'pending'
                ['total_amount' => 0]
            );

            $orderItem = OrderItem::updateOrCreate(
                ['order_id' => $order->id, 'product_id' => $request->product_id, 'variant_id' => $request->variant_id],
                ['quantity' => DB::raw('quantity + ' . $request->quantity), 'price' => $this->getProductPrice($request->product_id, $request->variant_id)]
            );

            $order->total_amount += $orderItem->price * $request->quantity;
            $order->save();
        } else {
            // Người dùng chưa đăng nhập
            $cart = session()->get('cart', []);

            $product = Product::find($request->product_id);
            $variant = ProductVariant::find($request->variant_id);

            $price = $variant ? $variant->price : $product->price;

            $cartItem = [
                'product_id' => $request->product_id,
                'variant_id' => $request->variant_id,
                'quantity' => $request->quantity,
                'price' => $price,
                'product' => $product,
                'variant' => $variant,
            ];

            $cart[] = $cartItem;
            session()->put('cart', $cart);
        }

        return response()->json(
            [
                'message' => 'Product added to cart successfully',
                'data' => $cart
            ],

        );
    }

    public function viewCart()
    {
        if (Auth::check()) {
            $userId = Auth::id();
            $order = Order::with('items.product', 'items.variant')->where('user_id', $userId)->where('status_id', 1)->first();

            if (!$order) {
                return response()->json(['message' => 'Your cart is empty'], 404);
            }

            return response()->json($order);
        } else {
            $cart = session()->get('cart', []);
            if (empty($cart)) {
                return response()->json(['message' => 'Your cart is empty'], 404);
            }

            return response()->json($cart);
        }
    }

    public function removeFromCart($itemId)
    {
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
    }

    public function updateCart(Request $request, $itemId)
    {
        $request->validate([
            'quantity' => 'required|integer|min:1',
        ]);

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
