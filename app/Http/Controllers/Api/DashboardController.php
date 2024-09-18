<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        return response()->json([
            'status' => true,
            'data' => [
                'product' => $this->getProductStockLevels(),
                'order' => [
                    'totalRevenue' => Order::where('status_id', 4)->get()->sum('total_amount'),
                    'completedOrders' => count(Order::where('status_id', '=', 4)->get()),
                    'canceledOrders' => count(Order::where('status_id', '=', 5)->get()),
                    'pendingOrders' => count(Order::where('status_id', 1)->get()),
                    'confirmedOrders' => count(Order::where('status_id', 2)->get()),
                    'shippedOrders' => count(Order::where('status_id', 3)->get()),
                    'countOrders' => count(Order::all())
                ],
                'user' => $this->userStatistics(),
                'category' => $this->productByCategory()
            ],
        ]);
    }

    public function getProductStockLevels() // sản phẩm tồn kho
    {
        $productStock = Product::with('productVariants')->get()->sum(function ($product) {
            return $product->productVariants->sum('stock');
        });
        $countSoldProducts = Order::where('status_id', 4)->with('items')->get()->sum(function ($order) {
            return $order->items->sum('quantity');
        });
        $products = count(Product::all());
        $maxView = Product::max('view');
        $maxProductView = Product::select('id', 'name', 'price', 'view')->where('view', $maxView)->first();
        $value = [
            'productStock' => $productStock, // số lượng sản phẩm còn trong kho
            'countSoldProducts' => $countSoldProducts, // số lượng sản phẩm đã bán
            'products' => $products,
            'maxViewProduct' => $maxProductView
        ];
        return $value;
    }

    protected function userStatistics()
    {
        $value = [
            'countUser' => count(User::where('role', 'user')->get()),
            'countAdmin' => count(User::where('role', 'admin')->get()),
            'sumUser' => count(User::all()),
            'userActive' => count(User::where('status', 'active')->get())
        ];
        return $value;
    }

    protected function productByCategory()
    {
        $countCategory = count(Category::where('parent_id', 1)->get());
        $categories = Category::select('id', 'name')->where('parent_id', 1)->get();
        foreach ($categories as $category) {
            $ids = $category->allChildrenIds();
            $ids[] = $category->id;
            $category->countProduct = count(Product::whereIn('category_id', $ids)->get());
            unset($category->children);
            $category->maxProduct = Product::whereIn('category_id', $ids)->get()->max('price');
        }
        return [
            'countCategory' => $countCategory,
            'categories' => $categories
        ];
    }
}
